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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `broadcast` */

insert  into `broadcast`(`id`,`publisher`,`time`,`title`,`content`,`user_id`) values (1,'刘昕雨','2017-03-09 16:29:41','《DSP技术及应用实验》开课通知','课程名称：DSP技术及应用实验\r\n课程编号：X16EE0902、X16EE1902、Z08EE1902\r\n任课老师：郭万有\r\n开课时间：3月18日（第三周周六）\r\n上课地点：南校区E楼II区-407\r\n    由于DSP实验室设于新校区，需要同学们自行前往新校区上课，请同学们相互转告，务必准时到课并加入QQ群：538165139，便于讨论交流。','NULL'),(2,'刘昕雨','2017-03-08 14:43:26','《非线性信号与图像处理》课程时间调整通知','课程名称：非线性信号与图像处理\r\n课程编号：X16EE0111、X16EE1111、Z08EE1344 \r\n上课时间：由03月08日(第2周星期三)晚上改到06月30日(第18周星期五)晚上\r\n上课地点：不变','NULL'),(3,'刘昕雨','2017-03-08 14:35:20','《双/多基地雷达系统》课程时间调整通知','课程名称：双/多基地雷达系统 \r\n课程编号：X17EE1276、Z08EE1275 \r\n上课时间：第2周周三晚改到第13周周三晚\r\n上课地点：不变','NULL'),(4,'雍小克','2017-03-07 15:36:18','通信网综合实验选课通知','通信网综合实验选课通知','NULL'),(5,'艾科','2017-03-07 11:46:45','X11ME1271 MEMS微尺度力学分析 上课地点调整','由机电院开设的X11ME1271 MEMS微尺度力学分析，上课地点调整为J508，上课地点不变。','NULL'),(6,'艾科','2017-03-07 11:34:24','X10ME1121/Z06ME1255模式识别原理 上课时间调整','由机电工程学院开设的X10ME1121/Z06ME1255《模式识别原理》课程，上课时间调整为周五晚（2-17周），上课地点J-501。','NULL'),(7,'杜小刚','2017-03-06 14:46:43','《信息安全综合实验》上课时间调整通知','课程名称：《信息安全综合实验》 课程编号：X31CE0900、X31CE1900 Z08CE1903，任课教师：朱辉 因任课教师出差，03月06日(第2周星期一)晚上课程调整停课一次，第三周开始上课，课程安排后延一次，请相关学生相互转告。','NULL'),(8,'刘昕雨','2017-03-05 20:47:02','《自适应图像分析与识别》上课时间调整通知','课程名称：自适应图像分析与识别\r\n课程编号：X17EE0313、X17EE1313\r\n任课教师：侯彪\r\n因任课教师出差，03月06日(第2周星期一)晚上课程调整到06月12日(第16周星期一）晚上，上课地点不变。','NULL'),(9,'艾科','2017-03-03 17:34:45','Z04/X11ME1209 可视化与虚拟设计上课地点调整','由机电工程学院开设的<Z04/X11ME1209 可视化与虚拟设计>课程，上课地点调整为主楼III-134办公/实验室，上课时间不变。','NULL'),(10,'艾科','2017-03-01 10:29:34','X33ME1254并联机器人技术课程上课地点调整的通知','由机电工程学院开设的<X33ME1254并联机器人技术>课程，上课地点调整为北校区新科技楼A201会议室，上课时间不变。','NULL');

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `kebiao` */

insert  into `kebiao`(`id`,`weeklytimes`,`monday`,`tuesday`,`wednesday`,`thursday`,`friday`,`saturday`,`sunday`,`user_id`) values (1,1,'英美文化邹甜甜/西-5142 - 5，7 - 9，11 - 13，15 - 18','','','','信号检测与估值理论李颖/J-2082，4，6，8，10，12，14，16','','','NULL'),(2,2,'','','','','',NULL,NULL,'NULL'),(3,3,'自然辩证法概论朱丹琼/J-2052 - 5，7 - 9，11 - 12','','信号检测与估值理论李颖/J-2082 - 17','','','','','NULL'),(4,4,'','','','','',NULL,NULL,'NULL'),(5,5,'','','体育白光斌/体育馆2 - 11','','','','','NULL'),(6,6,'','','','','','',NULL,'NULL'),(7,7,'','','','','','','','NULL'),(8,8,'','','','','','','','NULL'),(9,9,'','','','科学精神与方法专题讲座梁昌洪/图书馆报告厅（3楼）3 - 13','','','','NULL'),(10,10,'','','','','','',NULL,'NULL'),(11,11,'','','','','','',NULL,'NULL');

