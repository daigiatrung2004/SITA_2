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
  `employee_id` bigint(20) NOT NULL,
  `STATUS` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMARK` longtext COLLATE utf8mb4_unicode_ci,
  `DATE_POST` datetime DEFAULT NULL,
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
  `employee_id` bigint(20) NOT NULL,
  `ANNOUNCE_ID` bigint(20) NOT NULL,
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
  `customer_id` bigint(20) NOT NULL,
  `start_booking_date` datetime NOT NULL,
  `check_in_date` datetime NOT NULL,
  `check_out_date` datetime NOT NULL,
  `kind_room_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_booking` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_booking_kind` (`kind_room_id`),
  KEY `fk_booking_customer` (`customer_id`),
  KEY `fk_booking_region` (`region_id`),
  KEY `fk_booking_room` (`room_id`),
  CONSTRAINT `fk_booking_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_booking_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`),
  CONSTRAINT `fk_booking_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`),
  CONSTRAINT `fk_booking_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`booking_id`,`customer_id`,`start_booking_date`,`check_in_date`,`check_out_date`,`kind_room_id`,`region_id`,`room_id`,`status`,`remark`,`code_booking`) VALUES 
 (8,25,'2020-03-26 00:00:00','2020-03-26 14:00:00','2020-04-26 12:00:00',2,11,7,'Active','','pqi+hbMvjZdtE5OyTIcuvg=='),
 (9,26,'2020-04-04 16:52:01','2020-04-04 16:52:01','2020-05-04 14:00:00',2,11,8,'Removed','','customer499217158'),
 (10,27,'2020-04-04 04:56:49','2020-04-04 04:56:49','2020-05-04 02:00:00',2,11,8,'Remove','','customer1369223056'),
 (11,42,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,9,'Active','','2zOA/SYy7z0yjst9Dl0ybg=='),
 (12,43,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,13,'Removed','','kKpI/7EdC9mMgXB1/5EdQQ=='),
 (13,44,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,12,'Active','','AsOyw8u7I0wyJVfWaiQF/w=='),
 (14,45,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,14,'Active','','xSF5tsPZM6QemP8rNVaf7Q=='),
 (15,46,'2020-04-09 00:00:00','2020-04-09 14:00:00','2020-04-10 12:00:00',2,11,16,'Active','','45Ix8VRE9oiymoePqnFseg=='),
 (16,47,'2020-04-25 00:00:00','2020-04-25 14:00:00','2020-04-26 12:00:00',2,11,17,'Active','','U46fd3g8h6aiR9AmGuSe1Q=='),
 (17,48,'2020-04-25 00:00:00','2020-04-25 14:00:00','2020-04-26 12:00:00',2,13,18,'Active','','o0WGpzPXx2ZQV5VwllpUew=='),
 (18,49,'2020-04-26 00:00:00','2020-04-26 14:00:00','2020-04-27 12:00:00',2,13,19,'Active','','87xtlPiOALL+0xu7tNm0tg==');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;


--
-- Definition of table `booking_product`
--

DROP TABLE IF EXISTS `booking_product`;
CREATE TABLE `booking_product` (
  `ID` int(11) NOT NULL,
  `booking_id` bigint(20) NOT NULL,
  `amount_pr` int(11) NOT NULL,
  `pay` bigint(20) NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`,`booking_id`),
  KEY `fk_booking_product` (`booking_id`),
  CONSTRAINT `fk_booking_product` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  CONSTRAINT `fk_product_booking` FOREIGN KEY (`ID`) REFERENCES `product` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booking_product`
--

/*!40000 ALTER TABLE `booking_product` DISABLE KEYS */;
INSERT INTO `booking_product` (`ID`,`booking_id`,`amount_pr`,`pay`,`status`) VALUES 
 (1,10,5,5000000,'Active');
/*!40000 ALTER TABLE `booking_product` ENABLE KEYS */;


--
-- Definition of table `categoryproduct`
--

DROP TABLE IF EXISTS `categoryproduct`;
CREATE TABLE `categoryproduct` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `status` varchar(100) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categoryproduct`
--

/*!40000 ALTER TABLE `categoryproduct` DISABLE KEYS */;
INSERT INTO `categoryproduct` (`cate_id`,`name`,`status`,`remark`) VALUES 
 (11,'ThÆ°Ì£c phÃ¢Ìm','Active',''),
 (12,'ThiÃªÌt biÌ£ ','Active',''),
 (13,'ThÆ°Ìc Än','Active',''),
 (14,'ThÆ°Ìc uÃ´Ìng','Active','');
