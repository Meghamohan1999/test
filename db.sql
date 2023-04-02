/*
SQLyog Community v13.1.5  (64 bit)
MySQL - 5.6.12-log : Database - scrap_net
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`scrap_net` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `scrap_net`;

/*Table structure for table `car_details` */

DROP TABLE IF EXISTS `car_details`;

CREATE TABLE `car_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `car_model` varchar(30) DEFAULT NULL,
  `engineno` varchar(20) DEFAULT NULL,
  `chasesno` varchar(30) DEFAULT NULL,
  `seater` varchar(23) DEFAULT NULL,
  `regno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `car_details` */

insert  into `car_details`(`id`,`lid`,`car_model`,`engineno`,`chasesno`,`seater`,`regno`) values 
(1,7,'dgh','123456','123456','4','kl8989'),
(2,7,'i10','qwertyuio','qwertyuiop','5','qwerty');

/*Table structure for table `carstatus` */

DROP TABLE IF EXISTS `carstatus`;

CREATE TABLE `carstatus` (
  `cid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `carstatus` */

insert  into `carstatus`(`cid`) values 
(1);

/*Table structure for table `certificate` */

DROP TABLE IF EXISTS `certificate`;

CREATE TABLE `certificate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reqid` int(11) DEFAULT NULL,
  `slid` int(11) DEFAULT NULL,
  `certificate` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `certificate` */

insert  into `certificate`(`id`,`reqid`,`slid`,`certificate`,`date`) values 
(1,1,4,'Image story-product backlog.docx','2022-03-09'),
(2,1,4,'1.png','2022-03-30');

/*Table structure for table `complaint` */

DROP TABLE IF EXISTS `complaint`;

CREATE TABLE `complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `complaint` varchar(20) DEFAULT NULL,
  `reply` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `complaint` */

insert  into `complaint`(`id`,`lid`,`complaint`,`reply`,`date`) values 
(1,7,'fjhk,','ok','2022-03-09'),
(2,7,'ghjghj','pending','2022-03-30');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`id`,`username`,`password`,`type`) values 
(1,'rto','123','admin'),
(2,'Anu@','Anukkk@123','pending'),
(3,'minu','Minu@123','pending'),
(4,'minu','123','scraper'),
(5,'xhnb','hfdchgjb','scraper'),
(6,'kichu','Kichu@123','scraper'),
(7,'anju','anju','user');

/*Table structure for table `price_info` */

DROP TABLE IF EXISTS `price_info`;

CREATE TABLE `price_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reqid` int(11) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `price_info` */

insert  into `price_info`(`id`,`reqid`,`price`) values 
(3,1,234),
(4,1,123456),
(5,1,5000),
(6,1,6000),
(7,1,50),
(8,1,25000);

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ulid` int(11) DEFAULT NULL,
  `slid` int(11) DEFAULT NULL,
  `rating` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

insert  into `rating`(`id`,`ulid`,`slid`,`rating`,`date`) values 
(1,7,4,'1234','2022-03-09'),
(2,7,5,'xgfhnb','2022-03-09');

/*Table structure for table `scrap` */

DROP TABLE IF EXISTS `scrap`;

CREATE TABLE `scrap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `place` varchar(20) DEFAULT NULL,
  `post` varchar(34) DEFAULT NULL,
  `pin` bigint(20) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `scrap` */

insert  into `scrap`(`id`,`lid`,`fname`,`lname`,`place`,`post`,`pin`,`email`,`phone`) values 
(1,4,'min','anu','shop','lkjhgf',678905,'min@gmail.com',9087654321),
(2,5,'nfhjm','mb','mnb,m','hcjhb',123456,'zfcxvcnb',98765432),
(3,6,'kichu','anu','shop','xgcjhm',678954,'kichu@gmail.com',9087654321);

/*Table structure for table `scraprequest` */

DROP TABLE IF EXISTS `scraprequest`;

CREATE TABLE `scraprequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `carid` int(11) DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `scraprequest` */

insert  into `scraprequest`(`id`,`lid`,`carid`,`status`,`date`) values 
(1,4,1,'verified','2022-03-09'),
(2,4,1,'verified','2022-03-30'),
(3,4,2,'pending','2022-03-30'),
(4,6,1,'pending','2022-03-30');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lid` int(11) DEFAULT NULL,
  `fname` varchar(30) DEFAULT NULL,
  `lname` varchar(30) DEFAULT NULL,
  `gender` varchar(30) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `post` varchar(30) DEFAULT NULL,
  `pin` bigint(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`lid`,`fname`,`lname`,`gender`,`place`,`post`,`pin`,`email`,`phone`) values 
(1,7,'sanah','kkkk','female','dfxcgvhj','dxfgch',897654,'sanah@gmail.com',8976543210);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
