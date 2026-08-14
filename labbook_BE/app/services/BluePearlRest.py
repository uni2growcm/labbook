# -*- coding:utf-8 -*-
"""
BluePearlRest – API REST endpoints for BPHT / eLab Machine Connect.

These endpoints allow the BPHT middleware to:
  1. GET /services/external/bluepearl/orders - Pull pending analysis orders
  2. POST /services/external/bluepearl/orders/ack - Acknowledge receipt of orders
  3. POST /services/external/bluepearl/results - Push analysis results

Authentication is handled via OAuth2 (Client Credentials or Authorization Code)
using the @require_oauth decorator.
"""

import logging
from flask import request
from flask_restful import Resource

from app.models.Constants import Constants
from app.models.Logs import Logs
from app.models.Audit import Audit
from app.models.BluePearl import BluePearl
from app.models.General import compose_ret
from app.security.oauth_routes import require_oauth


class BluePearlOrdersApi(Resource):
    log = logging.getLogger('log_services')

    @require_oauth('external/bluepearl')
    def get(self):
        """
        Pull pending orders.
        Returns JSON matching BPHT's expected format.
        """
        audit_user = request.oauth_user
        
        self.log.info(Logs.fileline() + ' : BluePearlOrdersApi GET access authorized')
        
        try:
            # 1. Get pending orders from database
            rows = BluePearl.getPendingOrdersForBPHT()
            
            # 2. Format to BPHT JSON structure
            response_data = BluePearl.formatOrdersForBPHT(rows)
            
            count = len(response_data['data'].get('_lstMInterPatientDetails', []))
            self.log.info(Logs.fileline() + f' : BluePearlOrdersApi GET returning {count} orders')
            
            # 3. Audit log
            details = {
                "result": "SUCCESS",
                "action": "GET_ORDERS",
                "count": count
            }
            Audit.insertAudit(audit_user, "BluePearlOrders", "EXTERNAL_API", 0, "SUCCESS", details, "R")
            
            return compose_ret(response_data, Constants.cst_content_type_json, 200)
            
        except Exception as err:
            self.log.error(Logs.fileline() + ' : BluePearlOrdersApi GET ERROR: ' + str(err))
            
            # Attempt to log audit error
            try:
                details = {"result": "ERROR", "action": "GET_ORDERS", "error": str(err)}
                Audit.insertAudit(audit_user, "BluePearlOrders", "EXTERNAL_API", 0, "ERROR", details, "R")
            except Exception as audit_err:
                self.log.error(Logs.fileline() + ' : BluePearlOrdersApi GET ERROR audit failed: ' + str(audit_err))
                
            return compose_ret({"statusCode": "1", "statusMessage": "Internal Server Error"}, Constants.cst_content_type_json, 500)


class BluePearlAckApi(Resource):
    log = logging.getLogger('log_services')

    @require_oauth('external/bluepearl')
    def post(self):
        """
        Acknowledge receipt of orders by BPHT.
        Payload format:
        {
          "Data": {
            "_listsample": [
              { "barcode": "90000004" }
            ]
          }
        }
        """
        audit_user = request.oauth_user
        args = request.get_json()
        
        self.log.info(Logs.fileline() + ' : BluePearlAckApi POST access authorized. args=' + str(args))
        
        try:
            if not args or 'Data' not in args or '_listsample' not in args['Data']:
                raise ValueError("Invalid payload format. Expected Data._listsample")
                
            samples = args['Data']['_listsample']
            barcodes = [s.get('barcode') for s in samples if s.get('barcode')]
            
            if not barcodes:
                return compose_ret({"statusCode": "0", "statusMessage": "No barcodes provided"}, Constants.cst_content_type_json, 200)
                
            # Update acknowledgment in database
            result = BluePearl.acknowledgeOrders(barcodes)
            
            self.log.info(Logs.fileline() + f" : BluePearlAckApi POST result={result}")
            
            # Audit log
            details = {
                "result": "SUCCESS",
                "action": "ACK_ORDERS",
                "count": len(barcodes),
                "acknowledged": result['acknowledged'],
                "not_found": result['not_found']
            }
            Audit.insertAudit(audit_user, "BluePearlAck", "EXTERNAL_API", 0, "SUCCESS", details, "U")
            
            return compose_ret({"statusCode": "0", "statusMessage": "Success"}, Constants.cst_content_type_json, 200)
            
        except Exception as err:
            self.log.error(Logs.fileline() + ' : BluePearlAckApi POST ERROR: ' + str(err))
            
            # Attempt to log audit error
            try:
                details = {"result": "ERROR", "action": "ACK_ORDERS", "error": str(err)}
                Audit.insertAudit(audit_user, "BluePearlAck", "EXTERNAL_API", 0, "ERROR", details, "U")
            except Exception as audit_err:
                self.log.error(Logs.fileline() + ' : BluePearlAckApi POST ERROR audit failed: ' + str(audit_err))
                
            return compose_ret({"statusCode": "1", "statusMessage": "Bad Request or Internal Server Error: " + str(err)}, Constants.cst_content_type_json, 400)


