# Host: localhost  (Version 5.5.5-10.1.26-MariaDB-0+deb9u1)
# Date: 2018-11-27 05:07:18
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `confirmationKey` varchar(32) DEFAULT NULL,
  `usertype` int(1) DEFAULT '0',
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

#
# Data for table "users"
#