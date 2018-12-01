# Host: localhost  (Version 5.5.5-10.1.26-MariaDB-0+deb9u1)
# Date: 2018-12-01 04:15:21
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "artists"
#

DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "artists"
#

INSERT INTO `artists` VALUES (1,'AC/DC');

#
# Structure for table "eventInstances"
#

DROP TABLE IF EXISTS `eventInstances`;
CREATE TABLE `eventInstances` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `eventId` int(11) NOT NULL DEFAULT '0',
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tickets` int(11) DEFAULT NULL,
  `ticketsRemaining` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

#
# Data for table "eventInstances"
#

INSERT INTO `eventInstances` VALUES (1,1,'2018-12-08','21:00:00','2018-11-30 04:09:56',30000,0),(2,1,'2018-12-09','21:00:00','2018-11-30 04:10:05',30000,0);

#
# Structure for table "events"
#

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text,
  `ticketprice` float NOT NULL DEFAULT '0',
  `artistId` int(11) DEFAULT NULL,
  `locationId` int(255) DEFAULT NULL,
  `imgcover` varchar(20) NOT NULL DEFAULT '0',
  `eventType` int(2) NOT NULL DEFAULT '0',
  `adminId` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "events"
#

INSERT INTO `events` VALUES (1,'AC/DC: The Razor\'s Edge','AC/DC vuelve a la Argentina después de ocho años para repetir uno de sus espectáculos más memorables. ',2500,1,1,'1.jpg',1,0,'2018-11-30 05:29:02');

#
# Structure for table "eventTypes"
#

DROP TABLE IF EXISTS `eventTypes`;
CREATE TABLE `eventTypes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "eventTypes"
#

INSERT INTO `eventTypes` VALUES (1,'Concierto');

#
# Structure for table "locations"
#

DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `lat` double NOT NULL DEFAULT '0',
  `long` double NOT NULL DEFAULT '0',
  `addresstext` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "locations"
#

INSERT INTO `locations` VALUES (1,-34.545320000000004,-58.44973999999999,'Av. Pres. Figueroa Alcorta 7597','Estadio Monumental');

#
# Structure for table "ticketsSold"
#

DROP TABLE IF EXISTS `ticketsSold`;
CREATE TABLE `ticketsSold` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `eventInstanceId` int(11) DEFAULT NULL,
  `when` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ownerId` int(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

#
# Data for table "ticketsSold"
#

INSERT INTO `ticketsSold` VALUES (21,2,'2018-12-01 00:55:50',1,NULL),(22,2,'2018-12-01 00:56:39',1,NULL),(23,2,'2018-12-01 01:07:47',1,NULL),(24,2,'2018-12-01 01:10:18',1,NULL),(25,1,'2018-12-01 01:17:00',1,NULL),(26,1,'2018-12-01 01:17:00',1,NULL),(27,1,'2018-12-01 01:17:00',1,NULL),(28,1,'2018-12-01 02:23:29',1,NULL),(29,1,'2018-12-01 02:23:57',1,NULL),(30,1,'2018-12-01 02:23:57',1,NULL),(31,1,'2018-12-01 02:24:33',1,NULL),(32,1,'2018-12-01 02:24:33',1,NULL),(33,1,'2018-12-01 02:26:15',1,NULL),(34,1,'2018-12-01 02:26:15',1,NULL),(35,1,'2018-12-01 03:59:58',1,NULL),(36,1,'2018-12-01 04:00:04',1,NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

#
# Data for table "users"
#

