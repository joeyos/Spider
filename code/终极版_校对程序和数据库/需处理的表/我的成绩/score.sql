/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50022
Source Host           : 127.0.0.1:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-04-10 10:04:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `id` int(11) NOT NULL COMMENT '主键',
  `stu_id` int(11) NOT NULL COMMENT '学生id外键',
  `sc_number` varchar(20) NOT NULL COMMENT '课程编号',
  `sc_name` varchar(64) NOT NULL COMMENT '课程名称',
  `credits` float NOT NULL COMMENT '学分',
  `is_degree` tinyint(4) NOT NULL COMMENT '是否学位课',
  `score` float NOT NULL COMMENT '分数',
  `credits_get` float NOT NULL COMMENT '获得学分',
  `note` varchar(20) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY  (`id`),
  KEY `FK_score_1` (`stu_id`),
  CONSTRAINT `FK_score_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
