# -*- coding:utf-8 -*-
"""
BluePearl – Business logic for BPHT / eLab Machine Connect integration.

This module handles:
  - Extraction of pending analysis orders for BPHT polling (GET /orders)
  - Acknowledgment tracking (POST /orders/ack)
  - Result injection from automate (POST /results) with strict idempotence
  - Standard nomenclature export (Section 1.3 of technical specification)
  - Mapping management (backward compatible)
"""

import logging
import mysql.connector
from datetime import datetime

from app.models.Constants import Constants
from app.models.DB import DB
from app.models.Logs import Logs
from app.models.Various import Various


class BluePearl:
    log = logging.getLogger('log_db')

    # ------------------------------------------------------------------
    #  MAPPING helpers (Backward compatibility)
    # ------------------------------------------------------------------

    @staticmethod
    def getMapping(bpm_test_id, bpm_param_id, bpm_machinename=''):
        """
        Look up the LabBook analysis/variable that maps to the given
        BPHT testId + ParameterId (+ optional machinename).
        Returns a dict or None.
        """
        cursor = DB.cursor()

        if bpm_machinename:
            req = ('SELECT * FROM bluepearl_map '
                   'WHERE bpm_test_id=%s AND bpm_param_id=%s '
                   'AND bpm_machinename=%s AND bpm_active="Y" LIMIT 1')
            cursor.execute(req, (bpm_test_id, bpm_param_id, bpm_machinename))
        else:
            req = ('SELECT * FROM bluepearl_map '
                   'WHERE bpm_test_id=%s AND bpm_param_id=%s '
                   'AND bpm_active="Y" LIMIT 1')
            cursor.execute(req, (bpm_test_id, bpm_param_id))

        return cursor.fetchone()

    @staticmethod
    def getMappingById(bpm_ser):
        """Return a single mapping by its PK bpm_ser with joined analysis & variable names."""
        cursor = DB.cursor()

        req = ('SELECT bpm.*, ana.nom AS ana_name, var.libelle AS var_name '
               'FROM bluepearl_map bpm '
               'LEFT JOIN sigl_05_data ana ON ana.id_data = bpm.bpm_ana_id '
               'LEFT JOIN sigl_07_data var ON var.id_data = bpm.bpm_var_id '
               'WHERE bpm.bpm_ser = %s LIMIT 1')

        cursor.execute(req, (bpm_ser,))

        return cursor.fetchone()

    @staticmethod
    def getMappingList():
        """Return all active mappings."""
        cursor = DB.cursor()

        req = ('SELECT bpm.*, ana.nom AS ana_name, var.libelle AS var_name '
               'FROM bluepearl_map bpm '
               'LEFT JOIN sigl_05_data ana ON ana.id_data = bpm.bpm_ana_id '
               'LEFT JOIN sigl_07_data var ON var.id_data = bpm.bpm_var_id '
               'WHERE bpm.bpm_active = "Y" '
               'ORDER BY bpm.bpm_machinename, bpm.bpm_test_id, bpm.bpm_param_id')

        cursor.execute(req)

        return cursor.fetchall()

    @staticmethod
    def insertMapping(**params):
        """Insert a new BPHT ↔ LabBook mapping row."""
        try:
            cursor = DB.cursor()

            if 'active' not in params and 'bpm_active' not in params:
                params['active'] = 'Y'
            elif 'bpm_active' in params:
                params['active'] = params['bpm_active']

            cursor.execute(
                'INSERT INTO bluepearl_map '
                '(bpm_machinename, bpm_test_id, bpm_test_name, bpm_param_id, bpm_param_name, '
                ' bpm_ana_id, bpm_var_id, bpm_ana_code, bpm_var_code, bpm_active) '
                'VALUES (%(machinename)s, %(test_id)s, %(test_name)s, %(param_id)s, %(param_name)s, '
                '%(ana_id)s, %(var_id)s, %(ana_code)s, %(var_code)s, %(active)s)',
                params)

            BluePearl.log.info(Logs.fileline() + ' : insertMapping OK')

            return cursor.lastrowid
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR insertMapping SQL = ' + str(e))
            return 0

    @staticmethod
    def updateMapping(bpm_ser, **params):
        """Update an existing mapping row."""
        try:
            cursor = DB.cursor()

            params['bpm_ser'] = bpm_ser
            if 'active' not in params and 'bpm_active' not in params:
                params['active'] = 'Y'
            elif 'bpm_active' in params:
                params['active'] = params['bpm_active']

            cursor.execute(
                'UPDATE bluepearl_map SET '
                'bpm_machinename=%(machinename)s, bpm_test_id=%(test_id)s, bpm_test_name=%(test_name)s, '
                'bpm_param_id=%(param_id)s, bpm_param_name=%(param_name)s, '
                'bpm_ana_id=%(ana_id)s, bpm_var_id=%(var_id)s, '
                'bpm_ana_code=%(ana_code)s, bpm_var_code=%(var_code)s, '
                'bpm_active=%(active)s '
                'WHERE bpm_ser=%(bpm_ser)s',
                params)

            BluePearl.log.info(Logs.fileline() + ' : updateMapping OK bpm_ser=' + str(bpm_ser))

            return True
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR updateMapping SQL = ' + str(e))
            return False

    @staticmethod
    def deleteMapping(bpm_ser):
        """Delete a mapping row."""
        try:
            cursor = DB.cursor()

            cursor.execute(
                'DELETE FROM bluepearl_map WHERE bpm_ser=%s',
                (bpm_ser,))

            BluePearl.log.info(Logs.fileline() + ' : deleteMapping OK bpm_ser=' + str(bpm_ser))

            return True
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR deleteMapping SQL = ' + str(e))
            return False

    # ------------------------------------------------------------------
    #  ORDERS – Pending orders for BPHT to pull (GET /orders)
    # ------------------------------------------------------------------

    @staticmethod
    def getPendingOrdersForBPHT():
        """
        Retrieve all sample orders that:
          - belong to records with statut 182 (tech-validated) or 253 (awaiting results)
          - have not yet been acknowledged by BPHT (no entry in bluepearl_ack with bpa_sent=1)
          - have a valid sample code (barcode)

        The result is a flat list: one row per variable of each requested analysis,
        matching BPHT's expected '_lstMInterPatientDetails' structure.
        """
        cursor = DB.cursor()

        req = ("""
            SELECT
                pat.id_data     AS patientId,
                CONCAT(IFNULL(pat.nom, ''), ' ', IFNULL(pat.prenom, '')) AS patientname,
                pat.ddn         AS dob,
                CASE pat.sexe
                    WHEN 1 THEN 'M'
                    WHEN 2 THEN 'F'
                    ELSE 'U'
                END             AS gender,
                ana.id_data     AS ana_id,
                ana.code        AS ana_code,
                ana.nom         AS ana_name,
                var.id_data     AS var_id,
                var.code_var    AS var_code,
                var.libelle     AS var_name,
                samp.code       AS barcode,
                samp.id_data    AS id_samp,
                d1.label        AS sampletype,
                samp.samp_date  AS samplecollectiontime,
                rec.id_data     AS id_rec,
                rec.num_dos_an  AS num_record
            FROM sigl_04_data AS req
            INNER JOIN sigl_02_data AS rec ON rec.id_data = req.id_dos
            INNER JOIN sigl_03_data AS pat ON pat.id_data = rec.id_patient
            INNER JOIN sigl_05_data AS ana ON ana.id_data = req.ref_analyse
            INNER JOIN sigl_01_data AS samp ON samp.id_dos = req.id_dos AND samp.samp_id_ana = req.ref_analyse
            INNER JOIN sigl_05_07_data AS link ON link.id_refanalyse = ana.id_data
            INNER JOIN sigl_07_data AS var ON var.id_data = link.id_refvariable
            LEFT JOIN sigl_dico_data AS d1 ON d1.id_data = samp.type_prel
            LEFT JOIN bluepearl_ack AS ack ON ack.bpa_barcode COLLATE utf8_general_ci = samp.code COLLATE utf8_general_ci
            WHERE rec.statut IN (182, 253)
              AND samp.code IS NOT NULL AND samp.code != ''
              AND ana.actif = 4
              AND (ack.bpa_ser IS NULL OR ack.bpa_sent = 0)
            ORDER BY samp.samp_date DESC, ana.id_data ASC, link.position ASC
        """)

        cursor.execute(req)

        return cursor.fetchall()

    @staticmethod
    def formatOrdersForBPHT(rows):
        """
        Transform flat DB rows into the JSON structure expected by BPHT:
        {
          "accessToken": null,
          "statusCode": "0",
          "statusMessage": "Success",
          "version": "1.0.03",
          "data": {
            "_lstMInterPatientDetails": [ ... ]
          }
        }

        Direct LabBook IDs (as per technical clarification doc section 1.1 & 2.1):
        - testId: ana_id (ID analyse LabBook)
        - testname: ana_name (Nom analyse LabBook)
        - ParameterId: var_id (ID variable LabBook)
        - Parametername: var_name (Nom variable LabBook)
        """
        details = []

        for row in rows:
            test_id = row['ana_id']
            test_name = row['ana_name']
            param_id = row['var_id']
            param_name = row['var_name']

            dob_str = ''
            if row['dob']:
                dob_str = row['dob'].strftime('%Y-%m-%dT%H:%M:%S') if isinstance(row['dob'], datetime) else str(row['dob'])

            samp_time_str = ''
            if row['samplecollectiontime']:
                samp_time_str = (row['samplecollectiontime'].strftime('%Y-%m-%dT%H:%M:%S')
                                 if isinstance(row['samplecollectiontime'], datetime)
                                 else str(row['samplecollectiontime']))

            detail = {
                "patientId": row['patientId'],
                "patientname": (row['patientname'] or '').strip(),
                "dob": dob_str,
                "gender": row['gender'],
                "testId": test_id,
                "testname": test_name,
                "ParameterId": param_id,
                "Parametername": param_name,
                "barcode": row['barcode'],
                "sampletype": row['sampletype'] or '',
                "samplecollectiontime": samp_time_str,
            }

            details.append(detail)

            # Mark this barcode as sent (first time) in bluepearl_ack
            BluePearl._markAsSent(row['barcode'], row['id_samp'])

        return {
            "accessToken": None,
            "statusCode": "0",
            "statusMessage": "Success",
            "version": "1.0.03",
            "data": {
                "_lstMInterPatientDetails": details
            }
        }

    @staticmethod
    def _markAsSent(barcode, id_samp):
        """
        Insert or update bluepearl_ack to record that an order has been
        included in a GET response to BPHT. Only marks sent_date, not ack_date.
        """
        try:
            cursor = DB.cursor()

            cursor.execute(
                'INSERT INTO bluepearl_ack (bpa_barcode, bpa_id_samp, bpa_sent, bpa_sent_date) '
                'VALUES (%s, %s, 0, NOW()) '
                'ON DUPLICATE KEY UPDATE bpa_sent_date = IFNULL(bpa_sent_date, NOW())',
                (barcode, id_samp))

            return True
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR _markAsSent SQL = ' + str(e))
            return False

    # ------------------------------------------------------------------
    #  ACKNOWLEDGMENT – BPHT confirms it received the orders (POST /orders/ack)
    # ------------------------------------------------------------------

    @staticmethod
    def acknowledgeOrders(barcodes_list):
        """
        Mark orders as acknowledged by BPHT (bpa_sent = 1).
        barcodes_list: list of barcode strings from BPHT payload.
        Returns dict with 'acknowledged' and 'not_found' lists.
        """
        acknowledged = []
        not_found = []

        for barcode in barcodes_list:
            try:
                cursor = DB.cursor()

                cursor.execute(
                    'UPDATE bluepearl_ack SET bpa_sent = 1, bpa_ack_date = NOW() '
                    'WHERE bpa_barcode = %s AND bpa_sent = 0',
                    (barcode,))

                if cursor.rowcount > 0:
                    acknowledged.append(barcode)
                else:
                    # Either already acknowledged or unknown barcode
                    cursor2 = DB.cursor()
                    cursor2.execute('SELECT bpa_ser FROM bluepearl_ack WHERE bpa_barcode = %s', (barcode,))
                    existing = cursor2.fetchone()

                    if existing:
                        # Already acknowledged
                        acknowledged.append(barcode)
                    else:
                        not_found.append(barcode)

            except mysql.connector.Error as e:
                BluePearl.log.error(Logs.fileline() + ' : ERROR acknowledgeOrders SQL = ' + str(e))
                not_found.append(barcode)

        return {'acknowledged': acknowledged, 'not_found': not_found}

    # ------------------------------------------------------------------
    #  RESULTS – BPHT pushes automate results (POST /results)
    # ------------------------------------------------------------------

    @staticmethod
    def insertBPHTResults(results_list):
        """
        Process the results sent by BPHT and store them in LabBook.
        Correctly iterates over ALL analysis variables and updates each corresponding
        row in sigl_09_data.

        Returns dict with 'stored', 'errors', 'warnings' lists.
        """
        stored = []
        errors = []
        warnings = []
        updated_records = set()

        for result in results_list:
            barcode = result.get('barcode', '')
            test_id = result.get('testId')
            param_id = result.get('ParameterId')
            value = result.get('Result', '')
            machinename = result.get('machinename', '')
            patient_id = result.get('patientId')

            if not barcode:
                errors.append({'barcode': barcode, 'error': 'Missing barcode'})
                continue

            if test_id is None or param_id is None:
                errors.append({'barcode': barcode, 'error': 'Missing testId or ParameterId'})
                continue

            # Step 1: Resolve barcode → sample
            sample = BluePearl._findSampleByBarcode(barcode)
            if not sample:
                errors.append({'barcode': barcode, 'error': 'Sample not found for barcode'})
                continue

            id_samp = sample['id_data']
            id_rec = sample['id_dos']
            ref_analyse_sample = sample['samp_id_ana']

            # Step 2: Find the EXACT sigl_09_data row for this record + analysis + variable
            result_row = BluePearl._findResultRowForParam(id_rec, ref_analyse_sample, test_id, param_id)

            if not result_row:
                errors.append({
                    'barcode': barcode,
                    'testId': test_id,
                    'ParameterId': param_id,
                    'error': f'No result row found in LabBook for analysis {test_id} / parameter {param_id}'
                })
                continue

            id_res = result_row['id_res']
            current_value = result_row.get('current_valeur', '')
            ana_code = result_row.get('ana_code', '')
            var_code = result_row.get('var_code', '')
            var_name = result_row.get('var_name', '')

            # Step 3: Idempotent update
            # If already set with identical value (retry loop from Blue Pearl), confirm success
            if current_value is not None and str(current_value).strip() == str(value).strip():
                stored.append({
                    'barcode': barcode,
                    'testId': test_id,
                    'ParameterId': param_id,
                    'id_res': id_res,
                    'var_name': var_name,
                    'value': value,
                    'status': 'already_recorded'
                })
                continue

            ok = BluePearl._updateResultValue(id_res, value)

            if ok:
                updated_records.add(id_rec)
                stored.append({
                    'barcode': barcode,
                    'testId': test_id,
                    'ParameterId': param_id,
                    'id_res': id_res,
                    'var_name': var_name,
                    'value': value
                })

                # Store trace in analyzer_result for audit
                BluePearl._insertAnalyzerResult(
                    machinename=machinename,
                    barcode=barcode,
                    ana_code=ana_code,
                    var_code=var_code,
                    id_samp=id_samp,
                    value=value
                )
            else:
                errors.append({
                    'barcode': barcode,
                    'testId': test_id,
                    'ParameterId': param_id,
                    'id_res': id_res,
                    'error': 'Failed to update result value'
                })

        # Touch rec_modified on all updated records
        for rec_id in updated_records:
            try:
                cursor = DB.cursor()
                cursor.execute('UPDATE sigl_02_data SET rec_modified = NOW() WHERE id_data = %s', (rec_id,))
            except Exception as e:
                BluePearl.log.error(Logs.fileline() + f' : ERROR updating rec_modified: {e}')

        return {'stored': stored, 'errors': errors, 'warnings': warnings}

    @staticmethod
    def _findSampleByBarcode(barcode):
        """Find a sample by its barcode (sigl_01_data.code)."""
        cursor = DB.cursor()

        req = ('SELECT samp.id_data, samp.id_dos, samp.samp_id_ana, samp.code '
               'FROM sigl_01_data AS samp '
               'WHERE samp.code = %s LIMIT 1')

        cursor.execute(req, (barcode,))

        return cursor.fetchone()

    @staticmethod
    def _findResultRowForParam(id_rec, ref_analyse_sample, test_id, param_id):
        """
        Find the exact sigl_09_data row for a given record and parameter.
        Ensures each variable of a multi-variable analysis (e.g. NFS/CBC, Ionogramme)
        is matched to its own unique row in sigl_09_data without collisions.
        """
        cursor = DB.cursor()

        # Parse test_id
        test_id_int = None
        test_id_str = None
        if isinstance(test_id, int):
            test_id_int = test_id
            test_id_str = str(test_id)
        elif isinstance(test_id, str) and test_id:
            test_id_str = test_id
            if test_id.isdigit():
                test_id_int = int(test_id)

        # Parse param_id
        param_id_int = None
        param_id_str = None
        if isinstance(param_id, int):
            param_id_int = param_id
            param_id_str = str(param_id)
        elif isinstance(param_id, str) and param_id:
            param_id_str = param_id
            if param_id.isdigit():
                param_id_int = int(param_id)

        # 1. Primary precise search matching record + analysis + specific variable
        req = ("""
            SELECT
                res.id_data       AS id_res,
                res.valeur        AS current_valeur,
                res.ref_variable  AS var_id,
                req.ref_analyse   AS ana_id,
                ana.code          AS ana_code,
                var.code_var      AS var_code,
                var.libelle       AS var_name
            FROM sigl_09_data AS res
            INNER JOIN sigl_04_data AS req ON req.id_data = res.id_analyse
            INNER JOIN sigl_05_data AS ana ON ana.id_data = req.ref_analyse
            INNER JOIN sigl_07_data AS var ON var.id_data = res.ref_variable
            LEFT JOIN sigl_05_07_data AS link ON link.id_refanalyse = ana.id_data AND link.id_refvariable = var.id_data
            WHERE req.id_dos = %s
              AND (
                ana.id_data = %s
                OR (ana.code IS NOT NULL AND ana.code = %s)
                OR req.ref_analyse = %s
              )
              AND (
                var.id_data = %s
                OR (var.code_var IS NOT NULL AND var.code_var = %s)
                OR link.position = %s
                OR link.num_var = %s
              )
            LIMIT 1
        """)

        cursor.execute(req, (
            id_rec,
            test_id_int, test_id_str, ref_analyse_sample,
            param_id_int, param_id_str, param_id_int, param_id_int
        ))

        row = cursor.fetchone()
        if row:
            return row

        # 2. Fallback: Search on record solely by variable matching
        req_fallback = ("""
            SELECT
                res.id_data       AS id_res,
                res.valeur        AS current_valeur,
                res.ref_variable  AS var_id,
                req.ref_analyse   AS ana_id,
                ana.code          AS ana_code,
                var.code_var      AS var_code,
                var.libelle       AS var_name
            FROM sigl_09_data AS res
            INNER JOIN sigl_04_data AS req ON req.id_data = res.id_analyse
            INNER JOIN sigl_05_data AS ana ON ana.id_data = req.ref_analyse
            INNER JOIN sigl_07_data AS var ON var.id_data = res.ref_variable
            WHERE req.id_dos = %s
              AND (
                var.id_data = %s
                OR (var.code_var IS NOT NULL AND var.code_var = %s)
              )
            LIMIT 1
        """)

        cursor.execute(req_fallback, (id_rec, param_id_int, param_id_str))
        return cursor.fetchone()

    @staticmethod
    def _updateResultValue(id_res, value):
        """Update the result value in sigl_09_data and mark recovery as 'A' (Automate)."""
        try:
            cursor = DB.cursor()

            cursor.execute(
                'UPDATE sigl_09_data SET valeur = %s, res_recovery = "A" '
                'WHERE id_data = %s',
                (value, id_res))

            BluePearl.log.info(Logs.fileline() + ' : _updateResultValue OK id_res=' + str(id_res))

            return True
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR _updateResultValue SQL = ' + str(e))
            return False

    @staticmethod
    def exportNomenclature(machinename=''):
        """
        Extract the standard nomenclature matrix as requested in Section 1.3:
          - MACHINE NAME (Header or machine identifier)
          - TEST NAME (LabBook analysis group name)
          - TEST PARAMETER NAME (LabBook variable/parameter name)
          - TEST ID (LabBook test numeric ID or code)
          - PARAMETER ID (LabBook parameter numeric ID or code)
          - MACHINE CODE / HOST CODE (Blank, to be configured by Blue Pearl)
        """
        cursor = DB.cursor()

        req = ("""
            SELECT
                ana.id_data    AS test_id,
                ana.code       AS ana_code,
                ana.nom        AS test_name,
                var.id_data    AS parameter_id,
                var.code_var   AS var_code,
                var.libelle    AS test_parameter_name
            FROM sigl_05_data AS ana
            INNER JOIN sigl_05_07_data AS link ON link.id_refanalyse = ana.id_data
            INNER JOIN sigl_07_data AS var ON var.id_data = link.id_refvariable
            WHERE ana.actif = 4 AND var.actif = 4
            ORDER BY ana.nom ASC, link.position ASC
        """)

        cursor.execute(req)
        rows = cursor.fetchall()

        nomenclature = []
        for r in rows:
            nomenclature.append({
                "MACHINE NAME": machinename,
                "TEST NAME": r['test_name'] or '',
                "TEST PARAMETER NAME": r['test_parameter_name'] or '',
                "TEST ID": r['test_id'],
                "PARAMETER ID": r['parameter_id'],
                "MACHINE CODE / HOST CODE": ""
            })

        return nomenclature

    @staticmethod
    def _insertAnalyzerResult(machinename, barcode, ana_code, var_code, id_samp, value):
        """
        Insert a trace record in analyzer_result for audit and
        traceability of automate results.
        """
        try:
            cursor = DB.cursor()

            cursor.execute(
                'INSERT INTO analyzer_result '
                '(anr_date, anr_ans, anr_code, anr_lb_code, anr_samp, anr_value, anr_unit) '
                'VALUES (NOW(), 0, %s, %s, %s, %s, %s)',
                (
                    str(ana_code) + '/' + str(var_code),
                    str(ana_code),
                    id_samp,
                    value,
                    machinename
                ))

            return True
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR _insertAnalyzerResult SQL = ' + str(e))
            return False

    # ------------------------------------------------------------------
    #  ACK status helpers
    # ------------------------------------------------------------------

    @staticmethod
    def getAckStatus(barcode):
        """Get the acknowledgment status of a specific barcode."""
        cursor = DB.cursor()

        cursor.execute('SELECT * FROM bluepearl_ack WHERE bpa_barcode = %s', (barcode,))

        return cursor.fetchone()

    @staticmethod
    def getAckList():
        """Get all acknowledgment records."""
        cursor = DB.cursor()

        cursor.execute(
            'SELECT ack.*, samp.code AS samp_code '
            'FROM bluepearl_ack ack '
            'LEFT JOIN sigl_01_data samp ON samp.id_data = ack.bpa_id_samp '
            'ORDER BY ack.bpa_created_at DESC')

        return cursor.fetchall()
