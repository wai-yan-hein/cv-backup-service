-- MariaDB dump 10.19  Distrib 10.10.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cv_user_kps
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
  `dept_code` varchar(15) DEFAULT NULL,
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
('000','1','ground','ground','','','ground','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('002','1','yoon','yoon','','','33yy','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('003','012022-001','thp','thp','','','55tt','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('004','012022-001','phn','phn','','','22ml','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('005','012022-001','nll','nll','','','44so','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('006','1','tdw','tdw','','','66td','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('007','012022-001','ttw','ttw','','','00tw','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('008','1','wsale','wsale','','','wsale','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('009','1','yzn2','yzn2','','','yzn2','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('011','1','tran','tran','','','tran','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('012','012022-001','stdn','stdn','','','77nn','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('013','1','hk','HK Factory','','','hk','',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('062022-001','1','Htut','htut','','','123456',NULL,NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('1','1','admin','admin','',NULL,'admin',NULL,NULL,'2023-06-12 08:15:38',NULL,NULL,NULL),
('2.0','1','user','user pc','','plm@gmail.com','userpc','123456',NULL,'2023-06-12 08:15:38',NULL,NULL,NULL);
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
INSERT INTO `business_type` VALUES
(1,'Trade','2023-09-01 05:52:59');
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
  `active` bit(1) NOT NULL DEFAULT b'0',
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
('0010010','01','စိန်‌ရွှေမြဆန်ရောင်း၀ယ်ရေး(ဒဂုံ)','09 5105447.09 785105447. 09 965105447','',NULL,'',NULL,'အမှတ်တ/၆၃ မင်းရဲကျော်စွာလမ်း (၉)ရပ်ကွက် အရှေ့ဒဂုံ ရန်ကုန်မြို့','','2022-06-01','2029-05-29','MMK','1','2023-09-23 05:47:03',1,'\0',NULL,'2023-06-12 08:15:38'),
('02','02','စိန်ရွှေမြ ဆန်ရောင်း၀ယ်ရေး(ပုဇွန်တောင်)','095162944,095010845,095175489','',NULL,'',NULL,'အမှတ်(၁၃)စျေးလမ်း (၆)ရပ်ကွက် ပုဇွန်တောင် ရန်ကုန်','','2023-09-27','2030-09-22','MMK','1','2023-09-27 16:37:29',1,'\0',NULL,'2023-09-22 12:07:53');
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
('MMK','MMK','MMK','',NULL,NULL,'2023-06-12 08:15:38');
/*!40000 ALTER TABLE `currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date_lock`
--

DROP TABLE IF EXISTS `date_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_lock` (
  `lock_code` varchar(15) NOT NULL,
  `comp_code` varchar(15) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `date_lock` bit(1) NOT NULL DEFAULT b'0',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_by` varchar(15) NOT NULL,
  `updated_by` varchar(15) DEFAULT NULL,
  `updated_date` timestamp NOT NULL,
  `created_date` timestamp NOT NULL,
  PRIMARY KEY (`lock_code`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date_lock`
--

LOCK TABLES `date_lock` WRITE;
/*!40000 ALTER TABLE `date_lock` DISABLE KEYS */;
INSERT INTO `date_lock` VALUES
('0923-001','0010010','Test1','','2023-09-30','2023-09-30','1','1','2023-09-30 04:19:34','2023-09-30 04:14:18'),
('0923-002','0010010','Test 2','\0','2021-09-30','2023-09-30','1','1','2023-09-30 13:44:35','2023-09-30 04:14:38');
/*!40000 ALTER TABLE `date_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dept_id` int(11) NOT NULL,
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
  `comp_code` varchar(15) NOT NULL,
  PRIMARY KEY (`dept_id`,`comp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES
(1,'H','Head Office',NULL,NULL,'2023-09-01 05:36:56',NULL,NULL,NULL,'','\0','0010010'),
(1,'H','Head Office',NULL,NULL,'2023-09-01 05:36:56',NULL,NULL,NULL,'','\0','02');
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
  `os_name` varchar(255) DEFAULT NULL,
  `os_version` varchar(255) DEFAULT NULL,
  `os_arch` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`mac_id`,`mac_name`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `machine_info`
--

LOCK TABLES `machine_info` WRITE;
/*!40000 ALTER TABLE `machine_info` DISABLE KEYS */;
INSERT INTO `machine_info` VALUES
(31,'','192.168.100.207','kps','2022-06-18 08:03:01','',NULL,NULL,NULL,NULL),
(32,'/9ljl723/cncmc0001e003d/','192.168.100.19','kps','2023-06-12 08:23:07','','E8:6F:38:A9:59:3B','Windows 11','10.0','amd64'),
(33,'l1hf9b80bjv','192.168.56.1','WAIYAN','2023-09-29 10:24:22','','0A:00:27:00:00:05','Windows 11','10.0','amd64');
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
('01','0010010',NULL,'Inventory','Report',NULL,'','79','Menu',NULL,100,'2023-06-12 08:15:38'),
('012022-001','0010010',NULL,'Account','Account',NULL,'','#','Menu',NULL,2,'2023-09-21 09:21:13'),
('012022-002','0010010',NULL,'Account','Setup',NULL,'','012022-001','Menu','',3,'2023-06-12 08:15:38'),
('012022-003','0010010',NULL,'Account','Department',NULL,'','012022-002','Menu','',NULL,'2023-06-12 08:15:38'),
('012022-004','0010010',NULL,'AllCash','Cash Book',NULL,'','012022-001','Menu','',1,'2023-06-12 08:15:38'),
('012022-005','0010010',NULL,'Setup','COA Managment',NULL,'','012022-002','Menu','',NULL,'2023-06-12 08:15:38'),
('012022-007','0010010',NULL,'System','User Setup',NULL,'','50','Menu','',NULL,'2023-06-12 08:15:38'),
('012022-008','0010010',NULL,'Inventory','Sale By Stock (Summary)',NULL,'SaleByStockSummary','01','Report','',NULL,'2023-06-12 08:15:38'),
('012022-009','0010010',NULL,'Inventory','Opening Stock By Group',NULL,'OpeningByGroup','01','Report','',0,'2023-06-12 08:15:38'),
('012022-010','0010010',NULL,'Inventory','Opening Stock By Location',NULL,'OpeningByLocation','01','Report','',0,'2023-06-12 08:15:38'),
('012022-011','0010010',NULL,'Inventory','Sale By Customer (Summary)',NULL,'SaleByCustomerSummary','01','Report','',NULL,'2023-06-12 08:15:38'),
('012022-012','0010010',NULL,'Inventory','Purchase By Supplier (Summary)',NULL,'PurchaseBySupplierSummary','01','Report','',NULL,'2023-06-12 08:15:38'),
('012022-013','0010010',NULL,'Inventory','Purchase By Stock (Summary)',NULL,'PurchaseByStockSummary','01','Report','',NULL,'2023-06-12 08:15:38'),
('012022-014','0010010',NULL,'System','Company',NULL,'','50','Menu','',NULL,'2023-06-12 08:15:38'),
('012022-015','0010010',NULL,'Inventory','Stock In/Out (Summary)',NULL,'StockInOutSummary','01','Report','',NULL,'2023-06-12 08:15:38'),
('022022-001','0010010',NULL,'Inventory','Stock In/Out (Detail)',NULL,'StockInOutDetail','01','Report','',NULL,'2023-06-12 08:15:38'),
('0223-001','0010010',NULL,'AllCash','Bank',NULL,'','012022-001','Menu','',2,'2023-06-12 08:15:38'),
('0223-002','0010010',NULL,'DayBook','Day Book',NULL,'','012022-001','Menu','',3,'2023-06-12 08:15:38'),
('0223-003','0010010',NULL,'Account','Journal',NULL,'','012022-001','Menu','',4,'2023-06-12 08:15:38'),
('0223-004','0010010',NULL,'Account','Journal Voucher',NULL,'','0223-003','Menu','',1,'2023-06-12 08:15:38'),
('0223-005','0010010',NULL,'Account','Journal Stock Closing',NULL,'','0223-003','Menu','',2,'2023-06-12 08:15:38'),
('0223-006','0010010',NULL,'Account','Chart Of Account',NULL,'','012022-002','Menu','',0,'2023-06-12 08:15:38'),
('0223-007','0010010',NULL,'DayBook','အဝယ် စာရင်း',NULL,NULL,'0223-002','Menu','D-00051',NULL,'2023-06-12 08:15:38'),
('0223-008','0010010',NULL,'DayBook','အရောင်း စာရင်း',NULL,NULL,'0223-002','Menu','D-00060',NULL,'2023-06-12 08:15:38'),
('0223-009','0010010',NULL,'','AR / AP',NULL,'','052022-001','Menu','',1,'2023-06-12 08:15:38'),
('0223-010','0010010',NULL,'Account','Financial Report',NULL,'','052022-001','Menu','',3,'2023-06-12 08:15:38'),
('0223-011','0010010',NULL,'AllCash','နေ့စဉ်ငွေစာရင်း',NULL,NULL,'012022-004','Menu','D-00031',NULL,'2023-06-12 08:15:38'),
('0223-012','0010010',NULL,'AllCash','KPay A/C',NULL,NULL,'0223-001','Menu','001-00085',NULL,'2023-06-12 08:15:38'),
('0223-013','0010010',NULL,'AllCash','AYA A/C',NULL,NULL,'0223-001','Menu','001-00086',NULL,'2023-06-12 08:15:38'),
('0223-014','0010010',NULL,'Account','Trader',NULL,'','012022-002','Menu','',0,'2023-06-12 08:15:38'),
('0223-015','0010010',NULL,'Account','Credit Detail',NULL,'CreditDetail','0223-010','Report','',0,'2023-06-12 08:15:38'),
('0223-016','0010010',NULL,'Account','Income & Expenditure (Detail)',NULL,'Income&ExpenditureDetail','0223-010','Report','',0,'2023-06-12 08:15:38'),
('0223-017','0010010',NULL,'Account','Income & Expenditure (Summary)',NULL,'Income&ExpenditureSummary','0223-010','Report','',0,'2023-06-12 08:15:38'),
('0223-018','0010010',NULL,'Account','Profit & Loss (Detail)',NULL,'Profit&LossDetail','0223-010','Report','',0,'2023-06-12 08:15:38'),
('0223-019','0010010',NULL,'Account','Profit & Loss (Summary)',NULL,'Profit&LossSummary','0223-010','Report','',0,'2023-06-12 08:15:38'),
('0223-020','0010010',NULL,'Account','Balance Sheet (Detail)',NULL,'BalanceSheetDetail','0223-010','Report','',0,'2023-06-12 08:15:38'),
('0223-021','0010010',NULL,'Account','Balance Sheet (Summary)',NULL,'BalanceSheetSummary','0223-010','Report','',0,'2023-06-12 08:15:38'),
('0223-022','0010010',NULL,'Account','Individual Statement',NULL,'IndividualStatement','0223-010','Report','',0,'2023-06-12 08:15:38'),
('032022-001','0010010',NULL,'Inventory','Stock Out By Voucher Type (Detail)',NULL,'StockOutByVoucherTypeDetail','01','Report','',0,'2023-06-12 08:15:38'),
('032022-002','0010010',NULL,'Inventory','Stock In/Out Price Calender',NULL,'StockInOutPriceCalender','01','Report','',0,'2023-06-12 08:15:38'),
('052022-001','0010010',NULL,'','Report',NULL,'','012022-001','Menu','',10,'2023-06-12 08:15:38'),
('052022-002','0010010',NULL,'','G/L Listing',NULL,'','052022-001','Menu','',2,'2023-06-12 08:15:38'),
('052022-003','0010010',NULL,'Inventory','Sale By Sale Man (Summary)',NULL,'SaleBySaleManSummary','01','Report','',0,'2023-06-12 08:15:38'),
('052022-004','0010010',NULL,'Inventory','Sale By Sale Man (Detail)',NULL,'SaleBySaleManDetail','01','Report','',0,'2023-06-12 08:15:38'),
('052022-005','0010010',NULL,'Inventory','Sale Price Calender',NULL,'SalePriceCalender','01','Report','',0,'2023-06-12 08:15:38'),
('052022-006','0010010',NULL,'Inventory','Purchase Price Calender',NULL,'PurchasePriceCalender','01','Report','',0,'2023-06-12 08:15:38'),
('052022-007','0010010',NULL,'','Machine Property',NULL,'','50','Menu','',0,'2023-06-12 08:15:38'),
('062022-001','0010010',NULL,'Inventory','Stock Value',NULL,'StockValue','01','Report','',0,'2023-06-12 08:15:38'),
('062022-002','0010010',NULL,'','Opening Balance',NULL,'','012022-002','Menu','',0,'2023-06-12 08:15:38'),
('062022-003','0010010',NULL,'','Transfer',NULL,'','52','Menu','',0,'2023-06-12 08:15:38'),
('0923-001','0010010',NULL,'Inventory','Company Template',NULL,'','50','Menu',NULL,6,'2023-09-21 09:22:01'),
('0923-002','0010010',NULL,'','Excel Report',NULL,'','052022-001','Menu',NULL,3,'2023-09-24 06:35:41'),
('0923-003','02',NULL,'AllCash','KBZ Saving',NULL,'','13','Menu','601001',2,'2023-09-26 09:57:04'),
('0923-004','02',NULL,'AllCash','US$ ၀ယ်/ရောင်း စာရင်း',NULL,'','13','Menu','032-00092',3,'2023-09-26 10:18:30'),
('1','02',NULL,'Inventory','System',NULL,'','#','Menu','',1,'2023-09-22 12:07:53'),
('10','02',NULL,'System','Company Template',NULL,'','1','Menu','',0,'2023-09-22 12:07:53'),
('11','02',NULL,'AllCash','Cash Book',NULL,'','2','Menu','',0,'2023-09-22 12:07:53'),
('12','02',NULL,'AllCash','Daily Cash',NULL,'','11','Menu','600001',0,'2023-09-22 12:07:53'),
('13','02',NULL,'AllCash','Bank',NULL,'','2','Menu','',0,'2023-09-22 12:07:53'),
('14','02',NULL,'DayBook','Day Book',NULL,'','2','Menu','',0,'2023-09-22 12:07:53'),
('15','02',NULL,'Account','Setup',NULL,'','2','Menu','',0,'2023-09-22 12:07:53'),
('16','02',NULL,'Account','Journal',NULL,'','2','Menu','',0,'2023-09-22 12:07:53'),
('17','02',NULL,'Account','Report',NULL,'','2','Menu','',0,'2023-09-22 12:07:53'),
('18','02',NULL,'AllCash','KPay A/C',NULL,'','13','Menu','601001',0,'2023-09-22 12:07:53'),
('19','02',NULL,'AllCash','AYA A/C',NULL,'','13','Menu','601002',0,'2023-09-22 12:07:53'),
('2','02',NULL,'Inventory','Account',NULL,'','#','Menu','',3,'2023-09-22 12:07:53'),
('20','02',NULL,'DayBook','Purchase A/C',NULL,'','14','Menu','',0,'2023-09-22 12:07:53'),
('21','02',NULL,'DayBook','Sale A/C',NULL,'','14','Menu','',0,'2023-09-22 12:07:53'),
('22','02',NULL,'Account','Department',NULL,'','15','Menu','',0,'2023-09-22 12:07:53'),
('23','02',NULL,'Account','COA Management',NULL,'','15','Menu','',0,'2023-09-22 12:07:53'),
('24','02',NULL,'Account','Chart Of Account',NULL,'','15','Menu','',0,'2023-09-22 12:07:53'),
('25','02',NULL,'Account','Trader',NULL,'','15','Menu','',0,'2023-09-22 12:07:53'),
('26','02',NULL,'Account','Opening Balance',NULL,'','15','Menu','',0,'2023-09-22 12:07:53'),
('27','02',NULL,'Account','Journal Voucher',NULL,'','16','Menu','',0,'2023-09-22 12:07:53'),
('28','02',NULL,'Account','Journal Stock Closing',NULL,'','16','Menu','',0,'2023-09-22 12:07:53'),
('29','02',NULL,'Account','AR / AP',NULL,'','17','Menu','',0,'2023-09-22 12:07:53'),
('3','02',NULL,'Inventory','Inventory',NULL,'','#','Menu','',2,'2023-09-22 12:07:53'),
('30','02',NULL,'Account','G/L Listing',NULL,'','17','Menu','',0,'2023-09-22 12:07:53'),
('31','02',NULL,'Account','Financial Report',NULL,'','17','Menu','',0,'2023-09-22 12:07:53'),
('32','02',NULL,'Inventory','Entry',NULL,'','3','Menu','',1,'2023-09-22 12:07:53'),
('33','02',NULL,'Inventory','Setup',NULL,'','3','Menu','',3,'2023-09-22 12:07:53'),
('34','02',NULL,'Inventory','Report',NULL,'','3','Menu','',4,'2023-09-22 12:07:53'),
('35','02',NULL,'Inventory','Reorder Level',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('36','02',NULL,'Inventory','Order',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('39','02',NULL,'Inventory','Sale',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('4','02',NULL,'System','User Setup',NULL,'','1','Menu','',0,'2023-09-22 12:07:53'),
('41','02',NULL,'Inventory','Purchase',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('45','02',NULL,'Inventory','Transfer',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('46','02',NULL,'Inventory','Return In',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('47','02',NULL,'Inventory','Return Out',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('48','02',NULL,'Inventory','Stock In/Out',NULL,'','32','Menu','',0,'2023-09-22 12:07:53'),
('49','0010010',NULL,'Inventory','Role Setting','Role Setting','','50','Menu',NULL,3,'2023-06-12 08:15:38'),
('49','02',NULL,'Inventory','Customer Payment',NULL,'','91','Menu','',0,'2023-09-22 12:07:53'),
('5','02',NULL,'System','Company',NULL,'','1','Menu','',0,'2023-09-22 12:07:53'),
('50','0010010',NULL,'Inventory','System','ကုန္ပစၥည္း စာရင္း','','#','Menu',NULL,NULL,'2023-09-21 09:19:12'),
('50','02',NULL,'Inventory','Supplier Payment',NULL,'','91','Menu','',0,'2023-09-22 12:07:53'),
('51','02',NULL,'Inventory','Department',NULL,'','33','Menu','',0,'2023-09-22 12:07:53'),
('52','0010010',NULL,'Inventory','Entry','Entry',NULL,'79','Menu',NULL,1,'2023-06-12 08:15:38'),
('52','02',NULL,'Inventory','Opening',NULL,'','33','Menu','',0,'2023-09-22 12:07:53'),
('53','02',NULL,'Inventory','Stock',NULL,'','33','Menu','',0,'2023-09-22 12:07:53'),
('54','0010010',NULL,'Inventory','Menu','Menu','','50','Menu',NULL,2,'2023-06-12 08:15:38'),
('54','02',NULL,'Inventory','Pattern Setup',NULL,'','33','Menu','',0,'2023-09-22 12:07:53'),
('55','02',NULL,'Inventory','Customer',NULL,'','33','Menu','',0,'2023-09-22 12:07:53'),
('56','0010010',NULL,'Inventory','Sale','ကုန္ေရာင္း ေဘာက္ခ်ာ','','52','Menu',NULL,1,'2023-06-12 08:15:38'),
('56','02',NULL,'Inventory','Supplier',NULL,'','33','Menu','',0,'2023-09-22 12:07:53'),
('57','0010010',NULL,'Inventory','Purchase','ကုန္ဝယ္ ေဘာက္ခ်ာ','','52','Menu',NULL,2,'2023-06-12 08:15:38'),
('57','02',NULL,'Inventory','Other Setup',NULL,'','33','Menu','',0,'2023-09-22 12:07:53'),
('58','0010010',NULL,'Inventory','Return In','ကုန္ေရာင္း ျပန္သြင္း','','52','Menu',NULL,3,'2023-06-12 08:15:38'),
('58','02',NULL,'Inventory','Sale By Stock (Summary)',NULL,'SaleByStockSummary','34','Report','',NULL,'2023-09-22 12:07:53'),
('59','0010010',NULL,'Inventory','Return Out','ကုန္ဝယ္ ျပန္ပို႔','','52','Menu',NULL,4,'2023-06-12 08:15:38'),
('59','02',NULL,'Inventory','Opening Stock By Group',NULL,'OpeningByGroup','34','Report','',0,'2023-09-22 12:07:53'),
('6','02',NULL,'System','Machine Property',NULL,'','1','Menu','',0,'2023-09-22 12:07:53'),
('60','02',NULL,'Inventory','Opening Stock By Location',NULL,'OpeningByLocation','34','Report','',0,'2023-09-22 12:07:53'),
('61','02',NULL,'Inventory','Sale By Customer (Summary)',NULL,'SaleByCustomerSummary','34','Report','',NULL,'2023-09-22 12:07:53'),
('62','02',NULL,'Inventory','Purchase By Supplier (Summary)',NULL,'PurchaseBySupplierSummary','34','Report','',NULL,'2023-09-22 12:07:53'),
('63','02',NULL,'Inventory','Purchase By Stock (Summary)',NULL,'PurchaseByStockSummary','34','Report','',NULL,'2023-09-22 12:07:53'),
('64','02',NULL,'Inventory','Stock In/Out (Summary)',NULL,'StockInOutSummary','34','Report','',NULL,'2023-09-22 12:07:53'),
('65','02',NULL,'Inventory','Stock In/Out (Detail)',NULL,'StockInOutDetail','34','Report','',NULL,'2023-09-22 12:07:53'),
('66','02',NULL,'Account','Credit Detail',NULL,'CreditDetail','31','Report','',0,'2023-09-22 12:07:53'),
('67','02',NULL,'Account','Income & Expenditure (Detail)',NULL,'Income&ExpenditureDetail','31','Report','',0,'2023-09-22 12:07:53'),
('68','02',NULL,'Account','Income & Expenditure (Summary)',NULL,'Income&ExpenditureSummary','31','Report','',0,'2023-09-22 12:07:53'),
('69','02',NULL,'Account','Profit & Loss (Detail)',NULL,'Profit&LossDetail','31','Report','',0,'2023-09-22 12:07:53'),
('7','02',NULL,'System','System Property',NULL,'','1','Menu','',0,'2023-09-22 12:07:53'),
('70','02',NULL,'Account','Profit & Loss (Summary)',NULL,'Profit&LossSummary','31','Report','',0,'2023-09-22 12:07:53'),
('71','02',NULL,'Account','Balance Sheet (Detail)',NULL,'BalanceSheetDetail','31','Report','',0,'2023-09-22 12:07:53'),
('72','02',NULL,'Account','Balance Sheet (Summary)',NULL,'BalanceSheetSummary','31','Report','',0,'2023-09-22 12:07:53'),
('73','02',NULL,'Account','Individual Statement',NULL,'IndividualStatement','31','Report','',0,'2023-09-22 12:07:53'),
('74','02',NULL,'Inventory','Stock Out By Voucher Type (Detail)',NULL,'StockOutByVoucherTypeDetail','34','Report','',0,'2023-09-22 12:07:53'),
('75','02',NULL,'Inventory','Stock In/Out Price Calender',NULL,'StockInOutPriceCalender','34','Report','',0,'2023-09-22 12:07:53'),
('76','02',NULL,'Inventory','Sale By Sale Man (Summary)',NULL,'SaleBySaleManSummary','34','Report','',0,'2023-09-22 12:07:53'),
('77','02',NULL,'Inventory','Sale By Sale Man (Detail)',NULL,'SaleBySaleManDetail','34','Report','',0,'2023-09-22 12:07:53'),
('78','02',NULL,'Inventory','Sale Price Calender',NULL,'SalePriceCalender','34','Report','',0,'2023-09-22 12:07:53'),
('79','0010010',NULL,'Inventory','Inventory','ကုန္ပစၥည္း စာရင္း','','#','Menu',NULL,1,'2023-09-21 09:19:12'),
('79','02',NULL,'Inventory','Purchase Price Calender',NULL,'PurchasePriceCalender','34','Report','',0,'2023-09-22 12:07:53'),
('8','02',NULL,'System','Role Setting',NULL,'','1','Menu','',0,'2023-09-22 12:07:53'),
('80','0010010',NULL,'Inventory','Setup','Setup',NULL,'79','Menu',NULL,3,'2023-06-12 08:15:38'),
('80','02',NULL,'Inventory','Stock Value',NULL,'StockValue','34','Report','',0,'2023-09-22 12:07:53'),
('81','0010010',NULL,'Inventory','Supplier','Supplier',NULL,'80','Menu',NULL,3,'2023-06-12 08:15:38'),
('81','02',NULL,'Inventory','Stock In/Out (Summary By Weight)',NULL,'StockInOutSummaryByWeight','34','Report',NULL,0,'2023-09-22 12:07:53'),
('82','0010010',NULL,'Inventory','Customer','Customer',NULL,'80','Menu',NULL,2,'2023-06-12 08:15:38'),
('82','02',NULL,'Inventory','Stock In/Out (Detail By Weight)',NULL,'StockInOutDetailByWeight','34','Report','',0,'2023-09-22 12:07:53'),
('83','02',NULL,'Inventory','Sale By Stock (Detail)',NULL,'SaleByStockDetail','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('84','0010010',NULL,'Inventory','Other Setup','Other Setup',NULL,'80','Menu',NULL,4,'2023-06-12 08:15:38'),
('84','02',NULL,'Inventory','Sale By Customer (Detail)',NULL,'SaleByCustomerDetail','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('85','0010010',NULL,'Inventory','Stock','Stock',NULL,'80','Menu',NULL,1,'2023-06-12 08:15:38'),
('85','02',NULL,'Inventory','Purchase By Supplier (Detail)',NULL,'PurchaseBySupplierDetail','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('86','02',NULL,'Inventory','Purchase By Stock (Detail)',NULL,'PurchaseByStockDetail','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('87','02',NULL,'Inventory','Stock List By Group',NULL,'StockListByGroup','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('88','02',NULL,'Inventory','Top Sale By Customer',NULL,'TopSaleByCustomer','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('89','0010010',NULL,'Inventory','Stock In/Out','ကုန္ဝင္ / ကုန္ထြက္','','52','Menu',NULL,5,'2023-06-12 08:15:38'),
('89','02',NULL,'Inventory','Top Sale By Sale Man',NULL,'TopSaleBySaleMan','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('9','02',NULL,'System','Menu',NULL,'','1','Menu','',0,'2023-09-22 12:07:53'),
('90','02',NULL,'Inventory','Top Sale By Stock',NULL,'TopSaleByStock','34','Report',NULL,NULL,'2023-09-22 12:07:53'),
('91','02',NULL,'Inventory','Payment',NULL,'','3','Menu','',2,'2023-09-22 12:07:53'),
('92','02',NULL,'Account','Excel Report',NULL,'','17','Menu','',0,'2023-09-22 12:07:53'),
('95','0010010',NULL,'Inventory','Opening','Opening',NULL,'80','Menu',NULL,NULL,'2023-06-12 08:15:38'),
('96','0010010',NULL,'Inventory','System Property','System Propery','','50','Menu','',1,'2023-06-12 08:15:38'),
('97','0010010',NULL,'Inventory','Pattern Setup','Pattern Setup','','80','Menu',NULL,1,'2023-06-12 08:15:38'),
('99','0010010',NULL,'Inventory','Reorder Level','Reorder Level','','52','Menu',NULL,NULL,'2023-06-12 08:15:38'),
('rp-01','0010010',NULL,'Inventory','Sale By Stock (Detail)',NULL,'SaleByStockDetail','01','Report',NULL,NULL,'2023-06-12 08:15:38'),
('rp-02','0010010',NULL,'Inventory','Sale By Customer (Detail)',NULL,'SaleByCustomerDetail','01','Report',NULL,NULL,'2023-06-12 08:15:38'),
('rp-03','0010010',NULL,'Inventory','Purchase By Supplier (Detail)',NULL,'PurchaseBySupplierDetail','01','Report',NULL,NULL,'2023-06-12 08:15:38'),
('rp-04','0010010',NULL,'Inventory','Purchase By Stock (Detail)',NULL,'PurchaseByStockDetail','01','Report',NULL,NULL,'2023-06-12 08:15:38'),
('rp-06','0010010',NULL,'Inventory','Stock List By Group','Stock List By Group','StockListByGroup','01','Report',NULL,NULL,'2023-06-12 08:15:38'),
('rp-07','0010010',NULL,'Inventory','Top Sale By Customer','Top Sale By Customer','TopSaleByCustomer','01','Report',NULL,NULL,'2023-06-12 08:15:38'),
('rp-08','0010010',NULL,'Inventory','Top Sale By Sale Man','Top Sale By Sale Man','TopSaleBySaleMan','01','Report',NULL,NULL,'2023-06-12 08:15:38'),
('rp-09','0010010',NULL,'Inventory','Top Sale By Stock','Top Sale By Stock','TopSaleByStock','01','Report',NULL,NULL,'2023-06-12 08:15:38');
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
INSERT INTO `menu_template` VALUES
(1,1,'Inventory','System',NULL,'',0,'Menu','',0),
(2,1,'Inventory','Account',NULL,'',0,'Menu','',0),
(3,1,'Inventory','Inventory',NULL,'',0,'Menu','',0),
(4,1,'Inventory','User Setup',NULL,'',1,'Menu','',0),
(5,1,'Inventory','Companry',NULL,'',1,'Menu','',0),
(6,1,'Inventory','Machine Property',NULL,'',1,'Menu','',0),
(7,1,'Inventory','System Property',NULL,'',1,'Menu','',0),
(8,1,'Inventory','Role Setting',NULL,'',1,'Menu','',0),
(9,1,'Inventory','Menu',NULL,'',1,'Menu','',0),
(10,1,'Inventory','Company Template',NULL,'',1,'Menu','',0),
(11,1,'Inventory','Cash Book',NULL,'',2,'Menu','',0),
(12,1,'Inventory','နေ့စဉ်ငွေစားရင်း',NULL,'',11,'Menu','',0),
(13,1,'Inventory','Bank',NULL,'',2,'Menu','',0),
(14,1,'Inventory','Day Book',NULL,'',2,'Menu','',0),
(15,1,'Inventory','Setup',NULL,'',2,'Menu','',0),
(16,1,'Inventory','Journal',NULL,'',2,'Menu','',0),
(17,1,'','Report',NULL,'',2,'Menu','',0),
(18,1,'Inventory','KPay A/C',NULL,'',13,'Menu','',0),
(19,1,'Inventory','AYA A/C',NULL,'',13,'Menu','',0),
(20,1,'Inventory','အဝယ်စားရင်း',NULL,'',14,'Menu','',0),
(21,1,'Inventory','အရောင်းစားရင်း',NULL,'',14,'Menu','',0),
(22,1,'Inventory','Department',NULL,'',15,'Menu','',0),
(23,1,'Inventory','COA Management',NULL,'',15,'Menu','',0),
(24,1,'Inventory','Chart Of Account',NULL,'',15,'Menu','',0),
(25,1,'Inventory','Trader',NULL,'',15,'Menu','',0),
(26,1,'Inventory','Opening Balance',NULL,'',15,'Menu','',0),
(27,1,'Inventory','Journal Voucher',NULL,'',16,'Menu','',0),
(28,1,'Inventory','Journal Stock Closing',NULL,'',16,'Menu','',0),
(29,1,'Inventory','AR / AP',NULL,'',17,'Menu','',0),
(30,1,'Inventory','G/L Listing',NULL,'',17,'Menu','',0),
(31,1,'Account','Financial Report',NULL,'',17,'Menu','',0),
(32,1,'Inventory','Entry',NULL,'',3,'Menu','',0),
(33,1,'Inventory','Setup',NULL,'',3,'Menu','',0),
(34,1,'Inventory','Report',NULL,'',3,'Menu','',0),
(35,1,'Inventory','Reorder Level',NULL,'',32,'Menu','',0),
(36,1,'Inventory','Order',NULL,'',32,'Menu','',0),
(37,1,'Inventory','Manufacture',NULL,'',32,'Menu','',0),
(38,1,'Inventory','Milling',NULL,'',32,'Menu','',0),
(39,1,'Inventory','Sale',NULL,'',32,'Menu','',0),
(40,1,'Inventory','Sale By Weight',NULL,'',32,'Menu','',0),
(41,1,'Inventory','Purchase',NULL,'',32,'Menu','',0),
(42,1,'Inventory','Purchase By Weight',NULL,'',32,'Menu','',0),
(43,1,'Inventory','Purchase Export',NULL,'',32,'Menu','',0),
(44,1,'Inventory','GRN',NULL,'',32,'Menu','',0),
(45,1,'Inventory','Transfer',NULL,'',32,'Menu','',0),
(46,1,'Inventory','Return In',NULL,'',32,'Menu','',0),
(47,1,'Inventory','Return Out',NULL,'',32,'Menu','',0),
(48,1,'Inventory','Stock In/Out',NULL,'',32,'Menu','',0),
(49,1,'Inventory','Customer Payment',NULL,'',32,'Menu','',0),
(50,1,'Inventory','Supplier Payment',NULL,'',32,'Menu','',0),
(51,1,'Inventory','Department',NULL,'',33,'Menu','',0),
(52,1,'Inventory','Opening',NULL,'',33,'Menu','',0),
(53,1,'Inventory','Stock',NULL,'',33,'Menu','',0),
(54,1,'Inventory','Pattern Setup',NULL,'',33,'Menu','',0),
(55,1,'Inventory','Customer',NULL,'',33,'Menu','',0),
(56,1,'Inventory','Supplier',NULL,'',33,'Menu','',0),
(57,1,'Inventory','Other Setup',NULL,'',33,'Menu','',0),
(58,1,'Inventory','Sale By Stock (Summary)',NULL,'SaleByStockSummary',34,'Report','',NULL),
(59,1,'Inventory','Opening Stock By Group',NULL,'OpeningByGroup',34,'Report','',0),
(60,1,'Inventory','Opening Stock By Location',NULL,'OpeningByLocation',34,'Report','',0),
(61,1,'Inventory','Sale By Customer (Summary)',NULL,'SaleByCustomerSummary',34,'Report','',NULL),
(62,1,'Inventory','Purchase By Supplier (Summary)',NULL,'PurchaseBySupplierSummary',34,'Report','',NULL),
(63,1,'Inventory','Purchase By Stock (Summary)',NULL,'PurchaseByStockSummary',34,'Report','',NULL),
(64,1,'Inventory','Stock In/Out (Summary)',NULL,'StockInOutSummary',34,'Report','',NULL),
(65,1,'Inventory','Stock In/Out (Detail)',NULL,'StockInOutDetail',34,'Report','',NULL),
(66,1,'Account','Credit Detail',NULL,'CreditDetail',31,'Report','',0),
(67,1,'Account','Income & Expenditure (Detail)',NULL,'Income&ExpenditureDetail',31,'Report','',0),
(68,1,'Account','Income & Expenditure (Summary)',NULL,'Income&ExpenditureSummary',31,'Report','',0),
(69,1,'Account','Profit & Loss (Detail)',NULL,'Profit&LossDetail',31,'Report','',0),
(70,1,'Account','Profit & Loss (Summary)',NULL,'Profit&LossSummary',31,'Report','',0),
(71,1,'Account','Balance Sheet (Detail)',NULL,'BalanceSheetDetail',31,'Report','',0),
(72,1,'Account','Balance Sheet (Summary)',NULL,'BalanceSheetSummary',31,'Report','',0),
(73,1,'Account','Individual Statement',NULL,'IndividualStatement',31,'Report','',0),
(74,1,'Inventory','Stock Out By Voucher Type (Detail)',NULL,'StockOutByVoucherTypeDetail',34,'Report','',0),
(75,1,'Inventory','Stock In/Out Price Calender',NULL,'StockInOutPriceCalender',34,'Report','',0),
(76,1,'Inventory','Sale By Sale Man (Summary)',NULL,'SaleBySaleManSummary',34,'Report','',0),
(77,1,'Inventory','Sale By Sale Man (Detail)',NULL,'SaleBySaleManDetail',34,'Report','',0),
(78,1,'Inventory','Sale Price Calender',NULL,'SalePriceCalender',34,'Report','',0),
(79,1,'Inventory','Purchase Price Calender',NULL,'PurchasePriceCalender',34,'Report','',0),
(80,1,'Inventory','Stock Value',NULL,'StockValue',34,'Report','',0),
(81,1,'Inventory','Stock In/Out (Summary By Weight)',NULL,'StockInOutSummaryByWeight',34,'Report',NULL,0),
(82,1,'Inventory',' Stock In/Out (Detail By Weight)',NULL,'StockInOutDetailByWeight',34,'Report',NULL,0),
(83,1,'Inventory','Sale By Stock (Detail)',NULL,'SaleByStockDetail',34,'Report',NULL,NULL),
(84,1,'Inventory','Sale By Customer (Detail)',NULL,'SaleByCustomerDetail',34,'Report',NULL,NULL),
(85,1,'Inventory','Purchase By Supplier (Detail)',NULL,'PurchaseBySupplierDetail',34,'Report',NULL,NULL),
(86,1,'Inventory','Purchase By Stock (Detail)',NULL,'PurchaseByStockDetail',34,'Report',NULL,NULL),
(87,1,'Inventory','Stock List By Group',NULL,'StockListByGroup',34,'Report',NULL,NULL),
(88,1,'Inventory','Top Sale By Customer',NULL,'TopSaleByCustomer',34,'Report',NULL,NULL),
(89,1,'Inventory','Top Sale By Sale Man',NULL,'TopSaleBySaleMan',34,'Report',NULL,NULL),
(90,1,'Inventory','Top Sale By Stock',NULL,'TopSaleByStock',34,'Report',NULL,NULL);
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
('001','0010010','\0','2023-06-12 08:15:38'),
('001','02','','2023-09-22 12:07:53'),
('001','1','\0','2023-06-12 08:15:38'),
('002','0010010','\0','2023-06-12 08:15:38'),
('002','02','','2023-09-22 12:07:53'),
('002','1','\0','2023-06-12 08:15:38'),
('012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-001','02','','2023-09-22 12:07:53'),
('012022-001','1','\0','2023-06-12 08:15:38'),
('1','0010010','','2023-06-12 08:15:38'),
('1','02','','2023-09-22 12:07:53'),
('1','1','\0','2023-06-12 08:15:38');
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
('01','001','0010010','\0','2023-06-12 08:15:38'),
('01','002','0010010','\0','2023-06-12 08:15:38'),
('01','012022-001','0010010','','2023-06-12 08:15:38'),
('01','1','0010010','','2023-06-12 08:15:38'),
('012022-001','001','0010010','\0','2023-06-12 08:15:38'),
('012022-001','002','0010010','\0','2023-06-12 08:15:38'),
('012022-001','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-001','1','0010010','','2023-06-12 08:15:38'),
('012022-002','001','0010010','\0','2023-06-12 08:15:38'),
('012022-002','002','0010010','\0','2023-06-12 08:15:38'),
('012022-002','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-002','1','0010010','','2023-06-12 08:15:38'),
('012022-003','001','0010010','\0','2023-06-12 08:15:38'),
('012022-003','002','0010010','\0','2023-06-12 08:15:38'),
('012022-003','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-003','1','0010010','','2023-06-12 08:15:38'),
('012022-004','001','0010010','\0','2023-06-12 08:15:38'),
('012022-004','002','0010010','\0','2023-06-12 08:15:38'),
('012022-004','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-004','1','0010010','','2023-06-12 08:15:38'),
('012022-005','001','0010010','\0','2023-06-12 08:15:38'),
('012022-005','002','0010010','\0','2023-06-12 08:15:38'),
('012022-005','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-005','1','0010010','','2023-06-12 08:15:38'),
('012022-006','001','0010010','\0','2023-06-12 08:15:38'),
('012022-006','002','0010010','\0','2023-06-12 08:15:38'),
('012022-006','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-006','1','0010010','','2023-06-12 08:15:38'),
('012022-007','001','0010010','\0','2023-06-12 08:15:38'),
('012022-007','002','0010010','\0','2023-06-12 08:15:38'),
('012022-007','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-007','1','0010010','','2023-06-12 08:15:38'),
('012022-008','001','0010010','\0','2023-06-12 08:15:38'),
('012022-008','002','0010010','\0','2023-06-12 08:15:38'),
('012022-008','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-008','1','0010010','','2023-06-12 08:15:38'),
('012022-009','001','0010010','\0','2023-06-12 08:15:38'),
('012022-009','002','0010010','\0','2023-06-12 08:15:38'),
('012022-009','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-009','1','0010010','','2023-06-12 08:15:38'),
('012022-010','001','0010010','\0','2023-06-12 08:15:38'),
('012022-010','002','0010010','\0','2023-06-12 08:15:38'),
('012022-010','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-010','1','0010010','','2023-06-12 08:15:38'),
('012022-011','001','0010010','\0','2023-06-12 08:15:38'),
('012022-011','002','0010010','\0','2023-06-12 08:15:38'),
('012022-011','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-011','1','0010010','','2023-06-12 08:15:38'),
('012022-012','001','0010010','\0','2023-06-12 08:15:38'),
('012022-012','002','0010010','\0','2023-06-12 08:15:38'),
('012022-012','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-012','1','0010010','','2023-06-12 08:15:38'),
('012022-013','001','0010010','\0','2023-06-12 08:15:38'),
('012022-013','002','0010010','\0','2023-06-12 08:15:38'),
('012022-013','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-013','1','0010010','','2023-06-12 08:15:38'),
('012022-014','001','0010010','\0','2023-06-12 08:15:38'),
('012022-014','002','0010010','\0','2023-06-12 08:15:38'),
('012022-014','012022-001','0010010','\0','2023-06-12 08:15:38'),
('012022-014','1','0010010','','2023-06-12 08:15:38'),
('012022-015','001','0010010','\0','2023-06-12 08:15:38'),
('012022-015','002','0010010','\0','2023-06-12 08:15:38'),
('012022-015','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-015','1','0010010','','2023-06-12 08:15:38'),
('012022-016','012022-001','0010010','','2023-06-12 08:15:38'),
('012022-016','1','0010010','','2023-06-12 08:15:38'),
('022022-001','001','0010010','\0','2023-06-12 08:15:38'),
('022022-001','002','0010010','\0','2023-06-12 08:15:38'),
('022022-001','012022-001','0010010','','2023-06-12 08:15:38'),
('022022-001','1','0010010','','2023-06-12 08:15:38'),
('0223-001','001','0010010','','2023-06-12 08:15:38'),
('0223-001','002','0010010','','2023-06-12 08:15:38'),
('0223-001','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-001','1','0010010','','2023-06-12 08:15:38'),
('0223-002','001','0010010','','2023-06-12 08:15:38'),
('0223-002','002','0010010','','2023-06-12 08:15:38'),
('0223-002','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-002','1','0010010','','2023-06-12 08:15:38'),
('0223-003','001','0010010','','2023-06-12 08:15:38'),
('0223-003','002','0010010','','2023-06-12 08:15:38'),
('0223-003','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-003','1','0010010','','2023-06-12 08:15:38'),
('0223-004','001','0010010','','2023-06-12 08:15:38'),
('0223-004','002','0010010','','2023-06-12 08:15:38'),
('0223-004','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-004','1','0010010','','2023-06-12 08:15:38'),
('0223-005','001','0010010','','2023-06-12 08:15:38'),
('0223-005','002','0010010','','2023-06-12 08:15:38'),
('0223-005','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-005','1','0010010','','2023-06-12 08:15:38'),
('0223-006','001','0010010','','2023-06-12 08:15:38'),
('0223-006','002','0010010','','2023-06-12 08:15:38'),
('0223-006','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-006','1','0010010','','2023-06-12 08:15:38'),
('0223-007','001','0010010','','2023-06-12 08:15:38'),
('0223-007','002','0010010','','2023-06-12 08:15:38'),
('0223-007','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-007','1','0010010','','2023-06-12 08:15:38'),
('0223-008','001','0010010','','2023-06-12 08:15:38'),
('0223-008','002','0010010','','2023-06-12 08:15:38'),
('0223-008','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-008','1','0010010','','2023-06-12 08:15:38'),
('0223-009','001','0010010','','2023-06-12 08:15:38'),
('0223-009','002','0010010','','2023-06-12 08:15:38'),
('0223-009','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-009','1','0010010','','2023-06-12 08:15:38'),
('0223-010','001','0010010','','2023-06-12 08:15:38'),
('0223-010','002','0010010','','2023-06-12 08:15:38'),
('0223-010','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-010','1','0010010','','2023-06-12 08:15:38'),
('0223-011','001','0010010','','2023-06-12 08:15:38'),
('0223-011','002','0010010','','2023-06-12 08:15:38'),
('0223-011','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-011','1','0010010','','2023-06-12 08:15:38'),
('0223-012','001','0010010','','2023-06-12 08:15:38'),
('0223-012','002','0010010','','2023-06-12 08:15:38'),
('0223-012','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-012','1','0010010','','2023-06-12 08:15:38'),
('0223-013','001','0010010','','2023-06-12 08:15:38'),
('0223-013','002','0010010','','2023-06-12 08:15:38'),
('0223-013','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-013','1','0010010','','2023-06-12 08:15:38'),
('0223-014','001','0010010','','2023-06-12 08:15:38'),
('0223-014','002','0010010','','2023-06-12 08:15:38'),
('0223-014','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-014','1','0010010','','2023-06-12 08:15:38'),
('0223-015','001','0010010','','2023-06-12 08:15:38'),
('0223-015','002','0010010','','2023-06-12 08:15:38'),
('0223-015','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-015','1','0010010','','2023-06-12 08:15:38'),
('0223-016','001','0010010','','2023-06-12 08:15:38'),
('0223-016','002','0010010','','2023-06-12 08:15:38'),
('0223-016','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-016','1','0010010','','2023-06-12 08:15:38'),
('0223-017','001','0010010','','2023-06-12 08:15:38'),
('0223-017','002','0010010','','2023-06-12 08:15:38'),
('0223-017','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-017','1','0010010','','2023-06-12 08:15:38'),
('0223-018','001','0010010','','2023-06-12 08:15:38'),
('0223-018','002','0010010','','2023-06-12 08:15:38'),
('0223-018','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-018','1','0010010','','2023-06-12 08:15:38'),
('0223-019','001','0010010','','2023-06-12 08:15:38'),
('0223-019','002','0010010','','2023-06-12 08:15:38'),
('0223-019','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-019','1','0010010','','2023-06-12 08:15:38'),
('0223-020','001','0010010','','2023-06-12 08:15:38'),
('0223-020','002','0010010','','2023-06-12 08:15:38'),
('0223-020','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-020','1','0010010','','2023-06-12 08:15:38'),
('0223-021','001','0010010','','2023-06-12 08:15:38'),
('0223-021','002','0010010','','2023-06-12 08:15:38'),
('0223-021','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-021','1','0010010','','2023-06-12 08:15:38'),
('0223-022','001','0010010','','2023-06-12 08:15:38'),
('0223-022','002','0010010','','2023-06-12 08:15:38'),
('0223-022','012022-001','0010010','','2023-06-12 08:15:38'),
('0223-022','1','0010010','','2023-06-12 08:15:38'),
('032022-001','001','0010010','\0','2023-06-12 08:15:38'),
('032022-001','002','0010010','\0','2023-06-12 08:15:38'),
('032022-001','012022-001','0010010','','2023-06-12 08:15:38'),
('032022-001','1','0010010','','2023-06-12 08:15:38'),
('032022-002','001','0010010','\0','2023-06-12 08:15:38'),
('032022-002','002','0010010','\0','2023-06-12 08:15:38'),
('032022-002','012022-001','0010010','','2023-06-12 08:15:38'),
('032022-002','1','0010010','','2023-06-12 08:15:38'),
('052022-001','001','0010010','\0','2023-06-12 08:15:38'),
('052022-001','002','0010010','\0','2023-06-12 08:15:38'),
('052022-001','012022-001','0010010','\0','2023-06-12 08:15:38'),
('052022-001','1','0010010','','2023-06-12 08:15:38'),
('052022-002','001','0010010','\0','2023-06-12 08:15:38'),
('052022-002','002','0010010','\0','2023-06-12 08:15:38'),
('052022-002','012022-001','0010010','\0','2023-06-12 08:15:38'),
('052022-002','1','0010010','','2023-06-12 08:15:38'),
('052022-003','001','0010010','\0','2023-06-12 08:15:38'),
('052022-003','002','0010010','\0','2023-06-12 08:15:38'),
('052022-003','012022-001','0010010','','2023-06-12 08:15:38'),
('052022-003','1','0010010','','2023-06-12 08:15:38'),
('052022-004','001','0010010','\0','2023-06-12 08:15:38'),
('052022-004','002','0010010','\0','2023-06-12 08:15:38'),
('052022-004','012022-001','0010010','','2023-06-12 08:15:38'),
('052022-004','1','0010010','','2023-06-12 08:15:38'),
('052022-005','001','0010010','\0','2023-06-12 08:15:38'),
('052022-005','002','0010010','\0','2023-06-12 08:15:38'),
('052022-005','012022-001','0010010','','2023-06-12 08:15:38'),
('052022-005','1','0010010','','2023-06-12 08:15:38'),
('052022-006','001','0010010','\0','2023-06-12 08:15:38'),
('052022-006','002','0010010','\0','2023-06-12 08:15:38'),
('052022-006','012022-001','0010010','','2023-06-12 08:15:38'),
('052022-006','1','0010010','','2023-06-12 08:15:38'),
('052022-007','001','0010010','\0','2023-06-12 08:15:38'),
('052022-007','002','0010010','\0','2023-06-12 08:15:38'),
('052022-007','012022-001','0010010','\0','2023-06-12 08:15:38'),
('052022-007','1','0010010','','2023-06-12 08:15:38'),
('062022-001','001','0010010','\0','2023-06-12 08:15:38'),
('062022-001','002','0010010','\0','2023-06-12 08:15:38'),
('062022-001','012022-001','0010010','','2023-06-12 08:15:38'),
('062022-001','1','0010010','','2023-06-12 08:15:38'),
('062022-002','001','0010010','\0','2023-06-12 08:15:38'),
('062022-002','002','0010010','\0','2023-06-12 08:15:38'),
('062022-002','012022-001','0010010','','2023-06-12 08:15:38'),
('062022-002','1','0010010','','2023-06-12 08:15:38'),
('062022-003','001','0010010','\0','2023-06-12 08:15:38'),
('062022-003','002','0010010','\0','2023-06-12 08:15:38'),
('062022-003','012022-001','0010010','','2023-06-12 08:15:38'),
('062022-003','1','0010010','','2023-06-12 08:15:38'),
('0923-001','001','0010010','','2023-09-21 09:22:01'),
('0923-001','002','0010010','','2023-09-21 09:22:01'),
('0923-001','012022-001','0010010','','2023-09-21 09:22:01'),
('0923-001','1','0010010','','2023-09-21 09:22:01'),
('0923-002','001','0010010','','2023-09-24 06:35:41'),
('0923-002','002','0010010','','2023-09-24 06:35:41'),
('0923-002','012022-001','0010010','','2023-09-24 06:35:41'),
('0923-002','1','0010010','','2023-09-24 06:35:41'),
('0923-003','001','02','','2023-09-26 09:57:04'),
('0923-003','002','02','','2023-09-26 09:57:04'),
('0923-003','012022-001','02','','2023-09-26 09:57:04'),
('0923-003','1','02','','2023-09-26 09:57:04'),
('0923-004','001','02','','2023-09-26 10:18:30'),
('0923-004','002','02','','2023-09-26 10:18:30'),
('0923-004','012022-001','02','','2023-09-26 10:18:30'),
('0923-004','1','02','','2023-09-26 10:18:30'),
('1','001','02','','2023-09-22 12:07:53'),
('1','002','02','','2023-09-22 12:07:53'),
('1','012022-001','02','','2023-09-22 12:07:53'),
('1','1','02','','2023-09-22 12:07:53'),
('10','001','02','','2023-09-22 12:07:53'),
('10','002','02','','2023-09-22 12:07:53'),
('10','012022-001','02','','2023-09-22 12:07:53'),
('10','1','02','','2023-09-22 12:07:53'),
('11','001','02','','2023-09-22 12:07:53'),
('11','002','02','','2023-09-22 12:07:53'),
('11','012022-001','02','','2023-09-22 12:07:53'),
('11','1','02','','2023-09-22 12:07:53'),
('12','001','02','','2023-09-22 12:07:53'),
('12','002','02','','2023-09-22 12:07:53'),
('12','012022-001','02','','2023-09-22 12:07:53'),
('12','1','02','','2023-09-22 12:07:53'),
('13','001','02','','2023-09-22 12:07:53'),
('13','002','02','','2023-09-22 12:07:53'),
('13','012022-001','02','','2023-09-22 12:07:53'),
('13','1','02','','2023-09-22 12:07:53'),
('14','001','02','','2023-09-22 12:07:53'),
('14','002','02','','2023-09-22 12:07:53'),
('14','012022-001','02','','2023-09-22 12:07:53'),
('14','1','02','','2023-09-22 12:07:53'),
('15','001','02','','2023-09-22 12:07:53'),
('15','002','02','','2023-09-22 12:07:53'),
('15','012022-001','02','','2023-09-22 12:07:53'),
('15','1','02','','2023-09-22 12:07:53'),
('16','001','02','','2023-09-22 12:07:53'),
('16','002','02','','2023-09-22 12:07:53'),
('16','012022-001','02','','2023-09-22 12:07:53'),
('16','1','02','','2023-09-22 12:07:53'),
('17','001','02','','2023-09-22 12:07:53'),
('17','002','02','','2023-09-22 12:07:53'),
('17','012022-001','02','','2023-09-22 12:07:53'),
('17','1','02','','2023-09-22 12:07:53'),
('18','001','02','','2023-09-22 12:07:53'),
('18','002','02','','2023-09-22 12:07:53'),
('18','012022-001','02','','2023-09-22 12:07:53'),
('18','1','02','','2023-09-22 12:07:53'),
('19','001','02','','2023-09-22 12:07:53'),
('19','002','02','','2023-09-22 12:07:53'),
('19','012022-001','02','','2023-09-22 12:07:53'),
('19','1','02','','2023-09-22 12:07:53'),
('2','001','02','','2023-09-22 12:07:53'),
('2','002','02','','2023-09-22 12:07:53'),
('2','012022-001','02','','2023-09-22 12:07:53'),
('2','1','02','','2023-09-22 12:07:53'),
('20','001','02','','2023-09-22 12:07:53'),
('20','002','02','','2023-09-22 12:07:53'),
('20','012022-001','02','','2023-09-22 12:07:53'),
('20','1','02','','2023-09-22 12:07:53'),
('21','001','02','','2023-09-22 12:07:53'),
('21','002','02','','2023-09-22 12:07:53'),
('21','012022-001','02','','2023-09-22 12:07:53'),
('21','1','02','','2023-09-22 12:07:53'),
('22','001','02','','2023-09-22 12:07:53'),
('22','002','02','','2023-09-22 12:07:53'),
('22','012022-001','02','','2023-09-22 12:07:53'),
('22','1','02','','2023-09-22 12:07:53'),
('23','001','02','','2023-09-22 12:07:53'),
('23','002','02','','2023-09-22 12:07:53'),
('23','012022-001','02','','2023-09-22 12:07:53'),
('23','1','02','','2023-09-22 12:07:53'),
('24','001','02','','2023-09-22 12:07:53'),
('24','002','02','','2023-09-22 12:07:53'),
('24','012022-001','02','','2023-09-22 12:07:53'),
('24','1','02','','2023-09-22 12:07:53'),
('25','001','02','','2023-09-22 12:07:53'),
('25','002','02','','2023-09-22 12:07:53'),
('25','012022-001','02','','2023-09-22 12:07:53'),
('25','1','02','','2023-09-22 12:07:53'),
('26','001','02','','2023-09-22 12:07:53'),
('26','002','02','','2023-09-22 12:07:53'),
('26','012022-001','02','','2023-09-22 12:07:53'),
('26','1','02','','2023-09-22 12:07:53'),
('27','001','02','','2023-09-22 12:07:53'),
('27','002','02','','2023-09-22 12:07:53'),
('27','012022-001','02','','2023-09-22 12:07:53'),
('27','1','02','','2023-09-22 12:07:53'),
('28','001','02','','2023-09-22 12:07:53'),
('28','002','02','','2023-09-22 12:07:53'),
('28','012022-001','02','','2023-09-22 12:07:53'),
('28','1','02','','2023-09-22 12:07:53'),
('29','001','02','','2023-09-22 12:07:53'),
('29','002','02','','2023-09-22 12:07:53'),
('29','012022-001','02','','2023-09-22 12:07:53'),
('29','1','02','','2023-09-22 12:07:53'),
('3','001','02','','2023-09-22 12:07:53'),
('3','002','02','','2023-09-22 12:07:53'),
('3','012022-001','02','','2023-09-22 12:07:53'),
('3','1','02','','2023-09-22 12:07:53'),
('30','001','02','','2023-09-22 12:07:53'),
('30','002','02','','2023-09-22 12:07:53'),
('30','012022-001','02','','2023-09-22 12:07:53'),
('30','1','02','','2023-09-22 12:07:53'),
('31','001','02','','2023-09-22 12:07:53'),
('31','002','02','','2023-09-22 12:07:53'),
('31','012022-001','02','','2023-09-22 12:07:53'),
('31','1','02','','2023-09-22 12:07:53'),
('32','001','02','','2023-09-22 12:07:53'),
('32','002','02','','2023-09-22 12:07:53'),
('32','012022-001','02','','2023-09-22 12:07:53'),
('32','1','02','','2023-09-22 12:07:53'),
('33','001','02','','2023-09-22 12:07:53'),
('33','002','02','','2023-09-22 12:07:53'),
('33','012022-001','02','','2023-09-22 12:07:53'),
('33','1','02','','2023-09-22 12:07:53'),
('34','001','02','','2023-09-22 12:07:53'),
('34','002','02','','2023-09-22 12:07:53'),
('34','012022-001','02','','2023-09-22 12:07:53'),
('34','1','02','','2023-09-22 12:07:53'),
('35','001','02','','2023-09-22 12:07:53'),
('35','002','02','','2023-09-22 12:07:53'),
('35','012022-001','02','','2023-09-22 12:07:53'),
('35','1','02','','2023-09-22 12:07:53'),
('36','001','02','','2023-09-22 12:07:53'),
('36','002','02','','2023-09-22 12:07:53'),
('36','012022-001','02','','2023-09-22 12:07:53'),
('36','1','02','','2023-09-22 12:07:53'),
('39','001','02','','2023-09-22 12:07:53'),
('39','002','02','','2023-09-22 12:07:53'),
('39','012022-001','02','','2023-09-22 12:07:53'),
('39','1','02','','2023-09-22 12:07:53'),
('4','001','02','','2023-09-22 12:07:53'),
('4','002','02','','2023-09-22 12:07:53'),
('4','012022-001','02','','2023-09-22 12:07:53'),
('4','1','02','','2023-09-22 12:07:53'),
('41','001','02','','2023-09-22 12:07:53'),
('41','002','02','','2023-09-22 12:07:53'),
('41','012022-001','02','','2023-09-22 12:07:53'),
('41','1','02','','2023-09-22 12:07:53'),
('45','001','02','','2023-09-22 12:07:53'),
('45','002','02','','2023-09-22 12:07:53'),
('45','012022-001','02','','2023-09-22 12:07:53'),
('45','1','02','','2023-09-22 12:07:53'),
('46','001','02','','2023-09-22 12:07:53'),
('46','002','02','','2023-09-22 12:07:53'),
('46','012022-001','02','','2023-09-22 12:07:53'),
('46','1','02','','2023-09-22 12:07:53'),
('47','001','02','','2023-09-22 12:07:53'),
('47','002','02','','2023-09-22 12:07:53'),
('47','012022-001','02','','2023-09-22 12:07:53'),
('47','1','02','','2023-09-22 12:07:53'),
('48','001','02','','2023-09-22 12:07:53'),
('48','002','02','','2023-09-22 12:07:53'),
('48','012022-001','02','','2023-09-22 12:07:53'),
('48','1','02','','2023-09-22 12:07:53'),
('49','001','0010010','\0','2023-06-12 08:15:38'),
('49','001','02','','2023-09-22 12:07:53'),
('49','002','0010010','\0','2023-06-12 08:15:38'),
('49','002','02','','2023-09-22 12:07:53'),
('49','012022-001','0010010','\0','2023-06-12 08:15:38'),
('49','012022-001','02','','2023-09-22 12:07:53'),
('49','1','0010010','','2023-06-12 08:15:38'),
('49','1','02','','2023-09-22 12:07:53'),
('5','001','02','','2023-09-22 12:07:53'),
('5','002','02','','2023-09-22 12:07:53'),
('5','012022-001','02','','2023-09-22 12:07:53'),
('5','1','02','','2023-09-22 12:07:53'),
('50','001','0010010','\0','2023-06-12 08:15:38'),
('50','001','02','','2023-09-22 12:07:53'),
('50','002','0010010','\0','2023-06-12 08:15:38'),
('50','002','02','','2023-09-22 12:07:53'),
('50','012022-001','0010010','\0','2023-06-12 08:15:38'),
('50','012022-001','02','','2023-09-22 12:07:53'),
('50','1','0010010','','2023-06-12 08:15:38'),
('50','1','02','','2023-09-22 12:07:53'),
('51','001','02','','2023-09-22 12:07:53'),
('51','002','02','','2023-09-22 12:07:53'),
('51','012022-001','02','','2023-09-22 12:07:53'),
('51','1','02','','2023-09-22 12:07:53'),
('52','001','0010010','\0','2023-06-12 08:15:38'),
('52','001','02','','2023-09-22 12:07:53'),
('52','002','0010010','\0','2023-06-12 08:15:38'),
('52','002','02','','2023-09-22 12:07:53'),
('52','012022-001','0010010','','2023-06-12 08:15:38'),
('52','012022-001','02','','2023-09-22 12:07:53'),
('52','1','0010010','','2023-06-12 08:15:38'),
('52','1','02','','2023-09-22 12:07:53'),
('53','001','0010010','\0','2023-06-12 08:15:38'),
('53','001','02','','2023-09-22 12:07:53'),
('53','002','0010010','\0','2023-06-12 08:15:38'),
('53','002','02','','2023-09-22 12:07:53'),
('53','012022-001','0010010','','2023-06-12 08:15:38'),
('53','012022-001','02','','2023-09-22 12:07:53'),
('53','1','0010010','','2023-06-12 08:15:38'),
('53','1','02','','2023-09-22 12:07:53'),
('54','001','0010010','\0','2023-06-12 08:15:38'),
('54','001','02','','2023-09-22 12:07:53'),
('54','002','0010010','\0','2023-06-12 08:15:38'),
('54','002','02','','2023-09-22 12:07:53'),
('54','012022-001','0010010','\0','2023-06-12 08:15:38'),
('54','012022-001','02','','2023-09-22 12:07:53'),
('54','1','0010010','','2023-06-12 08:15:38'),
('54','1','02','','2023-09-22 12:07:53'),
('55','001','02','','2023-09-22 12:07:53'),
('55','002','02','','2023-09-22 12:07:53'),
('55','012022-001','02','','2023-09-22 12:07:53'),
('55','1','02','','2023-09-22 12:07:53'),
('56','001','0010010','\0','2023-06-12 08:15:38'),
('56','001','02','','2023-09-22 12:07:53'),
('56','002','0010010','\0','2023-06-12 08:15:38'),
('56','002','02','','2023-09-22 12:07:53'),
('56','012022-001','0010010','','2023-06-12 08:15:38'),
('56','012022-001','02','','2023-09-22 12:07:53'),
('56','1','0010010','','2023-06-12 08:15:38'),
('56','1','02','','2023-09-22 12:07:53'),
('57','001','0010010','\0','2023-06-12 08:15:38'),
('57','001','02','','2023-09-22 12:07:53'),
('57','002','0010010','\0','2023-06-12 08:15:38'),
('57','002','02','','2023-09-22 12:07:53'),
('57','012022-001','0010010','','2023-06-12 08:15:38'),
('57','012022-001','02','','2023-09-22 12:07:53'),
('57','1','0010010','','2023-06-12 08:15:38'),
('57','1','02','','2023-09-22 12:07:53'),
('58','001','0010010','\0','2023-06-12 08:15:38'),
('58','001','02','','2023-09-22 12:07:53'),
('58','002','0010010','\0','2023-06-12 08:15:38'),
('58','002','02','','2023-09-22 12:07:53'),
('58','012022-001','0010010','','2023-06-12 08:15:38'),
('58','012022-001','02','','2023-09-22 12:07:53'),
('58','1','0010010','','2023-06-12 08:15:38'),
('58','1','02','','2023-09-22 12:07:53'),
('59','001','0010010','\0','2023-06-12 08:15:38'),
('59','001','02','','2023-09-22 12:07:53'),
('59','002','0010010','\0','2023-06-12 08:15:38'),
('59','002','02','','2023-09-22 12:07:53'),
('59','012022-001','0010010','','2023-06-12 08:15:38'),
('59','012022-001','02','','2023-09-22 12:07:53'),
('59','1','0010010','','2023-06-12 08:15:38'),
('59','1','02','','2023-09-22 12:07:53'),
('6','001','02','','2023-09-22 12:07:53'),
('6','002','02','','2023-09-22 12:07:53'),
('6','012022-001','02','','2023-09-22 12:07:53'),
('6','1','02','','2023-09-22 12:07:53'),
('60','001','02','','2023-09-22 12:07:53'),
('60','002','02','','2023-09-22 12:07:53'),
('60','012022-001','02','','2023-09-22 12:07:53'),
('60','1','02','','2023-09-22 12:07:53'),
('61','001','02','','2023-09-22 12:07:53'),
('61','002','02','','2023-09-22 12:07:53'),
('61','012022-001','02','','2023-09-22 12:07:53'),
('61','1','02','','2023-09-22 12:07:53'),
('62','001','02','','2023-09-22 12:07:53'),
('62','002','02','','2023-09-22 12:07:53'),
('62','012022-001','02','','2023-09-22 12:07:53'),
('62','1','02','','2023-09-22 12:07:53'),
('63','001','02','','2023-09-22 12:07:53'),
('63','002','02','','2023-09-22 12:07:53'),
('63','012022-001','02','','2023-09-22 12:07:53'),
('63','1','02','','2023-09-22 12:07:53'),
('64','001','02','','2023-09-22 12:07:53'),
('64','002','02','','2023-09-22 12:07:53'),
('64','012022-001','02','','2023-09-22 12:07:53'),
('64','1','02','','2023-09-22 12:07:53'),
('65','001','02','','2023-09-22 12:07:53'),
('65','002','02','','2023-09-22 12:07:53'),
('65','012022-001','02','','2023-09-22 12:07:53'),
('65','1','0010010','','2023-06-12 08:15:38'),
('65','1','02','','2023-09-22 12:07:53'),
('66','001','02','','2023-09-22 12:07:53'),
('66','002','02','','2023-09-22 12:07:53'),
('66','012022-001','02','','2023-09-22 12:07:53'),
('66','1','0010010','','2023-06-12 08:15:38'),
('66','1','02','','2023-09-22 12:07:53'),
('67','001','02','','2023-09-22 12:07:53'),
('67','002','02','','2023-09-22 12:07:53'),
('67','012022-001','02','','2023-09-22 12:07:53'),
('67','1','02','','2023-09-22 12:07:53'),
('68','001','02','','2023-09-22 12:07:53'),
('68','002','02','','2023-09-22 12:07:53'),
('68','012022-001','02','','2023-09-22 12:07:53'),
('68','1','02','','2023-09-22 12:07:53'),
('69','001','02','','2023-09-22 12:07:53'),
('69','002','02','','2023-09-22 12:07:53'),
('69','012022-001','02','','2023-09-22 12:07:53'),
('69','1','02','','2023-09-22 12:07:53'),
('7','001','02','','2023-09-22 12:07:53'),
('7','002','02','','2023-09-22 12:07:53'),
('7','012022-001','02','','2023-09-22 12:07:53'),
('7','1','02','','2023-09-22 12:07:53'),
('70','001','02','','2023-09-22 12:07:53'),
('70','002','02','','2023-09-22 12:07:53'),
('70','012022-001','02','','2023-09-22 12:07:53'),
('70','1','02','','2023-09-22 12:07:53'),
('71','001','02','','2023-09-22 12:07:53'),
('71','002','02','','2023-09-22 12:07:53'),
('71','012022-001','02','','2023-09-22 12:07:53'),
('71','1','02','','2023-09-22 12:07:53'),
('72','001','02','','2023-09-22 12:07:53'),
('72','002','02','','2023-09-22 12:07:53'),
('72','012022-001','02','','2023-09-22 12:07:53'),
('72','1','02','','2023-09-22 12:07:53'),
('73','001','02','','2023-09-22 12:07:53'),
('73','002','02','','2023-09-22 12:07:53'),
('73','012022-001','02','','2023-09-22 12:07:53'),
('73','1','02','','2023-09-22 12:07:53'),
('74','001','02','','2023-09-22 12:07:53'),
('74','002','02','','2023-09-22 12:07:53'),
('74','012022-001','02','','2023-09-22 12:07:53'),
('74','1','02','','2023-09-22 12:07:53'),
('75','001','02','','2023-09-22 12:07:53'),
('75','002','02','','2023-09-22 12:07:53'),
('75','012022-001','02','','2023-09-22 12:07:53'),
('75','1','02','','2023-09-22 12:07:53'),
('76','001','02','','2023-09-22 12:07:53'),
('76','002','02','','2023-09-22 12:07:53'),
('76','012022-001','02','','2023-09-22 12:07:53'),
('76','1','02','','2023-09-22 12:07:53'),
('77','001','02','','2023-09-22 12:07:53'),
('77','002','02','','2023-09-22 12:07:53'),
('77','012022-001','02','','2023-09-22 12:07:53'),
('77','1','02','','2023-09-22 12:07:53'),
('78','001','02','','2023-09-22 12:07:53'),
('78','002','02','','2023-09-22 12:07:53'),
('78','012022-001','02','','2023-09-22 12:07:53'),
('78','1','02','','2023-09-22 12:07:53'),
('79','001','0010010','\0','2023-06-12 08:15:38'),
('79','001','02','','2023-09-22 12:07:53'),
('79','002','0010010','\0','2023-06-12 08:15:38'),
('79','002','02','','2023-09-22 12:07:53'),
('79','012022-001','0010010','','2023-06-12 08:15:38'),
('79','012022-001','02','','2023-09-22 12:07:53'),
('79','1','0010010','','2023-06-12 08:15:38'),
('79','1','02','','2023-09-22 12:07:53'),
('8','001','02','','2023-09-22 12:07:53'),
('8','002','02','','2023-09-22 12:07:53'),
('8','012022-001','02','','2023-09-22 12:07:53'),
('8','1','02','','2023-09-22 12:07:53'),
('80','001','0010010','\0','2023-06-12 08:15:38'),
('80','001','02','','2023-09-22 12:07:53'),
('80','002','0010010','\0','2023-06-12 08:15:38'),
('80','002','02','','2023-09-22 12:07:53'),
('80','012022-001','0010010','','2023-06-12 08:15:38'),
('80','012022-001','02','','2023-09-22 12:07:53'),
('80','1','0010010','','2023-06-12 08:15:38'),
('80','1','02','','2023-09-22 12:07:53'),
('81','001','0010010','\0','2023-06-12 08:15:38'),
('81','001','02','','2023-09-22 12:07:53'),
('81','002','0010010','\0','2023-06-12 08:15:38'),
('81','002','02','','2023-09-22 12:07:53'),
('81','012022-001','0010010','','2023-06-12 08:15:38'),
('81','012022-001','02','','2023-09-22 12:07:53'),
('81','1','0010010','','2023-06-12 08:15:38'),
('81','1','02','','2023-09-22 12:07:53'),
('82','001','0010010','\0','2023-06-12 08:15:38'),
('82','001','02','','2023-09-22 12:07:53'),
('82','002','0010010','\0','2023-06-12 08:15:38'),
('82','002','02','','2023-09-22 12:07:53'),
('82','012022-001','0010010','','2023-06-12 08:15:38'),
('82','012022-001','02','','2023-09-22 12:07:53'),
('82','1','0010010','','2023-06-12 08:15:38'),
('82','1','02','','2023-09-22 12:07:53'),
('83','001','02','','2023-09-22 12:07:53'),
('83','002','02','','2023-09-22 12:07:53'),
('83','012022-001','02','','2023-09-22 12:07:53'),
('83','1','02','','2023-09-22 12:07:53'),
('84','001','0010010','\0','2023-06-12 08:15:38'),
('84','001','02','','2023-09-22 12:07:53'),
('84','002','0010010','\0','2023-06-12 08:15:38'),
('84','002','02','','2023-09-22 12:07:53'),
('84','012022-001','0010010','','2023-06-12 08:15:38'),
('84','012022-001','02','','2023-09-22 12:07:53'),
('84','1','0010010','','2023-06-12 08:15:38'),
('84','1','02','','2023-09-22 12:07:53'),
('85','001','0010010','\0','2023-06-12 08:15:38'),
('85','001','02','','2023-09-22 12:07:53'),
('85','002','0010010','\0','2023-06-12 08:15:38'),
('85','002','02','','2023-09-22 12:07:53'),
('85','012022-001','0010010','','2023-06-12 08:15:38'),
('85','012022-001','02','','2023-09-22 12:07:53'),
('85','1','0010010','','2023-06-12 08:15:38'),
('85','1','02','','2023-09-22 12:07:53'),
('86','001','02','','2023-09-22 12:07:53'),
('86','002','02','','2023-09-22 12:07:53'),
('86','012022-001','02','','2023-09-22 12:07:53'),
('86','1','02','','2023-09-22 12:07:53'),
('87','001','02','','2023-09-22 12:07:53'),
('87','002','02','','2023-09-22 12:07:53'),
('87','012022-001','02','','2023-09-22 12:07:53'),
('87','1','02','','2023-09-22 12:07:53'),
('88','001','02','','2023-09-22 12:07:53'),
('88','002','02','','2023-09-22 12:07:53'),
('88','012022-001','02','','2023-09-22 12:07:53'),
('88','1','02','','2023-09-22 12:07:53'),
('89','001','0010010','\0','2023-06-12 08:15:38'),
('89','001','02','','2023-09-22 12:07:53'),
('89','002','0010010','\0','2023-06-12 08:15:38'),
('89','002','02','','2023-09-22 12:07:53'),
('89','012022-001','0010010','','2023-06-12 08:15:38'),
('89','012022-001','02','','2023-09-22 12:07:53'),
('89','1','0010010','','2023-06-12 08:15:38'),
('89','1','02','','2023-09-22 12:07:53'),
('9','001','02','','2023-09-22 12:07:53'),
('9','002','02','','2023-09-22 12:07:53'),
('9','012022-001','02','','2023-09-22 12:07:53'),
('9','1','02','','2023-09-22 12:07:53'),
('90','001','02','','2023-09-22 12:07:53'),
('90','002','02','','2023-09-22 12:07:53'),
('90','012022-001','02','','2023-09-22 12:07:53'),
('90','1','02','','2023-09-22 12:07:53'),
('91','001','02','','2023-09-22 12:07:53'),
('91','002','02','','2023-09-22 12:07:53'),
('91','012022-001','02','','2023-09-22 12:07:53'),
('91','1','02','','2023-09-22 12:07:53'),
('92','001','02','','2023-09-22 12:07:53'),
('92','002','02','','2023-09-22 12:07:53'),
('92','012022-001','02','','2023-09-22 12:07:53'),
('92','1','02','','2023-09-22 12:07:53'),
('95','001','0010010','\0','2023-06-12 08:15:38'),
('95','002','0010010','\0','2023-06-12 08:15:38'),
('95','012022-001','0010010','','2023-06-12 08:15:38'),
('95','1','0010010','','2023-06-12 08:15:38'),
('96','001','0010010','\0','2023-06-12 08:15:38'),
('96','002','0010010','\0','2023-06-12 08:15:38'),
('96','012022-001','0010010','\0','2023-06-12 08:15:38'),
('96','1','0010010','','2023-06-12 08:15:38'),
('97','001','0010010','\0','2023-06-12 08:15:38'),
('97','002','0010010','\0','2023-06-12 08:15:38'),
('97','012022-001','0010010','','2023-06-12 08:15:38'),
('97','1','0010010','','2023-06-12 08:15:38'),
('99','001','0010010','\0','2023-06-12 08:15:38'),
('99','002','0010010','\0','2023-06-12 08:15:38'),
('99','012022-001','0010010','','2023-06-12 08:15:38'),
('99','1','0010010','','2023-06-12 08:15:38'),
('rp-01','001','0010010','\0','2023-06-12 08:15:38'),
('rp-01','002','0010010','\0','2023-06-12 08:15:38'),
('rp-01','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-01','1','0010010','','2023-06-12 08:15:38'),
('rp-02','001','0010010','\0','2023-06-12 08:15:38'),
('rp-02','002','0010010','\0','2023-06-12 08:15:38'),
('rp-02','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-02','1','0010010','','2023-06-12 08:15:38'),
('rp-03','001','0010010','\0','2023-06-12 08:15:38'),
('rp-03','002','0010010','\0','2023-06-12 08:15:38'),
('rp-03','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-03','1','0010010','','2023-06-12 08:15:38'),
('rp-04','001','0010010','\0','2023-06-12 08:15:38'),
('rp-04','002','0010010','\0','2023-06-12 08:15:38'),
('rp-04','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-04','1','0010010','','2023-06-12 08:15:38'),
('rp-05','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-05','1','0010010','','2023-06-12 08:15:38'),
('rp-06','001','0010010','\0','2023-06-12 08:15:38'),
('rp-06','002','0010010','\0','2023-06-12 08:15:38'),
('rp-06','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-06','1','0010010','','2023-06-12 08:15:38'),
('rp-07','001','0010010','\0','2023-06-12 08:15:38'),
('rp-07','002','0010010','\0','2023-06-12 08:15:38'),
('rp-07','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-07','1','0010010','','2023-06-12 08:15:38'),
('rp-08','001','0010010','\0','2023-06-12 08:15:38'),
('rp-08','002','0010010','\0','2023-06-12 08:15:38'),
('rp-08','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-08','1','0010010','','2023-06-12 08:15:38'),
('rp-09','001','0010010','\0','2023-06-12 08:15:38'),
('rp-09','002','0010010','\0','2023-06-12 08:15:38'),
('rp-09','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-09','1','0010010','','2023-06-12 08:15:38'),
('rp-10','012022-001','0010010','\0','2023-06-12 08:15:38'),
('rp-10','1','0010010','','2023-06-12 08:15:38');
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
('001','','2023-06-12 08:15:38'),
('002','Role 3','2023-06-12 08:15:38'),
('012022-001','Shop','2023-06-12 08:15:38'),
('1','Admin','2023-06-12 08:15:38');
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
('001','calculate.stock','0010010',NULL,'true','2023-06-12 08:15:38'),
('001','default.currency','0010010',NULL,'MMK','2023-06-12 08:15:38'),
('001','default.customer','0010010',NULL,'CUS001','2023-06-12 08:15:38'),
('001','default.location','0010010',NULL,'022-0002','2023-06-12 08:15:38'),
('001','default.sale.paid','0010010',NULL,'true','2023-06-12 08:15:38'),
('001','default.saleman','0010010',NULL,'09-001','2023-06-12 08:15:38'),
('001','default.supplier','0010010',NULL,'SUP00001-011','2023-06-12 08:15:38'),
('001','sale.price.change','0010010',NULL,'true','2023-06-12 08:15:38'),
('001','sale.price.option','0010010',NULL,'false','2023-06-12 08:15:38'),
('001','sale.voucher.edit','0010010',NULL,'true','2023-06-12 08:15:38'),
('001','unit.relation','0010010',NULL,'true','2023-06-12 08:15:38'),
('002','calculate.stock','0010010',NULL,'true','2023-06-12 08:15:38'),
('002','default.currency','0010010',NULL,'MMK','2023-06-12 08:15:38'),
('002','default.customer','0010010',NULL,'CUS001','2023-06-12 08:15:38'),
('002','default.location','0010010',NULL,'022-0002','2023-06-12 08:15:38'),
('002','default.sale.paid','0010010',NULL,'true','2023-06-12 08:15:38'),
('002','default.saleman','0010010',NULL,'09-001','2023-06-12 08:15:38'),
('002','default.supplier','0010010',NULL,'SUP00001-011','2023-06-12 08:15:38'),
('002','sale.price.change','0010010',NULL,'true','2023-06-12 08:15:38'),
('002','sale.price.option','0010010',NULL,'false','2023-06-12 08:15:38'),
('002','sale.voucher.edit','0010010',NULL,'true','2023-06-12 08:15:38'),
('002','unit.relation','0010010',NULL,'true','2023-06-12 08:15:38'),
('012022-001','calculate.stock','0010010',NULL,'true','2023-06-12 08:15:38'),
('012022-001','default.currency','0010010',NULL,'MMK','2023-06-12 08:15:38'),
('012022-001','default.customer','0010010',NULL,'CUS00001-015','2023-06-12 08:15:38'),
('012022-001','default.location','0010010',NULL,'022-0001','2023-06-12 08:15:38'),
('012022-001','default.sale.paid','0010010',NULL,'true','2023-06-12 08:15:38'),
('012022-001','default.saleman','0010010',NULL,'09-001','2023-06-12 08:15:38'),
('012022-001','default.supplier','0010010',NULL,'-','2023-06-12 08:15:38'),
('012022-001','sale.price.option','0010010',NULL,'true','2023-06-12 08:15:38'),
('012022-001','sale.voucher.edit','0010010',NULL,'false','2023-06-12 08:15:38'),
('1','calculate.stock','0010010',NULL,'true','2023-06-12 08:15:38'),
('1','default.currency','0010010',NULL,'MMK','2023-06-12 08:15:38'),
('1','default.customer','0010010',NULL,'CUS001','2023-06-12 08:15:38'),
('1','default.department','0010010',NULL,'006-0002','2023-09-25 09:02:44'),
('1','default.department','02',NULL,'0001','2023-09-25 09:00:27'),
('1','default.location','0010010',NULL,'031-0001','2023-06-12 08:15:38'),
('1','default.sale.paid','0010010',NULL,'true','2023-06-12 08:15:38'),
('1','default.saleman','0010010',NULL,'09-001','2023-06-12 08:15:38'),
('1','default.supplier','0010010',NULL,'SUP00001-011','2023-06-12 08:15:38'),
('1','disable.department','0010010',NULL,'false','2023-06-12 08:15:38'),
('1','purchase.voucher.edit','0010010',NULL,'true','2023-06-12 08:15:38'),
('1','sale.price.change','0010010',NULL,'true','2023-06-12 08:15:38'),
('1','sale.price.option','0010010',NULL,'false','2023-06-12 08:15:38'),
('1','sale.voucher.edit','0010010',NULL,'true','2023-06-12 08:15:38'),
('1','unit.relation','0010010',NULL,'true','2023-06-12 08:15:38');
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
(1,'Company','-','2023-09-22 12:07:53'),
(1,'Role','012022','2023-06-12 08:15:38'),
(1,'Menu','022022','2023-06-12 08:15:38'),
(1,'AppUser','062022','2023-06-12 08:15:38'),
(1,'Role','1122','2023-06-12 08:15:38'),
(2,'Menu','032022','2023-06-12 08:15:38'),
(2,'Role','062022','2023-06-12 08:15:38'),
(2,'DateLock','0923','2023-09-30 10:44:38'),
(3,'Menu','062022','2023-06-12 08:15:38'),
(4,'Menu','0923','2023-09-26 10:18:30'),
(5,'AppUser','012022','2023-06-12 08:15:38'),
(7,'Menu','052022','2023-06-12 08:15:38'),
(16,'Menu','012022','2023-06-12 08:15:38'),
(22,'Menu','0223','2023-06-12 08:15:38');
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
('bank.group','601',NULL,'02','2023-09-22 12:07:53'),
('capital.account','003',NULL,'0010010','2023-06-12 08:15:38'),
('capital.account','02',NULL,'02','2023-09-22 12:07:53'),
('cash.group','600',NULL,'02','2023-09-22 12:07:53'),
('check.sale.A4','true',NULL,'0010010','2023-06-12 08:15:38'),
('check.sale.A5','1',NULL,'0010010','2023-06-12 08:15:38'),
('check.sale.voucher','0',NULL,'0010010','2023-06-12 08:15:38'),
('creditor.account','D-00019',NULL,'0010010','2023-06-12 08:15:38'),
('creditor.account','300001',NULL,'02','2023-09-22 12:07:53'),
('creditor.group','D-00019',NULL,'0010010','2023-06-12 08:15:38'),
('creditor.group','300',NULL,'02','2023-09-22 12:07:53'),
('current.account','002',NULL,'0010010','2023-06-12 08:15:38'),
('current.account','06',NULL,'02','2023-09-22 12:07:53'),
('customer.account','D-00041',NULL,'0010010','2023-06-12 08:15:38'),
('debtor.account','D-00008',NULL,'0010010','2023-06-12 08:15:38'),
('debtor.account','604001',NULL,'02','2023-09-22 12:07:53'),
('debtor.group','D-00008',NULL,'0010010','2023-06-12 08:15:38'),
('debtor.group','604',NULL,'02','2023-09-22 12:07:53'),
('default.cash','600001',NULL,'02','2023-09-22 12:07:53'),
('default.currency','MMK',NULL,'0010010','2023-06-12 08:15:38'),
('default.currency','MMK',NULL,'02','2023-09-22 12:07:53'),
('default.department','006-0002',NULL,'0010010','2023-09-24 10:03:36'),
('default.department','0001',NULL,'02','2023-09-22 12:07:53'),
('default.location','031-0001',NULL,'0010010','2023-06-12 08:15:38'),
('default.location','0001',NULL,'02','2023-09-22 12:07:53'),
('department.option','true',NULL,'0010010','2023-09-23 09:45:15'),
('disable.calculate.sale.stock','false',NULL,'0010010','2023-06-12 08:15:38'),
('disable.department','false',NULL,'0010010','2023-06-12 08:15:38'),
('divider','108',NULL,'0010010','2023-07-22 11:46:50'),
('expense.account','007',NULL,'0010010','2023-06-12 08:15:38'),
('expense.account','05',NULL,'02','2023-09-22 12:07:53'),
('fixed.account','001',NULL,'0010010','2023-06-12 08:15:38'),
('fixed.account','01',NULL,'02','2023-09-22 12:07:53'),
('income.account','004',NULL,'0010010','2023-06-12 08:15:38'),
('income.account','04',NULL,'02','2023-09-22 12:07:53'),
('inventory.group','D-00006',NULL,'0010010','2023-06-12 08:15:38'),
('inventory.group','602',NULL,'02','2023-09-22 12:07:53'),
('liability.account','008',NULL,'0010010','2023-06-12 08:15:38'),
('liability.account','03',NULL,'02','2023-09-22 12:07:53'),
('otherincome.account','005',NULL,'0010010','2023-06-12 08:15:38'),
('otherincome.account','08',NULL,'02','2023-09-22 12:07:53'),
('printer.name','Canon LBP3010/LBP3018/LBP3050(2)',NULL,'0010010','2023-06-12 08:15:38'),
('printer.print','1',NULL,'0010010','2023-06-12 08:15:38'),
('purchase.account','006',NULL,'0010010','2023-06-12 08:15:38'),
('purchase.account','07',NULL,'02','2023-09-22 12:07:53'),
('purchase.batch.detail','false',NULL,'0010010','2023-06-12 08:15:38'),
('purchase.show.expense','false',NULL,'0010010','2023-06-12 08:15:38'),
('purchase.show.expense','true',NULL,'02','2023-09-25 10:10:49'),
('purchase.show.grn','false',NULL,'0010010','2023-06-12 08:15:38'),
('purchase.voucher.edit','false',NULL,'0010010','2023-06-12 08:15:38'),
('report.path','C:\\CoreValue\\services\\core-inventory\\font\\Zawgyi-One.ttf',NULL,'0010010','2023-06-12 08:15:38'),
('report.purchase.voucher','PurchaseVoucher(KPS)',NULL,'0010010','2023-06-12 08:15:38'),
('report.sale.A4','SaleVoucherA4',NULL,'0010010','2023-06-12 08:15:38'),
('report.sale.A5','SaleVoucherA5(KPS)',NULL,'0010010','2023-06-12 08:15:38'),
('report.sale.voucher','SaleVoucherPrinter',NULL,'0010010','2023-06-12 08:15:38'),
('sale.price.change','true',NULL,'02','2023-09-22 12:07:53'),
('stock.use.weight','true',NULL,'0010010','2023-06-12 08:15:38'),
('supplier.account','D-00056',NULL,'0010010','2023-06-12 08:15:38'),
('trader.balance','0',NULL,'0010010','2023-06-12 08:15:38'),
('unit.relation','true',NULL,'02','2023-09-22 12:07:53');
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
(32,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIvOWxqbDcyMy9jbmNtYzAwMDFlMDAzZC8iLCJhdXRoIjoiUk9MRV9VU0VSIiwiaWF0IjoxNjk1OTgxNzcxLCJleHAiOjE2OTg1NzM3NzF9.YGPNJuvdeIT_vGtvxv1LVhDe4dqyapkPe4pA1FxextM','BEARER'),
(33,'\0','\0','eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJsMWhmOWI4MGJqdiIsImF1dGgiOiJST0xFX1VTRVIiLCJpYXQiOjE2OTYwODEyOTIsImV4cCI6MTY5ODY3MzI5Mn0.tzZzZ2MYrvEP_Lez9--N64bFWnfHEMywiEWP09LkZ4g','BEARER');
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cv_user_kps'
--

--
-- Dumping routines for database 'cv_user_kps'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-01  2:15:00
