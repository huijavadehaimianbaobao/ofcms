/*
Navicat MySQL Data Transfer

Source Server         : aa
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : 01-15

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2019-01-16 15:05:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for proxyteacherwatch
-- ----------------------------
DROP TABLE IF EXISTS `proxyteacherwatch`;
CREATE TABLE `proxyteacherwatch` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) DEFAULT NULL COMMENT '用户的openidID',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户的昵称',
  `sex` int(11) DEFAULT NULL COMMENT '用户的性别',
  `city` varchar(255) DEFAULT NULL COMMENT '用户所在城市',
  `country` varchar(255) DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(255) DEFAULT NULL COMMENT '用户所在省份',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of proxyteacherwatch
-- ----------------------------
CREATE TABLE `proxyteacherid_watch_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proxy_teacher_id` int(11) DEFAULT NULL,
  `Proxy_teacher_watch_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/* 学生表添加点位  */
alter table student add  commission int(11) default '1';
/* visit_fee 添加报销凭证 */
alter table visit_fee add reimbursement_voucher varchar(255);
