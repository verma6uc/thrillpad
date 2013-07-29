/*
SQLyog Trial v11.13 (64 bit)
MySQL - 5.5.32 : Database - kkk
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kkk` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `kkk`;

/*Table structure for table `states` */

DROP TABLE IF EXISTS `states`;

CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scode` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `map` varchar(255) DEFAULT NULL,
  `description` text,
  `history` text,
  `slug` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT NULL,
  `is_created` tinyint(1) DEFAULT NULL,
  `gallerable_id` int(11) DEFAULT NULL,
  `gallerable_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `states` */

insert  into `states`(`id`,`scode`,`title`,`country_id`,`map`,`description`,`history`,`slug`,`is_featured`,`is_created`,`gallerable_id`,`gallerable_type`,`created_at`,`updated_at`) values (1,'RJ','Rajasthan',1,'Rajasthan','','','rajasthan',1,1,NULL,NULL,'2013-07-07 14:10:59','2013-07-07 14:10:59'),(2,'UP','Uttar Prdesh',1,NULL,NULL,NULL,'up',1,1,NULL,NULL,'2013-07-07 08:07:23','2013-07-07 08:07:20'),(3,'KA','Karnataka',1,NULL,NULL,NULL,'karnataka',1,1,NULL,NULL,'2013-07-07 22:06:18','2013-07-07 22:06:21'),(4,'AP','Andhra Pradesh',1,NULL,NULL,NULL,'andhra_pradesh',1,1,NULL,NULL,'2013-07-07 22:06:18','2013-07-07 22:06:21'),(5,'AR','Arunachal Pradesh',1,NULL,NULL,NULL,'Arunachal_Pradesh',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(6,'CT','Chhattisgarh',1,NULL,NULL,NULL,'Chhattisgarh',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(7,'CA','Goa',1,NULL,NULL,NULL,'Goa',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(8,'CJ','Gujarat',1,NULL,NULL,NULL,'Gujarat',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(9,'HR','Haryana',1,NULL,NULL,NULL,'haryana',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(10,'HP','Himachal Pradesh',1,NULL,NULL,NULL,'himachal_pradesh',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(11,'JK','Jammu & Kashmir',1,NULL,NULL,NULL,'jammu_and_kashmir',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(12,'JH','Jharkhand',1,NULL,NULL,NULL,'jharkhand',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(14,'KL','Kerala',1,NULL,NULL,NULL,'kerala',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(15,'MP','Madhya Pradesh',1,NULL,NULL,NULL,'madhya_pradesh',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(16,'MH','Maharashtra',1,NULL,NULL,NULL,'maharashtra',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(17,'MN','Manipur',1,NULL,NULL,NULL,'manipur',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(18,'ML','Meghalaya',1,NULL,NULL,NULL,'meghalaya',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(19,'MZ','Mizoram',1,NULL,NULL,NULL,'mizoram',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(20,'NL','Nagaland',1,NULL,NULL,NULL,'nagaland',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(21,'OR','Odisha',1,NULL,NULL,NULL,'odisha',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(22,'PB','Punjab',1,NULL,NULL,NULL,'punjab',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(23,'AS','Assam',1,NULL,NULL,NULL,'Assam',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(24,'SK','Sikkim',1,NULL,NULL,NULL,'sikkim',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(25,'TN','Tamil Nadu',1,NULL,NULL,NULL,'tamil_nadu',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(26,'TR','Tripura',1,NULL,NULL,NULL,'tripura',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(27,'UT','Uttarakhand',1,NULL,NULL,NULL,'uttarakhand',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(28,'BR','Bihar',1,NULL,NULL,NULL,'Bihar',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(29,'WB','West Bengal',1,NULL,NULL,NULL,'west_bengal',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(30,'AN','Andaman & Nicobar',1,NULL,NULL,NULL,'andaman_and_nicobar',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(31,'CH','Chandigarh',1,NULL,NULL,NULL,'chandigarh',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(32,'DN','Dadra and Nagar Haveli',1,NULL,NULL,NULL,'dadra_and_nagar_haveli',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(33,'DD','Daman & Diu',1,NULL,NULL,NULL,'daman_and_diu',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(34,'DL','Delhi',1,NULL,NULL,NULL,'delhi',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(35,'LD','Lakshadweep',1,NULL,NULL,NULL,'lakshadweep',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25'),(36,'PY','Puducherry',1,NULL,NULL,NULL,'puducherry',1,1,NULL,NULL,'2013-06-29 19:07:25','2013-06-29 19:07:25');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
