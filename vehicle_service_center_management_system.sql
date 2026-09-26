-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: vehicle_service_center_management_system
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `bill_id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`bill_id`),
  KEY `service_id` (`service_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`service_id`) REFERENCES `service_records` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,8000.00,'Paid'),(2,2,3000.00,'Paid'),(3,3,2500.00,'Pending'),(4,4,5000.00,'Paid'),(5,5,2200.00,'Paid'),(6,6,1800.00,'Pending'),(7,7,7000.00,'Paid'),(8,8,2000.00,'Pending');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_name` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Rahul','9876543210','Chennai'),(2,'Priya','9876543211','Bangalore'),(3,'Arun','9876543212','Hyderabad'),(4,'Sneha','9876543213','Coimbatore'),(5,'Karthik','9876543214','Mumbai');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mechanics`
--

DROP TABLE IF EXISTS `mechanics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mechanics` (
  `mechanic_id` int NOT NULL AUTO_INCREMENT,
  `mechanic_name` varchar(50) DEFAULT NULL,
  `specialization` varchar(50) DEFAULT NULL,
  `experience` int DEFAULT NULL,
  PRIMARY KEY (`mechanic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mechanics`
--

LOCK TABLES `mechanics` WRITE;
/*!40000 ALTER TABLE `mechanics` DISABLE KEYS */;
INSERT INTO `mechanics` VALUES (1,'Ramesh','Engine',10),(2,'Suresh','Electrical',8),(3,'Mahesh','General Service',6),(4,'Ganesh','Painting',12);
/*!40000 ALTER TABLE `mechanics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_records`
--

DROP TABLE IF EXISTS `service_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_records` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `vehicle_id` int DEFAULT NULL,
  `mechanic_id` int DEFAULT NULL,
  `service_type` varchar(50) DEFAULT NULL,
  `service_date` date DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `vehicle_id` (`vehicle_id`),
  KEY `mechanic_id` (`mechanic_id`),
  CONSTRAINT `service_records_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`vehicle_id`),
  CONSTRAINT `service_records_ibfk_2` FOREIGN KEY (`mechanic_id`) REFERENCES `mechanics` (`mechanic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_records`
--

LOCK TABLES `service_records` WRITE;
/*!40000 ALTER TABLE `service_records` DISABLE KEYS */;
INSERT INTO `service_records` VALUES (1,1,1,'Engine Repair','2026-07-10',8000.00),(2,1,2,'Electrical Repair','2026-07-20',3000.00),(3,2,3,'General Service','2026-07-21',2500.00),(4,3,1,'Engine Repair','2026-07-15',5000.00),(5,4,3,'General Service','2026-07-18',2200.00),(6,5,2,'Electrical Repair','2026-06-30',1800.00),(7,2,4,'Painting','2026-07-25',7000.00),(8,3,3,'General Service','2026-07-27',2000.00);
/*!40000 ALTER TABLE `service_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicles` (
  `vehicle_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `vehicle_number` varchar(15) DEFAULT NULL,
  `vehicle_model` varchar(50) DEFAULT NULL,
  `vehicle_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicles`
--

LOCK TABLES `vehicles` WRITE;
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` VALUES (1,1,'TN10AB1234','Hyundai i20','Car'),(2,2,'KA05XY5678','Honda City','Car'),(3,3,'TS08PQ4321','Royal Enfield','Bike'),(4,4,'TN22KL9090','Maruti Swift','Car'),(5,5,'MH12AA1111','TVS Apache','Bike');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-26 15:45:51
