-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: audit
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `computers`
--

DROP TABLE IF EXISTS `computers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `owner_user_id` bigint unsigned NOT NULL,
  `computer_type_id` bigint unsigned NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `serial_number` varchar(100) DEFAULT NULL,
  `computer_name` varchar(100) DEFAULT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `computer_type_id` (`computer_type_id`),
  CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `computers_ibfk_2` FOREIGN KEY (`computer_type_id`) REFERENCES `computers_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers`
--

LOCK TABLES `computers` WRITE;
/*!40000 ALTER TABLE `computers` DISABLE KEYS */;
INSERT INTO `computers` VALUES (1,1,1,'1984-10-15 11:27:56','RU100001','Name01'),(2,3,2,'2004-10-01 16:00:43','RU100002','Name02'),(3,4,1,'2000-10-23 14:41:01','RU100003','Name03'),(4,5,2,'2019-08-31 08:29:53','RU100004','Name04'),(5,1,1,'1988-10-18 04:09:07','RU100005','Name05'),(6,3,2,'1992-12-02 20:40:23','RU100006','Name06'),(7,4,1,'2008-05-08 23:11:54','RU100007','Name07'),(8,5,2,'1986-01-15 02:11:42','RU100008','Name08'),(9,1,1,'1988-11-25 03:57:06','RU100009','Name09'),(10,3,2,'1973-11-30 12:38:31','RU100010','Name10');
/*!40000 ALTER TABLE `computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computers_type`
--

DROP TABLE IF EXISTS `computers_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `computers_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computers_type`
--

LOCK TABLES `computers_type` WRITE;
/*!40000 ALTER TABLE `computers_type` DISABLE KEYS */;
INSERT INTO `computers_type` VALUES (1,'laptop','1981-02-10 19:44:40','1970-08-30 07:38:20'),(2,'tablet','2010-02-16 01:12:47','2007-07-26 22:23:48');
/*!40000 ALTER TABLE `computers_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `user_id` bigint unsigned NOT NULL,
  `gender` char(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `hometown` varchar(100) DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Профили пользователей';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'1','2009-04-29','2012-09-04 18:47:09','Москва'),(2,'2','1971-07-13','1977-02-14 18:46:18','Москва'),(3,'1','2001-02-10','1976-06-11 15:57:19','Москва'),(4,'1','1988-06-18','2016-10-04 22:47:59','Мытищи'),(5,'1','1989-06-18','2016-10-04 22:47:59','Мытищи');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software`
--

DROP TABLE IF EXISTS `software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `software` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `software_type_id` bigint unsigned NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `software_name_idx` (`name`),
  KEY `user_id` (`user_id`),
  KEY `software_type_id` (`software_type_id`),
  CONSTRAINT `software_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `software_ibfk_2` FOREIGN KEY (`software_type_id`) REFERENCES `software_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software`
--

LOCK TABLES `software` WRITE;
/*!40000 ALTER TABLE `software` DISABLE KEYS */;
INSERT INTO `software` VALUES (1,1,'MS Office',1),(2,2,'Google chrome',3),(3,1,'Internet Explorer',4),(4,2,'Adobe Acrobat',5),(5,1,'Adobe Photoshop',1),(6,2,'Яндекс Алиса',3),(7,1,'Conter Strike',4),(8,2,'Alloy Navigator',5),(9,1,'DBeaver',1),(10,2,'MS SQL Server',3);
/*!40000 ALTER TABLE `software` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `software_type`
--

DROP TABLE IF EXISTS `software_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `software_type` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `software_type`
--

LOCK TABLES `software_type` WRITE;
/*!40000 ALTER TABLE `software_type` DISABLE KEYS */;
INSERT INTO `software_type` VALUES (1,'licence','1981-04-11 22:00:37','1995-02-18 04:01:56'),(2,'free','2012-10-10 20:30:32','2007-11-17 15:33:11');
/*!40000 ALTER TABLE `software_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иван','Кузнецов','ivan.kuznetsov@svg.com',89347564205),(2,'Мария','Иванова','maria.ivanova@svg.com',89514910492),(3,'Самсон','Сидоров','samson.sidorov@svg.com',89344189383),(4,'Алексей','Сидоров','aleksey.sidorov@svg.com',89344459173),(5,'Александр','Васильев','aleksandr.vasiliev@svg.com',82641219264);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_hardware`
--

DROP TABLE IF EXISTS `users_hardware`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_hardware` (
  `user_id` bigint unsigned NOT NULL,
  `computer_id` bigint unsigned NOT NULL,
  `status` enum('working_use','personal_use') DEFAULT 'working_use',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`computer_id`),
  KEY `computer_id` (`computer_id`),
  CONSTRAINT `users_hardware_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_hardware_ibfk_2` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_hardware`
--

LOCK TABLES `users_hardware` WRITE;
/*!40000 ALTER TABLE `users_hardware` DISABLE KEYS */;
INSERT INTO `users_hardware` VALUES (1,1,'personal_use','1978-09-10 16:20:16','1996-12-06 15:39:25'),(1,5,'working_use','1988-07-06 23:06:12','1970-05-27 13:41:21'),(1,9,'working_use','2001-06-14 07:08:45','2021-02-25 15:52:28'),(3,2,'personal_use','1981-05-01 11:01:11','1998-08-04 08:28:54'),(3,6,'personal_use','1984-09-25 10:34:08','2008-07-29 23:52:51'),(3,10,'personal_use','1998-03-08 02:25:17','2007-04-30 18:19:55'),(4,3,'working_use','2017-12-20 02:23:17','1976-08-04 09:01:10'),(4,7,'personal_use','1990-12-11 14:48:26','2010-04-29 08:56:58'),(5,4,'personal_use','1992-09-27 07:10:25','2010-05-03 09:59:17'),(5,8,'working_use','1971-09-16 14:54:42','2021-05-23 15:06:07');
/*!40000 ALTER TABLE `users_hardware` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_software`
--

DROP TABLE IF EXISTS `users_software`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_software` (
  `user_id` bigint unsigned NOT NULL,
  `software_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`software_id`),
  KEY `software_id` (`software_id`),
  CONSTRAINT `users_software_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_software_ibfk_2` FOREIGN KEY (`software_id`) REFERENCES `software` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_software`
--

LOCK TABLES `users_software` WRITE;
/*!40000 ALTER TABLE `users_software` DISABLE KEYS */;
INSERT INTO `users_software` VALUES (1,1),(3,2),(4,3),(5,4),(1,5),(3,6),(4,7),(5,8),(1,9),(3,10);
/*!40000 ALTER TABLE `users_software` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08 19:04:56
