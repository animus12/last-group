-- Adminer 4.8.1 MySQL 8.0.33 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_code` varchar(100) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `size` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `items` (`id`, `item_code`, `name`, `category`, `description`, `size`, `price`, `date_created`) VALUES
(1,	'309874256222',	'Sample Shirt',	'Male',	'Sample only',	'MEDIUM',	500,	'2020-11-04 09:51:01'),
(8,	'248786943297',	'Try Damit',	'Female',	'Pang bata',	'LARGE',	200,	'2023-04-01 15:20:09'),
(9,	'812866022890',	'ngayon',	'Female',	'pangit',	'EXTRA SMALL',	12,	'2023-04-01 20:55:29'),
(10,	'804469072990',	'mark',	'Female',	'cutitpie',	'EXTRA LARGE',	1000,	'2023-04-01 20:55:51'),
(11,	'108213750895',	'pol',	'Female',	'pol',	'EXTRA LARGE',	1000,	'2023-04-01 20:58:23'),
(12,	'896793972322',	'Gabriela',	'Female',	'as',	'MEDIUM',	1111,	'2023-04-01 21:00:52'),
(13,	'891072227991',	'wewe',	'Female',	'wewe',	'SMALL',	2222,	'2023-04-01 21:10:06'),
(14,	'827658747152',	'popo',	'Female',	'popo',	'LARGE',	133,	'2023-04-01 21:41:28'),
(15,	'397300484471',	'papa',	'Female',	'papa',	'SMALL',	133,	'2023-04-01 21:45:16'),
(18,	'40651681137101',	'pilo',	'Male',	'dfdfdf',	'LARGE',	4,	'2023-04-10 22:31:41'),
(19,	'40671681137142',	'mikmolk',	'Male',	'dfdffdf',	'LARGE',	5,	'2023-04-10 22:32:22'),
(20,	'40671681260361',	'sirjay',	'Male',	'hehehe',	'MEDIUM',	100,	'2023-04-12 08:46:01'),
(21,	'40651684083922',	'misis',	'Male',	'asan kana',	'SMALL',	1000,	'2023-05-15 01:05:22'),
(22,	'40671684084020',	'mark',	'Male',	'kung ikaw',	'EXTRA LARGE',	100,	'2023-05-15 01:07:00'),
(24,	'40671684163992',	'marki',	'Female',	'haha',	'MEDIUM',	500,	'2023-05-15 15:19:52'),
(25,	'40651684165760',	'paloka',	'Male',	'mali',	'EXTRA SMALL',	100,	'2023-05-15 15:49:20'),
(26,	'40651684209196',	'kaka',	'Male',	'kaka',	'SMALL',	300,	'2023-05-16 03:53:16'),
(27,	'40671684211012',	'jowa',	'Female',	'jowa ko',	'MEDIUM',	500,	'2023-05-16 04:23:32'),
(28,	'40671684230007',	'cheche',	'Female',	'haha',	'EXTRA LARGE',	120,	'2023-05-16 09:40:07');

DROP TABLE IF EXISTS `receiving`;
CREATE TABLE `receiving` (
  `id` int NOT NULL AUTO_INCREMENT,
  `supplier_id` int NOT NULL,
  `description` text NOT NULL,
  `total_cost` float NOT NULL,
  `inventory_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `receiving` (`id`, `supplier_id`, `description`, `total_cost`, `inventory_ids`, `date_created`) VALUES
(2,	3,	'',	150000,	'0',	'2023-02-25 14:01:43'),
(3,	3,	'',	4000000,	'Array',	'2023-02-25 15:49:22'),
(4,	3,	'',	4000000,	'Array',	'2023-02-25 15:52:46'),
(5,	3,	'',	4000000,	'Array',	'2023-02-25 15:55:50'),
(6,	3,	'',	4000000,	'Array',	'2023-02-25 15:56:56'),
(7,	3,	'',	4000000,	'Array',	'2023-02-25 15:57:34'),
(8,	3,	'',	4000000,	'Array',	'2023-02-25 16:14:23'),
(9,	3,	'',	4000000,	'Array',	'2023-02-26 16:09:24'),
(10,	3,	'',	4000000,	'Array',	'2023-04-01 21:41:58'),
(11,	3,	'',	4000000,	'Array',	'2023-04-01 21:47:11'),
(12,	3,	'',	4000000,	'Array',	'2023-04-12 08:34:28'),
(13,	3,	'',	4000000,	'Array',	'2023-05-15 01:41:35'),
(14,	3,	'',	4000000,	'Array',	'2023-05-15 01:42:02'),
(15,	3,	'',	4000000,	'Array',	'2023-05-16 09:55:32');

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` int NOT NULL,
  `inventory_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `sales` (`id`, `user_id`, `total_amount`, `amount_tendered`, `inventory_ids`, `date_created`) VALUES
