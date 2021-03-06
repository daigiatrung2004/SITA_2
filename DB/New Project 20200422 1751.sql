-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.28-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema managementhotel
--

CREATE DATABASE IF NOT EXISTS managementhotel;
USE managementhotel;

--
-- Definition of table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `ANNOUNCE_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CONTENT` longtext COLLATE utf8mb4_unicode_ci,
  `employee_id` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `STATUS` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMARK` longtext COLLATE utf8mb4_unicode_ci,
  `DATE_POST` datetime DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ANNOUNCE_ID`),
  KEY `fk_employee_annoucement` (`employee_id`),
  CONSTRAINT `fk_employee_annoucement` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcement`
--

/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` (`ANNOUNCE_ID`,`TITLE`,`CONTENT`,`employee_id`,`STATUS`,`REMARK`,`DATE_POST`) VALUES 
 (3,'Thông báo test','<p>sadfasfsfdsadfasfs asdfasdfasfasfsaf</p>',1,'Active','','2020-04-21 00:00:00'),
 (4,'Thông báo test','<p>ASDFASFASDFASDFASDFASF ASDFASDFASDFASFDADF</p>',1,'Active','','2020-04-21 00:00:00');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;


--
-- Definition of table `announcement_employee`
--

DROP TABLE IF EXISTS `announcement_employee`;
CREATE TABLE `announcement_employee` (
  `employee_id` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `ANNOUNCE_ID` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `STATUS_READ_UNREAD` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`employee_id`,`ANNOUNCE_ID`),
  KEY `fk_announce` (`ANNOUNCE_ID`),
  CONSTRAINT `fk_announce` FOREIGN KEY (`ANNOUNCE_ID`) REFERENCES `announcement` (`ANNOUNCE_ID`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `announcement_employee`
--

/*!40000 ALTER TABLE `announcement_employee` DISABLE KEYS */;
INSERT INTO `announcement_employee` (`employee_id`,`ANNOUNCE_ID`,`STATUS_READ_UNREAD`) VALUES 
 (2,3,'read'),
 (2,4,'read'),
 (6,3,'unread'),
 (6,4,'unread');
/*!40000 ALTER TABLE `announcement_employee` ENABLE KEYS */;


--
-- Definition of table `booking`
--

DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `booking_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `customer_id` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `start_booking_date` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `check_in_date` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `check_out_date` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `kind_room_id` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `region_id` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `room_id` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(12) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` varchar(1000) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `code_booking` longtext NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`booking_id`),
  KEY `fk_booking_kind` (`kind_room_id`),
  KEY `fk_booking_customer` (`customer_id`),
  KEY `fk_booking_region` (`region_id`),
  KEY `fk_booking_room` (`room_id`),
  CONSTRAINT `fk_booking_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_booking_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`),
  CONSTRAINT `fk_booking_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`),
  CONSTRAINT `fk_booking_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`booking_id`,`customer_id`,`start_booking_date`,`check_in_date`,`check_out_date`,`kind_room_id`,`region_id`,`room_id`,`status`,`remark`,`code_booking`) VALUES 
 (8,25,'2020-03-26 00:00:00','2020-03-26 14:00:00','2020-04-26 12:00:00',2,11,7,'Active','','pqi+hbMvjZdtE5OyTIcuvg=='),
 (9,26,'2020-04-04 16:52:01','2020-04-04 16:52:01','2020-05-04 14:00:00',2,11,8,'Removed','','customer499217158'),
 (10,27,'2020-04-04 16:56:49','2020-04-04 16:56:49','2020-05-04 14:00:00',2,11,8,'Active','','customer1369223056'),
 (11,42,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,9,'Active','','2zOA/SYy7z0yjst9Dl0ybg=='),
 (12,43,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,13,'Removed','','kKpI/7EdC9mMgXB1/5EdQQ=='),
 (13,44,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,12,'Active','','AsOyw8u7I0wyJVfWaiQF/w=='),
 (14,45,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,14,'Active','','xSF5tsPZM6QemP8rNVaf7Q=='),
 (15,46,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,16,'Active','','45Ix8VRE9oiymoePqnFseg==');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;


--
-- Definition of table `booking_product`
--

DROP TABLE IF EXISTS `booking_product`;
CREATE TABLE `booking_product` (
  `ID` int(11) NOT NULL,
  `booking_id` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `amount` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `pay` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`,`booking_id`) ,
  KEY `fk_booking_product` (`booking_id`),
  CONSTRAINT `fk_booking_product` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  CONSTRAINT `fk_product_booking` FOREIGN KEY (`ID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_product`
--

/*!40000 ALTER TABLE `booking_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_product` ENABLE KEYS */;


--
-- Definition of table `categoryproduct`
--

DROP TABLE IF EXISTS `categoryproduct`;
CREATE TABLE `categoryproduct` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8  NOT NULL,
  `status` varchar(100) CHARACTER SET utf8  NOT NULL,
  `remark` longtext CHARACTER SET utf8 ,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoryproduct`
--

/*!40000 ALTER TABLE `categoryproduct` DISABLE KEYS */;
INSERT INTO `categoryproduct` (`cate_id`,`name`,`status`,`remark`) VALUES 
 (8,'ThÆ°Ì£c phÃ¢Ìm','Active',''),
 (9,'ThiÃªÌt biÌ£ ','Active','');
/*!40000 ALTER TABLE `categoryproduct` ENABLE KEYS */;


--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL COLLATE utf8mb4_unicode_ci,
  `sankey` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `encryptpass` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `start_date` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `contact_person` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  `verify_person` varchar(12) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(12) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  `firstname` varchar(45) NOT NULL COLLATE utf8mb4_unicode_ci,
  `lastname` varchar(45) NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`,`email`,`sankey`,`encryptpass`,`start_date`,`contact_person`,`verify_person`,`status`,`remark`,`firstname`,`lastname`) VALUES 
 (25,'vuyeuai_007@yahoo.com','874531394','pqi+hbMvjZdtE5OyTIcuvg==','2020-03-26 00:00:00','2688659','025727433','Active','','dao','vu'),
 (26,'vuyeuai_007@yahoo.com','1076105111','SeqoGeuW8IcSQMB3RUGm3D3L6pTLbz01QGrEcPTh1Hk=','2020-04-04 16:52:01','0932688659','025727433','Active','','vÅ©','ÄaÌo'),
 (27,'51603379@gmail.com','39052044','IBlZfTQ6uEo04Ltg10UD6ZGGTZT49OWGHwmZe16ZQ0M=','2020-04-04 16:56:49','0932688659','025727433','Active','','vÅ©','ÄaÌo'),
 (28,'','1986208517','5N1XJis/1RIubgQVwEKBZA==','2020-04-07 00:00:00','','','Active','','',''),
 (29,'','1436757274','l81YXRChz1CSdW3184a4DQ==','2020-04-07 00:00:00','','','Active','','',''),
 (30,'','1170614559','5CRufWbRJBUXr23jvX0LLQ==','2020-04-07 00:00:00','','','Active','','',''),
 (31,'','404582103','nHs7ztahDF8EcLeNd9uyhg==','2020-04-07 00:00:00','','','Active','','',''),
 (32,'','1884652160','uZMafFAr0TYBeKTUWcG9NQ==','2020-04-07 00:00:00','','','Active','','',''),
 (33,'','317880003','1cZyOaK3gxZFGNKvL69VXQ==','2020-04-07 00:00:00','','','Active','','',''),
 (34,'','617601910','E/kD3dR8murDEAdwSPfK0Q==','2020-04-07 00:00:00','','','Active','','',''),
 (35,'','1663055413','4GAIQ0+D6f7auhesE2kdRw==','2020-04-08 00:00:00','','','Active','','',''),
 (36,'','627924247','Ij6VZ2kUnkSjKkm+0jRnnw==','2020-04-08 00:00:00','','','Active','','',''),
 (37,'','1522705955','zRE3YYqs2xOTqKo3oFnmyQ==','2020-04-08 00:00:00','','','Active','','',''),
 (38,'','531502584','7tyHdybB8fMHXtGLsE+RzA==','2020-04-08 00:00:00','','','Active','','',''),
 (39,'','362632719','V/S9kK2NFtg8/5hcwK/dxQ==','2020-04-08 00:00:00','','','Active','','',''),
 (40,'','1322168651','NVBmWMMy/NOSNT8UaXGnmA==','2020-04-08 00:00:00','','','Active','','',''),
 (41,'','234179717','h7THy/BNmDQZ3tuj4kcpzQ==','2020-04-09 00:00:00','','','Active','','',''),
 (42,'vuyeuai_007@yahoo.com','668506587','2zOA/SYy7z0yjst9Dl0ybg==','2020-04-09 00:00:00','2688659','025727433','Active','','ao','Vy'),
 (43,'vuyeuai_007@yahoo.com','1008778669','kKpI/7EdC9mMgXB1/5EdQQ==','2020-04-09 00:00:00','2688659','025727433','Active','','ao','Vy'),
 (44,'vuyeuai_007@yahoo.com','412891904','AsOyw8u7I0wyJVfWaiQF/w==','2020-04-09 00:00:00','2688659','025727433','Active','','ao','vy'),
 (45,'vuyeuai_007@yahoo.com','445523992','xSF5tsPZM6QemP8rNVaf7Q==','2020-04-09 00:00:00','2688659','025727433','Active','','ao','Vy'),
 (46,'vuyeuai_007@yahoo.com','1550545215','45Ix8VRE9oiymoePqnFseg==','2020-04-09 00:00:00','2688659','025727433','Active','','dAO02','vY');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position_employee_id` bigint(20) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `loginname` varchar(255) NOT NULL COLLATE utf8mb4_unicode_ci,
  `sankey` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `encryptpass` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `start_date` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `address` longtext NOT NULL COLLATE utf8mb4_unicode_ci,
  `country` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `contact_person` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  `contact_email` longtext NOT NULL COLLATE utf8mb4_unicode_ci,
  `salary` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(12) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  `last_login` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `first_name` varchar(100) NOT NULL DEFAULT '""' COLLATE utf8mb4_unicode_ci,
  `last_name` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  `region_id` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_employee_meta` (`position_employee_id`),
  KEY `fk_employee_region` (`region_id`),
  CONSTRAINT `fk_employee_employee_meta` FOREIGN KEY (`position_employee_id`) REFERENCES `postion_employee` (`position_employee_id`),
  CONSTRAINT `fk_employee_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`,`position_employee_id`,`loginname`,`sankey`,`encryptpass`,`start_date`,`address`,`country`,`contact_person`,`contact_email`,`salary`,`status`,`remark`,`ipAddress`,`last_login`,`first_name`,`last_name`,`region_id`) VALUES 
 (1,1,'admin','1568394738','qgL+XJelKMRK+cm8pCWBng==','2020-03-01 16:52:45','536/43/56','quÃ¢Ì£n tÃ¢n biÌnh','0932688659','vuyeuai_007@yahoo.com',8000000,'Active','','192.168.1.29','2020-03-01 16:52:45','Đào','Anh Vũ',11),
 (2,22,'51603379@gmail.com','1568394738','whR50ELiSOViOQ3nNw8KBQ==','2020-03-05 06:27:21','536/43/56','Quận Tân Bình','0932688659','vuyeuai_007@yahoo.com',8000000000,'Active','','0:0:0:0:0:0:0:1','2020-03-05 06:27:21','vũ 1','Đào',11),
 (6,1,'test','1568394738','9185A3Df5xrZM7PbMdUpOQ==','2020-03-30 12:08:14','536/43/56','Hồ Chí minh','0932688659','vuyeuai_007@yahoo.com',1000000000,'Active','','0:0:0:0:0:0:0:1','2020-03-30 12:08:14','','',11);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
