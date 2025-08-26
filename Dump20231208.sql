CREATE DATABASE  IF NOT EXISTS `gymmanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gymmanagement`;
-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: 127.0.0.1    Database: gymmanagement
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `date` date DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `workout_class_instance_id` int DEFAULT NULL,
  KEY `attendance_fk_member` (`member_id`),
  KEY `attendance_fk_workout_class_instance` (`workout_class_instance_id`),
  CONSTRAINT `attendance_fk_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attendance_fk_workout_class_instance` FOREIGN KEY (`workout_class_instance_id`) REFERENCES `workout_class_instance` (`workout_class_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('2023-12-09',20,4);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `feedback_text` varchar(40) DEFAULT NULL,
  `member_id` int NOT NULL,
  `dateOfFeedback` date DEFAULT NULL,
  PRIMARY KEY (`feedback_id`),
  KEY `feedback_fk_user` (`member_id`),
  CONSTRAINT `feedback_fk_user` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (2,'Itn was good',20,'2023-12-09');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gym_equipment`
--

DROP TABLE IF EXISTS `gym_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gym_equipment` (
  `equipment_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `last_maintenance_date` date DEFAULT NULL,
  `next_maintenance_date` date DEFAULT NULL,
  `management_id` int NOT NULL,
  PRIMARY KEY (`equipment_id`),
  UNIQUE KEY `name` (`name`),
  KEY `gymEquipment_fk_management` (`management_id`),
  CONSTRAINT `gymEquipment_fk_management` FOREIGN KEY (`management_id`) REFERENCES `management` (`management_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gym_equipment`
--

LOCK TABLES `gym_equipment` WRITE;
/*!40000 ALTER TABLE `gym_equipment` DISABLE KEYS */;
INSERT INTO `gym_equipment` VALUES (1,'Treadmill','Cardio equipment','2023-01-01','2023-07-01',1),(2,'Cycle','Cardio equipment','2023-01-01','2023-07-01',1);
/*!40000 ALTER TABLE `gym_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoice` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `date` date DEFAULT NULL,
  `amount` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `invoice_fk_member` (`member_id`),
  CONSTRAINT `invoice_fk_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES (3,3,'2023-12-09',50.00),(6,20,'2023-12-09',50.00),(7,20,'2023-12-09',600.00);
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateMembershipStatusOnInvoice` AFTER INSERT ON `invoice` FOR EACH ROW BEGIN
    -- Update membership status to 'Active' when a new invoice is generated
    UPDATE member
    SET membership_status = 'Active'
    WHERE member_id = NEW.member_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `management`
--

DROP TABLE IF EXISTS `management`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `management` (
  `management_id` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phoneNo` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `role_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`management_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  CONSTRAINT `management_fk_user` FOREIGN KEY (`management_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `management`
--

LOCK TABLES `management` WRITE;
/*!40000 ALTER TABLE `management` DISABLE KEYS */;
INSERT INTO `management` VALUES (1,'Admin','admin','adminpass','1234567890','admin@example.com','Admin');
/*!40000 ALTER TABLE `management` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `management_before_update` BEFORE UPDATE ON `management` FOR EACH ROW BEGIN
    IF NEW.username != OLD.username THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot modify username in the management table';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` int NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(40) NOT NULL,
  `age` int NOT NULL,
  `role_name` varchar(40) DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone_no` varchar(40) NOT NULL,
  `address` varchar(40) NOT NULL,
  `membership_status` varchar(40) DEFAULT 'InActive',
  `dateOfExpiry` date DEFAULT NULL,
  `dateOfRegistration` date DEFAULT NULL,
  `membership_plan_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_no` (`phone_no`),
  KEY `user_fk_membershipPlan` (`membership_plan_id`),
  CONSTRAINT `member_fk_user` FOREIGN KEY (`member_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_fk_membershipPlan` FOREIGN KEY (`membership_plan_id`) REFERENCES `membership_plan` (`membership_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (3,'mary_jane','userpass','Mary','Jane',30,'Member','Female','user@example.com','8765432109','456 Oak St','Active','2024-01-09','2023-12-09',1),(20,'amy_k','adminpass','amy','K',23,'Member','female','user1@example.com','3456445464','16 west','Active','2024-12-09','2023-12-09',3);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `UpdateMembershipStatus` BEFORE INSERT ON `member` FOR EACH ROW BEGIN
    IF NEW.dateOfExpiry IS NOT NULL AND NEW.dateOfExpiry <= CURDATE() THEN
        SET NEW.membership_status = 'Expired';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `SetDefaultMembershipStatus` BEFORE INSERT ON `member` FOR EACH ROW BEGIN
    IF NEW.membership_status IS NULL OR NEW.membership_status = "" THEN
        SET NEW.membership_status = 'InActive'; -- Set default membership status
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `member_before_update` BEFORE UPDATE ON `member` FOR EACH ROW BEGIN
    IF NEW.username != OLD.username THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot modify username in the member table';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `member_completes_workoutclassinstance`
--

DROP TABLE IF EXISTS `member_completes_workoutclassinstance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_completes_workoutclassinstance` (
  `member_id` int NOT NULL,
  `workout_class_instance_id` int NOT NULL,
  PRIMARY KEY (`member_id`,`workout_class_instance_id`),
  KEY `completes_fk_workoutClassInstance` (`workout_class_instance_id`),
  CONSTRAINT `completes_fk_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `completes_fk_workoutClassInstance` FOREIGN KEY (`workout_class_instance_id`) REFERENCES `workout_class_instance` (`workout_class_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_completes_workoutclassinstance`
--

LOCK TABLES `member_completes_workoutclassinstance` WRITE;
/*!40000 ALTER TABLE `member_completes_workoutclassinstance` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_completes_workoutclassinstance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_plan`
--

DROP TABLE IF EXISTS `membership_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membership_plan` (
  `membership_plan_id` int NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(40) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `price` decimal(9,2) DEFAULT NULL,
  `duration` varchar(40) DEFAULT NULL,
  `benefits` varchar(255) DEFAULT NULL,
  `management_id` int NOT NULL,
  PRIMARY KEY (`membership_plan_id`),
  KEY `membershipPlan_fk_management` (`management_id`),
  CONSTRAINT `membershipPlan_fk_management` FOREIGN KEY (`management_id`) REFERENCES `management` (`management_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_plan`
--

LOCK TABLES `membership_plan` WRITE;
/*!40000 ALTER TABLE `membership_plan` DISABLE KEYS */;
INSERT INTO `membership_plan` VALUES (1,'Basic','Standard membership',50.00,'1 month','Access to gym equipment, General gym facilities, Basic workout guidance',1),(2,'Advanced','Advanced membership',150.00,'3 months','Access to gym equipment, Standard gym facilities, Advanced workout guidance, Access to fitness class',1),(3,'Premium','Premium membership',600.00,'12 months','Access to gym equipment, Premium workout guidance, Personalized workout plans, Nutritional guidance, Access to fitness classes, Exclusive gym events',1);
/*!40000 ALTER TABLE `membership_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer` (
  `trainer_id` int NOT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `fname` varchar(40) NOT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `role_name` varchar(40) DEFAULT NULL,
  `phone_no` varchar(40) DEFAULT NULL,
  `email` varchar(40) NOT NULL,
  `management_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_no` (`phone_no`),
  KEY `trainer_fk_management` (`management_id`),
  CONSTRAINT `trainer_fk_management` FOREIGN KEY (`management_id`) REFERENCES `management` (`management_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trainer_fk_user` FOREIGN KEY (`trainer_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer`
--

LOCK TABLES `trainer` WRITE;
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` VALUES (2,'suzy_bae','trainerpass','Suzy','Bae','Trainer','9876543211','trainer@example.com',1),(4,'russel_jack','trainerpass','Russel','Jack','Trainer','2222222222','russel@example.com',1);
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trainer_before_update` BEFORE UPDATE ON `trainer` FOR EACH ROW BEGIN
    IF NEW.username != OLD.username THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot modify username in the trainer table';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `trainer_trains_member`
--

DROP TABLE IF EXISTS `trainer_trains_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainer_trains_member` (
  `trainer_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`trainer_id`,`member_id`),
  KEY `trains_fk_member` (`member_id`),
  CONSTRAINT `trains_fk_member` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `trains_fk_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainer_trains_member`
--

LOCK TABLES `trainer_trains_member` WRITE;
/*!40000 ALTER TABLE `trainer_trains_member` DISABLE KEYS */;
INSERT INTO `trainer_trains_member` VALUES (2,3);
/*!40000 ALTER TABLE `trainer_trains_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `phone_no` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `role_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `phone_no` (`phone_no`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','adminpass','1234567890','admin@example.com','Admin'),(2,'suzy_bae','trainerpass','9876543211','trainer@example.com','Trainer'),(3,'mary_jane','userpass','8765432109','user@example.com','Member'),(4,'russel_jack','trainerpass','2222222222','russel@example.com','Trainer'),(20,'amy_k','adminpass','3456445464','user1@example.com','Member');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_class`
--

DROP TABLE IF EXISTS `workout_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_class` (
  `workout_class_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`workout_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_class`
--

LOCK TABLES `workout_class` WRITE;
/*!40000 ALTER TABLE `workout_class` DISABLE KEYS */;
INSERT INTO `workout_class` VALUES (1,'Yoga'),(2,'Strength Training'),(3,'Zumba'),(4,'Zumba');
/*!40000 ALTER TABLE `workout_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workout_class_instance`
--

DROP TABLE IF EXISTS `workout_class_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workout_class_instance` (
  `workout_class_instance_id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(40) DEFAULT NULL,
  `duration` varchar(30) DEFAULT NULL,
  `timings` datetime DEFAULT NULL,
  `trainer_id` int DEFAULT NULL,
  `workout_class_id` int DEFAULT NULL,
  PRIMARY KEY (`workout_class_instance_id`),
  KEY `workout_class_instance_fk_trainer` (`trainer_id`),
  KEY `workout_class_instance_fk_workoutClass` (`workout_class_id`),
  CONSTRAINT `workout_class_instance_fk_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workout_class_instance_fk_workoutClass` FOREIGN KEY (`workout_class_id`) REFERENCES `workout_class` (`workout_class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workout_class_instance`
--

LOCK TABLES `workout_class_instance` WRITE;
/*!40000 ALTER TABLE `workout_class_instance` DISABLE KEYS */;
INSERT INTO `workout_class_instance` VALUES (1,'Yoga Class','1 hour','2023-01-01 08:00:00',2,1),(2,'Strength Training Class','2 hour','2023-01-01 08:00:00',4,2),(4,'Zumba','1 hour','2023-12-09 00:00:00',2,4);
/*!40000 ALTER TABLE `workout_class_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workoutclass_uses_gymequipment`
--

DROP TABLE IF EXISTS `workoutclass_uses_gymequipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workoutclass_uses_gymequipment` (
  `workout_class_id` int NOT NULL,
  `equipment_id` int NOT NULL,
  PRIMARY KEY (`equipment_id`,`workout_class_id`),
  KEY `uses_fk_workoutClass` (`workout_class_id`),
  CONSTRAINT `uses_fk_gymEquipment` FOREIGN KEY (`equipment_id`) REFERENCES `gym_equipment` (`equipment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uses_fk_workoutClass` FOREIGN KEY (`workout_class_id`) REFERENCES `workout_class` (`workout_class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workoutclass_uses_gymequipment`
--

LOCK TABLES `workoutclass_uses_gymequipment` WRITE;
/*!40000 ALTER TABLE `workoutclass_uses_gymequipment` DISABLE KEYS */;
INSERT INTO `workoutclass_uses_gymequipment` VALUES (1,1),(2,2),(3,1),(4,1);
/*!40000 ALTER TABLE `workoutclass_uses_gymequipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gymmanagement'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `ScheduleEquipmentMaintenanceEvent` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `ScheduleEquipmentMaintenanceEvent` ON SCHEDULE EVERY 7 DAY STARTS '2023-12-08 00:57:46' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE gym_equipment
    SET last_maintenance_date = CURDATE(),
        next_maintenance_date = CURDATE() + INTERVAL 30 DAY
    WHERE next_maintenance_date IS NOT NULL AND next_maintenance_date <= CURDATE();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `SendRenewalRemindersEvent` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `SendRenewalRemindersEvent` ON SCHEDULE EVERY 1 DAY STARTS '2023-12-08 00:57:46' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    DECLARE memberId INT;
    DECLARE memberEmail VARCHAR(40);

    DECLARE membersCursor CURSOR FOR
    SELECT member_id, email
    FROM member
    WHERE dateOfExpiry IS NOT NULL AND dateOfExpiry BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY;

    OPEN membersCursor;

    membersLoop: LOOP
        FETCH membersCursor INTO memberId, memberEmail;
        IF memberId IS NULL THEN
            LEAVE membersLoop;
        END IF;

        -- Send renewal reminder email (implement your email sending logic here)
        -- Example: CALL SendRenewalReminderEmail(memberEmail);

    END LOOP;

    CLOSE membersCursor;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `UpdateMembershipStatusEvent` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `UpdateMembershipStatusEvent` ON SCHEDULE EVERY 1 DAY STARTS '2023-12-08 00:57:46' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE member
    SET membership_status = 'Expired'
    WHERE dateOfExpiry IS NOT NULL AND dateOfExpiry < CURDATE();
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'gymmanagement'
--
/*!50003 DROP FUNCTION IF EXISTS `GetMemberLastWorkoutClassInstance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetMemberLastWorkoutClassInstance`(memberId INT) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE workoutClassDetails VARCHAR(255);
    SELECT CONCAT('Class: ', wci.class_name, ', Duration: ', wci.duration, ', Timings: ', wci.timings)
    INTO workoutClassDetails
    FROM member_completes_workoutClassInstance mcw
    INNER JOIN workout_class_instance wci ON mcw.workout_class_instance_id = wci.workout_class_instance_id
    WHERE mcw.member_id = memberId
    ORDER BY wci.timings DESC
    LIMIT 1;
    RETURN IFNULL(workoutClassDetails, 'No workout class history');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `GetMemberMembershipPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetMemberMembershipPlan`(memberId INT) RETURNS varchar(255) CHARSET utf8mb4
    READS SQL DATA
BEGIN
    DECLARE planDetails VARCHAR(255);
    SELECT CONCAT('Plan: ', mp.plan_name, ', Price: $', mp.price, ', Duration: ', mp.duration)
    INTO planDetails
    FROM member m
    LEFT JOIN membership_plan mp ON m.membership_plan_id = mp.membership_plan_id
    WHERE m.member_id = memberId;
    RETURN IFNULL(planDetails, 'No membership plan');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `IsMembershipExpired` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `IsMembershipExpired`(memberId INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE expiryDate DATE;
    SELECT dateOfExpiry INTO expiryDate
    FROM member
    WHERE member_id = memberId;
    RETURN expiryDate < CURDATE();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `NeedsMaintenance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `NeedsMaintenance`(equipmentId INT) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
    DECLARE lastMaintenanceDate DATE;
    SELECT last_maintenance_date INTO lastMaintenanceDate
    FROM gym_equipment
    WHERE equipment_id = equipmentId;
    RETURN lastMaintenanceDate IS NULL OR lastMaintenanceDate < CURDATE() - INTERVAL 30 DAY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMember` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMember`(
    IN p_username VARCHAR(40),
    IN p_password VARCHAR(40),
    IN p_fname VARCHAR(40),
    IN p_lname VARCHAR(40),
    IN p_age INT,
    IN p_gender VARCHAR(10),
    IN p_email VARCHAR(40),
    IN p_phone_no VARCHAR(40),
    IN p_address VARCHAR(40),
    IN p_membership_status VARCHAR(40),
    IN p_dateOfRegistration DATE,
    IN p_membership_plan_id INT
)
BEGIN
    DECLARE v_user_id INT;
    -- Insert into user table
    INSERT INTO user (username, password, phone_no, email, role_name)
    VALUES (p_username, p_password, p_phone_no, p_email, 'Member');
    -- Get the generated user_id
    SET v_user_id = LAST_INSERT_ID();
    -- Insert into member table
    INSERT INTO member (
        member_id, username, password, fname, lname, age, role_name,
        gender, email, phone_no, address, membership_status,
        dateOfExpiry, dateOfRegistration, membership_plan_id
    )
    VALUES (
        v_user_id, p_username, p_password, p_fname, p_lname, p_age,
        'Member', p_gender, p_email, p_phone_no, p_address,
        p_membership_status, NULL, p_dateOfRegistration, p_membership_plan_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddMembershipPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddMembershipPlan`(
    IN p_plan_name VARCHAR(40),
    IN p_price DECIMAL(9,2),
    IN p_duration VARCHAR(40),
    IN p_benefits VARCHAR(40),
    IN p_management_id INT
)
BEGIN
    -- Insert into membership_plan table
    INSERT INTO membership_plan (plan_name, price, duration, benefits, management_id)
    VALUES (p_plan_name, p_price, p_duration, p_benefits, p_management_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddTrainer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddTrainer`(
    IN p_username VARCHAR(40),
    IN p_password VARCHAR(40),
    IN p_fname VARCHAR(40),
    IN p_lname VARCHAR(40),
    IN p_phone_no VARCHAR(40),
    IN p_email VARCHAR(40),
    IN p_management_id INT
)
BEGIN
    DECLARE v_user_id INT;
    -- Insert into user table
    INSERT INTO user (username, password, phone_no, email, role_name)
    VALUES (p_username, p_password, p_phone_no, p_email, 'Trainer');

    -- Get the generated user_id
    SET v_user_id = LAST_INSERT_ID();

    -- Insert into trainer table
    INSERT INTO trainer (
        trainer_id, username, password, fname, lname, role_name,
        phone_no, email, management_id
    )
    VALUES (
        v_user_id, p_username, p_password, p_fname, p_lname,
        'Trainer', p_phone_no, p_email, p_management_id
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateInvoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerateInvoice`(
    IN p_member_id INT,
    IN p_date DATE,
    IN p_amount DECIMAL(9,2)
)
BEGIN
    -- Insert into invoice table
    INSERT INTO invoice (member_id, date, amount)
    VALUES (p_member_id, p_date, p_amount);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMembersWithBasicPlan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMembersWithBasicPlan`()
BEGIN
    SELECT * 
    FROM member
    WHERE membership_plan_id = (
        SELECT membership_plan_id
        FROM membership_plan
        WHERE plan_name = 'Basic'
        LIMIT 1
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetMemberTrainingDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMemberTrainingDetails`(IN memberId INT)
BEGIN
    SELECT
        m.member_id,
        m.username AS member_username,
        m.fname AS member_first_name,
        m.lname AS member_last_name,
        t.trainer_id,
        t.username AS trainer_username,
        wc.class_name AS workout_class,
        we.name AS gym_equipment
    FROM
        member m
    JOIN
        trainer_trains_member tt ON m.member_id = tt.member_id
    JOIN
        trainer t ON tt.trainer_id = t.trainer_id
    LEFT JOIN
        workout_class_instance wci ON tt.trainer_id = wci.trainer_id
    LEFT JOIN
        workout_class wc ON wci.workout_class_id = wc.workout_class_id
    LEFT JOIN
        workoutClass_uses_gymEquipment wcuge ON wc.workout_class_id = wcuge.workout_class_id
    LEFT JOIN
        gym_equipment we ON wcuge.equipment_id = we.equipment_id
    WHERE
        m.member_id = memberId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 23:27:35
