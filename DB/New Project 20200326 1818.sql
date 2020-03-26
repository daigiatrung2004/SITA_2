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
  `status` varchar(12) NOT NULL,
  `remark` varchar(1000) DEFAULT NULL,
  `code_booking` longtext NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `fk_booking_kind` (`kind_room_id`),
  KEY `fk_booking_customer` (`customer_id`),
  KEY `fk_booking_region` (`region_id`),
  KEY `fk_booking_room` (`room_id`),
  CONSTRAINT `fk_booking_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_booking_kind` FOREIGN KEY (`kind_room_id`) REFERENCES `kind_room` (`kind_room_id`),
  CONSTRAINT `fk_booking_region` FOREIGN KEY (`region_id`) REFERENCES `region` (`region_id`),
  CONSTRAINT `fk_booking_room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `booking`
--

/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`booking_id`,`customer_id`,`start_booking_date`,`check_in_date`,`check_out_date`,`kind_room_id`,`region_id`,`room_id`,`status`,`remark`,`code_booking`) VALUES 
 (8,25,'2020-03-26 00:00:00','2020-03-26 14:00:00','2020-04-26 12:00:00',2,11,7,'Active','','pqi+hbMvjZdtE5OyTIcuvg==');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;


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
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`customer_id`,`email`,`sankey`,`encryptpass`,`start_date`,`contact_person`,`verify_person`,`status`,`remark`,`firstname`,`lastname`) VALUES 
 (25,'vuyeuai_007@yahoo.com','874531394','pqi+hbMvjZdtE5OyTIcuvg==','2020-03-26 00:00:00','2688659','025727433','Active','','dao','vu');
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
  `name_vi` varchar(200) DEFAULT NULL,
  `name_en` varchar(200) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `status` varchar(100) NOT NULL,
  `remark` longtext NOT NULL,
  PRIMARY KEY (`id_fees`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `other_fees`
--

/*!40000 ALTER TABLE `other_fees` DISABLE KEYS */;
INSERT INTO `other_fees` (`id_fees`,`name_vi`,`name_en`,`price`,`status`,`remark`) VALUES 
 (1,'Phí dịch vụ','Service charge',162000,'Active',''),
 (2,'xdfxdsfd dfd','fdfxdxfxd xdfxdf',0,'Active',''),
 (3,'asdfasfdasd asfasd','asdfasffdsasdf asdfasfasf',10000000,'Active',''),
 (4,'asdfasfasf asdfasdf','asfasfasdffd',4564579789798,'Active','');
/*!40000 ALTER TABLE `other_fees` ENABLE KEYS */;


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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `price_room`
--

/*!40000 ALTER TABLE `price_room` DISABLE KEYS */;
INSERT INTO `price_room` (`price_id`,`type_price_room_vi`,`type_price_room_en`,`price_1_night`,`kind_room_id`,`status`,`remark`) VALUES 
 (3,'Thanh toán online','Online Exclusive Rate',454646132,2,'Active',''),
 (4,'Tỉ lệ tiêu chuẩn','Standard Rate',1000000,2,'Active','');
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
  `name_vi` varchar(200) NOT NULL,
  `name_en` varchar(200) NOT NULL,
  `status` varchar(12) NOT NULL,
  `remark` longtext,
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `region`
--

/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` (`region_id`,`name_vi`,`name_en`,`status`,`remark`) VALUES 
 (11,'Khu nghỉ dưỡng khách sạn Phan Thiết','Victoria Phan Thiet beach resort','Active','');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `room`
--

/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`room_id`,`name`,`kind_room_id`,`region_id`,`price_id`,`status`,`remark`,`max_peopel`) VALUES 
 (7,'Phòng số 1',2,11,3,'Active','',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `service`
--

/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` (`id_service`,`service_name_vi`,`servict_name_en`,`file_img_url`,`service_details_vi`,`service_details_en`,`status`,`remark`) VALUES 
 (3,'Bao gồm bữa sáng','Breakfast included','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-449185626_img_icon_service.png','Free breakfast\n        ','Miễn phí bữa sáng\n        ','Active',''),
 (4,'Không thể hủy và thay đổi','Non-cancellable, non modifiable','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-1451322165_img_icon_service.png','In case of no-show, a penalty of 100% will apply.\n        ','Nếu quý khách không đến, mức phạt 100% sẽ được áp dụng.\n        ','Active',''),
 (5,'Thanh toán ngay','Pay now','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\1841335556_img_icon_service.png','The full amount of the reservation will be charged on your credit card shortly after your booking is confirmed.\n        ','Toàn bộ chi phí đặt phòng sẽ được khấu trừ vào thẻ tín dụng của quý khách ngay sau khi đặt phòng được xác nhận.\n        ','Active',''),
 (6,'Thanh toán sau','Pay later','C:\\Users\\ADMIN\\IdeaProjects\\SITA\\managementHotel\\src\\main\\webapp\\img\\zoom\\service\\-991011255_img_icon_service.png','Full payment will be done at the hotel.\n        ','Quý khách sẽ thanh toán toàn bộ tại khách sạn.\n        ','Active','');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transport`
--

/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` (`transport_id`,`name_vi`,`name_en`,`details_vi`,`details_en`,`price`,`status`,`remark`) VALUES 
 (5,'Xe riêng từ khu nghỉ dưỡng đến sân bay Tân Sơn Nhất / trung tâm thành phố TP.HCM','Private car from Resort to Tan Son Nhat airport / HCMC downtown','Xe riêng - Khoảng cách 200km - Thời gian 4 giờ - Giá: 3.118.500 đồng / xe / chiều - Tối đa 04 người','Private vehicle - Distance 200km - Duration 4 hours - Price: VND 3,118,500/ vehicle/ way - Maximum 04 persons',275000,'Active',''),
 (6,'Xe riêng từ sân bay Tân Sơn Nhất / trung tâm thành phố TP.HCM đến Resort','Private car from Tan Son Nhat airport / HCMC downtown to Resort','Xe riêng - Khoảng cách 200km - Thời gian 4 giờ - Giá: 3.118.500 đồng / xe / chiều - Tối đa 04 người','Private vehicle - Distance 200km - Duration 4 hours - Price: VND 3,118,500/ vehicle/ way - Maximum 04 persons',275000,'Active',''),
 (7,'vũ','vũ','h','h',0,'Active',''),
 (8,'asfasfd asdfasdf','asdfasfdsdfa sadfasdf','asdfasfasfasdf','asdfasfdasfdasfdasfasdf',10000000,'Active',''),
 (9,'vũasdfasf','vũ','asdfasf','asfasf',4646456456,'Active','');
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
