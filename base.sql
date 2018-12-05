# Host: localhost  (Version 5.5.5-10.1.37-MariaDB-0+deb9u1)
# Date: 2018-12-04 20:41:00
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "artists"
#

DROP TABLE IF EXISTS `artists`;
CREATE TABLE `artists` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `addedBy` int(11) DEFAULT NULL,
  `added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

#
# Data for table "artists"
#

INSERT INTO `artists` VALUES (1,'AC/DC',1,'2018-12-02 04:10:55'),(2,'Green Day',1,'2018-12-03 00:45:50'),(6,'Blue Man Group',1,'2018-12-03 02:05:55');

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
  `ticketsSold` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

#
# Data for table "eventInstances"
#

INSERT INTO `eventInstances` VALUES (1,1,'2018-12-08','21:00:00','2018-11-30 04:09:56',30000,10853),(2,1,'2018-12-10','21:30:00','2018-11-30 04:10:05',15000,30000),(3,1,'2018-12-09','21:00:00','2018-12-04 19:59:22',30000,0),(4,5,'2018-12-15','19:00:00','2018-12-04 19:59:22',15000,0);

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
  `imgcover` varchar(80) NOT NULL DEFAULT '0',
  `eventType` int(2) NOT NULL DEFAULT '0',
  `adminId` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

#
# Data for table "events"
#

INSERT INTO `events` VALUES (1,'AC/DC: The Razor\'s Edge','AC/DC vuelve a la Argentina después de ocho años para repetir uno de sus espectáculos más memorables.',1500,1,1,'9d8940f0bb8c7e549a32cd633bc468d0.jpg',1,1,'2018-11-30 05:29:02'),(5,'prueba','desc',1500,6,4,'37632e46286d87913830bea392f7ef61.png',1,1,'2018-12-04 17:36:44');

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
  `lon` double NOT NULL DEFAULT '0',
  `addresstext` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `addedBy` int(11) DEFAULT NULL,
  `added` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

#
# Data for table "locations"
#

INSERT INTO `locations` VALUES (1,-34.545320000000004,-58.44973999999999,'Av. Pres. Figueroa Alcorta 7597','Estadio Monumental',NULL,'2018-12-03 02:17:00'),(4,-34.6042735,-58.3884975,'Av. Corrientes 1530','Teatro General José de San Martín',1,'2018-12-03 02:39:56');

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