class BluePearlResultsApi(Resource):
    log = logging.getLogger('log_services')

    @require_oauth('external/bluepearl')
    def post(self):
        """
        Receive analysis results from BPHT.
        Payload format:
        {
          "Data": {
            "_listsampleResult": [
              {
                "patientId": 258165,
                "barcode": "90000006",
                "testId": 1187,
                "ParameterId": 110,
                "Result": "6.9",
                "machinename": "E411_Faridabad"
              }
            ]
          }
        }
        """
        audit_user = request.oauth_user
        args = request.get_json()
        
        self.log.info(Logs.fileline() + ' : BluePearlResultsApi POST access authorized. Payload size: ' + str(len(str(args))))
        
        try:
            if not args or 'Data' not in args or '_listsampleResult' not in args['Data']:
                raise ValueError("Invalid payload format. Expected Data._listsampleResult")
                
            results_list = args['Data']['_listsampleResult']
            
            if not results_list:
                return compose_ret({"statusCode": "0", "statusMessage": "No results provided"}, Constants.cst_content_type_json, 200)
                
            # Process and store results
            process_res = BluePearl.insertBPHTResults(results_list)
            
            self.log.info(Logs.fileline() + f" : BluePearlResultsApi POST result summary: {len(process_res['stored'])} stored, {len(process_res['errors'])} errors")
            
            # Determine overall success status
            if not process_res['errors']:
                status_code = "0"
                status_msg = "Success"
                http_status = 200
            elif not process_res['stored']:
                status_code = "1"
                status_msg = "All results failed to process"
                http_status = 400
            else:
                status_code = "2"
                status_msg = "Partial success"
                http_status = 207
            
            # Audit log
            details = {
                "result": "SUCCESS" if not process_res['errors'] else ("PARTIAL" if process_res['stored'] else "ERROR"),
                "action": "POST_RESULTS",
                "received_count": len(results_list),
                "stored_count": len(process_res['stored']),
                "error_count": len(process_res['errors']),
                "errors": process_res['errors']
            }
            
            Audit.insertAudit(audit_user, "BluePearlResults", "EXTERNAL_API", 0, details["result"], details, "U")
            
            response = {
                "statusCode": status_code,
                "statusMessage": status_msg,
                "details": {
                    "stored": len(process_res['stored']),
                    "failed": len(process_res['errors']),
                    "errors": process_res['errors']
                }
            }
            
            return compose_ret(response, Constants.cst_content_type_json, http_status)
            
        except Exception as err:
            self.log.error(Logs.fileline() + ' : BluePearlResultsApi POST ERROR: ' + str(err))
            
            # Attempt to log audit error
            try:
                details = {"result": "ERROR", "action": "POST_RESULTS", "error": str(err)}
                Audit.insertAudit(audit_user, "BluePearlResults", "EXTERNAL_API", 0, "ERROR", details, "U")
            except Exception as audit_err:
                self.log.error(Logs.fileline() + ' : BluePearlResultsApi POST ERROR audit failed: ' + str(audit_err))
                
            return compose_ret({"statusCode": "1", "statusMessage": "Bad Request or Internal Server Error: " + str(err)}, Constants.cst_content_type_json, 400)


