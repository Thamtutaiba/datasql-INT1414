-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testdb
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'faf8747e-4538-11f0-98e8-4ef2921bd7b7:1-55';

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `d_name` varchar(255) NOT NULL,
  `d_addr` varchar(255) NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`d_name`,`d_addr`,`m_name`),
  KEY `m_name` (`m_name`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`d_name`, `d_addr`) REFERENCES `distributor` (`name`, `address`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`m_name`) REFERENCES `manufacturer` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES ('DistA','Loc1','NikeCo',1000.00),('DistB','Loc2','AdidasCo',1200.00),('DistC','Loc3','PumaCo',1100.50);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `name` varchar(255) NOT NULL,
  `phone_no` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES ('Bob Lee','0923456789','789 Pine Rd'),('Jane Smith','0912345678','456 Oak Ave'),('John Doe','0901234567','123 Main St');
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributor` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `sin` varchar(50) NOT NULL,
  PRIMARY KEY (`name`,`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
INSERT INTO `distributor` VALUES ('DistA','Loc1','SIN123'),('DistB','Loc2','SIN456'),('DistC','Loc3','SIN789');
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employs`
--

DROP TABLE IF EXISTS `employs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employs` (
  `d_name` varchar(255) NOT NULL,
  `d_addr` varchar(255) NOT NULL,
  `sp_sin` varchar(50) NOT NULL,
  `base_salary` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`d_name`,`d_addr`,`sp_sin`),
  KEY `sp_sin` (`sp_sin`),
  CONSTRAINT `employs_ibfk_1` FOREIGN KEY (`d_name`, `d_addr`) REFERENCES `distributor` (`name`, `address`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employs_ibfk_2` FOREIGN KEY (`sp_sin`) REFERENCES `salesperson` (`sin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employs`
--

LOCK TABLES `employs` WRITE;
/*!40000 ALTER TABLE `employs` DISABLE KEYS */;
INSERT INTO `employs` VALUES ('DistA','Loc1','SP001',2000.00),('DistB','Loc2','SP002',1800.00),('DistC','Loc3','SP003',1900.00);
/*!40000 ALTER TABLE `employs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `license`
--

DROP TABLE IF EXISTS `license`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `license` (
  `lic_no` int NOT NULL,
  `city` text,
  `date` datetime DEFAULT NULL,
  `issuer` varchar(255) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  `dept` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`lic_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `license`
--

LOCK TABLES `license` WRITE;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` VALUES (1,'CityA','2025-06-01 00:00:00','DeptA',100.00,'GovA','Alice A.'),(2,'CityB','2025-06-02 00:00:00','DeptB',150.00,'GovB','Bob B.'),(3,'CityC','2025-06-03 00:00:00','DeptC',200.50,'GovC','Carol C.');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `makes`
--

DROP TABLE IF EXISTS `makes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `makes` (
  `model` varchar(100) NOT NULL,
  `size` int NOT NULL,
  `m_name` varchar(255) NOT NULL,
  `prod_cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`model`,`size`,`m_name`),
  KEY `m_name` (`m_name`),
  CONSTRAINT `makes_ibfk_1` FOREIGN KEY (`model`, `size`) REFERENCES `shoes` (`model`, `size`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `makes_ibfk_2` FOREIGN KEY (`m_name`) REFERENCES `manufacturer` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `makes`
--

LOCK TABLES `makes` WRITE;
/*!40000 ALTER TABLE `makes` DISABLE KEYS */;
INSERT INTO `makes` VALUES ('AirMax',42,'NikeCo',50.00),('NanoX',43,'PumaCo',55.75),('UltraBoost',40,'AdidasCo',60.00);
/*!40000 ALTER TABLE `makes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturer` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES ('AdidasCo','2 Adidas Blvd'),('NikeCo','1 Nike Way'),('PumaCo','3 Puma St');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participant`
--

DROP TABLE IF EXISTS `participant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participant` (
  `racer_name` varchar(255) NOT NULL,
  `racer_address` varchar(255) NOT NULL,
  `race_no` int NOT NULL,
  PRIMARY KEY (`racer_name`,`racer_address`,`race_no`),
  KEY `race_no` (`race_no`),
  CONSTRAINT `participant_ibfk_1` FOREIGN KEY (`racer_name`, `racer_address`) REFERENCES `racer` (`name`, `address`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `participant_ibfk_2` FOREIGN KEY (`race_no`) REFERENCES `race` (`r_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participant`
--

LOCK TABLES `participant` WRITE;
/*!40000 ALTER TABLE `participant` DISABLE KEYS */;
INSERT INTO `participant` VALUES ('Alice A.','AddrA',10),('Bob B.','AddrB',10),('Carol C.','AddrC',11),('Alice A.','AddrA',12);
/*!40000 ALTER TABLE `participant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `race`
--

DROP TABLE IF EXISTS `race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `race` (
  `r_no` int NOT NULL,
  `lic_no` int NOT NULL,
  `dir_name` varchar(255) DEFAULT NULL,
  `Mal_Win` varchar(255) DEFAULT NULL,
  `FEM_Win` varchar(255) DEFAULT NULL,
  `sp_name` varchar(255) NOT NULL,
  PRIMARY KEY (`r_no`),
  KEY `lic_no` (`lic_no`),
  KEY `dir_name` (`dir_name`),
  KEY `sp_name` (`sp_name`),
  CONSTRAINT `race_ibfk_1` FOREIGN KEY (`lic_no`) REFERENCES `license` (`lic_no`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `race_ibfk_2` FOREIGN KEY (`dir_name`) REFERENCES `director` (`name`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `race_ibfk_3` FOREIGN KEY (`sp_name`) REFERENCES `sponsor` (`name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `race`
--

LOCK TABLES `race` WRITE;
/*!40000 ALTER TABLE `race` DISABLE KEYS */;
INSERT INTO `race` VALUES (10,1,'John Doe','Alice A.','Carol C.','RedBull'),(11,2,'Jane Smith','Bob B.','Alice A.','Nike'),(12,3,'Bob Lee','Carol C.','Bob B.','Adidas');
/*!40000 ALTER TABLE `race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `racer`
--

DROP TABLE IF EXISTS `racer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `racer` (
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mem_num` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`name`,`address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `racer`
--

LOCK TABLES `racer` WRITE;
/*!40000 ALTER TABLE `racer` DISABLE KEYS */;
INSERT INTO `racer` VALUES ('Alice A.','AddrA','M100'),('Bob B.','AddrB','M101'),('Carol C.','AddrC',NULL);
/*!40000 ALTER TABLE `racer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesperson`
--

DROP TABLE IF EXISTS `salesperson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesperson` (
  `sin` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`sin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesperson`
--

LOCK TABLES `salesperson` WRITE;
/*!40000 ALTER TABLE `salesperson` DISABLE KEYS */;
INSERT INTO `salesperson` VALUES ('SP001','Sam Sales',500.00),('SP002','Una Seller',300.00),('SP003','Tim Trader',450.50);
/*!40000 ALTER TABLE `salesperson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sells`
--

DROP TABLE IF EXISTS `sells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sells` (
  `model` varchar(100) NOT NULL,
  `size` int NOT NULL,
  `d_name` varchar(255) NOT NULL,
  `d_addr` varchar(255) NOT NULL,
  `cost` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`model`,`size`,`d_name`,`d_addr`),
  KEY `d_name` (`d_name`,`d_addr`),
  CONSTRAINT `sells_ibfk_1` FOREIGN KEY (`model`, `size`) REFERENCES `shoes` (`model`, `size`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sells_ibfk_2` FOREIGN KEY (`d_name`, `d_addr`) REFERENCES `distributor` (`name`, `address`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sells`
--

LOCK TABLES `sells` WRITE;
/*!40000 ALTER TABLE `sells` DISABLE KEYS */;
INSERT INTO `sells` VALUES ('AirMax',42,'DistA','Loc1',70.00),('NanoX',43,'DistC','Loc3',75.25),('UltraBoost',40,'DistB','Loc2',80.00);
/*!40000 ALTER TABLE `sells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoes`
--

DROP TABLE IF EXISTS `shoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoes` (
  `model` varchar(100) NOT NULL,
  `size` int NOT NULL,
  PRIMARY KEY (`model`,`size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoes`
--

LOCK TABLES `shoes` WRITE;
/*!40000 ALTER TABLE `shoes` DISABLE KEYS */;
INSERT INTO `shoes` VALUES ('AirMax',42),('NanoX',43),('UltraBoost',40);
/*!40000 ALTER TABLE `shoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sponsor` (
  `name` varchar(255) NOT NULL,
  `contact` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES ('Adidas','contact@adidas.example'),('Nike','contact@nike.example'),('RedBull','contact@redbull.example');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-10  3:13:38
