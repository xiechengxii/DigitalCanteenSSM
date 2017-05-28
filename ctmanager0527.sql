-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: ctmanager
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `ctad`
--

DROP TABLE IF EXISTS `ctad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctad` (
  `AdID` int(11) NOT NULL AUTO_INCREMENT,
  `AdDishID` int(11) DEFAULT NULL,
  `AdName` varchar(20) DEFAULT NULL,
  `AdExp` varchar(30) DEFAULT NULL,
  `AdStartDate` varchar(30) DEFAULT NULL,
  `AdEndDate` varchar(30) DEFAULT NULL,
  `AdState` varchar(10) DEFAULT NULL,
  `AdDiscount` varchar(20) DEFAULT NULL,
  `AdFinalPrice` varchar(20) DEFAULT NULL,
  `AdNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AdID`),
  KEY `FK_CTAd_CTDish_idx` (`AdDishID`),
  CONSTRAINT `FK_CTAd_CTDish` FOREIGN KEY (`AdDishID`) REFERENCES `ctdish` (`DishID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctad`
--

LOCK TABLES `ctad` WRITE;
/*!40000 ALTER TABLE `ctad` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctcampus`
--

DROP TABLE IF EXISTS `ctcampus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctcampus` (
  `CampusID` int(11) NOT NULL AUTO_INCREMENT,
  `CampusName` varchar(20) NOT NULL,
  `CampusNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CampusID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctcampus`
--

LOCK TABLES `ctcampus` WRITE;
/*!40000 ALTER TABLE `ctcampus` DISABLE KEYS */;
INSERT INTO `ctcampus` VALUES (4,'东院',''),(5,'西院',''),(6,'鉴湖',''),(7,'南湖',''),(8,'余区','');
/*!40000 ALTER TABLE `ctcampus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctcant`
--

DROP TABLE IF EXISTS `ctcant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctcant` (
  `CantID` int(11) NOT NULL AUTO_INCREMENT,
  `CantTypeID` int(11) NOT NULL,
  `CantCampusID` int(11) NOT NULL,
  `CantName` varchar(20) NOT NULL,
  `CantPhoto` varchar(80) DEFAULT NULL,
  `CantAddr` varchar(50) DEFAULT NULL,
  `CantDescription` varchar(50) DEFAULT NULL,
  `CantNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CantID`),
  KEY `FK_CTCant_CTCampus_idx` (`CantCampusID`),
  KEY `FK_CTCant_Type_idx` (`CantTypeID`),
  CONSTRAINT `FK_CTCant_CTCampus` FOREIGN KEY (`CantCampusID`) REFERENCES `ctcampus` (`CampusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CTCant_CTType` FOREIGN KEY (`CantTypeID`) REFERENCES `ctcanttype` (`CantTypeID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctcant`
--

LOCK TABLES `ctcant` WRITE;
/*!40000 ALTER TABLE `ctcant` DISABLE KEYS */;
INSERT INTO `ctcant` VALUES (9,4,4,'东一',NULL,'','',NULL),(10,4,4,'莘子院',NULL,'','',NULL),(11,3,4,'风味食堂',NULL,'','',NULL),(12,4,5,'西一',NULL,'','',NULL),(13,3,5,'西二',NULL,'','',NULL),(14,4,6,'鉴一',NULL,'','',NULL),(15,3,6,'鉴二',NULL,'','',NULL),(16,4,7,'南一',NULL,'','',NULL),(17,3,7,'南二',NULL,'','',NULL),(18,3,5,'恬园',NULL,'','',NULL),(19,3,7,'南八',NULL,'','',NULL),(20,4,8,'喵咪',NULL,'','',NULL);
/*!40000 ALTER TABLE `ctcant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctcanttype`
--

DROP TABLE IF EXISTS `ctcanttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctcanttype` (
  `CantTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `CantTypeName` varchar(20) DEFAULT NULL,
  `CantTypeNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CantTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctcanttype`
--

LOCK TABLES `ctcanttype` WRITE;
/*!40000 ALTER TABLE `ctcanttype` DISABLE KEYS */;
INSERT INTO `ctcanttype` VALUES (3,'自营食堂',''),(4,'花样食堂','');
/*!40000 ALTER TABLE `ctcanttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctcmt`
--

DROP TABLE IF EXISTS `ctcmt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctcmt` (
  `CmtID` int(11) NOT NULL AUTO_INCREMENT,
  `CmtDishID` int(11) DEFAULT NULL,
  `CmtContent` varchar(100) DEFAULT NULL,
  `CmtDate` varchar(30) DEFAULT NULL,
  `CmtGoodNum` int(11) DEFAULT NULL,
  `CmtUserName` varchar(20) DEFAULT NULL,
  `CmtAimUser` varchar(20) DEFAULT NULL,
  `CmtNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CmtID`),
  KEY `FK_CTCmt_CTDish_idx` (`CmtDishID`),
  CONSTRAINT `FK_CTCmt_CTDish` FOREIGN KEY (`CmtDishID`) REFERENCES `ctdish` (`DishID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctcmt`
--

LOCK TABLES `ctcmt` WRITE;
/*!40000 ALTER TABLE `ctcmt` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctcmt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctdetail`
--

DROP TABLE IF EXISTS `ctdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctdetail` (
  `DetailID` int(11) NOT NULL AUTO_INCREMENT,
  `DetailDishID` int(11) NOT NULL,
  `DetailRecordID` int(11) DEFAULT NULL,
  `DetailWndID` int(11) DEFAULT NULL,
  `DetailDishTypeID` int(11) NOT NULL,
  `DetailDishName` varchar(20) DEFAULT NULL,
  `DetailWndName` varchar(20) DEFAULT NULL,
  `DetailDishPrice` varchar(20) DEFAULT NULL,
  `DetailDishPhoto` varchar(80) DEFAULT NULL,
  `DetailDishDate` varchar(20) DEFAULT NULL,
  `DetailDishRecmd` varchar(1) DEFAULT NULL,
  `DetailDishKeep` varchar(1) DEFAULT NULL,
  `DetailDishSale` varchar(10) DEFAULT NULL,
  `DetailDishInDate` datetime DEFAULT NULL,
  `DetailDishNote` varchar(50) DEFAULT NULL,
  `DetailDishDelete` varchar(1) DEFAULT NULL,
  `DetailDishDateFlag` int(11) DEFAULT NULL,
  PRIMARY KEY (`DetailID`)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctdetail`
--

LOCK TABLES `ctdetail` WRITE;
/*!40000 ALTER TABLE `ctdetail` DISABLE KEYS */;
INSERT INTO `ctdetail` VALUES (52,35,64,4,3,'炒饭','南京鸭血粉丝','7','3b98cae6-3024-4f4a-97bd-02df4776b291.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','0',NULL),(53,34,64,4,2,'鸡肉饭','南京鸭血粉丝','99','8bed8cb6-717d-4855-ae78-d5fb65a16fed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','0',0),(54,34,65,4,2,'鸡肉饭','南京鸭血粉丝','99','8bed8cb6-717d-4855-ae78-d5fb65a16fed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(55,34,66,4,2,'鸡肉饭','南京鸭血粉丝','99','8bed8cb6-717d-4855-ae78-d5fb65a16fed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(56,33,66,4,2,'千张肉丝','南京鸭血粉丝','88','cbe03aaf-3b08-4ea2-a77a-a970fc92135e.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',NULL),(57,34,67,4,2,'鸡肉饭','南京鸭血粉丝','99','8bed8cb6-717d-4855-ae78-d5fb65a16fed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(59,37,69,4,5,'香蕉牛奶','南京鸭血粉丝','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','早餐','否','否','在售','2017-03-02 00:00:00','','',0),(69,37,70,4,5,'香蕉牛奶','南京鸭血粉丝','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','早餐','否','否','在售','2017-03-02 00:00:00','','',0),(70,34,70,4,2,'鸡肉饭','南京鸭血粉丝','99','d1f4aa53-7158-47af-b735-66817800dbed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(71,33,70,4,2,'千张肉丝','南京鸭血粉丝','88','58d457aa-cacf-413a-aac4-0acd347f33ce.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',NULL),(73,38,71,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',0),(74,39,72,4,6,'鱼粉','南京鸭血粉丝','10','default.jpg','中午','是','是','在售','2017-03-08 00:00:00','','',0),(75,38,72,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',0),(76,37,72,4,5,'香蕉牛奶','南京鸭血粉丝','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','早餐','否','否','在售','2017-03-02 00:00:00','','',0),(77,34,72,4,2,'鸡肉饭','南京鸭血粉丝','99','d1f4aa53-7158-47af-b735-66817800dbed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(78,33,72,4,2,'千张肉丝','南京鸭血粉丝','88','58d457aa-cacf-413a-aac4-0acd347f33ce.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',NULL),(79,37,68,4,5,'香蕉牛奶','南京鸭血粉丝','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','早餐','否','否','在售','2017-03-02 00:00:00','','',0),(80,34,68,4,2,'鸡肉饭','南京鸭血粉丝','99','d1f4aa53-7158-47af-b735-66817800dbed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(91,38,76,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',0),(92,38,77,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',0),(93,37,77,4,5,'香蕉牛奶','南京鸭血粉丝','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','早餐','否','否','在售','2017-03-02 00:00:00','','',0),(94,34,77,4,2,'鸡肉饭','南京鸭血粉丝','99','d1f4aa53-7158-47af-b735-66817800dbed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(95,39,78,4,6,'鱼粉','南京鸭血粉丝','10','default.jpg','中午','是','是','在售','2017-03-08 00:00:00','','',0),(96,38,78,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',0),(97,38,79,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',0),(98,39,80,4,6,'鱼粉','南京鸭血粉丝','10','default.jpg','中午','是','是','在售','2017-03-08 00:00:00','','',0),(99,37,80,4,5,'香蕉牛奶','南京鸭血粉丝','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','早餐','否','否','在售','2017-03-02 00:00:00','','',0),(100,33,80,4,2,'千张肉丝','南京鸭血粉丝','88','58d457aa-cacf-413a-aac4-0acd347f33ce.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',NULL),(101,39,81,4,6,'鱼粉','南京鸭血粉丝','10','default.jpg','中午','是','是','在售','2017-03-08 00:00:00','','',0),(102,38,81,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',0),(103,37,81,4,5,'香蕉牛奶','南京鸭血粉丝','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','早餐','否','否','在售','2017-03-02 00:00:00','','',0),(104,34,81,4,2,'鸡肉饭','南京鸭血粉丝','99','d1f4aa53-7158-47af-b735-66817800dbed.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',0),(105,33,81,4,2,'千张肉丝','南京鸭血粉丝','88','58d457aa-cacf-413a-aac4-0acd347f33ce.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',NULL),(106,40,81,12,1,'黄焖鸡','麻辣烫','12','default.jpg','中午','是','是','在售','2017-03-12 00:00:00','','',NULL),(107,39,85,4,6,'鱼粉','南京鸭血粉丝','10','default.jpg','全天供应','是','是','在售','2017-03-08 00:00:00','','',4),(108,38,85,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',1),(155,39,112,4,6,'鱼粉','南京鸭血粉丝','10','default.jpg','全天供应','是','是','在售','2017-03-08 00:00:00','','',4),(157,38,112,4,5,'鸡','南京鸭血粉丝','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','2017-03-06 00:00:00','','',1),(158,33,112,4,2,'千张肉丝','南京鸭血粉丝','88','58d457aa-cacf-413a-aac4-0acd347f33ce.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',1),(167,34,116,4,2,'鸡肉饭','南京鸭血粉丝','99','d1f4aa53-7158-47af-b735-66817800dbed.jpg','中餐','否','否','在售','2017-02-27 00:00:00','','',2),(168,33,116,4,2,'千张肉丝','南京鸭血粉丝','88','58d457aa-cacf-413a-aac4-0acd347f33ce.jpg','早餐','否','否','在售','2017-02-27 00:00:00','','',1);
/*!40000 ALTER TABLE `ctdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctdish`
--

DROP TABLE IF EXISTS `ctdish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctdish` (
  `DishID` int(11) NOT NULL AUTO_INCREMENT,
  `DishWndID` int(11) NOT NULL,
  `DishTypeID` int(11) NOT NULL,
  `DishName` varchar(20) DEFAULT NULL,
  `DishPrice` varchar(20) DEFAULT NULL,
  `DishPhoto` varchar(80) DEFAULT NULL,
  `DishDate` varchar(20) DEFAULT NULL,
  `DishRecmd` varchar(1) DEFAULT NULL,
  `DishKeep` varchar(1) DEFAULT NULL,
  `DishSale` varchar(10) DEFAULT NULL,
  `DishNote` varchar(50) DEFAULT NULL,
  `DishDelete` varchar(1) DEFAULT NULL,
  `DishSubmitState` varchar(1) DEFAULT NULL,
  `DishInDate` datetime DEFAULT NULL,
  PRIMARY KEY (`DishID`),
  KEY `FK_CTDish_CTWnd_idx` (`DishWndID`),
  KEY `FK_CTDish_CTDishType_idx` (`DishTypeID`),
  CONSTRAINT `FK_CTDish_CTDishType` FOREIGN KEY (`DishTypeID`) REFERENCES `ctdishtype` (`DishTypeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CTDish_CTWnd` FOREIGN KEY (`DishWndID`) REFERENCES `ctwnd` (`WndID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctdish`
--

LOCK TABLES `ctdish` WRITE;
/*!40000 ALTER TABLE `ctdish` DISABLE KEYS */;
INSERT INTO `ctdish` VALUES (33,4,2,'千张肉丝','88','58d457aa-cacf-413a-aac4-0acd347f33ce.jpg','早餐','否','否','在售','','',NULL,'2017-02-27 00:00:00'),(34,4,2,'鸡肉饭','99','d1f4aa53-7158-47af-b735-66817800dbed.jpg','正餐','否','否','在售','','',NULL,'2017-02-27 00:00:00'),(37,4,5,'香蕉牛奶','8','fd4dba1a-9e81-4a6c-8f82-7fce93be6be4.jpg','正餐','否','否','在售','','',NULL,'2017-03-02 00:00:00'),(38,4,5,'鸡','12','c346db5f-ef58-4e73-8bc6-15ee93f548c1.JPG','早餐','是','是','在售','','',NULL,'2017-03-06 00:00:00'),(39,4,6,'鱼粉','10','default.jpg','晚上','否','是','在售','','',NULL,'2017-03-09 00:00:00'),(43,12,6,'大辣条','4','cfe72f17-aee4-48e9-b9b1-18057627d56d.jpg','全天供应','是','是','在售','','',NULL,'2017-04-24 00:00:00'),(44,12,2,'热干面','8','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg','全天供应','否','否','在售','','',NULL,'2017-05-10 00:00:00'),(47,4,6,'特价菜','12','2c553df2-9f0f-462a-bd34-b2e3979657cc.png','正餐','是','是','在售','','',NULL,'2017-05-10 00:00:00');
/*!40000 ALTER TABLE `ctdish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctdishpreset`
--

DROP TABLE IF EXISTS `ctdishpreset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctdishpreset` (
  `DishPresetID` int(11) NOT NULL AUTO_INCREMENT,
  `DishPresetName` varchar(20) DEFAULT NULL,
  `DishPresetPhoto` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`DishPresetID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctdishpreset`
--

LOCK TABLES `ctdishpreset` WRITE;
/*!40000 ALTER TABLE `ctdishpreset` DISABLE KEYS */;
INSERT INTO `ctdishpreset` VALUES (5,'热干面','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(6,'香蕉牛奶','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(7,'黄焖鸡','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(8,'鸡肉饭','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(9,'鸭肉饭','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(10,'鱼粉','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(11,'炒饭','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(12,'千张肉丝','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(13,'牛肉干','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(14,'麻辣烫','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(15,'五谷鱼粉','fb21f7c7-069a-44c3-bdbf-1ee6e594d0b8.jpg'),(16,'大辣条','cfe72f17-aee4-48e9-b9b1-18057627d56d.jpg'),(17,'特价菜','2c553df2-9f0f-462a-bd34-b2e3979657cc.png');
/*!40000 ALTER TABLE `ctdishpreset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctdishtype`
--

DROP TABLE IF EXISTS `ctdishtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctdishtype` (
  `DishTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `DishTypeName` varchar(20) DEFAULT NULL,
  `DishTypeNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`DishTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctdishtype`
--

LOCK TABLES `ctdishtype` WRITE;
/*!40000 ALTER TABLE `ctdishtype` DISABLE KEYS */;
INSERT INTO `ctdishtype` VALUES (1,'火锅',''),(2,'面食',''),(3,'盖饭',''),(4,'粤菜',''),(5,'湘菜',''),(6,'其他','');
/*!40000 ALTER TABLE `ctdishtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctlog`
--

DROP TABLE IF EXISTS `ctlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctlog` (
  `LogID` int(11) NOT NULL AUTO_INCREMENT,
  `LogCreateDate` datetime DEFAULT NULL,
  `MUserID` int(11) DEFAULT NULL,
  `MUserCampus` varchar(20) DEFAULT NULL,
  `MUserCant` varchar(20) DEFAULT NULL,
  `MUserName` varchar(20) DEFAULT NULL,
  `LogOperation` varchar(20) DEFAULT NULL,
  `LogContent` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctlog`
--

LOCK TABLES `ctlog` WRITE;
/*!40000 ALTER TABLE `ctlog` DISABLE KEYS */;
INSERT INTO `ctlog` VALUES (1,'2017-05-08 20:42:06',1,'东院','莘子院','ants','添加记录','鸡'),(2,'2017-05-08 20:43:40',1,'东院','莘子院','ants','添加记录','鸡肉饭'),(3,'2017-05-08 20:43:50',1,'东院','莘子院','ants','添加记录','千张肉丝'),(4,'2017-05-08 20:43:50',1,'东院','莘子院','ants','删除记录','鸡'),(5,'2017-05-09 12:42:36',1,'东院','莘子院','ants','添加记录表','Tue May 09 00:00:00 CST 2017的记录表'),(6,'2017-05-09 12:43:05',1,'东院','莘子院','ants','添加记录','鸡'),(7,'2017-05-09 12:43:05',1,'东院','莘子院','ants','添加记录','千张肉丝'),(8,'2017-05-09 12:43:22',1,'东院','莘子院','ants','删除记录','鸡'),(9,'2017-05-09 12:43:22',1,'东院','莘子院','ants','删除记录','千张肉丝'),(10,'2017-05-09 12:44:00',1,'东院','莘子院','ants','删除记录','香蕉牛奶'),(11,'2017-05-09 12:44:00',1,'东院','莘子院','ants','删除记录','鸡肉饭'),(12,'2017-05-09 12:44:00',1,'东院','莘子院','ants','删除记录','鸡肉饭'),(13,'2017-05-09 12:44:00',1,'东院','莘子院','ants','删除记录','鸡'),(14,'2017-05-09 12:44:00',1,'东院','莘子院','ants','删除记录','千张肉丝'),(15,'2017-05-09 12:44:00',1,'东院','莘子院','ants','删除记录表','null的记录表'),(16,'2017-05-09 12:44:17',1,'东院','莘子院','ants','添加记录表','Tue May 09 00:00:00 CST 2017的记录表'),(17,'2017-05-09 12:44:20',1,'东院','莘子院','ants','添加记录','鸡'),(18,'2017-05-09 12:44:24',1,'东院','莘子院','ants','删除记录','鸡'),(19,'2017-05-09 12:44:24',1,'东院','莘子院','ants','删除记录表','null的记录表'),(20,'2017-05-09 12:45:44',1,'东院','莘子院','ants','添加记录表','Tue May 09 00:00:00 CST 2017的记录表'),(21,'2017-05-09 12:45:54',1,'东院','莘子院','ants','添加记录','香蕉牛奶'),(22,'2017-05-09 12:46:01',1,'东院','莘子院','ants','删除记录','香蕉牛奶'),(23,'2017-05-09 12:46:01',1,'东院','莘子院','ants','删除记录表','Tue May 09 00:00:00 CST 2017的记录表'),(24,'2017-05-09 12:49:07',1,'东院','莘子院','ants','添加记录表','Tue May 09 00:00:00 CST 2017的记录表'),(25,'2017-05-09 12:49:11',1,'东院','莘子院','ants','添加记录','【早餐】鸡'),(26,'2017-05-09 12:49:17',1,'东院','莘子院','ants','添加记录','【早餐】千张肉丝'),(27,'2017-05-09 12:49:17',1,'东院','莘子院','ants','删除记录','【早餐】鸡'),(28,'2017-05-09 12:49:21',1,'东院','莘子院','ants','删除记录','【早餐】千张肉丝'),(29,'2017-05-09 12:49:22',1,'东院','莘子院','ants','删除记录表','Tue May 09 00:00:00 CST 2017的记录表'),(30,'2017-05-10 10:18:33',1,'东院','莘子院','ants','上架','【全天供应】特价菜'),(31,'2017-05-10 10:43:37',1,'东院','莘子院','ants','下架','【全天供应】特价菜'),(32,'2017-05-10 11:18:25',1,'东院','莘子院','ants','修改','【晚上】鱼粉'),(33,'2017-05-10 11:19:15',1,'东院','莘子院','ants','修改','【晚上】特价菜'),(34,'2017-05-10 11:49:20',1,'东院','莘子院','ants','修改','【晚上】特价菜'),(35,'2017-05-10 11:49:59',1,'东院','莘子院','ants','下架','【晚上】特价菜'),(36,'2017-05-10 11:49:59',1,'东院','莘子院','ants','上架','【晚上】鱼粉'),(37,'2017-05-10 15:05:36',1,'东院','莘子院','ants','修改','【晚上】鱼粉'),(38,'2017-05-10 15:23:39',1,'东院','莘子院','ants','添加记录表','2017-05-10的记录表'),(39,'2017-05-10 15:23:55',1,'东院','莘子院','ants','添加记录','【早餐】鸡'),(40,'2017-05-10 15:24:02',1,'东院','莘子院','ants','添加记录','【晚餐】鸡肉饭'),(41,'2017-05-10 15:24:19',1,'东院','莘子院','ants','删除记录','【早餐】鸡'),(42,'2017-05-10 15:24:19',1,'东院','莘子院','ants','删除记录','【晚餐】鸡肉饭'),(43,'2017-05-10 15:24:20',1,'东院','莘子院','ants','删除记录表','2017-05-10的记录表'),(44,'2017-05-10 15:30:21',1,'东院','莘子院','ants','上架','【正餐】特价菜');
/*!40000 ALTER TABLE `ctlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctmuser`
--

DROP TABLE IF EXISTS `ctmuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctmuser` (
  `MUserID` int(11) NOT NULL AUTO_INCREMENT,
  `MUserCantID` int(11) DEFAULT NULL,
  `MUserCampusID` int(11) DEFAULT NULL,
  `MUserRoleID` int(11) NOT NULL,
  `MUserName` varchar(20) DEFAULT NULL,
  `MUserPwd` varchar(20) DEFAULT NULL,
  `MUserTel` varchar(20) DEFAULT NULL,
  `MUserPhoto` varchar(80) DEFAULT NULL,
  `MUserEmail` varchar(20) DEFAULT NULL,
  `MUserState` varchar(10) DEFAULT NULL,
  `MUserRegDate` datetime DEFAULT NULL,
  `MUserLastDate` datetime DEFAULT NULL,
  `MUserNote` varchar(50) DEFAULT NULL,
  `MUserSubmitDate` datetime DEFAULT NULL,
  PRIMARY KEY (`MUserID`),
  KEY `FK_CTMuser_CTCampus_idx` (`MUserCampusID`),
  KEY `FK_CTMuser_CTCant_idx` (`MUserCantID`),
  KEY `FK_CTMuer_CTRole_idx` (`MUserRoleID`),
  KEY `FK_CTMuser_CTRoleTable_idx` (`MUserRoleID`),
  CONSTRAINT `FK_CTMuser_CTCampus` FOREIGN KEY (`MUserCampusID`) REFERENCES `ctcampus` (`CampusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CTMuser_CTCant` FOREIGN KEY (`MUserCantID`) REFERENCES `ctcant` (`CantID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CTMuser_CTRole` FOREIGN KEY (`MUserRoleID`) REFERENCES `ctrole` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctmuser`
--

LOCK TABLES `ctmuser` WRITE;
/*!40000 ALTER TABLE `ctmuser` DISABLE KEYS */;
INSERT INTO `ctmuser` VALUES (1,10,4,3,'ants','123456','19999999999','user-default.jpg','',NULL,'2017-03-01 00:00:00',NULL,NULL,NULL),(2,9,4,1,'yuliu','123456','12323232333','de7b2a9b-d755-4559-b40f-c66bcf8037c8.jpg','xx@xx.com',NULL,'2017-03-05 00:00:00',NULL,NULL,NULL),(5,9,4,2,'pengxiao','123456','18888887777','user-default.jpg','',NULL,'2017-03-12 00:00:00',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ctmuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctrecord`
--

DROP TABLE IF EXISTS `ctrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctrecord` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordCampusID` int(11) NOT NULL,
  `RecordCantID` int(11) NOT NULL,
  `RecordCampusName` varchar(20) DEFAULT NULL,
  `RecordCantName` varchar(20) DEFAULT NULL,
  `RecordMUserID` int(11) NOT NULL,
  `RecordMUserName` varchar(20) DEFAULT NULL,
  `RecordDate` datetime DEFAULT NULL,
  `RecordSubmitState` varchar(10) DEFAULT NULL,
  `ReplenishFlag` int(11) DEFAULT '0',
  `ReplenishDate` datetime DEFAULT NULL,
  `ReplenishState` varchar(10) DEFAULT 'null',
  PRIMARY KEY (`RecordID`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctrecord`
--

LOCK TABLES `ctrecord` WRITE;
/*!40000 ALTER TABLE `ctrecord` DISABLE KEYS */;
INSERT INTO `ctrecord` VALUES (68,4,10,'东院','莘子院',1,'ants','2017-03-01 00:00:00','已提交',0,NULL,'null'),(69,4,10,'东院','莘子院',1,'ants','2017-03-03 00:00:00','已提交',0,NULL,'null'),(70,4,10,'东院','莘子院',1,'ants','2017-03-05 00:00:00','已提交',0,NULL,'null'),(71,4,10,'东院','莘子院',1,'ants','2017-03-09 00:00:00','已提交',0,NULL,'null'),(72,4,10,'东院','莘子院',1,'ants','2017-03-07 00:00:00','已提交',0,NULL,'null'),(76,4,10,'东院','莘子院',1,'ants','2017-03-12 00:00:00','已提交',0,NULL,'null'),(77,4,10,'东院','莘子院',1,'ants','2017-03-02 00:00:00','已提交',0,NULL,'null'),(79,4,10,'东院','莘子院',1,'ants','2017-03-14 00:00:00','已提交',0,NULL,'null'),(80,4,10,'东院','莘子院',1,'ants','2017-03-18 00:00:00','已提交',0,NULL,'null'),(81,4,10,'东院','莘子院',1,'ants','2017-03-13 00:00:00','已提交',0,NULL,'null'),(85,4,10,'东院','莘子院',1,'ants','2017-04-09 00:00:00','已提交',0,NULL,'null'),(112,4,10,'东院','莘子院',1,'ants','2017-04-20 00:00:00','已提交',0,NULL,'null'),(116,4,10,'东院','莘子院',1,'ants','2017-05-08 00:00:00','已提交',0,NULL,'null');
/*!40000 ALTER TABLE `ctrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctrole`
--

DROP TABLE IF EXISTS `ctrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctrole` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleName` varchar(20) DEFAULT NULL,
  `RoleNote` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctrole`
--

LOCK TABLES `ctrole` WRITE;
/*!40000 ALTER TABLE `ctrole` DISABLE KEYS */;
INSERT INTO `ctrole` VALUES (1,'super',NULL),(2,'company',NULL),(3,'canteen',NULL),(4,'user',NULL);
/*!40000 ALTER TABLE `ctrole` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctuser`
--

DROP TABLE IF EXISTS `ctuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctuser` (
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserCantID` int(11) DEFAULT NULL,
  `UserCampusID` int(11) DEFAULT NULL,
  `UserRoleID` int(11) NOT NULL,
  `UserName` varchar(20) DEFAULT NULL,
  `UserPwd` varchar(20) DEFAULT NULL,
  `UserTel` varchar(20) DEFAULT NULL,
  `UserSex` varchar(5) DEFAULT NULL,
  `UserPhoto` varchar(80) DEFAULT NULL,
  `UserGrade` varchar(10) DEFAULT NULL,
  `UserAcadamy` varchar(20) DEFAULT NULL,
  `UserClass` varchar(10) DEFAULT NULL,
  `UserEmail` varchar(20) DEFAULT NULL,
  `UserState` varchar(5) DEFAULT NULL,
  `UserRegDate` varchar(20) DEFAULT NULL,
  `UserLastDate` varchar(20) DEFAULT NULL,
  `UserNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `FK_CTUser_CTCampus_idx` (`UserCampusID`),
  KEY `FK_CTUser_CTCant_idx` (`UserCantID`),
  KEY `FK_CTUser_CTRole_idx` (`UserRoleID`),
  CONSTRAINT `FK_CTUser_CTCampus` FOREIGN KEY (`UserCampusID`) REFERENCES `ctcampus` (`CampusID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CTUser_CTCant` FOREIGN KEY (`UserCantID`) REFERENCES `ctcant` (`CantID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_CTUser_CTRole` FOREIGN KEY (`UserRoleID`) REFERENCES `ctrole` (`RoleID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctuser`
--

LOCK TABLES `ctuser` WRITE;
/*!40000 ALTER TABLE `ctuser` DISABLE KEYS */;
INSERT INTO `ctuser` VALUES (2,11,4,4,'mini','123456',NULL,NULL,'user-default.jpg',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ctuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctwnd`
--

DROP TABLE IF EXISTS `ctwnd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctwnd` (
  `WndID` int(11) NOT NULL AUTO_INCREMENT,
  `WndCantID` int(11) NOT NULL,
  `WndName` varchar(20) DEFAULT NULL,
  `WndPhoto` varchar(80) DEFAULT NULL,
  `WndAddr` varchar(45) DEFAULT NULL,
  `WndPriceRange` varchar(20) DEFAULT NULL,
  `WndSaleHours` varchar(20) DEFAULT NULL,
  `WndPayment` varchar(20) DEFAULT NULL,
  `WndDescription` varchar(30) DEFAULT NULL,
  `WndNote` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`WndID`),
  KEY `FK_CTWnd_CTCant_idx` (`WndCantID`),
  CONSTRAINT `FK_CTWnd_CTCant` FOREIGN KEY (`WndCantID`) REFERENCES `ctcant` (`CantID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctwnd`
--

LOCK TABLES `ctwnd` WRITE;
/*!40000 ALTER TABLE `ctwnd` DISABLE KEYS */;
INSERT INTO `ctwnd` VALUES (2,11,'自助',NULL,'','','','','',''),(3,11,'娃哈哈',NULL,'','','','','',''),(4,10,'南京鸭血粉丝',NULL,'','','','','',''),(5,9,'粤港烧鹅饭',NULL,'','','','','',''),(6,18,'襄阳牛肉面',NULL,'','','','','',''),(7,12,'黄焖鸡米饭',NULL,'','','','','',''),(8,15,'小米姑娘',NULL,'','','','','',''),(9,14,'黄金炒饭',NULL,'','','','','',''),(10,17,'特色盖浇饭',NULL,'','','','','',''),(11,16,'锅巴饭',NULL,'','','','','',''),(12,10,'麻辣烫',NULL,'','','','','','');
/*!40000 ALTER TABLE `ctwnd` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-27 19:31:14
