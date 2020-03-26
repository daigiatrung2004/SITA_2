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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_room`
--



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
  `expired_date` datetime NOT NULL,
  PRIMARY KEY (`promote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `promote`
--




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
  CONSTRAINT `fk_room_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`),
  CONSTRAINT `fk_room_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`),
  constraint fk_room_price foreign key(`price_id`) references `price_room`(`price_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
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
  `status` varchar(12) DEFAULT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service`
--

/*!40000 ALTER TABLE `service` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `service_room` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload_resource`
--





/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
