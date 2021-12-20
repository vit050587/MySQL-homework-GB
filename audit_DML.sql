DROP DATABASE IF EXISTS audit;
CREATE DATABASE audit;   -- создание базы audit
USE audit;

DROP TABLE IF EXISTS `computers`;

CREATE TABLE `computers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `owner_user_id` bigint(20) unsigned NOT NULL,   -- владелец
  `computer_type_id` bigint(20) unsigned NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `serial_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,   -- серийник
  `computer_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,    -- имя компа
  UNIQUE KEY `id` (`id`),
  KEY `owner_user_id` (`owner_user_id`),
  KEY `computer_type_id` (`computer_type_id`),
  CONSTRAINT `computers_ibfk_1` FOREIGN KEY (`owner_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `computers_ibfk_2` FOREIGN KEY (`computer_type_id`) REFERENCES `computers_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Компьютеры';


LOCK TABLES `computers` WRITE;

INSERT INTO `computers` VALUES 
(1,1,1,'1984-10-15 11:27:56','RU100001','Name01'),
(2,3,2,'2004-10-01 16:00:43','RU100002','Name02'),
(3,4,1,'2000-10-23 14:41:01','RU100003','Name03'),
(4,5,2,'2019-08-31 08:29:53','RU100004','Name04'),
(5,1,1,'1988-10-18 04:09:07','RU100005','Name05'),
(6,3,2,'1992-12-02 20:40:23','RU100006','Name06'),
(7,4,1,'2008-05-08 23:11:54','RU100007','Name07'),
(8,5,2,'1986-01-15 02:11:42','RU100008','Name08'),
(9,1,1,'1988-11-25 03:57:06','RU100009','Name09'),
(10,3,2,'1973-11-30 12:38:31','RU100010','Name10');

UNLOCK TABLES;


DROP TABLE IF EXISTS `computers_type`;

CREATE TABLE `computers_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, -- ноутбук или планшет, так же при добавлении можно  указать другой тип
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип компьютерной техники';


LOCK TABLES `computers_type` WRITE;

INSERT INTO `computers_type` VALUES 
(1,'laptop','1981-02-10 19:44:40','1970-08-30 07:38:20'),
(2,'tablet','2010-02-16 01:12:47','2007-07-26 22:23:48');

UNLOCK TABLES;



DROP TABLE IF EXISTS `profiles`;

CREATE TABLE `profiles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `gender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL, -- пол 1 - муж 2 - жен
  `birthday` date DEFAULT NULL,   -- день рождения
  `created_at` datetime DEFAULT current_timestamp(), -- дата заведение УЗ
  `hometown` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Профили пользователей';



LOCK TABLES `profiles` WRITE;

INSERT INTO `profiles` VALUES 
(1,'1','2009-04-29','2012-09-04 18:47:09','Москва'),
(2,'2','1971-07-13','1977-02-14 18:46:18','Москва'),
(3,'1','2001-02-10','1976-06-11 15:57:19','Москва'),
(4,'1','1988-06-18','2016-10-04 22:47:59','Мытищи'),
(5,'1','1989-06-18','2016-10-04 22:47:59','Мытищи');

UNLOCK TABLES;



DROP TABLE IF EXISTS `software`;

