-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.9-log


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
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `customer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(120) NOT NULL,
  `sankey` varchar(200) NOT NULL,
  `encryptpass` varchar(200) NOT NULL,
  `start_date` datetime NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `verify_person` varchar(12) DEFAULT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `position_employee_id` bigint(20) DEFAULT NULL,
  `loginname` varchar(255) NOT NULL,
  `sankey` varchar(200) NOT NULL,
  `encryptpass` varchar(200) NOT NULL,
  `start_date` datetime NOT NULL,
  `address` longtext NOT NULL,
  `country` varchar(200) NOT NULL,
  `contact_person` varchar(100) NOT NULL,
  `contact_email` longtext NOT NULL,
  `salary` bigint(20) NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
  `ipAddress` varchar(100) NOT NULL,
  `last_login` datetime NOT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '""',
  `last_name` varchar(100) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employee_employee_meta` (`position_employee_id`),
  CONSTRAINT `fk_employee_employee_meta` FOREIGN KEY (`position_employee_id`) REFERENCES `postion_employee` (`position_employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`employee_id`,`position_employee_id`,`loginname`,`sankey`,`encryptpass`,`start_date`,`address`,`country`,`contact_person`,`contact_email`,`salary`,`status`,`remark`,`ipAddress`,`last_login`,`first_name`,`last_name`) VALUES 
 (1,1,'admin','1568394738','qgL+XJelKMRK+cm8pCWBng==','2020-03-01 16:52:45','536/43/56 P.10 Q.tan binh','hcm','0932688659','linkthuy9@gmail.com',8000000,'Active','','192.168.1.29','2020-03-01 16:52:45','Đào','Anh Vũ'),
 (2,22,'51603379@gmail.com','1568394738','whR50ELiSOViOQ3nNw8KBQ==','2020-03-05 06:27:21','536/43/56','Ho Chi Minh','51603379','linkthuy9@gmail.com',8000000000,'Active','','0:0:0:0:0:0:0:1','2020-03-05 06:27:21','','');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `import_export_warehouse`
--

DROP TABLE IF EXISTS `import_export_warehouse`;
CREATE TABLE `import_export_warehouse` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `type` varchar(100) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_export` (`product_id`),
  CONSTRAINT `fk_export` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `import_export_warehouse`
--

/*!40000 ALTER TABLE `import_export_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `import_export_warehouse` ENABLE KEYS */;


--
-- Definition of table `kind_room`
--

DROP TABLE IF EXISTS `kind_room`;
CREATE TABLE `kind_room` (
  `kind_room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name_vi` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`kind_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kind_room`
--

/*!40000 ALTER TABLE `kind_room` DISABLE KEYS */;
INSERT INTO `kind_room` (`kind_room_id`,`name_vi`,`name_en`,`status`,`remark`) VALUES 
 (1,'Thượng hạng','Superior','Active','');
/*!40000 ALTER TABLE `kind_room` ENABLE KEYS */;


--
-- Definition of table `postion_employee`
--

DROP TABLE IF EXISTS `postion_employee`;
CREATE TABLE `postion_employee` (
  `position_employee_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `status` varchar(12) NOT NULL,
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
  `name` longtext NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `promount` int(11) NOT NULL,
  `remark` longtext,
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
  `type_price_room_vi` varchar(200) NOT NULL,
  `type_price_room_en` varchar(200) NOT NULL,
  `price_1_night` bigint(20) NOT NULL DEFAULT '0',
  `kind_room_id` int(11) NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`price_id`),
  KEY `fk_price_kind` (`kind_room_id`),
  CONSTRAINT `fk_price_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_room`
--

/*!40000 ALTER TABLE `price_room` DISABLE KEYS */;
INSERT INTO `price_room` (`price_id`,`type_price_room_vi`,`type_price_room_en`,`price_1_night`,`kind_room_id`,`status`,`remark`) VALUES 
 (1,'Thanh toán online','Online Exclusive Rate',2346415,1,'Active','');
/*!40000 ALTER TABLE `price_room` ENABLE KEYS */;


--
-- Definition of table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_name` longtext NOT NULL,
  `product_type` varchar(200) NOT NULL,
  `price` bigint(20) NOT NULL,
  `status` varchar(200) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`product_id`)
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
  PRIMARY KEY (`promote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promote`
--

/*!40000 ALTER TABLE `promote` DISABLE KEYS */;
/*!40000 ALTER TABLE `promote` ENABLE KEYS */;


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
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`region_id`,`name_vi`,`name_en`,`status`,`remark`) VALUES 
 (8,'Khu nghỉ dưỡng khách san Victoria Phan Thiết','Victoria Phan Thiết Resort','Active',''),
 (9,'Thượng hạng','Superior','Active',''),
 (10,'Thượng hạng','Superior','Active','');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;


--
-- Definition of table `room`
--

DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `kind_room_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `max_peopel` int(10) unsigned NOT NULL,
  PRIMARY KEY (`room_id`),
  KEY `fk_room_kind` (`kind_room_id`),
  KEY `fk_room_region` (`region_id`),
  CONSTRAINT `fk_room_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`),
  CONSTRAINT `fk_room_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_id`,`name`,`kind_room_id`,`region_id`,`status`,`remark`,`max_peopel`) VALUES 
 (1,'1',1,8,'Active','',3);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload_resource`
--

/*!40000 ALTER TABLE `upload_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_resource` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
