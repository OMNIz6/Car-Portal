-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: rst
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT,
  `appointment_date` datetime NOT NULL,
  `status` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bidding_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  UNIQUE KEY `appointment_id_UNIQUE` (`appointment_id`),
  KEY `FK1lvv6ka6n3h605p3iabg9twrk` (`bidding_id`),
  KEY `FKa8m1smlfsc8kkjn2t6wpdmysk` (`user_id`),
  KEY `car_app_idx` (`car_id`),
  CONSTRAINT `FK1lvv6ka6n3h605p3iabg9twrk` FOREIGN KEY (`bidding_id`) REFERENCES `bidding` (`bid_id`),
  CONSTRAINT `FKa8m1smlfsc8kkjn2t6wpdmysk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKkh4e3lrmdf81w0j5ty8m8kfdj` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES (4,'2124-12-04 02:32:00','active',9,5,3,0,NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bidding`
--

DROP TABLE IF EXISTS `bidding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bidding` (
  `bid_id` int(11) NOT NULL AUTO_INCREMENT,
  `bid_amount` varchar(45) NOT NULL,
  `bid_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  PRIMARY KEY (`bid_id`),
  KEY `user_bid_idx` (`user_id`),
  KEY `car_bid_idx` (`car_id`),
  CONSTRAINT `car_bid` FOREIGN KEY (`car_id`) REFERENCES `cars` (`car_id`),
  CONSTRAINT `user_bid` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bidding`
--

LOCK TABLES `bidding` WRITE;
/*!40000 ALTER TABLE `bidding` DISABLE KEYS */;
INSERT INTO `bidding` VALUES (5,'5000','2021-01-10 00:55:22',9,3),(6,'3000','2021-01-11 10:54:57',11,3),(7,'4000','2021-01-11 22:51:36',9,5),(8,'20000','2021-01-11 22:51:45',9,5),(10,'4000','2021-01-16 18:08:33',11,3),(20,'4000','2021-01-22 00:18:45',11,4),(21,'3000','2021-01-22 00:19:34',10,4),(22,'300','2021-01-22 00:27:02',13,5),(23,'500','2021-01-22 00:27:16',13,5);
/*!40000 ALTER TABLE `bidding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_make` varchar(45) NOT NULL,
  `car_model` varchar(45) NOT NULL,
  `register_date` varchar(45) NOT NULL,
  `fuel_type` varchar(45) NOT NULL,
  `color` varchar(45) DEFAULT NULL,
  `mileage` varchar(45) DEFAULT NULL,
  `minimum_price` varchar(45) NOT NULL,
  `engine` varchar(45) DEFAULT NULL,
  `power` varchar(45) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Active',
  `img_url` varchar(100) NOT NULL DEFAULT '/img/car/car0.jpg',
  `start_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `end_date` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`car_id`),
  KEY `user_car_idx` (`user_id`),
  CONSTRAINT `user_car` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (3,'Toyota','Camry XSE','2018','Petrol','Silver','12K','3,000','2.7L','301hp','Appointed','/img/car/car1.jpg','2021-01-09 22:48:38',NULL,9),(4,'svaw','cwv','2015','aas','asf','asd','1233','qweqw','rqw','Unpublished','/img/car/car0.jpg','2021-01-10 02:35:35',NULL,9),(5,'Lexus','IS 250','2014','Gas','Black','12K','17,998','2.7L','204','Active','/img/car/car2.jpg','2021-01-11 11:37:00',NULL,11);
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `password` varchar(100) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'active',
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL COMMENT 'first_name',
  `location` varchar(45) DEFAULT NULL,
  `job_position` varchar(45) DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role_id` int(11) DEFAULT '2',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  KEY `role_user_idx` (`role_id`),
  CONSTRAINT `role_user` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'okp@gmail.com','123','active','Okker','Paing',NULL,NULL,NULL,'2020-12-18 12:50:38',2),(4,'asdasd','asdas','banned','asdasd','asdasdas',NULL,NULL,NULL,'2020-12-18 18:11:10',2),(9,'herookp@gmail.com','$2a$10$FeeXml1iR8W8svekJkPuF./JcegDquPXp01mi/Ua3hoMAbuNmOXTa','active','Okker','Paing',NULL,NULL,NULL,'2020-12-28 00:18:10',2),(10,'jkl@gmail.com','$2a$10$eJ4asf6lOclu.sxKnWeDSe955jL8zymCo7sp8HkrmcEaJUVRYx71G','active','Paing','Okker',NULL,NULL,NULL,'2020-12-28 00:29:57',2),(11,'okp@abc.com','$2a$10$Nmvh8.H/6RUPNxQDRC0NJexzh.6kMun95tjNcwNTd7yErLzmpoqq.','active','Okker','Paing',NULL,NULL,NULL,'2021-01-11 10:17:30',1),(13,'ma@gmail.com','$2a$10$DWLvY8SKtXoqMc7T6gITR.DEkAIqn3TiF2GnrEtGJUjsdaWSZDCMu','banned','ma','ma',NULL,NULL,NULL,'2021-01-22 00:25:56',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rst'
--

--
-- Dumping routines for database 'rst'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-22 18:52:12