CREATE TABLE `furniture` (
  `id_furniture` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `name_en` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `type` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `price` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `details` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(100) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `remark` varchar(100) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `type_en` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_furniture`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `furniture`
--

/*!40000 ALTER TABLE `furniture` DISABLE KEYS */;
INSERT INTO `furniture` (`id_furniture`,`name_vi`,`name_en`,`type`,`price`,`details`,`status`,`remark`,`type_en`) VALUES 
 (1,'Tủ lạnh sony','Sony fridge','kg',1500000,'            ','Active','','kg'),
 (2,'sdfsadfasdfafd','asdfasdfsafdafd','sadfs',100000000,'            ','Active','','asdfasfd'),
 (3,'asdfasfdasdf asdfasd','vũ','asdfasdfasfd',10000000,'<p>asdfasfdsafasfasfasfdasfsfdasfd</p>','Active','','asdfsafsafaf');
/*!40000 ALTER TABLE `furniture` ENABLE KEYS */;


--
-- Definition of table `furniture_kind_room`
--

DROP TABLE IF EXISTS `furniture_kind_room`;
CREATE TABLE `furniture_kind_room` (
  `id_furniture_room` int(11) NOT NULL AUTO_INCREMENT,
  `id_furniture` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `kind_room_id` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_furniture_room`),
  KEY `fk_furniture` (`id_furniture`),
  KEY `fk_kind_furniture` (`kind_room_id`),
  CONSTRAINT `fk_furniture` FOREIGN KEY (`id_furniture`) REFERENCES `furniture` (`id_furniture`),
  CONSTRAINT `fk_kind_furniture` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `furniture_kind_room`
