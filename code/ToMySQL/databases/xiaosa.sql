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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `broadcast` */

insert  into `broadcast`(`id`,`publisher`,`time`,`title`,`content`,`user_id`) values (1,'杨坤','2017-01-10 00:00:00','关于研究生1月份助研津贴发放时间的说明','各位导师、研究生：现将2017年1月份助研津贴发放相关事宜通知如下：因学校放假，故研究生助研系统提前开放。1月份助研津贴导师操作时间：即日起至2017年2月20日，研究生院2月下旬汇总并提交至财务处，财务处将于3月初发放。（另，2016年12月助研津贴将于本月中旬发放完毕）。【特别提醒：助研津贴只能使用9、201或者801开头的经费卡发放，助研津贴每年发放10个月，2月和8月不发】 特此通知。','NULL'),(2,'艾科','2017-01-10 00:00:00','《电磁兼容设计技术》考试通知','考试科目：电磁兼容设计技术，课程编号X11ME1210，Z04ME1210。考试时间：1月11日（周三）上午8:30-10:30，考试地点：西大楼205。','NULL'),(3,'艾科','2017-01-10 00:00:00','《工程有限单元法》考试通知','考试科目：工程有限单元法，课程编号X11ME1004，Z04ME1101。考试时间：1月12日（周四）晚上19:00-21:00，考试地点：阶梯教室204。','NULL'),(4,'刘昕雨','2017-01-10 00:00:00','《电磁场与微波技术》考试通知','课程名称：电磁场与微波技术\r\n课程编号：X16EE1209、Z08EE1209\r\n考试时间：1月12日（周四）19：00\r\n考试地点：J-101','NULL'),(5,'杨坤','2017-01-09 00:00:00','关于研究生1月份奖助学金发放时间的通知','各位研究生：因财务处年终决算，1月9日正式开帐，故本月研究生国家助学金和博士老生奖助金发放时间略有延迟，预计最晚本周内发放到位，请各位同学相互转达。感谢大家的理解。','NULL'),(6,'赵小燕','2017-01-04 00:00:00','《复杂系统中的电磁波》','物理与光电工程学院《复杂系统中电磁波》考试时间为1月10日下午2:30-4:30,考试地点：西大楼III-220','NULL'),(7,'赵小燕','2017-01-04 00:00:00','《红外系统》考试通知','物理与光电工程学院《红外系统》考试时间为1月5日晚7:00-9:00,考试地点西大楼III219','NULL'),(8,'赵小燕','2017-01-04 00:00:00','《现代光学前沿专题》考试通知','物理与光电工程学院《现代光学前沿专题》考试时间为1月6日下午2:30-4:30,考试地点：西大楼III220','NULL'),(9,'赵小燕','2017-01-04 00:00:00','《波传播与散射数值方法》考试通知','物理与光电工程学院《波传播与散射数值方法》考试时间为1月6日上午8:30-11:00,考试地点—西大楼III219、217','NULL'),(10,'刘昕雨','2017-01-03 00:00:00','《矩阵论》（任课教师：廖桂生）补课通知','课程名称：矩阵论\r\n任课教师：廖桂生\r\n补课时间：1月5日（周四）上午1-2节\r\n地点：J-304','NULL'),(11,'杨坤','2017-01-10 17:45:25','关于研究生1月份助研津贴发放时间的说明','各位导师、研究生：现将2017年1月份助研津贴发放相关事宜通知如下：因学校放假，故研究生助研系统提前开放。1月份助研津贴导师操作时间：即日起至2017年2月20日，研究生院2月下旬汇总并提交至财务处，财务处将于3月初发放。（另，2016年12月助研津贴将于本月中旬发放完毕）。【特别提醒：助研津贴只能使用9、201或者801开头的经费卡发放，助研津贴每年发放10个月，2月和8月不发】 特此通知。','NULL'),(12,'艾科','2017-01-10 16:38:46','《电磁兼容设计技术》考试通知','考试科目：电磁兼容设计技术，课程编号X11ME1210，Z04ME1210。考试时间：1月11日（周三）上午8:30-10:30，考试地点：西大楼205。','NULL'),(13,'艾科','2017-01-10 13:54:38','《工程有限单元法》考试通知','考试科目：工程有限单元法，课程编号X11ME1004，Z04ME1101。考试时间：1月12日（周四）晚上19:00-21:00，考试地点：阶梯教室204。','NULL'),(14,'刘昕雨','2017-01-10 10:12:09','《电磁场与微波技术》考试通知','课程名称：电磁场与微波技术\r\n课程编号：X16EE1209、Z08EE1209\r\n考试时间：1月12日（周四）19：00\r\n考试地点：J-101','NULL'),(15,'杨坤','2017-01-09 18:12:58','关于研究生1月份奖助学金发放时间的通知','各位研究生：因财务处年终决算，1月9日正式开帐，故本月研究生国家助学金和博士老生奖助金发放时间略有延迟，预计最晚本周内发放到位，请各位同学相互转达。感谢大家的理解。','NULL'),(16,'赵小燕','2017-01-04 16:53:47','《复杂系统中的电磁波》','物理与光电工程学院《复杂系统中电磁波》考试时间为1月10日下午2:30-4:30,考试地点：西大楼III-220','NULL'),(17,'赵小燕','2017-01-04 16:51:50','《红外系统》考试通知','物理与光电工程学院《红外系统》考试时间为1月5日晚7:00-9:00,考试地点西大楼III219','NULL'),(18,'赵小燕','2017-01-04 14:05:32','《现代光学前沿专题》考试通知','物理与光电工程学院《现代光学前沿专题》考试时间为1月6日下午2:30-4:30,考试地点：西大楼III220','NULL'),(19,'赵小燕','2017-01-04 14:02:59','《波传播与散射数值方法》考试通知','物理与光电工程学院《波传播与散射数值方法》考试时间为1月6日上午8:30-11:00,考试地点—西大楼III219、217','NULL'),(20,'刘昕雨','2017-01-03 14:55:53','《矩阵论》（任课教师：廖桂生）补课通知','课程名称：矩阵论\r\n任课教师：廖桂生\r\n补课时间：1月5日（周四）上午1-2节\r\n地点：J-304','NULL');

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

