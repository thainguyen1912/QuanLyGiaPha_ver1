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
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` int(11) NOT NULL,
  `datecreate` date DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('admin','admin',2,'1998-12-12'),('manager','manager',1,'1998-12-12'),('member','member',0,'1998-12-12'),('nguyễn thái','nguyễn thái',1,'1998-12-12'),('user1','abc',1,'1998-12-12'),('user2','abc',1,'1998-12-12'),('user3','abc',1,'2019-11-01'),('user4','abc',1,'2019-11-01'),('user5','abc',1,'2019-11-01'),('user6','abc',1,'2019-11-11'),('user7','abc',1,'2019-11-28');
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
  `url` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `datecreate` date DEFAULT NULL,
  `idparentage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_image_parentage_idx` (`idparentage`),
  CONSTRAINT `fk_image_parentage` FOREIGN KEY (`idparentage`) REFERENCES `parentage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (2,'19.10-ermine-wallpaper.jpg','không có ghi chú thêm','2019-11-28',15),(3,'22 - dSGDs2y.png','không có ghi chú thêm','2019-11-28',15);
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
  `datedeath` date DEFAULT NULL,
  `childth` int(11) DEFAULT NULL,
  `idfather` int(11) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `branch` varchar(250) DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `moreinfo` varchar(250) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_indi_parentage_idx` (`idparentage`),
  CONSTRAINT `fk_indi_parentage` FOREIGN KEY (`idparentage`) REFERENCES `parentage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual`
--

LOCK TABLES `individual` WRITE;
/*!40000 ALTER TABLE `individual` DISABLE KEYS */;
INSERT INTO `individual` VALUES (1,2,'Bùi Văn Nam','Nguyễn Thị Hạnh','1998-12-13','1998-12-13',1,0,1,'1','f0a391fb6c127a4e9a7489a5cb56041e576bc9143ca33a9ad3092fb8e427e041.jpg','Không Có      ',1),(2,2,'Bùi Văn Minh','Nguyễn Thị Hoàng','1998-12-12','1998-12-12',1,1,0,'1-2','img_570334.png','Không Có',2),(3,2,'Bùi Văn Hải','Nguyễn Thị Yến','1998-12-12','1998-12-12',2,1,1,'1-3','22 - dSGDs2y.png','Không Có',2),(4,2,'Bùi Văn Trí','Nguyễn Thị Minh','1998-12-12','1998-12-12',1,2,0,'1-2-4',NULL,NULL,3),(5,2,'Bùi Văn Đức','Nguyễn Thị Thương','1998-12-12','1998-12-12',2,2,1,'1-2-5',NULL,NULL,3),(6,2,'Bùi Văn Thiện','Nguyễn Thị Dung','1998-12-12','1998-12-12',1,3,0,'1-3-6',NULL,NULL,3),(7,2,'Bùi Văn Yến','Nguyễn Thị Linh','1998-12-12','1998-12-12',2,3,1,'1-3-7',NULL,NULL,3),(8,2,'Bùi Văn Tùng','Nguyễn Thị Hoa','1998-12-12','1998-12-12',1,4,0,'1-2-4-8',NULL,NULL,4),(9,2,'Bùi Văn Tự','Nguyễn Thị Liên','1998-12-12','1998-12-12',1,6,1,'1-3-6-9',NULL,NULL,4),(10,2,'Bùi Văn Luyện','Nguyễn Thị Phúc','1998-12-12','1998-12-12',2,6,1,'1-3-6-10',NULL,NULL,4),(11,2,'Bùi Văn Đồng','Nguyễn Thị Tâm','1998-12-12','1998-12-12',1,7,1,'1-3-7-11',NULL,NULL,4),(12,2,'Bùi Văn Khanh','Nguyễn Thị Ý','1998-12-12','1998-12-12',3,3,1,'1-2-4-8-12',NULL,NULL,5),(50,14,'Lê Thịnh Hiền','Nguyễn Thị Hải','1998-12-12','1998-12-12',1,0,1,'50',NULL,NULL,1),(51,15,'Nguyễn Thành Minh','Nguyễn Thị Hà','1998-12-12','1998-12-12',1,0,1,'51','img_570334.png','Không Có',1),(52,15,'Nguyễn Thành Thiện','Bùi Thị Hải','2019-11-03','2019-11-02',1,51,1,'51-52','19.10-ermine-wallpaper.jpg','Không Có',2),(53,16,'Nguyễn Văn Đại','Bùi Thị Yến','1998-12-12','1998-12-12',1,0,1,'53',NULL,NULL,1),(54,16,'Nguyễn Văn Đạt','Bùi Thị Tính','2019-10-31','2019-10-31',1,53,0,'53-54','22 - dSGDs2y.png','Không Có',2),(55,15,'Nguyễn Thành Thái','Bùi Thị Minh','2019-11-02','2019-11-02',1,52,1,'51-52-55','6e5ee3bcf2a7d6bc728c6f8aa459178e40b93fbb0fe39348ec5b4d3896f85509.jpg','Không Có',3),(56,2,'Bùi Văn Tùng','Nguyễn Thị Nguyện','2019-11-03','2019-11-10',1,8,1,'1-2-4-8-56','','Không Có',5),(57,15,'Nguyễn Thành Đức','Bùi Thị Tâm','2019-11-09','2019-11-16',1,52,1,'51-52-57','73321257_530206741103981_3808296979662897152_n.jpg','Không Có',3),(58,15,'Nguyễn Thành Hùng','Bùi Thị Linh','2019-11-02','2019-11-08',2,55,1,'51-52-55-58','56815965_694067977718579_1699601954407186432_o.jpg','Không Có',4);
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
  `note` varchar(250) DEFAULT NULL,
  `datecreate` date DEFAULT NULL,
  `headname` varchar(45) DEFAULT NULL,
  `headaddress` varchar(45) DEFAULT NULL,
  `headnumberphone` varchar(45) DEFAULT NULL,
  `username` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_username_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parentage`
