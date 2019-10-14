-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlygiapha
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `username` varchar(10) NOT NULL,
  `password` varchar(15) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('admin','admin',2),('manager','manager',1),('member','member',0),('user1','abc',1),('user2','abc',1);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `idparentage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_parentage_idx` (`idparentage`),
  CONSTRAINT `fk_image_parentage` FOREIGN KEY (`idparentage`) REFERENCES `parentage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual`
--

DROP TABLE IF EXISTS `individual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idparentage` int(11) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `wifeorhusbandname` varchar(45) DEFAULT NULL,
  `datebirth` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datedeath` date DEFAULT NULL,
  `childth` int(11) DEFAULT NULL,
  `idfather` int(11) NOT NULL,
  `fatherfloor` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `branch` varchar(45) NOT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `moreinfo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indi_parentage_idx` (`idparentage`),
  CONSTRAINT `fk_indi_parentage` FOREIGN KEY (`idparentage`) REFERENCES `parentage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

LOCK TABLES `individual` WRITE;
/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` VALUES (1,2,'Bùi Văn Nam1','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,0,NULL,NULL,'1',NULL,NULL),(2,2,'Bùi Văn Nam2','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,1,NULL,NULL,'1-2',NULL,NULL),(3,2,'Bùi Văn Nam3','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,1,NULL,NULL,'1-3',NULL,NULL),(4,2,'Bùi Văn Nam4','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,2,NULL,NULL,'1-2-4',NULL,NULL),(5,2,'Bùi Văn Nam5','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,2,NULL,NULL,'1-2-5',NULL,NULL),(6,2,'Bùi Văn Nam6','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,3,NULL,NULL,'1-3-6',NULL,NULL),(7,2,'Bùi Văn Nam7','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,3,NULL,NULL,'1-3-7',NULL,NULL),(8,2,'Bùi Văn Nam8','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,4,NULL,NULL,'1-2-4-8',NULL,NULL),(9,2,'Bùi Văn Nam9','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,6,NULL,NULL,'1-3-6-9',NULL,NULL),(10,2,'Bùi Văn Nam10','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,6,NULL,NULL,'1-3-6-10',NULL,NULL),(11,2,'Bùi Văn Nam11','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,7,NULL,NULL,'1-3-7-11',NULL,NULL),(12,2,'Bùi Văn Nam12','Bùi Thị Nam','1998-12-12',0,'1998-12-12',NULL,3,NULL,NULL,'1-3-12',NULL,NULL);
/*!40000 ALTER TABLE `individual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parentage`
--

DROP TABLE IF EXISTS `parentage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parentage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `ancestor` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `anniversary` date DEFAULT NULL,
  `history` varchar(45) DEFAULT NULL,
  `note` varchar(45) DEFAULT NULL,
  `datecreate` date DEFAULT NULL,
  `headname` varchar(45) DEFAULT NULL,
  `headaddress` varchar(45) DEFAULT NULL,
  `headnumberphone` varchar(45) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_username_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentage`
--

LOCK TABLES `parentage` WRITE;
/*!40000 ALTER TABLE `parentage` DISABLE KEYS */;
INSERT INTO `parentage` VALUES (1,'Nguyễn','Nguyễn Văn Minh','Hà Nội','1998-12-12','Không','Không','1998-02-02',NULL,NULL,NULL,'member'),(2,'Bùi Văn','Bùi Văn Mạnh','Hà Nội','1999-10-04','Không','Không','2019-10-02','Bùi Văn Hải','Hà Nội','0123456789','user1'),(3,'Trịnh Hoàng',NULL,'Bắc Ninh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'user2'),(4,'Nguyễn Hoàng',NULL,'Hà Nội',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'manager');
/*!40000 ALTER TABLE `parentage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `summary` varchar(45) DEFAULT NULL,
  `detail` varchar(45) DEFAULT NULL,
  `idindividual` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_idx` (`idindividual`),
  CONSTRAINT `fk_post` FOREIGN KEY (`idindividual`) REFERENCES `individual` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-14 15:08:16