/*Table structure for table `mymessage` */

DROP TABLE IF EXISTS `mymessage`;

CREATE TABLE `mymessage` (
  `id` bigint(64) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `messagetype` varchar(255) DEFAULT 'NULL' COMMENT '消息类型',
  `content` varchar(255) DEFAULT 'NULL' COMMENT '内容',
  `user_id` varchar(255) DEFAULT 'NULL' COMMENT '我的消息外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `mymessage` */

insert  into `mymessage`(`id`,`messagetype`,`content`,`user_id`) values (1,'成绩提示','【成绩提示】你知识产权与专利申请考试成绩为78.00','NULL'),(2,'成绩提示','【成绩提示】你算法设计技术与方法考试成绩为90.00','NULL'),(3,'成绩提示','【成绩提示】你扩频通信系统考试成绩为75.00','NULL'),(4,'成绩提示','【成绩提示】你图像工程考试成绩为87.00','NULL'),(5,'成绩提示','【成绩提示】你宽带无线通信考试成绩为79.00','NULL'),(6,'成绩提示','【成绩提示】你工程优化方法及应用考试成绩为66.00','NULL'),(7,'成绩提示','【成绩提示】你中国特色社会主义理论与实践考试成绩为88.00','NULL'),(8,'成绩提示','【成绩提示】你体育考试成绩为93.00','NULL'),(9,'成绩提示','【成绩提示】你英语听说考试成绩为64.00','NULL'),(10,'成绩提示','【成绩提示】你MIMO系统与OFDM传输技术考试成绩为83.00','NULL');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `score` */

insert  into `score`(`id`,`term`,`course_id`,`name`,`credit`,`degree_course`,`score`,`gain_credit`,`remarks`,`user_id`) values (1,'2016秋','G00FL1020','综合英语','2.0','是','免修','2.0','免修','NULL'),(2,'2016秋','G00FL1023','英语听说','1.0','是','64','1.0','正常','NULL'),(3,'2016秋','G00GS1001','企业实习报告','2.0','否','','','','NULL'),(4,'2016秋','G00GS1002','开题报告','2.0','否','','','','NULL'),(5,'2016秋','G00GS1003','中期检查','2.0','否','','','','NULL'),(6,'2016秋','G00HA0040','体育','0.5','否','93','0.5','正常','NULL'),(7,'2016秋','G00HA1010','中国特色社会主义理论与实践','2.0','是','88','2.0','正常','NULL'),(8,'2016秋','G00HA1012','科学道德与学风','0.0','是','100','0','正常','NULL'),(9,'2016秋','G00HA1016','知识产权与专利申请','1.0','否','78','1.0','正常','NULL'),(10,'2016秋','Z00MS1031','工程优化方法及应用','3.0','是','66','3.0','正常','NULL'),(11,'2016秋','Z08EE1011','算法设计技术与方法','3.0','是','90','3.0','正常','NULL'),(12,'2016秋','Z08TE1107','宽带无线通信','3.0','是','79','3.0','正常','NULL'),(13,'2016秋','Z08TE1212','MIMO系统与OFDM传输技术','2.0','否','83','2.0','正常','NULL'),(14,'2016秋','Z08TE1216','图像工程','3.0','否','87','3.0','正常','NULL'),(15,'2016秋','Z08TE1222','扩频通信系统','2.0','否','75','2.0','正常','NULL'),(16,'2017春','G00FL1026','英美文化','1.0','是','','','','NULL'),(17,'2017春','G00HA0041','体育','0.5','否','','','','NULL'),(18,'2017春','G00HA1011','自然辩证法概论','1.0','是','','','','NULL'),(19,'2017春','Z08EE1238','科学精神与方法专题讲座','2.0','否','','','','NULL'),(20,'2017春','Z08TE1140','信号检测与估值理论','3.0','是','','','','NULL');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`sno`,`sno_password`,`name`,`school`,`college`,`enrollmentdate`,`researchdir`,`specialty`,`advisor`,`user_id`) values (1,1601120338,NULL,'肖洒','NULL','通信工程学院','2016-08-30','图像视频信息处理及多媒体通信技术','电子与通信工程','杜建超',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