CREATE TABLE `software` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `software_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  UNIQUE KEY `id` (`id`),
  KEY `software_name_idx` (`name`),
  KEY `user_id` (`user_id`),
  KEY `software_type_id` (`software_type_id`),
  CONSTRAINT `software_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `software_ibfk_2` FOREIGN KEY (`software_type_id`) REFERENCES `software_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Программное обеспечение';




LOCK TABLES `software` WRITE;

INSERT INTO `software` VALUES 
(1,1,'MS Office',6),
(2,2,'Google chrome',8),
(3,1,'Internet Explorer',9),
(4,2,'Adobe Acrobat',10),
(5,1,'Adobe Photoshop',6),
(6,2,'Яндекс Алиса',8),
(7,1,'Conter Strike',9),
(8,2,'Alloy Navigator',10),
(9,1,'DBeaver',6),
(10,2,'MS SQL Server',8);

UNLOCK TABLES;


DROP TABLE IF EXISTS `software_type`;

CREATE TABLE `software_type` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL, -- бесплатное  или лицензионное  так же можно  указать при добавление другой тип 
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Тип программного обеспечения';



LOCK TABLES `software_type` WRITE;

INSERT INTO `software_type` VALUES 
(1,'licence','1981-04-11 22:00:37','1995-02-18 04:01:56'),
(2,'free','2012-10-10 20:30:32','2007-11-17 15:33:11');

UNLOCK TABLES;


DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL, -- имя пользователя
  `lastname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,   -- фамилия пользователя
  `email` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `users_firstname_lastname_idx` (`firstname`,`lastname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='пользователи';


LOCK TABLES `users` WRITE;

INSERT INTO `users` VALUES 
(1,'Иван','Кузнецов','ivan.kuznetsov@svg.com',89347564205),
(2,'Мария','Иванова','maria.ivanova@svg.com',89514910492),
(3,'Самсон','Сидоров','samson.sidorov@svg.com',89344189383),
(4,'Алексей','Сидоров','aleksey.sidorov@svg.com',89344459173),
(5,'Александр','Васильев','aleksandr.vasiliev@svg.com',82641219264);

UNLOCK TABLES;


DROP TABLE IF EXISTS `users_hardware`;

CREATE TABLE `users_hardware` (
  `user_id` bigint(20) unsigned NOT NULL,
  `computer_id` bigint(20) unsigned NOT NULL,
  `status` enum('working_use','personal_use') COLLATE utf8mb4_unicode_ci DEFAULT 'working_use', -- статус оборудования у пользователя рабочее или передано в личное пользование
  `created_at` datetime DEFAULT current_timestamp(), -- дата выдачи
  `updated_at` datetime DEFAULT NULL ON UPDATE current_timestamp(), -- дата обновления статуса
  PRIMARY KEY (`user_id`,`computer_id`),
  KEY `computer_id` (`computer_id`),
  CONSTRAINT `users_hardware_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_hardware_ibfk_2` FOREIGN KEY (`computer_id`) REFERENCES `computers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Оборудование пользователей';


LOCK TABLES `users_hardware` WRITE;

INSERT INTO `users_hardware` VALUES 
(1,1,'personal_use','1978-09-10 16:20:16','1996-12-06 15:39:25'),
(1,5,'working_use','1988-07-06 23:06:12','1970-05-27 13:41:21'),
(1,9,'working_use','2001-06-14 07:08:45','2021-02-25 15:52:28'),
(3,2,'personal_use','1981-05-01 11:01:11','1998-08-04 08:28:54'),
(3,6,'personal_use','1984-09-25 10:34:08','2008-07-29 23:52:51'),
(3,10,'personal_use','1998-03-08 02:25:17','2007-04-30 18:19:55'),
(4,3,'working_use','2017-12-20 02:23:17','1976-08-04 09:01:10'),
(4,7,'personal_use','1990-12-11 14:48:26','2010-04-29 08:56:58'),
(5,4,'personal_use','1992-09-27 07:10:25','2010-05-03 09:59:17'),
(5,8,'working_use','1971-09-16 14:54:42','2021-05-23 15:06:07');

UNLOCK TABLES;


DROP TABLE IF EXISTS `users_software`;

CREATE TABLE `users_software` (
  `user_id` bigint(20) unsigned NOT NULL,
  `software_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`software_id`),
  KEY `software_id` (`software_id`),
  CONSTRAINT `users_software_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_software_ibfk_2` FOREIGN KEY (`software_id`) REFERENCES `software` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Программное обеспечение пользователей';



LOCK TABLES `users_software` WRITE;

INSERT INTO `users_software` VALUES 
(1,1),
(1,5),
(1,9),
(3,2),
(3,6),
(3,10),
(4,3),
(4,7),
(5,4),
(5,8);

UNLOCK TABLES;