/*!40000 ALTER TABLE `categoryproduct` ENABLE KEYS */;


--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sankey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryptpass` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `verify_person` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `firstname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

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
 (46,'vuyeuai_007@yahoo.com','1550545215','45Ix8VRE9oiymoePqnFseg==','2020-04-09 00:00:00','2688659','025727433','Active','','dAO02','vY'),
 (47,'vuyeuai_007@yahoo.com','1310215','U46fd3g8h6aiR9AmGuSe1Q==','2020-04-25 00:00:00','2688659','025727433','Active','','ÄaÌo','VuÌ'),
 (48,'vuyeuai_007@yahoo.com','1911771470','o0WGpzPXx2ZQV5VwllpUew==','2020-04-25 00:00:00','2688659','025727433','Active','','Anh VuÌ','ÄaÌo'),
 (49,'vuyeuai_007@yahoo.com','1638252775','87xtlPiOALL+0xu7tNm0tg==','2020-04-26 00:00:00','2688659','025727433','Active','','ÄaÌo','vuÌ'),
 (50,'vuyeuai_007@yahoo.com','538532616','ceA7kHmr81NJu+MhiRxdOg==','2020-04-26 00:00:00','2688659','025727433','Active','','Anh ','ÄaÌo '),
 (51,'daoanhvu19284673502@gmail.com','1369335745','Ex0UlVplNhSDDAR9QxJ5UQ==','2020-04-26 00:00:00','2688659','025727433','Active','','TÃªn','ÄaÌo'),
 (52,'daoanhvu19284673502@gmail.com','1677621318','+5wSM2oF+0TTLDdnHhsbig==','2020-04-26 00:00:00','2688659','025727433','Active','','Anh','ÄaÌo'),
 (53,'daoanhvu19284673502@gmail.com','708990104','/3gxYaHzbQMuIu1n1SgQjQ==','2020-04-26 00:00:00','2688659','025727433','Active','','Anh','ÄaÌo'),
 (54,'daoanhvu19284673502@gmail.com','1723140288','WNXMvgkeuqJEYdXdATbrNw==','2020-04-26 00:00:00','2688659','025727433','Active','','Anh','ÄaÌo'),
 (55,'daoanhvu19284673502@gmail.com','651536218','QSCAiezUu7s0GYrkX8qkTQ==','2020-04-26 00:00:00','2688659','025727433','Active','','ÄaÌo','VuÌ');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position_employee_id` bigint(20) DEFAULT NULL,
  `loginname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sankey` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `encryptpass` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_person` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` bigint(20) NOT NULL,
  `status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ipAddress` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '""',
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `region_id` int(11) NOT NULL,
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
 (6,1,'test','1568394738','9185A3Df5xrZM7PbMdUpOQ==','2020-03-30 12:08:14','536/43/56','Hồ Chí minh','0932688659','vuyeuai_007@yahoo.com',1000000000,'Remove','END_DATE/2020-05-13 00:00:00;','0:0:0:0:0:0:0:1','2020-03-30 12:08:14','asdfasf','asdfasfa',11);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `furniture`
--

DROP TABLE IF EXISTS `furniture`;
CREATE TABLE `furniture` (
  `id_furniture` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` bigint(20) NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_furniture`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `furniture`
--

/*!40000 ALTER TABLE `furniture` DISABLE KEYS */;
INSERT INTO `furniture` (`id_furniture`,`name_vi`,`name_en`,`type`,`price`,`details`,`status`,`remark`,`type_en`) VALUES 
 (1,'Tủ lạnh sony','Sony fridge','kg',1000000,'<p>asdfsadfsafsfdsdafasfs afasdfasdfasfdasfasdfsadfsfdsasdfasdfsfd</p>','Active','','kg'),
 (2,'sdfsadfasdfafd','asdfasdfsafdafd','sadfs',100000000,'            ','Remove','','asdfasfd'),
 (3,'asdfasfdasdf asdfasd','vũ','asdfasdfasfd',10000000,'<p>asdfasfdsafasfasfasfdasfsfdasfd</p>','Remove','','asdfsafsafaf');
/*!40000 ALTER TABLE `furniture` ENABLE KEYS */;


--
-- Definition of table `furniture_kind_room`
--

DROP TABLE IF EXISTS `furniture_kind_room`;
CREATE TABLE `furniture_kind_room` (
  `id_furniture_room` int(11) NOT NULL AUTO_INCREMENT,
  `id_furniture` int(11) NOT NULL,
  `kind_room_id` int(11) NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_furniture_room`),
  KEY `fk_furniture` (`id_furniture`),
  KEY `fk_kind_furniture` (`kind_room_id`),
  CONSTRAINT `fk_furniture` FOREIGN KEY (`id_furniture`) REFERENCES `furniture` (`id_furniture`),
  CONSTRAINT `fk_kind_furniture` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `furniture_kind_room`
