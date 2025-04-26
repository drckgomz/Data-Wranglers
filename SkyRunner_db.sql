-- SkyRunner Airlines DB

USE SkyRunner_Airlines_db;
--
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

CREATE DATABASE IF NOT EXISTS SkyRunner_Airlines_db;

-- Table structure for table `Passengers`
--
DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
`passenger_id` int NOT NULL,
`passenger_last_name` varchar(50) DEFAULT NULL,
`passenger_first_name` varchar(50) DEFAULT NULL,
`passenger_email` varchar(100) DEFAULT NULL,
`passenger_phone_number` varchar(15) DEFAULT NULL,
`passport_number` int DEFAULT NULL,
PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Passengers`

-- *TODO*

-- Table structure for table `Crew_Members`
--
DROP TABLE IF EXISTS `crew_members`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_members` (
`crew_member_id` int NOT NULL,
`crew_member_last_name` varchar(50) DEFAULT NULL,
`crew_member_first_name` varchar(50) DEFAULT NULL,
`passport_number` int DEFAULT NULL,
`crew_role` varchar(30) NOT NULL,
`hire_date` date DEFAULT NULL,
`crew_member_email` varchar(100) DEFAULT NULL,
`crew_member_phone_number` varchar(15) DEFAULT NULL,
PRIMARY KEY (`crew_member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Crew Members`
--
-- *TODO*
--
-- Table structure for table `Crew_Details`
--
DROP TABLE IF EXISTS `crew_details`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crew_details` (
`crew_details_id` int NOT NULL,
`crew_member_id` int NOT NULL,
`flight_id` int NOT NULL,
PRIMARY KEY (`crew_details_id`),
KEY `crew_member_id` (`crew_member_id`),
KEY `flight_id` (`flight_id`),
CONSTRAINT `crew_details_ibfk_1` FOREIGN KEY (`crew_member_id`) REFERENCES
`crew_members` (`crew_member_id`),
CONSTRAINT `crew_details_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES
`flights` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping Data for table "Crew Details"

-- *TODO*

-- Table structure for table `Bookings`

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
`booking_id` int NOT NULL,
`passenger_id` int NOT NULL,
`booking_date` date DEFAULT NULL,
PRIMARY KEY (`booking_id`),
KEY `passenger_id` (`passenger_id`),
CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES 
`passengers` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `Bookings`
--
-- *TODO*
--
-- Table Structure for table `Booking_details`
--
DROP TABLE IF EXISTS `booking_details`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_details` (
`booking_details_id` int NOT NULL,
`booking_id` int NOT NULL,
`flight_id` int NOT NULL,
`seat_number` varchar(4) DEFAULT NULL,
`check-in_status` varchar(20) DEFAULT NULL
PRIMARY KEY (`booking_details_id`),
KEY `booking_id` (`booking_id`),
KEY `flight_id` (`flight_id`),
CONSTRAINT `booking_details_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES
`bookings` (`booking_id`),
CONSTRAINT `booking_details_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES
`flights` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Table structure for table `Flights`
--
DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
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
CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`plane_id`) REFERENCES
`planes` (`plane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
--
-- Dumping data for table `flights`
--
-- Table structure for table `Planes`
--
DROP TABLE IF EXISTS `planes`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
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
-- Dumping data for table `projects`
--
-- *TODO*
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
-- Dump completed on ...

-- ********************************************************************************