insert  into `kebiao`(`id`,`weeklytimes`,`monday`,`tuesday`,`wednesday`,`thursday`,`friday`,`saturday`,`sunday`,`user_id`) values (1,1,'','知识产权与专利申请王喜媛/J-1013 - 5，7 - 12','','宽带无线通信盛敏/J-2042，4，8，10，12，14，16，18','','','',NULL),(2,2,'','','','','',NULL,NULL,NULL),(3,3,'宽带无线通信盛敏/J-2042 - 5，7 - 18','','体育白光斌/体育馆3 - 5，7 - 13','','','','',NULL),(4,4,'','','','','',NULL,NULL,NULL),(5,5,'','MIMO系统与OFDM传输技术赵力强/J-2043 - 5，7 - 12','','MIMO系统与OFDM传输技术赵力强/J-2044 - 5，7 - 11','图像工程卢朝阳/J-2082，4 - 5，7 - 15','','',NULL),(6,6,'','','','',NULL,NULL,NULL,NULL),(7,7,'','英语听说姜宁/西-5082 - 5，7 - 18','','','','',NULL,NULL),(8,8,'','','','','',NULL,NULL,NULL),(9,9,'中国特色社会主义理论与实践肖群/J-2012 - 5，7 - 13','扩频通信系统刘乃安/J-2054 - 5，7 - 15','算法设计技术与方法公茂果/J-30418','工程优化方法及应用寇晓丽/J-2052，4 - 5，7 - 11，13 - 19','算法设计技术与方法公茂果/J-3042，5，7 - 18，20','','',NULL),(10,10,'','',NULL,NULL,NULL,NULL,NULL,NULL),(11,11,'','',NULL,NULL,NULL,NULL,NULL,NULL);

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

insert  into `score`(`id`,`term`,`course_id`,`name`,`credit`,`degree_course`,`score`,`gain_credit`,`remarks`,`user_id`) values (1,'2016秋','G00FL1020','综合英语','2.0','是','免修','2.0','免修','NULL'),(2,'2016秋','G00FL1023','英语听说','1.0','是','64.00','1.0','正常','NULL'),(3,'2016秋','G00GS1001','企业实习报告','2.0','否','','','','NULL'),(4,'2016秋','G00GS1002','开题报告','2.0','否','','','','NULL'),(5,'2016秋','G00GS1003','中期检查','2.0','否','','','','NULL'),(6,'2016秋','G00HA0040','体育','0.5','否','93.00','0.5','正常','NULL'),(7,'2016秋','G00HA1010','中国特色社会主义理论与实践','2.0','是','88.00','2.0','正常','NULL'),(8,'2016秋','G00HA1012','科学道德与学风','0.0','是','','','','NULL'),(9,'2016秋','G00HA1016','知识产权与专利申请','1.0','否','78.00','1.0','正常','NULL'),(10,'2016秋','Z00MS1031','工程优化方法及应用','3.0','是','66.00','3.0','正常','NULL'),(11,'2016秋','Z08EE1011','算法设计技术与方法','3.0','是','90.00','3.0','正常','NULL'),(12,'2016秋','Z08TE1107','宽带无线通信','3.0','是','79.00','3.0','正常','NULL'),(13,'2016秋','Z08TE1212','MIMO系统与OFDM传输技术','2.0','否','83.00','2.0','正常','NULL'),(14,'2016秋','Z08TE1216','图像工程','3.0','否','87.00','3.0','正常','NULL'),(15,'2016秋','Z08TE1222','扩频通信系统','2.0','否','75.00','2.0','正常','NULL'),(16,'2017春','G00FL1026','英美文化','1.0','是','','','','NULL'),(17,'2017春','G00HA0041','体育','0.5','否','','','','NULL'),(18,'2017春','G00HA1011','自然辩证法概论','1.0','是','','','','NULL'),(19,'2017春','Z08EE1238','科学精神与方法专题讲座','2.0','否','','','','NULL'),(20,'2017春','Z08TE1140','信号检测与估值理论','3.0','是','','','','NULL');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`sno`,`sno_password`,`name`,`school`,`college`,`enrollmentdate`,`researchdir`,`specialty`,`advisor`,`user_id`) values (1,1601120338,NULL,'肖洒','NULL','通信工程学院','2016-08-30','图像视频信息处理及多媒体通信技术','电子与通信工程','杜建超',NULL),(2,1601120338,NULL,'肖洒','NULL','通信工程学院','2016-08-30','图像视频信息处理及多媒体通信技术','电子与通信工程','杜建超',NULL),(3,1601120338,NULL,'肖洒','NULL','通信工程学院','2016-08-30','图像视频信息处理及多媒体通信技术','电子与通信工程','杜建超',NULL),(4,1601120338,NULL,'肖洒','NULL','通信工程学院','2016-08-30','图像视频信息处理及多媒体通信技术','电子与通信工程','杜建超',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
