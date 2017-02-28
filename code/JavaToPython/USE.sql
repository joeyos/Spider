-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int unsigned not null auto_increment primary key,
  `sno` bigint(16) unsigned DEFAULT NULL COMMENT '学号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `academy` varchar(255) DEFAULT NULL COMMENT '学院',
  `enrollmentdate` varchar(255) DEFAULT NULL COMMENT '入学年月',
  `major` varchar(255) DEFAULT NULL COMMENT '专业',
  `advisor` varchar(64) COMMENT '导师姓名',
  `user_id` varchar(64) DEFAULT NULL COMMENT '外键关联user表'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
//元彪
CREATE TABLE `student` (
  `id` varchar(64) NOT NULL,
  `sno` bigint(16) unsigned DEFAULT NULL COMMENT '学号',
  `sno_password` varchar(255) DEFAULT NULL COMMENT '教务处密码',
  `name` varchar(255) DEFAULT NULL COMMENT '真实姓名',
  `school` varchar(255) DEFAULT NULL COMMENT '学校',
  `college` varchar(255) DEFAULT NULL COMMENT '学院',
  `specialty` varchar(255) DEFAULT NULL COMMENT '专业',
  `advisor` varchar(64) COMMENT '导师姓名',
  `user_id` varchar(64) DEFAULT NULL COMMENT '外键关联user表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `test3`.`student`(  
  `id` VARCHAR(64) NOT NULL COMMENT 'id',
  `sno` BIGINT(16) UNSIGNED DEFAULT NULL COMMENT '学号',
  `sno_password` VARCHAR(255) DEFAULT 'NULL' COMMENT '教务处密码',
  `name` VARCHAR(255) DEFAULT 'NULL' COMMENT '真实姓名',
  `school` VARCHAR(255) DEFAULT 'NULL' COMMENT '学校',
  `specialty` VARCHAR(255) DEFAULT 'NULL' COMMENT '专业',
  `advisor` VARCHAR(64) COMMENT '导师姓名',
  `user_id` VARCHAR(64) DEFAULT 'NULL' COMMENT '外键关联user表',
  PRIMARY KEY (`id`)
);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `tno` bigint(16) unsigned DEFAULT NULL COMMENT '工号',
  `tno_password` varchar(255) DEFAULT NULL COMMENT '教务处密码',
  `user_id` varchar(64) DEFAULT NULL COMMENT '外键关联user表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `course_id` varchar(64) NOT NULL COMMENT '课程编号',
  `name` varchar(255) NOT NULL COMMENT '课程名称',
  `credit` tinyint(255) NOT NULL COMMENT '学分',
  `degree_course` tinyint(1) unsigned NOT NULL COMMENT '1 表示是学位课 0 表示非学位课',
  `term` int(64) NOT NULL COMMENT '上课学期 如 20160 最后一个数字0表示上学期 1 表示下学期',
  `teacher_id` varchar(64) NOT NULL COMMENT '外键关联老师id',
  `campus` varchar(64) NOT NULL COMMENT '上课校区',
  `detail` varchar(255) NOT NULL COMMENT '上课地点/星期/节次/周次',
  `classroom` int(64) unsigned NOT NULL COMMENT '分班号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(64) DEFAULT NULL COMMENT '外键关联学生id',
  `course_id` varchar(64) DEFAULT NULL COMMENT '外键关联课程id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