(2,	1,	750,	1000,	'12',	'2020-11-05 08:37:13'),
(3,	1,	750,	1000,	'54',	'2023-02-04 22:39:56'),
(4,	1,	500,	1000,	'13',	'2023-02-04 22:59:22'),
(5,	1,	1000,	2000,	'14',	'2023-02-12 23:49:55'),
(6,	1,	66,	500,	'15',	'2023-02-12 23:52:58'),
(7,	4,	7,	10,	'16',	'2023-02-15 22:18:06'),
(8,	4,	500,	400,	'17',	'2023-02-15 22:18:25'),
(9,	1,	1500,	2000,	'18',	'2023-02-25 12:28:49'),
(10,	1,	66,	100,	'19',	'2023-02-25 13:49:13'),
(11,	1,	1500,	3000,	'27',	'2023-02-26 13:54:11'),
(12,	1,	1400,	2000,	'29',	'2023-02-26 16:10:08'),
(13,	1,	1000,	1000,	'30',	'2023-02-26 17:56:22'),
(14,	1,	3000,	5000,	'31',	'2023-02-26 18:06:22'),
(15,	1,	14,	20,	'32',	'2023-02-26 18:12:05'),
(16,	1,	1000,	3000,	'33',	'2023-02-26 18:15:37'),
(17,	1,	2500,	5000,	'34',	'2023-03-05 16:20:41'),
(18,	1,	6000,	10000,	'35',	'2023-03-05 18:21:15'),
(19,	1,	1500,	2000,	'36',	'2023-03-05 18:25:43'),
(20,	1,	1500,	2000,	'37',	'2023-03-05 18:49:05'),
(21,	1,	10000,	11000,	'38',	'2023-03-15 13:17:23'),
(22,	1,	14,	20,	'39',	'2023-03-15 13:18:03'),
(23,	1,	1500,	2000,	'40',	'2023-03-29 09:24:08'),
(26,	1,	10500,	11000,	'43',	'2023-03-29 12:50:02'),
(27,	1,	1500,	2000,	'44',	'2023-04-01 13:04:49'),
(28,	1,	14,	20,	'45',	'2023-04-01 19:27:02'),
(29,	1,	3333,	4000,	'50',	'2023-04-12 08:35:07'),
(30,	1,	2222,	3000,	'51',	'2023-04-12 08:38:35'),
(31,	1,	5555,	6000,	'52',	'2023-04-12 08:55:13'),
(32,	1,	2527,	3000,	'53',	'2023-05-13 21:35:58'),
(33,	1,	91,	100,	'55',	'2023-05-15 01:42:53'),
(34,	1,	252,	300,	'56',	'2023-05-15 01:43:20'),
(36,	1,	2222,	3000,	'59',	'2023-05-16 09:51:37'),
(37,	1,	2222,	3000,	'60',	'2023-05-16 09:51:54');

DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1= in,2=out',
  `qty` int NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `stocks` (`id`, `item_id`, `type`, `qty`, `price`, `date_created`) VALUES
