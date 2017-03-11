/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.13-log : Database - test3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test3` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `test3`;

/*Table structure for table `broadcast` */

DROP TABLE IF EXISTS `broadcast`;

CREATE TABLE `broadcast` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT,
  `publisher` varchar(255) DEFAULT 'NULL' COMMENT '发布人',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `title` varchar(255) DEFAULT 'NULL' COMMENT '标题',
  `content` varchar(255) DEFAULT 'NULL' COMMENT '内容',
  `user_id` varchar(255) DEFAULT 'NULL' COMMENT '通知公告的外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `broadcast` */

/*Table structure for table `kebiao` */

DROP TABLE IF EXISTS `kebiao`;

CREATE TABLE `kebiao` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `weeklytimes` int(64) DEFAULT NULL COMMENT '星期节次',
  `monday` varchar(255) DEFAULT 'NULL' COMMENT '星期一',
  `tuesday` varchar(255) DEFAULT 'NULL' COMMENT '星期二',
  `wednesday` varchar(255) DEFAULT 'NULL' COMMENT '星期三',
  `thursday` varchar(255) DEFAULT 'NULL' COMMENT '星期四',
  `friday` varchar(255) DEFAULT 'NULL' COMMENT '星期五',
  `saturday` varchar(255) DEFAULT 'NULL' COMMENT '星期六',
  `sunday` varchar(255) DEFAULT 'NULL' COMMENT '星期日',
  `user_id` varchar(64) DEFAULT 'NULL' COMMENT '课表外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `kebiao` */

/*Table structure for table `mymessage` */

DROP TABLE IF EXISTS `mymessage`;

CREATE TABLE `mymessage` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `messagetype` varchar(255) DEFAULT 'NULL' COMMENT '消息类型',
  `content` varchar(255) DEFAULT 'NULL' COMMENT '内容',
  `user_id` varchar(255) DEFAULT 'NULL' COMMENT '我的消息外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `mymessage` */

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `term` varchar(255) DEFAULT 'NULL' COMMENT '上课学期',
  `course_id` varchar(255) DEFAULT 'NULL' COMMENT '课程编号',
  `name` varchar(255) DEFAULT 'NULL' COMMENT '课程名称',
  `credit` varchar(255) DEFAULT 'NULL' COMMENT '课程学分',
  `degree_course` varchar(255) DEFAULT 'NULL' COMMENT '学位课',
  `score` varchar(255) DEFAULT 'NULL' COMMENT '成绩',
  `gain_credit` varchar(255) DEFAULT 'NULL' COMMENT '获得学分',
  `remarks` varchar(255) DEFAULT 'NULL' COMMENT '备注',
  `user_id` varchar(64) DEFAULT 'NULL' COMMENT '成绩外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `score` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sno` bigint(16) unsigned DEFAULT NULL COMMENT '学号',
  `sno_password` bigint(255) DEFAULT NULL COMMENT '教务处密码',
  `name` varchar(255) DEFAULT 'NULL' COMMENT '真实姓名',
  `school` varchar(255) DEFAULT 'NULL' COMMENT '学校',
  `college` varchar(255) DEFAULT 'NULL' COMMENT '学院',
  `enrollmentdate` date DEFAULT NULL COMMENT '入学年月',
  `researchdir` varchar(255) DEFAULT 'NULL' COMMENT '研究方向',
  `specialty` varchar(255) DEFAULT 'NULL' COMMENT '专业',
  `advisor` varchar(255) DEFAULT 'NULL' COMMENT '导师姓名',
  `user_id` int(64) DEFAULT NULL COMMENT '外键关联user表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
