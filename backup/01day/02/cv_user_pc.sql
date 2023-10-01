-- MariaDB dump 10.19  Distrib 10.10.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cv_user_pc
-- ------------------------------------------------------
-- Server version	11.2.1-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `appuser`
--

DROP TABLE IF EXISTS `appuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appuser` (
  `user_code` varchar(15) NOT NULL,
  `role_code` varchar(15) DEFAULT NULL,
  `user_short_name` varchar(25) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT b'0',
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `doctor_id` varchar(15) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `dept_id` int(11) DEFAULT NULL,
  `loc_code` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`user_code`),
  UNIQUE KEY `user_short_name_UNIQUE` (`user_short_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appuser`
--

LOCK TABLES `appuser` WRITE;
/*!40000 ALTER TABLE `appuser` DISABLE KEYS */;
INSERT INTO `appuser` VALUES
('062022-001','2','sale','Sale','','','sale',NULL,NULL,'2023-06-25 08:30:25',1,NULL),
('062022-002','1','account','Account','','','account1',NULL,NULL,'2023-06-25 08:50:14',1,NULL),
('0623-001','3','ttn','Ma Thin Thin Nwe','','','ttn170280',NULL,NULL,'2023-06-25 09:21:30',1,NULL),
('0623-002','3','myitzuyi','Khin Myitzuyi Htan','','','mzuyi',NULL,NULL,'2023-06-25 08:50:28',1,NULL),
('0623-003','3','suyee','Su Yee Nandar','','','291220',NULL,NULL,'2023-06-25 09:21:30',1,NULL),
('0623-004','3','sulai','Su Lai Yadanar','','','sulai5',NULL,NULL,'2023-06-25 09:21:30',1,NULL),
('0623-005','R-001','plaza','Plaza','','','plaza23',NULL,NULL,'2023-06-25 08:31:03',2,NULL),
('1','1','admin','admin','','','456',NULL,NULL,'2023-06-25 10:06:36',1,NULL),
('2','1','wy','wy','',NULL,'wy',NULL,NULL,'2023-06-25 09:21:30',1,NULL);
/*!40000 ALTER TABLE `appuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_type`
--

DROP TABLE IF EXISTS `business_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_type` (
  `bus_id` int(11) NOT NULL,
  `bus_name` varchar(255) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_type`
--

LOCK TABLES `business_type` WRITE;
/*!40000 ALTER TABLE `business_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_info`
--

DROP TABLE IF EXISTS `company_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company_info` (
  `comp_code` varchar(15) NOT NULL,
  `user_code` varchar(15) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `short_code` varchar(5) DEFAULT NULL,
  `security_code` varchar(255) DEFAULT NULL,
  `parent` varchar(15) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `currency` varchar(15) NOT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `batch_lock` bit(1) NOT NULL DEFAULT b'0',
  `year_end_date` date DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_info`
--

LOCK TABLES `company_info` WRITE;
/*!40000 ALTER TABLE `company_info` DISABLE KEYS */;
INSERT INTO `company_info` VALUES
('0010010','01','Princess Fabric Trading','09-977828221,22,19',NULL,NULL,NULL,NULL,'No218(G), Lane(1), Dhama Thukha Kyaung Street, Hlaing Township, Yangon.','','2022-01-01','2023-06-01','MMK',NULL,NULL,NULL,'\0',NULL,'2023-06-08 07:03:06');
/*!40000 ALTER TABLE `company_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency`
--

DROP TABLE IF EXISTS `currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency` (
  `cur_code` varchar(15) NOT NULL,
  `cur_name` varchar(255) DEFAULT NULL,
  `cur_symbol` varchar(255) DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `cur_gain_acc` varchar(15) DEFAULT NULL,
  `cur_lost_acc` varchar(15) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`cur_code`),
  UNIQUE KEY `cur_code` (`cur_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency`
--

LOCK TABLES `currency` WRITE;
/*!40000 ALTER TABLE `currency` DISABLE KEYS */;
INSERT INTO `currency` VALUES
('MMK','MMK','MMK','',NULL,NULL,'2023-06-08 07:03:06');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
  `comp_code` varchar(15) NOT NULL DEFAULT '0010010',
  `user_code` varchar(15) NOT NULL,
  `dept_name` varchar(255) NOT NULL,
  `inv_queue` varchar(255) DEFAULT NULL,
  `acc_queue` varchar(255) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `active` bit(1) NOT NULL DEFAULT b'0',
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`dept_id`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES
(1,'0010010','H','Head Office','princess.inventory.server','princess.account.server','2023-06-25 08:25:38','','','','','\0'),
(2,'0010010','P','Plaza','princess.inventory.plaza','princess.account.plaza','2023-06-26 03:32:19','09977828215, 09977828214','No.18, Room 1, Aung Thapyay Street, Mingalar Taung Nyunt Township.','-','','\0');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rate`
--

DROP TABLE IF EXISTS `exchange_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rate` (
  `ex_code` varchar(15) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `ex_date` timestamp NULL DEFAULT NULL,
  `home_factor` double DEFAULT NULL,
  `home_cur` varchar(15) DEFAULT NULL,
  `target_factor` double DEFAULT NULL,
  `target_cur` varchar(15) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT NULL,
  `created_by` varchar(15) DEFAULT NULL,
  `updated_date` timestamp NULL DEFAULT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `deleted` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ex_code`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rate`
--

LOCK TABLES `exchange_rate` WRITE;
/*!40000 ALTER TABLE `exchange_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `exchange_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mac_prop`
--

DROP TABLE IF EXISTS `mac_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mac_prop` (
  `mac_id` int(11) NOT NULL,
  `prop_key` varchar(255) NOT NULL,
  `prop_value` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`mac_id`,`prop_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mac_prop`
--

LOCK TABLES `mac_prop` WRITE;
/*!40000 ALTER TABLE `mac_prop` DISABLE KEYS */;
/*!40000 ALTER TABLE `mac_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `machine_info`
--

DROP TABLE IF EXISTS `machine_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `machine_info` (
  `mac_id` int(11) NOT NULL AUTO_INCREMENT,
  `serial_no` varchar(255) NOT NULL,
  `mac_ip` varchar(225) DEFAULT NULL,
  `mac_name` varchar(225) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `pro_update` bit(1) NOT NULL DEFAULT b'0',
  `mac_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mac_id`,`mac_name`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_info`
--

LOCK TABLES `machine_info` WRITE;
/*!40000 ALTER TABLE `machine_info` DISABLE KEYS */;
INSERT INTO `machine_info` VALUES
(1,'','192.168.1.48','svr','2022-01-06 06:08:59','',NULL),
(2,'','192.168.1.9','server','2022-01-06 10:25:32','',NULL),
(3,'','192.168.1.10','Admin','2022-01-06 10:29:19','',NULL),
(4,'','192.168.1.39','KhinKhin','2022-01-06 10:32:30','',NULL),
(5,'','192.168.1.14','sc1','2022-03-09 07:19:32','',NULL),
(7,'211092500900923','192.168.1.18','svr','2023-06-08 07:08:55','','50:EB:F6:24:4F:83'),
(8,'150749954704146','192.168.1.23','Admin','2023-06-08 07:11:10','','30:5A:3A:01:DF:74'),
(9,'180119618501604','192.168.1.22','server','2023-06-08 07:12:38','','2C:FD:A1:B9:B3:C6'),
(10,'PFXTN028J3504M','192.168.1.32','KhinKhin','2023-06-08 07:31:53','','EC:8E:B5:50:01:B8'),
(11,'201278997602866','192.168.1.20','sc1','2023-06-08 08:59:39','','F0:2F:74:AE:B5:4B'),
(12,'71bc370a6a3d01b4','192.168.1.63','POCO X2','2023-06-23 05:44:26','',NULL),
(13,'7af8f3f9d676bdef','192.168.1.63','POCO X2','2023-06-23 05:51:22','',NULL),
(14,'4ae7b243da93a1bd','192.168.1.64','SM-X205','2023-06-23 05:58:49','',NULL),
(15,'/35LLJZ2/CNCMC0099B0053/','192.168.1.68','DESKTOP-IECAFTK','2023-06-23 06:10:08','','AC:D5:64:47:A5:3B'),
(17,'e1fb2fbe8b821888','10.169.249.216','SM-S908E','2023-06-23 07:24:26','',NULL),
(18,'8f86e1c96380c1c0','192.168.1.26','M2101K7AG','2023-06-23 07:25:28','',NULL),
(19,'1ea3ed23829c010d','192.168.1.4','MI CC 9','2023-06-23 08:32:48','',NULL),
(20,'b1b2579afa94cdd3','192.168.1.5','SM-A225F','2023-06-23 18:10:19','',NULL),
(21,'afc80f32b618080c','192.168.1.6','SM-A225F','2023-06-25 12:20:33','',NULL),
(22,'2164e4097d0b408b','192.168.1.6','SM-A225F','2023-06-25 13:23:53','',NULL),
(23,'RKQ1.200826.002','192.168.100.61','POCO X2','2023-06-26 08:54:11','',NULL),
(24,'TP1A.220624.014','192.168.1.14','SM-A225F','2023-07-03 04:11:09','',NULL),
(25,'PKQ1.181121.001','192.168.1.8','MI CC 9','2023-07-03 08:14:26','',NULL),
(26,'SKQ1.210908.001','192.168.1.26','M2101K7AG','2023-07-03 08:18:47','',NULL),
(27,'BSS-0123456789','192.168.100.103','MSI','2023-07-03 08:56:17','','50:C2:E8:0B:7E:51'),
(28,'/86GX9P2/CNFCW00813005U/','192.168.100.238','MINZAW','2023-07-03 11:24:21','','D8:9E:F3:36:EE:D1'),
(29,'/86KS9P2/CNFCW0081501BY/','192.168.100.78','svr','2023-07-04 11:57:49','','D8:9E:F3:37:6A:BC'),
(30,'/9MV3WJ2/CNWSC007C300JV/','192.168.100.30','DESKTOP-LV3P92S','2023-07-04 12:23:37','','00:E1:8C:F8:78:3E'),
(31,'SP1A.210812.003','172.16.0.2','vivo 1907','2023-08-07 10:18:42','',NULL),
(32,'HONORAGM3-AL09HN','192.168.100.97','AGM3-AL09HN','2023-08-12 11:07:07','',NULL),
(33,'L1HF9B80BJV','192.168.100.208','WAIYAN','2023-08-26 07:25:48','','4C:1D:96:13:96:BF'),
(34,'PGWHT00WBC6ULC','172.16.0.2','DESKTOP-A7H39FR','2023-08-26 08:25:07','',NULL),
(35,'POCO X2','192.168.100.253','POCO X2','2023-08-28 12:48:51','',NULL),
(36,'M2101K7AG','192.168.1.34','M2101K7AG','2023-08-29 08:48:52','',NULL),
(37,'Galaxy S22 Ultra','192.168.1.44','SM-S908E','2023-08-29 08:58:35','',NULL),
(38,'Wai\'s Tab A8','192.168.1.70','SM-X205','2023-08-29 09:09:40','',NULL),
(39,'pocox2','192.168.100.51','POCO X2','2023-08-31 06:00:37','',NULL),
(40,'wai\'staba8','192.168.100.64','SM-X205','2023-08-31 12:21:08','',NULL),
(41,'galaxys22ultra','192.168.1.23','SM-S908E','2023-09-01 04:08:21','',NULL),
(42,'princess1','192.168.100.223','AGM3-AL09HN','2023-09-04 06:26:51','',NULL);
/*!40000 ALTER TABLE `machine_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `menu_code` varchar(15) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `user_code` varchar(15) DEFAULT NULL,
  `menu_class` varchar(150) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_name_mm` varchar(500) DEFAULT NULL,
  `menu_url` varchar(500) DEFAULT NULL,
  `parent_menu_code` varchar(50) NOT NULL,
  `menu_type` varchar(50) DEFAULT NULL,
  `account` varchar(15) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`menu_code`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES
('01','0010010',NULL,'Inventory','Report',NULL,'','79','Menu',NULL,100,'2023-06-08 07:03:07'),
('012022-002','0010010',NULL,'Account','Setup',NULL,'','012022-001','Menu','',NULL,'2023-06-08 07:03:07'),
('012022-003','0010010',NULL,'Account','Department',NULL,'','012022-002','Menu','',NULL,'2023-06-08 07:03:07'),
('012022-004','0010010',NULL,'AllCash','Cash Book',NULL,'','012022-001','Menu','',NULL,'2023-06-08 07:03:07'),
('012022-005','0010010',NULL,'Setup','COA Managment',NULL,'','012022-002','Menu','',NULL,'2023-06-08 07:03:07'),
('012022-006','0010010',NULL,'AllCash','Daily Cash',NULL,NULL,'012022-004','Menu','001-00015',NULL,'2023-06-08 07:03:07'),
('012022-007','0010010',NULL,'Inventory','Opening Stock By Location',NULL,'OpeningByLocation','01','Report','',NULL,'2023-06-08 07:03:07'),
('012022-008','0010010',NULL,'Inventory','Sale By Stock (Summary)',NULL,'SaleByStockSummary','01','Report','',NULL,'2023-06-08 07:03:07'),
('012022-009','0010010',NULL,'Inventory','Sale By Customer (Summary)',NULL,'SaleByCustomerSummary','01','Report','',NULL,'2023-06-08 07:03:07'),
('012022-010','0010010',NULL,'Inventory','Purchase By Supplier (Summary)',NULL,'PurchaseBySupplierSummary','01','Report','',NULL,'2023-06-08 07:03:07'),
('012022-011','0010010',NULL,'Inventory','Purchase By Stock (Summary)',NULL,'PurchaseByStockSummary','01','Report','',NULL,'2023-06-08 07:03:07'),
('012022-012','0010010',NULL,'Inventory','Opening Stock By Group',NULL,'OpeningByGroup','01','Report','',NULL,'2023-06-08 07:03:07'),
('012022-013','0010010',NULL,'Inventory','Stock In/Out (Summary)',NULL,'StockInOutSummary','01','Report','',NULL,'2023-06-08 07:03:07'),
('0123-001','0010010',NULL,'Account','Individual Statement',NULL,'IndividualStatement','1122-008','Report','',0,'2023-06-08 07:03:07'),
('032022-001','0010010',NULL,'Inventory','Stock In/Out (Detail)',NULL,'StockInOutDetail','01','Report','',0,'2023-06-08 07:03:07'),
('032022-002','0010010',NULL,'Inventory','Stock Value',NULL,'StockValue','01','Report','',0,'2023-06-08 07:03:07'),
('0323-001','0010010',NULL,'Inventory','GRN',NULL,'','52','Menu','',7,'2023-06-08 07:03:07'),
('0323-002','0010010',NULL,'Inventory','Sale By Batch',NULL,'','52','Menu','',8,'2023-06-08 07:03:07'),
('0323-003','0010010',NULL,'Inventory','Sale By Voucher (Summary)',NULL,'SaleByVoucherSummary','01','Report','',0,'2023-06-08 07:03:07'),
('0323-004','0010010',NULL,'DayBook','Day Book',NULL,'','1122-001','Menu','',5,'2023-06-08 07:03:07'),
('0323-005','0010010',NULL,'DayBook','Sale Income',NULL,NULL,'0323-004','Menu','002-00002',NULL,'2023-06-08 07:03:07'),
('0323-006','0010010',NULL,'DayBook','Purchase A/C',NULL,NULL,'0323-004','Menu','002-00004',NULL,'2023-06-08 07:03:07'),
('062022-001','0010010',NULL,'','Transfer',NULL,'','52','Menu','',6,'2023-06-08 07:03:07'),
('062022-002','0010010',NULL,'','User Setup',NULL,'','50','Menu','',0,'2023-06-08 07:03:07'),
('062022-003','0010010',NULL,'','Company',NULL,'','50','Menu','',0,'2023-06-08 07:03:07'),
('062022-004','0010010',NULL,'Inventory','Sale Price Calender',NULL,'SalePriceCalender','01','Report','',0,'2023-06-08 07:03:07'),
('062022-005','0010010',NULL,'Inventory','Purchase Price Calender',NULL,'PurchasePriceCalender','01','Report','',0,'2023-06-08 07:03:07'),
('0723-001','0010010',NULL,'','Opening Balance',NULL,'','1122-004','Menu',NULL,0,'2023-07-05 04:54:02'),
('1122-001','0010010',NULL,'Account','Account',NULL,'','1','Menu','',2,'2023-06-08 07:03:07'),
('1122-002','0010010',NULL,'Account','Cash Book',NULL,'','1122-001','Menu','',1,'2023-06-08 07:03:07'),
('1122-003','0010010',NULL,'Account','Journal',NULL,'','1122-001','Menu','',3,'2023-06-08 07:03:07'),
('1122-004','0010010',NULL,'','Setup',NULL,'','1122-001','Menu','',4,'2023-06-08 07:03:07'),
('1122-005','0010010',NULL,'Account','Report',NULL,'','1122-001','Menu','',6,'2023-06-08 07:03:07'),
('1122-006','0010010',NULL,'Account','G/L Listing',NULL,'','1122-005','Menu','',1,'2023-06-08 07:03:07'),
('1122-007','0010010',NULL,'Account','AR / AP',NULL,'','1122-005','Menu','',2,'2023-06-08 07:03:07'),
('1122-008','0010010',NULL,'Account','Financial Report',NULL,'','1122-005','Menu','',3,'2023-06-08 07:03:07'),
('1122-009','0010010',NULL,'Account','Department',NULL,'','1122-004','Menu','',1,'2023-06-08 07:03:07'),
('1122-010','0010010',NULL,'Account','Chart Of Account',NULL,'','1122-004','Menu','',2,'2023-06-08 07:03:07'),
('1122-011','0010010',NULL,'Account','Journal Voucher',NULL,'','1122-003','Menu','',1,'2023-06-08 07:03:07'),
('1122-012','0010010',NULL,'Account','COA Managment',NULL,'','1122-004','Menu','',3,'2023-06-08 07:03:07'),
('1122-013','0010010',NULL,'Account','Income  & Expenditure (Detail)',NULL,'Income&ExpenditureDetail','1122-008','Report','',0,'2023-06-08 07:03:07'),
('1122-014','0010010',NULL,'Account','Income & Expenditure (Summary)',NULL,'Income&ExpenditureSummary','1122-008','Report','',0,'2023-06-08 07:03:07'),
('1122-015','0010010',NULL,'Account','Profit or Loss (Summary)',NULL,'Profit&LossSummary','1122-008','Report','',0,'2023-06-08 07:03:07'),
('1122-016','0010010',NULL,'Account','Profit or Loss (Detail)',NULL,'Profit&LossDetail','1122-008','Report','',0,'2023-06-08 07:03:07'),
('1122-017','0010010',NULL,'Account','Balance Sheet (Detail)',NULL,'BalanceSheetDetail','1122-008','Report','',0,'2023-06-08 07:03:07'),
('1122-018','0010010',NULL,'Account','Balance Sheet (Summary)',NULL,'BalanceSheetSummary','1122-008','Report','',0,'2023-06-08 07:03:07'),
('1122-019','0010010',NULL,'Account','Credit Detail',NULL,'CreditDetail','1122-008','Report','',0,'2023-06-08 07:03:07'),
('1222-002','0010010',NULL,'AllCash','နေ့စဉ်ငွေစာရင်း',NULL,'','1122-002','Menu','001-00034',0,'2023-06-08 07:03:07'),
('1222-003','0010010',NULL,'AllCash','Plaza Cash ',NULL,'','1122-002','Menu','006-00001',0,'2023-06-08 07:03:07'),
('1222-004','0010010',NULL,'AllCash','Plaza Cash',NULL,NULL,'012022-004','Menu','006-00001',NULL,'2023-06-08 07:03:07'),
('1222-005','0010010',NULL,'AllCash','Bank',NULL,'','1122-001','Menu','',2,'2023-06-08 07:03:07'),
('1222-006','0010010',NULL,'AllCash','Kasikorn bank(BKK)',NULL,NULL,'1222-005','Menu','001-00035',NULL,'2023-06-08 07:03:07'),
('1222-007','0010010',NULL,'AllCash','AYA bank-8948',NULL,NULL,'1222-005','Menu','001-00278',NULL,'2023-06-08 07:03:07'),
('1222-008','0010010',NULL,'AllCash','KBZ-(ko win aung)',NULL,NULL,'1222-005','Menu','001-00402',NULL,'2023-06-08 07:03:07'),
('1222-009','0010010',NULL,'AllCash','AYA Bank - 6177',NULL,NULL,'1222-005','Menu','001-00420',NULL,'2023-06-08 07:03:07'),
('1222-010','0010010',NULL,'AllCash','KBZ - 9701',NULL,NULL,'1222-005','Menu','001-00477',NULL,'2023-06-08 07:03:07'),
('1222-011','0010010',NULL,'AllCash','YOMA-7872',NULL,NULL,'1222-005','Menu','001-00481',NULL,'2023-06-08 07:03:07'),
('1222-012','0010010',NULL,'AllCash','CB-0302',NULL,NULL,'1222-005','Menu','001-00496',NULL,'2023-06-08 07:03:07'),
('1222-013','0010010',NULL,'AllCash','kbz pay',NULL,NULL,'1222-005','Menu','001-00499',NULL,'2023-06-08 07:03:07'),
('1222-014','0010010',NULL,'AllCash','Myanmar Economic Bank(AY 006771)',NULL,NULL,'1222-005','Menu','001-00504',NULL,'2023-06-08 07:03:07'),
('1222-015','0010010',NULL,'AllCash','UAB (worker fund)',NULL,NULL,'1222-005','Menu','001-00506',NULL,'2023-06-08 07:03:07'),
('1222-016','0010010',NULL,'AllCash','AYA 7118 (NBA)',NULL,NULL,'1222-005','Menu','001-00511',NULL,'2023-06-08 07:03:07'),
('1222-017','0010010',NULL,'AllCash','KBZ New Acc',NULL,NULL,'1222-005','Menu','001-00515',NULL,'2023-06-08 07:03:07'),
('1222-018','0010010',NULL,'AllCash','AYA pay',NULL,NULL,'1222-005','Menu','001-00516',NULL,'2023-06-08 07:03:07'),
('1222-019','0010010',NULL,'AllCash','CB new account',NULL,NULL,'1222-005','Menu','003-00002',NULL,'2023-06-08 07:03:07'),
('1222-020','0010010',NULL,'AllCash','UAB Account ',NULL,NULL,'1222-005','Menu','003-00003',NULL,'2023-06-08 07:03:07'),
('1222-021','0010010',NULL,'AllCash','YOMA Special Account',NULL,NULL,'1222-005','Menu','003-00004',NULL,'2023-06-08 07:03:07'),
('1222-022','0010010',NULL,'Account','Journal Stock Closing',NULL,'','1122-003','Menu','',2,'2023-06-08 07:03:07'),
('49','0010010',NULL,'Inventory','Role Setting','Role Setting','','50','Menu',NULL,3,'2023-06-08 07:03:07'),
('50','0010010',NULL,'System','System','ကုန္ပစၥည္း စာရင္း','','1','Menu','',0,'2023-06-08 07:03:07'),
('52','0010010',NULL,'Inventory','Entry','Entry',NULL,'79','Menu',NULL,1,'2023-06-08 07:03:07'),
('54','0010010',NULL,'Inventory','Menu','Menu','','50','Menu',NULL,2,'2023-06-08 07:03:07'),
('56','0010010',NULL,'Inventory','Sale','ကုန္ေရာင္း ေဘာက္ခ်ာ','','52','Menu',NULL,1,'2023-06-08 07:03:07'),
('57','0010010',NULL,'Inventory','Purchase','ကုန္ဝယ္ ေဘာက္ခ်ာ','','52','Menu',NULL,2,'2023-06-08 07:03:07'),
('58','0010010',NULL,'Inventory','Return In','ကုန္ေရာင္း ျပန္သြင္း','','52','Menu',NULL,3,'2023-06-08 07:03:07'),
('59','0010010',NULL,'Inventory','Return Out','ကုန္ဝယ္ ျပန္ပို႔','','52','Menu',NULL,4,'2023-06-08 07:03:07'),
('79','0010010',NULL,'Inventory','Inventory','ကုန္ပစၥည္း စာရင္း','','1','Menu',NULL,1,'2023-06-08 07:03:07'),
('80','0010010',NULL,'Inventory','Setup','Setup',NULL,'79','Menu',NULL,3,'2023-06-08 07:03:07'),
('81','0010010',NULL,'Inventory','Supplier','Supplier','','80','Menu','',4,'2023-06-08 07:03:07'),
('82','0010010',NULL,'Inventory','Customer','Customer','','80','Menu','',3,'2023-06-08 07:03:07'),
('84','0010010',NULL,'Inventory','Other Setup','Other Setup','','80','Menu','',6,'2023-06-08 07:03:07'),
('85','0010010',NULL,'Inventory','Stock','Stock','','80','Menu','',1,'2023-06-08 07:03:07'),
('89','0010010',NULL,'Inventory','Stock In/Out','ကုန္ဝင္ / ကုန္ထြက္','','52','Menu',NULL,5,'2023-06-08 07:03:07'),
('95','0010010',NULL,'Inventory','Opening','Opening','','80','Menu','',2,'2023-06-08 07:03:07'),
('96','0010010',NULL,'Inventory','System Property','System Propery','','50','Menu','',1,'2023-06-08 07:03:07'),
('97','0010010',NULL,'Inventory','Pattern Setup','Pattern Setup','','80','Menu','',5,'2023-06-08 07:03:07'),
('99','0010010',NULL,'Inventory','Reorder Level','Reorder Level','','52','Menu','',20,'2023-06-08 07:03:07'),
('rp-01','0010010',NULL,'Inventory','Sale By Stock (Detail)',NULL,'SaleByStockDetail','01','Report',NULL,NULL,'2023-06-08 07:03:07'),
('rp-02','0010010',NULL,'Inventory','Sale By Customer (Detail)',NULL,'SaleByCustomerDetail','01','Report',NULL,NULL,'2023-06-08 07:03:07'),
('rp-03','0010010',NULL,'Inventory','Purchase By Supplier (Detail)',NULL,'PurchaseBySupplierDetail','01','Report',NULL,NULL,'2023-06-08 07:03:07'),
('rp-04','0010010',NULL,'Inventory','Purchase By Stock (Detail)',NULL,'PurchaseByStockDetail','01','Report',NULL,NULL,'2023-06-08 07:03:07'),
('rp-06','0010010',NULL,'Inventory','Stock List By Group','Stock List By Group','StockListByGroup','01','Report',NULL,NULL,'2023-06-08 07:03:07'),
('rp-07','0010010',NULL,'Inventory','Top Sale By Customer','Top Sale By Customer','TopSaleByCustomer','01','Report',NULL,NULL,'2023-06-08 07:03:07'),
('rp-08','0010010',NULL,'Inventory','Top Sale By Sale Man','Top Sale By Sale Man','TopSaleBySaleMan','01','Report',NULL,NULL,'2023-06-08 07:03:07'),
('rp-09','0010010',NULL,'Inventory','Top Sale By Stock','Top Sale By Stock','TopSaleByStock','01','Report',NULL,NULL,'2023-06-08 07:03:07');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_template`
--

DROP TABLE IF EXISTS `menu_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_template` (
  `menu_id` int(15) NOT NULL,
  `bus_id` int(15) NOT NULL,
  `menu_class` varchar(150) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_name_mm` varchar(500) DEFAULT NULL,
  `menu_url` varchar(500) DEFAULT NULL,
  `parent_menu_id` int(11) NOT NULL,
  `menu_type` varchar(50) DEFAULT NULL,
  `account` varchar(15) DEFAULT NULL,
  `order_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`,`bus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_template`
--

LOCK TABLES `menu_template` WRITE;
/*!40000 ALTER TABLE `menu_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege_company`
--

DROP TABLE IF EXISTS `privilege_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege_company` (
  `role_code` varchar(15) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `allow` bit(1) NOT NULL DEFAULT b'0',
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`role_code`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege_company`
--

LOCK TABLES `privilege_company` WRITE;
/*!40000 ALTER TABLE `privilege_company` DISABLE KEYS */;
INSERT INTO `privilege_company` VALUES
('1','0010010','','2023-06-08 07:03:07'),
('2','0010010','','2023-06-08 07:03:07'),
('3','0010010','','2023-06-08 07:03:07'),
('R-001','0010010','','2023-06-23 09:20:35');
/*!40000 ALTER TABLE `privilege_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege_menu`
--

DROP TABLE IF EXISTS `privilege_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilege_menu` (
  `menu_code` varchar(15) NOT NULL,
  `role_code` varchar(15) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `allow` bit(1) NOT NULL DEFAULT b'0',
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`menu_code`,`role_code`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege_menu`
--

LOCK TABLES `privilege_menu` WRITE;
/*!40000 ALTER TABLE `privilege_menu` DISABLE KEYS */;
INSERT INTO `privilege_menu` VALUES
('01','1','0010010','','2023-06-08 07:03:07'),
('01','2','0010010','','2023-06-08 07:03:07'),
('01','3','0010010','','2023-06-08 07:03:07'),
('01','R-001','0010010','','2023-06-23 09:20:35'),
('012022-001','1','0010010','','2023-06-08 07:03:07'),
('012022-001','2','0010010','\0','2023-06-08 07:03:07'),
('012022-001','3','0010010','','2023-06-08 07:03:07'),
('012022-001','R-001','0010010','\0','2023-06-23 09:20:35'),
('012022-002','1','0010010','','2023-06-08 07:03:07'),
('012022-002','2','0010010','\0','2023-06-08 07:03:07'),
('012022-002','3','0010010','','2023-06-08 07:03:07'),
('012022-002','R-001','0010010','\0','2023-06-23 09:20:35'),
('012022-003','1','0010010','','2023-06-08 07:03:07'),
('012022-003','2','0010010','\0','2023-06-08 07:03:07'),
('012022-003','3','0010010','','2023-06-08 07:03:07'),
('012022-003','R-001','0010010','\0','2023-06-23 09:20:35'),
('012022-004','1','0010010','','2023-06-08 07:03:07'),
('012022-004','2','0010010','\0','2023-06-08 07:03:07'),
('012022-004','3','0010010','','2023-06-08 07:03:07'),
('012022-004','R-001','0010010','\0','2023-06-23 09:20:35'),
('012022-005','1','0010010','','2023-06-08 07:03:07'),
('012022-005','2','0010010','\0','2023-06-08 07:03:07'),
('012022-005','3','0010010','','2023-06-08 07:03:07'),
('012022-005','R-001','0010010','\0','2023-06-23 09:20:35'),
('012022-006','1','0010010','','2023-06-08 07:03:07'),
('012022-006','2','0010010','\0','2023-06-08 07:03:07'),
('012022-006','3','0010010','','2023-06-08 07:03:07'),
('012022-006','R-001','0010010','\0','2023-06-23 09:20:35'),
('012022-007','1','0010010','','2023-06-08 07:03:07'),
('012022-007','2','0010010','','2023-06-08 07:03:07'),
('012022-007','3','0010010','','2023-06-08 07:03:07'),
('012022-007','R-001','0010010','','2023-06-23 09:20:35'),
('012022-008','1','0010010','','2023-06-08 07:03:07'),
('012022-008','2','0010010','','2023-06-08 07:03:07'),
('012022-008','3','0010010','','2023-06-08 07:03:07'),
('012022-008','R-001','0010010','','2023-06-23 09:20:35'),
('012022-009','1','0010010','','2023-06-08 07:03:07'),
('012022-009','2','0010010','','2023-06-08 07:03:07'),
('012022-009','3','0010010','','2023-06-08 07:03:07'),
('012022-009','R-001','0010010','','2023-06-23 09:20:35'),
('012022-010','1','0010010','','2023-06-08 07:03:07'),
('012022-010','2','0010010','','2023-06-08 07:03:07'),
('012022-010','3','0010010','','2023-06-08 07:03:07'),
('012022-010','R-001','0010010','','2023-06-23 09:20:35'),
('012022-011','1','0010010','','2023-06-08 07:03:07'),
('012022-011','2','0010010','','2023-06-08 07:03:07'),
('012022-011','3','0010010','','2023-06-08 07:03:07'),
('012022-011','R-001','0010010','','2023-06-23 09:20:35'),
('012022-012','1','0010010','','2023-06-08 07:03:07'),
('012022-012','2','0010010','','2023-06-08 07:03:07'),
('012022-012','3','0010010','','2023-06-08 07:03:07'),
('012022-012','R-001','0010010','','2023-06-23 09:20:35'),
('012022-013','1','0010010','','2023-06-08 07:03:07'),
('012022-013','2','0010010','','2023-06-08 07:03:07'),
('012022-013','3','0010010','','2023-06-08 07:03:07'),
('012022-013','R-001','0010010','','2023-06-23 09:20:35'),
('0123-001','1','0010010','','2023-06-08 07:03:07'),
('0123-001','2','0010010','','2023-06-08 07:03:07'),
('0123-001','3','0010010','','2023-06-08 07:03:07'),
('0123-001','R-001','0010010','','2023-06-23 09:20:35'),
('032022-001','1','0010010','','2023-06-08 07:03:07'),
('032022-001','2','0010010','','2023-06-08 07:03:07'),
('032022-001','3','0010010','','2023-06-08 07:03:07'),
('032022-001','R-001','0010010','','2023-06-23 09:20:35'),
('032022-002','1','0010010','','2023-06-08 07:03:07'),
('032022-002','2','0010010','','2023-06-08 07:03:07'),
('032022-002','3','0010010','','2023-06-08 07:03:07'),
('032022-002','R-001','0010010','','2023-06-23 09:20:35'),
('0323-001','1','0010010','','2023-06-08 07:03:07'),
('0323-001','2','0010010','','2023-06-08 07:03:07'),
('0323-001','3','0010010','','2023-06-08 07:03:07'),
('0323-001','R-001','0010010','','2023-06-23 09:20:35'),
('0323-002','1','0010010','','2023-06-08 07:03:07'),
('0323-002','2','0010010','','2023-06-08 07:03:07'),
('0323-002','3','0010010','','2023-06-08 07:03:07'),
('0323-002','R-001','0010010','','2023-06-23 09:20:35'),
('0323-003','1','0010010','','2023-06-08 07:03:07'),
('0323-003','2','0010010','','2023-06-08 07:03:07'),
('0323-003','3','0010010','','2023-06-08 07:03:07'),
('0323-003','R-001','0010010','','2023-06-23 09:20:35'),
('0323-004','1','0010010','','2023-06-08 07:03:07'),
('0323-004','2','0010010','','2023-06-08 07:03:07'),
('0323-004','3','0010010','','2023-06-08 07:03:07'),
('0323-004','R-001','0010010','','2023-06-23 09:20:35'),
('0323-005','1','0010010','','2023-06-08 07:03:07'),
('0323-005','2','0010010','','2023-06-08 07:03:07'),
('0323-005','3','0010010','','2023-06-08 07:03:07'),
('0323-005','R-001','0010010','','2023-06-23 09:20:35'),
('0323-006','1','0010010','','2023-06-08 07:03:07'),
('0323-006','2','0010010','','2023-06-08 07:03:07'),
('0323-006','3','0010010','','2023-06-08 07:03:07'),
('0323-006','R-001','0010010','','2023-06-23 09:20:35'),
('062022-001','1','0010010','','2023-06-08 07:03:07'),
('062022-001','2','0010010','','2023-06-08 07:03:07'),
('062022-001','3','0010010','','2023-06-08 07:03:07'),
('062022-001','R-001','0010010','','2023-06-23 09:20:35'),
('062022-002','1','0010010','','2023-06-08 07:03:07'),
('062022-002','2','0010010','\0','2023-06-08 07:03:07'),
('062022-002','3','0010010','','2023-06-08 07:03:07'),
('062022-002','R-001','0010010','\0','2023-06-25 14:00:48'),
('062022-003','1','0010010','','2023-06-08 07:03:07'),
('062022-003','2','0010010','\0','2023-06-08 07:03:07'),
('062022-003','3','0010010','','2023-06-08 07:03:07'),
('062022-003','R-001','0010010','','2023-06-25 13:46:33'),
('062022-004','1','0010010','','2023-06-08 07:03:07'),
('062022-004','2','0010010','','2023-06-08 07:03:07'),
('062022-004','3','0010010','','2023-06-08 07:03:07'),
('062022-004','R-001','0010010','','2023-06-23 09:20:35'),
('062022-005','1','0010010','','2023-06-08 07:03:07'),
('062022-005','2','0010010','','2023-06-08 07:03:07'),
('062022-005','3','0010010','','2023-06-08 07:03:07'),
('062022-005','R-001','0010010','','2023-06-23 09:20:35'),
('0723-001','1','0010010','','2023-07-05 04:54:02'),
('0723-001','2','0010010','','2023-07-05 04:54:02'),
('0723-001','3','0010010','','2023-07-05 04:54:02'),
('0723-001','R-001','0010010','','2023-07-05 04:54:02'),
('1122-001','1','0010010','','2023-06-08 07:03:07'),
('1122-001','2','0010010','','2023-06-08 07:03:07'),
('1122-001','3','0010010','','2023-06-08 07:03:07'),
('1122-001','R-001','0010010','','2023-06-23 09:20:35'),
('1122-002','1','0010010','','2023-06-08 07:03:07'),
('1122-002','2','0010010','','2023-06-08 07:03:07'),
('1122-002','3','0010010','','2023-06-08 07:03:07'),
('1122-002','R-001','0010010','','2023-06-23 09:20:35'),
('1122-003','1','0010010','','2023-06-08 07:03:07'),
('1122-003','2','0010010','','2023-06-08 07:03:07'),
('1122-003','3','0010010','','2023-06-08 07:03:07'),
('1122-003','R-001','0010010','','2023-06-23 09:20:35'),
('1122-004','1','0010010','','2023-06-08 07:03:07'),
('1122-004','2','0010010','','2023-06-08 07:03:07'),
('1122-004','3','0010010','','2023-06-08 07:03:07'),
('1122-004','R-001','0010010','','2023-06-23 09:20:35'),
('1122-005','1','0010010','','2023-06-08 07:03:07'),
('1122-005','2','0010010','','2023-06-08 07:03:07'),
('1122-005','3','0010010','','2023-06-08 07:03:07'),
('1122-005','R-001','0010010','','2023-06-23 09:20:35'),
('1122-006','1','0010010','','2023-06-08 07:03:07'),
('1122-006','2','0010010','','2023-06-08 07:03:07'),
('1122-006','3','0010010','','2023-06-08 07:03:07'),
('1122-006','R-001','0010010','','2023-06-23 09:20:35'),
('1122-007','1','0010010','','2023-06-08 07:03:07'),
('1122-007','2','0010010','','2023-06-08 07:03:07'),
('1122-007','3','0010010','','2023-06-08 07:03:07'),
('1122-007','R-001','0010010','','2023-06-23 09:20:35'),
('1122-008','1','0010010','','2023-06-08 07:03:07'),
('1122-008','2','0010010','','2023-06-08 07:03:07'),
('1122-008','3','0010010','','2023-06-08 07:03:07'),
('1122-008','R-001','0010010','','2023-06-23 09:20:35'),
('1122-009','1','0010010','','2023-06-08 07:03:07'),
('1122-009','2','0010010','','2023-06-08 07:03:07'),
('1122-009','3','0010010','','2023-06-08 07:03:07'),
('1122-009','R-001','0010010','','2023-06-23 09:20:35'),
('1122-010','1','0010010','','2023-06-08 07:03:07'),
('1122-010','2','0010010','','2023-06-08 07:03:07'),
('1122-010','3','0010010','','2023-06-08 07:03:07'),
('1122-010','R-001','0010010','','2023-06-23 09:20:35'),
('1122-011','1','0010010','','2023-06-08 07:03:07'),
('1122-011','2','0010010','','2023-06-08 07:03:07'),
('1122-011','3','0010010','','2023-06-08 07:03:07'),
('1122-011','R-001','0010010','','2023-06-23 09:20:35'),
('1122-012','1','0010010','','2023-06-08 07:03:07'),
('1122-012','2','0010010','','2023-06-08 07:03:07'),
('1122-012','3','0010010','','2023-06-08 07:03:07'),
('1122-012','R-001','0010010','','2023-06-23 09:20:35'),
('1122-013','1','0010010','','2023-06-08 07:03:07'),
('1122-013','2','0010010','','2023-06-08 07:03:07'),
('1122-013','3','0010010','','2023-06-08 07:03:07'),
('1122-013','R-001','0010010','','2023-06-23 09:20:35'),
('1122-014','1','0010010','','2023-06-08 07:03:07'),
('1122-014','2','0010010','','2023-06-08 07:03:07'),
('1122-014','3','0010010','','2023-06-08 07:03:07'),
('1122-014','R-001','0010010','','2023-06-23 09:20:35'),
('1122-015','1','0010010','','2023-06-08 07:03:07'),
('1122-015','2','0010010','','2023-06-08 07:03:07'),
('1122-015','3','0010010','','2023-06-08 07:03:07'),
('1122-015','R-001','0010010','','2023-06-23 09:20:35'),
('1122-016','1','0010010','','2023-06-08 07:03:07'),
('1122-016','2','0010010','','2023-06-08 07:03:07'),
('1122-016','3','0010010','','2023-06-08 07:03:07'),
('1122-016','R-001','0010010','','2023-06-23 09:20:35'),
('1122-017','1','0010010','','2023-06-08 07:03:07'),
('1122-017','2','0010010','','2023-06-08 07:03:07'),
('1122-017','3','0010010','','2023-06-08 07:03:07'),
('1122-017','R-001','0010010','','2023-06-23 09:20:35'),
('1122-018','1','0010010','','2023-06-08 07:03:07'),
('1122-018','2','0010010','','2023-06-08 07:03:07'),
('1122-018','3','0010010','','2023-06-08 07:03:07'),
('1122-018','R-001','0010010','','2023-06-23 09:20:35'),
('1122-019','1','0010010','','2023-06-08 07:03:07'),
('1122-019','2','0010010','','2023-06-08 07:03:07'),
('1122-019','3','0010010','','2023-06-08 07:03:07'),
('1122-019','R-001','0010010','','2023-06-23 09:20:35'),
('1222-001','1','0010010','','2023-06-08 07:03:07'),
('1222-001','2','0010010','','2023-06-08 07:03:07'),
('1222-001','3','0010010','','2023-06-08 07:03:07'),
('1222-001','R-001','0010010','\0','2023-06-25 14:00:52'),
('1222-002','1','0010010','','2023-06-08 07:03:07'),
('1222-002','2','0010010','','2023-06-08 07:03:07'),
('1222-002','3','0010010','','2023-06-08 07:03:07'),
('1222-002','R-001','0010010','','2023-06-23 09:20:35'),
('1222-003','1','0010010','','2023-06-08 07:03:07'),
('1222-003','2','0010010','','2023-06-08 07:03:07'),
('1222-003','3','0010010','','2023-06-08 07:03:07'),
('1222-003','R-001','0010010','','2023-06-23 09:20:35'),
('1222-004','1','0010010','','2023-06-08 07:03:07'),
('1222-004','2','0010010','','2023-06-08 07:03:07'),
('1222-004','3','0010010','','2023-06-08 07:03:07'),
('1222-004','R-001','0010010','','2023-06-23 09:20:35'),
('1222-005','1','0010010','','2023-06-08 07:03:07'),
('1222-005','2','0010010','','2023-06-08 07:03:07'),
('1222-005','3','0010010','','2023-06-08 07:03:07'),
('1222-005','R-001','0010010','','2023-06-23 09:20:35'),
('1222-006','1','0010010','','2023-06-08 07:03:07'),
('1222-006','2','0010010','','2023-06-08 07:03:07'),
('1222-006','3','0010010','','2023-06-08 07:03:07'),
('1222-006','R-001','0010010','','2023-06-23 09:20:35'),
('1222-007','1','0010010','','2023-06-08 07:03:07'),
('1222-007','2','0010010','','2023-06-08 07:03:07'),
('1222-007','3','0010010','','2023-06-08 07:03:07'),
('1222-007','R-001','0010010','','2023-06-23 09:20:35'),
('1222-008','1','0010010','','2023-06-08 07:03:07'),
('1222-008','2','0010010','','2023-06-08 07:03:07'),
('1222-008','3','0010010','','2023-06-08 07:03:07'),
('1222-008','R-001','0010010','','2023-06-23 09:20:35'),
('1222-009','1','0010010','','2023-06-08 07:03:07'),
('1222-009','2','0010010','','2023-06-08 07:03:07'),
('1222-009','3','0010010','','2023-06-08 07:03:07'),
('1222-009','R-001','0010010','','2023-06-23 09:20:35'),
('1222-010','1','0010010','','2023-06-08 07:03:07'),
('1222-010','2','0010010','','2023-06-08 07:03:07'),
('1222-010','3','0010010','','2023-06-08 07:03:07'),
('1222-010','R-001','0010010','','2023-06-23 09:20:35'),
('1222-011','1','0010010','','2023-06-08 07:03:07'),
('1222-011','2','0010010','','2023-06-08 07:03:07'),
('1222-011','3','0010010','','2023-06-08 07:03:07'),
('1222-011','R-001','0010010','','2023-06-23 09:20:35'),
('1222-012','1','0010010','','2023-06-08 07:03:07'),
('1222-012','2','0010010','','2023-06-08 07:03:07'),
('1222-012','3','0010010','','2023-06-08 07:03:07'),
('1222-012','R-001','0010010','','2023-06-23 09:20:35'),
('1222-013','1','0010010','','2023-06-08 07:03:07'),
('1222-013','2','0010010','','2023-06-08 07:03:07'),
('1222-013','3','0010010','','2023-06-08 07:03:07'),
('1222-013','R-001','0010010','','2023-06-23 09:20:35'),
('1222-014','1','0010010','','2023-06-08 07:03:07'),
('1222-014','2','0010010','','2023-06-08 07:03:07'),
('1222-014','3','0010010','','2023-06-08 07:03:07'),
('1222-014','R-001','0010010','','2023-06-23 09:20:35'),
('1222-015','1','0010010','','2023-06-08 07:03:07'),
('1222-015','2','0010010','','2023-06-08 07:03:07'),
('1222-015','3','0010010','','2023-06-08 07:03:07'),
('1222-015','R-001','0010010','','2023-06-23 09:20:35'),
('1222-016','1','0010010','','2023-06-08 07:03:07'),
('1222-016','2','0010010','','2023-06-08 07:03:07'),
('1222-016','3','0010010','','2023-06-08 07:03:07'),
('1222-016','R-001','0010010','','2023-06-23 09:20:35'),
('1222-017','1','0010010','','2023-06-08 07:03:07'),
('1222-017','2','0010010','','2023-06-08 07:03:07'),
('1222-017','3','0010010','','2023-06-08 07:03:07'),
('1222-017','R-001','0010010','','2023-06-23 09:20:35'),
('1222-018','1','0010010','','2023-06-08 07:03:07'),
('1222-018','2','0010010','','2023-06-08 07:03:07'),
('1222-018','3','0010010','','2023-06-08 07:03:07'),
('1222-018','R-001','0010010','','2023-06-23 09:20:35'),
('1222-019','1','0010010','','2023-06-08 07:03:07'),
('1222-019','2','0010010','','2023-06-08 07:03:07'),
('1222-019','3','0010010','','2023-06-08 07:03:07'),
('1222-019','R-001','0010010','','2023-06-23 09:20:35'),
('1222-020','1','0010010','','2023-06-08 07:03:07'),
('1222-020','2','0010010','','2023-06-08 07:03:07'),
('1222-020','3','0010010','','2023-06-08 07:03:07'),
('1222-020','R-001','0010010','','2023-06-23 09:20:35'),
('1222-021','1','0010010','','2023-06-08 07:03:07'),
('1222-021','2','0010010','','2023-06-08 07:03:07'),
('1222-021','3','0010010','','2023-06-08 07:03:07'),
('1222-021','R-001','0010010','','2023-06-23 09:20:35'),
('1222-022','1','0010010','','2023-06-08 07:03:07'),
('1222-022','2','0010010','','2023-06-08 07:03:07'),
('1222-022','3','0010010','','2023-06-08 07:03:07'),
('1222-022','R-001','0010010','','2023-06-23 09:20:35'),
('49','1','0010010','','2023-06-08 07:03:07'),
('49','2','0010010','\0','2023-06-08 07:03:07'),
('49','3','0010010','','2023-06-08 07:03:07'),
('49','R-001','0010010','\0','2023-06-25 14:00:57'),
('50','1','0010010','','2023-06-08 07:03:07'),
('50','2','0010010','\0','2023-06-08 07:03:07'),
('50','3','0010010','','2023-06-08 07:03:07'),
('50','R-001','0010010','','2023-06-25 13:46:33'),
('52','1','0010010','','2023-06-08 07:03:07'),
('52','2','0010010','','2023-06-08 07:03:07'),
('52','3','0010010','','2023-06-08 07:03:07'),
('52','R-001','0010010','','2023-06-23 09:20:35'),
('53','1','0010010','','2023-06-08 07:03:07'),
('53','2','0010010','','2023-06-08 07:03:07'),
('53','3','0010010','','2023-06-08 07:03:07'),
('53','R-001','0010010','','2023-06-23 09:20:35'),
('54','1','0010010','','2023-06-08 07:03:07'),
('54','2','0010010','\0','2023-06-08 07:03:07'),
('54','3','0010010','','2023-06-08 07:03:07'),
('54','R-001','0010010','\0','2023-06-25 14:00:56'),
('56','1','0010010','','2023-06-08 07:03:07'),
('56','2','0010010','','2023-06-08 07:03:07'),
('56','3','0010010','','2023-06-08 07:03:07'),
('56','R-001','0010010','','2023-06-23 09:20:35'),
('57','1','0010010','','2023-06-08 07:03:07'),
('57','2','0010010','\0','2023-06-08 07:03:07'),
('57','3','0010010','','2023-06-08 07:03:07'),
('57','R-001','0010010','\0','2023-06-23 09:20:35'),
('58','1','0010010','','2023-06-08 07:03:07'),
('58','2','0010010','','2023-06-08 07:03:07'),
('58','3','0010010','','2023-06-08 07:03:07'),
('58','R-001','0010010','','2023-06-23 09:20:35'),
('59','1','0010010','','2023-06-08 07:03:07'),
('59','2','0010010','','2023-06-08 07:03:07'),
('59','3','0010010','','2023-06-08 07:03:07'),
('59','R-001','0010010','','2023-06-23 09:20:35'),
('65','1','0010010','','2023-06-08 07:03:07'),
('65','2','0010010','','2023-06-08 07:03:07'),
('65','3','0010010','','2023-06-08 07:03:07'),
('65','R-001','0010010','','2023-06-23 09:20:35'),
('66','1','0010010','','2023-06-08 07:03:07'),
('66','2','0010010','','2023-06-08 07:03:07'),
('66','3','0010010','','2023-06-08 07:03:07'),
('66','R-001','0010010','','2023-06-23 09:20:35'),
('79','1','0010010','','2023-06-08 07:03:07'),
('79','2','0010010','','2023-06-08 07:03:07'),
('79','3','0010010','','2023-06-08 07:03:07'),
('79','R-001','0010010','','2023-06-23 09:20:35'),
('80','1','0010010','','2023-06-08 07:03:07'),
('80','2','0010010','\0','2023-06-08 07:03:07'),
('80','3','0010010','','2023-06-08 07:03:07'),
('80','R-001','0010010','','2023-07-25 10:03:39'),
('81','1','0010010','','2023-06-08 07:03:07'),
('81','2','0010010','\0','2023-06-08 07:03:07'),
('81','3','0010010','','2023-06-08 07:03:07'),
('81','R-001','0010010','\0','2023-07-25 10:04:03'),
('82','1','0010010','','2023-06-08 07:03:07'),
('82','2','0010010','\0','2023-06-08 07:03:07'),
('82','3','0010010','','2023-06-08 07:03:07'),
('82','R-001','0010010','','2023-07-25 10:03:39'),
('84','1','0010010','','2023-06-08 07:03:07'),
('84','2','0010010','\0','2023-06-08 07:03:07'),
('84','3','0010010','','2023-06-08 07:03:07'),
('84','R-001','0010010','\0','2023-07-25 10:04:07'),
('85','1','0010010','','2023-06-08 07:03:07'),
('85','2','0010010','\0','2023-06-08 07:03:07'),
('85','3','0010010','','2023-06-08 07:03:07'),
('85','R-001','0010010','\0','2023-07-25 10:04:09'),
('89','1','0010010','','2023-06-08 07:03:07'),
('89','2','0010010','','2023-06-08 07:03:07'),
('89','3','0010010','','2023-06-08 07:03:07'),
('89','R-001','0010010','','2023-06-23 09:20:35'),
('95','1','0010010','','2023-06-08 07:03:07'),
('95','2','0010010','\0','2023-06-08 07:03:07'),
('95','3','0010010','','2023-06-08 07:03:07'),
('95','R-001','0010010','\0','2023-07-25 10:04:12'),
('96','1','0010010','','2023-06-08 07:03:07'),
('96','2','0010010','\0','2023-06-08 07:03:07'),
('96','3','0010010','','2023-06-08 07:03:07'),
('96','R-001','0010010','\0','2023-06-25 14:00:54'),
('97','1','0010010','','2023-06-08 07:03:07'),
('97','2','0010010','\0','2023-06-08 07:03:07'),
('97','3','0010010','','2023-06-08 07:03:07'),
('97','R-001','0010010','\0','2023-07-25 10:04:06'),
('99','1','0010010','','2023-06-08 07:03:07'),
('99','2','0010010','','2023-06-08 07:03:07'),
('99','3','0010010','','2023-06-08 07:03:07'),
('99','R-001','0010010','','2023-06-23 09:20:35'),
('rp-01','1','0010010','','2023-06-08 07:03:07'),
('rp-01','2','0010010','','2023-06-08 07:03:07'),
('rp-01','3','0010010','','2023-06-08 07:03:07'),
('rp-01','R-001','0010010','','2023-06-23 09:20:35'),
('rp-02','1','0010010','','2023-06-08 07:03:07'),
('rp-02','2','0010010','','2023-06-08 07:03:07'),
('rp-02','3','0010010','','2023-06-08 07:03:07'),
('rp-02','R-001','0010010','','2023-06-23 09:20:35'),
('rp-03','1','0010010','','2023-06-08 07:03:07'),
('rp-03','2','0010010','','2023-06-08 07:03:07'),
('rp-03','3','0010010','','2023-06-08 07:03:07'),
('rp-03','R-001','0010010','','2023-06-23 09:20:35'),
('rp-04','1','0010010','','2023-06-08 07:03:07'),
('rp-04','2','0010010','','2023-06-08 07:03:07'),
('rp-04','3','0010010','','2023-06-08 07:03:07'),
('rp-04','R-001','0010010','','2023-06-23 09:20:35'),
('rp-05','1','0010010','','2023-06-08 07:03:07'),
('rp-05','2','0010010','','2023-06-08 07:03:07'),
('rp-05','3','0010010','','2023-06-08 07:03:07'),
('rp-05','R-001','0010010','','2023-06-23 09:20:35'),
('rp-06','1','0010010','','2023-06-08 07:03:07'),
('rp-06','2','0010010','','2023-06-08 07:03:07'),
('rp-06','3','0010010','','2023-06-08 07:03:07'),
('rp-06','R-001','0010010','','2023-06-23 09:20:35'),
('rp-07','1','0010010','','2023-06-08 07:03:07'),
('rp-07','2','0010010','','2023-06-08 07:03:07'),
('rp-07','3','0010010','','2023-06-08 07:03:07'),
('rp-07','R-001','0010010','','2023-06-23 09:20:35'),
('rp-08','1','0010010','','2023-06-08 07:03:07'),
('rp-08','2','0010010','','2023-06-08 07:03:07'),
('rp-08','3','0010010','','2023-06-08 07:03:07'),
('rp-08','R-001','0010010','','2023-06-23 09:20:35'),
('rp-09','1','0010010','','2023-06-08 07:03:07'),
('rp-09','2','0010010','','2023-06-08 07:03:07'),
('rp-09','3','0010010','','2023-06-08 07:03:07'),
('rp-09','R-001','0010010','','2023-06-23 09:20:35'),
('rp-10','1','0010010','','2023-06-08 07:03:07'),
('rp-10','2','0010010','','2023-06-08 07:03:07'),
('rp-10','3','0010010','','2023-06-08 07:03:07'),
('rp-10','R-001','0010010','','2023-06-23 09:20:35');
/*!40000 ALTER TABLE `privilege_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `project_no` varchar(15) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget` double DEFAULT NULL,
  `project_status` varchar(15) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`project_no`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_code` varchar(15) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`role_code`,`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES
('1','Admin','2023-06-08 07:03:07'),
('2','Sale','2023-06-08 07:03:07'),
('3','Account','2023-06-08 07:03:07'),
('R-001','Plaza','2023-06-23 09:20:35');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_prop`
--

DROP TABLE IF EXISTS `role_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_prop` (
  `role_code` varchar(15) NOT NULL,
  `prop_key` varchar(50) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `remark` varchar(15) DEFAULT NULL,
  `prop_value` varchar(255) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`role_code`,`prop_key`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_prop`
--

LOCK TABLES `role_prop` WRITE;
/*!40000 ALTER TABLE `role_prop` DISABLE KEYS */;
INSERT INTO `role_prop` VALUES
('1','calculate.stock','0010010',NULL,'true','2023-06-08 07:03:07'),
('1','default.currency','0010010',NULL,'MMK','2023-06-08 07:03:07'),
('1','default.customer','0010010',NULL,'CUS00001-011','2023-06-08 07:03:07'),
('1','default.location','0010010',NULL,'001-0001','2023-06-08 07:03:07'),
('1','default.saleman','0010010',NULL,'09-001','2023-06-08 07:03:07'),
('1','default.supplier','0010010',NULL,'SUP00001-011','2023-06-08 07:03:07'),
('1','department.option','0010010',NULL,'true','2023-06-24 07:03:07'),
('1','purchase.voucher.edit','0010010',NULL,'true','2023-06-08 07:03:07'),
('1','sale.price.option','0010010',NULL,'false','2023-06-08 07:03:07'),
('1','sale.voucher.edit','0010010',NULL,'true','2023-06-08 07:03:07'),
('2','calculate.stock','0010010',NULL,'true','2023-06-08 07:03:07'),
('2','default.currency','0010010',NULL,'MMK','2023-06-08 07:03:07'),
('2','default.location','0010010',NULL,'001-0001','2023-06-08 07:03:07'),
('2','department.option','0010010',NULL,'true','2023-06-23 09:38:12'),
('2','sale.voucher.edit','0010010',NULL,'true','2023-06-08 07:03:07'),
('3','calculate.stock','0010010',NULL,'true','2023-06-08 07:03:07'),
('3','default.location','0010010',NULL,'001-0001','2023-06-25 15:43:38'),
('3','department.option','0010010',NULL,'true','2023-06-23 09:38:10'),
('3','purchase.voucher.edit','0010010',NULL,'true','2023-06-08 07:03:07'),
('3','sale.last.price','0010010',NULL,'false','2023-06-08 07:03:07'),
('3','sale.voucher.edit','0010010',NULL,'true','2023-06-08 07:03:07'),
('R-001','calculate.stock','0010010',NULL,'true','2023-06-23 09:20:35'),
('R-001','default.currency','0010010',NULL,'MMK','2023-06-23 09:20:35'),
('R-001','default.location','0010010',NULL,'002-0002','2023-06-25 15:27:49'),
('R-001','department.option','0010010',NULL,'true','2023-06-23 09:38:08'),
('R-001','sale.voucher.edit','0010010',NULL,'true','2023-06-23 09:20:35');
/*!40000 ALTER TABLE `role_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seq_table`
--

DROP TABLE IF EXISTS `seq_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seq_table` (
  `seq_no` int(11) NOT NULL,
  `option` varchar(15) NOT NULL,
  `period` varchar(15) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`seq_no`,`period`,`option`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seq_table`
--

LOCK TABLES `seq_table` WRITE;
/*!40000 ALTER TABLE `seq_table` DISABLE KEYS */;
INSERT INTO `seq_table` VALUES
(1,'Role','-','2023-06-23 09:20:35'),
(1,'Menu','0123','2023-06-08 07:03:07'),
(1,'Menu','0723','2023-07-05 04:54:02'),
(2,'Menu','032022','2023-06-08 07:03:07'),
(2,'AppUser','062022','2023-06-08 07:03:07'),
(5,'Menu','062022','2023-06-08 07:03:07'),
(5,'AppUser','0623','2023-06-23 09:20:01'),
(6,'Menu','0323','2023-06-08 07:03:07'),
(13,'Menu','012022','2023-06-08 07:03:07'),
(19,'Menu','1122','2023-06-08 07:03:07'),
(22,'Menu','1222','2023-06-08 07:03:07');
/*!40000 ALTER TABLE `seq_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_prop`
--

DROP TABLE IF EXISTS `sys_prop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_prop` (
  `prop_key` varchar(255) NOT NULL,
  `prop_value` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `comp_code` varchar(15) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`prop_key`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_prop`
--

LOCK TABLES `sys_prop` WRITE;
/*!40000 ALTER TABLE `sys_prop` DISABLE KEYS */;
INSERT INTO `sys_prop` VALUES
('auto.update','true',NULL,'0010010','2023-08-31 04:55:18'),
('balancesheet.process','001-00001,001-00006,001-00003,001-00002',NULL,'0010010','2023-06-08 07:03:07'),
('bank.group','001-00011',NULL,'0010010','2023-07-06 05:48:38'),
('capital.account','001-00002',NULL,'0010010','2023-07-06 05:48:38'),
('cash.group','001-00010',NULL,'0010010','2023-07-06 05:48:38'),
('check.sale.A5','true',NULL,'0010010','2023-06-08 07:03:07'),
('check.sale.voucher','false',NULL,'0010010','2023-06-08 07:03:07'),
('cloud.activemq.account.server.queue','princess.account.server',NULL,'0010010','2023-06-08 07:03:07'),
('cloud.activemq.inventory.server.queue','princess.inventory.server',NULL,'0010010','2023-06-08 07:03:07'),
('cloud.activemq.url','tcp://163.44.197.237:61616',NULL,'0010010','2023-06-08 07:03:07'),
('creditor.account','001-00042',NULL,'0010010','2023-07-06 05:48:38'),
('creditor.group','001-00018',NULL,'0010010','2023-07-06 05:48:38'),
('current.account','001-00006',NULL,'0010010','2023-07-06 05:48:38'),
('customer.account','001-00038',NULL,'0010010','2023-06-08 07:03:07'),
('debtor.account','001-00038',NULL,'0010010','2023-07-06 05:48:38'),
('debtor.group','001-00013',NULL,'0010010','2023-07-06 05:48:38'),
('default.department','001-0001',NULL,'0010010','2023-06-08 07:03:07'),
('default.location','001-0001',NULL,'0010010','2023-06-25 15:45:52'),
('department.filter','false',NULL,'0010010','2023-06-23 09:36:23'),
('department.option','true',NULL,'0010010','2023-06-23 09:36:24'),
('expense.account','001-00005',NULL,'0010010','2023-07-06 05:48:38'),
('fixed.account','001-00001',NULL,'0010010','2023-07-06 05:48:38'),
('income.account','001-00004',NULL,'0010010','2023-07-06 05:48:38'),
('income.expense.process','001-00004,001-00008,001-00008,001-00005',NULL,'0010010','2023-06-08 07:03:07'),
('inventory.group','001-00012',NULL,'0010010','2023-07-06 05:48:38'),
('liability.account','001-00003',NULL,'0010010','2023-07-06 05:48:38'),
('logo.name','logo.jpg',NULL,'0010010','2023-06-08 07:03:07'),
('otherincome.account','001-00008',NULL,'0010010','2023-07-06 05:48:38'),
('pl.process','001-00004,001-00007,001-00008,001-00005',NULL,'0010010','2023-06-08 07:03:07'),
('purchase.account','001-00007',NULL,'0010010','2023-07-06 05:48:38'),
('report.purchase.voucher','PurchaseVoucher',NULL,'0010010','2023-06-08 07:03:07'),
('report.sale.A5','SaleVoucher',NULL,'0010010','2023-06-08 07:03:07'),
('sale.price.change','true',NULL,'0010010','2023-06-08 07:03:07'),
('sale.price.option','false',NULL,'0010010','2023-06-08 07:03:07'),
('stock.use.weight','true',NULL,'0010010','2023-09-04 04:44:29'),
('supplier.account','001-00042',NULL,'0010010','2023-06-08 07:03:07'),
('trader.balance','false',NULL,'0010010','2023-06-08 07:03:07');
/*!40000 ALTER TABLE `sys_prop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `token` (
  `mac_id` int(11) NOT NULL,
  `expired` bit(1) NOT NULL,
  `revoked` bit(1) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mac_id`),
  UNIQUE KEY `UK_pddrhgwxnms2aceeku9s2ewy5` (`token`),
  KEY `FKiblu4cjwvyntq3ugo31klp1c6` (`mac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
INSERT INTO `token` VALUES
(7,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMTEwOTI1MDA5MDA5MjMiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODkyMzk4LCJleHAiOjE2OTY0ODQzOTh9.7DIH0ULOAhv0ztYBSACNyxwixnWTrsNliHpPAS-g4b0','BEARER'),
(8,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNTA3NDk5NTQ3MDQxNDYiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODkyNDU3LCJleHAiOjE2OTY0ODQ0NTd9.v9zxJpdenXZ1SKv6EjN24GLx0zGHNKU4g3l4zlAiC7s','BEARER'),
(9,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxODAxMTk2MTg1MDE2MDQiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODkxOTgxLCJleHAiOjE2OTY0ODM5ODF9.b8kg3WnlHImUk7NEzHgOHGsk1XkdPkJGLr45g3-65oU','BEARER'),
(10,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQRlhUTjAyOEozNTA0TSIsImF1dGgiOiJST0xFX1VTRVIiLCJpYXQiOjE2OTM4ODIyNzcsImV4cCI6MTY5NjQ3NDI3N30.LM5Onw244IIMVGjA5C7t8DrOWuk52QMp2Vt40IAnsxk','BEARER'),
(11,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMDEyNzg5OTc2MDI4NjYiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODgwNzQ0LCJleHAiOjE2OTY0NzI3NDR9.F2dWiImDvYYK8CNtd7ylPIGVMD7JFblH32VjukoJO3w','BEARER'),
(13,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3YWY4ZjNmOWQ2NzZiZGVmIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzU5ODUwNywiZXhwIjoxNjkwMTkwNTA3fQ.rddvxvqvyGUMWuBs0bo7tlyU55kThQEJVeKG5x7sr48','BEARER'),
(14,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI0YWU3YjI0M2RhOTNhMWJkIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzQ5OTkyOSwiZXhwIjoxNjkwMDkxOTI5fQ.6us0x0jGJ3Nxx29E3a-RecU9tshdh4JXZV6CrnruGpE','BEARER'),
(15,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIvMzVMTEpaMi9DTkNNQzAwOTlCMDA1My8iLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODkyMzgyLCJleHAiOjE2OTY0ODQzODJ9.DY5R9hyL1bnWPLzXN7ncb5SHHHtGHjwZ4leOc2-7fnA','BEARER'),
(16,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMMUhGOUI4MEJKViIsImF1dGgiOiJST0xFX1VTRVIiLCJpYXQiOjE2OTMwMzQxNTksImV4cCI6MTY5NTYyNjE1OX0.4O0nxeYegrBo__Y3hmu-bVkMcA_th4BmMsuZ2OPA2pk','BEARER'),
(17,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJlMWZiMmZiZThiODIxODg4IiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzUwNTA2NiwiZXhwIjoxNjkwMDk3MDY2fQ.FdmhX-ZMYm4Ba2QgyG55VfAocPMKlUFh-HaEjOj5dmw','BEARER'),
(18,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4Zjg2ZTFjOTYzODBjMWMwIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzUwNTEyOCwiZXhwIjoxNjkwMDk3MTI4fQ.R97ILePQwQSc0fTzqJLbUFK3H0LQH5t5om3-BAol0Dw','BEARER'),
(19,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxZWEzZWQyMzgyOWMwMTBkIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzUwOTE2OCwiZXhwIjoxNjkwMTAxMTY4fQ.eWVPe1ibfPxUvIy4PUtgOPuzgluMPgU5er9DsxcxbkU','BEARER'),
(20,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJiMWIyNTc5YWZhOTRjZGQzIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzU0MzgxOSwiZXhwIjoxNjkwMTM1ODE5fQ.sQ6TTIoG5G3KNZKPIJhGnXK7pbUvrv1ydaQykRuzCbM','BEARER'),
(21,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJhZmM4MGYzMmI2MTgwODBjIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzY5NTYzMywiZXhwIjoxNjkwMjg3NjMzfQ.IzOko5pLJ10PJP7MWLYeMAPTiAJ4vEBPRAl4fxt8jA0','BEARER'),
(22,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIyMTY0ZTQwOTdkMGI0MDhiIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY4NzY5OTU2NCwiZXhwIjoxNjkwMjkxNTY0fQ.NVj8lJB712SK4S5J40Ht-39DGSA57oKOMXgVbdZDuJU','BEARER'),
(23,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJSS1ExLjIwMDgyNi4wMDIiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkxNDAzMTA4LCJleHAiOjE2OTM5OTUxMDh9.uMf4GSrHjijfs3IjQkJjRlmcI_e5-B67mhLo-llJkPc','BEARER'),
(24,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJUUDFBLjIyMDYyNC4wMTQiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzMjk5NDMwLCJleHAiOjE2OTU4OTE0MzB9.6OrMAHNE1D7kvWqSpU24pPujQNCRciMyPeEnxbY5xF4','BEARER'),
(25,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQS1ExLjE4MTEyMS4wMDEiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzNTQ1NTk1LCJleHAiOjE2OTYxMzc1OTV9.1TRr42I2mJa_ukFFfGitFRl4JKLwGYzvKvKviD2fFc4','BEARER'),
(26,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTS1ExLjIxMDkwOC4wMDEiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjg4MzcyMzI3LCJleHAiOjE2OTA5NjQzMjd9.qTW8OKPWHRWDf52K2RFkG8JsNGsqcbOqFZY5A09Hocs','BEARER'),
(27,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJCU1MtMDEyMzQ1Njc4OSIsImF1dGgiOiJST0xFX1VTRVIiLCJpYXQiOjE2ODgzNzQ1NzcsImV4cCI6MTY5MDk2NjU3N30.XF5zuWdIqlWPZg4fGxzM0rHJBZobE3lnlfOc40RGCNE','BEARER'),
(28,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIvODZHWDlQMi9DTkZDVzAwODEzMDA1VS8iLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjg4MzgzNDYxLCJleHAiOjE2OTA5NzU0NjF9.Ks9F7cJznLnnvatd1UPbTAZbj3H4wYSRpZcBc7TQBUw','BEARER'),
(29,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIvODZLUzlQMi9DTkZDVzAwODE1MDFCWS8iLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjg4NDcxODY5LCJleHAiOjE2OTEwNjM4Njl9.rane2RTS7Rr76o7r66mWuJNP2hGcIZRDqi54udj_60w','BEARER'),
(30,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIvOU1WM1dKMi9DTldTQzAwN0MzMDBKVi8iLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkyNjk1NjI5LCJleHAiOjE2OTUyODc2Mjl9.ZR4n3pHUCcRYLkKp_VFIyZ7WCAIOXDVHoytcp5c3PKg','BEARER'),
(31,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJTUDFBLjIxMDgxMi4wMDMiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzMTk2ODg0LCJleHAiOjE2OTU3ODg4ODR9.m3MnSO8PmYxbjTHfvGq96WOOnLOj2fJlDinkkuJwxyI','BEARER'),
(32,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJIT05PUkFHTTMtQUwwOUhOIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY5MTgzOTQ0NiwiZXhwIjoxNjk0NDMxNDQ2fQ.7KWsTnFFEyPO7bgcxqA-gey-3wq0AL8XJU_QziQbpI4','BEARER'),
(33,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJMMUhGOUI4MEJKViIsImF1dGgiOiJST0xFX1VTRVIiLCJpYXQiOjE2OTM4OTE5OTIsImV4cCI6MTY5NjQ4Mzk5Mn0.dPRi-ndDDHtewUUpTe53yfOppS1L1GI2wuHJs-VITIs','BEARER'),
(34,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQR1dIVDAwV0JDNlVMQyIsImF1dGgiOiJST0xFX1VTRVIiLCJpYXQiOjE2OTMyMDQxNzEsImV4cCI6MTY5NTc5NjE3MX0.FM3kOv2AoYXo_4nQw09IdEBIBO5gDb9Oi21QStZZCy4','BEARER'),
(35,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJQT0NPIFgyIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY5MzI4MjIxMSwiZXhwIjoxNjk1ODc0MjExfQ.WLA0kUf5tz109h6H67xL5R8huKH2RaG51qFfVi_JeuU','BEARER'),
(36,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJNMjEwMUs3QUciLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODg4MDU0LCJleHAiOjE2OTY0ODAwNTR9.WSQExkmLTtjrHcJ2tJq1rvMGJt5oWC6kU7CH8x2CG4o','BEARER'),
(37,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJHYWxheHkgUzIyIFVsdHJhIiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY5MzM4OTU4NiwiZXhwIjoxNjk1OTgxNTg2fQ.WLb4tFKEHj2M9Yfzk1Ab_vP_me6mn_OAnUD6NzMDRnA','BEARER'),
(38,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJXYWkncyBUYWIgQTgiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzNDAzMTQ2LCJleHAiOjE2OTU5OTUxNDZ9.KJ_D9M67r8I2MG58Wo36ne7msT8zxnO9oKRcWd1u0v8','BEARER'),
(39,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwb2NveDIiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODA3ODMyLCJleHAiOjE2OTYzOTk4MzJ9.eFlr1t2bJuNJGmuxPjt6pWe8khMqVLSLWTf6TD2uhDg','BEARER'),
(40,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ3YWknc3RhYmE4IiwiYXV0aCI6IlJPTEVfVVNFUiIsImlhdCI6MTY5MzQ4NDQ3NCwiZXhwIjoxNjk2MDc2NDc0fQ.AnOBZplzQbdULPzJu_cgo2mGE1qL1vGkomjA42EXnkw','BEARER'),
(41,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJnYWxheHlzMjJ1bHRyYSIsImF1dGgiOiJST0xFX1VTRVIiLCJpYXQiOjE2OTM4MDM5MjEsImV4cCI6MTY5NjM5NTkyMX0.CLFaed3nQrWtLEGMWFdW376P4xrKLv-iBiLilahPUIs','BEARER'),
(42,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJwcmluY2VzczEiLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjkzODE1Mjg5LCJleHAiOjE2OTY0MDcyODl9.CM9S2qgfTqYe6_q-spkxniDPRo-KtcVdWdmgX46JhUs','BEARER');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cv_user_pc'
--

--
-- Dumping routines for database 'cv_user_pc'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-01  2:14:59
