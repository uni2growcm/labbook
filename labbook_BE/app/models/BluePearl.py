# -*- coding:utf-8 -*-
"""
BluePearl – Business logic for BPHT / eLab Machine Connect integration.

This module handles:
  - Extraction of pending analysis orders for BPHT polling (GET /orders)
  - Acknowledgment tracking (POST /orders/ack)
  - Result injection from automate (POST /results)
  - Mapping between BPHT testId/ParameterId and LabBook analysis/variable
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
    #  MAPPING helpers
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

            cursor.execute(
                'INSERT INTO bluepearl_map '
                '(bpm_machinename, bpm_test_id, bpm_test_name, bpm_param_id, bpm_param_name, '
                ' bpm_ana_id, bpm_var_id, bpm_ana_code, bpm_var_code) '
                'VALUES (%(machinename)s, %(test_id)s, %(test_name)s, %(param_id)s, %(param_name)s, '
                '%(ana_id)s, %(var_id)s, %(ana_code)s, %(var_code)s)',
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
            cursor.execute(
                'UPDATE bluepearl_map SET '
                'bpm_machinename=%(machinename)s, bpm_test_id=%(test_id)s, bpm_test_name=%(test_name)s, '
                'bpm_param_id=%(param_id)s, bpm_param_name=%(param_name)s, '
                'bpm_ana_id=%(ana_id)s, bpm_var_id=%(var_id)s, '
                'bpm_ana_code=%(ana_code)s, bpm_var_code=%(var_code)s '
                'WHERE bpm_ser=%(bpm_ser)s',
                params)

            BluePearl.log.info(Logs.fileline() + ' : updateMapping OK bpm_ser=' + str(bpm_ser))

            return True
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR updateMapping SQL = ' + str(e))
            return False

    @staticmethod
    def deleteMapping(bpm_ser):
        """Soft-delete a mapping row (set bpm_active = 'N')."""
        try:
            cursor = DB.cursor()

            cursor.execute(
                'UPDATE bluepearl_map SET bpm_active="N" WHERE bpm_ser=%s',
                (bpm_ser,))

            BluePearl.log.info(Logs.fileline() + ' : deleteMapping OK bpm_ser=' + str(bpm_ser))

            return True
        except mysql.connector.Error as e:
            BluePearl.log.error(Logs.fileline() + ' : ERROR deleteMapping SQL = ' + str(e))
            return False

    # ------------------------------------------------------------------
    #  ORDERS – Pending orders for BPHT to pull (GET)
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
            LEFT JOIN bluepearl_ack AS ack ON ack.bpa_barcode = samp.code
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

        For each row, look up the BPHT testId/ParameterId via bluepearl_map.
        If no mapping exists, use LabBook IDs as fallback.
        """
        details = []

        for row in rows:
            # Try to find the BPHT mapping for this analysis variable
            mapping = BluePearl.getMappingByLabBook(row['ana_id'], row['var_id'])

            if mapping:
                test_id = mapping['bpm_test_id']
                test_name = mapping['bpm_test_name'] or row['ana_name']
                param_id = mapping['bpm_param_id']
                param_name = mapping['bpm_param_name'] or row['var_name']
            else:
                # Fallback: use LabBook IDs directly
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
    def getMappingByLabBook(ana_id, var_id):
        """Reverse lookup: find BPHT mapping from LabBook ana_id + var_id."""
        cursor = DB.cursor()

        req = ('SELECT * FROM bluepearl_map '
               'WHERE bpm_ana_id=%s AND bpm_var_id=%s AND bpm_active="Y" LIMIT 1')
        cursor.execute(req, (ana_id, var_id))

        return cursor.fetchone()

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
    #  ACKNOWLEDGMENT – BPHT confirms it received the orders (POST)
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
    #  RESULTS – BPHT pushes automate results (POST)
    # ------------------------------------------------------------------

    @staticmethod
    def insertBPHTResults(results_list):
        """
        Process the results sent by BPHT and store them in LabBook.

        For each result in results_list:
          1. Resolve barcode → sigl_01_data.id_data (sample)
          2. Resolve testId/ParameterId → LabBook analysis/variable via bluepearl_map
          3. Find the corresponding sigl_09_data row (result record)
          4. Update the result value

        Returns dict with 'stored', 'errors', 'warnings' lists.
        """
        stored = []
        errors = []
        warnings = []

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
            ref_analyse = sample['samp_id_ana']

            # Step 2: Resolve testId/ParameterId → LabBook variable via mapping
            mapping = BluePearl.getMapping(test_id, param_id, machinename)

            if not mapping:
                # Try without machinename
                mapping = BluePearl.getMapping(test_id, param_id)

            if not mapping:
                errors.append({
                    'barcode': barcode,
                    'testId': test_id,
                    'ParameterId': param_id,
                    'error': 'No mapping found for testId/ParameterId'
                })
                continue

            lb_var_id = mapping['bpm_var_id']

            # Step 3: Find the sigl_09_data row for this analysis request + variable
            result_row = BluePearl._findResultRow(id_rec, ref_analyse, lb_var_id)

            if not result_row:
                # Try broader search across all analyses on this record
                result_row = BluePearl._findResultRowBroad(id_rec, mapping['bpm_ana_id'], lb_var_id)

            if not result_row:
                errors.append({
                    'barcode': barcode,
                    'testId': test_id,
                    'ParameterId': param_id,
                    'error': 'No result row found in LabBook for this analysis/variable'
                })
                continue

            id_res = result_row['id_data']

            # Step 4: Update the result value
            ok = BluePearl._updateResultValue(id_res, value)

            if ok:
                stored.append({
                    'barcode': barcode,
                    'testId': test_id,
                    'ParameterId': param_id,
                    'id_res': id_res,
                    'value': value
                })

                # Also store in analyzer_result for traceability
                BluePearl._insertAnalyzerResult(
                    machinename=machinename,
                    barcode=barcode,
                    ana_code=mapping.get('bpm_ana_code', ''),
                    var_code=mapping.get('bpm_var_code', ''),
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
    def _findResultRow(id_rec, ref_analyse, var_id):
        """
        Find the sigl_09_data row for a specific analysis request and variable
        within a given record.
        """
        cursor = DB.cursor()

        req = ('SELECT res.id_data, res.valeur '
               'FROM sigl_09_data AS res '
               'INNER JOIN sigl_04_data AS req ON req.id_data = res.id_analyse '
               'WHERE req.id_dos = %s AND req.ref_analyse = %s AND res.ref_variable = %s '
               'LIMIT 1')

        cursor.execute(req, (id_rec, ref_analyse, var_id))

        return cursor.fetchone()

    @staticmethod
    def _findResultRowBroad(id_rec, ana_id, var_id):
        """
        Broader search: find sigl_09_data row for any request on this record
        that references the given analysis and variable.
        """
        cursor = DB.cursor()

        req = ('SELECT res.id_data, res.valeur '
               'FROM sigl_09_data AS res '
               'INNER JOIN sigl_04_data AS req ON req.id_data = res.id_analyse '
               'WHERE req.id_dos = %s AND req.ref_analyse = %s AND res.ref_variable = %s '
               'LIMIT 1')

        cursor.execute(req, (id_rec, ana_id, var_id))

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
