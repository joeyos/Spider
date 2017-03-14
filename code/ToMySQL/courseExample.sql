-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `course_id` varchar(64) NOT NULL COMMENT '课程编号',
  `course_name` varchar(30) NOT NULL COMMENT '课程名称',
  `credit` float NOT NULL COMMENT '学分',
  `degree` tinyint(1) unsigned NOT NULL COMMENT '1 表示是学位课 0 表示非学位课',
  `term` int(11) NOT NULL COMMENT '上课学期 如 20160 最后一个数字0表示上学期 1 表示下学期',
  `teacher_name` varchar(32) NOT NULL COMMENT '教师姓名',
  `campus` varchar(10) NOT NULL COMMENT '上课校区',
  `course_place` varchar(20) NOT NULL COMMENT '上课地点',
  `course_day` int NOT NULL COMMENT '星期（存成数字 例：星期二 存2）',
  `course_time` int NOT NULL COMMENT '节次（只存节次的第一个数字 例：1-2 存1）',
  `course_week` varchar(100) NOT NULL COMMENT '周次（就按字符串存吧 例：2,3,4,6,7,8,9,10,11,12,13）'
  `classnumber` int(10) unsigned NOT NULL COMMENT '分班号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//别忘了表中还有一个指向student表的外键（student_id）