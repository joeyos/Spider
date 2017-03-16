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

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `id` int(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `course_id` varchar(64) NOT NULL COMMENT '课程编号',
  `course_name` varchar(30) NOT NULL COMMENT '课程名称',
  `credit` float NOT NULL COMMENT '学分',
  `degree` int(1) NOT NULL COMMENT '''1 表示是学位课 0 表示非学位课',
  `term` int(1) NOT NULL COMMENT '0表示上学期 1 表示下学期',
  `teacher_name` varchar(32) NOT NULL COMMENT '教师姓名',
  `campus` varchar(64) NOT NULL COMMENT '上课校区',
  `classroom` varchar(20) DEFAULT 'NULL' COMMENT '上课地点',
  `course_day` varchar(20) DEFAULT 'NULL' COMMENT '星期（存成数字 例：星期二 存2）',
  `course_time` varchar(10) DEFAULT 'NULL' COMMENT '节次（只存节次的第一个数字 例：1-2 存1）',
  `course_week` varchar(64) DEFAULT 'NULL' COMMENT '周次（就按字符串存吧 例：2,3,4,6,7,8,9,10,11,12,13）',
  `classnumber` varchar(10) DEFAULT NULL COMMENT '分班号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

/*Data for the table `course` */

insert  into `course`(`id`,`course_id`,`course_name`,`credit`,`degree`,`term`,`teacher_name`,`campus`,`classroom`,`course_day`,`course_time`,`course_week`,`classnumber`) values (1,'G00FL1020','综合英语',2,1,0,'培养办','北校区','','','','','免修班'),(2,'G00HA1012','科学道德与学风',0,1,0,'梁昌洪','南校区','','','','','不分班'),(3,'G00HA1010','中国特色社会主义理论与实践',2,1,0,'肖群','北校区','J-201','星期一','9','2,3,4,5,7,8,9,10,11,12,13','02'),(4,'G00HA1011','自然辩证法概论',1,1,1,'朱丹琼','北校区','J-205','星期一','3','2,3,4,5,7,8,9,11,12','07'),(5,'G00FL1023','英语听说',1,1,0,'姜宁','北校区','西-508','星期二','7','2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18','07'),(6,'G00FL1026','英美文化',1,1,1,'邹甜甜','北校区','西-514','星期一','1','2,3,4,5,7,8,9,11,12,13,15,16,17,18','01'),(7,'Z00MS1031','工程优化方法及应用',3,1,0,'寇晓丽','北校区','J-205','星期四','9','2,4,5,7,8,9,10,11,13,14,15,16,17,18,19','01'),(8,'Z08EE1011','算法设计技术与方法',3,1,0,'公茂果','北校区','J-304','星期三','9','18','不分班'),(9,'Z08EE1011','算法设计技术与方法',3,1,0,'公茂果','北校区','J-304','星期五','9','2,5,7,8,9,10,11,12,13,14,15,16,17,18,20','不分班'),(10,'Z08TE1107','宽带无线通信',3,1,0,'盛敏','北校区','J-204','星期一','3','2,3,4,5,7,8,9,10,11,12,13,14,15,16,17,18','不分班'),(11,'Z08TE1107','宽带无线通信',3,1,0,'盛敏','北校区','J-204','星期四','1','2,4,8,10,12,14,16,18','不分班'),(12,'Z08TE1140','信号检测与估值理论',3,1,1,'李颖','北校区','J-208','星期三','3','2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17','不分班'),(13,'Z08TE1140','信号检测与估值理论',3,1,1,'李颖','北校区','J-208','星期五','1','2,4,6,8,10,12,14,16','不分班'),(14,'G00HA0040','体育',0.5,0,0,'白光斌','北校区','体育馆','星期三','3','3,4,5,7,8,9,10,11,12,13','01'),(15,'G00HA0041','体育',0.5,0,1,'白光斌','北校区','体育馆','星期三','5','2,3,4,5,6,7,8,9,10,11','02'),(16,'Z08TE1222','扩频通信系统',2,0,0,'刘乃安','北校区','J-205','星期二','9','4,5,7,8,9,10,11,12,13,14,15','不分班'),(17,'G00HA1016','知识产权与专利申请',1,0,0,'王喜媛','北校区','J-101','星期二','1','3,4,5,7,8,9,10,11,12','01'),(18,'G00GS1001','企业实习报告',2,0,0,'培养办','北校区','','','','','不分班'),(19,'G00GS1002','开题报告',2,0,0,'培养办','北校区','','','','','不分班'),(20,'G00GS1003','中期检查',2,0,0,'培养办','北校区','','','','','不分班'),(21,'Z08TE1212','MIMO系统与OFDM传输技术',2,0,0,'赵力强','北校区','J-204','星期二','5','3,4,5,7,8,9,10,11,12','不分班'),(22,'Z08TE1212','MIMO系统与OFDM传输技术',2,0,0,'赵力强','北校区','J-204','星期四','5','4,5,7,8,9,10,11','不分班'),(23,'Z08TE1216','图像工程',3,0,0,'卢朝阳，李静','北校区','J-208','星期五','5','2,4,5,7,8,9,10,11,12,13,14,15','不分班'),(24,'Z08EE1238','科学精神与方法专题讲座',2,0,1,'梁昌洪','北校区','图书馆报告厅（3楼）','星期四','9','3,4,5,6,7,8,9,10,11,12,13','不分班');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
