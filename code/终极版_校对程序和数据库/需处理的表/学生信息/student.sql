/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-10 11:34:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(11) NOT NULL COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '用户id外键',
  `school_id` int(11) NOT NULL COMMENT '学院id外键',
  `stu_name` varchar(20) NOT NULL COMMENT '学生姓名',
  `stu_number` varchar(20) NOT NULL COMMENT '学号',
  `stu_password` varchar(32) NOT NULL COMMENT '密码',
  `enrollmentdate` date NOT NULL COMMENT '注册时间',
  `major` varchar(32) NOT NULL COMMENT '专业',
  `researchField` varchar(32) NOT NULL COMMENT '研究方向',
  `advisor` varchar(20) NOT NULL COMMENT '导师',
  PRIMARY KEY  (`id`),
  KEY `FK_student_1` (`user_id`),
  KEY `FK_student_2` (`school_id`),
  CONSTRAINT `FK_student_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_student_2` FOREIGN KEY (`school_id`) REFERENCES `school` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
