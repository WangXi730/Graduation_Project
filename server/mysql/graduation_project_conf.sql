CREATE DATABASE `graduation_project`;

USE `graduation_project`;
-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: localhost    Database: graduation_project
-- ------------------------------------------------------
-- Server version	5.7.30

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
-- Table structure for table `1000000003_group`
--


DROP TABLE IF EXISTS `1000000003_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000003_group` (
  `mess_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text,
  `mess_user_id` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000003_group`
--

LOCK TABLES `1000000003_group` WRITE;
/*!40000 ALTER TABLE `1000000003_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000003_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000004_group`
--

DROP TABLE IF EXISTS `1000000004_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000004_group` (
  `mess_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text,
  `mess_user_id` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000004_group`
--

LOCK TABLES `1000000004_group` WRITE;
/*!40000 ALTER TABLE `1000000004_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000004_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000005_group`
--

DROP TABLE IF EXISTS `1000000005_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000005_group` (
  `mess_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` mediumtext COLLATE utf8mb4_unicode_ci,
  `mess_user_id` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000005_group`
--

LOCK TABLES `1000000005_group` WRITE;
/*!40000 ALTER TABLE `1000000005_group` DISABLE KEYS */;
INSERT INTO `1000000005_group` VALUES (1,'你好',1000000071,'2024-05-04 09:04:26');
/*!40000 ALTER TABLE `1000000005_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000006_group`
--

DROP TABLE IF EXISTS `1000000006_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000006_group` (
  `mess_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message` text,
  `mess_user_id` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`mess_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000006_group`
--

LOCK TABLES `1000000006_group` WRITE;
/*!40000 ALTER TABLE `1000000006_group` DISABLE KEYS */;
INSERT INTO `1000000006_group` VALUES (1,'你好',1000000074,'2024-05-04 09:45:01'),(2,'你好',1000000074,'2024-05-04 09:46:28'),(3,'你好',1000000074,'2024-05-08 11:35:34'),(4,'你好',1000000074,'2024-05-08 11:37:39'),(5,'你好',1000000074,'2024-05-08 11:38:28'),(6,'你好',1000000074,'2024-05-08 11:40:42'),(7,'你好',1000000074,'2024-05-08 11:41:54'),(8,'你好',1000000074,'2024-05-08 11:43:23'),(9,'你好',1000000074,'2024-05-08 11:43:39'),(10,'你好',1000000074,'2024-05-08 11:45:14'),(11,'你好',1000000074,'2024-05-08 11:46:13'),(12,'你好',1000000074,'2024-05-08 11:59:56'),(13,'你好',1000000074,'2024-05-10 10:51:20'),(14,'你好',1000000074,'2024-05-10 10:56:14'),(15,'你好',1000000074,'2024-05-10 10:56:27'),(16,'你好',1000000074,'2024-05-10 10:58:52'),(17,'你好',1000000074,'2024-05-10 11:01:28'),(18,'你好',1000000074,'2024-05-10 11:03:48'),(19,'你好',1000000074,'2024-05-10 11:05:14'),(20,'你好',1000000074,'2024-05-10 11:10:57'),(21,'你好',1000000074,'2024-05-10 11:11:42'),(22,'你好',1000000074,'2024-05-10 11:13:43'),(23,'你好',1000000074,'2024-05-10 11:14:56'),(24,'你好',1000000074,'2024-05-11 06:38:53'),(25,'你好',1000000074,'2024-05-11 08:11:35'),(26,'你好',1000000074,'2024-05-11 08:45:00'),(27,'你好',1000000074,'2024-05-11 08:47:54'),(28,'你好',1000000074,'2024-05-11 08:50:40'),(29,'你好',1000000074,'2024-05-11 08:50:47');
/*!40000 ALTER TABLE `1000000006_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000011_friend`
--

DROP TABLE IF EXISTS `1000000011_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000011_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000011_friend`
--

LOCK TABLES `1000000011_friend` WRITE;
/*!40000 ALTER TABLE `1000000011_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000011_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000012_friend`
--

DROP TABLE IF EXISTS `1000000012_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000012_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000012_friend`
--

LOCK TABLES `1000000012_friend` WRITE;
/*!40000 ALTER TABLE `1000000012_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000012_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000013_friend`
--

DROP TABLE IF EXISTS `1000000013_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000013_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000013_friend`
--

LOCK TABLES `1000000013_friend` WRITE;
/*!40000 ALTER TABLE `1000000013_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000013_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000014_friend`
--

DROP TABLE IF EXISTS `1000000014_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000014_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000014_friend`
--

LOCK TABLES `1000000014_friend` WRITE;
/*!40000 ALTER TABLE `1000000014_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000014_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000014_group`
--

DROP TABLE IF EXISTS `1000000014_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000014_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000014_group`
--

LOCK TABLES `1000000014_group` WRITE;
/*!40000 ALTER TABLE `1000000014_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000014_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000015_friend`
--

DROP TABLE IF EXISTS `1000000015_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000015_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000015_friend`
--

LOCK TABLES `1000000015_friend` WRITE;
/*!40000 ALTER TABLE `1000000015_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000015_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000015_group`
--

DROP TABLE IF EXISTS `1000000015_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000015_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000015_group`
--

LOCK TABLES `1000000015_group` WRITE;
/*!40000 ALTER TABLE `1000000015_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000015_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000016_friend`
--

DROP TABLE IF EXISTS `1000000016_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000016_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000016_friend`
--

LOCK TABLES `1000000016_friend` WRITE;
/*!40000 ALTER TABLE `1000000016_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000016_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000016_group`
--

DROP TABLE IF EXISTS `1000000016_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000016_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000016_group`
--

LOCK TABLES `1000000016_group` WRITE;
/*!40000 ALTER TABLE `1000000016_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000016_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000017_friend`
--

DROP TABLE IF EXISTS `1000000017_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000017_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000017_friend`
--

LOCK TABLES `1000000017_friend` WRITE;
/*!40000 ALTER TABLE `1000000017_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000017_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000017_group`
--

DROP TABLE IF EXISTS `1000000017_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000017_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000017_group`
--

LOCK TABLES `1000000017_group` WRITE;
/*!40000 ALTER TABLE `1000000017_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000017_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000018_friend`
--

DROP TABLE IF EXISTS `1000000018_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000018_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000018_friend`
--

LOCK TABLES `1000000018_friend` WRITE;
/*!40000 ALTER TABLE `1000000018_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000018_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000018_group`
--

DROP TABLE IF EXISTS `1000000018_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000018_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000018_group`
--

LOCK TABLES `1000000018_group` WRITE;
/*!40000 ALTER TABLE `1000000018_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000018_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000019_friend`
--

DROP TABLE IF EXISTS `1000000019_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000019_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000019_friend`
--

LOCK TABLES `1000000019_friend` WRITE;
/*!40000 ALTER TABLE `1000000019_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000019_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000019_group`
--

DROP TABLE IF EXISTS `1000000019_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000019_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000019_group`
--

LOCK TABLES `1000000019_group` WRITE;
/*!40000 ALTER TABLE `1000000019_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000019_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000020_friend`
--

DROP TABLE IF EXISTS `1000000020_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000020_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000020_friend`
--

LOCK TABLES `1000000020_friend` WRITE;
/*!40000 ALTER TABLE `1000000020_friend` DISABLE KEYS */;
INSERT INTO `1000000020_friend` VALUES (1000000021,'Intention');
/*!40000 ALTER TABLE `1000000020_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000020_group`
--

DROP TABLE IF EXISTS `1000000020_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000020_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000020_group`
--

LOCK TABLES `1000000020_group` WRITE;
/*!40000 ALTER TABLE `1000000020_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000020_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000021_friend`
--

DROP TABLE IF EXISTS `1000000021_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000021_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000021_friend`
--

LOCK TABLES `1000000021_friend` WRITE;
/*!40000 ALTER TABLE `1000000021_friend` DISABLE KEYS */;
INSERT INTO `1000000021_friend` VALUES (1000000020,'Intention'),(1000000022,'Request');
/*!40000 ALTER TABLE `1000000021_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000021_group`
--

DROP TABLE IF EXISTS `1000000021_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000021_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000021_group`
--

LOCK TABLES `1000000021_group` WRITE;
/*!40000 ALTER TABLE `1000000021_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000021_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000022_friend`
--

DROP TABLE IF EXISTS `1000000022_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000022_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000022_friend`
--

LOCK TABLES `1000000022_friend` WRITE;
/*!40000 ALTER TABLE `1000000022_friend` DISABLE KEYS */;
INSERT INTO `1000000022_friend` VALUES (1000000021,'Intention');
/*!40000 ALTER TABLE `1000000022_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000022_group`
--

DROP TABLE IF EXISTS `1000000022_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000022_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000022_group`
--

LOCK TABLES `1000000022_group` WRITE;
/*!40000 ALTER TABLE `1000000022_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000022_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000023_friend`
--

DROP TABLE IF EXISTS `1000000023_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000023_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000023_friend`
--

LOCK TABLES `1000000023_friend` WRITE;
/*!40000 ALTER TABLE `1000000023_friend` DISABLE KEYS */;
INSERT INTO `1000000023_friend` VALUES (1000000024,'Intention'),(1000000025,'Intention');
/*!40000 ALTER TABLE `1000000023_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000023_group`
--

DROP TABLE IF EXISTS `1000000023_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000023_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000023_group`
--

LOCK TABLES `1000000023_group` WRITE;
/*!40000 ALTER TABLE `1000000023_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000023_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000024_friend`
--

DROP TABLE IF EXISTS `1000000024_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000024_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000024_friend`
--

LOCK TABLES `1000000024_friend` WRITE;
/*!40000 ALTER TABLE `1000000024_friend` DISABLE KEYS */;
INSERT INTO `1000000024_friend` VALUES (1000000023,'Intention'),(1000000025,'Intention');
/*!40000 ALTER TABLE `1000000024_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000024_group`
--

DROP TABLE IF EXISTS `1000000024_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000024_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000024_group`
--

LOCK TABLES `1000000024_group` WRITE;
/*!40000 ALTER TABLE `1000000024_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000024_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000025_friend`
--

DROP TABLE IF EXISTS `1000000025_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000025_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000025_friend`
--

LOCK TABLES `1000000025_friend` WRITE;
/*!40000 ALTER TABLE `1000000025_friend` DISABLE KEYS */;
INSERT INTO `1000000025_friend` VALUES (1000000023,'Intention'),(1000000024,'Intention');
/*!40000 ALTER TABLE `1000000025_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000025_group`
--

DROP TABLE IF EXISTS `1000000025_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000025_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000025_group`
--

LOCK TABLES `1000000025_group` WRITE;
/*!40000 ALTER TABLE `1000000025_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000025_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000026_friend`
--

DROP TABLE IF EXISTS `1000000026_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000026_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000026_friend`
--

LOCK TABLES `1000000026_friend` WRITE;
/*!40000 ALTER TABLE `1000000026_friend` DISABLE KEYS */;
INSERT INTO `1000000026_friend` VALUES (1000000027,'Intention'),(1000000028,'Intention');
/*!40000 ALTER TABLE `1000000026_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000026_group`
--

DROP TABLE IF EXISTS `1000000026_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000026_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000026_group`
--

LOCK TABLES `1000000026_group` WRITE;
/*!40000 ALTER TABLE `1000000026_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000026_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000027_friend`
--

DROP TABLE IF EXISTS `1000000027_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000027_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000027_friend`
--

LOCK TABLES `1000000027_friend` WRITE;
/*!40000 ALTER TABLE `1000000027_friend` DISABLE KEYS */;
INSERT INTO `1000000027_friend` VALUES (1000000026,'Intention'),(1000000028,'Intention');
/*!40000 ALTER TABLE `1000000027_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000027_group`
--

DROP TABLE IF EXISTS `1000000027_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000027_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000027_group`
--

LOCK TABLES `1000000027_group` WRITE;
/*!40000 ALTER TABLE `1000000027_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000027_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000028_friend`
--

DROP TABLE IF EXISTS `1000000028_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000028_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000028_friend`
--

LOCK TABLES `1000000028_friend` WRITE;
/*!40000 ALTER TABLE `1000000028_friend` DISABLE KEYS */;
INSERT INTO `1000000028_friend` VALUES (1000000026,'Intention'),(1000000027,'Intention');
/*!40000 ALTER TABLE `1000000028_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000028_group`
--

DROP TABLE IF EXISTS `1000000028_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000028_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000028_group`
--

LOCK TABLES `1000000028_group` WRITE;
/*!40000 ALTER TABLE `1000000028_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000028_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000029_friend`
--

DROP TABLE IF EXISTS `1000000029_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000029_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000029_friend`
--

LOCK TABLES `1000000029_friend` WRITE;
/*!40000 ALTER TABLE `1000000029_friend` DISABLE KEYS */;
INSERT INTO `1000000029_friend` VALUES (1000000030,'Intention'),(1000000031,'Intention');
/*!40000 ALTER TABLE `1000000029_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000029_group`
--

DROP TABLE IF EXISTS `1000000029_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000029_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000029_group`
--

LOCK TABLES `1000000029_group` WRITE;
/*!40000 ALTER TABLE `1000000029_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000029_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000030_friend`
--

DROP TABLE IF EXISTS `1000000030_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000030_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000030_friend`
--

LOCK TABLES `1000000030_friend` WRITE;
/*!40000 ALTER TABLE `1000000030_friend` DISABLE KEYS */;
INSERT INTO `1000000030_friend` VALUES (1000000029,'Intention'),(1000000031,'Intention');
/*!40000 ALTER TABLE `1000000030_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000030_group`
--

DROP TABLE IF EXISTS `1000000030_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000030_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000030_group`
--

LOCK TABLES `1000000030_group` WRITE;
/*!40000 ALTER TABLE `1000000030_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000030_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000031_friend`
--

DROP TABLE IF EXISTS `1000000031_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000031_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000031_friend`
--

LOCK TABLES `1000000031_friend` WRITE;
/*!40000 ALTER TABLE `1000000031_friend` DISABLE KEYS */;
INSERT INTO `1000000031_friend` VALUES (1000000029,'Intention'),(1000000030,'Intention');
/*!40000 ALTER TABLE `1000000031_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000031_group`
--

DROP TABLE IF EXISTS `1000000031_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000031_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000031_group`
--

LOCK TABLES `1000000031_group` WRITE;
/*!40000 ALTER TABLE `1000000031_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000031_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000032_friend`
--

DROP TABLE IF EXISTS `1000000032_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000032_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000032_friend`
--

LOCK TABLES `1000000032_friend` WRITE;
/*!40000 ALTER TABLE `1000000032_friend` DISABLE KEYS */;
INSERT INTO `1000000032_friend` VALUES (1000000033,'Intention'),(1000000034,'Intention');
/*!40000 ALTER TABLE `1000000032_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000032_group`
--

DROP TABLE IF EXISTS `1000000032_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000032_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000032_group`
--

LOCK TABLES `1000000032_group` WRITE;
/*!40000 ALTER TABLE `1000000032_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000032_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000033_friend`
--

DROP TABLE IF EXISTS `1000000033_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000033_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000033_friend`
--

LOCK TABLES `1000000033_friend` WRITE;
/*!40000 ALTER TABLE `1000000033_friend` DISABLE KEYS */;
INSERT INTO `1000000033_friend` VALUES (1000000032,'Intention'),(1000000034,'Intention');
/*!40000 ALTER TABLE `1000000033_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000033_group`
--

DROP TABLE IF EXISTS `1000000033_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000033_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000033_group`
--

LOCK TABLES `1000000033_group` WRITE;
/*!40000 ALTER TABLE `1000000033_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000033_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000034_friend`
--

DROP TABLE IF EXISTS `1000000034_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000034_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000034_friend`
--

LOCK TABLES `1000000034_friend` WRITE;
/*!40000 ALTER TABLE `1000000034_friend` DISABLE KEYS */;
INSERT INTO `1000000034_friend` VALUES (1000000032,'Intention'),(1000000033,'Intention');
/*!40000 ALTER TABLE `1000000034_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000034_group`
--

DROP TABLE IF EXISTS `1000000034_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000034_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000034_group`
--

LOCK TABLES `1000000034_group` WRITE;
/*!40000 ALTER TABLE `1000000034_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000034_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000035_friend`
--

DROP TABLE IF EXISTS `1000000035_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000035_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000035_friend`
--

LOCK TABLES `1000000035_friend` WRITE;
/*!40000 ALTER TABLE `1000000035_friend` DISABLE KEYS */;
INSERT INTO `1000000035_friend` VALUES (1000000036,'Intention'),(1000000037,'Intention');
/*!40000 ALTER TABLE `1000000035_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000035_group`
--

DROP TABLE IF EXISTS `1000000035_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000035_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000035_group`
--

LOCK TABLES `1000000035_group` WRITE;
/*!40000 ALTER TABLE `1000000035_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000035_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000036_friend`
--

DROP TABLE IF EXISTS `1000000036_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000036_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000036_friend`
--

LOCK TABLES `1000000036_friend` WRITE;
/*!40000 ALTER TABLE `1000000036_friend` DISABLE KEYS */;
INSERT INTO `1000000036_friend` VALUES (1000000035,'Intention'),(1000000037,'Intention');
/*!40000 ALTER TABLE `1000000036_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000036_group`
--

DROP TABLE IF EXISTS `1000000036_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000036_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000036_group`
--

LOCK TABLES `1000000036_group` WRITE;
/*!40000 ALTER TABLE `1000000036_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000036_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000037_friend`
--

DROP TABLE IF EXISTS `1000000037_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000037_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000037_friend`
--

LOCK TABLES `1000000037_friend` WRITE;
/*!40000 ALTER TABLE `1000000037_friend` DISABLE KEYS */;
INSERT INTO `1000000037_friend` VALUES (1000000035,'Intention'),(1000000036,'Intention');
/*!40000 ALTER TABLE `1000000037_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000037_group`
--

DROP TABLE IF EXISTS `1000000037_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000037_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000037_group`
--

LOCK TABLES `1000000037_group` WRITE;
/*!40000 ALTER TABLE `1000000037_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000037_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000038_friend`
--

DROP TABLE IF EXISTS `1000000038_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000038_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000038_friend`
--

LOCK TABLES `1000000038_friend` WRITE;
/*!40000 ALTER TABLE `1000000038_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000038_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000038_group`
--

DROP TABLE IF EXISTS `1000000038_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000038_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000038_group`
--

LOCK TABLES `1000000038_group` WRITE;
/*!40000 ALTER TABLE `1000000038_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000038_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000039_friend`
--

DROP TABLE IF EXISTS `1000000039_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000039_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000039_friend`
--

LOCK TABLES `1000000039_friend` WRITE;
/*!40000 ALTER TABLE `1000000039_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000039_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000039_group`
--

DROP TABLE IF EXISTS `1000000039_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000039_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000039_group`
--

LOCK TABLES `1000000039_group` WRITE;
/*!40000 ALTER TABLE `1000000039_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000039_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000040_friend`
--

DROP TABLE IF EXISTS `1000000040_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000040_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000040_friend`
--

LOCK TABLES `1000000040_friend` WRITE;
/*!40000 ALTER TABLE `1000000040_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000040_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000040_group`
--

DROP TABLE IF EXISTS `1000000040_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000040_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000040_group`
--

LOCK TABLES `1000000040_group` WRITE;
/*!40000 ALTER TABLE `1000000040_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000040_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000041_friend`
--

DROP TABLE IF EXISTS `1000000041_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000041_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000041_friend`
--

LOCK TABLES `1000000041_friend` WRITE;
/*!40000 ALTER TABLE `1000000041_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000041_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000041_group`
--

DROP TABLE IF EXISTS `1000000041_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000041_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000041_group`
--

LOCK TABLES `1000000041_group` WRITE;
/*!40000 ALTER TABLE `1000000041_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000041_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000042_friend`
--

DROP TABLE IF EXISTS `1000000042_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000042_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000042_friend`
--

LOCK TABLES `1000000042_friend` WRITE;
/*!40000 ALTER TABLE `1000000042_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000042_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000042_group`
--

DROP TABLE IF EXISTS `1000000042_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000042_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000042_group`
--

LOCK TABLES `1000000042_group` WRITE;
/*!40000 ALTER TABLE `1000000042_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000042_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000043_friend`
--

DROP TABLE IF EXISTS `1000000043_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000043_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000043_friend`
--

LOCK TABLES `1000000043_friend` WRITE;
/*!40000 ALTER TABLE `1000000043_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000043_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000043_group`
--

DROP TABLE IF EXISTS `1000000043_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000043_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000043_group`
--

LOCK TABLES `1000000043_group` WRITE;
/*!40000 ALTER TABLE `1000000043_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000043_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000044_friend`
--

DROP TABLE IF EXISTS `1000000044_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000044_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000044_friend`
--

LOCK TABLES `1000000044_friend` WRITE;
/*!40000 ALTER TABLE `1000000044_friend` DISABLE KEYS */;
INSERT INTO `1000000044_friend` VALUES (1000000045,'Intention'),(1000000046,'Intention');
/*!40000 ALTER TABLE `1000000044_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000044_group`
--

DROP TABLE IF EXISTS `1000000044_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000044_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000044_group`
--

LOCK TABLES `1000000044_group` WRITE;
/*!40000 ALTER TABLE `1000000044_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000044_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000045_friend`
--

DROP TABLE IF EXISTS `1000000045_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000045_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000045_friend`
--

LOCK TABLES `1000000045_friend` WRITE;
/*!40000 ALTER TABLE `1000000045_friend` DISABLE KEYS */;
INSERT INTO `1000000045_friend` VALUES (1000000044,'Intention'),(1000000046,'Intention');
/*!40000 ALTER TABLE `1000000045_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000045_group`
--

DROP TABLE IF EXISTS `1000000045_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000045_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000045_group`
--

LOCK TABLES `1000000045_group` WRITE;
/*!40000 ALTER TABLE `1000000045_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000045_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000046_friend`
--

DROP TABLE IF EXISTS `1000000046_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000046_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000046_friend`
--

LOCK TABLES `1000000046_friend` WRITE;
/*!40000 ALTER TABLE `1000000046_friend` DISABLE KEYS */;
INSERT INTO `1000000046_friend` VALUES (1000000044,'Intention'),(1000000045,'Intention');
/*!40000 ALTER TABLE `1000000046_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000046_group`
--

DROP TABLE IF EXISTS `1000000046_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000046_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000046_group`
--

LOCK TABLES `1000000046_group` WRITE;
/*!40000 ALTER TABLE `1000000046_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000046_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000047_friend`
--

DROP TABLE IF EXISTS `1000000047_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000047_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000047_friend`
--

LOCK TABLES `1000000047_friend` WRITE;
/*!40000 ALTER TABLE `1000000047_friend` DISABLE KEYS */;
INSERT INTO `1000000047_friend` VALUES (1000000048,'Intention'),(1000000049,'Intention');
/*!40000 ALTER TABLE `1000000047_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000047_group`
--

DROP TABLE IF EXISTS `1000000047_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000047_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000047_group`
--

LOCK TABLES `1000000047_group` WRITE;
/*!40000 ALTER TABLE `1000000047_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000047_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000048_friend`
--

DROP TABLE IF EXISTS `1000000048_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000048_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000048_friend`
--

LOCK TABLES `1000000048_friend` WRITE;
/*!40000 ALTER TABLE `1000000048_friend` DISABLE KEYS */;
INSERT INTO `1000000048_friend` VALUES (1000000047,'Intention'),(1000000049,'Intention');
/*!40000 ALTER TABLE `1000000048_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000048_group`
--

DROP TABLE IF EXISTS `1000000048_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000048_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000048_group`
--

LOCK TABLES `1000000048_group` WRITE;
/*!40000 ALTER TABLE `1000000048_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000048_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000049_friend`
--

DROP TABLE IF EXISTS `1000000049_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000049_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000049_friend`
--

LOCK TABLES `1000000049_friend` WRITE;
/*!40000 ALTER TABLE `1000000049_friend` DISABLE KEYS */;
INSERT INTO `1000000049_friend` VALUES (1000000047,'Intention'),(1000000048,'Intention');
/*!40000 ALTER TABLE `1000000049_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000049_group`
--

DROP TABLE IF EXISTS `1000000049_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000049_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000049_group`
--

LOCK TABLES `1000000049_group` WRITE;
/*!40000 ALTER TABLE `1000000049_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000049_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000050_friend`
--

DROP TABLE IF EXISTS `1000000050_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000050_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000050_friend`
--

LOCK TABLES `1000000050_friend` WRITE;
/*!40000 ALTER TABLE `1000000050_friend` DISABLE KEYS */;
INSERT INTO `1000000050_friend` VALUES (1000000051,'Intention'),(1000000052,'Intention');
/*!40000 ALTER TABLE `1000000050_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000050_group`
--

DROP TABLE IF EXISTS `1000000050_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000050_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000050_group`
--

LOCK TABLES `1000000050_group` WRITE;
/*!40000 ALTER TABLE `1000000050_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000050_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000051_friend`
--

DROP TABLE IF EXISTS `1000000051_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000051_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000051_friend`
--

LOCK TABLES `1000000051_friend` WRITE;
/*!40000 ALTER TABLE `1000000051_friend` DISABLE KEYS */;
INSERT INTO `1000000051_friend` VALUES (1000000050,'Intention'),(1000000052,'Intention');
/*!40000 ALTER TABLE `1000000051_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000051_group`
--

DROP TABLE IF EXISTS `1000000051_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000051_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000051_group`
--

LOCK TABLES `1000000051_group` WRITE;
/*!40000 ALTER TABLE `1000000051_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000051_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000052_friend`
--

DROP TABLE IF EXISTS `1000000052_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000052_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000052_friend`
--

LOCK TABLES `1000000052_friend` WRITE;
/*!40000 ALTER TABLE `1000000052_friend` DISABLE KEYS */;
INSERT INTO `1000000052_friend` VALUES (1000000050,'Intention'),(1000000051,'Intention');
/*!40000 ALTER TABLE `1000000052_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000052_group`
--

DROP TABLE IF EXISTS `1000000052_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000052_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000052_group`
--

LOCK TABLES `1000000052_group` WRITE;
/*!40000 ALTER TABLE `1000000052_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000052_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000053_friend`
--

DROP TABLE IF EXISTS `1000000053_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000053_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000053_friend`
--

LOCK TABLES `1000000053_friend` WRITE;
/*!40000 ALTER TABLE `1000000053_friend` DISABLE KEYS */;
INSERT INTO `1000000053_friend` VALUES (1000000054,'Intention'),(1000000055,'Intention');
/*!40000 ALTER TABLE `1000000053_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000053_group`
--

DROP TABLE IF EXISTS `1000000053_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000053_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000053_group`
--

LOCK TABLES `1000000053_group` WRITE;
/*!40000 ALTER TABLE `1000000053_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000053_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000054_friend`
--

DROP TABLE IF EXISTS `1000000054_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000054_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000054_friend`
--

LOCK TABLES `1000000054_friend` WRITE;
/*!40000 ALTER TABLE `1000000054_friend` DISABLE KEYS */;
INSERT INTO `1000000054_friend` VALUES (1000000053,'Intention'),(1000000055,'Intention');
/*!40000 ALTER TABLE `1000000054_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000054_group`
--

DROP TABLE IF EXISTS `1000000054_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000054_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000054_group`
--

LOCK TABLES `1000000054_group` WRITE;
/*!40000 ALTER TABLE `1000000054_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000054_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000055_friend`
--

DROP TABLE IF EXISTS `1000000055_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000055_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000055_friend`
--

LOCK TABLES `1000000055_friend` WRITE;
/*!40000 ALTER TABLE `1000000055_friend` DISABLE KEYS */;
INSERT INTO `1000000055_friend` VALUES (1000000053,'Intention'),(1000000054,'Intention');
/*!40000 ALTER TABLE `1000000055_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000055_group`
--

DROP TABLE IF EXISTS `1000000055_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000055_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000055_group`
--

LOCK TABLES `1000000055_group` WRITE;
/*!40000 ALTER TABLE `1000000055_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000055_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000056_friend`
--

DROP TABLE IF EXISTS `1000000056_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000056_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000056_friend`
--

LOCK TABLES `1000000056_friend` WRITE;
/*!40000 ALTER TABLE `1000000056_friend` DISABLE KEYS */;
INSERT INTO `1000000056_friend` VALUES (1000000057,'Intention'),(1000000058,'Intention');
/*!40000 ALTER TABLE `1000000056_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000056_group`
--

DROP TABLE IF EXISTS `1000000056_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000056_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000056_group`
--

LOCK TABLES `1000000056_group` WRITE;
/*!40000 ALTER TABLE `1000000056_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000056_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000057_friend`
--

DROP TABLE IF EXISTS `1000000057_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000057_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000057_friend`
--

LOCK TABLES `1000000057_friend` WRITE;
/*!40000 ALTER TABLE `1000000057_friend` DISABLE KEYS */;
INSERT INTO `1000000057_friend` VALUES (1000000056,'Intention'),(1000000058,'Intention');
/*!40000 ALTER TABLE `1000000057_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000057_group`
--

DROP TABLE IF EXISTS `1000000057_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000057_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000057_group`
--

LOCK TABLES `1000000057_group` WRITE;
/*!40000 ALTER TABLE `1000000057_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000057_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000058_friend`
--

DROP TABLE IF EXISTS `1000000058_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000058_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000058_friend`
--

LOCK TABLES `1000000058_friend` WRITE;
/*!40000 ALTER TABLE `1000000058_friend` DISABLE KEYS */;
INSERT INTO `1000000058_friend` VALUES (1000000056,'Intention'),(1000000057,'Intention');
/*!40000 ALTER TABLE `1000000058_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000058_group`
--

DROP TABLE IF EXISTS `1000000058_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000058_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000058_group`
--

LOCK TABLES `1000000058_group` WRITE;
/*!40000 ALTER TABLE `1000000058_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000058_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000059_friend`
--

DROP TABLE IF EXISTS `1000000059_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000059_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000059_friend`
--

LOCK TABLES `1000000059_friend` WRITE;
/*!40000 ALTER TABLE `1000000059_friend` DISABLE KEYS */;
INSERT INTO `1000000059_friend` VALUES (1000000060,'Intention'),(1000000061,'Intention');
/*!40000 ALTER TABLE `1000000059_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000059_group`
--

DROP TABLE IF EXISTS `1000000059_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000059_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000059_group`
--

LOCK TABLES `1000000059_group` WRITE;
/*!40000 ALTER TABLE `1000000059_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000059_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000060_friend`
--

DROP TABLE IF EXISTS `1000000060_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000060_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000060_friend`
--

LOCK TABLES `1000000060_friend` WRITE;
/*!40000 ALTER TABLE `1000000060_friend` DISABLE KEYS */;
INSERT INTO `1000000060_friend` VALUES (1000000059,'Intention'),(1000000061,'Intention');
/*!40000 ALTER TABLE `1000000060_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000060_group`
--

DROP TABLE IF EXISTS `1000000060_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000060_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000060_group`
--

LOCK TABLES `1000000060_group` WRITE;
/*!40000 ALTER TABLE `1000000060_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000060_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000061_friend`
--

DROP TABLE IF EXISTS `1000000061_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000061_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000061_friend`
--

LOCK TABLES `1000000061_friend` WRITE;
/*!40000 ALTER TABLE `1000000061_friend` DISABLE KEYS */;
INSERT INTO `1000000061_friend` VALUES (1000000059,'Intention'),(1000000060,'Intention');
/*!40000 ALTER TABLE `1000000061_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000061_group`
--

DROP TABLE IF EXISTS `1000000061_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000061_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000061_group`
--

LOCK TABLES `1000000061_group` WRITE;
/*!40000 ALTER TABLE `1000000061_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000061_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000062_friend`
--

DROP TABLE IF EXISTS `1000000062_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000062_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000062_friend`
--

LOCK TABLES `1000000062_friend` WRITE;
/*!40000 ALTER TABLE `1000000062_friend` DISABLE KEYS */;
INSERT INTO `1000000062_friend` VALUES (1000000063,'Intention'),(1000000064,'Intention');
/*!40000 ALTER TABLE `1000000062_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000062_group`
--

DROP TABLE IF EXISTS `1000000062_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000062_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000062_group`
--

LOCK TABLES `1000000062_group` WRITE;
/*!40000 ALTER TABLE `1000000062_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000062_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000063_friend`
--

DROP TABLE IF EXISTS `1000000063_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000063_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000063_friend`
--

LOCK TABLES `1000000063_friend` WRITE;
/*!40000 ALTER TABLE `1000000063_friend` DISABLE KEYS */;
INSERT INTO `1000000063_friend` VALUES (1000000062,'Intention'),(1000000064,'Intention');
/*!40000 ALTER TABLE `1000000063_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000063_group`
--

DROP TABLE IF EXISTS `1000000063_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000063_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000063_group`
--

LOCK TABLES `1000000063_group` WRITE;
/*!40000 ALTER TABLE `1000000063_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000063_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000064_friend`
--

DROP TABLE IF EXISTS `1000000064_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000064_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000064_friend`
--

LOCK TABLES `1000000064_friend` WRITE;
/*!40000 ALTER TABLE `1000000064_friend` DISABLE KEYS */;
INSERT INTO `1000000064_friend` VALUES (1000000062,'Intention'),(1000000063,'Intention');
/*!40000 ALTER TABLE `1000000064_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000064_group`
--

DROP TABLE IF EXISTS `1000000064_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000064_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000064_group`
--

LOCK TABLES `1000000064_group` WRITE;
/*!40000 ALTER TABLE `1000000064_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000064_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000065_friend`
--

DROP TABLE IF EXISTS `1000000065_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000065_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000065_friend`
--

LOCK TABLES `1000000065_friend` WRITE;
/*!40000 ALTER TABLE `1000000065_friend` DISABLE KEYS */;
INSERT INTO `1000000065_friend` VALUES (1000000066,'Intention'),(1000000067,'Intention');
/*!40000 ALTER TABLE `1000000065_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000065_group`
--

DROP TABLE IF EXISTS `1000000065_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000065_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000065_group`
--

LOCK TABLES `1000000065_group` WRITE;
/*!40000 ALTER TABLE `1000000065_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000065_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000066_friend`
--

DROP TABLE IF EXISTS `1000000066_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000066_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000066_friend`
--

LOCK TABLES `1000000066_friend` WRITE;
/*!40000 ALTER TABLE `1000000066_friend` DISABLE KEYS */;
INSERT INTO `1000000066_friend` VALUES (1000000065,'Intention'),(1000000067,'Intention');
/*!40000 ALTER TABLE `1000000066_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000066_group`
--

DROP TABLE IF EXISTS `1000000066_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000066_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000066_group`
--

LOCK TABLES `1000000066_group` WRITE;
/*!40000 ALTER TABLE `1000000066_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000066_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000067_friend`
--

DROP TABLE IF EXISTS `1000000067_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000067_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000067_friend`
--

LOCK TABLES `1000000067_friend` WRITE;
/*!40000 ALTER TABLE `1000000067_friend` DISABLE KEYS */;
INSERT INTO `1000000067_friend` VALUES (1000000065,'Intention'),(1000000066,'Intention');
/*!40000 ALTER TABLE `1000000067_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000067_group`
--

DROP TABLE IF EXISTS `1000000067_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000067_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000067_group`
--

LOCK TABLES `1000000067_group` WRITE;
/*!40000 ALTER TABLE `1000000067_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `1000000067_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000068_friend`
--

DROP TABLE IF EXISTS `1000000068_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000068_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000068_friend`
--

LOCK TABLES `1000000068_friend` WRITE;
/*!40000 ALTER TABLE `1000000068_friend` DISABLE KEYS */;
INSERT INTO `1000000068_friend` VALUES (1000000069,'Intention'),(1000000070,'Intention');
/*!40000 ALTER TABLE `1000000068_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000068_group`
--

DROP TABLE IF EXISTS `1000000068_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000068_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000068_group`
--

LOCK TABLES `1000000068_group` WRITE;
/*!40000 ALTER TABLE `1000000068_group` DISABLE KEYS */;
INSERT INTO `1000000068_group` VALUES (1000000004,2);
/*!40000 ALTER TABLE `1000000068_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000069_friend`
--

DROP TABLE IF EXISTS `1000000069_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000069_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000069_friend`
--

LOCK TABLES `1000000069_friend` WRITE;
/*!40000 ALTER TABLE `1000000069_friend` DISABLE KEYS */;
INSERT INTO `1000000069_friend` VALUES (1000000068,'Intention'),(1000000070,'Intention');
/*!40000 ALTER TABLE `1000000069_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000069_group`
--

DROP TABLE IF EXISTS `1000000069_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000069_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000069_group`
--

LOCK TABLES `1000000069_group` WRITE;
/*!40000 ALTER TABLE `1000000069_group` DISABLE KEYS */;
INSERT INTO `1000000069_group` VALUES (1000000004,0);
/*!40000 ALTER TABLE `1000000069_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000070_friend`
--

DROP TABLE IF EXISTS `1000000070_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000070_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000070_friend`
--

LOCK TABLES `1000000070_friend` WRITE;
/*!40000 ALTER TABLE `1000000070_friend` DISABLE KEYS */;
INSERT INTO `1000000070_friend` VALUES (1000000068,'Intention'),(1000000069,'Intention');
/*!40000 ALTER TABLE `1000000070_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000070_group`
--

DROP TABLE IF EXISTS `1000000070_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000070_group` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000070_group`
--

LOCK TABLES `1000000070_group` WRITE;
/*!40000 ALTER TABLE `1000000070_group` DISABLE KEYS */;
INSERT INTO `1000000070_group` VALUES (1000000004,0);
/*!40000 ALTER TABLE `1000000070_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000071_friend`
--

DROP TABLE IF EXISTS `1000000071_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000071_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000071_friend`
--

LOCK TABLES `1000000071_friend` WRITE;
/*!40000 ALTER TABLE `1000000071_friend` DISABLE KEYS */;
INSERT INTO `1000000071_friend` VALUES (1000000072,'Intention'),(1000000073,'Intention');
/*!40000 ALTER TABLE `1000000071_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000071_groups`
--

DROP TABLE IF EXISTS `1000000071_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000071_groups` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000071_groups`
--

LOCK TABLES `1000000071_groups` WRITE;
/*!40000 ALTER TABLE `1000000071_groups` DISABLE KEYS */;
INSERT INTO `1000000071_groups` VALUES (1000000005,0);
/*!40000 ALTER TABLE `1000000071_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000072_friend`
--

DROP TABLE IF EXISTS `1000000072_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000072_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000072_friend`
--

LOCK TABLES `1000000072_friend` WRITE;
/*!40000 ALTER TABLE `1000000072_friend` DISABLE KEYS */;
INSERT INTO `1000000072_friend` VALUES (1000000071,'Intention'),(1000000073,'Intention');
/*!40000 ALTER TABLE `1000000072_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000072_groups`
--

DROP TABLE IF EXISTS `1000000072_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000072_groups` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000072_groups`
--

LOCK TABLES `1000000072_groups` WRITE;
/*!40000 ALTER TABLE `1000000072_groups` DISABLE KEYS */;
INSERT INTO `1000000072_groups` VALUES (1000000005,0);
/*!40000 ALTER TABLE `1000000072_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000073_friend`
--

DROP TABLE IF EXISTS `1000000073_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000073_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000073_friend`
--

LOCK TABLES `1000000073_friend` WRITE;
/*!40000 ALTER TABLE `1000000073_friend` DISABLE KEYS */;
INSERT INTO `1000000073_friend` VALUES (1000000071,'Intention'),(1000000072,'Intention');
/*!40000 ALTER TABLE `1000000073_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000073_groups`
--

DROP TABLE IF EXISTS `1000000073_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000073_groups` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000073_groups`
--

LOCK TABLES `1000000073_groups` WRITE;
/*!40000 ALTER TABLE `1000000073_groups` DISABLE KEYS */;
INSERT INTO `1000000073_groups` VALUES (1000000005,2);
/*!40000 ALTER TABLE `1000000073_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000074_friend`
--

DROP TABLE IF EXISTS `1000000074_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000074_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000074_friend`
--

LOCK TABLES `1000000074_friend` WRITE;
/*!40000 ALTER TABLE `1000000074_friend` DISABLE KEYS */;
INSERT INTO `1000000074_friend` VALUES (1000000075,'Intention'),(1000000076,'Intention');
/*!40000 ALTER TABLE `1000000074_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000074_groups`
--

DROP TABLE IF EXISTS `1000000074_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000074_groups` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000074_groups`
--

LOCK TABLES `1000000074_groups` WRITE;
/*!40000 ALTER TABLE `1000000074_groups` DISABLE KEYS */;
INSERT INTO `1000000074_groups` VALUES (1000000006,0);
/*!40000 ALTER TABLE `1000000074_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000075_friend`
--

DROP TABLE IF EXISTS `1000000075_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000075_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000075_friend`
--

LOCK TABLES `1000000075_friend` WRITE;
/*!40000 ALTER TABLE `1000000075_friend` DISABLE KEYS */;
INSERT INTO `1000000075_friend` VALUES (1000000074,'Intention'),(1000000076,'Intention');
/*!40000 ALTER TABLE `1000000075_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000075_groups`
--

DROP TABLE IF EXISTS `1000000075_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000075_groups` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000075_groups`
--

LOCK TABLES `1000000075_groups` WRITE;
/*!40000 ALTER TABLE `1000000075_groups` DISABLE KEYS */;
INSERT INTO `1000000075_groups` VALUES (1000000006,0);
/*!40000 ALTER TABLE `1000000075_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000076_friend`
--

DROP TABLE IF EXISTS `1000000076_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000076_friend` (
  `id` bigint(20) NOT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000076_friend`
--

LOCK TABLES `1000000076_friend` WRITE;
/*!40000 ALTER TABLE `1000000076_friend` DISABLE KEYS */;
INSERT INTO `1000000076_friend` VALUES (1000000074,'Intention'),(1000000075,'Intention');
/*!40000 ALTER TABLE `1000000076_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `1000000076_groups`
--

DROP TABLE IF EXISTS `1000000076_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `1000000076_groups` (
  `group_id` bigint(20) NOT NULL,
  `identity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `1000000076_groups`
--

LOCK TABLES `1000000076_groups` WRITE;
/*!40000 ALTER TABLE `1000000076_groups` DISABLE KEYS */;
INSERT INTO `1000000076_groups` VALUES (1000000006,2);
/*!40000 ALTER TABLE `1000000076_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_map`
--

DROP TABLE IF EXISTS `group_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_map` (
  `group_id` bigint(20) NOT NULL,
  `user_list` text,
  `user_count` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_map`
--

LOCK TABLES `group_map` WRITE;
/*!40000 ALTER TABLE `group_map` DISABLE KEYS */;
INSERT INTO `group_map` VALUES (1000000003,'1000000065;1000000066;1000000067',3),(1000000004,'1000000068;1000000069;1000000070',3),(1000000005,'1000000071;1000000072;1000000073',3),(1000000006,'1000000074;1000000075;1000000076',3);
/*!40000 ALTER TABLE `group_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_index`
--

DROP TABLE IF EXISTS `tb_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_index` (
  `data_name` varchar(20) DEFAULT NULL,
  `data_table` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_index`
--

LOCK TABLES `tb_index` WRITE;
/*!40000 ALTER TABLE `tb_index` DISABLE KEYS */;
INSERT INTO `tb_index` VALUES ('username','tb_user'),('password','tb_user');
/*!40000 ALTER TABLE `tb_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1000000002,'playmaker','111111'),(1000000003,'test_ekkowwang','111111'),(1000000004,'test_ekkowwang','111111'),(1000000005,'test_ekkowwang','111111'),(1000000006,'test_ekkowwang','111111'),(1000000007,'test_ekkowwang','111111'),(1000000011,'test_ekkowwang','111111'),(1000000012,'test_ekkowwang','111111'),(1000000013,'test_ekkowwang','111111'),(1000000014,'test_ekkowwang','111111'),(1000000015,'test_ekkowwang','111111'),(1000000016,'test_ekkowwang','111111'),(1000000017,'test_ekkowwang','111111'),(1000000018,'test_ekkowwang','111111'),(1000000019,'test_ekkowwang','111111'),(1000000020,'test_ekkowwang','111111'),(1000000021,'test_ekkowwang','111111'),(1000000022,'test_ekkowwang','111111'),(1000000023,'test_ekkowwang','111111'),(1000000024,'test_ekkowwang','111111'),(1000000025,'test_ekkowwang','111111'),(1000000026,'test_ekkowwang','111111'),(1000000027,'test_ekkowwang','111111'),(1000000028,'test_ekkowwang','111111'),(1000000029,'test_ekkowwang','111111'),(1000000030,'test_ekkowwang','111111'),(1000000031,'test_ekkowwang','111111'),(1000000032,'test_ekkowwang','111111'),(1000000033,'test_ekkowwang','111111'),(1000000034,'test_ekkowwang','111111'),(1000000035,'test_ekkowwang','111111'),(1000000036,'test_ekkowwang','111111'),(1000000037,'test_ekkowwang','111111'),(1000000038,'test_ekkowwang','111111'),(1000000039,'test_ekkowwang','111111'),(1000000040,'test_ekkowwang','111111'),(1000000041,'test_ekkowwang','111111'),(1000000042,'test_ekkowwang','111111'),(1000000043,'test_ekkowwang','111111'),(1000000044,'test_ekkowwang','111111'),(1000000045,'test_ekkowwang','111111'),(1000000046,'test_ekkowwang','111111'),(1000000047,'test_ekkowwang','111111'),(1000000048,'test_ekkowwang','111111'),(1000000049,'test_ekkowwang','111111'),(1000000050,'test_ekkowwang','111111'),(1000000051,'test_ekkowwang','111111'),(1000000052,'test_ekkowwang','111111'),(1000000053,'test_ekkowwang','111111'),(1000000054,'test_ekkowwang','111111'),(1000000055,'test_ekkowwang','111111'),(1000000056,'test_ekkowwang','111111'),(1000000057,'test_ekkowwang','111111'),(1000000058,'test_ekkowwang','111111'),(1000000059,'test_ekkowwang','111111'),(1000000060,'test_ekkowwang','111111'),(1000000061,'test_ekkowwang','111111'),(1000000062,'test_ekkowwang','111111'),(1000000063,'test_ekkowwang','111111'),(1000000064,'test_ekkowwang','111111'),(1000000065,'test_ekkowwang','111111'),(1000000066,'test_ekkowwang','111111'),(1000000067,'test_ekkowwang','111111'),(1000000068,'test_ekkowwang','111111'),(1000000069,'test_ekkowwang','111111'),(1000000070,'test_ekkowwang','111111'),(1000000071,'test_ekkowwang','111111'),(1000000072,'test_ekkowwang','111111'),(1000000073,'test_ekkowwang','111111'),(1000000074,'test_ekkowwang','111111'),(1000000075,'test_ekkowwang','111111'),(1000000076,'test_ekkowwang','111111');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-13  7:51:01