--

/*!40000 ALTER TABLE `furniture_kind_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `furniture_kind_room` ENABLE KEYS */;


--
-- Definition of table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `invoice_id` bigint(20) NOT NULL,
  `booking_id` bigint(20) NOT NULL,
  `customer_id` bigint(20) NOT NULL,
  `room_id` int(11) NOT NULL,
  `tongtiensanpham` bigint(20) NOT NULL,
  `tongtien` bigint(20) NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `invoice`
--

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`invoice_id`,`booking_id`,`customer_id`,`room_id`,`tongtiensanpham`,`tongtien`,`remark`) VALUES 
 (0,10,27,8,5000000,5191000,'listTax:1,2,3,,tongthue:162000');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;


--
-- Definition of table `kind_room`
--

DROP TABLE IF EXISTS `kind_room`;
CREATE TABLE `kind_room` (
  `kind_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`kind_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kind_room`
--

/*!40000 ALTER TABLE `kind_room` DISABLE KEYS */;
INSERT INTO `kind_room` (`kind_room_id`,`name_vi`,`name_en`,`status`,`remark`) VALUES 
 (2,'Nhìn ra vườn','Garden-View-Bungalow','Active',''),
 (3,'Garden View Bungalow Queen Bed','Garden View Bungalow Queen Bed','Active',''),
 (4,'Beach Front Bungalow','Beach Front Bungalow','Active',''),
 (5,'Family Bungalow','Family Bungalow','Active',''),
 (6,'Ocean View Villa Queen Bed','Ocean View Villa Queen Bed','Active',''),
 (7,'Private Pool Villa','Private Pool Villa','Active',''),
 (8,'1Family Pool Villa','1Family Pool Villa','Active',''),
 (9,'sadfasdf','asdfasdfsdf','Active','remarks'),
 (10,'test','test','Active',''),
 (11,'test','test','Active',''),
 (12,'test','test','Active',''),
 (13,'vũ','asdf','Active','<p>asfasfadsafdfdasfasfasf</p>');
/*!40000 ALTER TABLE `kind_room` ENABLE KEYS */;


--
-- Definition of table `other_fees`
--

DROP TABLE IF EXISTS `other_fees`;
CREATE TABLE `other_fees` (
  `id_fees` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Definition of table `package`
--

DROP TABLE IF EXISTS `package`;
CREATE TABLE `package` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TITLE` longtext COLLATE utf8mb4_unicode_ci,
  `SHORT_DESCRIPTION` longtext COLLATE utf8mb4_unicode_ci,
  `FILE_URL_IMG` longtext COLLATE utf8mb4_unicode_ci,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `region_id` int(11) NOT NULL,
  `REMARK` longtext COLLATE utf8mb4_unicode_ci,
  `STATUS` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promote_id` int(11) NOT NULL,
  `DESCRIPTION` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `fk_region_package` (`region_id`),
  KEY `fk_promote_package` (`promote_id`),
  CONSTRAINT `fk_promote_package` FOREIGN KEY (`promote_id`) REFERENCES `promote` (`promote_id`),
  CONSTRAINT `fk_region_package` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package`
--

/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` (`ID`,`TITLE`,`SHORT_DESCRIPTION`,`FILE_URL_IMG`,`START_DATE`,`END_DATE`,`region_id`,`REMARK`,`STATUS`,`promote_id`,`DESCRIPTION`) VALUES 
 (1,'Thông báo test','<p>asdfasdfasfsadfasdfsafa asdfsaf</p>','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\182228507888273837_1319156428271061_6883772745063071744_o.png','2020-05-16 00:00:00','2020-05-16 00:00:00',11,'','Active',1,'<p>asdfasfsafasfdasfsfasfafs asfasdfasf</p>');
/*!40000 ALTER TABLE `package` ENABLE KEYS */;


--
-- Definition of table `paypment_order`
--

DROP TABLE IF EXISTS `paypment_order`;
CREATE TABLE `paypment_order` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PAYEE_ID` bigint(20) NOT NULL,
  `BILLING_INFO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MERCHANT_ID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRANSACTION_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TRANSACTION_DATE` datetime NOT NULL,
  `RETURN_CODE` int(11) NOT NULL,
  `AMOUNT` bigint(20) NOT NULL,
  `CURRENCY` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAYPAL_TXN_ID` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAYPAL_TXN_FEE` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAYPAL_RECEIPT_NO` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMARK` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATUS` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAYEE_INFO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PURCHASE_INFO` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `GEN_MSG_KEY` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RETURN_MSG_KEY` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PAYMENT_TYPE` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paypment_order`
--

/*!40000 ALTER TABLE `paypment_order` DISABLE KEYS */;
INSERT INTO `paypment_order` (`ID`,`PAYEE_ID`,`BILLING_INFO`,`MERCHANT_ID`,`TRANSACTION_NO`,`TRANSACTION_DATE`,`RETURN_CODE`,`AMOUNT`,`CURRENCY`,`PAYPAL_TXN_ID`,`PAYPAL_TXN_FEE`,`PAYPAL_RECEIPT_NO`,`REMARK`,`STATUS`,`PAYEE_INFO`,`PURCHASE_INFO`,`GEN_MSG_KEY`,`RETURN_MSG_KEY`,`PAYMENT_TYPE`) VALUES 
 (1,0,'','','','2020-04-09 07:48:04',0,162900,'VNĐ','','','','','','','','','','paypal'),
 (2,0,'','','','2020-04-25 03:30:17',0,162900,'VNĐ','','','','','','','','','','paypal');
/*!40000 ALTER TABLE `paypment_order` ENABLE KEYS */;


--
-- Definition of table `postion_employee`
--

DROP TABLE IF EXISTS `postion_employee`;
CREATE TABLE `postion_employee` (
  `position_employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `promount` int(11) NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `type_price_room_vi` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_price_room_en` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price_1_night` bigint(20) NOT NULL DEFAULT '0',
  `kind_room_id` int(11) NOT NULL,
  `status` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `NAME` varchar(200) NOT NULL,
  `DESCRIPTION` longtext,
  `FILE_IMG_URL` longtext,
  `STATUS` varchar(100) DEFAULT NULL,
  `REMARK` longtext,
  `PRICE` bigint(20) DEFAULT NULL,
  `UNIT` varchar(100) NOT NULL,
  `AMOUNT` int(11) DEFAULT NULL,
  `cate_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PRODUCT_CATE` (`cate_id`),
  KEY `FK_REGION_PRODUCT` (`region_id`),
  CONSTRAINT `FK_PRODUCT_CATE` FOREIGN KEY (`cate_id`) REFERENCES `categoryproduct` (`cate_id`),
  CONSTRAINT `FK_REGION_PRODUCT` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` (`ID`,`NAME`,`DESCRIPTION`,`FILE_IMG_URL`,`STATUS`,`REMARK`,`PRICE`,`UNIT`,`AMOUNT`,`cate_id`,`region_id`) VALUES 
 (1,'Mì xào giòn','<p>asdfasfsfdasfsfasdf&nbsp; asdfasdf</p>','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\82137961488273837_1319156428271061_6883772745063071744_o.png','Remove','',100000,'Dĩa',60,11,11),
 (2,'Máy lạnh','<p>sdafasffasdasfdasfd afsasdfasf</p>','','Remove','',1000000,'cái',100,12,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promote`
--

/*!40000 ALTER TABLE `promote` DISABLE KEYS */;
INSERT INTO `promote` (`promote_id`,`pro_code`,`pro_value`,`status`,`remark`,`expired_date`) VALUES 
 (1,'code_default_2','10','Active','','2021-03-24 00:00:00'),
 (2,'asdss','10','Active','','2020-03-27 00:00:00'),
 (3,'test','100','Active','','2020-05-16 00:00:00');
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
 (1,2,3);
/*!40000 ALTER TABLE `promote_price` ENABLE KEYS */;


--
-- Definition of table `region`
--

DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
  `file_url_img` longtext NOT NULL,
  `Address` longtext NOT NULL,
  `contact_phone` varchar(45) NOT NULL,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`region_id`,`name_vi`,`name_en`,`status`,`remark`,`file_url_img`,`Address`,`contact_phone`) VALUES 
 (11,'Khu nghỉ dưỡng khách sạn Phan Thiết','Victoria Phan Thiet beach resort','Active','            ','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1567968099phanthiet-daidien_img_region.png','asdfasdfasfasfd','asdfasdfasfasfd'),
 (12,'asdfasdfsadf','asdfasfasfasf','Delete','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1385053442_img_region.png','asdfasdfasfasfd','+0932688566'),
 (13,'Khách sạn Victoria Châu Đốc','Hotel Chau Doc','Active','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\504527829_img_region.png','asdfasdfasfasfd','+0932688566'),
 (14,'Khu nghỉ dưỡng & spa Victoria Sapa','Resort & Hotel Sapa','Active','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1755273410_img_region.png','asdfasdfasfasfd','+0932688566'),
 (15,'Victoria Xiengthong Palace','Victoria Xiengthong Palace','Delete','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\975489678_img_region.png','Kounxoau Road, Ban Phonehueng, Luang Prabang, Laos, , Luang Prabang, Lào','+0932688566');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;


