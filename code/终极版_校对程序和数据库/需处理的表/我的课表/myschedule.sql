/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-07 17:27:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for myschedule
-- ----------------------------
DROP TABLE IF EXISTS `myschedule`;
CREATE TABLE `myschedule` (
  `id` int(11) NOT NULL auto_increment,
  `stu_id` int(11) NOT NULL COMMENT '学生id外键',
  `weekday` tinyint(4) NOT NULL COMMENT '星期号（0周日，1周一，2周二...）',
  `one` varchar(100) default NULL COMMENT '1,2节次',
  `three` varchar(100) default NULL COMMENT '3,4节次',
  `five` varchar(100) default NULL COMMENT '5,6节次',
  `seven` varchar(100) default NULL COMMENT '7,8节次',
  `nine` varchar(100) default NULL COMMENT '9,10节次',
  PRIMARY KEY  (`id`),
  KEY `FK_mySchedule_1` (`stu_id`),
  CONSTRAINT `FK_mySchedule_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of myschedule
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
