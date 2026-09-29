-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: elmsdb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `created_date` date NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Information Technology','2026-07-24'),(2,'HR','2026-07-24'),(3,'Marketing','2026-07-24'),(4,'Sales','2026-07-24'),(5,'Finnace','2026-07-24'),(6,'Security','2026-07-25'),(7,'Manufacture','2026-07-28'),(8,'Production','2026-08-02'),(9,'Technical Support','2026-08-17'),(10,'Material Management','2026-08-17'),(11,'Customer Support','2026-08-17'),(12,'Quality Assurance','2026-08-17'),(13,'Operations','2026-08-17');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Emp_id` varchar(20) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `MobileNo` varchar(15) DEFAULT NULL,
  `Department` varchar(50) DEFAULT NULL,
  `Joining_date` date DEFAULT NULL,
  `User_id` int DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  PRIMARY KEY (`Emp_id`),
  UNIQUE KEY `Emp_id` (`Emp_id`),
  UNIQUE KEY `Email` (`Email`),
  KEY `User_id` (`User_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('HR01','john','john@gmail.com','0987654321','HR','2026-07-09',4,'Active'),('HR02','om','om@gmail.com','0987654321','HR','2026-07-04',6,'Active'),('IT01','Raj Patil','raj@gmail.com',NULL,'Sales','2026-07-22',1,'Active'),('IT02','Sagar Patil','sagar@gmail.com','987654333456','Information Technology','2026-07-01',2,'Active'),('IT03','ram','ram@gmail.com','0987654321','Production','2026-07-22',3,'Active'),('S01','jay','jay@gmail.com','0987670987','Sales','2026-07-29',9,'Active'),('S02','bittu','bittu@gmail.com','13456987654','Information Technology','2026-07-30',10,'Active'),('S05','aakash','aakash@gmail.com','65432345677','Sales','2026-07-29',13,'Active');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_request`
--

DROP TABLE IF EXISTS `leave_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_request` (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `emp_id` varchar(20) DEFAULT NULL,
  `leave_type_id` int DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `days` int DEFAULT NULL,
  `applied_date` date DEFAULT NULL,
  `status` enum('PENDING','APPROVED','REJECTED') DEFAULT 'PENDING',
  PRIMARY KEY (`request_id`),
  KEY `emp_id` (`emp_id`),
  KEY `leave_type_id` (`leave_type_id`),
  CONSTRAINT `leave_request_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`Emp_id`),
  CONSTRAINT `leave_request_ibfk_2` FOREIGN KEY (`leave_type_id`) REFERENCES `leave_type` (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_request`
--

LOCK TABLES `leave_request` WRITE;
/*!40000 ALTER TABLE `leave_request` DISABLE KEYS */;
INSERT INTO `leave_request` VALUES (1,'HR02',2,'2026-07-27','2026-07-31',0,NULL,'REJECTED'),(2,'HR01',5,'2026-07-26','2026-07-31',6,'2026-07-26','APPROVED'),(3,'HR02',2,'2026-07-29','2026-07-30',2,'2026-07-26','APPROVED'),(4,'HR02',2,'2026-07-30','2026-07-31',2,'2026-07-26','APPROVED'),(5,'HR02',2,'2026-08-01','2026-07-29',-2,'2026-07-26','APPROVED'),(6,'HR02',7,'2026-08-08','2026-08-12',5,'2026-07-27','REJECTED'),(7,'IT03',9,'2026-07-27','2026-07-30',4,'2026-07-27','APPROVED'),(8,'IT03',10,'2026-07-28','2026-07-30',3,'2026-07-27','REJECTED'),(9,'HR02',10,'2026-07-28','2026-07-31',4,'2026-07-28','APPROVED'),(10,'HR02',2,'2026-07-29','2026-07-31',3,'2026-07-28','APPROVED'),(11,'IT02',1,'2026-07-22','2026-08-05',15,'2026-07-29','APPROVED'),(12,'IT02',4,'2026-08-28','2026-09-03',7,'2026-08-01','APPROVED'),(13,'S01',11,'2026-08-11','2026-08-12',2,'2026-08-10','REJECTED'),(14,'HR02',11,'2026-08-12','2026-08-15',4,'2026-08-12','APPROVED'),(15,'HR02',9,'2026-08-12','2026-08-27',16,'2026-08-12','REJECTED'),(16,'HR02',11,'2026-08-23','2026-08-24',2,'2026-08-22','APPROVED');
/*!40000 ALTER TABLE `leave_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_type` (
  `leave_type_id` int NOT NULL AUTO_INCREMENT,
  `leave_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  PRIMARY KEY (`leave_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_type`
--

LOCK TABLES `leave_type` WRITE;
/*!40000 ALTER TABLE `leave_type` DISABLE KEYS */;
INSERT INTO `leave_type` VALUES (1,'Picknick Leave','2026-07-24'),(2,'Bereavement Leave','2026-07-24'),(3,'Maternity Leave','2026-07-24'),(4,'Sick Leave','2026-07-24'),(5,'Unpaid Leave','2026-07-24'),(6,'Earned Leave','2026-07-24'),(7,'Compensatory Leave','2026-07-25'),(8,'Casual Leave','2026-07-25'),(9,'Enjoy Leave','2026-07-27'),(10,'Paternity Leave','2026-07-27'),(11,'Emergency Leave','2026-08-10');
/*!40000 ALTER TABLE `leave_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'rajpatil','123','Employee'),(2,'sagarpatil','321','Employee'),(3,'ram','456','Employee'),(4,'john','000','Employee'),(6,'om','321','Employee'),(8,'sagarpatil','123','ADMIN'),(9,'jay','123','Employee'),(10,'bittu','123','Employee'),(13,'akash','123','Employee'),(14,'Admin','admin','ADMIN');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-29 13:25:39
