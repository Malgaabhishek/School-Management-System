CREATE DATABASE  IF NOT EXISTS `new_schema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `new_schema`;
-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: new_schema
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `account_details`
--

DROP TABLE IF EXISTS `account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_details` (
  `Acct_Num` int NOT NULL,
  `Acct_Type` varchar(45) DEFAULT NULL,
  `Acct_Bal` varchar(45) DEFAULT NULL,
  `Routing_no` varchar(45) DEFAULT NULL,
  `Cust ID` int DEFAULT NULL,
  `Bk ID` int DEFAULT NULL,
  PRIMARY KEY (`Acct_Num`),
  KEY `cust_id_acc_idx` (`Cust ID`),
  KEY `bk_id_acc_idx` (`Bk ID`),
  CONSTRAINT `bk_id_acc` FOREIGN KEY (`Bk ID`) REFERENCES `bank_details` (`Bk_id`),
  CONSTRAINT `cust_id_acc` FOREIGN KEY (`Cust ID`) REFERENCES `customer_details` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_details`
--

LOCK TABLES `account_details` WRITE;
/*!40000 ALTER TABLE `account_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_details`
--

DROP TABLE IF EXISTS `bank_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_details` (
  `Bk_id` int NOT NULL,
  `Bk_name` varchar(45) DEFAULT NULL,
  `Bk_Address` varchar(45) DEFAULT NULL,
  `Bk_City` varchar(45) DEFAULT NULL,
  `Bk_State` varchar(45) DEFAULT NULL,
  `Bk_ZIP` varchar(45) NOT NULL,
  PRIMARY KEY (`Bk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_details`
--

LOCK TABLES `bank_details` WRITE;
/*!40000 ALTER TABLE `bank_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_details`
--

DROP TABLE IF EXISTS `card_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_details` (
  `card_num` int NOT NULL,
  `card_type` varchar(45) DEFAULT NULL,
  `card_category` varchar(45) DEFAULT NULL,
  `expiry_date` varchar(45) DEFAULT NULL,
  `credit_score` int DEFAULT NULL,
  `Cust ID` int DEFAULT NULL,
  `Acct_Num` int DEFAULT NULL,
  PRIMARY KEY (`card_num`),
  KEY `cust_id_card_idx` (`Cust ID`),
  KEY `acct_num_card_idx` (`Acct_Num`),
  CONSTRAINT `acct_num_card` FOREIGN KEY (`Acct_Num`) REFERENCES `account_details` (`Acct_Num`),
  CONSTRAINT `cust_id_card` FOREIGN KEY (`Cust ID`) REFERENCES `customer_details` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_details`
--

LOCK TABLES `card_details` WRITE;
/*!40000 ALTER TABLE `card_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `card_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `cust_id` int NOT NULL,
  `cust_FirstName` varchar(45) DEFAULT NULL,
  `cust_LastName` varchar(45) DEFAULT NULL,
  `cust_ContactNo` varchar(45) DEFAULT NULL,
  `cust_Email` varchar(45) DEFAULT NULL,
  `cust_SSN` varchar(45) NOT NULL,
  `cust_Address` varchar(45) DEFAULT NULL,
  `cust_City` varchar(45) DEFAULT NULL,
  `cust_State` varchar(45) DEFAULT NULL,
  `cust_Zip` varchar(45) NOT NULL,
  PRIMARY KEY (`cust_id`,`cust_SSN`),
  UNIQUE KEY `cust_SSN_UNIQUE` (`cust_SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan_details`
--

DROP TABLE IF EXISTS `loan_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan_details` (
  `Ln_ID` int NOT NULL,
  `Ln_Type` varchar(45) DEFAULT NULL,
  `Ln_Amount` int DEFAULT NULL,
  `Ln_Due` varchar(45) DEFAULT NULL,
  `Ln_Rate_Of_Interest` varchar(45) DEFAULT NULL,
  `Ln_timestamp` datetime DEFAULT NULL,
  `Cust ID` int DEFAULT NULL,
  `Acct Num` int DEFAULT NULL,
  `Bk ID` int DEFAULT NULL,
  PRIMARY KEY (`Ln_ID`),
  KEY `cust_id_ln_idx` (`Cust ID`),
  KEY `bk_id_ln_idx` (`Bk ID`),
  KEY `acct_num_ln_idx` (`Acct Num`),
  CONSTRAINT `acct_num_ln` FOREIGN KEY (`Acct Num`) REFERENCES `account_details` (`Acct_Num`),
  CONSTRAINT `bk_id_ln` FOREIGN KEY (`Bk ID`) REFERENCES `bank_details` (`Bk_id`),
  CONSTRAINT `cust_id_ln` FOREIGN KEY (`Cust ID`) REFERENCES `customer_details` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loan_details`
--

LOCK TABLES `loan_details` WRITE;
/*!40000 ALTER TABLE `loan_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_details` (
  `trans_id` int NOT NULL,
  `trans_amount` float DEFAULT NULL,
  `trans_type` varchar(45) DEFAULT NULL,
  `trans_timestamp` datetime DEFAULT NULL,
  `Cust ID` int DEFAULT NULL,
  `Acct_Num` int DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `cust_id_trans_idx` (`Cust ID`),
  KEY `acct_num_trans_idx` (`Acct_Num`),
  CONSTRAINT `acct_num_trans` FOREIGN KEY (`Acct_Num`) REFERENCES `account_details` (`Acct_Num`),
  CONSTRAINT `cust_id_trans` FOREIGN KEY (`Cust ID`) REFERENCES `customer_details` (`cust_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-13 17:04:23