--

LOCK TABLES `parentage` WRITE;
/*!40000 ALTER TABLE `parentage` DISABLE KEYS */;
INSERT INTO `parentage` VALUES (1,'Nguyễn','Nguyễn Văn Minh','Hà Nội','1998-12-12','Không','Không','1998-02-02',NULL,NULL,NULL,'member'),(2,'Bùi Văn','Bùi Văn Mạnh ','Hà Nội','1999-10-04',NULL,'Không Có Thông Tin','2019-10-02','Bùi Văn Hải','Hà Nội ','0123456789','user1'),(3,'Trịnh Hoàng',NULL,'Bắc Ninh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'user2'),(4,'Nguyễn Hoàng',NULL,'Hà Nội',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'manager'),(12,'Nguyễn Thành','Nguyễn Thành Minh','Hà Nội','1998-12-12',NULL,NULL,'2019-11-01',NULL,NULL,NULL,'user3'),(13,'Nguyễn Thành','Nguyễn Thành Minh','Hà Nội','1998-12-12',NULL,NULL,'2019-11-01',NULL,NULL,NULL,'user3'),(14,'Lê Thịnh','Lê Thịnh Hiền','Hà Nội','1998-12-12',NULL,NULL,'2019-11-01',NULL,NULL,NULL,'user4'),(15,'Nguyễn Thành','Nguyễn Thành Minh','Hà Nội','1998-12-12',NULL,NULL,'2019-11-01',NULL,NULL,NULL,'user5'),(16,'Nguyễn Văn ','Nguyễn Văn Minh','Hà Nội','1998-12-12',NULL,NULL,'2019-11-11',NULL,NULL,NULL,'user6');
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
  `title` text,
  `summary` longtext,
  `detail` longtext,
  `status` varchar(1) DEFAULT NULL,
  `key` varchar(1) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `datepost` date DEFAULT NULL,
  `username` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Gia Phả là gì? Hình thức lập Gia Phả và Tộc Phả','Gia phả hay gia phổ là bản ghi chép tên họ, tuổi tác, ngày giỗ, vai trò và công đức của cha mẹ, ông bà, tiên tổ và mộ phần của một gia đình lớn hay một dòng họ.','Gia phả: Có thể gọi là Tông Chi Phả là chi tộc nhỏ trong một Dòng tộc của một Gia phả lớn có thể gọi là Tộc phả. Tông Chi Phả là mấu chốt của một Gia đình, một Họ...Tuy nó không đủ mọi chi tiết nhưng nó cung cấp cho ta biết từ bậc Ông Bà, Cha Mẹ đến con cháu một giai đọan để có đủ tài liệu về tiểu sử lý lịch của mỗi cá nhân : ngày tháng năm sinh, nơi sinh (sinh quán) sống chết, nghề nghiệp, địa chỉ (trú quán)...Ngoài ra còn nhiều vấn đề như: Học vấn, thành tích.. của mỗi người trong gia đình đó đã đóng góp liên quan đến xã hội đến sự hưng vong của Gia đình, Tổ tiên, Dân tộc và Quốc gia...Ảnh hưởng chung đến các sinh hoạt kinh tế, văn hóa, phong tục tập quán trong xã hội...','0','0','post1.jpg','2019-10-10','user1'),(2,'Dựng Gia Phả, giải toả khúc mắc lịch sử','Các dòng họ là một phần của lịch sử dân tộc, qua đó, những người dựng gia phả đã giải tỏa nhiều tồn nghi do quá khứ để lại hay tìm được mộ phần của những người có công với nước vốn thất lạc hàng trăm năm.','Minh oan cho Đốc binh Hương','0','0','post2.jpg','2019-10-11','user1'),(3,'Tại sao phải Mừng tuổi, Lì xì đầu năm','Mừng tuổi đầu năm là phong tục phổ biến ở các nước Á Đông. Vậy nguồn gốc, ý nghĩa của phong tục lì xì đầu năm là gì và tại sao lại phải mừng tuổi và lì xì đầu năm?','Lì xì đầu năm vốn tồn tại từ lâu, nguồn gốc của phong tục này cũng được kể lại bằng nhiều tích chuyện. Có chuyện kể rằng ngày xưa, ở Đông Hải có rất nhiều yêu quái thường xuyên gây hại bá tính song những ngày thường chúng luôn bị các thần tiên ở hạ giới canh giữ. Tuy nhiên, hàng năm các vị thần tiên đều phả về trời vào thời điểm giao thừa. Lúc này, yêu quái lộng hành quấy rối trẻ em đang ngủ khiến trẻ thường giật mình khóc thét và bị sốt, nên bố mẹ thường không dám ngủ để thức canh con trẻ. Một lần có 8 vị tiên đi ngang nhà kia thấy vậy liền hóa thành những đồng tiền nằm bên chỗ mấy đứa trẻ, cha mẹ chúng đem gói những đồng tiền này vào tấm vải đó để xua đuổi yêu quái. Phép lạ này nhanh chóng lan truyền ra khắp nhân gian nên khi Tết đến người ta lại bỏ tiền vào trong những cái túi màu đỏ tặng trẻ con để trẻ chóng lớn và khỏe mạnh hơn, từ đó trở thành tục lì xì đầu năm như hiện nay.','1','0','post3.jpg','2019-10-12','user1'),(4,'Nguồn gốc Họ Trần?','Họ Trần được kể bởi cụ Tân. Họ Trần làng Kim Thiều, xã Hương Mạc, Từ Sơn, Bắc Ninh vốn nổi danh là dòng họ khoa bảng. Trải qua đến nay đã 21 đời, từ thời tiên tổ thứ nhất đến nay con cháu dòng họ này nổi tiếng là hay chữ.','Lì xì đầu năm vốn tồn tại từ lâu, nguồn gốc của phong tục này cũng được kể lại bằng nhiều tích chuyện. Có chuyện kể rằng ngày xưa, ở Đông Hải có rất nhiều yêu quái thường xuyên gây hại bá tính song những ngày thường chúng luôn bị các thần tiên ở hạ giới canh giữ. Tuy nhiên, hàng năm các vị thần tiên đều phả về trời vào thời điểm giao thừa. Lúc này, yêu quái lộng hành quấy rối trẻ em đang ngủ khiến trẻ thường giật mình khóc thét và bị sốt, nên bố mẹ thường không dám ngủ để thức canh con trẻ. Một lần có 8 vị tiên đi ngang nhà kia thấy vậy liền hóa thành những đồng tiền nằm bên chỗ mấy đứa trẻ, cha mẹ chúng đem gói những đồng tiền này vào tấm vải đó để xua đuổi yêu quái. Phép lạ này nhanh chóng lan truyền ra khắp nhân gian nên khi Tết đến người ta lại bỏ tiền vào trong những cái túi màu đỏ tặng trẻ con để trẻ chóng lớn và khỏe mạnh hơn, từ đó trở thành tục lì xì đầu năm như hiện nay.','1','1','post4.jpg','2019-10-15','admin'),(5,'8 Phong tục KHÔNG THỂ THIẾU của người Việt trong ngày Tết','Tết là dịp để mọi người sum họp, để nhìn về một năm đã qua và hướng đến một năm mới an khang thịnh vượng. Trong ngày Tết có rất nhiều phong tục đẹp hãy cùng chúng tôi tìm hiểu nhé.','Chơi hoa','1','0','post5.jpg','2019-10-20','user5');
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

-- Dump completed on 2019-11-28 22:58:52
