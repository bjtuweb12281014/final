create database if not exists `xues`;

USE `xues`;

/*���ݱ� `t_student` �ı�ṹ*/

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `realname` varchar(10) DEFAULT NULL,
  `num` varchar(10) DEFAULT NULL,
  `grade` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gbk;
