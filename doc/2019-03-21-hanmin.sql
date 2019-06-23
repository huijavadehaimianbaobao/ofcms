/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.20 : Database - manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `app_index_cycle_image` */

DROP TABLE IF EXISTS `app_index_cycle_image`;

CREATE TABLE `app_index_cycle_image` (
  `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '首页轮播图图片id',
  `image_name` VARCHAR(255) NOT NULL COMMENT '图片名字',
  `image_src` VARCHAR(255) NOT NULL COMMENT '图片地址',
  `image_use` INT(11) NOT NULL COMMENT '是否使用当前图片作为轮播图：0不使用/1使用',
  PRIMARY KEY (`id`)
) ENGINE=INNODB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

/*Data for the table `app_index_cycle_image` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