--

/*!40000 ALTER TABLE `furniture_kind_room` DISABLE KEYS */;
INSERT INTO `furniture_kind_room` (`id_furniture_room`,`id_furniture`,`kind_room_id`,`status`) VALUES 
 (5,1,2,'Active'),
 (6,2,2,'Active'),
 (7,3,2,'Active');
/*!40000 ALTER TABLE `furniture_kind_room` ENABLE KEYS */;


--
-- Definition of table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `invoice_id` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `booking_id` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `customer_id` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `room_id` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `tongtiensanpham` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `tongtien` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;


--
-- Definition of table `kind_room`
--

DROP TABLE IF EXISTS `kind_room`;
CREATE TABLE `kind_room` (
  `kind_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `name_en` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(12) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`kind_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kind_room`
--

/*!40000 ALTER TABLE `kind_room` DISABLE KEYS */;
INSERT INTO `kind_room` (`kind_room_id`,`name_vi`,`name_en`,`status`,`remark`) VALUES 
 (2,'Nhìn ra vườn','Garden-View-Bungalow','Active','');
/*!40000 ALTER TABLE `kind_room` ENABLE KEYS */;


--
-- Definition of table `other_fees`
--

DROP TABLE IF EXISTS `other_fees`;
CREATE TABLE `other_fees` (
  `id_fees` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `name_en` varchar(200) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `price` bigint(20) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` longtext NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id_fees`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `other_fees`
--

/*!40000 ALTER TABLE `other_fees` DISABLE KEYS */;
INSERT INTO `other_fees` (`id_fees`,`name_vi`,`name_en`,`price`,`status`,`remark`) VALUES 
 (1,'Phí dịch vụ','Service charge',162000,'Active',''),
 (2,'xdfxdsfd dfd','fdfxdxfxd xdfxdf',0,'Active',''),
 (3,'asdfasfdasd asfasd','asdfasffdsasdf asdfasfasf',0,'Active',''),
 (4,'asdfasfasf asdfasdf','asfasfasdffd',0,'Active','');
/*!40000 ALTER TABLE `other_fees` ENABLE KEYS */;


--
-- Definition of table `paypment_order`
--

DROP TABLE IF EXISTS `paypment_order`;
CREATE TABLE `paypment_order` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PAYEE_ID` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `BILLING_INFO` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `MERCHANT_ID` varchar(64) NOT NULL COLLATE utf8mb4_unicode_ci,
  `TRANSACTION_NO` varchar(100) NOT NULL COLLATE utf8mb4_unicode_ci,
  `TRANSACTION_DATE` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `RETURN_CODE` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `AMOUNT` bigint(20) NOT NULL COLLATE utf8mb4_unicode_ci,
  `CURRENCY` varchar(12) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `PAYPAL_TXN_ID` varchar(100) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `PAYPAL_TXN_FEE` varchar(12) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `PAYPAL_RECEIPT_NO` varchar(100) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `REMARK` varchar(200) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `STATUS` varchar(12) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `PAYEE_INFO` varchar(200) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `PURCHASE_INFO` varchar(200) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `GEN_MSG_KEY` varchar(300) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `RETURN_MSG_KEY` varchar(300) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  `PAYMENT_TYPE` varchar(45) DEFAULT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paypment_order`
--

/*!40000 ALTER TABLE `paypment_order` DISABLE KEYS */;
INSERT INTO `paypment_order` (`ID`,`PAYEE_ID`,`BILLING_INFO`,`MERCHANT_ID`,`TRANSACTION_NO`,`TRANSACTION_DATE`,`RETURN_CODE`,`AMOUNT`,`CURRENCY`,`PAYPAL_TXN_ID`,`PAYPAL_TXN_FEE`,`PAYPAL_RECEIPT_NO`,`REMARK`,`STATUS`,`PAYEE_INFO`,`PURCHASE_INFO`,`GEN_MSG_KEY`,`RETURN_MSG_KEY`,`PAYMENT_TYPE`) VALUES 
 (1,0,'','','','2020-04-09 07:48:04',0,162900,'VNĐ','','','','','','','','','','paypal');
/*!40000 ALTER TABLE `paypment_order` ENABLE KEYS */;


--
-- Definition of table `postion_employee`
--

DROP TABLE IF EXISTS `postion_employee`;
CREATE TABLE `postion_employee` (
  `position_employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(12) NOT NULL COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`position_employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `postion_employee`
--

/*!40000 ALTER TABLE `postion_employee` DISABLE KEYS */;
INSERT INTO `postion_employee` (`position_employee_id`,`name`,`status`) VALUES 
 (1,'Content Management System','Active'),
 (22,'Nhân Viên Sale','Active');
/*!40000 ALTER TABLE `postion_employee` ENABLE KEYS */;


--
-- Definition of table `pr`
--

DROP TABLE IF EXISTS `pr`;
CREATE TABLE `pr` (
  `pr_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL COLLATE utf8mb4_unicode_ci,
  `start_date` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `end_date` datetime NOT NULL COLLATE utf8mb4_unicode_ci,
  `promount` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`pr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pr`
--

/*!40000 ALTER TABLE `pr` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr` ENABLE KEYS */;


--
-- Definition of table `price_room`
--

DROP TABLE IF EXISTS `price_room`;
CREATE TABLE `price_room` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_price_room_vi` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `type_price_room_en` varchar(200) NOT NULL COLLATE utf8mb4_unicode_ci,
  `price_1_night` bigint(20) NOT NULL DEFAULT '0' COLLATE utf8mb4_unicode_ci,
  `kind_room_id` int(11) NOT NULL COLLATE utf8mb4_unicode_ci,
  `status` varchar(12) NOT NULL COLLATE utf8mb4_unicode_ci,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`price_id`),
  KEY `fk_price_kind` (`kind_room_id`),
  CONSTRAINT `fk_price_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_room`
--

/*!40000 ALTER TABLE `price_room` DISABLE KEYS */;
INSERT INTO `price_room` (`price_id`,`type_price_room_vi`,`type_price_room_en`,`price_1_night`,`kind_room_id`,`status`,`remark`) VALUES 
 (3,'Thanh toán online','Online Exclusive Rate',1000,2,'Active',''),
 (4,'Tỉ lệ tiêu chuẩn','Standard Rate',1000000,2,'Active','');
/*!40000 ALTER TABLE `price_room` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) CHARACTER SET utf8 NOT NULL ,
  `DESCRIPTION` longtext CHARACTER SET utf8,
  `FILE_IMG_URL` longtext CHARACTER SET utf8,
  `STATUS` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `REMARK` longtext CHARACTER SET utf8,
  `PRICE` bigint(20) DEFAULT NULL,
  `UNIT` varchar(100) CHARACTER SET utf8 NOT NULL,
  `AMOUNT` int(11) ,
  `cate_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_CATE` (`cate_id`),
  KEY `FK_REGION_PRODUCT` (`region_id`),
  CONSTRAINT `FK_PRODUCT_CATE` FOREIGN KEY (`cate_id`) REFERENCES `categoryproduct` (`cate_id`),
  CONSTRAINT `FK_REGION_PRODUCT` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;


--
-- Definition of table `promote`
--

DROP TABLE IF EXISTS `promote`;
CREATE TABLE `promote` (
  `promote_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(200) DEFAULT NULL,
  `pro_value` varchar(200) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `remark` longtext,
  `expired_date` datetime NOT NULL,
  PRIMARY KEY (`promote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promote`
--

/*!40000 ALTER TABLE `promote` DISABLE KEYS */;
INSERT INTO `promote` (`promote_id`,`pro_code`,`pro_value`,`status`,`remark`,`expired_date`) VALUES 
 (1,'code_default','10','Active','','2021-03-31 00:00:00'),
 (2,'asdss','10','Active','','2020-03-27 00:00:00');
/*!40000 ALTER TABLE `promote` ENABLE KEYS */;


--
-- Definition of table `promote_price`
--

DROP TABLE IF EXISTS `promote_price`;
CREATE TABLE `promote_price` (
  `id_promote_price` bigint(20) NOT NULL AUTO_INCREMENT,
  `promote_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  PRIMARY KEY (`id_promote_price`),
  KEY `fk_promote_price` (`price_id`),
  KEY `fk_promote` (`promote_id`),
  CONSTRAINT `fk_promote` FOREIGN KEY (`promote_id`) REFERENCES `promote` (`promote_id`),
  CONSTRAINT `fk_promote_price` FOREIGN KEY (`price_id`) REFERENCES `price_room` (`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promote_price`
--

/*!40000 ALTER TABLE `promote_price` DISABLE KEYS */;
INSERT INTO `promote_price` (`id_promote_price`,`promote_id`,`price_id`) VALUES 
 (1,1,3);
/*!40000 ALTER TABLE `promote_price` ENABLE KEYS */;


--
-- Definition of table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) CHARACTER SET utf8 NOT NULL,
  `name_en` varchar(200) CHARACTER SET utf8 NOT NULL,
  `status` varchar(12) CHARACTER SET utf8 NOT NULL,
  `remark` longtext CHARACTER SET utf8,
  `file_url_img` longtext CHARACTER SET utf8 NOT NULL,
  `Address` longtext CHARACTER SET utf8 NOT NULL,
  `contact_phone` varchar(45) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`region_id`,`name_vi`,`name_en`,`status`,`remark`,`file_url_img`,`Address`,`contact_phone`) VALUES 
 (11,'Khu nghỉ dưỡng khách sạn Phan Thiết','Victoria Phan Thiet beach resort','Active','','','asdfasdfasfasfd','+0932688566'),
 (12,'asdfasdfsadf','asdfasfasfasf','Active','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1385053442_img_region.png','asdfasdfasfasfd','+0932688566'),
 (13,'Khách sạn Victoria Châu Đốc','Hotel Chau Doc','Active','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\504527829_img_region.png','asdfasdfasfasfd','+0932688566'),
 (14,'Khu nghỉ dưỡng & spa Victoria Sapa','Resort & Hotel Sapa','Active','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1755273410_img_region.png','asdfasdfasfasfd','+0932688566'),
 (15,'Victoria Xiengthong Palace','Victoria Xiengthong Palace','Active','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\975489678_img_region.png','Kounxoau Road, Ban Phonehueng, Luang Prabang, Laos, , Luang Prabang, Lào','+0932688566');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;


--
-- Definition of table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `kind_room_id` int(11)  NOT NULL,
  `region_id` int(11)  NOT NULL,
  `price_id` int(11) NOT NULL,
  `status` varchar(12) CHARACTER SET utf8 NOT NULL,
  `remark` varchar(1000) ,
  `max_peopel` int(10) unsigned NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_room_kind` (`kind_room_id`),
  KEY `fk_room_region` (`region_id`),
  KEY `fk_room_price` (`price_id`),
  CONSTRAINT `fk_room_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`),
  CONSTRAINT `fk_room_price` FOREIGN KEY (`price_id`) REFERENCES `price_room` (`price_id`),
  CONSTRAINT `fk_room_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_id`,`name`,`kind_room_id`,`region_id`,`price_id`,`status`,`remark`,`max_peopel`) VALUES 
 (7,'vũ',2,11,3,'Completed','',4),
 (8,'vũ',2,11,3,'Completed','',4),
 (9,'vũ',2,11,3,'Completed','',4),
 (10,'vũ',2,11,3,'Completed','',4),
 (11,'vũ',2,11,3,'Completed','',4),
 (12,'vũ',2,11,3,'Completed','',4),
 (13,'vũ',2,11,3,'Completed','',4),
 (14,'vũ',2,11,3,'Completed','',4),
 (15,'vũ',2,11,3,'Completed','',4),
 (16,'vũ',2,11,3,'Completed','',4),
 (17,'11',2,11,3,'Active','',2);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;


--
-- Definition of table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `service_name_vi` varchar(200)  NOT NULL,
  `servict_name_en` varchar(200)  NOT NULL,
  `file_img_url` longtext  NOT NULL,
  `service_details_vi` longtext  NOT NULL,
  `service_details_en` longtext  NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext ,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service`
--

/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` (`id_service`,`service_name_vi`,`servict_name_en`,`file_img_url`,`service_details_vi`,`service_details_en`,`status`,`remark`) VALUES 
 (3,'Bao gồm bữa sáng','Breakfast included','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-449185626_img_icon_service.png','Free breakfast\n        ','Miễn phí bữa sáng\n        ','Active',''),
 (4,'Không thể hủy và thay đổi','Non-cancellable, non modifiable','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-1451322165_img_icon_service.png','In case of no-show, a penalty of 100% will apply.\n        ','Nếu quý khách không đến, mức phạt 100% sẽ được áp dụng.\n        ','Active',''),
 (5,'Thanh toán ngay','Pay now','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\1841335556_img_icon_service.png','The full amount of the reservation will be charged on your credit card shortly after your booking is confirmed.\n        ','Toàn bộ chi phí đặt phòng sẽ được khấu trừ vào thẻ tín dụng của quý khách ngay sau khi đặt phòng được xác nhận.\n        ','Active',''),
 (6,'Thanh toán sau','Pay later','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-991011255_img_icon_service.png','Full payment will be done at the hotel.\n        ','Quý khách sẽ thanh toán toàn bộ tại khách sạn.\n        ','Active',''),
 (7,'asdfasdfsafd','sdafasfd','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-1179528898_img_icon_service.png','<p>asdfasfasdfasfsafdsfad</p>','<p>sdfasfdasfdasffsdasdfdafs</p>','Active','');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;


--
-- Definition of table `service_room`
--

DROP TABLE IF EXISTS `service_room`;
CREATE TABLE `service_room` (
  `id_service_room` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_service` int(11) NOT NULL,
  `price_id` int(11)  NOT NULL,
  PRIMARY KEY (`id_service_room`),
  KEY `fk_service_room` (`id_service`),
  KEY `fk_service_price` (`price_id`),
  CONSTRAINT `fk_service_price` FOREIGN KEY (`price_id`) REFERENCES `price_room` (`price_id`),
  CONSTRAINT `fk_service_room` FOREIGN KEY (`id_service`) REFERENCES `service` (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service_room`
--

/*!40000 ALTER TABLE `service_room` DISABLE KEYS */;
INSERT INTO `service_room` (`id_service_room`,`id_service`,`price_id`) VALUES 
 (1,3,3),
 (2,4,3),
 (3,5,3),
 (4,3,4),
 (5,4,4),
 (6,6,4);
/*!40000 ALTER TABLE `service_room` ENABLE KEYS */;


--
-- Definition of table `sys_meta`
--

DROP TABLE IF EXISTS `sys_meta`;
CREATE TABLE `sys_meta` (
  `sys_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(200) CHARACTER SET utf8 NOT NULL,
  `ip_Address` longtext  NOT NULL,
  `type` varchar(200)  NOT NULL,
  `meta_value` varchar(200) CHARACTER SET utf8 NOT NULL,
  `date_update` datetime  NOT NULL,
  PRIMARY KEY (`sys_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_meta`
--

/*!40000 ALTER TABLE `sys_meta` DISABLE KEYS */;
INSERT INTO `sys_meta` (`sys_id`,`meta_key`,`ip_Address`,`type`,`meta_value`,`date_update`) VALUES 
 (1,'customer_view','192.168.1.28','views','1','2020-04-21 13:23:40'),
 (2,'customer_view','127.0.0.1','views','1','2020-04-21 13:25:13'),
 (3,'customer_view','127.0.0.1','views','1','2020-04-22 16:27:06'),
 (4,'customer_view','192.168.1.28','views','1','2020-04-22 16:27:12');
/*!40000 ALTER TABLE `sys_meta` ENABLE KEYS */;


--
-- Definition of table `trans_booking`
--

DROP TABLE IF EXISTS `trans_booking`;
CREATE TABLE `trans_booking` (
  `id_trans_booking` bigint(20) NOT NULL AUTO_INCREMENT,
  `transport_id` bigint(20)  NOT NULL,
  `booking_id` bigint(20)  NOT NULL,
  PRIMARY KEY (`id_trans_booking`),
  KEY `fk_booking_trns` (`transport_id`),
  KEY `fk_booking` (`booking_id`),
  CONSTRAINT `fk_booking` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  CONSTRAINT `fk_booking_trns` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trans_booking`
--

/*!40000 ALTER TABLE `trans_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `trans_booking` ENABLE KEYS */;


--
-- Definition of table `transport`
--

DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `transport_id` bigint(20)  NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) CHARACTER SET utf8 NOT NULL,
  `name_en` varchar(200) CHARACTER SET utf8 NOT NULL,
  `details_vi` longtext  NOT NULL,
  `details_en` longtext  NOT NULL,
  `price` bigint(20)  NOT NULL,
  `status` varchar(100) CHARACTER SET utf8 NOT NULL,
  `remark` longtext  NOT NULL,
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport`
--

/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` (`transport_id`,`name_vi`,`name_en`,`details_vi`,`details_en`,`price`,`status`,`remark`) VALUES 
 (5,'Xe riêng từ khu nghỉ dưỡng đến sân bay Tân Sơn Nhất / trung tâm thành phố TP.HCM','Private car from Resort to Tan Son Nhat airport / HCMC downtown','Xe riêng - Khoảng cách 200km - Thời gian 4 giờ - Giá: 3.118.500 đồng / xe / chiều - Tối đa 04 người','Private vehicle - Distance 200km - Duration 4 hours - Price: VND 3,118,500/ vehicle/ way - Maximum 04 persons',275000,'Active',''),
 (6,'Xe riêng từ sân bay Tân Sơn Nhất / trung tâm thành phố TP.HCM đến Resort','Private car from Tan Son Nhat airport / HCMC downtown to Resort','Xe riêng - Khoảng cách 200km - Thời gian 4 giờ - Giá: 3.118.500 đồng / xe / chiều - Tối đa 04 người','Private vehicle - Distance 200km - Duration 4 hours - Price: VND 3,118,500/ vehicle/ way - Maximum 04 persons',275000,'Active',''),
 (7,'vũ','vũ','h','h',0,'Active',''),
 (8,'asfasfd asdfasdf','asdfasfdsdfa sadfasdf','asdfasfasfasdf','asdfasfdasfdasfdasfasdf',10000000,'Active',''),
 (9,'vũasdfasf','vũ','asdfasf','asfasf',4646456456,'Active',''),
 (10,'Private car from Phu Bai airport/Hue city to Resort','Private car from Phu Bai airport/Hue city to Resort','','<p><span style=\"color: ',0,'Active','');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;


--
-- Definition of table `transport_region`
--

DROP TABLE IF EXISTS `transport_region`;
CREATE TABLE `transport_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transport_id` bigint(20)  NOT NULL,
  `region_id` int(11)  NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trns_region` (`region_id`),
  KEY `fk_trns_trans` (`transport_id`),
  CONSTRAINT `fk_trns_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`),
  CONSTRAINT `fk_trns_trans` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport_region`
--

/*!40000 ALTER TABLE `transport_region` DISABLE KEYS */;
INSERT INTO `transport_region` (`id`,`transport_id`,`region_id`) VALUES 
 (1,5,11),
 (2,6,11);
/*!40000 ALTER TABLE `transport_region` ENABLE KEYS */;


--
-- Definition of table `upload_resource`
--

DROP TABLE IF EXISTS `upload_resource`;
CREATE TABLE `upload_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `Original_filename` varchar(200) CHARACTER SET utf8 NOT NULL,
  `File_url` varchar(500) CHARACTER SET utf8 NOT NULL,
  `Parent_table` varchar(45) CHARACTER SET utf8 NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(12) CHARACTER SET utf8 NOT NULL,
  `remark` longtext CHARACTER SET utf8,
  `File_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload_resource`
--

/*!40000 ALTER TABLE `upload_resource` DISABLE KEYS */;
INSERT INTO `upload_resource` (`id`,`Original_filename`,`File_url`,`Parent_table`,`Created_date`,`status`,`remark`,`File_type`) VALUES 
 (1,'423c534d84d060e12cdc19ba2f78bf4b-w704-scale.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\599447649_img_Uploaded_zoom.png','kind_room_2','2020-03-24 00:00:00','Active','','jpg'),
 (2,'b4209857280ac0d8f9b3c401b9426a2e-w704-scale.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\859536170_img_Uploaded_zoom.png','kind_room_2','2020-03-24 00:00:00','Active','','jpg'),
 (3,'caa8c196f48e17bc9b580b9e1c7d2808-w704-scale.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1770574455_img_Uploaded_zoom.png','kind_room_2','2020-03-24 00:00:00','Active','','jpg');
/*!40000 ALTER TABLE `upload_resource` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
