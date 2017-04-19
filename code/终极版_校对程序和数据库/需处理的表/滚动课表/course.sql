/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-10 11:39:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(64) unsigned NOT NULL auto_increment COMMENT '主键',
  `stu_id` int(11) NOT NULL COMMENT '学生id外键',
  `course_id` varchar(64) character set utf8 NOT NULL COMMENT '课程编号',
  `course_name` varchar(30) character set utf8 NOT NULL COMMENT '课程名称',
  `credit` float NOT NULL COMMENT '学分',
  `degree` tinyint(4) NOT NULL COMMENT '1 表示是学位课 0 表示非学位课',
  `term` tinyint(4) NOT NULL COMMENT '0表示上学期 1 表示下学期',
  `teacher_name` varchar(32) NOT NULL COMMENT '教师姓名',
  `campus` varchar(10) NOT NULL COMMENT '上课校区',
  `classroom` varchar(64) NOT NULL COMMENT '上课地点',
  `course_day` varchar(64) NOT NULL COMMENT '星期（存成数字 例：星期二 存2）',
  `course_time` varchar(64) NOT NULL COMMENT '节次（只存节次的第一个数字 例：1-2 存1）',
  `course_week` varchar(64) NOT NULL COMMENT '周次（按字符串存 例：2,3,4,6,7,8,9,10,11,12,13）',
  `classnumber` varchar(10) NOT NULL COMMENT '分班号',
  PRIMARY KEY  (`id`),
  KEY `FK_course_1` (`stu_id`),
  CONSTRAINT `FK_course_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of course
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
