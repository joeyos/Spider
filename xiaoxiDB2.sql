-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` varchar(64) NOT NULL,
  `sno` bigint(16) unsigned DEFAULT NULL COMMENT 'ѧ��',
  `sno_password` varchar(255) DEFAULT NULL COMMENT '��������',
  `name` varchar(255) DEFAULT NULL COMMENT '��ʵ����',
  `school` varchar(255) DEFAULT NULL COMMENT 'ѧУ',
  `college` varchar(255) DEFAULT NULL COMMENT 'ѧԺ',
  `specialty` varchar(255) DEFAULT NULL COMMENT 'רҵ',
  `advisor` varchar(64) COMMENT '��ʦ����',
  `user_id` varchar(64) DEFAULT NULL COMMENT '�������user��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` varchar(64) NOT NULL COMMENT '����',
  `tno` bigint(16) unsigned DEFAULT NULL COMMENT '����',
  `tno_password` varchar(255) DEFAULT NULL COMMENT '��������',
  `user_id` varchar(64) DEFAULT NULL COMMENT '�������user��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL COMMENT '����',
  `course_id` varchar(64) NOT NULL COMMENT '�γ̱��',
  `name` varchar(255) NOT NULL COMMENT '�γ�����',
  `credit` tinyint(255) NOT NULL COMMENT 'ѧ��',
  `degree_course` tinyint(1) unsigned NOT NULL COMMENT '1 ��ʾ��ѧλ�� 0 ��ʾ��ѧλ��',
  `term` int(64) NOT NULL COMMENT '�Ͽ�ѧ�� �� 20160 ���һ������0��ʾ��ѧ�� 1 ��ʾ��ѧ��',
  `teacher_id` varchar(64) NOT NULL COMMENT '���������ʦid',
  `campus` varchar(64) NOT NULL COMMENT '�Ͽ�У��',
  `detail` varchar(255) NOT NULL COMMENT '�Ͽεص�/����/�ڴ�/�ܴ�',
  `classroom` int(64) unsigned NOT NULL COMMENT '�ְ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for student_course
-- ----------------------------
DROP TABLE IF EXISTS `student_course`;
CREATE TABLE `student_course` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(64) DEFAULT NULL COMMENT '�������ѧ��id',
  `course_id` varchar(64) DEFAULT NULL COMMENT '��������γ�id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
