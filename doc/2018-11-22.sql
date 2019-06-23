alter table exam_name drop primary key;

ALTER TABLE exam_name add id int(11) primary key NOT NULL auto_increment;

ALTER TABLE exam_name ADD INDEX name (name);