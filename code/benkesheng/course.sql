/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.13-log : Database - benkesheng
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`benkesheng` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `benkesheng`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` varchar(64) DEFAULT 'NULL' COMMENT '课程号',
  `course_name` varchar(255) DEFAULT 'NULL' COMMENT '课程名',
  `course_num` varchar(20) DEFAULT 'NULL' COMMENT '课序名',
  `credit` varchar(10) DEFAULT 'NULL' COMMENT '学分',
  `course_attr` varchar(30) DEFAULT 'NULL' COMMENT '课程属性',
  `teacher_name` varchar(255) DEFAULT 'NULL' COMMENT '教师姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`course_id`,`course_name`,`course_num`,`credit`,`course_attr`,`teacher_name`) values (1,'PY5001','光纤通信系统与光网络','01','3.0','学院选修','冯喆珺*'),(2,'PY5005','生物光子学','01','2.0','学院选修','刘立新*'),(3,'PY3010','激光原理与技术','01','3.0','学院选修','鲁振中*'),(4,'PY3011','光传输与光纤技术','01','3.0','学院选修','孙艳玲*'),(5,'PY3014','光电子技术','01','3.0','学院选修','曹长庆* 冯喆珺'),(6,'HA1007-05','就业指导','05','1.5','必修','马富强*'),(7,'HA1008-605','形势与政策（Ⅵ）','06','0.3','必修','刘天航*'),(8,'HA1007-05','就业指导','05','1.5','必修','马富强*');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
