/*
SQLyog Ultimate v9.01 
MySQL - 5.1.73-community : Database - hqdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `eam_action` */

DROP TABLE IF EXISTS `eam_action`;

CREATE TABLE `eam_action` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CLASSNAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `CONFIG` blob,
  `PARENT_ID` int(11) DEFAULT NULL,
  `ALERT_DEFINITION_ID` int(11) DEFAULT NULL,
  `DELETED` bit(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_action` */

LOCK TABLES `eam_action` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_agent` */

DROP TABLE IF EXISTS `eam_agent`;

CREATE TABLE `eam_agent` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `ADDRESS` varchar(255) COLLATE utf8_bin NOT NULL,
  `PORT` int(11) NOT NULL,
  `AUTHTOKEN` varchar(100) COLLATE utf8_bin NOT NULL,
  `AGENTTOKEN` varchar(100) COLLATE utf8_bin NOT NULL,
  `VERSION` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `UNIDIRECTIONAL` bit(1) NOT NULL,
  `PLUGIN_INVENTORY_CHECKSUM` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  `LAST_PLUGIN_INVENTORY_CHECKIN` bigint(20) NOT NULL DEFAULT '0',
  `AGENT_TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AGENTTOKEN` (`AGENTTOKEN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_agent` */

LOCK TABLES `eam_agent` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_agent_plugin_status` */

DROP TABLE IF EXISTS `eam_agent_plugin_status`;

CREATE TABLE `eam_agent_plugin_status` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `AGENT_ID` int(11) NOT NULL,
  `FILE_NAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `PRODUCT_NAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `PLUGIN_NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `MD5` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LAST_CHECKIN` bigint(20) NOT NULL,
  `LAST_SYNC_STATUS` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `LAST_SYNC_ATTEMPT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_agent_plugin_status` */

LOCK TABLES `eam_agent_plugin_status` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_agent_type` */

DROP TABLE IF EXISTS `eam_agent_type`;

CREATE TABLE `eam_agent_type` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_agent_type` */

LOCK TABLES `eam_agent_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_aiq_ip` */

DROP TABLE IF EXISTS `eam_aiq_ip`;

CREATE TABLE `eam_aiq_ip` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `AIQ_PLATFORM_ID` int(11) DEFAULT NULL,
  `ADDRESS` varchar(64) COLLATE utf8_bin NOT NULL,
  `NETMASK` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `MAC_ADDRESS` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `QUEUESTATUS` int(11) DEFAULT NULL,
  `DIFF` bigint(20) DEFAULT NULL,
  `IGNORED` bit(1) DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AIQ_PLATFORM_ID` (`AIQ_PLATFORM_ID`,`ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_aiq_ip` */

LOCK TABLES `eam_aiq_ip` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_aiq_platform` */

DROP TABLE IF EXISTS `eam_aiq_platform`;

CREATE TABLE `eam_aiq_platform` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `OS` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `OSVERSION` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `ARCH` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `FQDN` varchar(200) COLLATE utf8_bin NOT NULL,
  `AGENTTOKEN` varchar(100) COLLATE utf8_bin NOT NULL,
  `CERTDN` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `QUEUESTATUS` int(11) DEFAULT NULL,
  `DIFF` bigint(20) DEFAULT NULL,
  `IGNORED` bit(1) DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `LASTAPPROVED` bigint(20) DEFAULT NULL,
  `LOCATION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `CPU_SPEED` int(11) DEFAULT NULL,
  `CPU_COUNT` int(11) DEFAULT NULL,
  `RAM` int(11) DEFAULT NULL,
  `GATEWAY` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DHCP_SERVER` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DNS_SERVER` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CUSTOM_PROPERTIES` blob,
  `PRODUCT_CONFIG` blob,
  `CONTROL_CONFIG` blob,
  `MEASUREMENT_CONFIG` blob,
  `AUTO_APPROVE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `FQDN` (`FQDN`),
  UNIQUE KEY `CERTDN` (`CERTDN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_aiq_platform` */

LOCK TABLES `eam_aiq_platform` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_aiq_server` */

DROP TABLE IF EXISTS `eam_aiq_server`;

CREATE TABLE `eam_aiq_server` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `AIQ_PLATFORM_ID` int(11) DEFAULT NULL,
  `AUTOINVENTORYIDENTIFIER` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_bin DEFAULT 't',
  `SERVERTYPENAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `INSTALLPATH` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SERVICESAUTOMANAGED` bit(1) DEFAULT NULL,
  `CUSTOM_PROPERTIES` blob,
  `PRODUCT_CONFIG` blob,
  `CONTROL_CONFIG` blob,
  `RESPONSETIME_CONFIG` blob,
  `MEASUREMENT_CONFIG` blob,
  `QUEUESTATUS` int(11) DEFAULT NULL,
  `DIFF` bigint(20) DEFAULT NULL,
  `IGNORED` bit(1) DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `AUTO_APPROVE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `AIQ_PLATFORM_ID` (`AIQ_PLATFORM_ID`,`AUTOINVENTORYIDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_aiq_server` */

LOCK TABLES `eam_aiq_server` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_aiq_service` */

DROP TABLE IF EXISTS `eam_aiq_service`;

CREATE TABLE `eam_aiq_service` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `SERVICETYPENAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `QUEUESTATUS` int(11) DEFAULT NULL,
  `DIFF` bigint(20) DEFAULT NULL,
  `IGNORED` bit(1) DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `CUSTOM_PROPERTIES` blob,
  `PRODUCT_CONFIG` blob,
  `CONTROL_CONFIG` blob,
  `MEASUREMENT_CONFIG` blob,
  `RESPONSETIME_CONFIG` blob,
  `SERVER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_aiq_service` */

LOCK TABLES `eam_aiq_service` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_alert` */

DROP TABLE IF EXISTS `eam_alert`;

CREATE TABLE `eam_alert` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CTIME` bigint(20) NOT NULL,
  `FIXED` bit(1) NOT NULL,
  `ALERT_DEFINITION_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_alert` */

LOCK TABLES `eam_alert` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_alert_action_log` */

DROP TABLE IF EXISTS `eam_alert_action_log`;

CREATE TABLE `eam_alert_action_log` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP` bigint(20) NOT NULL,
  `DETAIL` varchar(500) COLLATE utf8_bin NOT NULL,
  `ALERT_ID` int(11) DEFAULT NULL,
  `ALERT_TYPE` int(11) NOT NULL,
  `ACTION_ID` int(11) DEFAULT NULL,
  `SUBJECT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_alert_action_log` */

LOCK TABLES `eam_alert_action_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_alert_condition` */

DROP TABLE IF EXISTS `eam_alert_condition`;

CREATE TABLE `eam_alert_condition` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `TYPE` int(11) NOT NULL,
  `REQUIRED` bit(1) NOT NULL,
  `MEASUREMENT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `COMPARATOR` varchar(2) COLLATE utf8_bin DEFAULT NULL,
  `THRESHOLD` double DEFAULT NULL,
  `OPTION_STATUS` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `ALERT_DEFINITION_ID` int(11) DEFAULT NULL,
  `TRIGGER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_alert_condition` */

LOCK TABLES `eam_alert_condition` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_alert_condition_log` */

DROP TABLE IF EXISTS `eam_alert_condition_log`;

CREATE TABLE `eam_alert_condition_log` (
  `ID` int(11) NOT NULL,
  `VALUE` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `ALERT_ID` int(11) DEFAULT NULL,
  `CONDITION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_alert_condition_log` */

LOCK TABLES `eam_alert_condition_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_alert_def_state` */

DROP TABLE IF EXISTS `eam_alert_def_state`;

CREATE TABLE `eam_alert_def_state` (
  `ALERT_DEFINITION_ID` int(11) NOT NULL,
  `LAST_FIRED` bigint(20) NOT NULL,
  PRIMARY KEY (`ALERT_DEFINITION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_alert_def_state` */

LOCK TABLES `eam_alert_def_state` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_alert_definition` */

DROP TABLE IF EXISTS `eam_alert_definition`;

CREATE TABLE `eam_alert_definition` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `CTIME` bigint(20) NOT NULL,
  `MTIME` bigint(20) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `ACTIVE` bit(1) NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  `FREQUENCY_TYPE` int(11) NOT NULL,
  `COUNT` bigint(20) DEFAULT NULL,
  `TRANGE` bigint(20) DEFAULT NULL,
  `WILL_RECOVER` bit(1) NOT NULL,
  `NOTIFY_FILTERED` bit(1) NOT NULL,
  `CONTROL_FILTERED` bit(1) NOT NULL,
  `DELETED` bit(1) NOT NULL,
  `ESCALATION_ID` int(11) DEFAULT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_alert_definition` */

LOCK TABLES `eam_alert_definition` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_app_service` */

DROP TABLE IF EXISTS `eam_app_service`;

CREATE TABLE `eam_app_service` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `SERVICE_ID` int(11) DEFAULT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `APPLICATION_ID` int(11) DEFAULT NULL,
  `ISGROUP` bit(1) NOT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `MODIFIED_BY` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FENTRY_POINT` bit(1) NOT NULL,
  `SERVICE_TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SERVICE_ID` (`SERVICE_ID`,`GROUP_ID`,`APPLICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_app_service` */

LOCK TABLES `eam_app_service` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_app_type_service_type_map` */

DROP TABLE IF EXISTS `eam_app_type_service_type_map`;

CREATE TABLE `eam_app_type_service_type_map` (
  `APPLICATION_TYPE_ID` int(11) NOT NULL DEFAULT '0',
  `SERVICE_TYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`SERVICE_TYPE_ID`,`APPLICATION_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_app_type_service_type_map` */

LOCK TABLES `eam_app_type_service_type_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_application` */

DROP TABLE IF EXISTS `eam_application`;

CREATE TABLE `eam_application` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `MODIFIED_BY` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `ENG_CONTACT` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OPS_CONTACT` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `BUS_CONTACT` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `APPLICATION_TYPE_ID` int(11) NOT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_application` */

LOCK TABLES `eam_application` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_application_type` */

DROP TABLE IF EXISTS `eam_application_type`;

CREATE TABLE `eam_application_type` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `SORT_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_application_type` */

LOCK TABLES `eam_application_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_audit` */

DROP TABLE IF EXISTS `eam_audit`;

CREATE TABLE `eam_audit` (
  `ID` int(11) NOT NULL,
  `KLAZZ` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `START_TIME` bigint(20) NOT NULL,
  `END_TIME` bigint(20) NOT NULL,
  `NATURE` int(11) NOT NULL,
  `PURPOSE` int(11) NOT NULL,
  `IMPORTANCE` int(11) NOT NULL,
  `ORIGINAL` bit(1) NOT NULL,
  `FIELD` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `OLD_VAL` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `NEW_VAL` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_bin NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `SUBJECT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_audit` */

LOCK TABLES `eam_audit` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_autoinv_history` */

DROP TABLE IF EXISTS `eam_autoinv_history`;

CREATE TABLE `eam_autoinv_history` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `GROUP_ID` int(11) DEFAULT NULL,
  `BATCH_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SUBJECT` varchar(32) COLLATE utf8_bin NOT NULL,
  `SCHEDULED` bit(1) NOT NULL,
  `DATE_SCHEDULED` bigint(20) NOT NULL,
  `STARTTIME` bigint(20) NOT NULL,
  `STATUS` varchar(64) COLLATE utf8_bin NOT NULL,
  `ENDTIME` bigint(20) NOT NULL,
  `DURATION` bigint(20) NOT NULL,
  `SCANNAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCANDESC` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `CONFIG` blob NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_autoinv_history` */

LOCK TABLES `eam_autoinv_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_autoinv_schedule` */

DROP TABLE IF EXISTS `eam_autoinv_schedule`;

CREATE TABLE `eam_autoinv_schedule` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_TYPE` int(11) NOT NULL,
  `SUBJECT` varchar(32) COLLATE utf8_bin NOT NULL,
  `SCHEDULEVALUEBYTES` blob,
  `NEXTFIRETIME` bigint(20) NOT NULL,
  `TRIGGERNAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `JOBNAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `JOB_ORDER_DATA` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `SCANNAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SCANDESC` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CONFIG` blob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TRIGGERNAME` (`TRIGGERNAME`),
  UNIQUE KEY `JOBNAME` (`JOBNAME`),
  UNIQUE KEY `SCANNAME` (`SCANNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_autoinv_schedule` */

LOCK TABLES `eam_autoinv_schedule` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_calendar` */

DROP TABLE IF EXISTS `eam_calendar`;

CREATE TABLE `eam_calendar` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_calendar` */

LOCK TABLES `eam_calendar` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_calendar_ent` */

DROP TABLE IF EXISTS `eam_calendar_ent`;

CREATE TABLE `eam_calendar_ent` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CALENDAR_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_calendar_ent` */

LOCK TABLES `eam_calendar_ent` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_calendar_week` */

DROP TABLE IF EXISTS `eam_calendar_week`;

CREATE TABLE `eam_calendar_week` (
  `CALENDAR_WEEK_ID` int(11) NOT NULL,
  `weekDay` int(11) NOT NULL,
  `startTime` int(11) NOT NULL,
  `endTime` int(11) NOT NULL,
  PRIMARY KEY (`CALENDAR_WEEK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_calendar_week` */

LOCK TABLES `eam_calendar_week` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_config_props` */

DROP TABLE IF EXISTS `eam_config_props`;

CREATE TABLE `eam_config_props` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `PREFIX` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `PROPKEY` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `PROPVALUE` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `DEFAULT_PROPVALUE` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `FREAD_ONLY` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PREFIX` (`PREFIX`,`PROPKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_config_props` */

LOCK TABLES `eam_config_props` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_config_response` */

DROP TABLE IF EXISTS `eam_config_response`;

CREATE TABLE `eam_config_response` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `PRODUCT_RESPONSE` blob,
  `CONTROL_RESPONSE` blob,
  `MEASUREMENT_RESPONSE` blob,
  `AUTOINVENTORY_RESPONSE` blob,
  `RESPONSE_TIME_RESPONSE` blob,
  `USERMANAGED` bit(1) NOT NULL,
  `VALIDATIONERR` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_config_response` */

LOCK TABLES `eam_config_response` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_control_history` */

DROP TABLE IF EXISTS `eam_control_history`;

CREATE TABLE `eam_control_history` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `GROUP_ID` int(11) DEFAULT NULL,
  `BATCH_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SUBJECT` varchar(32) COLLATE utf8_bin NOT NULL,
  `SCHEDULED` bit(1) NOT NULL,
  `DATE_SCHEDULED` bigint(20) NOT NULL,
  `STARTTIME` bigint(20) NOT NULL,
  `STATUS` varchar(64) COLLATE utf8_bin NOT NULL,
  `ENDTIME` bigint(20) NOT NULL,
  `DESCRIPTION` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `ACTION` varchar(32) COLLATE utf8_bin NOT NULL,
  `ARGS` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_control_history` */

LOCK TABLES `eam_control_history` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_control_schedule` */

DROP TABLE IF EXISTS `eam_control_schedule`;

CREATE TABLE `eam_control_schedule` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_TYPE` int(11) NOT NULL,
  `SUBJECT` varchar(32) COLLATE utf8_bin NOT NULL,
  `SCHEDULEVALUEBYTES` blob NOT NULL,
  `NEXTFIRETIME` bigint(20) NOT NULL,
  `TRIGGERNAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `JOBNAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `JOB_ORDER_DATA` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `ACTION` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TRIGGERNAME` (`TRIGGERNAME`),
  UNIQUE KEY `JOBNAME` (`JOBNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_control_schedule` */

LOCK TABLES `eam_control_schedule` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_cprop` */

DROP TABLE IF EXISTS `eam_cprop`;

CREATE TABLE `eam_cprop` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `APPDEF_ID` int(11) NOT NULL,
  `KEYID` int(11) NOT NULL,
  `VALUE_IDX` int(11) NOT NULL,
  `PROPVALUE` varchar(1000) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `APPDEF_ID` (`APPDEF_ID`,`KEYID`,`VALUE_IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_cprop` */

LOCK TABLES `eam_cprop` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_cprop_key` */

DROP TABLE IF EXISTS `eam_cprop_key`;

CREATE TABLE `eam_cprop_key` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `APPDEF_TYPE` int(11) NOT NULL,
  `APPDEF_TYPEID` int(11) NOT NULL,
  `PROPKEY` varchar(100) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `APPDEF_TYPE` (`APPDEF_TYPE`,`APPDEF_TYPEID`,`PROPKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_cprop_key` */

LOCK TABLES `eam_cprop_key` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_crispo` */

DROP TABLE IF EXISTS `eam_crispo`;

CREATE TABLE `eam_crispo` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_crispo` */

LOCK TABLES `eam_crispo` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_crispo_array` */

DROP TABLE IF EXISTS `eam_crispo_array`;

CREATE TABLE `eam_crispo_array` (
  `OPT_ID` int(11) NOT NULL,
  `VAL` varchar(4000) COLLATE utf8_bin NOT NULL,
  `IDX` int(11) NOT NULL,
  PRIMARY KEY (`OPT_ID`,`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_crispo_array` */

LOCK TABLES `eam_crispo_array` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_crispo_opt` */

DROP TABLE IF EXISTS `eam_crispo_opt`;

CREATE TABLE `eam_crispo_opt` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `PROPKEY` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAL` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CRISPO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_crispo_opt` */

LOCK TABLES `eam_crispo_opt` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_dash_config` */

DROP TABLE IF EXISTS `eam_dash_config`;

CREATE TABLE `eam_dash_config` (
  `ID` int(11) NOT NULL,
  `CONFIG_TYPE` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `CRISPO_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_ID` (`USER_ID`),
  UNIQUE KEY `ROLE_ID` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_dash_config` */

LOCK TABLES `eam_dash_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_error_code` */

DROP TABLE IF EXISTS `eam_error_code`;

CREATE TABLE `eam_error_code` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CODE` int(11) NOT NULL,
  `DESCRIPTION` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_error_code` */

LOCK TABLES `eam_error_code` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_escalation` */

DROP TABLE IF EXISTS `eam_escalation`;

CREATE TABLE `eam_escalation` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `ALLOW_PAUSE` bit(1) NOT NULL,
  `MAX_WAIT_TIME` bigint(20) NOT NULL,
  `NOTIFY_ALL` bit(1) NOT NULL,
  `CTIME` bigint(20) NOT NULL,
  `MTIME` bigint(20) NOT NULL,
  `FREPEAT` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_escalation` */

LOCK TABLES `eam_escalation` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_escalation_action` */

DROP TABLE IF EXISTS `eam_escalation_action`;

CREATE TABLE `eam_escalation_action` (
  `ESCALATION_ID` int(11) NOT NULL,
  `WAIT_TIME` bigint(20) NOT NULL,
  `ACTION_ID` int(11) NOT NULL,
  `IDX` int(11) NOT NULL,
  PRIMARY KEY (`ESCALATION_ID`,`IDX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_escalation_action` */

LOCK TABLES `eam_escalation_action` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_escalation_state` */

DROP TABLE IF EXISTS `eam_escalation_state`;

CREATE TABLE `eam_escalation_state` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NEXT_ACTION_IDX` int(11) NOT NULL,
  `NEXT_ACTION_TIME` bigint(20) NOT NULL,
  `ESCALATION_ID` int(11) NOT NULL,
  `ALERT_DEF_ID` int(11) NOT NULL,
  `ALERT_ID` int(11) NOT NULL,
  `ALERT_TYPE` int(11) NOT NULL,
  `ACKNOWLEDGED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ALERT_DEF_ID` (`ALERT_DEF_ID`,`ALERT_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_escalation_state` */

LOCK TABLES `eam_escalation_state` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_event_log` */

DROP TABLE IF EXISTS `eam_event_log`;

CREATE TABLE `eam_event_log` (
  `ID` int(11) NOT NULL,
  `DETAIL` varchar(4000) COLLATE utf8_bin NOT NULL,
  `TYPE` varchar(100) COLLATE utf8_bin NOT NULL,
  `TIMESTAMP` bigint(20) NOT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `SUBJECT` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `STATUS` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `INSTANCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_event_log` */

LOCK TABLES `eam_event_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_exec_strategies` */

DROP TABLE IF EXISTS `eam_exec_strategies`;

CREATE TABLE `eam_exec_strategies` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `DEF_ID` int(11) NOT NULL,
  `CONFIG_ID` int(11) NOT NULL,
  `PARTITION` int(11) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_exec_strategies` */

LOCK TABLES `eam_exec_strategies` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_exec_strategy_types` */

DROP TABLE IF EXISTS `eam_exec_strategy_types`;

CREATE TABLE `eam_exec_strategy_types` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `TYPE_CLASS` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_exec_strategy_types` */

LOCK TABLES `eam_exec_strategy_types` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_galert_action_log` */

DROP TABLE IF EXISTS `eam_galert_action_log`;

CREATE TABLE `eam_galert_action_log` (
  `ID` int(11) NOT NULL,
  `TIMESTAMP` bigint(20) NOT NULL,
  `DETAIL` varchar(1024) COLLATE utf8_bin NOT NULL,
  `GALERT_ID` int(11) NOT NULL,
  `ALERT_TYPE` int(11) NOT NULL,
  `ACTION_ID` int(11) DEFAULT NULL,
  `SUBJECT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_galert_action_log` */

LOCK TABLES `eam_galert_action_log` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_galert_aux_logs` */

DROP TABLE IF EXISTS `eam_galert_aux_logs`;

CREATE TABLE `eam_galert_aux_logs` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `TIMESTAMP` bigint(20) NOT NULL,
  `AUXTYPE` int(11) NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin NOT NULL,
  `GALERT_ID` int(11) NOT NULL,
  `PARENT` int(11) DEFAULT NULL,
  `DEF_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_galert_aux_logs` */

LOCK TABLES `eam_galert_aux_logs` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_galert_defs` */

DROP TABLE IF EXISTS `eam_galert_defs`;

CREATE TABLE `eam_galert_defs` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCR` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SEVERITY` int(11) NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  `CTIME` bigint(20) NOT NULL,
  `MTIME` bigint(20) NOT NULL,
  `DELETED` bit(1) NOT NULL,
  `LAST_FIRED` bigint(20) DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ESCALATION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_galert_defs` */

LOCK TABLES `eam_galert_defs` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_galert_logs` */

DROP TABLE IF EXISTS `eam_galert_logs`;

CREATE TABLE `eam_galert_logs` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `TIMESTAMP` bigint(20) NOT NULL,
  `FIXED` bit(1) NOT NULL,
  `DEF_ID` int(11) NOT NULL,
  `SHORT_REASON` varchar(256) COLLATE utf8_bin NOT NULL,
  `LONG_REASON` varchar(2048) COLLATE utf8_bin NOT NULL,
  `PARTITION` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_galert_logs` */

LOCK TABLES `eam_galert_logs` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_group_criteria` */

DROP TABLE IF EXISTS `eam_group_criteria`;

CREATE TABLE `eam_group_criteria` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CTIME` bigint(20) NOT NULL,
  `NAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `CREATED_BY` varchar(128) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(128) COLLATE utf8_bin NOT NULL,
  `RESOURCE_NAME_REGEX` varchar(128) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_group_criteria` */

LOCK TABLES `eam_group_criteria` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_group_criteria_prototype_map` */

DROP TABLE IF EXISTS `eam_group_criteria_prototype_map`;

CREATE TABLE `eam_group_criteria_prototype_map` (
  `CRITERIA_ID` int(11) NOT NULL,
  `PROTOTYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`CRITERIA_ID`,`PROTOTYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_group_criteria_prototype_map` */

LOCK TABLES `eam_group_criteria_prototype_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_gtrigger_types` */

DROP TABLE IF EXISTS `eam_gtrigger_types`;

CREATE TABLE `eam_gtrigger_types` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `TYPE_CLASS` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_gtrigger_types` */

LOCK TABLES `eam_gtrigger_types` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_gtriggers` */

DROP TABLE IF EXISTS `eam_gtriggers`;

CREATE TABLE `eam_gtriggers` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CONFIG_ID` int(11) NOT NULL,
  `TYPE_ID` int(11) NOT NULL,
  `STRAT_ID` int(11) NOT NULL,
  `LIDX` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_gtriggers` */

LOCK TABLES `eam_gtriggers` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ip` */

DROP TABLE IF EXISTS `eam_ip`;

CREATE TABLE `eam_ip` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `PLATFORM_ID` int(11) NOT NULL,
  `ADDRESS` varchar(64) COLLATE utf8_bin NOT NULL,
  `NETMASK` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `MAC_ADDRESS` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PLATFORM_ID` (`PLATFORM_ID`,`ADDRESS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ip` */

LOCK TABLES `eam_ip` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_keystore` */

DROP TABLE IF EXISTS `eam_keystore`;

CREATE TABLE `eam_keystore` (
  `ID` int(11) NOT NULL,
  `ALIAS_NAME` varchar(128) COLLATE utf8_bin NOT NULL,
  `TYPE` varchar(32) COLLATE utf8_bin NOT NULL,
  `CERT` varchar(4000) COLLATE utf8_bin NOT NULL,
  `CERT_CHAIN` varchar(10000) COLLATE utf8_bin DEFAULT NULL,
  `CERT_FILE` blob,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ALIAS_NAME` (`ALIAS_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_keystore` */

LOCK TABLES `eam_keystore` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_meas_instr` */

DROP TABLE IF EXISTS `eam_meas_instr`;

CREATE TABLE `eam_meas_instr` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `COLL_INTERVAL` bigint(20) NOT NULL,
  `DEFAULT_ON` bit(1) NOT NULL,
  `TEMPLATE_ID` int(11) NOT NULL,
  `MGMT_POLICY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_meas_instr` */

LOCK TABLES `eam_meas_instr` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_measurement` */

DROP TABLE IF EXISTS `eam_measurement`;

CREATE TABLE `eam_measurement` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `INSTANCE_ID` int(11) NOT NULL,
  `TEMPLATE_ID` int(11) NOT NULL,
  `MTIME` bigint(20) NOT NULL,
  `ENABLED` bit(1) NOT NULL,
  `COLL_INTERVAL` bigint(20) NOT NULL,
  `DSN` varchar(2048) COLLATE utf8_bin NOT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `INSTANCE_ID` (`INSTANCE_ID`,`TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_measurement` */

LOCK TABLES `eam_measurement` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_measurement_bl` */

DROP TABLE IF EXISTS `eam_measurement_bl`;

CREATE TABLE `eam_measurement_bl` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `MEASUREMENT_ID` int(11) DEFAULT NULL,
  `COMPUTE_TIME` bigint(20) NOT NULL,
  `USER_ENTERED` bit(1) NOT NULL,
  `MEAN` double DEFAULT NULL,
  `MIN_EXPECTED_VAL` double DEFAULT NULL,
  `MAX_EXPECTED_VAL` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_measurement_bl` */

LOCK TABLES `eam_measurement_bl` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_measurement_cat` */

DROP TABLE IF EXISTS `eam_measurement_cat`;

CREATE TABLE `eam_measurement_cat` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_measurement_cat` */

LOCK TABLES `eam_measurement_cat` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_measurement_data_1d` */

DROP TABLE IF EXISTS `eam_measurement_data_1d`;

CREATE TABLE `eam_measurement_data_1d` (
  `TIMESTAMP` bigint(20) NOT NULL,
  `MEASUREMENT_ID` int(11) NOT NULL,
  `VALUE` decimal(24,5) DEFAULT NULL,
  `MINVALUE` decimal(24,5) DEFAULT NULL,
  `MAXVALUE` decimal(24,5) DEFAULT NULL,
  PRIMARY KEY (`TIMESTAMP`,`MEASUREMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_measurement_data_1d` */

LOCK TABLES `eam_measurement_data_1d` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_measurement_data_1h` */

DROP TABLE IF EXISTS `eam_measurement_data_1h`;

CREATE TABLE `eam_measurement_data_1h` (
  `TIMESTAMP` bigint(20) NOT NULL,
  `MEASUREMENT_ID` int(11) NOT NULL,
  `VALUE` decimal(24,5) DEFAULT NULL,
  `MINVALUE` decimal(24,5) DEFAULT NULL,
  `MAXVALUE` decimal(24,5) DEFAULT NULL,
  PRIMARY KEY (`TIMESTAMP`,`MEASUREMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_measurement_data_1h` */

LOCK TABLES `eam_measurement_data_1h` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_measurement_data_6h` */

DROP TABLE IF EXISTS `eam_measurement_data_6h`;

CREATE TABLE `eam_measurement_data_6h` (
  `TIMESTAMP` bigint(20) NOT NULL,
  `MEASUREMENT_ID` int(11) NOT NULL,
  `VALUE` decimal(24,5) DEFAULT NULL,
  `MINVALUE` decimal(24,5) DEFAULT NULL,
  `MAXVALUE` decimal(24,5) DEFAULT NULL,
  PRIMARY KEY (`TIMESTAMP`,`MEASUREMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_measurement_data_6h` */

LOCK TABLES `eam_measurement_data_6h` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_measurement_templ` */

DROP TABLE IF EXISTS `eam_measurement_templ`;

CREATE TABLE `eam_measurement_templ` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `ALIAS` varchar(100) COLLATE utf8_bin NOT NULL,
  `UNITS` varchar(50) COLLATE utf8_bin NOT NULL,
  `COLLECTION_TYPE` int(11) NOT NULL DEFAULT '0',
  `DEFAULT_ON` bit(1) NOT NULL,
  `DEFAULT_INTERVAL` bigint(20) NOT NULL DEFAULT '60000',
  `DESIGNATE` bit(1) NOT NULL,
  `TEMPLATE` varchar(2048) COLLATE utf8_bin NOT NULL,
  `PLUGIN` varchar(250) COLLATE utf8_bin NOT NULL,
  `CTIME` bigint(20) NOT NULL,
  `MTIME` bigint(20) NOT NULL,
  `MONITORABLE_TYPE_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_measurement_templ` */

LOCK TABLES `eam_measurement_templ` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_metric_aux_logs` */

DROP TABLE IF EXISTS `eam_metric_aux_logs`;

CREATE TABLE `eam_metric_aux_logs` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `AUX_LOG_ID` int(11) NOT NULL,
  `METRIC_ID` int(11) NOT NULL,
  `DEF_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_metric_aux_logs` */

LOCK TABLES `eam_metric_aux_logs` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_metric_prob` */

DROP TABLE IF EXISTS `eam_metric_prob`;

CREATE TABLE `eam_metric_prob` (
  `MEASUREMENT_ID` int(11) NOT NULL,
  `TIMESTAMP` bigint(20) NOT NULL,
  `ADDITIONAL` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `TYPE` int(11) NOT NULL,
  PRIMARY KEY (`MEASUREMENT_ID`,`TIMESTAMP`,`ADDITIONAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_metric_prob` */

LOCK TABLES `eam_metric_prob` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_mgmt_policy` */

DROP TABLE IF EXISTS `eam_mgmt_policy`;

CREATE TABLE `eam_mgmt_policy` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `DESCRIPTION` varchar(1024) COLLATE utf8_bin NOT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  `CRISPO_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_mgmt_policy` */

LOCK TABLES `eam_mgmt_policy` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_monitorable_type` */

DROP TABLE IF EXISTS `eam_monitorable_type`;

CREATE TABLE `eam_monitorable_type` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `APPDEF_TYPE` int(11) NOT NULL,
  `PLUGIN` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_monitorable_type` */

LOCK TABLES `eam_monitorable_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_numbers` */

DROP TABLE IF EXISTS `eam_numbers`;

CREATE TABLE `eam_numbers` (
  `I` bigint(20) NOT NULL,
  PRIMARY KEY (`I`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_numbers` */

LOCK TABLES `eam_numbers` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_operation` */

DROP TABLE IF EXISTS `eam_operation`;

CREATE TABLE `eam_operation` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `RESOURCE_TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`RESOURCE_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_operation` */

LOCK TABLES `eam_operation` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_platform` */

DROP TABLE IF EXISTS `eam_platform`;

CREATE TABLE `eam_platform` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `FQDN` varchar(255) COLLATE utf8_bin NOT NULL,
  `CERTDN` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `MODIFIED_BY` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `COMMENT_TEXT` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CPU_COUNT` int(11) DEFAULT NULL,
  `PLATFORM_TYPE_ID` int(11) NOT NULL,
  `CONFIG_RESPONSE_ID` int(11) DEFAULT NULL,
  `AGENT_ID` int(11) DEFAULT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FQDN` (`FQDN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_platform` */

LOCK TABLES `eam_platform` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_platform_server_type_map` */

DROP TABLE IF EXISTS `eam_platform_server_type_map`;

CREATE TABLE `eam_platform_server_type_map` (
  `PLATFORM_TYPE_ID` int(11) NOT NULL DEFAULT '0',
  `SERVER_TYPE_ID` int(11) NOT NULL,
  PRIMARY KEY (`SERVER_TYPE_ID`,`PLATFORM_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_platform_server_type_map` */

LOCK TABLES `eam_platform_server_type_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_platform_type` */

DROP TABLE IF EXISTS `eam_platform_type`;

CREATE TABLE `eam_platform_type` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(80) COLLATE utf8_bin NOT NULL,
  `SORT_NAME` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `OS` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `OSVERSION` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `ARCH` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  `PLUGIN` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_platform_type` */

LOCK TABLES `eam_platform_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_plugin` */

DROP TABLE IF EXISTS `eam_plugin`;

CREATE TABLE `eam_plugin` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `VERSION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `PATH` varchar(500) COLLATE utf8_bin NOT NULL,
  `MD5` varchar(100) COLLATE utf8_bin NOT NULL,
  `CTIME` bigint(20) NOT NULL,
  `MTIME` bigint(20) NOT NULL,
  `DISABLED` bit(1) NOT NULL,
  `DELETED` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_plugin` */

LOCK TABLES `eam_plugin` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_policy_grp_map` */

DROP TABLE IF EXISTS `eam_policy_grp_map`;

CREATE TABLE `eam_policy_grp_map` (
  `ID` int(11) NOT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `RESOURCE_GROUP_ID` int(11) NOT NULL,
  `CTIME` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RESOURCE_ID` (`RESOURCE_ID`,`RESOURCE_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_policy_grp_map` */

LOCK TABLES `eam_policy_grp_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_policy_resource_status` */

DROP TABLE IF EXISTS `eam_policy_resource_status`;

CREATE TABLE `eam_policy_resource_status` (
  `ID` int(11) NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `MTIME` bigint(20) NOT NULL,
  `CTIME` bigint(20) NOT NULL,
  `CONFIG_STATUS_BUF` varchar(512) COLLATE utf8_bin NOT NULL,
  `CONFIG_STATUS` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `POLICY_ID` (`POLICY_ID`,`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_policy_resource_status` */

LOCK TABLES `eam_policy_resource_status` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_principal` */

DROP TABLE IF EXISTS `eam_principal`;

CREATE TABLE `eam_principal` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `PRINCIPAL` varchar(64) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PRINCIPAL` (`PRINCIPAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_principal` */

LOCK TABLES `eam_principal` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_registered_trigger` */

DROP TABLE IF EXISTS `eam_registered_trigger`;

CREATE TABLE `eam_registered_trigger` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `FREQUENCY` bigint(20) NOT NULL DEFAULT '0',
  `CLASSNAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `CONFIG` blob,
  `ALERT_DEFINITION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_registered_trigger` */

LOCK TABLES `eam_registered_trigger` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_request_stat` */

DROP TABLE IF EXISTS `eam_request_stat`;

CREATE TABLE `eam_request_stat` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `IPADDR` varchar(20) COLLATE utf8_bin NOT NULL,
  `MIN` double NOT NULL,
  `MAX` double NOT NULL,
  `TOTAL` double NOT NULL,
  `COUNT` int(11) NOT NULL,
  `BEGINTIME` bigint(20) NOT NULL,
  `ENDTIME` bigint(20) NOT NULL,
  `SVCTYPE` int(11) NOT NULL,
  `SVCREQ_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_request_stat` */

LOCK TABLES `eam_request_stat` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_res_grp_res_map` */

DROP TABLE IF EXISTS `eam_res_grp_res_map`;

CREATE TABLE `eam_res_grp_res_map` (
  `ID` int(11) NOT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `RESOURCE_GROUP_ID` int(11) NOT NULL,
  `ENTRY_TIME` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RESOURCE_ID` (`RESOURCE_ID`,`RESOURCE_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_res_grp_res_map` */

LOCK TABLES `eam_res_grp_res_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_resource` */

DROP TABLE IF EXISTS `eam_resource`;

CREATE TABLE `eam_resource` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `RESOURCE_TYPE_ID` int(11) DEFAULT NULL,
  `INSTANCE_ID` int(11) DEFAULT NULL,
  `SUBJECT_ID` int(11) DEFAULT NULL,
  `PROTO_ID` int(11) NOT NULL,
  `NAME` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `SORT_NAME` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `FSYSTEM` bit(1) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_resource` */

LOCK TABLES `eam_resource` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_resource_aux_logs` */

DROP TABLE IF EXISTS `eam_resource_aux_logs`;

CREATE TABLE `eam_resource_aux_logs` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `AUX_LOG_ID` int(11) NOT NULL,
  `APPDEF_TYPE` int(11) NOT NULL,
  `APPDEF_ID` int(11) NOT NULL,
  `DEF_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_resource_aux_logs` */

LOCK TABLES `eam_resource_aux_logs` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_resource_edge` */

DROP TABLE IF EXISTS `eam_resource_edge`;

CREATE TABLE `eam_resource_edge` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `FROM_ID` int(11) NOT NULL,
  `TO_ID` int(11) NOT NULL,
  `REL_ID` int(11) NOT NULL,
  `DISTANCE` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FROM_ID` (`FROM_ID`,`TO_ID`,`REL_ID`,`DISTANCE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_resource_edge` */

LOCK TABLES `eam_resource_edge` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_resource_group` */

DROP TABLE IF EXISTS `eam_resource_group`;

CREATE TABLE `eam_resource_group` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `DESCRIPTION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FSYSTEM` bit(1) DEFAULT NULL,
  `GROUPTYPE` int(11) DEFAULT '11',
  `CLUSTER_ID` int(11) DEFAULT '-1',
  `CTIME` bigint(20) DEFAULT '0',
  `MTIME` bigint(20) DEFAULT '0',
  `MODIFIED_BY` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_PROTOTYPE` int(11) DEFAULT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `GROUP_CRITERIA_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_resource_group` */

LOCK TABLES `eam_resource_group` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_resource_relation` */

DROP TABLE IF EXISTS `eam_resource_relation`;

CREATE TABLE `eam_resource_relation` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL,
  `IS_HIER` bit(1) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_resource_relation` */

LOCK TABLES `eam_resource_relation` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_resource_type` */

DROP TABLE IF EXISTS `eam_resource_type`;

CREATE TABLE `eam_resource_type` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  `FSYSTEM` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`),
  UNIQUE KEY `RESOURCE_ID` (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_resource_type` */

LOCK TABLES `eam_resource_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_role` */

DROP TABLE IF EXISTS `eam_role`;

CREATE TABLE `eam_role` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `SORT_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FSYSTEM` bit(1) DEFAULT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_role` */

LOCK TABLES `eam_role` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_role_calendar` */

DROP TABLE IF EXISTS `eam_role_calendar`;

CREATE TABLE `eam_role_calendar` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `ROLE_ID` int(11) NOT NULL,
  `CALENDAR_ID` int(11) NOT NULL,
  `CALTYPE` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROLE_ID` (`ROLE_ID`,`CALENDAR_ID`,`CALTYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_role_calendar` */

LOCK TABLES `eam_role_calendar` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_role_operation_map` */

DROP TABLE IF EXISTS `eam_role_operation_map`;

CREATE TABLE `eam_role_operation_map` (
  `ROLE_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_role_operation_map` */

LOCK TABLES `eam_role_operation_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_role_resource_group_map` */

DROP TABLE IF EXISTS `eam_role_resource_group_map`;

CREATE TABLE `eam_role_resource_group_map` (
  `ROLE_ID` int(11) NOT NULL,
  `RESOURCE_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`RESOURCE_GROUP_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_role_resource_group_map` */

LOCK TABLES `eam_role_resource_group_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_server` */

DROP TABLE IF EXISTS `eam_server`;

CREATE TABLE `eam_server` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `MODIFIED_BY` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `PLATFORM_ID` int(11) DEFAULT NULL,
  `AUTOINVENTORYIDENTIFIER` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `RUNTIMEAUTODISCOVERY` bit(1) DEFAULT NULL,
  `WASAUTODISCOVERED` bit(1) DEFAULT NULL,
  `SERVICESAUTOMANAGED` bit(1) DEFAULT NULL,
  `AUTODISCOVERY_ZOMBIE` bit(1) DEFAULT NULL,
  `INSTALLPATH` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `SERVER_TYPE_ID` int(11) NOT NULL,
  `CONFIG_RESPONSE_ID` int(11) DEFAULT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PLATFORM_ID` (`PLATFORM_ID`,`AUTOINVENTORYIDENTIFIER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_server` */

LOCK TABLES `eam_server` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_server_type` */

DROP TABLE IF EXISTS `eam_server_type`;

CREATE TABLE `eam_server_type` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(200) COLLATE utf8_bin NOT NULL,
  `SORT_NAME` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `PLUGIN` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `FVIRTUAL` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_server_type` */

LOCK TABLES `eam_server_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_service` */

DROP TABLE IF EXISTS `eam_service`;

CREATE TABLE `eam_service` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `MODIFIED_BY` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LOCATION` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `AUTODISCOVERY_ZOMBIE` bit(1) DEFAULT NULL,
  `SERVICE_RT` bit(1) DEFAULT NULL,
  `ENDUSER_RT` bit(1) DEFAULT NULL,
  `PARENT_SERVICE_ID` int(11) DEFAULT NULL,
  `SERVER_ID` int(11) DEFAULT NULL,
  `AUTOINVENTORYIDENTIFIER` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `SERVICE_TYPE_ID` int(11) NOT NULL,
  `CONFIG_RESPONSE_ID` int(11) DEFAULT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`,`PARENT_SERVICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_service` */

LOCK TABLES `eam_service` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_service_dep_map` */

DROP TABLE IF EXISTS `eam_service_dep_map`;

CREATE TABLE `eam_service_dep_map` (
  `ID` int(11) NOT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `APPSERVICE_ID` int(11) DEFAULT NULL,
  `DEPENDENT_SERVICE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `APPSERVICE_ID` (`APPSERVICE_ID`,`DEPENDENT_SERVICE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_service_dep_map` */

LOCK TABLES `eam_service_dep_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_service_request` */

DROP TABLE IF EXISTS `eam_service_request`;

CREATE TABLE `eam_service_request` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `SERVICEID` int(11) NOT NULL,
  `URL` varchar(767) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_service_request` */

LOCK TABLES `eam_service_request` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_service_type` */

DROP TABLE IF EXISTS `eam_service_type`;

CREATE TABLE `eam_service_type` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(500) COLLATE utf8_bin NOT NULL,
  `SORT_NAME` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `CTIME` bigint(20) DEFAULT NULL,
  `MTIME` bigint(20) DEFAULT NULL,
  `PLUGIN` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `FINTERNAL` bit(1) DEFAULT NULL,
  `SERVER_TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_service_type` */

LOCK TABLES `eam_service_type` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_srn` */

DROP TABLE IF EXISTS `eam_srn`;

CREATE TABLE `eam_srn` (
  `INSTANCE_ID` int(11) NOT NULL,
  `APPDEF_TYPE` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `SRN` int(11) NOT NULL,
  `LAST_SCHEDULE_TIME` bigint(20) NOT NULL,
  PRIMARY KEY (`INSTANCE_ID`,`APPDEF_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_srn` */

LOCK TABLES `eam_srn` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_stat_errors` */

DROP TABLE IF EXISTS `eam_stat_errors`;

CREATE TABLE `eam_stat_errors` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `COUNT` int(11) NOT NULL,
  `ERROR_ID` int(11) DEFAULT NULL,
  `REQSTAT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_stat_errors` */

LOCK TABLES `eam_stat_errors` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_subject` */

DROP TABLE IF EXISTS `eam_subject`;

CREATE TABLE `eam_subject` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `DSN` varchar(100) COLLATE utf8_bin NOT NULL,
  `SORT_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FIRST_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SMS_ADDRESS` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `PHONE_NUMBER` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `DEPARTMENT` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `FACTIVE` bit(1) NOT NULL,
  `FSYSTEM` bit(1) NOT NULL,
  `HTML_EMAIL` bit(1) NOT NULL,
  `RESOURCE_ID` int(11) DEFAULT NULL,
  `PREF_CRISPO_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`,`DSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_subject` */

LOCK TABLES `eam_subject` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_subject_role_map` */

DROP TABLE IF EXISTS `eam_subject_role_map`;

CREATE TABLE `eam_subject_role_map` (
  `ROLE_ID` int(11) NOT NULL,
  `SUBJECT_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUBJECT_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_subject_role_map` */

LOCK TABLES `eam_subject_role_map` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_attach_admin` */

DROP TABLE IF EXISTS `eam_ui_attach_admin`;

CREATE TABLE `eam_ui_attach_admin` (
  `ATTACH_ID` int(11) NOT NULL,
  `CATEGORY` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ATTACH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_attach_admin` */

LOCK TABLES `eam_ui_attach_admin` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_attach_mast` */

DROP TABLE IF EXISTS `eam_ui_attach_mast`;

CREATE TABLE `eam_ui_attach_mast` (
  `ATTACH_ID` int(11) NOT NULL,
  `CATEGORY` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ATTACH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_attach_mast` */

LOCK TABLES `eam_ui_attach_mast` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_attach_rsrc` */

DROP TABLE IF EXISTS `eam_ui_attach_rsrc`;

CREATE TABLE `eam_ui_attach_rsrc` (
  `ATTACH_ID` int(11) NOT NULL,
  `RESOURCE_ID` int(11) NOT NULL,
  `CATEGORY` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ATTACH_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_attach_rsrc` */

LOCK TABLES `eam_ui_attach_rsrc` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_attachment` */

DROP TABLE IF EXISTS `eam_ui_attachment`;

CREATE TABLE `eam_ui_attachment` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `ATTACH_TIME` bigint(20) NOT NULL,
  `VIEW_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_attachment` */

LOCK TABLES `eam_ui_attachment` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_plugin` */

DROP TABLE IF EXISTS `eam_ui_plugin`;

CREATE TABLE `eam_ui_plugin` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(100) COLLATE utf8_bin NOT NULL,
  `PLUGIN_VERSION` varchar(30) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_plugin` */

LOCK TABLES `eam_ui_plugin` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_view` */

DROP TABLE IF EXISTS `eam_ui_view`;

CREATE TABLE `eam_ui_view` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `PATH` varchar(255) COLLATE utf8_bin NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_bin NOT NULL,
  `ATTACH_TYPE` int(11) NOT NULL,
  `UI_PLUGIN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PATH` (`PATH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_view` */

LOCK TABLES `eam_ui_view` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_view_admin` */

DROP TABLE IF EXISTS `eam_ui_view_admin`;

CREATE TABLE `eam_ui_view_admin` (
  `VIEW_ID` int(11) NOT NULL,
  PRIMARY KEY (`VIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_view_admin` */

LOCK TABLES `eam_ui_view_admin` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_view_masthead` */

DROP TABLE IF EXISTS `eam_ui_view_masthead`;

CREATE TABLE `eam_ui_view_masthead` (
  `VIEW_ID` int(11) NOT NULL,
  PRIMARY KEY (`VIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_view_masthead` */

LOCK TABLES `eam_ui_view_masthead` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_ui_view_resource` */

DROP TABLE IF EXISTS `eam_ui_view_resource`;

CREATE TABLE `eam_ui_view_resource` (
  `VIEW_ID` int(11) NOT NULL,
  PRIMARY KEY (`VIEW_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_ui_view_resource` */

LOCK TABLES `eam_ui_view_resource` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_update_status` */

DROP TABLE IF EXISTS `eam_update_status`;

CREATE TABLE `eam_update_status` (
  `ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `REPORT` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `UPMODE` int(11) NOT NULL,
  `IGNORED` bit(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_update_status` */

LOCK TABLES `eam_update_status` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_vc_config` */

DROP TABLE IF EXISTS `eam_vc_config`;

CREATE TABLE `eam_vc_config` (
  `id` int(11) NOT NULL,
  `URL` varchar(100) COLLATE utf8_bin NOT NULL,
  `USER_NAME` varchar(50) COLLATE utf8_bin NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_bin NOT NULL,
  `SET_BY_UI` bit(1) NOT NULL,
  `VC_UUID` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_vc_config` */

LOCK TABLES `eam_vc_config` WRITE;

UNLOCK TABLES;

/*Table structure for table `eam_virtual` */

DROP TABLE IF EXISTS `eam_virtual`;

CREATE TABLE `eam_virtual` (
  `RESOURCE_ID` int(11) NOT NULL,
  `VERSION_COL` bigint(20) NOT NULL DEFAULT '0',
  `PROCESS_ID` int(11) NOT NULL,
  `PHYSICAL_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RESOURCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `eam_virtual` */

LOCK TABLES `eam_virtual` WRITE;

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
