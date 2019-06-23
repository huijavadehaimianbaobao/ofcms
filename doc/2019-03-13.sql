/*
Navicat MySQL Data Transfer

Source Server         : aa
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : proxy_manage

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-13 13:53:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for graduated
-- ----------------------------
DROP TABLE IF EXISTS `graduated`;
CREATE TABLE `graduated` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '就业标题',
  `create_time` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '创建时间',
  `content` text COLLATE utf8_bin COMMENT '内容文档',
  `gradution_time` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '毕业时间',
  `page_view` int(11) DEFAULT NULL COMMENT '浏览量',
   `elite` int(11) DEFAULT NULL COMMENT '1为精英，2为普通',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of graduated
-- ----------------------------

DROP TABLE IF EXISTS `app_user`;
CREATE TABLE `app_user` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) DEFAULT NULL COMMENT 'app 账号',
  `app_password` varchar(255) DEFAULT NULL COMMENT 'app  密码',
  `app_tel` varchar(255) DEFAULT NULL COMMENT '用户手机号',
  `proxy_teacher_id` int(11)  DEFAULT NULL COMMENT '招生老师 id',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;