/*
Navicat MySQL Data Transfer

Source Server         : aa
Source Server Version : 50725
Source Host           : localhost:3306
Source Database       : proxy_manage

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-03-11 15:08:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限资源表编号',
  `permission` varchar(255) DEFAULT NULL COMMENT '权限名称',
  `resource` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `available` int(11) DEFAULT NULL COMMENT '状态',
  `perCode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', '权限管理:用户管理', '/', '全部权限', null, 'users:index');
INSERT INTO `permissions` VALUES ('2', '权限管理:角色管理', null, null, null, 'roles:index');
INSERT INTO `permissions` VALUES ('4', '招生代理管理:代理老师', null, null, null, 'proxyTeacher:index');
INSERT INTO `permissions` VALUES ('5', '招生代理管理:来访记录', null, null, null, 'visitRecords:index');
INSERT INTO `permissions` VALUES ('6', '学生信息录入:学生基本信息', null, null, null, 'student:index');
INSERT INTO `permissions` VALUES ('7', '学生信息管理:学生信息修改/查询', null, null, null, 'student:indexfind');
INSERT INTO `permissions` VALUES ('8', '学生信息管理:学生报销信息修改', null, null, null, 'studentAuditing:index');
INSERT INTO `permissions` VALUES ('9', '学生缴费:学生缴费', null, null, null, 'fee:index');
INSERT INTO `permissions` VALUES ('10', '学生考试信息：成绩录入', null, null, null, 'score:addExam');
INSERT INTO `permissions` VALUES ('11', '学生考试信息：成绩查询', null, null, null, 'score:findExam');
INSERT INTO `permissions` VALUES ('12', '学生考试信息:分班操作', null, null, null, 'score:brvBar');
INSERT INTO `permissions` VALUES ('13', '学生考勤:查询班级考勤信息', null, null, null, 'attence:classAttenceCount');
INSERT INTO `permissions` VALUES ('14', '学生考勤:查询个人考勤信息', null, null, null, 'attence:studentAttence');
INSERT INTO `permissions` VALUES ('15', '学生考勤:考勤信息手动导入', null, null, null, 'attence:importAttence');
INSERT INTO `permissions` VALUES ('16', '学生考勤:学生绑定考勤信息', null, null, null, 'attence:bindingAttence');
INSERT INTO `permissions` VALUES ('17', '基础数据:专 业 表', null, null, null, 'major:major');
INSERT INTO `permissions` VALUES ('18', '基础数据:学习时长表', null, null, null, 'studyTime:studyTime');
INSERT INTO `permissions` VALUES ('19', '基础数据:学 费 表', null, null, null, 'tuition:tuition');
INSERT INTO `permissions` VALUES ('20', '基础数据:老 师 表', null, null, null, 'teacher:teacher');
INSERT INTO `permissions` VALUES ('21', '基础数据:班 级 表', null, null, null, 'classroom:classroom');
INSERT INTO `permissions` VALUES ('22', '基础数据:课 程 表', null, null, null, 'course:course');
INSERT INTO `permissions` VALUES ('23', '基础数据:学 历 表', null, null, null, 'education:education');
INSERT INTO `permissions` VALUES ('24', '基础数据:考 试 表', null, null, null, 'examName:examName');
INSERT INTO `permissions` VALUES ('25', '基础数据:级 别 表', null, null, null, 'rank:index');
INSERT INTO `permissions` VALUES ('26', '基础数据:咨询老师', null, null, null, 'advisoryTeacher:advisoryTeacher');
INSERT INTO `permissions` VALUES ('27', '基础数据:出行方式表', null, null, null, 'transportation:transportation');
INSERT INTO `permissions` VALUES ('28', '财务管理:学生来校报销：未审核', null, null, null, 'studentAuditing:unaudited');
INSERT INTO `permissions` VALUES ('29', '财务管理:学生来校报销：待报销', null, null, null, 'studentAuditing:reimburse');
INSERT INTO `permissions` VALUES ('30', '财务管理:学生来校报销：已报销', null, null, null, 'studentAuditing:reimbursed');
INSERT INTO `permissions` VALUES ('31', '财务管理:学生来校报销：作废', null, null, null, 'studentAuditing:die');
INSERT INTO `permissions` VALUES ('32', '财务管理:招生老师报销:未审核', null, null, null, 'proxyTeacherAuditing:proxyTeacherAuditing');
INSERT INTO `permissions` VALUES ('33', '财务管理:招生老师报销:待报销', null, null, null, 'proxyTeacherAuditing:proxyTeacherAuditing1');
INSERT INTO `permissions` VALUES ('34', '财务管理:招生老师报销:已报销', null, null, null, 'proxyTeacherAuditing:proxyTeacherAuditing2');
INSERT INTO `permissions` VALUES ('35', '财务管理:招生老师提成管理', null, null, null, 'commission:commissionSkip');
INSERT INTO `permissions` VALUES ('36', '财务管理:招生老师工资历史', null, null, null, 'commission:commissionSkip11');
INSERT INTO `permissions` VALUES ('37', '学生住宿管理:学生住宿', null, null, null, 'Dormitory:indexfind');
INSERT INTO `permissions` VALUES ('38', '学生住宿管理:学生查寝', null, null, null, 'CheckDormitory:indexfind');
INSERT INTO `permissions` VALUES ('39', '学生住宿管理:宿舍卫生表', null, null, null, 'sanitation:sanitation');
INSERT INTO `permissions` VALUES ('40', '谈话记录:学生谈话记录', null, null, null, 'studentConversation:studentConversation');
INSERT INTO `permissions` VALUES ('41', '谈话记录:家长谈话记录', null, null, null, 'parentConversation:parentConversation');


-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `role_name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `available` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '管理员', '拥有一切权限', null);
-- ----------------------------
-- Table structure for roles_permissions
-- ----------------------------
DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限关联表编号',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `permission_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_permissions
-- ----------------------------
INSERT INTO `roles_permissions` VALUES ('1', '1', '1');
INSERT INTO `roles_permissions` VALUES ('2', '1', '2');
INSERT INTO `roles_permissions` VALUES ('4', '1', '4');
INSERT INTO `roles_permissions` VALUES ('5', '1', '5');
INSERT INTO `roles_permissions` VALUES ('6', '1', '6');
INSERT INTO `roles_permissions` VALUES ('7', '1', '7');
INSERT INTO `roles_permissions` VALUES ('8', '1', '8');
INSERT INTO `roles_permissions` VALUES ('9', '1', '9');
INSERT INTO `roles_permissions` VALUES ('10', '1', '10');
INSERT INTO `roles_permissions` VALUES ('11', '1', '11');
INSERT INTO `roles_permissions` VALUES ('12', '1', '12');
INSERT INTO `roles_permissions` VALUES ('13', '1', '13');
INSERT INTO `roles_permissions` VALUES ('14', '1', '14');
INSERT INTO `roles_permissions` VALUES ('15', '1', '15');
INSERT INTO `roles_permissions` VALUES ('16', '1', '16');
INSERT INTO `roles_permissions` VALUES ('17', '1', '17');
INSERT INTO `roles_permissions` VALUES ('18', '1', '18');
INSERT INTO `roles_permissions` VALUES ('19', '1', '19');
INSERT INTO `roles_permissions` VALUES ('20', '1', '20');
INSERT INTO `roles_permissions` VALUES ('21', '1', '21');
INSERT INTO `roles_permissions` VALUES ('22', '1', '22');
INSERT INTO `roles_permissions` VALUES ('23', '1', '23');
INSERT INTO `roles_permissions` VALUES ('24', '1', '24');
INSERT INTO `roles_permissions` VALUES ('25', '1', '25');
INSERT INTO `roles_permissions` VALUES ('27', '1', '26');
INSERT INTO `roles_permissions` VALUES ('28', '1', '27');
INSERT INTO `roles_permissions` VALUES ('29', '1', '28');
INSERT INTO `roles_permissions` VALUES ('30', '1', '29');
INSERT INTO `roles_permissions` VALUES ('31', '1', '30');
INSERT INTO `roles_permissions` VALUES ('32', '1', '31');
INSERT INTO `roles_permissions` VALUES ('33', '1', '32');
INSERT INTO `roles_permissions` VALUES ('34', '1', '33');
INSERT INTO `roles_permissions` VALUES ('35', '1', '34');
INSERT INTO `roles_permissions` VALUES ('36', '1', '35');
INSERT INTO `roles_permissions` VALUES ('37', '1', '36');
INSERT INTO `roles_permissions` VALUES ('38', '1', '37');
INSERT INTO `roles_permissions` VALUES ('39', '1', '38');
INSERT INTO `roles_permissions` VALUES ('40', '1', '39');
INSERT INTO `roles_permissions` VALUES ('41', '1', '40');
INSERT INTO `roles_permissions` VALUES ('42', '1', '41');
INSERT INTO `roles_permissions` VALUES ('43', '2', '10');
INSERT INTO `roles_permissions` VALUES ('44', '2', '11');
INSERT INTO `roles_permissions` VALUES ('45', '2', '12');
INSERT INTO `roles_permissions` VALUES ('46', '3', '37');
INSERT INTO `roles_permissions` VALUES ('47', '3', '38');
INSERT INTO `roles_permissions` VALUES ('48', '3', '39');
INSERT INTO `roles_permissions` VALUES ('49', '3', '10');
INSERT INTO `roles_permissions` VALUES ('50', '3', '11');
INSERT INTO `roles_permissions` VALUES ('51', '3', '12');
-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `available` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '231e9d53673411ff77017454559ac348', null);
-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色关联表编号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES ('1', '1', '1');

/* 用户添加昵称 */
alter table users add name varchar(255);