class BluePearlMappingApi(Resource):
    log = logging.getLogger('log_services')

    @require_oauth()
    def get(self, bpm_ser=None):
        """
        Get all mappings or a specific one.
        Note: The require_oauth without parameters means any authenticated user 
        (like LabBook FE session) can access, which is what we want for the UI.
        """
        try:
            if bpm_ser:
                cursor = DB.cursor()
                cursor.execute('SELECT * FROM bluepearl_map WHERE bpm_ser = %s', (bpm_ser,))
                mapping = cursor.fetchone()
                if not mapping:
                    return compose_ret({"error": "Mapping not found"}, Constants.cst_content_type_json, 404)
                return compose_ret(mapping, Constants.cst_content_type_json, 200)
            else:
                mappings = BluePearl.getMappingList()
                return compose_ret(mappings, Constants.cst_content_type_json, 200)
        except Exception as err:
            self.log.error(Logs.fileline() + f' : BluePearlMappingApi GET ERROR: {err}')
            return compose_ret({"error": str(err)}, Constants.cst_content_type_json, 500)

    @require_oauth()
    def post(self):
        """Create a new mapping."""
        audit_user = request.oauth_user
        args = request.get_json()
        
        try:
            bpm_ser = BluePearl.insertMapping(
                machinename=args.get('bpm_machinename', ''),
                test_id=args.get('bpm_test_id'),
                test_name=args.get('bpm_test_name', ''),
                param_id=args.get('bpm_param_id'),
                param_name=args.get('bpm_param_name', ''),
                ana_id=args.get('bpm_ana_id'),
                var_id=args.get('bpm_var_id'),
                ana_code=args.get('bpm_ana_code'),
                var_code=args.get('bpm_var_code')
            )
            
            if bpm_ser > 0:
                details = {"result": "SUCCESS", "action": "CREATE_MAPPING", "bpm_ser": bpm_ser, "data": args}
                Audit.insertAudit(audit_user, "BluePearlMapping", "SETTING", 0, "SUCCESS", details, "C")
                return compose_ret({"message": "Mapping created", "bpm_ser": bpm_ser}, Constants.cst_content_type_json, 201)
            else:
                return compose_ret({"error": "Failed to create mapping. Check unique constraints."}, Constants.cst_content_type_json, 400)
                
        except Exception as err:
            self.log.error(Logs.fileline() + f' : BluePearlMappingApi POST ERROR: {err}')
            return compose_ret({"error": str(err)}, Constants.cst_content_type_json, 500)

    @require_oauth()
    def put(self, bpm_ser):
        """Update an existing mapping."""
        audit_user = request.oauth_user
        args = request.get_json()
        
        try:
            success = BluePearl.updateMapping(
                bpm_ser,
                machinename=args.get('bpm_machinename', ''),
                test_id=args.get('bpm_test_id'),
                test_name=args.get('bpm_test_name', ''),
                param_id=args.get('bpm_param_id'),
                param_name=args.get('bpm_param_name', ''),
                ana_id=args.get('bpm_ana_id'),
                var_id=args.get('bpm_var_id'),
                ana_code=args.get('bpm_ana_code'),
                var_code=args.get('bpm_var_code')
            )
            
            if success:
                details = {"result": "SUCCESS", "action": "UPDATE_MAPPING", "bpm_ser": bpm_ser, "data": args}
                Audit.insertAudit(audit_user, "BluePearlMapping", "SETTING", 0, "SUCCESS", details, "U")
                return compose_ret({"message": "Mapping updated"}, Constants.cst_content_type_json, 200)
            else:
                return compose_ret({"error": "Failed to update mapping"}, Constants.cst_content_type_json, 400)
                
        except Exception as err:
            self.log.error(Logs.fileline() + f' : BluePearlMappingApi PUT ERROR: {err}')
            return compose_ret({"error": str(err)}, Constants.cst_content_type_json, 500)

    @require_oauth()
    def delete(self, bpm_ser):
        """Soft-delete a mapping."""
        audit_user = request.oauth_user
        
        try:
            success = BluePearl.deleteMapping(bpm_ser)
            
            if success:
                details = {"result": "SUCCESS", "action": "DELETE_MAPPING", "bpm_ser": bpm_ser}
                Audit.insertAudit(audit_user, "BluePearlMapping", "SETTING", 0, "SUCCESS", details, "D")
                return compose_ret({"message": "Mapping deleted"}, Constants.cst_content_type_json, 200)
            else:
                return compose_ret({"error": "Failed to delete mapping"}, Constants.cst_content_type_json, 400)
                
        except Exception as err:
            self.log.error(Logs.fileline() + f' : BluePearlMappingApi DELETE ERROR: {err}')
            return compose_ret({"error": str(err)}, Constants.cst_content_type_json, 500)
