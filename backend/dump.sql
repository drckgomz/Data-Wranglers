-- MySQL dump 10.13  Distrib 9.2.0, for macos15 (arm64)
--
-- Host: localhost    Database: skyrunner_airlines_db
-- ------------------------------------------------------
-- Server version	9.2.0

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
-- Table structure for table `booking_details`
--

DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_details` (
  `booking_details_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int NOT NULL,
  `flight_id` int NOT NULL,
  PRIMARY KEY (`booking_details_id`),
  KEY `booking_id` (`booking_id`),
  KEY `flight_id` (`flight_id`),
  CONSTRAINT `fk_bookingdetails_flight` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_details`
--

LOCK TABLES `booking_details` WRITE;
/*!40000 ALTER TABLE `booking_details` DISABLE KEYS */;
INSERT INTO `booking_details` VALUES (2001,1001,101),(2002,1002,102),(2003,1003,103);
/*!40000 ALTER TABLE `booking_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_log`
--

DROP TABLE IF EXISTS `booking_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `booking_id` (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_log`
--

LOCK TABLES `booking_log` WRITE;
/*!40000 ALTER TABLE `booking_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `flight_id` int NOT NULL,
  `seat_number` varchar(4) DEFAULT NULL,
  `check_in_status` varchar(20) DEFAULT NULL,
  `booking_date` date DEFAULT NULL,
  `passenger_id` int DEFAULT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `flight_id` (`flight_id`),
  KEY `fk_passenger_booking` (`passenger_id`),
  CONSTRAINT `fk_bookings_flight` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_passenger_booking` FOREIGN KEY (`passenger_id`) REFERENCES `passengers` (`passenger_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1066 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1001,101,'12A','Checked In','2025-04-10',NULL),(1002,102,'14B','Not Checked In','2025-04-11',NULL),(1003,103,'16C','Checked In','2025-04-12',NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_new_booking` AFTER INSERT ON `bookings` FOR EACH ROW BEGIN
  INSERT INTO booking_log (
    booking_id,
    passenger_id,
    flight_id,
    seat_number
  ) VALUES (
    NEW.booking_id,
    NEW.passenger_id,
    NEW.flight_id,
    NEW.seat_number
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `crew_details`
--

DROP TABLE IF EXISTS `crew_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_details` (
  `crew_details_id` int NOT NULL,
  `crew_member_id` int DEFAULT NULL,
  `flight_id` int DEFAULT NULL,
  PRIMARY KEY (`crew_details_id`),
  KEY `flight_id` (`flight_id`),
  KEY `fk_crewdetails_crewmember` (`crew_member_id`),
  CONSTRAINT `crew_details_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`flight_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_crewdetails_crewmember` FOREIGN KEY (`crew_member_id`) REFERENCES `crew_members` (`crew_member_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_details`
--

LOCK TABLES `crew_details` WRITE;
/*!40000 ALTER TABLE `crew_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `crew_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crew_members`
--

DROP TABLE IF EXISTS `crew_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_members` (
  `crew_member_id` int NOT NULL AUTO_INCREMENT,
  `crew_member_last_name` varchar(50) DEFAULT NULL,
  `crew_member_first_name` varchar(50) DEFAULT NULL,
  `passport_number` int DEFAULT NULL,
  `crew_role` varchar(30) NOT NULL,
  `hire_date` date DEFAULT NULL,
  `crew_member_email` varchar(100) DEFAULT NULL,
  `crew_member_phone_number` varchar(15) DEFAULT NULL,
  `crew_member_password` varchar(255) NOT NULL,
  PRIMARY KEY (`crew_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crew_members`
--

LOCK TABLES `crew_members` WRITE;
/*!40000 ALTER TABLE `crew_members` DISABLE KEYS */;
INSERT INTO `crew_members` VALUES (1,'Turner','Paige',123456789,'Pilot','2013-04-14','paiget777@icloud.com','(123)456-7890',''),(501,'Lee','Amy',55501,'Pilot','2020-01-01','amy.lee@example.com','9991112222',''),(502,'Jones','Tom',55502,'Co-Pilot','2021-05-10','tom.jones@example.com','8883334444',''),(503,'Taylor','Sara',55503,'Attendant','2022-07-15','sara.taylor@example.com','7776665555',''),(504,'Gomez','Derick',12312345,'Pilot',NULL,'test@gmail.com','2102044878',''),(505,'Gomez','Derick',74387328,'Attendant',NULL,'derickgomez28@gmail.com','2102044878',''),(506,'user','test',123921313,'Pilot',NULL,'test3@gmail.com','2102044878','Test');
/*!40000 ALTER TABLE `crew_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flights` (
  `flight_id` int NOT NULL,
  `plane_id` int DEFAULT NULL,
  `departure_time` date DEFAULT NULL,
  `arrival_time` date DEFAULT NULL,
  `origin_city` varchar(100) DEFAULT NULL,
  `destination_city` varchar(100) DEFAULT NULL,
  `flight_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `plane_id` (`plane_id`),
  CONSTRAINT `fk_flights_plane` FOREIGN KEY (`plane_id`) REFERENCES `planes` (`plane_id`) ON DELETE CASCADE,
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`plane_id`) REFERENCES `planes` (`plane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES (101,1,'2025-04-20','2025-04-20','JFK','MIA','On Time'),(102,2,'2025-04-21','2025-04-21','LAX','SEA','Delayed'),(103,3,'2025-04-22','2025-04-22','ORD','DFW','Cancelled'),(999,1,'2025-04-16','2025-04-16','SAT','AUS','On Time');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance_log`
--

DROP TABLE IF EXISTS `maintenance_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maintenance_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `plane_id` int DEFAULT NULL,
  `old_maintenance_date` date DEFAULT NULL,
  `new_maintenance_date` date DEFAULT NULL,
  `old_status` varchar(100) DEFAULT NULL,
  `new_status` varchar(100) DEFAULT NULL,
  `change_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `fk_maintenancelog_plane` (`plane_id`),
  CONSTRAINT `fk_maintenancelog_plane` FOREIGN KEY (`plane_id`) REFERENCES `planes` (`plane_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_log`
--

LOCK TABLES `maintenance_log` WRITE;
/*!40000 ALTER TABLE `maintenance_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `maintenance_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `passenger_and_booking`
--

DROP TABLE IF EXISTS `passenger_and_booking`;
/*!50001 DROP VIEW IF EXISTS `passenger_and_booking`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passenger_and_booking` AS SELECT 
 1 AS `passenger_first_name`,
 1 AS `passenger_last_name`,
 1 AS `booking_id`,
 1 AS `booking_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `passenger_log`
--

DROP TABLE IF EXISTS `passenger_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passenger_log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `passenger_id` int DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `fk_passengerlog_passenger` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passenger_log`
--

LOCK TABLES `passenger_log` WRITE;
/*!40000 ALTER TABLE `passenger_log` DISABLE KEYS */;
INSERT INTO `passenger_log` VALUES (1,4,'Derick Gomez','derickgomez28@gmail.com','2025-04-28 17:07:25'),(2,5,'Derick Gomez','test@gmail.com','2025-04-28 17:18:29'),(3,6,'Derick Gomez','test2@gmail.com','2025-04-28 19:01:21'),(4,7,'test user','test4@gmail.com','2025-04-29 02:31:09');
/*!40000 ALTER TABLE `passenger_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `passenger_id` int NOT NULL AUTO_INCREMENT,
  `passenger_last_name` varchar(50) DEFAULT NULL,
  `passenger_first_name` varchar(50) DEFAULT NULL,
  `passenger_email` varchar(100) DEFAULT NULL,
  `passenger_phone_number` varchar(15) DEFAULT NULL,
  `passport_number` varchar(20) DEFAULT NULL,
  `passenger_password` varchar(255) NOT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'Smith','Alice','alice@example.com','1234567890','10001',''),(2,'Brown','Bob','bob@example.com','0987654321','10002',''),(3,'Davis','Charlie','charlie@example.com','1122334455','10003',''),(4,'Gomez','Derick','derickgomez28@gmail.com','2102044878','5634063861',''),(5,'Gomez','Derick','test@gmail.com','2102044878','242837498',''),(6,'Gomez','Derick','test2@gmail.com','2102044878','742748171',''),(7,'user','test','test4@gmail.com','2102044878','141414356','root');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_new_passenger` AFTER INSERT ON `passengers` FOR EACH ROW BEGIN
  INSERT INTO passenger_log (
    passenger_id,
    full_name,
    email
  ) VALUES (
    NEW.passenger_id,
    CONCAT(NEW.passenger_first_name, ' ', NEW.passenger_last_name),
    NEW.passenger_email
  );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `planes`
--

DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planes` (
  `plane_id` int NOT NULL,
  `aircraft_type` varchar(100) DEFAULT NULL,
  `registration_number` int DEFAULT NULL,
  `capacity` int DEFAULT NULL,
  `last_maintenance` date DEFAULT NULL,
  `operation_status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`plane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planes`
--

LOCK TABLES `planes` WRITE;
/*!40000 ALTER TABLE `planes` DISABLE KEYS */;
INSERT INTO `planes` VALUES (1,'Boeing 737',12345,180,'2025-03-15','Operational'),(2,'Airbus A320',12346,160,'2025-03-10','Operational'),(3,'Boeing 777',12347,300,'2025-03-05','Maintenance');
/*!40000 ALTER TABLE `planes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_plane_maintenance_update` AFTER UPDATE ON `planes` FOR EACH ROW BEGIN
  IF OLD.last_maintenance <> NEW.last_maintenance OR OLD.operation_status <> NEW.operation_status THEN
    INSERT INTO maintenance_log (
      plane_id,
      old_maintenance_date,
      new_maintenance_date,
      old_status,
      new_status
    ) VALUES (
      OLD.plane_id,
      OLD.last_maintenance,
      NEW.last_maintenance,
      OLD.operation_status,
      NEW.operation_status
    );
  END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `passenger_and_booking`
--

/*!50001 DROP VIEW IF EXISTS `passenger_and_booking`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passenger_and_booking` AS select `p`.`passenger_first_name` AS `passenger_first_name`,`p`.`passenger_last_name` AS `passenger_last_name`,`b`.`booking_id` AS `booking_id`,`b`.`booking_date` AS `booking_date` from (`passengers` `p` join `bookings` `b` on((`p`.`passenger_id` = `b`.`passenger_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-29  1:50:49
