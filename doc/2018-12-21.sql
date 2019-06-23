CREATE TABLE `student_conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '谈话记录表id',
  `student_id` int(11) NOT NULL COMMENT '谈话学生',
  `teacher_name` varchar(255) NOT NULL COMMENT '谈话老师',
  `reason` varchar(255) NOT NULL COMMENT '谈话原因',
  `student_attitude` varchar(255) NOT NULL COMMENT '学生态度',
  `conversation_time` varchar(255) NOT NULL COMMENT '谈话时间',
  `expected` int(11) NOT NULL COMMENT '是否达到预期效果',
  `pic` varchar(255) DEFAULT NULL COMMENT '谈话记录表的照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `parent_conversation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '家长谈话记录id',
  `student_id` int(11) NOT NULL COMMENT '学生 编号',
  `student_parent` varchar(255) NOT NULL COMMENT '学生父母或其他亲人',
  `teacher_name` varchar(255) NOT NULL COMMENT '谈话老师',
  `reason` varchar(255) NOT NULL COMMENT '谈话原因',
  `conversation_time` varchar(255) NOT NULL COMMENT '谈话时间',
  `pic` varchar(255) DEFAULT NULL COMMENT '谈话记录的照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `sanitation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '宿舍卫生表id',
  `dormitory_id` int(11) NOT NULL COMMENT '宿舍 编号',
  `check_date` varchar(255) NOT NULL COMMENT '检查时间',
  `grade` int(11) NOT NULL COMMENT '分数',
  `check_person` varchar(255) NOT NULL COMMENT '检查人员',
  `pic` varchar(255) DEFAULT NULL COMMENT '宿舍卫生照片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `dormitory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL COMMENT '宿舍号',
  `total` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  `create_time` varchar(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `adress` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
CREATE TABLE `student_dormitory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dormitory_id` int(11) NOT NULL COMMENT '宿舍号ID',
  `student_id` int(11) NOT NULL COMMENT '学生ID',
  `start_time` varchar(11) NOT NULL COMMENT '开始时间',
  `end_time` varchar(11) DEFAULT NULL COMMENT '结束时间',
  `dormitory_leader` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;
CREATE TABLE `check_dormitory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dormitory_id` int(11) NOT NULL,
  `check_data` varchar(255) NOT NULL,
  `actual` int(11) NOT NULL,
  `absence` int(11) NOT NULL,
  `situation` int(11) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;



alter table dormitory add hidden_delete int(2) DEFAULT null ;


alter table student add dormitorynote int(2) DEFAULT 1 ;
