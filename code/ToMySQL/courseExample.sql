-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` varchar(64) NOT NULL COMMENT '����',
  `course_id` varchar(64) NOT NULL COMMENT '�γ̱��',
  `course_name` varchar(30) NOT NULL COMMENT '�γ�����',
  `credit` float NOT NULL COMMENT 'ѧ��',
  `degree` tinyint(1) unsigned NOT NULL COMMENT '1 ��ʾ��ѧλ�� 0 ��ʾ��ѧλ��',
  `term` int(11) NOT NULL COMMENT '�Ͽ�ѧ�� �� 20160 ���һ������0��ʾ��ѧ�� 1 ��ʾ��ѧ��',
  `teacher_name` varchar(32) NOT NULL COMMENT '��ʦ����',
  `campus` varchar(10) NOT NULL COMMENT '�Ͽ�У��',
  `course_place` varchar(20) NOT NULL COMMENT '�Ͽεص�',
  `course_day` int NOT NULL COMMENT '���ڣ�������� �������ڶ� ��2��',
  `course_time` int NOT NULL COMMENT '�ڴΣ�ֻ��ڴεĵ�һ������ ����1-2 ��1��',
  `course_week` varchar(100) NOT NULL COMMENT '�ܴΣ��Ͱ��ַ������ ����2,3,4,6,7,8,9,10,11,12,13��'
  `classnumber` int(10) unsigned NOT NULL COMMENT '�ְ��',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

//�����˱��л���һ��ָ��student��������student_id��