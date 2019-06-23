/*
Navicat MySQL Data Transfer

Source Server         : lx
Source Server Version : 50641
Source Host           : localhost:3306
Source Database       : proxy_manage

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2019-03-19 09:46:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for proxy_teacher_point
-- ----------------------------
DROP TABLE IF EXISTS `proxy_teacher_point`;
CREATE TABLE `proxy_teacher_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `point` varchar(255) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `proxy_teacher_id` int(11) NOT NULL,
  `enddatemax` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proxy_teacher_point
-- ----------------------------
