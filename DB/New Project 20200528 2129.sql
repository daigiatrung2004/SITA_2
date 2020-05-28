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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

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
 (18,49,'2020-04-26 00:00:00','2020-04-26 14:00:00','2020-04-27 12:00:00',2,13,19,'Active','','87xtlPiOALL+0xu7tNm0tg=='),
 (19,57,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-31 12:00:00',2,13,20,'Active','','tMR2JbmmsGsUL17umUJ0ig=='),
 (20,58,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-29 12:00:00',2,13,21,'Active','','pOr8mnrO37YSSTPTEt79gw=='),
 (21,59,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-31 12:00:00',2,13,22,'Active','','QWerEXNwq3tCM2mQJgqOYw=='),
 (22,60,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-31 12:00:00',2,13,22,'Active','','xTL7on+Avtx1//3Ky2gADg=='),
 (23,61,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-31 12:00:00',2,13,22,'Active','','DUqgVq0i5K7Q9JrQ/iihYw=='),
 (24,62,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-29 12:00:00',2,13,23,'Active','','EtQiPo+/YvoHVnHpBTNZrg=='),
 (25,63,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-29 12:00:00',2,13,24,'Active','','E5ln8yIF4KtQGhleS9zeug=='),
 (26,64,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-29 12:00:00',2,13,25,'Active','','YEWGD925Xh0/8VpG26eq0w=='),
 (27,65,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-29 12:00:00',2,13,26,'Active','','dA8eezH7JRLiPDaqE2JmgA=='),
 (28,66,'2020-05-28 00:00:00','2020-05-28 14:00:00','2020-05-31 12:00:00',2,13,27,'Active','','bOmgt02StELAF2eklQy7BA==');
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

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
 (55,'daoanhvu19284673502@gmail.com','651536218','QSCAiezUu7s0GYrkX8qkTQ==','2020-04-26 00:00:00','2688659','025727433','Active','','ÄaÌo','VuÌ'),
 (56,'daoanhvu19284673@gmail.com','1062030013','E9z3zMNndK3qgIhBDth+6Q==','2020-05-28 00:00:00','2688659','025727433','Active','','dao','vu'),
 (57,'daoanhvu19284673@gmail.com','1545663598','tMR2JbmmsGsUL17umUJ0ig==','2020-05-28 00:00:00','2688659','025727433','Active','','dao','vu'),
 (58,'daoanhvu19284673@gmail.com','976943435','pOr8mnrO37YSSTPTEt79gw==','2020-05-28 00:00:00','2688659','025727433','Active','','dao','vu'),
 (59,'daoanhvu19284673@gmail.com','1553091179','QWerEXNwq3tCM2mQJgqOYw==','2020-05-28 00:00:00','2688659','025727433','Active','','dao','vu'),
 (60,'daoanhvu19284673@gmail.com','393547796','xTL7on+Avtx1//3Ky2gADg==','2020-05-28 00:00:00','2688659','025727433','Active','','dao','vu'),
 (61,'daoanhvu19284673@gmail.com','94245870','DUqgVq0i5K7Q9JrQ/iihYw==','2020-05-28 00:00:00','2688659','025727433','Active','','dao','vu'),
 (62,'daoanhvu19284673@gmail.com','25772197','EtQiPo+/YvoHVnHpBTNZrg==','2020-05-28 00:00:00','2688659','025727433','Active','','dao','vu'),
 (63,'daoanhvu19284673@gmail.com','1487613742','E5ln8yIF4KtQGhleS9zeug==','2020-05-28 00:00:00','2688659','025727433','Active','','đào','vũ'),
 (64,'daoanhvu19284673@gmail.com','1589524079','YEWGD925Xh0/8VpG26eq0w==','2020-05-28 00:00:00','2688659','025727433','Active','','đào','vũ'),
 (65,'daoanhvu19284673@gmail.com','538137009','dA8eezH7JRLiPDaqE2JmgA==','2020-05-28 00:00:00','2688659','025727433','Active','','đào','vũ'),
 (66,'daoanhvu19284673@gmail.com','1126941419','bOmgt02StELAF2eklQy7BA==','2020-05-28 00:00:00','2688659','025727433','Active','','Đào','vũ');
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`,`position_employee_id`,`loginname`,`sankey`,`encryptpass`,`start_date`,`address`,`country`,`contact_person`,`contact_email`,`salary`,`status`,`remark`,`ipAddress`,`last_login`,`first_name`,`last_name`,`region_id`) VALUES 
 (1,1,'admin','1568394738','qgL+XJelKMRK+cm8pCWBng==','2020-03-01 16:52:45','536/43/56','quÃ¢Ì£n tÃ¢n biÌnh','0932688659','vuyeuai_007@yahoo.com',8000000,'Active','','192.168.1.29','2020-03-01 16:52:45','Đào','Anh Vũ',11),
 (2,22,'51603379@gmail.com','1568394738','whR50ELiSOViOQ3nNw8KBQ==','2020-03-05 06:27:21','536/43/56','Quận Tân Bình','0932688659','vuyeuai_007@yahoo.com',8000000000,'Active','','0:0:0:0:0:0:0:1','2020-03-05 06:27:21','vũ 1','Đào',11),
 (6,1,'test','1568394738','9185A3Df5xrZM7PbMdUpOQ==','2020-03-30 12:08:14','536/43/56','Hồ Chí minh','0932688659','vuyeuai_007@yahoo.com',1000000000,'Remove','END_DATE/2020-05-13 00:00:00;END_DATE/2020-05-21 08:06:24;','0:0:0:0:0:0:0:1','2020-03-30 12:08:14','asdfasf','asdfasfa',11),
 (7,22,'admin','1755499531','h8aDiwbfNzBOepbYwROwaA==','2020-05-21 07:50:57','536/43/56','quận tân bình','+84932688659','vuyeuai_007@yahoo.com',8000000,'Remove','END_DATE/2020-05-21 08:09:35;','0:0:0:0:0:0:0:1','2020-05-21 07:50:57','vũ','Đào',11),
 (8,1,'chaudoc@gmail.com','1235263867','dq9Vs6rte6D4tmNRQ1uSmA==','2020-05-28 09:06:50','536/43/56','quận tân bình','0','vuyeuai_007@yahoo.com',10000000,'Active','','0:0:0:0:0:0:0:1','2020-05-28 09:06:50','','',13),
 (9,1,'sapa@gmail.com','273771675','8Y1OmsEAXYQ7xEfvmNwuSg==','2020-05-28 09:08:02','536/43/56','Quận Tân Bình','0932688659','vuyeuai_007@yahoo.com',10000000,'Active','','0:0:0:0:0:0:0:1','2020-05-28 09:08:02','vũ','đào',14);
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
 (9,'sadfasdf','asdfasdfsdf','Remove','remarks'),
 (10,'test','test','Remove',''),
 (11,'test','testasdfsdfasdfasf','Remove','<p>asdfasfsdffsdasdf asdfasdfasdf adfasdfasdf</p>'),
 (12,'','','Remove',''),
 (13,'vũ','asdf','Remove','<p>asfasfadsafdfdasfasfasf</p>');
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
  `TILTLE_EN` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION_EN` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `SHORT_DESCRIPTION_EN` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_region_package` (`region_id`),
  KEY `fk_promote_package` (`promote_id`),
  CONSTRAINT `fk_promote_package` FOREIGN KEY (`promote_id`) REFERENCES `promote` (`promote_id`),
  CONSTRAINT `fk_region_package` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package`
--

/*!40000 ALTER TABLE `package` DISABLE KEYS */;
INSERT INTO `package` (`ID`,`TITLE`,`SHORT_DESCRIPTION`,`FILE_URL_IMG`,`START_DATE`,`END_DATE`,`region_id`,`REMARK`,`STATUS`,`promote_id`,`DESCRIPTION`,`TILTLE_EN`,`DESCRIPTION_EN`,`SHORT_DESCRIPTION_EN`) VALUES 
 (1,'Thông báo test','<p>asdfasdfasfsadfasdfsafa asdfsaf</p>','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\182228507888273837_1319156428271061_6883772745063071744_o.png','2020-05-16 00:00:00','2020-05-16 00:00:00',11,'','Remove',1,'<p>asdfasfsafasfdasfsfasfafs asfasdfasf</p>','','',''),
 (2,'GÓI THAM DỰ GIẢI CHẠY VIETNAM MOUNTAIN MARATHON 2020','<p style=\"margin: 0px 0px 15px;\">C&Ugrave;NG VICTORIA SAPA VƯỢT QUA GIỚI HẠN BẢN TH&Acirc;N VỚI GIẢI VIETNAM MOUNTAIN MARATHON 2020 TR&Ecirc;N NHỮNG CUNG ĐƯỜNG THỬ TH&Aacute;CH NHẤT VIỆT NAM TẠI SAPA.</p>\n<p style=\"margin: 0px 0px 15px;\">US $410/ 2 KH&Aacute;CH HOẶC US $305/ KH&Aacute;CH</p>\n<h2 class=\"sub-title\" style=\"margin: 5px; font-family: \'Minion Pro\'; color: #b9975b; text-transform: uppercase; font-size: 24px; line-height: 30px; text-align: center; background-color: #ffffff;\">3 NG&Agrave;Y / 2 Đ&Ecirc;M</h2>','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\107694040uudai-2.png','2020-05-20 00:00:00','2020-05-20 00:00:00',11,'','Active',1,'<div class=\"uk-width-medium-1-2 offer-item\" style=\"flex: 0 0 auto; margin: 0px; float: left; padding-left: 35px; box-sizing: border-box; width: 467.5px; color: #141414; font-family: \'Minion Pro\'; font-size: 17px; text-align: center; background-color: #ffffff;\">\n<div class=\"description-inner\" style=\"margin-bottom: 0px; padding-bottom: 10px; height: 422px; text-align: initial;\">\n<div class=\"description-text\">\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>GI&Aacute; BAO GỒM</strong></p>\n<ul style=\"margin: 15px 0px; padding: 0px 10px; list-style: none;\">\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">2 đ&ecirc;m nghỉ tại ph&ograve;ng Victoria Sapa Deluxe, bao gồm bữa s&aacute;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Bữa s&aacute;ng khi đến Sapa</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Di chuyển từ Victoria Sapa &ndash; Topas Ecolodge bằng shuttle bus</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">60 ph&uacute;t m&aacute;t-xa kiểu Thuỵ Điển v&agrave; 30 ph&uacute;t tắm l&aacute; thuốc người Dao Đỏ tại Victoria Spa</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">1 bữa buffet tối bổ dưỡng trước cuộc thi tại nh&agrave; h&agrave;ng Tả Van</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">1 bữa buffet tối bổ dưỡng sau cuộc thi tại nh&agrave; h&agrave;ng Tả Van</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">1 bộ VIP bib</li>\n</ul>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>ƯU Đ&Atilde;I</strong></p>\n<ul style=\"margin: 15px 0px; padding: 0px 10px; list-style: none;\">\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Nhận ph&ograve;ng sớm v&agrave; trả ph&ograve;ng muộn tuỳ v&agrave;o t&igrave;nh trạng ph&ograve;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Sử dụng c&aacute;c tiện nghi (hồ bơi, ph&ograve;ng x&ocirc;ng hơi ướt, ph&ograve;ng x&ocirc;ng hơi kh&ocirc;, ph&ograve;ng tập gym)</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Kh&ocirc;ng phụ thu đối với trẻ em dưới 6 tuổi</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; n&ocirc;i cho trẻ</li>\n</ul>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\">&nbsp;</p>\n</div>\n</div>\n</div>\n<div class=\"uk-width-medium-1-2 offer-item\" style=\"flex: 0 0 auto; margin: 0px; float: left; padding-left: 35px; box-sizing: border-box; width: 467.5px; color: #141414; font-family: \'Minion Pro\'; font-size: 17px; text-align: center; background-color: #ffffff;\">\n<div class=\"description-inner\" style=\"margin-bottom: 0px; padding-bottom: 10px; height: 422px; text-align: initial;\">\n<div class=\"description-text\">\n<p style=\"margin: 0px 0px 15px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\">&nbsp;</p>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>ĐIỀU KHOẢN &amp; ĐIỀU KIỆN:</strong></p>\n<ul style=\"margin: 15px 0px; padding: 0px 10px; list-style: none;\">\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Gi&aacute; tr&ecirc;n chưa bao gồm ph&iacute; đăng k&iacute; cuộc thi</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; nhận ph&ograve;ng sớm v&agrave; trả ph&ograve;ng muộn tuỳ v&agrave;o t&igrave;nh trạng ph&ograve;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Gi&aacute; tr&ecirc;n đ&atilde; bao gồm 15% thuế v&agrave; ph&iacute; dịch vụ</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Chỉ &aacute;p dụng cho đơn đặt ph&ograve;ng mới v&agrave; kh&ocirc;ng &aacute;p dụng chung với c&aacute;c khuyến m&atilde;i v&agrave; g&oacute;i dịch vụ kh&aacute;c</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; huỷ đặt ph&ograve;ng 21 ng&agrave;y trước ng&agrave;y nhận ph&ograve;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; cho trẻ dưới 6 tuổi chung giường ngủ với bố mẹ</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Gia hạn ph&ograve;ng (bao gồm bữa s&aacute;ng): VNĐ 1,500,000 nett/ ph&ograve;ng/ đ&ecirc;m</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Phụ thu th&ecirc;m người (bao gồm tất cả dịch vụ trong g&oacute;i): VNĐ 7,400,000/ người lớn hoặc VNĐ 3,500,000/ trẻ em</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Giường phụ cho trẻ tuỳ v&agrave;o t&igrave;nh trạng giường trống. Tối đa 1 giường/ ph&ograve;ng</li>\n</ul>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>&Aacute;p dụng đến 20/09/2020</strong></p>\n</div>\n</div>\n</div>','','',''),
 (3,'SAPA BY VICTORIA EXPRESS TRAIN','<p style=\"margin: 0px 0px 15px;\">ENJOY THE VERY BEST OF SAPA WHILE LETTING US TAKE CARE OF ALL THE DETAILS. OUR SPECTACULAR GETAWAY INCLUDES ROUND-TRIP TRANSPORTATION FROM HANOI, SAPA EXCURSION, MASSAGE, DINNER AND MORE!</p>\n<p style=\"margin: 0px 0px 15px;\">VND 4,136,000 ++ /PERSON &ndash; MINIMUM 2 PERSONS PER ROOM</p>\n<h2 class=\"sub-title\" style=\"margin: 5px; font-family: \'Minion Pro\'; color: #b9975b; text-transform: uppercase; font-size: 24px; line-height: 30px; text-align: center; background-color: #ffffff;\">(EXTRA 20% DISCOUNT FOR DEPARTURE ON EVERY TUESDAY)</h2>\n<p style=\"margin: 15px 0px;\">&nbsp;</p>\n<h2 class=\"sub-title\" style=\"margin: 5px; font-family: \'Minion Pro\'; color: #b9975b; text-transform: uppercase; font-size: 24px; line-height: 30px; text-align: center; background-color: #ffffff;\">2 DAYS / 1 NIGHT</h2>','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1200486376uudai-2.png','2020-05-20 00:00:00','2020-05-20 00:00:00',11,'','Active',1,'<p style=\"margin: 0px 0px 15px;\">TRẢI NGHIỆM SAPA HO&Agrave;N HẢO VỚI 2 NG&Agrave;Y 1 Đ&Ecirc;M NGHỈ TẠI VICTORIA SAPA BAO GỒM V&Eacute; T&Agrave;U 2 CHIỀU TỪ H&Agrave; NỘI, TOUR THƯỞNG NGOẠN SAPA, DỊCH VỤ M&Aacute;T XA, ĂN TỐI V&Agrave; NHIỀU ƯU Đ&Atilde;I KH&Aacute;C</p>\n<p style=\"margin: 0px 0px 15px;\">VND 4,136,000 ++ / KH&Aacute;CH &ndash; TỐI THIỂU 2 KH&Aacute;CH 1 PH&Ograve;NG</p>\n<h2 class=\"sub-title\" style=\"margin: 5px; font-family: \'Minion Pro\'; color: #b9975b; text-transform: uppercase; font-size: 24px; line-height: 30px; text-align: center; background-color: #ffffff;\">(GIẢM TH&Ecirc;M 20% CHO KH&Aacute;CH KHỞI H&Agrave;NH V&Agrave;O THỨ 3 H&Agrave;NG TUẦN)</h2>\n<p style=\"margin: 15px 0px;\">&nbsp;</p>\n<h2 class=\"sub-title\" style=\"margin: 5px; font-family: \'Minion Pro\'; color: #b9975b; text-transform: uppercase; font-size: 24px; line-height: 30px; text-align: center; background-color: #ffffff;\">2 NG&Agrave;Y / 1 Đ&Ecirc;M</h2>','','',''),
 (4,'Gói Tham Dự Giải Chạy Vietnam Mountain Marathon 2020','<p style=\"margin: 0px 0px 15px;\">C&Ugrave;NG VICTORIA SAPA VƯỢT QUA GIỚI HẠN BẢN TH&Acirc;N VỚI GIẢI VIETNAM MOUNTAIN MARATHON 2020 TR&Ecirc;N NHỮNG CUNG ĐƯỜNG THỬ TH&Aacute;CH NHẤT VIỆT NAM TẠI SAPA.</p>\n<p style=\"margin: 0px 0px 15px;\">US $410/ 2 KH&Aacute;CH HOẶC US $305/ KH&Aacute;CH</p>\n<h2 class=\"sub-title\" style=\"margin: 5px; font-family: \'Minion Pro\'; color: #b9975b; text-transform: uppercase; font-size: 24px; line-height: 30px; text-align: center; background-color: #ffffff;\">3 NG&Agrave;Y / 2 Đ&Ecirc;M</h2>','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\284300597226-big.png','2020-05-21 00:00:00','2020-05-21 00:00:00',11,'','Active',1,'<div class=\"uk-width-medium-1-2 offer-item\" style=\"flex: 0 0 auto; margin: 0px; float: left; padding-left: 35px; box-sizing: border-box; width: 467.5px; color: #141414; font-family: \'Minion Pro\'; font-size: 17px; text-align: center; background-color: #ffffff;\">\n<div class=\"description-inner\" style=\"margin-bottom: 0px; padding-bottom: 10px; height: 422px; text-align: initial;\">\n<div class=\"description-text\">\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>GI&Aacute; BAO GỒM</strong></p>\n<ul style=\"margin: 15px 0px; padding: 0px 10px; list-style: none;\">\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">2 đ&ecirc;m nghỉ tại ph&ograve;ng Victoria Sapa Deluxe, bao gồm bữa s&aacute;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Bữa s&aacute;ng khi đến Sapa</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Di chuyển từ Victoria Sapa &ndash; Topas Ecolodge bằng shuttle bus</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">60 ph&uacute;t m&aacute;t-xa kiểu Thuỵ Điển v&agrave; 30 ph&uacute;t tắm l&aacute; thuốc người Dao Đỏ tại Victoria Spa</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">1 bữa buffet tối bổ dưỡng trước cuộc thi tại nh&agrave; h&agrave;ng Tả Van</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">1 bữa buffet tối bổ dưỡng sau cuộc thi tại nh&agrave; h&agrave;ng Tả Van</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">1 bộ VIP bib</li>\n</ul>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>ƯU Đ&Atilde;I</strong></p>\n<ul style=\"margin: 15px 0px; padding: 0px 10px; list-style: none;\">\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Nhận ph&ograve;ng sớm v&agrave; trả ph&ograve;ng muộn tuỳ v&agrave;o t&igrave;nh trạng ph&ograve;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Sử dụng c&aacute;c tiện nghi (hồ bơi, ph&ograve;ng x&ocirc;ng hơi ướt, ph&ograve;ng x&ocirc;ng hơi kh&ocirc;, ph&ograve;ng tập gym)</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Kh&ocirc;ng phụ thu đối với trẻ em dưới 6 tuổi</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; n&ocirc;i cho trẻ</li>\n</ul>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\">&nbsp;</p>\n</div>\n</div>\n</div>\n<div class=\"uk-width-medium-1-2 offer-item\" style=\"flex: 0 0 auto; margin: 0px; float: left; padding-left: 35px; box-sizing: border-box; width: 467.5px; color: #141414; font-family: \'Minion Pro\'; font-size: 17px; text-align: center; background-color: #ffffff;\">\n<div class=\"description-inner\" style=\"margin-bottom: 0px; padding-bottom: 10px; height: 422px; text-align: initial;\">\n<div class=\"description-text\">\n<p style=\"margin: 0px 0px 15px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\">&nbsp;</p>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>ĐIỀU KHOẢN &amp; ĐIỀU KIỆN:</strong></p>\n<ul style=\"margin: 15px 0px; padding: 0px 10px; list-style: none;\">\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Gi&aacute; tr&ecirc;n chưa bao gồm ph&iacute; đăng k&iacute; cuộc thi</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; nhận ph&ograve;ng sớm v&agrave; trả ph&ograve;ng muộn tuỳ v&agrave;o t&igrave;nh trạng ph&ograve;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Gi&aacute; tr&ecirc;n đ&atilde; bao gồm 15% thuế v&agrave; ph&iacute; dịch vụ</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Chỉ &aacute;p dụng cho đơn đặt ph&ograve;ng mới v&agrave; kh&ocirc;ng &aacute;p dụng chung với c&aacute;c khuyến m&atilde;i v&agrave; g&oacute;i dịch vụ kh&aacute;c</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; huỷ đặt ph&ograve;ng 21 ng&agrave;y trước ng&agrave;y nhận ph&ograve;ng</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Miễn ph&iacute; cho trẻ dưới 6 tuổi chung giường ngủ với bố mẹ</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Gia hạn ph&ograve;ng (bao gồm bữa s&aacute;ng): VNĐ 1,500,000 nett/ ph&ograve;ng/ đ&ecirc;m</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Phụ thu th&ecirc;m người (bao gồm tất cả dịch vụ trong g&oacute;i): VNĐ 7,400,000/ người lớn hoặc VNĐ 3,500,000/ trẻ em</li>\n<li style=\"font-size: 15px; margin-bottom: 4px; padding-left: 9px; text-indent: -8px;\">Giường phụ cho trẻ tuỳ v&agrave;o t&igrave;nh trạng giường trống. Tối đa 1 giường/ ph&ograve;ng</li>\n</ul>\n<p style=\"margin: 15px 0px; padding: 0px 10px; font-weight: bold; color: #7c2529; font-size: 18px;\"><strong>&Aacute;p dụng đến 20/09/2020</strong></p>\n</div>\n</div>\n</div>','','',''),
 (5,'Thông báo test','<p>asdfasdfasdfsfsafsafafasf asdfsafasfasfs</p>','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\873794667CSR_IMG_4.png','2020-05-22 00:00:00','2020-05-22 00:00:00',11,'','Remove',1,'<p>adfsasdfsafsfsfasfsafasf asdfasdfsdfsdf</p>','english','<p>asfdasfsafdsafsdafsafsafasdfasdfasfdasdfsafdsa asdfasdfsfd</p>',''),
 (6,'Thông báo test','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\721102263CSR_IMG_1.png','2020-05-22 00:00:00','2020-05-22 00:00:00',11,'','Remove',1,'','asdfasdfasdfsadf','','');
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
 (22,'Nhân Viên Sale 1','Remove');
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
 (3,'Thanh toán online','Online Exclusive Rate',1000000,2,'Active',''),
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
 (11,'Khu nghỉ dưỡng khách sạn Phan Thiết','Victoria Phan Thiet beach resort','Active','description:;','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\229594459VPT_img_region.png','Km số 9, Phú Hải, , Thành Phố Phan Thiết, Việt Nam','092523813000'),
 (12,'asdfasdfsadf','asdfasfasfasf','Delete','','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1385053442_img_region.png','asdfasdfasfasfd','+0932688566'),
 (13,'Khách sạn Victoria Châu Đốc','Hotel Chau Doc','Active','description:;','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\1267123815-big_img_region.png','Đường số 1 Lê Lợi, , Thành Phố Châu Đốc, Việt Nam','842963865010'),
 (14,'Khu nghỉ dưỡng & spa Victoria Sapa','Resort & Hotel Sapa','Active','description:;','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\temp\\2091811382-big_img_region.png','Đường Xuân Viên, , Thị Trấn Sapa, Việt Nam','0902143871522'),
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
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_id`,`name`,`kind_room_id`,`region_id`,`price_id`,`status`,`remark`,`max_peopel`) VALUES 
 (7,'vũ',2,11,3,'Remove','',4),
 (8,'10',4,11,3,'Booked','',4),
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
 (20,'2',2,13,4,'Booked','',4),
 (21,'4',2,13,4,'Booked','',4),
 (22,'3',2,13,4,'Booked','',4),
 (23,'1',2,13,4,'Booked','',4),
 (24,'6',2,13,4,'Booked','',4),
 (25,'7',2,13,4,'Booked','',4),
 (26,'9',2,13,4,'Booked','',4),
 (27,'8',2,13,4,'Booked','',4),
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
 (72,'4',3,11,3,'Remove','',3),
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
 (92,'4',7,11,3,'Active','',3),
 (93,'1',3,11,3,'Active','',5),
 (94,'4',3,11,3,'Active','',5),
 (95,'5',3,11,3,'Active','',5),
 (96,'3',3,11,3,'Active','',5),
 (97,'2',3,11,3,'Active','',5),
 (98,'0',3,11,3,'Active','',5),
 (99,'6',3,11,3,'Active','',5),
 (100,'10',3,11,3,'Active','',5),
 (101,'8',3,11,3,'Active','',5),
 (102,'7',3,11,3,'Active','',5),
 (103,'9',3,11,3,'Active','',5),
 (104,'11',3,11,3,'Active','',5),
 (105,'12',3,11,3,'Active','',5),
 (106,'13',3,11,3,'Active','',5),
 (107,'14',3,11,3,'Active','',5),
 (108,'15',3,11,3,'Active','',5),
 (109,'16',3,11,3,'Active','',5),
 (110,'17',3,11,3,'Active','',5),
 (111,'18',3,11,3,'Active','',5),
 (112,'19',3,11,3,'Active','',5),
 (113,'20',3,11,3,'Active','',5),
 (114,'21',3,11,3,'Active','',5),
 (115,'22',3,11,3,'Active','',5),
 (116,'23',3,11,3,'Active','',5),
 (117,'24',3,11,3,'Active','',5),
 (118,'27',3,11,3,'Active','',5),
 (119,'26',3,11,3,'Active','',5),
 (120,'25',3,11,3,'Active','',5),
 (121,'28',3,11,3,'Active','',5),
 (122,'29',3,11,3,'Active','',5),
 (123,'30',3,11,3,'Active','',5),
 (124,'31',3,11,3,'Active','',5),
 (125,'32',3,11,3,'Active','',5),
 (126,'33',3,11,3,'Active','',5),
 (127,'35',3,11,3,'Active','',5),
 (128,'36',3,11,3,'Active','',5),
 (129,'34',3,11,3,'Active','',5),
 (130,'37',3,11,3,'Active','',5),
 (131,'39',3,11,3,'Active','',5),
 (132,'38',3,11,3,'Active','',5),
 (133,'41',3,11,3,'Active','',5),
 (134,'42',3,11,3,'Active','',5),
 (135,'43',3,11,3,'Active','',5),
 (136,'40',3,11,3,'Active','',5),
 (137,'44',3,11,3,'Active','',5),
 (138,'45',3,11,3,'Active','',5),
 (139,'47',3,11,3,'Active','',5),
 (140,'46',3,11,3,'Active','',5),
 (141,'49',3,11,3,'Active','',5),
 (142,'48',3,11,3,'Active','',5),
 (143,'0',3,14,3,'Active','',5),
 (144,'2',3,14,3,'Active','',5),
 (145,'1',3,14,3,'Active','',5),
 (146,'3',3,14,3,'Active','',5),
 (147,'5',3,14,3,'Active','',5),
 (148,'4',3,14,3,'Active','',5),
 (149,'6',3,14,3,'Active','',5),
 (150,'7',3,14,3,'Active','',5),
 (151,'8',3,14,3,'Active','',5),
 (152,'9',3,14,3,'Active','',5),
 (153,'10',3,14,3,'Active','',5),
 (154,'11',3,14,3,'Active','',5),
 (155,'12',3,14,3,'Active','',5),
 (156,'13',3,14,3,'Active','',5),
 (157,'14',3,14,3,'Active','',5),
 (158,'15',3,14,3,'Active','',5),
 (159,'16',3,14,3,'Active','',5),
 (160,'17',3,14,3,'Active','',5),
 (161,'18',3,14,3,'Active','',5),
 (162,'19',3,14,3,'Active','',5),
 (163,'20',3,14,3,'Active','',5),
 (164,'21',3,14,3,'Active','',5),
 (165,'23',3,14,3,'Active','',5),
 (166,'22',3,14,3,'Active','',5),
 (167,'24',3,14,3,'Active','',5),
 (168,'25',3,14,3,'Active','',5),
 (169,'26',3,14,3,'Active','',5),
 (170,'27',3,14,3,'Active','',5),
 (171,'28',3,14,3,'Active','',5),
 (172,'29',3,14,3,'Active','',5),
 (173,'30',3,14,3,'Active','',5),
 (174,'31',3,14,3,'Active','',5),
 (175,'32',3,14,3,'Active','',5),
 (176,'33',3,14,3,'Active','',5),
 (177,'34',3,14,3,'Active','',5),
 (178,'35',3,14,3,'Active','',5),
 (179,'38',3,14,3,'Active','',5),
 (180,'37',3,14,3,'Active','',5),
 (181,'39',3,14,3,'Active','',5),
 (182,'36',3,14,3,'Active','',5),
 (183,'40',3,14,3,'Active','',5),
 (184,'41',3,14,3,'Active','',5),
 (185,'42',3,14,3,'Active','',5),
 (186,'43',3,14,3,'Active','',5),
 (187,'44',3,14,3,'Active','',5),
 (188,'46',3,14,3,'Active','',5),
 (189,'45',3,14,3,'Active','',5),
 (190,'48',3,14,3,'Active','',5),
 (191,'47',3,14,3,'Active','',5),
 (192,'49',3,14,3,'Active','',5),
 (193,'0',3,13,3,'Active','',5),
 (194,'2',3,13,3,'Active','',5),
 (195,'4',3,13,3,'Active','',5),
 (196,'3',3,13,3,'Active','',5),
 (197,'5',3,13,3,'Active','',5),
 (198,'1',3,13,3,'Active','',5),
 (199,'6',3,13,3,'Active','',5),
 (200,'10',3,13,3,'Active','',5),
 (201,'7',3,13,3,'Active','',5),
 (202,'9',3,13,3,'Active','',5),
 (203,'8',3,13,3,'Active','',5),
 (204,'11',3,13,3,'Active','',5),
 (205,'12',3,13,3,'Active','',5),
 (206,'14',3,13,3,'Active','',5),
 (207,'13',3,13,3,'Active','',5),
 (208,'16',3,13,3,'Active','',5),
 (209,'15',3,13,3,'Active','',5),
 (210,'17',3,13,3,'Active','',5),
 (211,'18',3,13,3,'Active','',5),
 (212,'19',3,13,3,'Active','',5),
 (213,'20',3,13,3,'Active','',5),
 (214,'22',3,13,3,'Active','',5),
 (215,'21',3,13,3,'Active','',5),
 (216,'24',3,13,3,'Active','',5),
 (217,'23',3,13,3,'Active','',5),
 (218,'26',3,13,3,'Active','',5),
 (219,'27',3,13,3,'Active','',5),
 (220,'25',3,13,3,'Active','',5),
 (221,'28',3,13,3,'Active','',5),
 (222,'29',3,13,3,'Active','',5),
 (223,'30',3,13,3,'Active','',5),
 (224,'32',3,13,3,'Active','',5),
 (225,'31',3,13,3,'Active','',5),
 (226,'33',3,13,3,'Active','',5),
 (227,'34',3,13,3,'Active','',5),
 (228,'35',3,13,3,'Active','',5),
 (229,'36',3,13,3,'Active','',5),
 (230,'38',3,13,3,'Active','',5),
 (231,'37',3,13,3,'Active','',5),
 (232,'39',3,13,3,'Active','',5),
 (233,'41',3,13,3,'Active','',5),
 (234,'40',3,13,3,'Active','',5),
 (235,'42',3,13,3,'Active','',5),
 (236,'45',3,13,3,'Active','',5),
 (237,'44',3,13,3,'Active','',5),
 (238,'43',3,13,3,'Active','',5),
 (239,'46',3,13,3,'Active','',5),
 (240,'47',3,13,3,'Active','',5),
 (241,'48',3,13,3,'Active','',5),
 (242,'49',3,13,3,'Active','',5),
 (243,'3',4,14,3,'Active','',2),
 (244,'0',4,14,3,'Active','',2),
 (245,'5',4,14,3,'Active','',2),
 (246,'2',4,14,3,'Active','',2),
 (247,'1',4,14,3,'Active','',2),
 (248,'4',4,14,3,'Active','',2),
 (249,'7',4,14,3,'Active','',2),
 (250,'8',4,14,3,'Active','',2),
 (251,'9',4,14,3,'Active','',2),
 (252,'6',4,14,3,'Active','',2),
 (253,'1',4,13,3,'Active','',2),
 (254,'3',4,13,3,'Active','',2),
 (255,'2',4,13,3,'Active','',2),
 (256,'0',4,13,3,'Active','',2),
 (257,'5',4,13,3,'Active','',2),
 (258,'4',4,13,3,'Active','',2),
 (259,'6',4,13,3,'Active','',2),
 (260,'7',4,13,3,'Active','',2),
 (261,'8',4,13,3,'Active','',2),
 (262,'9',4,13,3,'Active','',2),
 (263,'2',6,13,3,'Active','',2),
 (264,'3',6,13,3,'Active','',2),
 (265,'1',6,13,3,'Active','',2),
 (266,'4',6,13,3,'Active','',2),
 (267,'5',6,13,3,'Active','',2),
 (268,'0',6,13,3,'Active','',2),
 (269,'6',6,13,3,'Active','',2),
 (270,'7',6,13,3,'Active','',2),
 (271,'8',6,13,3,'Active','',2),
 (272,'9',6,13,3,'Active','',2),
 (273,'0',7,14,3,'Active','',2),
 (274,'2',7,14,3,'Active','',2),
 (275,'5',7,14,3,'Active','',2),
 (276,'1',7,14,3,'Active','',2),
 (277,'3',7,14,3,'Active','',2),
 (278,'4',7,14,3,'Active','',2),
 (279,'6',7,14,3,'Active','',2),
 (280,'7',7,14,3,'Active','',2),
 (281,'9',7,14,3,'Active','',2),
 (282,'8',7,14,3,'Active','',2);
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
 (6,'<p>Bao ăn s&aacute;ng</p>','Pay later','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-991011255_img_icon_service.png','Full payment will be done at the hotel.\n        ','<p>Bao ăn s&aacute;ng</p>','Active',''),
 (7,'asdfasdfsafd','sdafasfd','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-1179528898_img_icon_service.png','<p>asdfasfasdfasfsafdsfad</p>','<p>sdfasfdasfdasffsdasdfdafs</p>','Remove','');
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

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
 (46,'customer_view','192.168.1.29','views','1','2020-05-17 07:45:03'),
 (47,'customer_view','127.0.0.1','views','1','2020-05-18 07:26:43'),
 (48,'customer_view','192.168.1.29','views','1','2020-05-18 07:26:50'),
 (49,'customer_view','127.0.0.1','views','1','2020-05-19 18:41:48'),
 (50,'customer_view','192.168.1.29','views','1','2020-05-19 18:42:34'),
 (51,'customer_view','127.0.0.1','views','1','2020-05-20 10:41:41'),
 (52,'customer_view','192.168.1.29','views','1','2020-05-20 10:42:12'),
 (53,'customer_view','127.0.0.1','views','1','2020-05-21 07:49:03'),
 (54,'customer_view','192.168.1.29','views','1','2020-05-21 07:49:09'),
 (55,'customer_view','127.0.0.1','views','1','2020-05-22 18:45:30'),
 (56,'customer_view','192.168.1.29','views','1','2020-05-22 18:46:15'),
 (57,'customer_view','127.0.0.1','views','1','2020-05-23 19:02:44'),
 (58,'customer_view','192.168.1.29','views','1','2020-05-23 19:03:07'),
 (59,'customer_view','127.0.0.1','views','1','2020-05-24 10:33:27'),
 (60,'customer_view','192.168.1.29','views','1','2020-05-24 10:33:38'),
 (61,'customer_view','127.0.0.1','views','1','2020-05-25 07:43:21'),
 (62,'customer_view','192.168.1.29','views','1','2020-05-25 07:44:04'),
 (63,'customer_view','127.0.0.1','views','1','2020-05-26 19:02:50'),
 (64,'customer_view','192.168.1.29','views','1','2020-05-26 19:02:57'),
 (65,'customer_view','127.0.0.1','views','1','2020-05-27 15:53:30'),
 (66,'customer_view','192.168.1.29','views','1','2020-05-27 15:53:37'),
 (67,'customer_view','127.0.0.1','views','1','2020-05-28 11:13:07'),
 (68,'customer_view','192.168.1.29','views','1','2020-05-28 11:13:56');
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
 (5,'Xe riêng từ khu nghỉ dưỡng đến sân bay Tân Sơn Nhất / trung tâm thành phố TP.HCM','Private car from Resort to Tan Son Nhat airport / HCMC downtown','Xe riêng - Khoảng cách 200km - Thời gian 4 giờ - Giá: 3.118.500 đồng / xe / chiều - Tối đa 04 người','Private vehicle - Distance 200km - Duration 4 hours - Price: VND 3,118,500/ vehicle/ way - Maximum 04 persons',275000,'Remove',''),
 (6,'Xe riêng từ sân bay Tân Sơn Nhất / trung tâm thành phố TP.HCM đến Resort','Private car from Tan Son Nhat airport / HCMC downtown to Resort','<p>Xe ri&ecirc;ng - Khoảng c&aacute;ch 200km - Thời gian 4 giờ - Gi&aacute;: 3.118.500 đồng / xe / chiều - Tối đa 04 người</p>','<p>Private vehicle - Distance 200km - Duration 4 hours - Price: VND 3,118,500/ vehicle/ way - Maximum 04 persons</p>',3118500,'Active',''),
 (7,'vũ','vũ','h','h',0,'Remove',''),
 (8,'asfasfd asdfasdf','asdfasfdsdfa sadfasdf','asdfasfasfasdf','asdfasfdasfdasfdasfasdf',10000000,'Active',''),
 (9,'vũasdfasf','vũ','asdfasf','asfasf',4646456456,'Active',''),
 (10,'Private car from Phu Bai airport/Hue city to Resort','Private car from Phu Bai airport/Hue city to Resort','','<p><span style=\"color: ',0,'Remove','');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport_region`
--

/*!40000 ALTER TABLE `transport_region` DISABLE KEYS */;
INSERT INTO `transport_region` (`id`,`transport_id`,`region_id`) VALUES 
 (3,5,11),
 (4,6,11);
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
