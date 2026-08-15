#!/usr/bin/env python3
# -*- coding:utf-8 -*-
import unittest
import json
import base64
from flask import Flask

import sys
import os
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))

from app import app
from app.models.DB import DB

class BluePearlAPITestCase(unittest.TestCase):
    """
    Test suite for BluePearl integration.
    Run with: python3 labbook_BE/script/test/test_bluepearl.py
    """

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

        # Generate Basic Auth token equivalent to OAuth2 client credentials
        # (Though we use client_secret_post in our implementation)
        # Note: Depending on AuthLib setup, we might need a real token.
        self.client_id = 'BPHT-API'
        self.client_secret = 'a3f0ab40d2bf9a2ec4fa8a01b622a3d8290234be4b5839e9b34f515a9125c45a'
        
        # Get an access token
        response = self.app.post('/services/oauth/token', data={
            'grant_type': 'client_credentials',
            'client_id': self.client_id,
            'client_secret': self.client_secret,
            'scope': 'external/bluepearl'
        })
        
        if response.status_code == 200:
            data = json.loads(response.data)
            self.token = data.get('access_token')
            self.headers = {'Authorization': f'Bearer {self.token}'}
        else:
            self.token = None
            self.headers = {}

    def test_01_auth(self):
        """Test authentication token retrieval."""
        self.assertIsNotNone(self.token, "Failed to get OAuth2 token")

    def test_02_get_orders(self):
        """Test GET /orders API."""
        if not self.token:
            self.skipTest("No auth token")
            
        response = self.app.get('/services/external/bluepearl/orders', headers=self.headers)
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.data)
        
        print("\n--- Data GET /orders ---")
        print(json.dumps(data, indent=2, ensure_ascii=False))
        print("------------------------\n")
        
        self.assertEqual(data.get('statusCode'), "0")
        self.assertIn('_lstMInterPatientDetails', data.get('data', {}))

    def test_03_post_ack_empty(self):
        """Test POST /orders/ack API with empty data."""
        if not self.token:
            self.skipTest("No auth token")
            
        payload = {
            "Data": {
                "_listsample": []
            }
        }
        
        response = self.app.post('/services/external/bluepearl/orders/ack', 
                                headers=self.headers,
                                json=payload)
        self.assertEqual(response.status_code, 200)

    def test_04_post_results_empty(self):
        """Test POST /results API with empty data."""
        if not self.token:
            self.skipTest("No auth token")
            
        payload = {
            "Data": {
                "_listsampleResult": []
            }
        }
        
        response = self.app.post('/services/external/bluepearl/results', 
                                headers=self.headers,
                                json=payload)
        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()
