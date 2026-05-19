-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: SIGL
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `SIGL`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SIGL` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `SIGL`;

--
-- Table structure for table `age_interval_setting`
--

DROP TABLE IF EXISTS `age_interval_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_interval_setting` (
  `ais_ser` int NOT NULL AUTO_INCREMENT,
  `ais_rank` int NOT NULL,
  `ais_lower_bound` int DEFAULT NULL,
  `ais_upper_bound` int DEFAULT NULL,
  PRIMARY KEY (`ais_ser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_interval_setting`
--

LOCK TABLES `age_interval_setting` WRITE;
/*!40000 ALTER TABLE `age_interval_setting` DISABLE KEYS */;
INSERT INTO `age_interval_setting` VALUES (1,0,NULL,5),(2,1,5,20),(3,2,20,40),(4,3,40,NULL);
/*!40000 ALTER TABLE `age_interval_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('293f26bdbf13');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analyzer_msg`
--

DROP TABLE IF EXISTS `analyzer_msg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analyzer_msg` (
  `anl_ser` int NOT NULL AUTO_INCREMENT,
  `anl_date` datetime DEFAULT NULL,
  `anl_date_upd` datetime DEFAULT NULL,
  `anl_ans` int NOT NULL,
  `anl_id_samp` int NOT NULL,
  `anl_stat` varchar(2) NOT NULL,
  `anl_OML_O33` text NOT NULL,
  `anl_ORL_O34` text NOT NULL,
  `anm_tot` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`anl_ser`),
  KEY `anl_stat` (`anl_stat`),
  KEY `anl_id_samp` (`anl_id_samp`),
  KEY `idx_anm_tot` (`anm_tot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyzer_msg`
--

LOCK TABLES `analyzer_msg` WRITE;
/*!40000 ALTER TABLE `analyzer_msg` DISABLE KEYS */;
/*!40000 ALTER TABLE `analyzer_msg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analyzer_result`
--

DROP TABLE IF EXISTS `analyzer_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analyzer_result` (
  `anr_ser` int NOT NULL AUTO_INCREMENT,
  `anr_date` datetime DEFAULT NULL,
  `anr_ans` int DEFAULT '0',
  `anr_code` varchar(100) NOT NULL,
  `anr_lb_code` varchar(10) DEFAULT NULL,
  `anr_samp` int DEFAULT '0',
  `anr_value` varchar(120) DEFAULT NULL,
  `anr_unit` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`anr_ser`),
  KEY `anr_ans` (`anr_ans`),
  KEY `anr_samp` (`anr_samp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyzer_result`
--

LOCK TABLES `analyzer_result` WRITE;
/*!40000 ALTER TABLE `analyzer_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `analyzer_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analyzer_setting`
--

DROP TABLE IF EXISTS `analyzer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analyzer_setting` (
  `ans_ser` int NOT NULL AUTO_INCREMENT,
  `ans_date` datetime DEFAULT NULL,
  `ans_user` int NOT NULL DEFAULT '0',
  `ans_rank` int NOT NULL DEFAULT '0',
  `ans_name` varchar(100) NOT NULL,
  `ans_id` varchar(80) NOT NULL,
  `ans_filename` varchar(255) NOT NULL,
  `ans_batch` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ans_ser`),
  UNIQUE KEY `ans_id` (`ans_id`),
  KEY `ans_rank` (`ans_rank`),
  KEY `ans_name` (`ans_name`),
  KEY `ans_id_2` (`ans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyzer_setting`
--

LOCK TABLES `analyzer_setting` WRITE;
/*!40000 ALTER TABLE `analyzer_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `analyzer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_trail`
--

DROP TABLE IF EXISTS `audit_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_trail` (
  `aud_ser` bigint unsigned NOT NULL AUTO_INCREMENT,
  `aud_date_utc` datetime NOT NULL,
  `aud_user_login` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aud_user_display` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aud_user_role` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aud_action` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aud_resource_type` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aud_resource_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aud_status` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aud_event_type` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'E',
  `aud_client_ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aud_details` json DEFAULT NULL,
  PRIMARY KEY (`aud_ser`),
  KEY `idx_audit_date` (`aud_date_utc`),
  KEY `idx_audit_resource` (`aud_resource_type`,`aud_resource_id`),
  KEY `idx_audit_action_date` (`aud_action`,`aud_date_utc`),
  KEY `idx_audit_user_date` (`aud_user_login`,`aud_date_utc`),
  KEY `idx_audit_event_type_date` (`aud_event_type`,`aud_date_utc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_trail`
--

LOCK TABLES `audit_trail` WRITE;
/*!40000 ALTER TABLE `audit_trail` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_job`
--

DROP TABLE IF EXISTS `automation_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automation_job` (
  `ajb_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `ajb_type` enum('dhis2','activity','billing','system') NOT NULL,
  `ajb_label` varchar(120) NOT NULL,
  `ajb_is_active` varchar(1) NOT NULL DEFAULT 'Y',
  `ajb_schedule_kind` enum('H','D','W','M','B','T','Q','S','A') NOT NULL,
  `ajb_schedule_time` time NOT NULL DEFAULT '02:00:00',
  `ajb_schedule_dow` tinyint unsigned DEFAULT NULL,
  `ajb_schedule_dom` tinyint unsigned DEFAULT NULL,
  `ajb_schedule_last_dom` varchar(1) NOT NULL DEFAULT 'N',
  `ajb_schedule_anchor_jan` varchar(1) NOT NULL DEFAULT 'Y',
  `ajb_fire_on` enum('period_end','period_start') NOT NULL DEFAULT 'period_end',
  `ajb_schedule_start_on` date DEFAULT NULL,
  `ajb_next_run_at` datetime NOT NULL,
  `ajb_last_run_at` datetime DEFAULT NULL,
  `ajb_last_status` enum('never','running','success','error','timeout') NOT NULL DEFAULT 'never',
  `ajb_params` json NOT NULL,
  `ajb_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ajb_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ajb_ser`),
  KEY `idx_ajb_due` (`ajb_is_active`,`ajb_next_run_at`),
  KEY `idx_ajb_type` (`ajb_type`),
  KEY `idx_ajb_sched` (`ajb_schedule_kind`,`ajb_schedule_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_job`
--

LOCK TABLES `automation_job` WRITE;
/*!40000 ALTER TABLE `automation_job` DISABLE KEYS */;
INSERT INTO `automation_job` VALUES (1,'system','System NTP status check','Y','H','00:00:00',NULL,NULL,'N','Y','period_end',NULL,'2026-01-28 17:06:29',NULL,'never','{\"host\": \"env:LABBOOK_DB_HOST\", \"type\": \"ssh\", \"user\": \"sigl\", \"audit\": \"Y\", \"command\": \"/storage/io/ntp_status.sh\", \"timeout\": 30}','2026-01-28 17:06:29','2026-01-28 17:06:29'),(2,'system','Audit archive + purge','Y','M','02:00:00',NULL,1,'N','N','period_end',NULL,'2026-02-01 02:00:00',NULL,'never','{\"type\": \"audit_purge\", \"audit\": \"Y\"}','2026-01-28 17:06:29','2026-01-28 17:06:29');
/*!40000 ALTER TABLE `automation_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automation_run`
--

DROP TABLE IF EXISTS `automation_run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `automation_run` (
  `arn_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `arn_job_id` int unsigned NOT NULL,
  `arn_started_at` datetime NOT NULL,
  `arn_finished_at` datetime DEFAULT NULL,
  `arn_status` enum('running','success','error','timeout') NOT NULL,
  `arn_output_uri` varchar(1024) DEFAULT NULL,
  `arn_rows_count` int DEFAULT NULL,
  `arn_message` varchar(1000) DEFAULT NULL,
  `arn_error_trace` mediumtext,
  PRIMARY KEY (`arn_ser`),
  KEY `idx_arn_job_started` (`arn_job_id`,`arn_started_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automation_run`
--

LOCK TABLES `automation_run` WRITE;
/*!40000 ALTER TABLE `automation_run` DISABLE KEYS */;
/*!40000 ALTER TABLE `automation_run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_setting`
--

DROP TABLE IF EXISTS `backup_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_setting` (
  `bks_ser` int NOT NULL AUTO_INCREMENT,
  `bks_start_time` time NOT NULL,
  PRIMARY KEY (`bks_ser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_setting`
--

LOCK TABLES `backup_setting` WRITE;
/*!40000 ALTER TABLE `backup_setting` DISABLE KEYS */;
INSERT INTO `backup_setting` VALUES (1,'12:00:00');
/*!40000 ALTER TABLE `backup_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect_setting`
--

DROP TABLE IF EXISTS `connect_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect_setting` (
  `cos_ser` int NOT NULL AUTO_INCREMENT,
  `cos_date` datetime DEFAULT NULL,
  `cos_by_user` int DEFAULT '0',
  `cos_url` varchar(255) NOT NULL,
  PRIMARY KEY (`cos_ser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect_setting`
--

LOCK TABLES `connect_setting` WRITE;
/*!40000 ALTER TABLE `connect_setting` DISABLE KEYS */;
INSERT INTO `connect_setting` VALUES (1,'2025-06-05 01:00:23',0,'http://localhost:8080');
/*!40000 ALTER TABLE `connect_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_external`
--

DROP TABLE IF EXISTS `control_external`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_external` (
  `cte_ser` int NOT NULL AUTO_INCREMENT,
  `cte_ctq` int NOT NULL,
  `cte_date` datetime DEFAULT NULL,
  `cte_type` varchar(10) DEFAULT NULL,
  `cte_organizer` varchar(255) DEFAULT NULL,
  `cte_contact` varchar(255) DEFAULT NULL,
  `cte_conform` varchar(10) DEFAULT NULL,
  `cte_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cte_ser`),
  KEY `cte_type` (`cte_type`),
  KEY `cte_ctq` (`cte_ctq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_external`
--

LOCK TABLES `control_external` WRITE;
/*!40000 ALTER TABLE `control_external` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_external` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_internal`
--

DROP TABLE IF EXISTS `control_internal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_internal` (
  `cti_ser` int NOT NULL AUTO_INCREMENT,
  `cti_ctq` int NOT NULL,
  `cti_date` datetime DEFAULT NULL,
  `cti_type` varchar(10) DEFAULT NULL,
  `cti_target` varchar(255) DEFAULT NULL,
  `cti_result` varchar(255) DEFAULT NULL,
  `cti_comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cti_ser`),
  KEY `cti_type` (`cti_type`),
  KEY `cti_ctq` (`cti_ctq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_internal`
--

LOCK TABLES `control_internal` WRITE;
/*!40000 ALTER TABLE `control_internal` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_internal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_quality`
--

DROP TABLE IF EXISTS `control_quality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_quality` (
  `ctq_ser` int NOT NULL AUTO_INCREMENT,
  `ctq_date` datetime DEFAULT NULL,
  `ctq_type_ctrl` varchar(10) DEFAULT NULL,
  `ctq_type_val` varchar(10) DEFAULT NULL,
  `ctq_name` varchar(255) DEFAULT NULL,
  `ctq_eqp` int DEFAULT NULL,
  PRIMARY KEY (`ctq_ser`),
  KEY `ctq_type_ctrl` (`ctq_type_ctrl`),
  KEY `ctq_name` (`ctq_name`),
  KEY `ctq_eqp` (`ctq_eqp`),
  KEY `ctq_type_val` (`ctq_type_val`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_quality`
--

LOCK TABLES `control_quality` WRITE;
/*!40000 ALTER TABLE `control_quality` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_quality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctrl_ext_res_report_file`
--

DROP TABLE IF EXISTS `ctrl_ext_res_report_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ctrl_ext_res_report_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctrl_ext_res_report_file`
--

LOCK TABLES `ctrl_ext_res_report_file` WRITE;
/*!40000 ALTER TABLE `ctrl_ext_res_report_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctrl_ext_res_report_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_status`
--

DROP TABLE IF EXISTS `database_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_status` (
  `dbs_ser` int NOT NULL AUTO_INCREMENT,
  `dbs_date` datetime DEFAULT NULL,
  `dbs_stat` varchar(255) DEFAULT NULL,
  `dbs_type` varchar(3) NOT NULL DEFAULT 'ANA',
  PRIMARY KEY (`dbs_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_status`
--

LOCK TABLES `database_status` WRITE;
/*!40000 ALTER TABLE `database_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `database_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dhis2_setting`
--

DROP TABLE IF EXISTS `dhis2_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dhis2_setting` (
  `dhs_ser` int NOT NULL AUTO_INCREMENT,
  `dhs_date` datetime DEFAULT NULL,
  `dhs_user` int DEFAULT '0',
  `dhs_name` varchar(100) NOT NULL,
  `dhs_login` varchar(50) NOT NULL,
  `dhs_pwd` varchar(50) NOT NULL,
  `dhs_url` varchar(255) NOT NULL,
  `dhs_default` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`dhs_ser`),
  KEY `dhs_login` (`dhs_login`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dhis2_setting`
--

LOCK TABLES `dhis2_setting` WRITE;
/*!40000 ALTER TABLE `dhis2_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `dhis2_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_calibration_file`
--

DROP TABLE IF EXISTS `eqp_calibration_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_calibration_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_calibration_file`
--

LOCK TABLES `eqp_calibration_file` WRITE;
/*!40000 ALTER TABLE `eqp_calibration_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_calibration_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_document`
--

DROP TABLE IF EXISTS `eqp_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_document` (
  `eqd_ser` int NOT NULL AUTO_INCREMENT,
  `eqd_date` datetime DEFAULT NULL,
  `eqd_user` int DEFAULT '0',
  `eqd_eqp` int NOT NULL,
  `eqd_type` varchar(4) NOT NULL,
  `eqd_ref` int NOT NULL,
  PRIMARY KEY (`eqd_ser`),
  KEY `eqd_eqp` (`eqd_eqp`),
  KEY `eqd_type` (`eqd_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_document`
--

LOCK TABLES `eqp_document` WRITE;
/*!40000 ALTER TABLE `eqp_document` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_failure`
--

DROP TABLE IF EXISTS `eqp_failure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_failure` (
  `eqf_ser` int NOT NULL AUTO_INCREMENT,
  `eqf_date` datetime DEFAULT NULL,
  `eqf_user` int DEFAULT '0',
  `eqf_eqp` int NOT NULL,
  `eqf_type` varchar(4) NOT NULL,
  `eqf_incharge` int NOT NULL,
  `eqf_supplier` int NOT NULL,
  `eqf_comm` text NOT NULL,
  PRIMARY KEY (`eqf_ser`),
  KEY `eqf_eqp` (`eqf_eqp`),
  KEY `eqf_type` (`eqf_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_failure`
--

LOCK TABLES `eqp_failure` WRITE;
/*!40000 ALTER TABLE `eqp_failure` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_failure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_failure_file`
--

DROP TABLE IF EXISTS `eqp_failure_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_failure_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_failure_file`
--

LOCK TABLES `eqp_failure_file` WRITE;
/*!40000 ALTER TABLE `eqp_failure_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_failure_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_invoice_file`
--

DROP TABLE IF EXISTS `eqp_invoice_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_invoice_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_invoice_file`
--

LOCK TABLES `eqp_invoice_file` WRITE;
/*!40000 ALTER TABLE `eqp_invoice_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_invoice_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_maintenance_contract`
--

DROP TABLE IF EXISTS `eqp_maintenance_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_maintenance_contract` (
  `eqc_ser` int NOT NULL AUTO_INCREMENT,
  `eqc_date` datetime DEFAULT NULL,
  `eqc_user` int DEFAULT '0',
  `eqc_eqp` int NOT NULL,
  `eqc_supplier` int NOT NULL,
  `eqc_date_upd` datetime DEFAULT NULL,
  `eqc_comm` text NOT NULL,
  PRIMARY KEY (`eqc_ser`),
  KEY `eqc_eqp` (`eqc_eqp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_maintenance_contract`
--

LOCK TABLES `eqp_maintenance_contract` WRITE;
/*!40000 ALTER TABLE `eqp_maintenance_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_maintenance_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_maintenance_file`
--

DROP TABLE IF EXISTS `eqp_maintenance_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_maintenance_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_maintenance_file`
--

LOCK TABLES `eqp_maintenance_file` WRITE;
/*!40000 ALTER TABLE `eqp_maintenance_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_maintenance_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_metrology`
--

DROP TABLE IF EXISTS `eqp_metrology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_metrology` (
  `eqm_ser` int NOT NULL AUTO_INCREMENT,
  `eqm_date` datetime DEFAULT NULL,
  `eqm_user` int DEFAULT '0',
  `eqm_eqp` int NOT NULL,
  `eqm_supplier` int NOT NULL,
  `eqm_comm` text NOT NULL,
  PRIMARY KEY (`eqm_ser`),
  KEY `eqm_eqp` (`eqm_eqp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_metrology`
--

LOCK TABLES `eqp_metrology` WRITE;
/*!40000 ALTER TABLE `eqp_metrology` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_metrology` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_photo_file`
--

DROP TABLE IF EXISTS `eqp_photo_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_photo_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_photo_file`
--

LOCK TABLES `eqp_photo_file` WRITE;
/*!40000 ALTER TABLE `eqp_photo_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_photo_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_preventive_maintenance`
--

DROP TABLE IF EXISTS `eqp_preventive_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_preventive_maintenance` (
  `eqs_ser` int NOT NULL AUTO_INCREMENT,
  `eqs_date` datetime DEFAULT NULL,
  `eqs_user` int DEFAULT '0',
  `eqs_eqp` int NOT NULL,
  `eqs_operator` int NOT NULL,
  `eqs_comm` text NOT NULL,
  PRIMARY KEY (`eqs_ser`),
  KEY `eqs_eqp` (`eqs_eqp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_preventive_maintenance`
--

LOCK TABLES `eqp_preventive_maintenance` WRITE;
/*!40000 ALTER TABLE `eqp_preventive_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_preventive_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eqp_preventive_maintenance_file`
--

DROP TABLE IF EXISTS `eqp_preventive_maintenance_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eqp_preventive_maintenance_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eqp_preventive_maintenance_file`
--

LOCK TABLES `eqp_preventive_maintenance_file` WRITE;
/*!40000 ALTER TABLE `eqp_preventive_maintenance_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `eqp_preventive_maintenance_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_setting`
--

DROP TABLE IF EXISTS `form_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `form_setting` (
  `fos_ser` int NOT NULL AUTO_INCREMENT,
  `fos_date` datetime DEFAULT NULL,
  `fos_rank` int DEFAULT '0',
  `fos_name` varchar(255) NOT NULL,
  `fos_type` varchar(5) NOT NULL,
  `fos_ref` varchar(50) NOT NULL,
  `fos_stat` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`fos_ser`),
  KEY `fos_type` (`fos_type`),
  KEY `fos_ref` (`fos_ref`),
  KEY `fos_stat` (`fos_stat`),
  KEY `fos_rank` (`fos_rank`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_setting`
--

LOCK TABLES `form_setting` WRITE;
/*!40000 ALTER TABLE `form_setting` DISABLE KEYS */;
INSERT INTO `form_setting` VALUES (1,'2025-06-05 01:00:21',5,'Nationality','PAT','pat_nationality','Y'),(2,'2025-06-05 01:00:21',10,'Resident','PAT','pat_resident','Y'),(3,'2025-06-05 01:00:21',15,'Blood group','PAT','pat_blood_group','Y'),(4,'2025-06-05 01:00:21',20,'Rhesus','PAT','pat_blood_rhesus','Y'),(5,'2025-06-05 01:00:21',25,'Profession','PAT','pat_profession','Y'),(6,'2025-06-05 01:00:21',30,'PO Box','PAT','pat_pbox','Y'),(7,'2025-06-05 01:00:21',35,'District/Sector','PAT','pat_district','Y'),(8,'2025-06-05 01:00:21',50,'Supplier reference','PROD','prod_ref_supplier','Y'),(9,'2025-06-05 01:00:21',60,'Location','SUPP','supp_rack','Y'),(10,'2025-06-05 01:00:21',65,'Batch number','SUPP','supp_batch_num','Y'),(11,'2025-06-05 01:00:21',70,'Purchase price','SUPP','supp_buy_price','Y'),(12,'2025-06-05 01:00:21',75,'Lessor name','SUPP','supp_lessor','Y'),(13,'2025-06-05 01:00:21',3,'Midname','PAT','pat_midname','Y'),(14,'2025-06-05 01:00:21',4,'Maiden name','PAT','nom_jf','Y');
/*!40000 ALTER TABLE `form_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functionnal_unit`
--

DROP TABLE IF EXISTS `functionnal_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functionnal_unit` (
  `fun_ser` int NOT NULL AUTO_INCREMENT,
  `fun_date` datetime DEFAULT NULL,
  `fun_rank` int DEFAULT '0',
  `fun_name` varchar(255) NOT NULL,
  PRIMARY KEY (`fun_ser`),
  KEY `fun_rank` (`fun_rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functionnal_unit`
--

LOCK TABLES `functionnal_unit` WRITE;
/*!40000 ALTER TABLE `functionnal_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `functionnal_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `functionnal_unit_link`
--

DROP TABLE IF EXISTS `functionnal_unit_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `functionnal_unit_link` (
  `ful_ser` int NOT NULL AUTO_INCREMENT,
  `ful_date` datetime DEFAULT NULL,
  `ful_fun` int NOT NULL,
  `ful_ref` int NOT NULL,
  `ful_type` varchar(1) NOT NULL,
  PRIMARY KEY (`ful_ser`),
  KEY `ful_fun` (`ful_fun`),
  KEY `ful_ref` (`ful_ref`),
  KEY `ful_type` (`ful_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `functionnal_unit_link`
--

LOCK TABLES `functionnal_unit_link` WRITE;
/*!40000 ALTER TABLE `functionnal_unit_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `functionnal_unit_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `init_version`
--

DROP TABLE IF EXISTS `init_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `init_version` (
  `ini_ser` int NOT NULL AUTO_INCREMENT,
  `ini_date` datetime DEFAULT NULL,
  `ini_stat` varchar(1) NOT NULL,
  PRIMARY KEY (`ini_ser`),
  KEY `ini_date` (`ini_date`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `init_version`
--

LOCK TABLES `init_version` WRITE;
/*!40000 ALTER TABLE `init_version` DISABLE KEYS */;
INSERT INTO `init_version` VALUES (1,'2022-02-28 14:44:03','Y'),(2,'2022-02-28 14:44:03','Y'),(3,'2022-02-28 14:44:03','Y'),(4,'2026-01-28 17:06:28','Y'),(5,'2026-01-28 17:06:28','Y');
/*!40000 ALTER TABLE `init_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_messaging`
--

DROP TABLE IF EXISTS `internal_messaging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_messaging` (
  `ime_ser` int NOT NULL AUTO_INCREMENT,
  `ime_date` datetime DEFAULT NULL,
  `ime_sender` int DEFAULT '0',
  `ime_receiver` int DEFAULT '0',
  `ime_subject` varchar(255) NOT NULL,
  `ime_body` text NOT NULL,
  `ime_is_read` varchar(1) NOT NULL DEFAULT 'N',
  `ime_sender_del` varchar(1) NOT NULL DEFAULT 'N',
  `ime_receiver_del` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ime_ser`),
  KEY `ime_sender` (`ime_sender`),
  KEY `ime_receiver` (`ime_receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_messaging`
--

LOCK TABLES `internal_messaging` WRITE;
/*!40000 ALTER TABLE `internal_messaging` DISABLE KEYS */;
/*!40000 ALTER TABLE `internal_messaging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internal_messaging_file`
--

DROP TABLE IF EXISTS `internal_messaging_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internal_messaging_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internal_messaging_file`
--

LOCK TABLES `internal_messaging_file` WRITE;
/*!40000 ALTER TABLE `internal_messaging_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `internal_messaging_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_chart_file`
--

DROP TABLE IF EXISTS `lab_chart_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_chart_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_chart_file`
--

LOCK TABLES `lab_chart_file` WRITE;
/*!40000 ALTER TABLE `lab_chart_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_chart_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lite_setting`
--

DROP TABLE IF EXISTS `lite_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lite_setting` (
  `lite_ser` int NOT NULL AUTO_INCREMENT,
  `lite_date` datetime DEFAULT NULL,
  `lite_name` varchar(100) NOT NULL,
  `lite_login` varchar(50) NOT NULL,
  `lite_pwd` varchar(100) NOT NULL,
  `lite_report_pwd` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`lite_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lite_setting`
--

LOCK TABLES `lite_setting` WRITE;
/*!40000 ALTER TABLE `lite_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `lite_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lite_users`
--

DROP TABLE IF EXISTS `lite_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lite_users` (
  `litu_ser` int NOT NULL AUTO_INCREMENT,
  `litu_date` datetime DEFAULT NULL,
  `litu_lite` int NOT NULL,
  `litu_user` int NOT NULL,
  PRIMARY KEY (`litu_ser`),
  KEY `litu_lite` (`litu_lite`),
  KEY `litu_user` (`litu_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lite_users`
--

LOCK TABLES `lite_users` WRITE;
/*!40000 ALTER TABLE `lite_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `lite_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_file`
--

DROP TABLE IF EXISTS `manual_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_file`
--

LOCK TABLES `manual_file` WRITE;
/*!40000 ALTER TABLE `manual_file` DISABLE KEYS */;
INSERT INTO `manual_file` VALUES (1,1,'2017-04-21 12:10:56','2017-04-21 12:10:56',100,1,1),(2,1,'2017-04-21 12:12:32','2017-04-21 12:12:32',100,2,2),(3,1,'2017-04-21 12:14:07','2017-04-21 12:14:07',100,3,3),(4,1,'2017-04-21 12:14:56','2017-04-21 12:14:56',100,4,4),(7,1,'2017-04-21 12:34:59','2017-04-21 12:34:59',100,7,9),(9,1,'2017-04-21 12:36:12','2017-04-21 12:36:12',100,9,11),(12,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,12,14),(13,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,13,15),(14,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,14,16),(15,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,15,17),(16,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,16,18),(17,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,17,19),(18,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,18,20),(19,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,19,21),(20,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,20,22),(21,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,21,23),(22,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,22,24);
/*!40000 ALTER TABLE `manual_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_setting`
--

DROP TABLE IF EXISTS `manual_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manual_setting` (
  `mas_ser` int NOT NULL AUTO_INCREMENT,
  `mas_date` datetime DEFAULT NULL,
  `mas_rank` int DEFAULT '0',
  `mas_name` varchar(100) NOT NULL,
  PRIMARY KEY (`mas_ser`),
  UNIQUE KEY `mas_name` (`mas_name`),
  KEY `mas_rank` (`mas_rank`),
  KEY `mas_name_2` (`mas_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_setting`
--

LOCK TABLES `manual_setting` WRITE;
/*!40000 ALTER TABLE `manual_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meeting_file`
--

DROP TABLE IF EXISTS `meeting_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meeting_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meeting_file`
--

LOCK TABLES `meeting_file` WRITE;
/*!40000 ALTER TABLE `meeting_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `meeting_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nationality` (
  `nat_ser` int NOT NULL AUTO_INCREMENT,
  `nat_name` varchar(30) NOT NULL,
  `nat_code` varchar(3) NOT NULL,
  PRIMARY KEY (`nat_ser`),
  KEY `nat_name` (`nat_name`),
  KEY `nat_code` (`nat_code`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality`
--

LOCK TABLES `nationality` WRITE;
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` VALUES (1,'Algerian','dz'),(2,'German','de'),(3,'American','us'),(4,'Angolan','ao'),(5,'Argentine','arg'),(6,'Armenian','am'),(7,'Australian','au'),(8,'Austrian','at'),(9,'Bahamian','bs'),(10,'Bangladeshi','bd'),(11,'Barbadian','bb'),(12,'Belgian','be'),(13,'Beninese','bj'),(14,'Bermudian','bm'),(15,'Bolivian','bo'),(16,'Bosnian','ba'),(17,'British','en'),(18,'Brazilian','br'),(19,'Bulgarian','bg'),(20,'Burkinabe','bf'),(21,'Cambodian','kh'),(22,'Cameroonian','cm'),(23,'Canadian','ca'),(24,'Chilean','cl'),(25,'Chinese','zh'),(26,'Cypriot','cy'),(27,'Colombian','co'),(28,'Congolese','cd'),(29,'Costa Rican','cr'),(30,'Croatian','hr'),(31,'Cuban','cu'),(32,'Danish','da'),(33,'Djiboutian','dj'),(34,'Dominican','do'),(35,'Egyptian','eg'),(36,'Ecuadorian','ec'),(37,'Spanish','es'),(38,'Estonian','et'),(39,'Ethiopian','eth'),(40,'Fijian','fj'),(41,'Finnish','fi'),(42,'French','fr'),(43,'Gambian','gm'),(44,'Gabonese','ga'),(45,'Ghanaian','gh'),(46,'Greek','el'),(47,'Grenadian','gd'),(48,'Guatemalan','gt'),(49,'Guinean','gn'),(50,'Guyanese','gy'),(51,'Haitian','ht'),(52,'Honduran','hn'),(53,'Hungarian','hu'),(54,'Indian','in'),(55,'Indonesian','id'),(56,'Iraqi','iq'),(57,'Iranian','ir'),(58,'Irish','ie'),(59,'Icelandic','is'),(60,'Israeli','il'),(61,'Italian','it'),(62,'Ivorian','ci'),(63,'Jamaican','jm'),(64,'Japanese','ja'),(65,'Kenyan','ke'),(66,'Latvian','lv'),(67,'Lebanese','lb'),(68,'Libyan','ly'),(69,'Liberian','lr'),(70,'Lithuanian','lt'),(71,'Luxembourgish','lu'),(72,'Macedonian','mk'),(73,'Malaysian','my'),(74,'Malawian','mw'),(75,'Malagasy','mg'),(76,'Malian','ml'),(77,'Moroccan','ma'),(78,'Mauritian','mu'),(79,'Mauritanian','mr'),(80,'Mexican','mx'),(81,'Mongolian','mn'),(82,'Mozambican','mz'),(83,'Namibian','na'),(84,'Nicaraguan','ni'),(85,'Nigerian','ng'),(86,'Norwegian','no'),(87,'Dutch','nl'),(88,'New Zealander','nz'),(89,'Ugandan','ug'),(90,'Pakistani','pk'),(91,'Panamanian','pa'),(92,'Papua New Guinean','pg'),(93,'Paraguayan','py'),(94,'Filipino','ph'),(95,'Polish','pl'),(96,'Portuguese','pt'),(97,'Peruvian','pe'),(98,'Romanian','ro'),(99,'Russian','ru'),(100,'Rwandan','rw'),(101,'Salvadoran','svl'),(102,'Saudi','sa'),(103,'Serbian','rs'),(104,'Sierra Leonean','sl'),(105,'Singaporean','sg'),(106,'Slovak','sk'),(107,'Slovenian','si'),(108,'Somali','so'),(109,'Sudanese','sd'),(110,'South African','za'),(111,'South Korean','kr'),(112,'Swiss','ch'),(113,'Swedish','sv'),(114,'Swazi','sz'),(115,'Syrian','sy'),(116,'Senegalese','sn'),(117,'Taiwanese','tw'),(118,'Tanzanian','tz'),(119,'Chadian','td'),(120,'Czech','cz'),(121,'Thai','th'),(122,'Togolese','tg'),(123,'Tunisian','tn'),(124,'Turkish','tr'),(125,'Ukrainian','ua'),(126,'Uruguayan','uy'),(127,'Vietnamese','vn'),(128,'Venezuelan','ve'),(129,'Zambian','zm'),(130,'Zimbabwean','zw');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_client`
--

DROP TABLE IF EXISTS `oauth2_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_client` (
  `oacl_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `oacl_client_id` varchar(128) NOT NULL,
  `oacl_client_secret` varchar(256) NOT NULL DEFAULT '',
  `oacl_client_name` varchar(255) NOT NULL DEFAULT '',
  `oacl_user_id` int unsigned NOT NULL DEFAULT '0',
  `oacl_redirect_uris` text NOT NULL,
  `oacl_scope` text NOT NULL,
  `oacl_grant_types` varchar(255) NOT NULL DEFAULT 'authorization_code refresh_token client_credentials',
  `oacl_response_types` varchar(255) NOT NULL DEFAULT 'code',
  `oacl_token_endpoint_auth_method` varchar(50) NOT NULL DEFAULT 'client_secret_basic',
  `oacl_is_active` varchar(1) NOT NULL DEFAULT 'Y',
  `oacl_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `oacl_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`oacl_ser`),
  UNIQUE KEY `uq_oacl_client_id` (`oacl_client_id`),
  KEY `idx_oacl_user` (`oacl_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_client`
--

LOCK TABLES `oauth2_client` WRITE;
/*!40000 ALTER TABLE `oauth2_client` DISABLE KEYS */;
INSERT INTO `oauth2_client` VALUES (1,'labbook-FE','','LabBook Front-End',0,'/oauth/callback /sigl/oauth/callback','','authorization_code','code','client_secret_post','Y','2026-01-28 17:06:28','2026-01-28 17:06:28'),(2,'labbook-API','','Swagger UI',0,'/static/vendor/swagger-ui/oauth2-redirect.html /sigl/static/vendor/swagger-ui/oauth2-redirect.html','external/analysis external/patient external/record external/result external/user','authorization_code','code','none','Y','2026-01-28 17:06:28','2026-01-28 17:06:28'),(3,'OH2-API','d3f0ab40d2bf9a2ec4fa8a01b622a3d8290234be4b5839e9b34f515a9125c45d','Open Hospital API',0,'/oh2/callback /oh2/oauth/callback','','client_credentials','code','client_secret_post','Y','2026-01-28 17:06:28','2026-01-28 17:06:28');
/*!40000 ALTER TABLE `oauth2_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_code`
--

DROP TABLE IF EXISTS `oauth2_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_code` (
  `oaco_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `oaco_code` varchar(255) NOT NULL,
  `oaco_client_id` varchar(128) NOT NULL,
  `oaco_redirect_uri` varchar(512) NOT NULL DEFAULT '',
  `oaco_scope` text,
  `oaco_auth_time` int unsigned NOT NULL DEFAULT '0',
  `oaco_nonce` varchar(255) NOT NULL DEFAULT '',
  `oaco_code_challenge` varchar(255) NOT NULL DEFAULT '',
  `oaco_code_challenge_method` varchar(10) NOT NULL DEFAULT '',
  `oaco_expires_at` int unsigned NOT NULL,
  `oaco_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oaco_ser`),
  UNIQUE KEY `uq_oaco_code` (`oaco_code`),
  KEY `idx_oaco_client` (`oaco_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_code`
--

LOCK TABLES `oauth2_code` WRITE;
/*!40000 ALTER TABLE `oauth2_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_token`
--

DROP TABLE IF EXISTS `oauth2_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_token` (
  `oato_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `oato_client_id` varchar(128) NOT NULL,
  `oato_token_type` varchar(40) NOT NULL DEFAULT 'Bearer',
  `oato_access_token` varchar(512) NOT NULL,
  `oato_refresh_token` varchar(512) DEFAULT NULL,
  `oato_scope` text,
  `oato_revoked` varchar(1) NOT NULL DEFAULT 'N',
  `oato_issued_at` int unsigned NOT NULL,
  `oato_expires_in` int unsigned NOT NULL,
  `oato_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`oato_ser`),
  KEY `idx_oato_access` (`oato_access_token`(191)),
  KEY `idx_oato_refresh` (`oato_refresh_token`(191)),
  KEY `idx_oato_client` (`oato_client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_token`
--

LOCK TABLES `oauth2_token` WRITE;
/*!40000 ALTER TABLE `oauth2_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_form_item`
--

DROP TABLE IF EXISTS `patient_form_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_form_item` (
  `pfi_ser` int NOT NULL AUTO_INCREMENT,
  `pfi_date` datetime DEFAULT NULL,
  `pfi_user` int DEFAULT '0',
  `pfi_pat` int NOT NULL,
  `pfi_act` varchar(1) NOT NULL DEFAULT 'Y',
  `pfi_key` varchar(80) NOT NULL,
  `pfi_value` mediumtext NOT NULL,
  PRIMARY KEY (`pfi_ser`),
  KEY `pfi_key` (`pfi_key`),
  KEY `pfi_act` (`pfi_act`),
  KEY `pfi_pat` (`pfi_pat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_form_item`
--

LOCK TABLES `patient_form_item` WRITE;
/*!40000 ALTER TABLE `patient_form_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_form_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_hist_form_item`
--

DROP TABLE IF EXISTS `patient_hist_form_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_hist_form_item` (
  `phfi_ser` int NOT NULL AUTO_INCREMENT,
  `phfi_evt` varchar(36) NOT NULL,
  `phfi_date` datetime NOT NULL,
  `phfi_user` int NOT NULL DEFAULT '0',
  `phfi_pat` int NOT NULL,
  `phfi_act` varchar(1) NOT NULL DEFAULT 'Y',
  `phfi_type` varchar(20) NOT NULL,
  `phfi_key` varchar(80) NOT NULL,
  `phfi_value` mediumtext NOT NULL,
  PRIMARY KEY (`phfi_ser`),
  KEY `idx_phfi_pat` (`phfi_pat`),
  KEY `idx_phfi_type` (`phfi_type`),
  KEY `idx_phfi_evt` (`phfi_evt`),
  KEY `idx_phfi_date` (`phfi_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_hist_form_item`
--

LOCK TABLES `patient_hist_form_item` WRITE;
/*!40000 ALTER TABLE `patient_hist_form_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `patient_hist_form_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `printer_setting`
--

DROP TABLE IF EXISTS `printer_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `printer_setting` (
  `prt_ser` int NOT NULL AUTO_INCREMENT,
  `prt_date` datetime DEFAULT NULL,
  `prt_name` varchar(100) NOT NULL,
  `prt_script` varchar(255) NOT NULL,
  `prt_default` varchar(1) NOT NULL DEFAULT 'N',
  `prt_rank` int DEFAULT '0',
  PRIMARY KEY (`prt_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `printer_setting`
--

LOCK TABLES `printer_setting` WRITE;
/*!40000 ALTER TABLE `printer_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `printer_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedure_file`
--

DROP TABLE IF EXISTS `procedure_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `procedure_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedure_file`
--

LOCK TABLES `procedure_file` WRITE;
/*!40000 ALTER TABLE `procedure_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `procedure_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_details` (
  `prd_ser` int NOT NULL AUTO_INCREMENT,
  `prd_date` datetime DEFAULT NULL,
  `prd_name` varchar(100) NOT NULL,
  `prd_type` int DEFAULT '0',
  `prd_nb_by_pack` int DEFAULT '0',
  `prd_supplier` int DEFAULT '0',
  `prd_ref_supplier` varchar(50) DEFAULT NULL,
  `prd_conserv` int DEFAULT '0',
  `prd_safe_limit` int DEFAULT '0',
  `prd_expir_oblig` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`prd_ser`),
  KEY `prd_name` (`prd_name`),
  KEY `prd_type` (`prd_type`),
  KEY `prd_supplier` (`prd_supplier`),
  KEY `idx_date` (`prd_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_details`
--

LOCK TABLES `product_details` WRITE;
/*!40000 ALTER TABLE `product_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_local`
--

DROP TABLE IF EXISTS `product_local`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_local` (
  `prl_ser` int NOT NULL AUTO_INCREMENT,
  `prl_date` datetime DEFAULT NULL,
  `prl_rank` int DEFAULT '0',
  `prl_name` varchar(100) NOT NULL,
  PRIMARY KEY (`prl_ser`),
  UNIQUE KEY `prl_name` (`prl_name`),
  KEY `prl_rank` (`prl_rank`),
  KEY `prl_name_2` (`prl_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_local`
--

LOCK TABLES `product_local` WRITE;
/*!40000 ALTER TABLE `product_local` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_local` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_supply`
--

DROP TABLE IF EXISTS `product_supply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_supply` (
  `prs_ser` int NOT NULL AUTO_INCREMENT,
  `prs_date` datetime DEFAULT NULL,
  `prs_prd` int NOT NULL,
  `prs_nb_pack` int DEFAULT '0',
  `prs_receipt_date` datetime DEFAULT NULL,
  `prs_expir_date` datetime DEFAULT NULL,
  `prs_batch_num` varchar(50) DEFAULT NULL,
  `prs_buy_price` int DEFAULT '0',
  `prs_user` int DEFAULT '0',
  `prs_empty` varchar(1) NOT NULL DEFAULT 'N',
  `prs_cancel` varchar(1) NOT NULL DEFAULT 'N',
  `prs_user_cancel` int DEFAULT '0',
  `prs_lessor` varchar(100) NOT NULL DEFAULT '',
  `prs_prl` int NOT NULL DEFAULT '0',
  `prs_remove` varchar(1) NOT NULL DEFAULT 'N',
  `prs_user_remove` int DEFAULT '0',
  PRIMARY KEY (`prs_ser`),
  KEY `prs_prd` (`prs_prd`),
  KEY `idx_date` (`prs_date`),
  KEY `idx_user` (`prs_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supply`
--

LOCK TABLES `product_supply` WRITE;
/*!40000 ALTER TABLE `product_supply` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_supply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_use`
--

DROP TABLE IF EXISTS `product_use`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_use` (
  `pru_ser` int NOT NULL AUTO_INCREMENT,
  `pru_date` datetime DEFAULT NULL,
  `pru_user` int NOT NULL,
  `pru_prs` int NOT NULL,
  `pru_nb_pack` int NOT NULL,
  `pru_cancel` varchar(1) NOT NULL DEFAULT 'N',
  `pru_user_cancel` int DEFAULT '0',
  PRIMARY KEY (`pru_ser`),
  KEY `pru_prs` (`pru_prs`),
  KEY `idx_date` (`pru_date`),
  KEY `idx_user` (`pru_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_use`
--

LOCK TABLES `product_use` WRITE;
/*!40000 ALTER TABLE `product_use` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_use` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_permissions`
--

DROP TABLE IF EXISTS `profile_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_permissions` (
  `prp_ser` int NOT NULL AUTO_INCREMENT,
  `prp_date` datetime DEFAULT NULL,
  `prp_by_user` int DEFAULT '0',
  `prp_pro` int NOT NULL,
  `prp_prr` int NOT NULL,
  `prp_granted` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`prp_ser`),
  KEY `prp_pro` (`prp_pro`),
  KEY `prp_prr` (`prp_prr`)
) ENGINE=InnoDB AUTO_INCREMENT=2798 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_permissions`
--

LOCK TABLES `profile_permissions` WRITE;
/*!40000 ALTER TABLE `profile_permissions` DISABLE KEYS */;
INSERT INTO `profile_permissions` VALUES (1,'2025-06-05 01:00:23',0,1,1,'Y'),(2,'2025-06-05 01:00:23',0,1,2,'N'),(3,'2025-06-05 01:00:23',0,1,3,'N'),(4,'2025-06-05 01:00:23',0,1,4,'N'),(5,'2025-06-05 01:00:23',0,1,5,'N'),(6,'2025-06-05 01:00:23',0,1,6,'N'),(7,'2025-06-05 01:00:23',0,1,7,'N'),(8,'2025-06-05 01:00:23',0,1,8,'N'),(9,'2025-06-05 01:00:23',0,1,9,'N'),(10,'2025-06-05 01:00:23',0,1,10,'N'),(11,'2025-06-05 01:00:23',0,1,11,'N'),(12,'2025-06-05 01:00:23',0,1,12,'N'),(13,'2025-06-05 01:00:23',0,1,13,'N'),(14,'2025-06-05 01:00:23',0,1,14,'N'),(15,'2025-06-05 01:00:23',0,1,15,'N'),(16,'2025-06-05 01:00:23',0,1,16,'N'),(17,'2025-06-05 01:00:23',0,1,17,'N'),(18,'2025-06-05 01:00:23',0,1,18,'N'),(19,'2025-06-05 01:00:23',0,1,19,'N'),(20,'2025-06-05 01:00:23',0,1,20,'N'),(21,'2025-06-05 01:00:23',0,1,21,'N'),(22,'2025-06-05 01:00:23',0,1,22,'N'),(23,'2025-06-05 01:00:23',0,1,23,'N'),(24,'2025-06-05 01:00:23',0,1,24,'N'),(25,'2025-06-05 01:00:23',0,1,25,'N'),(26,'2025-06-05 01:00:23',0,1,26,'N'),(27,'2025-06-05 01:00:23',0,1,27,'N'),(28,'2025-06-05 01:00:23',0,1,28,'N'),(29,'2025-06-05 01:00:23',0,1,29,'N'),(30,'2025-06-05 01:00:23',0,1,30,'N'),(31,'2025-06-05 01:00:23',0,1,31,'N'),(32,'2025-06-05 01:00:23',0,1,32,'N'),(33,'2025-06-05 01:00:23',0,1,33,'N'),(34,'2025-06-05 01:00:23',0,1,34,'N'),(35,'2025-06-05 01:00:23',0,1,35,'N'),(36,'2025-06-05 01:00:23',0,1,36,'N'),(37,'2025-06-05 01:00:23',0,1,37,'N'),(38,'2025-06-05 01:00:23',0,1,38,'Y'),(39,'2025-06-05 01:00:23',0,1,39,'Y'),(40,'2025-06-05 01:00:23',0,1,40,'Y'),(41,'2025-06-05 01:00:23',0,1,41,'Y'),(42,'2025-06-05 01:00:23',0,1,42,'Y'),(43,'2025-06-05 01:00:23',0,1,43,'Y'),(44,'2025-06-05 01:00:23',0,1,44,'Y'),(45,'2025-06-05 01:00:23',0,1,45,'Y'),(46,'2025-06-05 01:00:23',0,1,46,'Y'),(47,'2025-06-05 01:00:23',0,1,47,'Y'),(48,'2025-06-05 01:00:23',0,1,48,'Y'),(49,'2025-06-05 01:00:23',0,1,49,'Y'),(50,'2025-06-05 01:00:23',0,1,50,'Y'),(51,'2025-06-05 01:00:23',0,1,51,'Y'),(52,'2025-06-05 01:00:23',0,1,52,'Y'),(53,'2025-06-05 01:00:23',0,1,53,'Y'),(54,'2025-06-05 01:00:23',0,1,54,'Y'),(55,'2025-06-05 01:00:23',0,1,55,'Y'),(56,'2025-06-05 01:00:23',0,1,56,'Y'),(57,'2025-06-05 01:00:23',0,1,57,'Y'),(58,'2025-06-05 01:00:23',0,1,58,'Y'),(59,'2025-06-05 01:00:23',0,1,59,'Y'),(60,'2025-06-05 01:00:23',0,1,60,'Y'),(61,'2025-06-05 01:00:23',0,1,61,'Y'),(62,'2025-06-05 01:00:23',0,1,62,'Y'),(63,'2025-06-05 01:00:23',0,1,63,'Y'),(64,'2025-06-05 01:00:23',0,1,64,'Y'),(65,'2025-06-05 01:00:23',0,1,65,'Y'),(66,'2025-06-05 01:00:23',0,1,66,'Y'),(67,'2025-06-05 01:00:23',0,1,67,'Y'),(68,'2025-06-05 01:00:23',0,1,68,'Y'),(69,'2025-06-05 01:00:23',0,1,69,'Y'),(70,'2025-06-05 01:00:23',0,1,70,'Y'),(71,'2025-06-05 01:00:23',0,1,71,'Y'),(72,'2025-06-05 01:00:23',0,1,72,'Y'),(73,'2025-06-05 01:00:23',0,1,73,'Y'),(74,'2025-06-05 01:00:23',0,1,74,'Y'),(75,'2025-06-05 01:00:23',0,1,75,'Y'),(76,'2025-06-05 01:00:23',0,1,76,'Y'),(77,'2025-06-05 01:00:23',0,1,77,'Y'),(78,'2025-06-05 01:00:23',0,1,78,'Y'),(79,'2025-06-05 01:00:23',0,1,79,'Y'),(80,'2025-06-05 01:00:23',0,1,80,'Y'),(81,'2025-06-05 01:00:23',0,1,81,'Y'),(82,'2025-06-05 01:00:23',0,1,82,'Y'),(83,'2025-06-05 01:00:23',0,1,83,'Y'),(84,'2025-06-05 01:00:23',0,1,84,'Y'),(85,'2025-06-05 01:00:23',0,1,85,'Y'),(86,'2025-06-05 01:00:23',0,1,86,'Y'),(87,'2025-06-05 01:00:23',0,1,87,'Y'),(88,'2025-06-05 01:00:23',0,1,88,'Y'),(89,'2025-06-05 01:00:23',0,1,89,'Y'),(90,'2025-06-05 01:00:23',0,1,90,'Y'),(91,'2025-06-05 01:00:23',0,1,91,'Y'),(92,'2025-06-05 01:00:23',0,1,92,'Y'),(93,'2025-06-05 01:00:23',0,1,93,'Y'),(94,'2025-06-05 01:00:23',0,1,94,'Y'),(95,'2025-06-05 01:00:23',0,1,95,'Y'),(96,'2025-06-05 01:00:23',0,1,96,'Y'),(97,'2025-06-05 01:00:23',0,1,97,'Y'),(98,'2025-06-05 01:00:23',0,1,98,'Y'),(99,'2025-06-05 01:00:23',0,1,99,'Y'),(100,'2025-06-05 01:00:23',0,1,100,'Y'),(101,'2025-06-05 01:00:23',0,1,101,'Y'),(102,'2025-06-05 01:00:23',0,1,102,'Y'),(103,'2025-06-05 01:00:23',0,1,103,'Y'),(104,'2025-06-05 01:00:23',0,1,104,'Y'),(105,'2025-06-05 01:00:23',0,1,105,'Y'),(106,'2025-06-05 01:00:23',0,1,106,'Y'),(107,'2025-06-05 01:00:23',0,1,107,'Y'),(108,'2025-06-05 01:00:23',0,1,108,'Y'),(109,'2025-06-05 01:00:23',0,1,109,'Y'),(110,'2025-06-05 01:00:23',0,1,110,'Y'),(111,'2025-06-05 01:00:23',0,1,111,'Y'),(112,'2025-06-05 01:00:23',0,1,112,'Y'),(113,'2025-06-05 01:00:23',0,1,113,'Y'),(114,'2025-06-05 01:00:23',0,1,114,'Y'),(115,'2025-06-05 01:00:23',0,1,115,'Y'),(116,'2025-06-05 01:00:23',0,1,116,'Y'),(117,'2025-06-05 01:00:23',0,1,117,'Y'),(118,'2025-06-05 01:00:23',0,1,118,'Y'),(119,'2025-06-05 01:00:23',0,1,119,'Y'),(120,'2025-06-05 01:00:23',0,1,120,'Y'),(121,'2025-06-05 01:00:23',0,1,121,'Y'),(122,'2025-06-05 01:00:23',0,1,122,'Y'),(123,'2025-06-05 01:00:23',0,1,123,'Y'),(124,'2025-06-05 01:00:23',0,1,124,'Y'),(125,'2025-06-05 01:00:23',0,1,125,'Y'),(126,'2025-06-05 01:00:23',0,1,126,'Y'),(127,'2025-06-05 01:00:23',0,1,127,'Y'),(128,'2025-06-05 01:00:23',0,1,128,'Y'),(129,'2025-06-05 01:00:23',0,1,129,'Y'),(130,'2025-06-05 01:00:23',0,1,130,'Y'),(131,'2025-06-05 01:00:23',0,1,131,'Y'),(132,'2025-06-05 01:00:23',0,1,132,'Y'),(133,'2025-06-05 01:00:23',0,1,133,'Y'),(134,'2025-06-05 01:00:23',0,1,134,'Y'),(135,'2025-06-05 01:00:23',0,1,135,'Y'),(136,'2025-06-05 01:00:23',0,1,136,'Y'),(137,'2025-06-05 01:00:23',0,1,137,'Y'),(138,'2025-06-05 01:00:23',0,1,138,'Y'),(139,'2025-06-05 01:00:23',0,1,139,'Y'),(140,'2025-06-05 01:00:23',0,1,140,'Y'),(141,'2025-06-05 01:00:23',0,1,141,'Y'),(142,'2025-06-05 01:00:23',0,1,142,'Y'),(143,'2025-06-05 01:00:23',0,1,143,'Y'),(144,'2025-06-05 01:00:23',0,1,144,'Y'),(145,'2025-06-05 01:00:23',0,1,145,'Y'),(146,'2025-06-05 01:00:23',0,1,146,'Y'),(147,'2025-06-05 01:00:23',0,1,147,'Y'),(148,'2025-06-05 01:00:23',0,1,148,'Y'),(149,'2025-06-05 01:00:23',0,1,149,'Y'),(150,'2025-06-05 01:00:23',0,1,150,'Y'),(151,'2025-06-05 01:00:23',0,1,151,'Y'),(152,'2025-06-05 01:00:23',0,1,152,'Y'),(153,'2025-06-05 01:00:23',0,1,153,'Y'),(154,'2025-06-05 01:00:23',0,1,154,'Y'),(155,'2025-06-05 01:00:23',0,1,155,'Y'),(156,'2025-06-05 01:00:23',0,1,156,'Y'),(157,'2025-06-05 01:00:23',0,1,157,'Y'),(158,'2025-06-05 01:00:23',0,1,158,'Y'),(159,'2025-06-05 01:00:23',0,1,159,'Y'),(160,'2025-06-05 01:00:23',0,1,160,'Y'),(161,'2025-06-05 01:00:23',0,1,161,'Y'),(162,'2025-06-05 01:00:23',0,1,162,'Y'),(163,'2025-06-05 01:00:23',0,1,163,'Y'),(164,'2025-06-05 01:00:23',0,1,164,'Y'),(165,'2025-06-05 01:00:23',0,1,165,'Y'),(166,'2025-06-05 01:00:23',0,1,166,'Y'),(167,'2025-06-05 01:00:23',0,1,167,'Y'),(168,'2025-06-05 01:00:23',0,1,168,'Y'),(169,'2025-06-05 01:00:23',0,3,1,'N'),(170,'2025-06-05 01:00:23',0,3,2,'N'),(171,'2025-06-05 01:00:23',0,3,3,'Y'),(172,'2025-06-05 01:00:23',0,3,4,'Y'),(173,'2025-06-05 01:00:23',0,3,5,'Y'),(174,'2025-06-05 01:00:23',0,3,6,'Y'),(175,'2025-06-05 01:00:23',0,3,7,'Y'),(176,'2025-06-05 01:00:23',0,3,8,'N'),(177,'2025-06-05 01:00:23',0,3,9,'Y'),(178,'2025-06-05 01:00:23',0,3,10,'Y'),(179,'2025-06-05 01:00:23',0,3,11,'Y'),(180,'2025-06-05 01:00:23',0,3,12,'Y'),(181,'2025-06-05 01:00:23',0,3,13,'Y'),(182,'2025-06-05 01:00:23',0,3,14,'Y'),(183,'2025-06-05 01:00:23',0,3,15,'Y'),(184,'2025-06-05 01:00:23',0,3,16,'Y'),(185,'2025-06-05 01:00:23',0,3,17,'Y'),(186,'2025-06-05 01:00:23',0,3,18,'Y'),(187,'2025-06-05 01:00:23',0,3,19,'Y'),(188,'2025-06-05 01:00:23',0,3,20,'Y'),(189,'2025-06-05 01:00:23',0,3,21,'Y'),(190,'2025-06-05 01:00:23',0,3,22,'Y'),(191,'2025-06-05 01:00:23',0,3,23,'Y'),(192,'2025-06-05 01:00:23',0,3,24,'Y'),(193,'2025-06-05 01:00:23',0,3,25,'Y'),(194,'2025-06-05 01:00:23',0,3,26,'Y'),(195,'2025-06-05 01:00:23',0,3,27,'Y'),(196,'2025-06-05 01:00:23',0,3,28,'Y'),(197,'2025-06-05 01:00:23',0,3,29,'Y'),(198,'2025-06-05 01:00:23',0,3,30,'Y'),(199,'2025-06-05 01:00:23',0,3,31,'Y'),(200,'2025-06-05 01:00:23',0,3,32,'Y'),(201,'2025-06-05 01:00:23',0,3,33,'Y'),(202,'2025-06-05 01:00:23',0,3,34,'Y'),(203,'2025-06-05 01:00:23',0,3,35,'Y'),(204,'2025-06-05 01:00:23',0,3,36,'Y'),(205,'2025-06-05 01:00:23',0,3,37,'Y'),(206,'2025-06-05 01:00:23',0,3,38,'Y'),(207,'2025-06-05 01:00:23',0,3,39,'Y'),(208,'2025-06-05 01:00:23',0,3,40,'N'),(209,'2025-06-05 01:00:23',0,3,41,'N'),(210,'2025-06-05 01:00:23',0,3,42,'Y'),(211,'2025-06-05 01:00:23',0,3,43,'Y'),(212,'2025-06-05 01:00:23',0,3,44,'N'),(213,'2025-06-05 01:00:23',0,3,45,'N'),(214,'2025-06-05 01:00:23',0,3,46,'N'),(215,'2025-06-05 01:00:23',0,3,47,'N'),(216,'2025-06-05 01:00:23',0,3,48,'Y'),(217,'2025-06-05 01:00:23',0,3,49,'Y'),(218,'2025-06-05 01:00:23',0,3,50,'Y'),(219,'2025-06-05 01:00:23',0,3,51,'Y'),(220,'2025-06-05 01:00:23',0,3,52,'Y'),(221,'2025-06-05 01:00:23',0,3,53,'Y'),(222,'2025-06-05 01:00:23',0,3,54,'N'),(223,'2025-06-05 01:00:23',0,3,55,'N'),(224,'2025-06-05 01:00:23',0,3,56,'Y'),(225,'2025-06-05 01:00:23',0,3,57,'Y'),(226,'2025-06-05 01:00:23',0,3,58,'Y'),(227,'2025-06-05 01:00:23',0,3,59,'N'),(228,'2025-06-05 01:00:23',0,3,60,'N'),(229,'2025-06-05 01:00:23',0,3,61,'N'),(230,'2025-06-05 01:00:23',0,3,62,'N'),(231,'2025-06-05 01:00:23',0,3,63,'N'),(232,'2025-06-05 01:00:23',0,3,64,'N'),(233,'2025-06-05 01:00:23',0,3,65,'N'),(234,'2025-06-05 01:00:23',0,3,66,'N'),(235,'2025-06-05 01:00:23',0,3,67,'N'),(236,'2025-06-05 01:00:23',0,3,68,'N'),(237,'2025-06-05 01:00:23',0,3,69,'N'),(238,'2025-06-05 01:00:23',0,3,70,'Y'),(239,'2025-06-05 01:00:23',0,3,71,'Y'),(240,'2025-06-05 01:00:23',0,3,72,'Y'),(241,'2025-06-05 01:00:23',0,3,73,'Y'),(242,'2025-06-05 01:00:23',0,3,74,'Y'),(243,'2025-06-05 01:00:23',0,3,75,'Y'),(244,'2025-06-05 01:00:23',0,3,76,'Y'),(245,'2025-06-05 01:00:23',0,3,77,'Y'),(246,'2025-06-05 01:00:23',0,3,78,'Y'),(247,'2025-06-05 01:00:23',0,3,79,'Y'),(248,'2025-06-05 01:00:23',0,3,80,'Y'),(249,'2025-06-05 01:00:23',0,3,81,'Y'),(250,'2025-06-05 01:00:23',0,3,82,'Y'),(251,'2025-06-05 01:00:23',0,3,83,'Y'),(252,'2025-06-05 01:00:23',0,3,84,'Y'),(253,'2025-06-05 01:00:23',0,3,85,'Y'),(254,'2025-06-05 01:00:23',0,3,86,'Y'),(255,'2025-06-05 01:00:23',0,3,87,'Y'),(256,'2025-06-05 01:00:23',0,3,88,'Y'),(257,'2025-06-05 01:00:23',0,3,89,'Y'),(258,'2025-06-05 01:00:23',0,3,90,'Y'),(259,'2025-06-05 01:00:23',0,3,91,'Y'),(260,'2025-06-05 01:00:23',0,3,92,'Y'),(261,'2025-06-05 01:00:23',0,3,93,'Y'),(262,'2025-06-05 01:00:23',0,3,94,'Y'),(263,'2025-06-05 01:00:23',0,3,95,'Y'),(264,'2025-06-05 01:00:23',0,3,96,'Y'),(265,'2025-06-05 01:00:23',0,3,97,'Y'),(266,'2025-06-05 01:00:23',0,3,98,'Y'),(267,'2025-06-05 01:00:23',0,3,99,'Y'),(268,'2025-06-05 01:00:23',0,3,100,'Y'),(269,'2025-06-05 01:00:23',0,3,101,'Y'),(270,'2025-06-05 01:00:23',0,3,102,'Y'),(271,'2025-06-05 01:00:23',0,3,103,'Y'),(272,'2025-06-05 01:00:23',0,3,104,'Y'),(273,'2025-06-05 01:00:23',0,3,105,'Y'),(274,'2025-06-05 01:00:23',0,3,106,'Y'),(275,'2025-06-05 01:00:23',0,3,107,'Y'),(276,'2025-06-05 01:00:23',0,3,108,'Y'),(277,'2025-06-05 01:00:23',0,3,109,'Y'),(278,'2025-06-05 01:00:23',0,3,110,'Y'),(279,'2025-06-05 01:00:23',0,3,111,'Y'),(280,'2025-06-05 01:00:23',0,3,112,'Y'),(281,'2025-06-05 01:00:23',0,3,113,'Y'),(282,'2025-06-05 01:00:23',0,3,114,'Y'),(283,'2025-06-05 01:00:23',0,3,115,'Y'),(284,'2025-06-05 01:00:23',0,3,116,'Y'),(285,'2025-06-05 01:00:23',0,3,117,'Y'),(286,'2025-06-05 01:00:23',0,3,118,'Y'),(287,'2025-06-05 01:00:23',0,3,119,'Y'),(288,'2025-06-05 01:00:23',0,3,120,'Y'),(289,'2025-06-05 01:00:23',0,3,121,'Y'),(290,'2025-06-05 01:00:23',0,3,122,'Y'),(291,'2025-06-05 01:00:23',0,3,123,'Y'),(292,'2025-06-05 01:00:23',0,3,124,'Y'),(293,'2025-06-05 01:00:23',0,3,125,'Y'),(294,'2025-06-05 01:00:23',0,3,126,'Y'),(295,'2025-06-05 01:00:23',0,3,127,'Y'),(296,'2025-06-05 01:00:23',0,3,128,'Y'),(297,'2025-06-05 01:00:23',0,3,129,'Y'),(298,'2025-06-05 01:00:23',0,3,130,'Y'),(299,'2025-06-05 01:00:23',0,3,131,'Y'),(300,'2025-06-05 01:00:23',0,3,132,'Y'),(301,'2025-06-05 01:00:23',0,3,133,'Y'),(302,'2025-06-05 01:00:23',0,3,134,'N'),(303,'2025-06-05 01:00:23',0,3,135,'N'),(304,'2025-06-05 01:00:23',0,3,136,'N'),(305,'2025-06-05 01:00:23',0,3,137,'N'),(306,'2025-06-05 01:00:23',0,3,138,'N'),(307,'2025-06-05 01:00:23',0,3,139,'N'),(308,'2025-06-05 01:00:23',0,3,140,'N'),(309,'2025-06-05 01:00:23',0,3,141,'N'),(310,'2025-06-05 01:00:23',0,3,142,'N'),(311,'2025-06-05 01:00:23',0,3,143,'Y'),(312,'2025-06-05 01:00:23',0,3,144,'Y'),(313,'2025-06-05 01:00:23',0,3,145,'Y'),(314,'2025-06-05 01:00:23',0,3,146,'Y'),(315,'2025-06-05 01:00:23',0,3,147,'Y'),(316,'2025-06-05 01:00:23',0,3,148,'Y'),(317,'2025-06-05 01:00:23',0,3,149,'Y'),(318,'2025-06-05 01:00:23',0,3,150,'Y'),(319,'2025-06-05 01:00:23',0,3,151,'Y'),(320,'2025-06-05 01:00:23',0,3,152,'Y'),(321,'2025-06-05 01:00:23',0,3,153,'Y'),(322,'2025-06-05 01:00:23',0,3,154,'Y'),(323,'2025-06-05 01:00:23',0,3,155,'Y'),(324,'2025-06-05 01:00:23',0,3,156,'Y'),(325,'2025-06-05 01:00:23',0,3,157,'Y'),(326,'2025-06-05 01:00:23',0,3,158,'Y'),(327,'2025-06-05 01:00:23',0,3,159,'Y'),(328,'2025-06-05 01:00:23',0,3,160,'Y'),(329,'2025-06-05 01:00:23',0,3,161,'Y'),(330,'2025-06-05 01:00:23',0,3,162,'Y'),(331,'2025-06-05 01:00:23',0,3,163,'Y'),(332,'2025-06-05 01:00:23',0,3,164,'Y'),(333,'2025-06-05 01:00:23',0,3,165,'Y'),(334,'2025-06-05 01:00:23',0,3,166,'Y'),(335,'2025-06-05 01:00:23',0,3,167,'Y'),(336,'2025-06-05 01:00:23',0,3,168,'Y'),(337,'2025-06-05 01:00:23',0,4,1,'N'),(338,'2025-06-05 01:00:23',0,4,2,'N'),(339,'2025-06-05 01:00:23',0,4,3,'N'),(340,'2025-06-05 01:00:23',0,4,4,'N'),(341,'2025-06-05 01:00:23',0,4,5,'N'),(342,'2025-06-05 01:00:23',0,4,6,'N'),(343,'2025-06-05 01:00:23',0,4,7,'N'),(344,'2025-06-05 01:00:23',0,4,8,'N'),(345,'2025-06-05 01:00:23',0,4,9,'N'),(346,'2025-06-05 01:00:23',0,4,10,'N'),(347,'2025-06-05 01:00:23',0,4,11,'N'),(348,'2025-06-05 01:00:23',0,4,12,'N'),(349,'2025-06-05 01:00:23',0,4,13,'N'),(350,'2025-06-05 01:00:23',0,4,14,'N'),(351,'2025-06-05 01:00:23',0,4,15,'N'),(352,'2025-06-05 01:00:23',0,4,16,'N'),(353,'2025-06-05 01:00:23',0,4,17,'N'),(354,'2025-06-05 01:00:23',0,4,18,'N'),(355,'2025-06-05 01:00:23',0,4,19,'N'),(356,'2025-06-05 01:00:23',0,4,20,'N'),(357,'2025-06-05 01:00:23',0,4,21,'N'),(358,'2025-06-05 01:00:23',0,4,22,'N'),(359,'2025-06-05 01:00:23',0,4,23,'N'),(360,'2025-06-05 01:00:23',0,4,24,'N'),(361,'2025-06-05 01:00:23',0,4,25,'N'),(362,'2025-06-05 01:00:23',0,4,26,'N'),(363,'2025-06-05 01:00:23',0,4,27,'N'),(364,'2025-06-05 01:00:23',0,4,28,'N'),(365,'2025-06-05 01:00:23',0,4,29,'N'),(366,'2025-06-05 01:00:23',0,4,30,'N'),(367,'2025-06-05 01:00:23',0,4,31,'N'),(368,'2025-06-05 01:00:23',0,4,32,'N'),(369,'2025-06-05 01:00:23',0,4,33,'N'),(370,'2025-06-05 01:00:23',0,4,34,'N'),(371,'2025-06-05 01:00:23',0,4,35,'N'),(372,'2025-06-05 01:00:23',0,4,36,'N'),(373,'2025-06-05 01:00:23',0,4,37,'N'),(374,'2025-06-05 01:00:23',0,4,38,'N'),(375,'2025-06-05 01:00:23',0,4,39,'N'),(376,'2025-06-05 01:00:23',0,4,40,'N'),(377,'2025-06-05 01:00:23',0,4,41,'N'),(378,'2025-06-05 01:00:23',0,4,42,'N'),(379,'2025-06-05 01:00:23',0,4,43,'N'),(380,'2025-06-05 01:00:23',0,4,44,'N'),(381,'2025-06-05 01:00:23',0,4,45,'N'),(382,'2025-06-05 01:00:23',0,4,46,'N'),(383,'2025-06-05 01:00:23',0,4,47,'N'),(384,'2025-06-05 01:00:23',0,4,48,'N'),(385,'2025-06-05 01:00:23',0,4,49,'N'),(386,'2025-06-05 01:00:23',0,4,50,'N'),(387,'2025-06-05 01:00:23',0,4,51,'N'),(388,'2025-06-05 01:00:23',0,4,52,'N'),(389,'2025-06-05 01:00:23',0,4,53,'N'),(390,'2025-06-05 01:00:23',0,4,54,'N'),(391,'2025-06-05 01:00:23',0,4,55,'N'),(392,'2025-06-05 01:00:23',0,4,56,'N'),(393,'2025-06-05 01:00:23',0,4,57,'N'),(394,'2025-06-05 01:00:23',0,4,58,'N'),(395,'2025-06-05 01:00:23',0,4,59,'N'),(396,'2025-06-05 01:00:23',0,4,60,'N'),(397,'2025-06-05 01:00:23',0,4,61,'N'),(398,'2025-06-05 01:00:23',0,4,62,'N'),(399,'2025-06-05 01:00:23',0,4,63,'N'),(400,'2025-06-05 01:00:23',0,4,64,'N'),(401,'2025-06-05 01:00:23',0,4,65,'N'),(402,'2025-06-05 01:00:23',0,4,66,'N'),(403,'2025-06-05 01:00:23',0,4,67,'N'),(404,'2025-06-05 01:00:23',0,4,68,'Y'),(405,'2025-06-05 01:00:23',0,4,69,'N'),(406,'2025-06-05 01:00:23',0,4,70,'N'),(407,'2025-06-05 01:00:23',0,4,71,'N'),(408,'2025-06-05 01:00:23',0,4,72,'N'),(409,'2025-06-05 01:00:23',0,4,73,'N'),(410,'2025-06-05 01:00:23',0,4,74,'N'),(411,'2025-06-05 01:00:23',0,4,75,'N'),(412,'2025-06-05 01:00:23',0,4,76,'N'),(413,'2025-06-05 01:00:23',0,4,77,'Y'),(414,'2025-06-05 01:00:23',0,4,78,'Y'),(415,'2025-06-05 01:00:23',0,4,79,'N'),(416,'2025-06-05 01:00:23',0,4,80,'N'),(417,'2025-06-05 01:00:23',0,4,81,'N'),(418,'2025-06-05 01:00:23',0,4,82,'Y'),(419,'2025-06-05 01:00:23',0,4,83,'N'),(420,'2025-06-05 01:00:23',0,4,84,'N'),(421,'2025-06-05 01:00:23',0,4,85,'N'),(422,'2025-06-05 01:00:23',0,4,86,'Y'),(423,'2025-06-05 01:00:23',0,4,87,'N'),(424,'2025-06-05 01:00:23',0,4,88,'N'),(425,'2025-06-05 01:00:23',0,4,89,'N'),(426,'2025-06-05 01:00:23',0,4,90,'N'),(427,'2025-06-05 01:00:23',0,4,91,'Y'),(428,'2025-06-05 01:00:23',0,4,92,'Y'),(429,'2025-06-05 01:00:23',0,4,93,'Y'),(430,'2025-06-05 01:00:23',0,4,94,'Y'),(431,'2025-06-05 01:00:23',0,4,95,'Y'),(432,'2025-06-05 01:00:23',0,4,96,'Y'),(433,'2025-06-05 01:00:23',0,4,97,'N'),(434,'2025-06-05 01:00:23',0,4,98,'N'),(435,'2025-06-05 01:00:23',0,4,99,'N'),(436,'2025-06-05 01:00:23',0,4,100,'N'),(437,'2025-06-05 01:00:23',0,4,101,'N'),(438,'2025-06-05 01:00:23',0,4,102,'N'),(439,'2025-06-05 01:00:23',0,4,103,'N'),(440,'2025-06-05 01:00:23',0,4,104,'N'),(441,'2025-06-05 01:00:23',0,4,105,'N'),(442,'2025-06-05 01:00:23',0,4,106,'N'),(443,'2025-06-05 01:00:23',0,4,107,'N'),(444,'2025-06-05 01:00:23',0,4,108,'N'),(445,'2025-06-05 01:00:23',0,4,109,'N'),(446,'2025-06-05 01:00:23',0,4,110,'N'),(447,'2025-06-05 01:00:23',0,4,111,'N'),(448,'2025-06-05 01:00:23',0,4,112,'N'),(449,'2025-06-05 01:00:23',0,4,113,'N'),(450,'2025-06-05 01:00:23',0,4,114,'N'),(451,'2025-06-05 01:00:23',0,4,115,'N'),(452,'2025-06-05 01:00:23',0,4,116,'N'),(453,'2025-06-05 01:00:23',0,4,117,'N'),(454,'2025-06-05 01:00:23',0,4,118,'N'),(455,'2025-06-05 01:00:23',0,4,119,'N'),(456,'2025-06-05 01:00:23',0,4,120,'Y'),(457,'2025-06-05 01:00:23',0,4,121,'N'),(458,'2025-06-05 01:00:23',0,4,122,'N'),(459,'2025-06-05 01:00:23',0,4,123,'N'),(460,'2025-06-05 01:00:23',0,4,124,'N'),(461,'2025-06-05 01:00:23',0,4,125,'N'),(462,'2025-06-05 01:00:23',0,4,126,'Y'),(463,'2025-06-05 01:00:23',0,4,127,'N'),(464,'2025-06-05 01:00:23',0,4,128,'N'),(465,'2025-06-05 01:00:23',0,4,129,'N'),(466,'2025-06-05 01:00:23',0,4,130,'N'),(467,'2025-06-05 01:00:23',0,4,131,'N'),(468,'2025-06-05 01:00:23',0,4,132,'N'),(469,'2025-06-05 01:00:23',0,4,133,'Y'),(470,'2025-06-05 01:00:23',0,4,134,'Y'),(471,'2025-06-05 01:00:23',0,4,135,'Y'),(472,'2025-06-05 01:00:23',0,4,136,'Y'),(473,'2025-06-05 01:00:23',0,4,137,'Y'),(474,'2025-06-05 01:00:23',0,4,138,'Y'),(475,'2025-06-05 01:00:23',0,4,139,'Y'),(476,'2025-06-05 01:00:23',0,4,140,'Y'),(477,'2025-06-05 01:00:23',0,4,141,'Y'),(478,'2025-06-05 01:00:23',0,4,142,'Y'),(479,'2025-06-05 01:00:23',0,4,143,'Y'),(480,'2025-06-05 01:00:23',0,4,144,'Y'),(481,'2025-06-05 01:00:23',0,4,145,'Y'),(482,'2025-06-05 01:00:23',0,4,146,'Y'),(483,'2025-06-05 01:00:23',0,4,147,'Y'),(484,'2025-06-05 01:00:23',0,4,148,'N'),(485,'2025-06-05 01:00:23',0,4,149,'N'),(486,'2025-06-05 01:00:23',0,4,150,'N'),(487,'2025-06-05 01:00:23',0,4,151,'Y'),(488,'2025-06-05 01:00:23',0,4,152,'N'),(489,'2025-06-05 01:00:23',0,4,153,'N'),(490,'2025-06-05 01:00:23',0,4,154,'N'),(491,'2025-06-05 01:00:23',0,4,155,'N'),(492,'2025-06-05 01:00:23',0,4,156,'N'),(493,'2025-06-05 01:00:23',0,4,157,'Y'),(494,'2025-06-05 01:00:23',0,4,158,'N'),(495,'2025-06-05 01:00:23',0,4,159,'N'),(496,'2025-06-05 01:00:23',0,4,160,'N'),(497,'2025-06-05 01:00:23',0,4,161,'N'),(498,'2025-06-05 01:00:23',0,4,162,'N'),(499,'2025-06-05 01:00:23',0,4,163,'Y'),(500,'2025-06-05 01:00:23',0,4,164,'N'),(501,'2025-06-05 01:00:23',0,4,165,'N'),(502,'2025-06-05 01:00:23',0,4,166,'N'),(503,'2025-06-05 01:00:23',0,4,167,'N'),(504,'2025-06-05 01:00:23',0,4,168,'N'),(505,'2025-06-05 01:00:23',0,5,1,'N'),(506,'2025-06-05 01:00:23',0,5,2,'N'),(507,'2025-06-05 01:00:23',0,5,3,'N'),(508,'2025-06-05 01:00:23',0,5,4,'N'),(509,'2025-06-05 01:00:23',0,5,5,'N'),(510,'2025-06-05 01:00:23',0,5,6,'N'),(511,'2025-06-05 01:00:23',0,5,7,'N'),(512,'2025-06-05 01:00:23',0,5,8,'N'),(513,'2025-06-05 01:00:23',0,5,9,'N'),(514,'2025-06-05 01:00:23',0,5,10,'N'),(515,'2025-06-05 01:00:23',0,5,11,'N'),(516,'2025-06-05 01:00:23',0,5,12,'N'),(517,'2025-06-05 01:00:23',0,5,13,'N'),(518,'2025-06-05 01:00:23',0,5,14,'N'),(519,'2025-06-05 01:00:23',0,5,15,'N'),(520,'2025-06-05 01:00:23',0,5,16,'N'),(521,'2025-06-05 01:00:23',0,5,17,'N'),(522,'2025-06-05 01:00:23',0,5,18,'N'),(523,'2025-06-05 01:00:23',0,5,19,'N'),(524,'2025-06-05 01:00:23',0,5,20,'N'),(525,'2025-06-05 01:00:23',0,5,21,'N'),(526,'2025-06-05 01:00:23',0,5,22,'N'),(527,'2025-06-05 01:00:23',0,5,23,'N'),(528,'2025-06-05 01:00:23',0,5,24,'N'),(529,'2025-06-05 01:00:23',0,5,25,'N'),(530,'2025-06-05 01:00:23',0,5,26,'N'),(531,'2025-06-05 01:00:23',0,5,27,'N'),(532,'2025-06-05 01:00:23',0,5,28,'N'),(533,'2025-06-05 01:00:23',0,5,29,'N'),(534,'2025-06-05 01:00:23',0,5,30,'N'),(535,'2025-06-05 01:00:23',0,5,31,'N'),(536,'2025-06-05 01:00:23',0,5,32,'N'),(537,'2025-06-05 01:00:23',0,5,33,'N'),(538,'2025-06-05 01:00:23',0,5,34,'N'),(539,'2025-06-05 01:00:23',0,5,35,'N'),(540,'2025-06-05 01:00:23',0,5,36,'N'),(541,'2025-06-05 01:00:23',0,5,37,'N'),(542,'2025-06-05 01:00:23',0,5,38,'N'),(543,'2025-06-05 01:00:23',0,5,39,'N'),(544,'2025-06-05 01:00:23',0,5,40,'N'),(545,'2025-06-05 01:00:23',0,5,41,'N'),(546,'2025-06-05 01:00:23',0,5,42,'N'),(547,'2025-06-05 01:00:23',0,5,43,'N'),(548,'2025-06-05 01:00:23',0,5,44,'N'),(549,'2025-06-05 01:00:23',0,5,45,'N'),(550,'2025-06-05 01:00:23',0,5,46,'N'),(551,'2025-06-05 01:00:23',0,5,47,'N'),(552,'2025-06-05 01:00:23',0,5,48,'N'),(553,'2025-06-05 01:00:23',0,5,49,'N'),(554,'2025-06-05 01:00:23',0,5,50,'N'),(555,'2025-06-05 01:00:23',0,5,51,'N'),(556,'2025-06-05 01:00:23',0,5,52,'N'),(557,'2025-06-05 01:00:23',0,5,53,'N'),(558,'2025-06-05 01:00:23',0,5,54,'N'),(559,'2025-06-05 01:00:23',0,5,55,'N'),(560,'2025-06-05 01:00:23',0,5,56,'N'),(561,'2025-06-05 01:00:23',0,5,57,'N'),(562,'2025-06-05 01:00:23',0,5,58,'N'),(563,'2025-06-05 01:00:23',0,5,59,'N'),(564,'2025-06-05 01:00:23',0,5,60,'N'),(565,'2025-06-05 01:00:23',0,5,61,'N'),(566,'2025-06-05 01:00:23',0,5,62,'N'),(567,'2025-06-05 01:00:23',0,5,63,'N'),(568,'2025-06-05 01:00:23',0,5,64,'N'),(569,'2025-06-05 01:00:23',0,5,65,'N'),(570,'2025-06-05 01:00:23',0,5,66,'N'),(571,'2025-06-05 01:00:23',0,5,67,'N'),(572,'2025-06-05 01:00:23',0,5,68,'N'),(573,'2025-06-05 01:00:23',0,5,69,'N'),(574,'2025-06-05 01:00:23',0,5,70,'N'),(575,'2025-06-05 01:00:23',0,5,71,'N'),(576,'2025-06-05 01:00:23',0,5,72,'N'),(577,'2025-06-05 01:00:23',0,5,73,'N'),(578,'2025-06-05 01:00:23',0,5,74,'N'),(579,'2025-06-05 01:00:23',0,5,75,'N'),(580,'2025-06-05 01:00:23',0,5,76,'N'),(581,'2025-06-05 01:00:23',0,5,77,'Y'),(582,'2025-06-05 01:00:23',0,5,78,'Y'),(583,'2025-06-05 01:00:23',0,5,79,'N'),(584,'2025-06-05 01:00:23',0,5,80,'N'),(585,'2025-06-05 01:00:23',0,5,81,'N'),(586,'2025-06-05 01:00:23',0,5,82,'Y'),(587,'2025-06-05 01:00:23',0,5,83,'N'),(588,'2025-06-05 01:00:23',0,5,84,'N'),(589,'2025-06-05 01:00:23',0,5,85,'Y'),(590,'2025-06-05 01:00:23',0,5,86,'Y'),(591,'2025-06-05 01:00:23',0,5,87,'N'),(592,'2025-06-05 01:00:23',0,5,88,'Y'),(593,'2025-06-05 01:00:23',0,5,89,'N'),(594,'2025-06-05 01:00:23',0,5,90,'Y'),(595,'2025-06-05 01:00:23',0,5,91,'Y'),(596,'2025-06-05 01:00:23',0,5,92,'Y'),(597,'2025-06-05 01:00:23',0,5,93,'Y'),(598,'2025-06-05 01:00:23',0,5,94,'N'),(599,'2025-06-05 01:00:23',0,5,95,'Y'),(600,'2025-06-05 01:00:23',0,5,96,'Y'),(601,'2025-06-05 01:00:23',0,5,97,'N'),(602,'2025-06-05 01:00:23',0,5,98,'Y'),(603,'2025-06-05 01:00:23',0,5,99,'N'),(604,'2025-06-05 01:00:23',0,5,100,'Y'),(605,'2025-06-05 01:00:23',0,5,101,'N'),(606,'2025-06-05 01:00:23',0,5,102,'Y'),(607,'2025-06-05 01:00:23',0,5,103,'Y'),(608,'2025-06-05 01:00:23',0,5,104,'N'),(609,'2025-06-05 01:00:23',0,5,105,'N'),(610,'2025-06-05 01:00:23',0,5,106,'Y'),(611,'2025-06-05 01:00:23',0,5,107,'N'),(612,'2025-06-05 01:00:23',0,5,108,'N'),(613,'2025-06-05 01:00:23',0,5,109,'N'),(614,'2025-06-05 01:00:23',0,5,110,'Y'),(615,'2025-06-05 01:00:23',0,5,111,'N'),(616,'2025-06-05 01:00:23',0,5,112,'Y'),(617,'2025-06-05 01:00:23',0,5,113,'N'),(618,'2025-06-05 01:00:23',0,5,114,'N'),(619,'2025-06-05 01:00:23',0,5,115,'Y'),(620,'2025-06-05 01:00:23',0,5,116,'N'),(621,'2025-06-05 01:00:23',0,5,117,'Y'),(622,'2025-06-05 01:00:23',0,5,118,'N'),(623,'2025-06-05 01:00:23',0,5,119,'N'),(624,'2025-06-05 01:00:23',0,5,120,'Y'),(625,'2025-06-05 01:00:23',0,5,121,'N'),(626,'2025-06-05 01:00:23',0,5,122,'Y'),(627,'2025-06-05 01:00:23',0,5,123,'N'),(628,'2025-06-05 01:00:23',0,5,124,'Y'),(629,'2025-06-05 01:00:23',0,5,125,'N'),(630,'2025-06-05 01:00:23',0,5,126,'Y'),(631,'2025-06-05 01:00:23',0,5,127,'Y'),(632,'2025-06-05 01:00:23',0,5,128,'N'),(633,'2025-06-05 01:00:23',0,5,129,'Y'),(634,'2025-06-05 01:00:23',0,5,130,'N'),(635,'2025-06-05 01:00:23',0,5,131,'Y'),(636,'2025-06-05 01:00:23',0,5,132,'N'),(637,'2025-06-05 01:00:23',0,5,133,'Y'),(638,'2025-06-05 01:00:23',0,5,134,'N'),(639,'2025-06-05 01:00:23',0,5,135,'Y'),(640,'2025-06-05 01:00:23',0,5,136,'N'),(641,'2025-06-05 01:00:23',0,5,137,'Y'),(642,'2025-06-05 01:00:23',0,5,138,'Y'),(643,'2025-06-05 01:00:23',0,5,139,'N'),(644,'2025-06-05 01:00:23',0,5,140,'N'),(645,'2025-06-05 01:00:23',0,5,141,'N'),(646,'2025-06-05 01:00:23',0,5,142,'Y'),(647,'2025-06-05 01:00:23',0,5,143,'Y'),(648,'2025-06-05 01:00:23',0,5,144,'Y'),(649,'2025-06-05 01:00:23',0,5,145,'N'),(650,'2025-06-05 01:00:23',0,5,146,'N'),(651,'2025-06-05 01:00:23',0,5,147,'Y'),(652,'2025-06-05 01:00:23',0,5,148,'Y'),(653,'2025-06-05 01:00:23',0,5,149,'Y'),(654,'2025-06-05 01:00:23',0,5,150,'Y'),(655,'2025-06-05 01:00:23',0,5,151,'Y'),(656,'2025-06-05 01:00:23',0,5,152,'N'),(657,'2025-06-05 01:00:23',0,5,153,'Y'),(658,'2025-06-05 01:00:23',0,5,154,'Y'),(659,'2025-06-05 01:00:23',0,5,155,'N'),(660,'2025-06-05 01:00:23',0,5,156,'N'),(661,'2025-06-05 01:00:23',0,5,157,'Y'),(662,'2025-06-05 01:00:23',0,5,158,'N'),(663,'2025-06-05 01:00:23',0,5,159,'Y'),(664,'2025-06-05 01:00:23',0,5,160,'Y'),(665,'2025-06-05 01:00:23',0,5,161,'N'),(666,'2025-06-05 01:00:23',0,5,162,'N'),(667,'2025-06-05 01:00:23',0,5,163,'Y'),(668,'2025-06-05 01:00:23',0,5,164,'N'),(669,'2025-06-05 01:00:23',0,5,165,'Y'),(670,'2025-06-05 01:00:23',0,5,166,'N'),(671,'2025-06-05 01:00:23',0,5,167,'N'),(672,'2025-06-05 01:00:23',0,5,168,'N'),(673,'2025-06-05 01:00:23',0,6,1,'N'),(674,'2025-06-05 01:00:23',0,6,2,'N'),(675,'2025-06-05 01:00:23',0,6,3,'Y'),(676,'2025-06-05 01:00:23',0,6,4,'N'),(677,'2025-06-05 01:00:23',0,6,5,'N'),(678,'2025-06-05 01:00:23',0,6,6,'N'),(679,'2025-06-05 01:00:23',0,6,7,'N'),(680,'2025-06-05 01:00:23',0,6,8,'N'),(681,'2025-06-05 01:00:23',0,6,9,'N'),(682,'2025-06-05 01:00:23',0,6,10,'N'),(683,'2025-06-05 01:00:23',0,6,11,'N'),(684,'2025-06-05 01:00:23',0,6,12,'N'),(685,'2025-06-05 01:00:23',0,6,13,'N'),(686,'2025-06-05 01:00:23',0,6,14,'Y'),(687,'2025-06-05 01:00:23',0,6,15,'Y'),(688,'2025-06-05 01:00:23',0,6,16,'N'),(689,'2025-06-05 01:00:23',0,6,17,'N'),(690,'2025-06-05 01:00:23',0,6,18,'Y'),(691,'2025-06-05 01:00:23',0,6,19,'N'),(692,'2025-06-05 01:00:23',0,6,20,'N'),(693,'2025-06-05 01:00:23',0,6,21,'N'),(694,'2025-06-05 01:00:23',0,6,22,'N'),(695,'2025-06-05 01:00:23',0,6,23,'N'),(696,'2025-06-05 01:00:23',0,6,24,'N'),(697,'2025-06-05 01:00:23',0,6,25,'N'),(698,'2025-06-05 01:00:23',0,6,26,'N'),(699,'2025-06-05 01:00:23',0,6,27,'N'),(700,'2025-06-05 01:00:23',0,6,28,'N'),(701,'2025-06-05 01:00:23',0,6,29,'N'),(702,'2025-06-05 01:00:23',0,6,30,'N'),(703,'2025-06-05 01:00:23',0,6,31,'N'),(704,'2025-06-05 01:00:23',0,6,32,'N'),(705,'2025-06-05 01:00:23',0,6,33,'N'),(706,'2025-06-05 01:00:23',0,6,34,'N'),(707,'2025-06-05 01:00:23',0,6,35,'N'),(708,'2025-06-05 01:00:23',0,6,36,'N'),(709,'2025-06-05 01:00:23',0,6,37,'N'),(710,'2025-06-05 01:00:23',0,6,38,'N'),(711,'2025-06-05 01:00:23',0,6,39,'N'),(712,'2025-06-05 01:00:23',0,6,40,'N'),(713,'2025-06-05 01:00:23',0,6,41,'N'),(714,'2025-06-05 01:00:23',0,6,42,'N'),(715,'2025-06-05 01:00:23',0,6,43,'N'),(716,'2025-06-05 01:00:23',0,6,44,'N'),(717,'2025-06-05 01:00:23',0,6,45,'N'),(718,'2025-06-05 01:00:23',0,6,46,'N'),(719,'2025-06-05 01:00:23',0,6,47,'N'),(720,'2025-06-05 01:00:23',0,6,48,'N'),(721,'2025-06-05 01:00:23',0,6,49,'N'),(722,'2025-06-05 01:00:23',0,6,50,'N'),(723,'2025-06-05 01:00:23',0,6,51,'N'),(724,'2025-06-05 01:00:23',0,6,52,'N'),(725,'2025-06-05 01:00:23',0,6,53,'N'),(726,'2025-06-05 01:00:23',0,6,54,'N'),(727,'2025-06-05 01:00:23',0,6,55,'N'),(728,'2025-06-05 01:00:23',0,6,56,'N'),(729,'2025-06-05 01:00:23',0,6,57,'N'),(730,'2025-06-05 01:00:23',0,6,58,'N'),(731,'2025-06-05 01:00:23',0,6,59,'N'),(732,'2025-06-05 01:00:23',0,6,60,'N'),(733,'2025-06-05 01:00:23',0,6,61,'N'),(734,'2025-06-05 01:00:23',0,6,62,'N'),(735,'2025-06-05 01:00:23',0,6,63,'N'),(736,'2025-06-05 01:00:23',0,6,64,'N'),(737,'2025-06-05 01:00:23',0,6,65,'N'),(738,'2025-06-05 01:00:23',0,6,66,'N'),(739,'2025-06-05 01:00:23',0,6,67,'N'),(740,'2025-06-05 01:00:23',0,6,68,'N'),(741,'2025-06-05 01:00:23',0,6,69,'N'),(742,'2025-06-05 01:00:23',0,6,70,'N'),(743,'2025-06-05 01:00:23',0,6,71,'N'),(744,'2025-06-05 01:00:23',0,6,72,'N'),(745,'2025-06-05 01:00:23',0,6,73,'N'),(746,'2025-06-05 01:00:23',0,6,74,'N'),(747,'2025-06-05 01:00:23',0,6,75,'N'),(748,'2025-06-05 01:00:23',0,6,76,'N'),(749,'2025-06-05 01:00:23',0,6,77,'N'),(750,'2025-06-05 01:00:23',0,6,78,'N'),(751,'2025-06-05 01:00:23',0,6,79,'N'),(752,'2025-06-05 01:00:23',0,6,80,'N'),(753,'2025-06-05 01:00:23',0,6,81,'N'),(754,'2025-06-05 01:00:23',0,6,82,'N'),(755,'2025-06-05 01:00:23',0,6,83,'N'),(756,'2025-06-05 01:00:23',0,6,84,'N'),(757,'2025-06-05 01:00:23',0,6,85,'N'),(758,'2025-06-05 01:00:23',0,6,86,'N'),(759,'2025-06-05 01:00:23',0,6,87,'N'),(760,'2025-06-05 01:00:23',0,6,88,'N'),(761,'2025-06-05 01:00:23',0,6,89,'N'),(762,'2025-06-05 01:00:23',0,6,90,'N'),(763,'2025-06-05 01:00:23',0,6,91,'N'),(764,'2025-06-05 01:00:23',0,6,92,'N'),(765,'2025-06-05 01:00:23',0,6,93,'N'),(766,'2025-06-05 01:00:23',0,6,94,'N'),(767,'2025-06-05 01:00:23',0,6,95,'N'),(768,'2025-06-05 01:00:23',0,6,96,'N'),(769,'2025-06-05 01:00:23',0,6,97,'N'),(770,'2025-06-05 01:00:23',0,6,98,'N'),(771,'2025-06-05 01:00:23',0,6,99,'N'),(772,'2025-06-05 01:00:23',0,6,100,'N'),(773,'2025-06-05 01:00:23',0,6,101,'N'),(774,'2025-06-05 01:00:23',0,6,102,'N'),(775,'2025-06-05 01:00:23',0,6,103,'N'),(776,'2025-06-05 01:00:23',0,6,104,'N'),(777,'2025-06-05 01:00:23',0,6,105,'N'),(778,'2025-06-05 01:00:23',0,6,106,'N'),(779,'2025-06-05 01:00:23',0,6,107,'N'),(780,'2025-06-05 01:00:23',0,6,108,'N'),(781,'2025-06-05 01:00:23',0,6,109,'N'),(782,'2025-06-05 01:00:23',0,6,110,'N'),(783,'2025-06-05 01:00:23',0,6,111,'N'),(784,'2025-06-05 01:00:23',0,6,112,'N'),(785,'2025-06-05 01:00:23',0,6,113,'N'),(786,'2025-06-05 01:00:23',0,6,114,'N'),(787,'2025-06-05 01:00:23',0,6,115,'N'),(788,'2025-06-05 01:00:23',0,6,116,'N'),(789,'2025-06-05 01:00:23',0,6,117,'N'),(790,'2025-06-05 01:00:23',0,6,118,'N'),(791,'2025-06-05 01:00:23',0,6,119,'N'),(792,'2025-06-05 01:00:23',0,6,120,'N'),(793,'2025-06-05 01:00:23',0,6,121,'N'),(794,'2025-06-05 01:00:23',0,6,122,'N'),(795,'2025-06-05 01:00:23',0,6,123,'N'),(796,'2025-06-05 01:00:23',0,6,124,'N'),(797,'2025-06-05 01:00:23',0,6,125,'N'),(798,'2025-06-05 01:00:23',0,6,126,'N'),(799,'2025-06-05 01:00:23',0,6,127,'N'),(800,'2025-06-05 01:00:23',0,6,128,'N'),(801,'2025-06-05 01:00:23',0,6,129,'N'),(802,'2025-06-05 01:00:23',0,6,130,'N'),(803,'2025-06-05 01:00:23',0,6,131,'N'),(804,'2025-06-05 01:00:23',0,6,132,'N'),(805,'2025-06-05 01:00:23',0,6,133,'N'),(806,'2025-06-05 01:00:23',0,6,134,'N'),(807,'2025-06-05 01:00:23',0,6,135,'N'),(808,'2025-06-05 01:00:23',0,6,136,'N'),(809,'2025-06-05 01:00:23',0,6,137,'N'),(810,'2025-06-05 01:00:23',0,6,138,'N'),(811,'2025-06-05 01:00:23',0,6,139,'N'),(812,'2025-06-05 01:00:23',0,6,140,'N'),(813,'2025-06-05 01:00:23',0,6,141,'N'),(814,'2025-06-05 01:00:23',0,6,142,'N'),(815,'2025-06-05 01:00:23',0,6,143,'N'),(816,'2025-06-05 01:00:23',0,6,144,'N'),(817,'2025-06-05 01:00:23',0,6,145,'N'),(818,'2025-06-05 01:00:23',0,6,146,'N'),(819,'2025-06-05 01:00:23',0,6,147,'N'),(820,'2025-06-05 01:00:23',0,6,148,'N'),(821,'2025-06-05 01:00:23',0,6,149,'N'),(822,'2025-06-05 01:00:23',0,6,150,'N'),(823,'2025-06-05 01:00:23',0,6,151,'N'),(824,'2025-06-05 01:00:23',0,6,152,'N'),(825,'2025-06-05 01:00:23',0,6,153,'N'),(826,'2025-06-05 01:00:23',0,6,154,'N'),(827,'2025-06-05 01:00:23',0,6,155,'N'),(828,'2025-06-05 01:00:23',0,6,156,'N'),(829,'2025-06-05 01:00:23',0,6,157,'N'),(830,'2025-06-05 01:00:23',0,6,158,'N'),(831,'2025-06-05 01:00:23',0,6,159,'N'),(832,'2025-06-05 01:00:23',0,6,160,'N'),(833,'2025-06-05 01:00:23',0,6,161,'N'),(834,'2025-06-05 01:00:23',0,6,162,'N'),(835,'2025-06-05 01:00:23',0,6,163,'N'),(836,'2025-06-05 01:00:23',0,6,164,'N'),(837,'2025-06-05 01:00:23',0,6,165,'N'),(838,'2025-06-05 01:00:23',0,6,166,'N'),(839,'2025-06-05 01:00:23',0,6,167,'N'),(840,'2025-06-05 01:00:23',0,6,168,'N'),(841,'2025-06-05 01:00:23',0,7,1,'N'),(842,'2025-06-05 01:00:23',0,7,2,'N'),(843,'2025-06-05 01:00:23',0,7,3,'Y'),(844,'2025-06-05 01:00:23',0,7,4,'N'),(845,'2025-06-05 01:00:23',0,7,5,'N'),(846,'2025-06-05 01:00:23',0,7,6,'N'),(847,'2025-06-05 01:00:23',0,7,7,'N'),(848,'2025-06-05 01:00:23',0,7,8,'N'),(849,'2025-06-05 01:00:23',0,7,9,'N'),(850,'2025-06-05 01:00:23',0,7,10,'N'),(851,'2025-06-05 01:00:23',0,7,11,'N'),(852,'2025-06-05 01:00:23',0,7,12,'N'),(853,'2025-06-05 01:00:23',0,7,13,'N'),(854,'2025-06-05 01:00:23',0,7,14,'Y'),(855,'2025-06-05 01:00:23',0,7,15,'N'),(856,'2025-06-05 01:00:23',0,7,16,'N'),(857,'2025-06-05 01:00:23',0,7,17,'N'),(858,'2025-06-05 01:00:23',0,7,18,'Y'),(859,'2025-06-05 01:00:23',0,7,19,'N'),(860,'2025-06-05 01:00:23',0,7,20,'N'),(861,'2025-06-05 01:00:23',0,7,21,'N'),(862,'2025-06-05 01:00:23',0,7,22,'N'),(863,'2025-06-05 01:00:23',0,7,23,'N'),(864,'2025-06-05 01:00:23',0,7,24,'N'),(865,'2025-06-05 01:00:23',0,7,25,'N'),(866,'2025-06-05 01:00:23',0,7,26,'N'),(867,'2025-06-05 01:00:23',0,7,27,'N'),(868,'2025-06-05 01:00:23',0,7,28,'N'),(869,'2025-06-05 01:00:23',0,7,29,'N'),(870,'2025-06-05 01:00:23',0,7,30,'N'),(871,'2025-06-05 01:00:23',0,7,31,'N'),(872,'2025-06-05 01:00:23',0,7,32,'N'),(873,'2025-06-05 01:00:23',0,7,33,'N'),(874,'2025-06-05 01:00:23',0,7,34,'N'),(875,'2025-06-05 01:00:23',0,7,35,'N'),(876,'2025-06-05 01:00:23',0,7,36,'N'),(877,'2025-06-05 01:00:23',0,7,37,'N'),(878,'2025-06-05 01:00:23',0,7,38,'N'),(879,'2025-06-05 01:00:23',0,7,39,'N'),(880,'2025-06-05 01:00:23',0,7,40,'N'),(881,'2025-06-05 01:00:23',0,7,41,'N'),(882,'2025-06-05 01:00:23',0,7,42,'N'),(883,'2025-06-05 01:00:23',0,7,43,'N'),(884,'2025-06-05 01:00:23',0,7,44,'N'),(885,'2025-06-05 01:00:23',0,7,45,'N'),(886,'2025-06-05 01:00:23',0,7,46,'N'),(887,'2025-06-05 01:00:23',0,7,47,'N'),(888,'2025-06-05 01:00:23',0,7,48,'N'),(889,'2025-06-05 01:00:23',0,7,49,'N'),(890,'2025-06-05 01:00:23',0,7,50,'N'),(891,'2025-06-05 01:00:23',0,7,51,'N'),(892,'2025-06-05 01:00:23',0,7,52,'N'),(893,'2025-06-05 01:00:23',0,7,53,'N'),(894,'2025-06-05 01:00:23',0,7,54,'N'),(895,'2025-06-05 01:00:23',0,7,55,'N'),(896,'2025-06-05 01:00:23',0,7,56,'N'),(897,'2025-06-05 01:00:23',0,7,57,'N'),(898,'2025-06-05 01:00:23',0,7,58,'N'),(899,'2025-06-05 01:00:23',0,7,59,'N'),(900,'2025-06-05 01:00:23',0,7,60,'N'),(901,'2025-06-05 01:00:23',0,7,61,'N'),(902,'2025-06-05 01:00:23',0,7,62,'N'),(903,'2025-06-05 01:00:23',0,7,63,'N'),(904,'2025-06-05 01:00:23',0,7,64,'N'),(905,'2025-06-05 01:00:23',0,7,65,'N'),(906,'2025-06-05 01:00:23',0,7,66,'N'),(907,'2025-06-05 01:00:23',0,7,67,'N'),(908,'2025-06-05 01:00:23',0,7,68,'N'),(909,'2025-06-05 01:00:23',0,7,69,'N'),(910,'2025-06-05 01:00:23',0,7,70,'N'),(911,'2025-06-05 01:00:23',0,7,71,'N'),(912,'2025-06-05 01:00:23',0,7,72,'N'),(913,'2025-06-05 01:00:23',0,7,73,'N'),(914,'2025-06-05 01:00:23',0,7,74,'N'),(915,'2025-06-05 01:00:23',0,7,75,'N'),(916,'2025-06-05 01:00:23',0,7,76,'N'),(917,'2025-06-05 01:00:23',0,7,77,'N'),(918,'2025-06-05 01:00:23',0,7,78,'N'),(919,'2025-06-05 01:00:23',0,7,79,'N'),(920,'2025-06-05 01:00:23',0,7,80,'N'),(921,'2025-06-05 01:00:23',0,7,81,'N'),(922,'2025-06-05 01:00:23',0,7,82,'N'),(923,'2025-06-05 01:00:23',0,7,83,'N'),(924,'2025-06-05 01:00:23',0,7,84,'N'),(925,'2025-06-05 01:00:23',0,7,85,'N'),(926,'2025-06-05 01:00:23',0,7,86,'N'),(927,'2025-06-05 01:00:23',0,7,87,'N'),(928,'2025-06-05 01:00:23',0,7,88,'N'),(929,'2025-06-05 01:00:23',0,7,89,'N'),(930,'2025-06-05 01:00:23',0,7,90,'N'),(931,'2025-06-05 01:00:23',0,7,91,'N'),(932,'2025-06-05 01:00:23',0,7,92,'N'),(933,'2025-06-05 01:00:23',0,7,93,'N'),(934,'2025-06-05 01:00:23',0,7,94,'N'),(935,'2025-06-05 01:00:23',0,7,95,'N'),(936,'2025-06-05 01:00:23',0,7,96,'N'),(937,'2025-06-05 01:00:23',0,7,97,'N'),(938,'2025-06-05 01:00:23',0,7,98,'N'),(939,'2025-06-05 01:00:23',0,7,99,'N'),(940,'2025-06-05 01:00:23',0,7,100,'N'),(941,'2025-06-05 01:00:23',0,7,101,'N'),(942,'2025-06-05 01:00:23',0,7,102,'N'),(943,'2025-06-05 01:00:23',0,7,103,'N'),(944,'2025-06-05 01:00:23',0,7,104,'N'),(945,'2025-06-05 01:00:23',0,7,105,'N'),(946,'2025-06-05 01:00:23',0,7,106,'N'),(947,'2025-06-05 01:00:23',0,7,107,'N'),(948,'2025-06-05 01:00:23',0,7,108,'N'),(949,'2025-06-05 01:00:23',0,7,109,'N'),(950,'2025-06-05 01:00:23',0,7,110,'N'),(951,'2025-06-05 01:00:23',0,7,111,'N'),(952,'2025-06-05 01:00:23',0,7,112,'N'),(953,'2025-06-05 01:00:23',0,7,113,'N'),(954,'2025-06-05 01:00:23',0,7,114,'N'),(955,'2025-06-05 01:00:23',0,7,115,'N'),(956,'2025-06-05 01:00:23',0,7,116,'N'),(957,'2025-06-05 01:00:23',0,7,117,'N'),(958,'2025-06-05 01:00:23',0,7,118,'N'),(959,'2025-06-05 01:00:23',0,7,119,'N'),(960,'2025-06-05 01:00:23',0,7,120,'N'),(961,'2025-06-05 01:00:23',0,7,121,'N'),(962,'2025-06-05 01:00:23',0,7,122,'N'),(963,'2025-06-05 01:00:23',0,7,123,'N'),(964,'2025-06-05 01:00:23',0,7,124,'N'),(965,'2025-06-05 01:00:23',0,7,125,'N'),(966,'2025-06-05 01:00:23',0,7,126,'N'),(967,'2025-06-05 01:00:23',0,7,127,'N'),(968,'2025-06-05 01:00:23',0,7,128,'N'),(969,'2025-06-05 01:00:23',0,7,129,'N'),(970,'2025-06-05 01:00:23',0,7,130,'N'),(971,'2025-06-05 01:00:23',0,7,131,'N'),(972,'2025-06-05 01:00:23',0,7,132,'N'),(973,'2025-06-05 01:00:23',0,7,133,'N'),(974,'2025-06-05 01:00:23',0,7,134,'N'),(975,'2025-06-05 01:00:23',0,7,135,'N'),(976,'2025-06-05 01:00:23',0,7,136,'N'),(977,'2025-06-05 01:00:23',0,7,137,'N'),(978,'2025-06-05 01:00:23',0,7,138,'N'),(979,'2025-06-05 01:00:23',0,7,139,'N'),(980,'2025-06-05 01:00:23',0,7,140,'N'),(981,'2025-06-05 01:00:23',0,7,141,'N'),(982,'2025-06-05 01:00:23',0,7,142,'N'),(983,'2025-06-05 01:00:23',0,7,143,'Y'),(984,'2025-06-05 01:00:23',0,7,144,'Y'),(985,'2025-06-05 01:00:23',0,7,145,'Y'),(986,'2025-06-05 01:00:23',0,7,146,'Y'),(987,'2025-06-05 01:00:23',0,7,147,'N'),(988,'2025-06-05 01:00:23',0,7,148,'N'),(989,'2025-06-05 01:00:23',0,7,149,'N'),(990,'2025-06-05 01:00:23',0,7,150,'N'),(991,'2025-06-05 01:00:23',0,7,151,'N'),(992,'2025-06-05 01:00:23',0,7,152,'N'),(993,'2025-06-05 01:00:23',0,7,153,'N'),(994,'2025-06-05 01:00:23',0,7,154,'N'),(995,'2025-06-05 01:00:23',0,7,155,'N'),(996,'2025-06-05 01:00:23',0,7,156,'N'),(997,'2025-06-05 01:00:23',0,7,157,'N'),(998,'2025-06-05 01:00:23',0,7,158,'N'),(999,'2025-06-05 01:00:23',0,7,159,'N'),(1000,'2025-06-05 01:00:23',0,7,160,'N'),(1001,'2025-06-05 01:00:23',0,7,161,'N'),(1002,'2025-06-05 01:00:23',0,7,162,'N'),(1003,'2025-06-05 01:00:23',0,7,163,'N'),(1004,'2025-06-05 01:00:23',0,7,164,'N'),(1005,'2025-06-05 01:00:23',0,7,165,'N'),(1006,'2025-06-05 01:00:23',0,7,166,'N'),(1007,'2025-06-05 01:00:23',0,7,167,'N'),(1008,'2025-06-05 01:00:23',0,7,168,'N'),(1009,'2025-06-05 01:00:23',0,8,1,'N'),(1010,'2025-06-05 01:00:23',0,8,2,'N'),(1011,'2025-06-05 01:00:23',0,8,3,'N'),(1012,'2025-06-05 01:00:23',0,8,4,'N'),(1013,'2025-06-05 01:00:23',0,8,5,'N'),(1014,'2025-06-05 01:00:23',0,8,6,'N'),(1015,'2025-06-05 01:00:23',0,8,7,'N'),(1016,'2025-06-05 01:00:23',0,8,8,'N'),(1017,'2025-06-05 01:00:23',0,8,9,'N'),(1018,'2025-06-05 01:00:23',0,8,10,'N'),(1019,'2025-06-05 01:00:23',0,8,11,'N'),(1020,'2025-06-05 01:00:23',0,8,12,'N'),(1021,'2025-06-05 01:00:23',0,8,13,'N'),(1022,'2025-06-05 01:00:23',0,8,14,'N'),(1023,'2025-06-05 01:00:23',0,8,15,'N'),(1024,'2025-06-05 01:00:23',0,8,16,'N'),(1025,'2025-06-05 01:00:23',0,8,17,'N'),(1026,'2025-06-05 01:00:23',0,8,18,'N'),(1027,'2025-06-05 01:00:23',0,8,19,'N'),(1028,'2025-06-05 01:00:23',0,8,20,'N'),(1029,'2025-06-05 01:00:23',0,8,21,'N'),(1030,'2025-06-05 01:00:23',0,8,22,'N'),(1031,'2025-06-05 01:00:23',0,8,23,'N'),(1032,'2025-06-05 01:00:23',0,8,24,'N'),(1033,'2025-06-05 01:00:23',0,8,25,'N'),(1034,'2025-06-05 01:00:23',0,8,26,'N'),(1035,'2025-06-05 01:00:23',0,8,27,'N'),(1036,'2025-06-05 01:00:23',0,8,28,'N'),(1037,'2025-06-05 01:00:23',0,8,29,'N'),(1038,'2025-06-05 01:00:23',0,8,30,'N'),(1039,'2025-06-05 01:00:23',0,8,31,'N'),(1040,'2025-06-05 01:00:23',0,8,32,'N'),(1041,'2025-06-05 01:00:23',0,8,33,'N'),(1042,'2025-06-05 01:00:23',0,8,34,'N'),(1043,'2025-06-05 01:00:23',0,8,35,'N'),(1044,'2025-06-05 01:00:23',0,8,36,'N'),(1045,'2025-06-05 01:00:23',0,8,37,'N'),(1046,'2025-06-05 01:00:23',0,8,38,'N'),(1047,'2025-06-05 01:00:23',0,8,39,'N'),(1048,'2025-06-05 01:00:23',0,8,40,'N'),(1049,'2025-06-05 01:00:23',0,8,41,'N'),(1050,'2025-06-05 01:00:23',0,8,42,'N'),(1051,'2025-06-05 01:00:23',0,8,43,'N'),(1052,'2025-06-05 01:00:23',0,8,44,'N'),(1053,'2025-06-05 01:00:23',0,8,45,'N'),(1054,'2025-06-05 01:00:23',0,8,46,'N'),(1055,'2025-06-05 01:00:23',0,8,47,'N'),(1056,'2025-06-05 01:00:23',0,8,48,'N'),(1057,'2025-06-05 01:00:23',0,8,49,'N'),(1058,'2025-06-05 01:00:23',0,8,50,'N'),(1059,'2025-06-05 01:00:23',0,8,51,'N'),(1060,'2025-06-05 01:00:23',0,8,52,'N'),(1061,'2025-06-05 01:00:23',0,8,53,'N'),(1062,'2025-06-05 01:00:23',0,8,54,'N'),(1063,'2025-06-05 01:00:23',0,8,55,'N'),(1064,'2025-06-05 01:00:23',0,8,56,'N'),(1065,'2025-06-05 01:00:23',0,8,57,'N'),(1066,'2025-06-05 01:00:23',0,8,58,'N'),(1067,'2025-06-05 01:00:23',0,8,59,'N'),(1068,'2025-06-05 01:00:23',0,8,60,'N'),(1069,'2025-06-05 01:00:23',0,8,61,'N'),(1070,'2025-06-05 01:00:23',0,8,62,'N'),(1071,'2025-06-05 01:00:23',0,8,63,'N'),(1072,'2025-06-05 01:00:23',0,8,64,'N'),(1073,'2025-06-05 01:00:23',0,8,65,'N'),(1074,'2025-06-05 01:00:23',0,8,66,'N'),(1075,'2025-06-05 01:00:23',0,8,67,'N'),(1076,'2025-06-05 01:00:23',0,8,68,'N'),(1077,'2025-06-05 01:00:23',0,8,69,'N'),(1078,'2025-06-05 01:00:23',0,8,70,'N'),(1079,'2025-06-05 01:00:23',0,8,71,'N'),(1080,'2025-06-05 01:00:23',0,8,72,'N'),(1081,'2025-06-05 01:00:23',0,8,73,'N'),(1082,'2025-06-05 01:00:23',0,8,74,'N'),(1083,'2025-06-05 01:00:23',0,8,75,'N'),(1084,'2025-06-05 01:00:23',0,8,76,'N'),(1085,'2025-06-05 01:00:23',0,8,77,'Y'),(1086,'2025-06-05 01:00:23',0,8,78,'Y'),(1087,'2025-06-05 01:00:23',0,8,79,'N'),(1088,'2025-06-05 01:00:23',0,8,80,'N'),(1089,'2025-06-05 01:00:23',0,8,81,'N'),(1090,'2025-06-05 01:00:23',0,8,82,'Y'),(1091,'2025-06-05 01:00:23',0,8,83,'Y'),(1092,'2025-06-05 01:00:23',0,8,84,'Y'),(1093,'2025-06-05 01:00:23',0,8,85,'Y'),(1094,'2025-06-05 01:00:23',0,8,86,'Y'),(1095,'2025-06-05 01:00:23',0,8,87,'Y'),(1096,'2025-06-05 01:00:23',0,8,88,'Y'),(1097,'2025-06-05 01:00:23',0,8,89,'Y'),(1098,'2025-06-05 01:00:23',0,8,90,'Y'),(1099,'2025-06-05 01:00:23',0,8,91,'Y'),(1100,'2025-06-05 01:00:23',0,8,92,'Y'),(1101,'2025-06-05 01:00:23',0,8,93,'Y'),(1102,'2025-06-05 01:00:23',0,8,94,'Y'),(1103,'2025-06-05 01:00:23',0,8,95,'Y'),(1104,'2025-06-05 01:00:23',0,8,96,'Y'),(1105,'2025-06-05 01:00:23',0,8,97,'Y'),(1106,'2025-06-05 01:00:23',0,8,98,'Y'),(1107,'2025-06-05 01:00:23',0,8,99,'Y'),(1108,'2025-06-05 01:00:23',0,8,100,'Y'),(1109,'2025-06-05 01:00:23',0,8,101,'Y'),(1110,'2025-06-05 01:00:23',0,8,102,'Y'),(1111,'2025-06-05 01:00:23',0,8,103,'Y'),(1112,'2025-06-05 01:00:23',0,8,104,'Y'),(1113,'2025-06-05 01:00:23',0,8,105,'Y'),(1114,'2025-06-05 01:00:23',0,8,106,'Y'),(1115,'2025-06-05 01:00:23',0,8,107,'Y'),(1116,'2025-06-05 01:00:23',0,8,108,'Y'),(1117,'2025-06-05 01:00:23',0,8,109,'Y'),(1118,'2025-06-05 01:00:23',0,8,110,'Y'),(1119,'2025-06-05 01:00:23',0,8,111,'Y'),(1120,'2025-06-05 01:00:23',0,8,112,'Y'),(1121,'2025-06-05 01:00:23',0,8,113,'Y'),(1122,'2025-06-05 01:00:23',0,8,114,'Y'),(1123,'2025-06-05 01:00:23',0,8,115,'Y'),(1124,'2025-06-05 01:00:23',0,8,116,'Y'),(1125,'2025-06-05 01:00:23',0,8,117,'Y'),(1126,'2025-06-05 01:00:23',0,8,118,'Y'),(1127,'2025-06-05 01:00:23',0,8,119,'Y'),(1128,'2025-06-05 01:00:23',0,8,120,'Y'),(1129,'2025-06-05 01:00:23',0,8,121,'Y'),(1130,'2025-06-05 01:00:23',0,8,122,'Y'),(1131,'2025-06-05 01:00:23',0,8,123,'Y'),(1132,'2025-06-05 01:00:23',0,8,124,'Y'),(1133,'2025-06-05 01:00:23',0,8,125,'Y'),(1134,'2025-06-05 01:00:23',0,8,126,'Y'),(1135,'2025-06-05 01:00:23',0,8,127,'Y'),(1136,'2025-06-05 01:00:23',0,8,128,'Y'),(1137,'2025-06-05 01:00:23',0,8,129,'Y'),(1138,'2025-06-05 01:00:23',0,8,130,'Y'),(1139,'2025-06-05 01:00:23',0,8,131,'Y'),(1140,'2025-06-05 01:00:23',0,8,132,'Y'),(1141,'2025-06-05 01:00:23',0,8,133,'Y'),(1142,'2025-06-05 01:00:23',0,8,134,'N'),(1143,'2025-06-05 01:00:23',0,8,135,'N'),(1144,'2025-06-05 01:00:23',0,8,136,'N'),(1145,'2025-06-05 01:00:23',0,8,137,'N'),(1146,'2025-06-05 01:00:23',0,8,138,'N'),(1147,'2025-06-05 01:00:23',0,8,139,'N'),(1148,'2025-06-05 01:00:23',0,8,140,'N'),(1149,'2025-06-05 01:00:23',0,8,141,'N'),(1150,'2025-06-05 01:00:23',0,8,142,'N'),(1151,'2025-06-05 01:00:23',0,8,143,'Y'),(1152,'2025-06-05 01:00:23',0,8,144,'Y'),(1153,'2025-06-05 01:00:23',0,8,145,'Y'),(1154,'2025-06-05 01:00:23',0,8,146,'Y'),(1155,'2025-06-05 01:00:23',0,8,147,'Y'),(1156,'2025-06-05 01:00:23',0,8,148,'Y'),(1157,'2025-06-05 01:00:23',0,8,149,'Y'),(1158,'2025-06-05 01:00:23',0,8,150,'Y'),(1159,'2025-06-05 01:00:23',0,8,151,'Y'),(1160,'2025-06-05 01:00:23',0,8,152,'Y'),(1161,'2025-06-05 01:00:23',0,8,153,'Y'),(1162,'2025-06-05 01:00:23',0,8,154,'Y'),(1163,'2025-06-05 01:00:23',0,8,155,'Y'),(1164,'2025-06-05 01:00:23',0,8,156,'Y'),(1165,'2025-06-05 01:00:23',0,8,157,'Y'),(1166,'2025-06-05 01:00:23',0,8,158,'Y'),(1167,'2025-06-05 01:00:23',0,8,159,'Y'),(1168,'2025-06-05 01:00:23',0,8,160,'Y'),(1169,'2025-06-05 01:00:23',0,8,161,'Y'),(1170,'2025-06-05 01:00:23',0,8,162,'Y'),(1171,'2025-06-05 01:00:23',0,8,163,'Y'),(1172,'2025-06-05 01:00:23',0,8,164,'Y'),(1173,'2025-06-05 01:00:23',0,8,165,'Y'),(1174,'2025-06-05 01:00:23',0,8,166,'Y'),(1175,'2025-06-05 01:00:23',0,8,167,'Y'),(1176,'2025-06-05 01:00:23',0,8,168,'Y'),(1177,'2025-06-05 01:00:23',0,9,1,'N'),(1178,'2025-06-05 01:00:23',0,9,2,'N'),(1179,'2025-06-05 01:00:23',0,9,3,'Y'),(1180,'2025-06-05 01:00:23',0,9,4,'N'),(1181,'2025-06-05 01:00:23',0,9,5,'N'),(1182,'2025-06-05 01:00:23',0,9,6,'N'),(1183,'2025-06-05 01:00:23',0,9,7,'N'),(1184,'2025-06-05 01:00:23',0,9,8,'N'),(1185,'2025-06-05 01:00:23',0,9,9,'N'),(1186,'2025-06-05 01:00:23',0,9,10,'Y'),(1187,'2025-06-05 01:00:23',0,9,11,'Y'),(1188,'2025-06-05 01:00:23',0,9,12,'Y'),(1189,'2025-06-05 01:00:23',0,9,13,'N'),(1190,'2025-06-05 01:00:23',0,9,14,'N'),(1191,'2025-06-05 01:00:23',0,9,15,'N'),(1192,'2025-06-05 01:00:23',0,9,16,'N'),(1193,'2025-06-05 01:00:23',0,9,17,'N'),(1194,'2025-06-05 01:00:23',0,9,18,'Y'),(1195,'2025-06-05 01:00:23',0,9,19,'Y'),(1196,'2025-06-05 01:00:23',0,9,20,'Y'),(1197,'2025-06-05 01:00:23',0,9,21,'Y'),(1198,'2025-06-05 01:00:23',0,9,22,'Y'),(1199,'2025-06-05 01:00:23',0,9,23,'N'),(1200,'2025-06-05 01:00:23',0,9,24,'N'),(1201,'2025-06-05 01:00:23',0,9,25,'N'),(1202,'2025-06-05 01:00:23',0,9,26,'Y'),(1203,'2025-06-05 01:00:23',0,9,27,'Y'),(1204,'2025-06-05 01:00:23',0,9,28,'Y'),(1205,'2025-06-05 01:00:23',0,9,29,'Y'),(1206,'2025-06-05 01:00:23',0,9,30,'Y'),(1207,'2025-06-05 01:00:23',0,9,31,'Y'),(1208,'2025-06-05 01:00:23',0,9,32,'Y'),(1209,'2025-06-05 01:00:23',0,9,33,'Y'),(1210,'2025-06-05 01:00:23',0,9,34,'Y'),(1211,'2025-06-05 01:00:23',0,9,35,'Y'),(1212,'2025-06-05 01:00:23',0,9,36,'Y'),(1213,'2025-06-05 01:00:23',0,9,37,'Y'),(1214,'2025-06-05 01:00:23',0,9,38,'N'),(1215,'2025-06-05 01:00:23',0,9,39,'N'),(1216,'2025-06-05 01:00:23',0,9,40,'N'),(1217,'2025-06-05 01:00:23',0,9,41,'N'),(1218,'2025-06-05 01:00:23',0,9,42,'N'),(1219,'2025-06-05 01:00:23',0,9,43,'N'),(1220,'2025-06-05 01:00:23',0,9,44,'N'),(1221,'2025-06-05 01:00:23',0,9,45,'N'),(1222,'2025-06-05 01:00:23',0,9,46,'N'),(1223,'2025-06-05 01:00:23',0,9,47,'N'),(1224,'2025-06-05 01:00:23',0,9,48,'N'),(1225,'2025-06-05 01:00:23',0,9,49,'N'),(1226,'2025-06-05 01:00:23',0,9,50,'N'),(1227,'2025-06-05 01:00:23',0,9,51,'N'),(1228,'2025-06-05 01:00:23',0,9,52,'N'),(1229,'2025-06-05 01:00:23',0,9,53,'N'),(1230,'2025-06-05 01:00:23',0,9,54,'N'),(1231,'2025-06-05 01:00:23',0,9,55,'N'),(1232,'2025-06-05 01:00:23',0,9,56,'N'),(1233,'2025-06-05 01:00:23',0,9,57,'N'),(1234,'2025-06-05 01:00:23',0,9,58,'N'),(1235,'2025-06-05 01:00:23',0,9,59,'N'),(1236,'2025-06-05 01:00:23',0,9,60,'N'),(1237,'2025-06-05 01:00:23',0,9,61,'N'),(1238,'2025-06-05 01:00:23',0,9,62,'N'),(1239,'2025-06-05 01:00:23',0,9,63,'N'),(1240,'2025-06-05 01:00:23',0,9,64,'N'),(1241,'2025-06-05 01:00:23',0,9,65,'N'),(1242,'2025-06-05 01:00:23',0,9,66,'N'),(1243,'2025-06-05 01:00:23',0,9,67,'N'),(1244,'2025-06-05 01:00:23',0,9,68,'N'),(1245,'2025-06-05 01:00:23',0,9,69,'N'),(1246,'2025-06-05 01:00:23',0,9,70,'N'),(1247,'2025-06-05 01:00:23',0,9,71,'N'),(1248,'2025-06-05 01:00:23',0,9,72,'N'),(1249,'2025-06-05 01:00:23',0,9,73,'N'),(1250,'2025-06-05 01:00:23',0,9,74,'N'),(1251,'2025-06-05 01:00:23',0,9,75,'N'),(1252,'2025-06-05 01:00:23',0,9,76,'N'),(1253,'2025-06-05 01:00:23',0,9,77,'N'),(1254,'2025-06-05 01:00:23',0,9,78,'Y'),(1255,'2025-06-05 01:00:23',0,9,79,'N'),(1256,'2025-06-05 01:00:23',0,9,80,'N'),(1257,'2025-06-05 01:00:23',0,9,81,'N'),(1258,'2025-06-05 01:00:23',0,9,82,'Y'),(1259,'2025-06-05 01:00:23',0,9,83,'N'),(1260,'2025-06-05 01:00:23',0,9,84,'N'),(1261,'2025-06-05 01:00:23',0,9,85,'N'),(1262,'2025-06-05 01:00:23',0,9,86,'Y'),(1263,'2025-06-05 01:00:23',0,9,87,'Y'),(1264,'2025-06-05 01:00:23',0,9,88,'Y'),(1265,'2025-06-05 01:00:23',0,9,89,'Y'),(1266,'2025-06-05 01:00:23',0,9,90,'Y'),(1267,'2025-06-05 01:00:23',0,9,91,'Y'),(1268,'2025-06-05 01:00:23',0,9,92,'N'),(1269,'2025-06-05 01:00:23',0,9,93,'N'),(1270,'2025-06-05 01:00:23',0,9,94,'N'),(1271,'2025-06-05 01:00:23',0,9,95,'N'),(1272,'2025-06-05 01:00:23',0,9,96,'Y'),(1273,'2025-06-05 01:00:23',0,9,97,'N'),(1274,'2025-06-05 01:00:23',0,9,98,'N'),(1275,'2025-06-05 01:00:23',0,9,99,'N'),(1276,'2025-06-05 01:00:23',0,9,100,'N'),(1277,'2025-06-05 01:00:23',0,9,101,'N'),(1278,'2025-06-05 01:00:23',0,9,102,'N'),(1279,'2025-06-05 01:00:23',0,9,103,'N'),(1280,'2025-06-05 01:00:23',0,9,104,'N'),(1281,'2025-06-05 01:00:23',0,9,105,'N'),(1282,'2025-06-05 01:00:23',0,9,106,'N'),(1283,'2025-06-05 01:00:23',0,9,107,'N'),(1284,'2025-06-05 01:00:23',0,9,108,'N'),(1285,'2025-06-05 01:00:23',0,9,109,'N'),(1286,'2025-06-05 01:00:23',0,9,110,'N'),(1287,'2025-06-05 01:00:23',0,9,111,'N'),(1288,'2025-06-05 01:00:23',0,9,112,'N'),(1289,'2025-06-05 01:00:23',0,9,113,'N'),(1290,'2025-06-05 01:00:23',0,9,114,'N'),(1291,'2025-06-05 01:00:23',0,9,115,'N'),(1292,'2025-06-05 01:00:23',0,9,116,'N'),(1293,'2025-06-05 01:00:23',0,9,117,'N'),(1294,'2025-06-05 01:00:23',0,9,118,'N'),(1295,'2025-06-05 01:00:23',0,9,119,'N'),(1296,'2025-06-05 01:00:23',0,9,120,'Y'),(1297,'2025-06-05 01:00:23',0,9,121,'N'),(1298,'2025-06-05 01:00:23',0,9,122,'N'),(1299,'2025-06-05 01:00:23',0,9,123,'N'),(1300,'2025-06-05 01:00:23',0,9,124,'N'),(1301,'2025-06-05 01:00:23',0,9,125,'N'),(1302,'2025-06-05 01:00:23',0,9,126,'Y'),(1303,'2025-06-05 01:00:23',0,9,127,'N'),(1304,'2025-06-05 01:00:23',0,9,128,'N'),(1305,'2025-06-05 01:00:23',0,9,129,'N'),(1306,'2025-06-05 01:00:23',0,9,130,'N'),(1307,'2025-06-05 01:00:23',0,9,131,'N'),(1308,'2025-06-05 01:00:23',0,9,132,'N'),(1309,'2025-06-05 01:00:23',0,9,133,'N'),(1310,'2025-06-05 01:00:23',0,9,134,'N'),(1311,'2025-06-05 01:00:23',0,9,135,'N'),(1312,'2025-06-05 01:00:23',0,9,136,'N'),(1313,'2025-06-05 01:00:23',0,9,137,'N'),(1314,'2025-06-05 01:00:23',0,9,138,'N'),(1315,'2025-06-05 01:00:23',0,9,139,'N'),(1316,'2025-06-05 01:00:23',0,9,140,'N'),(1317,'2025-06-05 01:00:23',0,9,141,'N'),(1318,'2025-06-05 01:00:23',0,9,142,'N'),(1319,'2025-06-05 01:00:23',0,9,143,'Y'),(1320,'2025-06-05 01:00:23',0,9,144,'Y'),(1321,'2025-06-05 01:00:23',0,9,145,'N'),(1322,'2025-06-05 01:00:23',0,9,146,'N'),(1323,'2025-06-05 01:00:23',0,9,147,'Y'),(1324,'2025-06-05 01:00:23',0,9,148,'N'),(1325,'2025-06-05 01:00:23',0,9,149,'N'),(1326,'2025-06-05 01:00:23',0,9,150,'N'),(1327,'2025-06-05 01:00:23',0,9,151,'Y'),(1328,'2025-06-05 01:00:23',0,9,152,'N'),(1329,'2025-06-05 01:00:23',0,9,153,'N'),(1330,'2025-06-05 01:00:23',0,9,154,'N'),(1331,'2025-06-05 01:00:23',0,9,155,'N'),(1332,'2025-06-05 01:00:23',0,9,156,'N'),(1333,'2025-06-05 01:00:23',0,9,157,'Y'),(1334,'2025-06-05 01:00:23',0,9,158,'N'),(1335,'2025-06-05 01:00:23',0,9,159,'N'),(1336,'2025-06-05 01:00:23',0,9,160,'N'),(1337,'2025-06-05 01:00:23',0,9,161,'N'),(1338,'2025-06-05 01:00:23',0,9,162,'N'),(1339,'2025-06-05 01:00:23',0,9,163,'Y'),(1340,'2025-06-05 01:00:23',0,9,164,'N'),(1341,'2025-06-05 01:00:23',0,9,165,'N'),(1342,'2025-06-05 01:00:23',0,9,166,'N'),(1343,'2025-06-05 01:00:23',0,9,167,'N'),(1344,'2025-06-05 01:00:23',0,9,168,'N'),(1345,'2025-06-05 01:00:23',0,10,1,'N'),(1346,'2025-06-05 01:00:23',0,10,2,'N'),(1347,'2025-06-05 01:00:23',0,10,3,'Y'),(1348,'2025-06-05 01:00:23',0,10,4,'N'),(1349,'2025-06-05 01:00:23',0,10,5,'N'),(1350,'2025-06-05 01:00:23',0,10,6,'N'),(1351,'2025-06-05 01:00:23',0,10,7,'N'),(1352,'2025-06-05 01:00:23',0,10,8,'N'),(1353,'2025-06-05 01:00:23',0,10,9,'N'),(1354,'2025-06-05 01:00:23',0,10,10,'Y'),(1355,'2025-06-05 01:00:23',0,10,11,'Y'),(1356,'2025-06-05 01:00:23',0,10,12,'Y'),(1357,'2025-06-05 01:00:23',0,10,13,'N'),(1358,'2025-06-05 01:00:23',0,10,14,'Y'),(1359,'2025-06-05 01:00:23',0,10,15,'Y'),(1360,'2025-06-05 01:00:23',0,10,16,'Y'),(1361,'2025-06-05 01:00:23',0,10,17,'Y'),(1362,'2025-06-05 01:00:23',0,10,18,'Y'),(1363,'2025-06-05 01:00:23',0,10,19,'Y'),(1364,'2025-06-05 01:00:23',0,10,20,'Y'),(1365,'2025-06-05 01:00:23',0,10,21,'Y'),(1366,'2025-06-05 01:00:23',0,10,22,'Y'),(1367,'2025-06-05 01:00:23',0,10,23,'N'),(1368,'2025-06-05 01:00:23',0,10,24,'Y'),(1369,'2025-06-05 01:00:23',0,10,25,'Y'),(1370,'2025-06-05 01:00:23',0,10,26,'Y'),(1371,'2025-06-05 01:00:23',0,10,27,'Y'),(1372,'2025-06-05 01:00:23',0,10,28,'Y'),(1373,'2025-06-05 01:00:23',0,10,29,'Y'),(1374,'2025-06-05 01:00:23',0,10,30,'Y'),(1375,'2025-06-05 01:00:23',0,10,31,'Y'),(1376,'2025-06-05 01:00:23',0,10,32,'Y'),(1377,'2025-06-05 01:00:23',0,10,33,'Y'),(1378,'2025-06-05 01:00:23',0,10,34,'Y'),(1379,'2025-06-05 01:00:23',0,10,35,'Y'),(1380,'2025-06-05 01:00:23',0,10,36,'Y'),(1381,'2025-06-05 01:00:23',0,10,37,'Y'),(1382,'2025-06-05 01:00:23',0,10,38,'N'),(1383,'2025-06-05 01:00:23',0,10,39,'N'),(1384,'2025-06-05 01:00:23',0,10,40,'N'),(1385,'2025-06-05 01:00:23',0,10,41,'N'),(1386,'2025-06-05 01:00:23',0,10,42,'N'),(1387,'2025-06-05 01:00:23',0,10,43,'N'),(1388,'2025-06-05 01:00:23',0,10,44,'N'),(1389,'2025-06-05 01:00:23',0,10,45,'N'),(1390,'2025-06-05 01:00:23',0,10,46,'N'),(1391,'2025-06-05 01:00:23',0,10,47,'N'),(1392,'2025-06-05 01:00:23',0,10,48,'N'),(1393,'2025-06-05 01:00:23',0,10,49,'N'),(1394,'2025-06-05 01:00:23',0,10,50,'N'),(1395,'2025-06-05 01:00:23',0,10,51,'N'),(1396,'2025-06-05 01:00:23',0,10,52,'N'),(1397,'2025-06-05 01:00:23',0,10,53,'N'),(1398,'2025-06-05 01:00:23',0,10,54,'N'),(1399,'2025-06-05 01:00:23',0,10,55,'N'),(1400,'2025-06-05 01:00:23',0,10,56,'N'),(1401,'2025-06-05 01:00:23',0,10,57,'N'),(1402,'2025-06-05 01:00:23',0,10,58,'N'),(1403,'2025-06-05 01:00:23',0,10,59,'N'),(1404,'2025-06-05 01:00:23',0,10,60,'N'),(1405,'2025-06-05 01:00:23',0,10,61,'N'),(1406,'2025-06-05 01:00:23',0,10,62,'N'),(1407,'2025-06-05 01:00:23',0,10,63,'N'),(1408,'2025-06-05 01:00:23',0,10,64,'N'),(1409,'2025-06-05 01:00:23',0,10,65,'N'),(1410,'2025-06-05 01:00:23',0,10,66,'N'),(1411,'2025-06-05 01:00:23',0,10,67,'N'),(1412,'2025-06-05 01:00:23',0,10,68,'N'),(1413,'2025-06-05 01:00:23',0,10,69,'N'),(1414,'2025-06-05 01:00:23',0,10,70,'N'),(1415,'2025-06-05 01:00:23',0,10,71,'N'),(1416,'2025-06-05 01:00:23',0,10,72,'N'),(1417,'2025-06-05 01:00:23',0,10,73,'N'),(1418,'2025-06-05 01:00:23',0,10,74,'N'),(1419,'2025-06-05 01:00:23',0,10,75,'N'),(1420,'2025-06-05 01:00:23',0,10,76,'N'),(1421,'2025-06-05 01:00:23',0,10,77,'Y'),(1422,'2025-06-05 01:00:23',0,10,78,'Y'),(1423,'2025-06-05 01:00:23',0,10,79,'N'),(1424,'2025-06-05 01:00:23',0,10,80,'N'),(1425,'2025-06-05 01:00:23',0,10,81,'N'),(1426,'2025-06-05 01:00:23',0,10,82,'Y'),(1427,'2025-06-05 01:00:23',0,10,83,'N'),(1428,'2025-06-05 01:00:23',0,10,84,'N'),(1429,'2025-06-05 01:00:23',0,10,85,'N'),(1430,'2025-06-05 01:00:23',0,10,86,'Y'),(1431,'2025-06-05 01:00:23',0,10,87,'Y'),(1432,'2025-06-05 01:00:23',0,10,88,'Y'),(1433,'2025-06-05 01:00:23',0,10,89,'Y'),(1434,'2025-06-05 01:00:23',0,10,90,'Y'),(1435,'2025-06-05 01:00:23',0,10,91,'Y'),(1436,'2025-06-05 01:00:23',0,10,92,'N'),(1437,'2025-06-05 01:00:23',0,10,93,'N'),(1438,'2025-06-05 01:00:23',0,10,94,'N'),(1439,'2025-06-05 01:00:23',0,10,95,'N'),(1440,'2025-06-05 01:00:23',0,10,96,'Y'),(1441,'2025-06-05 01:00:23',0,10,97,'N'),(1442,'2025-06-05 01:00:23',0,10,98,'N'),(1443,'2025-06-05 01:00:23',0,10,99,'N'),(1444,'2025-06-05 01:00:23',0,10,100,'N'),(1445,'2025-06-05 01:00:23',0,10,101,'N'),(1446,'2025-06-05 01:00:23',0,10,102,'N'),(1447,'2025-06-05 01:00:23',0,10,103,'N'),(1448,'2025-06-05 01:00:23',0,10,104,'N'),(1449,'2025-06-05 01:00:23',0,10,105,'N'),(1450,'2025-06-05 01:00:23',0,10,106,'N'),(1451,'2025-06-05 01:00:23',0,10,107,'N'),(1452,'2025-06-05 01:00:23',0,10,108,'N'),(1453,'2025-06-05 01:00:23',0,10,109,'N'),(1454,'2025-06-05 01:00:23',0,10,110,'N'),(1455,'2025-06-05 01:00:23',0,10,111,'N'),(1456,'2025-06-05 01:00:23',0,10,112,'N'),(1457,'2025-06-05 01:00:23',0,10,113,'N'),(1458,'2025-06-05 01:00:23',0,10,114,'N'),(1459,'2025-06-05 01:00:23',0,10,115,'N'),(1460,'2025-06-05 01:00:23',0,10,116,'N'),(1461,'2025-06-05 01:00:23',0,10,117,'N'),(1462,'2025-06-05 01:00:23',0,10,118,'N'),(1463,'2025-06-05 01:00:23',0,10,119,'N'),(1464,'2025-06-05 01:00:23',0,10,120,'Y'),(1465,'2025-06-05 01:00:23',0,10,121,'N'),(1466,'2025-06-05 01:00:23',0,10,122,'N'),(1467,'2025-06-05 01:00:23',0,10,123,'N'),(1468,'2025-06-05 01:00:23',0,10,124,'N'),(1469,'2025-06-05 01:00:23',0,10,125,'N'),(1470,'2025-06-05 01:00:23',0,10,126,'Y'),(1471,'2025-06-05 01:00:23',0,10,127,'N'),(1472,'2025-06-05 01:00:23',0,10,128,'N'),(1473,'2025-06-05 01:00:23',0,10,129,'N'),(1474,'2025-06-05 01:00:23',0,10,130,'N'),(1475,'2025-06-05 01:00:23',0,10,131,'N'),(1476,'2025-06-05 01:00:23',0,10,132,'N'),(1477,'2025-06-05 01:00:23',0,10,133,'Y'),(1478,'2025-06-05 01:00:23',0,10,134,'N'),(1479,'2025-06-05 01:00:23',0,10,135,'N'),(1480,'2025-06-05 01:00:23',0,10,136,'N'),(1481,'2025-06-05 01:00:23',0,10,137,'N'),(1482,'2025-06-05 01:00:23',0,10,138,'N'),(1483,'2025-06-05 01:00:23',0,10,139,'N'),(1484,'2025-06-05 01:00:23',0,10,140,'N'),(1485,'2025-06-05 01:00:23',0,10,141,'N'),(1486,'2025-06-05 01:00:23',0,10,142,'N'),(1487,'2025-06-05 01:00:23',0,10,143,'Y'),(1488,'2025-06-05 01:00:23',0,10,144,'Y'),(1489,'2025-06-05 01:00:23',0,10,145,'N'),(1490,'2025-06-05 01:00:23',0,10,146,'N'),(1491,'2025-06-05 01:00:23',0,10,147,'Y'),(1492,'2025-06-05 01:00:23',0,10,148,'N'),(1493,'2025-06-05 01:00:23',0,10,149,'N'),(1494,'2025-06-05 01:00:23',0,10,150,'N'),(1495,'2025-06-05 01:00:23',0,10,151,'Y'),(1496,'2025-06-05 01:00:23',0,10,152,'N'),(1497,'2025-06-05 01:00:23',0,10,153,'N'),(1498,'2025-06-05 01:00:23',0,10,154,'N'),(1499,'2025-06-05 01:00:23',0,10,155,'N'),(1500,'2025-06-05 01:00:23',0,10,156,'N'),(1501,'2025-06-05 01:00:23',0,10,157,'Y'),(1502,'2025-06-05 01:00:23',0,10,158,'N'),(1503,'2025-06-05 01:00:23',0,10,159,'N'),(1504,'2025-06-05 01:00:23',0,10,160,'N'),(1505,'2025-06-05 01:00:23',0,10,161,'N'),(1506,'2025-06-05 01:00:23',0,10,162,'N'),(1507,'2025-06-05 01:00:23',0,10,163,'Y'),(1508,'2025-06-05 01:00:23',0,10,164,'N'),(1509,'2025-06-05 01:00:23',0,10,165,'N'),(1510,'2025-06-05 01:00:23',0,10,166,'N'),(1511,'2025-06-05 01:00:23',0,10,167,'N'),(1512,'2025-06-05 01:00:23',0,10,168,'N'),(1513,'2025-06-05 01:00:23',0,11,1,'N'),(1514,'2025-06-05 01:00:23',0,11,2,'N'),(1515,'2025-06-05 01:00:23',0,11,3,'Y'),(1516,'2025-06-05 01:00:23',0,11,4,'N'),(1517,'2025-06-05 01:00:23',0,11,5,'N'),(1518,'2025-06-05 01:00:23',0,11,6,'N'),(1519,'2025-06-05 01:00:23',0,11,7,'N'),(1520,'2025-06-05 01:00:23',0,11,8,'Y'),(1521,'2025-06-05 01:00:23',0,11,9,'Y'),(1522,'2025-06-05 01:00:23',0,11,10,'Y'),(1523,'2025-06-05 01:00:23',0,11,11,'Y'),(1524,'2025-06-05 01:00:23',0,11,12,'Y'),(1525,'2025-06-05 01:00:23',0,11,13,'Y'),(1526,'2025-06-05 01:00:23',0,11,14,'Y'),(1527,'2025-06-05 01:00:23',0,11,15,'Y'),(1528,'2025-06-05 01:00:23',0,11,16,'Y'),(1529,'2025-06-05 01:00:23',0,11,17,'Y'),(1530,'2025-06-05 01:00:23',0,11,18,'Y'),(1531,'2025-06-05 01:00:23',0,11,19,'Y'),(1532,'2025-06-05 01:00:23',0,11,20,'Y'),(1533,'2025-06-05 01:00:23',0,11,21,'Y'),(1534,'2025-06-05 01:00:23',0,11,22,'Y'),(1535,'2025-06-05 01:00:23',0,11,23,'N'),(1536,'2025-06-05 01:00:23',0,11,24,'Y'),(1537,'2025-06-05 01:00:23',0,11,25,'Y'),(1538,'2025-06-05 01:00:23',0,11,26,'Y'),(1539,'2025-06-05 01:00:23',0,11,27,'Y'),(1540,'2025-06-05 01:00:23',0,11,28,'Y'),(1541,'2025-06-05 01:00:23',0,11,29,'Y'),(1542,'2025-06-05 01:00:23',0,11,30,'Y'),(1543,'2025-06-05 01:00:23',0,11,31,'Y'),(1544,'2025-06-05 01:00:23',0,11,32,'Y'),(1545,'2025-06-05 01:00:23',0,11,33,'Y'),(1546,'2025-06-05 01:00:23',0,11,34,'Y'),(1547,'2025-06-05 01:00:23',0,11,35,'Y'),(1548,'2025-06-05 01:00:23',0,11,36,'Y'),(1549,'2025-06-05 01:00:23',0,11,37,'Y'),(1550,'2025-06-05 01:00:23',0,11,38,'N'),(1551,'2025-06-05 01:00:23',0,11,39,'N'),(1552,'2025-06-05 01:00:23',0,11,40,'N'),(1553,'2025-06-05 01:00:23',0,11,41,'N'),(1554,'2025-06-05 01:00:23',0,11,42,'N'),(1555,'2025-06-05 01:00:23',0,11,43,'N'),(1556,'2025-06-05 01:00:23',0,11,44,'N'),(1557,'2025-06-05 01:00:23',0,11,45,'N'),(1558,'2025-06-05 01:00:23',0,11,46,'N'),(1559,'2025-06-05 01:00:23',0,11,47,'N'),(1560,'2025-06-05 01:00:23',0,11,48,'N'),(1561,'2025-06-05 01:00:23',0,11,49,'N'),(1562,'2025-06-05 01:00:23',0,11,50,'N'),(1563,'2025-06-05 01:00:23',0,11,51,'N'),(1564,'2025-06-05 01:00:23',0,11,52,'N'),(1565,'2025-06-05 01:00:23',0,11,53,'N'),(1566,'2025-06-05 01:00:23',0,11,54,'N'),(1567,'2025-06-05 01:00:23',0,11,55,'N'),(1568,'2025-06-05 01:00:23',0,11,56,'N'),(1569,'2025-06-05 01:00:23',0,11,57,'N'),(1570,'2025-06-05 01:00:23',0,11,58,'N'),(1571,'2025-06-05 01:00:23',0,11,59,'N'),(1572,'2025-06-05 01:00:23',0,11,60,'N'),(1573,'2025-06-05 01:00:23',0,11,61,'N'),(1574,'2025-06-05 01:00:23',0,11,62,'N'),(1575,'2025-06-05 01:00:23',0,11,63,'N'),(1576,'2025-06-05 01:00:23',0,11,64,'N'),(1577,'2025-06-05 01:00:23',0,11,65,'N'),(1578,'2025-06-05 01:00:23',0,11,66,'N'),(1579,'2025-06-05 01:00:23',0,11,67,'N'),(1580,'2025-06-05 01:00:23',0,11,68,'N'),(1581,'2025-06-05 01:00:23',0,11,69,'N'),(1582,'2025-06-05 01:00:23',0,11,70,'N'),(1583,'2025-06-05 01:00:23',0,11,71,'N'),(1584,'2025-06-05 01:00:23',0,11,72,'N'),(1585,'2025-06-05 01:00:23',0,11,73,'N'),(1586,'2025-06-05 01:00:23',0,11,74,'N'),(1587,'2025-06-05 01:00:23',0,11,75,'N'),(1588,'2025-06-05 01:00:23',0,11,76,'N'),(1589,'2025-06-05 01:00:23',0,11,77,'Y'),(1590,'2025-06-05 01:00:23',0,11,78,'Y'),(1591,'2025-06-05 01:00:23',0,11,79,'N'),(1592,'2025-06-05 01:00:23',0,11,80,'N'),(1593,'2025-06-05 01:00:23',0,11,81,'N'),(1594,'2025-06-05 01:00:23',0,11,82,'Y'),(1595,'2025-06-05 01:00:23',0,11,83,'N'),(1596,'2025-06-05 01:00:23',0,11,84,'N'),(1597,'2025-06-05 01:00:23',0,11,85,'N'),(1598,'2025-06-05 01:00:23',0,11,86,'Y'),(1599,'2025-06-05 01:00:23',0,11,87,'Y'),(1600,'2025-06-05 01:00:23',0,11,88,'Y'),(1601,'2025-06-05 01:00:23',0,11,89,'Y'),(1602,'2025-06-05 01:00:23',0,11,90,'Y'),(1603,'2025-06-05 01:00:23',0,11,91,'Y'),(1604,'2025-06-05 01:00:23',0,11,92,'N'),(1605,'2025-06-05 01:00:23',0,11,93,'N'),(1606,'2025-06-05 01:00:23',0,11,94,'N'),(1607,'2025-06-05 01:00:23',0,11,95,'N'),(1608,'2025-06-05 01:00:23',0,11,96,'Y'),(1609,'2025-06-05 01:00:23',0,11,97,'N'),(1610,'2025-06-05 01:00:23',0,11,98,'N'),(1611,'2025-06-05 01:00:23',0,11,99,'N'),(1612,'2025-06-05 01:00:23',0,11,100,'N'),(1613,'2025-06-05 01:00:23',0,11,101,'N'),(1614,'2025-06-05 01:00:23',0,11,102,'N'),(1615,'2025-06-05 01:00:23',0,11,103,'N'),(1616,'2025-06-05 01:00:23',0,11,104,'N'),(1617,'2025-06-05 01:00:23',0,11,105,'N'),(1618,'2025-06-05 01:00:23',0,11,106,'N'),(1619,'2025-06-05 01:00:23',0,11,107,'N'),(1620,'2025-06-05 01:00:23',0,11,108,'N'),(1621,'2025-06-05 01:00:23',0,11,109,'N'),(1622,'2025-06-05 01:00:23',0,11,110,'N'),(1623,'2025-06-05 01:00:23',0,11,111,'N'),(1624,'2025-06-05 01:00:23',0,11,112,'N'),(1625,'2025-06-05 01:00:23',0,11,113,'N'),(1626,'2025-06-05 01:00:23',0,11,114,'N'),(1627,'2025-06-05 01:00:23',0,11,115,'N'),(1628,'2025-06-05 01:00:23',0,11,116,'N'),(1629,'2025-06-05 01:00:23',0,11,117,'N'),(1630,'2025-06-05 01:00:23',0,11,118,'N'),(1631,'2025-06-05 01:00:23',0,11,119,'N'),(1632,'2025-06-05 01:00:23',0,11,120,'Y'),(1633,'2025-06-05 01:00:23',0,11,121,'N'),(1634,'2025-06-05 01:00:23',0,11,122,'N'),(1635,'2025-06-05 01:00:23',0,11,123,'N'),(1636,'2025-06-05 01:00:23',0,11,124,'N'),(1637,'2025-06-05 01:00:23',0,11,125,'N'),(1638,'2025-06-05 01:00:23',0,11,126,'Y'),(1639,'2025-06-05 01:00:23',0,11,127,'N'),(1640,'2025-06-05 01:00:23',0,11,128,'N'),(1641,'2025-06-05 01:00:23',0,11,129,'N'),(1642,'2025-06-05 01:00:23',0,11,130,'N'),(1643,'2025-06-05 01:00:23',0,11,131,'N'),(1644,'2025-06-05 01:00:23',0,11,132,'N'),(1645,'2025-06-05 01:00:23',0,11,133,'Y'),(1646,'2025-06-05 01:00:23',0,11,134,'N'),(1647,'2025-06-05 01:00:23',0,11,135,'N'),(1648,'2025-06-05 01:00:23',0,11,136,'N'),(1649,'2025-06-05 01:00:23',0,11,137,'N'),(1650,'2025-06-05 01:00:23',0,11,138,'N'),(1651,'2025-06-05 01:00:23',0,11,139,'N'),(1652,'2025-06-05 01:00:23',0,11,140,'N'),(1653,'2025-06-05 01:00:23',0,11,141,'N'),(1654,'2025-06-05 01:00:23',0,11,142,'N'),(1655,'2025-06-05 01:00:23',0,11,143,'Y'),(1656,'2025-06-05 01:00:23',0,11,144,'Y'),(1657,'2025-06-05 01:00:23',0,11,145,'Y'),(1658,'2025-06-05 01:00:23',0,11,146,'Y'),(1659,'2025-06-05 01:00:23',0,11,147,'Y'),(1660,'2025-06-05 01:00:23',0,11,148,'N'),(1661,'2025-06-05 01:00:23',0,11,149,'N'),(1662,'2025-06-05 01:00:23',0,11,150,'N'),(1663,'2025-06-05 01:00:23',0,11,151,'Y'),(1664,'2025-06-05 01:00:23',0,11,152,'N'),(1665,'2025-06-05 01:00:23',0,11,153,'N'),(1666,'2025-06-05 01:00:23',0,11,154,'N'),(1667,'2025-06-05 01:00:23',0,11,155,'N'),(1668,'2025-06-05 01:00:23',0,11,156,'N'),(1669,'2025-06-05 01:00:23',0,11,157,'Y'),(1670,'2025-06-05 01:00:23',0,11,158,'N'),(1671,'2025-06-05 01:00:23',0,11,159,'N'),(1672,'2025-06-05 01:00:23',0,11,160,'N'),(1673,'2025-06-05 01:00:23',0,11,161,'N'),(1674,'2025-06-05 01:00:23',0,11,162,'N'),(1675,'2025-06-05 01:00:23',0,11,163,'Y'),(1676,'2025-06-05 01:00:23',0,11,164,'N'),(1677,'2025-06-05 01:00:23',0,11,165,'N'),(1678,'2025-06-05 01:00:23',0,11,166,'N'),(1679,'2025-06-05 01:00:23',0,11,167,'N'),(1680,'2025-06-05 01:00:23',0,11,168,'N'),(1681,'2025-06-05 01:00:23',0,12,1,'N'),(1682,'2025-06-05 01:00:23',0,12,2,'N'),(1683,'2025-06-05 01:00:23',0,12,3,'Y'),(1684,'2025-06-05 01:00:23',0,12,4,'N'),(1685,'2025-06-05 01:00:23',0,12,5,'N'),(1686,'2025-06-05 01:00:23',0,12,6,'Y'),(1687,'2025-06-05 01:00:23',0,12,7,'Y'),(1688,'2025-06-05 01:00:23',0,12,8,'Y'),(1689,'2025-06-05 01:00:23',0,12,9,'Y'),(1690,'2025-06-05 01:00:23',0,12,10,'Y'),(1691,'2025-06-05 01:00:23',0,12,11,'Y'),(1692,'2025-06-05 01:00:23',0,12,12,'Y'),(1693,'2025-06-05 01:00:23',0,12,13,'Y'),(1694,'2025-06-05 01:00:23',0,12,14,'Y'),(1695,'2025-06-05 01:00:23',0,12,15,'Y'),(1696,'2025-06-05 01:00:23',0,12,16,'Y'),(1697,'2025-06-05 01:00:23',0,12,17,'Y'),(1698,'2025-06-05 01:00:23',0,12,18,'Y'),(1699,'2025-06-05 01:00:23',0,12,19,'Y'),(1700,'2025-06-05 01:00:23',0,12,20,'Y'),(1701,'2025-06-05 01:00:23',0,12,21,'Y'),(1702,'2025-06-05 01:00:23',0,12,22,'Y'),(1703,'2025-06-05 01:00:23',0,12,23,'N'),(1704,'2025-06-05 01:00:23',0,12,24,'Y'),(1705,'2025-06-05 01:00:23',0,12,25,'Y'),(1706,'2025-06-05 01:00:23',0,12,26,'Y'),(1707,'2025-06-05 01:00:23',0,12,27,'Y'),(1708,'2025-06-05 01:00:23',0,12,28,'Y'),(1709,'2025-06-05 01:00:23',0,12,29,'Y'),(1710,'2025-06-05 01:00:23',0,12,30,'Y'),(1711,'2025-06-05 01:00:23',0,12,31,'Y'),(1712,'2025-06-05 01:00:23',0,12,32,'Y'),(1713,'2025-06-05 01:00:23',0,12,33,'Y'),(1714,'2025-06-05 01:00:23',0,12,34,'Y'),(1715,'2025-06-05 01:00:23',0,12,35,'Y'),(1716,'2025-06-05 01:00:23',0,12,36,'Y'),(1717,'2025-06-05 01:00:23',0,12,37,'Y'),(1718,'2025-06-05 01:00:23',0,12,38,'Y'),(1719,'2025-06-05 01:00:23',0,12,39,'Y'),(1720,'2025-06-05 01:00:23',0,12,40,'N'),(1721,'2025-06-05 01:00:23',0,12,41,'N'),(1722,'2025-06-05 01:00:23',0,12,42,'Y'),(1723,'2025-06-05 01:00:23',0,12,43,'Y'),(1724,'2025-06-05 01:00:23',0,12,44,'N'),(1725,'2025-06-05 01:00:23',0,12,45,'N'),(1726,'2025-06-05 01:00:23',0,12,46,'N'),(1727,'2025-06-05 01:00:23',0,12,47,'N'),(1728,'2025-06-05 01:00:23',0,12,48,'Y'),(1729,'2025-06-05 01:00:23',0,12,49,'Y'),(1730,'2025-06-05 01:00:23',0,12,50,'Y'),(1731,'2025-06-05 01:00:23',0,12,51,'N'),(1732,'2025-06-05 01:00:23',0,12,52,'Y'),(1733,'2025-06-05 01:00:23',0,12,53,'Y'),(1734,'2025-06-05 01:00:23',0,12,54,'N'),(1735,'2025-06-05 01:00:23',0,12,55,'N'),(1736,'2025-06-05 01:00:23',0,12,56,'Y'),(1737,'2025-06-05 01:00:23',0,12,57,'Y'),(1738,'2025-06-05 01:00:23',0,12,58,'Y'),(1739,'2025-06-05 01:00:23',0,12,59,'N'),(1740,'2025-06-05 01:00:23',0,12,60,'N'),(1741,'2025-06-05 01:00:23',0,12,61,'N'),(1742,'2025-06-05 01:00:23',0,12,62,'N'),(1743,'2025-06-05 01:00:23',0,12,63,'N'),(1744,'2025-06-05 01:00:23',0,12,64,'N'),(1745,'2025-06-05 01:00:23',0,12,65,'N'),(1746,'2025-06-05 01:00:23',0,12,66,'N'),(1747,'2025-06-05 01:00:23',0,12,67,'N'),(1748,'2025-06-05 01:00:23',0,12,68,'N'),(1749,'2025-06-05 01:00:23',0,12,69,'N'),(1750,'2025-06-05 01:00:23',0,12,70,'Y'),(1751,'2025-06-05 01:00:23',0,12,71,'N'),(1752,'2025-06-05 01:00:23',0,12,72,'N'),(1753,'2025-06-05 01:00:23',0,12,73,'N'),(1754,'2025-06-05 01:00:23',0,12,74,'N'),(1755,'2025-06-05 01:00:23',0,12,75,'Y'),(1756,'2025-06-05 01:00:23',0,12,76,'Y'),(1757,'2025-06-05 01:00:23',0,12,77,'Y'),(1758,'2025-06-05 01:00:23',0,12,78,'Y'),(1759,'2025-06-05 01:00:23',0,12,79,'N'),(1760,'2025-06-05 01:00:23',0,12,80,'N'),(1761,'2025-06-05 01:00:23',0,12,81,'N'),(1762,'2025-06-05 01:00:23',0,12,82,'Y'),(1763,'2025-06-05 01:00:23',0,12,83,'N'),(1764,'2025-06-05 01:00:23',0,12,84,'N'),(1765,'2025-06-05 01:00:23',0,12,85,'N'),(1766,'2025-06-05 01:00:23',0,12,86,'Y'),(1767,'2025-06-05 01:00:23',0,12,87,'Y'),(1768,'2025-06-05 01:00:23',0,12,88,'Y'),(1769,'2025-06-05 01:00:23',0,12,89,'Y'),(1770,'2025-06-05 01:00:23',0,12,90,'Y'),(1771,'2025-06-05 01:00:23',0,12,91,'Y'),(1772,'2025-06-05 01:00:23',0,12,92,'N'),(1773,'2025-06-05 01:00:23',0,12,93,'N'),(1774,'2025-06-05 01:00:23',0,12,94,'N'),(1775,'2025-06-05 01:00:23',0,12,95,'N'),(1776,'2025-06-05 01:00:23',0,12,96,'Y'),(1777,'2025-06-05 01:00:23',0,12,97,'N'),(1778,'2025-06-05 01:00:23',0,12,98,'N'),(1779,'2025-06-05 01:00:23',0,12,99,'N'),(1780,'2025-06-05 01:00:23',0,12,100,'N'),(1781,'2025-06-05 01:00:23',0,12,101,'N'),(1782,'2025-06-05 01:00:23',0,12,102,'N'),(1783,'2025-06-05 01:00:23',0,12,103,'N'),(1784,'2025-06-05 01:00:23',0,12,104,'N'),(1785,'2025-06-05 01:00:23',0,12,105,'N'),(1786,'2025-06-05 01:00:23',0,12,106,'N'),(1787,'2025-06-05 01:00:23',0,12,107,'N'),(1788,'2025-06-05 01:00:23',0,12,108,'N'),(1789,'2025-06-05 01:00:23',0,12,109,'N'),(1790,'2025-06-05 01:00:23',0,12,110,'N'),(1791,'2025-06-05 01:00:23',0,12,111,'N'),(1792,'2025-06-05 01:00:23',0,12,112,'N'),(1793,'2025-06-05 01:00:23',0,12,113,'N'),(1794,'2025-06-05 01:00:23',0,12,114,'N'),(1795,'2025-06-05 01:00:23',0,12,115,'N'),(1796,'2025-06-05 01:00:23',0,12,116,'N'),(1797,'2025-06-05 01:00:23',0,12,117,'N'),(1798,'2025-06-05 01:00:23',0,12,118,'N'),(1799,'2025-06-05 01:00:23',0,12,119,'N'),(1800,'2025-06-05 01:00:23',0,12,120,'Y'),(1801,'2025-06-05 01:00:23',0,12,121,'Y'),(1802,'2025-06-05 01:00:23',0,12,122,'Y'),(1803,'2025-06-05 01:00:23',0,12,123,'Y'),(1804,'2025-06-05 01:00:23',0,12,124,'Y'),(1805,'2025-06-05 01:00:23',0,12,125,'Y'),(1806,'2025-06-05 01:00:23',0,12,126,'Y'),(1807,'2025-06-05 01:00:23',0,12,127,'N'),(1808,'2025-06-05 01:00:23',0,12,128,'N'),(1809,'2025-06-05 01:00:23',0,12,129,'N'),(1810,'2025-06-05 01:00:23',0,12,130,'N'),(1811,'2025-06-05 01:00:23',0,12,131,'N'),(1812,'2025-06-05 01:00:23',0,12,132,'N'),(1813,'2025-06-05 01:00:23',0,12,133,'Y'),(1814,'2025-06-05 01:00:23',0,12,134,'N'),(1815,'2025-06-05 01:00:23',0,12,135,'N'),(1816,'2025-06-05 01:00:23',0,12,136,'N'),(1817,'2025-06-05 01:00:23',0,12,137,'N'),(1818,'2025-06-05 01:00:23',0,12,138,'N'),(1819,'2025-06-05 01:00:23',0,12,139,'N'),(1820,'2025-06-05 01:00:23',0,12,140,'N'),(1821,'2025-06-05 01:00:23',0,12,141,'N'),(1822,'2025-06-05 01:00:23',0,12,142,'N'),(1823,'2025-06-05 01:00:23',0,12,143,'Y'),(1824,'2025-06-05 01:00:23',0,12,144,'Y'),(1825,'2025-06-05 01:00:23',0,12,145,'Y'),(1826,'2025-06-05 01:00:23',0,12,146,'Y'),(1827,'2025-06-05 01:00:23',0,12,147,'Y'),(1828,'2025-06-05 01:00:23',0,12,148,'N'),(1829,'2025-06-05 01:00:23',0,12,149,'N'),(1830,'2025-06-05 01:00:23',0,12,150,'N'),(1831,'2025-06-05 01:00:23',0,12,151,'Y'),(1832,'2025-06-05 01:00:23',0,12,152,'N'),(1833,'2025-06-05 01:00:23',0,12,153,'N'),(1834,'2025-06-05 01:00:23',0,12,154,'N'),(1835,'2025-06-05 01:00:23',0,12,155,'N'),(1836,'2025-06-05 01:00:23',0,12,156,'N'),(1837,'2025-06-05 01:00:23',0,12,157,'Y'),(1838,'2025-06-05 01:00:23',0,12,158,'N'),(1839,'2025-06-05 01:00:23',0,12,159,'N'),(1840,'2025-06-05 01:00:23',0,12,160,'N'),(1841,'2025-06-05 01:00:23',0,12,161,'N'),(1842,'2025-06-05 01:00:23',0,12,162,'N'),(1843,'2025-06-05 01:00:23',0,12,163,'Y'),(1844,'2025-06-05 01:00:23',0,12,164,'N'),(1845,'2025-06-05 01:00:23',0,12,165,'N'),(1846,'2025-06-05 01:00:23',0,12,166,'N'),(1847,'2025-06-05 01:00:23',0,12,167,'N'),(1848,'2025-06-05 01:00:23',0,12,168,'N'),(1849,'2025-06-05 01:00:23',0,16,1,'N'),(1850,'2025-06-05 01:00:23',0,16,2,'N'),(1851,'2025-06-05 01:00:23',0,16,3,'Y'),(1852,'2025-06-05 01:00:23',0,16,4,'N'),(1853,'2025-06-05 01:00:23',0,16,5,'N'),(1854,'2025-06-05 01:00:23',0,16,6,'N'),(1855,'2025-06-05 01:00:23',0,16,7,'N'),(1856,'2025-06-05 01:00:23',0,16,8,'N'),(1857,'2025-06-05 01:00:23',0,16,9,'N'),(1858,'2025-06-05 01:00:23',0,16,10,'Y'),(1859,'2025-06-05 01:00:23',0,16,11,'Y'),(1860,'2025-06-05 01:00:23',0,16,12,'Y'),(1861,'2025-06-05 01:00:23',0,16,13,'N'),(1862,'2025-06-05 01:00:23',0,16,14,'N'),(1863,'2025-06-05 01:00:23',0,16,15,'N'),(1864,'2025-06-05 01:00:23',0,16,16,'N'),(1865,'2025-06-05 01:00:23',0,16,17,'N'),(1866,'2025-06-05 01:00:23',0,16,18,'Y'),(1867,'2025-06-05 01:00:23',0,16,19,'Y'),(1868,'2025-06-05 01:00:23',0,16,20,'Y'),(1869,'2025-06-05 01:00:23',0,16,21,'Y'),(1870,'2025-06-05 01:00:23',0,16,22,'Y'),(1871,'2025-06-05 01:00:23',0,16,23,'N'),(1872,'2025-06-05 01:00:23',0,16,24,'N'),(1873,'2025-06-05 01:00:23',0,16,25,'N'),(1874,'2025-06-05 01:00:23',0,16,26,'Y'),(1875,'2025-06-05 01:00:23',0,16,27,'Y'),(1876,'2025-06-05 01:00:23',0,16,28,'Y'),(1877,'2025-06-05 01:00:23',0,16,29,'Y'),(1878,'2025-06-05 01:00:23',0,16,30,'Y'),(1879,'2025-06-05 01:00:23',0,16,31,'Y'),(1880,'2025-06-05 01:00:23',0,16,32,'Y'),(1881,'2025-06-05 01:00:23',0,16,33,'Y'),(1882,'2025-06-05 01:00:23',0,16,34,'Y'),(1883,'2025-06-05 01:00:23',0,16,35,'Y'),(1884,'2025-06-05 01:00:23',0,16,36,'Y'),(1885,'2025-06-05 01:00:23',0,16,37,'Y'),(1886,'2025-06-05 01:00:23',0,16,38,'N'),(1887,'2025-06-05 01:00:23',0,16,39,'N'),(1888,'2025-06-05 01:00:23',0,16,40,'N'),(1889,'2025-06-05 01:00:23',0,16,41,'N'),(1890,'2025-06-05 01:00:23',0,16,42,'N'),(1891,'2025-06-05 01:00:23',0,16,43,'N'),(1892,'2025-06-05 01:00:23',0,16,44,'N'),(1893,'2025-06-05 01:00:23',0,16,45,'N'),(1894,'2025-06-05 01:00:23',0,16,46,'N'),(1895,'2025-06-05 01:00:23',0,16,47,'N'),(1896,'2025-06-05 01:00:23',0,16,48,'N'),(1897,'2025-06-05 01:00:23',0,16,49,'N'),(1898,'2025-06-05 01:00:23',0,16,50,'N'),(1899,'2025-06-05 01:00:23',0,16,51,'N'),(1900,'2025-06-05 01:00:23',0,16,52,'N'),(1901,'2025-06-05 01:00:23',0,16,53,'N'),(1902,'2025-06-05 01:00:23',0,16,54,'N'),(1903,'2025-06-05 01:00:23',0,16,55,'N'),(1904,'2025-06-05 01:00:23',0,16,56,'N'),(1905,'2025-06-05 01:00:23',0,16,57,'N'),(1906,'2025-06-05 01:00:23',0,16,58,'N'),(1907,'2025-06-05 01:00:23',0,16,59,'N'),(1908,'2025-06-05 01:00:23',0,16,60,'N'),(1909,'2025-06-05 01:00:23',0,16,61,'N'),(1910,'2025-06-05 01:00:23',0,16,62,'N'),(1911,'2025-06-05 01:00:23',0,16,63,'N'),(1912,'2025-06-05 01:00:23',0,16,64,'N'),(1913,'2025-06-05 01:00:23',0,16,65,'N'),(1914,'2025-06-05 01:00:23',0,16,66,'N'),(1915,'2025-06-05 01:00:23',0,16,67,'N'),(1916,'2025-06-05 01:00:23',0,16,68,'N'),(1917,'2025-06-05 01:00:23',0,16,69,'N'),(1918,'2025-06-05 01:00:23',0,16,70,'N'),(1919,'2025-06-05 01:00:23',0,16,71,'N'),(1920,'2025-06-05 01:00:23',0,16,72,'N'),(1921,'2025-06-05 01:00:23',0,16,73,'N'),(1922,'2025-06-05 01:00:23',0,16,74,'N'),(1923,'2025-06-05 01:00:23',0,16,75,'N'),(1924,'2025-06-05 01:00:23',0,16,76,'N'),(1925,'2025-06-05 01:00:23',0,16,77,'N'),(1926,'2025-06-05 01:00:23',0,16,78,'Y'),(1927,'2025-06-05 01:00:23',0,16,79,'N'),(1928,'2025-06-05 01:00:23',0,16,80,'N'),(1929,'2025-06-05 01:00:23',0,16,81,'N'),(1930,'2025-06-05 01:00:23',0,16,82,'Y'),(1931,'2025-06-05 01:00:23',0,16,83,'N'),(1932,'2025-06-05 01:00:23',0,16,84,'N'),(1933,'2025-06-05 01:00:23',0,16,85,'N'),(1934,'2025-06-05 01:00:23',0,16,86,'Y'),(1935,'2025-06-05 01:00:23',0,16,87,'Y'),(1936,'2025-06-05 01:00:23',0,16,88,'Y'),(1937,'2025-06-05 01:00:23',0,16,89,'Y'),(1938,'2025-06-05 01:00:23',0,16,90,'Y'),(1939,'2025-06-05 01:00:23',0,16,91,'Y'),(1940,'2025-06-05 01:00:23',0,16,92,'N'),(1941,'2025-06-05 01:00:23',0,16,93,'N'),(1942,'2025-06-05 01:00:23',0,16,94,'N'),(1943,'2025-06-05 01:00:23',0,16,95,'N'),(1944,'2025-06-05 01:00:23',0,16,96,'Y'),(1945,'2025-06-05 01:00:23',0,16,97,'N'),(1946,'2025-06-05 01:00:23',0,16,98,'N'),(1947,'2025-06-05 01:00:23',0,16,99,'N'),(1948,'2025-06-05 01:00:23',0,16,100,'N'),(1949,'2025-06-05 01:00:23',0,16,101,'N'),(1950,'2025-06-05 01:00:23',0,16,102,'N'),(1951,'2025-06-05 01:00:23',0,16,103,'N'),(1952,'2025-06-05 01:00:23',0,16,104,'N'),(1953,'2025-06-05 01:00:23',0,16,105,'N'),(1954,'2025-06-05 01:00:23',0,16,106,'N'),(1955,'2025-06-05 01:00:23',0,16,107,'N'),(1956,'2025-06-05 01:00:23',0,16,108,'N'),(1957,'2025-06-05 01:00:23',0,16,109,'N'),(1958,'2025-06-05 01:00:23',0,16,110,'N'),(1959,'2025-06-05 01:00:23',0,16,111,'N'),(1960,'2025-06-05 01:00:23',0,16,112,'N'),(1961,'2025-06-05 01:00:23',0,16,113,'N'),(1962,'2025-06-05 01:00:23',0,16,114,'N'),(1963,'2025-06-05 01:00:23',0,16,115,'N'),(1964,'2025-06-05 01:00:23',0,16,116,'N'),(1965,'2025-06-05 01:00:23',0,16,117,'N'),(1966,'2025-06-05 01:00:23',0,16,118,'N'),(1967,'2025-06-05 01:00:23',0,16,119,'N'),(1968,'2025-06-05 01:00:23',0,16,120,'Y'),(1969,'2025-06-05 01:00:23',0,16,121,'N'),(1970,'2025-06-05 01:00:23',0,16,122,'N'),(1971,'2025-06-05 01:00:23',0,16,123,'N'),(1972,'2025-06-05 01:00:23',0,16,124,'N'),(1973,'2025-06-05 01:00:23',0,16,125,'N'),(1974,'2025-06-05 01:00:23',0,16,126,'Y'),(1975,'2025-06-05 01:00:23',0,16,127,'N'),(1976,'2025-06-05 01:00:23',0,16,128,'N'),(1977,'2025-06-05 01:00:23',0,16,129,'N'),(1978,'2025-06-05 01:00:23',0,16,130,'N'),(1979,'2025-06-05 01:00:23',0,16,131,'N'),(1980,'2025-06-05 01:00:23',0,16,132,'N'),(1981,'2025-06-05 01:00:23',0,16,133,'N'),(1982,'2025-06-05 01:00:23',0,16,134,'N'),(1983,'2025-06-05 01:00:23',0,16,135,'N'),(1984,'2025-06-05 01:00:23',0,16,136,'N'),(1985,'2025-06-05 01:00:23',0,16,137,'N'),(1986,'2025-06-05 01:00:23',0,16,138,'N'),(1987,'2025-06-05 01:00:23',0,16,139,'N'),(1988,'2025-06-05 01:00:23',0,16,140,'N'),(1989,'2025-06-05 01:00:23',0,16,141,'N'),(1990,'2025-06-05 01:00:23',0,16,142,'N'),(1991,'2025-06-05 01:00:23',0,16,143,'Y'),(1992,'2025-06-05 01:00:23',0,16,144,'Y'),(1993,'2025-06-05 01:00:23',0,16,145,'N'),(1994,'2025-06-05 01:00:23',0,16,146,'N'),(1995,'2025-06-05 01:00:23',0,16,147,'Y'),(1996,'2025-06-05 01:00:23',0,16,148,'N'),(1997,'2025-06-05 01:00:23',0,16,149,'N'),(1998,'2025-06-05 01:00:23',0,16,150,'N'),(1999,'2025-06-05 01:00:23',0,16,151,'Y'),(2000,'2025-06-05 01:00:23',0,16,152,'N'),(2001,'2025-06-05 01:00:23',0,16,153,'N'),(2002,'2025-06-05 01:00:23',0,16,154,'N'),(2003,'2025-06-05 01:00:23',0,16,155,'N'),(2004,'2025-06-05 01:00:23',0,16,156,'N'),(2005,'2025-06-05 01:00:23',0,16,157,'Y'),(2006,'2025-06-05 01:00:23',0,16,158,'N'),(2007,'2025-06-05 01:00:23',0,16,159,'N'),(2008,'2025-06-05 01:00:23',0,16,160,'N'),(2009,'2025-06-05 01:00:23',0,16,161,'N'),(2010,'2025-06-05 01:00:23',0,16,162,'N'),(2011,'2025-06-05 01:00:23',0,16,163,'Y'),(2012,'2025-06-05 01:00:23',0,16,164,'N'),(2013,'2025-06-05 01:00:23',0,16,165,'N'),(2014,'2025-06-05 01:00:23',0,16,166,'N'),(2015,'2025-06-05 01:00:23',0,16,167,'N'),(2016,'2025-06-05 01:00:23',0,16,168,'N'),(2017,'2025-06-05 01:00:23',0,1,169,'N'),(2018,'2025-06-05 01:00:23',0,1,170,'N'),(2019,'2025-06-05 01:00:23',0,1,171,'N'),(2020,'2025-06-05 01:00:23',0,1,172,'N'),(2021,'2025-06-05 01:00:23',0,1,173,'N'),(2024,'2025-06-05 01:00:23',0,3,169,'Y'),(2025,'2025-06-05 01:00:23',0,3,170,'Y'),(2026,'2025-06-05 01:00:23',0,3,171,'Y'),(2027,'2025-06-05 01:00:23',0,3,172,'Y'),(2028,'2025-06-05 01:00:23',0,3,173,'Y'),(2031,'2025-06-05 01:00:23',0,11,169,'Y'),(2032,'2025-06-05 01:00:23',0,11,170,'Y'),(2033,'2025-06-05 01:00:23',0,11,171,'Y'),(2034,'2025-06-05 01:00:23',0,11,172,'Y'),(2035,'2025-06-05 01:00:23',0,11,173,'Y'),(2038,'2025-06-05 01:00:23',0,4,169,'N'),(2039,'2025-06-05 01:00:23',0,4,170,'N'),(2040,'2025-06-05 01:00:23',0,4,171,'N'),(2041,'2025-06-05 01:00:23',0,4,172,'N'),(2042,'2025-06-05 01:00:23',0,4,173,'N'),(2043,'2025-06-05 01:00:23',0,5,169,'N'),(2044,'2025-06-05 01:00:23',0,5,170,'N'),(2045,'2025-06-05 01:00:23',0,5,171,'N'),(2046,'2025-06-05 01:00:23',0,5,172,'N'),(2047,'2025-06-05 01:00:23',0,5,173,'N'),(2048,'2025-06-05 01:00:23',0,6,169,'Y'),(2049,'2025-06-05 01:00:23',0,6,170,'Y'),(2050,'2025-06-05 01:00:23',0,6,171,'Y'),(2051,'2025-06-05 01:00:23',0,6,172,'Y'),(2052,'2025-06-05 01:00:23',0,6,173,'Y'),(2053,'2025-06-05 01:00:23',0,7,169,'N'),(2054,'2025-06-05 01:00:23',0,7,170,'N'),(2055,'2025-06-05 01:00:23',0,7,171,'N'),(2056,'2025-06-05 01:00:23',0,7,172,'N'),(2057,'2025-06-05 01:00:23',0,7,173,'N'),(2058,'2025-06-05 01:00:23',0,8,169,'Y'),(2059,'2025-06-05 01:00:23',0,8,170,'Y'),(2060,'2025-06-05 01:00:23',0,8,171,'Y'),(2061,'2025-06-05 01:00:23',0,8,172,'Y'),(2062,'2025-06-05 01:00:23',0,8,173,'Y'),(2063,'2025-06-05 01:00:23',0,9,169,'N'),(2064,'2025-06-05 01:00:23',0,9,170,'N'),(2065,'2025-06-05 01:00:23',0,9,171,'N'),(2066,'2025-06-05 01:00:23',0,9,172,'N'),(2067,'2025-06-05 01:00:23',0,9,173,'N'),(2068,'2025-06-05 01:00:23',0,10,169,'N'),(2069,'2025-06-05 01:00:23',0,10,170,'N'),(2070,'2025-06-05 01:00:23',0,10,171,'N'),(2071,'2025-06-05 01:00:23',0,10,172,'N'),(2072,'2025-06-05 01:00:23',0,10,173,'N'),(2073,'2025-06-05 01:00:23',0,12,169,'Y'),(2074,'2025-06-05 01:00:23',0,12,170,'Y'),(2075,'2025-06-05 01:00:23',0,12,171,'Y'),(2076,'2025-06-05 01:00:23',0,12,172,'Y'),(2077,'2025-06-05 01:00:23',0,12,173,'Y'),(2078,'2025-06-05 01:00:23',0,16,169,'N'),(2079,'2025-06-05 01:00:23',0,16,170,'N'),(2080,'2025-06-05 01:00:23',0,16,171,'N'),(2081,'2025-06-05 01:00:23',0,16,172,'N'),(2082,'2025-06-05 01:00:23',0,16,173,'N'),(2101,'2025-06-05 01:00:23',0,2,1,'N'),(2102,'2025-06-05 01:00:23',0,2,2,'Y'),(2103,'2025-06-05 01:00:23',0,2,3,'N'),(2104,'2025-06-05 01:00:23',0,2,4,'N'),(2105,'2025-06-05 01:00:23',0,2,5,'N'),(2106,'2025-06-05 01:00:23',0,2,6,'N'),(2107,'2025-06-05 01:00:23',0,2,7,'N'),(2108,'2025-06-05 01:00:23',0,2,8,'N'),(2109,'2025-06-05 01:00:23',0,2,9,'N'),(2110,'2025-06-05 01:00:23',0,2,10,'N'),(2111,'2025-06-05 01:00:23',0,2,11,'N'),(2112,'2025-06-05 01:00:23',0,2,12,'N'),(2113,'2025-06-05 01:00:23',0,2,13,'N'),(2114,'2025-06-05 01:00:23',0,2,14,'N'),(2115,'2025-06-05 01:00:23',0,2,15,'N'),(2116,'2025-06-05 01:00:23',0,2,16,'N'),(2117,'2025-06-05 01:00:23',0,2,17,'N'),(2118,'2025-06-05 01:00:23',0,2,18,'N'),(2119,'2025-06-05 01:00:23',0,2,19,'N'),(2120,'2025-06-05 01:00:23',0,2,20,'N'),(2121,'2025-06-05 01:00:23',0,2,21,'N'),(2122,'2025-06-05 01:00:23',0,2,22,'N'),(2123,'2025-06-05 01:00:23',0,2,23,'N'),(2124,'2025-06-05 01:00:23',0,2,24,'N'),(2125,'2025-06-05 01:00:23',0,2,25,'N'),(2126,'2025-06-05 01:00:23',0,2,26,'N'),(2127,'2025-06-05 01:00:23',0,2,27,'N'),(2128,'2025-06-05 01:00:23',0,2,28,'N'),(2129,'2025-06-05 01:00:23',0,2,29,'N'),(2130,'2025-06-05 01:00:23',0,2,30,'N'),(2131,'2025-06-05 01:00:23',0,2,31,'N'),(2132,'2025-06-05 01:00:23',0,2,32,'N'),(2133,'2025-06-05 01:00:23',0,2,33,'N'),(2134,'2025-06-05 01:00:23',0,2,34,'N'),(2135,'2025-06-05 01:00:23',0,2,35,'N'),(2136,'2025-06-05 01:00:23',0,2,36,'N'),(2137,'2025-06-05 01:00:23',0,2,37,'N'),(2138,'2025-06-05 01:00:23',0,2,38,'N'),(2139,'2025-06-05 01:00:23',0,2,39,'N'),(2140,'2025-06-05 01:00:23',0,2,40,'N'),(2141,'2025-06-05 01:00:23',0,2,41,'N'),(2142,'2025-06-05 01:00:23',0,2,42,'N'),(2143,'2025-06-05 01:00:23',0,2,43,'N'),(2144,'2025-06-05 01:00:23',0,2,44,'N'),(2145,'2025-06-05 01:00:23',0,2,45,'N'),(2146,'2025-06-05 01:00:23',0,2,46,'N'),(2147,'2025-06-05 01:00:23',0,2,47,'N'),(2148,'2025-06-05 01:00:23',0,2,48,'N'),(2149,'2025-06-05 01:00:23',0,2,49,'N'),(2150,'2025-06-05 01:00:23',0,2,50,'N'),(2151,'2025-06-05 01:00:23',0,2,51,'N'),(2152,'2025-06-05 01:00:23',0,2,52,'N'),(2153,'2025-06-05 01:00:23',0,2,53,'N'),(2154,'2025-06-05 01:00:23',0,2,54,'N'),(2155,'2025-06-05 01:00:23',0,2,55,'N'),(2156,'2025-06-05 01:00:23',0,2,56,'N'),(2157,'2025-06-05 01:00:23',0,2,57,'N'),(2158,'2025-06-05 01:00:23',0,2,58,'N'),(2159,'2025-06-05 01:00:23',0,2,59,'N'),(2160,'2025-06-05 01:00:23',0,2,60,'N'),(2161,'2025-06-05 01:00:23',0,2,61,'N'),(2162,'2025-06-05 01:00:23',0,2,62,'N'),(2163,'2025-06-05 01:00:23',0,2,63,'N'),(2164,'2025-06-05 01:00:23',0,2,64,'N'),(2165,'2025-06-05 01:00:23',0,2,65,'N'),(2166,'2025-06-05 01:00:23',0,2,66,'N'),(2167,'2025-06-05 01:00:23',0,2,67,'N'),(2168,'2025-06-05 01:00:23',0,2,68,'N'),(2169,'2025-06-05 01:00:23',0,2,69,'N'),(2170,'2025-06-05 01:00:23',0,2,70,'N'),(2171,'2025-06-05 01:00:23',0,2,71,'N'),(2172,'2025-06-05 01:00:23',0,2,72,'N'),(2173,'2025-06-05 01:00:23',0,2,73,'N'),(2174,'2025-06-05 01:00:23',0,2,74,'N'),(2175,'2025-06-05 01:00:23',0,2,75,'N'),(2176,'2025-06-05 01:00:23',0,2,76,'N'),(2177,'2025-06-05 01:00:23',0,2,77,'N'),(2178,'2025-06-05 01:00:23',0,2,78,'N'),(2179,'2025-06-05 01:00:23',0,2,79,'N'),(2180,'2025-06-05 01:00:23',0,2,80,'N'),(2181,'2025-06-05 01:00:23',0,2,81,'N'),(2182,'2025-06-05 01:00:23',0,2,82,'N'),(2183,'2025-06-05 01:00:23',0,2,83,'N'),(2184,'2025-06-05 01:00:23',0,2,84,'N'),(2185,'2025-06-05 01:00:23',0,2,85,'N'),(2186,'2025-06-05 01:00:23',0,2,86,'N'),(2187,'2025-06-05 01:00:23',0,2,87,'N'),(2188,'2025-06-05 01:00:23',0,2,88,'N'),(2189,'2025-06-05 01:00:23',0,2,89,'N'),(2190,'2025-06-05 01:00:23',0,2,90,'N'),(2191,'2025-06-05 01:00:23',0,2,91,'N'),(2192,'2025-06-05 01:00:23',0,2,92,'N'),(2193,'2025-06-05 01:00:23',0,2,93,'N'),(2194,'2025-06-05 01:00:23',0,2,94,'N'),(2195,'2025-06-05 01:00:23',0,2,95,'N'),(2196,'2025-06-05 01:00:23',0,2,96,'N'),(2197,'2025-06-05 01:00:23',0,2,97,'N'),(2198,'2025-06-05 01:00:23',0,2,98,'N'),(2199,'2025-06-05 01:00:23',0,2,99,'N'),(2200,'2025-06-05 01:00:23',0,2,100,'N'),(2201,'2025-06-05 01:00:23',0,2,101,'N'),(2202,'2025-06-05 01:00:23',0,2,102,'N'),(2203,'2025-06-05 01:00:23',0,2,103,'N'),(2204,'2025-06-05 01:00:23',0,2,104,'N'),(2205,'2025-06-05 01:00:23',0,2,105,'N'),(2206,'2025-06-05 01:00:23',0,2,106,'N'),(2207,'2025-06-05 01:00:23',0,2,107,'N'),(2208,'2025-06-05 01:00:23',0,2,108,'N'),(2209,'2025-06-05 01:00:23',0,2,109,'N'),(2210,'2025-06-05 01:00:23',0,2,110,'N'),(2211,'2025-06-05 01:00:23',0,2,111,'N'),(2212,'2025-06-05 01:00:23',0,2,112,'N'),(2213,'2025-06-05 01:00:23',0,2,113,'N'),(2214,'2025-06-05 01:00:23',0,2,114,'N'),(2215,'2025-06-05 01:00:23',0,2,115,'N'),(2216,'2025-06-05 01:00:23',0,2,116,'N'),(2217,'2025-06-05 01:00:23',0,2,117,'N'),(2218,'2025-06-05 01:00:23',0,2,118,'N'),(2219,'2025-06-05 01:00:23',0,2,119,'N'),(2220,'2025-06-05 01:00:23',0,2,120,'N'),(2221,'2025-06-05 01:00:23',0,2,121,'N'),(2222,'2025-06-05 01:00:23',0,2,122,'N'),(2223,'2025-06-05 01:00:23',0,2,123,'N'),(2224,'2025-06-05 01:00:23',0,2,124,'N'),(2225,'2025-06-05 01:00:23',0,2,125,'N'),(2226,'2025-06-05 01:00:23',0,2,126,'N'),(2227,'2025-06-05 01:00:23',0,2,127,'N'),(2228,'2025-06-05 01:00:23',0,2,128,'N'),(2229,'2025-06-05 01:00:23',0,2,129,'N'),(2230,'2025-06-05 01:00:23',0,2,130,'N'),(2231,'2025-06-05 01:00:23',0,2,131,'N'),(2232,'2025-06-05 01:00:23',0,2,132,'N'),(2233,'2025-06-05 01:00:23',0,2,133,'N'),(2234,'2025-06-05 01:00:23',0,2,134,'N'),(2235,'2025-06-05 01:00:23',0,2,135,'N'),(2236,'2025-06-05 01:00:23',0,2,136,'N'),(2237,'2025-06-05 01:00:23',0,2,137,'N'),(2238,'2025-06-05 01:00:23',0,2,138,'N'),(2239,'2025-06-05 01:00:23',0,2,139,'N'),(2240,'2025-06-05 01:00:23',0,2,140,'N'),(2241,'2025-06-05 01:00:23',0,2,141,'N'),(2242,'2025-06-05 01:00:23',0,2,142,'N'),(2243,'2025-06-05 01:00:23',0,2,143,'N'),(2244,'2025-06-05 01:00:23',0,2,144,'N'),(2245,'2025-06-05 01:00:23',0,2,145,'N'),(2246,'2025-06-05 01:00:23',0,2,146,'N'),(2247,'2025-06-05 01:00:23',0,2,147,'N'),(2248,'2025-06-05 01:00:23',0,2,148,'N'),(2249,'2025-06-05 01:00:23',0,2,149,'N'),(2250,'2025-06-05 01:00:23',0,2,150,'N'),(2251,'2025-06-05 01:00:23',0,2,151,'N'),(2252,'2025-06-05 01:00:23',0,2,152,'N'),(2253,'2025-06-05 01:00:23',0,2,153,'N'),(2254,'2025-06-05 01:00:23',0,2,154,'N'),(2255,'2025-06-05 01:00:23',0,2,155,'N'),(2256,'2025-06-05 01:00:23',0,2,156,'N'),(2257,'2025-06-05 01:00:23',0,2,157,'N'),(2258,'2025-06-05 01:00:23',0,2,158,'N'),(2259,'2025-06-05 01:00:23',0,2,159,'N'),(2260,'2025-06-05 01:00:23',0,2,160,'N'),(2261,'2025-06-05 01:00:23',0,2,161,'N'),(2262,'2025-06-05 01:00:23',0,2,162,'N'),(2263,'2025-06-05 01:00:23',0,2,163,'N'),(2264,'2025-06-05 01:00:23',0,2,164,'N'),(2265,'2025-06-05 01:00:23',0,2,165,'N'),(2266,'2025-06-05 01:00:23',0,2,166,'N'),(2267,'2025-06-05 01:00:23',0,2,167,'N'),(2268,'2025-06-05 01:00:23',0,2,168,'N'),(2269,'2025-06-05 01:00:23',0,2,169,'N'),(2270,'2025-06-05 01:00:23',0,2,170,'N'),(2271,'2025-06-05 01:00:23',0,2,171,'N'),(2272,'2025-06-05 01:00:23',0,2,172,'N'),(2273,'2025-06-05 01:00:23',0,2,173,'N'),(2274,'2025-06-05 01:00:23',0,13,1,'N'),(2275,'2025-06-05 01:00:23',0,13,2,'N'),(2276,'2025-06-05 01:00:23',0,13,3,'Y'),(2277,'2025-06-05 01:00:23',0,13,4,'N'),(2278,'2025-06-05 01:00:23',0,13,5,'N'),(2279,'2025-06-05 01:00:23',0,13,6,'N'),(2280,'2025-06-05 01:00:23',0,13,7,'N'),(2281,'2025-06-05 01:00:23',0,13,8,'Y'),(2282,'2025-06-05 01:00:23',0,13,9,'Y'),(2283,'2025-06-05 01:00:23',0,13,10,'Y'),(2284,'2025-06-05 01:00:23',0,13,11,'Y'),(2285,'2025-06-05 01:00:23',0,13,12,'Y'),(2286,'2025-06-05 01:00:23',0,13,13,'Y'),(2287,'2025-06-05 01:00:23',0,13,14,'Y'),(2288,'2025-06-05 01:00:23',0,13,15,'Y'),(2289,'2025-06-05 01:00:23',0,13,16,'Y'),(2290,'2025-06-05 01:00:23',0,13,17,'Y'),(2291,'2025-06-05 01:00:23',0,13,18,'Y'),(2292,'2025-06-05 01:00:23',0,13,19,'Y'),(2293,'2025-06-05 01:00:23',0,13,20,'Y'),(2294,'2025-06-05 01:00:23',0,13,21,'Y'),(2295,'2025-06-05 01:00:23',0,13,22,'Y'),(2296,'2025-06-05 01:00:23',0,13,23,'N'),(2297,'2025-06-05 01:00:23',0,13,24,'Y'),(2298,'2025-06-05 01:00:23',0,13,25,'Y'),(2299,'2025-06-05 01:00:23',0,13,26,'Y'),(2300,'2025-06-05 01:00:23',0,13,27,'Y'),(2301,'2025-06-05 01:00:23',0,13,28,'Y'),(2302,'2025-06-05 01:00:23',0,13,29,'Y'),(2303,'2025-06-05 01:00:23',0,13,30,'Y'),(2304,'2025-06-05 01:00:23',0,13,31,'Y'),(2305,'2025-06-05 01:00:23',0,13,32,'Y'),(2306,'2025-06-05 01:00:23',0,13,33,'Y'),(2307,'2025-06-05 01:00:23',0,13,34,'Y'),(2308,'2025-06-05 01:00:23',0,13,35,'Y'),(2309,'2025-06-05 01:00:23',0,13,36,'Y'),(2310,'2025-06-05 01:00:23',0,13,37,'Y'),(2311,'2025-06-05 01:00:23',0,13,38,'N'),(2312,'2025-06-05 01:00:23',0,13,39,'N'),(2313,'2025-06-05 01:00:23',0,13,40,'N'),(2314,'2025-06-05 01:00:23',0,13,41,'N'),(2315,'2025-06-05 01:00:23',0,13,42,'N'),(2316,'2025-06-05 01:00:23',0,13,43,'N'),(2317,'2025-06-05 01:00:23',0,13,44,'N'),(2318,'2025-06-05 01:00:23',0,13,45,'N'),(2319,'2025-06-05 01:00:23',0,13,46,'N'),(2320,'2025-06-05 01:00:23',0,13,47,'N'),(2321,'2025-06-05 01:00:23',0,13,48,'N'),(2322,'2025-06-05 01:00:23',0,13,49,'N'),(2323,'2025-06-05 01:00:23',0,13,50,'N'),(2324,'2025-06-05 01:00:23',0,13,51,'N'),(2325,'2025-06-05 01:00:23',0,13,52,'N'),(2326,'2025-06-05 01:00:23',0,13,53,'N'),(2327,'2025-06-05 01:00:23',0,13,54,'N'),(2328,'2025-06-05 01:00:23',0,13,55,'N'),(2329,'2025-06-05 01:00:23',0,13,56,'N'),(2330,'2025-06-05 01:00:23',0,13,57,'N'),(2331,'2025-06-05 01:00:23',0,13,58,'N'),(2332,'2025-06-05 01:00:23',0,13,59,'N'),(2333,'2025-06-05 01:00:23',0,13,60,'N'),(2334,'2025-06-05 01:00:23',0,13,61,'N'),(2335,'2025-06-05 01:00:23',0,13,62,'N'),(2336,'2025-06-05 01:00:23',0,13,63,'N'),(2337,'2025-06-05 01:00:23',0,13,64,'N'),(2338,'2025-06-05 01:00:23',0,13,65,'N'),(2339,'2025-06-05 01:00:23',0,13,66,'N'),(2340,'2025-06-05 01:00:23',0,13,67,'N'),(2341,'2025-06-05 01:00:23',0,13,68,'N'),(2342,'2025-06-05 01:00:23',0,13,69,'N'),(2343,'2025-06-05 01:00:23',0,13,70,'Y'),(2344,'2025-06-05 01:00:23',0,13,71,'N'),(2345,'2025-06-05 01:00:23',0,13,72,'N'),(2346,'2025-06-05 01:00:23',0,13,73,'N'),(2347,'2025-06-05 01:00:23',0,13,74,'N'),(2348,'2025-06-05 01:00:23',0,13,75,'N'),(2349,'2025-06-05 01:00:23',0,13,76,'N'),(2350,'2025-06-05 01:00:23',0,13,77,'Y'),(2351,'2025-06-05 01:00:23',0,13,78,'Y'),(2352,'2025-06-05 01:00:23',0,13,79,'Y'),(2353,'2025-06-05 01:00:23',0,13,80,'Y'),(2354,'2025-06-05 01:00:23',0,13,81,'Y'),(2355,'2025-06-05 01:00:23',0,13,82,'Y'),(2356,'2025-06-05 01:00:23',0,13,83,'Y'),(2357,'2025-06-05 01:00:23',0,13,84,'Y'),(2358,'2025-06-05 01:00:23',0,13,85,'Y'),(2359,'2025-06-05 01:00:23',0,13,86,'Y'),(2360,'2025-06-05 01:00:23',0,13,87,'Y'),(2361,'2025-06-05 01:00:23',0,13,88,'Y'),(2362,'2025-06-05 01:00:23',0,13,89,'Y'),(2363,'2025-06-05 01:00:23',0,13,90,'Y'),(2364,'2025-06-05 01:00:23',0,13,91,'Y'),(2365,'2025-06-05 01:00:23',0,13,92,'Y'),(2366,'2025-06-05 01:00:23',0,13,93,'Y'),(2367,'2025-06-05 01:00:23',0,13,94,'Y'),(2368,'2025-06-05 01:00:23',0,13,95,'Y'),(2369,'2025-06-05 01:00:23',0,13,96,'Y'),(2370,'2025-06-05 01:00:23',0,13,97,'Y'),(2371,'2025-06-05 01:00:23',0,13,98,'Y'),(2372,'2025-06-05 01:00:23',0,13,99,'Y'),(2373,'2025-06-05 01:00:23',0,13,100,'Y'),(2374,'2025-06-05 01:00:23',0,13,101,'Y'),(2375,'2025-06-05 01:00:23',0,13,102,'Y'),(2376,'2025-06-05 01:00:23',0,13,103,'Y'),(2377,'2025-06-05 01:00:23',0,13,104,'Y'),(2378,'2025-06-05 01:00:23',0,13,105,'Y'),(2379,'2025-06-05 01:00:23',0,13,106,'Y'),(2380,'2025-06-05 01:00:23',0,13,107,'Y'),(2381,'2025-06-05 01:00:23',0,13,108,'Y'),(2382,'2025-06-05 01:00:23',0,13,109,'Y'),(2383,'2025-06-05 01:00:23',0,13,110,'Y'),(2384,'2025-06-05 01:00:23',0,13,111,'Y'),(2385,'2025-06-05 01:00:23',0,13,112,'Y'),(2386,'2025-06-05 01:00:23',0,13,113,'Y'),(2387,'2025-06-05 01:00:23',0,13,114,'Y'),(2388,'2025-06-05 01:00:23',0,13,115,'Y'),(2389,'2025-06-05 01:00:23',0,13,116,'Y'),(2390,'2025-06-05 01:00:23',0,13,117,'Y'),(2391,'2025-06-05 01:00:23',0,13,118,'Y'),(2392,'2025-06-05 01:00:23',0,13,119,'Y'),(2393,'2025-06-05 01:00:23',0,13,120,'Y'),(2394,'2025-06-05 01:00:23',0,13,121,'Y'),(2395,'2025-06-05 01:00:23',0,13,122,'Y'),(2396,'2025-06-05 01:00:23',0,13,123,'Y'),(2397,'2025-06-05 01:00:23',0,13,124,'Y'),(2398,'2025-06-05 01:00:23',0,13,125,'Y'),(2399,'2025-06-05 01:00:23',0,13,126,'Y'),(2400,'2025-06-05 01:00:23',0,13,127,'N'),(2401,'2025-06-05 01:00:23',0,13,128,'Y'),(2402,'2025-06-05 01:00:23',0,13,129,'Y'),(2403,'2025-06-05 01:00:23',0,13,130,'Y'),(2404,'2025-06-05 01:00:23',0,13,131,'Y'),(2405,'2025-06-05 01:00:23',0,13,132,'Y'),(2406,'2025-06-05 01:00:23',0,13,133,'Y'),(2407,'2025-06-05 01:00:23',0,13,134,'N'),(2408,'2025-06-05 01:00:23',0,13,135,'N'),(2409,'2025-06-05 01:00:23',0,13,136,'N'),(2410,'2025-06-05 01:00:23',0,13,137,'N'),(2411,'2025-06-05 01:00:23',0,13,138,'N'),(2412,'2025-06-05 01:00:23',0,13,139,'N'),(2413,'2025-06-05 01:00:23',0,13,140,'N'),(2414,'2025-06-05 01:00:23',0,13,141,'N'),(2415,'2025-06-05 01:00:23',0,13,142,'N'),(2416,'2025-06-05 01:00:23',0,13,143,'Y'),(2417,'2025-06-05 01:00:23',0,13,144,'Y'),(2418,'2025-06-05 01:00:23',0,13,145,'Y'),(2419,'2025-06-05 01:00:23',0,13,146,'Y'),(2420,'2025-06-05 01:00:23',0,13,147,'Y'),(2421,'2025-06-05 01:00:23',0,13,148,'N'),(2422,'2025-06-05 01:00:23',0,13,149,'N'),(2423,'2025-06-05 01:00:23',0,13,150,'N'),(2424,'2025-06-05 01:00:23',0,13,151,'Y'),(2425,'2025-06-05 01:00:23',0,13,152,'Y'),(2426,'2025-06-05 01:00:23',0,13,153,'Y'),(2427,'2025-06-05 01:00:23',0,13,154,'Y'),(2428,'2025-06-05 01:00:23',0,13,155,'Y'),(2429,'2025-06-05 01:00:23',0,13,156,'Y'),(2430,'2025-06-05 01:00:23',0,13,157,'Y'),(2431,'2025-06-05 01:00:23',0,13,158,'Y'),(2432,'2025-06-05 01:00:23',0,13,159,'Y'),(2433,'2025-06-05 01:00:23',0,13,160,'Y'),(2434,'2025-06-05 01:00:23',0,13,161,'Y'),(2435,'2025-06-05 01:00:23',0,13,162,'Y'),(2436,'2025-06-05 01:00:23',0,13,163,'Y'),(2437,'2025-06-05 01:00:23',0,13,164,'Y'),(2438,'2025-06-05 01:00:23',0,13,165,'Y'),(2439,'2025-06-05 01:00:23',0,13,166,'Y'),(2440,'2025-06-05 01:00:23',0,13,167,'Y'),(2441,'2025-06-05 01:00:23',0,13,168,'Y'),(2442,'2025-06-05 01:00:23',0,13,169,'Y'),(2443,'2025-06-05 01:00:23',0,13,170,'Y'),(2444,'2025-06-05 01:00:23',0,13,171,'Y'),(2445,'2025-06-05 01:00:23',0,13,172,'Y'),(2446,'2025-06-05 01:00:23',0,13,173,'Y'),(2447,'2025-06-05 01:00:23',0,17,1,'N'),(2448,'2025-06-05 01:00:23',0,17,2,'N'),(2449,'2025-06-05 01:00:23',0,17,3,'N'),(2450,'2025-06-05 01:00:23',0,17,4,'N'),(2451,'2025-06-05 01:00:23',0,17,5,'N'),(2452,'2025-06-05 01:00:23',0,17,6,'N'),(2453,'2025-06-05 01:00:23',0,17,7,'N'),(2454,'2025-06-05 01:00:23',0,17,8,'N'),(2455,'2025-06-05 01:00:23',0,17,9,'N'),(2456,'2025-06-05 01:00:23',0,17,10,'N'),(2457,'2025-06-05 01:00:23',0,17,11,'N'),(2458,'2025-06-05 01:00:23',0,17,12,'N'),(2459,'2025-06-05 01:00:23',0,17,13,'N'),(2460,'2025-06-05 01:00:23',0,17,14,'N'),(2461,'2025-06-05 01:00:23',0,17,15,'N'),(2462,'2025-06-05 01:00:23',0,17,16,'N'),(2463,'2025-06-05 01:00:23',0,17,17,'N'),(2464,'2025-06-05 01:00:23',0,17,18,'N'),(2465,'2025-06-05 01:00:23',0,17,19,'N'),(2466,'2025-06-05 01:00:23',0,17,20,'N'),(2467,'2025-06-05 01:00:23',0,17,21,'N'),(2468,'2025-06-05 01:00:23',0,17,22,'N'),(2469,'2025-06-05 01:00:23',0,17,23,'N'),(2470,'2025-06-05 01:00:23',0,17,24,'N'),(2471,'2025-06-05 01:00:23',0,17,25,'N'),(2472,'2025-06-05 01:00:23',0,17,26,'N'),(2473,'2025-06-05 01:00:23',0,17,27,'N'),(2474,'2025-06-05 01:00:23',0,17,28,'N'),(2475,'2025-06-05 01:00:23',0,17,29,'N'),(2476,'2025-06-05 01:00:23',0,17,30,'N'),(2477,'2025-06-05 01:00:23',0,17,31,'N'),(2478,'2025-06-05 01:00:23',0,17,32,'N'),(2479,'2025-06-05 01:00:23',0,17,33,'N'),(2480,'2025-06-05 01:00:23',0,17,34,'N'),(2481,'2025-06-05 01:00:23',0,17,35,'N'),(2482,'2025-06-05 01:00:23',0,17,36,'N'),(2483,'2025-06-05 01:00:23',0,17,37,'N'),(2484,'2025-06-05 01:00:23',0,17,38,'N'),(2485,'2025-06-05 01:00:23',0,17,39,'N'),(2486,'2025-06-05 01:00:23',0,17,40,'N'),(2487,'2025-06-05 01:00:23',0,17,41,'N'),(2488,'2025-06-05 01:00:23',0,17,42,'N'),(2489,'2025-06-05 01:00:23',0,17,43,'N'),(2490,'2025-06-05 01:00:23',0,17,44,'N'),(2491,'2025-06-05 01:00:23',0,17,45,'N'),(2492,'2025-06-05 01:00:23',0,17,46,'N'),(2493,'2025-06-05 01:00:23',0,17,47,'N'),(2494,'2025-06-05 01:00:23',0,17,48,'N'),(2495,'2025-06-05 01:00:23',0,17,49,'N'),(2496,'2025-06-05 01:00:23',0,17,50,'N'),(2497,'2025-06-05 01:00:23',0,17,51,'N'),(2498,'2025-06-05 01:00:23',0,17,52,'N'),(2499,'2025-06-05 01:00:23',0,17,53,'N'),(2500,'2025-06-05 01:00:23',0,17,54,'N'),(2501,'2025-06-05 01:00:23',0,17,55,'N'),(2502,'2025-06-05 01:00:23',0,17,56,'N'),(2503,'2025-06-05 01:00:23',0,17,57,'N'),(2504,'2025-06-05 01:00:23',0,17,58,'N'),(2505,'2025-06-05 01:00:23',0,17,59,'N'),(2506,'2025-06-05 01:00:23',0,17,60,'N'),(2507,'2025-06-05 01:00:23',0,17,61,'N'),(2508,'2025-06-05 01:00:23',0,17,62,'N'),(2509,'2025-06-05 01:00:23',0,17,63,'N'),(2510,'2025-06-05 01:00:23',0,17,64,'N'),(2511,'2025-06-05 01:00:23',0,17,65,'N'),(2512,'2025-06-05 01:00:23',0,17,66,'N'),(2513,'2025-06-05 01:00:23',0,17,67,'N'),(2514,'2025-06-05 01:00:23',0,17,68,'N'),(2515,'2025-06-05 01:00:23',0,17,69,'N'),(2516,'2025-06-05 01:00:23',0,17,70,'N'),(2517,'2025-06-05 01:00:23',0,17,71,'N'),(2518,'2025-06-05 01:00:23',0,17,72,'N'),(2519,'2025-06-05 01:00:23',0,17,73,'N'),(2520,'2025-06-05 01:00:23',0,17,74,'N'),(2521,'2025-06-05 01:00:23',0,17,75,'N'),(2522,'2025-06-05 01:00:23',0,17,76,'N'),(2523,'2025-06-05 01:00:23',0,17,77,'N'),(2524,'2025-06-05 01:00:23',0,17,78,'N'),(2525,'2025-06-05 01:00:23',0,17,79,'N'),(2526,'2025-06-05 01:00:23',0,17,80,'N'),(2527,'2025-06-05 01:00:23',0,17,81,'N'),(2528,'2025-06-05 01:00:23',0,17,82,'N'),(2529,'2025-06-05 01:00:23',0,17,83,'N'),(2530,'2025-06-05 01:00:23',0,17,84,'N'),(2531,'2025-06-05 01:00:23',0,17,85,'N'),(2532,'2025-06-05 01:00:23',0,17,86,'N'),(2533,'2025-06-05 01:00:23',0,17,87,'N'),(2534,'2025-06-05 01:00:23',0,17,88,'N'),(2535,'2025-06-05 01:00:23',0,17,89,'N'),(2536,'2025-06-05 01:00:23',0,17,90,'N'),(2537,'2025-06-05 01:00:23',0,17,91,'N'),(2538,'2025-06-05 01:00:23',0,17,92,'N'),(2539,'2025-06-05 01:00:23',0,17,93,'N'),(2540,'2025-06-05 01:00:23',0,17,94,'N'),(2541,'2025-06-05 01:00:23',0,17,95,'N'),(2542,'2025-06-05 01:00:23',0,17,96,'N'),(2543,'2025-06-05 01:00:23',0,17,97,'N'),(2544,'2025-06-05 01:00:23',0,17,98,'N'),(2545,'2025-06-05 01:00:23',0,17,99,'N'),(2546,'2025-06-05 01:00:23',0,17,100,'N'),(2547,'2025-06-05 01:00:23',0,17,101,'N'),(2548,'2025-06-05 01:00:23',0,17,102,'N'),(2549,'2025-06-05 01:00:23',0,17,103,'N'),(2550,'2025-06-05 01:00:23',0,17,104,'N'),(2551,'2025-06-05 01:00:23',0,17,105,'N'),(2552,'2025-06-05 01:00:23',0,17,106,'N'),(2553,'2025-06-05 01:00:23',0,17,107,'N'),(2554,'2025-06-05 01:00:23',0,17,108,'N'),(2555,'2025-06-05 01:00:23',0,17,109,'N'),(2556,'2025-06-05 01:00:23',0,17,110,'N'),(2557,'2025-06-05 01:00:23',0,17,111,'N'),(2558,'2025-06-05 01:00:23',0,17,112,'N'),(2559,'2025-06-05 01:00:23',0,17,113,'N'),(2560,'2025-06-05 01:00:23',0,17,114,'N'),(2561,'2025-06-05 01:00:23',0,17,115,'N'),(2562,'2025-06-05 01:00:23',0,17,116,'N'),(2563,'2025-06-05 01:00:23',0,17,117,'N'),(2564,'2025-06-05 01:00:23',0,17,118,'N'),(2565,'2025-06-05 01:00:23',0,17,119,'N'),(2566,'2025-06-05 01:00:23',0,17,120,'N'),(2567,'2025-06-05 01:00:23',0,17,121,'N'),(2568,'2025-06-05 01:00:23',0,17,122,'N'),(2569,'2025-06-05 01:00:23',0,17,123,'N'),(2570,'2025-06-05 01:00:23',0,17,124,'N'),(2571,'2025-06-05 01:00:23',0,17,125,'N'),(2572,'2025-06-05 01:00:23',0,17,126,'N'),(2573,'2025-06-05 01:00:23',0,17,127,'N'),(2574,'2025-06-05 01:00:23',0,17,128,'N'),(2575,'2025-06-05 01:00:23',0,17,129,'N'),(2576,'2025-06-05 01:00:23',0,17,130,'N'),(2577,'2025-06-05 01:00:23',0,17,131,'N'),(2578,'2025-06-05 01:00:23',0,17,132,'N'),(2579,'2025-06-05 01:00:23',0,17,133,'N'),(2580,'2025-06-05 01:00:23',0,17,134,'N'),(2581,'2025-06-05 01:00:23',0,17,135,'N'),(2582,'2025-06-05 01:00:23',0,17,136,'N'),(2583,'2025-06-05 01:00:23',0,17,137,'N'),(2584,'2025-06-05 01:00:23',0,17,138,'N'),(2585,'2025-06-05 01:00:23',0,17,139,'N'),(2586,'2025-06-05 01:00:23',0,17,140,'N'),(2587,'2025-06-05 01:00:23',0,17,141,'N'),(2588,'2025-06-05 01:00:23',0,17,142,'N'),(2589,'2025-06-05 01:00:23',0,17,143,'N'),(2590,'2025-06-05 01:00:23',0,17,144,'N'),(2591,'2025-06-05 01:00:23',0,17,145,'N'),(2592,'2025-06-05 01:00:23',0,17,146,'N'),(2593,'2025-06-05 01:00:23',0,17,147,'N'),(2594,'2025-06-05 01:00:23',0,17,148,'N'),(2595,'2025-06-05 01:00:23',0,17,149,'N'),(2596,'2025-06-05 01:00:23',0,17,150,'N'),(2597,'2025-06-05 01:00:23',0,17,151,'N'),(2598,'2025-06-05 01:00:23',0,17,152,'N'),(2599,'2025-06-05 01:00:23',0,17,153,'N'),(2600,'2025-06-05 01:00:23',0,17,154,'N'),(2601,'2025-06-05 01:00:23',0,17,155,'N'),(2602,'2025-06-05 01:00:23',0,17,156,'N'),(2603,'2025-06-05 01:00:23',0,17,157,'N'),(2604,'2025-06-05 01:00:23',0,17,158,'N'),(2605,'2025-06-05 01:00:23',0,17,159,'N'),(2606,'2025-06-05 01:00:23',0,17,160,'N'),(2607,'2025-06-05 01:00:23',0,17,161,'N'),(2608,'2025-06-05 01:00:23',0,17,162,'N'),(2609,'2025-06-05 01:00:23',0,17,163,'N'),(2610,'2025-06-05 01:00:23',0,17,164,'N'),(2611,'2025-06-05 01:00:23',0,17,165,'N'),(2612,'2025-06-05 01:00:23',0,17,166,'N'),(2613,'2025-06-05 01:00:23',0,17,167,'N'),(2614,'2025-06-05 01:00:23',0,17,168,'N'),(2615,'2025-06-05 01:00:23',0,17,169,'N'),(2616,'2025-06-05 01:00:23',0,17,170,'N'),(2617,'2025-06-05 01:00:23',0,17,171,'N'),(2618,'2025-06-05 01:00:23',0,17,172,'N'),(2619,'2025-06-05 01:00:23',0,17,173,'N'),(2620,'2025-06-05 01:00:24',0,1,174,'Y'),(2621,'2025-06-05 01:00:24',0,1,175,'Y'),(2622,'2025-06-05 01:00:24',0,2,174,'Y'),(2623,'2025-06-05 01:00:24',0,2,175,'Y'),(2624,'2025-06-05 01:00:24',0,3,174,'Y'),(2625,'2025-06-05 01:00:24',0,3,175,'Y'),(2626,'2025-06-05 01:00:24',0,5,174,'Y'),(2627,'2025-06-05 01:00:24',0,5,175,'Y'),(2635,'2025-06-05 01:00:24',0,11,174,'N'),(2636,'2025-06-05 01:00:24',0,11,175,'N'),(2637,'2025-06-05 01:00:24',0,9,174,'N'),(2638,'2025-06-05 01:00:24',0,9,175,'N'),(2639,'2025-06-05 01:00:24',0,12,174,'N'),(2640,'2025-06-05 01:00:24',0,12,175,'N'),(2641,'2025-06-05 01:00:24',0,13,174,'N'),(2642,'2025-06-05 01:00:24',0,13,175,'N'),(2643,'2025-06-05 01:00:24',0,10,174,'N'),(2644,'2025-06-05 01:00:24',0,10,175,'N'),(2645,'2025-06-05 01:00:24',0,8,174,'N'),(2646,'2025-06-05 01:00:24',0,8,175,'N'),(2647,'2025-06-05 01:00:24',0,7,174,'N'),(2648,'2025-06-05 01:00:24',0,7,175,'N'),(2649,'2025-06-05 01:00:24',0,4,174,'N'),(2650,'2025-06-05 01:00:24',0,4,175,'N'),(2651,'2025-06-05 01:00:24',0,6,174,'N'),(2652,'2025-06-05 01:00:24',0,6,175,'N'),(2653,'2025-06-05 01:00:24',0,16,174,'N'),(2654,'2025-06-05 01:00:24',0,16,175,'N'),(2655,'2025-06-05 01:00:24',0,17,174,'N'),(2656,'2025-06-05 01:00:24',0,17,175,'N'),(2666,'2026-01-28 17:06:28',0,17,176,'N'),(2667,'2026-01-28 17:06:28',0,16,176,'N'),(2668,'2026-01-28 17:06:28',0,2,176,'Y'),(2669,'2026-01-28 17:06:28',0,5,176,'Y'),(2670,'2026-01-28 17:06:28',0,6,176,'Y'),(2671,'2026-01-28 17:06:28',0,4,176,'Y'),(2672,'2026-01-28 17:06:28',0,7,176,'Y'),(2673,'2026-01-28 17:06:28',0,8,176,'N'),(2674,'2026-01-28 17:06:28',0,10,176,'N'),(2675,'2026-01-28 17:06:28',0,13,176,'N'),(2676,'2026-01-28 17:06:28',0,12,176,'N'),(2677,'2026-01-28 17:06:28',0,9,176,'N'),(2678,'2026-01-28 17:06:28',0,11,176,'N'),(2679,'2026-01-28 17:06:28',0,3,176,'Y'),(2680,'2026-01-28 17:06:28',0,1,176,'N'),(2681,'2026-01-28 17:06:28',0,17,177,'N'),(2682,'2026-01-28 17:06:28',0,16,177,'N'),(2683,'2026-01-28 17:06:28',0,2,177,'Y'),(2684,'2026-01-28 17:06:28',0,5,177,'Y'),(2685,'2026-01-28 17:06:28',0,6,177,'Y'),(2686,'2026-01-28 17:06:28',0,4,177,'Y'),(2687,'2026-01-28 17:06:28',0,7,177,'Y'),(2688,'2026-01-28 17:06:28',0,8,177,'N'),(2689,'2026-01-28 17:06:28',0,10,177,'N'),(2690,'2026-01-28 17:06:28',0,13,177,'N'),(2691,'2026-01-28 17:06:28',0,12,177,'N'),(2692,'2026-01-28 17:06:28',0,9,177,'N'),(2693,'2026-01-28 17:06:28',0,11,177,'N'),(2694,'2026-01-28 17:06:28',0,3,177,'Y'),(2695,'2026-01-28 17:06:28',0,1,177,'N'),(2697,'2026-01-28 17:06:28',0,1,178,'Y'),(2698,'2026-01-28 17:06:28',0,3,178,'N'),(2699,'2026-01-28 17:06:28',0,11,178,'N'),(2700,'2026-01-28 17:06:28',0,9,178,'N'),(2701,'2026-01-28 17:06:28',0,12,178,'N'),(2702,'2026-01-28 17:06:28',0,13,178,'N'),(2703,'2026-01-28 17:06:28',0,10,178,'N'),(2704,'2026-01-28 17:06:28',0,8,178,'N'),(2705,'2026-01-28 17:06:28',0,7,178,'N'),(2706,'2026-01-28 17:06:28',0,4,178,'N'),(2707,'2026-01-28 17:06:28',0,6,178,'N'),(2708,'2026-01-28 17:06:28',0,5,178,'N'),(2709,'2026-01-28 17:06:28',0,2,178,'N'),(2710,'2026-01-28 17:06:28',0,16,178,'N'),(2711,'2026-01-28 17:06:28',0,17,178,'N'),(2712,'2026-01-28 17:06:28',0,1,179,'Y'),(2713,'2026-01-28 17:06:28',0,1,180,'Y'),(2714,'2026-01-28 17:06:28',0,1,181,'Y'),(2715,'2026-01-28 17:06:28',0,1,182,'Y'),(2719,'2026-01-28 17:06:28',0,3,182,'N'),(2720,'2026-01-28 17:06:28',0,3,181,'N'),(2721,'2026-01-28 17:06:28',0,3,180,'N'),(2722,'2026-01-28 17:06:28',0,3,179,'N'),(2723,'2026-01-28 17:06:28',0,11,182,'N'),(2724,'2026-01-28 17:06:28',0,11,181,'N'),(2725,'2026-01-28 17:06:28',0,11,180,'N'),(2726,'2026-01-28 17:06:28',0,11,179,'N'),(2727,'2026-01-28 17:06:28',0,9,182,'N'),(2728,'2026-01-28 17:06:28',0,9,181,'N'),(2729,'2026-01-28 17:06:28',0,9,180,'N'),(2730,'2026-01-28 17:06:28',0,9,179,'N'),(2731,'2026-01-28 17:06:28',0,12,182,'N'),(2732,'2026-01-28 17:06:28',0,12,181,'N'),(2733,'2026-01-28 17:06:28',0,12,180,'N'),(2734,'2026-01-28 17:06:28',0,12,179,'N'),(2735,'2026-01-28 17:06:28',0,13,182,'N'),(2736,'2026-01-28 17:06:28',0,13,181,'N'),(2737,'2026-01-28 17:06:28',0,13,180,'N'),(2738,'2026-01-28 17:06:28',0,13,179,'N'),(2739,'2026-01-28 17:06:28',0,10,182,'N'),(2740,'2026-01-28 17:06:28',0,10,181,'N'),(2741,'2026-01-28 17:06:28',0,10,180,'N'),(2742,'2026-01-28 17:06:28',0,10,179,'N'),(2743,'2026-01-28 17:06:28',0,8,182,'N'),(2744,'2026-01-28 17:06:28',0,8,181,'N'),(2745,'2026-01-28 17:06:28',0,8,180,'N'),(2746,'2026-01-28 17:06:28',0,8,179,'N'),(2747,'2026-01-28 17:06:28',0,7,182,'N'),(2748,'2026-01-28 17:06:28',0,7,181,'N'),(2749,'2026-01-28 17:06:28',0,7,180,'N'),(2750,'2026-01-28 17:06:28',0,7,179,'N'),(2751,'2026-01-28 17:06:28',0,4,182,'N'),(2752,'2026-01-28 17:06:28',0,4,181,'N'),(2753,'2026-01-28 17:06:28',0,4,180,'N'),(2754,'2026-01-28 17:06:28',0,4,179,'N'),(2755,'2026-01-28 17:06:28',0,6,182,'N'),(2756,'2026-01-28 17:06:28',0,6,181,'N'),(2757,'2026-01-28 17:06:28',0,6,180,'N'),(2758,'2026-01-28 17:06:28',0,6,179,'N'),(2759,'2026-01-28 17:06:28',0,5,182,'N'),(2760,'2026-01-28 17:06:28',0,5,181,'N'),(2761,'2026-01-28 17:06:28',0,5,180,'N'),(2762,'2026-01-28 17:06:28',0,5,179,'N'),(2763,'2026-01-28 17:06:28',0,2,182,'N'),(2764,'2026-01-28 17:06:28',0,2,181,'N'),(2765,'2026-01-28 17:06:28',0,2,180,'N'),(2766,'2026-01-28 17:06:28',0,2,179,'N'),(2767,'2026-01-28 17:06:28',0,16,182,'N'),(2768,'2026-01-28 17:06:28',0,16,181,'N'),(2769,'2026-01-28 17:06:28',0,16,180,'N'),(2770,'2026-01-28 17:06:28',0,16,179,'N'),(2771,'2026-01-28 17:06:28',0,17,182,'N'),(2772,'2026-01-28 17:06:28',0,17,181,'N'),(2773,'2026-01-28 17:06:28',0,17,180,'N'),(2774,'2026-01-28 17:06:28',0,17,179,'N'),(2782,'2026-01-28 17:06:29',0,1,183,'Y'),(2783,'2026-01-28 17:06:29',0,3,183,'N'),(2784,'2026-01-28 17:06:29',0,11,183,'N'),(2785,'2026-01-28 17:06:29',0,9,183,'N'),(2786,'2026-01-28 17:06:29',0,12,183,'N'),(2787,'2026-01-28 17:06:29',0,13,183,'N'),(2788,'2026-01-28 17:06:29',0,10,183,'N'),(2789,'2026-01-28 17:06:29',0,8,183,'N'),(2790,'2026-01-28 17:06:29',0,7,183,'N'),(2791,'2026-01-28 17:06:29',0,4,183,'N'),(2792,'2026-01-28 17:06:29',0,6,183,'N'),(2793,'2026-01-28 17:06:29',0,5,183,'N'),(2794,'2026-01-28 17:06:29',0,2,183,'N'),(2795,'2026-01-28 17:06:29',0,16,183,'N'),(2796,'2026-01-28 17:06:29',0,17,183,'N');
/*!40000 ALTER TABLE `profile_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_rights`
--

DROP TABLE IF EXISTS `profile_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_rights` (
  `prr_ser` int NOT NULL AUTO_INCREMENT,
  `prr_date` datetime DEFAULT NULL,
  `prr_by_user` int DEFAULT '0',
  `prr_rank` int DEFAULT '0',
  `prr_type` varchar(20) NOT NULL,
  `prr_label` varchar(255) NOT NULL,
  `prr_tag` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`prr_ser`),
  KEY `prr_rank` (`prr_rank`),
  KEY `prr_type` (`prr_type`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_rights`
--

LOCK TABLES `profile_rights` WRITE;
/*!40000 ALTER TABLE `profile_rights` DISABLE KEYS */;
INSERT INTO `profile_rights` VALUES (1,'2025-06-05 01:00:23',0,20,'ADMIN','Edit profile rights','ADMIN_1'),(2,'2025-06-05 01:00:23',0,40,'API','Access API page','API_2'),(3,'2025-06-05 01:00:23',0,110,'RECORD','Record list','RECORD_3'),(4,'2025-06-05 01:00:23',0,120,'RECORD','Delete a record','RECORD_4'),(5,'2025-06-05 01:00:23',0,200,'RECORD','Biological work list','RECORD_5'),(6,'2025-06-05 01:00:23',0,250,'RECORD','Biological validation','RECORD_6'),(7,'2025-06-05 01:00:23',0,270,'RECORD','Grouped biological validation','RECORD_7'),(8,'2025-06-05 01:00:23',0,300,'RECORD','Technical work list','RECORD_8'),(9,'2025-06-05 01:00:23',0,350,'RECORD','Technical validation','RECORD_9'),(10,'2025-06-05 01:00:23',0,400,'RECORD','Global report','RECORD_10'),(11,'2025-06-05 01:00:23',0,450,'RECORD','New external request','RECORD_11'),(12,'2025-06-05 01:00:23',0,500,'RECORD','New inpatient request','RECORD_12'),(13,'2025-06-05 01:00:23',0,550,'RECORD','Pending collection status','RECORD_13'),(14,'2025-06-05 01:00:23',0,600,'RECORD','Result entry','RECORD_14'),(15,'2025-06-05 01:00:23',0,620,'RECORD','Save a result','RECORD_15'),(16,'2025-06-05 01:00:23',0,640,'RECORD','Download a bench sheet','RECORD_16'),(17,'2025-06-05 01:00:23',0,660,'RECORD','Add new analyses','RECORD_17'),(18,'2025-06-05 01:00:23',0,700,'RECORD','Administrative file','RECORD_18'),(19,'2025-06-05 01:00:23',0,720,'RECORD','Download a file attachment','RECORD_19'),(20,'2025-06-05 01:00:23',0,740,'RECORD','Download the transfer form','RECORD_20'),(21,'2025-06-05 01:00:23',0,760,'RECORD','Download file label','RECORD_21'),(22,'2025-06-05 01:00:23',0,780,'RECORD','Download the invoice','RECORD_22'),(23,'2025-06-05 01:00:23',0,800,'RECORD','Re-download a report','RECORD_23'),(24,'2025-06-05 01:00:23',0,820,'RECORD','Re-edit a report','RECORD_24'),(25,'2025-06-05 01:00:23',0,840,'RECORD','Delete a file attachment','RECORD_25'),(26,'2025-06-05 01:00:23',0,2100,'REPORT','Activity report','REPORT_26'),(27,'2025-06-05 01:00:23',0,2200,'REPORT','Epidemiological report','REPORT_27'),(28,'2025-06-05 01:00:23',0,2300,'REPORT','Indicators report','REPORT_28'),(29,'2025-06-05 01:00:23',0,2400,'REPORT','Statistical report','REPORT_29'),(30,'2025-06-05 01:00:23',0,2500,'REPORT','Turnaround time report','REPORT_30'),(31,'2025-06-05 01:00:23',0,2600,'REPORT','Pivot table','REPORT_31'),(32,'2025-06-05 01:00:23',0,2700,'REPORT','DHIS2 export','REPORT_32'),(33,'2025-06-05 01:00:23',0,2800,'REPORT','WHONET export','REPORT_33'),(34,'2025-06-05 01:00:23',0,2900,'REPORT','Patient history','REPORT_34'),(35,'2025-06-05 01:00:23',0,3000,'REPORT','Historique d\'analyse','REPORT_35'),(36,'2025-06-05 01:00:23',0,3100,'REPORT','End of day report','REPORT_36'),(37,'2025-06-05 01:00:23',0,3200,'REPORT','Daily billing status','REPORT_37'),(38,'2025-06-05 01:00:23',0,5100,'SETTING','Preferences','SETTING_38'),(39,'2025-06-05 01:00:23',0,5200,'SETTING','User management','SETTING_39'),(40,'2025-06-05 01:00:23',0,5250,'SETTING','Import users','SETTING_40'),(41,'2025-06-05 01:00:23',0,5300,'SETTING','Add a user','SETTING_41'),(42,'2025-06-05 01:00:23',0,5400,'SETTING','Analysis reference','SETTING_42'),(43,'2025-06-05 01:00:23',0,5450,'SETTING','Import the reference','SETTING_43'),(44,'2025-06-05 01:00:23',0,5500,'SETTING','Enable or disable an analysis','SETTING_44'),(45,'2025-06-05 01:00:23',0,5550,'SETTING','Analysis status','SETTING_45'),(46,'2025-06-05 01:00:23',0,5600,'SETTING','Configure WHONET export for an analysis','SETTING_46'),(47,'2025-06-05 01:00:23',0,5650,'SETTING','Modification code var d\'une analyse','SETTING_47'),(48,'2025-06-05 01:00:23',0,6000,'SETTING','Analyzer configuration','SETTING_48'),(49,'2025-06-05 01:00:23',0,6020,'SETTING','Add an analyzer','SETTING_49'),(50,'2025-06-05 01:00:23',0,6040,'SETTING','Edit an analyzer','SETTING_50'),(51,'2025-06-05 01:00:23',0,6060,'SETTING','Delete an analyzer','SETTING_51'),(52,'2025-06-05 01:00:23',0,6200,'SETTING','Dictionaries','SETTING_52'),(53,'2025-06-05 01:00:23',0,6220,'SETTING','Dictionary import','SETTING_53'),(54,'2025-06-05 01:00:23',0,6300,'SETTING','Backup configuration','SETTING_54'),(55,'2025-06-05 01:00:23',0,6400,'SETTING','Logo configuration','SETTING_55'),(56,'2025-06-05 01:00:23',0,6500,'SETTING','Age interval configuration','SETTING_56'),(57,'2025-06-05 01:00:23',0,6600,'SETTING','Requesting services configuration','SETTING_57'),(58,'2025-06-05 01:00:23',0,6700,'SETTING','Functional units configuration','SETTING_58'),(59,'2025-06-05 01:00:23',0,7000,'SETTING','Document template configuration','SETTING_59'),(60,'2025-06-05 01:00:23',0,7020,'SETTING','Add a document template','SETTING_60'),(61,'2025-06-05 01:00:23',0,7040,'SETTING','Edit a document template','SETTING_61'),(62,'2025-06-05 01:00:23',0,7060,'SETTING','Test a document template','SETTING_62'),(63,'2025-06-05 01:00:23',0,7080,'SETTING','Delete a document template','SETTING_63'),(64,'2025-06-05 01:00:23',0,7200,'SETTING','Report configuration','SETTING_64'),(65,'2025-06-05 01:00:23',0,7300,'SETTING','File number configuration','SETTING_65'),(66,'2025-06-05 01:00:23',0,7400,'SETTING','Manual configuration','SETTING_66'),(67,'2025-06-05 01:00:23',0,7500,'SETTING','Postal code configuration','SETTING_67'),(68,'2025-06-05 01:00:23',0,7600,'SETTING','Storage configuration','SETTING_68'),(69,'2025-06-05 01:00:23',0,7700,'SETTING','Form configuration','SETTING_69'),(70,'2025-06-05 01:00:23',0,7800,'SETTING','Patient file management','SETTING_70'),(71,'2025-06-05 01:00:23',0,7900,'SETTING','DHIS2 configuration','SETTING_71'),(72,'2025-06-05 01:00:23',0,7920,'SETTING','Add a DHIS2 API platform','SETTING_72'),(73,'2025-06-05 01:00:23',0,7940,'SETTING','Edit a DHIS2 API platform','SETTING_73'),(74,'2025-06-05 01:00:23',0,7960,'SETTING','Delete a DHIS2 API platform','SETTING_74'),(75,'2025-06-05 01:00:23',0,8000,'SETTING','Epidemio configuration','SETTING_75'),(76,'2025-06-05 01:00:23',0,8100,'SETTING','Configuration du rapport d\'indicateurs','SETTING_76'),(77,'2025-06-05 01:00:23',0,20100,'GEN','General','GEN_77'),(78,'2025-06-05 01:00:23',0,20200,'LAB','Laboratory','LAB_78'),(79,'2025-06-05 01:00:23',0,20220,'LAB','Add a laboratory','LAB_79'),(80,'2025-06-05 01:00:23',0,20240,'LAB','Download an organigram','LAB_80'),(81,'2025-06-05 01:00:23',0,20260,'LAB','Delete a laboratory','LAB_81'),(82,'2025-06-05 01:00:23',0,20300,'STAFF','Staff','STAFF_82'),(83,'2025-06-05 01:00:23',0,20320,'STAFF','Add a staff member','STAFF_83'),(84,'2025-06-05 01:00:23',0,20340,'STAFF','Edit a staff member','STAFF_84'),(85,'2025-06-05 01:00:23',0,20360,'STAFF','Staff export','STAFF_85'),(86,'2025-06-05 01:00:23',0,20400,'DOCTOR','Prescribers','DOCTOR_86'),(87,'2025-06-05 01:00:23',0,20420,'DOCTOR','Add a prescriber','DOCTOR_87'),(88,'2025-06-05 01:00:23',0,20440,'DOCTOR','Edit a prescriber','DOCTOR_88'),(89,'2025-06-05 01:00:23',0,20460,'DOCTOR','Delete a prescriber','DOCTOR_89'),(90,'2025-06-05 01:00:23',0,20480,'DOCTOR','Prescriber export','DOCTOR_90'),(91,'2025-06-05 01:00:23',0,20500,'SUPPLIER','Suppliers','SUPPLIER_91'),(92,'2025-06-05 01:00:23',0,20520,'SUPPLIER','Add a supplier','SUPPLIER_92'),(93,'2025-06-05 01:00:23',0,20540,'SUPPLIER','Edit a supplier','SUPPLIER_93'),(94,'2025-06-05 01:00:23',0,20560,'SUPPLIER','Delete a supplier','SUPPLIER_94'),(95,'2025-06-05 01:00:23',0,20580,'SUPPLIER','Supplier export','SUPPLIER_95'),(96,'2025-06-05 01:00:23',0,20600,'EQP','Equipment','EQP_96'),(97,'2025-06-05 01:00:23',0,20620,'EQP','Add equipment','EQP_97'),(98,'2025-06-05 01:00:23',0,20640,'EQP','Edit equipment','EQP_98'),(99,'2025-06-05 01:00:23',0,20660,'EQP','Delete equipment','EQP_99'),(100,'2025-06-05 01:00:23',0,20680,'EQP','Equipment export','EQP_100'),(101,'2025-06-05 01:00:23',0,20700,'EQP','Delete equipment file','EQP_101'),(102,'2025-06-05 01:00:23',0,20800,'EQP','Equipment – Document','EQP_102'),(103,'2025-06-05 01:00:23',0,21000,'EQP','Equipment – Maintenance','EQP_103'),(104,'2025-06-05 01:00:23',0,21020,'EQP','Add a maintenance','EQP_104'),(105,'2025-06-05 01:00:23',0,21060,'EQP','Delete a maintenance','EQP_105'),(106,'2025-06-05 01:00:23',0,21080,'EQP','Maintenance export','EQP_106'),(107,'2025-06-05 01:00:23',0,21100,'EQP','Delete maintenance file','EQP_107'),(108,'2025-06-05 01:00:23',0,21220,'EQP','Add a preventive maintenance','EQP_108'),(109,'2025-06-05 01:00:23',0,21260,'EQP','Delete a preventive maintenance','EQP_109'),(110,'2025-06-05 01:00:23',0,21280,'EQP','Preventive maintenance export','EQP_110'),(111,'2025-06-05 01:00:23',0,21300,'EQP','Delete preventive maintenance file','EQP_111'),(112,'2025-06-05 01:00:23',0,21400,'EQP','Equipment – Breakdown and repair','EQP_112'),(113,'2025-06-05 01:00:23',0,21420,'EQP','Add a breakdown or repair','EQP_113'),(114,'2025-06-05 01:00:23',0,21460,'EQP','Delete a breakdown or repair','EQP_114'),(115,'2025-06-05 01:00:23',0,21480,'EQP','Breakdown and repair export','EQP_115'),(116,'2025-06-05 01:00:23',0,21500,'EQP','Delete breakdown or repair file','EQP_116'),(117,'2025-06-05 01:00:23',0,21600,'EQP','Equipment – Metrology','EQP_117'),(118,'2025-06-05 01:00:23',0,21620,'EQP','Add metrology or calibration','EQP_118'),(119,'2025-06-05 01:00:23',0,21660,'EQP','Delete metrology or calibration file','EQP_119'),(120,'2025-06-05 01:00:23',0,22000,'MANUAL','Manuals','MANUAL_120'),(121,'2025-06-05 01:00:23',0,22020,'MANUAL','Add a manual','MANUAL_121'),(122,'2025-06-05 01:00:23',0,22040,'MANUAL','Edit a manual','MANUAL_122'),(123,'2025-06-05 01:00:23',0,22060,'MANUAL','Delete a manual','MANUAL_123'),(124,'2025-06-05 01:00:23',0,22080,'MANUAL','Manual export','MANUAL_124'),(125,'2025-06-05 01:00:23',0,22100,'MANUAL','Delete manual file','MANUAL_125'),(126,'2025-06-05 01:00:23',0,22200,'PROCEDURE','Procedures','PROCEDURE_126'),(127,'2025-06-05 01:00:23',0,22210,'PROCEDURE','Procedure consultation table','PROCEDURE_127'),(128,'2025-06-05 01:00:23',0,22220,'PROCEDURE','Add a procedure','PROCEDURE_128'),(129,'2025-06-05 01:00:23',0,22240,'PROCEDURE','Edit a procedure','PROCEDURE_129'),(130,'2025-06-05 01:00:23',0,22260,'PROCEDURE','Delete a procedure','PROCEDURE_130'),(131,'2025-06-05 01:00:23',0,22280,'PROCEDURE','Procedure export','PROCEDURE_131'),(132,'2025-06-05 01:00:23',0,22300,'PROCEDURE','Delete procedure file','PROCEDURE_132'),(133,'2025-06-05 01:00:23',0,23000,'STOCK','Stock management','STOCK_133'),(134,'2025-06-05 01:00:23',0,23020,'STOCK','Add a product','STOCK_134'),(135,'2025-06-05 01:00:23',0,23040,'STOCK','Edit a product','STOCK_135'),(136,'2025-06-05 01:00:23',0,23060,'STOCK','Delete a product','STOCK_136'),(137,'2025-06-05 01:00:23',0,23080,'STOCK','Product export','STOCK_137'),(138,'2025-06-05 01:00:23',0,23200,'STOCK','Product history','STOCK_138'),(139,'2025-06-05 01:00:23',0,23300,'STOCK','Indicate quantity used','STOCK_139'),(140,'2025-06-05 01:00:23',0,23400,'STOCK','Stock cancellation','STOCK_140'),(141,'2025-06-05 01:00:23',0,23500,'STOCK','Remove empty stock line','STOCK_141'),(142,'2025-06-05 01:00:23',0,23600,'STOCK','Product catalog','STOCK_142'),(143,'2025-06-05 01:00:23',0,24000,'NONCONF','Non-conformity modules','NONCONF_143'),(144,'2025-06-05 01:00:23',0,24020,'NONCONF','Add a non-conformity','NONCONF_144'),(145,'2025-06-05 01:00:23',0,24040,'NONCONF','Edit a non-conformity','NONCONF_145'),(146,'2025-06-05 01:00:23',0,24060,'NONCONF','Delete a non-conformity','NONCONF_146'),(147,'2025-06-05 01:00:23',0,24080,'NONCONF','Non-conformity export','NONCONF_147'),(148,'2025-06-05 01:00:23',0,24100,'NONCONF','Non-conformity follow-up','NONCONF_148'),(149,'2025-06-05 01:00:23',0,24200,'NONCONF','Mise en place d\'une action correctrice','NONCONF_149'),(150,'2025-06-05 01:00:23',0,24300,'NONCONF','Non-conformity closure','NONCONF_150'),(151,'2025-06-05 01:00:23',0,25000,'CTRLINT','Internal quality control','CTRLINT_151'),(152,'2025-06-05 01:00:23',0,25020,'CTRLINT','Add an internal control','CTRLINT_152'),(153,'2025-06-05 01:00:23',0,25040,'CTRLINT','Edit an internal control','CTRLINT_153'),(154,'2025-06-05 01:00:23',0,25080,'CTRLINT','Internal control export','CTRLINT_154'),(155,'2025-06-05 01:00:23',0,25120,'CTRLINT','Add an internal control result','CTRLINT_155'),(156,'2025-06-05 01:00:23',0,25180,'CTRLINT','Internal control results export','CTRLINT_156'),(157,'2025-06-05 01:00:23',0,26000,'CTRLEXT','External quality control','CTRLEXT_157'),(158,'2025-06-05 01:00:23',0,26020,'CTRLEXT','Add an external control','CTRLEXT_158'),(159,'2025-06-05 01:00:23',0,26040,'CTRLEXT','Edit an external control','CTRLEXT_159'),(160,'2025-06-05 01:00:23',0,26080,'CTRLEXT','External control export','CTRLEXT_160'),(161,'2025-06-05 01:00:23',0,26120,'CTRLEXT','Add an external control result','CTRLEXT_161'),(162,'2025-06-05 01:00:23',0,26180,'CTRLEXT','External control results export','CTRLEXT_162'),(163,'2025-06-05 01:00:23',0,27000,'MEETING','Laboratory meeting','MEETING_163'),(164,'2025-06-05 01:00:23',0,27020,'MEETING','Add a meeting','MEETING_164'),(165,'2025-06-05 01:00:23',0,27040,'MEETING','Edit a meeting','MEETING_165'),(166,'2025-06-05 01:00:23',0,27060,'MEETING','Delete a meeting','MEETING_166'),(167,'2025-06-05 01:00:23',0,27080,'MEETING','Meeting export','MEETING_167'),(168,'2025-06-05 01:00:23',0,27100,'MEETING','Delete meeting file','MEETING_168'),(169,'2025-06-05 01:00:23',0,28000,'ALIQUOT','Sample management','ALIQUOT_169'),(170,'2025-06-05 01:00:23',0,28020,'ALIQUOT','Add an item','ALIQUOT_170'),(171,'2025-06-05 01:00:23',0,28040,'ALIQUOT','Edit an item','ALIQUOT_171'),(172,'2025-06-05 01:00:23',0,28050,'ALIQUOT','Unstock an item','ALIQUOT_172'),(173,'2025-06-05 01:00:23',0,28060,'ALIQUOT','Delete an item','ALIQUOT_173'),(174,'2025-06-05 01:00:24',0,29000,'PRINT','Printer configuration','PRINT_174'),(175,'2025-06-05 01:00:24',0,30000,'LITE','LabBook Lite configuration','LITE_175'),(176,'2026-01-28 17:06:28',0,920,'RECORD','Send the report','RECORD_176'),(177,'2026-01-28 17:06:28',0,940,'RECORD','Sending list','RECORD_177'),(178,'2026-01-28 17:06:28',0,7250,'SETTING','Sending methods configuration','SETTING_178'),(179,'2026-01-28 17:06:28',0,31000,'AUTO','Automation configuration','AUTO_179'),(180,'2026-01-28 17:06:28',0,31020,'AUTO','Add an item','AUTO_180'),(181,'2026-01-28 17:06:28',0,31040,'AUTO','Edit an item','AUTO_181'),(182,'2026-01-28 17:06:28',0,31060,'AUTO','Delete an item','AUTO_182'),(183,'2026-01-28 17:06:29',0,30,'ADMIN','View audit log','ADMIN_183');
/*!40000 ALTER TABLE `profile_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_role`
--

DROP TABLE IF EXISTS `profile_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profile_role` (
  `pro_ser` int NOT NULL AUTO_INCREMENT,
  `pro_date` datetime DEFAULT NULL,
  `pro_by_user` int DEFAULT '0',
  `pro_role` int NOT NULL,
  `pro_label` varchar(255) NOT NULL,
  `pro_genuine` varchar(1) NOT NULL DEFAULT 'N',
  `pro_color_1` varchar(10) NOT NULL DEFAULT '#EEEEEE',
  `pro_color_2` varchar(10) NOT NULL DEFAULT '#DDDDDD',
  `pro_text_color` varchar(10) NOT NULL DEFAULT '#FFFFFF',
  PRIMARY KEY (`pro_ser`),
  KEY `pro_role` (`pro_role`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_role`
--

LOCK TABLES `profile_role` WRITE;
/*!40000 ALTER TABLE `profile_role` DISABLE KEYS */;
INSERT INTO `profile_role` VALUES (1,'2025-06-05 01:00:23',0,1,'Administrator','Y','#FFCC00','#E89400','#FFFFFF'),(2,'2025-06-05 01:00:23',0,13,'API','Y','#EEEEEE','#DDDDDD','#FFFFFF'),(3,'2025-06-05 01:00:23',0,2,'Biologist','Y','#8330E2','#42159B','#FFFFFF'),(4,'2025-06-05 01:00:23',0,10,'Stock manager','Y','#452ED1','#292EBE','#FFFFFF'),(5,'2025-06-05 01:00:23',0,12,'Laboratory','Y','#BB2688','#A52396','#FFFFFF'),(6,'2025-06-05 01:00:23',0,11,'Personal','Y','#EEEEEE','#DDDDDD','#FFFFFF'),(7,'2025-06-05 01:00:23',0,9,'Prescriptor','Y','#996633','#623201','#FFFFFF'),(8,'2025-06-05 01:00:23',0,8,'Qualitician','Y','#E23176','#AB2759','#FFFFFF'),(9,'2025-06-05 01:00:23',0,4,'Secretary','Y','#EF8839','#D36818','#FFFFFF'),(10,'2025-06-05 01:00:23',0,7,'Advanced Secretary','Y','#EF8839','#D36818','#FFFFFF'),(11,'2025-06-05 01:00:23',0,3,'Technician','Y','#29B4ED','#1499D2','#FFFFFF'),(12,'2025-06-05 01:00:23',0,5,'Advanced Technician','Y','#29B4ED','#1499D2','#FFFFFF'),(13,'2025-06-05 01:00:23',0,6,'Quality Technician','Y','#29B4ED','#1499D2','#FFFFFF'),(16,'2025-06-05 01:00:23',0,14,'Sampler','Y','#66994F','#3D5B2F','#FFFFFF'),(17,'2025-06-05 01:00:23',0,15,'Agent','Y','#FFFFFF','#E3E3E3','#000000');
/*!40000 ALTER TABLE `profile_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_file`
--

DROP TABLE IF EXISTS `record_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_file`
--

LOCK TABLES `record_file` WRITE;
/*!40000 ALTER TABLE `record_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_file_deleted`
--

DROP TABLE IF EXISTS `record_file_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_file_deleted` (
  `id_data` int unsigned NOT NULL,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  KEY `id_data` (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_file_deleted`
--

LOCK TABLES `record_file_deleted` WRITE;
/*!40000 ALTER TABLE `record_file_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_file_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_setting`
--

DROP TABLE IF EXISTS `record_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_setting` (
  `rstg_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `rstg_user` int unsigned DEFAULT NULL,
  `rstg_date` datetime DEFAULT NULL,
  `rstg_date_upd` datetime DEFAULT NULL,
  `rstg_user_upd` int unsigned DEFAULT NULL,
  `rstg_period` int unsigned DEFAULT NULL,
  `rstg_format` int unsigned DEFAULT NULL,
  `rstg_samp_mask` varchar(128) DEFAULT NULL,
  `rstg_samp_regex` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`rstg_ser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_setting`
--

LOCK TABLES `record_setting` WRITE;
/*!40000 ALTER TABLE `record_setting` DISABLE KEYS */;
INSERT INTO `record_setting` VALUES (1,1,'2017-04-14 15:58:16','2017-04-19 17:12:11',100,1070,1072,NULL,NULL);
/*!40000 ALTER TABLE `record_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record_validation`
--

DROP TABLE IF EXISTS `record_validation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `record_validation` (
  `rev_ser` int NOT NULL AUTO_INCREMENT,
  `rev_date` datetime DEFAULT NULL,
  `rev_user` int DEFAULT '0',
  `rev_rec` int DEFAULT '0',
  `rev_comm` text,
  PRIMARY KEY (`rev_ser`),
  KEY `rev_user` (`rev_user`),
  KEY `rev_rec` (`rev_rec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record_validation`
--

LOCK TABLES `record_validation` WRITE;
/*!40000 ALTER TABLE `record_validation` DISABLE KEYS */;
/*!40000 ALTER TABLE `record_validation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requesting_services`
--

DROP TABLE IF EXISTS `requesting_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requesting_services` (
  `rqs_ser` int NOT NULL AUTO_INCREMENT,
  `rqs_date` datetime DEFAULT NULL,
  `rqs_rank` int DEFAULT '0',
  `rqs_name` varchar(255) NOT NULL,
  PRIMARY KEY (`rqs_ser`),
  KEY `rqs_rank` (`rqs_rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requesting_services`
--

LOCK TABLES `requesting_services` WRITE;
/*!40000 ALTER TABLE `requesting_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `requesting_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sample_destock`
--

DROP TABLE IF EXISTS `sample_destock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sample_destock` (
  `sad_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sad_date` datetime DEFAULT NULL,
  `sad_user` int unsigned DEFAULT NULL,
  `sad_aliquot` int unsigned NOT NULL,
  `sad_reason` text NOT NULL,
  `sad_external` varchar(1) DEFAULT 'N',
  `sad_location` varchar(255) DEFAULT '',
  `sad_destock_date` datetime DEFAULT NULL,
  `sad_restock_date` datetime DEFAULT NULL,
  `sad_restock_user` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sad_ser`),
  KEY `sad_aliquot` (`sad_aliquot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sample_destock`
--

LOCK TABLES `sample_destock` WRITE;
/*!40000 ALTER TABLE `sample_destock` DISABLE KEYS */;
/*!40000 ALTER TABLE `sample_destock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sending_event`
--

DROP TABLE IF EXISTS `sending_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sending_event` (
  `sde_ser` bigint unsigned NOT NULL AUTO_INCREMENT,
  `sde_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sde_sent` datetime DEFAULT NULL,
  `sde_user` int unsigned DEFAULT NULL,
  `sde_rec_num` varchar(32) NOT NULL,
  `sde_type` varchar(1) NOT NULL,
  `sde_method` int unsigned DEFAULT NULL,
  `sde_model` int unsigned DEFAULT NULL,
  `sde_recipient` varchar(255) NOT NULL,
  `sde_state` varchar(1) NOT NULL DEFAULT 'Q',
  `sde_error` text,
  `sde_payload` json DEFAULT NULL,
  PRIMARY KEY (`sde_ser`),
  KEY `sde_rec_num` (`sde_rec_num`),
  KEY `sde_state` (`sde_state`),
  KEY `sde_type` (`sde_type`,`sde_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sending_event`
--

LOCK TABLES `sending_event` WRITE;
/*!40000 ALTER TABLE `sending_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `sending_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sending_method`
--

DROP TABLE IF EXISTS `sending_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sending_method` (
  `sdi_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sdi_type` varchar(1) NOT NULL,
  `sdi_name` varchar(100) NOT NULL,
  `sdi_default` varchar(1) NOT NULL DEFAULT 'N',
  `sdi_date` datetime DEFAULT NULL,
  `sdi_user` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sdi_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sending_method`
--

LOCK TABLES `sending_method` WRITE;
/*!40000 ALTER TABLE `sending_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `sending_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sending_method_mailjet`
--

DROP TABLE IF EXISTS `sending_method_mailjet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sending_method_mailjet` (
  `sdm_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sdm_sdi` int unsigned DEFAULT NULL,
  `sdm_api_key` varbinary(1024) NOT NULL,
  `sdm_api_secret` varbinary(1024) NOT NULL,
  `sdm_from_email` varchar(255) NOT NULL,
  `sdm_from_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sdm_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sending_method_mailjet`
--

LOCK TABLES `sending_method_mailjet` WRITE;
/*!40000 ALTER TABLE `sending_method_mailjet` DISABLE KEYS */;
/*!40000 ALTER TABLE `sending_method_mailjet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sending_method_smtp`
--

DROP TABLE IF EXISTS `sending_method_smtp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sending_method_smtp` (
  `sds_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sds_sdi` int unsigned DEFAULT NULL,
  `sds_host` varchar(255) NOT NULL,
  `sds_port` int unsigned NOT NULL,
  `sds_username` varchar(255) DEFAULT NULL,
  `sds_password` varbinary(1024) DEFAULT NULL,
  `sds_ssl` varchar(1) NOT NULL DEFAULT 'N',
  `sds_starttls` varchar(1) NOT NULL DEFAULT 'N',
  `sds_from_email` varchar(255) NOT NULL,
  `sds_from_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sds_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sending_method_smtp`
--

LOCK TABLES `sending_method_smtp` WRITE;
/*!40000 ALTER TABLE `sending_method_smtp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sending_method_smtp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sending_method_whatsapp`
--

DROP TABLE IF EXISTS `sending_method_whatsapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sending_method_whatsapp` (
  `sdw_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sdw_sdi` int unsigned DEFAULT NULL,
  `sdw_provider` varchar(20) DEFAULT NULL,
  `sdw_api_token` varbinary(2048) NOT NULL,
  `sdw_phone_number` varchar(32) NOT NULL,
  `sdw_phone_number_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`sdw_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sending_method_whatsapp`
--

LOCK TABLES `sending_method_whatsapp` WRITE;
/*!40000 ALTER TABLE `sending_method_whatsapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `sending_method_whatsapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sending_model`
--

DROP TABLE IF EXISTS `sending_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sending_model` (
  `mdl_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `mdl_type` varchar(1) NOT NULL,
  `mdl_displayname` varchar(100) DEFAULT NULL,
  `mdl_name` varchar(100) DEFAULT NULL,
  `mdl_text` text,
  `mdl_has_attachment` varchar(1) NOT NULL DEFAULT 'N',
  `mdl_default` varchar(1) NOT NULL DEFAULT 'N',
  `mdl_date` datetime DEFAULT NULL,
  `mdl_user` int unsigned DEFAULT NULL,
  `mdl_lang` varchar(10) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`mdl_ser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sending_model`
--

LOCK TABLES `sending_model` WRITE;
/*!40000 ALTER TABLE `sending_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `sending_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_01_data`
--

DROP TABLE IF EXISTS `sigl_01_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_01_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `samp_date` datetime DEFAULT NULL,
  `type_prel` int unsigned NOT NULL,
  `statut` int unsigned NOT NULL,
  `id_dos` int unsigned DEFAULT NULL,
  `preleveur` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `samp_receipt_date` datetime DEFAULT NULL,
  `commentaire` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lieu_prel` int unsigned DEFAULT NULL,
  `lieu_prel_plus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `localisation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `samp_id_ana` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_data`),
  KEY `id_owner` (`id_owner`),
  KEY `id_dos` (`id_dos`) USING BTREE,
  KEY `sigl_01_data_ibfk_3` (`type_prel`),
  KEY `sigl_01_data_ibfk_4` (`statut`),
  KEY `sigl_01_data_ibfk_1` (`lieu_prel`),
  KEY `idx_date_samp` (`samp_date`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_01_data`
--

LOCK TABLES `sigl_01_data` WRITE;
/*!40000 ALTER TABLE `sigl_01_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_01_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_01_deleted`
--

DROP TABLE IF EXISTS `sigl_01_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_01_deleted` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `samp_date` datetime DEFAULT NULL,
  `type_prel` int unsigned NOT NULL,
  `statut` int unsigned NOT NULL,
  `id_dos` int unsigned DEFAULT NULL,
  `preleveur` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `samp_receipt_date` datetime DEFAULT NULL,
  `commentaire` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lieu_prel` int unsigned DEFAULT NULL,
  `lieu_prel_plus` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `localisation` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `samp_id_ana` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_data`),
  KEY `id_owner` (`id_owner`),
  KEY `id_dos` (`id_dos`) USING BTREE,
  KEY `sigl_01_data_ibfk_3` (`type_prel`),
  KEY `sigl_01_data_ibfk_4` (`statut`),
  KEY `sigl_01_data_ibfk_1` (`lieu_prel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_01_deleted`
--

LOCK TABLES `sigl_01_deleted` WRITE;
/*!40000 ALTER TABLE `sigl_01_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_01_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_02_data`
--

DROP TABLE IF EXISTS `sigl_02_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_02_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_patient` int unsigned DEFAULT NULL,
  `type` int unsigned DEFAULT NULL,
  `rec_date_receipt` datetime DEFAULT NULL,
  `num_dos_jour` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `num_dos_an` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `med_prescripteur` int unsigned DEFAULT NULL,
  `date_prescription` date NOT NULL,
  `service_interne` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `num_lit` int unsigned DEFAULT NULL,
  `id_colis` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rec_parcel_date` datetime DEFAULT NULL,
  `rc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `colis` int unsigned DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `remise` int unsigned DEFAULT NULL,
  `remise_pourcent` decimal(10,2) DEFAULT NULL,
  `assu_pourcent` decimal(10,2) DEFAULT NULL,
  `a_payer` decimal(10,2) DEFAULT NULL,
  `num_quittance` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `num_fact` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `statut` int unsigned DEFAULT NULL,
  `num_dos_mois` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_hosp` date DEFAULT NULL,
  `rec_custody` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `rec_num_int` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rec_date_vld` datetime DEFAULT NULL,
  `rec_modified` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `rec_hosp_num` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rec_date_save` datetime DEFAULT NULL,
  `rec_lite` int NOT NULL DEFAULT '0',
  `rec_num_lite` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_data`),
  KEY `id_patient` (`id_patient`),
  KEY `id_owner` (`id_owner`),
  KEY `sigl_02_data_ibfk_4` (`type`),
  KEY `sigl_02_data_ibfk_5` (`med_prescripteur`),
  KEY `sigl_02_data_ibfk_6` (`colis`),
  KEY `sigl_02_data_ibfk_7` (`remise`),
  KEY `idx_date_rec` (`rec_date_receipt`),
  KEY `idx_date_prescr` (`date_prescription`),
  KEY `idx_date_hosp` (`date_hosp`),
  KEY `idx_status` (`statut`),
  KEY `idx_rec_date_id` (`rec_date_receipt`,`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_02_data`
--

LOCK TABLES `sigl_02_data` WRITE;
/*!40000 ALTER TABLE `sigl_02_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_02_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_02_deleted`
--

DROP TABLE IF EXISTS `sigl_02_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_02_deleted` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_patient` int unsigned DEFAULT NULL,
  `type` int unsigned DEFAULT NULL,
  `rec_date_receipt` datetime DEFAULT NULL,
  `num_dos_jour` varchar(12) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `num_dos_an` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `med_prescripteur` int unsigned DEFAULT NULL,
  `date_prescription` date NOT NULL,
  `service_interne` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `num_lit` int unsigned DEFAULT NULL,
  `id_colis` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `rec_parcel_date` datetime DEFAULT NULL,
  `rc` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `colis` int unsigned DEFAULT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `remise` int unsigned DEFAULT NULL,
  `remise_pourcent` decimal(10,2) DEFAULT NULL,
  `assu_pourcent` decimal(10,2) DEFAULT NULL,
  `a_payer` decimal(10,2) DEFAULT NULL,
  `num_quittance` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `num_fact` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `statut` int unsigned DEFAULT NULL,
  `num_dos_mois` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date_hosp` date DEFAULT NULL,
  `rec_custody` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `rec_num_int` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rec_date_vld` datetime DEFAULT NULL,
  `rec_modified` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  `rec_hosp_num` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `rec_date_save` datetime DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `id_patient` (`id_patient`),
  KEY `id_owner` (`id_owner`),
  KEY `sigl_02_data_ibfk_4` (`type`),
  KEY `sigl_02_data_ibfk_5` (`med_prescripteur`),
  KEY `sigl_02_data_ibfk_6` (`colis`),
  KEY `sigl_02_data_ibfk_7` (`remise`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_02_deleted`
--

LOCK TABLES `sigl_02_deleted` WRITE;
/*!40000 ALTER TABLE `sigl_02_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_02_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_03_data`
--

DROP TABLE IF EXISTS `sigl_03_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_03_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `anonyme` int unsigned DEFAULT NULL,
  `code` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code_patient` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nom` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `prenom` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ddn` date DEFAULT NULL,
  `sexe` int unsigned DEFAULT NULL,
  `adresse` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `cp` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ville` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `profession` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nom_jf` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quartier` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `bp` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ddn_approx` int unsigned DEFAULT NULL,
  `age` int unsigned DEFAULT NULL,
  `unite` int unsigned DEFAULT NULL,
  `pat_midname` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pat_nation` int DEFAULT '0',
  `pat_resident` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'Y',
  `pat_blood_group` int DEFAULT '0',
  `pat_blood_rhesus` int DEFAULT '0',
  `pat_phone2` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `pat_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `pat_lite` int NOT NULL DEFAULT '0',
  `pat_agreement` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  KEY `id_owner` (`id_owner`),
  KEY `sigl_03_data_ibfk_2` (`ddn_approx`),
  KEY `sigl_03_data_anonyme_dico` (`anonyme`),
  KEY `sigl_03_data_sexe_dico` (`sexe`),
  KEY `idx_name` (`nom`),
  KEY `idx_fname` (`prenom`),
  KEY `idx_phone1` (`tel`),
  KEY `idx_phone2` (`pat_phone2`),
  KEY `idx_patient_age_sexe` (`id_data`,`age`,`sexe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_03_data`
--

LOCK TABLES `sigl_03_data` WRITE;
/*!40000 ALTER TABLE `sigl_03_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_03_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_04_data`
--

DROP TABLE IF EXISTS `sigl_04_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_04_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_dos` int unsigned DEFAULT NULL,
  `ref_analyse` int unsigned NOT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `paye` int unsigned DEFAULT NULL,
  `urgent` int unsigned DEFAULT NULL,
  `demande` int unsigned DEFAULT NULL,
  `req_outsourced` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  KEY `id_owner` (`id_owner`),
  KEY `id_prel` (`id_dos`) USING BTREE,
  KEY `sigl_04_data_ibfk_3` (`ref_analyse`),
  KEY `sigl_04_data_ibfk_4` (`paye`),
  KEY `sigl_04_data_ibfk_6` (`urgent`),
  KEY `sigl_04_data_ibfk_7` (`demande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_04_data`
--

LOCK TABLES `sigl_04_data` WRITE;
/*!40000 ALTER TABLE `sigl_04_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_04_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_04_deleted`
--

DROP TABLE IF EXISTS `sigl_04_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_04_deleted` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_owner` int NOT NULL,
  `id_dos` int unsigned DEFAULT NULL,
  `ref_analyse` int unsigned NOT NULL,
  `prix` decimal(10,2) DEFAULT NULL,
  `paye` int unsigned DEFAULT NULL,
  `urgent` int unsigned DEFAULT NULL,
  `demande` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `id_owner` (`id_owner`),
  KEY `id_prel` (`id_dos`) USING BTREE,
  KEY `sigl_04_data_ibfk_3` (`ref_analyse`),
  KEY `sigl_04_data_ibfk_4` (`paye`),
  KEY `sigl_04_data_ibfk_6` (`urgent`),
  KEY `sigl_04_data_ibfk_7` (`demande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_04_deleted`
--

LOCK TABLES `sigl_04_deleted` WRITE;
/*!40000 ALTER TABLE `sigl_04_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_04_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_05_07_data`
--

DROP TABLE IF EXISTS `sigl_05_07_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_05_07_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_refanalyse` int unsigned NOT NULL,
  `id_refvariable` int unsigned NOT NULL,
  `position` int unsigned DEFAULT NULL,
  `num_var` int unsigned DEFAULT NULL,
  `obligatoire` int DEFAULT '4',
  `var_whonet` int DEFAULT '5',
  `var_qrcode` varchar(10) DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `UNIQUE` (`id_refanalyse`,`id_refvariable`),
  KEY `FK_sigl_05_07_data_1` (`id_owner`),
  KEY `FK_sigl_05_07_data_3` (`id_refvariable`),
  KEY `idx_oblig` (`obligatoire`),
  KEY `idx_whonet` (`var_whonet`),
  KEY `idx_pos` (`position`),
  KEY `idx_num_var` (`num_var`)
) ENGINE=InnoDB AUTO_INCREMENT=2092 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_05_07_data`
--

LOCK TABLES `sigl_05_07_data` WRITE;
/*!40000 ALTER TABLE `sigl_05_07_data` DISABLE KEYS */;
INSERT INTO `sigl_05_07_data` VALUES (2,1010,24,2,NULL,1,4,5,'N'),(3,1010,25,3,NULL,1,4,5,'N'),(4,1010,26,4,NULL,1,4,5,'N'),(5,1010,27,5,NULL,1,4,5,'N'),(6,1010,28,6,NULL,1,4,5,'N'),(7,1010,29,7,NULL,1,4,5,'N'),(8,1010,30,8,NULL,1,4,5,'N'),(9,1010,31,9,NULL,1,4,5,'N'),(10,1010,32,10,NULL,1,4,5,'N'),(11,1010,33,11,NULL,1,4,5,'N'),(12,1010,33,12,10,1,4,5,'N'),(13,1010,34,13,NULL,NULL,4,5,'N'),(14,1010,34,14,10,NULL,4,5,'N'),(15,1010,35,15,NULL,1,4,5,'N'),(16,1010,38,14,NULL,NULL,4,5,'N'),(17,1010,38,16,10,NULL,4,5,'N'),(18,1010,38,17,20,NULL,4,5,'N'),(19,1010,39,18,NULL,1,4,5,'N'),(20,1010,40,19,NULL,1,4,5,'N'),(21,1010,41,20,NULL,1,4,5,'N'),(22,1010,42,21,NULL,1,4,5,'N'),(23,1010,43,22,NULL,NULL,4,5,'N'),(24,1010,43,23,10,NULL,4,5,'N'),(25,1010,44,24,NULL,NULL,4,5,'N'),(26,1010,44,16,10,NULL,4,5,'N'),(27,1010,45,25,NULL,NULL,4,5,'N'),(28,1010,45,17,10,NULL,4,5,'N'),(29,1010,46,26,NULL,1,4,5,'N'),(30,1010,47,27,NULL,2,4,5,'N'),(31,1010,48,28,NULL,1,4,5,'N'),(32,1010,49,29,NULL,1,4,5,'N'),(33,1010,49,27,10,2,4,5,'N'),(34,1010,49,30,20,3,4,5,'N'),(35,1010,49,31,30,4,4,5,'N'),(36,1010,49,32,40,NULL,4,5,'N'),(37,1010,49,26,50,1,4,5,'N'),(38,1010,49,33,60,3,4,5,'N'),(39,1010,50,34,NULL,NULL,4,5,'N'),(40,1010,50,35,10,NULL,4,5,'N'),(41,1010,50,36,20,NULL,4,5,'N'),(42,1010,50,37,30,NULL,4,5,'N'),(43,1010,50,38,40,NULL,4,5,'N'),(44,1010,51,39,NULL,NULL,4,5,'N'),(45,1010,52,40,NULL,NULL,4,5,'N'),(46,1010,54,33,NULL,3,4,5,'N'),(47,1010,55,41,NULL,NULL,4,5,'N'),(48,1010,56,42,NULL,NULL,4,5,'N'),(49,1010,56,41,10,NULL,4,5,'N'),(50,1010,57,43,NULL,NULL,4,5,'N'),(51,1010,60,44,NULL,NULL,4,5,'N'),(52,1010,60,45,10,NULL,4,5,'N'),(53,1010,60,46,20,NULL,4,5,'N'),(54,1010,60,47,30,NULL,4,5,'N'),(55,1010,60,48,40,NULL,4,5,'N'),(56,1010,60,49,50,NULL,4,5,'N'),(57,1010,61,50,NULL,NULL,4,5,'N'),(58,1010,62,51,NULL,NULL,4,5,'N'),(59,1010,63,52,NULL,NULL,4,5,'N'),(60,1010,64,53,NULL,NULL,4,5,'N'),(61,1010,65,54,NULL,NULL,4,5,'N'),(62,1010,65,55,10,NULL,4,5,'N'),(63,1010,66,56,NULL,NULL,4,5,'N'),(64,1010,67,57,NULL,NULL,4,5,'N'),(65,1010,68,58,NULL,NULL,4,5,'N'),(66,1010,69,59,NULL,NULL,4,5,'N'),(67,1010,70,59,NULL,NULL,4,5,'N'),(68,1010,71,60,NULL,NULL,4,5,'N'),(69,1010,72,61,NULL,NULL,4,5,'N'),(70,1010,73,3,NULL,1,4,5,'N'),(71,1010,73,62,10,NULL,4,5,'N'),(72,1010,73,63,20,NULL,4,5,'N'),(73,1010,73,64,30,NULL,4,5,'N'),(74,1010,73,65,40,NULL,4,5,'N'),(75,1010,73,66,50,NULL,4,5,'N'),(76,1010,74,67,NULL,NULL,4,5,'N'),(77,1010,75,68,NULL,NULL,4,5,'N'),(78,1010,76,69,NULL,NULL,4,5,'N'),(79,1010,77,70,NULL,NULL,4,5,'N'),(80,1010,78,71,NULL,NULL,4,5,'N'),(81,1010,79,72,NULL,NULL,4,5,'N'),(82,1010,80,73,NULL,NULL,4,5,'N'),(83,1010,81,74,NULL,NULL,4,5,'N'),(84,1010,82,75,NULL,NULL,4,5,'N'),(85,1010,83,76,NULL,NULL,4,5,'N'),(86,1010,84,77,NULL,NULL,4,5,'N'),(87,1010,85,76,NULL,NULL,4,5,'N'),(88,1010,85,77,10,NULL,4,5,'N'),(89,1010,86,78,NULL,NULL,4,5,'N'),(90,1010,87,79,NULL,NULL,4,5,'N'),(91,1010,88,80,NULL,NULL,4,5,'N'),(92,1010,89,81,NULL,NULL,4,5,'N'),(93,1010,90,82,NULL,NULL,4,5,'N'),(94,1010,91,83,NULL,NULL,4,5,'N'),(95,1010,92,84,NULL,NULL,4,5,'N'),(96,1010,93,85,NULL,NULL,4,5,'N'),(97,1010,94,86,NULL,NULL,4,5,'N'),(98,1010,95,87,NULL,NULL,4,5,'N'),(99,1010,96,88,NULL,NULL,4,5,'N'),(100,1010,97,89,NULL,NULL,4,5,'N'),(101,1010,98,90,NULL,NULL,4,5,'N'),(102,1010,99,91,NULL,NULL,4,5,'N'),(103,1010,100,92,NULL,NULL,4,5,'N'),(104,1010,101,93,NULL,NULL,4,5,'N'),(105,1010,102,94,NULL,NULL,4,5,'N'),(106,1010,103,95,NULL,NULL,4,5,'N'),(107,1010,104,96,NULL,NULL,4,5,'N'),(108,1010,105,97,NULL,NULL,4,5,'N'),(109,1010,106,98,NULL,1,4,5,'N'),(110,1010,107,99,NULL,NULL,4,5,'N'),(111,1010,108,100,NULL,1,4,5,'N'),(112,1010,109,101,NULL,NULL,4,5,'N'),(113,1010,109,102,10,NULL,4,5,'N'),(114,1010,110,103,NULL,NULL,4,5,'N'),(115,1010,111,104,NULL,NULL,4,5,'N'),(116,1010,111,105,10,NULL,4,5,'N'),(117,1010,112,102,NULL,NULL,4,5,'N'),(118,1010,112,105,10,NULL,4,5,'N'),(119,1010,114,106,NULL,1,4,5,'N'),(120,1010,114,107,10,NULL,4,5,'N'),(121,1010,114,8,20,1,4,5,'N'),(122,1010,114,108,30,NULL,4,5,'N'),(123,1010,115,109,NULL,1,4,5,'N'),(124,1010,116,110,NULL,1,4,5,'N'),(125,1010,117,13,NULL,NULL,4,5,'N'),(126,1010,117,14,10,NULL,4,5,'N'),(127,1010,118,111,NULL,1,4,5,'N'),(128,1010,118,21,10,1,4,5,'N'),(129,1010,119,112,NULL,NULL,4,5,'N'),(130,1010,120,113,NULL,NULL,4,5,'N'),(131,1010,121,114,NULL,NULL,4,5,'N'),(132,1010,123,115,NULL,NULL,4,5,'N'),(133,1010,124,116,NULL,NULL,4,5,'N'),(134,1010,125,117,NULL,NULL,4,5,'N'),(135,1010,127,118,NULL,NULL,4,5,'N'),(136,1010,127,119,10,NULL,4,5,'N'),(137,1010,128,120,NULL,NULL,4,5,'N'),(138,1010,129,121,NULL,NULL,4,5,'N'),(139,1010,130,122,NULL,NULL,4,5,'N'),(140,1010,132,123,NULL,NULL,4,5,'N'),(141,1010,133,124,NULL,1,4,5,'N'),(142,1010,134,125,NULL,NULL,4,5,'N'),(143,1010,135,126,NULL,1,4,5,'N'),(144,1010,135,127,10,2,4,5,'N'),(145,1010,135,128,20,3,4,5,'N'),(146,1010,135,129,30,NULL,4,5,'N'),(147,1010,136,126,NULL,1,4,5,'N'),(148,1010,136,130,10,2,4,5,'N'),(149,1010,136,131,20,3,4,5,'N'),(150,1010,136,132,30,NULL,4,5,'N'),(151,1010,137,126,NULL,1,4,5,'N'),(152,1010,137,133,10,2,4,5,'N'),(153,1010,137,134,20,3,4,5,'N'),(154,1010,137,135,30,NULL,4,5,'N'),(155,1010,138,136,NULL,NULL,4,5,'N'),(156,1010,138,137,10,NULL,4,5,'N'),(157,1010,138,138,20,NULL,4,5,'N'),(158,1010,138,139,30,NULL,4,5,'N'),(159,1010,138,140,40,NULL,4,5,'N'),(160,1010,138,141,50,NULL,4,5,'N'),(161,1010,138,142,60,NULL,4,5,'N'),(162,1010,139,136,NULL,NULL,4,5,'N'),(163,1010,139,138,10,NULL,4,5,'N'),(164,1010,143,143,NULL,NULL,4,5,'N'),(165,1010,144,144,NULL,NULL,4,5,'N'),(166,1010,145,145,NULL,NULL,4,5,'N'),(167,1010,147,146,NULL,NULL,4,5,'N'),(168,1010,147,147,10,NULL,4,5,'N'),(169,1010,147,148,20,NULL,4,5,'N'),(170,1010,149,149,NULL,NULL,4,5,'N'),(171,1010,150,150,NULL,NULL,4,5,'N'),(172,1010,150,151,10,NULL,4,5,'N'),(173,1010,151,152,NULL,NULL,4,5,'N'),(174,1010,152,153,NULL,NULL,4,5,'N'),(175,1010,155,154,NULL,1,4,5,'N'),(176,1010,155,151,10,2,4,5,'N'),(177,1010,155,155,20,3,4,5,'N'),(178,1010,155,156,30,NULL,4,5,'N'),(179,1010,155,157,40,NULL,4,5,'N'),(180,1010,155,158,50,NULL,4,5,'N'),(181,1010,155,159,60,4,4,5,'N'),(182,1010,155,160,70,5,4,5,'N'),(183,1010,155,161,80,6,4,5,'N'),(184,1010,155,162,90,7,4,5,'N'),(185,1010,155,163,100,8,4,5,'N'),(186,1010,155,164,110,9,4,5,'N'),(187,1010,155,165,120,NULL,4,5,'N'),(188,1010,155,166,130,NULL,4,5,'N'),(189,1010,155,167,140,NULL,4,5,'N'),(190,1010,155,168,150,NULL,4,5,'N'),(191,1010,155,169,160,1,4,5,'N'),(192,1010,155,170,170,NULL,4,5,'N'),(193,1010,155,171,180,NULL,4,5,'N'),(194,1010,155,172,190,4,4,5,'N'),(195,1010,155,173,200,5,4,5,'N'),(196,1010,155,174,210,6,4,5,'N'),(197,1010,155,175,220,7,4,5,'N'),(198,1010,155,176,230,8,4,5,'N'),(199,1010,155,177,240,9,4,5,'N'),(200,1010,155,178,250,NULL,4,5,'N'),(201,1010,157,179,NULL,1,4,5,'N'),(202,1010,157,180,10,2,4,5,'N'),(203,1010,157,181,20,3,4,5,'N'),(204,1010,157,182,30,4,4,5,'N'),(205,1010,158,183,NULL,NULL,4,5,'N'),(206,1010,159,184,NULL,NULL,4,5,'N'),(207,1010,160,185,NULL,NULL,4,5,'N'),(208,1010,162,186,NULL,NULL,4,5,'N'),(209,1010,163,187,NULL,NULL,4,5,'N'),(210,1010,164,188,NULL,NULL,4,5,'N'),(211,1010,165,189,NULL,NULL,4,5,'N'),(212,1010,166,190,NULL,NULL,4,5,'N'),(213,1010,167,191,NULL,NULL,4,5,'N'),(214,1010,168,192,NULL,NULL,4,5,'N'),(215,1010,169,193,NULL,NULL,4,5,'N'),(216,1010,171,194,NULL,NULL,4,5,'N'),(217,1010,172,195,NULL,NULL,4,5,'N'),(218,1010,173,196,NULL,NULL,4,5,'N'),(219,1010,173,197,10,NULL,4,5,'N'),(220,1010,174,198,NULL,NULL,4,5,'N'),(221,1010,175,199,NULL,NULL,4,5,'N'),(223,1010,176,201,NULL,NULL,4,5,'N'),(224,1010,177,202,NULL,NULL,4,5,'N'),(225,1010,178,203,NULL,NULL,4,5,'N'),(226,1010,178,204,10,NULL,4,5,'N'),(227,1010,182,205,NULL,NULL,4,5,'N'),(228,1010,184,206,NULL,NULL,4,5,'N'),(229,1010,185,207,NULL,NULL,4,5,'N'),(230,1010,186,208,NULL,NULL,4,5,'N'),(231,1010,187,209,NULL,NULL,4,5,'N'),(232,1010,188,210,NULL,NULL,4,5,'N'),(233,1010,189,211,NULL,NULL,4,5,'N'),(234,1010,191,212,20,NULL,4,5,'N'),(235,1010,191,213,10,NULL,4,5,'N'),(237,1010,193,215,NULL,NULL,4,5,'N'),(238,1010,195,216,NULL,NULL,4,5,'N'),(240,1010,196,218,10,NULL,4,5,'N'),(241,1010,196,219,20,NULL,4,5,'N'),(242,1010,196,220,30,NULL,4,5,'N'),(243,1010,196,221,40,NULL,4,5,'N'),(244,1010,196,222,50,NULL,4,5,'N'),(245,1010,196,223,60,NULL,4,5,'N'),(246,1010,196,224,70,NULL,4,5,'N'),(247,1010,196,225,80,NULL,4,5,'N'),(248,1010,196,226,90,NULL,4,5,'N'),(249,1010,196,227,100,NULL,4,5,'N'),(250,1010,196,228,110,NULL,4,5,'N'),(251,1010,197,229,NULL,NULL,4,5,'N'),(252,1010,197,230,10,NULL,4,5,'N'),(253,1010,198,231,NULL,NULL,4,5,'N'),(254,1010,198,230,10,NULL,4,5,'N'),(255,1010,199,232,NULL,NULL,4,5,'N'),(256,1010,199,233,10,NULL,4,5,'N'),(257,1010,200,234,NULL,NULL,4,5,'N'),(258,1010,200,235,10,NULL,4,5,'N'),(259,1010,201,236,NULL,NULL,4,5,'N'),(260,1010,202,237,NULL,NULL,4,5,'N'),(261,1010,203,238,NULL,NULL,4,5,'N'),(262,1010,204,239,NULL,NULL,4,5,'N'),(263,1010,204,240,10,NULL,4,5,'N'),(264,1010,204,241,20,NULL,4,5,'N'),(265,1010,205,242,NULL,NULL,4,5,'N'),(266,1010,206,243,NULL,NULL,4,5,'N'),(267,1010,206,244,10,NULL,4,5,'N'),(268,1010,206,245,20,NULL,4,5,'N'),(269,1010,207,246,NULL,NULL,4,5,'N'),(270,1010,208,247,NULL,NULL,4,5,'N'),(271,1010,209,248,NULL,NULL,4,5,'N'),(272,1010,210,249,NULL,NULL,4,5,'N'),(273,1010,211,250,NULL,NULL,4,5,'N'),(274,1010,212,251,NULL,NULL,4,5,'N'),(275,1010,212,252,10,NULL,4,5,'N'),(276,1010,212,253,20,NULL,4,5,'N'),(277,1010,213,254,NULL,NULL,4,5,'N'),(278,1010,214,255,NULL,NULL,4,5,'N'),(279,1010,215,256,NULL,NULL,4,5,'N'),(280,1010,216,257,NULL,NULL,4,5,'N'),(281,1010,217,258,NULL,NULL,4,5,'N'),(282,1010,218,259,NULL,NULL,4,5,'N'),(283,1010,219,260,NULL,NULL,4,5,'N'),(284,1010,219,261,10,NULL,4,5,'N'),(285,1010,220,262,NULL,NULL,4,5,'N'),(286,1010,221,263,NULL,NULL,4,5,'N'),(287,1010,222,264,NULL,NULL,4,5,'N'),(288,1010,222,265,10,NULL,4,5,'N'),(289,1010,223,266,NULL,NULL,4,5,'N'),(290,1010,223,267,10,NULL,4,5,'N'),(291,1010,224,268,NULL,NULL,4,5,'N'),(292,1010,225,269,NULL,NULL,4,5,'N'),(293,1010,225,213,10,NULL,4,5,'N'),(294,1010,225,270,30,NULL,4,5,'N'),(295,1010,226,271,NULL,NULL,4,5,'N'),(296,1010,226,272,10,NULL,4,5,'N'),(297,1010,227,273,NULL,NULL,4,5,'N'),(298,1010,227,274,10,NULL,4,5,'N'),(299,1010,228,275,NULL,NULL,4,5,'N'),(300,1010,229,276,NULL,NULL,4,5,'N'),(301,1010,229,213,10,NULL,4,5,'N'),(302,1010,229,277,30,NULL,4,5,'N'),(303,1010,230,278,NULL,NULL,4,5,'N'),(304,1010,231,279,NULL,NULL,4,5,'N'),(305,1010,231,280,10,NULL,4,5,'N'),(306,1010,232,281,NULL,NULL,4,5,'N'),(307,1010,232,282,10,NULL,4,5,'N'),(308,1010,232,283,20,NULL,4,5,'N'),(309,1010,234,284,NULL,NULL,4,5,'N'),(310,1010,235,285,NULL,NULL,4,5,'N'),(311,1010,236,286,NULL,NULL,4,5,'N'),(312,1010,237,287,NULL,NULL,4,5,'N'),(313,1010,237,288,10,NULL,4,5,'N'),(314,1010,239,245,10,NULL,4,5,'N'),(317,1010,241,291,NULL,NULL,4,5,'N'),(318,1010,242,292,NULL,NULL,4,5,'N'),(319,1010,244,293,NULL,NULL,4,5,'N'),(320,1010,245,294,NULL,NULL,4,5,'N'),(321,1010,246,295,NULL,NULL,4,5,'N'),(322,1010,247,296,NULL,NULL,4,5,'N'),(323,1010,248,297,NULL,NULL,4,5,'N'),(324,1010,249,298,NULL,NULL,4,5,'N'),(325,1010,250,299,NULL,NULL,4,5,'N'),(326,1010,251,300,NULL,NULL,4,5,'N'),(327,1010,252,301,NULL,NULL,4,5,'N'),(328,1010,252,302,10,NULL,4,5,'N'),(329,1010,252,303,20,NULL,4,5,'N'),(330,1010,252,304,30,NULL,4,5,'N'),(331,1010,252,305,40,NULL,4,5,'N'),(332,1010,252,306,50,NULL,4,5,'N'),(333,1010,252,307,60,NULL,4,5,'N'),(334,1010,252,308,70,NULL,4,5,'N'),(335,1010,253,309,NULL,NULL,4,5,'N'),(336,1010,254,310,NULL,NULL,4,5,'N'),(337,1010,255,311,NULL,NULL,4,5,'N'),(338,1010,256,312,NULL,NULL,4,5,'N'),(339,1010,256,313,10,NULL,4,5,'N'),(340,1010,257,314,NULL,NULL,4,5,'N'),(341,1010,257,614,10,NULL,4,5,'N'),(342,1010,257,316,20,NULL,4,5,'N'),(343,1010,258,317,NULL,NULL,4,5,'N'),(344,1010,258,318,10,NULL,4,5,'N'),(345,1010,258,319,20,NULL,4,5,'N'),(346,1010,259,317,NULL,NULL,4,5,'N'),(347,1010,259,320,10,NULL,4,5,'N'),(348,1010,259,318,20,NULL,4,5,'N'),(349,1010,260,321,NULL,NULL,4,5,'N'),(350,1010,260,322,10,NULL,4,5,'N'),(351,1010,261,323,NULL,NULL,4,5,'N'),(352,1010,262,324,NULL,NULL,4,5,'N'),(353,1010,262,325,10,NULL,4,5,'N'),(354,1010,263,326,NULL,NULL,4,5,'N'),(355,1010,263,327,10,NULL,4,5,'N'),(356,1010,263,328,20,NULL,4,5,'N'),(357,1010,264,329,NULL,NULL,4,5,'N'),(358,1010,265,330,NULL,NULL,4,5,'N'),(359,1010,265,331,10,NULL,4,5,'N'),(360,1010,265,332,20,NULL,4,5,'N'),(361,1010,265,333,30,NULL,4,5,'N'),(362,1010,265,334,40,NULL,4,5,'N'),(363,1010,265,335,50,NULL,4,5,'N'),(364,1010,265,336,60,NULL,4,5,'N'),(365,1010,265,337,70,NULL,4,5,'N'),(366,1010,265,338,80,NULL,4,5,'N'),(367,1010,265,339,90,NULL,4,5,'N'),(368,1010,265,340,100,NULL,4,5,'N'),(369,1010,266,330,NULL,NULL,4,5,'N'),(370,1010,266,341,10,NULL,4,5,'N'),(371,1010,266,332,20,NULL,4,5,'N'),(372,1010,266,333,30,NULL,4,5,'N'),(373,1010,266,342,40,NULL,4,5,'N'),(374,1010,266,334,50,NULL,4,5,'N'),(375,1010,266,335,60,NULL,4,5,'N'),(376,1010,266,336,70,NULL,4,5,'N'),(377,1010,266,337,80,NULL,4,5,'N'),(378,1010,266,338,90,NULL,4,5,'N'),(379,1010,266,340,100,NULL,4,5,'N'),(380,1010,266,343,110,NULL,4,5,'N'),(381,1010,266,344,120,NULL,4,5,'N'),(382,1010,267,332,14,NULL,4,5,'N'),(383,1010,267,345,10,NULL,4,5,'N'),(384,1010,267,346,20,NULL,4,5,'N'),(385,1010,267,347,30,NULL,4,5,'N'),(386,1010,267,348,40,NULL,4,5,'N'),(387,1010,267,349,50,NULL,4,5,'N'),(388,1010,267,335,60,NULL,4,5,'N'),(389,1010,267,336,70,NULL,4,5,'N'),(390,1010,267,338,80,NULL,4,5,'N'),(391,1010,267,350,90,NULL,4,5,'N'),(393,1010,267,352,110,NULL,4,5,'N'),(394,1010,267,353,120,NULL,4,5,'N'),(396,1010,267,355,140,NULL,4,5,'N'),(397,1010,268,332,17,NULL,4,5,'N'),(398,1010,268,345,10,NULL,4,5,'N'),(399,1010,268,356,20,NULL,4,5,'N'),(400,1010,268,346,30,NULL,4,5,'N'),(401,1010,268,347,40,NULL,4,5,'N'),(402,1010,268,357,50,NULL,4,5,'N'),(403,1010,268,348,60,NULL,4,5,'N'),(404,1010,268,349,70,NULL,4,5,'N'),(405,1010,268,335,80,NULL,4,5,'N'),(406,1010,268,350,90,NULL,4,5,'N'),(408,1010,268,358,110,NULL,4,5,'N'),(409,1010,268,256,120,NULL,4,5,'N'),(411,1010,268,355,140,NULL,4,5,'N'),(412,1010,268,353,150,NULL,4,5,'N'),(413,1010,268,352,160,NULL,4,5,'N'),(414,1010,268,361,170,NULL,4,5,'N'),(415,1010,269,362,NULL,NULL,4,5,'N'),(416,1010,269,363,10,NULL,4,5,'N'),(417,1010,269,351,20,NULL,4,5,'N'),(418,1010,269,358,30,NULL,4,5,'N'),(419,1010,269,256,40,NULL,4,5,'N'),(420,1010,269,364,50,NULL,4,5,'N'),(421,1010,269,353,60,NULL,4,5,'N'),(422,1010,269,366,70,NULL,4,5,'N'),(423,1010,270,332,14,NULL,4,5,'N'),(424,1010,270,356,10,NULL,4,5,'N'),(425,1010,270,346,20,NULL,4,5,'N'),(426,1010,270,357,30,NULL,4,5,'N'),(427,1010,270,367,40,NULL,4,5,'N'),(428,1010,270,348,50,NULL,4,5,'N'),(429,1010,270,349,60,NULL,4,5,'N'),(430,1010,270,344,70,NULL,4,5,'N'),(431,1010,270,350,80,NULL,4,5,'N'),(433,1010,270,358,100,NULL,4,5,'N'),(435,1010,270,363,120,NULL,4,5,'N'),(436,1010,270,353,130,NULL,4,5,'N'),(437,1010,270,366,140,NULL,4,5,'N'),(438,1010,271,368,19,NULL,4,5,'N'),(439,1010,271,369,10,NULL,4,5,'N'),(440,1010,271,332,20,NULL,4,5,'N'),(441,1010,271,370,30,NULL,4,5,'N'),(442,1010,271,356,40,NULL,4,5,'N'),(443,1010,271,346,50,NULL,4,5,'N'),(444,1010,271,347,60,NULL,4,5,'N'),(445,1010,271,357,70,NULL,4,5,'N'),(446,1010,271,349,80,NULL,4,5,'N'),(447,1010,271,301,90,NULL,4,5,'N'),(448,1010,271,371,100,NULL,4,5,'N'),(449,1010,271,372,110,NULL,4,5,'N'),(450,1010,271,353,120,NULL,4,5,'N'),(458,1010,272,376,NULL,NULL,4,5,'N'),(459,1010,272,256,10,NULL,4,5,'N'),(460,1010,272,375,20,NULL,4,5,'N'),(461,1010,272,377,30,NULL,4,5,'N'),(462,1010,272,333,40,NULL,4,5,'N'),(463,1010,272,378,50,NULL,4,5,'N'),(464,1010,272,379,60,NULL,4,5,'N'),(465,1010,273,333,NULL,NULL,4,5,'N'),(466,1010,273,380,10,NULL,4,5,'N'),(467,1010,273,381,20,NULL,4,5,'N'),(468,1010,273,146,30,NULL,4,5,'N'),(469,1010,273,382,40,NULL,4,5,'N'),(470,1010,273,383,50,NULL,4,5,'N'),(471,1010,273,384,60,NULL,4,5,'N'),(472,1010,273,344,70,NULL,4,5,'N'),(473,1010,273,385,80,NULL,4,5,'N'),(474,1010,273,386,90,NULL,4,5,'N'),(475,1010,273,387,100,NULL,4,5,'N'),(476,1010,274,388,NULL,NULL,4,5,'N'),(477,1010,274,389,10,NULL,4,5,'N'),(478,1010,274,390,20,NULL,4,5,'N'),(479,1010,274,333,30,NULL,4,5,'N'),(480,1010,275,356,NULL,NULL,4,5,'N'),(481,1010,275,391,10,NULL,4,5,'N'),(482,1010,275,392,20,NULL,4,5,'N'),(483,1010,275,350,30,NULL,4,5,'N'),(484,1010,275,393,40,NULL,4,5,'N'),(485,1010,275,344,50,NULL,4,5,'N'),(486,1010,275,256,60,NULL,4,5,'N'),(487,1010,275,394,70,NULL,4,5,'N'),(488,1010,275,395,80,NULL,4,5,'N'),(489,1010,275,363,90,NULL,4,5,'N'),(490,1010,276,333,NULL,NULL,4,5,'N'),(491,1010,276,380,10,NULL,4,5,'N'),(492,1010,276,344,20,NULL,4,5,'N'),(493,1010,276,396,30,NULL,4,5,'N'),(494,1010,276,397,40,NULL,4,5,'N'),(495,1010,276,398,50,NULL,4,5,'N'),(496,1010,276,378,60,NULL,4,5,'N'),(497,1010,276,399,70,NULL,4,5,'N'),(498,1010,276,400,80,NULL,4,5,'N'),(499,1010,276,363,90,NULL,4,5,'N'),(500,1010,276,341,100,NULL,4,5,'N'),(501,1010,277,380,NULL,NULL,4,5,'N'),(502,1010,278,385,NULL,NULL,4,5,'N'),(503,1010,278,386,10,NULL,4,5,'N'),(504,1010,278,396,20,NULL,4,5,'N'),(505,1010,278,397,30,NULL,4,5,'N'),(506,1010,279,401,NULL,NULL,4,5,'N'),(507,1010,280,402,NULL,NULL,4,5,'N'),(508,1010,281,403,NULL,NULL,4,5,'N'),(509,1010,282,404,NULL,NULL,4,5,'N'),(510,1010,283,405,NULL,NULL,4,5,'N'),(511,1010,284,406,NULL,NULL,4,5,'N'),(512,1010,285,407,NULL,NULL,4,5,'N'),(513,1010,286,408,NULL,NULL,4,5,'N'),(514,1010,287,409,NULL,NULL,4,5,'N'),(515,1010,288,410,NULL,NULL,4,5,'N'),(516,1010,289,411,NULL,NULL,4,5,'N'),(517,1010,290,412,NULL,NULL,4,5,'N'),(518,1010,291,413,NULL,NULL,4,5,'N'),(519,1010,292,414,NULL,NULL,4,5,'N'),(520,1010,293,415,NULL,NULL,4,5,'N'),(521,1010,294,416,NULL,NULL,4,5,'N'),(522,1010,295,417,NULL,NULL,4,5,'N'),(523,1010,296,418,NULL,NULL,4,5,'N'),(524,1010,296,419,10,NULL,4,5,'N'),(525,1010,297,420,NULL,NULL,4,5,'N'),(526,1010,298,421,NULL,NULL,4,5,'N'),(527,1010,299,422,NULL,NULL,4,5,'N'),(528,1010,300,423,NULL,NULL,4,5,'N'),(529,1010,301,424,NULL,NULL,4,5,'N'),(530,1010,302,425,NULL,NULL,4,5,'N'),(531,1010,303,426,NULL,NULL,4,5,'N'),(532,1010,304,427,NULL,NULL,4,5,'N'),(533,1010,305,29,NULL,1,4,5,'N'),(534,1010,305,27,10,2,4,5,'N'),(535,1010,305,32,20,NULL,4,5,'N'),(536,1010,305,26,30,1,4,5,'N'),(537,1010,306,428,NULL,NULL,4,5,'N'),(538,1010,306,429,10,NULL,4,5,'N'),(539,1010,307,430,NULL,NULL,4,5,'N'),(540,1010,307,431,10,NULL,4,5,'N'),(541,1010,308,432,NULL,NULL,4,5,'N'),(542,1010,308,433,10,NULL,4,5,'N'),(543,1010,309,434,NULL,NULL,4,5,'N'),(544,1010,309,435,10,NULL,4,5,'N'),(545,1010,310,436,NULL,NULL,4,5,'N'),(546,1010,310,437,10,NULL,4,5,'N'),(547,1010,311,438,NULL,NULL,4,5,'N'),(548,1010,311,439,10,NULL,4,5,'N'),(549,1010,312,440,NULL,NULL,4,5,'N'),(550,1010,312,441,10,NULL,4,5,'N'),(551,1010,312,442,20,NULL,4,5,'N'),(552,1010,313,443,NULL,NULL,4,5,'N'),(553,1010,313,444,10,NULL,4,5,'N'),(554,1010,314,445,NULL,NULL,4,5,'N'),(555,1010,314,442,10,NULL,4,5,'N'),(556,1010,315,446,NULL,NULL,4,5,'N'),(557,1010,315,447,10,NULL,4,5,'N'),(558,1010,316,448,NULL,NULL,4,5,'N'),(559,1010,316,449,10,NULL,4,5,'N'),(560,1010,317,450,NULL,NULL,4,5,'N'),(561,1010,317,451,10,NULL,4,5,'N'),(562,1010,318,452,NULL,NULL,4,5,'N'),(563,1010,318,453,10,NULL,4,5,'N'),(564,1010,319,454,NULL,NULL,4,5,'N'),(565,1010,319,455,10,NULL,4,5,'N'),(566,1010,320,456,NULL,NULL,4,5,'N'),(567,1010,320,457,10,NULL,4,5,'N'),(568,1010,321,458,NULL,NULL,4,5,'N'),(569,1010,321,459,10,NULL,4,5,'N'),(570,1010,322,460,NULL,NULL,4,5,'N'),(571,1010,322,461,10,NULL,4,5,'N'),(572,1010,323,462,NULL,NULL,4,5,'N'),(573,1010,323,463,10,NULL,4,5,'N'),(574,1010,324,464,NULL,NULL,4,5,'N'),(575,1010,324,465,10,NULL,4,5,'N'),(576,1010,325,466,NULL,NULL,4,5,'N'),(577,1010,325,467,10,NULL,4,5,'N'),(578,1010,326,468,NULL,NULL,4,5,'N'),(579,1010,326,469,10,NULL,4,5,'N'),(580,1010,327,470,NULL,NULL,4,5,'N'),(581,1010,327,471,10,NULL,4,5,'N'),(582,1010,328,472,NULL,NULL,4,5,'N'),(583,1010,328,473,10,NULL,4,5,'N'),(584,1010,329,474,NULL,NULL,4,5,'N'),(585,1010,329,475,10,NULL,4,5,'N'),(586,1010,330,476,NULL,NULL,4,5,'N'),(587,1010,330,477,10,NULL,4,5,'N'),(588,1010,331,478,NULL,NULL,4,5,'N'),(589,1010,331,479,10,NULL,4,5,'N'),(590,1010,332,480,NULL,NULL,4,5,'N'),(591,1010,332,481,10,NULL,4,5,'N'),(592,1010,333,482,NULL,NULL,4,5,'N'),(593,1010,333,483,10,NULL,4,5,'N'),(594,1010,334,484,NULL,NULL,4,5,'N'),(595,1010,334,485,10,NULL,4,5,'N'),(596,1010,335,486,NULL,NULL,4,5,'N'),(597,1010,335,487,10,NULL,4,5,'N'),(598,1010,336,488,NULL,NULL,4,5,'N'),(599,1010,336,489,10,NULL,4,5,'N'),(600,1010,337,490,NULL,NULL,4,5,'N'),(601,1010,337,491,10,NULL,4,5,'N'),(602,1010,338,492,NULL,NULL,4,5,'N'),(603,1010,338,493,10,NULL,4,5,'N'),(604,1010,339,494,NULL,NULL,4,5,'N'),(605,1010,339,495,10,NULL,4,5,'N'),(606,1010,340,496,NULL,NULL,4,5,'N'),(607,1010,340,497,10,NULL,4,5,'N'),(608,1010,341,498,NULL,NULL,4,5,'N'),(609,1010,341,499,10,NULL,4,5,'N'),(610,1010,342,500,NULL,NULL,4,5,'N'),(611,1010,342,501,10,NULL,4,5,'N'),(612,1010,343,502,NULL,NULL,4,5,'N'),(613,1010,343,503,10,NULL,4,5,'N'),(614,1010,344,504,NULL,NULL,4,5,'N'),(615,1010,344,505,10,NULL,4,5,'N'),(616,1010,345,506,NULL,NULL,4,5,'N'),(617,1010,345,507,10,NULL,4,5,'N'),(618,1010,346,508,NULL,NULL,4,5,'N'),(619,1010,346,509,10,NULL,4,5,'N'),(620,1010,347,510,NULL,NULL,4,5,'N'),(621,1010,347,511,10,NULL,4,5,'N'),(622,1010,348,512,NULL,NULL,4,5,'N'),(623,1010,348,513,10,NULL,4,5,'N'),(624,1010,349,514,NULL,NULL,4,5,'N'),(625,1010,349,515,10,NULL,4,5,'N'),(626,1010,350,516,NULL,NULL,4,5,'N'),(627,1010,350,517,10,NULL,4,5,'N'),(628,1010,351,518,NULL,NULL,4,5,'N'),(629,1010,351,519,10,NULL,4,5,'N'),(630,1010,352,520,NULL,NULL,4,5,'N'),(631,1010,352,521,10,NULL,4,5,'N'),(632,1010,353,522,NULL,NULL,4,5,'N'),(633,1010,353,523,10,NULL,4,5,'N'),(634,1010,354,524,NULL,NULL,4,5,'N'),(635,1010,354,525,10,NULL,4,5,'N'),(636,1010,355,526,NULL,NULL,4,5,'N'),(637,1010,355,527,10,NULL,4,5,'N'),(638,1010,356,528,NULL,NULL,4,5,'N'),(639,1010,356,529,10,NULL,4,5,'N'),(640,1010,357,530,NULL,NULL,4,5,'N'),(641,1010,357,531,10,NULL,4,5,'N'),(642,1010,358,532,NULL,NULL,4,5,'N'),(643,1010,358,533,10,NULL,4,5,'N'),(644,1010,359,534,NULL,NULL,4,5,'N'),(645,1010,359,535,10,NULL,4,5,'N'),(646,1010,360,536,NULL,NULL,4,5,'N'),(647,1010,360,537,10,NULL,4,5,'N'),(648,1010,361,538,NULL,NULL,4,5,'N'),(649,1010,361,503,10,NULL,4,5,'N'),(650,1010,362,539,NULL,NULL,4,5,'N'),(651,1010,362,507,10,NULL,4,5,'N'),(652,1010,363,540,NULL,NULL,4,5,'N'),(653,1010,363,541,10,NULL,4,5,'N'),(654,1010,364,542,NULL,NULL,4,5,'N'),(655,1010,364,543,10,NULL,4,5,'N'),(656,1010,365,544,NULL,NULL,4,5,'N'),(657,1010,365,545,10,NULL,4,5,'N'),(658,1010,366,546,NULL,NULL,4,5,'N'),(659,1010,366,547,10,NULL,4,5,'N'),(660,1010,367,548,NULL,NULL,4,5,'N'),(661,1010,367,549,10,NULL,4,5,'N'),(662,1010,368,550,NULL,NULL,4,5,'N'),(663,1010,368,551,10,NULL,4,5,'N'),(664,1010,369,552,NULL,NULL,4,5,'N'),(665,1010,369,553,10,NULL,4,5,'N'),(666,1010,370,554,NULL,NULL,4,5,'N'),(667,1010,370,555,10,NULL,4,5,'N'),(668,1010,371,556,NULL,NULL,4,5,'N'),(669,1010,371,557,10,NULL,4,5,'N'),(670,1010,372,558,NULL,NULL,4,5,'N'),(671,1010,372,559,10,NULL,4,5,'N'),(672,1010,373,560,NULL,NULL,4,5,'N'),(673,1010,373,505,10,NULL,4,5,'N'),(674,1010,374,561,NULL,NULL,4,5,'N'),(675,1010,374,562,10,NULL,4,5,'N'),(676,1010,375,563,NULL,NULL,4,5,'N'),(677,1010,375,564,10,NULL,4,5,'N'),(678,1010,376,565,NULL,NULL,4,5,'N'),(679,1010,376,566,10,NULL,4,5,'N'),(680,1010,377,567,NULL,NULL,4,5,'N'),(681,1010,377,568,10,NULL,4,5,'N'),(682,1010,378,569,NULL,NULL,4,5,'N'),(683,1010,378,570,10,NULL,4,5,'N'),(684,1010,379,571,NULL,NULL,4,5,'N'),(685,1010,379,572,10,NULL,4,5,'N'),(686,1010,380,573,NULL,NULL,4,5,'N'),(687,1010,380,574,10,NULL,4,5,'N'),(688,1010,381,575,NULL,NULL,4,5,'N'),(689,1010,381,576,10,NULL,4,5,'N'),(690,1010,382,577,NULL,NULL,4,5,'N'),(691,1010,382,578,10,NULL,4,5,'N'),(692,1010,383,579,NULL,NULL,4,5,'N'),(693,1010,383,580,10,NULL,4,5,'N'),(694,1010,384,581,NULL,NULL,4,5,'N'),(695,1010,384,505,10,NULL,4,5,'N'),(696,1010,385,582,NULL,NULL,4,5,'N'),(697,1010,385,583,10,NULL,4,5,'N'),(698,1010,386,584,NULL,NULL,4,5,'N'),(699,1010,386,585,10,NULL,4,5,'N'),(700,1010,387,586,NULL,NULL,4,5,'N'),(701,1010,387,578,10,NULL,4,5,'N'),(702,1010,388,587,NULL,NULL,4,5,'N'),(703,1010,388,588,10,NULL,4,5,'N'),(704,1010,389,589,NULL,NULL,4,5,'N'),(705,1010,389,590,10,NULL,4,5,'N'),(706,1010,390,591,NULL,NULL,4,5,'N'),(707,1010,390,592,10,NULL,4,5,'N'),(708,1010,391,593,NULL,NULL,4,5,'N'),(709,1010,391,594,10,NULL,4,5,'N'),(710,1010,392,595,NULL,NULL,4,5,'N'),(711,1010,392,596,10,NULL,4,5,'N'),(712,1010,393,597,NULL,NULL,4,5,'N'),(713,1010,393,598,10,NULL,4,5,'N'),(714,1010,394,599,NULL,NULL,4,5,'N'),(715,1010,394,600,10,NULL,4,5,'N'),(716,1010,395,601,NULL,NULL,4,5,'N'),(717,1010,395,602,10,NULL,4,5,'N'),(718,1010,396,603,NULL,NULL,4,5,'N'),(719,1010,396,604,10,NULL,4,5,'N'),(720,1010,397,605,NULL,NULL,4,5,'N'),(721,1010,397,606,10,NULL,4,5,'N'),(722,1010,398,607,NULL,NULL,4,5,'N'),(723,1010,398,608,10,NULL,4,5,'N'),(724,1010,399,609,NULL,NULL,4,5,'N'),(725,1010,399,610,10,NULL,4,5,'N'),(726,1010,401,611,NULL,NULL,4,5,'N'),(727,1010,401,612,10,NULL,4,5,'N'),(728,1010,401,613,20,NULL,4,5,'N'),(729,1010,402,614,NULL,NULL,4,5,'N'),(730,1010,402,314,10,NULL,4,5,'N'),(731,1010,402,616,20,NULL,4,5,'N'),(732,1010,402,617,30,NULL,4,5,'N'),(733,1010,403,301,NULL,NULL,4,5,'N'),(734,1010,403,618,10,NULL,4,5,'N'),(735,1010,404,619,NULL,NULL,4,5,'N'),(736,1010,404,620,10,NULL,4,5,'N'),(737,1010,405,621,NULL,NULL,4,5,'N'),(738,1010,405,622,10,NULL,4,5,'N'),(739,1010,406,623,NULL,NULL,4,5,'N'),(740,1010,406,624,10,NULL,4,5,'N'),(741,1010,407,625,10,NULL,4,5,'N'),(752,1010,410,628,NULL,NULL,4,5,'N'),(753,1010,410,629,10,NULL,4,5,'N'),(754,1010,410,245,20,NULL,4,5,'N'),(757,1010,411,625,10,NULL,4,5,'N'),(761,1010,412,632,20,NULL,4,5,'N'),(762,1010,412,627,10,NULL,4,5,'N'),(765,1010,413,634,20,NULL,4,5,'N'),(768,1010,414,363,NULL,NULL,4,5,'N'),(769,1010,414,636,10,NULL,4,5,'N'),(770,1010,414,637,20,NULL,4,5,'N'),(771,1010,414,638,30,NULL,4,5,'N'),(772,1010,414,639,40,NULL,4,5,'N'),(773,1010,414,640,50,NULL,4,5,'N'),(775,1010,415,641,20,NULL,4,5,'N'),(776,1010,415,627,10,NULL,4,5,'N'),(778,1010,417,159,NULL,4,4,5,'N'),(779,1010,417,321,10,NULL,4,5,'N'),(780,1010,417,642,20,NULL,4,5,'N'),(781,1010,417,643,30,NULL,4,5,'N'),(782,1010,417,644,40,NULL,4,5,'N'),(783,1010,417,172,50,4,4,5,'N'),(784,1010,417,322,60,NULL,4,5,'N'),(785,1010,417,645,70,NULL,4,5,'N'),(786,1010,417,646,80,NULL,4,5,'N'),(787,1010,417,647,90,NULL,4,5,'N'),(788,1010,418,324,NULL,NULL,4,5,'N'),(789,1010,418,648,10,NULL,4,5,'N'),(790,1010,418,325,20,NULL,4,5,'N'),(791,1010,419,430,NULL,NULL,4,5,'N'),(792,1010,419,443,10,NULL,4,5,'N'),(793,1010,419,492,20,NULL,4,5,'N'),(794,1010,419,502,30,NULL,4,5,'N'),(795,1010,419,504,40,NULL,4,5,'N'),(796,1010,419,510,50,NULL,4,5,'N'),(797,1010,419,520,60,NULL,4,5,'N'),(798,1010,419,441,70,NULL,4,5,'N'),(799,1010,419,439,80,NULL,4,5,'N'),(800,1010,419,442,90,NULL,4,5,'N'),(801,1010,419,469,100,NULL,4,5,'N'),(802,1010,419,483,110,NULL,4,5,'N'),(803,1010,419,497,120,NULL,4,5,'N'),(804,1010,419,529,130,NULL,4,5,'N'),(805,1010,419,531,140,NULL,4,5,'N'),(806,1010,419,649,150,NULL,4,5,'N'),(807,1010,420,650,NULL,1,4,5,'N'),(808,1010,421,651,NULL,1,4,5,'N'),(809,1010,422,44,NULL,NULL,4,5,'N'),(810,1010,422,652,10,NULL,4,5,'N'),(811,1010,422,653,20,NULL,4,5,'N'),(812,1010,423,654,NULL,NULL,4,5,'N'),(813,1010,425,655,NULL,NULL,4,5,'N'),(814,1010,425,656,10,NULL,4,5,'N'),(815,1010,426,657,NULL,NULL,4,5,'N'),(816,1010,426,658,10,NULL,4,5,'N'),(817,1010,426,659,20,NULL,4,5,'N'),(818,1010,427,370,NULL,NULL,4,5,'N'),(819,1010,428,581,NULL,NULL,4,5,'N'),(820,1010,428,587,10,NULL,4,5,'N'),(821,1010,428,418,20,NULL,4,5,'N'),(822,1010,428,621,30,NULL,4,5,'N'),(823,1010,428,623,40,NULL,4,5,'N'),(824,1010,429,660,NULL,NULL,4,5,'N'),(825,1010,429,661,10,NULL,4,5,'N'),(826,1010,429,662,20,NULL,4,5,'N'),(827,1010,431,663,NULL,NULL,4,5,'N'),(828,1010,432,151,NULL,2,4,5,'N'),(829,1010,432,155,10,3,4,5,'N'),(830,1010,432,166,20,NULL,4,5,'N'),(831,1010,432,167,30,NULL,4,5,'N'),(832,1010,432,168,40,NULL,4,5,'N'),(833,1010,432,172,50,4,4,5,'N'),(834,1010,432,178,60,NULL,4,5,'N'),(835,1010,432,664,70,1,4,5,'N'),(836,1010,432,665,80,NULL,4,5,'N'),(837,1010,432,666,90,NULL,4,5,'N'),(838,1010,432,667,100,NULL,4,5,'N'),(839,1010,432,668,110,5,4,5,'N'),(840,1010,432,669,120,6,4,5,'N'),(841,1010,432,670,130,7,4,5,'N'),(842,1010,432,671,140,8,4,5,'N'),(843,1010,432,672,150,9,4,5,'N'),(844,1010,432,673,160,NULL,4,5,'N'),(845,1010,433,151,NULL,2,4,5,'N'),(846,1010,433,166,10,NULL,4,5,'N'),(847,1010,433,167,20,NULL,4,5,'N'),(848,1010,433,168,30,NULL,4,5,'N'),(849,1010,433,172,40,4,4,5,'N'),(850,1010,433,178,50,NULL,4,5,'N'),(851,1010,433,664,60,1,4,5,'N'),(852,1010,433,668,70,5,4,5,'N'),(853,1010,433,669,80,6,4,5,'N'),(854,1010,433,670,90,7,4,5,'N'),(855,1010,433,671,100,8,4,5,'N'),(856,1010,433,672,110,9,4,5,'N'),(857,1010,433,674,120,3,4,5,'N'),(858,1010,433,675,130,NULL,4,5,'N'),(859,1010,433,676,140,NULL,4,5,'N'),(860,1010,433,677,150,NULL,4,5,'N'),(861,1010,433,678,160,NULL,4,5,'N'),(862,1010,434,151,NULL,2,4,5,'N'),(863,1010,434,166,10,NULL,4,5,'N'),(864,1010,434,167,20,NULL,4,5,'N'),(865,1010,434,168,30,NULL,4,5,'N'),(866,1010,434,172,40,4,4,5,'N'),(867,1010,434,178,50,NULL,4,5,'N'),(868,1010,434,664,60,1,4,5,'N'),(869,1010,434,665,70,NULL,4,5,'N'),(870,1010,434,667,80,NULL,4,5,'N'),(871,1010,434,668,90,5,4,5,'N'),(872,1010,434,669,100,6,4,5,'N'),(873,1010,434,670,110,7,4,5,'N'),(874,1010,434,671,120,8,4,5,'N'),(875,1010,434,672,130,9,4,5,'N'),(876,1010,434,673,140,NULL,4,5,'N'),(877,1010,434,674,150,3,4,5,'N'),(878,1010,434,679,160,NULL,4,5,'N'),(879,1010,435,151,NULL,2,4,5,'N'),(880,1010,435,166,10,NULL,4,5,'N'),(881,1010,435,167,20,NULL,4,5,'N'),(882,1010,435,168,30,NULL,4,5,'N'),(883,1010,435,172,40,4,4,5,'N'),(884,1010,435,178,50,NULL,4,5,'N'),(885,1010,435,664,60,1,4,5,'N'),(886,1010,435,668,70,5,4,5,'N'),(887,1010,435,669,80,6,4,5,'N'),(888,1010,435,670,90,7,4,5,'N'),(889,1010,435,671,100,8,4,5,'N'),(890,1010,435,672,110,9,4,5,'N'),(891,1010,435,673,120,NULL,4,5,'N'),(892,1010,435,674,130,3,4,5,'N'),(893,1010,435,675,140,NULL,4,5,'N'),(894,1010,435,677,150,NULL,4,5,'N'),(895,1010,435,680,160,NULL,4,5,'N'),(896,1010,436,151,NULL,2,4,5,'N'),(897,1010,436,166,10,NULL,4,5,'N'),(898,1010,436,167,20,NULL,4,5,'N'),(899,1010,436,168,30,NULL,4,5,'N'),(900,1010,436,172,40,4,4,5,'N'),(901,1010,436,178,50,NULL,4,5,'N'),(902,1010,436,664,60,1,4,5,'N'),(903,1010,436,665,70,NULL,4,5,'N'),(904,1010,436,667,80,NULL,4,5,'N'),(905,1010,436,668,90,5,4,5,'N'),(906,1010,436,669,100,6,4,5,'N'),(907,1010,436,670,110,7,4,5,'N'),(908,1010,436,671,120,8,4,5,'N'),(909,1010,436,672,130,9,4,5,'N'),(910,1010,436,673,140,NULL,4,5,'N'),(911,1010,436,674,150,3,4,5,'N'),(912,1010,436,679,160,NULL,4,5,'N'),(913,1010,437,151,NULL,NULL,4,5,'N'),(914,1010,437,166,10,NULL,4,5,'N'),(915,1010,437,167,20,NULL,4,5,'N'),(916,1010,437,168,30,NULL,4,5,'N'),(917,1010,437,172,40,NULL,4,5,'N'),(918,1010,437,178,50,NULL,4,5,'N'),(919,1010,437,664,60,NULL,4,5,'N'),(920,1010,437,665,70,NULL,4,5,'N'),(921,1010,437,667,80,NULL,4,5,'N'),(922,1010,437,668,90,NULL,4,5,'N'),(923,1010,437,669,100,NULL,4,5,'N'),(924,1010,437,670,110,NULL,4,5,'N'),(925,1010,437,671,120,NULL,4,5,'N'),(926,1010,437,672,130,NULL,4,5,'N'),(927,1010,437,673,140,NULL,4,5,'N'),(928,1010,437,674,150,NULL,4,5,'N'),(929,1010,437,679,160,NULL,4,5,'N'),(930,1010,438,151,NULL,2,4,5,'N'),(931,1010,438,166,10,NULL,4,5,'N'),(932,1010,438,167,20,NULL,4,5,'N'),(933,1010,438,168,30,NULL,4,5,'N'),(934,1010,438,172,40,4,4,5,'N'),(935,1010,438,178,50,NULL,4,5,'N'),(936,1010,438,665,60,NULL,4,5,'N'),(937,1010,438,666,70,NULL,4,5,'N'),(938,1010,438,667,80,NULL,4,5,'N'),(939,1010,438,668,90,5,4,5,'N'),(940,1010,438,669,100,6,4,5,'N'),(941,1010,438,670,110,7,4,5,'N'),(942,1010,438,671,120,8,4,5,'N'),(943,1010,438,672,130,9,4,5,'N'),(944,1010,438,673,140,NULL,4,5,'N'),(945,1010,438,674,150,3,4,5,'N'),(946,1010,438,681,160,1,4,5,'N'),(947,1010,439,151,NULL,2,4,5,'N'),(948,1010,439,166,10,NULL,4,5,'N'),(949,1010,439,167,20,NULL,4,5,'N'),(950,1010,439,168,30,NULL,4,5,'N'),(951,1010,439,172,40,4,4,5,'N'),(952,1010,439,178,50,NULL,4,5,'N'),(953,1010,439,664,60,1,4,5,'N'),(954,1010,439,665,70,NULL,4,5,'N'),(955,1010,439,666,80,NULL,4,5,'N'),(956,1010,439,667,90,NULL,4,5,'N'),(957,1010,439,668,100,5,4,5,'N'),(958,1010,439,669,110,6,4,5,'N'),(959,1010,439,670,120,7,4,5,'N'),(960,1010,439,671,130,8,4,5,'N'),(961,1010,439,672,140,9,4,5,'N'),(962,1010,439,673,150,NULL,4,5,'N'),(963,1010,439,674,160,3,4,5,'N'),(964,1010,440,151,NULL,2,4,5,'N'),(965,1010,440,166,10,NULL,4,5,'N'),(966,1010,440,167,20,NULL,4,5,'N'),(967,1010,440,168,30,NULL,4,5,'N'),(968,1010,440,172,40,4,4,5,'N'),(969,1010,440,178,50,NULL,4,5,'N'),(970,1010,440,664,60,1,4,5,'N'),(971,1010,440,665,70,NULL,4,5,'N'),(972,1010,440,666,80,NULL,4,5,'N'),(973,1010,440,667,90,NULL,4,5,'N'),(974,1010,440,668,100,5,4,5,'N'),(975,1010,440,669,110,6,4,5,'N'),(976,1010,440,670,120,7,4,5,'N'),(977,1010,440,671,130,8,4,5,'N'),(978,1010,440,672,140,9,4,5,'N'),(979,1010,440,673,150,NULL,4,5,'N'),(980,1010,440,674,160,3,4,5,'N'),(981,1010,441,151,NULL,2,4,5,'N'),(982,1010,441,166,10,NULL,4,5,'N'),(983,1010,441,167,20,NULL,4,5,'N'),(984,1010,441,168,30,NULL,4,5,'N'),(985,1010,441,172,40,4,4,5,'N'),(986,1010,441,178,50,NULL,4,5,'N'),(987,1010,441,665,60,NULL,4,5,'N'),(988,1010,441,666,70,NULL,4,5,'N'),(989,1010,441,667,80,NULL,4,5,'N'),(990,1010,441,668,90,5,4,5,'N'),(991,1010,441,669,100,6,4,5,'N'),(992,1010,441,670,110,7,4,5,'N'),(993,1010,441,671,120,8,4,5,'N'),(994,1010,441,672,130,9,4,5,'N'),(995,1010,441,673,140,NULL,4,5,'N'),(996,1010,441,674,150,3,4,5,'N'),(997,1010,441,681,160,1,4,5,'N'),(998,1010,442,151,NULL,2,4,5,'N'),(999,1010,442,166,10,NULL,4,5,'N'),(1000,1010,442,167,20,NULL,4,5,'N'),(1001,1010,442,168,30,NULL,4,5,'N'),(1002,1010,442,172,40,4,4,5,'N'),(1003,1010,442,178,50,NULL,4,5,'N'),(1004,1010,442,665,60,NULL,4,5,'N'),(1005,1010,442,666,70,NULL,4,5,'N'),(1006,1010,442,667,80,NULL,4,5,'N'),(1007,1010,442,668,90,5,4,5,'N'),(1008,1010,442,669,100,6,4,5,'N'),(1009,1010,442,670,110,7,4,5,'N'),(1010,1010,442,671,120,8,4,5,'N'),(1011,1010,442,672,130,9,4,5,'N'),(1012,1010,442,673,140,NULL,4,5,'N'),(1013,1010,442,674,150,3,4,5,'N'),(1014,1010,442,681,160,1,4,5,'N'),(1015,1010,443,151,NULL,2,4,5,'N'),(1016,1010,443,166,10,NULL,4,5,'N'),(1017,1010,443,167,20,NULL,4,5,'N'),(1018,1010,443,168,30,NULL,4,5,'N'),(1019,1010,443,172,40,4,4,5,'N'),(1020,1010,443,665,50,NULL,4,5,'N'),(1021,1010,443,666,60,NULL,4,5,'N'),(1022,1010,443,667,70,NULL,4,5,'N'),(1023,1010,443,668,80,5,4,5,'N'),(1024,1010,443,669,90,6,4,5,'N'),(1025,1010,443,670,100,7,4,5,'N'),(1026,1010,443,671,110,8,4,5,'N'),(1027,1010,443,672,120,9,4,5,'N'),(1028,1010,443,673,130,NULL,4,5,'N'),(1029,1010,443,674,140,3,4,5,'N'),(1030,1010,443,681,150,1,4,5,'N'),(1031,1010,443,682,160,NULL,4,5,'N'),(1032,1010,444,538,NULL,NULL,4,5,'N'),(1033,1010,444,577,10,NULL,4,5,'N'),(1034,1010,444,442,20,NULL,4,5,'N'),(1035,1010,444,523,30,NULL,4,5,'N'),(1036,1010,444,507,40,NULL,4,5,'N'),(1037,1010,444,566,50,NULL,4,5,'N'),(1038,1010,444,505,60,NULL,4,5,'N'),(1039,1010,444,610,70,NULL,4,5,'N'),(1040,1010,444,683,80,NULL,4,5,'N'),(1041,1010,444,649,90,NULL,4,5,'N'),(1042,1010,445,442,NULL,NULL,4,5,'N'),(1043,1010,445,497,10,NULL,4,5,'N'),(1044,1010,445,505,20,NULL,4,5,'N'),(1045,1010,445,511,30,NULL,4,5,'N'),(1046,1010,445,596,40,NULL,4,5,'N'),(1047,1010,445,683,50,NULL,4,5,'N'),(1048,1010,445,684,60,NULL,4,5,'N'),(1049,1010,445,685,70,NULL,4,5,'N'),(1050,1010,445,649,80,NULL,4,5,'N'),(1051,1010,446,581,NULL,NULL,4,5,'N'),(1052,1010,446,475,10,NULL,4,5,'N'),(1053,1010,446,503,20,NULL,4,5,'N'),(1054,1010,446,686,30,NULL,4,5,'N'),(1055,1010,446,687,40,NULL,4,5,'N'),(1056,1010,446,688,50,NULL,4,5,'N'),(1057,1010,446,649,60,NULL,4,5,'N'),(1058,1010,446,689,90,NULL,4,5,'N'),(1059,1010,447,470,NULL,NULL,4,5,'N'),(1060,1010,447,431,10,NULL,4,5,'N'),(1061,1010,447,497,20,NULL,4,5,'N'),(1062,1010,447,505,30,NULL,4,5,'N'),(1063,1010,447,596,40,NULL,4,5,'N'),(1064,1010,447,683,50,NULL,4,5,'N'),(1065,1010,447,687,60,NULL,4,5,'N'),(1066,1010,447,688,70,NULL,4,5,'N'),(1067,1010,447,689,80,NULL,4,5,'N'),(1068,1010,447,649,90,NULL,4,5,'N'),(1069,1010,447,690,120,NULL,4,5,'N'),(1070,1010,448,581,NULL,NULL,4,5,'N'),(1071,1010,448,442,10,NULL,4,5,'N'),(1072,1010,448,503,20,NULL,4,5,'N'),(1073,1010,448,523,30,NULL,4,5,'N'),(1074,1010,448,529,40,NULL,4,5,'N'),(1075,1010,448,507,50,NULL,4,5,'N'),(1076,1010,448,505,60,NULL,4,5,'N'),(1077,1010,448,578,70,NULL,4,5,'N'),(1078,1010,448,610,80,NULL,4,5,'N'),(1079,1010,448,649,90,NULL,4,5,'N'),(1080,1010,449,440,NULL,NULL,4,5,'N'),(1081,1010,449,538,10,NULL,4,5,'N'),(1082,1010,449,565,20,NULL,4,5,'N'),(1083,1010,449,497,30,NULL,4,5,'N'),(1084,1010,449,505,40,NULL,4,5,'N'),(1085,1010,449,523,50,NULL,4,5,'N'),(1086,1010,449,507,60,NULL,4,5,'N'),(1087,1010,449,566,70,NULL,4,5,'N'),(1088,1010,449,578,80,NULL,4,5,'N'),(1089,1010,449,610,90,NULL,4,5,'N'),(1090,1010,449,683,100,NULL,4,5,'N'),(1091,1010,449,687,110,NULL,4,5,'N'),(1092,1010,449,688,120,NULL,4,5,'N'),(1093,1010,449,689,130,NULL,4,5,'N'),(1094,1010,449,649,140,NULL,4,5,'N'),(1095,1010,449,691,210,NULL,4,5,'N'),(1096,1010,449,692,220,NULL,4,5,'N'),(1097,1010,450,468,NULL,NULL,4,5,'N'),(1098,1010,450,504,10,NULL,4,5,'N'),(1099,1010,450,538,20,NULL,4,5,'N'),(1100,1010,450,575,30,NULL,4,5,'N'),(1101,1010,450,599,40,NULL,4,5,'N'),(1102,1010,450,439,50,NULL,4,5,'N'),(1103,1010,450,493,60,NULL,4,5,'N'),(1104,1010,450,511,70,NULL,4,5,'N'),(1105,1010,450,531,80,NULL,4,5,'N'),(1106,1010,450,598,90,NULL,4,5,'N'),(1107,1010,450,604,100,NULL,4,5,'N'),(1108,1010,450,649,110,NULL,4,5,'N'),(1109,1010,451,428,NULL,NULL,4,5,'N'),(1110,1010,451,577,10,NULL,4,5,'N'),(1111,1010,451,581,20,NULL,4,5,'N'),(1112,1010,451,609,30,NULL,4,5,'N'),(1113,1010,451,483,40,NULL,4,5,'N'),(1114,1010,451,505,50,NULL,4,5,'N'),(1115,1010,451,523,60,NULL,4,5,'N'),(1116,1010,451,527,70,NULL,4,5,'N'),(1117,1010,451,529,80,NULL,4,5,'N'),(1118,1010,451,507,90,NULL,4,5,'N'),(1119,1010,451,683,100,NULL,4,5,'N'),(1120,1010,451,693,110,NULL,4,5,'N'),(1121,1010,451,688,120,NULL,4,5,'N'),(1122,1010,451,649,130,NULL,4,5,'N'),(1123,1010,451,694,240,NULL,4,5,'N'),(1124,1010,452,695,NULL,NULL,4,5,'N'),(1125,1010,453,333,NULL,NULL,4,5,'N'),(1126,1010,453,363,10,NULL,4,5,'N'),(1127,1010,453,344,20,NULL,4,5,'N'),(1128,1010,453,392,30,NULL,4,5,'N'),(1129,1010,453,350,40,NULL,4,5,'N'),(1130,1010,453,696,50,NULL,4,5,'N'),(1131,1010,454,333,NULL,NULL,4,5,'N'),(1132,1010,454,363,10,NULL,4,5,'N'),(1133,1010,454,344,20,NULL,4,5,'N'),(1134,1010,454,392,30,NULL,4,5,'N'),(1135,1010,454,350,40,NULL,4,5,'N'),(1136,1010,455,333,NULL,NULL,4,5,'N'),(1137,1010,455,344,10,NULL,4,5,'N'),(1138,1010,455,392,20,NULL,4,5,'N'),(1139,1010,456,697,NULL,NULL,4,5,'N'),(1140,1010,457,698,NULL,NULL,4,5,'N'),(1141,1010,458,333,NULL,NULL,4,5,'N'),(1142,1010,458,344,10,NULL,4,5,'N'),(1143,1010,458,699,20,NULL,4,5,'N'),(1144,1010,458,700,30,NULL,4,5,'N'),(1145,1010,458,701,40,NULL,4,5,'N'),(1146,1010,458,702,50,NULL,4,5,'N'),(1147,1010,458,703,60,NULL,4,5,'N'),(1148,1010,459,704,NULL,NULL,4,5,'N'),(1149,1010,460,705,NULL,NULL,4,5,'N'),(1150,1010,461,673,NULL,NULL,4,5,'N'),(1151,1010,461,397,10,NULL,4,5,'N'),(1152,1010,461,706,20,NULL,4,5,'N'),(1153,1010,461,707,30,NULL,4,5,'N'),(1154,1010,461,708,40,NULL,4,5,'N'),(1155,1010,461,709,50,NULL,4,5,'N'),(1156,1010,462,333,NULL,NULL,4,5,'N'),(1157,1010,462,344,10,NULL,4,5,'N'),(1158,1010,462,392,20,NULL,4,5,'N'),(1159,1010,462,350,30,NULL,4,5,'N'),(1160,1010,462,710,40,NULL,4,5,'N'),(1161,1010,463,344,NULL,NULL,4,5,'N'),(1162,1010,463,710,10,NULL,4,5,'N'),(1163,1010,464,333,NULL,NULL,4,5,'N'),(1164,1010,464,363,10,NULL,4,5,'N'),(1165,1010,464,711,20,NULL,4,5,'N'),(1166,1010,464,712,30,NULL,4,5,'N'),(1167,1010,464,713,40,NULL,4,5,'N'),(1168,1010,464,703,50,NULL,4,5,'N'),(1169,1010,465,333,NULL,NULL,4,5,'N'),(1170,1010,465,703,10,NULL,4,5,'N'),(1171,1010,465,392,20,NULL,4,5,'N'),(1172,1010,465,713,30,NULL,4,5,'N'),(1173,1010,466,714,NULL,NULL,4,5,'N'),(1174,1010,466,713,10,NULL,4,5,'N'),(1175,1010,467,714,NULL,NULL,4,5,'N'),(1176,1010,467,713,10,NULL,4,5,'N'),(1177,1010,468,430,NULL,NULL,4,5,'N'),(1178,1010,468,438,10,NULL,4,5,'N'),(1179,1010,468,443,20,NULL,4,5,'N'),(1180,1010,468,445,30,NULL,4,5,'N'),(1181,1010,468,468,40,NULL,4,5,'N'),(1182,1010,468,474,50,NULL,4,5,'N'),(1183,1010,468,482,60,NULL,4,5,'N'),(1184,1010,468,492,70,NULL,4,5,'N'),(1185,1010,468,502,80,NULL,4,5,'N'),(1186,1010,468,504,90,NULL,4,5,'N'),(1187,1010,468,510,100,NULL,4,5,'N'),(1188,1010,468,520,110,NULL,4,5,'N'),(1189,1010,468,528,120,NULL,4,5,'N'),(1190,1010,468,530,130,NULL,4,5,'N'),(1191,1010,468,649,140,NULL,4,5,'N'),(1192,1,413,715,10,NULL,4,5,'N'),(1193,1,407,716,20,NULL,4,5,'N'),(1194,1,411,717,20,NULL,4,5,'N'),(1195,1,408,718,10,NULL,4,5,'N'),(1196,1,408,719,20,NULL,4,5,'N'),(1197,1,239,720,20,NULL,4,5,'N'),(1198,1,239,721,30,NULL,4,5,'N'),(1199,1000,469,571,1,NULL,5,4,'N'),(1200,1000,469,753,2,NULL,5,4,'N'),(1201,1000,469,565,3,NULL,5,4,'N'),(1202,1000,469,749,4,NULL,5,4,'N'),(1203,1000,469,440,5,NULL,5,4,'N'),(1204,1000,469,726,6,NULL,5,4,'N'),(1205,1000,469,474,7,NULL,5,4,'N'),(1206,1000,469,733,8,NULL,5,4,'N'),(1207,1000,469,496,9,NULL,5,4,'N'),(1208,1000,469,737,10,NULL,5,4,'N'),(1209,1000,469,502,11,NULL,5,4,'N'),(1210,1000,469,738,12,NULL,5,4,'N'),(1211,1000,469,504,13,NULL,5,4,'N'),(1212,1000,469,739,14,NULL,5,4,'N'),(1213,1000,469,581,15,NULL,5,4,'N'),(1214,1000,469,757,16,NULL,5,4,'N'),(1215,1000,470,571,1,NULL,5,4,'N'),(1216,1000,470,753,2,NULL,5,4,'N'),(1217,1000,470,565,3,NULL,5,4,'N'),(1218,1000,470,749,4,NULL,5,4,'N'),(1219,1000,470,482,5,NULL,5,4,'N'),(1220,1000,470,734,6,NULL,5,4,'N'),(1221,1000,470,528,7,NULL,5,4,'N'),(1222,1000,470,745,8,NULL,5,4,'N'),(1223,1000,470,534,9,NULL,5,4,'N'),(1224,1000,470,747,10,NULL,5,4,'N'),(1225,1000,470,603,11,NULL,5,4,'N'),(1226,1000,470,761,12,NULL,5,4,'N'),(1227,1000,470,522,13,NULL,5,4,'N'),(1228,1000,470,743,14,NULL,5,4,'N'),(1229,1000,470,539,15,NULL,5,4,'N'),(1230,1000,470,748,16,NULL,5,4,'N'),(1231,1000,470,577,17,NULL,5,4,'N'),(1232,1000,470,756,18,NULL,5,4,'N'),(1233,1000,470,595,19,NULL,5,4,'N'),(1234,1000,470,758,20,NULL,5,4,'N'),(1235,1000,470,569,21,NULL,5,4,'N'),(1236,1000,470,752,22,NULL,5,4,'N'),(1237,1000,470,504,23,NULL,5,4,'N'),(1238,1000,470,739,24,NULL,5,4,'N'),(1239,1000,470,609,25,NULL,5,4,'N'),(1240,1000,470,762,26,NULL,5,4,'N'),(1241,1000,470,502,27,NULL,5,4,'N'),(1242,1000,470,738,28,NULL,5,4,'N'),(1243,1000,470,428,29,NULL,5,4,'N'),(1244,1000,470,723,30,NULL,5,4,'N'),(1245,1000,470,526,31,NULL,5,4,'N'),(1246,1000,470,744,32,NULL,5,4,'N'),(1247,1000,470,510,33,NULL,5,4,'N'),(1248,1000,470,741,34,NULL,5,4,'N'),(1249,1000,471,571,1,NULL,5,4,'N'),(1250,1000,471,753,2,NULL,5,4,'N'),(1251,1000,471,565,3,NULL,5,4,'N'),(1252,1000,471,749,4,NULL,5,4,'N'),(1253,1000,471,440,5,NULL,5,4,'N'),(1254,1000,471,726,6,NULL,5,4,'N'),(1255,1000,471,474,7,NULL,5,4,'N'),(1256,1000,471,733,8,NULL,5,4,'N'),(1257,1000,471,528,9,NULL,5,4,'N'),(1258,1000,471,745,10,NULL,5,4,'N'),(1259,1000,471,534,11,NULL,5,4,'N'),(1260,1000,471,747,12,NULL,5,4,'N'),(1261,1000,471,595,13,NULL,5,4,'N'),(1262,1000,471,758,14,NULL,5,4,'N'),(1263,1000,471,522,15,NULL,5,4,'N'),(1264,1000,471,743,16,NULL,5,4,'N'),(1265,1000,471,539,17,NULL,5,4,'N'),(1266,1000,471,748,18,NULL,5,4,'N'),(1267,1000,471,577,19,NULL,5,4,'N'),(1268,1000,471,756,20,NULL,5,4,'N'),(1269,1000,471,560,21,NULL,5,4,'N'),(1270,1000,471,751,22,NULL,5,4,'N'),(1271,1000,471,502,23,NULL,5,4,'N'),(1272,1000,471,738,24,NULL,5,4,'N'),(1273,1000,471,609,25,NULL,5,4,'N'),(1274,1000,471,762,26,NULL,5,4,'N'),(1275,1000,471,526,27,NULL,5,4,'N'),(1276,1000,471,744,28,NULL,5,4,'N'),(1277,1000,471,510,29,NULL,5,4,'N'),(1278,1000,471,741,30,NULL,5,4,'N'),(1279,1000,472,445,1,NULL,5,4,'N'),(1280,1000,472,728,2,NULL,5,4,'N'),(1281,1000,472,443,3,NULL,5,4,'N'),(1282,1000,472,727,4,NULL,5,4,'N'),(1283,1000,472,460,5,NULL,5,4,'N'),(1284,1000,472,731,6,NULL,5,4,'N'),(1285,1000,472,496,7,NULL,5,4,'N'),(1286,1000,472,737,8,NULL,5,4,'N'),(1287,1000,472,595,9,NULL,5,4,'N'),(1288,1000,472,758,10,NULL,5,4,'N'),(1289,1000,472,502,11,NULL,5,4,'N'),(1290,1000,472,738,12,NULL,5,4,'N'),(1291,1000,472,504,13,NULL,5,4,'N'),(1292,1000,472,739,14,NULL,5,4,'N'),(1293,1000,472,528,15,NULL,5,4,'N'),(1294,1000,472,745,16,NULL,5,4,'N'),(1295,1000,472,534,17,NULL,5,4,'N'),(1296,1000,472,747,18,NULL,5,4,'N'),(1297,1000,472,722,19,NULL,5,4,'N'),(1298,1000,472,730,20,NULL,5,4,'N'),(1299,1000,473,597,1,NULL,5,4,'N'),(1300,1000,473,759,2,NULL,5,4,'N'),(1301,1000,473,599,3,NULL,5,4,'N'),(1302,1000,473,760,4,NULL,5,4,'N'),(1303,1000,473,573,5,NULL,5,4,'N'),(1304,1000,473,754,6,NULL,5,4,'N'),(1305,1000,473,450,7,NULL,5,4,'N'),(1306,1000,473,729,8,NULL,5,4,'N'),(1307,1000,473,490,9,NULL,5,4,'N'),(1308,1000,473,735,10,NULL,5,4,'N'),(1309,1000,473,492,11,NULL,5,4,'N'),(1310,1000,473,736,12,NULL,5,4,'N'),(1311,1000,473,530,13,NULL,5,4,'N'),(1312,1000,473,746,14,NULL,5,4,'N'),(1313,1000,473,528,15,NULL,5,4,'N'),(1314,1000,473,745,16,NULL,5,4,'N'),(1315,1000,473,534,17,NULL,5,4,'N'),(1316,1000,473,747,18,NULL,5,4,'N'),(1317,1000,473,603,19,NULL,5,4,'N'),(1318,1000,473,761,20,NULL,5,4,'N'),(1319,1000,473,438,21,NULL,5,4,'N'),(1320,1000,473,725,22,NULL,5,4,'N'),(1321,1000,473,556,23,NULL,5,4,'N'),(1322,1000,473,750,24,NULL,5,4,'N'),(1323,1000,473,508,25,NULL,5,4,'N'),(1324,1000,473,740,26,NULL,5,4,'N'),(1325,1000,473,502,27,NULL,5,4,'N'),(1326,1000,473,738,28,NULL,5,4,'N'),(1327,1000,473,569,29,NULL,5,4,'N'),(1328,1000,473,752,30,NULL,5,4,'N'),(1329,1000,473,504,31,NULL,5,4,'N'),(1330,1000,473,739,32,NULL,5,4,'N'),(1331,1000,474,597,1,NULL,5,4,'N'),(1332,1000,474,759,2,NULL,5,4,'N'),(1333,1000,474,599,3,NULL,5,4,'N'),(1334,1000,474,760,4,NULL,5,4,'N'),(1335,1000,474,573,5,NULL,5,4,'N'),(1336,1000,474,754,6,NULL,5,4,'N'),(1337,1000,474,575,7,NULL,5,4,'N'),(1338,1000,474,755,8,NULL,5,4,'N'),(1339,1000,474,492,9,NULL,5,4,'N'),(1340,1000,474,736,10,NULL,5,4,'N'),(1341,1000,474,468,11,NULL,5,4,'N'),(1342,1000,474,732,12,NULL,5,4,'N'),(1343,1000,474,530,13,NULL,5,4,'N'),(1344,1000,474,746,14,NULL,5,4,'N'),(1345,1000,474,528,15,NULL,5,4,'N'),(1346,1000,474,745,16,NULL,5,4,'N'),(1347,1000,474,534,17,NULL,5,4,'N'),(1348,1000,474,747,18,NULL,5,4,'N'),(1349,1000,474,556,19,NULL,5,4,'N'),(1350,1000,474,750,20,NULL,5,4,'N'),(1351,1000,474,438,21,NULL,5,4,'N'),(1352,1000,474,725,22,NULL,5,4,'N'),(1353,1000,474,502,23,NULL,5,4,'N'),(1354,1000,474,738,24,NULL,5,4,'N'),(1355,1000,474,595,25,NULL,5,4,'N'),(1356,1000,474,758,26,NULL,5,4,'N'),(1357,1000,474,508,27,NULL,5,4,'N'),(1358,1000,474,740,28,NULL,5,4,'N'),(1359,1000,474,510,29,NULL,5,4,'N'),(1360,1000,474,741,30,NULL,5,4,'N'),(1361,1000,474,504,31,NULL,5,4,'N'),(1362,1000,474,739,32,NULL,5,4,'N'),(1363,1000,475,440,1,NULL,5,4,'N'),(1364,1000,475,726,2,NULL,5,4,'N'),(1365,1000,475,443,3,NULL,5,4,'N'),(1366,1000,475,727,4,NULL,5,4,'N'),(1367,1000,475,597,5,NULL,5,4,'N'),(1368,1000,475,759,6,NULL,5,4,'N'),(1369,1000,475,573,7,NULL,5,4,'N'),(1370,1000,475,754,8,NULL,5,4,'N'),(1371,1000,475,450,9,NULL,5,4,'N'),(1372,1000,475,729,10,NULL,5,4,'N'),(1373,1000,475,530,11,NULL,5,4,'N'),(1374,1000,475,746,12,NULL,5,4,'N'),(1375,1000,475,460,13,NULL,5,4,'N'),(1376,1000,475,731,14,NULL,5,4,'N'),(1377,1000,475,482,15,NULL,5,4,'N'),(1378,1000,475,734,16,NULL,5,4,'N'),(1379,1000,475,496,17,NULL,5,4,'N'),(1380,1000,475,737,18,NULL,5,4,'N'),(1381,1000,475,492,19,NULL,5,4,'N'),(1382,1000,475,736,20,NULL,5,4,'N'),(1383,1000,475,534,21,NULL,5,4,'N'),(1384,1000,475,747,22,NULL,5,4,'N'),(1385,1000,475,603,23,NULL,5,4,'N'),(1386,1000,475,761,24,NULL,5,4,'N'),(1387,1000,475,528,25,NULL,5,4,'N'),(1388,1000,475,745,26,NULL,5,4,'N'),(1389,1000,475,502,27,NULL,5,4,'N'),(1390,1000,475,738,28,NULL,5,4,'N'),(1391,1000,475,508,29,NULL,5,4,'N'),(1392,1000,475,740,30,NULL,5,4,'N'),(1393,1000,475,430,31,NULL,5,4,'N'),(1394,1000,475,724,32,NULL,5,4,'N'),(1395,1000,475,560,33,NULL,5,4,'N'),(1396,1000,475,751,34,NULL,5,4,'N'),(1397,1000,475,504,35,NULL,5,4,'N'),(1398,1000,475,739,36,NULL,5,4,'N'),(1399,1000,475,595,37,NULL,5,4,'N'),(1400,1000,475,758,38,NULL,5,4,'N'),(1401,1000,475,516,39,NULL,5,4,'N'),(1402,1000,475,742,40,NULL,5,4,'N'),(1403,1000,476,440,1,NULL,5,4,'N'),(1404,1000,476,726,2,NULL,5,4,'N'),(1405,1000,476,443,3,NULL,5,4,'N'),(1406,1000,476,727,4,NULL,5,4,'N'),(1407,1000,476,597,5,NULL,5,4,'N'),(1408,1000,476,759,6,NULL,5,4,'N'),(1409,1000,476,573,7,NULL,5,4,'N'),(1410,1000,476,754,8,NULL,5,4,'N'),(1411,1000,476,450,9,NULL,5,4,'N'),(1412,1000,476,729,10,NULL,5,4,'N'),(1413,1000,476,530,11,NULL,5,4,'N'),(1414,1000,476,746,12,NULL,5,4,'N'),(1415,1000,476,460,13,NULL,5,4,'N'),(1416,1000,476,731,14,NULL,5,4,'N'),(1417,1000,476,482,15,NULL,5,4,'N'),(1418,1000,476,734,16,NULL,5,4,'N'),(1419,1000,476,496,17,NULL,5,4,'N'),(1420,1000,476,737,18,NULL,5,4,'N'),(1421,1000,476,492,19,NULL,5,4,'N'),(1422,1000,476,736,20,NULL,5,4,'N'),(1423,1000,476,534,21,NULL,5,4,'N'),(1424,1000,476,747,22,NULL,5,4,'N'),(1425,1000,476,603,23,NULL,5,4,'N'),(1426,1000,476,761,24,NULL,5,4,'N'),(1427,1000,476,528,25,NULL,5,4,'N'),(1428,1000,476,745,26,NULL,5,4,'N'),(1429,1000,476,502,27,NULL,5,4,'N'),(1430,1000,476,738,28,NULL,5,4,'N'),(1431,1000,476,508,29,NULL,5,4,'N'),(1432,1000,476,740,30,NULL,5,4,'N'),(1433,1000,476,430,31,NULL,5,4,'N'),(1434,1000,476,724,32,NULL,5,4,'N'),(1435,1000,476,560,33,NULL,5,4,'N'),(1436,1000,476,751,34,NULL,5,4,'N'),(1437,1000,476,504,35,NULL,5,4,'N'),(1438,1000,476,739,36,NULL,5,4,'N'),(1439,1000,476,595,37,NULL,5,4,'N'),(1440,1000,476,758,38,NULL,5,4,'N'),(1441,1000,476,516,39,NULL,5,4,'N'),(1442,1000,476,742,40,NULL,5,4,'N'),(1443,1000,477,440,1,NULL,5,4,'N'),(1444,1000,477,726,2,NULL,5,4,'N'),(1445,1000,477,443,3,NULL,5,4,'N'),(1446,1000,477,727,4,NULL,5,4,'N'),(1447,1000,477,597,5,NULL,5,4,'N'),(1448,1000,477,759,6,NULL,5,4,'N'),(1449,1000,477,573,7,NULL,5,4,'N'),(1450,1000,477,754,8,NULL,5,4,'N'),(1451,1000,477,450,9,NULL,5,4,'N'),(1452,1000,477,729,10,NULL,5,4,'N'),(1453,1000,477,530,11,NULL,5,4,'N'),(1454,1000,477,746,12,NULL,5,4,'N'),(1455,1000,477,460,13,NULL,5,4,'N'),(1456,1000,477,731,14,NULL,5,4,'N'),(1457,1000,477,482,15,NULL,5,4,'N'),(1458,1000,477,734,16,NULL,5,4,'N'),(1459,1000,477,496,17,NULL,5,4,'N'),(1460,1000,477,737,18,NULL,5,4,'N'),(1461,1000,477,492,19,NULL,5,4,'N'),(1462,1000,477,736,20,NULL,5,4,'N'),(1463,1000,477,534,21,NULL,5,4,'N'),(1464,1000,477,747,22,NULL,5,4,'N'),(1465,1000,477,603,23,NULL,5,4,'N'),(1466,1000,477,761,24,NULL,5,4,'N'),(1467,1000,477,528,25,NULL,5,4,'N'),(1468,1000,477,745,26,NULL,5,4,'N'),(1469,1000,477,502,27,NULL,5,4,'N'),(1470,1000,477,738,28,NULL,5,4,'N'),(1471,1000,477,508,29,NULL,5,4,'N'),(1472,1000,477,740,30,NULL,5,4,'N'),(1473,1000,477,430,31,NULL,5,4,'N'),(1474,1000,477,724,32,NULL,5,4,'N'),(1475,1000,477,560,33,NULL,5,4,'N'),(1476,1000,477,751,34,NULL,5,4,'N'),(1477,1000,477,504,35,NULL,5,4,'N'),(1478,1000,477,739,36,NULL,5,4,'N'),(1479,1000,477,595,37,NULL,5,4,'N'),(1480,1000,477,758,38,NULL,5,4,'N'),(1481,1000,477,516,39,NULL,5,4,'N'),(1482,1000,477,742,40,NULL,5,4,'N'),(1483,1000,478,571,1,NULL,5,4,'N'),(1484,1000,478,793,2,NULL,5,4,'N'),(1485,1000,478,565,3,NULL,5,4,'N'),(1486,1000,478,789,4,NULL,5,4,'N'),(1487,1000,478,440,5,NULL,5,4,'N'),(1488,1000,478,766,6,NULL,5,4,'N'),(1489,1000,478,474,7,NULL,5,4,'N'),(1490,1000,478,773,8,NULL,5,4,'N'),(1491,1000,478,496,9,NULL,5,4,'N'),(1492,1000,478,777,10,NULL,5,4,'N'),(1493,1000,478,502,11,NULL,5,4,'N'),(1494,1000,478,778,12,NULL,5,4,'N'),(1495,1000,478,504,13,NULL,5,4,'N'),(1496,1000,478,779,14,NULL,5,4,'N'),(1497,1000,478,581,15,NULL,5,4,'N'),(1498,1000,478,797,16,NULL,5,4,'N'),(1499,1000,479,571,1,NULL,5,4,'N'),(1500,1000,479,793,2,NULL,5,4,'N'),(1501,1000,479,565,3,NULL,5,4,'N'),(1502,1000,479,789,4,NULL,5,4,'N'),(1503,1000,479,482,5,NULL,5,4,'N'),(1504,1000,479,774,6,NULL,5,4,'N'),(1505,1000,479,528,7,NULL,5,4,'N'),(1506,1000,479,785,8,NULL,5,4,'N'),(1507,1000,479,534,9,NULL,5,4,'N'),(1508,1000,479,787,10,NULL,5,4,'N'),(1509,1000,479,603,11,NULL,5,4,'N'),(1510,1000,479,801,12,NULL,5,4,'N'),(1511,1000,479,522,13,NULL,5,4,'N'),(1512,1000,479,783,14,NULL,5,4,'N'),(1513,1000,479,539,15,NULL,5,4,'N'),(1514,1000,479,788,16,NULL,5,4,'N'),(1515,1000,479,577,17,NULL,5,4,'N'),(1516,1000,479,796,18,NULL,5,4,'N'),(1517,1000,479,595,19,NULL,5,4,'N'),(1518,1000,479,798,20,NULL,5,4,'N'),(1519,1000,479,569,21,NULL,5,4,'N'),(1520,1000,479,792,22,NULL,5,4,'N'),(1521,1000,479,504,23,NULL,5,4,'N'),(1522,1000,479,779,24,NULL,5,4,'N'),(1523,1000,479,609,25,NULL,5,4,'N'),(1524,1000,479,802,26,NULL,5,4,'N'),(1525,1000,479,502,27,NULL,5,4,'N'),(1526,1000,479,778,28,NULL,5,4,'N'),(1527,1000,479,428,29,NULL,5,4,'N'),(1528,1000,479,763,30,NULL,5,4,'N'),(1529,1000,479,526,31,NULL,5,4,'N'),(1530,1000,479,784,32,NULL,5,4,'N'),(1531,1000,479,510,33,NULL,5,4,'N'),(1532,1000,479,781,34,NULL,5,4,'N'),(1533,1000,480,571,1,NULL,5,4,'N'),(1534,1000,480,793,2,NULL,5,4,'N'),(1535,1000,480,565,3,NULL,5,4,'N'),(1536,1000,480,789,4,NULL,5,4,'N'),(1537,1000,480,440,5,NULL,5,4,'N'),(1538,1000,480,766,6,NULL,5,4,'N'),(1539,1000,480,474,7,NULL,5,4,'N'),(1540,1000,480,773,8,NULL,5,4,'N'),(1541,1000,480,528,9,NULL,5,4,'N'),(1542,1000,480,785,10,NULL,5,4,'N'),(1543,1000,480,534,11,NULL,5,4,'N'),(1544,1000,480,787,12,NULL,5,4,'N'),(1545,1000,480,595,13,NULL,5,4,'N'),(1546,1000,480,798,14,NULL,5,4,'N'),(1547,1000,480,522,15,NULL,5,4,'N'),(1548,1000,480,783,16,NULL,5,4,'N'),(1549,1000,480,539,17,NULL,5,4,'N'),(1550,1000,480,788,18,NULL,5,4,'N'),(1551,1000,480,577,19,NULL,5,4,'N'),(1552,1000,480,796,20,NULL,5,4,'N'),(1553,1000,480,560,21,NULL,5,4,'N'),(1554,1000,480,791,22,NULL,5,4,'N'),(1555,1000,480,502,23,NULL,5,4,'N'),(1556,1000,480,778,24,NULL,5,4,'N'),(1557,1000,480,609,25,NULL,5,4,'N'),(1558,1000,480,802,26,NULL,5,4,'N'),(1559,1000,480,526,27,NULL,5,4,'N'),(1560,1000,480,784,28,NULL,5,4,'N'),(1561,1000,480,510,29,NULL,5,4,'N'),(1562,1000,480,781,30,NULL,5,4,'N'),(1563,1000,481,445,1,NULL,5,4,'N'),(1564,1000,481,768,2,NULL,5,4,'N'),(1565,1000,481,443,3,NULL,5,4,'N'),(1566,1000,481,767,4,NULL,5,4,'N'),(1567,1000,481,460,5,NULL,5,4,'N'),(1568,1000,481,771,6,NULL,5,4,'N'),(1569,1000,481,496,7,NULL,5,4,'N'),(1570,1000,481,777,8,NULL,5,4,'N'),(1571,1000,481,595,9,NULL,5,4,'N'),(1572,1000,481,798,10,NULL,5,4,'N'),(1573,1000,481,502,11,NULL,5,4,'N'),(1574,1000,481,778,12,NULL,5,4,'N'),(1575,1000,481,504,13,NULL,5,4,'N'),(1576,1000,481,779,14,NULL,5,4,'N'),(1577,1000,481,528,15,NULL,5,4,'N'),(1578,1000,481,785,16,NULL,5,4,'N'),(1579,1000,481,534,17,NULL,5,4,'N'),(1580,1000,481,787,18,NULL,5,4,'N'),(1581,1000,481,722,19,NULL,5,4,'N'),(1582,1000,481,770,20,NULL,5,4,'N'),(1583,1000,482,597,1,NULL,5,4,'N'),(1584,1000,482,799,2,NULL,5,4,'N'),(1585,1000,482,599,3,NULL,5,4,'N'),(1586,1000,482,800,4,NULL,5,4,'N'),(1587,1000,482,573,5,NULL,5,4,'N'),(1588,1000,482,794,6,NULL,5,4,'N'),(1589,1000,482,450,7,NULL,5,4,'N'),(1590,1000,482,769,8,NULL,5,4,'N'),(1591,1000,482,490,9,NULL,5,4,'N'),(1592,1000,482,775,10,NULL,5,4,'N'),(1593,1000,482,492,11,NULL,5,4,'N'),(1594,1000,482,776,12,NULL,5,4,'N'),(1595,1000,482,530,13,NULL,5,4,'N'),(1596,1000,482,786,14,NULL,5,4,'N'),(1597,1000,482,528,15,NULL,5,4,'N'),(1598,1000,482,785,16,NULL,5,4,'N'),(1599,1000,482,534,17,NULL,5,4,'N'),(1600,1000,482,787,18,NULL,5,4,'N'),(1601,1000,482,603,19,NULL,5,4,'N'),(1602,1000,482,801,20,NULL,5,4,'N'),(1603,1000,482,438,21,NULL,5,4,'N'),(1604,1000,482,765,22,NULL,5,4,'N'),(1605,1000,482,556,23,NULL,5,4,'N'),(1606,1000,482,790,24,NULL,5,4,'N'),(1607,1000,482,508,25,NULL,5,4,'N'),(1608,1000,482,780,26,NULL,5,4,'N'),(1609,1000,482,502,27,NULL,5,4,'N'),(1610,1000,482,778,28,NULL,5,4,'N'),(1611,1000,482,569,29,NULL,5,4,'N'),(1612,1000,482,792,30,NULL,5,4,'N'),(1613,1000,482,504,31,NULL,5,4,'N'),(1614,1000,482,779,32,NULL,5,4,'N'),(1615,1000,483,597,1,NULL,5,4,'N'),(1616,1000,483,799,2,NULL,5,4,'N'),(1617,1000,483,599,3,NULL,5,4,'N'),(1618,1000,483,800,4,NULL,5,4,'N'),(1619,1000,483,573,5,NULL,5,4,'N'),(1620,1000,483,794,6,NULL,5,4,'N'),(1621,1000,483,575,7,NULL,5,4,'N'),(1622,1000,483,795,8,NULL,5,4,'N'),(1623,1000,483,492,9,NULL,5,4,'N'),(1624,1000,483,776,10,NULL,5,4,'N'),(1625,1000,483,468,11,NULL,5,4,'N'),(1626,1000,483,772,12,NULL,5,4,'N'),(1627,1000,483,530,13,NULL,5,4,'N'),(1628,1000,483,786,14,NULL,5,4,'N'),(1629,1000,483,528,15,NULL,5,4,'N'),(1630,1000,483,785,16,NULL,5,4,'N'),(1631,1000,483,534,17,NULL,5,4,'N'),(1632,1000,483,787,18,NULL,5,4,'N'),(1633,1000,483,556,19,NULL,5,4,'N'),(1634,1000,483,790,20,NULL,5,4,'N'),(1635,1000,483,438,21,NULL,5,4,'N'),(1636,1000,483,765,22,NULL,5,4,'N'),(1637,1000,483,502,23,NULL,5,4,'N'),(1638,1000,483,778,24,NULL,5,4,'N'),(1639,1000,483,595,25,NULL,5,4,'N'),(1640,1000,483,798,26,NULL,5,4,'N'),(1641,1000,483,508,27,NULL,5,4,'N'),(1642,1000,483,780,28,NULL,5,4,'N'),(1643,1000,483,510,29,NULL,5,4,'N'),(1644,1000,483,781,30,NULL,5,4,'N'),(1645,1000,483,504,31,NULL,5,4,'N'),(1646,1000,483,779,32,NULL,5,4,'N'),(1647,1000,484,440,1,NULL,5,4,'N'),(1648,1000,484,766,2,NULL,5,4,'N'),(1649,1000,484,443,3,NULL,5,4,'N'),(1650,1000,484,767,4,NULL,5,4,'N'),(1651,1000,484,597,5,NULL,5,4,'N'),(1652,1000,484,799,6,NULL,5,4,'N'),(1653,1000,484,573,7,NULL,5,4,'N'),(1654,1000,484,794,8,NULL,5,4,'N'),(1655,1000,484,450,9,NULL,5,4,'N'),(1656,1000,484,769,10,NULL,5,4,'N'),(1657,1000,484,530,11,NULL,5,4,'N'),(1658,1000,484,786,12,NULL,5,4,'N'),(1659,1000,484,460,13,NULL,5,4,'N'),(1660,1000,484,771,14,NULL,5,4,'N'),(1661,1000,484,482,15,NULL,5,4,'N'),(1662,1000,484,774,16,NULL,5,4,'N'),(1663,1000,484,496,17,NULL,5,4,'N'),(1664,1000,484,777,18,NULL,5,4,'N'),(1665,1000,484,492,19,NULL,5,4,'N'),(1666,1000,484,776,20,NULL,5,4,'N'),(1667,1000,484,534,21,NULL,5,4,'N'),(1668,1000,484,787,22,NULL,5,4,'N'),(1669,1000,484,603,23,NULL,5,4,'N'),(1670,1000,484,801,24,NULL,5,4,'N'),(1671,1000,484,528,25,NULL,5,4,'N'),(1672,1000,484,785,26,NULL,5,4,'N'),(1673,1000,484,502,27,NULL,5,4,'N'),(1674,1000,484,778,28,NULL,5,4,'N'),(1675,1000,484,508,29,NULL,5,4,'N'),(1676,1000,484,780,30,NULL,5,4,'N'),(1677,1000,484,430,31,NULL,5,4,'N'),(1678,1000,484,764,32,NULL,5,4,'N'),(1679,1000,484,560,33,NULL,5,4,'N'),(1680,1000,484,791,34,NULL,5,4,'N'),(1681,1000,484,504,35,NULL,5,4,'N'),(1682,1000,484,779,36,NULL,5,4,'N'),(1683,1000,484,595,37,NULL,5,4,'N'),(1684,1000,484,798,38,NULL,5,4,'N'),(1685,1000,484,516,39,NULL,5,4,'N'),(1686,1000,484,782,40,NULL,5,4,'N'),(1687,1000,485,440,1,NULL,5,4,'N'),(1688,1000,485,766,2,NULL,5,4,'N'),(1689,1000,485,443,3,NULL,5,4,'N'),(1690,1000,485,767,4,NULL,5,4,'N'),(1691,1000,485,597,5,NULL,5,4,'N'),(1692,1000,485,799,6,NULL,5,4,'N'),(1693,1000,485,573,7,NULL,5,4,'N'),(1694,1000,485,794,8,NULL,5,4,'N'),(1695,1000,485,450,9,NULL,5,4,'N'),(1696,1000,485,769,10,NULL,5,4,'N'),(1697,1000,485,530,11,NULL,5,4,'N'),(1698,1000,485,786,12,NULL,5,4,'N'),(1699,1000,485,460,13,NULL,5,4,'N'),(1700,1000,485,771,14,NULL,5,4,'N'),(1701,1000,485,482,15,NULL,5,4,'N'),(1702,1000,485,774,16,NULL,5,4,'N'),(1703,1000,485,496,17,NULL,5,4,'N'),(1704,1000,485,777,18,NULL,5,4,'N'),(1705,1000,485,492,19,NULL,5,4,'N'),(1706,1000,485,776,20,NULL,5,4,'N'),(1707,1000,485,534,21,NULL,5,4,'N'),(1708,1000,485,787,22,NULL,5,4,'N'),(1709,1000,485,603,23,NULL,5,4,'N'),(1710,1000,485,801,24,NULL,5,4,'N'),(1711,1000,485,528,25,NULL,5,4,'N'),(1712,1000,485,785,26,NULL,5,4,'N'),(1713,1000,485,502,27,NULL,5,4,'N'),(1714,1000,485,778,28,NULL,5,4,'N'),(1715,1000,485,508,29,NULL,5,4,'N'),(1716,1000,485,780,30,NULL,5,4,'N'),(1717,1000,485,430,31,NULL,5,4,'N'),(1718,1000,485,764,32,NULL,5,4,'N'),(1719,1000,485,560,33,NULL,5,4,'N'),(1720,1000,485,791,34,NULL,5,4,'N'),(1721,1000,485,504,35,NULL,5,4,'N'),(1722,1000,485,779,36,NULL,5,4,'N'),(1723,1000,485,595,37,NULL,5,4,'N'),(1724,1000,485,798,38,NULL,5,4,'N'),(1725,1000,485,516,39,NULL,5,4,'N'),(1726,1000,485,782,40,NULL,5,4,'N'),(1727,1000,486,440,1,NULL,5,4,'N'),(1728,1000,486,766,2,NULL,5,4,'N'),(1729,1000,486,443,3,NULL,5,4,'N'),(1730,1000,486,767,4,NULL,5,4,'N'),(1731,1000,486,597,5,NULL,5,4,'N'),(1732,1000,486,799,6,NULL,5,4,'N'),(1733,1000,486,573,7,NULL,5,4,'N'),(1734,1000,486,794,8,NULL,5,4,'N'),(1735,1000,486,450,9,NULL,5,4,'N'),(1736,1000,486,769,10,NULL,5,4,'N'),(1737,1000,486,530,11,NULL,5,4,'N'),(1738,1000,486,786,12,NULL,5,4,'N'),(1739,1000,486,460,13,NULL,5,4,'N'),(1740,1000,486,771,14,NULL,5,4,'N'),(1741,1000,486,482,15,NULL,5,4,'N'),(1742,1000,486,774,16,NULL,5,4,'N'),(1743,1000,486,496,17,NULL,5,4,'N'),(1744,1000,486,777,18,NULL,5,4,'N'),(1745,1000,486,492,19,NULL,5,4,'N'),(1746,1000,486,776,20,NULL,5,4,'N'),(1747,1000,486,534,21,NULL,5,4,'N'),(1748,1000,486,787,22,NULL,5,4,'N'),(1749,1000,486,603,23,NULL,5,4,'N'),(1750,1000,486,801,24,NULL,5,4,'N'),(1751,1000,486,528,25,NULL,5,4,'N'),(1752,1000,486,785,26,NULL,5,4,'N'),(1753,1000,486,502,27,NULL,5,4,'N'),(1754,1000,486,778,28,NULL,5,4,'N'),(1755,1000,486,508,29,NULL,5,4,'N'),(1756,1000,486,780,30,NULL,5,4,'N'),(1757,1000,486,430,31,NULL,5,4,'N'),(1758,1000,486,764,32,NULL,5,4,'N'),(1759,1000,486,560,33,NULL,5,4,'N'),(1760,1000,486,791,34,NULL,5,4,'N'),(1761,1000,486,504,35,NULL,5,4,'N'),(1762,1000,486,779,36,NULL,5,4,'N'),(1763,1000,486,595,37,NULL,5,4,'N'),(1764,1000,486,798,38,NULL,5,4,'N'),(1765,1000,486,516,39,NULL,5,4,'N'),(1766,1000,486,782,40,NULL,5,4,'N'),(1767,1000,487,803,1,NULL,4,5,'Y'),(1769,1000,488,804,1,NULL,4,5,'Y'),(1771,1000,489,806,1,NULL,4,5,'Y'),(1772,1000,490,807,1,NULL,4,5,'Y'),(1773,1000,490,808,2,NULL,4,5,'N'),(1774,1000,491,807,1,NULL,4,5,'Y'),(1776,1000,233,809,1,NULL,4,5,'N'),(1777,1000,492,810,1,NULL,4,5,'N'),(1778,1000,492,811,2,NULL,5,5,'N'),(1779,1000,493,810,1,NULL,4,5,'N'),(1780,1000,493,811,2,NULL,5,5,'N'),(1781,1000,494,810,1,NULL,4,5,'N'),(1782,1000,494,811,2,NULL,5,5,'N'),(1783,1000,495,810,1,NULL,4,5,'N'),(1784,1000,495,811,2,NULL,5,5,'N'),(1785,1000,496,810,1,NULL,4,5,'N'),(1786,1000,496,811,2,NULL,5,5,'N'),(1787,1000,475,812,41,NULL,5,5,'N'),(1788,1000,476,812,41,NULL,5,5,'N'),(1789,1000,477,812,41,NULL,5,5,'N'),(1790,1000,484,812,41,NULL,5,5,'N'),(1791,1000,485,812,41,NULL,5,5,'N'),(1792,1000,486,812,41,NULL,5,5,'N'),(1793,1000,497,440,1,NULL,5,4,'N'),(1794,1000,497,726,2,NULL,5,4,'N'),(1795,1000,497,443,3,NULL,5,4,'N'),(1796,1000,497,727,4,NULL,5,4,'N'),(1797,1000,497,597,5,NULL,5,4,'N'),(1798,1000,497,759,6,NULL,5,4,'N'),(1799,1000,497,573,7,NULL,5,4,'N'),(1800,1000,497,754,8,NULL,5,4,'N'),(1801,1000,497,450,9,NULL,5,4,'N'),(1802,1000,497,729,10,NULL,5,4,'N'),(1803,1000,497,530,11,NULL,5,4,'N'),(1804,1000,497,746,12,NULL,5,4,'N'),(1805,1000,497,460,13,NULL,5,4,'N'),(1806,1000,497,731,14,NULL,5,4,'N'),(1807,1000,497,482,15,NULL,5,4,'N'),(1808,1000,497,734,16,NULL,5,4,'N'),(1809,1000,497,496,17,NULL,5,4,'N'),(1810,1000,497,737,18,NULL,5,4,'N'),(1811,1000,497,492,19,NULL,5,4,'N'),(1812,1000,497,736,20,NULL,5,4,'N'),(1813,1000,497,534,21,NULL,5,4,'N'),(1814,1000,497,747,22,NULL,5,4,'N'),(1815,1000,497,603,23,NULL,5,4,'N'),(1816,1000,497,761,24,NULL,5,4,'N'),(1817,1000,497,528,25,NULL,5,4,'N'),(1818,1000,497,745,26,NULL,5,4,'N'),(1819,1000,497,502,27,NULL,5,4,'N'),(1820,1000,497,738,28,NULL,5,4,'N'),(1821,1000,497,508,29,NULL,5,4,'N'),(1822,1000,497,740,30,NULL,5,4,'N'),(1823,1000,497,430,31,NULL,5,4,'N'),(1824,1000,497,724,32,NULL,5,4,'N'),(1825,1000,497,560,33,NULL,5,4,'N'),(1826,1000,497,751,34,NULL,5,4,'N'),(1827,1000,497,504,35,NULL,5,4,'N'),(1828,1000,497,739,36,NULL,5,4,'N'),(1829,1000,497,812,37,NULL,5,5,'N'),(1830,1000,498,440,1,NULL,5,4,'N'),(1831,1000,498,726,2,NULL,5,4,'N'),(1832,1000,498,443,3,NULL,5,4,'N'),(1833,1000,498,727,4,NULL,5,4,'N'),(1834,1000,498,597,5,NULL,5,4,'N'),(1835,1000,498,759,6,NULL,5,4,'N'),(1836,1000,498,573,7,NULL,5,4,'N'),(1837,1000,498,754,8,NULL,5,4,'N'),(1838,1000,498,450,9,NULL,5,4,'N'),(1839,1000,498,729,10,NULL,5,4,'N'),(1840,1000,498,530,11,NULL,5,4,'N'),(1841,1000,498,746,12,NULL,5,4,'N'),(1842,1000,498,460,13,NULL,5,4,'N'),(1843,1000,498,731,14,NULL,5,4,'N'),(1844,1000,498,482,15,NULL,5,4,'N'),(1845,1000,498,734,16,NULL,5,4,'N'),(1846,1000,498,496,17,NULL,5,4,'N'),(1847,1000,498,737,18,NULL,5,4,'N'),(1848,1000,498,492,19,NULL,5,4,'N'),(1849,1000,498,736,20,NULL,5,4,'N'),(1850,1000,498,534,21,NULL,5,4,'N'),(1851,1000,498,747,22,NULL,5,4,'N'),(1852,1000,498,603,23,NULL,5,4,'N'),(1853,1000,498,761,24,NULL,5,4,'N'),(1854,1000,498,528,25,NULL,5,4,'N'),(1855,1000,498,745,26,NULL,5,4,'N'),(1856,1000,498,502,27,NULL,5,4,'N'),(1857,1000,498,738,28,NULL,5,4,'N'),(1858,1000,498,508,29,NULL,5,4,'N'),(1859,1000,498,740,30,NULL,5,4,'N'),(1860,1000,498,430,31,NULL,5,4,'N'),(1861,1000,498,724,32,NULL,5,4,'N'),(1862,1000,498,560,33,NULL,5,4,'N'),(1863,1000,498,751,34,NULL,5,4,'N'),(1864,1000,498,504,35,NULL,5,4,'N'),(1865,1000,498,739,36,NULL,5,4,'N'),(1866,1000,498,812,37,NULL,5,5,'N'),(1867,1000,499,440,1,NULL,5,4,'N'),(1868,1000,499,726,2,NULL,5,4,'N'),(1869,1000,499,443,3,NULL,5,4,'N'),(1870,1000,499,727,4,NULL,5,4,'N'),(1871,1000,499,597,5,NULL,5,4,'N'),(1872,1000,499,759,6,NULL,5,4,'N'),(1873,1000,499,573,7,NULL,5,4,'N'),(1874,1000,499,754,8,NULL,5,4,'N'),(1875,1000,499,450,9,NULL,5,4,'N'),(1876,1000,499,729,10,NULL,5,4,'N'),(1877,1000,499,530,11,NULL,5,4,'N'),(1878,1000,499,746,12,NULL,5,4,'N'),(1879,1000,499,460,13,NULL,5,4,'N'),(1880,1000,499,731,14,NULL,5,4,'N'),(1881,1000,499,482,15,NULL,5,4,'N'),(1882,1000,499,734,16,NULL,5,4,'N'),(1883,1000,499,496,17,NULL,5,4,'N'),(1884,1000,499,737,18,NULL,5,4,'N'),(1885,1000,499,492,19,NULL,5,4,'N'),(1886,1000,499,736,20,NULL,5,4,'N'),(1887,1000,499,534,21,NULL,5,4,'N'),(1888,1000,499,747,22,NULL,5,4,'N'),(1889,1000,499,603,23,NULL,5,4,'N'),(1890,1000,499,761,24,NULL,5,4,'N'),(1891,1000,499,528,25,NULL,5,4,'N'),(1892,1000,499,745,26,NULL,5,4,'N'),(1893,1000,499,502,27,NULL,5,4,'N'),(1894,1000,499,738,28,NULL,5,4,'N'),(1895,1000,499,508,29,NULL,5,4,'N'),(1896,1000,499,740,30,NULL,5,4,'N'),(1897,1000,499,430,31,NULL,5,4,'N'),(1898,1000,499,724,32,NULL,5,4,'N'),(1899,1000,499,560,33,NULL,5,4,'N'),(1900,1000,499,751,34,NULL,5,4,'N'),(1901,1000,499,504,35,NULL,5,4,'N'),(1902,1000,499,739,36,NULL,5,4,'N'),(1903,1000,499,812,37,NULL,5,5,'N'),(1904,1000,500,440,1,NULL,5,4,'N'),(1905,1000,500,766,2,NULL,5,4,'N'),(1906,1000,500,443,3,NULL,5,4,'N'),(1907,1000,500,767,4,NULL,5,4,'N'),(1908,1000,500,597,5,NULL,5,4,'N'),(1909,1000,500,799,6,NULL,5,4,'N'),(1910,1000,500,573,7,NULL,5,4,'N'),(1911,1000,500,794,8,NULL,5,4,'N'),(1912,1000,500,450,9,NULL,5,4,'N'),(1913,1000,500,769,10,NULL,5,4,'N'),(1914,1000,500,530,11,NULL,5,4,'N'),(1915,1000,500,786,12,NULL,5,4,'N'),(1916,1000,500,460,13,NULL,5,4,'N'),(1917,1000,500,771,14,NULL,5,4,'N'),(1918,1000,500,482,15,NULL,5,4,'N'),(1919,1000,500,774,16,NULL,5,4,'N'),(1920,1000,500,496,17,NULL,5,4,'N'),(1921,1000,500,777,18,NULL,5,4,'N'),(1922,1000,500,492,19,NULL,5,4,'N'),(1923,1000,500,776,20,NULL,5,4,'N'),(1924,1000,500,534,21,NULL,5,4,'N'),(1925,1000,500,787,22,NULL,5,4,'N'),(1926,1000,500,603,23,NULL,5,4,'N'),(1927,1000,500,801,24,NULL,5,4,'N'),(1928,1000,500,528,25,NULL,5,4,'N'),(1929,1000,500,785,26,NULL,5,4,'N'),(1930,1000,500,502,27,NULL,5,4,'N'),(1931,1000,500,778,28,NULL,5,4,'N'),(1932,1000,500,508,29,NULL,5,4,'N'),(1933,1000,500,780,30,NULL,5,4,'N'),(1934,1000,500,430,31,NULL,5,4,'N'),(1935,1000,500,764,32,NULL,5,4,'N'),(1936,1000,500,560,33,NULL,5,4,'N'),(1937,1000,500,791,34,NULL,5,4,'N'),(1938,1000,500,504,35,NULL,5,4,'N'),(1939,1000,500,779,36,NULL,5,4,'N'),(1940,1000,500,812,37,NULL,5,5,'N'),(1941,1000,501,440,1,NULL,5,4,'N'),(1942,1000,501,766,2,NULL,5,4,'N'),(1943,1000,501,443,3,NULL,5,4,'N'),(1944,1000,501,767,4,NULL,5,4,'N'),(1945,1000,501,597,5,NULL,5,4,'N'),(1946,1000,501,799,6,NULL,5,4,'N'),(1947,1000,501,573,7,NULL,5,4,'N'),(1948,1000,501,794,8,NULL,5,4,'N'),(1949,1000,501,450,9,NULL,5,4,'N'),(1950,1000,501,769,10,NULL,5,4,'N'),(1951,1000,501,530,11,NULL,5,4,'N'),(1952,1000,501,786,12,NULL,5,4,'N'),(1953,1000,501,460,13,NULL,5,4,'N'),(1954,1000,501,771,14,NULL,5,4,'N'),(1955,1000,501,482,15,NULL,5,4,'N'),(1956,1000,501,774,16,NULL,5,4,'N'),(1957,1000,501,496,17,NULL,5,4,'N'),(1958,1000,501,777,18,NULL,5,4,'N'),(1959,1000,501,492,19,NULL,5,4,'N'),(1960,1000,501,776,20,NULL,5,4,'N'),(1961,1000,501,534,21,NULL,5,4,'N'),(1962,1000,501,787,22,NULL,5,4,'N'),(1963,1000,501,603,23,NULL,5,4,'N'),(1964,1000,501,801,24,NULL,5,4,'N'),(1965,1000,501,528,25,NULL,5,4,'N'),(1966,1000,501,785,26,NULL,5,4,'N'),(1967,1000,501,502,27,NULL,5,4,'N'),(1968,1000,501,778,28,NULL,5,4,'N'),(1969,1000,501,508,29,NULL,5,4,'N'),(1970,1000,501,780,30,NULL,5,4,'N'),(1971,1000,501,430,31,NULL,5,4,'N'),(1972,1000,501,764,32,NULL,5,4,'N'),(1973,1000,501,560,33,NULL,5,4,'N'),(1974,1000,501,791,34,NULL,5,4,'N'),(1975,1000,501,504,35,NULL,5,4,'N'),(1976,1000,501,779,36,NULL,5,4,'N'),(1977,1000,501,812,37,NULL,5,5,'N'),(1978,1000,502,440,1,NULL,5,4,'N'),(1979,1000,502,766,2,NULL,5,4,'N'),(1980,1000,502,443,3,NULL,5,4,'N'),(1981,1000,502,767,4,NULL,5,4,'N'),(1982,1000,502,597,5,NULL,5,4,'N'),(1983,1000,502,799,6,NULL,5,4,'N'),(1984,1000,502,573,7,NULL,5,4,'N'),(1985,1000,502,794,8,NULL,5,4,'N'),(1986,1000,502,450,9,NULL,5,4,'N'),(1987,1000,502,769,10,NULL,5,4,'N'),(1988,1000,502,530,11,NULL,5,4,'N'),(1989,1000,502,786,12,NULL,5,4,'N'),(1990,1000,502,460,13,NULL,5,4,'N'),(1991,1000,502,771,14,NULL,5,4,'N'),(1992,1000,502,482,15,NULL,5,4,'N'),(1993,1000,502,774,16,NULL,5,4,'N'),(1994,1000,502,496,17,NULL,5,4,'N'),(1995,1000,502,777,18,NULL,5,4,'N'),(1996,1000,502,492,19,NULL,5,4,'N'),(1997,1000,502,776,20,NULL,5,4,'N'),(1998,1000,502,534,21,NULL,5,4,'N'),(1999,1000,502,787,22,NULL,5,4,'N'),(2000,1000,502,603,23,NULL,5,4,'N'),(2001,1000,502,801,24,NULL,5,4,'N'),(2002,1000,502,528,25,NULL,5,4,'N'),(2003,1000,502,785,26,NULL,5,4,'N'),(2004,1000,502,502,27,NULL,5,4,'N'),(2005,1000,502,778,28,NULL,5,4,'N'),(2006,1000,502,508,29,NULL,5,4,'N'),(2007,1000,502,780,30,NULL,5,4,'N'),(2008,1000,502,430,31,NULL,5,4,'N'),(2009,1000,502,764,32,NULL,5,4,'N'),(2010,1000,502,560,33,NULL,5,4,'N'),(2011,1000,502,791,34,NULL,5,4,'N'),(2012,1000,502,504,35,NULL,5,4,'N'),(2013,1000,502,779,36,NULL,5,4,'N'),(2014,1000,502,812,37,NULL,5,5,'N'),(2015,1000,503,813,1,NULL,4,5,'N'),(2016,1000,504,814,1,NULL,4,5,'N'),(2017,1000,505,815,1,NULL,4,5,'N'),(2018,1000,506,816,1,NULL,4,5,'N'),(2019,1000,507,817,1,NULL,4,5,'N'),(2020,1000,508,818,1,NULL,4,5,'N'),(2021,1000,509,819,1,NULL,4,5,'N'),(2022,1000,510,820,1,NULL,4,5,'N'),(2023,1,512,821,1,1,4,5,'N'),(2024,1,512,822,20,2,4,5,'N'),(2025,1,512,823,30,3,4,5,'N'),(2026,1,512,824,40,4,4,5,'N'),(2027,1,512,825,50,5,4,5,'N'),(2028,1,513,826,1,1,4,5,'N'),(2029,1,514,827,1,1,4,5,'N'),(2030,1,514,828,20,2,4,5,'N'),(2031,1,515,827,1,1,4,5,'N'),(2032,1,515,828,20,2,4,5,'N'),(2033,1,516,829,1,1,4,5,'N'),(2034,1,517,830,1,1,4,5,'N'),(2035,1,517,831,20,2,4,5,'N'),(2036,1,517,832,30,3,4,5,'N'),(2037,1,518,833,1,1,4,5,'N'),(2038,1,519,834,1,1,4,5,'N'),(2039,1,519,822,20,2,4,5,'N'),(2040,1,519,823,30,3,4,5,'N'),(2041,1,519,824,40,4,4,5,'N'),(2042,1,519,825,50,5,4,5,'N'),(2043,1,520,827,1,1,4,5,'N'),(2044,1,520,828,20,2,4,5,'N'),(2045,1,521,835,1,1,4,5,'N'),(2046,1,522,837,10,1,4,5,'N'),(2047,1,522,836,20,2,4,5,'N'),(2048,1,522,838,30,3,4,5,'N'),(2049,1,522,839,40,4,4,5,'N'),(2050,1,522,840,50,5,4,5,'N'),(2051,1,522,841,60,6,4,5,'N'),(2052,1,522,842,70,7,4,5,'N'),(2053,1,522,843,80,8,4,5,'N'),(2054,1,522,844,90,9,4,5,'N'),(2055,1,522,845,100,10,4,5,'N'),(2056,1,522,846,110,11,4,5,'N'),(2057,1,522,847,120,12,4,5,'N'),(2058,1,522,848,130,13,4,5,'N'),(2059,1,522,849,140,14,4,5,'N'),(2060,1,522,850,150,15,4,5,'N'),(2061,1,522,851,160,16,4,5,'N'),(2062,1,522,852,170,17,4,5,'N'),(2063,1,522,853,180,18,4,5,'N'),(2064,1,522,854,190,19,4,5,'N'),(2065,1,522,855,200,20,4,5,'N'),(2066,1,522,856,210,21,4,5,'N'),(2067,1,522,857,220,22,4,5,'N'),(2068,1,522,858,230,23,4,5,'N'),(2069,1,522,859,240,24,4,5,'N'),(2070,1,522,860,250,25,4,5,'N'),(2071,1,522,861,260,26,4,5,'N'),(2072,1,522,862,270,27,4,5,'N'),(2073,1,522,863,280,28,4,5,'N'),(2074,1,522,864,290,29,4,5,'N'),(2075,1,522,865,300,30,4,5,'N'),(2076,1,522,866,310,31,4,5,'N'),(2077,1,522,867,320,32,4,5,'N'),(2078,1,522,868,330,33,4,5,'N'),(2079,1,522,869,340,34,4,5,'N'),(2080,1,522,870,350,35,4,5,'N'),(2081,1,522,871,360,36,4,5,'N'),(2082,1,522,872,370,37,4,5,'N'),(2083,1,522,873,380,38,4,5,'N'),(2084,1,522,874,390,39,4,5,'N'),(2085,1,522,875,400,40,4,5,'N'),(2086,1,522,876,410,41,4,5,'N'),(2087,1,522,877,420,42,4,5,'N'),(2088,1,522,878,430,43,4,5,'N'),(2089,1,522,879,440,44,4,5,'N'),(2090,1,522,880,450,45,4,5,'N'),(2091,1,522,881,460,46,4,5,'N');
/*!40000 ALTER TABLE `sigl_05_07_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_05_07_data_test`
--

DROP TABLE IF EXISTS `sigl_05_07_data_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_05_07_data_test` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_refanalyse` int unsigned NOT NULL,
  `id_refvariable` int unsigned NOT NULL,
  `position` int unsigned DEFAULT NULL,
  `num_var` int unsigned DEFAULT NULL,
  `obligatoire` int DEFAULT '4',
  `var_whonet` int DEFAULT '5',
  `var_qrcode` varchar(10) DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `UNIQUE` (`id_refanalyse`,`id_refvariable`),
  KEY `FK_sigl_05_07_data_1` (`id_owner`),
  KEY `FK_sigl_05_07_data_3` (`id_refvariable`),
  KEY `idx_oblig` (`obligatoire`),
  KEY `idx_whonet` (`var_whonet`),
  KEY `idx_pos` (`position`),
  KEY `idx_num_var` (`num_var`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_05_07_data_test`
--

LOCK TABLES `sigl_05_07_data_test` WRITE;
/*!40000 ALTER TABLE `sigl_05_07_data_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_05_07_data_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_05_data`
--

DROP TABLE IF EXISTS `sigl_05_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_05_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `code` varchar(7) DEFAULT NULL,
  `nom` varchar(120) NOT NULL,
  `abbr` varchar(20) DEFAULT NULL,
  `famille` int unsigned DEFAULT NULL,
  `cote_unite` varchar(2) DEFAULT NULL,
  `cote_valeur` decimal(10,2) DEFAULT NULL,
  `commentaire` text,
  `produit_biologique` int unsigned DEFAULT NULL,
  `type_prel` int unsigned DEFAULT NULL,
  `type_analyse` int unsigned DEFAULT NULL,
  `actif` int unsigned DEFAULT NULL,
  `ana_whonet` int DEFAULT '5',
  `ana_ast` varchar(1) NOT NULL DEFAULT 'N',
  `ana_loinc` varchar(20) DEFAULT '',
  `ana_lite` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `code` (`code`),
  KEY `id_owner` (`id_owner`),
  KEY `sigl_05_data_ibfk_3` (`famille`),
  KEY `sigl_05_data_ibfk_5` (`produit_biologique`),
  KEY `sigl_05_data_ibfk_6` (`type_prel`),
  KEY `sigl_05_data_ibfk_7` (`type_analyse`),
  KEY `sigl_05_data_ibfk_8` (`actif`),
  KEY `idx_name` (`nom`),
  KEY `idx_typeprel_code` (`type_prel`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_05_data`
--

LOCK TABLES `sigl_05_data` WRITE;
/*!40000 ALTER TABLE `sigl_05_data` DISABLE KEYS */;
INSERT INTO `sigl_05_data` VALUES (1,1010,'PB1','Venous blood collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(2,1010,'PB2','Multiple venous blood collections (at least 3)',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(3,1010,'PB3','Urine collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(4,1010,'PB4','Stool collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(5,1010,'PB5','Aspiration fluid collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(6,1010,'PB6','Sputum collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(7,1010,'PB7','Vaginal swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(8,1010,'PB8','Urethral swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(9,1010,'PB9','Arterial blood collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(10,1010,'PB10','Throat swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(11,1010,'PB11','Ear swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(12,1010,'PB12','Capillary blood collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(13,1010,'PB13','Nasal swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(14,1010,'PB14','Anal swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(15,1010,'PB15','Buccal swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(16,1010,'PB16','Ocular swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(17,1010,'PB17','Pus swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(18,1010,'PB18','Hair, scales and skin appendages collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(19,1010,'PB19','Bone marrow collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(20,1010,'PB20','Lymph node collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(21,1010,'PB21','Bronchial collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(22,1010,'PB22','Semen collection',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(23,1010,'PB23','Other collections',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','','N'),(24,1010,'B001','Uric acid (uricemia)',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','14933-6','N'),(25,1010,'B002','Bicarbonates',NULL,11,'B',20.00,NULL,1,138,170,4,5,'N','1963-8','N'),(26,1010,'B003','Total bilirubin',NULL,11,'B',30.00,NULL,1,138,171,4,5,'N','75697-3','N'),(27,1010,'B502','Direct bilirubin (conjugated)',NULL,11,'B',NULL,NULL,1,138,170,4,5,'N','75697-3','N'),(28,1010,'B501','Indirect bilirubin',NULL,11,'B',NULL,NULL,1,138,170,4,5,'N','75697-3','N'),(29,1010,'B004','Creatininemia',NULL,11,'B',10.00,NULL,1,138,170,4,5,'N','45066-8','N'),(30,1010,'B005','Glucose',NULL,11,'B',10.00,NULL,1,138,170,4,5,'N','14749-6','N'),(31,1010,'B006','Urea',NULL,11,'B',10.00,NULL,1,138,170,4,5,'N','22664-7','N'),(32,1010,'B007','Ammonia by colorimetry',NULL,11,'B',40.00,NULL,1,138,170,4,5,'N','16362-6','N'),(33,1010,'B008','Calcium (calcemia)',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','2000-8','N'),(34,1010,'B009','Chloride (chloremia)',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','','N'),(35,1010,'B010','Serum iron',NULL,11,'B',20.00,NULL,1,138,170,4,5,'N','50190-8','N'),(36,1010,'B011','Complete electrolyte panel (includes at least Na, K, Cl, Bicarbonates, proteins)','Complete electrolyte panel',11,'B',60.00,NULL,1,138,171,4,5,'N','24326-1','N'),(37,1010,'B012','Extended electrolyte panel (complete with Ca, Phosphates)','Extended electrolyte panel',11,'B',80.00,NULL,1,138,171,4,5,'N','','N'),(38,1010,'B013','3-parameter electrolyte panel (Na, K, Cl)',NULL,11,'B',30.00,NULL,1,138,171,4,5,'N','24326-1','N'),(39,1010,'B014','Lithium',NULL,11,'B',30.00,NULL,1,138,170,4,5,'N','14334-7','N'),(40,1010,'B015','Plasma magnesium',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','2601-3','N'),(41,1010,'B016','Erythrocyte magnesium',NULL,11,'B',60.00,NULL,1,138,170,4,5,'N','2597-3','N'),(42,1010,'B017','Phosphates (phosphoremia)',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','14879-1','N'),(43,1010,'B018','Potassium Sodium (flame photometry or potentiometry)',NULL,11,'B',20.00,NULL,1,138,171,4,5,'N','24329-5','N'),(44,1010,'B019','Potassium by colorimetry',NULL,11,'B',10.00,NULL,1,138,170,4,5,'N','2823-3','N'),(45,1010,'B020','Sodium by colorimetry',NULL,11,'B',10.00,NULL,1,138,170,4,5,'N','','N'),(46,1010,'B021','Total cholesterol',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','14647-2','N'),(47,1010,'B022','HDL cholesterol',NULL,11,'B',30.00,NULL,1,138,170,4,5,'N','24331-1','N'),(48,1010,'B023','LDL cholesterol',NULL,11,'B',30.00,NULL,1,138,170,4,5,'N','22748-8','N'),(49,1010,'B503','Lipid panel (Total cholesterol, HDL, LDL, Triglycerides)',NULL,11,'B',40.00,NULL,1,138,170,4,5,'N','24331-1','N'),(50,1010,'B025','Lipid electrophoresis (lipidogram)',NULL,11,'B',60.00,NULL,1,138,170,4,5,'N','24351-9','N'),(51,1010,'B026','Lipoprotein A1 by immunoassay',NULL,11,'B',80.00,NULL,1,138,170,4,5,'N','1869-7','N'),(52,1010,'B027','Lipoprotein B by immunoassay',NULL,11,'B',80.00,NULL,1,138,170,4,5,'N','1884-6','N'),(53,1010,'B028','Lipoproteins A1 and B by immunoassay',NULL,11,'B',150.00,NULL,1,138,171,4,5,'N','1869-7','N'),(54,1010,'B029','Triglycerides',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','14927-8','N'),(55,1010,'B030','Albumin by colorimetric method',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','1751-7','N'),(56,1010,'B031','Albumin by immunoassay',NULL,11,'B',40.00,NULL,1,138,170,4,5,'N','1751-7','N'),(57,1010,'B032','Hemoglobin electrophoresis without tracing',NULL,11,'B',20.00,NULL,1,138,170,4,5,'N','43113-0','N'),(58,1010,'B033','Hemoglobin electrophoresis with densitometric quantification',NULL,11,'B',40.00,NULL,1,138,170,4,5,'N','43113-0','N'),(59,1010,'B034','Hemoglobin electrophoresis by HPLC',NULL,11,'B',60.00,NULL,1,138,170,4,5,'N','43113-0','N'),(60,1010,'B035','Protein electrophoresis (proteinogram)',NULL,11,'B',50.00,'With percentage determination, total protein dosage',1,138,170,4,5,'N','24351-9','N'),(61,1010,'B036','Glycated hemoglobin (Hb A1c)',NULL,11,'B',50.00,NULL,1,138,170,4,5,'N','4548-4','N'),(62,1010,'B037','Hemoglobin F: HPLC assay',NULL,11,'B',60.00,NULL,1,138,170,4,5,'N','4576-5','N'),(63,1010,'B038','Hemoglobin S: solubility test',NULL,11,'B',10.00,NULL,1,138,170,4,5,'N','6864-3','N'),(64,1010,'B039','Myoglobin',NULL,11,'B',80.00,NULL,1,138,170,4,5,'N','2639-3','N'),(65,1010,'B040','Bence Jones proteins (screening)',NULL,11,'B',20.00,NULL,1,138,170,4,5,'N','95801-7','N'),(66,1010,'B041','Bence Jones proteins by electrophoresis',NULL,11,'B',100.00,NULL,1,138,170,4,5,'N','95801-7','N'),(67,1010,'B042','Total proteins',NULL,11,'B',15.00,NULL,1,138,170,4,5,'N','2885-2','N'),(68,1010,'B043','Semi-quantitative C-Reactive Protein (CRP: latex test)','CRP',11,'B',10.00,NULL,1,138,170,4,5,'N','1988-5','N'),(69,1010,'B044','Quantitative C-Reactive Protein by immunoassay',NULL,11,'B',80.00,NULL,1,138,170,4,5,'N','1988-5','N'),(70,1010,'B045','Quantitative C-Reactive Protein by spectrophotometry',NULL,11,'B',50.00,NULL,1,138,170,4,5,'N','1988-5','N'),(71,1010,'B046','Semi-quantitative Troponin by rapid test',NULL,11,'B',20.00,NULL,1,138,170,4,5,'N','','N'),(72,1010,'B047','Troponin by immunoassay',NULL,11,'B',80.00,NULL,1,138,170,4,5,'N','','N'),(73,1010,'B048','Blood gas (pH, pO2, pCO2, SaO2)','Blood gas',11,'B',80.00,NULL,9,138,170,4,5,'N','24338-6','N'),(74,1010,'B049','Amylase',NULL,11,'B',20.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','1798-8','N'),(75,1010,'B050','Creatine PhosphoKinase','CPK',11,'B',30.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','2157-6','N'),(76,1010,'B051','Creatine PhosphoKinase MB','CPK-MB',11,'B',30.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','32673-3','N'),(77,1010,'B052','5\Nucleotidase',NULL,11,'B',40.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','1690-7','N'),(78,1010,'B053','Gamma glutamyl transferase (Gamma GT)','GGT',11,'B',20.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','2324-2','N'),(79,1010,'B054','Glucose-6-Phosphate Dehydrogenase','G6PD',11,'B',60.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','','N'),(80,1010,'B055','Lactate Dehydrogenase (LDH)',NULL,11,'B',30.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','14804-9','N'),(81,1010,'B056','Alkaline Phosphatases (ALP)',NULL,11,'B',20.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','6768-6','N'),(82,1010,'B057','Acid Phosphatases',NULL,11,'B',20.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','6768-6','N'),(83,1010,'B058','Transaminases (AST)',NULL,11,'B',15.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','','N'),(84,1010,'B059','Transaminases (ALT)',NULL,11,'B',15.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','','N'),(85,1010,'B060','Transaminases (ALT/ALP AST/ASAT)',NULL,11,'B',25.00,'The report must mention the technique(s) used.',1,138,171,4,5,'N','','N'),(86,1010,'B061','Lipase',NULL,11,'B',40.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','3040-3','N'),(87,1010,'B062','Beta HCG assay',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','21198-7','N'),(88,1010,'B063','Cortisol',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','14675-3','N'),(89,1010,'B064','Erythropoietin',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','15061-5','N'),(90,1010,'B065','Estradiol',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','14715-7','N'),(91,1010,'B066','Ferritin',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','2276-4','N'),(92,1010,'B067','FSH',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','15067-2','N'),(93,1010,'B068','Insulin',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','14796-7','N'),(94,1010,'B069','Free insulin',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','14796-7','N'),(95,1010,'B070','LH',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','10501-5','N'),(96,1010,'B071','Progesterone',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','14890-8','N'),(97,1010,'B072','Prolactin',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','2842-3','N'),(98,1010,'B073','Thyroglobulin',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','3013-0','N'),(99,1010,'B074','Free Thyroxine (FT4)',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','','N'),(100,1010,'B075','Testosterone',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','14913-8','N'),(101,1010,'B077','Transferrin',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','3034-6','N'),(102,1010,'B078','Free Triiodothyronine (FT3)',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','','N'),(103,1010,'B079','Ultrasensitive TSH',NULL,11,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','','N'),(104,1010,'B080','TSH (Thyroid Stimulating Hormone)',NULL,19,'B',100.00,'The report must mention the technique(s) used.',1,138,170,4,5,'N','3016-3','N'),(105,1010,'B081','Acetone',NULL,12,'B',5.00,NULL,3,153,170,4,5,'N','','N'),(106,1010,'B082','Uric acid (uricosuria)',NULL,12,'B',15.00,NULL,3,153,170,4,5,'N','14934-4','N'),(107,1010,'B083','Urinary pH',NULL,12,'B',10.00,NULL,3,153,170,4,5,'N','','N'),(108,1010,'B084','Creatininuria',NULL,12,'B',15.00,NULL,3,153,170,4,5,'N','14637-3','N'),(109,1010,'B085','Bile pigments (screening)',NULL,12,'B',5.00,NULL,3,153,170,4,5,'N','','N'),(110,1010,'B086','Blood screening (red blood cells and/or hemoglobin)',NULL,12,'B',5.00,NULL,3,153,170,4,5,'N','','N'),(111,1010,'B087','Bile salts',NULL,12,'B',5.00,NULL,3,153,170,4,5,'N','','N'),(112,1010,'B088','Bile salts and pigments (screening)',NULL,12,'B',5.00,NULL,3,153,171,4,5,'N','','N'),(113,1010,'B089','Glucose Proteins (screening)',NULL,12,'B',5.00,NULL,3,153,171,4,5,'N','','N'),(114,1010,'B090','Glucose (screening)',NULL,12,'B',5.00,NULL,3,153,170,4,5,'N','53094-9','N'),(115,1010,'B091','Urea',NULL,12,'B',10.00,NULL,3,153,170,4,5,'N','22700-9','N'),(116,1010,'B092','Calcium',NULL,12,'B',15.00,NULL,3,153,170,4,5,'N','','N'),(117,1010,'B093','Chloride',NULL,12,'B',15.00,NULL,3,153,170,4,5,'N','2078-4','N'),(118,1010,'B094','Phosphates',NULL,12,'B',15.00,NULL,3,153,170,4,5,'N','13539-2','N'),(119,1010,'B095','Potassium',NULL,12,'B',20.00,NULL,3,153,170,4,5,'N','2828-2','N'),(120,1010,'B096','Sodium',NULL,12,'B',20.00,NULL,3,153,170,4,5,'N','24326-1','N'),(121,1010,'B097','Proteins (screening)',NULL,12,'B',5.00,NULL,3,153,170,4,5,'N','2885-2','N'),(122,1010,'B098','Urinary protein electrophoresis',NULL,12,'B',70.00,NULL,3,153,170,4,5,'N','34539-7','N'),(123,1010,'B099','Microalbumin (assay excluding dipsticks)',NULL,12,'B',60.00,NULL,3,153,170,4,5,'N','58447-4','N'),(124,1010,'B100','Proteinuria (24h)',NULL,12,'B',20.00,NULL,3,153,170,4,5,'N','2889-4','N'),(125,1010,'B102','Porphyrins (screening)',NULL,12,'B',5.00,NULL,3,153,170,4,5,'N','','N'),(126,1010,'B103','Porphyrins (screening, assay and identification)',NULL,12,'B',70.00,NULL,3,153,170,4,5,'N','','N'),(127,1010,'B104','Pregnancy test',NULL,12,'B',10.00,NULL,3,153,170,4,5,'N','19080-1','N'),(128,1010,'B105','Seminal Alpha-1,4-glucosidase',NULL,301,'B',200.00,NULL,22,152,170,4,5,'N','','N'),(129,1010,'B106','Seminal free carnitine',NULL,301,'B',200.00,NULL,22,152,170,4,5,'N','','N'),(130,1010,'B107','Seminal citrate',NULL,301,'B',150.00,NULL,22,152,170,4,5,'N','54231-6','N'),(131,1010,'B109','CSF protein electrophoresis',NULL,301,'B',60.00,NULL,5,99,170,4,5,'N','24352-7','N'),(132,1010,'B110','Seminal fructose',NULL,301,'B',60.00,NULL,22,152,170,4,5,'N','','N'),(133,1010,'B112','Total proteins (CSF)',NULL,301,'B',15.00,NULL,5,99,170,4,5,'N','2464-6','N'),(134,1010,'B113','Rivalta test',NULL,301,'B',5.00,NULL,5,102,170,4,5,'N','','N'),(135,1010,'B114','Uric acid clearance',NULL,12,'B',30.00,NULL,3,153,170,4,5,'N','','N'),(136,1010,'B115','Urea clearance',NULL,12,'B',30.00,NULL,3,153,170,4,5,'N','','N'),(137,1010,'B116','Creatinine clearance (renal)',NULL,12,'B',30.00,NULL,3,153,170,4,5,'N','34555-3','N'),(138,1010,'B117','Oral Glucose Tolerance Test (OGTT): 4 assays',NULL,301,'B',60.00,NULL,1,138,170,4,5,'N','','N'),(139,1010,'B118','Simplified OGTT: 2 assays',NULL,301,'B',30.00,NULL,1,138,170,4,5,'N','81324-6','N'),(140,1010,'B119','Insulin tolerance test: glucose assay',NULL,301,'B',60.00,NULL,1,138,170,4,5,'N','59179-2','N'),(141,1010,'B120','Glucagon tolerance test: glucose and insulin assay',NULL,301,'B',60.00,NULL,1,138,170,4,5,'N','','N'),(142,1010,'B121','LH-RH test: (4 time points): FSH and LH assay',NULL,301,'B',600.00,NULL,1,138,170,4,5,'N','','N'),(143,1010,'B122','HCG stimulation test: testosterone assay',NULL,301,'B',300.00,NULL,1,138,170,4,5,'N','','N'),(144,1010,'B123','HCG stimulation test: estradiol assay',NULL,301,'B',300.00,NULL,1,138,170,4,5,'N','','N'),(145,1010,'B124','Dexamethasone suppression test: cortisol assay',NULL,301,'B',300.00,NULL,1,138,170,4,5,'N','','N'),(146,1010,'B125','TRH test (4 time points): prolactin and TSH assay',NULL,301,'B',600.00,NULL,1,138,170,4,5,'N','','N'),(147,1010,'B126','Bone marrow aspirate',NULL,279,'B',100.00,NULL,20,38,170,4,5,'N','','N'),(148,1010,'B127','Malignant cell immunophenotyping',NULL,279,'B',150.00,NULL,19,104,170,4,5,'N','','N'),(149,1010,'B128','Hematocrit (level)',NULL,279,'B',10.00,NULL,1,138,170,4,5,'N','11153-4','N'),(150,1010,'B129','Hemoglobin (spectrophotometric assay)',NULL,279,'B',10.00,NULL,1,138,170,4,5,'N','','N'),(151,1010,'B130','Erythrocyte sedimentation rate (ESR)','ESR',279,'B',10.00,NULL,1,138,170,4,5,'N','30341-2','N'),(152,1010,'B131','Red blood cell resistance measurement',NULL,279,'B',50.00,NULL,1,138,170,4,5,'N','','N'),(153,1010,'B132','Bone marrow smear: cytological study',NULL,279,'B',100.00,NULL,19,104,170,4,5,'N','','N'),(154,1010,'B133','Bone marrow smear: cytochemical study (peroxidases, esterases, Perls and ALP)',NULL,279,'B',25.00,'Pricing per procedure.',19,104,170,4,5,'N','','N'),(155,1010,'B134','Complete Blood Count (CBC)','CBC',279,'B',35.00,'Includes: red blood cell count, white blood cell count, platelet count / hemoglobin assay, hematocrit measurement, erythrocyte indices determination and complete differential white blood cell count (automatic or manual), also includes blood smear control in case of abnormality.',1,138,170,4,5,'N','57022-6','N'),(156,1010,'B135','CBC with ESR','CBC + ESR',279,'B',40.00,NULL,1,138,171,4,5,'N','57022-6','N'),(157,1010,'B136','CD4, CD8 lymphocyte count',NULL,279,'B',50.00,NULL,1,138,170,4,5,'N','65759-3','N'),(158,1010,'B137','White blood cell count (manual method)',NULL,279,'B',10.00,NULL,1,138,170,4,5,'N','57022-6','N'),(159,1010,'B138','Reticulocyte count (manual method)',NULL,279,'B',40.00,NULL,1,138,170,4,5,'N','50262-5','N'),(160,1010,'B139','Platelet count',NULL,279,'B',25.00,NULL,1,138,170,4,5,'N','53800-9','N'),(161,1010,'B140','Red blood cell morphological abnormalities screening',NULL,279,'B',20.00,NULL,1,138,170,4,5,'N','57022-6','N'),(162,1010,'B141','Fetal hemoglobin screening',NULL,279,'B',30.00,NULL,1,138,170,4,5,'N','','N'),(163,1010,'B142','Heinz bodies screening',NULL,279,'B',20.00,NULL,1,138,170,4,5,'N','','N'),(164,1010,'B143','Red blood cell sickling test = Emmel test',NULL,279,'B',10.00,NULL,1,138,170,4,5,'N','','N'),(165,1010,'B144','Eosinophilic polymorphonuclear cells screening in nasal mucus',NULL,279,'B',15.00,NULL,9,75,170,4,5,'N','88836-2','N'),(166,1010,'B145','Eosinophilic polymorphonuclear cells screening in sputum',NULL,279,'B',15.00,NULL,6,50,170,4,5,'N','88836-2','N'),(167,1010,'B146','D-Dimers by latex particle agglutination technique',NULL,279,'B',50.00,NULL,1,138,170,4,5,'N','55398-2','N'),(168,1010,'B147','D-Dimers by ELISA technique',NULL,279,'B',100.00,NULL,1,138,170,4,5,'N','55398-2','N'),(169,1010,'B148','Fibrinogen assay (specify technique on report)',NULL,279,'B',30.00,NULL,1,138,170,4,5,'N','3255-7','N'),(170,1010,'B149','Coagulation factor assay',NULL,279,'B',30.00,'Pricing per factor.',1,138,170,4,5,'N','','N'),(171,1010,'B150','D-Dimers assay: (specify technique on report)',NULL,279,'B',120.00,NULL,1,138,170,4,5,'N','55398-2','N'),(172,1010,'B151','Heparinemia',NULL,279,'B',100.00,NULL,1,138,170,4,5,'N','3270-6','N'),(173,1010,'B152','Prothrombin rate + INR (Quick time)','PT',279,'B',30.00,NULL,1,138,170,4,5,'N','34528-0','N'),(174,1010,'B153','Bleeding time (Ivy 3-point test)',NULL,279,'B',15.00,NULL,23,NULL,170,4,5,'N','','N'),(175,1010,'B154','Activated Cephalin Time (ACT / APTT)',NULL,279,'B',30.00,NULL,1,138,170,4,5,'N','50197-3','N'),(176,1010,'B155','Thrombin Time (TT)',NULL,279,'B',30.00,NULL,1,138,170,4,5,'N','','N'),(177,1010,'B156','Fibrin/Fibrinogen Degradation Products (FDP) titration',NULL,279,'B',60.00,NULL,1,138,170,4,5,'N','','N'),(178,1010,'B157','ABO blood group and standard Rh (D) determination',NULL,279,'B',35.00,'With two tests (cell and serum) performed by two different technicians using two different reagent lots.',1,138,170,4,5,'N','93923-1','N'),(179,1010,'B158','Rh and Kell phenotyping',NULL,279,'B',60.00,NULL,1,138,170,4,5,'N','93951-2','N'),(180,1010,'B159','Other erythrocyte antigens',NULL,279,'B',15.00,'Pricing per procedure.',1,138,170,4,5,'N','','N'),(181,1010,'B160','Irregular Antibody Screening (IAS) using a panel of at least 11 test red blood cells',NULL,279,'B',200.00,NULL,1,138,170,4,5,'N','79160-8','N'),(182,1010,'B161','Direct Coombs test',NULL,279,'B',40.00,NULL,1,138,170,4,5,'N','','N'),(183,1010,'B162','Indirect Coombs test',NULL,279,'B',40.00,NULL,1,138,170,4,5,'N','','N'),(184,1010,'B163','Crossmatch test',NULL,279,'B',20.00,NULL,1,138,170,4,5,'N','','N'),(185,1010,'B164','Rheumatoid factor (latex test)',NULL,1003,'B',40.00,NULL,1,138,170,4,5,'N','46437-0','N'),(186,1010,'B165','Antistreptolysin O','ASLO',302,'B',30.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','58713-9','N'),(187,1010,'B166','Antistreptokinase','ASK',302,'B',30.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','','N'),(188,1010,'B167','Borrelia (IFA or EIA)',NULL,302,'B',60.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','98205-8','N'),(189,1010,'B168','Brucella (IFA or EIA)',NULL,302,'B',80.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','19053-8','N'),(190,1010,'B169','Chlamydia trachomatis (IgG and IgM and/or IgA)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','100120-5','N'),(191,1010,'B170','Chlamydia trachomatis by PCR',NULL,24,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',7,162,170,4,5,'N','80363-5','N'),(193,1010,'B172','Helicobacter pylori (EIA)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','100113-0','N'),(194,1010,'B173','Genital Mycoplasma by EIA',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','','N'),(195,1010,'B174','Mycoplasma pneumoniae (IgG by EIA)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','58733-7','N'),(196,1010,'B175','Salmonella (Widal serodiagnosis, agglutination)',NULL,302,'B',40.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','98211-6','N'),(197,1010,'B176','RPR / VDRL qualitative (Syphilis)',NULL,302,'B',10.00,'In case of positive reaction to RPR and TPHA, titration must be performed. - Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','98212-4','N'),(198,1010,'B177','TPHA (Syphilis)',NULL,302,'B',20.00,'In case of positive reaction to RPR and TPHA, titration must be performed. - Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','98212-4','N'),(199,1010,'B178','FTA-ABS IgG (Syphilis)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','','N'),(200,1010,'B179','IgM screening (Syphilis)',NULL,302,'B',60.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','98212-4','N'),(201,1010,'B180','Direct chlamydia screening by immunological technique',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','','N'),(202,1010,'B181','Bacterial toxin screening by immunological technique',NULL,302,'B',80.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','44038-8','N'),(203,1010,'B182','Aspergillosis (screening)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','44357-2','N'),(204,1010,'B183','Candidiasis (serological screening using at least two techniques)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','56156-3','N'),(205,1010,'B184','Cryptococcosis (soluble Cryptococcus neoformans antigen screening)',NULL,302,'B',60.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',5,99,170,4,5,'N','100128-8','N'),(206,1010,'B185','Cysticercosis screening (EIA or IFA)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','25389-8','N'),(207,1010,'B186','Cysticercosis confirmation test (IE)',NULL,302,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','100088-4','N'),(208,1010,'B187','Filariasis screening (EIA or IFA)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','100105-6','N'),(209,1010,'B188','Filariasis confirmation test by IE',NULL,302,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','','N'),(210,1010,'B189','Visceral leishmaniasis screening (EIA or IFA)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','5238-1','N'),(211,1010,'B190','Visceral leishmaniasis confirmation test by IE',NULL,302,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','','N'),(212,1010,'B191','Malaria (rapid serological test)',NULL,302,'B',25.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','70569-9','N'),(213,1010,'B504','IgG detection (Toxoplasmosis)',NULL,302,'B',NULL,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','88746-3','N'),(214,1010,'B193','IgA detection and titration (Toxoplasmosis)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold.',1,138,170,4,5,'N','','N'),(215,1010,'B194','HBsAg screening (Hepatitis B by rapid test)',NULL,302,'B',40.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95148-3','N'),(216,1010,'B195','Anti-HBs antibody screening (Hepatitis B by rapid test)',NULL,302,'B',40.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95149-1','N'),(217,1010,'B196','HBeAg screening (Hepatitis B by rapid test)',NULL,302,'B',40.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95148-3','N'),(218,1010,'B197','Anti-HBc antibody screening (Hepatitis B by rapid test)',NULL,302,'B',40.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95149-1','N'),(219,1010,'B505','HBsAg screening (Hepatitis B by automated immunoanalyzer)',NULL,302,'B',NULL,NULL,1,138,170,4,5,'N','95148-3','N'),(220,1010,'B198','Anti-HBs antibody screening (Hepatitis B by automated immunoanalyzer)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95149-1','N'),(221,1010,'B199','HBeAg screening (Hepatitis B by automated immunoanalyzer)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95148-3','N'),(222,1010,'B200','Anti-HBc antibody screening (Hepatitis B by automated immunoanalyzer)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95149-1','N'),(223,1010,'B201','Anti-HBc IgM screening (Hepatitis B by automated immunoanalyzer)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95146-7','N'),(224,1010,'B202','Hepatitis B neutralization test',NULL,302,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','','N'),(225,1010,'B203','Hepatitis B DNA by PCR',NULL,19,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95147-5','N'),(226,1010,'B204','Hepatitis C (by rapid test)',NULL,302,'B',60.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95206-9','N'),(227,1010,'B205','Anti-HCV antibody screening (by automated immunoanalyzer)',NULL,302,'B',40.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95206-9','N'),(228,1010,'B208','Hepatitis C confirmation test',NULL,302,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','75887-0','N'),(229,1010,'B209','Hepatitis C RNA by PCR',NULL,19,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','50023-1','N'),(230,1010,'B210','Anti-HIV antibody screening (rapid test)',NULL,302,'B',30.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95206-9','N'),(231,1010,'B211','Anti-HIV antibody screening (by automated immunoanalyzer)',NULL,302,'B',100.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','95206-9','N'),(232,1010,'B212','P24 antigen screening and titration',NULL,302,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','53601-1','N'),(233,1010,'B213','HIV diagnosis (Western Blot) (confirmation test)',NULL,302,'B',200.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','97860-1','N'),(234,1010,'B214','HIV-1 RNA viral load measurement',NULL,302,'B',300.00,'The report must specify the reagent used, the technique threshold value and the number of copies or equivalent copies per ml of plasma. - Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','','N'),(235,1010,'B216','Herpes simplex virus type 1 (IgG or IgM)',NULL,302,'B',150.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','90229-6','N'),(236,1010,'B217','Herpes simplex virus type II (IgG or IgM)',NULL,302,'B',150.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','','N'),(237,1010,'B218','Rotavirus and Adenovirus',NULL,302,'B',50.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',4,141,170,4,5,'N','88847-9','N'),(239,1010,'B220','Rubella (IgG and IgM)',NULL,302,'B',150.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','34952-2','N'),(240,1010,'B221','Respiratory Syncytial Virus (IgM/IgG)',NULL,302,'B',150.00,'Antibody screening and possible titration, specify the technique(s) used with their sensitivity threshold. A confirmation technique is required when screening tests are positive or discordant. Only one confirmation technique may be charged.',1,138,170,4,5,'N','72885-7','N'),(241,1010,'B222','Total immunoglobulins (IgE) assay',NULL,302,'B',150.00,NULL,1,138,170,4,5,'N','19113-0','N'),(242,1010,'B224','Individual specific IgE identification: Single allergen',NULL,302,'B',100.00,NULL,1,138,170,4,5,'N','','N'),(243,1010,'B225','Individual specific IgE identification: Two or three allergens',NULL,302,'B',200.00,NULL,1,138,170,4,5,'N','','N'),(244,1010,'B226','IgG assay in blood, CSF',NULL,302,'B',100.00,NULL,1,138,170,4,5,'N','','N'),(245,1010,'B227','IgM assay in blood, CSF',NULL,302,'B',100.00,NULL,1,138,170,4,5,'N','','N'),(246,1010,'B228','IgA assay in blood, CSF',NULL,302,'B',100.00,NULL,1,138,170,4,5,'N','','N'),(247,1010,'B229','Alpha-fetoprotein screening and titration (in serum or amniotic fluid)',NULL,302,'B',150.00,NULL,1,138,170,4,5,'N','59564-5','N'),(248,1010,'B230','Carcinoembryonic Antigen (CEA) screening and titration',NULL,302,'B',150.00,NULL,1,138,170,4,5,'N','2039-6','N'),(249,1010,'B231','Prostate Specific Antigen (PSA) screening and titration',NULL,302,'B',100.00,NULL,1,138,170,4,5,'N','2857-1','N'),(250,1010,'B232','Free Prostate Specific Antigen (free PSA) screening and titration',NULL,302,'B',100.00,NULL,1,138,170,4,5,'N','53764-7','N'),(251,1010,'B233','Beta-2 microglobulin screening and titration (in serum or urine)',NULL,302,'B',150.00,NULL,1,138,170,4,5,'N','1952-1','N'),(252,1010,'B235','Parasitological examination of stool',NULL,15,'B',15.00,NULL,4,141,170,4,5,'N','10704-5','N'),(253,1010,'B236','Cryptosporidium screening by selective staining',NULL,15,'B',30.00,NULL,4,141,170,4,5,'N','','N'),(254,1010,'B237','Cryptosporidium screening by immunofluorescence',NULL,15,'B',60.00,NULL,4,141,170,4,5,'N','','N'),(255,1010,'B238','Microsporidia screening in stool by selective staining',NULL,15,'B',100.00,NULL,4,141,170,4,5,'N','32819-5','N'),(256,1010,'B239','Pneumocystis carinii screening in bronchoalveolar fluid',NULL,16,'B',100.00,NULL,21,56,170,4,5,'N','','N'),(257,1010,'B240','Plasmodium screening (thick smear and thin smear)',NULL,15,'B',10.00,NULL,1,138,170,4,5,'N','','N'),(258,1010,'B241','Blood microfilariae screening (thin smear)',NULL,15,'B',10.00,'Per collection.',1,138,170,4,5,'N','','N'),(259,1010,'B242','Microfilariae screening in skin biopsy (SNIP)',NULL,15,'B',10.00,NULL,23,38,170,4,5,'N','40745-2','N'),(260,1010,'B243','Yeast screening in CSF',NULL,16,'B',10.00,NULL,5,99,170,4,5,'N','88842-0','N'),(261,1010,'B244','Leishmania screening in cutaneous fluid',NULL,15,'B',15.00,NULL,23,NULL,170,4,5,'N','5238-1','N'),(262,1010,'B245','Trypanosome screening in blood',NULL,15,'B',10.00,NULL,1,138,170,4,5,'N','34383-0','N'),(263,1010,'B246','Fungal screening in skin and skin appendage samples',NULL,16,'B',15.00,NULL,18,163,170,4,5,'N','','N'),(264,1010,'B247','Yeast culture',NULL,16,'B',80.00,NULL,15,75,170,4,5,'N','','N'),(265,1010,'B248','Urinary sediment: direct examination (fresh state, cytology, staining)',NULL,18,'B',15.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',3,153,170,4,5,'N','58433-4','N'),(266,1010,'B249','Urine cytobacteriological examination (urine culture)','UCBE',18,'B',80.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',3,153,170,4,5,'N','88848-7','N'),(267,1010,'B250','Direct examination of vaginal/cervico-vaginal sample',NULL,18,'B',15.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',7,162,170,4,5,'N','','N'),(268,1010,'B251','Cytobacteriological examination of vaginal/cervico-vaginal sample',NULL,18,'B',80.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',7,162,170,4,5,'N','88849-5','N'),(269,1010,'B252','Direct examination of urethral sample',NULL,18,'B',15.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',8,152,170,4,5,'N','','N'),(270,1010,'B253','Cytobacteriological examination of urethral sample',NULL,18,'B',80.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',8,152,170,4,5,'N','88840-4','N'),(271,1010,'B254','Cytobacteriological examination of semen (semen culture)',NULL,18,'B',80.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',22,152,170,4,5,'N','88838-8','N'),(272,1010,'B255','Direct examination of CSF',NULL,18,'B',15.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',5,99,170,4,5,'N','88848-7','N'),(273,1010,'B256','Cytobacteriological examination of CSF',NULL,18,'B',80.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',5,99,170,4,5,'N','88841-2','N'),(274,1010,'B257','Blood culture',NULL,18,'B',100.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',1,138,170,4,5,'N','88850-3','N'),(275,1010,'B258','Cytobacteriological examination of stool (stool culture)',NULL,18,'B',80.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',4,141,170,4,5,'N','88847-9','N'),(276,1010,'B259','Cytobacteriological examination of effusion or aspiration fluids',NULL,18,'B',80.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',5,NULL,170,4,5,'N','88841-2','N'),(277,1010,'B260','Direct examination of effusion or aspiration fluids',NULL,18,'B',20.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',5,NULL,170,4,5,'N','','N'),(278,1010,'B261','Cytological examination of aspiration fluids (cell count and differential)',NULL,18,'B',30.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',5,NULL,170,4,5,'N','88847-9','N'),(279,1010,'B262','Campylobacter screening and identification',NULL,18,'B',150.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',4,141,170,4,5,'N','88847-9','N'),(280,1010,'B263','Anaerobic germ screening and identification',NULL,18,'B',150.00,'Culture includes: direct microscopic examination, isolation with possible complete identification of germ(s) and antibiogram.',NULL,NULL,170,4,5,'N','','N'),(281,1010,'B264','Spermiogram and spermocytogram:',NULL,304,'B',100.00,'Including volume measurement of ejaculate, pH, viscosity estimation, sperm motility assessment at 30 min, 2h, 4h post-ejaculation, sperm count, round cell screening, spontaneous agglutination screening, abnormal form count detailing head, midpiece and flagellum abnormalities mentioning the multiple anomaly index.',22,152,170,4,5,'N','54231-6','N'),(282,1010,'B265','Post-coital test (Huhner test)',NULL,304,'B',60.00,'The report will include cycle day, time elapsed after intercourse, mucus quality (abundance, elasticity and transparency), number and motility of spermatozoa per field.',7,162,170,4,5,'N','','N'),(283,1010,'B266','Retrograde ejaculation screening in case of severe hypospermia or anejaculation',NULL,304,'B',50.00,NULL,22,152,170,4,5,'N','','N'),(284,1010,'B267','Spermatozoa staining with aniline blue',NULL,304,'B',50.00,NULL,22,152,170,4,5,'N','','N'),(285,1010,'B268','Antisperm immunization screening',NULL,19,'B',120.00,NULL,NULL,NULL,170,4,5,'N','','N'),(286,1010,'B269','Salicylic acid (assay)',NULL,303,'B',100.00,NULL,1,163,170,4,5,'N','4024-6','N'),(287,1010,'B270','Alcohol (ethanol or methanol)',NULL,303,'B',50.00,NULL,1,163,170,4,5,'N','5643-2','N'),(288,1010,'B271','Amphetamine (assay)',NULL,303,'B',150.00,NULL,1,163,170,4,5,'N','','N'),(289,1010,'B272','Aluminum',NULL,303,'B',60.00,NULL,1,163,170,4,5,'N','14593-8','N'),(290,1010,'B273','Tricyclic antidepressants (screening)',NULL,303,'B',150.00,NULL,1,163,170,4,5,'N','80148-0','N'),(291,1010,'B274','Barbiturates (screening)',NULL,303,'B',150.00,NULL,1,163,170,4,5,'N','19270-8','N'),(292,1010,'B275','Barbiturates (assay)',NULL,303,'B',200.00,NULL,1,163,170,4,5,'N','19270-8','N'),(293,1010,'B276','Benzodiazepines (screening)',NULL,303,'B',150.00,NULL,1,163,170,4,5,'N','','N'),(294,1010,'B277','Diazepam and its metabolite (assay)',NULL,303,'B',100.00,NULL,1,163,170,4,5,'N','','N'),(295,1010,'B278','Digoxin (assay)',NULL,303,'B',200.00,NULL,1,163,170,4,5,'N','10535-3','N'),(296,1010,'B279','Isoniazid (INH)',NULL,303,'B',150.00,NULL,1,163,170,4,5,'N','3697-0','N'),(297,1010,'B280','Antiretroviral plasma concentration measurement',NULL,303,'B',200.00,NULL,1,163,170,4,5,'N','','N'),(298,1010,'B281','Carbon monoxide',NULL,303,'B',50.00,NULL,1,163,170,4,5,'N','','N'),(299,1010,'B282','Paracetamol (assay)',NULL,303,'B',100.00,NULL,1,163,170,4,5,'N','3298-7','N'),(300,1010,'B283','Lead by Atomic Absorption Spectrophotometry',NULL,303,'B',60.00,NULL,1,163,170,4,5,'N','17052-2','N'),(301,1010,'B284','Quinidine (assay)',NULL,303,'B',200.00,NULL,1,163,170,4,5,'N','6694-4','N'),(302,1010,'B285','Rifampicin',NULL,303,'B',150.00,NULL,1,163,170,4,5,'N','4021-2','N'),(303,1010,'B286','Theophylline',NULL,303,'B',150.00,NULL,1,163,170,4,5,'N','4049-3','N'),(304,1010,'B287','Arsenic',NULL,303,'B',50.00,NULL,18,163,170,4,5,'N','16403-8','N'),(305,1010,'B024','Total HDL cholesterol (Atherogenic index)',NULL,11,'B',40.00,NULL,1,138,171,4,5,'N','24331-1','N'),(306,1010,'B506','Fusidic acid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(307,1010,'B507','Nalidixic acid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(308,1010,'B508','Oxolinic acid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(309,1010,'B509','Pipemidic acid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(310,1010,'B510','Piromidic acid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(311,1010,'B511','Amikacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','35669-1','N'),(312,1010,'B512','Amoxicillin',NULL,1018,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3344-9','N'),(313,1010,'B513','Amoxicillin/clavulanic acid',NULL,1018,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','16365-9','N'),(314,1010,'B514','Ampicillin',NULL,1018,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(315,1010,'B515','Ampicillin/sulbactam',NULL,1018,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(316,1010,'B516','Azithromycin',NULL,1018,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(317,1010,'B517','Aztreonam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(318,1010,'B518','Bacitracin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(319,1010,'B519','Cefaclor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(320,1010,'B520','Cefadroxil',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(321,1010,'B521','Cephalexin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(322,1010,'B522','Cephalothin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(323,1010,'B523','Cefamandole',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(324,1010,'B524','Cefatrizine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(325,1010,'B525','Cefazolin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3443-9','N'),(326,1010,'B526','Cefepime',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(327,1010,'B527','Cefixime',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','16567-0','N'),(328,1010,'B528','Cefoperazone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(329,1010,'B529','Cefotaxime',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(330,1010,'B530','Cefotetan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(331,1010,'B531','Cefotiam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(332,1010,'B532','Cefotiam-hexetil',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(333,1010,'B533','Cefoxitin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(334,1010,'B534','Cefpirome',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(335,1010,'B535','Cefpodoxime-proxetil',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(336,1010,'B536','Cefradine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(337,1010,'B537','Cefsulodin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(338,1010,'B538','Ceftazidime',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(339,1010,'B539','Ceftizoxime',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(340,1010,'B540','Ceftriaxone',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(341,1010,'B541','Cefuroxime',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','80608-3','N'),(342,1010,'B542','Cefuroxime-axetil',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(343,1010,'B543','Chloramphenicol',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(344,1010,'B544','Ciprofloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3484-3','N'),(345,1010,'B545','Clindamycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3486-8','N'),(346,1010,'B546','Colistin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','16645-4','N'),(347,1010,'B547','Cotrimoxazole',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(348,1010,'B548','Dirithromycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(349,1010,'B549','Doripenem (H)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(350,1010,'B550','Doxycycline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(351,1010,'B551','Enoxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(352,1010,'B552','Ertapenem',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(353,1010,'B553','Erythromycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(354,1010,'B554','Flumequine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(355,1010,'B555','Fosfomycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(356,1010,'B556','Gentamicin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','35668-3','N'),(357,1010,'B557','Imipenem',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','17010-0','N'),(358,1010,'B558','Isepamicin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(359,1010,'B559','Kanamycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','47395-9','N'),(360,1010,'B560','Latamoxef',NULL,1018,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(361,1010,'B561','Levofloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(362,1010,'B562','Lincomycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(363,1010,'B563','Linezolid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(364,1010,'B564','Lomefloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(365,1010,'B565','Loracarbef',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(366,1010,'B566','Meropenem',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(367,1010,'B567','Metronidazole',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(368,1010,'B568','Minocycline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(369,1010,'B569','Moxifloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(370,1010,'B570','Mupirocin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(371,1010,'B571','Netilmicin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','47385-0','N'),(372,1010,'B572','Nitroxoline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(373,1010,'B573','Norfloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(374,1010,'B574','Ofloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3877-8','N'),(375,1010,'B575','Optochin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(376,1010,'B576','Oxacillin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3882-8','N'),(377,1010,'B577','Oxytetracycline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(378,1010,'B578','Pefloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3906-5','N'),(379,1010,'B579','Penicillin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3911-5','N'),(380,1010,'B580','Piperacillin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3972-7','N'),(381,1010,'B581','Piperacillin/tazobactam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3972-7','N'),(382,1010,'B582','Pristinamycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(383,1010,'B583','Quinupristin-dalfopristin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(384,1010,'B584','Rifampicin',NULL,1018,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','4021-2','N'),(385,1010,'B585','Sparfloxacin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(386,1010,'B586','Spectinomycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(387,1010,'B588','Spiramycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(388,1010,'B589','Streptomycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(389,1010,'B590','Sulbactam',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(390,1010,'B591','Teicoplanin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','34378-0','N'),(391,1010,'B592','Telithromycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(392,1010,'B593','Tetracycline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(393,1010,'B594','Ticarcillin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','4054-3','N'),(394,1010,'B595','Ticarcillin/clavulanic acid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','4055-0','N'),(395,1010,'B596','Tigecycline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(396,1010,'B597','Tobramycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','35670-9','N'),(397,1010,'B598','Trimethoprim',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','18258-4','N'),(398,1010,'B599','Trimethoprim/sulfamethoxazole',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(399,1010,'B600','Vancomycin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','20578-1','N'),(400,1010,'B601','Antibiogram','Antibiogram',18,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','29576-6','N'),(401,1010,'B602','Cytobacteriological examination of sputum (Ziehl-Neelsen)',NULL,18,'B',NULL,NULL,6,50,170,4,5,'N','88837-0','N'),(403,1010,'B604','Parasitological examination of urine',NULL,15,'B',15.00,NULL,3,153,170,4,5,'N','','N'),(404,1010,'B605','Isoniazid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','','N'),(405,1010,'B606','Ethambutol',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','3607-9','N'),(406,1010,'B607','Pyrazinamide',NULL,NULL,NULL,NULL,NULL,NULL,NULL,170,4,5,'N','11001-5','N'),(407,1010,'B608','Yellow fever',NULL,11,'B',NULL,NULL,1,138,170,4,5,'N','97868-4','N'),(408,1010,'B609','Measles',NULL,11,'B',NULL,NULL,1,138,170,4,5,'N','90253-6','N'),(410,1010,'B611','Toxoplasmosis',NULL,11,'B',NULL,NULL,1,138,170,4,5,'N','88746-3','N'),(411,1010,'B612','Poliomyelitis (DPV)','DPV',12,'B',NULL,NULL,3,153,170,4,5,'N','','N'),(412,1010,'B614','Schistosomiasis (urine)',NULL,15,'B',NULL,NULL,3,153,170,4,5,'N','','N'),(413,1010,'B616','Filariasis',NULL,11,'B',NULL,NULL,1,138,170,4,5,'N','40745-2','N'),(414,1010,'B617','Cholera',NULL,18,'B',NULL,NULL,4,141,170,4,5,'N','88847-9','N'),(415,1010,'B615','Schistosomiasis (stool)',NULL,15,'B',NULL,NULL,4,141,170,4,5,'N','10704-5','N'),(416,1010,'B700','Potassium by flame photometry',NULL,11,'B',20.00,NULL,NULL,138,NULL,4,5,'N','2823-3','N'),(417,1010,'B702','Cryptococcus neoformans screening',NULL,16,'B',NULL,NULL,NULL,99,NULL,4,5,'N','','N'),(418,1010,'B703','Trypanosome screening in CSF',NULL,15,'B',NULL,NULL,5,99,NULL,4,5,'N','','N'),(419,1010,'B705','Enterobacteriaceae antibiogram',NULL,18,'B',NULL,NULL,23,NULL,NULL,4,5,'N','','N'),(420,1010,'B750','Postprandial glucose','PP',11,'B',10.00,NULL,1,138,NULL,4,5,'N','81324-6','N'),(421,1010,'B751','CSF glucose',NULL,13,'B',NULL,NULL,5,99,NULL,4,5,'N','14744-7','N'),(422,1010,'B752','Urine dipstick',NULL,12,'B',NULL,NULL,3,153,NULL,4,5,'N','24357-6','N'),(423,1010,'B756','Rheumatoid factor (Waaler-Rose)',NULL,302,'B',NULL,NULL,1,138,NULL,4,5,'N','46437-0','N'),(424,1010,'PB24','Genital swab',NULL,NULL,'PB',0.00,NULL,NULL,NULL,NULL,4,5,'N','88849-5','N'),(425,1010,'GX','Genexpert MTBRIf','GX TUB',23,'B',50.00,NULL,6,50,NULL,4,5,'N','','N'),(426,1010,'BEB','Bacteriological examination of drinking water','Drinking water bacteriology',24,'B',40.00,NULL,NULL,1014,NULL,4,5,'N','','N'),(427,1010,'CLMB','Liquid culture of mycobacteria','Mycobacteria liquid culture',18,'B',NULL,NULL,NULL,50,NULL,4,5,'N','','N'),(428,1010,'ABCL','First-line antibiogram of mycobacteria in liquid medium','First-line mycobacteria ATB in liquid',18,'B',NULL,NULL,NULL,163,NULL,4,5,'N','','N'),(429,1010,'LPA','First-line tuberculosis Line Probe Assay','LPA',23,'B',NULL,NULL,NULL,50,NULL,4,5,'N','','N'),(430,1010,'NFR','CBC with reticulocytes','CBC + retic',1001,'B',21.00,NULL,1,138,NULL,4,5,'N','','N'),(431,1010,'TBMI','Tuberculosis ZN microscopy','TB ZN microscopy',18,'B',NULL,NULL,NULL,50,NULL,4,5,'N','','N'),(432,1010,'B757','Complete Blood Count ','CBC newborn',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(433,1010,'B758','Complete Blood Count ','CBC 1 week',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(434,1010,'B759','Complete Blood Count ','CBC - 1 month',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(435,1010,'B760','Complete Blood Count ','CBC - 2 months',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(436,1010,'B761','Complete Blood Count ','CBC - 3 months',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(437,1010,'B762','Complete Blood Count ','CBC - 6 months',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(438,1010,'B763','Complete Blood Count','CBC - 1 year',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(439,1010,'B764','Complete Blood Count','CBC - 3 years',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(440,1010,'B765','Complete Blood Count','CBC - 3 - 6 years',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(441,1010,'B766','Complete Blood Count','CBC - 7 to 10 years',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(442,1010,'B767','Complete Blood Count','CBC - Women',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(443,1010,'B768','Complete Blood Count','CBC - Men',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(444,1010,'B769','Streptococcus sp. antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(445,1010,'B770','Haemophilus influenzae antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(446,1010,'B771','Neisseria meningitidis antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(447,1010,'B772','Neisseria gonorrhoeae antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(448,1010,'B773','Enterococcus sp. antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(449,1010,'B774','Pneumococcus antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(450,1010,'B775','Non-fermenting Gram-negative bacilli antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(451,1010,'B776','Staphylococcus sp. antibiogram',NULL,18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(452,1010,'B777','Proteins in aspiration fluid',NULL,13,'B',NULL,NULL,NULL,35,NULL,4,5,'N','2885-2','N'),(453,1010,'B778','Cytobacteriological examination of ear swab','Cytobacteriology ear swab',18,'B',NULL,NULL,NULL,163,NULL,4,5,'N','88836-2','N'),(454,1010,'B779','Cytobacteriological examination of ocular swab','Cytobacteriology ocular swab',18,'B',NULL,NULL,NULL,163,NULL,4,5,'N','88864-4','N'),(455,1010,'B780','Cytobacteriological examination of throat swab','Cytobacteriology throat swab',18,'B',NULL,NULL,NULL,75,NULL,4,5,'N','88836-2','N'),(456,1010,'781','Syphilis screening ',NULL,1003,'B',NULL,NULL,NULL,138,NULL,4,5,'N','','N'),(457,1010,'B781','Syphilis screening ','Syphilis SD Bioline',1003,'B',NULL,NULL,NULL,138,NULL,4,5,'N','98212-4','N'),(458,1010,'B782','Cytobacteriological examination of sputum','Sputum cytobacteriology',18,'B',NULL,NULL,NULL,50,NULL,4,5,'N','88837-0','N'),(459,1010,'b783','Schistocyte screening ','Schistocyte screening',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(460,1010,'B784','Abnormal cell screening','Abnormal cells',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(461,1010,'B785','White blood cell differential','WBC differential',1001,'B',NULL,NULL,NULL,138,NULL,4,5,'N','57022-6','N'),(462,1010,'B786','Cytobacteriological examination of pus','Pus cytobacteriology',18,'B',NULL,NULL,NULL,163,NULL,4,5,'N','88839-6','N'),(463,1010,'B787','Cytobacteriological examination of drainage fluid','Drainage fluid cytobacteriology',18,'B',NULL,NULL,NULL,163,NULL,4,5,'N','88839-6','N'),(464,1010,'B788','Bacteriological examination of tracheal aspirate','Tracheal aspirate bacteriology',18,'B',NULL,NULL,NULL,163,NULL,4,5,'N','88837-0','N'),(465,1010,'B789','Bacteriological examination of bronchoalveolar lavage fluid','BAL bacteriology',18,'B',NULL,NULL,NULL,102,NULL,4,5,'N','88844-6','N'),(466,1010,'B790','Bacteriological examination of material','Material bacteriology',NULL,'B',NULL,NULL,NULL,163,NULL,4,5,'N','88845-3','N'),(467,1010,'B791','Bacteriological examination of materials','Materials bacteriology',18,'B',NULL,NULL,NULL,163,NULL,4,5,'N','','N'),(468,1010,'B793','Enterobacteriaceae antibiogram','Enterobacteriaceae ATB',18,'B',NULL,NULL,NULL,NULL,NULL,4,5,'N','','N'),(469,1000,'B650','Meningococci antibiogram [DISK]','Meningococci ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(470,1000,'B651','Staphylococcus aureus antibiogram [DISK]','S. aureus ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(471,1000,'B652','Pneumococci antibiogram [DISK]','Pneumococci ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(472,1000,'B653','Haemophilus influenzae antibiogram [DISK]','H. influenzae ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(473,1000,'B654','Pseudomonas antibiogram [DISK]','Pseudomonas ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(474,1000,'B655','Acinetobacter antibiogram [DISK]','Acinetobacter ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(475,1000,'B656','Escherichia coli antibiogram [DISK]','E. coli ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(476,1000,'B657','Salmonella spp. antibiogram [DISK]','Salmonella spp. ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(477,1000,'B658','Shigella spp. antibiogram [DISK]','Shigella spp. ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(478,1000,'B670','Meningococci antibiogram [MIC]','Meningococci ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(479,1000,'B671','Staphylococcus aureus antibiogram [MIC]','S. aureus ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(480,1000,'B672','Pneumococci antibiogram [MIC]','Pneumococci ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(481,1000,'B673','Haemophilus influenzae antibiogram [MIC]','H. influenzae ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(482,1000,'B674','Pseudomonas antibiogram [MIC]','Pseudomonas ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(483,1000,'B675','Acinetobacter antibiogram [MIC]','Acinetobacter ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(484,1000,'B676','Escherichia coli antibiogram [MIC]','E. coli ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(485,1000,'B677','Salmonella spp. antibiogram [MIC]','Salmonella spp. ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(486,1000,'B678','Shigella spp. antibiogram [MIC]','Shigella spp. ATB',18,'B',NULL,'[WHONET]',NULL,NULL,NULL,4,4,'Y','','N'),(487,1000,'B5271a','Quantitative detection of SARS-CoV-2 virus genome by RT-PCR','SARS-CoV-2 RT-PCR',23,'B',160.00,'Detection of SARS-CoV-2 genome by RT-PCR, the primers used for this test target the ... and ... genes of the SARS-CoV-2 genome.',13,163,170,4,5,'N','94503-0','N'),(488,1000,'B5271b','Qualitative detection of SARS-CoV-2 virus genome by RT-LAMP','SARS-CoV-2 RT-LAMP',23,'B',160.00,'Detection of SARS-CoV-2 genome by RT-LAMP, the primers used for this test target the ... and ... genes of the SARS-CoV-2 genome.',13,163,170,4,5,'N','94531-1','N'),(489,1000,'B4274','Qualitative single serological test for antibodies against SARS-CoV-2 virus antigens','',302,'B',36.00,'Detection of a SARS-CoV-2 antigen, detection by non-automatable immunochromatographic tests targeting the SARS-CoV-2 ... antigen (depends on the kit used)',1,163,170,4,5,'N','','N'),(490,1000,'B4719','Quantitative automated serological test for antibodies against SARS-CoV-2 virus antigens','',302,'B',45.00,'Screening and possible titration of antibodies against SARS-CoV-2, detection by automatable ELISA/ELFA tests',1,138,170,4,5,'N','','N'),(491,1000,'B4721','Rapid Diagnostic Test (RDT) for SARS-CoV-2 virus protein detection','',302,'B',35.00,'Detection of antibodies against SARS-CoV-2, detection by immunochromatographic tests',1,138,170,4,5,'N','94503-0','N'),(492,1000,'E01','Detection of Ebola virus DNA in blood by RT-PCR','EVD RT-PCR Blood',17,'',0.00,'',1,138,170,4,5,'N','','N'),(493,1000,'E02','Detection of Ebola virus DNA by buccal swab by RT-PCR','EVD RT-PCR Buccal',17,'',0.00,'',15,50,170,4,5,'N','','N'),(494,1000,'E03','Detection of Ebola virus DNA in urine by RT-PCR','EVD RT-PCR Urine',17,'',0.00,'',3,153,170,4,5,'N','','N'),(495,1000,'E04','Detection of Ebola virus DNA in semen by RT-PCR','EVD RT-PCR Semen',17,'',0.00,'',22,152,170,4,5,'N','','N'),(496,1000,'E05','Detection of Ebola virus DNA in stool by RT-PCR','EVD RT-PCR Stool',17,'',0.00,'',4,141,170,4,5,'N','','N'),(497,1000,'B659','Klebsiella spp. antibiogram [DISK]','Klebsiella ATB',18,'B',NULL,'',NULL,NULL,NULL,4,4,'Y','','N'),(498,1000,'B660','Enterobacter spp. antibiogram [DISK]','Enterobacter ATB',18,'B',NULL,'',NULL,NULL,NULL,4,4,'Y','','N'),(499,1000,'B661','Vibrio cholerae spp. antibiogram [DISK]','V. cholerae ATB',18,'B',NULL,'',NULL,NULL,NULL,4,4,'Y','','N'),(500,1000,'B679','Klebsiella spp. antibiogram [MIC]','Klebsiella ATB',18,'B',NULL,'',NULL,NULL,NULL,4,4,'Y','','N'),(501,1000,'B680','Enterobacter spp. antibiogram [MIC]','Enterobacter ATB',18,'B',NULL,'',NULL,NULL,NULL,4,4,'Y','','N'),(502,1000,'B681','Vibrio cholerae spp. antibiogram [MIC]','V. cholerae ATB',18,'B',NULL,'',NULL,NULL,NULL,4,4,'Y','','N'),(503,1000,'B796','Molecular diagnosis of anthrax bacillus by PCR','Anthrax PCR',19,'',NULL,'',23,163,170,4,5,'N','','N'),(504,1000,'B797','Detection of Dengue virus RNA by RT-PCR on blood sample','Dengue RT-PCR',23,'',NULL,'',1,138,170,4,5,'N','7855-0','N'),(505,1000,'B798','Detection of Dengue NS1 antigen by EIA or ICT','Dengue NS1 Ag',302,'',NULL,'',1,138,170,4,5,'N','75317-2','N'),(506,1000,'B799','Detection of IgG and IgM against Dengue by EIA','Anti-Dengue Ab',302,'',NULL,'',1,138,170,4,5,'N','41878-0','N'),(507,1000,'B800','Diagnosis of recent rabies infection','Anti-rabies Ab',302,'',NULL,'',1,138,170,4,5,'N','97872-6','N'),(508,1000,'B801','Direct detection of rabies virus by IF or EIA','Rabies direct',302,'',NULL,'',1,138,170,4,5,'N','97872-6','N'),(509,1000,'B802','Direct detection of rabies virus by IF or EIA','Influenza RT-PCR',302,'',NULL,'',13,163,170,4,5,'N','97872-6','N'),(510,1000,'E06','Ebola virus Rapid Diagnostic Test by Oraquick','EVD RDT',17,'',NULL,'',15,50,170,4,5,'N','','N'),(511,1000,'PB25','Pus swab','Pus',0,'PB',0.00,'',0,0,NULL,4,5,'N','88839-6','N'),(512,1,'GX01','Xpert Carba-R Version 2','',23,'',0.00,'',0,141,NULL,4,5,'N','85502-3','N'),(513,1,'GX02','Xpert HBV Viral Load Version 1','',23,'',0.00,'',0,138,NULL,4,5,'N','95147-5','N'),(514,1,'GX03','Xpert HIV-1 Qual XC DBS Version 1','',23,'',0.00,'',0,138,NULL,4,5,'N','83101-6','N'),(515,1,'GX04','Xpert HIV-1 Qual XC WB Version 1','',23,'',0.00,'',0,138,NULL,4,5,'N','83101-6','N'),(516,1,'GX05','Xpert HIV-1 Viral Load XC Version 3','',23,'',0.00,'',0,138,NULL,4,5,'N','81246-1','N'),(517,1,'GX06','Xpert MTB-RIF Ultra Version 4','',23,'',0.00,'',0,56,NULL,4,5,'N','89371-9','N'),(518,1,'GX07','Xpert Xpress SARS-CoV-2 Version 2','',23,'',0.00,'',0,1776,NULL,4,5,'N','94531-1','N'),(519,1,'GX08','Xpert_Carba-R Version 1','',23,'',0.00,'',0,141,NULL,4,5,'N','85502-3','N'),(520,1,'GX09','Xpert_HIV-1 Qual Version 2','',23,'',0.00,'',0,138,NULL,4,5,'N','83101-6','N'),(521,1,'GX10','Xpert_HIV-1 Viral Load Version 1','',23,'',0.00,'',0,138,NULL,4,5,'N','81246-1','N'),(522,1,'NFS_XN3','CBC - Automated','CBC-Auto',1001,'B',0.00,'Sysmex XN-350 automated analyzer',0,138,170,4,5,'N','57022-6','N');
/*!40000 ALTER TABLE `sigl_05_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_05_data_test`
--

DROP TABLE IF EXISTS `sigl_05_data_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_05_data_test` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `code` varchar(7) DEFAULT NULL,
  `nom` varchar(120) NOT NULL,
  `abbr` varchar(20) DEFAULT NULL,
  `famille` int unsigned DEFAULT NULL,
  `cote_unite` varchar(2) DEFAULT NULL,
  `cote_valeur` decimal(10,2) DEFAULT NULL,
  `commentaire` text,
  `produit_biologique` int unsigned DEFAULT NULL,
  `type_prel` int unsigned DEFAULT NULL,
  `type_analyse` int unsigned DEFAULT NULL,
  `actif` int unsigned DEFAULT NULL,
  `ana_whonet` int DEFAULT '5',
  `ana_ast` varchar(1) NOT NULL DEFAULT 'N',
  `ana_loinc` varchar(20) DEFAULT '',
  `ana_lite` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `code` (`code`),
  KEY `id_owner` (`id_owner`),
  KEY `sigl_05_data_ibfk_3` (`famille`),
  KEY `sigl_05_data_ibfk_5` (`produit_biologique`),
  KEY `sigl_05_data_ibfk_6` (`type_prel`),
  KEY `sigl_05_data_ibfk_7` (`type_analyse`),
  KEY `sigl_05_data_ibfk_8` (`actif`),
  KEY `idx_name` (`nom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_05_data_test`
--

LOCK TABLES `sigl_05_data_test` WRITE;
/*!40000 ALTER TABLE `sigl_05_data_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_05_data_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_06_data`
--

DROP TABLE IF EXISTS `sigl_06_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_06_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `identifiant` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `identifiant` (`identifiant`),
  KEY `id_owner` (`id_owner`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_06_data`
--

LOCK TABLES `sigl_06_data` WRITE;
/*!40000 ALTER TABLE `sigl_06_data` DISABLE KEYS */;
INSERT INTO `sigl_06_data` VALUES (1,1,'prix_acte','Unit price for collection and analysis procedures','1000'),(2,1,'entete_1','Document header 1','Laboratory name'),(3,1,'entete_2','Document header 2','Sxxx with capital of xxx € RCS xxx xxx xxx authorization no. xx xxx'),(4,1,'entete_3','Document header 3','Hours: Monday to Friday: 7:00 AM-7:00 PM, Saturday: 7:30 AM-12:00 PM    www.example.com'),(5,1,'entete_adr','Document header - Address','100 place de la République 10000 Maville'),(6,1,'entete_tel','Document header - Phone','01 23 45 67 89'),(7,1,'entete_fax','Document header - Fax','01 98 76 54 32'),(8,1,'entete_email','Document header - Email','labo@examples.com'),(9,1,'entete_ville','Document header - City','Ma ville'),(10,1,'facturation_pat_hosp','Inpatient billing (1/0)','0'),(11,1,'unite_age_defaut','Default age unit (Days, Weeks, Months, Years)','Years'),(12,1,'auto_logout','Automatic logout (min)','23'),(13,1,'qualite','Quality module enabled (1/0)','1'),(14,1,'facturation','Billing module enabled (1/0)','1'),(15,1000,'default_language','Default language (report also)','fr_FR'),(16,1000,'db_language','Reference language','fr_FR'),(17,1,'audit_purge_months','Number of months before audit table archiving','12');
/*!40000 ALTER TABLE `sigl_06_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_07_data`
--

DROP TABLE IF EXISTS `sigl_07_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_07_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `libelle` varchar(120) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `unite` int unsigned DEFAULT NULL,
  `normal_min` varchar(20) DEFAULT NULL,
  `normal_max` varchar(20) DEFAULT NULL,
  `commentaire` text,
  `type_resultat` int unsigned DEFAULT NULL,
  `unite2` int unsigned DEFAULT NULL,
  `formule_unite2` varchar(120) DEFAULT NULL,
  `formule` varchar(120) DEFAULT NULL,
  `accuracy` int unsigned DEFAULT NULL,
  `precision2` int unsigned DEFAULT NULL,
  `code_var` varchar(10) DEFAULT NULL,
  `var_highlight` varchar(1) NOT NULL DEFAULT 'N',
  `var_show_minmax` varchar(1) NOT NULL DEFAULT 'N',
  `var_in_report` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `code_var` (`code_var`),
  KEY `sigl_07_data_ibfk_1` (`id_owner`),
  KEY `sigl_07_data_ibfk_2` (`unite`),
  KEY `sigl_07_data_ibfk_3` (`type_resultat`),
  KEY `sigl_07_data_ibfk_4` (`unite2`),
  KEY `idx_label` (`libelle`)
) ENGINE=InnoDB AUTO_INCREMENT=882 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_07_data`
--

LOCK TABLES `sigl_07_data` WRITE;
/*!40000 ALTER TABLE `sigl_07_data` DISABLE KEYS */;
INSERT INTO `sigl_07_data` VALUES (1,1010,'Detection and titration of IgG and IgM (Toxoplasmosis)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1','N','N','Y'),(2,1010,'Uric acid','blood',281,'140','420','Male: 180 - 420\nFemale: 140 - 360',227,NULL,NULL,NULL,NULL,NULL,'2','N','N','Y'),(3,1010,'Bicarbonates',NULL,235,'20','30',NULL,228,NULL,NULL,NULL,NULL,NULL,'3','N','N','Y'),(4,1010,'Total bilirubin',NULL,280,NULL,'10',NULL,228,281,'$_1*1.71',NULL,2,2,'4','N','N','Y'),(5,1010,'Direct bilirubin (conjugated)',NULL,280,NULL,'2',NULL,228,281,'$_1 * 1.7105',NULL,1,1,'5','N','N','Y'),(6,1010,'Indirect bilirubin',NULL,280,NULL,'9.9',NULL,228,281,'$_1 * 1.7105',NULL,1,1,'6','N','N','Y'),(7,1010,'Creatinine','blood',281,NULL,NULL,'1 - 4 years: 18 - 35\n4 - 13 years: 31 - 68 \n13 - 17 years: 37 - 88\nfemale: 45 - 103\nmale: 55 - 120',227,NULL,NULL,NULL,1,NULL,'7','N','N','Y'),(8,1010,'Glucose','fasting',235,'4.20','6.40',NULL,228,NULL,NULL,NULL,2,NULL,'8','N','N','Y'),(9,1010,'Urea',NULL,235,'1.70','8.30','premature: 1.10 - 8.90\n< 1 year: 1.40 - 6.80\nchild: 1.80 - 6.40',228,NULL,NULL,NULL,2,NULL,'9','N','N','Y'),(10,1010,'Ammonia',NULL,281,NULL,NULL,'Technique: colorimetry',228,NULL,NULL,NULL,NULL,NULL,'10','N','N','Y'),(11,1010,'Calcium (Calcemia)',NULL,280,'88','104',NULL,227,235,'$_1 * 0.0249',NULL,NULL,1,'11','N','N','Y'),(12,1010,'Total calcemia',NULL,235,'2.15','2.50','premature: 1.55 - 2.75\nD0 - 10d: 1.90 - 2.60\n10 d - 24 months: 2.25 - 2.75\n24 months - 12 years: 2.20 - 2.70\n12 years - 18 years: 2.10 - 2.55',228,NULL,NULL,NULL,1,NULL,'12','N','N','Y'),(13,1010,'Chloride (chloremia)',NULL,297,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'13','N','N','Y'),(14,1010,'Chloride',NULL,235,'98','106',NULL,228,NULL,NULL,NULL,NULL,NULL,'14','N','N','Y'),(15,1010,'Serum iron',NULL,280,'0.5','1.7',NULL,228,281,'$_1*17.92',NULL,1,2,'15','N','N','Y'),(16,1010,'Potassium',NULL,235,'3.6','4.5',NULL,228,NULL,NULL,NULL,1,NULL,'16','N','N','Y'),(17,1010,'Sodium',NULL,235,'135','145',NULL,228,NULL,NULL,NULL,NULL,NULL,'17','N','N','Y'),(18,1010,'Lithium',NULL,235,NULL,NULL,'Therapeutic range: 0.5 to 1.5',228,NULL,NULL,NULL,2,NULL,'18','N','N','Y'),(19,1010,'Plasma magnesium',NULL,235,'0.70','1',NULL,228,NULL,NULL,NULL,2,NULL,'19','N','N','Y'),(20,1010,'Erythrocyte magnesium',NULL,280,NULL,NULL,NULL,228,235,NULL,NULL,NULL,NULL,'20','N','N','Y'),(21,1010,'Phosphates','blood',235,'0.81','1.62','child: 1.29 - 2.25',228,NULL,NULL,NULL,2,NULL,'21','N','N','Y'),(22,1010,'Potassium by flame photometry',NULL,297,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'22','N','N','Y'),(23,1010,'Sodium by flame photometry',NULL,297,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'23','N','N','Y'),(24,1010,'Blood potassium',NULL,297,NULL,NULL,'Method: colorimetry',228,NULL,NULL,NULL,NULL,NULL,'24','N','N','Y'),(25,1010,'Blood sodium',NULL,297,NULL,NULL,'Method: colorimetry',228,NULL,NULL,NULL,NULL,NULL,'25','N','N','Y'),(26,1010,'Total cholesterol',NULL,235,'3.60','6.20',NULL,228,NULL,NULL,NULL,2,NULL,'26','N','N','Y'),(27,1010,'HDL cholesterol',NULL,282,'0.35','0.62',NULL,228,235,'$_2*2.58',NULL,2,2,'27','N','N','Y'),(28,1010,'LDL cholesterol (manual entry)',NULL,282,NULL,'1.6',NULL,228,235,'$_1 * 2.578',NULL,NULL,NULL,'28','N','N','Y'),(29,1010,'Total cholesterol',NULL,282,'1.36','2.4',NULL,228,235,'$_1*2.58',NULL,2,2,'29','N','N','Y'),(30,1010,'Triglycerides',NULL,282,'0.44','1.5',NULL,228,235,'$_3*1.14',NULL,2,2,'30','N','N','Y'),(31,1010,'Calculated LDL cholesterol',NULL,282,NULL,'1.6',NULL,229,235,'($_1 - $_2 - ($_3 / 5.6))*2.58','$_1 - $_2 - ($_3 / 5.6)',NULL,2,'31','N','N','Y'),(32,1010,'Atherogenic index',NULL,NULL,NULL,'4.5',NULL,229,NULL,NULL,'$_1/$_2',2,NULL,'32','N','N','Y'),(33,1010,'Triglycerides',NULL,235,'0.46','1.71',NULL,228,NULL,NULL,NULL,2,NULL,'33','N','N','Y'),(34,1010,'Alpha-lipoproteins',NULL,236,'20','30',NULL,228,NULL,NULL,NULL,NULL,NULL,'34','N','N','Y'),(35,1010,'Pre-beta-lipoproteins',NULL,237,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'35','N','N','Y'),(36,1010,'Beta-lipoprotein',NULL,236,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'36','N','N','Y'),(37,1010,'Chylomicrons',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'37','N','N','Y'),(38,1010,'Chylomicrons',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'38','N','N','Y'),(39,1010,'Lipoprotein A1 by immunoassay',NULL,282,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'39','N','N','Y'),(40,1010,'Lipoprotein B by immunoassay',NULL,282,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'40','N','N','Y'),(41,1010,'Albumin',NULL,282,'35','50','0 - 4 days: 28 -44 \n4d - 14 years: 38 - 54 \n14 - 18 years: 32 - 45 \n18 - 60 years: 34 - 48',227,NULL,NULL,NULL,NULL,NULL,'41','N','N','Y'),(42,1010,'Albumin','Generic assay',282,'35','50',NULL,227,NULL,NULL,NULL,NULL,NULL,'42','N','N','Y'),(43,1010,'Hemoglobin without tracing',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'43','N','N','Y'),(44,1010,'Albumin','urine',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'44','N','N','Y'),(45,1010,'Alpha 1 globulin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'45','N','N','Y'),(46,1010,'Alpha 2 globulin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'46','N','N','Y'),(47,1010,'Beta globulin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'47','N','N','Y'),(48,1010,'Gamma globulin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'48','N','N','Y'),(49,1010,'Albumin','urine',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'49','N','N','Y'),(50,1010,'Glycated hemoglobin (Hb A1c)',NULL,239,NULL,'6.5',NULL,228,NULL,NULL,NULL,1,NULL,'50','N','N','Y'),(51,1010,'Hemoglobin F',NULL,239,NULL,NULL,'HPLC assay',228,NULL,NULL,NULL,NULL,NULL,'51','N','N','Y'),(52,1010,'Hemoglobin S',NULL,239,NULL,NULL,'Solubility test',228,NULL,NULL,NULL,NULL,NULL,'52','N','N','Y'),(53,1010,'Myoglobin',NULL,283,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'53','N','N','Y'),(54,1010,'Bence Jones proteins (screening)',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'54','N','N','Y'),(55,1010,'Bence Jones proteins (screening)',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'55','N','N','Y'),(56,1010,'Bence Jones proteins by electrophoresis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'56','N','N','Y'),(57,1010,'Total proteins','blood',282,'60','80',NULL,227,NULL,NULL,NULL,2,NULL,'57','N','N','Y'),(58,1010,'CRP',NULL,280,NULL,'6','By rapid test',227,NULL,NULL,NULL,NULL,NULL,'58','N','N','Y'),(59,1010,'Quantitative C-Reactive Protein',NULL,280,NULL,'6','By spectrophotometry',227,NULL,NULL,NULL,NULL,NULL,'59','N','N','Y'),(60,1010,'Semi-quantitative Troponin',NULL,283,NULL,NULL,'By rapid test',228,NULL,NULL,NULL,NULL,NULL,'60','N','N','Y'),(61,1010,'Troponin',NULL,283,NULL,'0.1','By immunoassay',228,NULL,NULL,NULL,NULL,NULL,'61','N','N','Y'),(62,1010,'pH',NULL,NULL,'7.37','7.49',NULL,228,NULL,NULL,NULL,NULL,NULL,'62','N','N','Y'),(63,1010,'Arterial oxygen pressure (PaO2)',NULL,238,'90',NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'63','N','N','Y'),(64,1010,'Arterial carbon dioxide pressure (PCO2)',NULL,238,'38','42',NULL,228,NULL,NULL,NULL,NULL,NULL,'64','N','N','Y'),(65,1010,'Oxygen saturation (SaO2)',NULL,239,'5','98',NULL,228,NULL,NULL,NULL,NULL,NULL,'65','N','N','Y'),(66,1010,'Total CO2',NULL,235,'26','30',NULL,228,NULL,NULL,NULL,NULL,NULL,'66','N','N','Y'),(67,1010,'Amylase',NULL,284,'18','102',NULL,227,NULL,NULL,NULL,NULL,NULL,'67','N','N','Y'),(68,1010,'Creatine PhosphoKinase (CPK)',NULL,284,'29','200',NULL,227,NULL,NULL,NULL,NULL,NULL,'68','N','N','Y'),(69,1010,'Creatine PhosphoKinase MB (CPK-MB)',NULL,284,NULL,'25',NULL,227,NULL,NULL,NULL,NULL,NULL,'69','N','N','Y'),(70,1010,'5\Nucleotidase',NULL,284,'0.5','5.5','Normal ranges: Child: 0.5 - 3.5 / Adult: 1.5 - 5.5',228,NULL,NULL,NULL,1,NULL,'70','N','N','Y'),(71,1010,'Gamma glutamyl transferase (GGT)',NULL,284,'7','65',NULL,227,NULL,NULL,NULL,NULL,NULL,'71','N','N','Y'),(72,1010,'Glucose-6-Phosphate Dehydrogenase (G6PD)',NULL,284,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'72','N','N','Y'),(73,1010,'Lactate Dehydrogenase (LDH)',NULL,284,'228','456',NULL,227,NULL,NULL,NULL,NULL,NULL,'73','N','N','Y'),(74,1010,'Alkaline Phosphatases',NULL,284,'75','240',NULL,227,NULL,NULL,NULL,NULL,NULL,'74','N','N','Y'),(75,1010,'Acid Phosphatases',NULL,284,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'75','N','N','Y'),(76,1010,'Transaminases (AST)',NULL,284,'10','40',NULL,227,NULL,NULL,NULL,NULL,NULL,'76','N','N','Y'),(77,1010,'Transaminases (ALT)',NULL,284,'10','45',NULL,227,NULL,NULL,NULL,NULL,NULL,'77','N','N','Y'),(78,1010,'Lipase',NULL,284,'7','58',NULL,227,NULL,NULL,NULL,NULL,NULL,'78','N','N','Y'),(79,1010,'Beta HCG assay',NULL,284,NULL,'5',NULL,227,NULL,NULL,NULL,NULL,NULL,'79','N','N','Y'),(80,1010,'Cortisol',NULL,285,'275','685',NULL,227,NULL,NULL,NULL,NULL,NULL,'80','N','N','Y'),(81,1010,'Erythropoietin',NULL,284,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'81','N','N','Y'),(82,1010,'Estradiol',NULL,287,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'82','N','N','Y'),(83,1010,'Ferritin',NULL,286,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'83','N','N','Y'),(84,1010,'FSH',NULL,284,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'84','N','N','Y'),(85,1010,'Insulin',NULL,298,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'85','N','N','Y'),(86,1010,'Free insulin',NULL,298,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'86','N','N','Y'),(87,1010,'LH',NULL,284,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'87','N','N','Y'),(88,1010,'Progesterone',NULL,285,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'88','N','N','Y'),(89,1010,'Prolactin',NULL,286,'5','35',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'89','N','N','Y'),(90,1010,'Thyroglobulin',NULL,283,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'90','N','N','Y'),(91,1010,'Free Thyroxine (FT4)',NULL,288,'9','20',NULL,228,NULL,NULL,NULL,NULL,NULL,'91','N','N','Y'),(92,1010,'Testosterone',NULL,286,'0.1','10.6',NULL,228,NULL,NULL,NULL,NULL,NULL,'92','N','N','Y'),(93,1010,'Transferrin',NULL,282,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'93','N','N','Y'),(94,1010,'Free Triiodothyronine (FT3)',NULL,288,'4','8.3',NULL,228,NULL,NULL,NULL,NULL,NULL,'94','N','N','Y'),(95,1010,'Ultrasensitive TSH',NULL,289,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'95','N','N','Y'),(96,1010,'TSH (Thyroid Stimulating Hormone)',NULL,289,'0.25','5',NULL,228,NULL,NULL,NULL,NULL,NULL,'96','N','N','Y'),(97,1010,'Acetone',NULL,235,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'97','N','N','Y'),(98,1010,'Uric acid','In urine',249,'400','800','LDP Biochemistry',227,234,'$_1 * 0.00595',NULL,NULL,1,'98','N','N','Y'),(99,1010,'Urinary pH',NULL,NULL,'5.4','7.2','Electrometric method',228,NULL,NULL,NULL,NULL,NULL,'99','N','N','Y'),(100,1010,'Creatinine','urine',249,'1000','1800',NULL,227,NULL,NULL,NULL,NULL,NULL,'100','N','N','Y'),(101,1010,'Bile pigments',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'101','N','N','Y'),(102,1010,'Bile pigments',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'102','N','N','Y'),(103,1010,'Blood screening (red blood cells and/or hemoglobin)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'103','N','N','Y'),(104,1010,'Bile salts',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'104','N','N','Y'),(105,1010,'Bile salts',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'105','N','N','Y'),(106,1010,'Glucose','fasting',282,'0.7','1.04',NULL,228,235,'$_1 * 5.551',NULL,2,2,'106','N','N','Y'),(107,1010,'Glucose','dipstick',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'107','N','N','Y'),(108,1010,'Glucose','dipstick',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'108','N','N','Y'),(109,1010,'Urea',NULL,290,NULL,NULL,NULL,228,234,'$_1 * 16.65',NULL,NULL,NULL,'109','N','N','Y'),(110,1010,'Calcium (Calciuria)',NULL,249,'102','251',NULL,227,234,'$_1 * 0.0249',NULL,NULL,NULL,'110','N','N','Y'),(111,1010,'Phosphates','blood',280,'24.8','44.9',NULL,228,235,'$_1 * 0.0323',NULL,2,2,'111','N','N','Y'),(112,1010,'Urinary potassium',NULL,235,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'112','N','N','Y'),(113,1010,'Urinary sodium',NULL,235,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'113','N','N','Y'),(114,1010,'Proteins',NULL,282,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'114','N','N','Y'),(115,1010,'Microalbumin',NULL,249,NULL,'20','Assay excluding dipsticks',228,NULL,NULL,NULL,1,NULL,'115','N','N','Y'),(116,1010,'Proteinuria (24h)','urine',290,NULL,'0.15','Pregnant woman < 0.30',228,NULL,NULL,NULL,2,NULL,'116','N','N','Y'),(117,1010,'Porphyrins (screening)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'117','N','N','Y'),(118,1010,'Pregnancy test',NULL,284,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'118','N','N','Y'),(119,1010,'Pregnancy test',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'119','N','N','Y'),(120,1010,'Seminal Alpha-1,4-glucosidase',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'120','N','N','Y'),(121,1010,'Seminal free carnitine',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'121','N','N','Y'),(122,1010,'Seminal citrate',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'122','N','N','Y'),(123,1010,'Seminal fructose',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123','N','N','Y'),(124,1010,'Total proteins (CSF)',NULL,282,'0.2','0.6',NULL,228,NULL,NULL,NULL,1,NULL,'124','N','N','Y'),(125,1010,'Rivalta test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'125','N','N','Y'),(126,1010,'24-hour urine volume',NULL,295,NULL,NULL,NULL,228,NULL,NULL,NULL,3,NULL,'126','N','N','Y'),(127,1010,'Plasma uric acid',NULL,280,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'127','N','N','Y'),(128,1010,'Urinary uric acid',NULL,280,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'128','N','N','Y'),(129,1010,'Uric acid clearance',NULL,296,'88','138','Normal ranges: Male: 97 - 137 / Female: 88 - 138',229,NULL,NULL,'$_3 * $_1 * 1000 / 1440 / $_2',2,NULL,'129','N','N','Y'),(130,1010,'Plasma urea',NULL,280,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'130','N','N','Y'),(131,1010,'Urinary urea',NULL,287,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'131','N','N','Y'),(132,1010,'Urea clearance',NULL,296,'88','138','Normal ranges: Male: 97 - 137 / Female: 88 - 138',229,NULL,NULL,'$_3 * $_1 * 1000 / 1440 / $_2',2,NULL,'132','N','N','Y'),(133,1010,'Plasma creatinine',NULL,280,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'133','N','N','Y'),(134,1010,'Urinary creatinine',NULL,280,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'134','N','N','Y'),(135,1010,'Creatinine clearance',NULL,296,'80',NULL,'Normal ranges: Male: 97 - 137 / Female: 88 - 138',229,NULL,NULL,'$_3 * $_1 * 1000 / 1440 / $_2',2,NULL,'135','N','N','Y'),(136,1010,'GLC at T0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'136','N','N','Y'),(137,1010,'GLC at 30min',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'137','N','N','Y'),(138,1010,'GLC at 60min',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'138','N','N','Y'),(139,1010,'GLC at 90min',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'139','N','N','Y'),(140,1010,'GLC at 120min',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'140','N','N','Y'),(141,1010,'GLC at 150min',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'141','N','N','Y'),(142,1010,'GLC at 180min',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'142','N','N','Y'),(143,1010,'HCG stimulation test: testosterone assay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'143','N','N','Y'),(144,1010,'HCG stimulation test: estradiol assay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'144','N','N','Y'),(145,1010,'Dexamethasone suppression test: cortisol assay',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'145','N','N','Y'),(146,1010,'Lymphocytes',NULL,239,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'146','N','N','Y'),(147,1010,'Lymphoblasts',NULL,239,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'147','N','N','Y'),(148,1010,'Plasma cells',NULL,239,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'148','N','N','Y'),(149,1010,'Hematocrit (level)',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'149','N','N','Y'),(150,1010,'Hemoglobin (spectrophotometric assay)',NULL,243,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'150','N','N','Y'),(151,1010,'Hemoglobin',NULL,243,'12.0','17.0','Normal ranges: 3 to 10 years: 12.0 - 14.5 / Female: 12.5 - 15.5 / Male: 14.0 - 17.0',228,NULL,NULL,NULL,1,NULL,'151','N','N','Y'),(152,1010,'ESR 1st hour',NULL,240,NULL,'10',NULL,227,NULL,NULL,NULL,NULL,NULL,'152','N','N','Y'),(153,1010,'ESR 2nd hour',NULL,240,NULL,'30',NULL,228,NULL,NULL,NULL,2,NULL,'153','N','N','Y'),(154,1010,'Red blood cells','Blood',241,'3.5','5.7','Normal ranges: 3 to 10 years: 3.5 - 5 / Female: 4.0 - 5.3 / Male: 4.2 - 5.7',228,NULL,NULL,NULL,1,NULL,'154','N','N','Y'),(155,1010,'Hematocrit',NULL,239,'36','52','Normal ranges: 3 to 10 years: 36 - 45 / Female: 37 - 46 / Male: 40 - 52',227,NULL,NULL,NULL,NULL,NULL,'155','N','N','Y'),(156,1010,'Mean Corpuscular Volume (MCV)',NULL,244,'74.0','95.0','Normal ranges: 3 to 10 years: 74 - 91 / Female: 80 - 95 / Male: 80 - 95',229,NULL,NULL,'$_3 * 10 / $_1',1,NULL,'156','N','N','Y'),(157,1010,'Mean Corpuscular Hemoglobin (MCH)',NULL,245,'24.0','32.0','Normal ranges: 3 to 10 years: 24 - 30 / Female: 28 - 32 / Male: 28 - 32',229,NULL,NULL,'$_2 * 10 / $_1',1,NULL,'157','N','N','Y'),(158,1010,'Mean Corpuscular Hemoglobin Concentration (MCHC)',NULL,239,'28','35','Normal ranges: 3 to 10 years: 28 - 33 / Female: 30 - 35 / Male: 30 - 35',229,NULL,NULL,'100 * $_2 / $_3',1,NULL,'158','N','N','Y'),(159,1010,'White blood cells (CSF)',NULL,242,'4.0','13.0','Normal ranges: 3 to 10 years: 4.5 - 13 / Female: 4 - 10 / Male: 4 - 10',228,NULL,NULL,NULL,1,NULL,'159','N','N','Y'),(160,1010,'Neutrophils',NULL,239,'40','70',NULL,228,242,'$_4 * $_5 /100',NULL,1,2,'160','N','N','Y'),(161,1010,'Eosinophils',NULL,239,'1','3',NULL,228,242,'$_4 * $_6 /100',NULL,1,2,'161','N','N','Y'),(162,1010,'Basophils',NULL,239,'1','3',NULL,228,242,'$_4 * $_7 /100',NULL,1,2,'162','N','N','Y'),(163,1010,'Lymphocytes',NULL,239,'10','30',NULL,228,242,'$_4 * $_8 /100',NULL,1,2,'163','N','N','Y'),(164,1010,'Monocytes',NULL,239,'4',NULL,NULL,228,242,'$_4 * $_9 /100',NULL,1,2,'164','N','N','Y'),(165,1010,'Platelets',NULL,242,'150','400',NULL,227,NULL,NULL,NULL,NULL,NULL,'165','N','N','Y'),(166,1010,'Count',NULL,NULL,NULL,NULL,NULL,265,NULL,NULL,NULL,NULL,NULL,'166','N','N','Y'),(167,1010,'Differential white blood cell count',NULL,NULL,NULL,NULL,NULL,265,NULL,NULL,NULL,NULL,NULL,'167','N','N','Y'),(168,1010,'Platelets',NULL,NULL,NULL,NULL,NULL,265,NULL,NULL,NULL,NULL,NULL,'168','N','N','Y'),(169,1010,'Red blood cells','Blood',1143,'3.0','3.8',NULL,228,NULL,NULL,NULL,1,NULL,'169','N','N','Y'),(170,1010,'Mean Corpuscular Volume (MCV)',NULL,244,'98','112',NULL,227,NULL,NULL,NULL,1,NULL,'170','N','N','Y'),(171,1010,'Mean Corpuscular Hemoglobin Concentration (MCHC)',NULL,239,'30.0','34.0',NULL,228,NULL,NULL,NULL,1,NULL,'171','N','N','Y'),(172,1010,'White blood cells',NULL,1144,NULL,NULL,NULL,228,NULL,NULL,NULL,1,NULL,'172','N','N','Y'),(173,1010,'Neutrophils',NULL,239,NULL,NULL,NULL,228,1144,'$_4 * $_5 /100',NULL,1,2,'173','N','N','Y'),(174,1010,'Eosinophils',NULL,239,NULL,NULL,NULL,228,1144,'$_4 * $_6 /100',NULL,1,2,'174','N','N','Y'),(175,1010,'Basophils',NULL,239,NULL,NULL,NULL,228,1144,'$_4 * $_7 /100',NULL,1,2,'175','N','N','Y'),(176,1010,'Lymphocytes',NULL,239,NULL,NULL,NULL,228,1144,'$_4 * $_8 /100',NULL,1,2,'176','N','N','Y'),(177,1010,'Monocytes',NULL,239,NULL,NULL,NULL,228,1144,'$_4 * $_9 /100',NULL,1,2,'177','N','N','Y'),(178,1010,'Platelets',NULL,1144,'160','500',NULL,227,NULL,NULL,NULL,NULL,NULL,'178','N','N','Y'),(179,1010,'CD4 count',NULL,626,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'179','N','N','Y'),(180,1010,'CD8 count',NULL,626,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'180','N','N','Y'),(181,1010,'Total lymphocyte count',NULL,626,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'181','N','N','Y'),(182,1010,'Percentage',NULL,239,NULL,NULL,NULL,229,NULL,NULL,'$1 / $3 * 100',NULL,NULL,'182','N','N','Y'),(183,1010,'White blood cell count (manual method)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'183','N','N','Y'),(184,1010,'Reticulocyte count',NULL,239,'1','3',NULL,228,NULL,NULL,NULL,2,NULL,'184','N','N','Y'),(185,1010,'Platelet count',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'185','N','N','Y'),(186,1010,'Fetal hemoglobin screening',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'186','N','N','Y'),(187,1010,'Heinz bodies screening',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'187','N','N','Y'),(188,1010,'Emmel test',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'188','N','N','Y'),(189,1010,'Eosinophilic polymorphonuclear cells screening in nasal mucus',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'189','N','N','Y'),(190,1010,'Eosinophilic polymorphonuclear cells screening in sputum',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'190','N','N','Y'),(191,1010,'D-Dimers',NULL,NULL,NULL,NULL,'Technique: latex particle agglutination',NULL,NULL,NULL,NULL,NULL,NULL,'191','N','N','Y'),(192,1010,'D-Dimers',NULL,286,NULL,'500','Technique: ELISA',227,NULL,NULL,NULL,NULL,NULL,'192','N','N','Y'),(193,1010,'Fibrinogen assay',NULL,282,'2','4',NULL,228,NULL,NULL,NULL,NULL,NULL,'193','N','N','Y'),(194,1010,'D-Dimers assay: (specify technique on report)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'194','N','N','Y'),(195,1010,'Heparinemia',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'195','N','N','Y'),(196,1010,'Prothrombin rate',NULL,239,'80','100',NULL,227,NULL,NULL,NULL,NULL,NULL,'196','N','N','Y'),(197,1010,'INR',NULL,NULL,NULL,'1',NULL,228,NULL,NULL,NULL,2,NULL,'197','N','N','Y'),(198,1010,'Bleeding time',NULL,291,'180','360',NULL,227,NULL,NULL,NULL,NULL,NULL,'198','N','N','Y'),(199,1010,'ACT or APTT (control: 28s)',NULL,291,'27','35',NULL,227,NULL,NULL,NULL,NULL,NULL,'199','N','N','Y'),(201,1010,'Thrombin Time (TT)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'201','N','N','Y'),(202,1010,'Fibrin/Fibrinogen Degradation Products (FDP) titration',NULL,292,NULL,'0.5',NULL,228,NULL,NULL,NULL,NULL,NULL,'202','N','N','Y'),(203,1010,'Blood group',NULL,NULL,NULL,NULL,NULL,900,NULL,NULL,NULL,NULL,NULL,'203','N','N','Y'),(204,1010,'Rhesus factor',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'204','N','N','Y'),(205,1010,'Direct Coombs test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'205','N','N','Y'),(206,1010,'Crossmatch test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'206','N','N','Y'),(207,1010,'Rheumatoid factor (latex test)',NULL,293,NULL,'80',NULL,228,NULL,NULL,NULL,NULL,NULL,'207','N','N','Y'),(208,1010,'Antistreptolysin O (ASLO)',NULL,293,NULL,'200',NULL,228,NULL,NULL,NULL,NULL,NULL,'208','N','N','Y'),(209,1010,'Antistreptokinase (ASK)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'209','N','N','Y'),(210,1010,'Borrelia (IFA or EIA)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'210','N','N','Y'),(211,1010,'Brucella (IFA or EIA)',NULL,293,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'211','N','N','Y'),(212,1010,'Chlamydia trachomatis by PCR',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'212','N','N','Y'),(213,1010,'Titer',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'213','N','N','Y'),(215,1010,'Helicobacter pylori (EIA)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'215','N','N','Y'),(216,1010,'Mycoplasma pneumoniae (IgG by EIA)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'216','N','N','Y'),(218,1010,'AO',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'218','N','N','Y'),(219,1010,'BO',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'219','N','N','Y'),(220,1010,'CO',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'220','N','N','Y'),(221,1010,'TO',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'221','N','N','Y'),(222,1010,'AH',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'222','N','N','Y'),(223,1010,'BH',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'223','N','N','Y'),(224,1010,'CH',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'224','N','N','Y'),(225,1010,'TH',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'225','N','N','Y'),(226,1010,'ENH',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'226','N','N','Y'),(227,1010,'Vi',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'227','N','N','Y'),(228,1010,'Widal serodiagnosis',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'228','N','N','Y'),(229,1010,'Qualitative RPR (Syphilis)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'229','N','N','Y'),(230,1010,'Titer','Generic',NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'230','N','N','Y'),(231,1010,'TPHA (Syphilis)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'231','N','N','Y'),(232,1010,'FTA-ABS IgG (Syphilis)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'232','N','N','Y'),(233,1010,'FTA-ABS IgG (Syphilis)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'233','N','N','Y'),(234,1010,'IgM screening (Syphilis)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'234','N','N','Y'),(235,1010,'IgM screening (Syphilis)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'235','N','N','Y'),(236,1010,'Direct chlamydia screening by immunological technique',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'236','N','N','Y'),(237,1010,'Bacterial toxin screening by immunological technique',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'237','N','N','Y'),(238,1010,'Aspergillosis (screening)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'238','N','N','Y'),(239,1010,'Candidiasis',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'239','N','N','Y'),(240,1010,'Serology',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'240','N','N','Y'),(241,1010,'Candidiasis',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'241','N','N','Y'),(242,1010,'Cryptococcosis',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'242','N','N','Y'),(243,1010,'Cysticercosis screening (EIA or IFA)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'243','N','N','Y'),(244,1010,'Cysticercosis screening (EIA or IFA)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'244','N','N','Y'),(245,1010,'Titer',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'245','N','N','Y'),(246,1010,'Cysticercosis confirmation test (IE)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'246','N','N','Y'),(247,1010,'Filariasis screening (EIA or IFA)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'247','N','N','Y'),(248,1010,'Filariasis confirmation test by IE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'248','N','N','Y'),(249,1010,'Visceral leishmaniasis screening (EIA or IFA)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'249','N','N','Y'),(250,1010,'Visceral leishmaniasis confirmation test by IE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'250','N','N','Y'),(251,1010,'Comments',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'251','N','N','Y'),(252,1010,'Plasmodium screening',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'252','N','N','Y'),(253,1010,'Species',NULL,NULL,NULL,NULL,NULL,617,NULL,NULL,NULL,NULL,NULL,'253','N','N','Y'),(254,1010,'IgG detection (Toxoplasmosis)',NULL,293,NULL,'8',NULL,227,NULL,NULL,NULL,NULL,NULL,'254','N','N','Y'),(255,1010,'IgA detection and titration (Toxoplasmosis)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'255','N','N','Y'),(256,1010,'HBsAg screening (Hepatitis B by rapid test)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'256','N','N','Y'),(257,1010,'Anti-HBs antibody screening (Hepatitis B by rapid test)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'257','N','N','Y'),(258,1010,'HBeAg screening (Hepatitis B by rapid test)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'258','N','N','Y'),(259,1010,'Anti-HBc antibody screening (Hepatitis B by rapid test)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'259','N','N','Y'),(260,1010,'HBsAg screening (Hepatitis B by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'260','N','N','Y'),(261,1010,'HBsAg screening (Hepatitis B by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'261','N','N','Y'),(262,1010,'Anti-HBs antibody screening (Hepatitis B by automated immunoanalyzer)',NULL,284,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'262','N','N','Y'),(263,1010,'HBeAg screening (Hepatitis B by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'263','N','N','Y'),(264,1010,'Anti-HBc antibody screening (Hepatitis B by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'264','N','N','Y'),(265,1010,'Anti-HBc antibody screening (Hepatitis B)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'265','N','N','Y'),(266,1010,'Anti-HBc IgM screening (Hepatitis B by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'266','N','N','Y'),(267,1010,'Anti-HBc IgM screening (Hepatitis B by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'267','N','N','Y'),(268,1010,'Hepatitis B neutralization test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'268','N','N','Y'),(269,1010,'Hepatitis B DNA by PCR',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'269','N','N','Y'),(270,1010,'Hepatitis B DNA by PCR',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'270','N','N','Y'),(271,1010,'Hepatitis C (by rapid test)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'271','N','N','Y'),(272,1010,'Hepatitis C (by rapid test)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'272','N','N','Y'),(273,1010,'Anti-HCV antibody screening (by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'273','N','N','Y'),(274,1010,'Anti-HCV antibody screening (by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'274','N','N','Y'),(275,1010,'Hepatitis C confirmation test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'275','N','N','Y'),(276,1010,'Hepatitis C RNA by PCR',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'276','N','N','Y'),(277,1010,'Hepatitis C RNA by PCR',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'277','N','N','Y'),(278,1010,'HIV (rapid test)',NULL,NULL,NULL,NULL,NULL,625,NULL,NULL,NULL,NULL,NULL,'278','N','N','Y'),(279,1010,'Anti-HIV antibody screening (by automated immunoanalyzer)',NULL,NULL,NULL,NULL,NULL,625,NULL,NULL,NULL,NULL,NULL,'279','N','N','Y'),(280,1010,'Anti-HIV antibody screening (ELISA test)',NULL,NULL,NULL,NULL,NULL,625,NULL,NULL,NULL,NULL,NULL,'280','N','N','Y'),(281,1010,'Screening',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'281','N','N','Y'),(282,1010,'Titration',NULL,293,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'282','N','N','Y'),(283,1010,'Screening',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'283','N','N','Y'),(284,1010,'HIV-1 RNA viral load measurement',NULL,293,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'284','N','N','Y'),(285,1010,'Herpes simplex virus type 1 (IgG or IgM)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'285','N','N','Y'),(286,1010,'Herpes simplex virus type II (IgG or IgM)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'286','N','N','Y'),(287,1010,'Rotavirus screening',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'287','N','N','Y'),(288,1010,'Optical density',NULL,NULL,NULL,NULL,'DO > COV: Positive DO < COV: Negative COV -0.010 < DO < COV + 0.010: Indeterminate',228,NULL,NULL,NULL,2,NULL,'288','N','N','Y'),(291,1010,'Total immunoglobulins (IgE) assay',NULL,294,NULL,'150',NULL,227,NULL,NULL,NULL,NULL,NULL,'291','N','N','Y'),(292,1010,'Single allergen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'292','N','N','Y'),(293,1010,'IgG assay in blood, CSF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'293','N','N','Y'),(294,1010,'IgM assay in blood, CSF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'294','N','N','Y'),(295,1010,'IgA assay in blood, CSF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'295','N','N','Y'),(296,1010,'Alpha-fetoprotein screening and titration (in serum or amniotic fluid)',NULL,293,NULL,'10',NULL,227,NULL,NULL,NULL,NULL,NULL,'296','N','N','Y'),(297,1010,'Carcinoembryonic Antigen (CEA) screening and titration',NULL,286,NULL,'5',NULL,228,NULL,NULL,NULL,NULL,NULL,'297','N','N','Y'),(298,1010,'Prostate Specific Antigen (PSA) screening and titration',NULL,286,NULL,'6.5',NULL,228,NULL,NULL,NULL,NULL,NULL,'298','N','N','Y'),(299,1010,'Free Prostate Specific Antigen (free PSA) screening and titration',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'299','N','N','Y'),(300,1010,'Beta-2 microglobulin screening and titration (in serum or urine)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'300','N','N','Y'),(301,1010,'Other','generic',NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'301','N','N','Y'),(302,1010,'Schistosoma mansoni',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'302','N','N','Y'),(303,1010,'Giardia',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'303','N','N','Y'),(304,1010,'Amebae',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'304','N','N','Y'),(305,1010,'Strongyloides',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'305','N','N','Y'),(306,1010,'Taenia',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'306','N','N','Y'),(307,1010,'Ascaris',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'307','N','N','Y'),(308,1010,'Pinworms',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'308','N','N','Y'),(309,1010,'Cryptosporidium screening by selective staining',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'309','N','N','Y'),(310,1010,'Cryptosporidium screening by immunofluorescence',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'310','N','N','Y'),(311,1010,'Microsporidia screening in stool by selective staining',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'311','N','N','Y'),(312,1010,'Pneumocystis carinii screening in bronchoalveolar fluid',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'312','N','N','Y'),(313,1010,'Pneumocystis carinii screening in bronchoalveolar fluid',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'313','N','N','Y'),(314,1010,'Parasite density','thick smear',NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'314','N','N','Y'),(316,1010,'Thick smear - Thin smear',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'316','N','N','Y'),(317,1010,'Microfilariae screening','generic screening (biopsy or blood)',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'317','N','N','Y'),(318,1010,'Microfilariae screening','generic screening (biopsy or blood)',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'318','N','N','Y'),(319,1010,'Blood microfilariae screening',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'319','N','N','Y'),(320,1010,'species','microfilaria',NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'320','N','N','Y'),(321,1010,'Yeast screening in CSF',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'321','N','N','Y'),(322,1010,'Yeast screening in CSF',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'322','N','N','Y'),(323,1010,'Leishmania screening in cutaneous fluid',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'323','N','N','Y'),(324,1010,'Trypanosome screening','Generic screening',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'324','N','N','Y'),(325,1010,'Trypanosome screening','Generic screening',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'325','N','N','Y'),(326,1010,'Fungal screening in skin and skin appendage samples',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'326','N','N','Y'),(327,1010,'fungus (species)',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'327','N','N','Y'),(328,1010,'Fungal screening in skin and skin appendage samples',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'328','N','N','Y'),(329,1010,'Yeast culture',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'329','N','N','Y'),(330,1010,'Parasites','UCBE',NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'330','N','N','Y'),(331,1010,'Other','Urine',NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'331','N','N','Y'),(332,1010,'Bacterial flora','generic',NULL,NULL,NULL,NULL,590,NULL,NULL,NULL,NULL,NULL,'332','N','N','Y'),(333,1010,'Gram stain',NULL,NULL,NULL,NULL,NULL,593,NULL,NULL,NULL,NULL,NULL,'333','N','N','Y'),(334,1010,'Macroscopic appearance',NULL,NULL,NULL,NULL,NULL,598,NULL,NULL,NULL,NULL,NULL,'334','N','N','Y'),(335,1010,'Epithelial cells','semi-quantitative (none to very numerous)',NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'335','N','N','Y'),(336,1010,'Leukocytes',NULL,1004,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'336','N','N','Y'),(337,1010,'Red blood cells','Urinary',1004,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'337','N','N','Y'),(338,1010,'Yeasts',NULL,NULL,NULL,NULL,NULL,597,NULL,NULL,NULL,NULL,NULL,'338','N','N','Y'),(339,1010,'Crystals',NULL,NULL,NULL,NULL,NULL,588,NULL,NULL,NULL,NULL,NULL,'339','N','N','Y'),(340,1010,'Casts',NULL,NULL,NULL,NULL,NULL,589,NULL,NULL,NULL,NULL,NULL,'340','N','N','Y'),(341,1010,'Crystals',NULL,NULL,NULL,NULL,NULL,588,NULL,NULL,NULL,NULL,NULL,'341','N','N','Y'),(342,1010,'Second identified bacterium',NULL,NULL,NULL,NULL,NULL,586,NULL,NULL,NULL,NULL,NULL,'342','N','N','Y'),(343,1010,'Bacteriuria',NULL,1145,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'343','N','N','Y'),(344,1010,'Culture',NULL,NULL,NULL,NULL,NULL,586,NULL,NULL,NULL,NULL,NULL,'344','N','N','Y'),(345,1010,'Appearance of vaginal sample',NULL,NULL,NULL,NULL,NULL,585,NULL,NULL,NULL,NULL,NULL,'345','N','N','Y'),(346,1010,'Yeast form',NULL,NULL,NULL,NULL,NULL,591,NULL,NULL,NULL,NULL,NULL,'346','N','N','Y'),(347,1010,'Trichomonas vaginalis',NULL,NULL,NULL,NULL,NULL,231,NULL,NULL,NULL,NULL,NULL,'347','N','N','Y'),(348,1010,'Score',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'348','N','N','Y'),(349,1010,'Gram stain','genital samples',NULL,NULL,NULL,NULL,594,NULL,NULL,NULL,NULL,NULL,'349','N','N','Y'),(350,1010,'Red blood cells',NULL,NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'350','N','N','Y'),(351,1010,'Yeast form',NULL,NULL,NULL,NULL,NULL,591,NULL,NULL,NULL,NULL,NULL,'351','N','N','Y'),(352,1010,'Nugent score',NULL,NULL,NULL,NULL,'Score 0-3: Normal flora\nScore 4-6: Intermediate flora\nScore >= 7: Bacterial vaginosis flora',226,NULL,NULL,NULL,NULL,NULL,'352','N','N','Y'),(353,1010,'Gram-negative diplococci',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'353','N','N','Y'),(355,1010,'Cervix appearance',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'355','N','N','Y'),(356,1010,'Yeasts','semi-quantitative (none to very numerous)',NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'356','N','N','Y'),(357,1010,'Identified germ','germ',NULL,NULL,NULL,NULL,592,NULL,NULL,NULL,NULL,NULL,'357','N','N','Y'),(358,1010,'Leukocytes (count)',NULL,NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'358','N','N','Y'),(361,1010,'culture and identification',NULL,NULL,NULL,NULL,NULL,586,NULL,NULL,NULL,NULL,NULL,'361','N','N','Y'),(362,1010,'Red blood cells (count)',NULL,NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'362','N','N','Y'),(363,1010,'Direct examination',NULL,NULL,NULL,NULL,NULL,265,NULL,NULL,NULL,NULL,NULL,'363','N','N','Y'),(364,1010,'Appearance of urethral sample',NULL,NULL,NULL,NULL,NULL,585,NULL,NULL,NULL,NULL,NULL,'364','N','N','Y'),(366,1010,'other',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'366','N','N','Y'),(367,1010,'Appearance of urethral sample',NULL,NULL,NULL,NULL,NULL,585,NULL,NULL,NULL,NULL,NULL,'367','N','N','Y'),(368,1010,'Epithelial cells','semi-quantitative (none to very numerous)',NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'368','N','N','Y'),(369,1010,'Leukocytes',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'369','N','N','Y'),(370,1010,'Culture','Mycobacteria screening',NULL,NULL,NULL,NULL,603,NULL,NULL,NULL,NULL,NULL,'370','N','N','Y'),(371,1010,'semen appearance','free text',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'371','N','N','Y'),(372,1010,'red blood cells','semi-quantitative (none to very numerous)',NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'372','N','N','Y'),(375,1010,'red blood cells','semi-quantitative (none to very numerous)',1146,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'375','N','N','Y'),(376,1010,'CSF appearance',NULL,NULL,NULL,NULL,NULL,596,NULL,NULL,NULL,NULL,NULL,'376','N','N','Y'),(377,1010,'Neutrophils',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'377','N','N','Y'),(378,1010,'Leukocytes',NULL,1146,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'378','N','N','Y'),(379,1010,'Lymphocytes',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'379','N','N','Y'),(380,1010,'Fluid appearance',NULL,NULL,NULL,NULL,NULL,596,NULL,NULL,NULL,NULL,NULL,'380','N','N','Y'),(381,1010,'Neutrophils',NULL,239,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'381','N','N','Y'),(382,1010,'Yeast',NULL,NULL,NULL,NULL,NULL,609,NULL,NULL,NULL,NULL,NULL,'382','N','N','Y'),(383,1010,'Technique',NULL,NULL,NULL,NULL,NULL,631,NULL,NULL,NULL,NULL,NULL,'383','N','N','Y'),(384,1010,'PCR',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'384','N','N','Y'),(385,1010,'Leukocytes',NULL,1146,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'385','N','N','Y'),(386,1010,'Red blood cells',NULL,1146,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'386','N','N','Y'),(387,1010,'Soluble antigen screening',NULL,NULL,NULL,NULL,NULL,595,NULL,NULL,NULL,NULL,NULL,'387','N','N','Y'),(388,1010,'Culture (+ / -)',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'388','N','N','Y'),(389,1010,'Identified germ (bacterium)',NULL,NULL,NULL,NULL,NULL,586,NULL,NULL,NULL,NULL,NULL,'389','N','N','Y'),(390,1010,'Growth delay',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'390','N','N','Y'),(391,1010,'Stool appearance',NULL,NULL,NULL,NULL,NULL,584,NULL,NULL,NULL,NULL,NULL,'391','N','N','Y'),(392,1010,'Leukocytes',NULL,NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'392','N','N','Y'),(393,1010,'Bacterial flora (abundance)',NULL,NULL,NULL,NULL,NULL,583,NULL,NULL,NULL,NULL,NULL,'393','N','N','Y'),(394,1010,'KAOP stool',NULL,NULL,NULL,NULL,NULL,1135,NULL,NULL,NULL,NULL,NULL,'394','N','N','Y'),(395,1010,'Bacterial flora',NULL,NULL,NULL,NULL,NULL,1142,NULL,NULL,NULL,NULL,NULL,'395','N','N','Y'),(396,1010,'Neutrophils',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'396','N','N','Y'),(397,1010,'Lymphocytes',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'397','N','N','Y'),(398,1010,'AFB screening',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'398','N','N','Y'),(399,1010,'Red blood cells',NULL,1146,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'399','N','N','Y'),(400,1010,'Fluid type',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'400','N','N','Y'),(401,1010,'Campylobacter screening and identification',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'401','N','N','Y'),(402,1010,'Anaerobic germ screening and identification',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'402','N','N','Y'),(403,1010,'Spermiogram and spermocytogram:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'403','N','N','Y'),(404,1010,'Post-coital test (Huhner test)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'404','N','N','Y'),(405,1010,'Retrograde ejaculation screening in case of severe hypospermia or anejaculation',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'405','N','N','Y'),(406,1010,'Spermatozoa staining with aniline blue',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'406','N','N','Y'),(407,1010,'Antisperm immunization screening',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'407','N','N','Y'),(408,1010,'Salicylic acid (assay)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'408','N','N','Y'),(409,1010,'Alcohol (ethanol or methanol)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'409','N','N','Y'),(410,1010,'Amphetamine (assay)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'410','N','N','Y'),(411,1010,'Aluminum',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'411','N','N','Y'),(412,1010,'Tricyclic antidepressants (screening)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'412','N','N','Y'),(413,1010,'Barbiturates (screening)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'413','N','N','Y'),(414,1010,'Barbiturates (assay)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'414','N','N','Y'),(415,1010,'Benzodiazepines (screening)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'415','N','N','Y'),(416,1010,'Diazepam and its metabolite (assay)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'416','N','N','Y'),(417,1010,'Digoxin (assay)',NULL,286,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'417','N','N','Y'),(418,1010,'Isoniazid (INH)',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'418','N','N','Y'),(419,1010,'Isoniazid (INH)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'419','N','N','Y'),(420,1010,'Antiretroviral plasma concentration measurement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'420','N','N','Y'),(421,1010,'Carbon monoxide',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'421','N','N','Y'),(422,1010,'Paracetamol (assay)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'422','N','N','Y'),(423,1010,'Lead',NULL,NULL,NULL,NULL,'Technique: Atomic Absorption Spectrophotometry',NULL,NULL,NULL,NULL,NULL,NULL,'423','N','N','Y'),(424,1010,'Quinidine (assay)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'424','N','N','Y'),(425,1010,'Rifampicin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'425','N','N','Y'),(426,1010,'Theophylline',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'426','N','N','Y'),(427,1010,'Arsenic',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'427','N','N','Y'),(428,1010,'Fusidic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'428','N','N','Y'),(429,1010,'Fusidic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'429','N','N','Y'),(430,1010,'Nalidixic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'430','N','N','Y'),(431,1010,'Nalidixic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'431','N','N','Y'),(432,1010,'Oxolinic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'432','N','N','Y'),(433,1010,'Oxolinic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'433','N','N','Y'),(434,1010,'Pipemidic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'434','N','N','Y'),(435,1010,'Pipemidic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'435','N','N','Y'),(436,1010,'Piromidic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'436','N','N','Y'),(437,1010,'Piromidic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'437','N','N','Y'),(438,1010,'Amikacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'438','N','N','Y'),(439,1010,'Amikacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'439','N','N','Y'),(440,1010,'Amoxicillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'440','N','N','Y'),(441,1010,'inhibition diameter','of antibiogram',240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'441','N','N','Y'),(442,1010,'Ampicillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'442','N','N','Y'),(443,1010,'Amoxicillin/clavulanic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'443','N','N','Y'),(444,1010,'Amoxicillin/clavulanic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'444','N','N','Y'),(445,1010,'Ampicillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'445','N','N','Y'),(446,1010,'Ampicillin/sulbactam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'446','N','N','Y'),(447,1010,'Ampicillin/sulbactam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'447','N','N','Y'),(448,1010,'Azithromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'448','N','N','Y'),(449,1010,'Azithromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'449','N','N','Y'),(450,1010,'Aztreonam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'450','N','N','Y'),(451,1010,'Aztreonam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'451','N','N','Y'),(452,1010,'Bacitracin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'452','N','N','Y'),(453,1010,'Bacitracin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'453','N','N','Y'),(454,1010,'Cefaclor',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'454','N','N','Y'),(455,1010,'Cefaclor',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'455','N','N','Y'),(456,1010,'Cefadroxil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'456','N','N','Y'),(457,1010,'Cefadroxil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'457','N','N','Y'),(458,1010,'Cephalexin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'458','N','N','Y'),(459,1010,'Cephalexin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'459','N','N','Y'),(460,1010,'Cephalothin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'460','N','N','Y'),(461,1010,'Cephalothin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'461','N','N','Y'),(462,1010,'Cefamandole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'462','N','N','Y'),(463,1010,'Cefamandole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'463','N','N','Y'),(464,1010,'Cefatrizine',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'464','N','N','Y'),(465,1010,'Cefatrizine',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'465','N','N','Y'),(466,1010,'Cefazolin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'466','N','N','Y'),(467,1010,'Cefazolin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'467','N','N','Y'),(468,1010,'Cefepime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'468','N','N','Y'),(469,1010,'Cefepime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'469','N','N','Y'),(470,1010,'Cefixime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'470','N','N','Y'),(471,1010,'Cefixime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'471','N','N','Y'),(472,1010,'Cefoperazone',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'472','N','N','Y'),(473,1010,'Cefoperazone',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'473','N','N','Y'),(474,1010,'Cefotaxime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'474','N','N','Y'),(475,1010,'Cefotaxime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'475','N','N','Y'),(476,1010,'Cefotetan',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'476','N','N','Y'),(477,1010,'Cefotetan',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'477','N','N','Y'),(478,1010,'Cefotiam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'478','N','N','Y'),(479,1010,'Cefotiam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'479','N','N','Y'),(480,1010,'Cefotiam-hexetil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'480','N','N','Y'),(481,1010,'Cefotiam-hexetil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'481','N','N','Y'),(482,1010,'Cefoxitin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'482','N','N','Y'),(483,1010,'Cefoxitin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'483','N','N','Y'),(484,1010,'Cefpirome',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'484','N','N','Y'),(485,1010,'Cefpirome',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'485','N','N','Y'),(486,1010,'Cefpodoxime-proxetil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'486','N','N','Y'),(487,1010,'Cefpodoxime-proxetil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'487','N','N','Y'),(488,1010,'Cefradine',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'488','N','N','Y'),(489,1010,'Cefradine',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'489','N','N','Y'),(490,1010,'Cefsulodin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'490','N','N','Y'),(491,1010,'Cefsulodin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'491','N','N','Y'),(492,1010,'Ceftazidime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'492','N','N','Y'),(493,1010,'Ceftazidime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'493','N','N','Y'),(494,1010,'Ceftizoxime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'494','N','N','Y'),(495,1010,'Ceftizoxime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'495','N','N','Y'),(496,1010,'Ceftriaxone',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'496','N','N','Y'),(497,1010,'Ceftriaxone',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'497','N','N','Y'),(498,1010,'Cefuroxime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'498','N','N','Y'),(499,1010,'Cefuroxime',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'499','N','N','Y'),(500,1010,'Cefuroxime-axetil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'500','N','N','Y'),(501,1010,'Cefuroxime-axetil',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'501','N','N','Y'),(502,1010,'Chloramphenicol',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'502','N','N','Y'),(503,1010,'Levofloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'503','N','N','Y'),(504,1010,'Ciprofloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'504','N','N','Y'),(505,1010,'Norfloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'505','N','N','Y'),(506,1010,'Clindamycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'506','N','N','Y'),(507,1010,'Clindamycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'507','N','N','Y'),(508,1010,'Colistin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'508','N','N','Y'),(509,1010,'Colistin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'509','N','N','Y'),(510,1010,'Cotrimoxazole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'510','N','N','Y'),(511,1010,'Cotrimoxazole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'511','N','N','Y'),(512,1010,'Dirithromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'512','N','N','Y'),(513,1010,'Dirithromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'513','N','N','Y'),(514,1010,'Doripenem (H)',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'514','N','N','Y'),(515,1010,'Doripenem (H)',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'515','N','N','Y'),(516,1010,'Doxycycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'516','N','N','Y'),(517,1010,'Doxycycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'517','N','N','Y'),(518,1010,'Enoxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'518','N','N','Y'),(519,1010,'Enoxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'519','N','N','Y'),(520,1010,'Ertapenem',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'520','N','N','Y'),(521,1010,'Ertapenem',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'521','N','N','Y'),(522,1010,'Erythromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'522','N','N','Y'),(523,1010,'Erythromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'523','N','N','Y'),(524,1010,'Flumequine',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'524','N','N','Y'),(525,1010,'Flumequine',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'525','N','N','Y'),(526,1010,'Fosfomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'526','N','N','Y'),(527,1010,'Fosfomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'527','N','N','Y'),(528,1010,'Gentamicin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'528','N','N','Y'),(529,1010,'Gentamicin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'529','N','N','Y'),(530,1010,'Imipenem',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'530','N','N','Y'),(531,1010,'Imipenem',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'531','N','N','Y'),(532,1010,'Isepamicin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'532','N','N','Y'),(533,1010,'Isepamicin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'533','N','N','Y'),(534,1010,'Kanamycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'534','N','N','Y'),(535,1010,'Kanamycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'535','N','N','Y'),(536,1010,'Latamoxef',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'536','N','N','Y'),(537,1010,'Latamoxef',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'537','N','N','Y'),(538,1010,'Levofloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'538','N','N','Y'),(539,1010,'Lincomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'539','N','N','Y'),(540,1010,'Linezolid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'540','N','N','Y'),(541,1010,'Linezolid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'541','N','N','Y'),(542,1010,'Lomefloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'542','N','N','Y'),(543,1010,'Lomefloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'543','N','N','Y'),(544,1010,'Loracarbef',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'544','N','N','Y'),(545,1010,'Loracarbef',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'545','N','N','Y'),(546,1010,'Meropenem',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'546','N','N','Y'),(547,1010,'Meropenem',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'547','N','N','Y'),(548,1010,'Metronidazole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'548','N','N','Y'),(549,1010,'Metronidazole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'549','N','N','Y'),(550,1010,'Minocycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'550','N','N','Y'),(551,1010,'Minocycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'551','N','N','Y'),(552,1010,'Moxifloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'552','N','N','Y'),(553,1010,'Moxifloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'553','N','N','Y'),(554,1010,'Mupirocin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'554','N','N','Y'),(555,1010,'Mupirocin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'555','N','N','Y'),(556,1010,'Netilmicin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'556','N','N','Y'),(557,1010,'Netilmicin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'557','N','N','Y'),(558,1010,'Nitroxoline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'558','N','N','Y'),(559,1010,'Nitroxoline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'559','N','N','Y'),(560,1010,'Norfloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'560','N','N','Y'),(561,1010,'Ofloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'561','N','N','Y'),(562,1010,'Ofloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'562','N','N','Y'),(563,1010,'Optochin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'563','N','N','Y'),(564,1010,'Optochin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'564','N','N','Y'),(565,1010,'Oxacillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'565','N','N','Y'),(566,1010,'gentamicin (highly charged)',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'566','N','N','Y'),(567,1010,'Oxytetracycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'567','N','N','Y'),(568,1010,'Oxytetracycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'568','N','N','Y'),(569,1010,'Pefloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'569','N','N','Y'),(570,1010,'Pefloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'570','N','N','Y'),(571,1010,'Penicillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'571','N','N','Y'),(572,1010,'Penicillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'572','N','N','Y'),(573,1010,'Piperacillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'573','N','N','Y'),(574,1010,'Piperacillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'574','N','N','Y'),(575,1010,'Piperacillin/tazobactam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'575','N','N','Y'),(576,1010,'Piperacillin/tazobactam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'576','N','N','Y'),(577,1010,'Pristinamycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'577','N','N','Y'),(578,1010,'Pristinamycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'578','N','N','Y'),(579,1010,'Quinupristin-dalfopristin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'579','N','N','Y'),(580,1010,'Quinupristin-dalfopristin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'580','N','N','Y'),(581,1010,'Rifampicin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'581','N','N','Y'),(582,1010,'Sparfloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'582','N','N','Y'),(583,1010,'Sparfloxacin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'583','N','N','Y'),(584,1010,'Spectinomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'584','N','N','Y'),(585,1010,'Spectinomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'585','N','N','Y'),(586,1010,'Spiramycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'586','N','N','Y'),(587,1010,'Streptomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'587','N','N','Y'),(588,1010,'Streptomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'588','N','N','Y'),(589,1010,'Sulbactam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'589','N','N','Y'),(590,1010,'Sulbactam',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'590','N','N','Y'),(591,1010,'Teicoplanin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'591','N','N','Y'),(592,1010,'Teicoplanin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'592','N','N','Y'),(593,1010,'Telithromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'593','N','N','Y'),(594,1010,'Telithromycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'594','N','N','Y'),(595,1010,'Tetracycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'595','N','N','Y'),(596,1010,'Tetracycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'596','N','N','Y'),(597,1010,'Ticarcillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'597','N','N','Y'),(598,1010,'Ticarcillin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'598','N','N','Y'),(599,1010,'Ticarcillin/clavulanic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'599','N','N','Y'),(600,1010,'Ticarcillin/clavulanic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'600','N','N','Y'),(601,1010,'Tigecycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'601','N','N','Y'),(602,1010,'Tigecycline',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'602','N','N','Y'),(603,1010,'Tobramycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'603','N','N','Y'),(604,1010,'Tobramycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'604','N','N','Y'),(605,1010,'Trimethoprim',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'605','N','N','Y'),(606,1010,'Trimethoprim',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'606','N','N','Y'),(607,1010,'Trimethoprim/sulfamethoxazole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'607','N','N','Y'),(608,1010,'Trimethoprim/sulfamethoxazole',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'608','N','N','Y'),(609,1010,'Vancomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'609','N','N','Y'),(610,1010,'Vancomycin',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'610','N','N','Y'),(611,1010,'Quantification',NULL,NULL,NULL,NULL,NULL,614,NULL,NULL,NULL,NULL,NULL,'611','N','N','Y'),(612,1010,'Culture',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'612','N','N','Y'),(613,1010,'AFB',NULL,NULL,NULL,NULL,NULL,614,NULL,NULL,NULL,NULL,NULL,'613','N','N','Y'),(614,1010,'Species',NULL,NULL,NULL,NULL,NULL,617,NULL,NULL,NULL,NULL,NULL,'614','N','N','Y'),(616,1010,'Smear',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'616','N','N','Y'),(617,1010,'Thick smear',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'617','N','N','Y'),(618,1010,'Schistosomiasis (Bilharzia) haematobium',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'618','N','N','Y'),(619,1010,'Isoniazid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'619','N','N','Y'),(620,1010,'Isoniazid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'620','N','N','Y'),(621,1010,'Ethambutol',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'621','N','N','Y'),(622,1010,'Ethambutol',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'622','N','N','Y'),(623,1010,'Pyrazinamide',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'623','N','N','Y'),(624,1010,'Pyrazinamide',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'624','N','N','Y'),(625,1010,'Referred',NULL,NULL,NULL,NULL,NULL,231,NULL,NULL,NULL,NULL,NULL,'625','N','N','Y'),(627,1010,'Result',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'627','N','N','Y'),(628,1010,'IgM',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'628','N','N','Y'),(629,1010,'IgG',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'629','N','N','Y'),(632,1010,'Type of schistosomiasis',NULL,NULL,NULL,NULL,NULL,642,NULL,NULL,NULL,NULL,NULL,'632','N','N','Y'),(634,1010,'Type',NULL,NULL,NULL,NULL,NULL,644,NULL,NULL,NULL,NULL,NULL,'634','N','N','Y'),(636,1010,'Polar motile bacilli',NULL,NULL,NULL,NULL,NULL,231,NULL,NULL,NULL,NULL,NULL,'636','N','N','Y'),(637,1010,'Curved GNB',NULL,NULL,NULL,NULL,NULL,231,NULL,NULL,NULL,NULL,NULL,'637','N','N','Y'),(638,1010,'Culture',NULL,NULL,NULL,NULL,NULL,265,NULL,NULL,NULL,NULL,NULL,'638','N','N','Y'),(639,1010,'V.cholerae O1',NULL,NULL,NULL,NULL,NULL,231,NULL,NULL,NULL,NULL,NULL,'639','N','N','Y'),(640,1010,'V. cholerae O139',NULL,NULL,NULL,NULL,NULL,231,NULL,NULL,NULL,NULL,NULL,'640','N','N','Y'),(641,1010,'Type of schistosomiasis',NULL,NULL,NULL,NULL,NULL,643,NULL,NULL,NULL,NULL,NULL,'641','N','N','Y'),(642,1010,'India ink staining',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'642','N','N','Y'),(643,1010,'Cryptococcus neoformans',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'643','N','N','Y'),(644,1010,'Red blood cells (CSF)',NULL,241,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'644','N','N','Y'),(645,1010,'India ink staining',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'645','N','N','Y'),(646,1010,'Cryptococcus neoformans',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'646','N','N','Y'),(647,1010,'Red blood cells (CSF)',NULL,1143,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'647','N','N','Y'),(648,1010,'trypanosome species',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'648','N','N','Y'),(649,1010,'Inhibition diameter',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'649','N','N','Y'),(650,1010,'Glucose','PP',282,NULL,'1.6',NULL,228,235,'$_1*5.551',NULL,2,2,'650','N','N','Y'),(651,1010,'glucose (CSF)','CSF',235,'2.50',NULL,NULL,228,NULL,NULL,NULL,2,NULL,'651','N','N','Y'),(652,1010,'Glucose','urine',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'652','N','N','Y'),(653,1010,'Acetone','urine',NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'653','N','N','Y'),(654,1010,'Waaler-Rose',NULL,293,NULL,'30',NULL,227,NULL,NULL,NULL,NULL,NULL,'654','N','N','Y'),(655,1010,'TB GX',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'655','N','N','Y'),(656,1010,'RMP GX',NULL,NULL,NULL,NULL,NULL,1012,NULL,NULL,NULL,NULL,NULL,'656','N','N','Y'),(657,1010,'Thermotolerant coliforms',NULL,1017,NULL,NULL,'0 CFU/100 ml',227,NULL,NULL,NULL,NULL,NULL,'657','N','N','Y'),(658,1010,'Fecal streptococci',NULL,1017,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'658','N','N','Y'),(659,1010,'Total coliforms',NULL,1017,NULL,NULL,'0 CFU per 100 ml in 95% of treated water samples',227,NULL,NULL,NULL,NULL,NULL,'659','N','N','Y'),(660,1010,'LPA TB','Mycobacteria detection result by LPA',NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'660','N','N','Y'),(661,1010,'RMP LPA','Rifampicin susceptibility by LPA',NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'661','N','N','Y'),(662,1010,'INH LPA','INH susceptibility by LPA',NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'662','N','N','Y'),(663,1010,'TB microscopy',NULL,NULL,NULL,NULL,NULL,1033,NULL,NULL,NULL,NULL,NULL,'663','N','N','Y'),(664,1010,'Red blood cells','blood',1143,'4.3','5.7',NULL,228,NULL,NULL,NULL,1,NULL,'664','N','N','Y'),(665,1010,'MCV',NULL,244,'110','128',NULL,227,NULL,NULL,NULL,NULL,NULL,'665','N','N','Y'),(666,1010,'MCH',NULL,245,'36.0','40.0',NULL,229,NULL,NULL,'$_2*10/$_1',1,NULL,'666','N','N','Y'),(667,1010,'MCHC',NULL,239,'30.0','34.0',NULL,228,NULL,NULL,NULL,1,NULL,'667','N','N','Y'),(668,1010,'Neutrophils',NULL,1144,'5.0','17.0',NULL,228,NULL,NULL,NULL,2,NULL,'668','N','N','Y'),(669,1010,'Eosinophils',NULL,1144,'0.1','0.6',NULL,228,NULL,NULL,NULL,2,NULL,'669','N','N','Y'),(670,1010,'Basophils',NULL,1144,'0.0','0.15',NULL,228,NULL,NULL,NULL,2,NULL,'670','N','N','Y'),(671,1010,'Lymphocytes',NULL,1144,'2.5','8.5',NULL,228,NULL,NULL,NULL,2,NULL,'671','N','N','Y'),(672,1010,'Monocytes',NULL,1144,'0.2','1.8',NULL,228,NULL,NULL,NULL,NULL,NULL,'672','N','N','Y'),(673,1010,'Other cells',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'673','N','N','Y'),(674,1010,'Hematocrit',NULL,239,'47.0','65.0',NULL,228,NULL,NULL,NULL,1,NULL,'674','N','N','Y'),(675,1010,'Mean Corpuscular Volume (MCV)',NULL,244,'109','121',NULL,227,NULL,NULL,NULL,NULL,NULL,'675','N','N','Y'),(676,1010,'Mean Corpuscular Hemoglobin (MCH)',NULL,245,'35.0','39.0',NULL,229,NULL,NULL,'$_2*10/$_1',1,NULL,'676','N','N','Y'),(677,1010,'Mean Corpuscular Hemoglobin Concentration (MCHC)',NULL,239,'30.0','34.0',NULL,228,NULL,NULL,NULL,1,NULL,'677','N','N','Y'),(678,1010,'Other cells',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'678','N','N','Y'),(679,1010,'MCH',NULL,245,'33.0','37.0',NULL,228,NULL,NULL,NULL,1,NULL,'679','N','N','Y'),(680,1010,'Mean Corpuscular Hemoglobin (MCH)',NULL,245,'31.0','35.0',NULL,228,NULL,NULL,NULL,1,NULL,'680','N','N','Y'),(681,1010,'Red blood cells',NULL,1143,'3.7','4.8',NULL,228,NULL,NULL,NULL,1,NULL,'681','N','N','Y'),(682,1010,'Platelets',NULL,1144,'160','350',NULL,228,NULL,NULL,NULL,NULL,NULL,'682','N','N','Y'),(683,1010,'Penicillin G',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'683','N','N','Y'),(684,1010,'Amoxicillin/Clavulanic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'684','N','N','Y'),(685,1010,'Nalidixic acid',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'685','N','N','Y'),(686,1010,'Penicillin G',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'686','N','N','Y'),(687,1010,'Disk diffusion method',NULL,NULL,NULL,NULL,NULL,265,NULL,NULL,NULL,NULL,NULL,'687','N','N','Y'),(688,1010,'MIC (E-test)',NULL,NULL,NULL,NULL,NULL,265,NULL,NULL,NULL,NULL,NULL,'688','N','N','Y'),(689,1010,'MIC Cefotaxime',NULL,280,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'689','N','N','Y'),(690,1010,'MIC Cefixime',NULL,280,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'690','N','N','Y'),(691,1010,'MIC Penicillin G',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'691','N','N','Y'),(692,1010,'MIC Amoxicillin',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'692','N','N','Y'),(693,1010,'Cotrimoxazole',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'693','N','N','Y'),(694,1010,'MIC Vancomycin',NULL,280,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'694','N','N','Y'),(695,1010,'Proteins','Aspiration fluid',282,NULL,NULL,'Transudate: < 30g/l\nExudate: > 30g/l',227,NULL,NULL,NULL,NULL,NULL,'695','N','N','Y'),(696,1010,'AFB screening',NULL,NULL,NULL,NULL,NULL,614,NULL,NULL,NULL,NULL,NULL,'696','N','N','Y'),(697,1010,'Syphilis screening (SD Bioline)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'697','N','N','Y'),(698,1010,'Syphilis screening (SD Bioline)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'698','N','N','Y'),(699,1010,'macroscopic appearance','sputum',NULL,NULL,NULL,NULL,598,NULL,NULL,NULL,NULL,NULL,'699','N','N','Y'),(700,1010,'leukocytes/field',NULL,NULL,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'700','N','N','Y'),(701,1010,'Epithelial cells/field',NULL,NULL,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'701','N','N','Y'),(702,1010,'Yeasts',NULL,NULL,NULL,NULL,NULL,599,NULL,NULL,NULL,NULL,NULL,'702','N','N','Y'),(703,1010,'Count',NULL,1145,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'703','N','N','Y'),(704,1010,'Schistocyte screening',NULL,NULL,NULL,NULL,NULL,246,NULL,NULL,NULL,NULL,NULL,'704','N','N','Y'),(705,1010,'Abnormal cell screening',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'705','N','N','Y'),(706,1010,'Monocytes',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'706','N','N','Y'),(707,1010,'Neutrophils',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'707','N','N','Y'),(708,1010,'Eosinophils',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'708','N','N','Y'),(709,1010,'Basophils',NULL,239,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'709','N','N','Y'),(710,1010,'Pus appearance',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'710','N','N','Y'),(711,1010,'Leukocytes/field',NULL,NULL,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'711','N','N','Y'),(712,1010,'Epithelial cells/field',NULL,NULL,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'712','N','N','Y'),(713,1010,'Culture',NULL,NULL,NULL,NULL,NULL,586,NULL,NULL,NULL,NULL,NULL,'713','N','N','Y'),(714,1010,'Material type',NULL,NULL,NULL,NULL,NULL,226,NULL,NULL,NULL,NULL,NULL,'714','N','N','Y'),(715,1,'Result (filariasis)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'715','N','N','Y'),(716,1,'Result (yellow fever)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'716','N','N','Y'),(717,1,'Result (poliomyelitis)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'717','N','N','Y'),(718,1,'IgM (measles)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'718','N','N','Y'),(719,1,'IgG (measles)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'719','N','N','Y'),(720,1,'IgM (rubella)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'720','N','N','Y'),(721,1,'IgG (rubella)',NULL,NULL,NULL,NULL,NULL,635,NULL,NULL,NULL,NULL,NULL,'721','N','N','Y'),(722,1000,'Beta-lactamase',NULL,NULL,NULL,NULL,NULL,600,NULL,NULL,NULL,NULL,NULL,'722','N','N','Y'),(723,1000,'Inhibition diameter Fusidic acid',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'723','N','N','Y'),(724,1000,'Inhibition diameter Nalidixic acid',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'724','N','N','Y'),(725,1000,'Inhibition diameter Amikacin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'725','N','N','Y'),(726,1000,'Inhibition diameter Amoxicillin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'726','N','N','Y'),(727,1000,'Inhibition diameter Amoxicillin/clavulanic acid',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'727','N','N','Y'),(728,1000,'Inhibition diameter Ampicillin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'728','N','N','Y'),(729,1000,'Inhibition diameter Aztreonam',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'729','N','N','Y'),(730,1000,'Inhibition diameter Beta-lactamase',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'730','N','N','Y'),(731,1000,'Inhibition diameter Cephalothin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'731','N','N','Y'),(732,1000,'Inhibition diameter Cefepime',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'732','N','N','Y'),(733,1000,'Inhibition diameter Cefotaxime',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'733','N','N','Y'),(734,1000,'Inhibition diameter Cefoxitin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'734','N','N','Y'),(735,1000,'Inhibition diameter Cefsulodin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'735','N','N','Y'),(736,1000,'Inhibition diameter Ceftazidime',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'736','N','N','Y'),(737,1000,'Inhibition diameter Ceftriaxone',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'737','N','N','Y'),(738,1000,'Inhibition diameter Chloramphenicol',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'738','N','N','Y'),(739,1000,'Inhibition diameter Ciprofloxacin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'739','N','N','Y'),(740,1000,'Inhibition diameter Colistin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'740','N','N','Y'),(741,1000,'Inhibition diameter Cotrimoxazole',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'741','N','N','Y'),(742,1000,'Inhibition diameter Doxycycline',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'742','N','N','Y'),(743,1000,'Inhibition diameter Erythromycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'743','N','N','Y'),(744,1000,'Inhibition diameter Fosfomycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'744','N','N','Y'),(745,1000,'Inhibition diameter Gentamicin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'745','N','N','Y'),(746,1000,'Inhibition diameter Imipenem',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'746','N','N','Y'),(747,1000,'Inhibition diameter Kanamycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'747','N','N','Y'),(748,1000,'Inhibition diameter Lincomycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'748','N','N','Y'),(749,1000,'Inhibition diameter Oxacillin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'749','N','N','Y'),(750,1000,'Inhibition diameter Netilmicin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'750','N','N','Y'),(751,1000,'Inhibition diameter Norfloxacin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'751','N','N','Y'),(752,1000,'Inhibition diameter Pefloxacin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'752','N','N','Y'),(753,1000,'Inhibition diameter Penicillin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'753','N','N','Y'),(754,1000,'Inhibition diameter Piperacillin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'754','N','N','Y'),(755,1000,'Inhibition diameter Piperacillin/tazobactam',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'755','N','N','Y'),(756,1000,'Inhibition diameter Pristinamycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'756','N','N','Y'),(757,1000,'Inhibition diameter Rifamycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'757','N','N','Y'),(758,1000,'Inhibition diameter Tetracycline',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'758','N','N','Y'),(759,1000,'Inhibition diameter Ticarcillin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'759','N','N','Y'),(760,1000,'Inhibition diameter Ticarcillin/clavulanic acid',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'760','N','N','Y'),(761,1000,'Inhibition diameter Tobramycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'761','N','N','Y'),(762,1000,'Inhibition diameter Vancomycin',NULL,240,NULL,NULL,NULL,227,NULL,NULL,NULL,NULL,NULL,'762','N','N','Y'),(763,1000,'MIC Fusidic acid',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'763','N','N','Y'),(764,1000,'MIC Nalidixic acid',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'764','N','N','Y'),(765,1000,'MIC Amikacin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'765','N','N','Y'),(766,1000,'MIC Amoxicillin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'766','N','N','Y'),(767,1000,'MIC Amoxicillin/clavulanic acid',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'767','N','N','Y'),(768,1000,'MIC Ampicillin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'768','N','N','Y'),(769,1000,'MIC Aztreonam',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'769','N','N','Y'),(770,1000,'MIC Beta-lactamase',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'770','N','N','Y'),(771,1000,'MIC Cephalothin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'771','N','N','Y'),(772,1000,'MIC Cefepime',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'772','N','N','Y'),(773,1000,'MIC Cefotaxime',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'773','N','N','Y'),(774,1000,'MIC Cefoxitin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'774','N','N','Y'),(775,1000,'MIC Cefsulodin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'775','N','N','Y'),(776,1000,'MIC Ceftazidime',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'776','N','N','Y'),(777,1000,'MIC Ceftriaxone',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'777','N','N','Y'),(778,1000,'MIC Chloramphenicol',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'778','N','N','Y'),(779,1000,'MIC Ciprofloxacin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'779','N','N','Y'),(780,1000,'MIC Colistin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'780','N','N','Y'),(781,1000,'MIC Cotrimoxazole',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'781','N','N','Y'),(782,1000,'MIC Doxycycline',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'782','N','N','Y'),(783,1000,'MIC Erythromycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'783','N','N','Y'),(784,1000,'MIC Fosfomycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'784','N','N','Y'),(785,1000,'MIC Gentamicin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'785','N','N','Y'),(786,1000,'MIC Imipenem',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'786','N','N','Y'),(787,1000,'MIC Kanamycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'787','N','N','Y'),(788,1000,'MIC Lincomycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'788','N','N','Y'),(789,1000,'MIC Oxacillin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'789','N','N','Y'),(790,1000,'MIC Netilmicin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'790','N','N','Y'),(791,1000,'MIC Norfloxacin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'791','N','N','Y'),(792,1000,'MIC Pefloxacin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'792','N','N','Y'),(793,1000,'MIC Penicillin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'793','N','N','Y'),(794,1000,'MIC Piperacillin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'794','N','N','Y'),(795,1000,'MIC Piperacillin/tazobactam',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'795','N','N','Y'),(796,1000,'MIC Pristinamycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'796','N','N','Y'),(797,1000,'MIC Rifamycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'797','N','N','Y'),(798,1000,'MIC Tetracycline',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'798','N','N','Y'),(799,1000,'MIC Ticarcillin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'799','N','N','Y'),(800,1000,'MIC Ticarcillin/clavulanic acid',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'800','N','N','Y'),(801,1000,'MIC Tobramycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'801','N','N','Y'),(802,1000,'MIC Vancomycin',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,NULL,NULL,'802','N','N','Y'),(803,1000,'Detection of SARS-CoV-2 (COVID 19) RNA by RT-PCR',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'803','N','N','Y'),(804,1000,'Detection of SARS-CoV-2 (COVID 19) RNA by RT-LAMP',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'804','N','N','Y'),(805,1000,'Cycle threshold',NULL,1177,'0','45',NULL,228,NULL,NULL,NULL,1,NULL,'805','N','N','Y'),(806,1000,'SARS-CoV-2 (COVID 19) antigen screening',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'806','N','N','Y'),(807,1000,'Anti-SARS-CoV-2 (COVID 19) antibody screening',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'807','N','N','Y'),(808,1000,'Anti-SARS-CoV-2 (COVID 19) antibody titration',NULL,NULL,NULL,NULL,NULL,228,NULL,NULL,NULL,2,NULL,'808','N','N','Y'),(809,1000,'Western Blot confirmation test','HIV Confirmation',NULL,NULL,NULL,NULL,625,NULL,NULL,NULL,NULL,NULL,'809','N','N','Y'),(810,1000,'RT-PCR',NULL,NULL,NULL,NULL,NULL,230,NULL,NULL,NULL,NULL,NULL,'810','N','N','Y'),(811,1000,'Cycle threshold',NULL,1177,'0','1000000',NULL,228,NULL,NULL,NULL,1,NULL,'811','N','N','Y'),(812,1000,'Phenotype',NULL,NULL,NULL,NULL,NULL,1188,NULL,NULL,NULL,NULL,NULL,'812','N','N','Y'),(813,1000,'Anthrax bacillus detection by PCR',NULL,NULL,NULL,NULL,'Detection of Bacillus anthracis DNA by PCR',230,NULL,NULL,NULL,NULL,NULL,'813','N','N','Y'),(814,1000,'Detection of Dengue virus RNA by RT-PCR',NULL,NULL,NULL,NULL,'',230,NULL,NULL,NULL,NULL,NULL,'814','N','N','Y'),(815,1000,'Detection of Dengue NS1 antigen',NULL,NULL,NULL,NULL,'',230,NULL,NULL,NULL,NULL,NULL,'815','N','N','Y'),(816,1000,'Anti-Dengue antibody screening',NULL,NULL,NULL,NULL,'',230,NULL,NULL,NULL,NULL,NULL,'816','N','N','Y'),(817,1000,'Anti-rabies IgG and IgM antibody screening',NULL,NULL,NULL,NULL,'',230,NULL,NULL,NULL,NULL,NULL,'817','N','N','Y'),(818,1000,'Rabies virus genome screening',NULL,NULL,NULL,NULL,'',230,NULL,NULL,NULL,NULL,NULL,'818','N','N','Y'),(819,1000,'Influenza A and B virus genome detection',NULL,NULL,NULL,NULL,'',230,NULL,NULL,NULL,NULL,NULL,'819','N','N','Y'),(820,1000,'Ebola virus detection by Oraquick rapid test',NULL,NULL,NULL,NULL,'',230,NULL,NULL,NULL,NULL,NULL,'820','N','N','Y'),(821,1,'IMP1','',0,'','','',226,0,'','',0,0,'821','N','N','Y'),(822,1,'KPC','',0,'','','',226,0,'','',0,0,'822','N','N','Y'),(823,1,'NDM','',0,'','','',226,0,'','',0,0,'823','N','N','Y'),(824,1,'OXA48','',0,'','','',226,0,'','',0,0,'824','N','N','Y'),(825,1,'VIM','',0,'','','',226,0,'','',0,0,'825','N','N','Y'),(826,1,'Xpert HBV Viral Load','',0,'','','',226,0,'','',0,0,'826','N','N','Y'),(827,1,'HIV-1','',0,'','','',226,0,'','',0,0,'827','N','N','Y'),(828,1,'QC','',0,'','','',226,0,'','',0,0,'828','N','N','Y'),(829,1,'Xpert HIV-1 Viral Load XC','',0,'','','',226,0,'','',0,0,'829','N','N','Y'),(830,1,'MTB','',0,'','','',226,0,'','',0,0,'830','N','N','Y'),(831,1,'MTB Trace','',0,'','','',226,0,'','',0,0,'831','N','N','Y'),(832,1,'RIF Resistance','',0,'','','',226,0,'','',0,0,'832','N','N','Y'),(833,1,'Xpert Xpress SARS-CoV-2','',0,'','','',226,0,'','',0,0,'833','N','N','Y'),(834,1,'IMP','',0,'','','',226,0,'','',0,0,'834','N','N','Y'),(835,1,'Xpert_HIV-1 Viral Load','',0,'','','',226,0,'','',0,0,'835','N','N','Y'),(836,1,'Red blood cells','',241,'4.0','5.7','',228,0,'','',1,0,'RBC','N','N','Y'),(837,1,'Blood count','',0,'','','',265,0,'','',0,0,'837','N','N','Y'),(838,1,'Hemoglobin','',243,'12.0','17.0','',228,0,'','',1,0,'HGB','N','N','Y'),(839,1,'Hematocrit','',239,'36.0','52.0','',228,0,'','',1,0,'HCT','N','N','Y'),(840,1,'MCV','',244,'80.0','100.0','',228,0,'','',1,0,'MCV','N','N','Y'),(841,1,'MCH','',245,'26.0','34.0','',228,0,'','',1,0,'MCH','N','N','Y'),(842,1,'MCHC','',246,'31.0','37.0','',228,0,'','',1,0,'MCHC','N','N','Y'),(843,1,'White blood cells','',242,'4.0','10.0','',228,0,'','',1,0,'WBC','N','N','Y'),(844,1,'Platelets','',240,'150.0','400.0','',228,0,'','',0,0,'PLT','N','N','Y'),(845,1,'P.L.C.R','',0,'','','',228,0,'','',1,0,'845','N','N','Y'),(846,1,'MPV','',247,'7.0','11.0','',228,0,'','',1,0,'MPV','N','N','Y'),(847,1,'Thrombocrit','',0,'','','',228,0,'','',1,0,'PCT','N','N','Y'),(848,1,'PDW','',0,'','','',228,0,'','',1,0,'PDW','N','N','Y'),(849,1,'RDW-SD','',0,'','','',228,0,'','',1,0,'RDW-SD','N','N','Y'),(850,1,'RDW-CV','',0,'','','',228,0,'','',1,0,'RDW-CV','N','N','Y'),(851,1,'Neutrophils#','',242,'','','',228,0,'','',1,0,'NEUT#','N','N','Y'),(852,1,'Lymphocytes#','',242,'','','',228,0,'','',1,0,'LYMPH#','N','N','Y'),(853,1,'Monocytes#','',242,'','','',228,0,'','',1,0,'MONO#','N','N','Y'),(854,1,'Eosinophils#','',242,'','','',228,0,'','',1,0,'EO#','N','N','Y'),(855,1,'Basophils#','',242,'','','',228,0,'','',1,0,'BASO#','N','N','Y'),(856,1,'Neutrophils%','',0,'','','',228,0,'','',1,0,'NEUT%','N','N','Y'),(857,1,'Lymphocytes%','',0,'','','',228,0,'','',1,0,'LYMPH%','N','N','Y'),(858,1,'Monocytes%','',0,'','','',228,0,'','',1,0,'MONO%','N','N','Y'),(859,1,'Eosinophils%','',0,'','','',228,0,'','',1,0,'EO%','N','N','Y'),(860,1,'Basophils%','',0,'','','',228,0,'','',1,0,'BASO%','N','N','Y'),(861,1,'Immature granulocytes#','',242,'','','',228,0,'','',1,0,'IG#','N','N','Y'),(862,1,'Immature granulocytes%','',0,'','','',228,0,'','',1,0,'IG%','N','N','Y'),(863,1,'NRBC#','',242,'','','',228,0,'','',1,0,'846','N','N','Y'),(864,1,'NRBC%','',0,'','','',228,0,'','',1,0,'NRBC%','N','N','Y'),(865,1,'RET#','',242,'','','',228,0,'','',1,0,'849','N','N','Y'),(866,1,'RET%','',0,'','','',228,0,'','',1,0,'RET%','N','N','Y'),(867,1,'IRF','',0,'','','',228,0,'','',1,0,'852','N','N','Y'),(868,1,'LFR','',0,'','','',228,0,'','',1,0,'LFR','N','N','Y'),(869,1,'MFR','',0,'','','',228,0,'','',1,0,'MFR','N','N','Y'),(870,1,'HFR','',0,'','','',228,0,'','',1,0,'HFR','N','N','Y'),(871,1,'Delta-He','',0,'','','',228,0,'','',1,0,'863','N','N','Y'),(872,1,'RET-He','',0,'','','',228,0,'','',1,0,'864','N','N','Y'),(873,1,'RBC-He','',0,'','','',228,0,'','',1,0,'868','N','N','Y'),(874,1,'Hypo-He','',0,'','','',228,0,'','',1,0,'857','N','N','Y'),(875,1,'Hyper-He','',0,'','','',228,0,'','',1,0,'858','N','N','Y'),(876,1,'Hypo% (HGB<17)','',0,'','','',228,0,'','',1,0,'881','N','N','Y'),(877,1,'Hyper% (HGB>41)','',0,'','','',228,0,'','',1,0,'882','N','N','Y'),(878,1,'MicroR','',0,'','','',228,0,'','',1,0,'886','N','N','Y'),(879,1,'MacroR','',0,'','','',228,0,'','',1,0,'887','N','N','Y'),(880,1,'Immature Platelet Fraction','',0,'','','',228,0,'','',1,0,'898','N','N','Y'),(881,1,'Immature Platelet Count','',0,'','','',228,0,'','',1,0,'910','N','N','Y');
/*!40000 ALTER TABLE `sigl_07_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_07_data_test`
--

DROP TABLE IF EXISTS `sigl_07_data_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_07_data_test` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `libelle` varchar(120) DEFAULT NULL,
  `description` varchar(120) DEFAULT NULL,
  `unite` int unsigned DEFAULT NULL,
  `normal_min` varchar(20) DEFAULT NULL,
  `normal_max` varchar(20) DEFAULT NULL,
  `commentaire` text,
  `type_resultat` int unsigned DEFAULT NULL,
  `unite2` int unsigned DEFAULT NULL,
  `formule_unite2` varchar(120) DEFAULT NULL,
  `formule` varchar(120) DEFAULT NULL,
  `accuracy` int unsigned DEFAULT NULL,
  `precision2` int unsigned DEFAULT NULL,
  `code_var` varchar(10) DEFAULT NULL,
  `var_highlight` varchar(1) NOT NULL DEFAULT 'N',
  `var_show_minmax` varchar(1) NOT NULL DEFAULT 'N',
  `var_in_report` varchar(1) NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `code_var` (`code_var`),
  KEY `sigl_07_data_ibfk_1` (`id_owner`),
  KEY `sigl_07_data_ibfk_2` (`unite`),
  KEY `sigl_07_data_ibfk_3` (`type_resultat`),
  KEY `sigl_07_data_ibfk_4` (`unite2`),
  KEY `idx_label` (`libelle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_07_data_test`
--

LOCK TABLES `sigl_07_data_test` WRITE;
/*!40000 ALTER TABLE `sigl_07_data_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_07_data_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_08_data`
--

DROP TABLE IF EXISTS `sigl_08_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_08_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `code` varchar(7) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nom` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `prenom` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `ville` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `etablissement` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `specialite` int unsigned DEFAULT NULL,
  `tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `titre` int unsigned DEFAULT NULL,
  `initiale` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `service` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `adresse` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `doc_zipcity` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '',
  `doc_agreement` varchar(1) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  KEY `id_owner` (`id_owner`),
  KEY `sigl_08_data_ibfk_2` (`specialite`),
  KEY `idx_name` (`nom`),
  KEY `idx_fname` (`prenom`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_08_data`
--

LOCK TABLES `sigl_08_data` WRITE;
/*!40000 ALTER TABLE `sigl_08_data` DISABLE KEYS */;
INSERT INTO `sigl_08_data` VALUES (1,1,'DEMO','PRESCR','Patrick','','',204,'','',260,'PP','','','','','','N');
/*!40000 ALTER TABLE `sigl_08_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_09_data`
--

DROP TABLE IF EXISTS `sigl_09_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_09_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_analyse` int unsigned NOT NULL,
  `ref_variable` int unsigned NOT NULL,
  `valeur` varchar(120) DEFAULT NULL,
  `obligatoire` int DEFAULT '4',
  `res_recovery` varchar(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `Unique` (`id_analyse`,`ref_variable`),
  KEY `sigl_09_data_ibfk_1` (`id_owner`),
  KEY `sigl_09_data_ibfk_2` (`id_analyse`),
  KEY `sigl_09_data_ibfk_3` (`ref_variable`),
  KEY `idx_refvar_val_analyse` (`ref_variable`,`valeur`,`id_analyse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_09_data`
--

LOCK TABLES `sigl_09_data` WRITE;
/*!40000 ALTER TABLE `sigl_09_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_09_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_09_deleted`
--

DROP TABLE IF EXISTS `sigl_09_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_09_deleted` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_owner` int NOT NULL,
  `id_analyse` int unsigned NOT NULL,
  `ref_variable` int unsigned NOT NULL,
  `valeur` varchar(120) DEFAULT NULL,
  `obligatoire` int DEFAULT '4',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `Unique` (`id_analyse`,`ref_variable`),
  KEY `sigl_09_data_ibfk_1` (`id_owner`),
  KEY `sigl_09_data_ibfk_2` (`id_analyse`),
  KEY `sigl_09_data_ibfk_3` (`ref_variable`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_09_deleted`
--

LOCK TABLES `sigl_09_deleted` WRITE;
/*!40000 ALTER TABLE `sigl_09_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_09_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_10_data`
--

DROP TABLE IF EXISTS `sigl_10_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_10_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_resultat` int unsigned DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `utilisateur` int unsigned NOT NULL,
  `valeur` varchar(120) DEFAULT NULL,
  `type_validation` int unsigned DEFAULT NULL,
  `commentaire` text,
  `motif_annulation` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `FK_sigl_10_data_1` (`id_owner`),
  KEY `FK_sigl_10_data_2` (`id_resultat`),
  KEY `FK_sigl_10_data_4` (`type_validation`),
  KEY `FK_sigl_10_data_3` (`utilisateur`),
  KEY `FK_sigl_10_data_5` (`motif_annulation`),
  KEY `idx_date_vld` (`date_validation`),
  KEY `idx_res_vld` (`id_resultat`,`type_validation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_10_data`
--

LOCK TABLES `sigl_10_data` WRITE;
/*!40000 ALTER TABLE `sigl_10_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_10_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_10_deleted`
--

DROP TABLE IF EXISTS `sigl_10_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_10_deleted` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_owner` int NOT NULL,
  `id_resultat` int unsigned DEFAULT NULL,
  `date_validation` datetime NOT NULL,
  `utilisateur` int unsigned NOT NULL,
  `valeur` varchar(120) DEFAULT NULL,
  `type_validation` int unsigned DEFAULT NULL,
  `commentaire` text,
  `motif_annulation` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `FK_sigl_10_data_1` (`id_owner`),
  KEY `FK_sigl_10_data_2` (`id_resultat`),
  KEY `FK_sigl_10_data_4` (`type_validation`),
  KEY `FK_sigl_10_data_3` (`utilisateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_10_deleted`
--

LOCK TABLES `sigl_10_deleted` WRITE;
/*!40000 ALTER TABLE `sigl_10_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_10_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_11_data`
--

DROP TABLE IF EXISTS `sigl_11_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_11_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `id_dos` int unsigned NOT NULL,
  `file` varchar(36) NOT NULL,
  `file_type` int unsigned DEFAULT NULL,
  `doc_type` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  `id_tpl` int DEFAULT '0',
  `nb_download` int DEFAULT '0',
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `Unique` (`file`),
  KEY `sigl_11_data_ibfk_1` (`id_owner`),
  KEY `sigl_11_data_ibfk_2` (`id_dos`),
  KEY `sigl_11_data_ibfk_3` (`file_type`),
  KEY `sigl_11_data_ibfk_4` (`doc_type`),
  KEY `idx_file` (`file`),
  KEY `idx_id_tpl` (`id_tpl`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_11_data`
--

LOCK TABLES `sigl_11_data` WRITE;
/*!40000 ALTER TABLE `sigl_11_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_11_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_11_deleted`
--

DROP TABLE IF EXISTS `sigl_11_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_11_deleted` (
  `id_data` int NOT NULL AUTO_INCREMENT,
  `id_owner` int NOT NULL,
  `id_dos` int unsigned NOT NULL,
  `file` varchar(36) NOT NULL,
  `file_type` int unsigned DEFAULT NULL,
  `doc_type` int unsigned DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id_data`),
  UNIQUE KEY `Unique` (`file`),
  KEY `sigl_11_data_ibfk_1` (`id_owner`),
  KEY `sigl_11_data_ibfk_2` (`id_dos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_11_deleted`
--

LOCK TABLES `sigl_11_deleted` WRITE;
/*!40000 ALTER TABLE `sigl_11_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_11_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_14_data`
--

DROP TABLE IF EXISTS `sigl_14_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_14_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL DEFAULT '100',
  `surveillance` varchar(150) DEFAULT NULL,
  `nature_prel` int unsigned DEFAULT NULL,
  `dhis2_tab` varchar(25) DEFAULT NULL,
  `dhis2_tab_num` int DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `sigl_14_data_owner` (`id_owner`),
  KEY `sigl_14_data_nature_prel_dico` (`nature_prel`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_14_data`
--

LOCK TABLES `sigl_14_data` WRITE;
/*!40000 ALTER TABLE `sigl_14_data` DISABLE KEYS */;
INSERT INTO `sigl_14_data` VALUES (113,1,'Meningitis',99,'Meningitis',1),(114,1,'Cholera',141,'Cholera',2),(115,1,'Shigellosis',141,'Shigellosis',3),(116,1,'Salmonellosis',141,NULL,NULL),(117,1,'Malaria',138,'Malaria',5),(118,1,'Tuberculosis',163,'Tuberculosis',4),(119,1,'HIV/AIDS (Rapid test)',138,'HIV/AIDS',8),(120,1,'HIV/AIDS (Automated)',138,NULL,NULL),(121,1,'HIV/AIDS (CD4 - CD8)',138,NULL,NULL),(122,1,'STI (blood sample)',138,'STI',6),(123,1,'STI (vaginal swab)',162,NULL,NULL),(124,1,'STI (urethral swab)',152,NULL,NULL),(125,1,'Yellow fever',138,NULL,NULL),(126,1,'Measles',138,NULL,NULL),(127,1,'Rubella',138,NULL,NULL),(128,1,'Toxoplasmosis',138,NULL,NULL),(129,1,'Poliomyelitis',141,NULL,NULL),(130,1,'Schistosomiasis (urine sample)',153,NULL,NULL),(131,1,'Schistosomiasis (stool sample)',141,NULL,NULL),(132,1,'Filariasis',138,NULL,NULL),(133,1,NULL,NULL,'Schistosomiasis',7);
/*!40000 ALTER TABLE `sigl_14_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_15_data`
--

DROP TABLE IF EXISTS `sigl_15_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_15_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL DEFAULT '100',
  `nom_amont` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `formule` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `id_surveillance` int unsigned DEFAULT NULL,
  `libelle_ind` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `methode_calcul` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `label_dhis2` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `label_exp_dhis2` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dhis2_pos` int DEFAULT NULL,
  `id_surveillance_dhis2` int unsigned DEFAULT NULL,
  `nature_prel` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `sigl_15_data_owner` (`id_owner`),
  KEY `sigl_15_data_id_surveillance_surveillance` (`id_surveillance`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_15_data`
--

LOCK TABLES `sigl_15_data` WRITE;
/*!40000 ALTER TABLE `sigl_15_data` DISABLE KEYS */;
INSERT INTO `sigl_15_data` VALUES (1,1,'Gram stain','$_333 = 495',113,'No germ present',NULL,NULL,NULL,NULL,NULL,99),(2,1,'Gram stain','$_333 = [gram.21]',113,'GN Diplococci',NULL,'Gram-negative diplococci','Gram-negative diplococci',10,113,99),(3,1,'Gram stain','$_333 = [gram.20]',113,'GP Diplococci',NULL,'Gram-positive diplococci','Gram-positive diplococci',11,113,99),(4,1,'Gram stain','$_333 = [gram.2]',113,'GN Bacilli',NULL,'Gram-negative bacilli','Polymorphic Gram-negative bacilli',12,113,99),(5,1,'Gram stain','$_333 NOT IN (495,496,514,515)',113,'Other',NULL,NULL,NULL,NULL,NULL,99),(6,1,'Culture','$_344 NOT IN ([bacterie.7], [bacterie.8], [bacterie.9], [bacterie.10], [bacterie.11], [bacterie.12], [bacterie.13], [bacterie.29], [bacterie.14], [bacterie.15])',113,'Negative',NULL,'Total -','Total (-) (Meningitis)',2,113,99),(7,1,'Culture','$_344 IN ([bacterie.7], [bacterie.8], [bacterie.9], [bacterie.10], [bacterie.11], [bacterie.12], [bacterie.13], [bacterie.29], [bacterie.14], [bacterie.15])',113,'Positive',NULL,'Total +','Total (+) (Meningitis)',3,113,99),(8,1,'Culture','$_344 = [bacterie.29]',113,'Pneumococcus',NULL,'Pneumococcus','Pneumococcus',8,113,99),(9,1,'Culture','$_344 = [bacterie.7]',113,'Meningococcus',NULL,NULL,NULL,NULL,NULL,99),(10,1,'Culture','$_344 = [bacterie.8]',113,'Meningococcus A',NULL,'Meningococcus A','Meningococcus A',4,113,99),(11,1,'Culture','$_344 = [bacterie.9]',113,'Meningococcus B',NULL,'Meningococcus B','Meningococcus B',5,113,99),(12,1,'Culture','$_344 = [bacterie.10]',113,'Meningococcus C',NULL,'Meningococcus C','Meningococcus C',6,113,99),(13,1,'Culture','$_344 = [bacterie.12]',113,'Meningococcus X',NULL,NULL,NULL,NULL,NULL,99),(14,1,'Culture','$_344 = [bacterie.13]',113,'Meningococcus Y',NULL,NULL,NULL,NULL,NULL,99),(15,1,'Culture','$_344 = [bacterie.11]',113,'Meningococcus W135',NULL,'Meningococcus W135','Meningococcus W135',7,113,99),(16,1,'Culture','$_344 = [bacterie.15]',113,'Hib',NULL,'Hib','Hib',9,113,99),(17,1,'PCR','$_384 = [posneg.-]',113,'Negative',NULL,NULL,NULL,NULL,NULL,99),(18,1,'PCR','$_384 = [posneg.+]',113,'Positive',NULL,NULL,NULL,NULL,NULL,99),(19,1,'Latex','$_387 = [latex.11]',113,'Negative',NULL,NULL,NULL,NULL,NULL,99),(20,1,'Latex','$_387 != [latex.11]',113,'Positive',NULL,NULL,NULL,NULL,NULL,99),(21,1,'Latex','$_387 = [latex.12]',113,'Pneumococcus',NULL,NULL,NULL,NULL,NULL,99),(22,1,'Latex','$_387 = [latex.5]',113,'Meningococcus A',NULL,NULL,NULL,NULL,NULL,99),(23,1,'Latex','$_387 = [latex.6]',113,'Meningococcus B',NULL,NULL,NULL,NULL,NULL,99),(24,1,'Latex','$_387 = [latex.7]',113,'Meningococcus C',NULL,NULL,NULL,NULL,NULL,99),(25,1,'Latex','$_387 = [latex.8]',113,'Meningococcus X',NULL,NULL,NULL,NULL,NULL,99),(26,1,'Latex','$_387 = [latex.9]',113,'Meningococcus Y',NULL,NULL,NULL,NULL,NULL,99),(27,1,'Latex','$_387 = [latex.10]',113,'Meningococcus W135',NULL,NULL,NULL,NULL,NULL,99),(28,1,'Latex','$_387 = [latex.13]',113,'Hib',NULL,NULL,NULL,NULL,NULL,99),(29,1,'Direct examination','$_636 = [yorn.1]',114,'Polar motile bacilli',NULL,NULL,NULL,NULL,NULL,141),(30,1,'Direct examination','$_637 = [yorn.1]',114,'Curved GNB',NULL,NULL,NULL,NULL,NULL,141),(31,1,'Culture','$_639 != [yorn.1] AND $_640 != [yorn.1]',114,'Negative',NULL,NULL,NULL,NULL,NULL,141),(32,1,'Culture','$_639 = [yorn.1] OR $_640 = [yorn.1]',114,'Positive',NULL,'Total (+) for vibrio','Total (+) for vibrio',4,114,141),(33,1,'Culture','$_639 = [yorn.1]',114,'V. cholerae O1',NULL,'V. cholerae O1','V. cholerae O1',5,114,141),(34,1,'Culture','$_640 = [yorn.1]',114,'V. cholerae O139',NULL,'V. cholerae O139','V. cholerae O139',6,114,141),(35,1,'Culture','$_344 NOT IN ([bacterie.25], [bacterie.26], [bacterie.27], [bacterie.28])',115,'Negative',NULL,NULL,NULL,NULL,NULL,141),(36,1,'Culture','$_344 IN ([bacterie.25], [bacterie.26], [bacterie.27], [bacterie.28])',115,'Positive',NULL,'Total (+) for Shigella','Total (+) for Shigella',4,115,141),(37,1,'Culture','$_344 = [bacterie.25]',115,'S. dysenteriae',NULL,'Shigella dysenteriae','Shigella dysenteriae',5,115,141),(38,1,'Culture','$_344 IN ([bacterie.26], [bacterie.27], [bacterie.28])',115,'Other Shigella',NULL,'Other Shigella','Other Shigella',6,115,141),(39,1,'Culture','$_344 IN ([bacterie.1],[bacterie.2])',116,'Negative',NULL,NULL,NULL,NULL,NULL,141),(40,1,'Culture','$_344 NOT IN ([bacterie.1],[bacterie.2])',116,'Positive',NULL,NULL,NULL,NULL,NULL,141),(41,1,'Culture','$_344 = [bacterie.21]',116,'S. Typhi',NULL,NULL,NULL,NULL,NULL,141),(42,1,'Culture','$_344 IN ([bacterie.22],[bacterie.23],[bacterie.24])',116,'S. paratyphi',NULL,NULL,NULL,NULL,NULL,141),(43,1,'Culture','$_344 = [bacterie.48]',116,'Other salmonellosis',NULL,NULL,NULL,NULL,NULL,141),(44,1,'Thick/thin smear','$_316 != [posnegind.Positif]',117,'Negative',NULL,'Total (-)','Total (-) (Malaria)',2,117,138),(45,1,'Thick/thin smear','$_316 = [posnegind.Positif]',117,'Positive',NULL,'Total (+)','Total (+) (Malaria)',3,117,138),(46,1,'Thick/thin smear','$_614 = [especepalu.pl_falc]',117,'P. falciparum',NULL,'P. falciparum','P. falciparum',4,117,138),(47,1,'Thick/thin smear','$_614 = [especepalu.autres]',117,'Other species',NULL,'Other species','Other species',5,117,138),(48,1,'RDT','$_252 = [posnegind.Négatif]',117,'Negative',NULL,NULL,NULL,NULL,NULL,138),(49,1,'RDT','$_252 = [posnegind.Positif]',117,'Positive',NULL,NULL,NULL,NULL,NULL,138),(50,1,'RDT','$_253 = [especepalu.pl_falc]',117,'P. falciparum',NULL,NULL,NULL,NULL,NULL,138),(51,1,'RDT','$_253 != [especepalu.pl_falc]',117,'Other species',NULL,NULL,NULL,NULL,NULL,138),(52,1,'AFB screening','$_611 = [baar.-]',118,'Negative',NULL,'Total (-)','Total (-) (Tuberculosis)',2,118,50),(53,1,'AFB screening','$_611 IN ([baar.+], [baar.++], [baar.+++])',118,'Positive (1-9 AFB)',NULL,'Total (+)','Total (+) (Tuberculosis)',3,118,50),(54,1,'AFB screening','$_611 = [baar.+]',118,'Positive (+)',NULL,'Total AFB +','Total AFB +',5,118,50),(55,1,'AFB screening','$_611 = [baar.++]',118,'Positive (++)',NULL,'Total AFB ++','Total AFB ++',6,118,50),(56,1,'AFB screening','$_611 = [baar.+++]',118,'Positive (+++)',NULL,'Total AFB +++','Total AFB +++',7,118,50),(57,1,'Culture','$_612 = [posneg.-]',118,'Negative',NULL,NULL,NULL,NULL,NULL,50),(58,1,'Culture','$_612 = [posneg.+]',118,'Positive',NULL,NULL,NULL,NULL,NULL,50),(59,1,'Serological diagnosis','$_278 = [vih.neg]',119,'Negative',NULL,'Total (-)','Total (-) (HIV)',2,119,138),(60,1,'Serological diagnosis','$_278 IN ([vih.vih1], [vih.vih2], [vih.vih1-vih2])',119,'Total positive',NULL,'Total (+)','Total (+) (HIV)',3,119,138),(61,1,'Serological diagnosis','$_278 = [vih.vih1]',119,'HIV-1',NULL,'HIV-1','HIV-1',5,119,138),(62,1,'Serological diagnosis','$_278 = [vih.vih2]',119,'HIV-2',NULL,'HIV-2','HIV-2',6,119,138),(63,1,'Serological diagnosis','$_278 = [vih.vih1-vih2]',119,'HIV-1 & 2',NULL,'HIV-1/2','HIV-1/2',7,119,138),(64,1,'Serological diagnosis','$_278 = [vih.ind]',119,'Indeterminate',NULL,NULL,NULL,NULL,NULL,138),(65,1,'Early diagnosis (PCR)','$_279 = [vih.neg] AND $_280 = [vih.neg]',120,'Negative',NULL,NULL,NULL,NULL,NULL,138),(66,1,'Early diagnosis (PCR)','$_279 NOT IN ([vih.neg], [vih.ind]) OR $_280 NOT IN ([vih.neg], [vih.ind])',120,'Positive',NULL,NULL,NULL,NULL,NULL,138),(67,1,'Biological monitoring','$_179 < 500',121,'Total CD4',NULL,NULL,NULL,NULL,NULL,138),(68,1,'Biological monitoring','$_284',121,'Total VL',NULL,NULL,NULL,NULL,NULL,138),(69,1,'RPR','$_229 = [posneg.+]',122,'Total RPR+',NULL,NULL,NULL,NULL,NULL,138),(70,1,'TPHA','$_231 = [posneg.+]',122,'Total TPHA+',NULL,NULL,NULL,NULL,NULL,138),(71,1,'RPR and TPHA','$_229 = [posneg.+] AND $_231 = [posneg.+]',122,'Total RPR & TPHA+',NULL,'Syphilis serology (+) (RPR + TPHA)','Syphilis serology (+) (RPR + TPHA)',22,122,138),(72,1,'Chlamydia','N/A',122,'Total Chlamydia+',NULL,'Chlamydia serology (+)','Chlamydia serology (+)',23,122,138),(73,1,'Direct examination','$_353  = [absent.present]',123,'Gram-negative diplococci',NULL,'Gram-negative diplococci (Vaginal Swab)','Gram-negative diplococci (Vaginal Swab)',5,122,162),(74,1,'Direct examination','$_347  = [yorn.1]',123,'Trichomonas vaginalis',NULL,'Trichomonas vaginalis (Vaginal Swab)','Trichomonas vaginalis (Vaginal Swab)',6,122,162),(75,1,'Direct examination','$_212  = [absent.present]',123,'C. trachomatis direct',NULL,'Chlamydia trachomatis direct (Vaginal Swab)','Chlamydia trachomatis direct (Vaginal Swab)',9,122,162),(76,1,'Direct examination','$_356  IN ([nombre.3], [nombre.4], [nombre.5])',123,'Yeasts',NULL,'Yeasts (Vaginal Swab)','Yeasts (Vaginal Swab)',8,122,162),(77,1,'Culture','$_361 = [bacterie.n_gono]',123,'Neisseria gonorrhoeae',NULL,'Neisseria gonorrhoeae (Vaginal Swab)','Neisseria gonorrhoeae (Vaginal Swab)',4,122,162),(78,1,'Culture','$_361 = [bacterie.33]',123,'C. albicans',NULL,'Candida albicans (Vaginal Swab)','Candida albicans (Vaginal Swab)',7,122,162),(79,1,'Culture','N/A',123,'Other yeasts',NULL,NULL,NULL,NULL,NULL,NULL),(80,1,'Direct examination','$_353  = [absent.present]',124,'GN Diplococci',NULL,'Gram-negative diplococci (Urethral Swab)','Gram-negative diplococci (Urethral Swab)',14,122,152),(81,1,'Direct examination','$_356  IN ([nombre.3], [nombre.4], [nombre.5])',124,'Yeasts',NULL,'Yeasts (Urethral Swab)','Yeasts (Urethral Swab)',17,122,152),(82,1,'Culture','$_344 = [bacterie.n_gono]',124,'Neisseria gonorrhoeae',NULL,'Neisseria gonorrhoeae (Urethral Swab)','Neisseria gonorrhoeae (Urethral Swab)',13,122,152),(83,1,'Culture','$_344 = [bacterie.33]',124,'C. albicans',NULL,'Candida albicans (Urethral Swab)','Candida albicans (Urethral Swab)',16,122,152),(84,1,'Culture','N/A',124,'Other yeasts',NULL,NULL,NULL,NULL,NULL,NULL),(85,1,NULL,'$_625  = [yorn.1]',125,'Total referred',NULL,NULL,NULL,NULL,NULL,138),(86,1,NULL,'$_716  = [posnegind.Positif]',125,'Total Positive',NULL,NULL,NULL,NULL,NULL,138),(87,1,NULL,'$_718  = [posnegind.Positif]',126,'Positive IgM',NULL,NULL,NULL,NULL,NULL,138),(88,1,NULL,'$_719  = [posnegind.Positif]',126,'Positive IgG',NULL,NULL,NULL,NULL,NULL,138),(89,1,NULL,'$_718  = [posnegind.Négatif] AND $_719  = [posnegind.Négatif]',126,'Negative',NULL,NULL,NULL,NULL,NULL,138),(90,1,NULL,'$_718  = [posnegind.Indétermin] AND $_719  = [posnegind.Indétermin]',126,'Total Indeterminate',NULL,NULL,NULL,NULL,NULL,138),(91,1,NULL,'$_720  = [posnegind.Positif]',127,'Positive IgM',NULL,NULL,NULL,NULL,NULL,138),(92,1,NULL,'$_721  = [posnegind.Positif]',127,'Positive IgG',NULL,NULL,NULL,NULL,NULL,138),(93,1,NULL,'$_720  = [posnegind.Négatif] AND $_721  = [posnegind.Négatif]',127,'Negative',NULL,NULL,NULL,NULL,NULL,138),(94,1,NULL,'$_720  = [posnegind.Indétermin] AND $_721  = [posnegind.Indétermin]',127,'Total Indeterminate',NULL,NULL,NULL,NULL,NULL,138),(95,1,NULL,'$_628  = [posnegind.Positif]',128,'Positive IgM',NULL,NULL,NULL,NULL,NULL,138),(96,1,NULL,'$_629  = [posnegind.Positif]',128,'Positive IgG',NULL,NULL,NULL,NULL,NULL,138),(97,1,NULL,'$_628  = [posnegind.Négatif] AND $_629  = [posnegind.Négatif]',128,'Negative',NULL,NULL,NULL,NULL,NULL,138),(98,1,NULL,'$_628  = [posnegind.Indétermin] AND $_629  = [posnegind.Indétermin]',128,'Total Indeterminate',NULL,NULL,NULL,NULL,NULL,138),(99,1,NULL,'$_625 = [yorn.1]',129,'Total referred',NULL,NULL,NULL,NULL,NULL,153),(100,1,NULL,'$_717 = [posnegind.Positif]',129,'Total Positive',NULL,NULL,NULL,NULL,NULL,153),(101,1,NULL,'$_627 = [posnegind.Négatif]',130,'Negative',NULL,'Total (-) urine','Total (-) urine (Schistosomiasis)',6,133,153),(102,1,NULL,'$_627 = [posnegind.Positif]',130,'Positive',NULL,'Total (+) urine','Total (+) urine (Schistosomiasis)',7,133,153),(103,1,NULL,'$_632 = [shisto.S_HAEMA]',130,'S. haematobium',NULL,'S. haematobium (+)','S. haematobium (+)',8,133,153),(104,1,NULL,'$_632 = [shisto.autres]',130,'Other',NULL,NULL,NULL,NULL,NULL,153),(105,1,NULL,'$_627 = [posnegind.Négatif]',131,'Negative',NULL,'Total (-) stool','Total (-) stool (Schistosomiasis)',2,133,141),(106,1,NULL,'$_627 = [posnegind.Positif]',131,'Positive',NULL,'Total (+) stool','Total (+) stool (Schistosomiasis)',3,133,141),(107,1,NULL,'$_641 = [shisto2.S.mansoni]',131,'S. mansoni',NULL,'S. mansoni','S. mansoni',4,133,141),(108,1,NULL,'$_641 = [shisto2.autres]',131,'Other',NULL,NULL,NULL,NULL,NULL,141),(109,1,NULL,'$_715 = [posnegind.Négatif]',132,'Negative',NULL,NULL,NULL,NULL,NULL,138),(110,1,NULL,'$_715 = [posnegind.Positif]',132,'Positive',NULL,NULL,NULL,NULL,NULL,138),(111,1,NULL,'$_634 = [filariose.wb]',132,'W. bancrofti',NULL,NULL,NULL,NULL,NULL,138),(112,1,NULL,'$_634 = [filariose.autres]',132,'Other',NULL,NULL,NULL,NULL,NULL,138),(113,1,NULL,'{333, 344}',NULL,NULL,NULL,'Total CSF samples','Total CSF samples',1,113,99),(114,1,NULL,'{636,637,639,640}',NULL,NULL,NULL,'Total stool samples','Total stool samples (cholera)',1,114,141),(115,1,NULL,'N/A',NULL,NULL,NULL,'Total liquid stool samples','Total liquid stool samples (Cholera)',2,114,141),(116,1,NULL,'N/A',NULL,NULL,NULL,'Total stool samples other aspects','Total stool samples other aspects (Cholera)',3,114,141),(117,1,NULL,'$_636 = [yorn.1] AND $_637 = [yorn.1]',NULL,NULL,NULL,'Polar motile curved Gram-negative bacilli','Polar motile curved Gram-negative bacilli',7,114,141),(118,1,NULL,'{391, 344}',NULL,NULL,NULL,'Total stool samples','Total stool samples (shigellosis)',1,115,141),(119,1,NULL,'$_391 = [aspestselles.5]',NULL,NULL,NULL,'Total mucoid bloody stool samples','Total mucoid bloody stool samples',2,115,141),(120,1,NULL,'$_391 != [aspestselles.5]',NULL,NULL,NULL,'Total stool samples other aspects','Total stool samples other aspects (Shigellosis)',3,115,141),(121,1,NULL,'N/A',NULL,NULL,NULL,'Non-motile Gram-negative bacilli','Non-motile Gram-negative bacilli',7,115,141),(122,1,NULL,'{611}',NULL,NULL,NULL,'Total sputum samples','Total sputum samples',1,118,50),(123,1,NULL,'N/A',NULL,NULL,NULL,'New AFB+','New AFB+',4,118,50),(124,1,NULL,'{316,616,617}',NULL,NULL,NULL,'Total blood samples (Thick/thin smear)','Total blood (Thick/thin smear)',1,117,138),(125,1,NULL,'{212, 347, 353, 356, 361}',NULL,NULL,NULL,'Total vaginal swab samples','Total vaginal swab samples (STI)',1,122,162),(126,1,NULL,'N/A',NULL,NULL,NULL,'Total (-) (VS)','Total (-) (VS - STI)',2,122,162),(127,1,NULL,'N/A',NULL,NULL,NULL,'Total (+) (VS)','Total (+) (VS - STI)',3,122,162),(128,1,NULL,'{344, 353, 356, 347}',NULL,NULL,NULL,'Total urethral swab samples','Total urethral swab samples (STI)',10,122,152),(129,1,NULL,'N/A',NULL,NULL,NULL,'Total (-) (US)','Total (-) (US - STI)',11,122,152),(130,1,NULL,'N/A',NULL,NULL,NULL,'Total (+) (US)','Total (+) (US - STI)',12,122,152),(131,1,NULL,'$_347  = [yorn.1]',NULL,NULL,NULL,'Trichomonas vaginalis (Urethral Swab)','Trichomonas vaginalis (Urethral Swab)',15,122,152),(132,1,NULL,'$_236 = [absent.present]',NULL,NULL,NULL,'Chlamydia trachomatis direct (Urethral Swab)','Chlamydia trachomatis direct (Urethral Swab)',18,122,152),(133,1,NULL,'{229,231}',NULL,NULL,NULL,'Total blood samples','Total blood samples (STI)',19,122,138),(134,1,NULL,'N/A',NULL,NULL,NULL,'Total (-) (Blood)','Total (-) (Blood STI)',20,122,138),(135,1,NULL,'N/A',NULL,NULL,NULL,'Total (+) (Blood)','Total (+) (Blood STI)',21,122,138),(136,1,NULL,'{627,641}',NULL,NULL,NULL,'Total stool samples','Total stool samples (Schistosomiasis)',1,133,141),(137,1,NULL,'{627,632}',NULL,NULL,NULL,'Total urine samples','Total urine samples (Schistosomiasis)',5,133,153),(138,1,NULL,'{278}',NULL,NULL,NULL,'Total samples','Total samples (HIV)',1,119,138),(139,1,NULL,'N/A',NULL,NULL,NULL,'Total referred (HIV)','Total referred (HIV)',4,119,138);
/*!40000 ALTER TABLE `sigl_15_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_dico_data`
--

DROP TABLE IF EXISTS `sigl_dico_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_dico_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `dico_name` varchar(20) NOT NULL,
  `label` varchar(255) NOT NULL,
  `short_label` varchar(20) NOT NULL,
  `position` int DEFAULT NULL,
  `code` varchar(10) DEFAULT NULL,
  `dico_descr` text,
  `dict_formatting` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`),
  KEY `idx_dico_name` (`dico_name`),
  KEY `sigl_dico_data_owner` (`id_owner`),
  KEY `idx_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=1781 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_dico_data`
--

LOCK TABLES `sigl_dico_data` WRITE;
/*!40000 ALTER TABLE `sigl_dico_data` DISABLE KEYS */;
INSERT INTO `sigl_dico_data` VALUES (1,1,'sexe','Male','M',10,'M',NULL,'N'),(2,1,'sexe','Female','F',20,'F',NULL,'N'),(3,1,'sexe','Unknown','I',30,'I',NULL,'N'),(4,1,'yorn','Yes','1',10,'1',NULL,'N'),(5,1,'yorn','No','0',20,'0',NULL,'N'),(6,1,'facturation','Analysis','A',10,'A',NULL,'N'),(7,1,'facturation','Collection','P',20,'P',NULL,'N'),(8,1,'prel_statut','Completed','DONE',10,'DONE',NULL,'N'),(9,1,'prel_statut','Pending','PENDING',20,'PENDING',NULL,'N'),(10,1,'prel_statut','Brought in','BROUGHT',30,'BROUGHT',NULL,'N'),(11,1,'famille_analyse','Blood biochemistry','BIOS',10,'BIOS',NULL,'N'),(12,1,'famille_analyse','Urinary biochemistry','BIOU',20,'BIOU',NULL,'N'),(13,1,'famille_analyse','LDP biochemistry','BIOL',30,'BIOL',NULL,'N'),(15,1,'famille_analyse','Parasitology','PARA',80,'PARA',NULL,'N'),(16,1,'famille_analyse','Mycology','MYCO',90,'MYCO',NULL,'N'),(17,1,'famille_analyse','Virology','VIRO',100,'VIRO',NULL,'N'),(18,1,'famille_analyse','Bacteriology','BACT',110,'BACT',NULL,'N'),(19,1,'famille_analyse','Immunology / hormonology / specific proteins','IHPS',40,'IHPS',NULL,'N'),(20,1,'famille_analyse','Anatomical and pathological cytology','ANAP',120,'ANAP',NULL,'N'),(23,1,'famille_analyse','Molecular biology','BIOM',130,'BIOM',NULL,'N'),(24,1,'famille_analyse','Sanitary analyses','SANI',140,'SANI',NULL,'N'),(25,1,'famille_analyse','Miscellaneous','DIVE',150,'DIVE',NULL,'N'),(26,1,'paillasse','Blood count','NUMBLOOD',10,'NUMBLOOD',NULL,'N'),(27,1,'paillasse','Routine blood biochemistry','ROUTINEBIO',20,'ROUTINEBIO',NULL,'N'),(28,1,'paillasse','Viral serologies','VS',30,'VS',NULL,'N'),(34,1,'type_prel','Articular aspiration fluid','Articular',60,'LPA',NULL,'N'),(35,1,'type_prel','Ascitic fluid','Ascitic',70,'Ascitic',NULL,'N'),(38,1,'type_prel','Biopsy','Biopsy',100,'Biopsy',NULL,'N'),(50,1,'type_prel','Sputum','Sputum',220,'Sputum',NULL,'N'),(56,1,'type_prel','Bronchoalveolar lavage','BAL',280,'BAL',NULL,'N'),(75,1,'type_prel','Throat swab','Throat',470,'Throat',NULL,'N'),(99,1,'type_prel','Cerebrospinal fluid','CSF',710,'CSF',NULL,'N'),(100,1,'type_prel','Bronchial aspiration fluid','Bronchial',720,'Bronchial',NULL,'N'),(102,1,'type_prel','Alveolar aspiration fluid','Alveolar',740,'Alveolar',NULL,'N'),(104,1,'type_prel','Pleural fluid','Pleural',760,'Pleural',NULL,'N'),(138,1,'type_prel','Blood','Blood',1100,'Blood',NULL,'N'),(141,1,'type_prel','Stool','Stool',1130,'Stool',NULL,'N'),(152,1,'type_prel','Urethral swab','Urethral',1240,'Urethral',NULL,'N'),(153,1,'type_prel','Urine','Urine',1250,'Urine',NULL,'N'),(162,1,'type_prel','Vaginal swab','Vaginal',1340,'Vaginal',NULL,'N'),(163,1,'type_prel','Other','Other',1350,'Other',NULL,'N'),(170,1,'type_analyse','Individual','INDIVIDUAL',10,'INDIV',NULL,'N'),(171,1,'type_analyse','Combined','COMBINED',20,'COMBINED',NULL,'N'),(173,1,'statut_analyse','Pending','PENDING',10,'PENDING',NULL,'N'),(174,1,'statut_analyse','Completed','COMPLETED',20,'COMPLETED',NULL,'N'),(175,1,'profil','Secretary','secretary',10,'secretary',NULL,'N'),(176,1,'profil','Technician','technician',20,'technician',NULL,'N'),(177,1,'profil','Biologist','biologist',30,'biologist',NULL,'N'),(178,1,'profil_bis','Bacteriology','Bacteriology',10,'Bacteriology',NULL,'N'),(179,1,'profil_bis','Virology','Virology',20,'Virology',NULL,'N'),(180,1,'profil_bis','Macro','Macro',30,'Macro',NULL,'N'),(181,1,'statut_dossier','New','NEW',10,'NEW',NULL,'N'),(182,1,'statut_dossier','Administratively validated','ADMIN_VALID',20,'ADMIN_VALID',NULL,'N'),(183,1,'type_dossier','External','EXTERNAL',10,'EXTERNAL',NULL,'N'),(184,1,'type_dossier','Internal','INTERNAL',20,'INTERNAL',NULL,'N'),(186,1,'specialite','Allergologist','Allergologist',10,'ALLERG',NULL,'N'),(187,1,'specialite','Andrologist','Andrologist',20,'Andrologist',NULL,'N'),(189,1,'specialite','Anatomopathologist','Anapath',40,'Anapath',NULL,'N'),(190,1,'specialite','Anesthesiologist','Anesthesiologist',50,'ANESTH',NULL,'N'),(192,1,'specialite','Cancerologist','Cancerologist',70,'CANCER',NULL,'N'),(193,1,'specialite','Cardiologist','Cardiologist',80,'CARDIO',NULL,'N'),(194,1,'specialite','Surgeon','Surgeon',90,'Surgeon',NULL,'N'),(195,1,'specialite','Dermatologist','Dermatologist',100,'Dermatologist',NULL,'N'),(196,1,'specialite','Endocrinologist','Endocrinologist',110,'Endocrinologist',NULL,'N'),(197,1,'specialite','Gastroenterologist','Gastroenterologist',120,'GASTRO',NULL,'N'),(198,1,'specialite','Geneticist','Geneticist',130,'GENET',NULL,'N'),(199,1,'specialite','Geriatrician','Geriatrician',140,'Geriatrician',NULL,'N'),(200,1,'specialite','Gynecologist','Gynecologist',150,'Gynecologist',NULL,'N'),(201,1,'specialite','Hematologist','Hematologist',160,'Hematologist',NULL,'N'),(202,1,'specialite','Infectiologist','Infectiologist',170,'INFECTIO',NULL,'N'),(204,1,'specialite','General practitioner','General practitioner',190,'GP',NULL,'N'),(205,1,'specialite','Emergency physician','Emergency physician',200,'Emergency',NULL,'N'),(206,1,'specialite','Occupational medicine','Occupational medicine',210,'OCC_MED',NULL,'N'),(207,1,'specialite','Nutritionist - dietitian','Nutritionist',220,'NUTRI',NULL,'N'),(208,1,'specialite','Nephrologist','Nephrologist',230,'Nephrologist',NULL,'N'),(209,1,'specialite','Neurosurgeon','Neurosurgeon',240,'NEUROSURG',NULL,'N'),(210,1,'specialite','Neurologist','Neurologist',250,'Neurologist',NULL,'N'),(211,1,'specialite','Oncologist','Oncologist',260,'Oncologist',NULL,'N'),(212,1,'specialite','Ophthalmologist','Ophthalmologist',270,'Ophthalmologist',NULL,'N'),(213,1,'specialite','Otorhinolaryngologist','ENT',280,'ENT',NULL,'N'),(215,1,'specialite','Pediatrician','Pediatrician',300,'Pediatrician',NULL,'N'),(216,1,'specialite','Child psychiatrist','Child psychiatrist',310,'CHILD_PSY',NULL,'N'),(217,1,'specialite','Psychiatrist','Psychiatrist',320,'Psychiatrist',NULL,'N'),(219,1,'specialite','Radiologist','Radiologist',340,'Radiologist',NULL,'N'),(220,1,'specialite','Rheumatologist','Rheumatologist',350,'RHEUMAT',NULL,'N'),(221,1,'specialite','Stomatologist','Stomatologist',360,'STOMAT',NULL,'N'),(222,1,'specialite','Urologist','Urologist',370,'Urologist',NULL,'N'),(225,1,'specialite','Dentist','Dentist',400,'Dentist',NULL,'N'),(226,1,'type_resultat','Text string','varchar',20,'varchar',NULL,'N'),(227,1,'type_resultat','Integer','integer',30,'integer',NULL,'N'),(228,1,'type_resultat','Float','float',40,'float',NULL,'N'),(229,1,'type_resultat','Calculated','calculated',50,'calculated',NULL,'N'),(230,1,'type_resultat','Positive / Negative','dico_posneg',60,'D_POS_NEG',NULL,'N'),(231,1,'type_resultat','Yes / No','dico_yorn',70,'dico_yorn',NULL,'N'),(232,1,'posneg','Positive','+',10,'+',NULL,'N'),(233,1,'posneg','Negative','-',20,'-',NULL,'N'),(234,1,'unite_valeur','mmol/24h','mmol/24h',280,'mmol/24h',NULL,'N'),(235,1,'unite_valeur','mmol/l','mmol/l',210,'mmol/l',NULL,'N'),(236,1,'unite_valeur','% (HDL)','% (HDL)',20,'% (HDL)',NULL,'N'),(237,1,'unite_valeur','% (VLDL)','% (VLDL)',30,'% (VLDL)',NULL,'N'),(238,1,'unite_valeur','mm Hg','mm Hg',300,'mm Hg',NULL,'N'),(239,1,'unite_valeur','%','%',10,'%',NULL,'N'),(240,1,'unite_valeur','mm','mm',50,'mm',NULL,'N'),(241,1,'unite_valeur','million/mm3','million/mm3',260,'10^6/mm3',NULL,'N'),(242,1,'unite_valeur','thousand/mm3','thousand/mm3',250,'thousand/mm3',NULL,'N'),(243,1,'unite_valeur','g/dL','g/dL',140,'g/dL',NULL,'N'),(244,1,'unite_valeur','fL','fL',80,'fL',NULL,'N'),(245,1,'unite_valeur','pg','pg',90,'pg',NULL,'N'),(246,1,'type_resultat','Absent / Present','dico_absent',80,'D_ABS',NULL,'N'),(247,1,'absent','Absent','absent',10,'absent',NULL,'N'),(248,1,'absent','Present','present',20,'present',NULL,'N'),(249,1,'unite_valeur','mg/24h','mg/24h',200,'mg/24h',NULL,'N'),(250,1,'type_validation','Administrative','A',10,'A',NULL,'N'),(251,1,'type_validation','Technical','T',20,'T',NULL,'N'),(252,1,'type_validation','Biological','B',30,'B',NULL,'N'),(253,1,'statut_dossier','Intermediate (admin validated)','INT_ADMIN_VALID',30,'INT_ADMIN',NULL,'N'),(254,1,'statut_dossier','Technically validated','TECH_VALID',40,'TECH_VALID',NULL,'N'),(255,1,'statut_dossier','Intermediate (tech validated)','INT_TECH_VALID',50,'INT_TECH',NULL,'N'),(256,1,'statut_dossier','Biologically validated','BIO_VALID',60,'BIO_VALID',NULL,'N'),(257,1,'doc_type','Report','CR',10,'CR',NULL,'N'),(258,1,'doc_type','Invoice','F',20,'F',NULL,'N'),(259,1,'file_type','PDF','pdf',10,'pdf',NULL,'N'),(260,1,'titre_civilite','Mr','Mr',10,'Mr',NULL,'N'),(261,1,'titre_civilite','Mrs','Mrs',20,'Mrs',NULL,'N'),(262,1,'titre_civilite','Miss','Miss',30,'Miss',NULL,'N'),(263,1,'titre_civilite','Doctor','Dr',40,'Dr',NULL,'N'),(264,1,'titre_civilite','Professor','Prof',50,'Prof',NULL,'N'),(265,1,'type_resultat','Label','label',10,'label',NULL,'N'),(266,1,'profil','Administrator','admin',40,'admin',NULL,'N'),(267,1,'remise_facturation','Hospital staff','Staff',10,'Staff',NULL,'N'),(268,1,'remise_facturation','Exemption','Exemption',20,'EXEMPT',NULL,'N'),(269,1,'remise_facturation','Other','Other',30,'Other',NULL,'N'),(270,1,'motif_annulation','Insufficient pathological specimen','insufficient_spec',10,'INSUFF_SPEC',NULL,'N'),(271,1,'motif_annulation','Test canceled due to previous results','prior_results',20,'PRIOR_RES',NULL,'N'),(272,1,'motif_annulation','Pathological specimen issue','spec_issue',30,'SPEC_ISSUE',NULL,'N'),(273,1,'motif_annulation','Negative culture','neg_culture',40,'NEG_CULTURE',NULL,'N'),(274,1,'motif_annulation','Other','other',100,'other',NULL,'N'),(275,1,'lieu_prel','Internal to lab','lab',10,'lab',NULL,'N'),(276,1,'lieu_prel','Hospital','hospital',20,'hospital',NULL,'N'),(277,1,'lieu_prel','External','external',40,'external',NULL,'N'),(278,1,'famille_analyse','Cytology','CYTO',50,'CYTO',NULL,'N'),(279,1,'famille_analyse','Hematology, Immunohematology and Hemostasis','IMMU',70,'IMMU',NULL,'N'),(280,1,'unite_valeur','mg/L','mg/L',150,'mg/L',NULL,'N'),(281,1,'unite_valeur','µmol/L','µmol/L',220,'µmol/L',NULL,'N'),(282,1,'unite_valeur','g/L','g/L',100,'g/L',NULL,'N'),(283,1,'unite_valeur','µg/L','µg/L',105,'µg/L',NULL,'N'),(284,1,'unite_valeur','IU/L','IU/L',155,'IU/L',NULL,'N'),(285,1,'unite_valeur','nmol/L','nmol/L',230,'nmol/L',NULL,'N'),(286,1,'unite_valeur','ng/mL','ng/mL',130,'ng/mL',NULL,'N'),(287,1,'unite_valeur','pg/mL','pg/mL',110,'pg/mL',NULL,'N'),(288,1,'unite_valeur','pmol/L','pmol/L',240,'pmol/L',NULL,'N'),(289,1,'unite_valeur','µIU/mL','µIU/mL',185,'µIU/mL',NULL,'N'),(290,1,'unite_valeur','g/24h','g/24h',240,'g/24h',NULL,'N'),(291,1,'unite_valeur','sec','s',40,'s',NULL,'N'),(292,1,'unite_valeur','µg/mL','µg/mL',120,'µg/mL',NULL,'N'),(293,1,'unite_valeur','IU/mL','IU/mL',160,'IU/mL',NULL,'N'),(294,1,'unite_valeur','KIU/mL','KIU/mL',170,'KIU/mL',NULL,'N'),(295,1,'unite_valeur','liters','L',60,'L',NULL,'N'),(296,1,'unite_valeur','mL/min','mL/min',270,'mL/min',NULL,'N'),(297,1,'unite_valeur','mEq/L','mEq/L',290,'mEq/L',NULL,'N'),(298,1,'unite_valeur','mIU/L','mIU/L',180,'mIU/L',NULL,'N'),(299,1,'type_cq','Internal quality control','IQC',10,'IQC',NULL,'N'),(300,1,'type_cq','External quality control','EQC',10,'EQC',NULL,'N'),(301,1,'famille_analyse','Biochemistry','BIO',5,'BIO',NULL,'N'),(302,1,'famille_analyse','Immuno-Serology and Molecular Biology','ISBM',75,'ISBM',NULL,'N'),(303,1,'famille_analyse','Drugs and toxicology','MED',160,'MED',NULL,'N'),(304,1,'famille_analyse','Spermiology','SPER',170,'SPER',NULL,'N'),(305,1,'aspestselles','Molded','1',10,'1',NULL,'N'),(306,1,'aspestselles','Pasty','2',20,'2',NULL,'N'),(307,1,'aspestselles','Hard','3',30,'3',NULL,'N'),(308,1,'aspestselles','Mucoid','4',40,'4',NULL,'N'),(309,1,'aspestselles','Mucoid bloody','5',50,'5',NULL,'N'),(310,1,'aspestselles','Pasty bloody','6',60,'6',NULL,'N'),(311,1,'aspestselles','Liquid bloody','7',70,'7',NULL,'N'),(312,1,'aspestselles','Liquid','8',80,'8',NULL,'N'),(313,1,'aspestselles','Semi-liquid','9',90,'9',NULL,'N'),(314,1,'aspestselles','Greenish','10',100,'10',NULL,'N'),(315,1,'nombre','None','1',10,'1',NULL,'N'),(316,1,'nombre','Rare','2',20,'2',NULL,'N'),(317,1,'nombre','Few','3',30,'3',NULL,'N'),(318,1,'nombre','Many','4',40,'4',NULL,'N'),(319,1,'nombre','Very many','5',50,'5',NULL,'N'),(320,1,'parasite','None','1',10,'1',NULL,'N'),(321,1,'parasite','Entamoeba coli cysts','2',20,'2',NULL,'N'),(322,1,'parasite','Entamoeba histolytica cysts','3',30,'3',NULL,'N'),(323,1,'parasite','Giardia lamblia cysts','4',40,'4',NULL,'N'),(324,1,'parasite','Trichomonas intestinalis','5',50,'5',NULL,'N'),(325,1,'parasite','Trichomonas intestinalis and Entamoeba coli cysts','6',60,'6',NULL,'N'),(326,1,'abondance','Poor','1',10,'1',NULL,'N'),(327,1,'abondance','Slightly abundant','2',20,'2',NULL,'N'),(328,1,'abondance','Abundant','3',30,'3',NULL,'N'),(329,1,'abondance','Very abundant','4',40,'4',NULL,'N'),(330,1,'bacterie','Negative','1',10,'1',NULL,'N'),(331,1,'bacterie','Absent','2',20,'2',NULL,'N'),(332,1,'bacterie','Unidentified','3',30,'3',NULL,'N'),(333,1,'bacterie','Escherichia coli','E_coli',40,'E_coli',NULL,'N'),(334,1,'bacterie','Staphylococcus sp','5',50,'5',NULL,'N'),(335,1,'bacterie','Staphylococcus aureus','6',60,'6',NULL,'N'),(336,1,'bacterie','Neisseria meningitidis','7',70,'7',NULL,'N'),(337,1,'bacterie','Neisseria meningitidis A','8',80,'8',NULL,'N'),(338,1,'bacterie','Neisseria meningitidis B','9',90,'9',NULL,'N'),(339,1,'bacterie','Neisseria meningitidis C','10',100,'10',NULL,'N'),(340,1,'bacterie','Neisseria meningitidis W135','11',110,'11',NULL,'N'),(341,1,'bacterie','Neisseria meningitidis X','12',120,'12',NULL,'N'),(342,1,'bacterie','Neisseria meningitidis Y','13',130,'13',NULL,'N'),(343,1,'bacterie','Haemophilus influenzae','14',140,'14',NULL,'N'),(344,1,'bacterie','Haemophilus influenzae b','15',150,'15',NULL,'N'),(345,1,'bacterie','Contamination','16',160,'16',NULL,'N'),(346,1,'bacterie','Enterobacter sp','17',170,'17',NULL,'N'),(347,1,'bacterie','Klebsiella pneumoniae','18',180,'18',NULL,'N'),(348,1,'bacterie','Enterobacter aerogenes','19',190,'19',NULL,'N'),(349,1,'bacterie','Enterobacter cloacae','20',200,'20',NULL,'N'),(350,1,'bacterie','Salmonella Typhi','21',210,'21',NULL,'N'),(351,1,'bacterie','Salmonella Paratyphi A','22',220,'22',NULL,'N'),(352,1,'bacterie','Salmonella Paratyphi B','23',230,'23',NULL,'N'),(353,1,'bacterie','Salmonella Paratyphi C','24',240,'24',NULL,'N'),(354,1,'bacterie','Shigella dysenteriae','25',250,'25',NULL,'N'),(355,1,'bacterie','Shigella sonnei','26',260,'26',NULL,'N'),(356,1,'bacterie','Shigella flexneri','27',270,'27',NULL,'N'),(357,1,'bacterie','Shigella sp','28',280,'28',NULL,'N'),(358,1,'bacterie','Streptococcus pneumoniae','29',290,'29',NULL,'N'),(359,1,'bacterie','Citrobacter freundii','30',300,'30',NULL,'N'),(360,1,'bacterie','Group D Streptococcus','31',310,'31',NULL,'N'),(361,1,'bacterie','Haemophilus parainfluenzae','32',320,'32',NULL,'N'),(362,1,'bacterie','Candida albicans','33',330,'33',NULL,'N'),(363,1,'bacterie','Gardnerella vaginalis','34',340,'34',NULL,'N'),(364,1,'bacterie','Mobiluncus sp','35',350,'35',NULL,'N'),(365,1,'bacterie','Candida sp','36',360,'36',NULL,'N'),(366,1,'bacterie','Group B Streptococcus','37',370,'37',NULL,'N'),(367,1,'bacterie','Group C Streptococcus','38',380,'38',NULL,'N'),(368,1,'bacterie','Group A Streptococcus','39',390,'39',NULL,'N'),(369,1,'bacterie','Group F Streptococcus','40',400,'40',NULL,'N'),(370,1,'bacterie','Group G Streptococcus','41',410,'41',NULL,'N'),(371,1,'bacterie','Enterococcus sp','42',420,'42',NULL,'N'),(372,1,'bacterie','Enterococcus faecalis','43',430,'43',NULL,'N'),(373,1,'bacterie','Staphylococcus saprophyticus','44',440,'44',NULL,'N'),(374,1,'bacterie','Acinetobacter baumannii','45',450,'45',NULL,'N'),(375,1,'bacterie','Staphylococcus epidermidis','46',460,'46',NULL,'N'),(376,1,'bacterie','Streptococcus sp','47',470,'47',NULL,'N'),(377,1,'bacterie','Salmonella sp','48',480,'48',NULL,'N'),(378,1,'bacterie','Providencia stuartii','49',490,'49',NULL,'N'),(379,1,'bacterie','Stenotrophomonas maltophilia','50',500,'50',NULL,'N'),(380,1,'bacterie','Pseudomonas sp','51',510,'51',NULL,'N'),(381,1,'bacterie','Proteus vulgaris','52',520,'52',NULL,'N'),(382,1,'bacterie','Proteus mirabilis','53',530,'53',NULL,'N'),(383,1,'bouillon','Positive','1',10,'1',NULL,'N'),(384,1,'bouillon','Negative','2',20,'2',NULL,'N'),(385,1,'bouillon','Hemolyzed','3',30,'3',NULL,'N'),(386,1,'bouillon','Turbid','4',40,'4',NULL,'N'),(387,1,'bouillon','Slightly hemolyzed','5',50,'5',NULL,'N'),(388,1,'bouillon','Slightly turbid','6',60,'6',NULL,'N'),(389,1,'urine','Turbid urine','1',10,'1',NULL,'N'),(390,1,'urine','Clear urine','2',20,'2',NULL,'N'),(391,1,'urine','Slightly turbid urine','3',30,'3',NULL,'N'),(392,1,'urine','Turbid urine with sediment','4',40,'4',NULL,'N'),(393,1,'urine','Dark clear urine','5',50,'5',NULL,'N'),(394,1,'urine','Dark turbid urine','6',60,'6',NULL,'N'),(395,1,'urine','Light yellow clear urine','7',70,'7',NULL,'N'),(396,1,'urine','Dark yellow clear urine','8',80,'8',NULL,'N'),(397,1,'urine','Dark yellow turbid urine','9',90,'9',NULL,'N'),(398,1,'urine','Dark yellow turbid urine with whitish sediment','10',100,'10',NULL,'N'),(399,1,'urine','Hematuric urine','11',110,'11',NULL,'N'),(400,1,'urine','Purulent urine','12',120,'12',NULL,'N'),(401,1,'urine','Straw yellow clear urine with suspension','13',130,'13',NULL,'N'),(402,1,'urine','Dark yellow slightly turbid urine','14',140,'14',NULL,'N'),(403,1,'levure','Rare','1',10,'1',NULL,'N'),(404,1,'levure','Few','2',20,'2',NULL,'N'),(405,1,'levure','Many','3',30,'3',NULL,'N'),(406,1,'levure','Very many','4',40,'4',NULL,'N'),(407,1,'levure','Rare, filamentous','5',50,'5',NULL,'N'),(408,1,'levure','Few, filamentous','6',60,'6',NULL,'N'),(409,1,'levure','Many, filamentous','7',70,'7',NULL,'N'),(410,1,'levure','Very many, filamentous','8',80,'8',NULL,'N'),(411,1,'cristaux','Amorphous phosphates (rare)','1',10,'1',NULL,'N'),(412,1,'cristaux','Amorphous phosphates (few)','2',20,'2',NULL,'N'),(413,1,'cristaux','Amorphous phosphates (many)','3',30,'3',NULL,'N'),(414,1,'cristaux','Amorphous phosphates (very many)','4',40,'4',NULL,'N'),(415,1,'cristaux','Amorphous urates (rare)','5',50,'5',NULL,'N'),(416,1,'cristaux','Amorphous urates (few)','6',60,'6',NULL,'N'),(417,1,'cristaux','Amorphous urates (many)','7',70,'7',NULL,'N'),(418,1,'cristaux','Amorphous urates (very many)','8',80,'8',NULL,'N'),(419,1,'cristaux','Calcium oxalate (rare)','9',90,'9',NULL,'N'),(420,1,'cristaux','Calcium oxalate (few)','10',100,'10',NULL,'N'),(421,1,'cristaux','Calcium oxalate (many)','11',110,'11',NULL,'N'),(422,1,'cristaux','Calcium oxalate (very many)','12',120,'12',NULL,'N'),(423,1,'cristaux','Uric acid (rare)','13',130,'13',NULL,'N'),(424,1,'cristaux','Uric acid (few)','14',140,'14',NULL,'N'),(425,1,'cristaux','Uric acid (many)','15',150,'15',NULL,'N'),(426,1,'cristaux','Uric acid (very many)','16',160,'16',NULL,'N'),(427,1,'cristaux','Urates (rare)','17',170,'17',NULL,'N'),(428,1,'cristaux','Urates (few)','18',180,'18',NULL,'N'),(429,1,'cristaux','Urates (many)','19',190,'19',NULL,'N'),(430,1,'cristaux','Urates (very many)','20',200,'20',NULL,'N'),(431,1,'cristaux','Triple phosphates (rare)','21',210,'21',NULL,'N'),(432,1,'cristaux','Triple phosphates (few)','22',220,'22',NULL,'N'),(433,1,'cristaux','Triple phosphates (many)','23',230,'23',NULL,'N'),(434,1,'cristaux','Triple phosphates (very many)','24',240,'24',NULL,'N'),(435,1,'cristaux','Bicalcium phosphate (rare)','25',250,'25',NULL,'N'),(436,1,'cristaux','Bicalcium phosphate (few)','26',260,'26',NULL,'N'),(437,1,'cristaux','Bicalcium phosphate (many)','27',270,'27',NULL,'N'),(438,1,'cristaux','Bicalcium phosphate (very many)','28',280,'28',NULL,'N'),(439,1,'cristaux','Calcium carbonate (rare)','29',290,'29',NULL,'N'),(440,1,'cristaux','Calcium carbonate (few)','30',300,'30',NULL,'N'),(441,1,'cristaux','Calcium carbonate (many)','31',310,'31',NULL,'N'),(442,1,'cristaux','Calcium carbonate (very many)','32',320,'32',NULL,'N'),(443,1,'cristaux','Calcium sulfate (rare)','33',330,'33',NULL,'N'),(444,1,'cristaux','Calcium sulfate (few)','34',340,'34',NULL,'N'),(445,1,'cristaux','Calcium sulfate (many)','35',350,'35',NULL,'N'),(446,1,'cristaux','Calcium sulfate (very many)','36',360,'36',NULL,'N'),(447,1,'cristaux','Cystine (rare)','37',370,'37',NULL,'N'),(448,1,'cristaux','Cystine (few)','38',380,'38',NULL,'N'),(449,1,'cristaux','Cystine (many)','39',390,'39',NULL,'N'),(450,1,'cristaux','Cystine (very many)','40',400,'40',NULL,'N'),(451,1,'cristaux','Cholesterol (rare)','41',410,'41',NULL,'N'),(452,1,'cristaux','Cholesterol (few)','42',420,'42',NULL,'N'),(453,1,'cristaux','Cholesterol (many)','43',430,'43',NULL,'N'),(454,1,'cristaux','Cholesterol (very many)','44',440,'44',NULL,'N'),(455,1,'cristaux','Bilirubin (rare)','45',450,'45',NULL,'N'),(456,1,'cristaux','Bilirubin (few)','46',460,'46',NULL,'N'),(457,1,'cristaux','Bilirubin (many)','47',470,'47',NULL,'N'),(458,1,'cristaux','Bilirubin (very many)','48',480,'48',NULL,'N'),(459,1,'cristaux','Sulfonamides (rare)','49',490,'49',NULL,'N'),(460,1,'cristaux','Sulfonamides (few)','50',500,'50',NULL,'N'),(461,1,'cristaux','Sulfonamides (many)','51',510,'51',NULL,'N'),(462,1,'cristaux','Sulfonamides (very many)','52',520,'52',NULL,'N'),(463,1,'cylindre','Semi-granular (rare)','1',10,'1',NULL,'N'),(464,1,'cylindre','Semi-granular (few)','2',20,'2',NULL,'N'),(465,1,'cylindre','Semi-granular (many)','3',30,'3',NULL,'N'),(466,1,'cylindre','Semi-granular (very many)','4',40,'4',NULL,'N'),(467,1,'cylindre','Granular (rare)','5',50,'5',NULL,'N'),(468,1,'cylindre','Granular (few)','6',60,'6',NULL,'N'),(469,1,'cylindre','Granular (many)','7',70,'7',NULL,'N'),(470,1,'cylindre','Granular (very many)','8',80,'8',NULL,'N'),(471,1,'cylindre','Leukocyte (rare)','9',90,'9',NULL,'N'),(472,1,'cylindre','Leukocyte (few)','10',100,'10',NULL,'N'),(473,1,'cylindre','Leukocyte (many)','11',110,'11',NULL,'N'),(474,1,'cylindre','Leukocyte (very many)','12',120,'12',NULL,'N'),(475,1,'cylindre','Red blood cell (rare)','13',130,'13',NULL,'N'),(476,1,'cylindre','Red blood cell (few)','14',140,'14',NULL,'N'),(477,1,'cylindre','Red blood cell (many)','15',150,'15',NULL,'N'),(478,1,'cylindre','Red blood cell (very many)','16',160,'16',NULL,'N'),(479,1,'cylindre','Fatty (rare)','17',170,'17',NULL,'N'),(480,1,'cylindre','Fatty (few)','18',180,'18',NULL,'N'),(481,1,'cylindre','Fatty (many)','19',190,'19',NULL,'N'),(482,1,'cylindre','Fatty (very many)','20',200,'20',NULL,'N'),(483,1,'cylindre','Hyaline (rare)','21',210,'21',NULL,'N'),(484,1,'cylindre','Hyaline (few)','22',220,'22',NULL,'N'),(485,1,'cylindre','Hyaline (many)','23',230,'23',NULL,'N'),(486,1,'cylindre','Hyaline (very many)','24',240,'24',NULL,'N'),(487,1,'cylindre','Epithelial (rare)','25',250,'25',NULL,'N'),(488,1,'cylindre','Epithelial (few)','26',260,'26',NULL,'N'),(489,1,'cylindre','Epithelial (many)','27',270,'27',NULL,'N'),(490,1,'cylindre','Epithelial (very many)','28',280,'28',NULL,'N'),(491,1,'flore','Poor','1',10,'1',NULL,'N'),(492,1,'flore','Slightly abundant','2',20,'2',NULL,'N'),(493,1,'flore','Abundant','3',30,'3',NULL,'N'),(494,1,'flore','Very abundant','4',40,'4',NULL,'N'),(495,1,'gram','No visible germs','1',10,'1',NULL,'N'),(496,1,'gram','Gram-negative bacilli','2',20,'2',NULL,'N'),(497,1,'gram','Gram-positive bacilli','3',30,'3',NULL,'N'),(498,1,'gram','Rare Gram-negative bacilli','4',40,'4',NULL,'N'),(499,1,'gram','Gram-negative bacilli, Gram-positive bacilli','5',50,'5',NULL,'N'),(500,1,'gram','Gram-negative bacilli, Gram-positive cocci','6',60,'6',NULL,'N'),(501,1,'gram','Gram-negative bacilli, Gram-positive cocci, yeasts','7',70,'7',NULL,'N'),(502,1,'gram','Gram-negative bacilli, yeasts','8',80,'8',NULL,'N'),(503,1,'gram','Gram-negative bacilli, Gram-positive bacilli, Gram-positive cocci','9',90,'9',NULL,'N'),(504,1,'gram','Gram-positive bacilli, Gram-positive cocci','10',100,'10',NULL,'N'),(505,1,'gram','Gram-negative bacilli, Gram-positive bacilli, yeasts','11',110,'11',NULL,'N'),(506,1,'gram','Gram-positive bacilli, Gram-positive cocci, yeasts','12',120,'12',NULL,'N'),(507,1,'gram','Gram-negative bacilli, Gram-positive bacilli, Gram-positive cocci, yeasts','13',130,'13',NULL,'N'),(508,1,'gram','Gram-positive cocci','14',140,'14',NULL,'N'),(509,1,'gram','Rare Gram-positive cocci','15',150,'15',NULL,'N'),(510,1,'gram','Rare Gram-positive cocci, yeasts','16',160,'16',NULL,'N'),(511,1,'gram','Gram-positive cocci, yeasts','17',170,'17',NULL,'N'),(512,1,'gram','Gram-positive cocci, numerous yeasts','18',180,'18',NULL,'N'),(513,1,'gram','Yeasts','19',190,'19',NULL,'N'),(514,1,'gram','Gram-positive diplococci','20',200,'20',NULL,'N'),(515,1,'gram','Gram-negative diplococci','21',210,'21',NULL,'N'),(516,1,'res_cult','Negative','1',10,'1',NULL,'N'),(517,1,'res_cult','Positive','2',20,'2',NULL,'N'),(518,1,'res_cult','Polymicrobial (2 colony types)','3',30,'3',NULL,'N'),(519,1,'res_cult','Polymicrobial (3 colony types)','4',40,'4',NULL,'N'),(520,1,'res_cult','Polymicrobial (4 colony types)','5',50,'5',NULL,'N'),(521,1,'res_cult','Polymicrobial (5 colony types)','6',60,'6',NULL,'N'),(522,1,'res_cult','Polymicrobial (6 colony types)','7',70,'7',NULL,'N'),(523,1,'res_cult','Polymicrobial (7 colony types)','8',80,'8',NULL,'N'),(524,1,'resist_sensible','Resistant','R',10,'R',NULL,'N'),(525,1,'resist_sensible','Intermediate','I',20,'I',NULL,'N'),(526,1,'resist_sensible','Susceptible','S',30,'S',NULL,'N'),(527,1,'lcr','Clear','1',10,'1',NULL,'N'),(528,1,'lcr','Cloudy','2',20,'2',NULL,'N'),(529,1,'lcr','Turbid','3',30,'3',NULL,'N'),(530,1,'lcr','Purulent','4',40,'4',NULL,'N'),(531,1,'lcr','Xanthochromic','5',50,'5',NULL,'N'),(532,1,'lcr','Bloody','6',60,'6',NULL,'N'),(533,1,'lcr','Citrine','7',70,'7',NULL,'N'),(534,1,'lcr','Hyaline','8',80,'8',NULL,'N'),(535,1,'lcr','Bloody with clear supernatant','9',90,'9',NULL,'N'),(536,1,'lcr','Bloody with citrine supernatant','10',100,'10',NULL,'N'),(537,1,'latex','Streptococcus B','1',10,'1',NULL,'N'),(538,1,'latex','Autoagglutination','2',20,'2',NULL,'N'),(539,1,'latex','Polyagglutination','3',30,'3',NULL,'N'),(540,1,'latex','Not performed','4',40,'4',NULL,'N'),(541,1,'latex','N. meningitidis A','5',50,'5',NULL,'N'),(542,1,'latex','N. meningitidis B','6',60,'6',NULL,'N'),(543,1,'latex','N. meningitidis C','7',70,'7',NULL,'N'),(544,1,'latex','N. meningitidis X','8',80,'8',NULL,'N'),(545,1,'latex','N. meningitidis Y','9',90,'9',NULL,'N'),(546,1,'latex','N. meningitidis W135','10',100,'10',NULL,'N'),(547,1,'latex','Negative','11',110,'11',NULL,'N'),(548,1,'latex','Streptococcus pneumoniae','12',120,'12',NULL,'N'),(549,1,'latex','Haemophilus influenzae b (Hib)','13',130,'13',NULL,'N'),(550,1,'aspestprelgen','No leukorrhea','1',10,'1',NULL,'N'),(551,1,'aspestprelgen','Minimal leukorrhea','2',20,'2',NULL,'N'),(552,1,'aspestprelgen','Abundant leukorrhea','3',30,'3',NULL,'N'),(553,1,'aspestprelgen','Thick abundant leukorrhea','4',40,'4',NULL,'N'),(554,1,'aspestprelgen','Fluid abundant leukorrhea','5',50,'5',NULL,'N'),(555,1,'aspestprelgen','Curdy leukorrhea','6',60,'6',NULL,'N'),(556,1,'aspestprelgen','Abundant curdy leukorrhea','7',70,'7',NULL,'N'),(557,1,'aspestprelgen','Foul-smelling leukorrhea','8',80,'8',NULL,'N'),(558,1,'aspestprelgen','Slightly abundant leukorrhea','9',90,'9',NULL,'N'),(559,1,'aspestprelgen','Frothy leukorrhea','10',100,'10',NULL,'N'),(560,1,'aspestprelgen','Abundant frothy leukorrhea','11',110,'11',NULL,'N'),(561,1,'aspestprelgen','Swabbing','12',120,'12',NULL,'N'),(562,1,'aspestprelgen','Slightly abundant fluid leukorrhea','13',130,'13',NULL,'N'),(563,1,'aspestprelgen','Slightly abundant thick leukorrhea','14',140,'14',NULL,'N'),(564,1,'formlevure','Filamentous','F',10,'F',NULL,'N'),(565,1,'formlevure','Budding','B',20,'B',NULL,'N'),(566,1,'gram2','Lactobacillus','1',10,'1',NULL,'N'),(567,1,'gram2','Lactobacillus, Gram-positive cocci','2',20,'2',NULL,'N'),(568,1,'gram2','Lactobacillus, Gram-negative cocci','3',30,'3',NULL,'N'),(569,1,'gram2','Lactobacillus, Gram-negative bacilli','4',40,'4',NULL,'N'),(570,1,'gram2','Lactobacillus, Gardnerella vaginalis','5',50,'5',NULL,'N'),(571,1,'gram2','Lactobacillus, Gardnerella vaginalis, Mobiluncus sp','6',60,'6',NULL,'N'),(572,1,'gram2','Gardnerella vaginalis, Mobiluncus sp','7',70,'7',NULL,'N'),(573,1,'gram2','Gardnerella vaginalis','8',80,'8',NULL,'N'),(574,1,'gram2','Mobiluncus sp','9',90,'9',NULL,'N'),(575,1,'gram2','Gram-positive cocci','10',100,'10',NULL,'N'),(576,1,'gram2','Gram-negative bacilli','11',110,'11',NULL,'N'),(577,1,'type_i_iv','I','1',10,'1',NULL,'N'),(578,1,'type_i_iv','II','2',20,'2',NULL,'N'),(579,1,'type_i_iv','III','3',30,'3',NULL,'N'),(580,1,'type_i_iv','IV','4',40,'4',NULL,'N'),(583,1,'type_resultat','Abundance','dico_abundance',90,'D_ABUND',NULL,'N'),(584,1,'type_resultat','Stool appearance','dico_stool_appearance',100,'D_STOOL_APP',NULL,'N'),(585,1,'type_resultat','Genital sample appearance','dico_genital_appearance',110,'D_GEN_APP',NULL,'N'),(586,1,'type_resultat','Bacterium','dico_bacterium',120,'D_BACT',NULL,'N'),(587,1,'type_resultat','Broth','dico_broth',130,'D_BROTH',NULL,'N'),(588,1,'type_resultat','Crystals','dico_crystals',140,'D_CRYST',NULL,'N'),(589,1,'type_resultat','Casts','dico_casts',150,'D_CAST',NULL,'N'),(590,1,'type_resultat','Flora','dico_flora',160,'dico_flora',NULL,'N'),(591,1,'type_resultat','Yeast form','dico_yeast_form',170,'D_YEAST_FORM',NULL,'N'),(592,1,'type_resultat','Germ','dico_germ',180,'dico_germ',NULL,'N'),(593,1,'type_resultat','Gram stain','dico_gram',190,'dico_gram',NULL,'N'),(594,1,'type_resultat','Gram stain (2)','dico_gram2',190,'dico_gram2',NULL,'N'),(595,1,'type_resultat','Latex','dico_latex',200,'dico_latex',NULL,'N'),(596,1,'type_resultat','CSF','dico_csf',210,'dico_csf',NULL,'N'),(597,1,'type_resultat','Yeast','dico_yeast',220,'D_YEAST',NULL,'N'),(598,1,'type_resultat','Urine','dico_urine',230,'dico_urine',NULL,'N'),(599,1,'type_resultat','None to very numerous','dico_quantity',240,'D_QUANTITY',NULL,'N'),(600,1,'type_resultat','Resistant / Susceptible','dico_res_sus',250,'D_RES_SUS',NULL,'N'),(601,1,'type_resultat','I / II / III / IV','dico_type_i_iv',260,'D_I_IV',NULL,'N'),(603,1,'type_resultat','Culture result','dico_culture_result',280,'D_CULT_RES',NULL,'N'),(604,1,'unite_valeur','mL','mL',70,'mL',NULL,'N'),(605,1,'levurelcr','No yeasts','1',10,'1',NULL,'N'),(606,1,'levurelcr','Candida albicans','2',20,'2',NULL,'N'),(607,1,'levurelcr','Cryptococcus neoformans','3',30,'3',NULL,'N'),(608,1,'levurelcr','Candida sp','4',40,'4',NULL,'N'),(609,1,'type_resultat','Yeast (presence)','dico_yeast_presence',290,'D_YEAST_PRES',NULL,'N'),(610,1,'baar','Negative','-',10,'-',NULL,'N'),(611,1,'baar','+','+',20,'+',NULL,'N'),(612,1,'baar','++','++',30,'++',NULL,'N'),(613,1,'baar','+++','+++',40,'+++',NULL,'N'),(614,1,'type_resultat','AFB','dico_afb',115,'dico_afb',NULL,'N'),(615,1,'especepalu','P. falciparum','P_falciparum',10,'P_falciparum',NULL,'N'),(616,1,'especepalu','Other plasmodia','other',999,'other',NULL,'N'),(617,1,'type_resultat','Malaria species','dico_malaria_species',30,'D_MALARIA_SPEC',NULL,'N'),(618,1,'bacterie','Escherichia coli O157:H7','E_coli_O157_H7',45,'E_coli_O157',NULL,'N'),(619,1,'bacterie','Vibrio cholerae','V_cholerae',540,'V_cholerae',NULL,'N'),(620,1,'vih','Negative','neg',10,'neg',NULL,'N'),(621,1,'vih','Positive','HIV1',20,'HIV1',NULL,'N'),(622,1,'vih','HIV-2 positive','HIV2',30,'HIV2',NULL,'N'),(623,1,'vih','HIV-1 and HIV-2 positive','HIV1_HIV2',40,'HIV1_HIV2',NULL,'N'),(624,1,'vih','Indeterminate','ind',50,'ind',NULL,'N'),(625,1,'type_resultat','HIV','dico_hiv',300,'dico_hiv',NULL,'N'),(626,1,'unite_valeur','IU/m3','IU/m3',157,'IU/m3',NULL,'N'),(627,1,'techpcr','Microscopy','Microscopy',10,'MICROSC',NULL,'N'),(628,1,'techpcr','Latex','Latex',20,'Latex',NULL,'N'),(629,1,'techpcr','Culture','Culture',30,'Culture',NULL,'N'),(630,1,'techpcr','PCR','PCR',40,'PCR',NULL,'N'),(631,1,'type_resultat','PCR technique','dico_pcr_tech',290,'D_PCR_TECH',NULL,'N'),(632,1,'posnegind','Positive','Positive',10,'Positive',NULL,'N'),(633,1,'posnegind','Negative','Negative',20,'Negative',NULL,'N'),(635,1,'type_resultat','Positive/Negative/Indeterminate','dico_pos_neg_ind',65,'POS_NEG_IND',NULL,'N'),(636,1,'shisto','S. haematobium','S_haematobium',10,'S_HAEMA',NULL,'N'),(637,1,'shisto','Other','other',20,'other',NULL,'N'),(638,1,'shisto2','S. mansoni','S_mansoni',10,'S_mansoni',NULL,'N'),(639,1,'shisto2','Other','other',20,'other',NULL,'N'),(640,1,'filariose','W. bancrofti','W_bancrofti',10,'Wb',NULL,'N'),(641,1,'filariose','Other','other',20,'other',NULL,'N'),(642,1,'type_resultat','Schistosomiasis','dico_schisto',300,'D_SCHISTO',NULL,'N'),(643,1,'type_resultat','Schistosomiasis 2','dico_schisto2',310,'D_SCHISTO2',NULL,'N'),(644,1,'type_resultat','Filariasis','dico_filaria',320,'D_FILARIA',NULL,'N'),(645,1,'germe','None','10',10,'10',NULL,'N'),(646,1,'germe','Absent','20',20,'20',NULL,'N'),(647,1,'germe','Unidentified','30',30,'30',NULL,'N'),(648,1,'germe','Escherichia coli','40',40,'40',NULL,'N'),(649,1,'germe','Staphylococcus sp','50',50,'50',NULL,'N'),(650,1,'germe','Staphylococcus aureus','60',60,'60',NULL,'N'),(651,1,'germe','Neisseria meningitidis','70',70,'70',NULL,'N'),(652,1,'germe','Neisseria meningitidis A','80',80,'80',NULL,'N'),(653,1,'germe','Neisseria meningitidis B','90',90,'90',NULL,'N'),(654,1,'germe','Neisseria meningitidis C','100',100,'100',NULL,'N'),(655,1,'germe','Neisseria meningitidis W135','110',110,'110',NULL,'N'),(656,1,'germe','Neisseria meningitidis X','120',120,'120',NULL,'N'),(657,1,'germe','Neisseria meningitidis Y','130',130,'130',NULL,'N'),(658,1,'germe','Haemophilus influenzae','140',140,'140',NULL,'N'),(659,1,'germe','Haemophilus influenzae b','150',150,'150',NULL,'N'),(660,1,'germe','Contamination','160',160,'160',NULL,'N'),(661,1,'germe','Enterobacter sp','170',170,'170',NULL,'N'),(662,1,'germe','Klebsiella pneumoniae','180',180,'180',NULL,'N'),(663,1,'germe','Enterobacter aerogenes','190',190,'190',NULL,'N'),(664,1,'germe','Enterobacter cloacae','200',200,'200',NULL,'N'),(665,1,'germe','Salmonella Typhi','210',210,'210',NULL,'N'),(666,1,'germe','Salmonella Paratyphi A','220',220,'220',NULL,'N'),(667,1,'germe','Salmonella Paratyphi B','230',230,'230',NULL,'N'),(668,1,'germe','Salmonella Paratyphi C','240',240,'240',NULL,'N'),(669,1,'germe','Shigella dysenteriae','250',250,'250',NULL,'N'),(670,1,'germe','Shigella sonnei','260',260,'260',NULL,'N'),(671,1,'germe','Shigella flexneri','270',270,'270',NULL,'N'),(672,1,'germe','Shigella boydii','280',280,'280',NULL,'N'),(673,1,'germe','Streptococcus pneumoniae','290',290,'290',NULL,'N'),(674,1,'germe','Citrobacter freundii','300',300,'300',NULL,'N'),(675,1,'germe','Group D Streptococcus','310',310,'310',NULL,'N'),(676,1,'germe','Haemophilus parainfluenzae','320',320,'320',NULL,'N'),(677,1,'germe','Candida albicans','330',330,'330',NULL,'N'),(678,1,'germe','Gardnerella vaginalis','340',340,'340',NULL,'N'),(679,1,'germe','Mobiluncus sp','350',350,'350',NULL,'N'),(680,1,'germe','Candida sp','360',360,'360',NULL,'N'),(681,1,'germe','Group B Streptococcus','370',370,'370',NULL,'N'),(682,1,'germe','Group C Streptococcus','380',380,'380',NULL,'N'),(683,1,'germe','Group A Streptococcus','390',390,'390',NULL,'N'),(684,1,'germe','Group F Streptococcus','400',400,'400',NULL,'N'),(685,1,'germe','Group G Streptococcus','410',410,'410',NULL,'N'),(686,1,'germe','Enterococcus sp','420',420,'420',NULL,'N'),(687,1,'germe','Enterococcus faecalis','430',430,'430',NULL,'N'),(688,1,'germe','Identification in progress','999',999,'999',NULL,'N'),(689,1,'germe','Staphylococcus saprophyticus','440',440,'440',NULL,'N'),(690,1,'germe','Acinetobacter baumannii','450',450,'450',NULL,'N'),(691,1,'germe','Staphylococcus epidermidis','460',460,'460',NULL,'N'),(692,1,'germe','Streptococcus sp','470',470,'470',NULL,'N'),(693,1,'germe','Salmonella sp','480',480,'480',NULL,'N'),(694,1,'germe','Providencia stuartii','490',490,'490',NULL,'N'),(695,1,'germe','Stenotrophomonas maltophilia','500',500,'500',NULL,'N'),(696,1,'germe','Pseudomonas aeruginosa','510',510,'510',NULL,'N'),(697,1,'germe','Proteus vulgaris','520',520,'520',NULL,'N'),(698,1,'germe','Proteus mirabilis','530',530,'530',NULL,'N'),(699,1,'bacterie','Neisseria gonorrhoeae','N_gonorrhoeae',545,'N_gonorrhoeae',NULL,'N'),(800,1,'unite_valeur','parasites/µL','parasites/µL',300,'PARAS/UL',NULL,'N'),(801,1,'unite_valeur','µg/dL','µg/dL',310,'µg/dL',NULL,'N'),(802,1,'gram2','Intracellular Gram-negative diplococci','12',320,'12',NULL,'N'),(803,1,'gram2','Extracellular Gram-negative diplococci','13',330,'13',NULL,'N'),(804,1,'gram2','Intra- and extracellular Gram-negative diplococci','14',340,'14',NULL,'N'),(805,1,'gram2','No germs','15',350,'15',NULL,'N'),(806,1,'gram2','Yeast','16',360,'16',NULL,'N'),(807,1,'gram2','Other','17',370,'17',NULL,'N'),(808,1,'type_resultat','Urethral sample appearance','dico_urethral_app',115,'D_URETHRAL_APP',NULL,'N'),(809,1,'aspprelur','Swabbing','1',10,'1',NULL,'N'),(810,1,'aspprelur','No discharge','2',20,'2',NULL,'N'),(811,1,'aspprelur','Purulent discharge','3',30,'3',NULL,'N'),(812,1,'aspprelur','Colorless discharge','4',40,'4',NULL,'N'),(813,1,'aspprelur','Bloody discharge','5',50,'5',NULL,'N'),(814,1,'especepalu','Oval','ovale',20,'ovale',NULL,'N'),(815,1,'especepalu','Vivax','vivax',30,'vivax',NULL,'N'),(816,1,'especepalu','Malariae','malariae',40,'malariae',NULL,'N'),(817,1,'especepalu','Knowlesi','knowlesi',50,'knowlesi',NULL,'N'),(900,1,'type_resultat','Blood group','dico_blood_group',330,'D_BLOOD_GROUP',NULL,'N'),(901,1,'groupesang','A','A',10,'A',NULL,'N'),(902,1,'groupesang','B','B',20,'B',NULL,'N'),(903,1,'groupesang','AB','AB',30,'AB',NULL,'N'),(904,1,'groupesang','O','O',40,'O',NULL,'N'),(1000,1,'type_prel','Genital swab','Genital',1345,'Genital',NULL,'N'),(1001,1,'famille_analyse','Hematology','HEMA',43,'HEMA',NULL,'N'),(1002,1,'famille_analyse','Hemostasis','HEMO',47,'HEMO',NULL,'N'),(1003,1,'famille_analyse','Immunology','IMNO',72,'IMNO',NULL,'N'),(1004,1,'unite_valeur','/mL','/mL',320,'/mL',NULL,'N'),(1005,1,'levure','Absent','0',5,'0',NULL,'N'),(1006,1,'specialite','Orthopedic surgeon','Orthopedic surgeon',410,'ORTHO_SURG',NULL,'N'),(1007,1,'specialite','Nurse','Nurse',420,'NURSE',NULL,'N'),(1008,1,'specialite','Midwife','Midwife',430,'Midwife',NULL,'N'),(1009,1,'specialite','Pulmonologist','Pulmonologist',440,'PULMON',NULL,'N'),(1010,1,'specialite','Internal medicine','Internal medicine',450,'INT_MED',NULL,'N'),(1011,1010,'cylindre','No casts','29',290,'29',NULL,'N'),(1012,1010,'type_resultat','Resistant/Susceptible/Not applicable','RSNA',350,'RSNA',NULL,'N'),(1013,1010,'resist_sensible','Not performed','NP',40,'NP',NULL,'N'),(1014,1010,'type_prel','Drinking water','DRINKING_WATER',150,'DRINKING_WATER',NULL,'N'),(1015,1010,'type_prel','Wastewater','WASTEWATER',0,'WASTEWATER',NULL,'N'),(1016,1010,'type_prel','Surface water','SURFACE_WATER',0,'SURFACE_WATER',NULL,'N'),(1017,1010,'unite_valeur','CFU','CFU',350,'CFU',NULL,'N'),(1018,1010,'famille_analyse','Antibiotic','ATB',170,'ATB',NULL,'N'),(1019,1010,'Prelv_sanitR','Food','Food',1,'Food',NULL,'N'),(1020,1009,'microscopie_tb','Negative','-',10,'-',NULL,'N'),(1021,1009,'microscopie_tb','Scanty 1','Scanty 1',20,'Scanty 1',NULL,'N'),(1022,1009,'microscopie_tb','Scanty 2','Scanty 2',30,'Scanty 2',NULL,'N'),(1023,1009,'microscopie_tb','Scanty 3','Scanty 3',40,'Scanty 3',NULL,'N'),(1024,1009,'microscopie_tb','Scanty 4','Scanty 4',50,'Scanty 4',NULL,'N'),(1025,1009,'microscopie_tb','Scanty 5','Scanty 5',60,'Scanty 5',NULL,'N'),(1026,1009,'microscopie_tb','Scanty 6','Scanty 6',70,'Scanty 6',NULL,'N'),(1027,1009,'microscopie_tb','Scanty 7','Scanty 7',80,'Scanty 7',NULL,'N'),(1028,1009,'microscopie_tb','Scanty 8','Scanty 8',90,'Scanty 8',NULL,'N'),(1029,1009,'microscopie_tb','Scanty 9','Scanty 9',100,'Scanty 9',NULL,'N'),(1030,1009,'microscopie_tb','Positive +','+',110,'+',NULL,'N'),(1031,1009,'microscopie_tb','Positive ++','++',120,'++',NULL,'N'),(1032,1009,'microscopie_tb','Positive +++','+++',130,'+++',NULL,'N'),(1033,1010,'type_resultat','TB microscopy','dico_tb_microscopy',360,'D_TB_MICRO',NULL,'N'),(1034,1,'periode_unite','Days','days',0,'days',NULL,'N'),(1035,1,'periode_unite','Weeks','weeks',0,'weeks',NULL,'N'),(1036,1,'periode_unite','Months','months',0,'months',NULL,'N'),(1037,1,'periode_unite','Years','years',0,'years',NULL,'N'),(1038,0,'sections','Administration','Administration',1,'0',NULL,'N'),(1039,0,'sections','Collection','Collection',2,'1',NULL,'N'),(1040,0,'sections','Biochemistry','Biochemistry',3,'2',NULL,'N'),(1041,0,'sections','Hematology','Hematology',4,'3',NULL,'N'),(1042,0,'sections','Serology','Serology',5,'4',NULL,'N'),(1043,0,'sections','Microbiology','Microbiology',6,'5',NULL,'N'),(1044,0,'type_reu','Team meeting','Team meeting',1,'staff',NULL,'N'),(1045,0,'type_reu','Quality meeting','Quality meeting',2,'quality',NULL,'N'),(1046,0,'type_reu','Management meeting','Management meeting',3,'management',NULL,'N'),(1047,NULL,'oui','Yes','Yes',1,'1',NULL,'N'),(1049,NULL,'editeur_yorn','Yes','Yes',1,'1',NULL,'N'),(1051,NULL,'editeur_yorn','No','No',2,'0',NULL,'N'),(1053,NULL,'impact_patient','Low','Low',1,'1',NULL,'N'),(1055,NULL,'impact_patient','High','High',2,'2',NULL,'N'),(1057,NULL,'impact_patient','Severe','Severe',3,'3',NULL,'N'),(1059,NULL,'periode_ctrl','No','No',1,'0',NULL,'N'),(1061,NULL,'periode_ctrl','Daily','Daily',2,'1',NULL,'N'),(1063,NULL,'periode_ctrl','Weekly','Weekly',3,'2',NULL,'N'),(1065,NULL,'periode_ctrl','Monthly','Monthly',4,'3',NULL,'N'),(1067,NULL,'periode_ctrl','Annual','Annual',5,'4',NULL,'N'),(1068,NULL,'type_cr','Complete','Complete',1,'1',NULL,'N'),(1069,NULL,'type_cr','Simple','Simple',2,'2',NULL,'N'),(1070,NULL,'per_num_dos','Month','Month',1,'month',NULL,'N'),(1071,NULL,'per_num_dos','Year','Year',2,'year',NULL,'N'),(1072,NULL,'court_long','Short','Short',1,'short',NULL,'N'),(1073,NULL,'court_long','Long','Long',2,'long',NULL,'N'),(1074,1,'doc_type','Barcode','BC',30,'BC',NULL,'N'),(1076,1,'aspestselles','Soft','Soft',110,'Soft',NULL,'N'),(1077,1,'parasite','Negative','Neg',70,'Neg',NULL,'N'),(1078,1,'parasite','Ascaris eggs','Ascaris',80,'Ascaris',NULL,'N'),(1079,1,'parasite','Pinworm eggs','Pinworm',90,'Pinworm',NULL,'N'),(1080,1,'parasite','Entamoeba hartmanii cysts','E_hartmanii',100,'E_hartmanii',NULL,'N'),(1081,1,'bacterie','Escherichia coli O157:H7','E_coli_O157_H7',45,'E_coli_O157',NULL,'N'),(1082,1,'bacterie','N. gonorrhoeae','N_gonorrhoeae',5,'N_gonorrhoeae',NULL,'N'),(1083,1,'bacterie','Campylobacter sp','Campylobacter',590,'Campylobacter',NULL,'N'),(1084,1,'bacterie','Polymicrobial (2 colony types)','Polymicrobial',0,'Polymicrobial',NULL,'N'),(1085,1,'bacterie','Polymicrobial (3 colony types)','Polymicrobial',0,'Polymicrobial',NULL,'N'),(1086,1,'bacterie','Polymicrobial (more than 3 colony types)','Polymicrobial',620,'Polymicrobial',NULL,'N'),(1087,1,'bacterie','No pathogenic germ','NPG',630,'NPG',NULL,'N'),(1088,1,'bacterie','In progress','In progress',640,'In progress',NULL,'N'),(1089,1,'bacterie','Coagulase-negative Staphylococcus','CoNS',650,'CoNS',NULL,'N'),(1090,1,'bacterie','Corynebacterium sp','Corynebacterium',660,'Corynebacterium',NULL,'N'),(1091,1,'bacterie','Klebsiella sp','Klebsiella',670,'Klebsiella',NULL,'N'),(1092,1,'bacterie','Oropharyngeal flora','OPF',0,NULL,NULL,'N'),(1093,1,'bacterie','Skin-type flora','STF',0,NULL,NULL,'N'),(1094,1,'bacterie','Vaginal-type flora','VGF',700,'VGF',NULL,'N'),(1095,1,'urine','Mucous','Mucous',150,'Mucous',NULL,'N'),(1096,1,'urine','Salivary','Salivary',160,'Salivary',NULL,'N'),(1097,1,'urine','Muco-salivary','Muco-salivary',170,'Muco-salivary',NULL,'N'),(1098,1,'urine','Purulent','Purulent',180,'Purulent',NULL,'N'),(1099,1,'urine','Muco-purulent','Muco-purulent',190,'Muco-purulent',NULL,'N'),(1100,1,'urine','Mucous streaked with blood','Mucous with blood',200,'Mucous blood',NULL,'N'),(1101,1,'urine','Hemoptoic','Hemoptoic',210,'Hemoptoic',NULL,'N'),(1102,1,'cristaux','Absent','Abs',5,'Abs',NULL,'N'),(1103,1,'cristaux','Not tested','NT',540,'NT',NULL,'N'),(1104,1,'cylindre','Absent','Absent',300,'Absent',NULL,'N'),(1105,1,'flore','Absent','Absent',50,'Absent',NULL,'N'),(1106,1,'gram','Gram-positive cocci in clusters','GPC clusters',220,'GPC clusters',NULL,'N'),(1107,1,'gram','Gram-positive cocci in chains, Gram-positive cocci in clusters','GPC chains/clusters',230,'GPC chains',NULL,'N'),(1108,1,'gram','Gram-positive cocci in chains','GPC chains',240,'GPC chains',NULL,'N'),(1109,1,'lcr','Chylous','Chylous',110,'Chylous',NULL,'N'),(1110,1,'lcr','Viscous','Viscous',120,'Viscous',NULL,'N'),(1111,1,'lcr','Slightly turbid','Slightly turbid',130,'Slightly turbid',NULL,'N'),(1112,1,'latex','Escherichia coli','E_coli',140,'E_coli',NULL,'N'),(1113,1,'baar','O','O',10,'O',NULL,'N'),(1114,1,'baar','Not tested','NT',60,'NT',NULL,'N'),(1115,1,'especepalu','None','None',5,'None',NULL,'N'),(1116,1,'vih','Non-reactive','Non-reactive',60,'Non-reactive',NULL,'N'),(1117,1,'vih','Reactive','Reactive',70,'Reactive',NULL,'N'),(1118,1,'techpcr','Meningococcus/Pneumococcus/Haemophilus influenzae type b','Meningo/Pneumo/Hib',0,NULL,NULL,'N'),(1119,1,'techpcr','Not performed','NP',60,'NP',NULL,'N'),(1120,1,'posnegind','Indeterminate','Indeterminate',30,'Indeterminate',NULL,'N'),(1123,1,'équi_desequi','Balanced','Balanced',1,'Balanced',NULL,'N'),(1124,1,'équi_desequi','Unbalanced','Unbalanced',2,'Unbalanced',NULL,'N'),(1135,1,'type_resultat','Parasite','dico_parasite',270,'dico_parasite',NULL,'N'),(1142,1,'type_resultat','Balanced/Unbalanced','dico_balanced',175,'dico_balanced',NULL,'N'),(1143,1,'unite_valeur','million/mm3','million/mm3',260,'million/mm3',NULL,'N'),(1144,1,'unite_valeur','G/L','G/L',370,'G/L',NULL,'N'),(1145,1,'unite_valeur','CFU/mL','CFU/mL',5,'CFU/mL',NULL,'N'),(1146,1,'unite_valeur','/mm3','/mm3',390,'/mm3',NULL,'N'),(1158,1,'profil','Senior Technician','senior_tech',22,'senior_tech',NULL,'N'),(1159,1,'profil','Quality Technician','quality_tech',24,'quality_tech',NULL,'N'),(1160,1,'profil','Senior Secretary','senior_sec',12,'senior_sec',NULL,'N'),(1161,1,'profil','Quality Officer','quality_officer',14,'quality_officer',NULL,'N'),(1162,1,'profil','Prescriber','prescriber',16,'prescriber',NULL,'N'),(1163,1,'product_type','Consumables','Consumables',10,'Consumables',NULL,'N'),(1164,1,'product_type','General reagents','General reagents',20,'General reagents',NULL,'N'),(1165,1,'product_type','Chemical products','Chemicals',30,'Chemicals',NULL,'N'),(1166,1,'product_type','Hygiene and safety','Hygiene_safety',40,'Hygiene_safety',NULL,'N'),(1167,1,'product_type','Biochemistry','Biochemistry',50,'Biochemistry',NULL,'N'),(1168,1,'product_type','Hematology','Hematology',60,'Hematology',NULL,'N'),(1169,1,'product_type','Serology','Serology',70,'Serology',NULL,'N'),(1171,1,'product_conserv','2 - 4°C','fridge_2_4',10,'fridge_2_4',NULL,'N'),(1172,1,'product_conserv','2 - 8°C','fridge_2_8',20,'fridge_2_8',NULL,'N'),(1173,1,'product_conserv','4 - 12°C','fridge_4_12',30,'fridge_4_12',NULL,'N'),(1174,1,'product_conserv','-20°C','freezer_20',40,'freezer_20',NULL,'N'),(1175,1,'product_conserv','-80°C','freezer_80',50,'freezer_80',NULL,'N'),(1176,1,'product_conserv','Room temperature','room_temp',60,'room_temp',NULL,'N'),(1177,1,'unite_valeur','Ct','Ct',400,'Ct',NULL,'N'),(1178,1,'product_type','Bacteriology','Bacteriology',80,'Bacteriology',NULL,'N'),(1179,1,'product_type','Parasitology','Parasitology',90,'Parasitology',NULL,'N'),(1180,1,'product_type','Virology','Virology',100,'Virology',NULL,'N'),(1181,1,'unite_valeur','cp/mL','cp/mL',420,'cp/mL',NULL,'N'),(1182,1,'pheno','Wild type','Wild type',10,'pheno_01',NULL,'N'),(1183,1,'pheno','Low-level penicillinase','Low-level penicill.',20,'pheno_02',NULL,'N'),(1184,1,'pheno','High-level penicillinase','High-level penicill.',30,'pheno_03',NULL,'N'),(1185,1,'pheno','TRI phenotype','TRI phenotype',40,'pheno_04',NULL,'N'),(1186,1,'pheno','Cephalosporinase phenotype','Cephalosporinase',50,'pheno_05',NULL,'N'),(1187,1,'pheno','ESBL phenotype','ESBL',60,'pheno_06',NULL,'N'),(1188,1,'type_resultat','Phenotypes','dico_pheno',370,'dico_pheno',NULL,'N'),(1189,1000,'type_prel','Pus swab','Pus',1200,'Pus',NULL,'N'),(1190,0,'pathogène','Actinomadura madurae','Actinomadura_madurae',2,'bact_1',NULL,'N'),(1191,0,'pathogène','Actinomadura pelletieri','Actinomadura',3,'bact_2',NULL,'N'),(1192,0,'pathogène','Actinomyces gerencseriae','Actinomyces',4,'bact_3',NULL,'N'),(1193,0,'pathogène','Actinomyces israelii','Actinomyces_israelii',5,'bact_4',NULL,'N'),(1194,0,'pathogène','Actinomyces spp.','Actinomyces_spp.',6,'bact_5',NULL,'N'),(1195,0,'pathogène','Aggregatibacter actinomycetemcomitans','Aggregatibacter',7,'bact_6',NULL,'N'),(1196,0,'pathogène','Anaplasma spp.','Anaplasma_spp.',8,'bact_7',NULL,'N'),(1197,0,'pathogène','Arcanobacterium haemolyticum','Arcanobacterium',9,'bact_8',NULL,'N'),(1198,0,'pathogène','Arcobacter butzleri','Arcobacter_butzleri',10,'bact_9',NULL,'N'),(1199,0,'pathogène','Bacillus anthracis','Bacillus_anthracis',11,'bact_10',NULL,'N'),(1200,0,'pathogène','Bacteroides fragilis','Bacteroides_fragilis',12,'bact_11',NULL,'N'),(1201,0,'pathogène','Bacteroides spp.','Bacteroides_spp.',13,'bact_12',NULL,'N'),(1202,0,'pathogène','Bartonella bacilliformis','Bartonella',14,'bact_13',NULL,'N'),(1203,0,'pathogène','Bartonella quintana','Bartonella_quintana',15,'bact_14',NULL,'N'),(1204,0,'pathogène','Bartonella spp.','Bartonella_spp.',16,'bact_15',NULL,'N'),(1205,0,'pathogène','Bordetella bronchiseptica','Bordetella',17,'bact_16',NULL,'N'),(1206,0,'pathogène','Bordetella parapertussis','Bordetella_para',18,'bact_17',NULL,'N'),(1207,0,'pathogène','Bordetella pertussis','Bordetella_pertussis',19,'bact_18',NULL,'N'),(1208,0,'pathogène','Bordetella spp.','Bordetella_spp.',20,'bact_19',NULL,'N'),(1209,0,'pathogène','Borrelia burgdorferi','Borrelia_burgdorferi',21,'bact_20',NULL,'N'),(1210,0,'pathogène','Borrelia duttonii','Borrelia_duttonii',22,'bact_21',NULL,'N'),(1211,0,'pathogène','Borrelia recurrentis','Borrelia_recurrentis',23,'bact_22',NULL,'N'),(1212,0,'pathogène','Borrelia spp.','Borrelia_spp.',24,'bact_23',NULL,'N'),(1213,0,'pathogène','Brachyspira spp.','Brachyspira_spp.',25,'bact_24',NULL,'N'),(1214,0,'pathogène','Brucella abortus','Brucella_abortus',26,'bact_25',NULL,'N'),(1215,0,'pathogène','Brucella canis','Brucella_canis',27,'bact_26',NULL,'N'),(1216,0,'pathogène','Brucella inopinata','Brucella_inopinata',28,'bact_27',NULL,'N'),(1217,0,'pathogène','Brucella melitensis','Brucella_melitensis',29,'bact_28',NULL,'N'),(1218,0,'pathogène','Brucella suis','Brucella_suis',30,'bact_29',NULL,'N'),(1219,0,'pathogène','Burkholderia cepacia','Burkholderia_cepacia',31,'bact_30',NULL,'N'),(1220,0,'pathogène','Burkholderia mallei','Burkholderia_mallei',32,'bact_31',NULL,'N'),(1221,0,'pathogène','Burkholderia pseudomallei','Burkholderia_pseudo',33,'bact_32',NULL,'N'),(1222,0,'pathogène','Campylobacter fetus subsp. fetus','Campylobacter_fetus',34,'bact_33',NULL,'N'),(1223,0,'pathogène','Campylobacter fetus subsp. venerealis','Campylobacter_fetus_v',35,'bact_34',NULL,'N'),(1224,0,'pathogène','Campylobacter jejuni subsp. doylei','Campylobacter_jejuni',36,'bact_35',NULL,'N'),(1225,0,'pathogène','Campylobacter jejuni subsp. jejuni','Campylobacter_jejuni2',37,'bact_36',NULL,'N'),(1226,0,'pathogène','Campylobacter spp.','Campylobacter_spp.',38,'bact_37',NULL,'N'),(1227,0,'pathogène','Cardiobacterium hominis','Cardiobacterium',39,'bact_38',NULL,'N'),(1228,0,'pathogène','Cardiobacterium valvarum','Cardiobacterium_valv',40,'bact_39',NULL,'N'),(1229,0,'pathogène','Chlamydia abortus (Chlamydophila abortus)','Chlamydia_abortus',41,'bact_40',NULL,'N'),(1230,0,'pathogène','Chlamydia caviae (Chlamydophila caviae)','Chlamydia_caviae',42,'bact_41',NULL,'N'),(1231,0,'pathogène','Chlamydia felis (Chlamydophila felis)','Chlamydia_felis',43,'bact_42',NULL,'N'),(1232,0,'pathogène','Chlamydia pneumoniae (Chlamydophila pneumoniae)','Chlamydia_pneumoniae',44,'bact_43',NULL,'N'),(1233,0,'pathogène','Chlamydia psittaci','Chlamydia_psittaci',45,'bact_44',NULL,'N'),(1235,0,'pathogène','Chlamydia trachomatis (Chlamydophila trachomatis)','Chlamydia_trachomatis',47,'bact_46',NULL,'N'),(1236,0,'pathogène','Clostridium botulinum','Clostridium_botulinum',48,'bact_47',NULL,'N'),(1237,0,'pathogène','Clostridium difficile','Clostridium_difficile',49,'bact_48',NULL,'N'),(1238,0,'pathogène','Clostridium perfringens','Clostridium_perfringens',50,'bact_49',NULL,'N'),(1239,0,'pathogène','Clostridium tetani','Clostridium_tetani',51,'bact_50',NULL,'N'),(1240,0,'pathogène','Clostridium spp.','Clostridium_spp.',52,'bact_51',NULL,'N'),(1241,0,'pathogène','Corynebacterium diphtheriae','Corynebacterium_diphtheriae',53,'bact_52',NULL,'N'),(1242,0,'pathogène','Corynebacterium minutissimum','Corynebacterium_minutissimum',54,'bact_53',NULL,'N'),(1243,0,'pathogène','Corynebacterium pseudotuberculosis','Corynebacterium_pseudotuberculosis',55,'bact_54',NULL,'N'),(1244,0,'pathogène','Corynebacterium ulcerans','Corynebacterium_ulcerans',56,'bact_55',NULL,'N'),(1245,0,'pathogène','Corynebacterium spp.','Corynebacterium_spp.',57,'bact_56',NULL,'N'),(1246,0,'pathogène','Coxiella burnetii','Coxiella_burnetii',58,'bact_57',NULL,'N'),(1247,0,'pathogène','Edwardsiella tarda','Edwardsiella_tarda',59,'bact_58',NULL,'N'),(1248,0,'pathogène','Ehrlichia spp.','Ehrlichia_spp.',60,'bact_59',NULL,'N'),(1249,0,'pathogène','Eikenella corrodens','Eikenella_corrodens',61,'bact_60',NULL,'N'),(1250,0,'pathogène','Elizabethkingia meningoseptica (Flavobacterium meningosepticum)','Elizabethkingia',62,'bact_61',NULL,'N'),(1251,0,'pathogène','Enterobacter aerogenes (Klebsiella mobilis)','Enterobacter_aerogenes',63,'bact_62',NULL,'N'),(1252,0,'pathogène','Enterobacter cloacae subsp. cloacae (Enterobacter cloacae)','Enterobacter_cloacae',64,'bact_63',NULL,'N'),(1253,0,'pathogène','Enterobacter spp.','Enterobacter_spp.',65,'bact_64',NULL,'N'),(1254,0,'pathogène','Enterococcus spp.','Enterococcus_spp.',66,'bact_65',NULL,'N'),(1255,0,'pathogène','Erysipelothrix rhusiopathiae','Erysipelothrix',67,'bact_66',NULL,'N'),(1256,0,'pathogène','Escherichia coli','Escherichia_coli',68,'bact_67',NULL,'N'),(1257,0,'pathogène','Highly pathogenic Escherichia coli','Escherichia_coli_high_path',69,'bact_68',NULL,'N'),(1258,0,'pathogène','Fluoribacter bozemanae (Legionella)','Fluoribacter_bozemanae',70,'bact_69',NULL,'N'),(1259,0,'pathogène','Francisella hispaniensis','Francisella_hispaniensis',71,'bact_70',NULL,'N'),(1260,0,'pathogène','Francisella tularensis subsp. holarctica','Francisella_tularensis_holarctica',72,'bact_71',NULL,'N'),(1261,0,'pathogène','Francisella tularensis subsp. mediasiatica','Francisella_tularensis_mediasiatica',73,'bact_72',NULL,'N'),(1262,0,'pathogène','Francisella tularensis subsp. novicida','Francisella_tularensis_novicida',74,'bact_73',NULL,'N'),(1263,0,'pathogène','Francisella tularensis subsp. tularensis','Francisella_tularensis_tularensis',75,'bact_74',NULL,'N'),(1264,0,'pathogène','Fusobacterium necrophorum subsp. funduliforme','Fusobacterium_necrophorum_funduliforme',76,'bact_75',NULL,'N'),(1265,0,'pathogène','Fusobacterium necrophorum subsp. necrophorum','Fusobacterium_necrophorum_necrophorum',77,'bact_76',NULL,'N'),(1266,0,'pathogène','Gardnerella vaginalis','Gardnerella_vaginalis',78,'bact_77',NULL,'N'),(1267,0,'pathogène','Haemophilus ducreyi','Haemophilus_ducreyi',79,'bact_78',NULL,'N'),(1268,0,'pathogène','Haemophilus influenzae','Haemophilus_influenzae',80,'bact_79',NULL,'N'),(1269,0,'pathogène','Haemophilus spp.','Haemophilus_spp.',81,'bact_80',NULL,'N'),(1270,0,'pathogène','Helicobacter pylori','Helicobacter_pylori',82,'bact_81',NULL,'N'),(1271,0,'pathogène','Helicobacter spp.','Helicobacter_spp.',83,'bact_82',NULL,'N'),(1272,0,'pathogène','Klebsiella oxytoca','Klebsiella_oxytoca',84,'bact_83',NULL,'N'),(1273,0,'pathogène','Klebsiella pneumoniae subsp. ozaenae','Klebsiella_pneumoniae_ozaenae',85,'bact_84',NULL,'N'),(1274,0,'pathogène','Klebsiella pneumoniae subsp. pneumoniae','Klebsiella_pneumoniae_pneumoniae',86,'bact_85',NULL,'N'),(1275,0,'pathogène','Klebsiella pneumoniae subsp. rhinoscleromatis','Klebsiella_pneumoniae_rhinoscleromatis',87,'bact_86',NULL,'N'),(1276,0,'pathogène','Klebsiella spp.','Klebsiella_spp.',88,'bact_87',NULL,'N'),(1277,0,'pathogène','Legionella pneumophila subsp. fraseri','Legionella_pneumophila_fraseri',89,'bact_88',NULL,'N'),(1278,0,'pathogène','Legionella pneumophila subsp. pascullei','Legionella_pneumophila_pascullei',90,'bact_89',NULL,'N'),(1279,0,'pathogène','Legionella pneumophila subsp. pneumophila','Legionella_pneumophila_pneumophila',91,'bact_90',NULL,'N'),(1280,0,'pathogène','Legionella spp.','Legionella_spp.',92,'bact_91',NULL,'N'),(1281,0,'pathogène','Leptospira interrogans icterohemorrhagiae','Leptospira_interrogans_ictero',93,'bact_92',NULL,'N'),(1282,0,'pathogène','Leptospira interrogans','Leptospira_interrogans',94,'bact_93',NULL,'N'),(1283,0,'pathogène','Leptospira interrogans spp.','Leptospira_interrogans_spp.',95,'bact_94',NULL,'N'),(1284,0,'pathogène','Listeria monocytogenes','Listeria_monocytogenes',96,'bact_95',NULL,'N'),(1285,0,'pathogène','Listeria ivanovii subsp. ivanovii','Listeria_ivanovii_ivanovii',97,'bact_96',NULL,'N'),(1286,0,'pathogène','Listeria ivanovii subsp. londoniensis','Listeria_ivanovii_londoniensis',98,'bact_97',NULL,'N'),(1287,0,'pathogène','Morganella morganii subsp. morganii','Morganella_morganii_morganii',99,'bact_98',NULL,'N'),(1288,0,'pathogène','Morganella morganii subsp. sibonii','Morganella_morganii_sibonii',100,'bact_99',NULL,'N'),(1289,0,'pathogène','Mycobacterium tuberculosis complex, Mycobacterium africanum','Mycobacterium_africanum',101,'bact_100',NULL,'N'),(1290,0,'pathogène','Mycobacterium tuberculosis complex, Mycobacterium bovis','Mycobacterium_bovis',102,'bact_101',NULL,'N'),(1291,0,'pathogène','Mycobacterium tuberculosis complex, Mycobacterium caprae','Mycobacterium_caprae',103,'bact_102',NULL,'N'),(1292,0,'pathogène','Mycobacterium tuberculosis complex, Mycobacterium microti','Mycobacterium_microti',104,'bact_103',NULL,'N'),(1293,0,'pathogène','Mycobacterium tuberculosis complex, Mycobacterium pinnipedii','Mycobacterium_pinnipedii',105,'bact_104',NULL,'N'),(1294,0,'pathogène','Mycobacterium tuberculosis complex, Mycobacterium tuberculosis','Mycobacterium_tuberculosis',106,'bact_105',NULL,'N'),(1295,0,'pathogène','Mycobacterium abscessus subsp. abscessus','Mycobacterium_abscessus',107,'bact_106',NULL,'N'),(1296,0,'pathogène','Mycobacterium avium complex, Mycobacterium avium','Mycobacterium_avium',108,'bact_107',NULL,'N'),(1297,0,'pathogène','Mycobacterium avium complex, Mycobacterium paratuberculosis','Mycobacterium_paratuberculosis',109,'bact_108',NULL,'N'),(1298,0,'pathogène','Mycobacterium avium complex, Mycobacterium chimaera','Mycobacterium_chimaera',110,'bact_109',NULL,'N'),(1299,0,'pathogène','Mycobacterium avium complex, Mycobacterium intracellulare','Mycobacterium_intracellulare',111,'bact_110',NULL,'N'),(1300,0,'pathogène','Mycobacterium avium complex, Mycobacterium silvaticum','Mycobacterium_silvaticum',112,'bact_111',NULL,'N'),(1301,0,'pathogène','Mycobacterium chelonae','Mycobacterium_chelonae',113,'bact_112',NULL,'N'),(1302,0,'pathogène','Mycobacterium fortuitum complex, Mycobacterium fortuitum','Mycobacterium_fortuitum',114,'bact_113',NULL,'N'),(1303,0,'pathogène','Mycobacterium kansasii','Mycobacterium_kansasii',115,'bact_114',NULL,'N'),(1304,0,'pathogène','Mycobacterium leprae','Mycobacterium_leprae',116,'bact_115',NULL,'N'),(1305,0,'pathogène','Mycobacterium malmoense','Mycobacterium_malmoense',117,'bact_116',NULL,'N'),(1306,0,'pathogène','Mycobacterium marinum','Mycobacterium_marinum',118,'bact_117',NULL,'N'),(1307,0,'pathogène','Mycobacterium scrofulaceum','Mycobacterium_scrofulaceum',119,'bact_118',NULL,'N'),(1308,0,'pathogène','Mycobacterium simiae complex, Mycobacterium simiae','Mycobacterium_simiae',120,'bact_119',NULL,'N'),(1309,0,'pathogène','Mycobacterium szulgai','Mycobacterium_szulgai',121,'bact_120',NULL,'N'),(1310,0,'pathogène','Mycobacterium ulcerans','Mycobacterium_ulcerans',122,'bact_121',NULL,'N'),(1311,0,'pathogène','Mycobacterium xenopi','Mycobacterium_xenopi',123,'bact_122',NULL,'N'),(1312,0,'pathogène','Mycoplasma hominis','Mycoplasma_hominis',124,'bact_123',NULL,'N'),(1313,0,'pathogène','Mycoplasma pneumoniae','Mycoplasma_pneumoniae',125,'bact_124',NULL,'N'),(1314,0,'pathogène','Mycoplasma spp.','Mycoplasma_spp.',126,'bact_125',NULL,'N'),(1315,0,'pathogène','Neisseria gonorrhoeae','Neisseria_gonorrhoeae',127,'bact_126',NULL,'N'),(1316,0,'pathogène','Neisseria meningitidis','Neisseria_meningitidis',128,'bact_127',NULL,'N'),(1317,0,'pathogène','Neorickettsia sennetsu (Rickettsia sennetsu, Ehrlichia sennetsu)','Neorickettsia_sennetsu',129,'bact_128',NULL,'N'),(1318,0,'pathogène','Nocardia asteroides','Nocardia_asteroides',130,'bact_129',NULL,'N'),(1319,0,'pathogène','Nocardia brasiliensis','Nocardia_brasiliensis',131,'bact_130',NULL,'N'),(1320,0,'pathogène','Nocardia farcinica','Nocardia_farcinica',132,'bact_131',NULL,'N'),(1321,0,'pathogène','Nocardia nova','Nocardia_nova',133,'bact_132',NULL,'N'),(1322,0,'pathogène','Nocardia otitidiscaviarum','Nocardia_otitidiscaviarum',134,'bact_133',NULL,'N'),(1323,0,'pathogène','Nocardia spp.','Nocardia_spp.',135,'bact_134',NULL,'N'),(1324,0,'pathogène','Orientia tsutsugamushi (Rickettsia tsutsugamushi)','Orientia_tsutsugamushi',136,'bact_135',NULL,'N'),(1325,0,'pathogène','Pasteurella multocida subsp. gallicida (Pasteurella gallicida)','Pasteurella_multocida_gallicida',137,'bact_136',NULL,'N'),(1326,0,'pathogène','Pasteurella multocida subsp. multocida','Pasteurella_multocida_multocida',138,'bact_137',NULL,'N'),(1327,0,'pathogène','Pasteurella multocida subsp. septica','Pasteurella_multocida_septica',139,'bact_138',NULL,'N'),(1328,0,'pathogène','Pasteurella spp.','Pasteurella_spp.',140,'bact_139',NULL,'N'),(1329,0,'pathogène','Peptostreptococcus anaerobius','Peptostreptococcus_anaerobius',141,'bact_140',NULL,'N'),(1330,0,'pathogène','Plesiomonas shigelloides','Plesiomonas_shigelloides',142,'bact_141',NULL,'N'),(1331,0,'pathogène','Porphyromonas spp.','Porphyromonas_spp.',143,'bact_142',NULL,'N'),(1332,0,'pathogène','Prevotella spp.','Prevotella_spp.',144,'bact_143',NULL,'N'),(1333,0,'pathogène','Proteus mirabilis','Proteus_mirabilis',145,'bact_144',NULL,'N'),(1334,0,'pathogène','Proteus penneri','Proteus_penneri',146,'bact_145',NULL,'N'),(1335,0,'pathogène','Proteus vulgaris','Proteus_vulgaris',147,'bact_146',NULL,'N'),(1336,0,'pathogène','Providencia alcalifaciens','Providencia_alcalifaciens',148,'bact_147',NULL,'N'),(1337,0,'pathogène','Providencia rettgeri','Providencia_rettgeri',149,'bact_148',NULL,'N'),(1338,0,'pathogène','Providencia spp.','Providencia_spp.',150,'bact_149',NULL,'N'),(1339,0,'pathogène','Pseudomonas aeruginosa','Pseudomonas_aeruginosa',151,'bact_150',NULL,'N'),(1340,0,'pathogène','Rhodococcus hoagii','Rhodococcus_hoagii',152,'bact_151',NULL,'N'),(1341,0,'pathogène','Rickettsia africae','Rickettsia_africae',153,'bact_152',NULL,'N'),(1342,0,'pathogène','Rickettsia akari','Rickettsia_akari',154,'bact_153',NULL,'N'),(1343,0,'pathogène','Rickettsia australis','Rickettsia_australis',155,'bact_154',NULL,'N'),(1344,0,'pathogène','Rickettsia canadensis','Rickettsia_canadensis',156,'bact_155',NULL,'N'),(1345,0,'pathogène','Rickettsia conorii','Rickettsia_conorii',157,'bact_156',NULL,'N'),(1346,0,'pathogène','Rickettsia heilongjiangensis','Rickettsia_heilongjiangensis',158,'bact_157',NULL,'N'),(1347,0,'pathogène','Rickettsia japonica','Rickettsia_japonica',159,'bact_158',NULL,'N'),(1348,0,'pathogène','Rickettsia montanensis','Rickettsia_montanensis',160,'bact_159',NULL,'N'),(1349,0,'pathogène','Rickettsia typhi','Rickettsia_typhi',161,'bact_160',NULL,'N'),(1350,0,'pathogène','Rickettsia prowazekii','Rickettsia_prowazekii',162,'bact_161',NULL,'N'),(1351,0,'pathogène','Rickettsia rickettsii','Rickettsia_rickettsii',163,'bact_162',NULL,'N'),(1352,0,'pathogène','Rickettsia sibirica','Rickettsia_sibirica',164,'bact_163',NULL,'N'),(1353,0,'pathogène','Rickettsia spp.','Rickettsia_spp.',165,'bact_164',NULL,'N'),(1354,0,'pathogène','Salmonella enterica (choleraesuis) subsp. arizonae','Salmonella_enterica_arizonae',166,'bact_165',NULL,'N'),(1355,0,'pathogène','Salmonella Enteritidis','Salmonella_Enteritidis',167,'bact_166',NULL,'N'),(1356,0,'pathogène','Salmonella Paratyphi A, B, C','Salmonella_Paratyphi',168,'bact_167',NULL,'N'),(1357,0,'pathogène','Salmonella Typhi','Salmonella_Typhi',169,'bact_168',NULL,'N'),(1358,0,'pathogène','Salmonella Typhimurium','Salmonella_Typhimurium',170,'bact_169',NULL,'N'),(1359,0,'pathogène','Salmonella (other serovars)','Salmonella_other',171,'bact_170',NULL,'N'),(1360,0,'pathogène','Shigella boydii','Shigella_boydii',172,'bact_171',NULL,'N'),(1361,0,'pathogène','Shigella dysenteriae (Type 1)','Shigella_dysenteriae_type1',173,'bact_172',NULL,'N'),(1362,0,'pathogène','Shigella dysenteriae (other than Type 1)','Shigella_dysenteriae_other',174,'bact_173',NULL,'N'),(1363,0,'pathogène','Shigella flexneri','Shigella_flexneri',175,'bact_174',NULL,'N'),(1364,0,'pathogène','Shigella sonnei','Shigella_sonnei',176,'bact_175',NULL,'N'),(1365,0,'pathogène','Staphylococcus aureus','Staphylococcus_aureus',177,'bact_176',NULL,'N'),(1366,0,'pathogène','Streptobacillus moniliformis','Streptobacillus_moniliformis',178,'bact_177',NULL,'N'),(1367,0,'pathogène','Streptococcus agalactiae','Streptococcus_agalactiae',179,'bact_178',NULL,'N'),(1368,0,'pathogène','Streptococcus dysgalactiae subsp. equisimilis','Streptococcus_dysgalactiae_equisimilis',180,'bact_179',NULL,'N'),(1369,0,'pathogène','Streptococcus pneumoniae','Streptococcus_pneumoniae',181,'bact_180',NULL,'N'),(1370,0,'pathogène','Streptococcus pyogenes','Streptococcus_pyogenes',182,'bact_181',NULL,'N'),(1371,0,'pathogène','Streptococcus suis','Streptococcus_suis',183,'bact_182',NULL,'N'),(1372,0,'pathogène','Streptococcus spp.','Streptococcus_spp.',184,'bact_183',NULL,'N'),(1373,0,'pathogène','Treponema carateum','Treponema_carateum',185,'bact_184',NULL,'N'),(1374,0,'pathogène','Treponema pallidum','Treponema_pallidum',186,'bact_185',NULL,'N'),(1375,0,'pathogène','Treponema pertenue','Treponema_pertenue',187,'bact_186',NULL,'N'),(1376,0,'pathogène','Treponema spp.','Treponema_spp.',188,'bact_187',NULL,'N'),(1377,0,'pathogène','Trueperella pyogenes','Trueperella_pyogenes',189,'bact_188',NULL,'N'),(1378,0,'pathogène','Ureaplasma parvum','Ureaplasma_parvum',190,'bact_189',NULL,'N'),(1379,0,'pathogène','Ureaplasma urealyticum','Ureaplasma_urealyticum',191,'bact_190',NULL,'N'),(1380,0,'pathogène','Vibrio cholerae','Vibrio_cholerae',192,'bact_191',NULL,'N'),(1381,0,'pathogène','Vibrio parahaemolyticus','Vibrio_parahaemolyticus',193,'bact_192',NULL,'N'),(1382,0,'pathogène','Vibrio spp.','Vibrio_spp.',194,'bact_193',NULL,'N'),(1383,0,'pathogène','Yersinia enterocolitica subsp. enterolitica','Yersinia_enterocolitica_enterolitica',195,'bact_194',NULL,'N'),(1384,0,'pathogène','Yersinia enterocolitica subsp. palearctica','Yersinia_enterocolitica_palearctica',196,'bact_195',NULL,'N'),(1385,0,'pathogène','Yersinia pestis','Yersinia_pestis',197,'bact_196',NULL,'N'),(1386,0,'pathogène','Yersinia pseudotuberculosis','Yersinia_pseudotuberculosis',198,'bact_197',NULL,'N'),(1387,0,'pathogène','Yersinia spp.','Yersinia_spp.',199,'bact_198',NULL,'N'),(1388,0,'pathogène','Arenaviridae','Arenaviridae',200,'virus_1',NULL,'N'),(1389,0,'pathogène','Mammarenavirus','Mammarenavirus',201,'virus_2',NULL,'N'),(1390,0,'pathogène','Brazilian mammarenavirus (Sabiá virus)','Brazilian_mammarenavirus',202,'virus_3',NULL,'N'),(1391,0,'pathogène','Chapare mammarenavirus','Chapare_mammarenavirus',203,'virus_4',NULL,'N'),(1392,0,'pathogène','Flexal mammarenavirus','Flexal_mammarenavirus',204,'virus_5',NULL,'N'),(1393,0,'pathogène','Guanarito mammarenavirus','Guanarito_mammarenavirus',205,'virus_6',NULL,'N'),(1394,0,'pathogène','Argentinian mammarenavirus (Junín virus)','Argentinian_mammarenavirus',206,'virus_7',NULL,'N'),(1395,0,'pathogène','Lassa mammarenavirus','Lassa_mammarenavirus',207,'virus_8',NULL,'N'),(1396,0,'pathogène','Lujo mammarenavirus','Lujo_mammarenavirus',208,'virus_9',NULL,'N'),(1397,0,'pathogène','Lymphocytic choriomeningitis mammarenavirus','LCM_mammarenavirus',209,'virus_10',NULL,'N'),(1399,0,'pathogène','Machupo mammarenavirus','Machupo_mammarenavirus',211,'virus_12',NULL,'N'),(1400,0,'pathogène','Mobala mammarenavirus','Mobala_mammarenavirus',212,'virus_13',NULL,'N'),(1401,0,'pathogène','Mopeia mammarenavirus','Mopeia_mammarenavirus',213,'virus_14',NULL,'N'),(1402,0,'pathogène','Tacaribe mammarenavirus','Tacaribe_mammarenavirus',214,'virus_15',NULL,'N'),(1403,0,'pathogène','Whitewater Arroyo mammarenavirus','Whitewater_Arroyo_mammarenavirus',215,'virus_16',NULL,'N'),(1404,0,'pathogène','Hantaviridae','Hantaviridae',216,'virus_17',NULL,'N'),(1405,0,'pathogène','Orthohantavirus','Orthohantavirus',217,'virus_18',NULL,'N'),(1406,0,'pathogène','Andes orthohantavirus','Andes_orthohantavirus',218,'virus_19',NULL,'N'),(1407,0,'pathogène','Bayou orthohantavirus','Bayou_orthohantavirus',219,'virus_20',NULL,'N'),(1408,0,'pathogène','Black Creek Canal orthohantavirus','Black_Creek_Canal_orthohantavirus',220,'virus_21',NULL,'N'),(1409,0,'pathogène','Cano Delgadito orthohantavirus','Cano_Delgadito_orthohantavirus',221,'virus_22',NULL,'N'),(1410,0,'pathogène','Choclo orthohantavirus','Choclo_orthohantavirus',222,'virus_23',NULL,'N'),(1411,0,'pathogène','Dobrava-Belgrade orthohantavirus','Dobrava_Belgrade_orthohantavirus',223,'virus_24',NULL,'N'),(1412,0,'pathogène','El Moro Canyon orthohantavirus','El_Moro_Canyon_orthohantavirus',224,'virus_25',NULL,'N'),(1413,0,'pathogène','Hantaan orthohantavirus','Hantaan_orthohantavirus',225,'virus_26',NULL,'N'),(1414,0,'pathogène','Laguna Negra orthohantavirus','Laguna_Negra_orthohantavirus',226,'virus_27',NULL,'N'),(1415,0,'pathogène','Prospect Hill orthohantavirus','Prospect_Hill_orthohantavirus',227,'virus_28',NULL,'N'),(1416,0,'pathogène','Puumala orthohantavirus','Puumala_orthohantavirus',228,'virus_29',NULL,'N'),(1417,0,'pathogène','Seoul orthohantavirus','Seoul_orthohantavirus',229,'virus_30',NULL,'N'),(1418,0,'pathogène','Sin Nombre orthohantavirus','Sin_Nombre_orthohantavirus',230,'virus_31',NULL,'N'),(1419,0,'pathogène','Orthohantavirus','Other_hantavirus',231,'virus_32',NULL,'N'),(1420,0,'pathogène','Nairoviridae','Nairoviridae',232,'virus_33',NULL,'N'),(1421,0,'pathogène','Orthonairovirus','Orthonairovirus',233,'virus_34',NULL,'N'),(1422,0,'pathogène','Crimean-Congo hemorrhagic fever orthonairovirus','CCHF_orthonairovirus',234,'virus_35',NULL,'N'),(1423,0,'pathogène','Dugbe orthonairovirus','Dugbe_orthonairovirus',235,'virus_36',NULL,'N'),(1424,0,'pathogène','Hazara orthonairovirus','Hazara_orthonairovirus',236,'virus_37',NULL,'N'),(1425,0,'pathogène','Nairobi sheep disease orthonairovirus','NSD_orthonairovirus',237,'virus_38',NULL,'N'),(1426,0,'pathogène','Orthonairovirus','Other_nairovirus',238,'virus_39',NULL,'N'),(1427,0,'pathogène','Peribunyaviridae','Peribunyaviridae',239,'virus_40',NULL,'N'),(1428,0,'pathogène','Orthobunyavirus','Orthobunyavirus',240,'virus_41',NULL,'N'),(1429,0,'pathogène','Bunyamwera orthobunyavirus (Germiston virus)','Bunyamwera_orthobunyavirus',241,'virus_42',NULL,'N'),(1430,0,'pathogène','California encephalitis orthobunyavirus','California_encephalitis_orthobunyavirus',242,'virus_43',NULL,'N'),(1431,0,'pathogène','Oropouche orthobunyavirus','Oropouche_orthobunyavirus',243,'virus_44',NULL,'N'),(1432,0,'pathogène','Orthobunyavirus','Other_orthobunyavirus',244,'virus_45',NULL,'N'),(1433,0,'pathogène','Phenuiviridae','Phenuiviridae',245,'virus_46',NULL,'N'),(1434,0,'pathogène','Bandavirus','Bandavirus',246,'virus_47',NULL,'N'),(1435,0,'pathogène','Bhanja bandavirus','Bhanja_bandavirus',247,'virus_48',NULL,'N'),(1436,0,'pathogène','Dabie bandavirus','Dabie_bandavirus',248,'virus_49',NULL,'N'),(1437,0,'pathogène','Phlebovirus','Phlebovirus',249,'virus_50',NULL,'N'),(1438,0,'pathogène','Naples phlebovirus','Naples_phlebovirus',250,'virus_51',NULL,'N'),(1439,0,'pathogène','Punta Toro phlebovirus','Punta_Toro_phlebovirus',251,'virus_52',NULL,'N'),(1440,0,'pathogène','Rift Valley fever phlebovirus','RVF_phlebovirus',252,'virus_53',NULL,'N'),(1441,0,'pathogène','Toscana phlebovirus','Toscana_phlebovirus',253,'virus_54',NULL,'N'),(1442,0,'pathogène','Phlebovirus','Other_phlebovirus',254,'virus_55',NULL,'N'),(1443,0,'pathogène','Herpesviridae','Herpesviridae',255,'virus_56',NULL,'N'),(1444,0,'pathogène','Cytomegalovirus','Cytomegalovirus',256,'virus_57',NULL,'N'),(1445,0,'pathogène','Human betaherpesvirus 5 (cytomegalovirus)','Human_betaherpesvirus_5',257,'virus_58',NULL,'N'),(1446,0,'pathogène','Lymphocryptovirus','Lymphocryptovirus',258,'virus_59',NULL,'N'),(1447,0,'pathogène','Human gammaherpesvirus 4 (Epstein-Barr virus)','Human_gammaherpesvirus_4',259,'virus_60',NULL,'N'),(1448,0,'pathogène','Rhadinovirus','Rhadinovirus',260,'virus_61',NULL,'N'),(1449,0,'pathogène','Human gammaherpesvirus 8','Human_gammaherpesvirus_8',261,'virus_62',NULL,'N'),(1450,0,'pathogène','Roseolovirus','Roseolovirus',262,'virus_63',NULL,'N'),(1451,0,'pathogène','Human betaherpesvirus 6A (human B-lymphotropic virus)','Human_betaherpesvirus_6A',263,'virus_64',NULL,'N'),(1452,0,'pathogène','Human betaherpesvirus 6B','Human_betaherpesvirus_6B',264,'virus_65',NULL,'N'),(1453,0,'pathogène','Human betaherpesvirus 7','Human_betaherpesvirus_7',265,'virus_66',NULL,'N'),(1454,0,'pathogène','Simplexvirus','Simplexvirus',266,'virus_67',NULL,'N'),(1455,0,'pathogène','Macacine alphaherpesvirus 1 (simian herpesvirus, Herpes B virus)','Macacine_alphaherpesvirus_1',267,'virus_68',NULL,'N'),(1456,0,'pathogène','Human alphaherpesvirus 1 (human herpesvirus 1, Herpes simplex virus type 1)','Human_alphaherpesvirus_1',268,'virus_69',NULL,'N'),(1457,0,'pathogène','Human alphaherpesvirus 2 (human herpesvirus 2, Herpes simplex virus type 2)','Human_alphaherpesvirus_2',269,'virus_70',NULL,'N'),(1458,0,'pathogène','Varicellovirus','Varicellovirus',270,'virus_71',NULL,'N'),(1459,0,'pathogène','Human alphaherpesvirus 3 (varicella-zoster herpesvirus)','Human_alphaherpesvirus_3',271,'virus_72',NULL,'N'),(1460,0,'pathogène','Filoviridae','Filoviridae',272,'virus_73',NULL,'N'),(1461,0,'pathogène','Ebolavirus','Ebolavirus',273,'virus_74',NULL,'N'),(1462,0,'pathogène','Marburgvirus','Marburgvirus',274,'virus_75',NULL,'N'),(1463,0,'pathogène','Marburg marburgvirus','Marburg_marburgvirus',275,'virus_76',NULL,'N'),(1464,0,'pathogène','Paramyxoviridae','Paramyxoviridae',276,'virus_77',NULL,'N'),(1465,0,'pathogène','Orthoavulavirus','Orthoavulavirus',277,'virus_78',NULL,'N'),(1466,0,'pathogène','Avian orthoavulavirus 1 (Newcastle disease virus)','Avian_orthoavulavirus_1',278,'virus_79',NULL,'N'),(1467,0,'pathogène','Henipavirus','Henipavirus',279,'virus_80',NULL,'N'),(1468,0,'pathogène','Hendra henipavirus','Hendra_henipavirus',280,'virus_81',NULL,'N'),(1469,0,'pathogène','Nipah henipavirus','Nipah_henipavirus',281,'virus_82',NULL,'N'),(1470,0,'pathogène','Morbillivirus','Morbillivirus',282,'virus_83',NULL,'N'),(1471,0,'pathogène','Measles morbillivirus (measles virus)','Measles_morbillivirus',283,'virus_84',NULL,'N'),(1472,0,'pathogène','Respirovirus','Respirovirus',284,'virus_85',NULL,'N'),(1473,0,'pathogène','Human respirovirus 1 (parainfluenza virus type 1)','Human_respirovirus_1',285,'virus_86',NULL,'N'),(1474,0,'pathogène','Human respirovirus 3 (parainfluenza virus type 3)','Human_respirovirus_3',286,'virus_87',NULL,'N'),(1475,0,'pathogène','Orthorubulavirus','Orthorubulavirus',287,'virus_88',NULL,'N'),(1476,0,'pathogène','Mumps orthorubulavirus (mumps virus)','Mumps_orthorubulavirus',288,'virus_89',NULL,'N'),(1477,0,'pathogène','Human orthorubulavirus 2 (parainfluenza virus type 2)','Human_orthorubulavirus_2',289,'virus_90',NULL,'N'),(1478,0,'pathogène','Human orthorubulavirus 4 (parainfluenza virus type 4)','Human_orthorubulavirus_4',290,'virus_91',NULL,'N'),(1479,0,'pathogène','Pneumoviridae','Pneumoviridae',291,'virus_92',NULL,'N'),(1480,0,'pathogène','Metapneumovirus','Metapneumovirus',292,'virus_93',NULL,'N'),(1481,0,'pathogène','Orthopneumovirus','Orthopneumovirus',293,'virus_94',NULL,'N'),(1482,0,'pathogène','Human orthopneumovirus (respiratory syncytial virus)','Human_orthopneumovirus',294,'virus_95',NULL,'N'),(1483,0,'pathogène','Rhabdoviridae','Rhabdoviridae',295,'virus_96',NULL,'N'),(1484,0,'pathogène','Lyssavirus','Lyssavirus',296,'virus_97',NULL,'N'),(1485,0,'pathogène','Australian bat lyssavirus','Australian_bat_lyssavirus',297,'virus_98',NULL,'N'),(1486,0,'pathogène','Duvenhage lyssavirus','Duvenhage_lyssavirus',298,'virus_99',NULL,'N'),(1487,0,'pathogène','European bat 1 lyssavirus','European_bat_1_lyssavirus',299,'virus_100',NULL,'N'),(1488,0,'pathogène','European bat 2 lyssavirus','European_bat_2_lyssavirus',300,'virus_101',NULL,'N'),(1489,0,'pathogène','Lagos bat lyssavirus','Lagos_bat_lyssavirus',301,'virus_102',NULL,'N'),(1490,0,'pathogène','Mokola lyssavirus','Mokola_lyssavirus',302,'virus_103',NULL,'N'),(1491,0,'pathogène','Rabies lyssavirus (rabies virus)','Rabies_lyssavirus',303,'virus_104',NULL,'N'),(1492,0,'pathogène','Vesiculovirus','Vesiculovirus',304,'virus_105',NULL,'N'),(1493,0,'pathogène','Alagoas vesiculovirus (vesicular stomatitis virus)','Alagoas_vesiculovirus',305,'virus_106',NULL,'N'),(1494,0,'pathogène','Indiana vesiculovirus (vesicular stomatitis virus)','Indiana_vesiculovirus',306,'virus_107',NULL,'N'),(1495,0,'pathogène','New Jersey vesiculovirus (vesicular stomatitis virus)','New_Jersey_vesiculovirus',307,'virus_108',NULL,'N'),(1496,0,'pathogène','Piry vesiculovirus (Piry virus)','Piry_vesiculovirus',308,'virus_109',NULL,'N'),(1497,0,'pathogène','Coronaviridae','Coronaviridae',309,'virus_110',NULL,'N'),(1498,0,'pathogène','Betacoronavirus','Betacoronavirus',310,'virus_111',NULL,'N'),(1499,0,'pathogène','Severe acute respiratory syndrome-related coronavirus (SARS-CoV virus)','SARS_related_coronavirus',311,'virus_112',NULL,'N'),(1500,0,'pathogène','Severe acute respiratory syndrome-related coronavirus-2 (SARS-CoV-2 virus)','SARS_related_coronavirus_2',312,'virus_113',NULL,'N'),(1501,0,'pathogène','Middle East respiratory syndrome-related coronavirus (MERS-CoV virus)','MERS_related_coronavirus',313,'virus_114',NULL,'N'),(1502,0,'pathogène','Coronaviridae','Other_coronaviridae',314,'virus_115',NULL,'N'),(1503,0,'pathogène','Caliciviridae','Caliciviridae',315,'virus_116',NULL,'N'),(1504,0,'pathogène','Norovirus','Norovirus',316,'virus_117',NULL,'N'),(1505,0,'pathogène','Norwalk virus','Norwalk_virus',317,'virus_118',NULL,'N'),(1506,0,'pathogène','Caliciviridae','Other_caliciviridae',318,'virus_119',NULL,'N'),(1507,0,'pathogène','Picornaviridae','Picornaviridae',319,'virus_120',NULL,'N'),(1508,0,'pathogène','Cardiovirus','Cardiovirus',320,'virus_121',NULL,'N'),(1509,0,'pathogène','Cardiovirus D (Saffold virus)','Cardiovirus_D',321,'virus_122',NULL,'N'),(1510,0,'pathogène','Cosavirus','Cosavirus',322,'virus_123',NULL,'N'),(1511,0,'pathogène','Cosavirus A','Cosavirus_A',323,'virus_124',NULL,'N'),(1512,0,'pathogène','Enterovirus','Enterovirus',324,'virus_125',NULL,'N'),(1513,0,'pathogène','Enterovirus A','Enterovirus_A',325,'virus_126',NULL,'N'),(1514,0,'pathogène','Enterovirus B','Enterovirus_B',326,'virus_127',NULL,'N'),(1515,0,'pathogène','Enterovirus C','Enterovirus_C',327,'virus_128',NULL,'N'),(1516,0,'pathogène','Enterovirus D','Enterovirus_D',328,'virus_129',NULL,'N'),(1517,0,'pathogène','Rhinovirus A, Rhinovirus B and Rhinovirus C','Rhinovirus_A_B_C',329,'virus_130',NULL,'N'),(1518,0,'pathogène','Enterovirus C (poliovirus types 1 and 3)','Enterovirus_C_polio1_3',330,'virus_131',NULL,'N'),(1519,0,'pathogène','Enterovirus C (poliovirus type 2)','Enterovirus_C_polio2',331,'virus_132',NULL,'N'),(1520,0,'pathogène','Hepatovirus','Hepatovirus',332,'virus_133',NULL,'N'),(1521,0,'pathogène','Hepatovirus A (hepatitis A virus, human enterovirus type 72)','Hepatovirus_A',333,'virus_134',NULL,'N'),(1522,0,'pathogène','Kobuvirus','Kobuvirus',334,'virus_135',NULL,'N'),(1523,0,'pathogène','Aichivirus A (Aichi virus 1)','Aichivirus_A',335,'virus_136',NULL,'N'),(1524,0,'pathogène','Parechovirus','Parechovirus',336,'virus_137',NULL,'N'),(1525,0,'pathogène','Parechovirus A','Parechovirus_A',337,'virus_138',NULL,'N'),(1526,0,'pathogène','Parechovirus B (Ljungan virus)','Parechovirus_B',338,'virus_139',NULL,'N'),(1527,0,'pathogène','Picornaviridae','Other_picornaviridae',339,'virus_140',NULL,'N'),(1528,0,'pathogène','Adenoviridae','Adenoviridae',340,'virus_141',NULL,'N'),(1529,0,'pathogène','Astroviridae','Astroviridae',341,'virus_142',NULL,'N'),(1530,0,'pathogène','Hepadnaviridae','Hepadnaviridae',342,'virus_143',NULL,'N'),(1531,0,'pathogène','Orthohepadnavirus','Orthohepadnavirus',343,'virus_144',NULL,'N'),(1532,0,'pathogène','Hepatitis B virus','Hepatitis_B_virus',344,'virus_145',NULL,'N'),(1533,0,'pathogène','Hepelivirales','Hepelivirales',345,'virus_146',NULL,'N'),(1534,0,'pathogène','Hepeviridae','Hepeviridae',346,'virus_147',NULL,'N'),(1535,0,'pathogène','Orthohepevirus','Orthohepevirus',347,'virus_148',NULL,'N'),(1536,0,'pathogène','Orthohepevirus A (hepatitis E virus)','Orthohepevirus_A',348,'virus_149',NULL,'N'),(1537,0,'pathogène','Amarillovirales','Amarillovirales',349,'virus_150',NULL,'N'),(1538,0,'pathogène','Flaviviridae','Flaviviridae',350,'virus_151',NULL,'N'),(1539,0,'pathogène','Flavivirus','Flavivirus',351,'virus_152',NULL,'N'),(1540,0,'pathogène','Dengue virus','Dengue_virus',352,'virus_153',NULL,'N'),(1541,0,'pathogène','Japanese encephalitis virus','Japanese_encephalitis_virus',353,'virus_154',NULL,'N'),(1542,0,'pathogène','Kyasanur Forest disease virus','Kyasanur_Forest_disease_virus',354,'virus_155',NULL,'N'),(1543,0,'pathogène','Louping ill virus','Louping_ill_virus',355,'virus_156',NULL,'N'),(1544,0,'pathogène','Murray Valley encephalitis virus (Australian encephalitis virus)','Murray_Valley_encephalitis_virus',356,'virus_157',NULL,'N'),(1545,0,'pathogène','Omsk hemorrhagic fever virus','Omsk_hemorrhagic_fever_virus',357,'virus_158',NULL,'N'),(1546,0,'pathogène','Powassan virus','Powassan_virus',358,'virus_159',NULL,'N'),(1547,0,'pathogène','Ilheus virus (Rocio virus)','Ilheus_virus',359,'virus_160',NULL,'N'),(1548,0,'pathogène','Saint Louis encephalitis virus','Saint_Louis_encephalitis_virus',360,'virus_161',NULL,'N'),(1549,0,'pathogène','Tick-borne encephalitis virus','Tick_borne_encephalitis_virus',361,'virus_162',NULL,'N'),(1553,0,'pathogène','Wesselsbron virus','Wesselsbron_virus',365,'virus_166',NULL,'N'),(1554,0,'pathogène','West Nile virus','West_Nile_virus',366,'virus_167',NULL,'N'),(1555,0,'pathogène','Yellow fever virus','Yellow_fever_virus',367,'virus_168',NULL,'N'),(1556,0,'pathogène','Zika virus','Zika_virus',368,'virus_169',NULL,'N'),(1557,0,'pathogène','Flavivirus','Other_flavivirus',369,'virus_170',NULL,'N'),(1558,0,'pathogène','Hepacivirus','Hepacivirus',370,'virus_171',NULL,'N'),(1559,0,'pathogène','Hepacivirus C (hepatitis C virus)','Hepacivirus_C',371,'virus_172',NULL,'N'),(1560,0,'pathogène','Orthomyxoviridae','Orthomyxoviridae',372,'virus_173',NULL,'N'),(1561,0,'pathogène','Alphainfluenzavirus','Alphainfluenzavirus',373,'virus_174',NULL,'N'),(1562,0,'pathogène','Influenza A virus','Influenza_A_virus',374,'virus_175',NULL,'N'),(1568,0,'pathogène','Betainfluenzavirus','Betainfluenzavirus',380,'virus_181',NULL,'N'),(1569,0,'pathogène','Influenza B virus','Influenza_B_virus',381,'virus_182',NULL,'N'),(1570,0,'pathogène','Gammainfluenzavirus','Gammainfluenzavirus',382,'virus_183',NULL,'N'),(1571,0,'pathogène','Influenza C virus','Influenza_C_virus',383,'virus_184',NULL,'N'),(1572,0,'pathogène','Thogotovirus','Thogotovirus',384,'virus_185',NULL,'N'),(1573,0,'pathogène','Dhori thogotovirus','Dhori_thogotovirus',385,'virus_186',NULL,'N'),(1574,0,'pathogène','Thogoto thogotovirus','Thogoto_thogotovirus',386,'virus_187',NULL,'N'),(1575,0,'pathogène','Papillomaviridae','Papillomaviridae',387,'virus_188',NULL,'N'),(1576,0,'pathogène','Papillomavirus','Papillomavirus',388,'virus_189',NULL,'N'),(1577,0,'pathogène','Parvoviridae','Parvoviridae',389,'virus_190',NULL,'N'),(1578,0,'pathogène','Erythroparvovirus','Erythroparvovirus',390,'virus_191',NULL,'N'),(1579,0,'pathogène','Primate erythroparvovirus 1 (human parvovirus, B19 virus)','Primate_erythroparvovirus_1',391,'virus_192',NULL,'N'),(1580,0,'pathogène','Polyomaviridae','Polyomaviridae',392,'virus_193',NULL,'N'),(1581,0,'pathogène','Betapolyomavirus','Betapolyomavirus',393,'virus_194',NULL,'N'),(1582,0,'pathogène','Human polyomavirus 1 (BK virus)','Human_polyomavirus_1',394,'virus_195',NULL,'N'),(1583,0,'pathogène','Human polyomavirus 2 (JC virus)','Human_polyomavirus_2',395,'virus_196',NULL,'N'),(1584,0,'pathogène','Poxviridae','Poxviridae',396,'virus_197',NULL,'N'),(1585,0,'pathogène','Molluscipoxvirus','Molluscipoxvirus',397,'virus_198',NULL,'N'),(1586,0,'pathogène','Molluscum contagiosum virus','Molluscum_contagiosum_virus',398,'virus_199',NULL,'N'),(1587,0,'pathogène','Orthopoxvirus','Orthopoxvirus',399,'virus_200',NULL,'N'),(1588,0,'pathogène','Cowpox virus','Cowpox_virus',400,'virus_201',NULL,'N'),(1589,0,'pathogène','Monkeypox virus','Monkeypox_virus',401,'virus_202',NULL,'N'),(1590,0,'pathogène','Vaccinia virus','Vaccinia_virus',402,'virus_203',NULL,'N'),(1591,0,'pathogène','Variola virus (smallpox virus)','Variola_virus',403,'virus_204',NULL,'N'),(1592,0,'pathogène','Parapoxvirus','Parapoxvirus',404,'virus_205',NULL,'N'),(1593,0,'pathogène','Orf virus','Orf_virus',405,'virus_206',NULL,'N'),(1594,0,'pathogène','Pseudocowpox virus (milker\'s nodule virus, bovine parapoxvirus)','Pseudocowpox_virus',406,'virus_207',NULL,'N'),(1595,0,'pathogène','Yatapoxvirus','Yatapoxvirus',407,'virus_208',NULL,'N'),(1596,0,'pathogène','Tanapox virus','Tanapox_virus',408,'virus_209',NULL,'N'),(1597,0,'pathogène','Yaba monkey tumor virus','Yaba_monkey_tumor_virus',409,'virus_210',NULL,'N'),(1598,0,'pathogène','Reoviridae','Reoviridae',410,'virus_211',NULL,'N'),(1599,0,'pathogène','Seadornavirus','Seadornavirus',411,'virus_212',NULL,'N'),(1600,0,'pathogène','Banna virus','Banna_virus',412,'virus_213',NULL,'N'),(1601,0,'pathogène','Coltivirus','Coltivirus',413,'virus_214',NULL,'N'),(1602,0,'pathogène','Rotavirus','Rotavirus',414,'virus_215',NULL,'N'),(1603,0,'pathogène','Orbivirus','Orbivirus',415,'virus_216',NULL,'N'),(1604,0,'pathogène','Retroviridae','Retroviridae',416,'virus_217',NULL,'N'),(1605,0,'pathogène','Deltaretrovirus','Deltaretrovirus',417,'virus_218',NULL,'N'),(1606,0,'pathogène','Primate T-lymphotropic virus 1 (human T-lymphotropic virus type 1)','Primate_T_lymphotropic_virus_1',418,'virus_219',NULL,'N'),(1607,0,'pathogène','Primate T-lymphotropic virus 2 (human T-lymphotropic virus type 2)','Primate_T_lymphotropic_virus_2',419,'virus_220',NULL,'N'),(1608,0,'pathogène','Lentivirus','Lentivirus',420,'virus_221',NULL,'N'),(1609,0,'pathogène','Human immunodeficiency virus 1 (HIV-1)','Human_immunodeficiency_virus_1',421,'virus_222',NULL,'N'),(1610,0,'pathogène','Human immunodeficiency virus 2 (HIV-2)','Human_immunodeficiency_virus_2',422,'virus_223',NULL,'N'),(1611,0,'pathogène','Simian immunodeficiency virus (SIV)','Simian_immunodeficiency_virus',423,'virus_224',NULL,'N'),(1612,0,'pathogène','Togaviridae','Togaviridae',424,'virus_225',NULL,'N'),(1613,0,'pathogène','Alphavirus','Alphavirus',425,'virus_226',NULL,'N'),(1614,0,'pathogène','Cabassou virus','Cabassou_virus',426,'virus_227',NULL,'N'),(1615,0,'pathogène','Eastern equine encephalitis virus (eastern equine encephalomyelitis virus)','Eastern_equine_encephalitis_virus',427,'virus_228',NULL,'N'),(1616,0,'pathogène','Bebaru virus','Bebaru_virus',428,'virus_229',NULL,'N'),(1617,0,'pathogène','Chikungunya virus','Chikungunya_virus',429,'virus_230',NULL,'N'),(1618,0,'pathogène','Everglades virus','Everglades_virus',430,'virus_231',NULL,'N'),(1619,0,'pathogène','Mayaro virus','Mayaro_virus',431,'virus_232',NULL,'N'),(1620,0,'pathogène','Mucambo virus','Mucambo_virus',432,'virus_233',NULL,'N'),(1621,0,'pathogène','Ndumu virus','Ndumu_virus',433,'virus_234',NULL,'N'),(1622,0,'pathogène','Onyong-nyong virus (O\'nyong-nyong virus)','Onyong_nyong_virus',434,'virus_235',NULL,'N'),(1623,0,'pathogène','Ross River virus','Ross_River_virus',435,'virus_236',NULL,'N'),(1624,0,'pathogène','Semliki Forest virus','Semliki_Forest_virus',436,'virus_237',NULL,'N'),(1625,0,'pathogène','Sindbis virus','Sindbis_virus',437,'virus_238',NULL,'N'),(1626,0,'pathogène','Tonate virus','Tonate_virus',438,'virus_239',NULL,'N'),(1627,0,'pathogène','Venezuelan equine encephalitis virus (Venezuelan equine encephalomyelitis virus)','Venezuelan_equine_encephalitis_virus',439,'virus_240',NULL,'N'),(1628,0,'pathogène','Western equine encephalitis virus (western equine encephalomyelitis virus)','Western_equine_encephalitis_virus',440,'virus_241',NULL,'N'),(1629,0,'pathogène','Alphavirus','Other_alphavirus',441,'virus_242',NULL,'N'),(1630,0,'pathogène','Matonaviridae','Matonaviridae',442,'virus_243',NULL,'N'),(1631,0,'pathogène','Rubivirus','Rubivirus',443,'virus_244',NULL,'N'),(1632,0,'pathogène','Rubivirus rubellae (rubella virus)','Rubivirus_rubellae',444,'virus_245',NULL,'N'),(1633,0,'pathogène','Kolmioviridae','Kolmioviridae',445,'virus_246',NULL,'N'),(1634,0,'pathogène','Deltavirus','Deltavirus',446,'virus_247',NULL,'N'),(1635,0,'pathogène','Deltavirus (hepatitis delta virus)','Deltavirus_hepatitis_delta',447,'virus_248',NULL,'N'),(1636,0,'pathogène','Acanthamoeba castellanii','Acanthamoeba_castellanii',448,'para_1',NULL,'N'),(1637,0,'pathogène','Ancylostoma duodenale','Ancylostoma_duodenale',449,'para_2',NULL,'N'),(1638,0,'pathogène','Angiostrongylus cantonensis','Angiostrongylus_cantonensis',450,'para_3',NULL,'N'),(1639,0,'pathogène','Angiostrongylus costaricensis','Angiostrongylus_costaricensis',451,'para_4',NULL,'N'),(1640,0,'pathogène','Anisakis simplex','Anisakis_simplex',452,'para_5',NULL,'N'),(1641,0,'pathogène','Ascaris lumbricoides','Ascaris_lumbricoides',453,'para_6',NULL,'N'),(1642,0,'pathogène','Ascaris suum','Ascaris_suum',454,'para_7',NULL,'N'),(1643,0,'pathogène','Babesia divergens','Babesia_divergens',455,'para_8',NULL,'N'),(1644,0,'pathogène','Babesia microti','Babesia_microti',456,'para_9',NULL,'N'),(1645,0,'pathogène','Balamuthia mandrillaris','Balamuthia_mandrillaris',457,'para_10',NULL,'N'),(1646,0,'pathogène','Balantidium coli','Balantidium_coli',458,'para_11',NULL,'N'),(1647,0,'pathogène','Brugia malayi','Brugia_malayi',459,'para_12',NULL,'N'),(1648,0,'pathogène','Brugia pahangi','Brugia_pahangi',460,'para_13',NULL,'N'),(1649,0,'pathogène','Brugia timori','Brugia_timori',461,'para_14',NULL,'N'),(1650,0,'pathogène','Capillaria philippinensis','Capillaria_philippinensis',462,'para_15',NULL,'N'),(1651,0,'pathogène','Capillaria spp.','Capillaria_spp.',463,'para_16',NULL,'N'),(1652,0,'pathogène','Clonorchis sinensis (Opisthorchis sinensis)','Clonorchis_sinensis',464,'para_17',NULL,'N'),(1653,0,'pathogène','Clonorchis viverrini (Opisthorchis viverrini)','Clonorchis_viverrini',465,'para_18',NULL,'N'),(1654,0,'pathogène','Cryptosporidium hominis','Cryptosporidium_hominis',466,'para_19',NULL,'N'),(1655,0,'pathogène','Cryptosporidium parvum','Cryptosporidium_parvum',467,'para_20',NULL,'N'),(1656,0,'pathogène','Cyclospora cayetanensis','Cyclospora_cayetanensis',468,'para_21',NULL,'N'),(1657,0,'pathogène','Dicrocoelium dentriticum','Dicrocoelium_dentriticum',469,'para_22',NULL,'N'),(1658,0,'pathogène','Dipetalonema streptocerca','Dipetalonema_streptocerca',470,'para_23',NULL,'N'),(1659,0,'pathogène','Diphyllobothrium latum','Diphyllobothrium_latum',471,'para_24',NULL,'N'),(1660,0,'pathogène','Dracunculus medinensis','Dracunculus_medinensis',472,'para_25',NULL,'N'),(1661,0,'pathogène','Echinococcus granulosus','Echinococcus_granulosus',473,'para_26',NULL,'N'),(1662,0,'pathogène','Echinococcus multilocularis','Echinococcus_multilocularis',474,'para_27',NULL,'N'),(1663,0,'pathogène','Echinococcus oligarthrus','Echinococcus_oligarthrus',475,'para_28',NULL,'N'),(1664,0,'pathogène','Echinococcus vogeli','Echinococcus_vogeli',476,'para_29',NULL,'N'),(1665,0,'pathogène','Entamoeba histolytica','Entamoeba_histolytica',477,'para_30',NULL,'N'),(1666,0,'pathogène','Enterobius vermicularis','Enterobius_vermicularis',478,'para_31',NULL,'N'),(1667,0,'pathogène','Enterocytozoon bieneusi','Enterocytozoon_bieneusi',479,'para_32',NULL,'N'),(1668,0,'pathogène','Fasciola gigantica','Fasciola_gigantica',480,'para_33',NULL,'N'),(1669,0,'pathogène','Fasciola hepatica','Fasciola_hepatica',481,'para_34',NULL,'N'),(1670,0,'pathogène','Fasciolopsis buski','Fasciolopsis_buski',482,'para_35',NULL,'N'),(1671,0,'pathogène','Giardia lamblia (Giardia duodenalis, Giardia intestinalis)','Giardia_lamblia',483,'para_36',NULL,'N'),(1672,0,'pathogène','Heterophyes spp.','Heterophyes_spp.',484,'para_37',NULL,'N'),(1673,0,'pathogène','Hymenolepis diminuta','Hymenolepis_diminuta',485,'para_38',NULL,'N'),(1674,0,'pathogène','Hymenolepis nana','Hymenolepis_nana',486,'para_39',NULL,'N'),(1675,0,'pathogène','Leishmania aethiopica','Leishmania_aethiopica',487,'para_40',NULL,'N'),(1676,0,'pathogène','Leishmania braziliensis','Leishmania_braziliensis',488,'para_41',NULL,'N'),(1677,0,'pathogène','Leishmania donovani','Leishmania_donovani',489,'para_42',NULL,'N'),(1678,0,'pathogène','Leishmania guyanensis (Viannia guyanensis)','Leishmania_guyanensis',490,'para_43',NULL,'N'),(1679,0,'pathogène','Leishmania infantum (Leishmania chagasi)','Leishmania_infantum',491,'para_44',NULL,'N'),(1680,0,'pathogène','Leishmania major','Leishmania_major',492,'para_45',NULL,'N'),(1681,0,'pathogène','Leishmania mexicana','Leishmania_mexicana',493,'para_46',NULL,'N'),(1682,0,'pathogène','Leishmania panamensis (Viannia panamensis)','Leishmania_panamensis',494,'para_47',NULL,'N'),(1683,0,'pathogène','Leishmania peruviana','Leishmania_peruviana',495,'para_48',NULL,'N'),(1684,0,'pathogène','Leishmania tropica','Leishmania_tropica',496,'para_49',NULL,'N'),(1685,0,'pathogène','Leishmania spp.','Leishmania_spp.',497,'para_50',NULL,'N'),(1686,0,'pathogène','Loa loa','Loa_loa',498,'para_51',NULL,'N'),(1687,0,'pathogène','Mansonella ozzardi','Mansonella_ozzardi',499,'para_52',NULL,'N'),(1688,0,'pathogène','Mansonella perstans','Mansonella_perstans',500,'para_53',NULL,'N'),(1689,0,'pathogène','Mansonella streptocerca','Mansonella_streptocerca',501,'para_54',NULL,'N'),(1690,0,'pathogène','Metagonimus spp.','Metagonimus_spp.',502,'para_55',NULL,'N'),(1691,0,'pathogène','Naegleria fowleri','Naegleria_fowleri',503,'para_56',NULL,'N'),(1692,0,'pathogène','Necator americanus','Necator_americanus',504,'para_57',NULL,'N'),(1693,0,'pathogène','Onchocerca volvulus','Onchocerca_volvulus',505,'para_58',NULL,'N'),(1694,0,'pathogène','Opisthorchis felineus','Opisthorchis_felineus',506,'para_59',NULL,'N'),(1695,0,'pathogène','Opisthorchis spp.','Opisthorchis_spp.',507,'para_60',NULL,'N'),(1696,0,'pathogène','Paragonimus westermani','Paragonimus_westermani',508,'para_61',NULL,'N'),(1697,0,'pathogène','Paragonimus spp.','Paragonimus_spp.',509,'para_62',NULL,'N'),(1698,0,'pathogène','Plasmodium falciparum','Plasmodium_falciparum',510,'para_63',NULL,'N'),(1699,0,'pathogène','Plasmodium knowlesi','Plasmodium_knowlesi',511,'para_64',NULL,'N'),(1700,0,'pathogène','Plasmodium spp. (human and simian)','Plasmodium_spp.',512,'para_65',NULL,'N'),(1701,0,'pathogène','Sarcocystis suihominis','Sarcocystis_suihominis',513,'para_66',NULL,'N'),(1702,0,'pathogène','Schistosoma haematobium','Schistosoma_haematobium',514,'para_67',NULL,'N'),(1703,0,'pathogène','Schistosoma intercalatum','Schistosoma_intercalatum',515,'para_68',NULL,'N'),(1704,0,'pathogène','Schistosoma japonicum','Schistosoma_japonicum',516,'para_69',NULL,'N'),(1705,0,'pathogène','Schistosoma mansoni','Schistosoma_mansoni',517,'para_70',NULL,'N'),(1706,0,'pathogène','Schistosoma mekongi','Schistosoma_mekongi',518,'para_71',NULL,'N'),(1707,0,'pathogène','Strongyloides stercoralis','Strongyloides_stercoralis',519,'para_72',NULL,'N'),(1708,0,'pathogène','Strongyloides spp.','Strongyloides_spp.',520,'para_73',NULL,'N'),(1709,0,'pathogène','Taenia saginata','Taenia_saginata',521,'para_74',NULL,'N'),(1710,0,'pathogène','Taenia solium','Taenia_solium',522,'para_75',NULL,'N'),(1711,0,'pathogène','Toxocara canis','Toxocara_canis',523,'para_76',NULL,'N'),(1712,0,'pathogène','Toxocara cati','Toxocara_cati',524,'para_77',NULL,'N'),(1713,0,'pathogène','Toxoplasma gondii','Toxoplasma_gondii',525,'para_78',NULL,'N'),(1714,0,'pathogène','Trichinella nativa','Trichinella_nativa',526,'para_79',NULL,'N'),(1715,0,'pathogène','Trichinella nelsoni','Trichinella_nelsoni',527,'para_80',NULL,'N'),(1716,0,'pathogène','Trichinella pseudospiralis','Trichinella_pseudospiralis',528,'para_81',NULL,'N'),(1717,0,'pathogène','Trichinella spiralis','Trichinella_spiralis',529,'para_82',NULL,'N'),(1718,0,'pathogène','Trichomonas vaginalis','Trichomonas_vaginalis',530,'para_83',NULL,'N'),(1719,0,'pathogène','Trichostrongylus orientalis','Trichostrongylus_orientalis',531,'para_84',NULL,'N'),(1720,0,'pathogène','Trichostrongylus spp.','Trichostrongylus_spp.',532,'para_85',NULL,'N'),(1721,0,'pathogène','Trichuris trichiura','Trichuris_trichiura',533,'para_86',NULL,'N'),(1722,0,'pathogène','Trypanosoma brucei brucei','Trypanosoma_brucei_brucei',534,'para_87',NULL,'N'),(1723,0,'pathogène','Trypanosoma brucei gambiense','Trypanosoma_brucei_gambiense',535,'para_88',NULL,'N'),(1724,0,'pathogène','Trypanosoma brucei rhodesiense','Trypanosoma_brucei_rhodesiense',536,'para_89',NULL,'N'),(1725,0,'pathogène','Trypanosoma cruzi','Trypanosoma_cruzi',537,'para_90',NULL,'N'),(1726,0,'pathogène','Wuchereria bancrofti','Wuchereria_bancrofti',538,'para_91',NULL,'N'),(1727,0,'pathogène','Aspergillus flavus','Aspergillus_flavus',539,'fungi_1',NULL,'N'),(1728,0,'pathogène','Aspergillus fumigatus','Aspergillus_fumigatus',540,'fungi_2',NULL,'N'),(1729,0,'pathogène','Aspergillus spp.','Aspergillus_spp.',541,'fungi_3',NULL,'N'),(1730,0,'pathogène','Blastomyces dermatitidis (Ajellomyces dermatitidis)','Blastomyces_dermatitidis',542,'fungi_4',NULL,'N'),(1731,0,'pathogène','Blastomyces gilchristii','Blastomyces_gilchristii',543,'fungi_5',NULL,'N'),(1732,0,'pathogène','Candida albicans','Candida_albicans',544,'fungi_6',NULL,'N'),(1733,0,'pathogène','Candida dubliniensis','Candida_dubliniensis',545,'fungi_7',NULL,'N'),(1734,0,'pathogène','Candida glabrata','Candida_glabrata',546,'fungi_8',NULL,'N'),(1735,0,'pathogène','Candida parapsilosis','Candida_parapsilosis',547,'fungi_9',NULL,'N'),(1736,0,'pathogène','Candida tropicalis','Candida_tropicalis',548,'fungi_10',NULL,'N'),(1737,0,'pathogène','Cladophialophora bantiana','Cladophialophora_bantiana',549,'fungi_11',NULL,'N'),(1738,0,'pathogène','Cladophialophora modesta','Cladophialophora_modesta',550,'fungi_12',NULL,'N'),(1739,0,'pathogène','Cladophialophora spp.','Cladophialophora_spp.',551,'fungi_13',NULL,'N'),(1740,0,'pathogène','Coccidioides immitis','Coccidioides_immitis',552,'fungi_14',NULL,'N'),(1741,0,'pathogène','Coccidioides posadasii','Coccidioides_posadasii',553,'fungi_15',NULL,'N'),(1742,0,'pathogène','Cryptococcus gattii','Cryptococcus_gattii',554,'fungi_16',NULL,'N'),(1743,0,'pathogène','Cryptococcus neoformans','Cryptococcus_neoformans',555,'fungi_17',NULL,'N'),(1744,0,'pathogène','Emmonsia parva var. parva','Emmonsia_parva_parva',556,'fungi_18',NULL,'N'),(1745,0,'pathogène','Emmonsia parva var. crescens','Emmonsia_parva_crescens',557,'fungi_19',NULL,'N'),(1746,0,'pathogène','Epidermophyton floccosum','Epidermophyton_floccosum',558,'fungi_20',NULL,'N'),(1747,0,'pathogène','Epidermophyton spp.','Epidermophyton_spp.',559,'fungi_21',NULL,'N'),(1748,0,'pathogène','Fonsecaea pedrosoi','Fonsecaea_pedrosoi',560,'fungi_22',NULL,'N'),(1749,0,'pathogène','Histoplasma capsulatum','Histoplasma_capsulatum',561,'fungi_23',NULL,'N'),(1750,0,'pathogène','Histoplasma capsulatum var. farciminosum','Histoplasma_capsulatum_farciminosum',562,'fungi_24',NULL,'N'),(1751,0,'pathogène','Histoplasma capsulatum var. duboisii','Histoplasma_capsulatum_duboisii',563,'fungi_25',NULL,'N'),(1752,0,'pathogène','Madurella grisea','Madurella_grisea',564,'fungi_26',NULL,'N'),(1753,0,'pathogène','Madurella mycetomatis','Madurella_mycetomatis',565,'fungi_27',NULL,'N'),(1754,0,'pathogène','Microsporum spp.','Microsporum_spp.',566,'fungi_28',NULL,'N'),(1755,0,'pathogène','Nannizzia spp.','Nannizzia_spp.',567,'fungi_29',NULL,'N'),(1756,0,'pathogène','Neotestudina rosatii','Neotestudina_rosatii',568,'fungi_30',NULL,'N'),(1757,0,'pathogène','Paracoccidioides brasiliensis','Paracoccidioides_brasiliensis',569,'fungi_31',NULL,'N'),(1758,0,'pathogène','Paracoccidioides lutzii','Paracoccidioides_lutzii',570,'fungi_32',NULL,'N'),(1759,0,'pathogène','Paraphyton spp.','Paraphyton_spp.',571,'fungi_33',NULL,'N'),(1760,0,'pathogène','Rhinocladiella mackenziei','Rhinocladiella_mackenziei',572,'fungi_34',NULL,'N'),(1761,0,'pathogène','Scedosporium apiospermum','Scedosporium_apiospermum',573,'fungi_35',NULL,'N'),(1762,0,'pathogène','Scedosporium prolificans (inflatum)','Scedosporium_prolificans',574,'fungi_36',NULL,'N'),(1763,0,'pathogène','Sporothrix schenckii','Sporothrix_schenckii',575,'fungi_37',NULL,'N'),(1764,0,'pathogène','Talaromyces marneffei (Penicillium marneffei)','Talaromyces_marneffei',576,'fungi_38',NULL,'N'),(1765,0,'pathogène','Trichophyton rubrum','Trichophyton_rubrum',577,'fungi_39',NULL,'N'),(1766,0,'pathogène','Trichophyton tonsurans','Trichophyton_tonsurans',578,'fungi_40',NULL,'N'),(1767,0,'pathogène','Trichophyton spp.','Trichophyton_spp.',579,'fungi_41',NULL,'N'),(1768,0,'etat_equipement','Functional','OK',1,'eqp_stat1',NULL,'N'),(1769,0,'etat_equipement','Non-functional','Non-functional',2,'eqp_stat2',NULL,'N'),(1770,0,'etat_equipement','Broken (awaiting repair)','Broken',3,'eqp_stat3',NULL,'N'),(1771,0,'etat_equipement','Damaged','Damaged',4,'eqp_stat4',NULL,'N'),(1772,0,'etat_equipement','Defective','Defective',5,'eqp_stat5',NULL,'N'),(1773,0,'etat_equipement','Under maintenance','Maintenance',6,'eqp_stat6',NULL,'N'),(1774,0,'etat_equipement','Obsolete / Discarded','Obsolete/Discarded',7,'eqp_stat7',NULL,'N'),(1775,0,'etat_equipement','In stock / Reserved','Stock/Reserved',8,'eqp_stat8',NULL,'N'),(1776,1,'type_prel','Nasopharyngeal swab','Nasopharyngeal',1346,'Nasopharyngeal',NULL,'N'),(1777,1,'type_prel','Oropharyngeal swab','Oropharyngeal',1347,'Oropharyngeal',NULL,'N'),(1778,1,'type_prel','Nasal swab','Nasal',1348,'Nasal',NULL,'N'),(1779,1,'absent','Absence','Absence',30,'Absence',NULL,'N'),(1780,1,'absent','Presence','Presence',40,'Presence',NULL,'N');
/*!40000 ALTER TABLE `sigl_dico_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_equipement_data`
--

DROP TABLE IF EXISTS `sigl_equipement_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_equipement_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `nom_fabriquant` varchar(255) DEFAULT NULL,
  `modele` varchar(255) DEFAULT NULL,
  `fonction` varchar(255) DEFAULT NULL,
  `localisation` varchar(255) DEFAULT NULL,
  `section` int unsigned DEFAULT NULL,
  `no_serie` varchar(255) DEFAULT NULL,
  `no_inventaire` varchar(255) DEFAULT NULL,
  `pannes` text,
  `maintenance_preventive` text,
  `certif_etalonnage` varchar(255) DEFAULT NULL,
  `contrat_maintenance` varchar(255) DEFAULT NULL,
  `date_fin_contrat` date DEFAULT NULL,
  `controle_interne` int unsigned DEFAULT NULL,
  `controle_externe` int unsigned DEFAULT NULL,
  `date_reception` date DEFAULT NULL,
  `date_mise_en_service` date DEFAULT NULL,
  `date_de_retrait` date DEFAULT NULL,
  `commentaires` text,
  `fournisseur_id` int unsigned DEFAULT NULL,
  `responsable_id` int unsigned DEFAULT NULL,
  `manuel_id` int unsigned DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `date_achat` date DEFAULT NULL,
  `date_acquisition` date DEFAULT NULL,
  `procedures_id` int unsigned DEFAULT NULL,
  `eqp_critical` varchar(1) NOT NULL DEFAULT 'N',
  `eqp_comm_doc` text NOT NULL,
  `eqp_status` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_data`),
  KEY `idx_equipement_eqp_status` (`eqp_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_equipement_data`
--

LOCK TABLES `sigl_equipement_data` WRITE;
/*!40000 ALTER TABLE `sigl_equipement_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_equipement_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_evtlog_data`
--

DROP TABLE IF EXISTS `sigl_evtlog_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_evtlog_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `evt_datetime` datetime DEFAULT NULL,
  `evt_type` int unsigned DEFAULT NULL,
  `evt_name` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_data`),
  KEY `id_owner` (`id_owner`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_evtlog_data`
--

LOCK TABLES `sigl_evtlog_data` WRITE;
/*!40000 ALTER TABLE `sigl_evtlog_data` DISABLE KEYS */;
INSERT INTO `sigl_evtlog_data` VALUES (1,1,'2017-08-29 15:38:55',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(2,1,'2017-08-29 15:50:51',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(3,1,'2017-08-29 15:51:17',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(4,1,'2017-08-29 15:51:26',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(5,1,'2017-08-29 15:51:31',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(6,1,'2017-08-29 16:07:09',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(7,1,'2017-08-29 16:28:05',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(8,1,'2017-08-29 16:37:59',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(9,1,'2017-08-29 16:38:29',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(10,1,'2017-08-29 16:39:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(11,1,'2017-08-29 16:42:14',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(12,1,'2017-10-13 18:03:06',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(13,1,'2017-10-23 11:06:28',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(14,1,'2017-10-23 11:10:27',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(15,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(16,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(17,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(18,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(19,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(20,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(21,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(22,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(23,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(24,1,'2017-10-23 11:10:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(25,1,'2017-10-23 11:10:29',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(26,1,'2017-10-23 11:10:29',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(27,1,'2017-10-23 11:10:29',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(28,1,'2017-10-23 11:10:29',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(29,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(30,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(31,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(32,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(33,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(34,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(35,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(36,1,'2017-10-23 11:12:39',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(37,1,'2017-10-23 11:12:40',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(38,1,'2017-10-23 11:12:40',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(39,1,'2017-10-23 11:12:40',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(40,1,'2017-10-23 11:12:40',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(41,1,'2017-10-23 11:12:40',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(42,1,'2017-12-19 18:56:00',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(43,1,'2017-12-20 09:29:15',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(44,1,'2017-12-20 16:32:21',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(45,1,'2017-12-20 16:32:35',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(46,1,'2017-12-20 16:37:03',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(47,1,'2017-12-20 16:37:09',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(48,1,'2017-12-20 16:37:10',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(49,1,'2017-12-20 16:37:10',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(50,1,'2017-12-20 17:00:00',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(51,1,'2017-12-20 17:00:53',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(52,1,'2017-12-20 17:01:27',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(53,1,'2017-12-20 17:01:28',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(54,1,'2017-12-20 17:04:17',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(55,1,'2017-12-20 17:04:43',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(56,1,'2017-12-20 17:04:44',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(57,1,'2017-12-20 17:04:44',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(58,1,'2017-12-20 17:10:03',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(59,1,'2017-12-20 17:10:20',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(60,1,'2017-12-20 17:10:20',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(61,1,'2017-12-20 17:24:05',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(62,1,'2017-12-20 17:25:45',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(63,1,'2017-12-20 17:26:36',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(64,1,'2017-12-20 17:27:39',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(65,1,'2017-12-20 18:14:45',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(66,1,'2017-12-20 18:15:55',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(67,1,'2017-12-20 18:16:41',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(68,1,'2017-12-20 18:17:06',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(69,1,'2017-12-20 18:40:19',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(70,1,'2017-12-20 18:40:28',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(71,1,'2017-12-20 18:40:29',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(72,1,'2017-12-20 18:53:05',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(73,1,'2017-12-20 18:54:17',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(74,1,'2017-12-20 18:54:50',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(75,1,'2017-12-20 19:17:23',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(76,1,'2017-12-20 19:17:35',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(77,1,'2017-12-20 19:25:17',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(78,1,'2017-12-20 19:25:23',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(79,1,'2017-12-20 19:25:58',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(80,1,'2017-12-20 19:26:07',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(81,1,'2017-12-20 19:27:10',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(82,1,'2017-12-20 19:29:21',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(83,1,'2017-12-20 21:50:06',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(84,1,'2017-12-20 21:50:12',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(85,1,'2017-12-20 22:01:16',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(86,1,'2017-12-20 22:01:21',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(87,1,'2017-12-20 22:01:22',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(88,1,'2017-12-20 22:01:22',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(89,1,'2017-12-20 22:02:23',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(90,1,'2017-12-20 22:11:01',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(91,1,'2017-12-20 22:13:16',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(92,1,'2017-12-20 22:13:24',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(93,1,'2017-12-20 22:13:35',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(94,1,'2017-12-20 22:13:35',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(95,1,'2017-12-20 22:16:14',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(96,1,'2017-12-20 22:16:14',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(97,1,'2017-12-20 22:16:15',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(98,1,'2017-12-20 22:16:15',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(99,1,'2017-12-20 22:16:37',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(100,1,'2017-12-20 22:16:42',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(101,1,'2017-12-20 22:16:54',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(102,1,'2017-12-20 22:16:54',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(103,1,'2017-12-20 22:22:08',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(104,1,'2017-12-20 22:22:15',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(105,1,'2017-12-20 22:22:38',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(106,1,'2017-12-20 22:22:39',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(107,1,'2017-12-20 22:22:39',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(108,1,'2017-12-20 22:22:39',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(109,1,'2017-12-20 22:22:39',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(110,1,'2017-12-20 22:23:11',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(111,1,'2017-12-20 22:23:16',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(112,1,'2017-12-20 22:23:21',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(113,1,'2017-12-20 22:23:30',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(114,1,'2017-12-20 22:24:14',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(115,1,'2017-12-20 22:28:23',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(116,1,'2017-12-20 22:44:24',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(117,1,'2017-12-20 22:45:32',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(118,1,'2017-12-20 22:45:49',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(119,1,'2017-12-20 22:45:49',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(120,1,'2017-12-20 22:49:47',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(121,1,'2017-12-20 22:50:28',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(122,1,'2017-12-20 22:51:02',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(123,1,'2017-12-20 22:51:02',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(124,1,'2017-12-20 22:52:54',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(125,1,'2017-12-20 22:52:57',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(126,1,'2017-12-20 22:52:57',14,'VZN_REC_INSERT','Core_Library_Resource_XML_VarSet::SimpleInsertData'),(127,1,'2017-12-20 22:59:15',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(128,1,'2017-12-20 22:59:21',16,'VZN_REC_DELETE','Core_Library_Resource_XML_VarSet::SimpleDeleteData'),(129,1,'2017-12-21 09:13:45',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(130,NULL,'2019-04-02 11:33:42',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(131,NULL,'2019-04-02 11:33:43',15,'VZN_REC_UPDATE','Core_Library_Resource_XML_VarSet::SimpleUpdateData'),(132,1,'2020-03-06 09:29:03',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(133,1,'2020-03-09 09:49:05',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm'),(134,1,'2020-06-03 11:34:56',17,'VZN_EVT_CONNEXION','Core_Library_Controller_Auth_Index::_HandleAuthForm');
/*!40000 ALTER TABLE `sigl_evtlog_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_file_data`
--

DROP TABLE IF EXISTS `sigl_file_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_file_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `status` int DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `original_name` varchar(128) DEFAULT NULL,
  `generated_name` varchar(32) DEFAULT NULL,
  `size` int DEFAULT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `ext` varchar(8) DEFAULT NULL,
  `content_type` varchar(100) DEFAULT NULL,
  `id_storage` int unsigned DEFAULT NULL,
  `path` varchar(64) NOT NULL,
  PRIMARY KEY (`id_data`),
  KEY `idx_oname` (`original_name`),
  KEY `idx_gname` (`generated_name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_file_data`
--

LOCK TABLES `sigl_file_data` WRITE;
/*!40000 ALTER TABLE `sigl_file_data` DISABLE KEYS */;
INSERT INTO `sigl_file_data` VALUES (1,1,'2017-04-21 12:10:29','2025-06-05 01:00:23',100,1,'2017-04-21 12:10:28','Laboratory Quality Management System.pdf','a69fa918a5e8034f177666d6c4a55cf9',3947344,'3aedce75e45963cd42ab13d38e9c152b','pdf','application/pdf',1,'a6/9f/'),(2,1,'2017-04-21 12:12:03','2025-06-05 01:00:23',100,1,'2017-04-21 12:12:03','Laboratory Quality Management System.pdf','c3639f168cb57b598756cfa6afcf7e3e',6191879,'5459492907b860fb911d0a63de9fef74','pdf','application/pdf',1,'c3/63/'),(3,1,'2017-04-21 12:13:48','2025-06-05 01:00:23',100,1,'2017-04-21 12:13:48','Equipment Maintenance Manual.pdf','8b3c07729c252dddc70ae954e9abcf29',2668523,'099db95d73257fabe46a474cd778b135','pdf','application/pdf',1,'8b/3c/'),(4,1,'2017-04-21 12:14:35','2025-06-05 01:00:23',100,1,'2017-04-21 12:14:35','Maintenance Manual.pdf','f5c89bc1e688413de27954552c85e815',2939236,'a0a83c74a49afbb601dbe9cc69b03c73','pdf','application/pdf',1,'f5/c8/'),(9,1,'2017-04-21 12:34:54','2025-06-05 01:00:23',100,1,'2017-04-21 12:34:54','Guidance on regulations for the transport of infectious substances 2023-2024.pdf','31dddf91a9c9ecaf3795cd857ca8ba86',1165974,'c4eba2b5088578af224f9b4285b7564d','pdf','application/pdf',1,'31/dd/'),(11,1,'2017-04-21 12:35:51','2025-06-05 01:00:23',100,1,'2017-04-21 12:35:51','EQA - WHO.pdf','0d1eadb6cb164ef792493a39d225f748',1386265,'5c2d3540e6ee45cbebabe6e0b157acac','pdf','application/pdf',1,'0d/1e/'),(14,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4.pdf','7631273b506e08bedb54bb635949299a',3142655,'20f75956e0a807e954d3a4faad14e0f8','pdf','application/pdf',1,'76/31/'),(15,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4_Risk_Assessment.pdf','d43b5882e7c909ee1bdc5cc74334b0ba',2909550,'4e259c8d7cc50adfcef79ccb1f749682','pdf','application/pdf',1,'d4/3b/'),(16,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4_Laboratory_design_and_maintenance.pdf','637172a076c1d0803f50a6675a60a624',725013,'2fcf2f896eb6c2606da1e8fac91194b9','pdf','application/pdf',1,'63/71/'),(17,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4_Biological_safety_cabinets.pdf','88e1f09a873093346b110f653ad048c5',970693,'157a5d381ece843ba01bdfd41a90dcb2','pdf','application/pdf',1,'88/e1/'),(18,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4_Personal_protective_equipment.pdf','c723bddda72c8633e79da3aa01ebacc3',3476881,'206fce518ae53429f33623250b782348','pdf','application/pdf',1,'c7/23/'),(19,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4_Decontamination_and_waste_management.pdf','f82c0fb67ea9b2e9c309cfe5fe2de5c4',715596,'0f8bb8d9f9cc22336c951252ef8762cb','pdf','application/pdf',1,'f8/2c/'),(20,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4_Biosafety_programme_management.pdf','c36e578c2125b7aa8c5da4d1bfd38944',837739,'7dad41cae2ac4467f76d6a0764cb3af1','pdf','application/pdf',1,'c3/6e/'),(21,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','LBM4_Outbreak_preparedness_and_resilience.pdf','53b11253ac64bdde755a94c9f2564b24',1156566,'fbf3875adea9bcd9c4ef297e65b4b216','pdf','application/pdf',1,'53/b1/'),(22,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','CASFM_Recommendations_2024_v1.0.pdf','65d69cdaf3ca25e83840c93bf571e6ea',8045852,'44d69b97c9655a79de184ef0805d6ec3','pdf','application/pdf',1,'65/d6/'),(23,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','EUCAST_Breakpoint_tables_v15.0_2025.pdf','8c42586eb5e771edd6f94ce1be236c05',3853956,'5abc924f62ab32fb746c8d09e43257f0','pdf','application/pdf',1,'8c/42/'),(24,1,'2022-02-28 14:44:03','2025-06-05 01:00:23',100,1,'2022-02-28 14:44:03','EUCAST_Dosages_v15.0_2025.pdf','a3f92e0209158407a5d059e7325657a8',3709284,'f6cce322e79234fa6cade7a5699a56f8','pdf','application/pdf',1,'a3/f9/');
/*!40000 ALTER TABLE `sigl_file_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_fournisseurs_data`
--

DROP TABLE IF EXISTS `sigl_fournisseurs_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_fournisseurs_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `fournisseur_nom` varchar(255) DEFAULT NULL,
  `contact_nom` varchar(255) DEFAULT NULL,
  `contact_prenom` varchar(255) DEFAULT NULL,
  `contact_fonction` varchar(255) DEFAULT NULL,
  `fournisseur_adresse` text,
  `contact_tel` varchar(255) DEFAULT NULL,
  `contact_mobile` varchar(255) DEFAULT NULL,
  `contact_fax` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `commentaire` text,
  `supp_critical` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_fournisseurs_data`
--

LOCK TABLES `sigl_fournisseurs_data` WRITE;
/*!40000 ALTER TABLE `sigl_fournisseurs_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_fournisseurs_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_manuels_data`
--

DROP TABLE IF EXISTS `sigl_manuels_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_manuels_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `redacteur_id` int unsigned DEFAULT NULL,
  `verificateur_id` int unsigned DEFAULT NULL,
  `approbateur_id` int unsigned DEFAULT NULL,
  `section` int unsigned DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  `date_apply` date DEFAULT NULL,
  `date_insert` date DEFAULT NULL,
  `date_revue` date DEFAULT NULL,
  `man_mas` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_manuels_data`
--

LOCK TABLES `sigl_manuels_data` WRITE;
/*!40000 ALTER TABLE `sigl_manuels_data` DISABLE KEYS */;
INSERT INTO `sigl_manuels_data` VALUES (1,1,'2017-04-21 12:10:55','2017-04-21 12:10:55',100,'Systéme de gestion de la qualité au Laboratoire',NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,0),(2,1,'2017-04-21 12:12:32','2017-04-21 12:12:32',100,'Laboratory Quality Management System',NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,0),(3,1,'2017-04-21 12:14:07','2017-04-21 12:14:07',100,'Manuel d\'entretien et maintenance',NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,0),(4,1,'2017-04-21 12:14:55','2017-04-21 12:14:55',100,'Maintenance Manual',NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,0),(7,1,'2017-04-21 12:34:59','2017-04-21 12:34:59',100,'Guidance on regulations for the transport of infectious substances 2023-2024',NULL,1,1,1,NULL,'2025-06-05',NULL,NULL,NULL,0),(9,1,'2017-04-21 12:36:12','2017-06-15 18:58:29',1010,'EQA - WHO',NULL,1,1,1,NULL,NULL,NULL,NULL,NULL,0),(12,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed.','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(13,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed. Risk Assessment','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(14,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed. Laboratory design and maintenance','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(15,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed. Biological safety cabinets','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(16,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed. Personal protective equipment','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(17,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed. Decontamination and waste management','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(18,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed. Biosafety programme management','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(19,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'Laboratory biosafety manual 4th ed. Outbreak preparedness and resilience','',0,0,0,0,'2022-02-28','2022-02-28','2022-02-28',NULL,0),(20,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'CASFM Recommandations 2024 v1.0','',0,0,0,0,'2025-06-05','2022-02-28','2022-02-28',NULL,0),(21,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'EUCAST Breakpoint tables for interpretation of MICs and zone diameters v15.0 2025','',0,0,0,0,'2025-06-05','2022-02-28','2022-02-28',NULL,0),(22,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'EUCAST Dosages v15.0 2025','',0,0,0,0,'2025-06-05','2022-02-28','2022-02-28',NULL,0);
/*!40000 ALTER TABLE `sigl_manuels_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_non_conformite_data`
--

DROP TABLE IF EXISTS `sigl_non_conformite_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_non_conformite_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `pre_analytique` int unsigned DEFAULT NULL,
  `analytique` int unsigned DEFAULT NULL,
  `post_analytique` int unsigned DEFAULT NULL,
  `transmission_resultats` int unsigned DEFAULT NULL,
  `rh` int unsigned DEFAULT NULL,
  `equipements` int unsigned DEFAULT NULL,
  `reactifs_consommables` int unsigned DEFAULT NULL,
  `locaux_environnement` int unsigned DEFAULT NULL,
  `systemes_informatiques` int unsigned DEFAULT NULL,
  `sous_traitance` int unsigned DEFAULT NULL,
  `reclamations_clients` int unsigned DEFAULT NULL,
  `pre_analytique_prescription` int unsigned DEFAULT NULL,
  `pre_analytique_oubli_examen_error` int unsigned DEFAULT NULL,
  `pre_analytique_dossier_pat` int unsigned DEFAULT NULL,
  `pre_analytique_prel` int unsigned DEFAULT NULL,
  `pre_analytique_heure_prel` int unsigned DEFAULT NULL,
  `pre_analytique_vol_prel` int unsigned DEFAULT NULL,
  `pre_analytique_ident_prel` int unsigned DEFAULT NULL,
  `pre_analytique_renseignement_clin` int unsigned DEFAULT NULL,
  `pre_analytique_transport_echant` int unsigned DEFAULT NULL,
  `pre_analytique_respect_proc` int unsigned DEFAULT NULL,
  `pre_analytique_urgence` int unsigned DEFAULT NULL,
  `pre_analytique_tracabilite` int unsigned DEFAULT NULL,
  `pre_analytique_autre` int unsigned DEFAULT NULL,
  `pre_analytique_autre_content` text,
  `analytique_conservation` int unsigned DEFAULT NULL,
  `analytique_urgence` int unsigned DEFAULT NULL,
  `analytique_centrifugation` int unsigned DEFAULT NULL,
  `analytique_aliquotage` int unsigned DEFAULT NULL,
  `analytique_ctrl_qualite_int` int unsigned DEFAULT NULL,
  `analytique_ctrl_qualite_ext` int unsigned DEFAULT NULL,
  `analytique_tracabilite` int unsigned DEFAULT NULL,
  `analytique_procedures` int unsigned DEFAULT NULL,
  `analytique_absence_resultat` int unsigned DEFAULT NULL,
  `analytique_critere_de_repasse` int unsigned DEFAULT NULL,
  `analytique_autre` int unsigned DEFAULT NULL,
  `analytique_autre_content` text,
  `post_analytique_dos_non_valide` int unsigned DEFAULT NULL,
  `post_analytique_validation_partiel` int unsigned DEFAULT NULL,
  `post_analytique_res_errone` int unsigned DEFAULT NULL,
  `post_analytique_absence_resultat` int unsigned DEFAULT NULL,
  `post_analytique_erreur_saisie` int unsigned DEFAULT NULL,
  `post_analytique_interpretation` int unsigned DEFAULT NULL,
  `post_analytique_presta_conseil` int unsigned DEFAULT NULL,
  `post_analytique_conservation` int unsigned DEFAULT NULL,
  `post_analytique_procedures` int unsigned DEFAULT NULL,
  `post_analytique_autre` int unsigned DEFAULT NULL,
  `post_analytique_autre_content` text,
  `transmission_resultats_non_transmis_patient` int unsigned DEFAULT NULL,
  `transmission_resultats_non_transmis_presc` int unsigned DEFAULT NULL,
  `transmission_resultats_acces_result` int unsigned DEFAULT NULL,
  `transmission_resultats_date_rendu` int unsigned DEFAULT NULL,
  `transmission_resultats_delai_non_resp` int unsigned DEFAULT NULL,
  `transmission_resultats_procedure` int unsigned DEFAULT NULL,
  `transmission_resultats_autre` int unsigned DEFAULT NULL,
  `transmission_resultats_autre_content` text,
  `rh_procedures` int unsigned DEFAULT NULL,
  `rh_absence` int unsigned DEFAULT NULL,
  `rh_habilitation` int unsigned DEFAULT NULL,
  `rh_aes_hygiene_secu` int unsigned DEFAULT NULL,
  `rh_autre` int unsigned DEFAULT NULL,
  `rh_autre_contenu` text,
  `equipements_etalonnage` int unsigned DEFAULT NULL,
  `equipements_calibration` int unsigned DEFAULT NULL,
  `equipements_alarme` int unsigned DEFAULT NULL,
  `equipements_panne` int unsigned DEFAULT NULL,
  `equipements_procedures` int unsigned DEFAULT NULL,
  `equipements_autre` int unsigned DEFAULT NULL,
  `equipements_autre_content` text,
  `reactifs_consommables_reception` int unsigned DEFAULT NULL,
  `reactifs_consommables_delais` int unsigned DEFAULT NULL,
  `reactifs_consommables_reactifs` int unsigned DEFAULT NULL,
  `reactifs_consommables_rupture` int unsigned DEFAULT NULL,
  `reactifs_consommables_destockage` int unsigned DEFAULT NULL,
  `reactifs_consommables_tracabilite` int unsigned DEFAULT NULL,
  `reactifs_consommables_autre` int unsigned DEFAULT NULL,
  `reactifs_consommables_autre_content` text,
  `locaux_environnement_nettoyage` int unsigned DEFAULT NULL,
  `locaux_environnement_entretien` int unsigned DEFAULT NULL,
  `locaux_environnement_coupure_elec` int unsigned DEFAULT NULL,
  `locaux_environnement_coupure_eau` int unsigned DEFAULT NULL,
  `locaux_environnement_dechets` int unsigned DEFAULT NULL,
  `locaux_environnement_autre` int unsigned DEFAULT NULL,
  `locaux_environnement_autre_content` text,
  `systemes_informatiques_absence` int unsigned DEFAULT NULL,
  `systemes_informatiques_erreur` int unsigned DEFAULT NULL,
  `systemes_informatiques_panne_reseau` int unsigned DEFAULT NULL,
  `systemes_informatiques_panne_systeme` int unsigned DEFAULT NULL,
  `systemes_informatiques_panne_materiel` int unsigned DEFAULT NULL,
  `systemes_informatiques_autre` int unsigned DEFAULT NULL,
  `systemes_informatiques_autre_content` text,
  `sous_traitance_delai` int unsigned DEFAULT NULL,
  `sous_traitance_erreur` int unsigned DEFAULT NULL,
  `sous_traitance_conservation` int unsigned DEFAULT NULL,
  `sous_traitance_facturation` int unsigned DEFAULT NULL,
  `sous_traitance_autre` int unsigned DEFAULT NULL,
  `sous_traitance_autre_content` text,
  `autre` int unsigned DEFAULT NULL,
  `autre_contenu` text,
  `reclamations_clients_contenu` text,
  `relation_dos_client` int unsigned DEFAULT NULL,
  `no_dos` varchar(255) DEFAULT NULL,
  `description` text,
  `impact_patient` int unsigned DEFAULT NULL,
  `impacts_perso_visit` int unsigned DEFAULT NULL,
  `traitement_quoi` text,
  `traitement_qui_id` int unsigned DEFAULT NULL,
  `traitement_quand` date DEFAULT NULL,
  `traitement_action_corrective` int unsigned DEFAULT NULL,
  `traitement_action_description` text,
  `traitement_date_real` date DEFAULT NULL,
  `traitement_correctif_responsable_id` int unsigned DEFAULT NULL,
  `cloture_commentaire` text,
  `cloture_validateur_id` int unsigned DEFAULT NULL,
  `cloture_date` date DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_non_conformite_data`
--

LOCK TABLES `sigl_non_conformite_data` WRITE;
/*!40000 ALTER TABLE `sigl_non_conformite_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_non_conformite_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_param_cr_data`
--

DROP TABLE IF EXISTS `sigl_param_cr_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_param_cr_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `entete` int unsigned DEFAULT NULL,
  `commentaire` int unsigned DEFAULT NULL,
  `report_pwd` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_param_cr_data`
--

LOCK TABLES `sigl_param_cr_data` WRITE;
/*!40000 ALTER TABLE `sigl_param_cr_data` DISABLE KEYS */;
INSERT INTO `sigl_param_cr_data` VALUES (1,1,NULL,NULL,NULL,1068,1049,'N');
/*!40000 ALTER TABLE `sigl_param_cr_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_pj_role`
--

DROP TABLE IF EXISTS `sigl_pj_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_pj_role` (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `label` varchar(100) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_role`),
  UNIQUE KEY `sigl_pj_role` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_pj_role`
--

LOCK TABLES `sigl_pj_role` WRITE;
/*!40000 ALTER TABLE `sigl_pj_role` DISABLE KEYS */;
INSERT INTO `sigl_pj_role` VALUES (1,'admin','Administrator','A'),(2,'biologist','Biologist','B'),(3,'technician','Technician','T'),(4,'secretary','Secretary','S'),(5,'technician_advanced','Senior Technician','TA'),(6,'technician_quality','Quality Technician','TQ'),(7,'secretary_advanced','Senior Secretary','SA'),(8,'quality_officer','Quality Officer','Q'),(9,'prescriber','Prescriber','P'),(10,'stock_manager','Stock Manager','K'),(11,'staff','Staff','Z'),(12,'laboratory','Laboratory','L'),(13,'api','API','API'),(14,'sampler','Sampler','SP'),(15,'agent','Agent','AGT');
/*!40000 ALTER TABLE `sigl_pj_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_pj_sequence`
--

DROP TABLE IF EXISTS `sigl_pj_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_pj_sequence` (
  `id_sequence` int unsigned NOT NULL AUTO_INCREMENT,
  `sid` varchar(32) NOT NULL DEFAULT '',
  `pattern` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `num` int unsigned NOT NULL,
  PRIMARY KEY (`id_sequence`),
  UNIQUE KEY `UNIQUE` (`sid`,`pattern`,`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_pj_sequence`
--

LOCK TABLES `sigl_pj_sequence` WRITE;
/*!40000 ALTER TABLE `sigl_pj_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_pj_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_procedures_data`
--

DROP TABLE IF EXISTS `sigl_procedures_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_procedures_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `date_insert` date DEFAULT NULL,
  `date_apply` date DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  `section` int unsigned DEFAULT NULL,
  `redacteur_id` int unsigned DEFAULT NULL,
  `verificateur_id` int unsigned DEFAULT NULL,
  `approbateur_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_procedures_data`
--

LOCK TABLES `sigl_procedures_data` WRITE;
/*!40000 ALTER TABLE `sigl_procedures_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_procedures_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_reunion_data`
--

DROP TABLE IF EXISTS `sigl_reunion_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_reunion_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `date` date DEFAULT NULL,
  `organisateur_id` int unsigned DEFAULT NULL,
  `type_reu` int unsigned DEFAULT NULL,
  `cr` text,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_reunion_data`
--

LOCK TABLES `sigl_reunion_data` WRITE;
/*!40000 ALTER TABLE `sigl_reunion_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `sigl_reunion_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_storage_data`
--

DROP TABLE IF EXISTS `sigl_storage_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_storage_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_storage_data`
--

LOCK TABLES `sigl_storage_data` WRITE;
/*!40000 ALTER TABLE `sigl_storage_data` DISABLE KEYS */;
INSERT INTO `sigl_storage_data` VALUES (1,1,'2022-02-28 14:44:03','2022-02-28 14:44:03',100,'/storage');
/*!40000 ALTER TABLE `sigl_storage_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sigl_user_data`
--

DROP TABLE IF EXISTS `sigl_user_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sigl_user_data` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(81) DEFAULT NULL,
  `titre` int unsigned DEFAULT NULL,
  `id_group` int unsigned NOT NULL DEFAULT '100',
  `email` varchar(200) DEFAULT NULL,
  `creation_date` date NOT NULL DEFAULT '0000-00-00',
  `expire_date` date DEFAULT NULL,
  `cps_id` varchar(30) DEFAULT NULL,
  `oauth_provider_id_user` int unsigned DEFAULT NULL,
  `locale` int unsigned NOT NULL DEFAULT '35',
  `rpps` varchar(11) DEFAULT NULL,
  `otp_phone_number` varchar(20) DEFAULT NULL,
  `initiale` varchar(5) DEFAULT NULL,
  `ddn` date DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `adresse` text,
  `tel` varchar(20) DEFAULT NULL,
  `darrive` date DEFAULT NULL,
  `cv` text,
  `diplome` text,
  `formation` text,
  `deval` date DEFAULT NULL,
  `section` int unsigned DEFAULT NULL,
  `commentaire` text,
  `side_account` int DEFAULT '0',
  `role_type` varchar(10) DEFAULT NULL,
  `status` varchar(10) NOT NULL,
  `role_pro` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_data`),
  KEY `sigl_user_data_ibfk_2` (`titre`),
  KEY `id_owner` (`id_owner`),
  KEY `sigl_user_data_locale_dico` (`locale`),
  KEY `idx_username` (`username`),
  KEY `idx_name` (`lastname`),
  KEY `idx_account` (`side_account`),
  KEY `idx_status` (`status`),
  KEY `idx_role_type` (`role_type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sigl_user_data`
--

LOCK TABLES `sigl_user_data` WRITE;
/*!40000 ALTER TABLE `sigl_user_data` DISABLE KEYS */;
INSERT INTO `sigl_user_data` VALUES (1,1,'','root','root','cc17e083ebaf055f7d0a3aefc5f966a013803805:5c5f181ddbfa496b6e84e5f3954be395510f8b26',NULL,100,NULL,'2015-12-15',NULL,NULL,0,35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'A','A',1),(2,1,'Bernard','BIO','biologiste','e87794f2c12892b936731468d5a2d5ff795fb012:4db86987d8f477116f80df0f393cde69fef8a59f',0,1001,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'B','A',3),(3,1,'Thierry','TECH','technicien','6c86c15cffeb53cb192a104bc4c0b7ccc0f6b70b:29a7a241aa4dc67bfa9302b1dfe26e0cbac6bfbf',0,1002,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'T','A',11),(4,1,'Thomas','TECHAVANCE','techav','06c3e0066d7122d8e0d56c4b7f6547fdabced768:8774fcb894ce9a7c18f9b282b6b50da2afde9cc3',0,1003,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'TA','A',12),(5,1,'Thibault','TECHQUALIT','techq','c4a59b7a6b523d7b96dec2eff991d1fe5306d2dd:26877721454a9f7f67bbbf84de08fac6db828df8',0,1004,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'TQ','A',13),(6,1,'Sophie','SECR','secretaire','f167ea8095fd02bdd6e956f51c2fb2403b20ecbe:070c514b5e43f43e476f9b3e82bdb7926ab95257',0,1005,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'S','A',9),(7,1,'Sylvie','SECRAV','secrav','5d771e9825b6f98422d469d6c79a9707b01dd892:014f23212d6e2554c847983936a77504e284451a',0,1006,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'SA','A',10),(8,1,'Quentin','QUALIT','qualiticien','7d8bd0cc70e922d9205235b88a836e787ba00c67:23f9fe9d846a9ca02f1cadfb38415fcdc5368d9d',0,1007,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'Q','A',8),(9,1,'Patrick','PRESCR','prescripteur','999c88ed65983b80619699068e5708132a482b43:d78d5eeac2eb5c251ccf5b542ab98222d36f5b7b',0,1008,'','2021-03-04',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',1,'P','A',7),(10,1,'Steven','STOCK','stock','d75975e82f17ea341a09ad9cf4658aebeb7aa5d6:dde08aaf72436ed75738581b27a79310ba3c5c53',0,1009,'','2023-10-09',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'K','A',4),(11,1,'Laurent','LABO','lab','e42cb39dec1437da1aa5a0168f512029bef4396f:8a2f53dd638a063d266fca56ca0331fa857654a4',260,1010,'','2023-10-09',NULL,'',NULL,35,'',NULL,'','0000-00-00','','','','0000-00-00','','','','0000-00-00',0,'',0,'L','A',5);
/*!40000 ALTER TABLE `sigl_user_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_setting`
--

DROP TABLE IF EXISTS `stock_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_setting` (
  `sos_ser` int NOT NULL AUTO_INCREMENT,
  `sos_date` datetime DEFAULT NULL,
  `sos_expir_warning` int NOT NULL DEFAULT '14',
  `sos_expir_alert` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`sos_ser`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_setting`
--

LOCK TABLES `stock_setting` WRITE;
/*!40000 ALTER TABLE `stock_setting` DISABLE KEYS */;
INSERT INTO `stock_setting` VALUES (1,'2025-06-05 01:00:21',14,0);
/*!40000 ALTER TABLE `stock_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_aliquot`
--

DROP TABLE IF EXISTS `storage_aliquot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_aliquot` (
  `sal_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sal_date` datetime DEFAULT NULL,
  `sal_user` int unsigned DEFAULT NULL,
  `sal_sample` int unsigned NOT NULL,
  `sal_patient` int unsigned NOT NULL,
  `sal_type` int unsigned NOT NULL,
  `sal_pathogen` int unsigned NOT NULL,
  `sal_box` int unsigned NOT NULL,
  `sal_coordinates` varchar(10) NOT NULL,
  `sal_in_stock` varchar(1) NOT NULL DEFAULT 'Y',
  `sal_stock_date` datetime DEFAULT NULL,
  PRIMARY KEY (`sal_ser`),
  KEY `sal_patient` (`sal_patient`),
  KEY `sal_patient_2` (`sal_patient`),
  KEY `sal_box` (`sal_box`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_aliquot`
--

LOCK TABLES `storage_aliquot` WRITE;
/*!40000 ALTER TABLE `storage_aliquot` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_aliquot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_box`
--

DROP TABLE IF EXISTS `storage_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_box` (
  `sbo_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sbo_date` datetime DEFAULT NULL,
  `sbo_user` int unsigned DEFAULT NULL,
  `sbo_compartment` int unsigned NOT NULL,
  `sbo_name` varchar(100) NOT NULL,
  `sbo_label` varchar(10) NOT NULL,
  `sbo_coordinates` varchar(10) NOT NULL,
  `sbo_dim_x` int NOT NULL,
  `sbo_dim_y` int NOT NULL,
  `sbo_full` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`sbo_ser`),
  KEY `sbo_compartment` (`sbo_compartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_box`
--

LOCK TABLES `storage_box` WRITE;
/*!40000 ALTER TABLE `storage_box` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_box` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_chamber`
--

DROP TABLE IF EXISTS `storage_chamber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_chamber` (
  `sch_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sch_date` datetime DEFAULT NULL,
  `sch_user` int unsigned DEFAULT NULL,
  `sch_room` int unsigned NOT NULL,
  `sch_name` varchar(100) NOT NULL,
  `sch_abbrev` varchar(10) NOT NULL,
  `sch_label` varchar(10) NOT NULL,
  PRIMARY KEY (`sch_ser`),
  KEY `sch_room` (`sch_room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_chamber`
--

LOCK TABLES `storage_chamber` WRITE;
/*!40000 ALTER TABLE `storage_chamber` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_chamber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_compartment`
--

DROP TABLE IF EXISTS `storage_compartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_compartment` (
  `sco_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sco_date` datetime DEFAULT NULL,
  `sco_user` int unsigned DEFAULT NULL,
  `sco_chamber` int unsigned NOT NULL,
  `sco_name` varchar(100) NOT NULL,
  `sco_abbrev` varchar(10) NOT NULL,
  `sco_label` varchar(10) NOT NULL,
  `sco_dim_x` int NOT NULL,
  `sco_dim_y` int NOT NULL,
  `sco_dim_z` int NOT NULL,
  PRIMARY KEY (`sco_ser`),
  KEY `sco_chamber` (`sco_chamber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_compartment`
--

LOCK TABLES `storage_compartment` WRITE;
/*!40000 ALTER TABLE `storage_compartment` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_compartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storage_room`
--

DROP TABLE IF EXISTS `storage_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage_room` (
  `sro_ser` int unsigned NOT NULL AUTO_INCREMENT,
  `sro_date` datetime DEFAULT NULL,
  `sro_user` int unsigned DEFAULT NULL,
  `sro_name` varchar(100) NOT NULL,
  `sro_abbrev` varchar(10) NOT NULL,
  `sro_label` varchar(10) NOT NULL,
  PRIMARY KEY (`sro_ser`),
  UNIQUE KEY `sro_abbrev` (`sro_abbrev`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage_room`
--

LOCK TABLES `storage_room` WRITE;
/*!40000 ALTER TABLE `storage_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `storage_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_setting`
--

DROP TABLE IF EXISTS `template_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `template_setting` (
  `tpl_ser` int NOT NULL AUTO_INCREMENT,
  `tpl_date` datetime DEFAULT NULL,
  `tpl_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tpl_file` varchar(40) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tpl_default` varchar(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tpl_type` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`tpl_ser`),
  KEY `tpl_name` (`tpl_name`),
  KEY `tpl_type` (`tpl_type`),
  KEY `tpl_default` (`tpl_default`),
  KEY `idx_tpl_file` (`tpl_file`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_setting`
--

LOCK TABLES `template_setting` WRITE;
/*!40000 ALTER TABLE `template_setting` DISABLE KEYS */;
INSERT INTO `template_setting` VALUES (1,'2022-02-28 14:44:04','Result template','template_result.odt','Y','RES'),(2,'2022-02-28 14:44:04','Right-to-left result template','template_result-RtL.odt','N','RES'),(3,'2022-02-28 14:44:04','Label template','template_sticker.odt','Y','STI'),(4,'2022-02-28 14:44:05','Result template with QR code','tpl_result_one_qrcode.odt','N','RES'),(5,'2022-02-28 14:44:05','QR code template','template_qrcode.toml','Y','QRC'),(6,'2025-06-05 01:00:21','Transfer form template','tpl_outsourced.odt','Y','OUT'),(7,'2025-06-05 01:00:23','Invoice template','tpl_invoice.odt','Y','INV'),(8,'2026-01-28 17:06:28','Billing status template','tpl_billing_status.odt','Y','BIL'),(9,'2026-01-28 17:06:28','Activity report template','tpl_activity_report.odt','Y','ACT');
/*!40000 ALTER TABLE `template_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trace_download`
--

DROP TABLE IF EXISTS `trace_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trace_download` (
  `trd_ser` int NOT NULL AUTO_INCREMENT,
  `trd_date` datetime DEFAULT NULL,
  `trd_last_access` datetime DEFAULT NULL,
  `trd_type` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `trd_ref` int NOT NULL,
  `trd_user` int NOT NULL,
  PRIMARY KEY (`trd_ser`),
  KEY `trd_type` (`trd_type`),
  KEY `trd_ref` (`trd_ref`),
  KEY `trd_user` (`trd_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trace_download`
--

LOCK TABLES `trace_download` WRITE;
/*!40000 ALTER TABLE `trace_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `trace_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `tra_ser` int NOT NULL AUTO_INCREMENT,
  `tra_date` datetime DEFAULT NULL,
  `tra_lang` varchar(6) NOT NULL,
  `tra_ref` int DEFAULT '0',
  `tra_type` varchar(10) NOT NULL,
  `tra_text` text,
  PRIMARY KEY (`tra_ser`),
  KEY `tra_lang` (`tra_lang`),
  KEY `tra_type` (`tra_type`),
  KEY `tra_ref` (`tra_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_cv_file`
--

DROP TABLE IF EXISTS `user_cv_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_cv_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_cv_file`
--

LOCK TABLES `user_cv_file` WRITE;
/*!40000 ALTER TABLE `user_cv_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_cv_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_diploma_file`
--

DROP TABLE IF EXISTS `user_diploma_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_diploma_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_diploma_file`
--

LOCK TABLES `user_diploma_file` WRITE;
/*!40000 ALTER TABLE `user_diploma_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_diploma_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_evaluation_file`
--

DROP TABLE IF EXISTS `user_evaluation_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_evaluation_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_evaluation_file`
--

LOCK TABLES `user_evaluation_file` WRITE;
/*!40000 ALTER TABLE `user_evaluation_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_evaluation_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `usp_ser` int NOT NULL AUTO_INCREMENT,
  `usp_date` datetime DEFAULT NULL,
  `usp_by_user` int DEFAULT '0',
  `usp_user` int DEFAULT '0',
  `usp_prp` int NOT NULL,
  `usp_granted` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`usp_ser`),
  KEY `usp_user` (`usp_user`),
  KEY `usp_prp` (`usp_prp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_signature_file`
--

DROP TABLE IF EXISTS `user_signature_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_signature_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_signature_file`
--

LOCK TABLES `user_signature_file` WRITE;
/*!40000 ALTER TABLE `user_signature_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_signature_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_training_file`
--

DROP TABLE IF EXISTS `user_training_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_training_file` (
  `id_data` int unsigned NOT NULL AUTO_INCREMENT,
  `id_owner` int unsigned DEFAULT NULL,
  `sys_creation_date` datetime DEFAULT NULL,
  `sys_last_mod_date` datetime DEFAULT NULL,
  `sys_last_mod_user` int unsigned DEFAULT NULL,
  `id_ext` int unsigned DEFAULT NULL,
  `id_file` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_data`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_training_file`
--

LOCK TABLES `user_training_file` WRITE;
/*!40000 ALTER TABLE `user_training_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_training_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zip_city`
--

DROP TABLE IF EXISTS `zip_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zip_city` (
  `zic_ser` int NOT NULL AUTO_INCREMENT,
  `zic_date` datetime DEFAULT NULL,
  `zic_zip` varchar(10) DEFAULT NULL,
  `zic_city` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`zic_ser`),
  KEY `zic_zip` (`zic_zip`),
  KEY `zic_city` (`zic_city`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zip_city`
--

LOCK TABLES `zip_city` WRITE;
/*!40000 ALTER TABLE `zip_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `zip_city` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-28 17:06:33
