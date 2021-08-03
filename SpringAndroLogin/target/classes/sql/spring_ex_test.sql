-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: spring_ex
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test` (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pw` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `position` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `age` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `phoneNumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `naver_login` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `kakao_login` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` VALUES ('test1','$2a$10$fliQKi42G.sG0V0Coia3AOgnn2YwzFIaL7rjZoK3884fnphWV8tqi','test1','','사원','27','010-6576-2728',NULL,NULL),('user00','1234','김00','user00@mail.com','사원','27','010-1111-1111',NULL,NULL),('user01','1234','이00','user01@mail.com','사원','28','010-2222-2222',NULL,NULL),('user02','1234','박00','user02@mail.com','사원','26','010-3333-3333',NULL,NULL),('user03','1234','최00','user03@mail.com','대리','31','010-4444-4444',NULL,NULL),('user04','1234','곽00','user04@mail.com','대리','33','010-5555-5555',NULL,NULL),('user05','1234','고00','user05@mail.com','과장','37','010-6666-6666',NULL,NULL),('user06','1234','마00','user06@mail.com','과장','35','010-7777-7777',NULL,NULL),('user07','1234','윤00','user07@mail.com','책임','43','010-8888-8888',NULL,NULL),('user08','1234','정00','user08@mail.com','책임','47','010-9999-9999',NULL,NULL),('user09','1234','용00','user09@mail.com','팀장','49','010-1010-1010',NULL,NULL),('user10','1234','임00','user10@mail.com','팀장','50','010-0000-0000',NULL,NULL);
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-02 17:44:45