(7,	2,	1,	500,	250,	'2020-11-04 15:55:03'),
(9,	1,	1,	500,	180,	'2020-11-04 15:55:29'),
(10,	2,	2,	2,	250,	'2020-11-05 08:36:52'),
(11,	1,	2,	2,	500,	'2020-11-05 08:36:52'),
(12,	2,	2,	3,	250,	'2020-11-05 08:37:13'),
(13,	2,	2,	2,	250,	'2023-02-04 22:59:22'),
(14,	1,	2,	2,	500,	'2023-02-12 23:49:55'),
(15,	5,	2,	3,	22,	'2023-02-12 23:52:58'),
(16,	4,	2,	1,	7,	'2023-02-15 22:18:06'),
(17,	1,	2,	1,	500,	'2023-02-15 22:18:25'),
(18,	1,	2,	3,	500,	'2023-02-25 12:28:49'),
(19,	5,	2,	3,	22,	'2023-02-25 13:49:13'),
(20,	4,	1,	14,	11,	'2023-02-25 14:01:43'),
(21,	4,	1,	38,	100,	'2023-02-25 15:49:22'),
(22,	1,	1,	11,	111,	'2023-02-25 15:52:46'),
(23,	6,	1,	23,	100,	'2023-02-25 15:55:50'),
(24,	4,	1,	12,	21,	'2023-02-25 15:56:56'),
(25,	6,	1,	12,	32,	'2023-02-25 15:57:34'),
(26,	4,	1,	12,	2,	'2023-02-25 16:14:23'),
(27,	1,	2,	3,	500,	'2023-02-26 13:54:11'),
(28,	7,	1,	13,	100,	'2023-02-26 16:09:24'),
(29,	7,	2,	14,	100,	'2023-02-26 16:10:08'),
(30,	1,	2,	2,	500,	'2023-02-26 17:56:22'),
(31,	1,	2,	6,	500,	'2023-02-26 18:06:22'),
(32,	4,	2,	2,	7,	'2023-02-26 18:12:05'),
(33,	1,	2,	2,	500,	'2023-02-26 18:15:37'),
(34,	1,	2,	5,	500,	'2023-03-05 16:20:41'),
(35,	1,	2,	12,	500,	'2023-03-05 18:21:15'),
(36,	1,	2,	3,	500,	'2023-03-05 18:25:43'),
(37,	1,	2,	3,	500,	'2023-03-05 18:49:05'),
(38,	1,	2,	20,	500,	'2023-03-15 13:17:23'),
(39,	4,	2,	2,	7,	'2023-03-15 13:18:03'),
(40,	1,	2,	3,	500,	'2023-03-29 09:24:08'),
(41,	1,	2,	3,	500,	'2023-04-25 09:47:43'),
(42,	1,	2,	3,	500,	'2023-04-29 11:32:32'),
(43,	1,	2,	21,	500,	'2023-03-29 12:50:02'),
(44,	1,	2,	3,	500,	'2023-04-01 13:04:49'),
(45,	4,	2,	2,	7,	'2023-04-01 19:27:02'),
(46,	12,	1,	5000,	30,	'2023-04-01 21:23:46'),
(47,	14,	1,	1000,	5,	'2023-04-01 21:41:59'),
(48,	14,	1,	100,	21,	'2023-04-01 21:47:11'),
(49,	19,	1,	100,	100,	'2023-04-12 08:34:28'),
(50,	12,	2,	3,	1111,	'2023-04-12 08:35:07'),
(51,	12,	2,	2,	1111,	'2023-04-12 08:38:35'),
(52,	12,	2,	5,	1111,	'2023-04-12 08:55:13'),
(53,	14,	2,	19,	133,	'2023-05-13 21:35:58'),
(54,	19,	1,	25,	6,	'2023-05-15 01:42:02'),
(55,	4,	2,	13,	7,	'2023-05-15 01:42:53'),
(56,	4,	2,	36,	7,	'2023-05-15 01:43:20'),
(58,	12,	2,	2,	1111,	'2023-05-16 05:37:27'),
(59,	12,	2,	2,	1111,	'2023-05-16 09:51:37'),
(60,	12,	2,	2,	1111,	'2023-05-16 09:51:54');

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `suppliers` (`id`, `name`, `address`, `contact`, `date_created`) VALUES
(1,	'ABC Apparel',	'CBD St., EFG City',	'+6948 8542 623',	'2020-11-04 09:33:26'),
(2,	'Men Apparel',	'Sample Address',	'65524556',	'2020-11-04 09:33:48'),
(3,	'Ladies Apparel',	'Company address',	'65524556',	'2020-11-04 09:34:15'),
(4,	'Trends Apparel',	'Sample Address',	'8747808787',	'2020-11-04 09:34:37'),
(5,	'cheicken',	'animus',	'8445975',	'2023-05-16 09:42:07');

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1,	'Clothing Store Management System',	'mypersonalacount4@gmail.com',	'3434',	'1677304680_haha.jpg',	'');

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1=Admin,2=Staff',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1,	'admin',	'admin',	'0192023a7bbd73250516f069df18b500',	1),
(12,	'sarra',	'sarras',	'858a3aa81d176ee23e8b5cdafcef7f48',	2);

-- 2023-05-16 12:38:57