--
-- Definition of table `reportuser`
--

DROP TABLE IF EXISTS `reportuser`;
CREATE TABLE `reportuser` (
  `reportuser_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `room` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nameuser` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quoctich` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remark` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`reportuser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reportuser`
--

/*!40000 ALTER TABLE `reportuser` DISABLE KEYS */;
INSERT INTO `reportuser` (`reportuser_id`,`region_id`,`room`,`nameuser`,`email`,`quoctich`,`title`,`content`,`type`,`status`,`remark`) VALUES 
 (5,0,'Maketing','vÅ©','vuyeuai_007@yahoo.com','VN','ThÃ´ng baÌo test','<p>asdfasfasfasfasf asfdasdfasfasfd</p>','report_send','unread',''),
 (8,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1958180513_CSDLPT-51603379.docx'),
 (9,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1348015590_CSDLPT-51603379.docx'),
 (10,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_729283146_CSDLPT-51603379.docx'),
 (11,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1459325771_CSDLPT-51603379.docx'),
 (12,0,'Maketing','vÅ©','vuyeuai_007@yahoo.com','VN','ThÃ´ng baÌo test','<p>dsfasdfasdfasfasdf&nbsp;</p>','report_send','unread',''),
 (13,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1643898187_CSDLPT-51603379.docx'),
 (14,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_7468663_CSDLPT-51603379.docx'),
 (15,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1604869900_CSDLPT-51603379.docx'),
 (16,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_103223340_CSDLPT-51603379.docx'),
 (17,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_23817297_CSDLPT-51603379.docx'),
 (18,0,'','','','','','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\'),
 (19,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1733424693_CSDLPT-51603379.docx'),
 (20,0,'','','','','','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\'),
 (21,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_768143341_CSDLPT-51603379.docx'),
 (22,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_194339163_CSDLPT-51603379.docx'),
 (23,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1150281498_CSDLPT-51603379.docx'),
 (24,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_931830703_CSDLPT-51603379.docx'),
 (25,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1382915059_CSDLPT-51603379.docx'),
 (26,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1261240378_CSDLPT-51603379.docx'),
 (27,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_966380116_CSDLPT-51603379.docx'),
 (28,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_903790139_CSDLPT-51603379.docx'),
 (29,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1681082694_CSDLPT-51603379.docx'),
 (30,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_188960147_CSDLPT-51603379.docx'),
 (31,11,'','','','','NÃ´Ì£p ÄÆ¡n Æ°Ìng tuyÃªÌn','','career_customer','unread','attach_file:C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\upload_career_1637871983_CSDLPT-51603379.docx'),
 (32,0,'Reservation','fasfadfasf','asdfasdfsfda@gmail.com','AF','asdfasfsafd','','report_send','unread','');
/*!40000 ALTER TABLE `reportuser` ENABLE KEYS */;


--
-- Definition of table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `kind_room_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `price_id` int(11) NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `max_peopel` int(10) unsigned NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_room_kind` (`kind_room_id`),
  KEY `fk_room_region` (`region_id`),
  KEY `fk_room_price` (`price_id`),
  CONSTRAINT `fk_room_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`),
  CONSTRAINT `fk_room_price` FOREIGN KEY (`price_id`) REFERENCES `price_room` (`price_id`),
  CONSTRAINT `fk_room_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_id`,`name`,`kind_room_id`,`region_id`,`price_id`,`status`,`remark`,`max_peopel`) VALUES 
 (7,'vũ',2,11,3,'Completed','',4),
 (8,'vũ',2,11,3,'Active','',4),
 (9,'vũ',2,11,3,'Completed','',4),
 (10,'vũ',2,11,3,'Completed','',4),
 (11,'vũ',2,11,3,'Completed','',4),
 (12,'vũ',2,11,3,'Completed','',4),
 (13,'vũ',2,11,3,'Completed','',4),
 (14,'vũ',2,11,3,'Completed','',4),
 (15,'vũ',2,11,3,'Completed','',4),
 (16,'vũ',2,11,3,'Completed','',4),
 (17,'11',2,11,3,'Booked','',2),
 (18,'5',2,13,4,'Completed','',4),
 (19,'0',2,13,4,'Booked','',4),
 (20,'2',2,13,4,'Active','',4),
 (21,'4',2,13,4,'Active','',4),
 (22,'3',2,13,4,'Active','',4),
 (23,'1',2,13,4,'Active','',4),
 (24,'6',2,13,4,'Active','',4),
 (25,'7',2,13,4,'Active','',4),
 (26,'9',2,13,4,'Active','',4),
 (27,'8',2,13,4,'Active','',4),
 (28,'2',2,11,3,'Booked','',4),
 (29,'0',2,11,3,'Booked','',4),
 (30,'1',2,11,3,'Booked','',4),
 (31,'5',2,11,3,'Booked','',4),
 (32,'4',2,11,3,'Booked','',4),
 (33,'3',2,11,3,'Booked','',4),
 (34,'7',2,11,3,'Active','',4),
 (35,'8',2,11,3,'Active','',4),
 (36,'9',2,11,3,'Active','',4),
 (37,'6',2,11,3,'Active','',4),
 (38,'1',2,13,3,'Active','',2),
 (39,'5',2,13,3,'Active','',2),
 (40,'3',2,13,3,'Active','',2),
 (41,'4',2,13,3,'Active','',2),
 (42,'2',2,13,3,'Active','',2),
 (43,'0',2,13,3,'Active','',2),
 (44,'7',2,13,3,'Active','',2),
 (45,'6',2,13,3,'Active','',2),
 (46,'8',2,13,3,'Active','',2),
 (47,'9',2,13,3,'Active','',2),
 (48,'11',2,13,3,'Active','',2),
 (49,'10',2,13,3,'Active','',2),
 (50,'12',2,13,3,'Active','',2),
 (51,'13',2,13,3,'Active','',2),
 (52,'14',2,13,3,'Active','',2),
 (53,'16',2,13,3,'Active','',2),
 (54,'17',2,13,3,'Active','',2),
 (55,'18',2,13,3,'Active','',2),
 (56,'15',2,13,3,'Active','',2),
 (57,'19',2,13,3,'Active','',2),
 (58,'20',2,13,3,'Active','',2),
 (59,'21',2,13,3,'Active','',2),
 (60,'24',2,13,3,'Active','',2),
 (61,'22',2,13,3,'Active','',2),
 (62,'23',2,13,3,'Active','',2),
 (63,'25',2,13,3,'Active','',2),
 (64,'26',2,13,3,'Active','',2),
 (65,'27',2,13,3,'Active','',2),
 (66,'28',2,13,3,'Active','',2),
 (67,'29',2,13,3,'Active','',2),
 (68,'0',3,11,3,'Active','',3),
 (69,'1',3,11,3,'Active','',3),
 (70,'2',3,11,3,'Active','',3),
 (71,'3',3,11,3,'Active','',3),
 (72,'4',3,11,3,'Active','',3),
 (73,'1',4,11,3,'Active','',3),
 (74,'2',4,11,3,'Active','',3),
 (75,'0',4,11,3,'Active','',3),
 (76,'3',4,11,3,'Active','',3),
 (77,'4',4,11,3,'Active','',3),
 (78,'0',5,11,3,'Active','',3),
 (79,'1',5,11,3,'Active','',3),
 (80,'4',5,11,3,'Active','',3),
 (81,'3',5,11,3,'Active','',3),
 (82,'2',5,11,3,'Active','',3),
 (83,'1',6,11,3,'Active','',3),
 (84,'2',6,11,3,'Active','',3),
 (85,'0',6,11,3,'Active','',3),
 (86,'4',6,11,3,'Active','',3),
 (87,'3',6,11,3,'Active','',3),
 (88,'1',7,11,3,'Active','',3),
 (89,'0',7,11,3,'Active','',3),
 (90,'2',7,11,3,'Active','',3),
 (91,'3',7,11,3,'Active','',3),
 (92,'4',7,11,3,'Active','',3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;


--
-- Definition of table `service`
--

DROP TABLE IF EXISTS `service`;
CREATE TABLE `service` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `service_name_vi` varchar(200) NOT NULL,
  `servict_name_en` varchar(200) NOT NULL,
  `file_img_url` longtext NOT NULL,
  `service_details_vi` longtext NOT NULL,
  `service_details_en` longtext NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
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
  `price_id` int(11) NOT NULL,
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
  `meta_key` varchar(200) NOT NULL,
  `ip_Address` longtext NOT NULL,
  `type` varchar(200) NOT NULL,
  `meta_value` varchar(200) NOT NULL,
  `date_update` datetime NOT NULL,
  PRIMARY KEY (`sys_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sys_meta`
--

/*!40000 ALTER TABLE `sys_meta` DISABLE KEYS */;
INSERT INTO `sys_meta` (`sys_id`,`meta_key`,`ip_Address`,`type`,`meta_value`,`date_update`) VALUES 
 (1,'customer_view','192.168.1.28','views','1','2020-04-21 13:23:40'),
 (2,'customer_view','127.0.0.1','views','1','2020-04-21 13:25:13'),
 (3,'customer_view','127.0.0.1','views','1','2020-04-22 16:27:06'),
 (4,'customer_view','192.168.1.28','views','1','2020-04-22 16:27:12'),
 (5,'customer_view','127.0.0.1','views','1','2020-04-23 08:43:50'),
 (6,'customer_view','192.168.1.28','views','1','2020-04-23 08:44:33'),
 (7,'customer_view','127.0.0.1','views','1','2020-04-24 06:50:48'),
 (8,'customer_view','192.168.1.28','views','1','2020-04-24 06:51:32'),
 (9,'customer_view','127.0.0.1','views','1','2020-04-25 07:15:30'),
 (10,'customer_view','192.168.1.28','views','1','2020-04-25 07:16:27'),
 (11,'customer_view','127.0.0.1','views','1','2020-04-26 07:13:50'),
 (12,'customer_view','192.168.1.28','views','1','2020-04-26 07:14:03'),
 (13,'customer_view','127.0.0.1','views','1','2020-04-27 08:46:24'),
 (14,'customer_view','192.168.1.28','views','1','2020-04-27 08:47:17'),
 (15,'customer_view','127.0.0.1','views','1','2020-04-29 08:01:38'),
 (16,'customer_view','192.168.1.28','views','1','2020-04-29 08:01:46'),
 (17,'customer_view','127.0.0.1','views','1','2020-04-30 08:24:29'),
 (18,'customer_view','192.168.1.28','views','1','2020-04-30 08:25:20'),
 (19,'customer_view','127.0.0.1','views','1','2020-05-01 09:01:58'),
 (20,'customer_view','192.168.1.28','views','1','2020-05-01 09:02:09'),
 (21,'customer_view','127.0.0.1','views','1','2020-05-03 07:05:24'),
 (22,'customer_view','192.168.1.28','views','1','2020-05-03 07:05:34'),
 (23,'customer_view','127.0.0.1','views','1','2020-05-04 07:18:02'),
 (24,'customer_view','192.168.1.28','views','1','2020-05-04 07:19:10'),
 (25,'customer_view','127.0.0.1','views','1','2020-05-05 07:40:09'),
 (26,'customer_view','192.168.1.28','views','1','2020-05-05 07:40:14'),
 (27,'customer_view','127.0.0.1','views','1','2020-05-07 07:38:02'),
 (28,'customer_view','192.168.1.28','views','1','2020-05-07 07:38:09'),
 (29,'customer_view','127.0.0.1','views','1','2020-05-08 18:31:44'),
 (30,'customer_view','192.168.1.28','views','1','2020-05-08 18:33:38'),
 (31,'customer_view','127.0.0.1','views','1','2020-05-09 19:11:04'),
 (32,'customer_view','192.168.1.28','views','1','2020-05-09 19:11:51'),
 (33,'customer_view','127.0.0.1','views','1','2020-05-10 17:47:58'),
 (34,'customer_view','192.168.1.29','views','1','2020-05-10 17:48:48'),
 (35,'customer_view','127.0.0.1','views','1','2020-05-11 07:00:35'),
 (36,'customer_view','192.168.1.29','views','1','2020-05-11 07:00:42'),
 (37,'customer_view','127.0.0.1','views','1','2020-05-12 19:00:10'),
 (38,'customer_view','192.168.1.29','views','1','2020-05-12 19:00:16'),
 (39,'customer_view','127.0.0.1','views','1','2020-05-13 07:38:43'),
 (40,'customer_view','192.168.1.29','views','1','2020-05-13 07:38:59'),
 (41,'customer_view','127.0.0.1','views','1','2020-05-14 07:40:37'),
 (42,'customer_view','192.168.1.29','views','1','2020-05-14 07:41:25'),
 (43,'customer_view','127.0.0.1','views','1','2020-05-15 19:12:33'),
 (44,'customer_view','192.168.1.29','views','1','2020-05-15 19:12:46'),
 (45,'customer_view','127.0.0.1','views','1','2020-05-17 07:44:10'),
 (46,'customer_view','192.168.1.29','views','1','2020-05-17 07:45:03');
/*!40000 ALTER TABLE `sys_meta` ENABLE KEYS */;


--
-- Definition of table `trans_booking`
--

DROP TABLE IF EXISTS `trans_booking`;
CREATE TABLE `trans_booking` (
  `id_trans_booking` bigint(20) NOT NULL AUTO_INCREMENT,
  `transport_id` bigint(20) NOT NULL,
  `booking_id` bigint(20) NOT NULL,
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
  `transport_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL,
  `details_vi` longtext NOT NULL,
  `details_en` longtext NOT NULL,
  `price` bigint(20) NOT NULL,
  `status` varchar(100) NOT NULL,
  `remark` longtext NOT NULL,
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
  `transport_id` bigint(20) NOT NULL,
  `region_id` int(11) NOT NULL,
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
  `Original_filename` varchar(200) NOT NULL,
  `File_url` varchar(500) NOT NULL,
  `Parent_table` varchar(45) NOT NULL,
  `Created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
  `File_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload_resource`
--

/*!40000 ALTER TABLE `upload_resource` DISABLE KEYS */;
INSERT INTO `upload_resource` (`id`,`Original_filename`,`File_url`,`Parent_table`,`Created_date`,`status`,`remark`,`File_type`) VALUES 
 (1,'423c534d84d060e12cdc19ba2f78bf4b-w704-scale.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\599447649_img_Uploaded_zoom.png','kind_room_2','2020-03-24 00:00:00','Active','','jpg'),
 (2,'b4209857280ac0d8f9b3c401b9426a2e-w704-scale.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\859536170_img_Uploaded_zoom.png','kind_room_2','2020-03-24 00:00:00','Active','','jpg'),
 (3,'caa8c196f48e17bc9b580b9e1c7d2808-w704-scale.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1770574455_img_Uploaded_zoom.png','kind_room_2','2020-03-24 00:00:00','Active','','jpg'),
 (61,'phanthiet_1.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\382552577phanthiet_1.png','img_hotel_11','2020-04-29 19:44:14','Active','','jpg'),
 (62,'phanthiet_2.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\194901507phanthiet_2.png','img_hotel_11','2020-04-29 19:44:14','Active','','jpg'),
 (63,'beach-buffalo.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\471364062_img_Uploaded_zoom.png','kind_room_3','2020-05-07 00:00:00','Active','','jpg'),
 (64,'queen-buffalo.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1340504319_img_Uploaded_zoom.png','kind_room_4','2020-05-07 00:00:00','Active','','jpg'),
 (65,'family-bufflafo.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\699550952_img_Uploaded_zoom.png','kind_room_5','2020-05-07 00:00:00','Active','','jpg'),
 (66,'occean view villa win.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\162089408_img_Uploaded_zoom.png','kind_room_6','2020-05-07 00:00:00','Active','','jpg'),
 (67,'private-pool-village.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\622156807_img_Uploaded_zoom.png','kind_room_7','2020-05-07 00:00:00','Active','','jpg'),
 (68,'family-pool-village.jpg','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1413231025_img_Uploaded_zoom.png','kind_room_8','2020-05-07 00:00:00','Active','','jpg');
/*!40000 ALTER TABLE `upload_resource` ENABLE KEYS */;


--
-- Definition of table `warsehouse`
--

DROP TABLE IF EXISTS `warsehouse`;
CREATE TABLE `warsehouse` (
  `warsehouse_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID` int(11) NOT NULL,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `inputdate` datetime DEFAULT NULL,
  `employee_id` int(11) NOT NULL,
  `remarks` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`warsehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warsehouse`
--

/*!40000 ALTER TABLE `warsehouse` DISABLE KEYS */;
INSERT INTO `warsehouse` (`warsehouse_id`,`ID`,`type`,`amount`,`inputdate`,`employee_id`,`remarks`) VALUES 
 (1,1,'import',0,'2020-05-10 20:51:13',2,''),
 (2,1,'import',10,'2020-05-10 20:55:13',2,''),
 (3,1,'import',10,'2020-05-10 21:01:50',2,''),
 (4,1,'import',10,'2020-05-10 21:05:16',2,''),
 (5,1,'import',10,'2020-05-10 21:10:45',2,''),
 (6,1,'import',100,'2020-05-10 21:10:57',2,''),
 (7,1,'export',10,'2020-05-10 21:11:58',2,''),
 (8,1,'export',50,'2020-05-10 21:12:11',2,'');
/*!40000 ALTER TABLE `warsehouse` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
