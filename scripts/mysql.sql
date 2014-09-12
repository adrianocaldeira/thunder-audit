-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: audit
-- ------------------------------------------------------
-- Server version	5.1.72-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditclasses`
--

DROP TABLE IF EXISTS `auditclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditclasses` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Name_AuditClasses` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditclasses`
--

LOCK TABLES `auditclasses` WRITE;
/*!40000 ALTER TABLE `auditclasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditclasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditclassproperties`
--

DROP TABLE IF EXISTS `auditclassproperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditclassproperties` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ClassId` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `ClassId_AuditClassProperties` (`ClassId`),
  KEY `Name_AuditProperties` (`Name`),
  CONSTRAINT `FK_AuditClassProperties_AuditClasses` FOREIGN KEY (`ClassId`) REFERENCES `auditclasses` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditclassproperties`
--

LOCK TABLES `auditclassproperties` WRITE;
/*!40000 ALTER TABLE `auditclassproperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditclassproperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditclasspropertychanges`
--

DROP TABLE IF EXISTS `auditclasspropertychanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditclasspropertychanges` (
  `Id` bigint(20) NOT NULL AUTO_INCREMENT,
  `AuditId` bigint(20) NOT NULL,
  `PropertyId` bigint(20) NOT NULL,
  `OldValue` text NOT NULL,
  `NewValue` text NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `AuditId_AuditClassPropertyChanges` (`AuditId`),
  KEY `PropertyId_AuditClassPropertyChanges` (`PropertyId`),
  CONSTRAINT `FK_AuditClassPropertyChanges_AuditClassProperties` FOREIGN KEY (`PropertyId`) REFERENCES `auditclassproperties` (`Id`),
  CONSTRAINT `FK_AuditClassPropertyChanges_Audits` FOREIGN KEY (`AuditId`) REFERENCES `audits` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditclasspropertychanges`
--

LOCK TABLES `auditclasspropertychanges` WRITE;
/*!40000 ALTER TABLE `auditclasspropertychanges` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditclasspropertychanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audits`
--

DROP TABLE IF EXISTS `audits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audits` (
  `Id` bigint(20) NOT NULL,
  `TypeId` smallint(6) NOT NULL,
  `ClassId` int(11) NOT NULL,
  `Reference` varchar(100) NOT NULL,
  `GroupReference` varchar(100) NOT NULL,
  `Description` varchar(4000) NOT NULL,
  `AuditUser` varchar(100) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `AuditUser_Audits` (`AuditUser`) USING BTREE,
  KEY `ClassId_Audits` (`ClassId`),
  KEY `Reference_Audits` (`Reference`) USING BTREE,
  KEY `GroupReference_Audits` (`GroupReference`) USING BTREE,
  KEY `TypeId_Audits` (`TypeId`),
  CONSTRAINT `FK_Audit_AuditClass` FOREIGN KEY (`ClassId`) REFERENCES `auditclasses` (`Id`),
  CONSTRAINT `FK_Audit_AuditType` FOREIGN KEY (`TypeId`) REFERENCES `audittypes` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audits`
--

LOCK TABLES `audits` WRITE;
/*!40000 ALTER TABLE `audits` DISABLE KEYS */;
/*!40000 ALTER TABLE `audits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audittypes`
--

DROP TABLE IF EXISTS `audittypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audittypes` (
  `Id` smallint(6) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Created` datetime NOT NULL,
  `Updated` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audittypes`
--

LOCK TABLES `audittypes` WRITE;
/*!40000 ALTER TABLE `audittypes` DISABLE KEYS */;
INSERT INTO `audittypes` VALUES (1,'Insert','2014-09-12 13:19:33','2014-09-12 13:19:33'),(2,'Update','2014-09-12 13:19:33','2014-09-12 13:19:33'),(3,'Delete','2014-09-12 13:19:33','2014-09-12 13:19:33');
/*!40000 ALTER TABLE `audittypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-12 14:01:24
