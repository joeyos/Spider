/*
SQLyog v10.2 
MySQL - 5.1.41-community : Database - xidian
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`xidian` /*!40100 DEFAULT CHARACTER SET gbk */;

USE `xidian`;

/*Table structure for table `absence` */

DROP TABLE IF EXISTS `absence`;

CREATE TABLE `absence` (
  `ab_id` int(11) NOT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `ci_id` int(11) DEFAULT NULL,
  `ab_classnumber` tinyint(4) DEFAULT NULL,
  `course_tname` varchar(32) DEFAULT NULL,
  `ab_coursetime` datetime DEFAULT NULL,
  `ab_createtime` datetime DEFAULT NULL,
  `ab_reason` varchar(300) DEFAULT NULL,
  `ab_is_valid` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ab_id`),
  KEY `FK_t_course_absence` (`ci_id`),
  KEY `FK_t_student_absence` (`stu_id`),
  CONSTRAINT `FK_t_course_absence` FOREIGN KEY (`ci_id`) REFERENCES `courseinfo` (`ci_id`),
  CONSTRAINT `FK_t_student_absence` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `absence` */

/*Table structure for table `chatgroup` */

DROP TABLE IF EXISTS `chatgroup`;

CREATE TABLE `chatgroup` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(20) DEFAULT NULL,
  `group_level` tinyint(4) DEFAULT NULL,
  `group_createtime` datetime DEFAULT NULL,
  `group_desc` varchar(300) DEFAULT NULL,
  `group_info` varchar(1024) DEFAULT NULL,
  `group_admin` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `chatgroup` */

/*Table structure for table `cncategory` */

DROP TABLE IF EXISTS `cncategory`;

CREATE TABLE `cncategory` (
  `cncategory_id` int(11) NOT NULL,
  `cncategory_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cncategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='1 У԰����\n2 ѧУ֪ͨ\n3 ��������\n4 ��ҵ��Ϣ\n......';

/*Data for the table `cncategory` */

/*Table structure for table `cncollect` */

DROP TABLE IF EXISTS `cncollect`;

CREATE TABLE `cncollect` (
  `cncollect_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`cncollect_id`),
  KEY `FK_t_cn_collect` (`cn_id`),
  KEY `FK_t_user_cn_collect` (`user_id`),
  CONSTRAINT `FK_t_cn_collect` FOREIGN KEY (`cn_id`) REFERENCES `collegenews` (`cn_id`),
  CONSTRAINT `FK_t_user_cn_collect` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `cncollect` */

/*Table structure for table `college` */

DROP TABLE IF EXISTS `college`;

CREATE TABLE `college` (
  `college_id` int(11) NOT NULL,
  `college_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `college` */

insert  into `college`(`college_id`,`college_name`) values (1,'计算机学院');

/*Table structure for table `collegenews` */

DROP TABLE IF EXISTS `collegenews`;

CREATE TABLE `collegenews` (
  `cn_id` int(11) NOT NULL,
  `college_id` int(11) DEFAULT NULL,
  `cncategory_id` int(11) DEFAULT NULL,
  `cn_name` varchar(64) DEFAULT NULL,
  `cn_content` varchar(15000) DEFAULT NULL,
  `cn_source` varchar(20) DEFAULT NULL,
  `cn_createtime` datetime DEFAULT NULL,
  `cn_is_hot` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cn_id`),
  KEY `FK_t_news_category_1` (`cncategory_id`),
  KEY `FK_t_news_college` (`college_id`),
  CONSTRAINT `FK_t_news_category_1` FOREIGN KEY (`cncategory_id`) REFERENCES `cncategory` (`cncategory_id`),
  CONSTRAINT `FK_t_news_college` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `collegenews` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `com_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `com_content` varchar(200) DEFAULT NULL,
  `com_createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`com_id`),
  KEY `FK_t_post_comment` (`post_id`),
  KEY `FK_t_user_comment` (`user_id`),
  CONSTRAINT `FK_t_post_comment` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `FK_t_user_comment` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `comment` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `weekday` tinyint(4) DEFAULT NULL,
  `one` varchar(100) DEFAULT NULL,
  `three` varchar(100) DEFAULT NULL,
  `five` varchar(100) DEFAULT NULL,
  `seven` varchar(100) DEFAULT NULL,
  `nine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  KEY `FK_t_student_course` (`stu_id`),
  CONSTRAINT `FK_t_student_course` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gbk COMMENT='����Ҫʵ���Ͽ�����֪ͨ�����ֶλ�����ϸ���';

/*Data for the table `course` */

insert  into `course`(`course_id`,`stu_id`,`weekday`,`one`,`three`,`five`,`seven`,`nine`) values (1,4,1,'','','','',''),(2,4,2,'自然辩证法概论朱丹琼/J-2052 - 5，7 - 9，11 - 12','专业英语李长安/西-5082 - 5，7 - 9，11 - 13，15 - 18','','','云计算及虚拟化技术丁振国/J-4082 - 5，7 - 9，11 - 13，15 - 16'),(3,4,3,'基础写作秦枫/西-5072 - 17','体育白光斌/体育馆2 - 11','','','模式识别刘芳/J-4042 - 17'),(4,4,4,'','','','','模糊系统理论与应用苗启广/J-4052 - 17'),(5,4,5,'','','','','');

/*Table structure for table `course_student_mapping` */

DROP TABLE IF EXISTS `course_student_mapping`;

CREATE TABLE `course_student_mapping` (
  `cs_id` int(11) NOT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `ci_id` int(11) DEFAULT NULL,
  `classnumber` smallint(6) DEFAULT NULL COMMENT '����ҳ���ѡ��/�Ŀλ�ȡ',
  PRIMARY KEY (`cs_id`),
  KEY `FK_t_course_student` (`ci_id`),
  KEY `FK_t_student_courses` (`stu_id`),
  CONSTRAINT `FK_t_course_student` FOREIGN KEY (`ci_id`) REFERENCES `courseinfo` (`ci_id`),
  CONSTRAINT `FK_t_student_courses` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `course_student_mapping` */

/*Table structure for table `course_teacher_mapping` */

DROP TABLE IF EXISTS `course_teacher_mapping`;

CREATE TABLE `course_teacher_mapping` (
  `ct_id` int(11) NOT NULL,
  `ci_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ct_id`),
  KEY `FK_t_course_teacher` (`ci_id`),
  KEY `FK_t_teacher_courses` (`teacher_id`),
  CONSTRAINT `FK_t_course_teacher` FOREIGN KEY (`ci_id`) REFERENCES `courseinfo` (`ci_id`),
  CONSTRAINT `FK_t_teacher_courses` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `course_teacher_mapping` */

/*Table structure for table `courseinfo` */

DROP TABLE IF EXISTS `courseinfo`;

CREATE TABLE `courseinfo` (
  `ci_id` int(11) NOT NULL,
  `course_name` varchar(32) DEFAULT NULL,
  `course_credit` float DEFAULT NULL,
  `course_degree` tinyint(4) DEFAULT NULL,
  `course_season` tinyint(4) DEFAULT NULL COMMENT '2017��(20170), 2017��(20171)',
  `course_tname` varchar(32) DEFAULT NULL,
  `course_campus` varchar(10) DEFAULT NULL,
  `course_place` varchar(10) DEFAULT NULL,
  `course_week` varchar(100) DEFAULT NULL COMMENT '�����и��ַ����������޸�',
  `course_day` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ci_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `courseinfo` */

/*Table structure for table `friends` */

DROP TABLE IF EXISTS `friends`;

CREATE TABLE `friends` (
  `f_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  `friend_remark` varchar(20) DEFAULT NULL,
  `is_new` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`f_id`),
  KEY `FK_t_user_friends` (`user_id`),
  CONSTRAINT `FK_t_user_friends` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `friends` */

/*Table structure for table `post` */

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_name` varchar(20) DEFAULT NULL,
  `post_content` varchar(500) DEFAULT NULL,
  `post_createtime` datetime DEFAULT NULL,
  `post_is_hot` tinyint(4) DEFAULT NULL,
  `post_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK_t_user_post` (`user_id`),
  CONSTRAINT `FK_t_user_post` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `post` */

/*Table structure for table `postcollect` */

DROP TABLE IF EXISTS `postcollect`;

CREATE TABLE `postcollect` (
  `pcollect_id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`pcollect_id`),
  KEY `FK_t_post_collect` (`post_id`),
  KEY `FK_t_user_post_collect` (`user_id`),
  CONSTRAINT `FK_t_post_collect` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `FK_t_user_post_collect` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `postcollect` */

/*Table structure for table `school` */

DROP TABLE IF EXISTS `school`;

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL,
  `college_id` int(11) DEFAULT NULL,
  `school_name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`school_id`),
  KEY `FK_t_college_school` (`college_id`),
  CONSTRAINT `FK_t_college_school` FOREIGN KEY (`college_id`) REFERENCES `college` (`college_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `school` */

insert  into `school`(`school_id`,`college_id`,`school_name`) values (1,1,'西安电子科技大学');

/*Table structure for table `schoolnews` */

DROP TABLE IF EXISTS `schoolnews`;

CREATE TABLE `schoolnews` (
  `sn_id` int(11) NOT NULL,
  `sncategory_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `sn_name` varchar(64) DEFAULT NULL,
  `sn_content` varchar(15000) DEFAULT NULL,
  `sn_source` varchar(20) DEFAULT NULL,
  `sn_createtime` datetime DEFAULT NULL,
  `sn_is_hot` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`sn_id`),
  KEY `FK_t_news_category_2` (`sncategory_id`),
  KEY `FK_t_news_school` (`school_id`),
  CONSTRAINT `FK_t_news_category_2` FOREIGN KEY (`sncategory_id`) REFERENCES `sncategory` (`sncategory_id`),
  CONSTRAINT `FK_t_news_school` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `schoolnews` */

/*Table structure for table `score` */

DROP TABLE IF EXISTS `score`;

CREATE TABLE `score` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(12) DEFAULT NULL,
  `sc_number` varchar(20) DEFAULT NULL,
  `sc_name` varchar(64) DEFAULT NULL,
  `credits` float DEFAULT NULL,
  `is_degree` tinyint(4) DEFAULT NULL,
  `score` float DEFAULT NULL,
  `credits_get` float DEFAULT NULL,
  `note` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `stu_id` (`stu_id`),
  CONSTRAINT `score_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=gbk;

/*Data for the table `score` */

insert  into `score`(`sc_id`,`stu_id`,`sc_number`,`sc_name`,`credits`,`is_degree`,`score`,`credits_get`,`note`) values (1,4,'G00FL1020','综合英语',2,1,72,2,'正常'),(2,4,'G00HA0040','体育',0.5,0,93,0.5,'正常'),(3,4,'G00HA1010','中国特色社会主义理论与实践',2,1,85,2,'正常'),(4,4,'G00HA1012','科学道德与学风',0,1,98,0,'正常'),(5,4,'G00HA1013','科学精神与人文精神专题',1,0,85.7,1,'正常'),(6,4,'X19CS1007','组合数学',3,1,0,0,''),(8,4,'X19CS1111','人工智能',3,1,93.2,3,'正常'),(9,4,'X19CS1204','Web程序设计',2,0,87,2,'正常'),(10,4,'X19CS1900','计算机网络工程与实验',3,0,82,3,'正常'),(11,4,'G00FL1021','专业英语',1,1,0,0,''),(12,4,'G00FL1022','基础写作',1,1,0,0,''),(13,4,'G00HA0041','体育',0.5,0,0,0,''),(14,4,'G00HA1011','自然辩证法概论',1,1,0,0,''),(15,4,'X19CS1107','模糊系统理论与应用',3,0,0,0,''),(16,4,'X19CS1112','模式识别',3,1,0,0,''),(17,4,'X19CS1209','云计算及虚拟化技术',2,0,0,0,'');

/*Table structure for table `signin_stu` */

DROP TABLE IF EXISTS `signin_stu`;

CREATE TABLE `signin_stu` (
  `sis_id` int(11) NOT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `sit_id` int(11) DEFAULT NULL,
  `sis_coursename` varchar(32) DEFAULT NULL,
  `sis_season` smallint(6) DEFAULT NULL,
  `sis_teachername` varchar(32) DEFAULT NULL,
  `sis_classnumber` tinyint(4) DEFAULT NULL,
  `sis_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sis_id`),
  KEY `FK_t_student_signin` (`stu_id`),
  KEY `FK_t_teacher_student_signin` (`sit_id`),
  CONSTRAINT `FK_t_student_signin` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_t_teacher_student_signin` FOREIGN KEY (`sit_id`) REFERENCES `signin_teacher` (`sit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='ѧ����ǩ��ʱ����';

/*Data for the table `signin_stu` */

/*Table structure for table `signin_teacher` */

DROP TABLE IF EXISTS `signin_teacher`;

CREATE TABLE `signin_teacher` (
  `sit_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `sit_coursename` varchar(32) DEFAULT NULL,
  `sit_season` smallint(6) DEFAULT NULL COMMENT '����201501(2015�괺)��201502(2015����)',
  `sit_classnumber` tinyint(4) DEFAULT NULL,
  `sit_starttime` datetime DEFAULT NULL,
  PRIMARY KEY (`sit_id`),
  KEY `FK_t_teacher_signin` (`teacher_id`),
  CONSTRAINT `FK_t_teacher_signin` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='��ʦ����ǩ��ʱ����';

/*Data for the table `signin_teacher` */

/*Table structure for table `sncategory` */

DROP TABLE IF EXISTS `sncategory`;

CREATE TABLE `sncategory` (
  `sncategory_id` int(11) NOT NULL,
  `sncategory_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`sncategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='1 ѧԺ����\n2 ѧԺ��̬';

/*Data for the table `sncategory` */

/*Table structure for table `sncollect` */

DROP TABLE IF EXISTS `sncollect`;

CREATE TABLE `sncollect` (
  `sncollect_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `sn_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sncollect_id`),
  KEY `FK_t_sn_collect` (`sn_id`),
  KEY `FK_t_user_sn_collect` (`user_id`),
  CONSTRAINT `FK_t_sn_collect` FOREIGN KEY (`sn_id`) REFERENCES `schoolnews` (`sn_id`),
  CONSTRAINT `FK_t_user_sn_collect` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `sncollect` */

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `stu_name` varchar(20) DEFAULT NULL,
  `stu_number` varchar(20) DEFAULT NULL,
  `stu_password` varchar(32) DEFAULT NULL,
  `major` varchar(32) DEFAULT NULL,
  `advisor` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`stu_id`),
  KEY `FK_t_school_student` (`school_id`),
  KEY `FK_t_user_student2` (`user_id`),
  CONSTRAINT `FK_t_school_student` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`),
  CONSTRAINT `FK_t_user_student2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk;

/*Data for the table `student` */

insert  into `student`(`stu_id`,`user_id`,`school_id`,`stu_name`,`stu_number`,`stu_password`,`major`,`advisor`) values (4,1,1,'张一倩','1603121590','202648','计算机科学与技术','鱼滨');

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `school_id` int(11) DEFAULT NULL,
  `teacher_name` varchar(32) DEFAULT NULL,
  `teacher_number` varchar(32) DEFAULT NULL,
  `teacher_password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `FK_t_school_teacher` (`school_id`),
  KEY `FK_t_user_teacher2` (`user_id`),
  CONSTRAINT `FK_t_school_teacher` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`),
  CONSTRAINT `FK_t_user_teacher2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `teacher` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `user_name` varchar(32) DEFAULT NULL,
  `user_password` varchar(32) DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `reg_time` datetime DEFAULT NULL,
  `Identification` tinyint(4) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `authority` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_t_user_student` (`stu_id`),
  KEY `FK_t_user_teacher` (`teacher_id`),
  CONSTRAINT `FK_t_user_student` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_id`),
  CONSTRAINT `FK_t_user_teacher` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `user` */

insert  into `user`(`user_id`,`teacher_id`,`stu_id`,`user_name`,`user_password`,`sex`,`phone`,`picture`,`reg_time`,`Identification`,`birth`,`authority`) values (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `user_group` */

DROP TABLE IF EXISTS `user_group`;

CREATE TABLE `user_group` (
  `ug_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `group_username` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ug_id`),
  KEY `FK_t_group_mapping` (`group_id`),
  KEY `FK_t_user_mapping` (`user_id`),
  CONSTRAINT `FK_t_group_mapping` FOREIGN KEY (`group_id`) REFERENCES `chatgroup` (`group_id`),
  CONSTRAINT `FK_t_user_mapping` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

/*Data for the table `user_group` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
