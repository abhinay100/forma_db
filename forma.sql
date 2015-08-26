-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 26, 2015 at 01:25 AM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.27-1+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `forma`
--

-- --------------------------------------------------------

--
-- Table structure for table `conference_booking`
--

CREATE TABLE IF NOT EXISTS `conference_booking` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_id` int(11) NOT NULL DEFAULT '0',
  `platform` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(100) NOT NULL DEFAULT '',
  `user_idst` int(11) NOT NULL DEFAULT '0',
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conference_chatperm`
--

CREATE TABLE IF NOT EXISTS `conference_chatperm` (
  `room_id` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL DEFAULT '',
  `user_idst` int(11) NOT NULL DEFAULT '0',
  `perm` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`room_id`,`module`,`user_idst`,`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conference_chat_msg`
--

CREATE TABLE IF NOT EXISTS `conference_chat_msg` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_room` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(255) NOT NULL DEFAULT '',
  `send_to` int(11) DEFAULT NULL,
  `sent_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `text` text NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conference_dimdim`
--

CREATE TABLE IF NOT EXISTS `conference_dimdim` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idConference` bigint(20) NOT NULL DEFAULT '0',
  `confkey` varchar(255) DEFAULT NULL,
  `emailuser` varchar(255) DEFAULT NULL,
  `displayname` varchar(255) DEFAULT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `audiovideosettings` int(11) DEFAULT NULL,
  `maxmikes` int(11) DEFAULT NULL,
  `schedule_info` text NOT NULL,
  `extra_conf` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idConference` (`idConference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conference_menu`
--

CREATE TABLE IF NOT EXISTS `conference_menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `collapse` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `conference_menu`
--

INSERT INTO `conference_menu` (`idMenu`, `name`, `image`, `sequence`, `collapse`) VALUES
(1, '_MAIN_CONFERENCE_MANAGMENT', '', 1, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `conference_menu_under`
--

CREATE TABLE IF NOT EXISTS `conference_menu_under` (
  `idUnder` int(11) NOT NULL AUTO_INCREMENT,
  `idMenu` int(11) NOT NULL DEFAULT '0',
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `default_name` varchar(255) NOT NULL DEFAULT '',
  `default_op` varchar(255) NOT NULL DEFAULT '',
  `associated_token` varchar(255) NOT NULL DEFAULT '',
  `of_platform` varchar(255) DEFAULT NULL,
  `sequence` int(3) NOT NULL DEFAULT '0',
  `class_file` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idUnder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `conference_menu_under`
--

INSERT INTO `conference_menu_under` (`idUnder`, `idMenu`, `module_name`, `default_name`, `default_op`, `associated_token`, `of_platform`, `sequence`, `class_file`, `class_name`) VALUES
(2, 1, 'room', '_ROOM', 'room', 'view', NULL, 2, 'class.room.php', 'Module_Room');

-- --------------------------------------------------------

--
-- Table structure for table `conference_room`
--

CREATE TABLE IF NOT EXISTS `conference_room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idCal` bigint(20) NOT NULL DEFAULT '0',
  `idCourse` bigint(20) NOT NULL DEFAULT '0',
  `idSt` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `room_type` varchar(255) DEFAULT NULL,
  `starttime` bigint(20) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `meetinghours` int(11) DEFAULT NULL,
  `maxparticipants` int(11) DEFAULT NULL,
  `bookable` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idCourse` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conference_rules_admin`
--

CREATE TABLE IF NOT EXISTS `conference_rules_admin` (
  `server_status` enum('yes','no') NOT NULL DEFAULT 'yes',
  `enable_recording_function` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_advice_insert` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_write` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_chat_recording` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_private_subroom` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_public_subroom` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_drawboard_watch` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_drawboard_write` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_audio` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_webcam` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_stream_watch` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_strem_write` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_remote_desktop` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  PRIMARY KEY (`server_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conference_rules_room`
--

CREATE TABLE IF NOT EXISTS `conference_rules_room` (
  `id_room` int(11) NOT NULL AUTO_INCREMENT,
  `enable_recording_function` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_advice_insert` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_write` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_chat_recording` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_private_subroom` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_public_subroom` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_drawboard_watch` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_drawboard_write` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_audio` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_webcam` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_stream_watch` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_strem_write` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `enable_remote_desktop` enum('admin','alluser','noone') NOT NULL DEFAULT 'noone',
  `room_name` varchar(255) NOT NULL DEFAULT '',
  `room_type` enum('course','private','public') NOT NULL DEFAULT 'course',
  `id_source` int(11) NOT NULL DEFAULT '0',
  `room_parent` int(11) NOT NULL DEFAULT '0',
  `advice_one` text,
  `advice_two` text,
  `advice_three` text,
  `room_logo` varchar(255) DEFAULT NULL,
  `room_sponsor` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_room`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conference_rules_root`
--

CREATE TABLE IF NOT EXISTS `conference_rules_root` (
  `system_type` enum('p2p','server') NOT NULL DEFAULT 'p2p',
  `server_ip` varchar(255) DEFAULT NULL,
  `server_port` int(5) unsigned DEFAULT NULL,
  `server_path` varchar(255) DEFAULT NULL,
  `max_user_at_time` int(11) unsigned NOT NULL DEFAULT '0',
  `max_room_at_time` int(11) unsigned NOT NULL DEFAULT '0',
  `max_subroom_for_room` int(11) unsigned NOT NULL DEFAULT '0',
  `enable_drawboard` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_livestream` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_remote_desktop` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_webcam` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_audio` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`system_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conference_rules_user`
--

CREATE TABLE IF NOT EXISTS `conference_rules_user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `last_hit` int(11) NOT NULL DEFAULT '0',
  `id_room` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(255) NOT NULL DEFAULT '',
  `user_ip` varchar(15) NOT NULL DEFAULT '',
  `first_name` varchar(255) NOT NULL DEFAULT '',
  `last_name` varchar(255) NOT NULL DEFAULT '',
  `level` int(11) NOT NULL DEFAULT '0',
  `auto_reload` tinyint(1) NOT NULL DEFAULT '0',
  `banned_until` datetime DEFAULT NULL,
  `chat_record` enum('yes','no') NOT NULL DEFAULT 'no',
  `advice_insert` enum('yes','no') NOT NULL DEFAULT 'no',
  `write_in_chat` enum('yes','no') NOT NULL DEFAULT 'no',
  `request_to_chat` enum('yes','no') NOT NULL DEFAULT 'no',
  `create_public_subroom` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_webcam` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_audio` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_drawboard_watch` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_drawboard_draw` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_livestream_watch` enum('yes','no') NOT NULL DEFAULT 'no',
  `enable_livestream_publish` enum('yes','no') NOT NULL DEFAULT 'no',
  `accept_private_message` enum('yes','no') NOT NULL DEFAULT 'no',
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conference_teleskill`
--

CREATE TABLE IF NOT EXISTS `conference_teleskill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `idConference` bigint(20) NOT NULL DEFAULT '0',
  `roomid` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idConference` (`idConference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `conference_teleskill_log`
--

CREATE TABLE IF NOT EXISTS `conference_teleskill_log` (
  `roomid` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `role` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duration` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`roomid`,`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `conference_teleskill_room`
--

CREATE TABLE IF NOT EXISTS `conference_teleskill_room` (
  `roomid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `zone` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `bookable` tinyint(1) NOT NULL DEFAULT '0',
  `capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`roomid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_admin_course`
--

CREATE TABLE IF NOT EXISTS `core_admin_course` (
  `idst_user` int(11) NOT NULL DEFAULT '0',
  `type_of_entry` varchar(50) NOT NULL DEFAULT '',
  `id_entry` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idst_user`,`type_of_entry`,`id_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_admin_tree`
--

CREATE TABLE IF NOT EXISTS `core_admin_tree` (
  `idst` varchar(11) NOT NULL DEFAULT '',
  `idstAdmin` varchar(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`idst`,`idstAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_calendar`
--

CREATE TABLE IF NOT EXISTS `core_calendar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `class` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `private` varchar(2) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `visibility_rules` tinytext,
  `_owner` int(11) DEFAULT NULL,
  `_day` smallint(2) DEFAULT NULL,
  `_month` smallint(2) DEFAULT NULL,
  `_year` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_code`
--

CREATE TABLE IF NOT EXISTS `core_code` (
  `code` varchar(255) NOT NULL DEFAULT '',
  `idCodeGroup` int(11) NOT NULL DEFAULT '0',
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `idUser` int(11) DEFAULT NULL,
  `unlimitedUse` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_code_association`
--

CREATE TABLE IF NOT EXISTS `core_code_association` (
  `code` varchar(255) NOT NULL DEFAULT '',
  `idUser` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`,`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_code_course`
--

CREATE TABLE IF NOT EXISTS `core_code_course` (
  `idCodeGroup` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCodeGroup`,`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_code_groups`
--

CREATE TABLE IF NOT EXISTS `core_code_groups` (
  `idCodeGroup` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`idCodeGroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_code_org`
--

CREATE TABLE IF NOT EXISTS `core_code_org` (
  `idCodeGroup` int(11) NOT NULL DEFAULT '0',
  `idOrg` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCodeGroup`,`idOrg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_connection`
--

CREATE TABLE IF NOT EXISTS `core_connection` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(50) NOT NULL DEFAULT '',
  `params` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_connector`
--

CREATE TABLE IF NOT EXISTS `core_connector` (
  `type` varchar(25) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_country`
--

CREATE TABLE IF NOT EXISTS `core_country` (
  `id_country` int(11) NOT NULL AUTO_INCREMENT,
  `name_country` varchar(64) NOT NULL DEFAULT '',
  `iso_code_country` varchar(3) NOT NULL DEFAULT '',
  `id_zone` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_country`),
  KEY `IDX_COUNTRIES_NAME` (`name_country`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=245 ;

--
-- Dumping data for table `core_country`
--

INSERT INTO `core_country` (`id_country`, `name_country`, `iso_code_country`, `id_zone`) VALUES
(1, 'AFGHANISTAN', 'AF', 0),
(2, 'ALAND ISLANDS', 'AX', 0),
(3, 'ALBANIA', 'AL', 0),
(4, 'ALGERIA', 'DZ', 0),
(5, 'AMERICAN SAMOA', 'AS', 0),
(6, 'ANDORRA', 'AD', 0),
(7, 'ANGOLA', 'AO', 0),
(8, 'ANGUILLA', 'AI', 0),
(9, 'ANTARCTICA', 'AQ', 0),
(10, 'ANTIGUA AND BARBUDA', 'AG', 0),
(11, 'ARGENTINA', 'AR', 0),
(12, 'ARMENIA', 'AM', 0),
(13, 'ARUBA', 'AW', 0),
(14, 'AUSTRALIA', 'AU', 0),
(15, 'AUSTRIA', 'AT', 0),
(16, 'AZERBAIJAN', 'AZ', 0),
(17, 'BAHAMAS', 'BS', 0),
(18, 'BAHRAIN', 'BH', 0),
(19, 'BANGLADESH', 'BD', 0),
(20, 'BARBADOS', 'BB', 0),
(21, 'BELARUS', 'BY', 0),
(22, 'BELGIUM', 'BE', 0),
(23, 'BELIZE', 'BZ', 0),
(24, 'BENIN', 'BJ', 0),
(25, 'BERMUDA', 'BM', 0),
(26, 'BHUTAN', 'BT', 0),
(27, 'BOLIVIA', 'BO', 0),
(28, 'BOSNIA AND HERZEGOVINA', 'BA', 0),
(29, 'BOTSWANA', 'BW', 0),
(30, 'BOUVET ISLAND', 'BV', 0),
(31, 'BRAZIL', 'BR', 0),
(32, 'BRITISH INDIAN OCEAN TERRITORY', 'IO', 0),
(33, 'BRUNEI DARUSSALAM', 'BN', 0),
(34, 'BULGARIA', 'BG', 0),
(35, 'BURKINA FASO', 'BF', 0),
(36, 'BURUNDI', 'BI', 0),
(37, 'CAMBODIA', 'KH', 0),
(38, 'CAMEROON', 'CM', 0),
(39, 'CANADA', 'CA', 0),
(40, 'CAPE VERDE', 'CV', 0),
(41, 'CAYMAN ISLANDS', 'KY', 0),
(42, 'CENTRAL AFRICAN REPUBLIC', 'CF', 0),
(43, 'CHAD', 'TD', 0),
(44, 'CHILE', 'CL', 0),
(45, 'CHINA', 'CN', 0),
(46, 'CHRISTMAS ISLAND', 'CX', 0),
(47, 'COCOS (KEELING) ISLANDS', 'CC', 0),
(48, 'COLOMBIA', 'CO', 0),
(49, 'COMOROS', 'KM', 0),
(50, 'CONGO', 'CG', 0),
(51, 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'CD', 0),
(52, 'COOK ISLANDS', 'CK', 0),
(53, 'COSTA RICA', 'CR', 0),
(54, 'IVORY COAST', 'CI', 0),
(55, 'CROATIA', 'HR', 0),
(56, 'CUBA', 'CU', 0),
(57, 'CYPRUS', 'CY', 0),
(58, 'CZECH REPUBLIC', 'CZ', 0),
(59, 'DENMARK', 'DK', 0),
(60, 'DJIBOUTI', 'DJ', 0),
(61, 'DOMINICA', 'DM', 0),
(62, 'DOMINICAN REPUBLIC', 'DO', 0),
(63, 'ECUADOR', 'EC', 0),
(64, 'EGYPT', 'EG', 0),
(65, 'EL SALVADOR', 'SV', 0),
(66, 'EQUATORIAL GUINEA', 'GQ', 0),
(67, 'ERITREA', 'ER', 0),
(68, 'ESTONIA', 'EE', 0),
(69, 'ETHIOPIA', 'ET', 0),
(70, 'FALKLAND ISLANDS (MALVINAS)', 'FK', 0),
(71, 'FAROE ISLANDS', 'FO', 0),
(72, 'FIJI', 'FJ', 0),
(73, 'FINLAND', 'FI', 0),
(74, 'FRANCE', 'FR', 0),
(75, 'FRENCH GUIANA', 'GF', 0),
(76, 'FRENCH POLYNESIA', 'PF', 0),
(77, 'FRENCH SOUTHERN TERRITORIES', 'TF', 0),
(78, 'GABON', 'GA', 0),
(79, 'GAMBIA', 'GM', 0),
(80, 'GEORGIA', 'GE', 0),
(81, 'GERMANY', 'DE', 0),
(82, 'GHANA', 'GH', 0),
(83, 'GIBRALTAR', 'GI', 0),
(84, 'GREECE', 'GR', 0),
(85, 'GREENLAND', 'GL', 0),
(86, 'GRENADA', 'GD', 0),
(87, 'GUADELOUPE', 'GP', 0),
(88, 'GUAM', 'GU', 0),
(89, 'GUATEMALA', 'GT', 0),
(90, 'GUERNSEY', 'GG', 0),
(91, 'GUINEA', 'GN', 0),
(92, 'GUINEA-BISSAU', 'GW', 0),
(93, 'GUYANA', 'GY', 0),
(94, 'HAITI', 'HT', 0),
(95, 'HEARD ISLAND AND MCDONALD ISLANDS', 'HM', 0),
(96, 'HONDURAS', 'HN', 0),
(97, 'HONG KONG', 'HK', 0),
(98, 'HUNGARY', 'HU', 0),
(99, 'ICELAND', 'IS', 0),
(100, 'INDIA', 'IN', 0),
(101, 'INDONESIA', 'ID', 0),
(102, 'IRAN', 'IR', 0),
(103, 'IRAQ', 'IQ', 0),
(104, 'IRELAND', 'IE', 0),
(105, 'ISLE OF MAN', 'IM', 0),
(106, 'ISRAEL', 'IL', 0),
(107, 'ITALY', 'IT', 0),
(108, 'JAMAICA', 'JM', 0),
(109, 'JAPAN', 'JP', 0),
(110, 'JERSEY', 'JE', 0),
(111, 'JORDAN', 'JO', 0),
(112, 'KAZAKHSTAN', 'KZ', 0),
(113, 'KENYA', 'KE', 0),
(114, 'KIRIBATI', 'KI', 0),
(115, 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'KP', 0),
(116, 'KOREA, REPUBLIC OF', 'KR', 0),
(117, 'KUWAIT', 'KW', 0),
(118, 'KYRGYZSTAN', 'KG', 0),
(119, 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'LA', 0),
(120, 'LATVIA', 'LV', 0),
(121, 'LEBANON', 'LB', 0),
(122, 'LESOTHO', 'LS', 0),
(123, 'LIBERIA', 'LR', 0),
(124, 'LIBYAN ARAB JAMAHIRIYA', 'LY', 0),
(125, 'LIECHTENSTEIN', 'LI', 0),
(126, 'LITHUANIA', 'LT', 0),
(127, 'LUXEMBOURG', 'LU', 0),
(128, 'MACAO', 'MO', 0),
(129, 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'MK', 0),
(130, 'MADAGASCAR', 'MG', 0),
(131, 'MALAWI', 'MW', 0),
(132, 'MALAYSIA', 'MY', 0),
(133, 'MALDIVES', 'MV', 0),
(134, 'MALI', 'ML', 0),
(135, 'MALTA', 'MT', 0),
(136, 'MARSHALL ISLANDS', 'MH', 0),
(137, 'MARTINIQUE', 'MQ', 0),
(138, 'MAURITANIA', 'MR', 0),
(139, 'MAURITIUS', 'MU', 0),
(140, 'MAYOTTE', 'YT', 0),
(141, 'MEXICO', 'MX', 0),
(142, 'MICRONESIA, FEDERATED STATES OF', 'FM', 0),
(143, 'MOLDOVA, REPUBLIC OF', 'MD', 0),
(144, 'MONACO', 'MC', 0),
(145, 'MONGOLIA', 'MN', 0),
(146, 'MONTENEGRO', 'ME', 0),
(147, 'MONTSERRAT', 'MS', 0),
(148, 'MOROCCO', 'MA', 0),
(149, 'MOZAMBIQUE', 'MZ', 0),
(150, 'MYANMAR', 'MM', 0),
(151, 'NAMIBIA', 'NA', 0),
(152, 'NAURU', 'NR', 0),
(153, 'NEPAL', 'NP', 0),
(154, 'NETHERLANDS', 'NL', 0),
(155, 'NETHERLANDS ANTILLES', 'AN', 0),
(156, 'NEW CALEDONIA', 'NC', 0),
(157, 'NEW ZEALAND', 'NZ', 0),
(158, 'NICARAGUA', 'NI', 0),
(159, 'NIGER', 'NE', 0),
(160, 'NIGERIA', 'NG', 0),
(161, 'NIUE', 'NU', 0),
(162, 'NORFOLK ISLAND', 'NF', 0),
(163, 'NORTHERN MARIANA ISLANDS', 'MP', 0),
(164, 'NORWAY', 'NO', 0),
(165, 'OMAN', 'OM', 0),
(166, 'PAKISTAN', 'PK', 0),
(167, 'PALAU', 'PW', 0),
(168, 'PALESTINIAN TERRITORY, OCCUPIED', 'PS', 0),
(169, 'PANAMA', 'PA', 0),
(170, 'PAPUA NEW GUINEA', 'PG', 0),
(171, 'PARAGUAY', 'PY', 0),
(172, 'PERU', 'PE', 0),
(173, 'PHILIPPINES', 'PH', 0),
(174, 'PITCAIRN', 'PN', 0),
(175, 'POLAND', 'PL', 0),
(176, 'PORTUGAL', 'PT', 0),
(177, 'PUERTO RICO', 'PR', 0),
(178, 'QATAR', 'QA', 0),
(179, 'Reunion', 'RE', 0),
(180, 'ROMANIA', 'RO', 0),
(181, 'RUSSIAN FEDERATION', 'RU', 0),
(182, 'RWANDA', 'RW', 0),
(183, 'SAINT HELENA', 'SH', 0),
(184, 'SAINT KITTS AND NEVIS', 'KN', 0),
(185, 'SAINT LUCIA', 'LC', 0),
(186, 'SAINT PIERRE AND MIQUELON', 'PM', 0),
(187, 'SAINT VINCENT AND THE GRENADINES', 'VC', 0),
(188, 'SAMOA', 'WS', 0),
(189, 'SAN MARINO', 'SM', 0),
(190, 'SAO TOME AND PRINCIPE', 'ST', 0),
(191, 'SAUDI ARABIA', 'SA', 0),
(192, 'SENEGAL', 'SN', 0),
(193, 'SERBIA', 'RS', 0),
(194, 'SEYCHELLES', 'SC', 0),
(195, 'SIERRA LEONE', 'SL', 0),
(196, 'SINGAPORE', 'SG', 0),
(197, 'SLOVAKIA', 'SK', 0),
(198, 'SLOVENIA', 'SI', 0),
(199, 'SOLOMON ISLANDS', 'SB', 0),
(200, 'SOMALIA', 'SO', 0),
(201, 'SOUTH AFRICA', 'ZA', 0),
(202, 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'GS', 0),
(203, 'SPAIN', 'ES', 0),
(204, 'SRI LANKA', 'LK', 0),
(205, 'SUDAN', 'SD', 0),
(206, 'SURINAME', 'SR', 0),
(207, 'SVALBARD AND JAN MAYEN', 'SJ', 0),
(208, 'SWAZILAND', 'SZ', 0),
(209, 'SWEDEN', 'SE', 0),
(210, 'SWITZERLAND', 'CH', 0),
(211, 'SYRIAN ARAB REPUBLIC', 'SY', 0),
(212, 'TAIWAN, PROVINCE OF CHINA', 'TW', 0),
(213, 'TAJIKISTAN', 'TJ', 0),
(214, 'TANZANIA, UNITED REPUBLIC OF', 'TZ', 0),
(215, 'THAILAND', 'TH', 0),
(216, 'TIMOR-LESTE', 'TL', 0),
(217, 'TOGO', 'TG', 0),
(218, 'TOKELAU', 'TK', 0),
(219, 'TONGA', 'TO', 0),
(220, 'TRINIDAD AND TOBAGO', 'TT', 0),
(221, 'TUNISIA', 'TN', 0),
(222, 'TURKEY', 'TR', 0),
(223, 'TURKMENISTAN', 'TM', 0),
(224, 'TURKS AND CAICOS ISLANDS', 'TC', 0),
(225, 'TUVALU', 'TV', 0),
(226, 'UGANDA', 'UG', 0),
(227, 'UKRAINE', 'UA', 0),
(228, 'UNITED ARAB EMIRATES', 'AE', 0),
(229, 'UNITED KINGDOM', 'GB', 0),
(230, 'UNITED STATES', 'US', 0),
(231, 'UNITED STATES MINOR OUTLYING ISLANDS', 'UM', 0),
(232, 'URUGUAY', 'UY', 0),
(233, 'UZBEKISTAN', 'UZ', 0),
(234, 'VANUATU', 'VU', 0),
(235, 'VATICAN CITY STATE', 'VA', 0),
(236, 'VENEZUELA', 'VE', 0),
(237, 'VIET NAM', 'VN', 0),
(238, 'VIRGIN ISLANDS, BRITISH', 'VG', 0),
(239, 'VIRGIN ISLANDS, U.S.', 'VI', 0),
(240, 'WALLIS AND FUTUNA', 'WF', 0),
(241, 'WESTERN SAHARA', 'EH', 0),
(242, 'YEMEN', 'YE', 0),
(243, 'ZAMBIA', 'ZM', 0),
(244, 'ZIMBABWE', 'ZW', 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_deleted_user`
--

CREATE TABLE IF NOT EXISTS `core_deleted_user` (
  `id_deletion` int(11) NOT NULL AUTO_INCREMENT,
  `idst` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `pass` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `lastenter` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  `pwd_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `register_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deletion_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_deletion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_event`
--

CREATE TABLE IF NOT EXISTS `core_event` (
  `idEvent` int(11) NOT NULL AUTO_INCREMENT,
  `idClass` int(11) NOT NULL DEFAULT '0',
  `module` varchar(50) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `priority` smallint(1) unsigned NOT NULL DEFAULT '1289',
  `description` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idEvent`),
  KEY `idClass` (`idClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_event_class`
--

CREATE TABLE IF NOT EXISTS `core_event_class` (
  `idClass` int(11) NOT NULL AUTO_INCREMENT,
  `class` varchar(50) NOT NULL DEFAULT '',
  `platform` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idClass`),
  UNIQUE KEY `class_2` (`class`),
  KEY `class` (`class`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `core_event_class`
--

INSERT INTO `core_event_class` (`idClass`, `class`, `platform`, `description`) VALUES
(1, 'UserNew', 'framework', ''),
(2, 'UserMod', 'framework', ''),
(3, 'UserDel', 'framework', ''),
(4, 'UserNewModerated', 'framework', ''),
(5, 'UserGroupModerated', 'framework', ''),
(6, 'UserGroupInsert', 'framework', ''),
(7, 'UserGroupRemove', 'framework', ''),
(8, 'UserCourseInsertModerate', 'lms-a', ''),
(9, 'UserCourseInserted', 'lms-a', ''),
(10, 'UserCourseRemoved', 'lms-a', ''),
(11, 'UserCourseLevelChanged', 'lms-a', ''),
(12, 'UserCourseEnded', 'lms-a', ''),
(13, 'CoursePorpModified', 'lms-a', ''),
(14, 'AdviceNew', 'lms', ''),
(15, 'MsgNewReceived', 'lms', ''),
(16, 'ForumNewCategory', 'lms', ''),
(17, 'ForumNewThread', 'lms', ''),
(18, 'ForumNewResponse', 'lms', ''),
(19, 'UserCourseRemovedModerate', 'lms-a', ''),
(38, 'UserApproved', 'framework', ''),
(39, 'UserCourseBuy', 'lms', ''),
(40, 'SettingUpdate', 'framework', ''),
(41, 'UserNewWaiting', 'framework', '');

-- --------------------------------------------------------

--
-- Table structure for table `core_event_consumer`
--

CREATE TABLE IF NOT EXISTS `core_event_consumer` (
  `idConsumer` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_class` varchar(50) NOT NULL DEFAULT '',
  `consumer_file` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idConsumer`),
  UNIQUE KEY `consumer_class` (`consumer_class`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Table of consumer with PHP classes and files' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `core_event_consumer`
--

INSERT INTO `core_event_consumer` (`idConsumer`, `consumer_class`, `consumer_file`) VALUES
(1, 'DoceboUserNotifier', '/lib/lib.usernotifier.php'),
(2, 'DoceboCourseNotifier', '/lib/lib.coursenotifier.php'),
(3, 'DoceboOrgchartNotifier', '/lib/lib.orgchartnotifier.php'),
(5, 'DoceboSettingNotifier', '/lib/lib.settingnotifier.php');

-- --------------------------------------------------------

--
-- Table structure for table `core_event_consumer_class`
--

CREATE TABLE IF NOT EXISTS `core_event_consumer_class` (
  `idConsumer` int(11) NOT NULL DEFAULT '0',
  `idClass` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idConsumer`,`idClass`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='n:m relation from consumers and event''s classes';

--
-- Dumping data for table `core_event_consumer_class`
--

INSERT INTO `core_event_consumer_class` (`idConsumer`, `idClass`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 38),
(1, 39),
(1, 41),
(2, 3),
(3, 3),
(5, 40);

-- --------------------------------------------------------

--
-- Table structure for table `core_event_manager`
--

CREATE TABLE IF NOT EXISTS `core_event_manager` (
  `idEventMgr` int(11) NOT NULL AUTO_INCREMENT,
  `idClass` int(11) NOT NULL DEFAULT '0',
  `permission` enum('not_used','mandatory') NOT NULL DEFAULT 'not_used',
  `channel` set('email','sms') NOT NULL DEFAULT 'email',
  `recipients` varchar(255) NOT NULL DEFAULT '',
  `show_level` set('godadmin','admin','user') NOT NULL DEFAULT '',
  PRIMARY KEY (`idEventMgr`),
  UNIQUE KEY `idClass` (`idClass`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Dumping data for table `core_event_manager`
--

INSERT INTO `core_event_manager` (`idEventMgr`, `idClass`, `permission`, `channel`, `recipients`, `show_level`) VALUES
(1, 1, 'mandatory', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(2, 2, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(3, 3, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(4, 4, 'not_used', 'email', '_EVENT_RECIPIENTS_MODERATORS_GOD', 'godadmin,admin'),
(5, 5, 'not_used', 'email', '_EVENT_RECIPIENTS_MODERATORS_GOD', 'godadmin,admin'),
(6, 6, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(7, 7, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(8, 8, 'not_used', 'email', '_EVENT_RECIPIENTS_MODERATORS_GOD', 'godadmin,admin'),
(9, 9, 'not_used', 'email', '_EVENT_RECIPIENTS_TEACHER', 'godadmin,admin,user'),
(10, 10, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(11, 11, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(12, 12, 'mandatory', 'email', '_EVENT_RECIPIENTS_TEACHER', 'godadmin,admin,user'),
(13, 13, 'not_used', 'email', '_EVENT_RECIPIENTS_TEACHER_GOD', 'godadmin,admin,user'),
(14, 14, 'not_used', 'email', '_ALL', 'godadmin,admin,user'),
(15, 15, 'not_used', 'email', '_ALL', 'godadmin,admin,user'),
(16, 16, 'not_used', 'email', '_ALL', 'godadmin,admin,user'),
(17, 17, 'not_used', 'email', '_ALL', 'godadmin,admin,user'),
(18, 18, 'not_used', 'email', '_ALL', 'godadmin,admin,user'),
(19, 19, 'not_used', 'email', '_EVENT_RECIPIENTS_MODERATORS_GOD', 'godadmin,admin'),
(38, 38, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(39, 39, 'not_used', 'email', '_EVENT_RECIPIENTS_USER', 'godadmin,admin,user'),
(41, 41, 'mandatory', 'email', '_EVENT_RECIPIENTS_MODERATORS_GOD', 'godadmin,admin');

-- --------------------------------------------------------

--
-- Table structure for table `core_event_property`
--

CREATE TABLE IF NOT EXISTS `core_event_property` (
  `idEvent` int(11) NOT NULL DEFAULT '0',
  `property_name` varchar(50) NOT NULL DEFAULT '',
  `property_value` text NOT NULL,
  `property_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`idEvent`,`property_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_event_user`
--

CREATE TABLE IF NOT EXISTS `core_event_user` (
  `idEventMgr` int(11) NOT NULL DEFAULT '0',
  `idst` int(11) NOT NULL DEFAULT '0',
  `channel` set('email','sms') NOT NULL DEFAULT '',
  PRIMARY KEY (`idEventMgr`,`idst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_field`
--

CREATE TABLE IF NOT EXISTS `core_field` (
  `idField` int(11) NOT NULL AUTO_INCREMENT,
  `id_common` int(11) NOT NULL DEFAULT '0',
  `type_field` varchar(255) NOT NULL DEFAULT '',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `translation` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(5) NOT NULL DEFAULT '0',
  `show_on_platform` varchar(255) NOT NULL DEFAULT 'framework,',
  `use_multilang` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idField`),
  KEY `id_common` (`id_common`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_field_son`
--

CREATE TABLE IF NOT EXISTS `core_field_son` (
  `idSon` int(11) NOT NULL AUTO_INCREMENT,
  `idField` int(11) NOT NULL DEFAULT '0',
  `id_common_son` int(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(50) NOT NULL DEFAULT '',
  `translation` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idSon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_field_type`
--

CREATE TABLE IF NOT EXISTS `core_field_type` (
  `type_field` varchar(255) NOT NULL DEFAULT '',
  `type_file` varchar(255) NOT NULL DEFAULT '',
  `type_class` varchar(255) NOT NULL DEFAULT '',
  `type_category` varchar(255) NOT NULL DEFAULT 'standard',
  PRIMARY KEY (`type_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_field_type`
--

INSERT INTO `core_field_type` (`type_field`, `type_file`, `type_class`, `type_category`) VALUES
('codicefiscale', 'class.cf.php', 'Field_Cf', 'standard'),
('country', 'class.country.php', 'Field_Country', 'standard'),
('date', 'class.date.php', 'Field_Date', 'standard'),
('dropdown', 'class.dropdown.php', 'Field_Dropdown', 'standard'),
('freetext', 'class.freetext.php', 'Field_Freetext', 'standard'),
('textfield', 'class.textfield.php', 'Field_Textfield', 'standard'),
('textlabel', 'class.label.php', 'Field_Textlabel', 'standard'),
('upload', 'class.upload.php', 'Field_Upload', 'standard'),
('yesno', 'class.yesno.php', 'Field_Yesno', 'standard');

-- --------------------------------------------------------

--
-- Table structure for table `core_field_userentry`
--

CREATE TABLE IF NOT EXISTS `core_field_userentry` (
  `id_common` varchar(11) NOT NULL DEFAULT '',
  `id_common_son` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `user_entry` text NOT NULL,
  PRIMARY KEY (`id_common`,`id_common_son`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_fncrole`
--

CREATE TABLE IF NOT EXISTS `core_fncrole` (
  `id_fncrole` int(10) unsigned NOT NULL DEFAULT '0',
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_fncrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_fncrole_competence`
--

CREATE TABLE IF NOT EXISTS `core_fncrole_competence` (
  `id_fncrole` int(10) unsigned NOT NULL DEFAULT '0',
  `id_competence` int(10) unsigned NOT NULL DEFAULT '0',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_fncrole`,`id_competence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_fncrole_group`
--

CREATE TABLE IF NOT EXISTS `core_fncrole_group` (
  `id_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_fncrole_group_lang`
--

CREATE TABLE IF NOT EXISTS `core_fncrole_group_lang` (
  `id_group` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id_group`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_fncrole_lang`
--

CREATE TABLE IF NOT EXISTS `core_fncrole_lang` (
  `id_fncrole` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id_fncrole`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_group`
--

CREATE TABLE IF NOT EXISTS `core_group` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `groupid` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `hidden` enum('true','false') NOT NULL DEFAULT 'false',
  `type` enum('free','moderate','private','invisible','course','company') NOT NULL DEFAULT 'free',
  `show_on_platform` text NOT NULL,
  PRIMARY KEY (`idst`),
  UNIQUE KEY `groupid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_group`
--

INSERT INTO `core_group` (`idst`, `groupid`, `description`, `hidden`, `type`, `show_on_platform`) VALUES
(1, '/oc_0', 'Root of organization chart', 'true', 'free', ''),
(2, '/ocd_0', 'Root of organization chart and descendants', 'true', 'free', ''),
(3, '/framework/level/godadmin', 'Group of godadmins', 'true', 'free', ''),
(4, '/framework/level/admin', 'Group of administrators', 'true', 'free', ''),
(5, '/framework/level/publicadmin', 'Group of public admin', 'true', 'free', ''),
(6, '/framework/level/user', 'Group of normal users', 'true', 'free', ''),
(301, '/lms/custom/11/7', 'for custom lms menu', 'true', 'free', ''),
(302, '/lms/custom/11/6', 'for custom lms menu', 'true', 'free', ''),
(303, '/lms/custom/11/5', 'for custom lms menu', 'true', 'free', ''),
(304, '/lms/custom/11/4', 'for custom lms menu', 'true', 'free', ''),
(305, '/lms/custom/11/3', 'for custom lms menu', 'true', 'free', ''),
(306, '/lms/custom/11/2', 'for custom lms menu', 'true', 'free', ''),
(307, '/lms/custom/11/1', 'for custom lms menu', 'true', 'free', ''),
(10893, '/lms/custom/21/7', 'for custom lms menu', 'true', 'free', ''),
(10894, '/lms/custom/21/6', 'for custom lms menu', 'true', 'free', ''),
(10895, '/lms/custom/21/5', 'for custom lms menu', 'true', 'free', ''),
(10896, '/lms/custom/21/4', 'for custom lms menu', 'true', 'free', ''),
(10897, '/lms/custom/21/3', 'for custom lms menu', 'true', 'free', ''),
(10898, '/lms/custom/21/2', 'for custom lms menu', 'true', 'free', ''),
(10899, '/lms/custom/21/1', 'for custom lms menu', 'true', 'free', '');

-- --------------------------------------------------------

--
-- Table structure for table `core_group_fields`
--

CREATE TABLE IF NOT EXISTS `core_group_fields` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `id_field` int(11) NOT NULL DEFAULT '0',
  `mandatory` enum('true','false') NOT NULL DEFAULT 'false',
  `useraccess` enum('noaccess','readonly','readwrite') NOT NULL DEFAULT 'readonly',
  `user_inherit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idst`,`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_group_members`
--

CREATE TABLE IF NOT EXISTS `core_group_members` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `idstMember` int(11) NOT NULL DEFAULT '0',
  `filter` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`idst`,`idstMember`),
  KEY `idstMember` (`idstMember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_group_members`
--

INSERT INTO `core_group_members` (`idst`, `idstMember`, `filter`) VALUES
(1, 11836, ''),
(3, 11836, '');

-- --------------------------------------------------------

--
-- Table structure for table `core_group_user_waiting`
--

CREATE TABLE IF NOT EXISTS `core_group_user_waiting` (
  `idst_group` int(11) NOT NULL DEFAULT '0',
  `idst_user` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idst_group`,`idst_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_hteditor`
--

CREATE TABLE IF NOT EXISTS `core_hteditor` (
  `hteditor` varchar(255) NOT NULL DEFAULT '',
  `hteditorname` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`hteditor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_hteditor`
--

INSERT INTO `core_hteditor` (`hteditor`, `hteditorname`) VALUES
('textarea', '_TEXTAREA'),
('tinymce', '_TINYMCE'),
('yui', '_YUI');

-- --------------------------------------------------------

--
-- Table structure for table `core_lang_language`
--

CREATE TABLE IF NOT EXISTS `core_lang_language` (
  `lang_code` varchar(50) NOT NULL DEFAULT '',
  `lang_description` varchar(255) NOT NULL DEFAULT '',
  `lang_browsercode` varchar(50) NOT NULL DEFAULT '',
  `lang_direction` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  PRIMARY KEY (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_lang_language`
--

INSERT INTO `core_lang_language` (`lang_code`, `lang_description`, `lang_browsercode`, `lang_direction`) VALUES
('english', 'English', 'en; en-us', 'ltr');

-- --------------------------------------------------------

--
-- Table structure for table `core_lang_text`
--

CREATE TABLE IF NOT EXISTS `core_lang_text` (
  `id_text` int(11) NOT NULL AUTO_INCREMENT,
  `text_key` varchar(50) NOT NULL DEFAULT '',
  `text_module` varchar(50) NOT NULL DEFAULT '',
  `text_attributes` set('accessibility','sms','email') NOT NULL DEFAULT '',
  PRIMARY KEY (`id_text`),
  UNIQUE KEY `text_key` (`text_key`,`text_module`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2541 ;

--
-- Dumping data for table `core_lang_text`
--

INSERT INTO `core_lang_text` (`id_text`, `text_key`, `text_module`, `text_attributes`) VALUES
(1, '_ADMIN_ASSIGNTREEDESCR', 'adminrules', ''),
(2, '_ADMIN_MANAGMENT', 'adminrules', ''),
(3, '_ADMIN_MANAGMENT_CAPTION', 'adminrules', ''),
(4, '_ADMIN_MANAGMENT_SUMMARY', 'adminrules', ''),
(5, '_ADMIN_MENU', 'adminrules', ''),
(6, '_ADMIN_PREFERENCES_TITLE', 'adminrules', ''),
(7, '_ADMIN_RULES', 'adminrules', ''),
(8, '_ADMIN_SPECIAL_SETTING', 'adminrules', ''),
(9, '_DIRECT_COURSE_SUBSCRIBE', 'adminrules', ''),
(10, '_DIRECT_USER_INSERT', 'adminrules', ''),
(11, '_LANG_SETTING', 'adminrules', ''),
(12, '_LIMIT_COURSE_SUBSCRIBE', 'adminrules', ''),
(13, '_LIMIT_USER_INSERT', 'adminrules', ''),
(14, '_MANAGE_SUBSCRIPTION', 'adminrules', ''),
(15, '_MAX_COURSE_SUBSCRIBE', 'adminrules', ''),
(16, '_MAX_USER_INSERT', 'adminrules', ''),
(17, '_SELECT_LANG_TO_ASSIGN', 'adminrules', ''),
(18, '_SPECIAL_SETTING', 'adminrules', ''),
(19, '_PAPER_TEST', 'admin_date', ''),
(20, '_WEB_TEST', 'admin_date', ''),
(21, '_ACCEPT', 'admin_directory', ''),
(22, '_APPROVED_USER_SBJ', 'admin_directory', ''),
(23, '_ASSIGNED_EXTRAFIELD', 'admin_directory', ''),
(24, '_DECLINE', 'admin_directory', ''),
(25, '_DIRECOTRY_SELFREGISTERED', 'admin_directory', ''),
(26, '_DIRECTORY_/framework/level/admin', 'admin_directory', ''),
(27, '_DIRECTORY_/framework/level/godadmin', 'admin_directory', ''),
(28, '_DIRECTORY_/framework/level/publicadmin', 'admin_directory', ''),
(29, '_DIRECTORY_/framework/level/user', 'admin_directory', ''),
(30, '_DIRECTORY_ASSIGNFIELDGROUP', 'admin_directory', ''),
(31, '_DIRECTORY_FILTER_email', 'admin_directory', ''),
(32, '_DIRECTORY_FILTER_firstname', 'admin_directory', ''),
(33, '_DIRECTORY_FILTER_FLATMODE', 'admin_directory', ''),
(34, '_DIRECTORY_FILTER_language', 'admin_directory', ''),
(35, '_DIRECTORY_FILTER_lastname', 'admin_directory', ''),
(36, '_DIRECTORY_FILTER_pass', 'admin_directory', ''),
(37, '_DIRECTORY_FILTER_register_date', 'admin_directory', ''),
(38, '_DIRECTORY_FILTER_templatename', 'admin_directory', ''),
(39, '_DIRECTORY_FILTER_userid', 'admin_directory', ''),
(40, '_DIRECTORY_FULLNAME', 'admin_directory', ''),
(41, '_DIRECTORY_GROUPID', 'admin_directory', ''),
(42, '_DIRECTORY_GROUPTYPE', 'admin_directory', ''),
(43, '_DIRECTORY_GROUPTYPE_FREE', 'admin_directory', ''),
(44, '_DIRECTORY_GROUPTYPE_INVISIBLE', 'admin_directory', ''),
(45, '_DIRECTORY_GROUPTYPE_INVISIBLE_ALT', 'admin_directory', ''),
(46, '_DIRECTORY_GROUPTYPE_MODERATE', 'admin_directory', ''),
(47, '_DIRECTORY_GROUPTYPE_MODERATE_ALT', 'admin_directory', ''),
(48, '_DIRECTORY_GROUPTYPE_PRIVATE', 'admin_directory', ''),
(49, '_DIRECTORY_GROUPTYPE_PRIVATE_ALT', 'admin_directory', ''),
(50, '_DIRECTORY_GROUPWAIT_ACCORDECLINE', 'admin_directory', ''),
(51, '_DIRECTORY_GROUP_FIELD_WRITE', 'admin_directory', ''),
(52, '_DIRECTORY_ITEMID', 'admin_directory', ''),
(53, '_DIRECTORY_MEMBERTYPE', 'admin_directory', ''),
(54, '_DIRECTORY_MEMBERTYPETREE', 'admin_directory', ''),
(55, '_DIRECTORY_MEMBERTYPEUSER', 'admin_directory', ''),
(56, '_DIRECTORY_ORGVIEWTITLE', 'admin_directory', ''),
(57, '_FORCE_PASSWORD_CHANGE', 'admin_directory', ''),
(58, '_GROUP_FIELD_NORMAL', 'admin_directory', ''),
(59, '_GROUP_USER_IMPORT_CHARSET', 'admin_directory', ''),
(60, '_GROUP_USER_IMPORT_FILE', 'admin_directory', ''),
(61, '_GROUP_USER_IMPORT_HEADER', 'admin_directory', ''),
(62, '_GROUP_USER_IMPORT_SEPARATOR', 'admin_directory', ''),
(63, '_LASTNAME_FIRSTNAME', 'admin_directory', ''),
(64, '_REFUSED_USER_TEXT_SMS', 'admin_directory', ''),
(65, '_REFUSE_USER', 'admin_directory', ''),
(66, '_REFUSE_USER_TITLE', 'admin_directory', ''),
(67, '_SIMPLE_FILTER', 'admin_directory', ''),
(68, '_WAITING_USER_SUMMARY', 'admin_directory', ''),
(69, '_BLANKLANG_CODE', 'admin_lang', ''),
(70, '_CLEAN_LANG', 'admin_lang', ''),
(71, '_CLEAR', 'admin_lang', ''),
(72, '_DIRECTION_LTR', 'admin_lang', ''),
(73, '_DIRECTION_RTL', 'admin_lang', ''),
(74, '_DO_NOT_ADD_MISS', 'admin_lang', ''),
(75, '_EXPORTG', 'admin_lang', ''),
(76, '_EXPORT_DIFF', 'admin_lang', ''),
(77, '_LANG_ACCESSIBILITY', 'admin_lang', ''),
(78, '_LANG_ADDKEY', 'admin_lang', ''),
(79, '_LANG_ALL', 'admin_lang', ''),
(80, '_LANG_ALLMODULES', 'admin_lang', ''),
(81, '_LANG_ATTRIBUTES', 'admin_lang', ''),
(82, '_LANG_BROWSERCODE', 'admin_lang', ''),
(83, '_LANG_CHARSET', 'admin_lang', ''),
(84, '_LANG_CODE', 'admin_lang', ''),
(85, '_LANG_COMPARE', 'admin_lang', ''),
(86, '_LANG_DIRECTION', 'admin_lang', ''),
(87, '_LANG_KEY', 'admin_lang', ''),
(88, '_LANG_MODULE', 'admin_lang', ''),
(89, '_LANG_NEWMODULE', 'admin_lang', ''),
(90, '_LANG_TRANSLATION', 'admin_lang', ''),
(91, '_LANG_TRAN_COMPARE', 'admin_lang', ''),
(92, '_MODULES_UPDATED', 'admin_lang', ''),
(93, '_NOIMPORT', 'admin_lang', ''),
(94, '_NUM_TRAD', 'admin_lang', ''),
(95, '_ONLY_EMPTY', 'admin_lang', ''),
(96, '_ORIENTATION', 'admin_lang', ''),
(97, '_OVERWRITE_EXISTENT', 'admin_lang', ''),
(98, '_PERC_TRAD', 'admin_lang', ''),
(99, '_TOTAL_LANGUAGE_UPDATED', 'admin_lang', ''),
(100, '_TRANSALTIONTABLEFOR', 'admin_lang', ''),
(101, '_TRANSLATELANG', 'admin_lang', ''),
(102, '_TRANSLATELANGG', 'admin_lang', ''),
(103, '_TRANSLATION_COTAINS', 'admin_lang', ''),
(104, '_YESIMPORT', 'admin_lang', ''),
(105, '_CHOOSE_WHO_CAN_SEE', 'admin_news', ''),
(106, '_LONG_DESCR', 'admin_news', ''),
(107, '_NEWSINHOMEPAGE', 'admin_news', ''),
(108, '_NEWS_SUMMARY', 'admin_news', ''),
(109, '_TITLE_IMPORTANT', 'admin_news', ''),
(110, '_ANY', 'admin_newsletter', ''),
(111, '_NEWSLETTER_WILL_BE_SENT_TO', 'admin_newsletter', ''),
(112, '_SEC_OF_PAUSE', 'admin_newsletter', ''),
(113, '_SEND_SMS', 'admin_newsletter', ''),
(114, '_ADD_WEBPAGES', 'admin_webpages', ''),
(115, '_ALT_HOME', 'admin_webpages', ''),
(116, '_TITLE_HOME', 'admin_webpages', ''),
(117, '_TITLE_WEBPAGES', 'admin_webpages', ''),
(118, '_WEBPAGES_CAPTION', 'admin_webpages', ''),
(119, '_ADD_ADVICE', 'advice', ''),
(120, '_ADVICE', 'advice', ''),
(121, '_ALT_ARCHIVE', 'advice', ''),
(122, '_ARCHIVE_THIS_ADVICE', 'advice', ''),
(123, '_CHOOSE_READER', 'advice', ''),
(124, '_MANUAL_USER_SEL', 'advice', ''),
(125, '_YOUONLY', 'advice', ''),
(126, '_APR', 'calendar', ''),
(127, '_APRIL', 'calendar', ''),
(128, '_AUG', 'calendar', ''),
(129, '_AUGUST', 'calendar', ''),
(130, '_CAL_TITLE', 'calendar', ''),
(131, '_DAY_FIRST', 'calendar', ''),
(132, '_DEC', 'calendar', ''),
(133, '_DECEMBER', 'calendar', ''),
(134, '_DEF_DATE_FORMAT', 'calendar', ''),
(135, '_FEB', 'calendar', ''),
(136, '_FEBRUARY', 'calendar', ''),
(137, '_FRI', 'calendar', ''),
(138, '_FRIDAY', 'calendar', ''),
(139, '_GENERIC', 'calendar', ''),
(140, '_GO_TODAY', 'calendar', ''),
(141, '_JAN', 'calendar', ''),
(142, '_JANUARY', 'calendar', ''),
(143, '_JUL', 'calendar', ''),
(144, '_JULY', 'calendar', ''),
(145, '_JUN', 'calendar', ''),
(146, '_JUNE', 'calendar', ''),
(147, '_MAR', 'calendar', ''),
(148, '_MARCH', 'calendar', ''),
(149, '_MAY', 'calendar', ''),
(150, '_MEETING', 'calendar', ''),
(151, '_MON', 'calendar', ''),
(152, '_MONDAY', 'calendar', ''),
(153, '_NEXT_MONTH', 'calendar', ''),
(154, '_NEXT_YEAR', 'calendar', ''),
(155, '_NOV', 'calendar', ''),
(156, '_NOVEMBER', 'calendar', ''),
(157, '_OCT', 'calendar', ''),
(158, '_OCTOBER', 'calendar', ''),
(159, '_PART_TODAY', 'calendar', ''),
(160, '_PLS_WAIT', 'calendar', ''),
(161, '_PREV_MONTH', 'calendar', ''),
(162, '_PREV_YEAR', 'calendar', ''),
(163, '_PRIVATE', 'calendar', ''),
(164, '_PUBLIC', 'calendar', ''),
(165, '_PUBLISHING', 'calendar', ''),
(166, '_SAT', 'calendar', ''),
(167, '_SATURDAY', 'calendar', ''),
(168, '_SEP', 'calendar', ''),
(169, '_SEPTEMBER', 'calendar', ''),
(170, '_SUN', 'calendar', ''),
(171, '_SUNDAY', 'calendar', ''),
(172, '_THU', 'calendar', ''),
(173, '_THURSDAY', 'calendar', ''),
(174, '_TIME', 'calendar', ''),
(175, '_TODAY', 'calendar', ''),
(176, '_TT_DATE_FORMAT', 'calendar', ''),
(177, '_TUE', 'calendar', ''),
(178, '_TUESDAY', 'calendar', ''),
(179, '_WED', 'calendar', ''),
(180, '_WEDNESDAY', 'calendar', ''),
(181, '_WEEKEND', 'calendar', ''),
(182, '_WK', 'calendar', ''),
(183, '_ADD_TO_CART', 'catalogue', ''),
(184, '_CALENDAR', 'catalogue', ''),
(185, '_CAREER', 'catalogue', ''),
(186, '_CATALOGUE_SELECTION', 'catalogue', ''),
(187, '_CATALOGUE_SUMMARY', 'catalogue', ''),
(188, '_CERT_RELESABLE', 'catalogue', ''),
(189, '_CLASSROOM_LOCATION', 'catalogue', ''),
(190, '_CONFIRM_SUBSCRIPTION', 'catalogue', ''),
(191, '_COURSEPATH_INTRO', 'catalogue', ''),
(192, '_COURSEPATH_LIST', 'catalogue', ''),
(193, '_COURSEPATH_SUBSCRIBE_WIN_TIT', 'catalogue', ''),
(194, '_COURSEPATH_SUBSCRIBE_WIN_TXT', 'catalogue', ''),
(195, '_COURSE_AS', 'catalogue', ''),
(196, '_COURSE_BEGIN', 'catalogue', ''),
(197, '_COURSE_END', 'catalogue', ''),
(198, '_COURSE_EXPIRING', 'catalogue', ''),
(199, '_COURSE_LIST_SUMMARY', 'catalogue', ''),
(200, '_COURSE_SUBSCRIPTION', 'catalogue', ''),
(201, '_COURSE_S_GODADMIN', 'catalogue', ''),
(202, '_COURSE_S_MODERATE', 'catalogue', ''),
(203, '_COURSE_TYPE', 'catalogue', ''),
(204, '_COURSE_YOU_CAN_ACCESS', 'catalogue', ''),
(205, '_ELEARNING', 'catalogue', ''),
(206, '_ENTRY_CAPTION', 'catalogue', ''),
(207, '_ENTRY_SUMMARY', 'catalogue', ''),
(208, '_FILTER_DATE_BEGIN', 'catalogue', ''),
(209, '_FILTER_FOR_COURSE_TYPE', 'catalogue', ''),
(210, '_FILTER_FOR_SALE', 'catalogue', ''),
(211, '_IMPORT_NEW_ENTRY', 'catalogue', ''),
(212, '_METHOD_MANUAL', 'catalogue', ''),
(213, '_MOD_ENTRY_CATALOGUE', 'catalogue', ''),
(214, '_NEW_CATALOGUE', 'catalogue', ''),
(215, '_NO_COURSE', 'catalogue', ''),
(216, '_NO_COURSE_FOUND', 'catalogue', ''),
(217, '_NO_EDITIONS', 'catalogue', ''),
(218, '_PREASSESSMENT_SUGGESTION', 'catalogue', ''),
(219, '_REMOVE_ENTRY', 'catalogue', ''),
(220, '_RESERVE_COURSE', 'catalogue', ''),
(221, '_SHOPPING_CART', 'catalogue', ''),
(222, '_SUBSCRIBE_COURSE_T', 'catalogue', ''),
(223, '_TAB_VIEW_CATEGORY', 'catalogue', ''),
(224, '_TAB_VIEW_MOSTPOPULAR', 'catalogue', ''),
(225, '_TAB_VIEW_RECENT', 'catalogue', ''),
(226, '_TIT_SUBSCRIPTION_BY_CODE', 'catalogue', ''),
(227, '_TOTAL_COURSE', 'catalogue', ''),
(228, '_TXT_SUBSCRIPTION_BY_CODE', 'catalogue', ''),
(229, '_USER_STATUS_ENTER', 'catalogue', ''),
(230, '_WAITING_APPROVAL', 'catalogue', ''),
(231, '_WORD_TO_SEARCH', 'catalogue', ''),
(232, '_ALT_REM_META_CERT', 'certificate', ''),
(233, '_ALT_TAKE_A_COPY', 'certificate', ''),
(234, '_BACK_IMAGE', 'certificate', ''),
(235, '_BASE_LANGUAGE', 'certificate', ''),
(236, '_CERTIFICATE_CAPTION', 'certificate', ''),
(237, '_CERTIFICATE_LIST', 'certificate', ''),
(238, '_CERTIFICATE_REPORT', 'certificate', ''),
(239, '_CERTIFICATE_SUMMARY', 'certificate', ''),
(240, '_CERTIFICATE_VIEW_CAPTION', 'certificate', ''),
(241, '_CERTIFICATE_WARNING', 'certificate', ''),
(242, '_CHOOSE_CERTIFICATE', 'certificate', ''),
(243, '_CHOOSE_COURSE', 'certificate', ''),
(244, '_COURSE_BEGIN', 'certificate', ''),
(245, '_COURSE_DESCRIPTION', 'certificate', ''),
(246, '_COURSE_END', 'certificate', ''),
(247, '_COURSE_SCORE_FINAL_MAX', 'certificate', ''),
(248, '_COURSE_TODAY', 'certificate', ''),
(249, '_COURSE_YEAR', 'certificate', ''),
(250, '_DATE_COMPLETE', 'certificate', ''),
(251, '_DATE_ENROLL', 'certificate', ''),
(252, '_DISPLAY_NAME', 'certificate', ''),
(253, '_EX_CERT_POINT_REQUIRED', 'certificate', ''),
(254, '_GENERATE', 'certificate', ''),
(255, '_GENERATE_ALL_SELECTED', 'certificate', ''),
(256, '_LANDSCAPE', 'certificate', ''),
(257, '_META_CERTIFICATE_ASSIGN_CAPTION', 'certificate', ''),
(258, '_META_CERTIFICATE_CAPTION', 'certificate', ''),
(259, '_META_CERTIFICATE_CREATE_CAPTION', 'certificate', ''),
(260, '_META_CERTIFICATE_DETAILS_CAPTION', 'certificate', ''),
(261, '_META_CERTIFICATE_NEW_ASSIGN_CAPTION', 'certificate', ''),
(262, '_META_CERTIFICATE_NEW_ASSIGN_SUMMARY', 'certificate', ''),
(263, '_META_CERTIFICATE_PROGRESS', 'certificate', ''),
(264, '_META_CERTIFICATE_SUMMARY', 'certificate', ''),
(265, '_MY_CERTIFICATE', 'certificate', ''),
(266, '_NEW_ASSING_META_CERTIFICATE', 'certificate', ''),
(267, '_NEW_CERTIFICATE', 'certificate', ''),
(268, '_NOT_ENDED', 'certificate', ''),
(269, '_NO_CERT_AVAILABLE', 'certificate', ''),
(270, '_NO_USER_FOR_CERTIFICATE', 'certificate', ''),
(271, '_NO_USER_FOUND', 'certificate', ''),
(272, '_NUMBER_OF_CERTIFICATE', 'certificate', ''),
(273, '_ORIENTATION', 'certificate', ''),
(274, '_PORTRAIT', 'certificate', ''),
(275, '_RELASE_DATE', 'certificate', ''),
(276, '_RELEASED', 'certificate', ''),
(277, '_STOP', 'certificate', ''),
(278, '_STRUCTURE_CERTIFICATE', 'certificate', ''),
(279, '_STRUCTURE_META_CERTIFICATE', 'certificate', ''),
(280, '_TABLE_COURSE', 'certificate', ''),
(281, '_TAG_CODE', 'certificate', ''),
(282, '_TAG_DESCRIPTION', 'certificate', ''),
(283, '_TAG_LIST_CAPTION', 'certificate', ''),
(284, '_TAG_LIST_SUMMARY', 'certificate', ''),
(285, '_TAKE_A_COPY', 'certificate', ''),
(286, '_TEMPLATE', 'certificate', ''),
(287, '_TEST_SCORE_FINAL', 'certificate', ''),
(288, '_TEST_SCORE_FINAL_MAX', 'certificate', ''),
(289, '_TEST_SCORE_START', 'certificate', ''),
(290, '_TEST_SCORE_START_MAX', 'certificate', ''),
(291, '_TITLE_ASSIGN_META_CERTIFICATE', 'certificate', ''),
(292, '_TITLE_CERTIFICATE', 'certificate', ''),
(293, '_TITLE_CREATE_META_CERTIFICATE', 'certificate', ''),
(294, '_TITLE_META_CERTIFICATE', 'certificate', ''),
(295, '_TITLE_META_CERTIFICATE_ASSIGN', 'certificate', ''),
(296, '_TITLE_META_CERTIFICATE_CREATE', 'certificate', ''),
(297, '_TITLE_META_CERTIFICATE_DELETING', 'certificate', ''),
(298, '_TITLE_VIEW_CERT', 'certificate', ''),
(299, '_TOTAL_TIME', 'certificate', ''),
(300, '_TOTAL_TIME_HOUR', 'certificate', ''),
(301, '_TOTAL_TIME_MINUTE', 'certificate', ''),
(302, '_TOTAL_TIME_SECOND', 'certificate', ''),
(303, '_TO_RELEASE', 'certificate', ''),
(304, '_USER_FOR_META_CERTIFICATE_ASSIGN', 'certificate', ''),
(305, '_CHAT_DESCRIPTION', 'chat', ''),
(306, '_OPENCHAT', 'chat', ''),
(307, '_OPENCHAT_WA', 'chat', ''),
(308, '_AVAILABLE_INSTRUMENT', 'classroom', ''),
(309, '_BUILDING_ROOM', 'classroom', ''),
(310, '_CAPACITY', 'classroom', ''),
(311, '_CITY', 'classroom', ''),
(312, '_DISPOSITION', 'classroom', ''),
(313, '_FAX', 'classroom', ''),
(314, '_INSTRUMENT', 'classroom', ''),
(315, '_PHONE', 'classroom', ''),
(316, '_PHOTO', 'classroom', ''),
(317, '_RESPONSABLE', 'classroom', ''),
(318, '_STATE', 'classroom', ''),
(319, '_STREET', 'classroom', ''),
(320, '_ZIP_CODE', 'classroom', ''),
(321, '_CODE_LIST', 'code', ''),
(322, '_CODE_USED_NUMBER', 'code', ''),
(323, '_UNLIMITED_USE', 'code', ''),
(324, '_USED', 'code', ''),
(325, '_ADD_COMPETENCE', 'competences', ''),
(326, '_ASSIGN_USER_TITLE', 'competences', ''),
(327, '_COMPETENCES_REQUIRED', 'competences', ''),
(328, '_COMPETENCES_TYPOLOGY_ATTITUDE', 'competences', ''),
(329, '_COMPETENCES_TYPOLOGY_KNOWLEDGE', 'competences', ''),
(330, '_COMPETENCES_TYPOLOGY_SKILL', 'competences', ''),
(331, '_COMPETENCES_USER_TAB_CAPTION', 'competences', ''),
(332, '_COMPETENCE_OBTAINED', 'competences', ''),
(333, '_DATE_OBTAINED', 'competences', ''),
(334, '_EXPIRATION_DAYS', 'competences', ''),
(335, '_TYPE_FLAG', 'competences', ''),
(336, '_WITH_COURSE_ASSOCIATIONS', 'competences', ''),
(337, '_WITH_FNCROLE_ASSOCIATIONS', 'competences', ''),
(338, '_WITH_USER_ASSOCIATIONS', 'competences', ''),
(339, '_AT_HOUR', 'conference', ''),
(340, '_CONFERENCE_NAME', 'conference', ''),
(341, '_CONFERENCE_SYSTEM', 'conference', ''),
(342, '_MAX_PARTICIPANTS', 'conference', ''),
(343, '_MEETING_HOURS', 'conference', ''),
(344, '_NO_MORE_ROOM', 'conference', ''),
(345, '_NO_ROOM_AVAILABLE', 'conference', ''),
(346, '_ROOMS_AVAILABLE', 'conference', ''),
(347, '_SUMMARY_ROOM_AVAILABLE', 'conference', ''),
(348, '_ACCESSIBILITY', 'configuration', ''),
(349, '_ALLOW_URL_FOPEN', 'configuration', ''),
(350, '_ALLOW_URL_INCLUDE', 'configuration', ''),
(351, '_API', 'configuration', ''),
(352, '_API_SSO', 'configuration', ''),
(353, '_ASK_FOR_CODE_MODULE', 'configuration', ''),
(354, '_ASK_FOR_DROPDOWN_TREE_CODE', 'configuration', ''),
(355, '_ASK_FOR_MANUAL_TREE_CODE', 'configuration', ''),
(356, '_ASK_FOR_TREE_COURSE_CODE', 'configuration', ''),
(357, '_BBB_MAX_MIKES', 'configuration', ''),
(358, '_BBB_MAX_PARTICIPANT', 'configuration', ''),
(359, '_BBB_MAX_ROOM', 'configuration', ''),
(360, '_BBB_PASSWORD_MODERATOR', 'configuration', ''),
(361, '_BBB_PASSWORD_VIEWER', 'configuration', ''),
(362, '_BBB_PORT', 'configuration', ''),
(363, '_BBB_SALT', 'configuration', ''),
(364, '_BBB_SERVER', 'configuration', ''),
(365, '_BBB_USER', 'configuration', ''),
(366, '_CODE_TELESKILL', 'configuration', ''),
(367, '_COMMON_ADMIN_SESSION', 'configuration', ''),
(368, '_CONFERENCE_CREATION_LIMIT_PER_USER', 'configuration', ''),
(369, '_CONFIGURATION', 'configuration', ''),
(370, '_CONFIRM_REGISTER_TYPE_SELF', 'configuration', ''),
(371, '_CONF_GLOBAL', 'configuration', ''),
(372, '_CONF_LMS', 'configuration', ''),
(373, '_COURSE_BLOCK', 'configuration', ''),
(374, '_COURSE_QUOTA', 'configuration', ''),
(375, '_CURRENCY_SYMBOL', 'configuration', ''),
(376, '_CUSTOMER_HELP_EMAIL', 'configuration', ''),
(377, '_CUSTOMER_HELP_SUBJ_PFX', 'configuration', ''),
(378, '_DEBUG', 'configuration', ''),
(379, '_DEFAULTTEMPLATE', 'configuration', ''),
(380, '_DIMDIM_MAX_MIKES', 'configuration', ''),
(381, '_DIMDIM_MAX_PARTICIPANT', 'configuration', ''),
(382, '_DIMDIM_MAX_ROOM', 'configuration', ''),
(383, '_DIMDIM_PASSWORD', 'configuration', ''),
(384, '_DIMDIM_PORT', 'configuration', ''),
(385, '_DIMDIM_SERVER', 'configuration', ''),
(386, '_DIMDIM_USER', 'configuration', ''),
(387, '_DOMXML', 'configuration', ''),
(388, '_DONT_SHOW', 'configuration', ''),
(389, '_DO_DEBUG', 'configuration', ''),
(390, '_ECOMMERCE', 'configuration', ''),
(391, '_FILE_UPLOAD_WHITELIST', 'configuration', ''),
(392, '_FIRST_CATALOGUE', 'configuration', ''),
(393, '_FORUM_AS_TABLE', 'configuration', ''),
(394, '_FTPERR', 'configuration', ''),
(395, '_FTPOK', 'configuration', ''),
(396, '_GOOGLE_STAT_CODE', 'configuration', ''),
(397, '_GOOGLE_STAT_IN_LMS', 'configuration', ''),
(398, '_HOUR_REQUEST_LIMIT', 'configuration', ''),
(399, '_HTEDITOR', 'configuration', ''),
(400, '_HTMLEDIT_IMAGE_ADMIN', 'configuration', ''),
(401, '_HTMLEDIT_IMAGE_GODADMIN', 'configuration', ''),
(402, '_HTMLEDIT_IMAGE_USER', 'configuration', ''),
(403, '_KB_FILTER_BY_USER_ACCESS', 'configuration', ''),
(404, '_KB_SHOW_UNCATEGORIZED', 'configuration', ''),
(405, '_LANG_CHECK', 'configuration', ''),
(406, '_LASTFIRST_MANDATORY', 'configuration', ''),
(407, '_LDAP', 'configuration', ''),
(408, '_LDAP_PORT', 'configuration', ''),
(409, '_LDAP_SERVER', 'configuration', ''),
(410, '_LDAP_USED', 'configuration', ''),
(411, '_LDAP_USER_STRING', 'configuration', ''),
(412, '_MAGIC_QUOTES_GPC', 'configuration', ''),
(413, '_MAIL_SENDER', 'configuration', ''),
(414, '_MAINTENANCE', 'configuration', ''),
(415, '_MAINTENANCE_PW', 'configuration', ''),
(416, '_MAIN_OPTIONS', 'configuration', ''),
(417, '_MANDATORY_CODE', 'configuration', ''),
(418, '_MAX_EXECUTION_TIME', 'configuration', ''),
(419, '_MAX_LOG_ATTEMPT', 'configuration', ''),
(420, '_MYSQL_COLLATION', 'configuration', ''),
(421, '_MYSQL_ENCODING', 'configuration', ''),
(422, '_MYSQL_MODE', 'configuration', ''),
(423, '_MYSQL_TIMEZONE', 'configuration', ''),
(424, '_MYSQL_VERS', 'configuration', ''),
(425, '_NL_SENDPAUSE', 'configuration', ''),
(426, '_NL_SENDPERCYCLE', 'configuration', ''),
(427, '_NOTSCORM', 'configuration', ''),
(428, '_NO_ANSWER_IN_POLL', 'configuration', ''),
(429, '_NO_ANSWER_IN_TEST', 'configuration', ''),
(430, '_ON_CATALOGUE_EMPTY', 'configuration', ''),
(431, '_ON_USERCOURSE_EMPTY', 'configuration', ''),
(432, '_OPENSSL', 'configuration', ''),
(433, '_ORG_NAME_TELESKILL', 'configuration', ''),
(434, '_OWNED_BY', 'configuration', ''),
(435, '_PAGE_TITLE', 'configuration', ''),
(436, '_PASS_ALFANUMERIC', 'configuration', ''),
(437, '_PASS_CHANGE_FIRST_LOGIN', 'configuration', ''),
(438, '_PASS_MAX_TIME_VALID', 'configuration', ''),
(439, '_PASS_MIN_CHAR', 'configuration', ''),
(440, '_PATH', 'configuration', ''),
(441, '_PATHCHAT', 'configuration', ''),
(442, '_PATHCOURSE', 'configuration', ''),
(443, '_PATHFIELD', 'configuration', ''),
(444, '_PATHFORUM', 'configuration', ''),
(445, '_PATHLESSON', 'configuration', ''),
(446, '_PATHMESSAGE', 'configuration', ''),
(447, '_PATHPHOTO', 'configuration', ''),
(448, '_PATHPRJ', 'configuration', ''),
(449, '_PATHSCORM', 'configuration', ''),
(450, '_PATHSPONSOR', 'configuration', ''),
(451, '_PATHTEST', 'configuration', ''),
(452, '_PAYPAL_CURRENCY', 'configuration', ''),
(453, '_PAYPAL_MAIL', 'configuration', ''),
(454, '_PAYPAL_SANDBOX', 'configuration', ''),
(455, '_PHPINFO', 'configuration', ''),
(456, '_PHPVERSION', 'configuration', ''),
(457, '_PHP_TIMEZONE', 'configuration', ''),
(458, '_POST_MAX_SIZE', 'configuration', ''),
(459, '_PRIVACY_POLICY', 'configuration', ''),
(460, '_PROFILE_ONLY_PWD', 'configuration', ''),
(461, '_REGISTER_DELETED_USER', 'configuration', ''),
(462, '_REGISTER_GLOBAL', 'configuration', ''),
(463, '_REGISTER_TYPE', 'configuration', ''),
(464, '_REGISTER_TYPE_ADMIN', 'configuration', ''),
(465, '_REGISTER_TYPE_MODERATE', 'configuration', ''),
(466, '_REGISTER_TYPE_SELF', 'configuration', ''),
(467, '_REGISTER_TYPE_SELF_OPTIN', 'configuration', ''),
(468, '_REGISTRATION_CODE_TYPE', 'configuration', ''),
(469, '_REQUEST_MANDATORY_FIELDS_COMPILATION', 'configuration', ''),
(470, '_REST_AUTH_API_KEY', 'configuration', ''),
(471, '_REST_AUTH_API_SECRET', 'configuration', ''),
(472, '_REST_AUTH_CODE', 'configuration', ''),
(473, '_REST_AUTH_LIFETIME', 'configuration', ''),
(474, '_REST_AUTH_METHOD', 'configuration', ''),
(475, '_REST_AUTH_SECRET_KEY', 'configuration', ''),
(476, '_REST_AUTH_TOKEN', 'configuration', ''),
(477, '_REST_AUTH_UPDATE', 'configuration', ''),
(478, '_SAFEMODE', 'configuration', ''),
(479, '_SAVE_LA_AFTER_MAX', 'configuration', ''),
(480, '_SAVE_LA_ALL', 'configuration', ''),
(481, '_SAVE_LOG_ATTEMPT', 'configuration', ''),
(482, '_SCO_DIRECT_PLAY', 'configuration', ''),
(483, '_SECURITY', 'configuration', ''),
(484, '_SENDER_EVENT', 'configuration', ''),
(485, '_SEND_CC_FOR_SYSTEM_EMAILS', 'configuration', ''),
(486, '_SERVERINFO', 'configuration', ''),
(487, '_SERVER_ADDR', 'configuration', ''),
(488, '_SERVER_ADMIN', 'configuration', ''),
(489, '_SERVER_MYSQL', 'configuration', ''),
(490, '_SERVER_NAME', 'configuration', ''),
(491, '_SERVER_PORT', 'configuration', ''),
(492, '_SERVER_SOFTWARE', 'configuration', ''),
(493, '_SESSION_IP_CONTROL', 'configuration', ''),
(494, '_SHOW_AS_BLOCK', 'configuration', ''),
(495, '_SHOW_AS_LINK', 'configuration', ''),
(496, '_SMS', 'configuration', ''),
(497, '_SMSMARKET_LOGO', 'configuration', ''),
(498, '_SMS_BUY_RECHARGE', 'configuration', ''),
(499, '_SMS_CELL_NUM_FIELD', 'configuration', ''),
(500, '_SMS_CREDIT', 'configuration', ''),
(501, '_SMS_CREDIT_UPDATE', 'configuration', ''),
(502, '_SMS_GATEWAY_1', 'configuration', ''),
(503, '_SMS_GATEWAY_2', 'configuration', ''),
(504, '_SMS_GATEWAY_3', 'configuration', ''),
(505, '_SMS_GATEWAY_4', 'configuration', ''),
(506, '_SMS_GATEWAY_AUTO', 'configuration', ''),
(507, '_SMS_GATEWAY_HOST', 'configuration', ''),
(508, '_SMS_GATEWAY_ID', 'configuration', ''),
(509, '_SMS_GATEWAY_PASS', 'configuration', ''),
(510, '_SMS_GATEWAY_PORT', 'configuration', ''),
(511, '_SMS_GATEWAY_USER', 'configuration', ''),
(512, '_SMS_INTERNATIONAL_PREFIX', 'configuration', ''),
(513, '_SMS_SENT_FROM', 'configuration', ''),
(514, '_SOCIAL', 'configuration', ''),
(515, '_SOCIAL_FB_ACTIVE', 'configuration', ''),
(516, '_SOCIAL_FB_API', 'configuration', ''),
(517, '_SOCIAL_FB_SECRET', 'configuration', ''),
(518, '_SOCIAL_GOOGLE_ACTIVE', 'configuration', ''),
(519, '_SOCIAL_GOOGLE_CLIENT_ID', 'configuration', ''),
(520, '_SOCIAL_GOOGLE_SECRET', 'configuration', ''),
(521, '_SOCIAL_LINKEDIN_ACCESS', 'configuration', ''),
(522, '_SOCIAL_LINKEDIN_ACTIVE', 'configuration', ''),
(523, '_SOCIAL_LINKEDIN_SECRET', 'configuration', ''),
(524, '_SOCIAL_TWITTER_ACTIVE', 'configuration', ''),
(525, '_SOCIAL_TWITTER_CONSUMER', 'configuration', ''),
(526, '_SOCIAL_TWITTER_SECRET', 'configuration', ''),
(527, '_SSO_SECRET', 'configuration', ''),
(528, '_SSO_TOKEN', 'configuration', ''),
(529, '_STOP_CONCURRENT_USER', 'configuration', ''),
(530, '_TABLIST_MYCOURSES', 'configuration', ''),
(531, '_TELESKILL_MAX_PARTICIPANT', 'configuration', ''),
(532, '_TELESKILL_MAX_ROOM', 'configuration', ''),
(533, '_TEMPLATE_DOMAIN', 'configuration', ''),
(534, '_TRACKING', 'configuration', ''),
(535, '_TTLSESSION', 'configuration', ''),
(536, '_UPLOADFTP', 'configuration', ''),
(537, '_UPLOAD_MAX_FILESIZE', 'configuration', ''),
(538, '_URL', 'configuration', ''),
(539, '_URL_CHECKIN_TELESKILL', 'configuration', ''),
(540, '_URL_VIDEOCONFERENCE_TELESKILL', 'configuration', ''),
(541, '_USEFULL_ONLY_IF', 'configuration', ''),
(542, '_USER_PWD_HISTORY_LENGTH', 'configuration', ''),
(543, '_USER_QUOTA', 'configuration', ''),
(544, '_USE_ADVANCED_FORM', 'configuration', ''),
(545, '_USE_DIMDIM_API', 'configuration', ''),
(546, '_USE_REST_API', 'configuration', ''),
(547, '_USE_TAG', 'configuration', ''),
(548, '_WARINNG_SOCIAL', 'configuration', ''),
(549, '_ADDFILE', 'course', ''),
(550, '_ADDFILES', 'course', ''),
(551, '_ADD_SUBSCRIBE', 'course', ''),
(552, '_ADVERT_ADVICE', 'course', ''),
(553, '_ADVERT_FORUM', 'course', ''),
(554, '_ADVERT_LOBJ', 'course', ''),
(555, '_ALLOW_OVERBOOKING', 'course', ''),
(556, '_ALL_OPEN', 'course', ''),
(557, '_ASSIGN_FOR_ALL_STATUS', 'course', ''),
(558, '_ASSIGN_FOR_STATUS_COMPLETED', 'course', ''),
(559, '_ASSIGN_FOR_STATUS_INCOURSE', 'course', ''),
(560, '_ASSIGN_MENU', 'course', ''),
(561, '_AUTOREGISTRATION_CODE', 'course', ''),
(562, '_BACK_TO_ADMINISTRATION', 'course', ''),
(563, '_BUY_COURSE', 'course', ''),
(564, '_CAN_SUBSCRIBE', 'course', ''),
(565, '_CASCADE_MOD_ON_EDITION', 'course', ''),
(566, '_CATEGORY_PATH', 'course', ''),
(567, '_CATEGORY_SELECTED', 'course', ''),
(568, '_CERTIFICATE_ASSIGN_STATUS', 'course', ''),
(569, '_CERTIFICATE_EX_ASSIGN_STATUS', 'course', ''),
(570, '_CERTIFICATE_LANGUAGE', 'course', ''),
(571, '_CERTIFICATE_NAME', 'course', ''),
(572, '_CERTIFICATE_RELEASED', 'course', ''),
(573, '_CLASSROOMTOCOURSE_CAPTION', 'course', ''),
(574, '_CLASSROOM_EDITION', 'course', ''),
(575, '_CLASSROOM_OCCUPATED', 'course', ''),
(576, '_CLASSROOM_OCCUPATED_YES', 'course', ''),
(577, '_CONFIRM_EXIT', 'course', ''),
(578, '_COPY_SUBSCRIPTION_TO_COURSE', 'course', ''),
(579, '_COURSE_ADVANCE', 'course', ''),
(580, '_COURSE_AUTOREGISTRATION_CODE', 'course', ''),
(581, '_COURSE_CONTENT', 'course', ''),
(582, '_COURSE_DATE', 'course', ''),
(583, '_COURSE_DEMO', 'course', ''),
(584, '_COURSE_DISPLAY_MODE', 'course', ''),
(585, '_COURSE_EDITION', 'course', ''),
(586, '_COURSE_EM_LO', 'course', ''),
(587, '_COURSE_EM_TEACHER', 'course', ''),
(588, '_COURSE_END_MODE', 'course', ''),
(589, '_COURSE_INTRO', 'course', ''),
(590, '_COURSE_INTRO_WITH_MAX', 'course', ''),
(591, '_COURSE_LANG_METHOD', 'course', ''),
(592, '_COURSE_LIST_SUMMARY', 'course', ''),
(593, '_COURSE_LOGO', 'course', ''),
(594, '_COURSE_MENU_TO_ASSIGN', 'course', ''),
(595, '_COURSE_PRIZE', 'course', ''),
(596, '_COURSE_QUOTA', 'course', ''),
(597, '_COURSE_SELECTION', 'course', ''),
(598, '_COURSE_SELL', 'course', ''),
(599, '_COURSE_SPECIAL_OPTION', 'course', ''),
(600, '_COURSE_STATUS_CANNOT_ENTER', 'course', ''),
(601, '_COURSE_SUBSCRIPTION', 'course', ''),
(602, '_COURSE_SUBSRIBE', 'course', ''),
(603, '_COURSE_S_GODADMIN', 'course', ''),
(604, '_COURSE_S_MODERATE', 'course', ''),
(605, '_COURSE_S_SECURITY_CODE', 'course', ''),
(606, '_COURSE_TEACHERS', 'course', ''),
(607, '_COURSE_TIME_OPTION', 'course', ''),
(608, '_COURSE_TYPE', 'course', ''),
(609, '_COURSE_TYPE_BLENDED', 'course', ''),
(610, '_COURSE_TYPE_EDITION', 'course', ''),
(611, '_COURSE_TYPE_ELEARNING', 'course', ''),
(612, '_COURSE_USERISCR', 'course', ''),
(613, '_CREATION_DATE', 'course', ''),
(614, '_CST_AVAILABLE', 'course', ''),
(615, '_CST_CANCELLED', 'course', ''),
(616, '_CST_CONCLUDED', 'course', ''),
(617, '_CST_CONFIRMED', 'course', ''),
(618, '_CST_PREPARATION', 'course', ''),
(619, '_DAY_OF_VALIDITY', 'course', ''),
(620, '_DEMO', 'course', ''),
(621, '_DIRECT_PLAY', 'course', ''),
(622, '_DOCUMENT_UPLOAD', 'course', ''),
(623, '_DONT_SHOW', 'course', ''),
(624, '_DOWNLOAD_MATERIALS', 'course', ''),
(625, '_EDTION_TIME', 'course', ''),
(626, '_ENDOBJECT', 'course', ''),
(627, '_EXPIRED', 'course', ''),
(628, '_EXPIRING_IN', 'course', ''),
(629, '_FILEUNSPECIFIED', 'course', ''),
(630, '_FILTER_FLATVIEW', 'course', ''),
(631, '_FIRSTACOURSE', 'course', ''),
(632, '_GENERATE_CODE', 'course', ''),
(633, '_GOTO_COURSE_T', 'course', ''),
(634, '_HOUR_BEGIN', 'course', ''),
(635, '_HOUR_END', 'course', ''),
(636, '_IF_NEW_FILE', 'course', ''),
(637, '_IMPORT_FROM_COURSE', 'course', ''),
(638, '_IMPORT_SUBSCRIBE', 'course', ''),
(639, '_INFO', 'course', ''),
(640, '_INHERIT_QUOTA', 'course', ''),
(641, '_IN_COURSE', 'course', ''),
(642, '_IN_THE_CLASSROOM', 'course', ''),
(643, '_LESS_INFO', 'course', ''),
(644, '_MAIN_CATEGORY', 'course', ''),
(645, '_MANUALACTION', 'course', ''),
(646, '_MATERIALS', 'course', ''),
(647, '_MATERIALS_TABLE', 'course', ''),
(648, '_MAX_NUM_SUBSCRIBE', 'course', ''),
(649, '_MAX_SMS_BUDGET', 'course', ''),
(650, '_MEDIUM', 'course', ''),
(651, '_MEDIUMTIME', 'course', ''),
(652, '_MEDIUM_TIME', 'course', ''),
(653, '_MIN_NUM_SUBSCRIBE', 'course', ''),
(654, '_MIN_SCORE_NOT_SET', 'course', ''),
(655, '_MIN_SUBSCRIBE_FOR_COURSE', 'course', ''),
(656, '_MULTIPLE_SUBSCRIPTION', 'course', ''),
(657, '_MY_CERTIFICATE', 'course', ''),
(658, '_NEW_USER_SUBS_WAITING_TEXT', 'course', 'accessibility'),
(659, '_NOACTIVE', 'course', ''),
(660, '_NOENTER', 'course', ''),
(661, '_NO_COURSE_FOUND', 'course', ''),
(662, '_OTHER_OPTION', 'course', ''),
(663, '_OTHER_USER_MATERIAL', 'course', ''),
(664, '_PARTIAL_TIME', 'course', ''),
(665, '_PAUSE_BEGIN', 'course', ''),
(666, '_PAUSE_END', 'course', ''),
(667, '_PERMCLOSE', 'course', ''),
(668, '_PROGRESS_ALL', 'course', ''),
(669, '_PROGRESS_COMPLETED', 'course', ''),
(670, '_PROGRESS_FAILED', 'course', ''),
(671, '_PROGRESS_INCOMPLETE', 'course', ''),
(672, '_PROGRESS_PASSED', 'course', ''),
(673, '_PROGRESS_TITLE', 'course', ''),
(674, '_QUOTA_EXCEDED', 'course', ''),
(675, '_RANDOM_COURSE_AUTOREGISTRATION_CODE', 'course', ''),
(676, '_RESERVE_COURSE', 'course', ''),
(677, '_SC_EVERYWHERE', 'course', ''),
(678, '_SC_ONLYINSC_USER', 'course', ''),
(679, '_SC_ONLY_IN', 'course', ''),
(680, '_SELF_UNSUBSCRIBE', 'course', ''),
(681, '_SHOW_ADVANCED_INFO', 'course', ''),
(682, '_SHOW_COUNT', 'course', ''),
(683, '_SHOW_DEMO', 'course', ''),
(684, '_SHOW_INSTMSG', 'course', ''),
(685, '_SHOW_PROGRESS', 'course', ''),
(686, '_SHOW_TIME', 'course', ''),
(687, '_SHOW_USER_OF_LEVEL', 'course', ''),
(688, '_SHOW_WHOISONLINE', 'course', ''),
(689, '_SPONSORED_BY', 'course', ''),
(690, '_SPONSOR_LINK', 'course', ''),
(691, '_SPONSOR_LOGO', 'course', ''),
(692, '_STATCANNOTENTER', 'course', ''),
(693, '_SUBSCRIBED_T', 'course', ''),
(694, '_SUBSCRIBE_METHOD', 'course', ''),
(695, '_SUBSCRIPTION', 'course', ''),
(696, '_SUBSCRIPTION_CLOSED', 'course', ''),
(697, '_SUBSCRIPTION_CORRECT', 'course', ''),
(698, '_SUBSCRIPTION_DATE_BEGIN', 'course', ''),
(699, '_SUBSCRIPTION_DATE_END', 'course', ''),
(700, '_SUBSCRIPTION_ERROR', 'course', ''),
(701, '_SUBSCRIPTION_IN_PERIOD', 'course', ''),
(702, '_SUBSCRIPTION_OPEN', 'course', ''),
(703, '_THANKS_LOGIN_OR_REGISTER', 'course', ''),
(704, '_THEACER_LIST', 'course', ''),
(705, '_TITLE_CATEGORY_JUMP', 'course', ''),
(706, '_TITLE_CERTIFICATE_TO_COURSE', 'course', ''),
(707, '_T_USER_STATUS_BEGIN', 'course', ''),
(708, '_T_USER_STATUS_CONFIRMED', 'course', ''),
(709, '_T_USER_STATUS_END', 'course', ''),
(710, '_T_USER_STATUS_RESERVED', 'course', ''),
(711, '_T_USER_STATUS_SUBS', 'course', ''),
(712, '_UNLIMITED_QUOTA', 'course', ''),
(713, '_UNSUBSCRIBE_DATE_LIMIT', 'course', ''),
(714, '_UNSUBSCRIBE_REQUESTS', 'course', ''),
(715, '_UNSUBSCRIBE_REQUEST_WAITING_FOR_MODERATION', 'course', ''),
(716, '_USED_DISK', 'course', ''),
(717, '_USERWAITING', 'course', ''),
(718, '_USER_CAN_SUBSCRIBE', 'course', ''),
(719, '_USER_CAN_UNSUBSCRIBE', 'course', ''),
(720, '_USER_EDITION_SUBSCRIBE', 'course', ''),
(721, '_USER_LVL', 'course', ''),
(722, '_USER_MATERIAL', 'course', ''),
(723, '_USETHIS', 'course', ''),
(724, '_USE_LOGO_IN_COURSELIST', 'course', ''),
(725, '_VOTE_BAD_ALT', 'course', 'accessibility'),
(726, '_VOTE_BAD_TITLE', 'course', ''),
(727, '_VOTE_GOOD_ALT', 'course', 'accessibility'),
(728, '_VOTE_GOOD_TITLE', 'course', ''),
(729, '_WAITING_PAYMENT', 'course', ''),
(730, '_WELCOME', 'course', ''),
(731, '_WHAT_SHOW', 'course', ''),
(732, '_WHERE_SHOW_COURSE', 'course', ''),
(733, '_WHOIS_ONLINE', 'course', ''),
(734, '_ALT_REM_SUB', 'coursepath', ''),
(735, '_AREE_YOU_SURE_TO_REMOVE_COURSE_FROM_PATH', 'coursepath', ''),
(736, '_COURSE_PATH_CAPTION', 'coursepath', ''),
(737, '_COURSE_PATH_COURSES_CAPTION', 'coursepath', ''),
(738, '_COURSE_PATH_SUBSCRIBE', 'coursepath', ''),
(739, '_COURSE_S_GODADMIN', 'coursepath', ''),
(740, '_COURSE_S_MODERATE', 'coursepath', ''),
(741, '_CURRENT_ACTIVITY', 'coursepath', ''),
(742, '_IMPORT_COURSE', 'coursepath', ''),
(743, '_SUBSCRIBED_CAPTION', 'coursepath', ''),
(744, '_ACTIVITY_INFO', 'coursereport', ''),
(745, '_ADD_ACTIVITY', 'coursereport', ''),
(746, '_ADD_ACTIVITY_TITLE', 'coursereport', ''),
(747, '_ADD_SCORM_RESULTS', 'coursereport', ''),
(748, '_ANSWER_CORRECT', 'coursereport', ''),
(749, '_COURSE_REPORT_CAPTION', 'coursereport', ''),
(750, '_COURSE_REPORT_SUMMARY', 'coursereport', ''),
(751, '_EXPORT_STATS', 'coursereport', ''),
(752, '_LEFT', 'coursereport', ''),
(753, '_MOVE_LEFT', 'coursereport', ''),
(754, '_MOVE_RIGHT', 'coursereport', ''),
(755, '_NOT_CHECKED', 'coursereport', ''),
(756, '_NOT_PASSED', 'coursereport', ''),
(757, '_OF_USER', 'coursereport', ''),
(758, '_PASSED', 'coursereport', ''),
(759, '_PERCENTAGE_CORRECT', 'coursereport', ''),
(760, '_QUESTION_ANSWERED', 'coursereport', ''),
(761, '_REDO_FINAL_VOTE', 'coursereport', ''),
(762, '_REDO_FINAL_VOTE_TITLE', 'coursereport', ''),
(763, '_REQUIRED_MUST_BE_LESS_THEN_MAX', 'coursereport', ''),
(764, '_RESET_TRACK', 'coursereport', ''),
(765, '_RIGHT', 'coursereport', ''),
(766, '_ROUND_FINAL_VOTE_TITLE', 'coursereport', ''),
(767, '_ROUND_TEST_VOTE', 'coursereport', ''),
(768, '_ROUND_VOTE', 'coursereport', ''),
(769, '_SHOW_ANSWER', 'coursereport', ''),
(770, '_SHOW_TO_USER', 'coursereport', ''),
(771, '_STANDARD_DEVIATION', 'coursereport', ''),
(772, '_STUDENTS', 'coursereport', ''),
(773, '_STUDENTS_VOTE', 'coursereport', ''),
(774, '_SUMMARY_VOTE', 'coursereport', ''),
(775, '_TABLE_QUEST', 'coursereport', ''),
(776, '_TABLE_QUEST_CORRECT_ASS', 'coursereport', ''),
(777, '_TABLE_QUEST_CORRECT_TXT', 'coursereport', ''),
(778, '_TABLE_QUEST_LIST', 'coursereport', ''),
(779, '_TEST_INFO', 'coursereport', ''),
(780, '_TITLE_ACT', 'coursereport', ''),
(781, '_TOT_QUESTION', 'coursereport', ''),
(782, '_TQ_LINK', 'coursereport', ''),
(783, '_USE_FOR_FINAL', 'coursereport', ''),
(784, '_WEIGHT', 'coursereport', ''),
(785, '_AUTOREGISTRATION', 'course_autoregistration', ''),
(786, '_BACK_TO_COURSE', 'course_autoregistration', ''),
(787, '_CODE_ALREDY_USED', 'course_autoregistration', ''),
(788, '_CODE_NOT_VALID', 'course_autoregistration', ''),
(789, '_COURSE_AUTOREGISTRATION_CODE', 'course_autoregistration', ''),
(790, '_ACTIVITY_CHART_DESCRIPTION', 'course_charts', ''),
(791, '_CHAPTER_CHART_DESCRIPTION', 'course_charts', ''),
(792, '_COMPLETED_CHART_DESCRIPTION', 'course_charts', ''),
(793, '_NO_SCORM_IN_COURSE', 'course_charts', ''),
(794, '_PASSED_CHART_TITLE', 'course_charts', ''),
(795, '_SCORE_CHART_DESCRIPTION', 'course_charts', ''),
(796, '_TIME_CHART_DESCRIPTION', 'course_charts', ''),
(797, '_TIME_CHART_TITLE', 'course_charts', ''),
(798, '_SEL_COURSE', 'course_selector', ''),
(799, '_CUSTOMER_HELP', 'customer_help', ''),
(800, '_README_HELP', 'customer_help', ''),
(801, '_ACTIVE_COURSE', 'dashboard', ''),
(802, '_ACTIVE_SEVEN_COURSE', 'dashboard', ''),
(803, '_ADMIN_USER', 'dashboard', ''),
(804, '_CORE_VERSION', 'dashboard', ''),
(805, '_COURSES_PANEL', 'dashboard', ''),
(806, '_DASHBOARD', 'dashboard', ''),
(807, '_DEACTIVE_SEVEN_COURSE', 'dashboard', ''),
(808, '_FOLLOW_US', 'dashboard', ''),
(809, '_INACTIVE_USER', 'dashboard', ''),
(810, '_LAST_RELEASED', 'dashboard', ''),
(811, '_MONITOR_PRINT_CERTIFICATE_STATUS', 'dashboard', ''),
(812, '_NEW_RELEASE_AVAILABLE', 'dashboard', ''),
(813, '_ONLINE_USER', 'dashboard', ''),
(814, '_OPEN_IN_NEW_WINDOW', 'dashboard', ''),
(815, '_QUICK_LINKS', 'dashboard', ''),
(816, '_REG_LASTSEVENDAYS', 'dashboard', ''),
(817, '_REG_TODAY', 'dashboard', ''),
(818, '_REG_YESTERDAY', 'dashboard', ''),
(819, '_SUPERADMIN_USER', 'dashboard', ''),
(820, '_SUPPORT_SITE', 'dashboard', ''),
(821, '_SUSPENDED_USER', 'dashboard', ''),
(822, '_TITLE_URL_COMPANY', 'dashboard', ''),
(823, '_TITLE_URL_SUPPORTLMS', 'dashboard', ''),
(824, '_TOTAL_COURSE', 'dashboard', ''),
(825, '_TOTAL_SUBSCRIPTION', 'dashboard', ''),
(826, '_TOTAL_USER', 'dashboard', ''),
(827, '_UNKNOWN_RELEASE', 'dashboard', ''),
(828, '_URL_COMPANY', 'dashboard', ''),
(829, '_URL_SUPPORTLMS', 'dashboard', ''),
(830, '_USERS_PANEL', 'dashboard', ''),
(831, '_WAITING_SUBSCRIPTION', 'dashboard', ''),
(832, '_ALERT_SUBJECT', 'email', 'email'),
(833, '_ALERT_TEXT', 'email', 'email'),
(834, '_APPROVED_SUBSCRIBED_SUBJECT', 'email', 'email'),
(835, '_APPROVED_SUBSCRIBED_TEXT', 'email', 'email'),
(836, '_APPROVED_USER_TEXT', 'email', 'email'),
(837, '_DELETED_USER_SBJ', 'email', 'email'),
(838, '_DELETED_USER_TEXT', 'email', 'email'),
(839, '_DENY_SUBSCRIBED_SUBJECT', 'email', 'email'),
(840, '_DENY_SUBSCRIBED_TEXT', 'email', 'email'),
(841, '_MODIFIED_USER_SBJ', 'email', 'email'),
(842, '_MODIFIED_USER_TEXT', 'email', 'email'),
(843, '_MOD_USER_SUBSCRIPTION_SUBJECT', 'email', 'email'),
(844, '_MOD_USER_SUBSCRIPTION_TEXT', 'email', 'email'),
(845, '_NEW_FORUM', 'email', 'email'),
(846, '_NEW_FORUM_BODY', 'email', 'email'),
(847, '_NEW_MESSAGE_INSERT_IN_THREAD', 'email', 'email'),
(848, '_NEW_THREAD_INSERT_IN_FORUM', 'email', 'email'),
(849, '_NEW_USER_SUBSCRIBED_SUBJECT', 'email', 'email'),
(850, '_NEW_USER_SUBSCRIBED_TEXT', 'email', 'email'),
(851, '_NEW_USER_SUBS_WAITING_SUBJECT', 'email', 'email'),
(852, '_NEW_USER_SUBS_WAITING_TEXT', 'email', 'email'),
(853, '_NEW_USER_UNSUBS_WAITING_SUBJECT', 'email', ''),
(854, '_NEW_USER_UNSUBS_WAITING_SUBJECT_SMS', 'email', ''),
(855, '_NEW_USER_UNSUBS_WAITING_TEXT', 'email', ''),
(856, '_NEW_USER_UNSUBS_WAITING_TEXT_SMS', 'email', ''),
(857, '_PASSWORD_CHANGED', 'email', 'email'),
(858, '_REFUSED_USER_SBJ', 'email', 'email'),
(859, '_REFUSED_USER_TEXT', 'email', 'email'),
(860, '_REGISTERED_USER_SBJ', 'email', 'email'),
(861, '_REGISTERED_USER_TEXT', 'email', 'email'),
(862, '_SUBJECT_NOTIFY_MESSAGE', 'email', 'email'),
(863, '_SUBJECT_NOTIFY_THREAD', 'email', 'email'),
(864, '_TO_APPROVE_GROUP_USER_SBJ', 'email', 'email'),
(865, '_TO_APPROVE_GROUP_USER_TEXT', 'email', 'email'),
(866, '_TO_APPROVE_USER_SBJ', 'email', 'email'),
(867, '_TO_APPROVE_USER_TEXT', 'email', 'email'),
(868, '_TO_NEW_USER_SBJ', 'email', 'email'),
(869, '_TO_NEW_USER_TEXT', 'email', 'email'),
(870, '_USER_END_COURSE_SBJ', 'email', ''),
(871, '_USER_END_COURSE_TEXT', 'email', ''),
(872, '_USER_END_COURSE_TEXT_SMS', 'email', ''),
(873, '_WAITING_USER_SBJ', 'email', 'email'),
(874, '_WAITING_USER_TEXT', 'email', 'email'),
(875, '_YOU_RECIVE_MSG_SUBJECT', 'email', 'email'),
(876, '_YOU_RECIVE_MSG_TEXT', 'email', 'email'),
(877, '_YOU_RECIVE_MSG_TEXT_COURSE', 'email', ''),
(878, '_BASE', 'enrollrules', ''),
(879, '_SHOW_LOGS', 'enrollrules', ''),
(880, '_EVENT_CHANNEL_SMS', 'event_manager', ''),
(881, '_EVENT_CLASS_AdviceNew', 'event_manager', ''),
(882, '_EVENT_CLASS_CoursePorpModified', 'event_manager', ''),
(883, '_EVENT_CLASS_ForumNewCategory', 'event_manager', ''),
(884, '_EVENT_CLASS_ForumNewResponse', 'event_manager', ''),
(885, '_EVENT_CLASS_ForumNewThread', 'event_manager', ''),
(886, '_EVENT_CLASS_MsgNewReceived', 'event_manager', ''),
(887, '_EVENT_CLASS_UserApproved', 'event_manager', ''),
(888, '_EVENT_CLASS_UserCourseBuy', 'event_manager', ''),
(889, '_EVENT_CLASS_UserCourseEnded', 'event_manager', ''),
(890, '_EVENT_CLASS_UserCourseInserted', 'event_manager', ''),
(891, '_EVENT_CLASS_UserCourseInsertModerate', 'event_manager', ''),
(892, '_EVENT_CLASS_UserCourseLevelChanged', 'event_manager', ''),
(893, '_EVENT_CLASS_UserCourseRemoved', 'event_manager', ''),
(894, '_EVENT_CLASS_UserCourseRemovedModerate', 'event_manager', ''),
(895, '_EVENT_CLASS_UserDel', 'event_manager', ''),
(896, '_EVENT_CLASS_UserGroupInsert', 'event_manager', ''),
(897, '_EVENT_CLASS_UserGroupModerated', 'event_manager', ''),
(898, '_EVENT_CLASS_UserGroupRemove', 'event_manager', ''),
(899, '_EVENT_CLASS_UserMod', 'event_manager', ''),
(900, '_EVENT_CLASS_UserNew', 'event_manager', ''),
(901, '_EVENT_CLASS_UserNewModerated', 'event_manager', ''),
(902, '_EVENT_CLASS_UserNewWaiting', 'event_manager', ''),
(903, '_EVENT_MANAGER', 'event_manager', ''),
(904, '_EVENT_PERM_NOTUSED', 'event_manager', ''),
(905, '_EVENT_PLATFORM', 'event_manager', ''),
(906, '_EVENT_PLATFORM_framework', 'event_manager', ''),
(907, '_EVENT_PLATFORM_lms', 'event_manager', ''),
(908, '_EVENT_PLATFORM_lms-a', 'event_manager', ''),
(909, '_EVENT_RECIPIENTS_MODERATORS_GOD', 'event_manager', ''),
(910, '_EVENT_RECIPIENTS_TEACHER', 'event_manager', ''),
(911, '_EVENT_RECIPIENTS_TEACHER_GOD', 'event_manager', ''),
(912, '_EVENT_RECIPIENTS_USER', 'event_manager', ''),
(913, '_EVENT_SETTINGS', 'event_manager', ''),
(914, '_ADDFAQ', 'faq', ''),
(915, '_BACKTOTOP', 'faq', ''),
(916, '_KEYWORD', 'faq', ''),
(917, '_SECT_FAQ', 'faq', ''),
(918, '_SESLECTTERM', 'faq', ''),
(919, '_SUMMARY_FAQ', 'faq', ''),
(920, '_SWITCH_TO_FAQ', 'faq', ''),
(921, '_SWITCH_TO_HELP', 'faq', ''),
(922, '_TERM', 'faq', ''),
(923, '_ADD_NEW_FIELD', 'field', ''),
(924, '_ALL_FIELD_TYPE', 'field', ''),
(925, '_CODICEFISCALE', 'field', ''),
(926, '_COPY', 'field', ''),
(927, '_COUNTRY', 'field', ''),
(928, '_DROPDOWN', 'field', ''),
(929, '_DROPDOWN_ELEMENT', 'field', ''),
(930, '_DROPDOWN_NOVALUE', 'field', ''),
(931, '_DROPDOWN_SON_ADD', 'field', ''),
(932, '_DROPDOWN_SON_CAPTION', 'field', ''),
(933, '_DROPDOWN_SON_NEW', 'field', ''),
(934, '_FIELD_MANAGER', 'field', ''),
(935, '_FIELD_TYPE', 'field', ''),
(936, '_FILTER_NAME', 'field', ''),
(937, '_FREETEXT', 'field', ''),
(938, '_GMAIL', 'field', ''),
(939, '_ICQ', 'field', ''),
(940, '_LABEL_ALERT', 'field', ''),
(941, '_LABEL_ALERT_MESSAGE', 'field', ''),
(942, '_MSN', 'field', ''),
(943, '_NEW_DATEFIELD', 'field', ''),
(944, '_NEW_DROPDOWN', 'field', ''),
(945, '_NEW_FREETEXT', 'field', ''),
(946, '_NEW_ICQ', 'field', ''),
(947, '_NEW_MSN', 'field', ''),
(948, '_NEW_SKYPE', 'field', ''),
(949, '_NEW_TEXTFIELD', 'field', ''),
(950, '_NEW_UPLOAD', 'field', ''),
(951, '_NEW_YAHOO', 'field', ''),
(952, '_NEW_YESNO', 'field', ''),
(953, '_NOT_DO', 'field', ''),
(954, '_NO_FILE_UPLOADED', 'field', ''),
(955, '_SHOW_ON_PLATFORM', 'field', ''),
(956, '_SKYPE', 'field', ''),
(957, '_TEXTFIELD', 'field', ''),
(958, '_USE_MULTI_LANG_WHEN_AVAILABLE', 'field', ''),
(959, '_YAHOO', 'field', ''),
(960, '_YESNO', 'field', ''),
(961, '_GAP_ANALYSIS', 'fncroles', ''),
(962, '_GAP_ONLY', 'fncroles', ''),
(963, '_NO_GAP_ONLY', 'fncroles', ''),
(964, '_ADDFORUM', 'forum', ''),
(965, '_ADDTHREAD', 'forum', ''),
(966, '_ALL_THREAD_READ', 'forum', ''),
(967, '_AREYOUSURE_MOVE_THREAD', 'forum', ''),
(968, '_CANNOTENTER', 'forum', ''),
(969, '_CAPTION_FORUM_MESSAGE', 'forum', ''),
(970, '_CAPTION_FORUM_MESSAGE_ADD', 'forum', ''),
(971, '_CHOOSE_FORUM_ACCESS', 'forum', ''),
(972, '_DELETE', 'forum', ''),
(973, '_ELEFORUM', 'forum', ''),
(974, '_EMOTICONS', 'forum', ''),
(975, '_FORUMCLOSED', 'forum', ''),
(976, '_FORUMOPEN', 'forum', ''),
(977, '_FORUM_ACCESS', 'forum', ''),
(978, '_FORUM_INFORMATION', 'forum', ''),
(979, '_FREE', 'forum', ''),
(980, '_FREET', 'forum', ''),
(981, '_FREETHREAD', 'forum', ''),
(982, '_FROM_FORUM', 'forum', ''),
(983, '_IMPORTANT_THREAD', 'forum', ''),
(984, '_LASTPOST', 'forum', ''),
(985, '_LOCKED', 'forum', ''),
(986, '_LOCKEDMESS', 'forum', ''),
(987, '_LOCKFORUM', 'forum', ''),
(988, '_LOCKFORUMALT', 'forum', ''),
(989, '_LOCKTHREAD', 'forum', ''),
(990, '_MODIFY_BY', 'forum', ''),
(991, '_MOD_MESSAGE', 'forum', ''),
(992, '_MOVE_TO_FORUM', 'forum', ''),
(993, '_NEW_MESSAGE', 'forum', ''),
(994, '_NEW_THREAD', 'forum', ''),
(995, '_NOACCESS', 'forum', ''),
(996, '_NOTIFY', 'forum', ''),
(997, '_NOTIFY_CHANGE_STATUS_CORRECT', 'forum', ''),
(998, '_NOTIFY_ME_FORUM', 'forum', ''),
(999, '_NOTIFY_ME_FORUM_TITLE', 'forum', ''),
(1000, '_NOTIFY_ME_THREAD', 'forum', ''),
(1001, '_NOTIFY_ME_THREAD_TITLE', 'forum', ''),
(1002, '_NUMPOST', 'forum', ''),
(1003, '_NUMREPLY', 'forum', ''),
(1004, '_NUMTHREAD', 'forum', ''),
(1005, '_NUMVIEW', 'forum', ''),
(1006, '_QUOTE', 'forum', ''),
(1007, '_RESTOREINSERT', 'forum', ''),
(1008, '_SEARCH_LABEL', 'forum', ''),
(1009, '_SEARCH_RESULT_FOR', 'forum', ''),
(1010, '_SET_NOT_IMPORTANT_THREAD', 'forum', ''),
(1011, '_THRAD_SUMMARY', 'forum', ''),
(1012, '_THREAD', 'forum', ''),
(1013, '_THREAD_CAPTION', 'forum', ''),
(1014, '_TO_FORUM', 'forum', ''),
(1015, '_UNERASE', 'forum', ''),
(1016, '_UNLOCKFORUM', 'forum', ''),
(1017, '_UNLOCKFORUMALT', 'forum', ''),
(1018, '_UNNOTIFY', 'forum', ''),
(1019, '_UNNOTIFY_ME_FORUM', 'forum', ''),
(1020, '_UNNOTIFY_ME_FORUM_TITLE', 'forum', ''),
(1021, '_UNNOTIFY_ME_THREAD', 'forum', ''),
(1022, '_UNNOTIFY_ME_THREAD_TITLE', 'forum', ''),
(1023, '_USERFORUMPARAM', 'forum', ''),
(1024, '_USERPARAM', 'forum', ''),
(1025, '_VIEW_PROFILE', 'forum', ''),
(1026, '_WRITTED_BY', 'forum', ''),
(1027, '_ADDTERM', 'glossary', ''),
(1028, '_GLOSSARY', 'glossary', ''),
(1029, '_GLOSSARY_SUMMARY', 'glossary', ''),
(1030, '_TERM', 'glossary', ''),
(1031, '_TERMDESCR', 'glossary', ''),
(1032, '_TERMS', 'glossary', ''),
(1033, '_GRADEBOOK_AREATITLE', 'gradebook', ''),
(1034, '_GRADEBOOK_CAPTION', 'gradebook', 'accessibility'),
(1035, '_GRADEBOOK_SUMMARY', 'gradebook', 'accessibility'),
(1036, '_MAX_DIVISOR', 'gradebook', ''),
(1037, '_NOT_CHECKED', 'gradebook', ''),
(1038, '_NO_SCORE', 'gradebook', ''),
(1039, '_TEST_N', 'gradebook', ''),
(1040, '_ALT_SUBSCRIBE', 'groups', ''),
(1041, '_GROUP_CAPTION', 'groups', ''),
(1042, '_MANAGE_GROUP_SUBSCRIPTION', 'groups', ''),
(1043, '_SUBSCRIBE_USER', 'groups', ''),
(1044, '_REPOSELECTDESTINATION', 'homerepo', ''),
(1045, '_TARGETMOVEFOLDER', 'homerepo', ''),
(1046, '_AUTOREFRESH', 'htmlframechat', ''),
(1047, '_EMOTICONS', 'htmlframechat', ''),
(1048, '_MSGTXT', 'htmlframechat', ''),
(1049, '_REFRESH', 'htmlframechat', ''),
(1050, '_ROOMS_LIST', 'htmlframechat', ''),
(1051, '_USERS_LIST', 'htmlframechat', ''),
(1052, '_USER_HAS_QUIT', 'htmlframechat', ''),
(1053, '_USER_LOGGED_IN', 'htmlframechat', ''),
(1054, '_HTMLFRONT', 'htmlfront', ''),
(1055, '_ATTACH_TITLE', 'htmlpage', ''),
(1056, '_BACKTOTOP', 'htmlpage', ''),
(1057, '_SECT_PAGE', 'htmlpage', ''),
(1058, '_ACCESSTYPE', 'iotask', ''),
(1059, '_ADD_NEW_CONNECTION', 'iotask', ''),
(1060, '_ADD_NEW_CONNECTOR', 'iotask', ''),
(1061, '_ADD_NEW_TASK', 'iotask', ''),
(1062, '_BYEXAMPLE', 'iotask', ''),
(1063, '_CANCELED_COURSES', 'iotask', ''),
(1064, '_CANCELED_COURSEUSER', 'iotask', ''),
(1065, '_CANCELED_FOLDER', 'iotask', ''),
(1066, '_CANCELED_USERS', 'iotask', ''),
(1067, '_CLASS', 'iotask', ''),
(1068, '_CONFIRM_DELETION', 'iotask', ''),
(1069, '_CONNECTION', 'iotask', ''),
(1070, '_CONNECTIONS', 'iotask', ''),
(1071, '_CONNECTOR', 'iotask', ''),
(1072, '_CONNECTORS', 'iotask', ''),
(1073, '_CONNECTORS_TITLE', 'iotask', ''),
(1074, '_CONN_NAME_EXAMPLE', 'iotask', ''),
(1075, '_CONN_TITLE', 'iotask', ''),
(1076, '_DESTINATION', 'iotask', ''),
(1077, '_DONTDELETE', 'iotask', ''),
(1078, '_DONTSEND', 'iotask', ''),
(1079, '_FIELD_DEF', 'iotask', ''),
(1080, '_FIELD_DEFINITION_TYPE', 'iotask', ''),
(1081, '_FIELD_DELIMITER', 'iotask', ''),
(1082, '_FIELD_ENCLOSURE', 'iotask', ''),
(1083, '_FIELD_SUBPATTERN', 'iotask', ''),
(1084, '_FILEPATTERN', 'iotask', ''),
(1085, '_FILEPATTERN_EXAMPLE', 'iotask', ''),
(1086, '_FILE_ANALYZED', 'iotask', ''),
(1087, '_FINISH', 'iotask', ''),
(1088, '_FIRST_ROW_HEADER', 'iotask', ''),
(1089, '_GROUP_FILTER', 'iotask', ''),
(1090, '_HOUR', 'iotask', ''),
(1091, '_IMPORT_NOTHINGTOPROCESS', 'iotask', ''),
(1092, '_IMPORT_TYPE', 'iotask', ''),
(1093, '_IMPORT_TYPE_INSERTONLY', 'iotask', ''),
(1094, '_IMPORT_TYPE_INSERTREMOVE', 'iotask', ''),
(1095, '_LAST_EXECUTION', 'iotask', ''),
(1096, '_MAP_NOT_REQUIRED', 'iotask', ''),
(1097, '_NO_NEW_CONNECTORS', 'iotask', ''),
(1098, '_PREG_MATCH_FOLDER', 'iotask', ''),
(1099, '_READ', 'iotask', ''),
(1100, '_READWRITE', 'iotask', ''),
(1101, '_SCHEDULE_TYPE_AT', 'iotask', ''),
(1102, '_SCHEDULE_TYPE_AT_DATA', 'iotask', ''),
(1103, '_SCHEDULE_TYPE_INTERVAL', 'iotask', ''),
(1104, '_SCHEDULE_TYPE_INTERVAL_DATA', 'iotask', ''),
(1105, '_SENDNOTIFY', 'iotask', ''),
(1106, '_SOURCE', 'iotask', ''),
(1107, '_STANDARD_MENU', 'iotask', ''),
(1108, '_TASKS', 'iotask', ''),
(1109, '_TASK_DEL', 'iotask', ''),
(1110, '_TASK_INSERTED', 'iotask', ''),
(1111, '_TASK_NAME_EXAMPLE', 'iotask', ''),
(1112, '_TASK_RUN', 'iotask', ''),
(1113, '_TASK_RUNNED', 'iotask', ''),
(1114, '_TREE_INSERT', 'iotask', ''),
(1115, '_TREE_INSERT_FOLDER', 'iotask', ''),
(1116, '_WRITE', 'iotask', ''),
(1117, '_FILEUNSPECIFIED', 'item', ''),
(1118, '_FILE_MOD', 'item', ''),
(1119, '_MIME', 'item', ''),
(1120, '_SECTIONNAME_ITEM', 'item', ''),
(1121, '_CATEGORIZED_AND_UNCATEGORIZED', 'kb', ''),
(1122, '_CATEGORIZED_ONLY', 'kb', ''),
(1123, '_CATEGORIZE_OBJECT_ITEMS', 'kb', ''),
(1124, '_CONTAINED_IN', 'kb', ''),
(1125, '_IS_MOBILE', 'kb', ''),
(1126, '_RESOURCE_ORIGINAL_NAME', 'kb', ''),
(1127, '_SET_AS_NORMAL', 'kb', ''),
(1128, '_SET_VISIBLE_TO_EVERYONE', 'kb', ''),
(1129, '_UNCATEGORIZED_ONLY', 'kb', ''),
(1130, '_VISIBLE_BY_EVERYONE', 'kb', ''),
(1131, '_YOU_WILL_LOSE_PREVIOUS_CATEGORIZATION', 'kb', ''),
(1132, '_ALL_DESCRIPTION', 'label', ''),
(1133, '_LEVEL_1', 'levels', ''),
(1134, '_LEVEL_2', 'levels', ''),
(1135, '_LEVEL_3', 'levels', ''),
(1136, '_LEVEL_4', 'levels', ''),
(1137, '_LEVEL_5', 'levels', ''),
(1138, '_LEVEL_6', 'levels', ''),
(1139, '_LEVEL_7', 'levels', ''),
(1140, '_ADD_FILE', 'light_repo', ''),
(1141, '_CAPTION_USER_FILE_LIST', 'light_repo', ''),
(1142, '_FILE_COUNT', 'light_repo', ''),
(1143, '_NEW_REPOSITORY', 'light_repo', ''),
(1144, '_NO_REPOSITORY_FOUND', 'light_repo', ''),
(1145, '_REPO_NEW_FILE', 'light_repo', ''),
(1146, '_TITLE_LIGHT_REPO', 'light_repo', ''),
(1147, '_VIEW_USER_FILE_LIST', 'light_repo', ''),
(1148, '_ADDLINK', 'link', ''),
(1149, '_ADDLINKT', 'link', ''),
(1150, '_BACKTOTOP', 'link', ''),
(1151, '_KEYWORD', 'link', ''),
(1152, '_LINKIUNNEWWINDOW', 'link', ''),
(1153, '_LINK_ADDRESS', 'link', ''),
(1154, '_SECT_LINK', 'link', ''),
(1155, '_SESLECTTERM', 'link', ''),
(1156, '_SUMMARY_LINK', 'link', ''),
(1157, '_SWITCH_TO_KEYWORD', 'link', ''),
(1158, '_SWITCH_TO_LIST', 'link', ''),
(1159, '_TERM', 'link', ''),
(1160, '_ACCESS_LOCK', 'login', ''),
(1161, '_CANCELSOCIALLOGIN', 'login', ''),
(1162, '_EMPTYSOCIALID', 'login', ''),
(1163, '_HOMEPAGE', 'login', ''),
(1164, '_INTRO_STD_TEXT', 'login', ''),
(1165, '_JUMP_TO_LOGIN', 'login', ''),
(1166, '_LDAPACTIVE', 'login', ''),
(1167, '_LOGIN', 'login', ''),
(1168, '_LOGIN_ACCESSIBILITY', 'login', ''),
(1169, '_LOGIN_LEGEND', 'login', ''),
(1170, '_LOGIN_WITH', 'login', ''),
(1171, '_LOG_IN', 'login', ''),
(1172, '_LOG_LOSTPWD', 'login', ''),
(1173, '_LOST_INSTRUCTION_PWD', 'login', ''),
(1174, '_LOST_INSTRUCTION_USER', 'login', ''),
(1175, '_LOST_TITLE_USER', 'login', ''),
(1176, '_MAINTENANCE_TEXT', 'login', ''),
(1177, '_NOACCESS', 'login', ''),
(1178, '_PASSNOMATCH', 'login', ''),
(1179, '_REGISTER_FOR_COURSE', 'login', ''),
(1180, '_REGISTER_FOR_COURSE_NO_REG', 'login', '');
INSERT INTO `core_lang_text` (`id_text`, `text_key`, `text_module`, `text_attributes`) VALUES
(1181, '_REGISTER_WITH_FACEBOOK', 'login', ''),
(1182, '_REG_ELAPSEDREQUEST', 'login', ''),
(1183, '_REG_PRIVACY_POLICY', 'login', ''),
(1184, '_SESSION_EXPIRED', 'login', ''),
(1185, '_SIGN_IN', 'login', ''),
(1186, '_SOCIALCONNECTKO', 'login', ''),
(1187, '_SOCIALCONNECTOK', 'login', ''),
(1188, '_TWO_USERS_LOGGED_WITH_SAME_USERNAME', 'login', ''),
(1189, '_UNKNOWNSOCIALERROR', 'login', ''),
(1190, '_UNLOGGED', 'login', ''),
(1191, '_ADDCUSTOM', 'manmenu', ''),
(1192, '_CHECKALL', 'manmenu', ''),
(1193, '_DEFAULT_MY_NAME', 'manmenu', ''),
(1194, '_FROM_CUSTOM', 'manmenu', ''),
(1195, '_LEVELS', 'manmenu', ''),
(1196, '_MODMODULE', 'manmenu', ''),
(1197, '_MY_NAME', 'manmenu', ''),
(1198, '_ORDER', 'manmenu', ''),
(1199, '_SYMBOL', 'manmenu', ''),
(1200, '_SYMBOL_TITLE', 'manmenu', ''),
(1201, '_TB_CM_CAPTION', 'manmenu', ''),
(1202, '_TB_CM_SUMMARY', 'manmenu', ''),
(1203, '_TB_FREE_MANMODULE_CAPTION', 'manmenu', ''),
(1204, '_TB_MANMENU_CAPTION', 'manmenu', ''),
(1205, '_TB_MANMENU_SUMMARY', 'manmenu', ''),
(1206, '_TB_MANMODULE_CAPTION', 'manmenu', ''),
(1207, '_TB_MANMODULE_SUMMARY', 'manmenu', ''),
(1208, '_TITLE_ADDCUSTOM', 'manmenu', ''),
(1209, '_TITLE_GRABMODULE', 'manmenu', ''),
(1210, '_TITLE_MANMENU', 'manmenu', ''),
(1211, '_TITLE_MENUVOICE', 'manmenu', ''),
(1212, '_TITLE_MODULE', 'manmenu', ''),
(1213, '_UNCHECKALL', 'manmenu', ''),
(1214, '_YOURE_IMPORTING', 'manmenu', ''),
(1215, '_YOURE_WORKING_ON_MODULE', 'manmenu', ''),
(1216, '_ADMIN_CONFIGURATION', 'menu', ''),
(1217, '_ADMIN_MANAGER', 'menu', ''),
(1218, '_ADMIN_RULES', 'menu', ''),
(1219, '_ASSOCIATE_USER', 'menu', ''),
(1220, '_BLIND_MAIN_MENU', 'menu', ''),
(1221, '_BLIND_MENU_MODULES', 'menu', 'accessibility'),
(1222, '_CERTIFICATE', 'menu', ''),
(1223, '_COMMUNICATION_MAN', 'menu', ''),
(1224, '_CONFIGURATION', 'menu', ''),
(1225, '_DASHBOARD', 'menu', ''),
(1226, '_EVENTMANAGER', 'menu', ''),
(1227, '_EVENTS', 'menu', ''),
(1228, '_FIELD_MANAGER', 'menu', ''),
(1229, '_FIRST_LINE_framework', 'menu', ''),
(1230, '_FIRST_LINE_lms', 'menu', ''),
(1231, '_IOTASK', 'menu', ''),
(1232, '_JUMP_TO_PLATFORM', 'menu', ''),
(1233, '_LANG', 'menu', ''),
(1234, '_LISTUSER', 'menu', ''),
(1235, '_MANAGEMENT_COURSE', 'menu', ''),
(1236, '_MANAGEMENT_RESERVATION', 'menu', ''),
(1237, '_MAN_CERTIFICATE', 'menu', ''),
(1238, '_META_CERTIFICATE', 'menu', ''),
(1239, '_MIDDLE_AREA', 'menu', ''),
(1240, '_MODULE_NAME', 'menu', ''),
(1241, '_NEWS_INTERNAL', 'menu', ''),
(1242, '_PLAYERTEMPLATE', 'menu', ''),
(1243, '_PLUGIN_MANAGER', 'menu', ''),
(1244, '_PRIVACYPOLICIES', 'menu', ''),
(1245, '_PUBLIC_ADMIN_MANAGER', 'menu', ''),
(1246, '_PUBLIC_ADMIN_RULES', 'menu', ''),
(1247, '_QUESTCATEGORY', 'menu', ''),
(1248, '_QUEST_CATEGORY', 'menu', ''),
(1249, '_REPORT_CERTIFICATE', 'menu', ''),
(1250, '_RESERVATION', 'menu', ''),
(1251, '_SUBSCRIBE_USER_TO_COURSE', 'menu', ''),
(1252, '_TRASV_MANAGMENT', 'menu', ''),
(1253, '_USER_MANAGMENT', 'menu', ''),
(1254, '_WEBPAGES', 'menu', ''),
(1255, 'Collaborative Area', 'menu_course', ''),
(1256, 'Stat Area', 'menu_course', ''),
(1257, 'Student Area', 'menu_course', ''),
(1258, 'Teacher Area', 'menu_course', ''),
(1259, '_ADVICE', 'menu_course', ''),
(1260, '_COURSECHART', 'menu_course', ''),
(1261, '_COURSEREPORT', 'menu_course', ''),
(1262, '_COURSESTATS', 'menu_course', ''),
(1263, '_EPORTFOLIO', 'menu_course', ''),
(1264, '_GRADEBOOK', 'menu_course', ''),
(1265, '_GROUPS', 'menu_course', ''),
(1266, '_HTMLFRONT', 'menu_course', ''),
(1267, '_INFCOURSE', 'menu_course', ''),
(1268, '_LIGHT_REPO', 'menu_course', ''),
(1269, '_ORGANIZATION', 'menu_course', ''),
(1270, '_PROFILE', 'menu_course', ''),
(1271, '_PROJECT', 'menu_course', ''),
(1272, '_QUEST_BANK', 'menu_course', ''),
(1273, '_RESERVATION', 'menu_course', ''),
(1274, '_STAT', 'menu_course', ''),
(1275, '_STATCOURSE', 'menu_course', ''),
(1276, '_STATUSER', 'menu_course', ''),
(1277, '_STORAGE', 'menu_course', ''),
(1278, '_TELESKILL_ROOM', 'menu_course', ''),
(1279, '_WIKI', 'menu_course', ''),
(1280, '_AUTHORING', 'menu_over', ''),
(1281, '_BLIND_MENU_LAT', 'menu_over', 'accessibility'),
(1282, '_BLIND_YOUR_INFO', 'menu_over', 'accessibility'),
(1283, '_COMMUNITY', 'menu_over', ''),
(1284, '_COURSE_AUTOREGISTRATION', 'menu_over', ''),
(1285, '_GO_TO_FRAMEWORK', 'menu_over', ''),
(1286, '_LIBRARY', 'menu_over', ''),
(1287, '_MENUCOURSE', 'menu_over', ''),
(1288, '_MENUGEN', 'menu_over', ''),
(1289, '_MYCOMPETENCES', 'menu_over', ''),
(1290, '_MYCOURSES', 'menu_over', ''),
(1291, '_MY_AREA', 'menu_over', ''),
(1292, '_MY_CERTIFICATE', 'menu_over', ''),
(1293, '_PUBLIC_ADMIN_AREA', 'menu_over', ''),
(1294, '_PUBLIC_CERTIFICATE_ADMIN', 'menu_over', ''),
(1295, '_PUBLIC_COURSE_ADMIN', 'menu_over', ''),
(1296, '_PUBLIC_FORUM', 'menu_over', ''),
(1297, '_PUBLIC_NEWSLETTER_ADMIN', 'menu_over', ''),
(1298, '_PUBLIC_REPORT_ADMIN', 'menu_over', ''),
(1299, '_PUBLIC_SUBSCRIBE_ADMIN', 'menu_over', ''),
(1300, '_PUBLIC_USER_ADMIN', 'menu_over', ''),
(1301, '_SUPPORT_FORUM', 'menu_over', ''),
(1302, '_ATTACH_TITLE', 'message', ''),
(1303, '_FILTER_MESSAGE_FOR', 'message', ''),
(1304, '_HIGH', 'message', ''),
(1305, '_INBOX', 'message', ''),
(1306, '_LOW', 'message', ''),
(1307, '_MIME', 'message', ''),
(1308, '_MUST_INS_SUBJECT', 'message', ''),
(1309, '_NORMAL', 'message', ''),
(1310, '_OUTBOX', 'message', ''),
(1311, '_PRIORITY', 'message', ''),
(1312, '_REFRESH', 'message', ''),
(1313, '_TITLE_READ', 'message', ''),
(1314, '_VERYHIGH', 'message', ''),
(1315, '_VERYLOW', 'message', ''),
(1316, '_BLOCKS', 'middlearea', ''),
(1317, '_CHOOSE_WHO_CAN_SEE', 'middlearea', ''),
(1318, '_COMPLETE_USER_PROFILE', 'middlearea', ''),
(1319, '_ENABLE_AREA', 'middlearea', ''),
(1320, '_HOME', 'middlearea', ''),
(1321, '_MIDDLE_AREA', 'middlearea', ''),
(1322, '_SIMPLE_USER_PROFILE', 'middlearea', ''),
(1323, '_ADD_NOTES', 'notes', ''),
(1324, '_MORET', 'notes', ''),
(1325, '_NOTES', 'notes', ''),
(1326, '_ALT_BRANCH_INTER', 'organization', ''),
(1327, '_ALT_EMPTY', 'organization', ''),
(1328, '_ALT_VERT_INTER', 'organization', ''),
(1329, '_ATTEMPT', 'organization', ''),
(1330, '_ATTEMPTS', 'organization', ''),
(1331, '_AUTOPLAY', 'organization', ''),
(1332, '_CONFIRM_EXIT', 'organization', ''),
(1333, '_HIDETREE', 'organization', ''),
(1334, '_LOCKED', 'organization', ''),
(1335, '_OBJECTIVE', 'organization', ''),
(1336, '_ORGANIZATION', 'organization', ''),
(1337, '_ORGISTERMINATOR', 'organization', ''),
(1338, '_ORGLOCKEDTITLE', 'organization', ''),
(1339, '_ORGMILESTONE', 'organization', ''),
(1340, '_ORGMILESTONE_END', 'organization', ''),
(1341, '_ORGMILESTONE_START', 'organization', ''),
(1342, '_ORGPLAYTITLE', 'organization', ''),
(1343, '_ORGROOTNAME', 'organization', ''),
(1344, '_ORG_ACCESS', 'organization', ''),
(1345, '_PUBLISH_FROM', 'organization', ''),
(1346, '_PUBLISH_TO', 'organization', ''),
(1347, '_REPOSELECTDESTINATION', 'organization', ''),
(1348, '_RESOURCE', 'organization', ''),
(1349, '_SHOW_INTERACTIONS', 'organization', ''),
(1350, '_TIME', 'organization', ''),
(1351, '_VIEWTREE', 'organization', ''),
(1352, '_ASSIGNED_EXTRAFIELD', 'organization_chart', ''),
(1353, '_GROUPUSER_groupid', 'organization_chart', ''),
(1354, '_IMPORT_IGNORE', 'organization_chart', ''),
(1355, '_IMPORT_MAP', 'organization_chart', ''),
(1356, '_INSERTED_WAIT_FOR_ADMIN', 'organization_chart', ''),
(1357, '_ORGCHART_FOLDER_FIELD_ALT', 'organization_chart', ''),
(1358, '_ORGCHART_USER_FIELD', 'organization_chart', ''),
(1359, '_ORG_CHART', 'organization_chart', ''),
(1360, '_ORG_CHART_FIELD_DESCEND', 'organization_chart', ''),
(1361, '_ORG_CHART_FIELD_INHERIT', 'organization_chart', ''),
(1362, '_ORG_CHART_FIELD_WRITE', 'organization_chart', ''),
(1363, '_ORG_CHART_FIELD_WRITE_ABBR', 'organization_chart', ''),
(1364, '_ORG_CHART_IMPORT_CHARSET', 'organization_chart', ''),
(1365, '_ORG_CHART_IMPORT_FILE', 'organization_chart', ''),
(1366, '_ORG_CHART_IMPORT_HEADER', 'organization_chart', ''),
(1367, '_ORG_CHART_IMPORT_SEPARATOR', 'organization_chart', ''),
(1368, '_ORG_CHART_IMPORT_USERS', 'organization_chart', ''),
(1369, '_ORG_CHART_INHERIT', 'organization_chart', ''),
(1370, '_ORG_CHART_LIST_FIELDS', 'organization_chart', ''),
(1371, '_ROOT_RENAME', 'organization_chart', ''),
(1372, '_SHOW_SUSPENDED', 'organization_chart', ''),
(1373, '_USERID_DUPLICATE', 'organization_chart', ''),
(1374, '_ASSOCIATEUSERTOGROUP', 'permission', ''),
(1375, '_DELUSER_ORG_CHART', 'permission', ''),
(1376, '_HOME', 'permission', ''),
(1377, '_LESSON', 'permission', ''),
(1378, '_PUBLIC', 'permission', ''),
(1379, '_SEND_ALL', 'permission', ''),
(1380, '_SEND_UPPER', 'permission', ''),
(1381, '_UPPLOAD', 'permission', ''),
(1382, '_LMS', 'platform', ''),
(1383, '_ANSWER_NUMBER', 'poll', ''),
(1384, '_ANSWER_TEXT', 'poll', ''),
(1385, '_CAPTION_ANSWER', 'poll', ''),
(1386, '_INSERT_POLL', 'poll', ''),
(1387, '_NO_QUESTION_IN_POLL', 'poll', ''),
(1388, '_POLL_ADDQUEST', 'poll', ''),
(1389, '_POLL_ADD_FORM', 'poll', ''),
(1390, '_POLL_ADD_ONE_ANSWER', 'poll', ''),
(1391, '_POLL_AFTER_QUEST', 'poll', ''),
(1392, '_POLL_ALREDY_VOTED', 'poll', ''),
(1393, '_POLL_ANSWER_SUMMARY', 'poll', 'accessibility'),
(1394, '_POLL_BEGIN', 'poll', ''),
(1395, '_POLL_CAPTION', 'poll', ''),
(1396, '_POLL_COMPLETED', 'poll', ''),
(1397, '_POLL_END_BACKTOLESSON', 'poll', ''),
(1398, '_POLL_END_PAGE', 'poll', ''),
(1399, '_POLL_FIRST_QUEST', 'poll', ''),
(1400, '_POLL_LABEL_AFTER_QUEST', 'poll', ''),
(1401, '_POLL_LAST_QUEST', 'poll', ''),
(1402, '_POLL_PREV_PAGE', 'poll', ''),
(1403, '_POLL_QUEST_ORDER', 'poll', ''),
(1404, '_POLL_QUEST_TITLE', 'poll', ''),
(1405, '_POLL_REMPOLL', 'poll', ''),
(1406, '_POLL_SECTION', 'poll', ''),
(1407, '_POLL_SUB_ONE_ANSWER', 'poll', ''),
(1408, '_POLL_SUMMARY', 'poll', 'accessibility'),
(1409, '_QUEST', 'poll', ''),
(1410, '_QUEST_ACRN_BREAK_PAGE', 'poll', ''),
(1411, '_QUEST_ACRN_CHOICE', 'poll', ''),
(1412, '_QUEST_ACRN_CHOICE_MULTIPLE', 'poll', ''),
(1413, '_QUEST_ACRN_COURSE_VALUTATION', 'poll', ''),
(1414, '_QUEST_ACRN_DOC_VALUTATION', 'poll', ''),
(1415, '_QUEST_ACRN_EXTENDED_TEXT', 'poll', ''),
(1416, '_QUEST_ACRN_TITLE', 'poll', ''),
(1417, '_QUEST_ANSWER', 'poll', ''),
(1418, '_QUEST_BREAK_PAGE', 'poll', ''),
(1419, '_QUEST_CHOICE', 'poll', ''),
(1420, '_QUEST_CHOICE_MULTIPLE', 'poll', ''),
(1421, '_QUEST_CHOICE_MULTIPLE_NOTE', 'poll', ''),
(1422, '_QUEST_CHOICE_NOTE', 'poll', ''),
(1423, '_QUEST_COURSE_VALUTATION', 'poll', ''),
(1424, '_QUEST_DOC_VALUTATION', 'poll', ''),
(1425, '_QUEST_EXTENDED_TEXT', 'poll', ''),
(1426, '_QUEST_TITLE', 'poll', ''),
(1427, '_QUEST_TITLE_NOTE', 'poll', ''),
(1428, '_SUMMARY_ANSWER', 'poll', ''),
(1429, '_TEST_SECTION', 'poll', ''),
(1430, '_ADD_ASSESSMENT', 'preassessment', ''),
(1431, '_ADD_EFFECT', 'preassessment', ''),
(1432, '_ADD_RULE', 'preassessment', ''),
(1433, '_ALT_ADD_EFFECT', 'preassessment', ''),
(1434, '_ASSIGN_ADMIN', 'preassessment', ''),
(1435, '_ASSIGN_ADMIN_TITLE', 'preassessment', ''),
(1436, '_ASSIGN_COURSE', 'preassessment', ''),
(1437, '_ASSIGN_COURSE_TITLE', 'preassessment', ''),
(1438, '_CAPTION_PREASSESSMENT', 'preassessment', ''),
(1439, '_CAPTION_PREASSESSMENT_RULE', 'preassessment', ''),
(1440, '_DO_NOTHING', 'preassessment', ''),
(1441, '_RULES', 'preassessment', ''),
(1442, '_RULE_ACTION', 'preassessment', ''),
(1443, '_RULE_DEFAULT', 'preassessment', ''),
(1444, '_RULE_OVERLAPPED', 'preassessment', ''),
(1445, '_RULE_TEXT', 'preassessment', ''),
(1446, '_SUMMARY_PREASSESSMENT_RULE', 'preassessment', ''),
(1447, '_TEMPLATE', 'preferences', ''),
(1448, '_PRIVACYPOLICIES', 'privacypolicies', ''),
(1449, '_ACCESS_COUNT', 'profile', ''),
(1450, '_ACCESS_TIME', 'profile', ''),
(1451, '_ACTIVITY_OF', 'profile', ''),
(1452, '_AVATAR_PHOTO_INSTRUCTION', 'profile', ''),
(1453, '_CAREER', 'profile', ''),
(1454, '_CERT_RELESABLE', 'profile', ''),
(1455, '_CHANGEPASSWORD', 'profile', ''),
(1456, '_CHANGEPOLICY', 'profile', ''),
(1457, '_COMMUNITY', 'profile', ''),
(1458, '_COMPETENCE_NAME', 'profile', ''),
(1459, '_COMPETENCE_SCORE_GOT', 'profile', ''),
(1460, '_CONTACTS', 'profile', ''),
(1461, '_COURSE_AS', 'profile', ''),
(1462, '_COURSE_AS_MENTOR', 'profile', ''),
(1463, '_COURSE_AS_TEACHER', 'profile', ''),
(1464, '_COURSE_AS_TUTOR', 'profile', ''),
(1465, '_COURSE_END', 'profile', ''),
(1466, '_COURSE_EXPIRING', 'profile', ''),
(1467, '_DELETED_USER_LIST', 'profile', ''),
(1468, '_DELETION_DATE', 'profile', ''),
(1469, '_FIELD_VALUE', 'profile', ''),
(1470, '_FIRSTNAME_DELETER', 'profile', ''),
(1471, '_FIRST_ACCESS', 'profile', ''),
(1472, '_FORUM_MESSAGE', 'profile', ''),
(1473, '_GOTO_BLOG', 'profile', ''),
(1474, '_GOTO_BLOG_TITLE', 'profile', ''),
(1475, '_GO_TO_PROFILE', 'profile', ''),
(1476, '_IDST_DELETED_USER', 'profile', ''),
(1477, '_LASTNAME_DELETER', 'profile', ''),
(1478, '_LAST_PROFILE_VIEW', 'profile', ''),
(1479, '_MESSAGE_TEXT', 'profile', ''),
(1480, '_NEWPWDVALID', 'profile', ''),
(1481, '_NEW_VISIT', 'profile', ''),
(1482, '_NOAVATAR', 'profile', ''),
(1483, '_NO_AUDIO_FOUND', 'profile', ''),
(1484, '_NO_IMAGE_FOUND', 'profile', ''),
(1485, '_NO_OTHER_FOUND', 'profile', ''),
(1486, '_NO_PROFILE_VIEW', 'profile', ''),
(1487, '_NO_VIDEO_FOUND', 'profile', ''),
(1488, '_OLDPASSWRONG', 'profile', ''),
(1489, '_OLD_PWD', 'profile', ''),
(1490, '_OTHER_POLICY', 'profile', ''),
(1491, '_PFL_POLICY_NOONE', 'profile', ''),
(1492, '_PFL_POLICY_TEACHER', 'profile', ''),
(1493, '_POLICY_ASSIGNED', 'profile', ''),
(1494, '_PRIVATE_MESSAGE_FROM', 'profile', ''),
(1495, '_PROFILE', 'profile', ''),
(1496, '_REGISTER_DATE', 'profile', ''),
(1497, '_REG_PASS_MUST_DIFF', 'profile', ''),
(1498, '_SCORE_FINAL', 'profile', ''),
(1499, '_SCORE_INIT', 'profile', ''),
(1500, '_SHARED_FILE', 'profile', ''),
(1501, '_SHOWME_ONLINE', 'profile', ''),
(1502, '_TEACHER_CURRICULUM', 'profile', ''),
(1503, '_TEACHER_PROFILE', 'profile', ''),
(1504, '_TEACHER_PUBLICATIONS', 'profile', ''),
(1505, '_TITLE_CHANGE', 'profile', ''),
(1506, '_TOTAL_COURSE', 'profile', ''),
(1507, '_UNLIMITED_QUOTA', 'profile', ''),
(1508, '_UP_OFFLINE', 'profile', ''),
(1509, '_USERCOMPETENCES_CAPTION', 'profile', ''),
(1510, '_USERCOURSE_CAPTION', 'profile', ''),
(1511, '_USERCOURSE_STATS_SUMMARY', 'profile', ''),
(1512, '_USERCOURSE_STATS_TITLE', 'profile', ''),
(1513, '_USERCOURSE_STATUS', 'profile', ''),
(1514, '_USERFORUMPARAM', 'profile', ''),
(1515, '_USERID_DELETER', 'profile', ''),
(1516, '_USEROFFLINE', 'profile', ''),
(1517, '_USERONLINE', 'profile', ''),
(1518, '_USERPARAM', 'profile', ''),
(1519, '_USERPROFILE_SUMMARY', 'profile', 'accessibility'),
(1520, '_USER_AUDIO', 'profile', ''),
(1521, '_USER_OTHER', 'profile', ''),
(1522, '_USER_QUOTA', 'profile', ''),
(1523, '_USER_STATUS', 'profile', ''),
(1524, '_USER_VIDEO', 'profile', ''),
(1525, '_USER_VIDEOS', 'profile', ''),
(1526, '_WELCOME', 'profile', ''),
(1527, '_WRITE_ASK_A_FRIEND', 'profile', ''),
(1528, '_MODPROJECTADMIN', 'project', ''),
(1529, '_MYPRJ', 'project', ''),
(1530, '_NEW_PROJECT', 'project', ''),
(1531, '_NOTHINGTOSEE', 'project', ''),
(1532, '_PADMINS', 'project', ''),
(1533, '_PGROUP', 'project', ''),
(1534, '_POPTIONS', 'project', ''),
(1535, '_PRJFILES', 'project', ''),
(1536, '_PRJNOTITLE', 'project', ''),
(1537, '_PRJNOVALIDGROUP', 'project', ''),
(1538, '_PRJPROGTOT', 'project', ''),
(1539, '_PRJTASKS', 'project', ''),
(1540, '_PRJTODO', 'project', ''),
(1541, '_PROJECT_MANAGER', 'project', ''),
(1542, '_PROJECT_SUMMARY', 'project', ''),
(1543, '_PSFILES', 'project', ''),
(1544, '_PSMSG', 'project', ''),
(1545, '_PSNEWS', 'project', ''),
(1546, '_PSTASKS', 'project', ''),
(1547, '_PSTODO', 'project', ''),
(1548, '_PTITLE', 'project', ''),
(1549, '_TASKDESC', 'project', ''),
(1550, '_TASKNAME', 'project', ''),
(1551, '_TASKPROGRESS', 'project', ''),
(1552, '_YOUONLY', 'project', ''),
(1553, '_ACTION', 'public_admin_manager', ''),
(1554, '_ADMIN_SPECIAL_SETTING', 'public_admin_manager', ''),
(1555, '_CATEGORY_IN_USE', 'questcategory', ''),
(1556, '_TITLE_QCAT', 'questcategory', ''),
(1557, '_ACCEPT', 'register', ''),
(1558, '_CHANGELANG', 'register', ''),
(1559, '_CHOOSE_NEW_PASSWORD', 'register', ''),
(1560, '_ERR_DUPLICATE_MAIL', 'register', ''),
(1561, '_ERR_DUPLICATE_USER', 'register', ''),
(1562, '_ERR_INVALID_MAIL', 'register', ''),
(1563, '_ERR_INVALID_USER', 'register', ''),
(1564, '_ERR_PASSWORD_MUSTBE_ALPHA', 'register', ''),
(1565, '_ERR_PASSWORD_NO_MATCH', 'register', ''),
(1566, '_ERR_POLICY_NOT_CHECKED', 'register', ''),
(1567, '_ERR_PWD_OLD', 'register', ''),
(1568, '_FIRST_ACCESS', 'register', ''),
(1569, '_FORCE_CHANGE', 'register', ''),
(1570, '_GOTO_LOGIN', 'register', ''),
(1571, '_GROUPS_FIELDS', 'register', ''),
(1572, '_IMGSECTION', 'register', ''),
(1573, '_INEXISTENT_USER', 'register', ''),
(1574, '_INVALID_CODE', 'register', ''),
(1575, '_INVALID_RANDOM_CODE', 'register', ''),
(1576, '_LOGIN', 'register', ''),
(1577, '_LOST_INSTRUCTION_PWD', 'register', ''),
(1578, '_LOST_INSTRUCTION_USER', 'register', ''),
(1579, '_LOST_PWD_MAILTEXT', 'register', ''),
(1580, '_LOST_PWD_TITLE', 'register', ''),
(1581, '_LOST_TITLE_PWD', 'register', ''),
(1582, '_LOST_TITLE_USER', 'register', ''),
(1583, '_LOST_USERID_MAILTEXT', 'register', ''),
(1584, '_LOST_USERID_TITLE', 'register', ''),
(1585, '_MAIL_OBJECT', 'register', ''),
(1586, '_MAIL_OBJECT_SELF', 'register', ''),
(1587, '_MAIL_SEND_SUCCESSFUL', 'register', ''),
(1588, '_MAIL_SEND_SUCCESSFUL_PWD', 'register', ''),
(1589, '_NEWPWDVALID', 'register', ''),
(1590, '_NEW_PASSWORD', 'register', ''),
(1591, '_NOTE', 'register', ''),
(1592, '_OLD_PWD', 'register', ''),
(1593, '_PASSWORD_TOO_SHORT', 'register', ''),
(1594, '_REG_CONFIRM_FAILED', 'register', ''),
(1595, '_REG_ELAPSEDREQUEST', 'register', ''),
(1596, '_REG_HOUR_REQUEST_LIMIT', 'register', ''),
(1597, '_REG_MAIL_TEXT', 'register', ''),
(1598, '_REG_MAIL_TEXT_SELF', 'register', ''),
(1599, '_REG_MANDATORY', 'register', ''),
(1600, '_REG_NOTE', 'register', ''),
(1601, '_REG_NOT_ACTIVE', 'register', ''),
(1602, '_REG_PASS_MIN_CHAR', 'register', ''),
(1603, '_REG_PASS_MUST_BE_ALPNUM', 'register', ''),
(1604, '_REG_PASS_MUST_DIFF', 'register', ''),
(1605, '_REG_PRESONAL_CODE', 'register', ''),
(1606, '_REG_PRIVACY_ACCEPT', 'register', ''),
(1607, '_REG_PRIVACY_POLICY', 'register', ''),
(1608, '_REG_PRIVACY_POLICY_TILTE', 'register', ''),
(1609, '_REG_REMEMBER_PRIVACY', 'register', ''),
(1610, '_REG_SUCCESS', 'register', ''),
(1611, '_REG_SUCCESS_SELF', 'register', ''),
(1612, '_REG_USERID_DEF', 'register', ''),
(1613, '_REG_WAIT_FOR_ADMIN_OK', 'register', ''),
(1614, '_REG_YOUR_ABI_TO_ACCESS', 'register', ''),
(1615, '_RETYPE_PASSWORD', 'register', ''),
(1616, '_SELECT_GROUP', 'register', ''),
(1617, '_SELECT_GROUP_SUMMARY', 'register', ''),
(1618, '_SOME_MANDATORY_EMPTY', 'register', ''),
(1619, '_WHYCHANGEPWD', 'register', ''),
(1620, 'aggregate_report', 'report', ''),
(1621, 'courses_report', 'report', ''),
(1622, 'ORG_CHART_SUBDIVISION', 'report', ''),
(1623, 'REPORT_SHOW_RESULTS', 'report', ''),
(1624, 'user_report', 'report', ''),
(1625, '_AGGREGATE_ON', 'report', ''),
(1626, '_BACK_TO_LIST', 'report', ''),
(1627, '_CHOOSE_TIME', 'report', ''),
(1628, '_CHOOSE_USER_FOR_REPORT', 'report', ''),
(1629, '_COMPETENCESFILTER_TITLE', 'report', ''),
(1630, '_COMPETENCESFILTER_TITLE_DESC', 'report', ''),
(1631, '_COMPETENCES_DROPDOWN_NULL_SELECT', 'report', ''),
(1632, '_COURSES_DROPDOWN_NULL_SELECT', 'report', ''),
(1633, '_COURSES_FILTER_END_DATE', 'report', ''),
(1634, '_COURSES_FILTER_INSCRIPTION_DATE', 'report', ''),
(1635, '_COURSES_FILTER_SCORE_COURSE', 'report', ''),
(1636, '_COURSES_FILTER_SCORE_INIT', 'report', ''),
(1637, '_COURSES_FILTER_SESSION_NUMBER', 'report', ''),
(1638, '_COURSES_SELECTION_TITLE', 'report', ''),
(1639, '_COURSE_COMPLETED', 'report', ''),
(1640, '_COURSE_FIELDS', 'report', ''),
(1641, '_COURSE_FIELDS_INFO', 'report', ''),
(1642, '_COURSE_STARTED', 'report', ''),
(1643, '_CREATION_DATE', 'report', ''),
(1644, '_CURRENT_SELECTION', 'report', ''),
(1645, '_CUSTOM_BELT', 'report', ''),
(1646, '_DATE_COURSE_COMPLETED', 'report', ''),
(1647, '_DATE_INSCR', 'report', ''),
(1648, '_DATE_UNTIL_COURSE_END', 'report', ''),
(1649, '_DAY_FROM_SUBSCRIPTION', 'report', ''),
(1650, '_DAY_UNTIL_COURSE_END', 'report', ''),
(1651, '_FILTER_ALL_CONDS', 'report', ''),
(1652, '_FILTER_ONE_COND', 'report', ''),
(1653, '_FILTER_RESET', 'report', ''),
(1654, '_INSCR', 'report', ''),
(1655, '_LAST_MONTH', 'report', ''),
(1656, '_LAST_SIX_MONTH', 'report', ''),
(1657, '_LAST_THREE_MONTH', 'report', ''),
(1658, '_LAST_WEEK', 'report', ''),
(1659, '_LAST_YEAR', 'report', ''),
(1660, '_LO_COL_FIRSTATT', 'report', ''),
(1661, '_LO_COL_LASTATT', 'report', ''),
(1662, '_LO_COL_MILESTONE', 'report', ''),
(1663, '_LO_COL_TYPE', 'report', ''),
(1664, '_MAIL_BODY', 'report', ''),
(1665, '_MUSTBEGIN', 'report', ''),
(1666, '_NOACTIVE', 'report', ''),
(1667, '_NO_USER_FOUND', 'report', ''),
(1668, '_NULL_COURSE_SELECTION', 'report', ''),
(1669, '_NULL_REPORT_RESULT', 'report', ''),
(1670, '_NULL_SELECTION', 'report', ''),
(1671, '_NUM', 'report', ''),
(1672, '_PERC', 'report', ''),
(1673, '_RA_CAT_COURSECATS', 'report', ''),
(1674, '_RA_CAT_TIME', 'report', ''),
(1675, '_RCS_CAT_COURSE_VAL', 'report', ''),
(1676, '_RCS_CAT_DOC_VAL', 'report', ''),
(1677, '_RCS_CAT_USER', 'report', ''),
(1678, '_RC_CAPTION', 'report', ''),
(1679, '_REPORT_COLUMNS', 'report', ''),
(1680, '_REPORT_COURSE_CONDITIONS', 'report', ''),
(1681, '_REPORT_COURSE_SELECTION', 'report', ''),
(1682, '_REPORT_DAILY', 'report', ''),
(1683, '_REPORT_FOR_ALL', 'report', ''),
(1684, '_REPORT_MOD_COLUMNS', 'report', ''),
(1685, '_REPORT_MOD_ROWS', 'report', ''),
(1686, '_REPORT_MONTHLY', 'report', ''),
(1687, '_REPORT_SEL_COLUMNS', 'report', ''),
(1688, '_REPORT_SEL_ROWS', 'report', ''),
(1689, '_REPORT_USER_TITLE_TIMEBELT', 'report', ''),
(1690, '_REPORT_USER_TITLE_TIMEBELT_DESC', 'report', ''),
(1691, '_REPORT_WEEKLY', 'report', ''),
(1692, '_RG_SUMMAMRY_MANAGMENT', 'report', ''),
(1693, '_RU_CAPTION', 'report', ''),
(1694, '_RU_CAT_COMMUNICATIONS', 'report', ''),
(1695, '_RU_CAT_COMPETENCES', 'report', ''),
(1696, '_RU_CAT_COURSES', 'report', ''),
(1697, '_RU_CAT_DELAY', 'report', ''),
(1698, '_RU_CAT_GAMES', 'report', ''),
(1699, '_RU_CAT_LO', 'report', ''),
(1700, '_RU_LO_MILESTONES', 'report', ''),
(1701, '_RU_LO_TYPES', 'report', ''),
(1702, '_SAVE_AND_BACK_TO_LIST', 'report', ''),
(1703, '_SAVE_BACK', 'report', ''),
(1704, '_SAVE_SCHED_NAME', 'report', ''),
(1705, '_SAVE_SHOW', 'report', ''),
(1706, '_SCHED_TEXT_WEEK', 'report', ''),
(1707, '_SELECT_LO_OPTIONS', 'report', ''),
(1708, '_SELECT_REPORT_CATEGORY', 'report', ''),
(1709, '_SELECT_THE_DATA_COL_NEEDED', 'report', ''),
(1710, '_SEL_COURSES', 'report', ''),
(1711, '_SEND_MAIL', 'report', ''),
(1712, '_SHOWED_COLUMNS', 'report', ''),
(1713, '_SHOW_NOSAVE', 'report', ''),
(1714, '_STATS_FIELDS_INFO', 'report', ''),
(1715, '_TAB_REP_CREATOR', 'report', ''),
(1716, '_TAB_REP_PUBLIC', 'report', ''),
(1717, '_TH_COURSEPATH', 'report', ''),
(1718, '_TH_ESTIMATED_TIME', 'report', ''),
(1719, '_TH_USER_COURSE_SCORE', 'report', ''),
(1720, '_TH_USER_INSCRIPTION_DATE', 'report', ''),
(1721, '_TH_USER_NUMBER_SESSION', 'report', ''),
(1722, '_TH_USER_START_SCORE', 'report', ''),
(1723, '_TIME_BELT', 'report', ''),
(1724, '_TIME_BELT_2', 'report', ''),
(1725, '_TIME_PERIOD_FILTER', 'report', ''),
(1726, '_TOTAL_SESSION', 'report', ''),
(1727, '_USER_CUSTOM_FIELDS', 'report', ''),
(1728, '_ADD_USER', 'reservation', ''),
(1729, '_ALT_ADD_USER', 'reservation', ''),
(1730, '_AREYOUSURE_ADD_SUBSCRIPTION', 'reservation', ''),
(1731, '_AREYOUSURE_DEL_SUBSCRIPTION', 'reservation', ''),
(1732, '_AVAILABLE_PLACES', 'reservation', ''),
(1733, '_BODY_DELSUBSCRIPTION', 'reservation', ''),
(1734, '_CANCEL_REGISTRATION', 'reservation', ''),
(1735, '_CATEGORY_CAPTION', 'reservation', ''),
(1736, '_CATEGORY_GESTION', 'reservation', ''),
(1737, '_CATEGORY_MAX_SUBSCRIPTION', 'reservation', ''),
(1738, '_CHOOSE_SUBSCRIBE', 'reservation', ''),
(1739, '_CONFIRM_DATA', 'reservation', ''),
(1740, '_DEADLINE', 'reservation', ''),
(1741, '_DEL_EVENT_REGISTRATION', 'reservation', ''),
(1742, '_DEL_SUBSCRIPTION_TITLE', 'reservation', ''),
(1743, '_EVENT_CAPTION', 'reservation', ''),
(1744, '_FROM_TIME', 'reservation', ''),
(1745, '_LOCATION_GESTION', 'reservation', ''),
(1746, '_MAX_SUBSCRIPTION_FOR_CATEGORY', 'reservation', ''),
(1747, '_MAX_USER', 'reservation', ''),
(1748, '_NO_RESERVATION_FOUND', 'reservation', ''),
(1749, '_NO_USERS_FOUND', 'reservation', ''),
(1750, '_NUMBER_SUBSCRIBED', 'reservation', ''),
(1751, '_REGISTRATION', 'reservation', ''),
(1752, '_RESERVATION', 'reservation', ''),
(1753, '_RESERVATION_CAPTION', 'reservation', ''),
(1754, '_RESERVATION_EVENTS', 'reservation', ''),
(1755, '_RESERVATION_MAIL_SEND', 'reservation', ''),
(1756, '_RESERVATION_MY_EVENTS', 'reservation', ''),
(1757, '_RESERVATION_PAST_EVENTS', 'reservation', ''),
(1758, '_RESERVATION_PROFILE_MODIFY', 'reservation', ''),
(1759, '_RESERVATION_SUBSCRIBED_USER', 'reservation', ''),
(1760, '_RESERVATION_SUMMARY', 'reservation', ''),
(1761, '_ROOM_FULL', 'reservation', ''),
(1762, '_SAVE', 'reservation', ''),
(1763, '_SET_ROOM_VIEW_PERM', 'reservation', ''),
(1764, '_SUBJECT_DELSUBSCRIPTION', 'reservation', ''),
(1765, '_SUBSCRIBE_EVENT', 'reservation', ''),
(1766, '_SWITCH_REGISTRATION', 'reservation', ''),
(1767, '_TO_TIME', 'reservation', ''),
(1768, '_UNDEFINITED', 'reservation', ''),
(1769, '_UNLIMITED_SUBSCRIPTION', 'reservation', ''),
(1770, '_VIEW_EVENT_USER', 'reservation', ''),
(1771, '_VIEW_USER_SUBSCRIBED', 'reservation', ''),
(1772, '_WRONG_DATE', 'reservation', ''),
(1773, '_WRONG_TIME', 'reservation', ''),
(1774, '_BACK_TOLIST', 'scorm', ''),
(1775, '_CONTENTPACKAGE', 'scorm', ''),
(1776, '_FILEUNSPECIFIED', 'scorm', ''),
(1777, '_SCORMIMGSECTION', 'scorm', ''),
(1778, '_SCORMIMPORTRESOURCES', 'scorm', ''),
(1779, '_SCORMLOAD', 'scorm', ''),
(1780, '_SCORMSECTIONNAME', 'scorm', ''),
(1781, '_SCORM_ADD_FORM', 'scorm', ''),
(1782, '_MANUAL_SEL', 'simplesel', ''),
(1783, '_MSG_HASMANUAL_1', 'simplesel', ''),
(1784, '_MSG_HASMANUAL_2', 'simplesel', ''),
(1785, '_SIMPLESEL_SUMMARY', 'simplesel', ''),
(1786, '_SIMPLESEL_TITLE', 'simplesel', ''),
(1787, '_ALERT_TEXT_SMS', 'sms', 'sms'),
(1788, '_APPROVED_SUBSCRIBED_TEXT_SMS', 'sms', 'sms'),
(1789, '_APPROVED_USER_TEXT_SMS', 'sms', 'sms'),
(1790, '_DELETED_USER_TEXT_SMS', 'sms', 'sms'),
(1791, '_MODIFIED_USER_TEXT_SMS', 'sms', 'sms'),
(1792, '_NEW_FORUM_BODY_SMS', 'sms', 'sms'),
(1793, '_NEW_FORUM_SMS', 'sms', 'sms'),
(1794, '_NEW_MESSAGE_INSERT_IN_THREAD_SMS', 'sms', 'sms'),
(1795, '_NEW_THREAD_INSERT_IN_FORUM_SMS', 'sms', 'sms'),
(1796, '_PASSWORD_CHANGED_SMS', 'sms', 'sms'),
(1797, '_REGISTERED_USER_TEXT_SMS', 'sms', 'sms'),
(1798, '_TO_APPROVE_GROUP_USER_TEXT_SMS', 'sms', 'sms'),
(1799, '_TO_APPROVE_USER_TEXT_SMS', 'sms', 'sms'),
(1800, '_TO_NEW_USER_TEXT_SMS', 'sms', 'sms'),
(1801, '_WAITING_USER_TEXT_SMS', 'sms', 'sms'),
(1802, '_YOU_RECIVE_MSG_TEXT_SMS', 'sms', 'sms'),
(1803, '_YOU_RECIVE_MSG_TEXT_SMS_COURSE', 'sms', ''),
(1804, '_CONNECTED_ACCOUNTS', 'social', ''),
(1805, '_CONNECT_YOUR_ACCOUNT_WITH', 'social', ''),
(1806, 'ab-initio', 'standard', ''),
(1807, 'attempted', 'standard', ''),
(1808, 'completed', 'standard', ''),
(1809, 'failed', 'standard', ''),
(1810, 'incomplete', 'standard', ''),
(1811, 'not attempted', 'standard', ''),
(1812, 'not_attempted', 'standard', ''),
(1813, 'passed', 'standard', ''),
(1814, '_ACCESSES', 'standard', ''),
(1815, '_ACTIVATE', 'standard', ''),
(1816, '_ACTIVE', 'standard', ''),
(1817, '_ACTIVE_TAB', 'standard', ''),
(1818, '_ACTIVITY', 'standard', ''),
(1819, '_ADD', 'standard', ''),
(1820, '_ADD_TAGS', 'standard', ''),
(1821, '_ADMINISTRATOR', 'standard', ''),
(1822, '_ADMINISTRATORS', 'standard', ''),
(1823, '_ADVANCED', 'standard', ''),
(1824, '_ADVANCED_SEARCH', 'standard', ''),
(1825, '_ALL', 'standard', ''),
(1826, '_ALL_CATEGORIES', 'standard', ''),
(1827, '_ALL_COURSES', 'standard', ''),
(1828, '_ALL_PAGES', 'standard', ''),
(1829, '_ALT_CHECK', 'standard', ''),
(1830, '_ALT_LESS', 'standard', ''),
(1831, '_ALT_MORE', 'standard', ''),
(1832, '_ALT_ROOT', 'standard', ''),
(1833, '_ANSWER', 'standard', ''),
(1834, '_APPROVE', 'standard', ''),
(1835, '_APPROVE_WAITING_USER', 'standard', ''),
(1836, '_AREYOUSURE', 'standard', ''),
(1837, '_ASSESSMENT', 'standard', ''),
(1838, '_ASSIGN', 'standard', ''),
(1839, '_ASSIGN_ADMIN', 'standard', ''),
(1840, '_ASSIGN_USERS', 'standard', ''),
(1841, '_ATTACHMENT', 'standard', ''),
(1842, '_ATTENDANCE', 'standard', ''),
(1843, '_AUTHOR', 'standard', ''),
(1844, '_AUTODETECT', 'standard', ''),
(1845, '_AUTO_SUBSCRIPTION', 'standard', ''),
(1846, '_AVATAR', 'standard', ''),
(1847, '_AVERANGE', 'standard', ''),
(1848, '_BACK', 'standard', ''),
(1849, '_BASIC_SEARCH', 'standard', ''),
(1850, '_BBB', 'standard', ''),
(1851, '_BY', 'standard', ''),
(1852, '_CALENDAR', 'standard', ''),
(1853, '_CANCEL', 'standard', ''),
(1854, '_CAREER', 'standard', ''),
(1855, '_CATALOGUE', 'standard', ''),
(1856, '_CATEGORIZATION', 'standard', ''),
(1857, '_CATEGORIZE', 'standard', ''),
(1858, '_CATEGORY', 'standard', ''),
(1859, '_CHAPTERS', 'standard', ''),
(1860, '_CHAT', 'standard', ''),
(1861, '_CLASSROOM', 'standard', ''),
(1862, '_CLOSE', 'standard', ''),
(1863, '_CODE', 'standard', ''),
(1864, '_COLLAPSE', 'standard', ''),
(1865, '_COMMENTS', 'standard', ''),
(1866, '_COMMUNICATIONS', 'standard', ''),
(1867, '_COMMUNITY_BLOG', 'standard', ''),
(1868, '_COMPANY_BLOG', 'standard', ''),
(1869, '_COMPETENCE', 'standard', ''),
(1870, '_COMPETENCES', 'standard', ''),
(1871, '_COMPLETED', 'standard', ''),
(1872, '_CONFIRM', 'standard', ''),
(1873, '_CONNECT', 'standard', ''),
(1874, '_CONNECTION_ERROR', 'standard', ''),
(1875, '_CONTAINS', 'standard', ''),
(1876, '_CONTENTS', 'standard', ''),
(1877, '_CONTENT_LIBRARY', 'standard', ''),
(1878, '_CONTEST', 'standard', ''),
(1879, '_CONTINUE', 'standard', ''),
(1880, '_COURSE', 'standard', ''),
(1881, '_COURSECATEGORY', 'standard', ''),
(1882, '_COURSEPATH', 'standard', ''),
(1883, '_COURSES', 'standard', ''),
(1884, '_COURSE_CODE', 'standard', ''),
(1885, '_COURSE_LIST', 'standard', ''),
(1886, '_COURSE_NAME', 'standard', ''),
(1887, '_COURSE_S_FREE', 'standard', ''),
(1888, '_CREATE', 'standard', ''),
(1889, '_CREDITS', 'standard', ''),
(1890, '_CURRENT_FILE', 'standard', ''),
(1891, '_DATE', 'standard', ''),
(1892, '_DATE_BEGIN', 'standard', ''),
(1893, '_DATE_END', 'standard', ''),
(1894, '_DATE_FIRST_ACCESS', 'standard', ''),
(1895, '_DATE_FORMAT', 'standard', ''),
(1896, '_DATE_LAST_ACCESS', 'standard', ''),
(1897, '_DAY', 'standard', ''),
(1898, '_DAYS', 'standard', ''),
(1899, '_DEACTIVATE', 'standard', ''),
(1900, '_DEFAULT_LANGUAGE', 'standard', ''),
(1901, '_DEL', 'standard', ''),
(1902, '_DELETE_FILE', 'standard', ''),
(1903, '_DEL_SELECTED', 'standard', ''),
(1904, '_DEMODERATE', 'standard', ''),
(1905, '_DENY', 'standard', ''),
(1906, '_DESCRIPTION', 'standard', ''),
(1907, '_DETAILS', 'standard', ''),
(1908, '_DIFFICULTY', 'standard', ''),
(1909, '_DIFFICULT_DIFFICULT', 'standard', ''),
(1910, '_DIFFICULT_EASY', 'standard', ''),
(1911, '_DIFFICULT_MEDIUM', 'standard', ''),
(1912, '_DIFFICULT_VERYDIFFICULT', 'standard', ''),
(1913, '_DIFFICULT_VERYEASY', 'standard', ''),
(1914, '_DIMDIM', 'standard', ''),
(1915, '_DISCONNECT', 'standard', ''),
(1916, '_DOWN', 'standard', ''),
(1917, '_DOWNLOAD', 'standard', ''),
(1918, '_EDITION', 'standard', ''),
(1919, '_EDITIONS', 'standard', ''),
(1920, '_EDIT_SCORE', 'standard', ''),
(1921, '_EDIT_SETTINGS', 'standard', ''),
(1922, '_ELEARNING', 'standard', ''),
(1923, '_EMAIL', 'standard', ''),
(1924, '_EMPTY_SELECTION', 'standard', ''),
(1925, '_END', 'standard', ''),
(1926, '_ENDELEM', 'standard', ''),
(1927, '_ENDS_WITH', 'standard', ''),
(1928, '_ENROLLRULES', 'standard', ''),
(1929, '_ENROL_COUNT', 'standard', ''),
(1930, '_ENTER', 'standard', ''),
(1931, '_ENVIRONMENT', 'standard', ''),
(1932, '_EQUAL', 'standard', ''),
(1933, '_ERRORS', 'standard', ''),
(1934, '_ERROR_MOVEONDESCENDANT', 'standard', ''),
(1935, '_ERROR_NONAME', 'standard', ''),
(1936, '_ERROR_UPLOAD', 'standard', ''),
(1937, '_EVENT', 'standard', ''),
(1938, '_EXPAND', 'standard', ''),
(1939, '_EXPIRATION_DATE', 'standard', ''),
(1940, '_EXPORT', 'standard', ''),
(1941, '_EXPORT_CSV', 'standard', ''),
(1942, '_EXPORT_HTML', 'standard', ''),
(1943, '_EXPORT_XLS', 'standard', ''),
(1944, '_EXPORT_XML', 'standard', ''),
(1945, '_FACEBOOK', 'standard', ''),
(1946, '_FIELD_NAME', 'standard', ''),
(1947, '_FILE', 'standard', ''),
(1948, '_FILENAME', 'standard', ''),
(1949, '_FILTER', 'standard', ''),
(1950, '_FILTER_ALL_CONDS', 'standard', ''),
(1951, '_FILTER_ONE_COND', 'standard', ''),
(1952, '_FINAL_SCORE', 'standard', ''),
(1953, '_FIRSTNAME', 'standard', ''),
(1954, '_FIX_SEQUENCE', 'standard', ''),
(1955, '_FORUM', 'standard', ''),
(1956, '_FROM', 'standard', ''),
(1957, '_FULLNAME', 'standard', ''),
(1958, '_FUNCTIONAL_ROLE', 'standard', ''),
(1959, '_GAP', 'standard', ''),
(1960, '_GOOGLE', 'standard', ''),
(1961, '_GROUPS', 'standard', ''),
(1962, '_HEIGHT', 'standard', ''),
(1963, '_HIDDEN', 'standard', ''),
(1964, '_HISTORY', 'standard', ''),
(1965, '_HOME', 'standard', ''),
(1966, '_HOURS', 'standard', ''),
(1967, '_IMAGE', 'standard', ''),
(1968, '_IMAGES', 'standard', ''),
(1969, '_IMPORT', 'standard', ''),
(1970, '_IMPORTANT', 'standard', ''),
(1971, '_IMPORT_FROM_XML', 'standard', ''),
(1972, '_INHERIT', 'standard', ''),
(1973, '_INSERT', 'standard', ''),
(1974, '_INSTRUCTION', 'standard', ''),
(1975, '_INVALID_EXTENSION', 'standard', ''),
(1976, '_JUMP', 'standard', ''),
(1977, '_JUMP_TO', 'standard', ''),
(1978, '_LABEL', 'standard', ''),
(1979, '_LABELS', 'standard', ''),
(1980, '_LANGUAGE', 'standard', ''),
(1981, '_LASTNAME', 'standard', ''),
(1982, '_LBL_CODE', 'standard', ''),
(1983, '_LBL_SEND', 'standard', ''),
(1984, '_LEARNING_OBJECTS', 'standard', ''),
(1985, '_LEVEL', 'standard', ''),
(1986, '_LIBRARY', 'standard', ''),
(1987, '_LINK', 'standard', ''),
(1988, '_LINKEDIN', 'standard', ''),
(1989, '_LOADED_FILE', 'standard', ''),
(1990, '_LOADING', 'standard', ''),
(1991, '_LOCATION', 'standard', ''),
(1992, '_LOGOUT', 'standard', ''),
(1993, '_LOG_USERS_TO_FNCROLE', 'standard', ''),
(1994, '_LOG_USERS_TO_GROUP', 'standard', ''),
(1995, '_MAKE_A_COPY', 'standard', ''),
(1996, '_MANAGE', 'standard', ''),
(1997, '_MANAGE_GROUPS', 'standard', ''),
(1998, '_MANDATORY', 'standard', ''),
(1999, '_MANUAL', 'standard', ''),
(2000, '_MAN_MENU', 'standard', ''),
(2001, '_MARK_AS_IMPORTANT', 'standard', ''),
(2002, '_MAX_SCORE', 'standard', ''),
(2003, '_MEET', 'standard', ''),
(2004, '_MESSAGES', 'standard', ''),
(2005, '_MIME_TYPE', 'standard', ''),
(2006, '_MINUTES', 'standard', ''),
(2007, '_MIN_SCORE', 'standard', ''),
(2008, '_MOD', 'standard', ''),
(2009, '_MODERATE', 'standard', ''),
(2010, '_MOD_SELECTED', 'standard', ''),
(2011, '_MOD_TITLE', 'standard', ''),
(2012, '_MONTH_01', 'standard', ''),
(2013, '_MONTH_02', 'standard', ''),
(2014, '_MONTH_03', 'standard', ''),
(2015, '_MONTH_04', 'standard', ''),
(2016, '_MONTH_05', 'standard', ''),
(2017, '_MONTH_06', 'standard', ''),
(2018, '_MONTH_07', 'standard', ''),
(2019, '_MONTH_08', 'standard', ''),
(2020, '_MONTH_09', 'standard', ''),
(2021, '_MONTH_10', 'standard', ''),
(2022, '_MONTH_11', 'standard', ''),
(2023, '_MONTH_12', 'standard', ''),
(2024, '_MORE_ACTIONS', 'standard', ''),
(2025, '_MORE_ATTACHMENT', 'standard', ''),
(2026, '_MORE_INFO', 'standard', ''),
(2027, '_MOVE', 'standard', ''),
(2028, '_MOVE_DOWN', 'standard', ''),
(2029, '_MOVE_UP', 'standard', ''),
(2030, '_NAME', 'standard', ''),
(2031, '_NEVER', 'standard', ''),
(2032, '_NEW', 'standard', ''),
(2033, '_NEWS', 'standard', ''),
(2034, '_NEWSLETTER', 'standard', ''),
(2035, '_NEW_CATEGORY', 'standard', ''),
(2036, '_NEW_COURSE', 'standard', ''),
(2037, '_NEW_EVENT', 'standard', ''),
(2038, '_NEW_FILTER', 'standard', ''),
(2039, '_NEW_FOLDER', 'standard', ''),
(2040, '_NEW_USER', 'standard', ''),
(2041, '_NEXT', 'standard', ''),
(2042, '_NO', 'standard', ''),
(2043, '_NONE', 'standard', ''),
(2044, '_NOTES', 'standard', ''),
(2045, '_NOTITLE', 'standard', ''),
(2046, '_NOT_ASSIGNED', 'standard', ''),
(2047, '_NOT_CONTAINS', 'standard', ''),
(2048, '_NOT_EQUAL', 'standard', ''),
(2049, '_NOT_SATISFIED', 'standard', ''),
(2050, '_NOT_STARTED', 'standard', ''),
(2051, '_NOT_TRANSLATED', 'standard', ''),
(2052, '_NO_ANSWER', 'standard', ''),
(2053, '_NO_BACK', 'standard', ''),
(2054, '_NO_CATEGORY', 'standard', ''),
(2055, '_NO_CONTENT', 'standard', ''),
(2056, '_OF', 'standard', ''),
(2057, '_OFF', 'standard', ''),
(2058, '_ON', 'standard', ''),
(2059, '_ONEMONTH', 'standard', ''),
(2060, '_ONLY_ONCE', 'standard', ''),
(2061, '_OPEN', 'standard', ''),
(2062, '_OPERATION_FAILURE', 'standard', ''),
(2063, '_OPERATION_SUCCESSFUL', 'standard', ''),
(2064, '_OPERATION_SUCCESSFULPWD', 'standard', ''),
(2065, '_ORDER_BY', 'standard', ''),
(2066, '_ORD_ASC', 'standard', ''),
(2067, '_ORD_ASC_TITLE', 'standard', ''),
(2068, '_ORD_DESC', 'standard', ''),
(2069, '_ORD_DESC_ALT', 'standard', ''),
(2070, '_ORD_DESC_TITLE', 'standard', ''),
(2071, '_ORGCHART', 'standard', ''),
(2072, '_ORGCHART_ADDNODE', 'standard', ''),
(2073, '_PAGES', 'standard', ''),
(2074, '_PASSWORD', 'standard', ''),
(2075, '_PERCENTAGE', 'standard', ''),
(2076, '_PLANNED', 'standard', ''),
(2077, '_PLAY', 'standard', ''),
(2078, '_PLAY_CHANCE', 'standard', ''),
(2079, '_PRECOMPILE', 'standard', ''),
(2080, '_PREREQUISITES', 'standard', ''),
(2081, '_PREV', 'standard', ''),
(2082, '_PREVELEM', 'standard', ''),
(2083, '_PREVIEW', 'standard', ''),
(2084, '_PREV_STEP', 'standard', ''),
(2085, '_PROGRESS', 'standard', ''),
(2086, '_PROPERTIES', 'standard', ''),
(2087, '_PUBLIC_ADMIN_USER', 'standard', ''),
(2088, '_PUBLISH', 'standard', ''),
(2089, '_QUESTION', 'standard', ''),
(2090, '_RE', 'standard', ''),
(2091, '_REACTIVATE', 'standard', ''),
(2092, '_READ', 'standard', ''),
(2093, '_RECIPIENTS', 'standard', ''),
(2094, '_REGISTER', 'standard', ''),
(2095, '_REGISTER_DATE', 'standard', ''),
(2096, '_REMOVE_FROM_NODE', 'standard', ''),
(2097, '_REPLY', 'standard', ''),
(2098, '_REPOPASTELO', 'standard', ''),
(2099, '_REPORT', 'standard', ''),
(2100, '_REQUIRED_SCORE', 'standard', ''),
(2101, '_RESET', 'standard', ''),
(2102, '_ROLLBACK', 'standard', ''),
(2103, '_ROOT', 'standard', ''),
(2104, '_ROW', 'standard', ''),
(2105, '_SAVE', 'standard', ''),
(2106, '_SCHEDULE', 'standard', ''),
(2107, '_SCORE', 'standard', ''),
(2108, '_SEARCH', 'standard', ''),
(2109, '_SECONDS', 'standard', ''),
(2110, '_SELECT', 'standard', ''),
(2111, '_SELECTED', 'standard', ''),
(2112, '_SELECT_ALL', 'standard', ''),
(2113, '_SEND', 'standard', ''),
(2114, '_SENDER', 'standard', ''),
(2115, '_SEND_TO', 'standard', ''),
(2116, '_SET', 'standard', ''),
(2117, '_SHORTDESC', 'standard', ''),
(2118, '_SHOW', 'standard', ''),
(2119, '_SHOW_RESULTS', 'standard', ''),
(2120, '_SIGNATURE', 'standard', ''),
(2121, '_SORT', 'standard', ''),
(2122, '_STANDINGS', 'standard', ''),
(2123, '_START', 'standard', ''),
(2124, '_STARTED', 'standard', ''),
(2125, '_STARTS_WITH', 'standard', ''),
(2126, '_START_DATE', 'standard', ''),
(2127, '_START_PAGE', 'standard', ''),
(2128, '_START_TIME', 'standard', ''),
(2129, '_STATISTICS', 'standard', ''),
(2130, '_STATUS', 'standard', ''),
(2131, '_SUBJECT', 'standard', ''),
(2132, '_SUBSCRIBE', 'standard', ''),
(2133, '_SUBSCRIBED_BY', 'standard', ''),
(2134, '_SUBSCRIBE_COURSE', 'standard', ''),
(2135, '_SUSPEND', 'standard', ''),
(2136, '_SUSPENDED', 'standard', ''),
(2137, '_TABS', 'standard', ''),
(2138, '_TAGS', 'standard', ''),
(2139, '_TELESKILL', 'standard', ''),
(2140, '_TEXTOF', 'standard', ''),
(2141, '_TIME_PERIODS', 'standard', ''),
(2142, '_TITLE', 'standard', ''),
(2143, '_TO', 'standard', ''),
(2144, '_TOTAL', 'standard', ''),
(2145, '_TOTAL_TIME', 'standard', ''),
(2146, '_TRANSACTION', 'standard', ''),
(2147, '_TWITTER', 'standard', ''),
(2148, '_TYPE', 'standard', ''),
(2149, '_TYPOLOGY', 'standard', ''),
(2150, '_UNASSIGN', 'standard', ''),
(2151, '_UNDO', 'standard', ''),
(2152, '_UNLIMITED', 'standard', ''),
(2153, '_UNPUBLISH', 'standard', ''),
(2154, '_UNREAD', 'standard', ''),
(2155, '_UNSELECT_ALL', 'standard', ''),
(2156, '_UNTIL_COMPLETED', 'standard', ''),
(2157, '_UP', 'standard', ''),
(2158, '_UPLOAD', 'standard', ''),
(2159, '_URL', 'standard', ''),
(2160, '_USER', 'standard', ''),
(2161, '_USERNAME', 'standard', ''),
(2162, '_USERS', 'standard', ''),
(2163, '_USER_RELEASE', 'standard', ''),
(2164, '_USER_STATUS_BEGIN', 'standard', ''),
(2165, '_USER_STATUS_CANCELLED', 'standard', ''),
(2166, '_USER_STATUS_CONFIRMED', 'standard', ''),
(2167, '_USER_STATUS_END', 'standard', ''),
(2168, '_USER_STATUS_ENTER', 'standard', ''),
(2169, '_USER_STATUS_RESERVED', 'standard', ''),
(2170, '_USER_STATUS_SUBS', 'standard', ''),
(2171, '_USER_STATUS_SUSPEND', 'standard', ''),
(2172, '_VERSION', 'standard', ''),
(2173, '_VIDEOCONFERENCE', 'standard', ''),
(2174, '_VIEW', 'standard', ''),
(2175, '_VIEW_PERMISSION', 'standard', ''),
(2176, '_WAITING', 'standard', ''),
(2177, '_WAITING_USERS', 'standard', ''),
(2178, '_WARNING', 'standard', ''),
(2179, '_WIDTH', 'standard', ''),
(2180, '_YEAR', 'standard', ''),
(2181, '_YES', 'standard', ''),
(2182, '_AT_HOUR', 'statistic', ''),
(2183, '_FOR_day', 'statistic', ''),
(2184, '_FOR_month', 'statistic', ''),
(2185, '_FOR_TITLE_day', 'statistic', 'accessibility'),
(2186, '_FOR_TITLE_month', 'statistic', 'accessibility'),
(2187, '_FOR_TITLE_week', 'statistic', 'accessibility'),
(2188, '_FOR_TITLE_year', 'statistic', 'accessibility'),
(2189, '_FOR_week', 'statistic', ''),
(2190, '_FOR_year', 'statistic', ''),
(2191, '_HOW_MUCH_TIME', 'statistic', ''),
(2192, '_LAST_ACTION_AT', 'statistic', ''),
(2193, '_LAST_OP', 'statistic', ''),
(2194, '_NUMBER_OF_OP', 'statistic', ''),
(2195, '_ORD_FOR_HM', 'statistic', ''),
(2196, '_ORD_FOR_NOP', 'statistic', ''),
(2197, '_ORD_FOR_SST', 'statistic', ''),
(2198, '_PAGE_VIEW', 'statistic', ''),
(2199, '_SESSION_STARTED', 'statistic', ''),
(2200, '_TIME_IN', 'statistic', ''),
(2201, '_TYPE_OF_OPERATION', 'statistic', ''),
(2202, '_USERS_LIST_CAPTION', 'statistic', 'accessibility'),
(2203, '_USERS_LIST_DETAILS_CAPTION', 'statistic', ''),
(2204, '_USERS_LIST_DETAILS_SUMMARY', 'statistic', 'accessibility'),
(2205, '_USERS_LIST_SUMMARY', 'statistic', 'accessibility'),
(2206, '_USER_TOTAL_TIME', 'statistic', ''),
(2207, '_VIEW_SESSION_DETAILS', 'statistic', ''),
(2208, '_VIEW_SESSION_DETAILS_ALT', 'statistic', ''),
(2209, '_WEEK_DAY_0_SHORT', 'statistic', ''),
(2210, '_WEEK_DAY_1_SHORT', 'statistic', ''),
(2211, '_WEEK_DAY_2_SHORT', 'statistic', ''),
(2212, '_WEEK_DAY_3_SHORT', 'statistic', ''),
(2213, '_WEEK_DAY_4_SHORT', 'statistic', ''),
(2214, '_WEEK_DAY_5_SHORT', 'statistic', ''),
(2215, '_WEEK_DAY_6_SHORT', 'statistic', ''),
(2216, '_FILTEREDITIONSELECTONEOPTION', 'stats', ''),
(2217, '_FILTEREDITIONSELECTTITLE', 'stats', ''),
(2218, '_FILTEROBJECTFINISHED', 'stats', ''),
(2219, '_FILTERSTATUSSELECTONEOPTION', 'stats', ''),
(2220, '_ORGPLAYTITLE', 'stats', ''),
(2221, '_PROGRESS', 'stats', ''),
(2222, '_STATFORUSER', 'stats', ''),
(2223, '_STATISTIC', 'stats', ''),
(2224, '_STATNOTRACKFORUSER', 'stats', ''),
(2225, '_STATSFORITEM', 'stats', ''),
(2226, '_STATSITEM', 'stats', ''),
(2227, '_STATSUSERITEM', 'stats', ''),
(2228, '_STATS_FULLNAME', 'stats', ''),
(2229, '_STATS_USERS', 'stats', ''),
(2230, '_HOMEREPOROOTNAME', 'storage', ''),
(2231, '_LOCKED', 'storage', ''),
(2232, '_LONAME_faq', 'storage', ''),
(2233, '_LONAME_glossary', 'storage', ''),
(2234, '_LONAME_htmlpage', 'storage', ''),
(2235, '_LONAME_item', 'storage', ''),
(2236, '_LONAME_link', 'storage', ''),
(2237, '_LONAME_poll', 'storage', ''),
(2238, '_LONAME_scoitem', 'storage', ''),
(2239, '_LONAME_scormorg', 'storage', ''),
(2240, '_LONAME_test', 'storage', ''),
(2241, '_ORGFOLDERNAME', 'storage', ''),
(2242, '_ORGISTERMINATOR', 'storage', ''),
(2243, '_ORGLOCKEDTITLE', 'storage', ''),
(2244, '_ORGPLAYTITLE', 'storage', ''),
(2245, '_ORGROOTNAME', 'storage', ''),
(2246, '_PUBREPOROOTNAME', 'storage', ''),
(2247, '_RENAMEFOLDER', 'storage', ''),
(2248, '_REPOCOPYLO', 'storage', ''),
(2249, '_REPOCREATELO', 'storage', ''),
(2250, '_REPOSELECTDESTINATION', 'storage', ''),
(2251, '_RULES', 'storage', ''),
(2252, '_SELECTLO', 'storage', ''),
(2253, '_TARGETMOVEFOLDER', 'storage', ''),
(2254, '_ABSENT', 'subscribe', ''),
(2255, '_BEFORE_THIS_APPROVE', 'subscribe', ''),
(2256, '_CAPTION_SELECT_LEVELS', 'subscribe', ''),
(2257, '_CHOOSE_SUBSCRIBE', 'subscribe', ''),
(2258, '_COPY', 'subscribe', ''),
(2259, '_COPY_TO_COURSE', 'subscribe', ''),
(2260, '_CORRECT', 'subscribe', ''),
(2261, '_DATE_BEGIN_VALIDITY', 'subscribe', ''),
(2262, '_DATE_EXPIRE_VALIDITY', 'subscribe', ''),
(2263, '_DATE_FIRST_COMPLETE', 'subscribe', ''),
(2264, '_DATE_LAST_COMPLETE', 'subscribe', ''),
(2265, '_DENY_SUBSCRIBED_TEXT_SMS', 'subscribe', ''),
(2266, '_EMPTYSPACE', 'subscribe', ''),
(2267, '_IMPORT_FILE', 'subscribe', ''),
(2268, '_IMPORT_FROM_COURSE', 'subscribe', ''),
(2269, '_IMPORT_HEADER', 'subscribe', ''),
(2270, '_IMPORT_INFO', 'subscribe', ''),
(2271, '_INSERT_CORRECT', 'subscribe', ''),
(2272, '_INSERT_NOT_NEEDED', 'subscribe', ''),
(2273, '_INSER_STATUS', 'subscribe', ''),
(2274, '_JUSTIFIED', 'subscribe', ''),
(2275, '_LEVEL_TO_IMPORT', 'subscribe', ''),
(2276, '_MOVE', 'subscribe', ''),
(2277, '_MOVE_TO_COURSE', 'subscribe', ''),
(2278, '_NOT_EXPIRED_WITHOUT_DATE', 'subscribe', ''),
(2279, '_NOT_EXPIRED_WITH_DATE', 'subscribe', ''),
(2280, '_NOT_JUSTIFIED', 'subscribe', ''),
(2281, '_NOT_NEEDED', 'subscribe', ''),
(2282, '_ONLY_EXPIRED', 'subscribe', ''),
(2283, '_RESET_VALIDITY_DATES', 'subscribe', ''),
(2284, '_SELECT_WHO_CONFIRM', 'subscribe', ''),
(2285, '_SEND_ALERT', 'subscribe', ''),
(2286, '_SHOW_ONLY', 'subscribe', ''),
(2287, '_STATUS_TO_IMPORT', 'subscribe', ''),
(2288, '_SUBSCRIBE', 'subscribe', ''),
(2289, '_SUBSCRIBE_ACCEPT', 'subscribe', ''),
(2290, '_SUBSCRIBE_REFUSE', 'subscribe', ''),
(2291, '_SUMMARY_SELECT_LEVEL', 'subscribe', ''),
(2292, '_SUMMARY_SELECT_WHO_CONFIRM', 'subscribe', ''),
(2293, '_USER_IS_BUSY', 'subscribe', ''),
(2294, '_USER_STATUS_OVERBOOKING', 'subscribe', ''),
(2295, '_USER_SUBSCRIBED', 'subscribe', ''),
(2296, '_VALID_AT_DATE', 'subscribe', ''),
(2297, '_WAIT', 'subscribe', ''),
(2298, '_YOUCANSUBSCRIBE', 'subscribe', ''),
(2299, '_CONFIRM_SUBSCRIPTION', 'subscription', ''),
(2300, '_ADDMESSAGE', 'sysforum', ''),
(2301, '_LOCKEDMESS', 'sysforum', ''),
(2302, '_LOCKMESS', 'sysforum', ''),
(2303, '_POPULAR', 'tags', ''),
(2304, '_TAGS_TIPS', 'tags', ''),
(2305, '_YOURS', 'tags', ''),
(2306, '_ALL_DIFFICULT', 'test', ''),
(2307, '_ALL_QUEST_CATEGORY', 'test', ''),
(2308, '_ALL_QUEST_TYPE', 'test', ''),
(2309, '_ATTEMPTS_REMAINING_BEFORE_SUSPENSION', 'test', ''),
(2310, '_BONUS_SCORE_FOR_TEST', 'test', ''),
(2311, '_CURRENT_SELECTION_COUNT', 'test', ''),
(2312, '_DESELECT_PAGE', 'test', ''),
(2313, '_EMPTY_ANSWER', 'test', ''),
(2314, '_FEEDBACK_MANAGEMENT', 'test', ''),
(2315, '_FEEDBACK_TEXT', 'test', ''),
(2316, '_GIFT', 'test', ''),
(2317, '_HARD', 'test', ''),
(2318, '_MANDATORY_ANSWER', 'test', ''),
(2319, '_MAX_ATTEMPT', 'test', ''),
(2320, '_NEED_ANSWER', 'test', ''),
(2321, '_NEW_SCORE_FOR_QUESTION', 'test', ''),
(2322, '_NEW_TEST', 'test', ''),
(2323, '_NUMBER_OF_ATTEMPT', 'test', ''),
(2324, '_ORDER_TYPE_CATEGORY', 'test', ''),
(2325, '_ORDER_TYPE_RANDOM', 'test', ''),
(2326, '_QUEST', 'test', ''),
(2327, '_QUEST_ACRN_ASSOCIATE', 'test', ''),
(2328, '_QUEST_ACRN_BREAK_PAGE', 'test', ''),
(2329, '_QUEST_ACRN_CHOICE', 'test', ''),
(2330, '_QUEST_ACRN_CHOICE_MULTIPLE', 'test', ''),
(2331, '_QUEST_ACRN_EXTENDED_TEXT', 'test', ''),
(2332, '_QUEST_ACRN_HOT_TEXT', 'test', ''),
(2333, '_QUEST_ACRN_INLINE_CHOICE', 'test', ''),
(2334, '_QUEST_ACRN_TEXT_ENTRY', 'test', ''),
(2335, '_QUEST_ACRN_TITLE', 'test', ''),
(2336, '_QUEST_ACRN_UPLOAD', 'test', ''),
(2337, '_QUEST_ANSWER', 'test', ''),
(2338, '_QUEST_ASSOCIATE', 'test', ''),
(2339, '_QUEST_BREAK_PAGE', 'test', ''),
(2340, '_QUEST_CHOICE', 'test', ''),
(2341, '_QUEST_CHOICE_MULTIPLE', 'test', ''),
(2342, '_QUEST_EXTENDED_TEXT', 'test', ''),
(2343, '_QUEST_FREEANSWER', 'test', ''),
(2344, '_QUEST_HOT_TEXT', 'test', ''),
(2345, '_QUEST_HOT_TEXT_ISTRUCTION', 'test', ''),
(2346, '_QUEST_INLINE_CHOICE', 'test', ''),
(2347, '_QUEST_INLINE_CHOICE_NOTE', 'test', ''),
(2348, '_QUEST_NONE_ANSWER', 'test', ''),
(2349, '_QUEST_REFER_TAG', 'test', ''),
(2350, '_QUEST_TEXT_ENTRY', 'test', ''),
(2351, '_QUEST_TE_ANSWERHERE', 'test', ''),
(2352, '_QUEST_TITLE', 'test', ''),
(2353, '_QUEST_TM2_DIFFERENCE_FROM_PREVIOUS', 'test', ''),
(2354, '_QUEST_TM2_SCORE_DIFFERENCE_FROM_PREVIOUS', 'test', ''),
(2355, '_QUEST_TM2_SETDIFFICULT', 'test', ''),
(2356, '_QUEST_TM2_SETSCORE', 'test', ''),
(2357, '_QUEST_TM2_SETTIME', 'test', ''),
(2358, '_QUEST_UPLOAD', 'test', ''),
(2359, '_RESTART_INFO', 'test', ''),
(2360, '_SELECT_PAGE', 'test', ''),
(2361, '_SUSPENSION_NUM_ATTEMPTS', 'test', ''),
(2362, '_SUSPENSION_NUM_HOURS', 'test', ''),
(2363, '_SUSPENSION_PREREQUISITES', 'test', ''),
(2364, '_TEST_ADDQUEST', 'test', ''),
(2365, '_TEST_ADD_FORM', 'test', ''),
(2366, '_TEST_ADD_ONE_ANSWER', 'test', ''),
(2367, '_TEST_AFTER_QUEST', 'test', ''),
(2368, '_TEST_ANSWER', 'test', ''),
(2369, '_TEST_ANSWER_CHECK', 'test', ''),
(2370, '_TEST_ANSWER_NOTCHECK', 'test', ''),
(2371, '_TEST_ASSOCIATE', 'test', ''),
(2372, '_TEST_BACK_TO_SETTIME', 'test', ''),
(2373, '_TEST_BEGIN', 'test', ''),
(2374, '_TEST_CAN_TRAVEL', 'test', ''),
(2375, '_TEST_CAN_TRAVEL_NO', 'test', ''),
(2376, '_TEST_CAPTION', 'test', ''),
(2377, '_TEST_COMPILE_TIME', 'test', ''),
(2378, '_TEST_COMPLETED', 'test', ''),
(2379, '_TEST_CONTINUE', 'test', ''),
(2380, '_TEST_CORRECT', 'test', ''),
(2381, '_TEST_END_BACKTOLESSON', 'test', ''),
(2382, '_TEST_END_PAGE', 'test', ''),
(2383, '_TEST_FAILED', 'test', ''),
(2384, '_TEST_FILE_NOT_ATTACH', 'test', ''),
(2385, '_TEST_FIRST_QUEST', 'test', ''),
(2386, '_TEST_IC_TITLE', 'test', ''),
(2387, '_TEST_IFCORRECT', 'test', ''),
(2388, '_TEST_IFINCORRECT', 'test', ''),
(2389, '_TEST_INCORRECT', 'test', ''),
(2390, '_TEST_INFO', 'test', ''),
(2391, '_TEST_INSERT', 'test', ''),
(2392, '_TEST_ISCORRECT', 'test', ''),
(2393, '_TEST_ISNOT_THECORRECT', 'test', ''),
(2394, '_TEST_IS_THECORRECT', 'test', ''),
(2395, '_TEST_LAST_QUEST', 'test', ''),
(2396, '_TEST_MANUAL_SCORE', 'test', ''),
(2397, '_TEST_MAXSCORE', 'test', ''),
(2398, '_TEST_MM1_ANSWER_ORDER', 'test', ''),
(2399, '_TEST_MM1_ANSWER_RANDOM', 'test', ''),
(2400, '_TEST_MM1_ANSWER_SEQUENCE', 'test', ''),
(2401, '_TEST_MM1_GROUPING', 'test', ''),
(2402, '_TEST_MM1_ONEFORPAGE', 'test', ''),
(2403, '_TEST_MM1_QUESTION_RANDOM_NUMBER', 'test', ''),
(2404, '_TEST_MM1_RANDOM', 'test', ''),
(2405, '_TEST_MM1_SEQUENCE', 'test', ''),
(2406, '_TEST_MM2_CANTRAVEL', 'test', ''),
(2407, '_TEST_MM2_HIDE_INFO', 'test', ''),
(2408, '_TEST_MM2_MODANSWER', 'test', ''),
(2409, '_TEST_MM2_SAVEKEEP', 'test', ''),
(2410, '_TEST_MM4_SHOWCAT', 'test', ''),
(2411, '_TEST_MM4_SHOWDOANSWER', 'test', ''),
(2412, '_TEST_MM4_SHOWSOL', 'test', ''),
(2413, '_TEST_MM4_SHOWTOT', 'test', ''),
(2414, '_TEST_MM_FOUR', 'test', ''),
(2415, '_TEST_MM_ONE', 'test', ''),
(2416, '_TEST_MM_TWO', 'test', ''),
(2417, '_TEST_MODALITY', 'test', ''),
(2418, '_TEST_MOD_DOANSWER', 'test', ''),
(2419, '_TEST_MOD_DOANSWER_NO', 'test', ''),
(2420, '_TEST_MOVEQUEST', 'test', ''),
(2421, '_TEST_NEXT_PAGE', 'test', ''),
(2422, '_TEST_NOT_AS_THECORRECT', 'test', ''),
(2423, '_TEST_NOT_HT_THECORRECT', 'test', ''),
(2424, '_TEST_NOT_MC_THECORRECT', 'test', ''),
(2425, '_TEST_NOT_THECORRECT', 'test', ''),
(2426, '_TEST_PAGES', 'test', ''),
(2427, '_TEST_PM1_PERC', 'test', ''),
(2428, '_TEST_PM1_POINT', 'test', ''),
(2429, '_TEST_PMM_REQUIREDSCORE_POINT', 'test', ''),
(2430, '_TEST_PM_DIFFICULT', 'test', ''),
(2431, '_TEST_PM_EQUALTOALL', 'test', ''),
(2432, '_TEST_PM_MANUAL', 'test', ''),
(2433, '_TEST_PM_ONE', 'test', ''),
(2434, '_TEST_PM_SETPOINT', 'test', ''),
(2435, '_TEST_PM_SUBD_BY', 'test', ''),
(2436, '_TEST_PM_TWO', 'test', '');
INSERT INTO `core_lang_text` (`id_text`, `text_key`, `text_module`, `text_attributes`) VALUES
(2437, '_TEST_POINT_ASSIGNEMENT', 'test', ''),
(2438, '_TEST_POINT_MANAGEMENT', 'test', ''),
(2439, '_TEST_PREV_PAGE', 'test', ''),
(2440, '_TEST_QUESTION_NUMBER', 'test', ''),
(2441, '_TEST_QUEST_CATEGORY', 'test', ''),
(2442, '_TEST_QUEST_ELEM', 'test', ''),
(2443, '_TEST_QUEST_ELEMENTS_A', 'test', ''),
(2444, '_TEST_QUEST_ELEMENTS_B', 'test', ''),
(2445, '_TEST_QUEST_ELEM_NUM', 'test', ''),
(2446, '_TEST_QUEST_MAXTESTSCORE', 'test', ''),
(2447, '_TEST_QUEST_NEWMAXTESTSCORE', 'test', ''),
(2448, '_TEST_QUEST_ORDER', 'test', ''),
(2449, '_TEST_QUEST_SEL_ASSOCIATION', 'test', ''),
(2450, '_TEST_QUEST_TIMEASS', 'test', ''),
(2451, '_TEST_QUEST_TIME_ASSIGNED', 'test', ''),
(2452, '_TEST_REQUIREDSCORE', 'test', ''),
(2453, '_TEST_REQUIREDSCORE_RESULT', 'test', ''),
(2454, '_TEST_RESTART', 'test', ''),
(2455, '_TEST_REVIEW_ANSWER', 'test', ''),
(2456, '_TEST_SAVED', 'test', ''),
(2457, '_TEST_SAVEKEEP', 'test', ''),
(2458, '_TEST_SAVEKEEP_BACK', 'test', ''),
(2459, '_TEST_SAVEKEEP_FAILURE_BACK', 'test', ''),
(2460, '_TEST_SAVEKEEP_NO', 'test', ''),
(2461, '_TEST_SAVE_KEEP', 'test', ''),
(2462, '_TEST_SCORES', 'test', ''),
(2463, '_TEST_SECTION', 'test', ''),
(2464, '_TEST_SEL_LIBRARIES', 'test', ''),
(2465, '_TEST_SHOW_REVIEW', 'test', ''),
(2466, '_TEST_SHOW_SCORE', 'test', ''),
(2467, '_TEST_SHOW_SCORE_NO', 'test', ''),
(2468, '_TEST_SHOW_SOLUTION', 'test', ''),
(2469, '_TEST_SHOW_SOLUTION_NO', 'test', ''),
(2470, '_TEST_SUB_ONE_ANSWER', 'test', ''),
(2471, '_TEST_SUMMARY', 'test', ''),
(2472, '_TEST_SUSPENDED', 'test', ''),
(2473, '_TEST_SUSPENDED_UNTIL', 'test', ''),
(2474, '_TEST_TEXT_ANSWER', 'test', ''),
(2475, '_TEST_TE_TITLE', 'test', ''),
(2476, '_TEST_TIME_ASSIGNED', 'test', ''),
(2477, '_TEST_TIME_ASSIGNED_NO', 'test', ''),
(2478, '_TEST_TIME_ASSIGNED_QUEST', 'test', ''),
(2479, '_TEST_TIME_MANAGEMENT', 'test', ''),
(2480, '_TEST_TIME_NO', 'test', ''),
(2481, '_TEST_TIME_YES', 'test', ''),
(2482, '_TEST_TIME_YES_QUEST', 'test', ''),
(2483, '_TEST_TM1_LIMIT', 'test', ''),
(2484, '_TEST_TM2_CAPTIONSETTIME', 'test', ''),
(2485, '_TEST_TM2_EQUALTOALL', 'test', ''),
(2486, '_TEST_TM2_MANUAL', 'test', ''),
(2487, '_TEST_TM2_NEWTIME', 'test', ''),
(2488, '_TEST_TM2_NEWTIMETOTAL', 'test', ''),
(2489, '_TEST_TM2_PENALITY_QUEST', 'test', ''),
(2490, '_TEST_TM2_PENALITY_TEST', 'test', ''),
(2491, '_TEST_TM2_SETSCORE', 'test', ''),
(2492, '_TEST_TM2_SETTIME', 'test', ''),
(2493, '_TEST_TM2_SUBD_BY', 'test', ''),
(2494, '_TEST_TM_FOUR', 'test', ''),
(2495, '_TEST_TM_ONE', 'test', ''),
(2496, '_TEST_TM_THREE', 'test', ''),
(2497, '_TEST_TM_TWO', 'test', ''),
(2498, '_TEST_TOTAL_SCORE', 'test', ''),
(2499, '_TEST_YOUCANNOT_SAVEKEEP', 'test', ''),
(2500, '_TIME_ELAPSED', 'test', ''),
(2501, '_TIME_LEFT', 'test', ''),
(2502, '_UNREACHED_PREREQUISITES', 'test', ''),
(2503, '_USE_SUSPENSION', 'test', ''),
(2504, '_VERY_HARD', 'test', ''),
(2505, '_YES_IF_PASSED', 'test', ''),
(2506, '_MARK_AS_PAID', 'transaction', ''),
(2507, '_PRICE', 'transaction', ''),
(2508, '_SET_NOT_PAID', 'transaction', ''),
(2509, '_ALT_EMPTY', 'treeview', ''),
(2510, '_DONT_USE_TREE_REGISTRATION', 'user_managment', ''),
(2511, '_LOG_OPTION', 'user_managment', ''),
(2512, '_NO_VALUE', 'user_managment', ''),
(2513, '_REACH_NUMBERS_OF_ATTEMPT', 'user_managment', ''),
(2514, '_REGISTER_TYPE_ADMIN', 'user_managment', ''),
(2515, '_REGISTER_TYPE_MODERATE', 'user_managment', ''),
(2516, '_REGISTER_TYPE_SELF', 'user_managment', ''),
(2517, '_USE_WITH_MANUALEINSERT', 'user_managment', ''),
(2518, '_USE_WITH_SELECTION', 'user_managment', ''),
(2519, '_ADD_WIKI', 'wiki', ''),
(2520, '_ALT_GOTO_PAGE', 'wiki', ''),
(2521, '_ALT_VIEW_REVISION', 'wiki', ''),
(2522, '_COMPARE_SEL_VER', 'wiki', ''),
(2523, '_EXPORT_WIKI', 'wiki', ''),
(2524, '_GUIDE', 'wiki', ''),
(2525, '_HOME', 'wiki', ''),
(2526, '_LEVEL_UP', 'wiki', ''),
(2527, '_MAP', 'wiki', ''),
(2528, '_OTHER_LANGUAGE', 'wiki', ''),
(2529, '_PAGE', 'wiki', ''),
(2530, '_PROVIDE_SEARCH_QUERY', 'wiki', ''),
(2531, '_REVISIONS', 'wiki', ''),
(2532, '_SELECT_WIKI', 'wiki', ''),
(2533, '_TABLE_SELECT_WIKI_CAP', 'wiki', ''),
(2534, '_WIKI', 'wiki', ''),
(2535, '_WIKI_HOME', 'wiki', ''),
(2536, '_WIKI_INSTRUCTION', 'wiki', ''),
(2537, '_WIKI_LANGUAGE', 'wiki', ''),
(2538, '_WIKI_LEVEL_UP', 'wiki', ''),
(2539, '_WIKI_OTHER_LANGUAGES', 'wiki', ''),
(2540, '_WIKI_PREV', 'wiki', '');

-- --------------------------------------------------------

--
-- Table structure for table `core_lang_translation`
--

CREATE TABLE IF NOT EXISTS `core_lang_translation` (
  `id_text` int(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(50) NOT NULL DEFAULT '',
  `translation_text` text,
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_text`,`lang_code`),
  KEY `lang_code` (`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_lang_translation`
--

INSERT INTO `core_lang_translation` (`id_text`, `lang_code`, `translation_text`, `save_date`) VALUES
(1, 'english', 'Select folders for administrator user visibility', '2015-08-26 00:52:14'),
(2, 'english', 'Administrators manager', '2015-08-26 00:52:14'),
(3, 'english', 'Administrator user', '2015-08-26 00:52:14'),
(4, 'english', 'List of all platform administrators', '2015-08-26 00:52:14'),
(5, 'english', 'Menu', '2015-08-26 00:52:14'),
(6, 'english', 'Special settings', '2015-08-26 00:52:14'),
(7, 'english', 'Administrator Profile', '2015-08-26 00:52:14'),
(8, 'english', 'Special settings for:', '2015-08-26 00:52:14'),
(9, 'english', 'Activate directly the enrollments made by this admin', '2015-08-26 00:52:14'),
(10, 'english', 'Activate directly the users created by this admin', '2015-08-26 00:52:14'),
(11, 'english', 'Languages settings', '2015-08-26 00:52:14'),
(12, 'english', 'Limit the maximum number of enrollments this admin can make', '2015-08-26 00:52:14'),
(13, 'english', 'Limit the maximum number of users this admin can create', '2015-08-26 00:52:14'),
(14, 'english', 'Manage subscriptions', '2015-08-26 00:52:14'),
(15, 'english', 'The maximum number of enrollments this admin can make', '2015-08-26 00:52:14'),
(16, 'english', 'Max number of users this admin can create', '2015-08-26 00:52:14'),
(17, 'english', 'Select the languages to assign', '2015-08-26 00:52:14'),
(18, 'english', 'Special settings', '2015-08-26 00:52:14'),
(19, 'english', 'Paper test', '2015-08-26 00:52:14'),
(20, 'english', 'Web test', '2015-08-26 00:52:14'),
(21, 'english', 'Accept', '2015-08-26 00:52:14'),
(22, 'english', 'User accepted', '2015-08-26 00:52:14'),
(23, 'english', 'Additional fields assigned', '2015-08-26 00:52:14'),
(24, 'english', 'Decline', '2015-08-26 00:52:14'),
(25, 'english', 'Self registration', '2015-08-26 00:52:14'),
(26, 'english', 'Administrator', '2015-08-26 00:52:14'),
(27, 'english', 'Super admin', '2015-08-26 00:52:14'),
(28, 'english', 'Public administrator', '2015-08-26 00:52:14'),
(29, 'english', 'User', '2015-08-26 00:52:14'),
(30, 'english', 'Assign field', '2015-08-26 00:52:14'),
(31, 'english', 'Email', '2015-08-26 00:52:14'),
(32, 'english', 'Firstname', '2015-08-26 00:52:14'),
(33, 'english', 'Show also children node content', '2015-08-26 00:52:14'),
(34, 'english', 'Language', '2015-08-26 00:52:14'),
(35, 'english', 'Last Name', '2015-08-26 00:52:14'),
(36, 'english', 'Password', '2015-08-26 00:52:14'),
(37, 'english', 'Registration date', '2015-08-26 00:52:14'),
(38, 'english', 'Template Name', '2015-08-26 00:52:14'),
(39, 'english', 'User name', '2015-08-26 00:52:14'),
(40, 'english', 'Full name', '2015-08-26 00:52:14'),
(41, 'english', 'id', '2015-08-26 00:52:14'),
(42, 'english', 'Group type', '2015-08-26 00:52:14'),
(43, 'english', 'Open group', '2015-08-26 00:52:14'),
(44, 'english', 'Invisible group', '2015-08-26 00:52:14'),
(45, 'english', 'Invisible', '2015-08-26 00:52:14'),
(46, 'english', 'Moderated group', '2015-08-26 00:52:14'),
(47, 'english', 'Moderated', '2015-08-26 00:52:14'),
(48, 'english', 'Private group', '2015-08-26 00:52:14'),
(49, 'english', 'Admin', '2015-08-26 00:52:14'),
(50, 'english', 'Users waiting for subscription confirmation', '2015-08-26 00:52:14'),
(51, 'english', 'User field', '2015-08-26 00:52:14'),
(52, 'english', 'Member id', '2015-08-26 00:52:14'),
(53, 'english', 'Member type', '2015-08-26 00:52:14'),
(54, 'english', 'Node', '2015-08-26 00:52:14'),
(55, 'english', 'User member', '2015-08-26 00:52:14'),
(56, 'english', 'Organization chart', '2015-08-26 00:52:14'),
(57, 'english', 'Require a change of password upon the next log in', '2015-08-26 00:52:14'),
(58, 'english', 'Yes', '2015-08-26 00:52:14'),
(59, 'english', 'File charset', '2015-08-26 00:52:14'),
(60, 'english', 'CSV file', '2015-08-26 00:52:14'),
(61, 'english', 'Consider first row as header', '2015-08-26 00:52:14'),
(62, 'english', 'Fields separator', '2015-08-26 00:52:14'),
(63, 'english', 'Last Name First Name', '2015-08-26 00:52:14'),
(64, 'english', 'User has not been approved', '2015-08-26 00:52:14'),
(65, 'english', 'Refuse', '2015-08-26 00:52:14'),
(66, 'english', 'Refuse user registration request', '2015-08-26 00:52:14'),
(67, 'english', 'Search in fields: userID, First Name or Last Name', '2015-08-26 00:52:14'),
(68, 'english', 'Users list with confirmed registration request and waiting for approval', '2015-08-26 00:52:14'),
(69, 'english', 'Language code not specified', '2015-08-26 00:52:14'),
(70, 'english', 'Clean languages', '2015-08-26 00:52:14'),
(71, 'english', 'Clean', '2015-08-26 00:52:14'),
(72, 'english', 'From left to right (ltr)', '2015-08-26 00:52:14'),
(73, 'english', 'From right to left (rtl)', '2015-08-26 00:52:14'),
(74, 'english', 'Do not add missing labels', '2015-08-26 00:52:14'),
(75, 'english', 'Export this language', '2015-08-26 00:52:14'),
(76, 'english', 'Only export words that have not been traslated yet (these keys will be shown in english)', '2015-08-26 00:52:14'),
(77, 'english', 'Accessibility', '2015-08-26 00:52:14'),
(78, 'english', 'Add key', '2015-08-26 00:52:14'),
(79, 'english', 'All languages', '2015-08-26 00:52:14'),
(80, 'english', 'All modules', '2015-08-26 00:52:14'),
(81, 'english', 'Attributes', '2015-08-26 00:52:14'),
(82, 'english', 'Web Browser language code', '2015-08-26 00:52:14'),
(83, 'english', 'Charset', '2015-08-26 00:52:14'),
(84, 'english', 'Language code', '2015-08-26 00:52:14'),
(85, 'english', 'Comparison', '2015-08-26 00:52:14'),
(86, 'english', 'Language direction', '2015-08-26 00:52:14'),
(87, 'english', 'Key', '2015-08-26 00:52:14'),
(88, 'english', 'Module', '2015-08-26 00:52:14'),
(89, 'english', 'New module', '2015-08-26 00:52:14'),
(90, 'english', 'Translation', '2015-08-26 00:52:14'),
(91, 'english', 'Comparison', '2015-08-26 00:52:14'),
(92, 'english', 'Updated modules', '2015-08-26 00:52:14'),
(93, 'english', 'No, cancel import', '2015-08-26 00:52:14'),
(94, 'english', 'Phrases', '2015-08-26 00:52:14'),
(95, 'english', 'Only untranslated phrases', '2015-08-26 00:52:14'),
(96, 'english', 'Reading orientation', '2015-08-26 00:52:14'),
(97, 'english', 'Overwrite existing words', '2015-08-26 00:52:14'),
(98, 'english', 'Translate %', '2015-08-26 00:52:14'),
(99, 'english', 'Language definition updated', '2015-08-26 00:52:14'),
(100, 'english', 'Translation table for %module%', '2015-08-26 00:52:14'),
(101, 'english', 'Translate', '2015-08-26 00:52:14'),
(102, 'english', 'Translate language', '2015-08-26 00:52:14'),
(103, 'english', 'Translation contains', '2015-08-26 00:52:14'),
(104, 'english', 'Yes, import', '2015-08-26 00:52:14'),
(105, 'english', 'Choose users who can see the news.', '2015-08-26 00:52:14'),
(106, 'english', 'Extended description', '2015-08-26 00:52:14'),
(107, 'english', 'Number of news items displayed on home page', '2015-08-26 00:52:14'),
(108, 'english', 'List of all the news that you can find in the main page of the LMS', '2015-08-26 00:52:14'),
(109, 'english', 'This news is marked as important', '2015-08-26 00:52:14'),
(110, 'english', 'every language', '2015-08-26 00:52:14'),
(111, 'english', 'Newsletter will reach [tot] users.', '2015-08-26 00:52:14'),
(112, 'english', 'Pause for 20 seconds', '2015-08-26 00:52:14'),
(113, 'english', 'SMS', '2015-08-26 00:52:14'),
(114, 'english', 'New web page', '2015-08-26 00:52:14'),
(115, 'english', 'Home', '2015-08-26 00:52:14'),
(116, 'english', 'This is the default page', '2015-08-26 00:52:14'),
(117, 'english', 'Web pages', '2015-08-26 00:52:14'),
(118, 'english', 'List of web pages', '2015-08-26 00:52:14'),
(119, 'english', 'Add announcement', '2015-08-26 00:52:14'),
(120, 'english', 'Announcements', '2015-08-26 00:52:14'),
(121, 'english', 'Move to archive', '2015-08-26 00:52:14'),
(122, 'english', 'Move into read announcements', '2015-08-26 00:52:14'),
(123, 'english', 'Choose who can read this announcement', '2015-08-26 00:52:14'),
(124, 'english', 'Select users', '2015-08-26 00:52:14'),
(125, 'english', 'Only me', '2015-08-26 00:52:14'),
(126, 'english', 'Apr', '2015-08-26 00:52:14'),
(127, 'english', 'April', '2015-08-26 00:52:14'),
(128, 'english', 'Aug', '2015-08-26 00:52:14'),
(129, 'english', 'August', '2015-08-26 00:52:14'),
(130, 'english', 'Event calendar', '2015-08-26 00:52:14'),
(131, 'english', 'Show before %s', '2015-08-26 00:52:14'),
(132, 'english', 'Dec', '2015-08-26 00:52:14'),
(133, 'english', 'December', '2015-08-26 00:52:14'),
(134, 'english', '%d-%m-%Y', '2015-08-26 00:52:14'),
(135, 'english', 'Feb', '2015-08-26 00:52:14'),
(136, 'english', 'February', '2015-08-26 00:52:14'),
(137, 'english', 'Fri', '2015-08-26 00:52:14'),
(138, 'english', 'Friday', '2015-08-26 00:52:14'),
(139, 'english', 'Generic', '2015-08-26 00:52:14'),
(140, 'english', 'Today', '2015-08-26 00:52:14'),
(141, 'english', 'Jan', '2015-08-26 00:52:14'),
(142, 'english', 'January', '2015-08-26 00:52:14'),
(143, 'english', 'Jul', '2015-08-26 00:52:14'),
(144, 'english', 'July', '2015-08-26 00:52:14'),
(145, 'english', 'Jun', '2015-08-26 00:52:14'),
(146, 'english', 'June', '2015-08-26 00:52:14'),
(147, 'english', 'Mar', '2015-08-26 00:52:14'),
(148, 'english', 'March', '2015-08-26 00:52:14'),
(149, 'english', 'May', '2015-08-26 00:52:14'),
(150, 'english', 'Meeting', '2015-08-26 00:52:14'),
(151, 'english', 'Mon', '2015-08-26 00:52:14'),
(152, 'english', 'Monday', '2015-08-26 00:52:14'),
(153, 'english', 'Next Month', '2015-08-26 00:52:14'),
(154, 'english', 'Next Year', '2015-08-26 00:52:14'),
(155, 'english', 'Nov', '2015-08-26 00:52:14'),
(156, 'english', 'November', '2015-08-26 00:52:14'),
(157, 'english', 'Oct', '2015-08-26 00:52:14'),
(158, 'english', 'October', '2015-08-26 00:52:14'),
(159, 'english', '(today)', '2015-08-26 00:52:14'),
(160, 'english', 'please wait...', '2015-08-26 00:52:14'),
(161, 'english', 'Previous month', '2015-08-26 00:52:14'),
(162, 'english', 'Previous year', '2015-08-26 00:52:14'),
(163, 'english', 'Private', '2015-08-26 00:52:14'),
(164, 'english', 'Public', '2015-08-26 00:52:14'),
(165, 'english', 'Publishing', '2015-08-26 00:52:14'),
(166, 'english', 'Sat', '2015-08-26 00:52:14'),
(167, 'english', 'Saturday', '2015-08-26 00:52:14'),
(168, 'english', 'Sep', '2015-08-26 00:52:14'),
(169, 'english', 'September', '2015-08-26 00:52:14'),
(170, 'english', 'Sun', '2015-08-26 00:52:14'),
(171, 'english', 'Sunday', '2015-08-26 00:52:14'),
(172, 'english', 'Thu', '2015-08-26 00:52:14'),
(173, 'english', 'Thursday', '2015-08-26 00:52:14'),
(174, 'english', 'Hour:', '2015-08-26 00:52:14'),
(175, 'english', 'Today', '2015-08-26 00:52:14'),
(176, 'english', '%a:%b:%e', '2015-08-26 00:52:14'),
(177, 'english', 'Tue', '2015-08-26 00:52:14'),
(178, 'english', 'Tuesday', '2015-08-26 00:52:14'),
(179, 'english', 'Wed', '2015-08-26 00:52:15'),
(180, 'english', 'Wednesday', '2015-08-26 00:52:15'),
(181, 'english', '0,6', '2015-08-26 00:52:15'),
(182, 'english', 'week', '2015-08-26 00:52:15'),
(183, 'english', 'Add to cart', '2015-08-26 00:52:15'),
(184, 'english', 'Catalogue', '2015-08-26 00:52:15'),
(185, 'english', 'Career', '2015-08-26 00:52:15'),
(186, 'english', 'Select catalogs', '2015-08-26 00:52:15'),
(187, 'english', 'List all the available catalogs', '2015-08-26 00:52:15'),
(188, 'english', 'Certificates available for the download', '2015-08-26 00:52:15'),
(189, 'english', 'Building', '2015-08-26 00:52:15'),
(190, 'english', 'Confirm Subscription', '2015-08-26 00:52:15'),
(191, 'english', 'This curriculum has <b>[enrolled]</b> subscribed users', '2015-08-26 00:52:15'),
(192, 'english', 'Your curriculum', '2015-08-26 00:52:15'),
(193, 'english', 'Curricula Subscribe', '2015-08-26 00:52:15'),
(194, 'english', 'Confirm your subscription to this Course Path:', '2015-08-26 00:52:15'),
(195, 'english', 'Courses where you are [level]', '2015-08-26 00:52:15'),
(196, 'english', 'Courses you are subscribed to', '2015-08-26 00:52:15'),
(197, 'english', 'Courses you have completed', '2015-08-26 00:52:15'),
(198, 'english', 'Courses expiring in one week', '2015-08-26 00:52:15'),
(199, 'english', 'List of available courses', '2015-08-26 00:52:15'),
(200, 'english', 'Course subscription', '2015-08-26 00:52:15'),
(201, 'english', 'Only admin can subscribe', '2015-08-26 00:52:15'),
(202, 'english', 'Your subscription to this course needs to be approved by admin', '2015-08-26 00:52:15'),
(203, 'english', 'Course type', '2015-08-26 00:52:15'),
(204, 'english', 'Enabled courses', '2015-08-26 00:52:15'),
(205, 'english', 'E-learning', '2015-08-26 00:52:15'),
(206, 'english', 'Courses and curricula', '2015-08-26 00:52:15'),
(207, 'english', 'Courses and curricula assigned to this catalog', '2015-08-26 00:52:15'),
(208, 'english', 'Courses which start from', '2015-08-26 00:52:15'),
(209, 'english', 'Show only courses', '2015-08-26 00:52:15'),
(210, 'english', 'selling', '2015-08-26 00:52:15'),
(211, 'english', 'Import new', '2015-08-26 00:52:15'),
(212, 'english', 'Manual subscription', '2015-08-26 00:52:15'),
(213, 'english', 'Show elements of the catalog', '2015-08-26 00:52:15'),
(214, 'english', 'New catalog', '2015-08-26 00:52:15'),
(215, 'english', 'No courses available', '2015-08-26 00:52:15'),
(216, 'english', 'Course not found', '2015-08-26 00:52:15'),
(217, 'english', 'There are no editions in this course.', '2015-08-26 00:52:15'),
(218, 'english', 'Suggested curriculum', '2015-08-26 00:52:15'),
(219, 'english', 'Remove from the catalog', '2015-08-26 00:52:15'),
(220, 'english', 'Reserve', '2015-08-26 00:52:15'),
(221, 'english', 'Shopping cart', '2015-08-26 00:52:15'),
(222, 'english', 'Subscribe to this course', '2015-08-26 00:52:15'),
(223, 'english', 'By category', '2015-08-26 00:52:15'),
(224, 'english', 'Most popular', '2015-08-26 00:52:15'),
(225, 'english', 'Most recent', '2015-08-26 00:52:15'),
(226, 'english', 'Insert Subscription Code', '2015-08-26 00:52:15'),
(227, 'english', 'Total number of courses you are subscribed to', '2015-08-26 00:52:15'),
(228, 'english', 'If you received a subscription code, use this form to be automatically added to the course:', '2015-08-26 00:52:15'),
(229, 'english', 'Enter', '2015-08-26 00:52:15'),
(230, 'english', 'Waiting for approval', '2015-08-26 00:52:15'),
(231, 'english', 'Search by word', '2015-08-26 00:52:15'),
(232, 'english', 'Erase meta-certificate already published', '2015-08-26 00:52:15'),
(233, 'english', 'Publish a meta-certificate copy', '2015-08-26 00:52:15'),
(234, 'english', 'Background image', '2015-08-26 00:52:15'),
(235, 'english', 'Certificate language', '2015-08-26 00:52:15'),
(236, 'english', 'Certificate template list', '2015-08-26 00:52:15'),
(237, 'english', 'Certificates list', '2015-08-26 00:52:15'),
(238, 'english', 'Released certificate', '2015-08-26 00:52:15'),
(239, 'english', 'Certificate template list', '2015-08-26 00:52:15'),
(240, 'english', 'Released certificates', '2015-08-26 00:52:15'),
(241, 'english', 'IMPORTANT: Due to a limitation of the PDF class which will be fixed in a future version, we suggest using ONLY background images and not embedded images in HTML code inside tags like < p >, < div >, < center > etc., as this can cause errors.', '2015-08-26 00:52:15'),
(242, 'english', 'Choose the certificate', '2015-08-26 00:52:15'),
(243, 'english', 'Choose the course', '2015-08-26 00:52:15'),
(244, 'english', 'Course starting date', '2015-08-26 00:52:15'),
(245, 'english', 'Course description', '2015-08-26 00:52:15'),
(246, 'english', 'Course end date', '2015-08-26 00:52:15'),
(247, 'english', 'Max final score', '2015-08-26 00:52:15'),
(248, 'english', 'Certificate date', '2015-08-26 00:52:15'),
(249, 'english', 'Certificate year', '2015-08-26 00:52:15'),
(250, 'english', 'Date of the course completion', '2015-08-26 00:52:15'),
(251, 'english', 'Course subscription date', '2015-08-26 00:52:15'),
(252, 'english', 'if not available, user name, write name and last name, username will be shown', '2015-08-26 00:52:15'),
(253, 'english', 'Score required for the Excellence certificate', '2015-08-26 00:52:15'),
(254, 'english', 'Generate', '2015-08-26 00:52:15'),
(255, 'english', 'Generate all the selected certificates', '2015-08-26 00:52:15'),
(256, 'english', 'Landscape', '2015-08-26 00:52:15'),
(257, 'english', 'Association list', '2015-08-26 00:52:15'),
(258, 'english', 'Meta-certificate list', '2015-08-26 00:52:15'),
(259, 'english', 'Meta-certificates ready to be created', '2015-08-26 00:52:15'),
(260, 'english', 'Status of meta-certificates linked to users', '2015-08-26 00:52:15'),
(261, 'english', 'Association table', '2015-08-26 00:52:15'),
(262, 'english', 'Table to link users and courses to the meta-certificate', '2015-08-26 00:52:15'),
(263, 'english', 'Completed / Total', '2015-08-26 00:52:15'),
(264, 'english', 'Meta-certificate list', '2015-08-26 00:52:15'),
(265, 'english', 'My certificates', '2015-08-26 00:52:15'),
(266, 'english', 'New association', '2015-08-26 00:52:15'),
(267, 'english', 'New certificate', '2015-08-26 00:52:15'),
(268, 'english', 'Not ended', '2015-08-26 00:52:15'),
(269, 'english', 'No availables certificates', '2015-08-26 00:52:15'),
(270, 'english', 'No one has accessed this certificate yet', '2015-08-26 00:52:15'),
(271, 'english', 'No meta-certificates ready to be published', '2015-08-26 00:52:15'),
(272, 'english', 'Certificates:', '2015-08-26 00:52:15'),
(273, 'english', 'Orientation', '2015-08-26 00:52:15'),
(274, 'english', 'Portrait', '2015-08-26 00:52:15'),
(275, 'english', 'Released on', '2015-08-26 00:52:15'),
(276, 'english', 'Released', '2015-08-26 00:52:15'),
(277, 'english', 'Stop', '2015-08-26 00:52:15'),
(278, 'english', 'Certificate template', '2015-08-26 00:52:15'),
(279, 'english', 'Structure of meta-certificate', '2015-08-26 00:52:15'),
(280, 'english', 'Table of courses completed toward the meta-certificate', '2015-08-26 00:52:15'),
(281, 'english', 'Tag codes', '2015-08-26 00:52:15'),
(282, 'english', 'Description tag', '2015-08-26 00:52:15'),
(283, 'english', 'Tags available for certificate template building', '2015-08-26 00:52:15'),
(284, 'english', 'Tags available for certificate template building', '2015-08-26 00:52:15'),
(285, 'english', 'Download copy of certificate', '2015-08-26 00:52:15'),
(286, 'english', 'Template', '2015-08-26 00:52:15'),
(287, 'english', 'Final Learning Object score', '2015-08-26 00:52:15'),
(288, 'english', 'Maximum final Learning Object score', '2015-08-26 00:52:15'),
(289, 'english', 'Initial Learning Object score', '2015-08-26 00:52:15'),
(290, 'english', 'Maximum initial Learning Object score', '2015-08-26 00:52:15'),
(291, 'english', 'Assign meta-certificate', '2015-08-26 00:52:15'),
(292, 'english', 'Certificate management', '2015-08-26 00:52:15'),
(293, 'english', 'Meta-certificates available to be pulbished', '2015-08-26 00:52:15'),
(294, 'english', 'Meta-certificate', '2015-08-26 00:52:15'),
(295, 'english', 'Meta-certificate assignment', '2015-08-26 00:52:15'),
(296, 'english', 'Meta-certificates emission', '2015-08-26 00:52:15'),
(297, 'english', 'Deleting association', '2015-08-26 00:52:15'),
(298, 'english', 'View copy', '2015-08-26 00:52:15'),
(299, 'english', 'Total time spent in the course', '2015-08-26 00:52:15'),
(300, 'english', 'Total time spent in the course (just hours)', '2015-08-26 00:52:15'),
(301, 'english', 'Total time spent in the course (just minutes)', '2015-08-26 00:52:15'),
(302, 'english', 'Total time spent in the course (just seconds)', '2015-08-26 00:52:15'),
(303, 'english', 'To be released', '2015-08-26 00:52:15'),
(304, 'english', 'Select users to be linked to the meta-certificate', '2015-08-26 00:52:15'),
(305, 'english', 'Chat with other users in this course, click on the link below to open the chatroom in a pop-up window', '2015-08-26 00:52:15'),
(306, 'english', 'Open chatroom (new window)', '2015-08-26 00:52:15'),
(307, 'english', 'Open chatroom (accessibility version)(pop-up)', '2015-08-26 00:52:15'),
(308, 'english', 'Available Hardware', '2015-08-26 00:52:15'),
(309, 'english', 'Room', '2015-08-26 00:52:15'),
(310, 'english', 'Capacity', '2015-08-26 00:52:15'),
(311, 'english', 'City', '2015-08-26 00:52:15'),
(312, 'english', 'Layout', '2015-08-26 00:52:15'),
(313, 'english', 'Fax', '2015-08-26 00:52:15'),
(314, 'english', 'Classroom hardware', '2015-08-26 00:52:15'),
(315, 'english', 'Phone number', '2015-08-26 00:52:15'),
(316, 'english', 'Photo', '2015-08-26 00:52:15'),
(317, 'english', 'Refer(s) to', '2015-08-26 00:52:15'),
(318, 'english', 'State', '2015-08-26 00:52:15'),
(319, 'english', 'Street', '2015-08-26 00:52:15'),
(320, 'english', 'Zipcode', '2015-08-26 00:52:15'),
(321, 'english', 'Code list', '2015-08-26 00:52:15'),
(322, 'english', 'Number of uses', '2015-08-26 00:52:15'),
(323, 'english', 'Unlimited use', '2015-08-26 00:52:15'),
(324, 'english', 'Used', '2015-08-26 00:52:15'),
(325, 'english', 'Add new competence', '2015-08-26 00:52:15'),
(326, 'english', 'Assign competence requirements to users', '2015-08-26 00:52:15'),
(327, 'english', 'Required', '2015-08-26 00:52:15'),
(328, 'english', 'Attitude', '2015-08-26 00:52:15'),
(329, 'english', 'Knowledge', '2015-08-26 00:52:15'),
(330, 'english', 'Skill', '2015-08-26 00:52:15'),
(331, 'english', 'Competence''s related users list', '2015-08-26 00:52:15'),
(332, 'english', 'Obtained', '2015-08-26 00:52:15'),
(333, 'english', 'Obtained on', '2015-08-26 00:52:15'),
(334, 'english', 'Expire after (days)', '2015-08-26 00:52:15'),
(335, 'english', 'Flag', '2015-08-26 00:52:15'),
(336, 'english', 'Competence with courses associated', '2015-08-26 00:52:15'),
(337, 'english', 'Competence with roles associated', '2015-08-26 00:52:15'),
(338, 'english', 'Competence with users associated', '2015-08-26 00:52:15'),
(339, 'english', 'Hour:', '2015-08-26 00:52:15'),
(340, 'english', 'Room name', '2015-08-26 00:52:15'),
(341, 'english', 'System', '2015-08-26 00:52:15'),
(342, 'english', 'Max users allowed', '2015-08-26 00:52:15'),
(343, 'english', 'Meeting duration', '2015-08-26 00:52:15'),
(344, 'english', 'You can''t create any more rooms', '2015-08-26 00:52:15'),
(345, 'english', 'No available rooms', '2015-08-26 00:52:15'),
(346, 'english', 'Videoconference available rooms', '2015-08-26 00:52:15'),
(347, 'english', 'Available rooms list', '2015-08-26 00:52:15'),
(348, 'english', 'Activate accessibility features', '2015-08-26 00:52:15'),
(349, 'english', 'Configuration of "allow_url_fopen"', '2015-08-26 00:52:15'),
(350, 'english', 'Configuration of "allow_url_include"', '2015-08-26 00:52:15'),
(351, 'english', 'forma.lms <abbr title="Application Programming Interface">API</abbr>', '2015-08-26 00:52:15'),
(352, 'english', 'forma.lms <abbr title="Application Programming Interface">API</abbr> and <abbr title="Single Sign On">SSO</abbr>', '2015-08-26 00:52:15'),
(353, 'english', 'Ask for a code created through the code module', '2015-08-26 00:52:15'),
(354, 'english', 'Ask for a tree code chosen by the user from a list in a dropdown menu', '2015-08-26 00:52:15'),
(355, 'english', 'Ask for a tree code that must be entered manually by the user', '2015-08-26 00:52:15'),
(356, 'english', 'Ask for a combination of tree code and course code that must be entered manually by the user. Tree and course code must be composed of 10 characters each, in order to obtain a 20 characters code.', '2015-08-26 00:52:15'),
(357, 'english', 'Max Audio users', '2015-08-26 00:52:15'),
(358, 'english', 'Max users per room', '2015-08-26 00:52:15'),
(359, 'english', 'Max rooms', '2015-08-26 00:52:15'),
(360, 'english', 'Moderator Password BigBlueButton', '2015-08-26 00:52:15'),
(361, 'english', 'Viewer Password BigBlueButton', '2015-08-26 00:52:15'),
(362, 'english', 'BigBlueButton Port', '2015-08-26 00:52:15'),
(363, 'english', 'Salt BigBlueButton', '2015-08-26 00:52:15'),
(364, 'english', 'Server address BigBlueButton', '2015-08-26 00:52:15'),
(365, 'english', 'Username BigBlueButton', '2015-08-26 00:52:15'),
(366, 'english', 'Customer code', '2015-08-26 00:52:15'),
(367, 'english', 'Unify admin and public sessions', '2015-08-26 00:52:15'),
(368, 'english', 'Limit for the number of conferences that can be planned by a single user', '2015-08-26 00:52:15'),
(369, 'english', 'Configurations', '2015-08-26 00:52:15'),
(370, 'english', 'ATTENTION: without double opt-in user''s email won''t be checked. You may be subject to spam registrations.', '2015-08-26 00:52:15'),
(371, 'english', 'Common', '2015-08-26 00:52:15'),
(372, 'english', 'E-Learning', '2015-08-26 00:52:15'),
(373, 'english', 'Show catalogue in home page', '2015-08-26 00:52:15'),
(374, 'english', 'Limit for the maximum total size of contents uploaded into the course (MB)', '2015-08-26 00:52:15'),
(375, 'english', 'Currency symbol (will be displayed at user side)', '2015-08-26 00:52:15'),
(376, 'english', 'Help Desk Email', '2015-08-26 00:52:15'),
(377, 'english', 'Help Desk Subject Prefix', '2015-08-26 00:52:15'),
(378, 'english', 'Debug options', '2015-08-26 00:52:15'),
(379, 'english', 'Default template', '2015-08-26 00:52:15'),
(380, 'english', 'Max Audio users', '2015-08-26 00:52:15'),
(381, 'english', 'Max users per room', '2015-08-26 00:52:15'),
(382, 'english', 'Max rooms', '2015-08-26 00:52:15'),
(383, 'english', 'Password', '2015-08-26 00:52:15'),
(384, 'english', 'DimDim Port', '2015-08-26 00:52:15'),
(385, 'english', 'DimDim server address', '2015-08-26 00:52:15'),
(386, 'english', 'DimDim username', '2015-08-26 00:52:15'),
(387, 'english', 'DOM XML status', '2015-08-26 00:52:15'),
(388, 'english', 'Don''t show', '2015-08-26 00:52:15'),
(389, 'english', 'Enable debug information', '2015-08-26 00:52:15'),
(390, 'english', 'E-Commerce', '2015-08-26 00:52:15'),
(391, 'english', 'Whitelist permitted file extensions', '2015-08-26 00:52:15'),
(392, 'english', 'Show "course catalog" as user main page', '2015-08-26 00:52:15'),
(393, 'english', 'Show forum list in a table', '2015-08-26 00:52:15'),
(394, 'english', 'Error in FTP', '2015-08-26 00:52:15'),
(395, 'english', 'FTP OK', '2015-08-26 00:52:15'),
(396, 'english', 'Code provided by Google', '2015-08-26 00:52:15'),
(397, 'english', 'Enable Google Analytics', '2015-08-26 00:52:15'),
(398, 'english', 'Limit, in hours, for the expiration of the subscription request', '2015-08-26 00:52:15'),
(399, 'english', 'Visual HTML text editor', '2015-08-26 00:52:15'),
(400, 'english', 'Allow administrator media management in the editor', '2015-08-26 00:52:15'),
(401, 'english', 'Allow super-administrator media management in the editor', '2015-08-26 00:52:15'),
(402, 'english', 'Allow user media management in the editor', '2015-08-26 00:52:15'),
(403, 'english', 'Shows, in the results area of the content library searches, also objects not directly available to the user.', '2015-08-26 00:52:15'),
(404, 'english', 'Show, in the results of the content library searches, also objects that aren''t fully categorized.', '2015-08-26 00:52:15'),
(405, 'english', 'Activate language editing (used for debugging)', '2015-08-26 00:52:15'),
(406, 'english', 'First Name and Last Name are required in order to register', '2015-08-26 00:52:15'),
(407, 'english', 'LDAP', '2015-08-26 00:52:15'),
(408, 'english', 'LDAP port (usually 389)', '2015-08-26 00:52:15'),
(409, 'english', 'LDAP server', '2015-08-26 00:52:15'),
(410, 'english', 'Activate LDAP authentication', '2015-08-26 00:52:15'),
(411, 'english', 'Username for LDAP users, use $user for the username.<br />Ex. $user@domain2.domain1 (for: W2k3)', '2015-08-26 00:52:15'),
(412, 'english', 'Configuration of "magic_quotes_gpc"', '2015-08-26 00:52:15'),
(413, 'english', 'Registrations and Lost passwords email sender', '2015-08-26 00:52:15'),
(414, 'english', 'Maintenance mode', '2015-08-26 00:52:15'),
(415, 'english', 'Maintenance Password', '2015-08-26 00:52:15'),
(416, 'english', 'Main options', '2015-08-26 00:52:15'),
(417, 'english', 'If one of the registration code options above are enabled, users are forced to enter the registration code (the code field must be filled in)', '2015-08-26 00:52:15'),
(418, 'english', 'Configuration of "max_execution_time"', '2015-08-26 00:52:15'),
(419, 'english', 'Maximum number of consecutively failed login attempts (0 = no limit)', '2015-08-26 00:52:15'),
(420, 'english', 'Mysql Collation', '2015-08-26 00:52:15'),
(421, 'english', 'Mysql Encoding', '2015-08-26 00:52:15'),
(422, 'english', 'Sql mode', '2015-08-26 00:52:15'),
(423, 'english', 'Mysql Timezone', '2015-08-26 00:52:15'),
(424, 'english', 'MySQL version', '2015-08-26 00:52:15'),
(425, 'english', 'Pause between blocks (seconds)', '2015-08-26 00:52:15'),
(426, 'english', 'Send newsletter messages in blocks of', '2015-08-26 00:52:15'),
(427, 'english', 'With domxml OFF, the scorm module, language management and videconferencing will not work', '2015-08-26 00:52:15'),
(428, 'english', 'Use "no answer" option in poll questions', '2015-08-26 00:52:15'),
(429, 'english', 'Use "no answer" option in test questions', '2015-08-26 00:52:15'),
(430, 'english', 'If not a single course catalog is assigned to a user, show all the courses and curricula', '2015-08-26 00:52:15'),
(431, 'english', 'Send user to catalog if enrolled in any course', '2015-08-26 00:52:15'),
(432, 'english', 'Php extension php_openssl', '2015-08-26 00:52:15'),
(433, 'english', 'Organization name for the conference', '2015-08-26 00:52:15'),
(434, 'english', 'Site owner', '2015-08-26 00:52:15'),
(435, 'english', 'Page title (will appear in the user''s browser)', '2015-08-26 00:52:15'),
(436, 'english', 'Password must be composed of letters and numbers', '2015-08-26 00:52:15'),
(437, 'english', 'Force users to change their password at the first login', '2015-08-26 00:52:15'),
(438, 'english', 'Password validity, max number of days the password will be valid (0 for unlimited)', '2015-08-26 00:52:15'),
(439, 'english', 'Password length, minimum number of characters', '2015-08-26 00:52:15'),
(440, 'english', 'File uploads path', '2015-08-26 00:52:15'),
(441, 'english', 'Save Path for the files uploaded in the chat shared files', '2015-08-26 00:52:15'),
(442, 'english', 'Save Path for the files uploaded in the course info', '2015-08-26 00:52:15'),
(443, 'english', 'Save path for additional fields', '2015-08-26 00:52:15'),
(444, 'english', 'Save Path for the files uploaded as forum attachment', '2015-08-26 00:52:15'),
(445, 'english', 'Save Path for the files uploaded in the upload files', '2015-08-26 00:52:15'),
(446, 'english', 'Save Path for files uploaded as message attachments', '2015-08-26 00:52:15'),
(447, 'english', 'Users photos and avatars', '2015-08-26 00:52:15'),
(448, 'english', 'Save Path for files uploaded in project manager', '2015-08-26 00:52:15'),
(449, 'english', 'Save Path for files uploaded as SCORM Learning Object', '2015-08-26 00:52:15'),
(450, 'english', 'Sponsor banners', '2015-08-26 00:52:15'),
(451, 'english', 'Question "file upload"', '2015-08-26 00:52:15'),
(452, 'english', 'Paypal currency code', '2015-08-26 00:52:15'),
(453, 'english', 'Paypal Account', '2015-08-26 00:52:15'),
(454, 'english', 'Use paypal sandbox instead of the real environment (this is a debug and testing option)', '2015-08-26 00:52:15'),
(455, 'english', 'Info about PHP', '2015-08-26 00:52:15'),
(456, 'english', 'PHP version', '2015-08-26 00:52:15'),
(457, 'english', 'Site Timezone', '2015-08-26 00:52:15'),
(458, 'english', 'Configuration of "post_max_size"', '2015-08-26 00:52:15'),
(459, 'english', 'Privacy policy MUST be accepted', '2015-08-26 00:52:15'),
(460, 'english', 'Limit user to change just his password (deactivate extended profile)', '2015-08-26 00:52:15'),
(461, 'english', 'Keep a record of all the deleted users', '2015-08-26 00:52:15'),
(462, 'english', 'Configuration of "register_global"', '2015-08-26 00:52:15'),
(463, 'english', 'Registration type', '2015-08-26 00:52:15'),
(464, 'english', 'Only by administrator', '2015-08-26 00:52:15'),
(465, 'english', 'Moderated self registration', '2015-08-26 00:52:15'),
(466, 'english', 'Free self registration', '2015-08-26 00:52:15'),
(467, 'english', 'Free registration with double opt-in', '2015-08-26 00:52:15'),
(468, 'english', 'Registration code usage', '2015-08-26 00:52:15'),
(469, 'english', 'At the login the user is prompted to fill in the mandatory fields related to his profile.', '2015-08-26 00:52:15'),
(470, 'english', 'Authorization API Key', '2015-08-26 00:52:15'),
(471, 'english', 'Authorization API Secret key', '2015-08-26 00:52:15'),
(472, 'english', 'Single code for platform', '2015-08-26 00:52:15'),
(473, 'english', 'Generated token will expire after (minutes)', '2015-08-26 00:52:15'),
(474, 'english', 'Authentication method:', '2015-08-26 00:52:15'),
(475, 'english', 'Authorization Secret Key', '2015-08-26 00:52:15'),
(476, 'english', 'Token generation at every connection', '2015-08-26 00:52:15'),
(477, 'english', 'Refresh token lifetime at every API call', '2015-08-26 00:52:15'),
(478, 'english', '"safe_mode" configuration', '2015-08-26 00:52:15'),
(479, 'english', 'Yes, only if the max number is reached', '2015-08-26 00:52:15'),
(480, 'english', 'Yes, for all', '2015-08-26 00:52:15'),
(481, 'english', 'Save info about failed login attempts', '2015-08-26 00:52:15'),
(482, 'english', 'Allow the usage of direct link from external sources to scorm chaperts (sco and asset)', '2015-08-26 00:52:15'),
(483, 'english', 'Security related', '2015-08-26 00:52:15'),
(484, 'english', 'Sender email address for alert messages', '2015-08-26 00:52:15'),
(485, 'english', 'Add the following address as Cc for all the email sent by the platform', '2015-08-26 00:52:15'),
(486, 'english', 'Server configuration', '2015-08-26 00:52:15'),
(487, 'english', 'Server address', '2015-08-26 00:52:15'),
(488, 'english', 'Server admin mail', '2015-08-26 00:52:15'),
(489, 'english', 'MySQL information', '2015-08-26 00:52:15'),
(490, 'english', 'Server name', '2015-08-26 00:52:15'),
(491, 'english', 'Server port', '2015-08-26 00:52:15'),
(492, 'english', 'Server software', '2015-08-26 00:52:15'),
(493, 'english', 'Enable IP control within sessions (user can''t change IP after login)', '2015-08-26 00:52:15'),
(494, 'english', 'Show in block', '2015-08-26 00:52:15'),
(495, 'english', 'Show as link list', '2015-08-26 00:52:15'),
(496, 'english', 'Sms', '2015-08-26 00:52:15'),
(497, 'english', 'In association with smsmarket.it', '2015-08-26 00:52:15'),
(498, 'english', 'Buy more SMSes', '2015-08-26 00:52:15'),
(499, 'english', 'Cell phone number field', '2015-08-26 00:52:15'),
(500, 'english', 'Credit left', '2015-08-26 00:52:15'),
(501, 'english', 'Credit will be updated when you will send a further SMS.', '2015-08-26 00:52:15'),
(502, 'english', 'Gateway 1', '2015-08-26 00:52:15'),
(503, 'english', 'Gateway 2', '2015-08-26 00:52:15'),
(504, 'english', 'Gateway 3', '2015-08-26 00:52:15'),
(505, 'english', 'Gateway 4', '2015-08-26 00:52:15'),
(506, 'english', 'Automatic', '2015-08-26 00:52:15'),
(507, 'english', 'Gateway host address', '2015-08-26 00:52:15'),
(508, 'english', 'Select gateway', '2015-08-26 00:52:15'),
(509, 'english', 'Gateway password', '2015-08-26 00:52:15'),
(510, 'english', 'Port number', '2015-08-26 00:52:15'),
(511, 'english', 'Gateway username', '2015-08-26 00:52:15'),
(512, 'english', 'Default international prefix', '2015-08-26 00:52:15'),
(513, 'english', 'SMS sender', '2015-08-26 00:52:15'),
(514, 'english', 'Social Functions', '2015-08-26 00:52:15'),
(515, 'english', 'Use Facebook interfacing and Single Sign On', '2015-08-26 00:52:15'),
(516, 'english', 'Facebook API code', '2015-08-26 00:52:15'),
(517, 'english', 'Facebook secret code', '2015-08-26 00:52:15'),
(518, 'english', 'Use Google interfacing and Single Sign On <br/>(use redirect uri: http://server/path/index.php?modname=login&op=google_login)', '2015-08-26 00:52:15'),
(519, 'english', 'Google Client Id', '2015-08-26 00:52:15'),
(520, 'english', 'Google secret code', '2015-08-26 00:52:15'),
(521, 'english', 'Linkedin API access code', '2015-08-26 00:52:15'),
(522, 'english', 'Use Linkedin interfacing and Single Sign On', '2015-08-26 00:52:15'),
(523, 'english', 'Linkedin secret code', '2015-08-26 00:52:15'),
(524, 'english', 'Use Twitter interfacing and Single Sign On', '2015-08-26 00:52:15'),
(525, 'english', 'Twitter consumer code', '2015-08-26 00:52:15'),
(526, 'english', 'Twitter secret code', '2015-08-26 00:52:15'),
(527, 'english', '<abbr title="Single Sign On">SSO</abbr> secret for the token hash', '2015-08-26 00:52:15'),
(528, 'english', 'Enable <abbr title="Single Sign On">SSO</abbr> with a third party software through a token', '2015-08-26 00:52:15'),
(529, 'english', 'Disable simultaneous access with the same username', '2015-08-26 00:52:15'),
(530, 'english', 'Courses sorting order in "My courses"', '2015-08-26 00:52:15'),
(531, 'english', 'Max users per room', '2015-08-26 00:52:15'),
(532, 'english', 'Max rooms', '2015-08-26 00:52:15'),
(533, 'english', 'Domain Template assignment', '2015-08-26 00:52:15'),
(534, 'english', 'Allow user tracking (Recommended: yes)', '2015-08-26 00:52:15'),
(535, 'english', 'Session lifetime', '2015-08-26 00:52:15'),
(536, 'english', 'FTP connection', '2015-08-26 00:52:15'),
(537, 'english', 'Configuration of "upload_max_filesize"', '2015-08-26 00:52:15'),
(538, 'english', 'Website URL with final /', '2015-08-26 00:52:15'),
(539, 'english', 'URL for check-in', '2015-08-26 00:52:15'),
(540, 'english', 'URL for videoconference', '2015-08-26 00:52:15'),
(541, 'english', 'Consider this parameter only if you need to authenticate through LDAP', '2015-08-26 00:52:15'),
(542, 'english', 'Ask the user to choose a password different from the last X used passwords', '2015-08-26 00:52:15'),
(543, 'english', 'Disk quota (in MB) for each user''s My Files area', '2015-08-26 00:52:15'),
(544, 'english', 'Use advanced registration form', '2015-08-26 00:52:15'),
(545, 'english', 'Use DimDim Api instead of url interfacing', '2015-08-26 00:52:15'),
(546, 'english', 'Enable the API functionality', '2015-08-26 00:52:15'),
(547, 'english', 'Enable tags feature inside the forums.', '2015-08-26 00:52:15'),
(548, 'english', 'Attention without these settings the social login will not work', '2015-08-26 00:52:15'),
(549, 'english', 'Add file', '2015-08-26 00:52:15'),
(550, 'english', 'Add new file', '2015-08-26 00:52:15'),
(551, 'english', 'Enroll users in this course', '2015-08-26 00:52:15'),
(552, 'english', 'There is [advice] new advice', '2015-08-26 00:52:15'),
(553, 'english', 'There are [forum] new messages in the forum', '2015-08-26 00:52:15'),
(554, 'english', 'There are [lobj] new learning objects', '2015-08-26 00:52:15'),
(555, 'english', 'Allow overbooking', '2015-08-26 00:52:15'),
(556, 'english', 'All open', '2015-08-26 00:52:15'),
(557, 'english', 'Assign for any user''s status', '2015-08-26 00:52:15'),
(558, 'english', 'Assign for users that have  completed the course', '2015-08-26 00:52:15'),
(559, 'english', 'Assign for users that are attending the course', '2015-08-26 00:52:15'),
(560, 'english', 'Assign a new menu to the course', '2015-08-26 00:52:15'),
(561, 'english', 'Registration code', '2015-08-26 00:52:15'),
(562, 'english', 'Back to the admin area', '2015-08-26 00:52:15'),
(563, 'english', 'Allowed to buy this course', '2015-08-26 00:52:15'),
(564, 'english', 'Subscribe', '2015-08-26 00:52:15'),
(565, 'english', 'Copy changes also to editions', '2015-08-26 00:52:15'),
(566, 'english', 'You are in', '2015-08-26 00:52:15'),
(567, 'english', 'Selected category', '2015-08-26 00:52:15'),
(568, 'english', 'Certificate assignment', '2015-08-26 00:52:15'),
(569, 'english', 'Certificate assignment for Excellence', '2015-08-26 00:52:15'),
(570, 'english', 'Certificate language', '2015-08-26 00:52:15'),
(571, 'english', 'Certificate', '2015-08-26 00:52:15'),
(572, 'english', 'Number of released certificates', '2015-08-26 00:52:15'),
(573, 'english', 'Classroom -> Course association', '2015-08-26 00:52:15'),
(574, 'english', 'Classrooms/Editions', '2015-08-26 00:52:15'),
(575, 'english', 'Warning: some classrooms are already occupied by other courses', '2015-08-26 00:52:15'),
(576, 'english', 'Class occupied', '2015-08-26 00:52:15'),
(577, 'english', 'Your data will be saved.', '2015-08-26 00:52:15'),
(578, 'english', 'Copy subscriptions to course', '2015-08-26 00:52:15'),
(579, 'english', 'Advance payment %', '2015-08-26 00:52:15'),
(580, 'english', 'Code for the automatic subscription to a course', '2015-08-26 00:52:15'),
(581, 'english', 'Available courses', '2015-08-26 00:52:15'),
(582, 'english', 'Course duration: from <b>[date_begin]</b> to <b>[date_end]</b>.', '2015-08-26 00:52:15'),
(583, 'english', 'Demo material', '2015-08-26 00:52:15'),
(584, 'english', 'Display mode options', '2015-08-26 00:52:15'),
(585, 'english', 'Does the course contain editions?', '2015-08-26 00:52:15'),
(586, 'english', 'Automatic after completing the end course LO', '2015-08-26 00:52:15'),
(587, 'english', 'Manual teacher action', '2015-08-26 00:52:15'),
(588, 'english', 'Completion mode', '2015-08-26 00:52:15'),
(589, 'english', 'Course is: <b>[course_type]</b> with: <b>[enrolled]</b> users subscribed', '2015-08-26 00:52:15'),
(590, 'english', 'Course is: <b>[course_type]</b> with: <b>[enrolled]</b> out of a maximum of: <b>[max_subscribe]</b> subscribed users. Course is: <b>[course_status]</b>', '2015-08-26 00:52:15'),
(591, 'english', 'Course language', '2015-08-26 00:52:15'),
(592, 'english', 'This is a list with all the courses to which the user subscribed and other relevant information', '2015-08-26 00:52:15'),
(593, 'english', 'Course logo', '2015-08-26 00:52:15'),
(594, 'english', 'Assign the menu', '2015-08-26 00:52:15'),
(595, 'english', 'Price', '2015-08-26 00:52:15'),
(596, 'english', 'Assign disk space limit to this course (MB)', '2015-08-26 00:52:15'),
(597, 'english', 'Select course', '2015-08-26 00:52:15'),
(598, 'english', 'Sell course', '2015-08-26 00:52:15'),
(599, 'english', 'Special options', '2015-08-26 00:52:15'),
(600, 'english', 'Deny access to this course if the user status is', '2015-08-26 00:52:15'),
(601, 'english', 'Course subscription', '2015-08-26 00:52:15'),
(602, 'english', 'Enrollment policy', '2015-08-26 00:52:15'),
(603, 'english', 'Only admin', '2015-08-26 00:52:15'),
(604, 'english', 'On approval', '2015-08-26 00:52:15'),
(605, 'english', 'Subscription through secret code', '2015-08-26 00:52:15'),
(606, 'english', 'Course instructors', '2015-08-26 00:52:15'),
(607, 'english', 'Time options', '2015-08-26 00:52:15'),
(608, 'english', 'Course type', '2015-08-26 00:52:15'),
(609, 'english', 'Blended', '2015-08-26 00:52:15'),
(610, 'english', 'E-Learning with editions', '2015-08-26 00:52:15'),
(611, 'english', 'E-Learning', '2015-08-26 00:52:15'),
(612, 'english', 'Subscribed users', '2015-08-26 00:52:15'),
(613, 'english', 'Active since', '2015-08-26 00:52:15'),
(614, 'english', 'Available', '2015-08-26 00:52:15'),
(615, 'english', 'Cancelled', '2015-08-26 00:52:15'),
(616, 'english', 'Concluded', '2015-08-26 00:52:15'),
(617, 'english', 'Confirmed', '2015-08-26 00:52:15'),
(618, 'english', 'Under construction', '2015-08-26 00:52:15'),
(619, 'english', 'Days of validity', '2015-08-26 00:52:15'),
(620, 'english', 'Show demo', '2015-08-26 00:52:15'),
(621, 'english', 'Directly play the first learning object in the player', '2015-08-26 00:52:15'),
(622, 'english', 'Documents upload', '2015-08-26 00:52:15'),
(623, 'english', 'Don''t show', '2015-08-26 00:52:15'),
(624, 'english', 'Show material', '2015-08-26 00:52:15'),
(625, 'english', 'start on <b>[date_begin]</b> and end on <b>[date_end]</b>', '2015-08-26 00:52:15'),
(626, 'english', 'Object marked as final', '2015-08-26 00:52:15'),
(627, 'english', 'Access to this course has expired', '2015-08-26 00:52:15'),
(628, 'english', 'This course will expire in <b>[expiring_in]</b> days', '2015-08-26 00:52:15'),
(629, 'english', 'No files have been specified', '2015-08-26 00:52:15'),
(630, 'english', 'Flat view', '2015-08-26 00:52:15'),
(631, 'english', 'Choose a course', '2015-08-26 00:52:15'),
(632, 'english', 'Generate new codes', '2015-08-26 00:52:15'),
(633, 'english', 'Subscription OK', '2015-08-26 00:52:15'),
(634, 'english', 'Starting hour', '2015-08-26 00:52:15'),
(635, 'english', 'Ending hour', '2015-08-26 00:52:15'),
(636, 'english', 'If you specify a new file, the previous one will be overwritten', '2015-08-26 00:52:15'),
(637, 'english', 'Import subscriptions from a course', '2015-08-26 00:52:15'),
(638, 'english', 'Subscribe users imported from file', '2015-08-26 00:52:15'),
(639, 'english', 'Course', '2015-08-26 00:52:15'),
(640, 'english', 'Inherit disk quota from standard settings', '2015-08-26 00:52:15'),
(641, 'english', 'You are in', '2015-08-26 00:52:15'),
(642, 'english', 'in classroom <b>[classrooms_name]</b> in building <b>[classrooms_location]</b>.', '2015-08-26 00:52:15'),
(643, 'english', 'Hide info', '2015-08-26 00:52:15'),
(644, 'english', 'Main category', '2015-08-26 00:52:15'),
(645, 'english', 'Selected by instructor', '2015-08-26 00:52:15'),
(646, 'english', 'Course material', '2015-08-26 00:52:15'),
(647, 'english', 'Course file', '2015-08-26 00:52:15'),
(648, 'english', 'Max number of subscriptions', '2015-08-26 00:52:15'),
(649, 'english', 'Max budget for SMS', '2015-08-26 00:52:15'),
(650, 'english', 'Average', '2015-08-26 00:52:15'),
(651, 'english', 'Average completion time', '2015-08-26 00:52:15'),
(652, 'english', 'Average time for course', '2015-08-26 00:52:15'),
(653, 'english', 'Minimum number of subscription (0 = unlimited)', '2015-08-26 00:52:15'),
(654, 'english', 'Please enter a valid min score', '2015-08-26 00:52:15'),
(655, 'english', 'Minimum number of subscribed students allowed is <b>[min_subscribe]</b>', '2015-08-26 00:52:15'),
(656, 'english', 'Multiple subscriptions', '2015-08-26 00:52:15'),
(657, 'english', 'My certificates', '2015-08-26 00:52:15'),
(658, 'english', 'User is waiting at [url]', '2015-08-26 00:52:15'),
(659, 'english', 'Waiting for activation', '2015-08-26 00:52:15'),
(660, 'english', 'Access denied', '2015-08-26 00:52:15'),
(661, 'english', 'No course found', '2015-08-26 00:52:15'),
(662, 'english', 'Other options', '2015-08-26 00:52:15'),
(663, 'english', 'Material for other roles', '2015-08-26 00:52:16'),
(664, 'english', 'Session time', '2015-08-26 00:52:16'),
(665, 'english', 'Pause start', '2015-08-26 00:52:16'),
(666, 'english', 'Pause end', '2015-08-26 00:52:16'),
(667, 'english', 'Complete course method', '2015-08-26 00:52:16'),
(668, 'english', 'Objects', '2015-08-26 00:52:16'),
(669, 'english', 'Completed', '2015-08-26 00:52:16'),
(670, 'english', 'Failed', '2015-08-26 00:52:16'),
(671, 'english', 'Not completed', '2015-08-26 00:52:16'),
(672, 'english', 'Passed', '2015-08-26 00:52:16'),
(673, 'english', 'Objects: [total], passed: [complete], failed: [failed]', '2015-08-26 00:52:16'),
(674, 'english', 'You can''t upload any further files because the disk space for this course is full', '2015-08-26 00:52:16'),
(675, 'english', 'Generate random code for self-registration', '2015-08-26 00:52:16'),
(676, 'english', 'Reserve course', '2015-08-26 00:52:16'),
(677, 'english', 'Everyone, and show on home page', '2015-08-26 00:52:16'),
(678, 'english', 'Only users subscribed to the course', '2015-08-26 00:52:16'),
(679, 'english', 'Only for logged in users', '2015-08-26 00:52:16'),
(680, 'english', 'Unsubscribe from the course', '2015-08-26 00:52:16'),
(681, 'english', 'Advanced course info', '2015-08-26 00:52:16'),
(682, 'english', 'Show only number of connected users, but don''t use Instant Messenger', '2015-08-26 00:52:16'),
(683, 'english', 'Demo', '2015-08-26 00:52:16'),
(684, 'english', 'Show Instant Messenger', '2015-08-26 00:52:16'),
(685, 'english', 'Show progress', '2015-08-26 00:52:16'),
(686, 'english', 'Show time', '2015-08-26 00:52:16'),
(687, 'english', 'Select levels of users shown on information course page', '2015-08-26 00:52:16'),
(688, 'english', 'Users online in this course', '2015-08-26 00:52:16'),
(689, 'english', 'Sponsored by', '2015-08-26 00:52:16'),
(690, 'english', 'Link to the sponsor', '2015-08-26 00:52:16'),
(691, 'english', 'Logo', '2015-08-26 00:52:16'),
(692, 'english', 'Status not allowed to enter the course', '2015-08-26 00:52:16'),
(693, 'english', 'Already subscribed to the course', '2015-08-26 00:52:16'),
(694, 'english', 'Subscribe method', '2015-08-26 00:52:16'),
(695, 'english', 'Subscription', '2015-08-26 00:52:16'),
(696, 'english', 'Subscriptions are closed', '2015-08-26 00:52:16'),
(697, 'english', 'Subscription successfull', '2015-08-26 00:52:16'),
(698, 'english', 'From', '2015-08-26 00:52:16'),
(699, 'english', 'To', '2015-08-26 00:52:16'),
(700, 'english', 'Error during subscription', '2015-08-26 00:52:16'),
(701, 'english', 'Subscription is available during the following period', '2015-08-26 00:52:16'),
(702, 'english', 'Subscriptions are open', '2015-08-26 00:52:16'),
(703, 'english', 'You have asked to buy the course: <b>[name]</b><br />\nIn order to proceed, you must log in to the platform if you are already registered.<br />\nOtherwise, you must register in our system, following this link: <br />\n<br />\n<a href="[link_register]">Register me</a>', '2015-08-26 00:52:16'),
(704, 'english', 'Teachers:', '2015-08-26 00:52:16'),
(705, 'english', 'Go to the content of', '2015-08-26 00:52:16'),
(706, 'english', 'Association of certificates to course', '2015-08-26 00:52:16'),
(707, 'english', 'You are attending this course', '2015-08-26 00:52:16'),
(708, 'english', 'Confirmed', '2015-08-26 00:52:16'),
(709, 'english', 'You have completed this course', '2015-08-26 00:52:16'),
(710, 'english', 'Reserved', '2015-08-26 00:52:16'),
(711, 'english', 'You didn''t start to attend this course yet', '2015-08-26 00:52:16'),
(712, 'english', 'No disk space limit', '2015-08-26 00:52:16'),
(713, 'english', 'Unsubscribe date limit', '2015-08-26 00:52:16'),
(714, 'english', 'Unsubscribe requests', '2015-08-26 00:52:16'),
(715, 'english', 'Unsubscribe request waiting for approval', '2015-08-26 00:52:16'),
(716, 'english', 'Disk space used for this couse', '2015-08-26 00:52:16'),
(717, 'english', 'User waiting for approval', '2015-08-26 00:52:16'),
(718, 'english', 'Can the user subscribe?', '2015-08-26 00:52:16'),
(719, 'english', 'Auto - unsubscribe', '2015-08-26 00:52:16'),
(720, 'english', 'There are now <b>[user_count]</b> users subscribed and <b>[waiting_count]</b> waiting.', '2015-08-26 00:52:16'),
(721, 'english', ', your level is <b>[level]</b>', '2015-08-26 00:52:16'),
(722, 'english', 'Material for users', '2015-08-26 00:52:16'),
(723, 'english', 'Select', '2015-08-26 00:52:16'),
(724, 'english', 'Show course logo in course list', '2015-08-26 00:52:16'),
(725, 'english', 'Bad', '2015-08-26 00:52:16'),
(726, 'english', 'Give to this course a negative evaluation', '2015-08-26 00:52:16'),
(727, 'english', 'Good', '2015-08-26 00:52:16'),
(728, 'english', 'Give to this course a positive evaluation', '2015-08-26 00:52:16'),
(729, 'english', 'In progress', '2015-08-26 00:52:16'),
(730, 'english', 'Welcome', '2015-08-26 00:52:16'),
(731, 'english', 'Show on course interface', '2015-08-26 00:52:16'),
(732, 'english', 'Show course to:', '2015-08-26 00:52:16'),
(733, 'english', 'Online users', '2015-08-26 00:52:16');
INSERT INTO `core_lang_translation` (`id_text`, `lang_code`, `translation_text`, `save_date`) VALUES
(734, 'english', 'Del. subscr.', '2015-08-26 00:52:16'),
(735, 'english', 'Do you really want to remove the course from this curriculum?', '2015-08-26 00:52:16'),
(736, 'english', 'Available curricula', '2015-08-26 00:52:16'),
(737, 'english', 'Courses included in this curricula', '2015-08-26 00:52:16'),
(738, 'english', 'Subscription method', '2015-08-26 00:52:16'),
(739, 'english', 'Only admin', '2015-08-26 00:52:16'),
(740, 'english', 'Moderate', '2015-08-26 00:52:16'),
(741, 'english', 'Current Activity', '2015-08-26 00:52:16'),
(742, 'english', 'Import courses in curricula', '2015-08-26 00:52:16'),
(743, 'english', 'User currently subscribed', '2015-08-26 00:52:16'),
(744, 'english', 'Information about the selected activities', '2015-08-26 00:52:16'),
(745, 'english', 'New activity', '2015-08-26 00:52:16'),
(746, 'english', 'Add new activity', '2015-08-26 00:52:16'),
(747, 'english', 'Add Scorm Results', '2015-08-26 00:52:16'),
(748, 'english', 'Right answer', '2015-08-26 00:52:16'),
(749, 'english', 'Test for this course', '2015-08-26 00:52:16'),
(750, 'english', 'This is the list of all the tests for this course and the results for the students', '2015-08-26 00:52:16'),
(751, 'english', 'Save stats', '2015-08-26 00:52:16'),
(752, 'english', 'Left', '2015-08-26 00:52:16'),
(753, 'english', 'Move left', '2015-08-26 00:52:16'),
(754, 'english', 'Move right', '2015-08-26 00:52:16'),
(755, 'english', 'Not checked', '2015-08-26 00:52:16'),
(756, 'english', 'Not passed', '2015-08-26 00:52:16'),
(757, 'english', 'of the user', '2015-08-26 00:52:16'),
(758, 'english', 'Passed', '2015-08-26 00:52:16'),
(759, 'english', 'Percentage of correct answers', '2015-08-26 00:52:16'),
(760, 'english', 'Answered questions', '2015-08-26 00:52:16'),
(761, 'english', 'Re-calculate', '2015-08-26 00:52:16'),
(762, 'english', 'Re-calculate score', '2015-08-26 00:52:16'),
(763, 'english', 'The required score must be smaller than the max score', '2015-08-26 00:52:16'),
(764, 'english', 'Delete test track', '2015-08-26 00:52:16'),
(765, 'english', 'Right', '2015-08-26 00:52:16'),
(766, 'english', 'Round final score', '2015-08-26 00:52:16'),
(767, 'english', 'Round', '2015-08-26 00:52:16'),
(768, 'english', 'Round', '2015-08-26 00:52:16'),
(769, 'english', 'Show answer', '2015-08-26 00:52:16'),
(770, 'english', 'Show to user', '2015-08-26 00:52:16'),
(771, 'english', 'Standard deviation', '2015-08-26 00:52:16'),
(772, 'english', 'Students', '2015-08-26 00:52:16'),
(773, 'english', 'Student''s scores', '2015-08-26 00:52:16'),
(774, 'english', 'Evaluation summary', '2015-08-26 00:52:16'),
(775, 'english', 'Stats for question "[title]"', '2015-08-26 00:52:16'),
(776, 'english', 'Percentage of correct answers for link "[title]"', '2015-08-26 00:52:16'),
(777, 'english', 'Percentage of correct answers after inserting text in phrase "[title]"', '2015-08-26 00:52:16'),
(778, 'english', 'Insert list for question "[title]"', '2015-08-26 00:52:16'),
(779, 'english', 'Information about the test', '2015-08-26 00:52:16'),
(780, 'english', 'Activity title', '2015-08-26 00:52:16'),
(781, 'english', 'Total questions', '2015-08-26 00:52:16'),
(782, 'english', 'Stats for test "[test]"', '2015-08-26 00:52:16'),
(783, 'english', 'Use for final score', '2015-08-26 00:52:16'),
(784, 'english', 'Weight', '2015-08-26 00:52:16'),
(785, 'english', 'Add new course', '2015-08-26 00:52:16'),
(786, 'english', '&gt;&gt; Back to "My course area"', '2015-08-26 00:52:16'),
(787, 'english', 'You have already used this code', '2015-08-26 00:52:16'),
(788, 'english', 'Code not correct', '2015-08-26 00:52:16'),
(789, 'english', 'Code', '2015-08-26 00:52:16'),
(790, 'english', 'This chart allows you to check the numbers of chapter seen by the users through the days.', '2015-08-26 00:52:16'),
(791, 'english', 'This chart gives you a view of all the chapters completed or passed per user.', '2015-08-26 00:52:16'),
(792, 'english', 'This chart gives you a view of all the chapters completed by the users in this course.', '2015-08-26 00:52:16'),
(793, 'english', 'There are no scorm packages in this course', '2015-08-26 00:52:16'),
(794, 'english', 'Object successfully completed', '2015-08-26 00:52:16'),
(795, 'english', 'This chart allows you to check the score acquired by the users in each scorm chapter.', '2015-08-26 00:52:16'),
(796, 'english', 'This chart allows you to check the time spent by the users inside each scorm chapter.', '2015-08-26 00:52:16'),
(797, 'english', 'Time', '2015-08-26 00:52:16'),
(798, 'english', 'Courses', '2015-08-26 00:52:16'),
(799, 'english', 'Help Desk', '2015-08-26 00:52:16'),
(800, 'english', '<!-- here you can put some help text -->', '2015-08-26 00:52:16'),
(801, 'english', 'Active courses', '2015-08-26 00:52:16'),
(802, 'english', 'Courses that will be activated within 7 days', '2015-08-26 00:52:16'),
(803, 'english', 'Administrator users', '2015-08-26 00:52:16'),
(804, 'english', 'Installed version', '2015-08-26 00:52:16'),
(805, 'english', 'Info about courses', '2015-08-26 00:52:16'),
(806, 'english', 'Welcome Page', '2015-08-26 00:52:16'),
(807, 'english', 'Courses that will be deactivated within 7 days', '2015-08-26 00:52:16'),
(808, 'english', 'Follow Us', '2015-08-26 00:52:16'),
(809, 'english', 'Inactive users (for at least one month)', '2015-08-26 00:52:16'),
(810, 'english', 'Last released version', '2015-08-26 00:52:16'),
(811, 'english', 'Download or generate certificate', '2015-08-26 00:52:16'),
(812, 'english', 'A new version is available for the download', '2015-08-26 00:52:16'),
(813, 'english', 'Online users', '2015-08-26 00:52:16'),
(814, 'english', '(New window)', '2015-08-26 00:52:16'),
(815, 'english', 'Quick <span>links</span>', '2015-08-26 00:52:16'),
(816, 'english', 'Users registered in the last 7 days', '2015-08-26 00:52:16'),
(817, 'english', 'Users registered today', '2015-08-26 00:52:16'),
(818, 'english', 'User registered yesterday', '2015-08-26 00:52:16'),
(819, 'english', 'Super-admin users', '2015-08-26 00:52:16'),
(820, 'english', 'forma.lms Online', '2015-08-26 00:52:16'),
(821, 'english', 'Suspended users', '2015-08-26 00:52:16'),
(822, 'english', 'Consulting site', '2015-08-26 00:52:16'),
(823, 'english', 'forma.lms support site', '2015-08-26 00:52:16'),
(824, 'english', 'Number of courses', '2015-08-26 00:52:16'),
(825, 'english', 'Number of subscriptions', '2015-08-26 00:52:16'),
(826, 'english', 'Registered users', '2015-08-26 00:52:16'),
(827, 'english', 'Error, while retrieving the last available version', '2015-08-26 00:52:16'),
(828, 'english', 'forma.lms Official Website', '2015-08-26 00:52:16'),
(829, 'english', 'forma.lms open source community', '2015-08-26 00:52:16'),
(830, 'english', 'Users info', '2015-08-26 00:52:16'),
(831, 'english', 'Waiting subscription', '2015-08-26 00:52:16'),
(832, 'english', 'New announcement', '2015-08-26 00:52:16'),
(833, 'english', 'A new announcement was published in the course "[course]"\n\nTitle: ''[title]''\n\n[text]\n\nYou can read it on forma.lms at URL <a href="[url]">[url]</a>', '2015-08-26 00:52:16'),
(834, 'english', 'Subscription request approved', '2015-08-26 00:52:16'),
(835, 'english', 'Your course subscrition request to [course] has been approved by the administrator. You can enter the course clicking the URL located in <a href="[url]">[url]</a>', '2015-08-26 00:52:16'),
(836, 'english', 'The administrator has confirmed your subscription request to <a href="[url]">[url]</a>', '2015-08-26 00:52:16'),
(837, 'english', 'Your account has been deleted', '2015-08-26 00:52:16'),
(838, 'english', 'Your account at <a href="[url]">[url]</a> with the username [userid] has been deleted', '2015-08-26 00:52:16'),
(839, 'english', 'Subscription request refused', '2015-08-26 00:52:16'),
(840, 'english', 'Your subscription requested for the course [course] has been refused by the administrator at <a href="[url]">[url]</a>', '2015-08-26 00:52:16'),
(841, 'english', 'The user account has been modified', '2015-08-26 00:52:16'),
(842, 'english', 'Your account at the site <a href="[url]">[url]</a>  has been modified:\n\nUsername: [userid]', '2015-08-26 00:52:16'),
(843, 'english', 'Your subscription has been changed', '2015-08-26 00:52:16'),
(844, 'english', 'Your subscription at the course [course] at the address <a href="[url]">[url]</a> has been changed', '2015-08-26 00:52:16'),
(845, 'english', 'New forum', '2015-08-26 00:52:16'),
(846, 'english', 'New forum added to the course ''[course]'' at the address <a href="[url]">[url]</a>\n\n Title: [title]\n [text]', '2015-08-26 00:52:16'),
(847, 'english', 'There is a new message in a thread that you are following\n [url] > [course] > [forum_title] > [thread_title]', '2015-08-26 00:52:16'),
(848, 'english', 'There is a new thread in\n\n<a href="[url]">[url]</a> > [course] > [forum_title]\n\n Title: [thread_title]', '2015-08-26 00:52:16'),
(849, 'english', 'New user was subscribed to a course', '2015-08-26 00:52:16'),
(850, 'english', 'At url : <a href="[url]">[url]</a> a new user was subscribed to the course : [course]', '2015-08-26 00:52:16'),
(851, 'english', 'User is waiting for course subscription approval', '2015-08-26 00:52:16'),
(852, 'english', 'New user subscribed to the ''[course]'' course and is waiting to be approved.\n\n<a href="[url]">[url]</a>', '2015-08-26 00:52:16'),
(853, 'english', 'User is waiting for course unsubscription approval', '2015-08-26 00:52:16'),
(854, 'english', '', '2015-08-26 00:52:16'),
(855, 'english', 'New user unsubscribed to the ''[course]'' course and is waiting to be approved.\n\n<a href="[url]">[url]</a>', '2015-08-26 00:52:16'),
(856, 'english', '', '2015-08-26 00:52:16'),
(857, 'english', 'and your password has been changed to: [password]', '2015-08-26 00:52:16'),
(858, 'english', 'User not approved', '2015-08-26 00:52:16'),
(859, 'english', 'The administrator of [url] has not approved your subscription request', '2015-08-26 00:52:16'),
(860, 'english', 'You are now registered in our system', '2015-08-26 00:52:16'),
(861, 'english', 'You are now registered in our system at <a href="[url]">[url]</a>\nwith this account:\n\nUsername: [userid]\nPassword: [password]', '2015-08-26 00:52:16'),
(862, 'english', 'Alert: New message in a thread', '2015-08-26 00:52:16'),
(863, 'english', 'Alert: new thread', '2015-08-26 00:52:16'),
(864, 'english', 'New user group subscription waiting for approval', '2015-08-26 00:52:16'),
(865, 'english', 'There is a new user subscription to a moderate group waiting for the approval at <a href="[url]">[url]</a>', '2015-08-26 00:52:16'),
(866, 'english', 'New user waiting for the approval', '2015-08-26 00:52:16'),
(867, 'english', 'New user is registered at [url] and awaiting your approval', '2015-08-26 00:52:16'),
(868, 'english', 'New user subscribed', '2015-08-26 00:52:16'),
(869, 'english', 'New user subscribed', '2015-08-26 00:52:16'),
(870, 'english', 'A user has completed the [course] course on forma.lms', '2015-08-26 00:52:16'),
(871, 'english', 'The user [user] completed the [course] course on forma.lms', '2015-08-26 00:52:16'),
(872, 'english', 'A user has completed the [course] course on forma.lms', '2015-08-26 00:52:16'),
(873, 'english', 'User is registered and waiting for your approval', '2015-08-26 00:52:16'),
(874, 'english', 'There is a new user at <a href="[url]">[url]</a> waiting for the approval', '2015-08-26 00:52:16'),
(875, 'english', 'You have received a new message', '2015-08-26 00:52:16'),
(876, 'english', 'You have received a new message in the e-learning system at <a href="[url]">[url]</a> in the course [course] from the user [from]', '2015-08-26 00:52:16'),
(877, 'english', 'You received a new message from the elearning system at <a href="[url]">[url]</a> in the course<b> [course] </b>from the user [from]', '2015-08-26 00:52:16'),
(878, 'english', 'Base', '2015-08-26 00:52:16'),
(879, 'english', 'Show logs', '2015-08-26 00:52:16'),
(880, 'english', 'SMS', '2015-08-26 00:52:16'),
(881, 'english', 'New Announcement', '2015-08-26 00:52:16'),
(882, 'english', 'Course properties have been changed', '2015-08-26 00:52:16'),
(883, 'english', 'New category', '2015-08-26 00:52:16'),
(884, 'english', 'New reply', '2015-08-26 00:52:16'),
(885, 'english', 'New thread', '2015-08-26 00:52:16'),
(886, 'english', 'New message received', '2015-08-26 00:52:16'),
(887, 'english', 'User approval', '2015-08-26 00:52:16'),
(888, 'english', 'User bought a course', '2015-08-26 00:52:16'),
(889, 'english', 'Student completed a course', '2015-08-26 00:52:16'),
(890, 'english', 'User subscribed to a course', '2015-08-26 00:52:16'),
(891, 'english', 'User waiting to be subscribed to a course', '2015-08-26 00:52:16'),
(892, 'english', 'User level has been changed in a course', '2015-08-26 00:52:16'),
(893, 'english', 'User unsubscribed from a course', '2015-08-26 00:52:16'),
(894, 'english', 'User waiting to be unsubscribed from a course', '2015-08-26 00:52:16'),
(895, 'english', 'User has been deleted', '2015-08-26 00:52:16'),
(896, 'english', 'User subscribed to a group', '2015-08-26 00:52:16'),
(897, 'english', 'User waiting to be subscribed in a group', '2015-08-26 00:52:16'),
(898, 'english', 'User has been removed from a group', '2015-08-26 00:52:16'),
(899, 'english', 'User has been modified', '2015-08-26 00:52:16'),
(900, 'english', 'User has been created', '2015-08-26 00:52:16'),
(901, 'english', 'User waiting to be approved in platform subscription', '2015-08-26 00:52:16'),
(902, 'english', 'New user waiting to be approved', '2015-08-26 00:52:16'),
(903, 'english', 'Event manager', '2015-08-26 00:52:16'),
(904, 'english', 'Not used', '2015-08-26 00:52:16'),
(905, 'english', 'Platform', '2015-08-26 00:52:16'),
(906, 'english', 'appCore', '2015-08-26 00:52:16'),
(907, 'english', 'appLMS', '2015-08-26 00:52:16'),
(908, 'english', 'appLMS-A', '2015-08-26 00:52:16'),
(909, 'english', 'Moderators and Super Admins', '2015-08-26 00:52:16'),
(910, 'english', 'Instructors', '2015-08-26 00:52:16'),
(911, 'english', 'Instructors and Super Admins', '2015-08-26 00:52:16'),
(912, 'english', 'User', '2015-08-26 00:52:16'),
(913, 'english', 'Event settings', '2015-08-26 00:52:16'),
(914, 'english', 'Add FAQ', '2015-08-26 00:52:16'),
(915, 'english', 'Back to top', '2015-08-26 00:52:16'),
(916, 'english', 'Keywords (separated by comma please)', '2015-08-26 00:52:16'),
(917, 'english', 'FAQ & Help', '2015-08-26 00:52:16'),
(918, 'english', 'Select a word', '2015-08-26 00:52:16'),
(919, 'english', 'FAQ list for this category', '2015-08-26 00:52:16'),
(920, 'english', 'FAQ view', '2015-08-26 00:52:16'),
(921, 'english', 'Help view', '2015-08-26 00:52:16'),
(922, 'english', 'Word', '2015-08-26 00:52:16'),
(923, 'english', 'Add new custom field', '2015-08-26 00:52:16'),
(924, 'english', 'All kind of fields', '2015-08-26 00:52:16'),
(925, 'english', 'Fiscal code', '2015-08-26 00:52:16'),
(926, 'english', 'Copy', '2015-08-26 00:52:16'),
(927, 'english', 'Country', '2015-08-26 00:52:16'),
(928, 'english', 'Dropdown field', '2015-08-26 00:52:16'),
(929, 'english', 'Element name', '2015-08-26 00:52:16'),
(930, 'english', '- No value -', '2015-08-26 00:52:16'),
(931, 'english', 'New element', '2015-08-26 00:52:16'),
(932, 'english', 'Value assigned', '2015-08-26 00:52:16'),
(933, 'english', 'Insert new element', '2015-08-26 00:52:16'),
(934, 'english', 'Field manager', '2015-08-26 00:52:16'),
(935, 'english', 'Field category', '2015-08-26 00:52:16'),
(936, 'english', 'Keyword', '2015-08-26 00:52:16'),
(937, 'english', 'Free text field', '2015-08-26 00:52:16'),
(938, 'english', 'Gmail account', '2015-08-26 00:52:16'),
(939, 'english', 'ICQ account', '2015-08-26 00:52:16'),
(940, 'english', 'Attention:', '2015-08-26 00:52:16'),
(941, 'english', 'It''s not possible to insert quotes. To insert a link please use < href=site target=_blank>', '2015-08-26 00:52:16'),
(942, 'english', 'MSN account', '2015-08-26 00:52:16'),
(943, 'english', 'New date field', '2015-08-26 00:52:16'),
(944, 'english', 'New dropdown field', '2015-08-26 00:52:16'),
(945, 'english', 'New free text field(big)', '2015-08-26 00:52:16'),
(946, 'english', 'New ICQ account filed', '2015-08-26 00:52:16'),
(947, 'english', 'New field MSN account', '2015-08-26 00:52:16'),
(948, 'english', 'New field Skype account', '2015-08-26 00:52:16'),
(949, 'english', 'New text field', '2015-08-26 00:52:16'),
(950, 'english', 'New file field', '2015-08-26 00:52:16'),
(951, 'english', 'New field yahoo account', '2015-08-26 00:52:16'),
(952, 'english', 'New Yes/No field', '2015-08-26 00:52:16'),
(953, 'english', 'Not done', '2015-08-26 00:52:16'),
(954, 'english', 'No file loaded', '2015-08-26 00:52:16'),
(955, 'english', 'Show on platforms', '2015-08-26 00:52:16'),
(956, 'english', 'Skype account', '2015-08-26 00:52:16'),
(957, 'english', 'Text field', '2015-08-26 00:52:16'),
(958, 'english', 'Use multi-language field if available', '2015-08-26 00:52:16'),
(959, 'english', 'Yahoo account', '2015-08-26 00:52:16'),
(960, 'english', 'Field yes/no', '2015-08-26 00:52:16'),
(961, 'english', 'Gap analysis', '2015-08-26 00:52:16'),
(962, 'english', 'With a gap', '2015-08-26 00:52:16'),
(963, 'english', 'Without a gap', '2015-08-26 00:52:16'),
(964, 'english', 'Add new forum', '2015-08-26 00:52:16'),
(965, 'english', 'Start a new discussion', '2015-08-26 00:52:16'),
(966, 'english', 'Mark all threads as read', '2015-08-26 00:52:16'),
(967, 'english', 'Are you sure you want to move the thread?', '2015-08-26 00:52:16'),
(968, 'english', 'You can''t access this discussion', '2015-08-26 00:52:16'),
(969, 'english', 'Messages for this thread', '2015-08-26 00:52:16'),
(970, 'english', 'Last messages in this thread', '2015-08-26 00:52:16'),
(971, 'english', 'Choose who can see this forum (if nobody is selected, the forum will be seen by everyone)', '2015-08-26 00:52:16'),
(972, 'english', 'Moderate', '2015-08-26 00:52:16'),
(973, 'english', 'Forum list', '2015-08-26 00:52:16'),
(974, 'english', 'Emoticons', '2015-08-26 00:52:16'),
(975, 'english', 'Forum closed', '2015-08-26 00:52:16'),
(976, 'english', 'Forum open', '2015-08-26 00:52:16'),
(977, 'english', 'Show this forum to', '2015-08-26 00:52:16'),
(978, 'english', 'This is a forum with all information regarding it', '2015-08-26 00:52:16'),
(979, 'english', 'Unlock', '2015-08-26 00:52:16'),
(980, 'english', 'Manage forum moderation', '2015-08-26 00:52:16'),
(981, 'english', 'Re-Open answers', '2015-08-26 00:52:16'),
(982, 'english', 'from forum', '2015-08-26 00:52:16'),
(983, 'english', 'Mark thread as important', '2015-08-26 00:52:16'),
(984, 'english', 'Last message.', '2015-08-26 00:52:16'),
(985, 'english', 'Locked', '2015-08-26 00:52:16'),
(986, 'english', 'Message blocked by moderator', '2015-08-26 00:52:16'),
(987, 'english', 'Lock forum', '2015-08-26 00:52:16'),
(988, 'english', 'Lock forum', '2015-08-26 00:52:16'),
(989, 'english', 'Lock answers', '2015-08-26 00:52:16'),
(990, 'english', 'Message modified by', '2015-08-26 00:52:16'),
(991, 'english', 'Mod. message', '2015-08-26 00:52:16'),
(992, 'english', 'Move to forum:', '2015-08-26 00:52:16'),
(993, 'english', 'New message', '2015-08-26 00:52:16'),
(994, 'english', 'New thread', '2015-08-26 00:52:16'),
(995, 'english', 'You are not allowed to view this forum', '2015-08-26 00:52:16'),
(996, 'english', 'Notify', '2015-08-26 00:52:16'),
(997, 'english', 'Notify request registered', '2015-08-26 00:52:16'),
(998, 'english', 'Follow this forum', '2015-08-26 00:52:16'),
(999, 'english', 'Notify me about new threads in this forum', '2015-08-26 00:52:16'),
(1000, 'english', 'Follow this thread', '2015-08-26 00:52:16'),
(1001, 'english', 'Follow this thread (notify me of new messages)', '2015-08-26 00:52:16'),
(1002, 'english', 'Posts', '2015-08-26 00:52:16'),
(1003, 'english', 'Replies', '2015-08-26 00:52:16'),
(1004, 'english', 'Threads', '2015-08-26 00:52:16'),
(1005, 'english', 'Watchers', '2015-08-26 00:52:16'),
(1006, 'english', 'Quote', '2015-08-26 00:52:16'),
(1007, 'english', 'Re-Open thread', '2015-08-26 00:52:16'),
(1008, 'english', 'Find topic', '2015-08-26 00:52:16'),
(1009, 'english', 'Search result for', '2015-08-26 00:52:16'),
(1010, 'english', 'Remove important flag from thread', '2015-08-26 00:52:16'),
(1011, 'english', 'list with the thread present for the forum selected', '2015-08-26 00:52:16'),
(1012, 'english', 'Discussions available in forum', '2015-08-26 00:52:16'),
(1013, 'english', 'List of threads', '2015-08-26 00:52:16'),
(1014, 'english', 'to forum', '2015-08-26 00:52:16'),
(1015, 'english', 'Make accessible', '2015-08-26 00:52:16'),
(1016, 'english', 'Re-Open forum', '2015-08-26 00:52:16'),
(1017, 'english', 'Open', '2015-08-26 00:52:16'),
(1018, 'english', 'Stop', '2015-08-26 00:52:16'),
(1019, 'english', 'Stop notifications for this forum', '2015-08-26 00:52:16'),
(1020, 'english', 'Stop alerting me when threads are created in this forum', '2015-08-26 00:52:16'),
(1021, 'english', 'Activate notifications', '2015-08-26 00:52:16'),
(1022, 'english', 'Stop notifications (stop annoying me)', '2015-08-26 00:52:16'),
(1023, 'english', 'Picture, avatar and signature', '2015-08-26 00:52:16'),
(1024, 'english', 'User info', '2015-08-26 00:52:16'),
(1025, 'english', 'Show profile', '2015-08-26 00:52:16'),
(1026, 'english', 'Written by', '2015-08-26 00:52:16'),
(1027, 'english', 'Add word', '2015-08-26 00:52:16'),
(1028, 'english', 'Glossary', '2015-08-26 00:52:16'),
(1029, 'english', 'Terms list in the glossary', '2015-08-26 00:52:16'),
(1030, 'english', 'Word', '2015-08-26 00:52:16'),
(1031, 'english', 'Word description', '2015-08-26 00:52:16'),
(1032, 'english', 'Terms', '2015-08-26 00:52:16'),
(1033, 'english', 'Grade book', '2015-08-26 00:52:16'),
(1034, 'english', 'This is your score for the activities of this course', '2015-08-26 00:52:16'),
(1035, 'english', 'This is a detailed list of the score collected in this course', '2015-08-26 00:52:16'),
(1036, 'english', 'of', '2015-08-26 00:52:16'),
(1037, 'english', 'not graded yet', '2015-08-26 00:52:16'),
(1038, 'english', 'No score', '2015-08-26 00:52:16'),
(1039, 'english', 'N.', '2015-08-26 00:52:16'),
(1040, 'english', 'Sub.', '2015-08-26 00:52:16'),
(1041, 'english', 'Groups for this course', '2015-08-26 00:52:16'),
(1042, 'english', 'Manage the users subscribed to this group', '2015-08-26 00:52:16'),
(1043, 'english', 'Subscribe users', '2015-08-26 00:52:16'),
(1044, 'english', 'Select the destination for the copy operation', '2015-08-26 00:52:16'),
(1045, 'english', 'Choose destination folder', '2015-08-26 00:52:16'),
(1046, 'english', 'Auto-refresh', '2015-08-26 00:52:16'),
(1047, 'english', 'Emoticons', '2015-08-26 00:52:16'),
(1048, 'english', 'Message', '2015-08-26 00:52:16'),
(1049, 'english', 'Refresh', '2015-08-26 00:52:16'),
(1050, 'english', 'Rooms list', '2015-08-26 00:52:16'),
(1051, 'english', 'Users list', '2015-08-26 00:52:16'),
(1052, 'english', 'logged out.', '2015-08-26 00:52:16'),
(1053, 'english', 'logged in.', '2015-08-26 00:52:16'),
(1054, 'english', 'Introduction', '2015-08-26 00:52:16'),
(1055, 'english', 'Attachments', '2015-08-26 00:52:16'),
(1056, 'english', 'Back to top', '2015-08-26 00:52:16'),
(1057, 'english', 'HTML page', '2015-08-26 00:52:16'),
(1058, 'english', 'Access', '2015-08-26 00:52:16'),
(1059, 'english', 'New connection', '2015-08-26 00:52:16'),
(1060, 'english', 'New connector', '2015-08-26 00:52:16'),
(1061, 'english', 'New task', '2015-08-26 00:52:16'),
(1062, 'english', 'From example (through the analysis of the first file matching File pattern)', '2015-08-26 00:52:16'),
(1063, 'english', 'If a course has been deleted', '2015-08-26 00:52:16'),
(1064, 'english', 'If a user has not been subscribed', '2015-08-26 00:52:16'),
(1065, 'english', 'Removed folders', '2015-08-26 00:52:16'),
(1066, 'english', 'Canceled users', '2015-08-26 00:52:16'),
(1067, 'english', 'Class', '2015-08-26 00:52:16'),
(1068, 'english', 'Confirm deletion', '2015-08-26 00:52:16'),
(1069, 'english', 'Connection', '2015-08-26 00:52:16'),
(1070, 'english', 'Connections', '2015-08-26 00:52:16'),
(1071, 'english', 'Connector', '2015-08-26 00:52:16'),
(1072, 'english', 'Connectors', '2015-08-26 00:52:16'),
(1073, 'english', 'Connectors', '2015-08-26 00:52:16'),
(1074, 'english', 'New connection', '2015-08-26 00:52:16'),
(1075, 'english', 'Connections', '2015-08-26 00:52:16'),
(1076, 'english', 'Destination', '2015-08-26 00:52:16'),
(1077, 'english', 'Don''t delete', '2015-08-26 00:52:16'),
(1078, 'english', 'Don''t send', '2015-08-26 00:52:16'),
(1079, 'english', 'Fields definition', '2015-08-26 00:52:16'),
(1080, 'english', 'Fields definition mode', '2015-08-26 00:52:16'),
(1081, 'english', 'Field delimiter', '2015-08-26 00:52:16'),
(1082, 'english', 'Enclosure character', '2015-08-26 00:52:16'),
(1083, 'english', 'Sub-folder', '2015-08-26 00:52:16'),
(1084, 'english', 'File pattern', '2015-08-26 00:52:16'),
(1085, 'english', 'filename*', '2015-08-26 00:52:16'),
(1086, 'english', 'Analyzed file', '2015-08-26 00:52:16'),
(1087, 'english', 'Finish', '2015-08-26 00:52:16'),
(1088, 'english', 'First row header', '2015-08-26 00:52:16'),
(1089, 'english', 'Group filter', '2015-08-26 00:52:16'),
(1090, 'english', 'Hour', '2015-08-26 00:52:16'),
(1091, 'english', 'No input to process', '2015-08-26 00:52:16'),
(1092, 'english', 'Import type', '2015-08-26 00:52:16'),
(1093, 'english', 'Insert only', '2015-08-26 00:52:16'),
(1094, 'english', 'Insert and remove', '2015-08-26 00:52:16'),
(1095, 'english', 'Last execution', '2015-08-26 00:52:16'),
(1096, 'english', 'Field''s map not required', '2015-08-26 00:52:16'),
(1097, 'english', 'There aren''t new connectors to insert', '2015-08-26 00:52:16'),
(1098, 'english', 'File pattern', '2015-08-26 00:52:16'),
(1099, 'english', 'Read', '2015-08-26 00:52:16'),
(1100, 'english', 'Read/Write', '2015-08-26 00:52:16'),
(1101, 'english', 'At', '2015-08-26 00:52:16'),
(1102, 'english', 'at %time%', '2015-08-26 00:52:16'),
(1103, 'english', 'Interval', '2015-08-26 00:52:16'),
(1104, 'english', 'any %interval% %unit%', '2015-08-26 00:52:16'),
(1105, 'english', 'Send notify', '2015-08-26 00:52:16'),
(1106, 'english', 'Source', '2015-08-26 00:52:16'),
(1107, 'english', 'Menu to assign to new courses', '2015-08-26 00:52:16'),
(1108, 'english', 'Tasks', '2015-08-26 00:52:16'),
(1109, 'english', 'Del task', '2015-08-26 00:52:16'),
(1110, 'english', 'Insert/update', '2015-08-26 00:52:16'),
(1111, 'english', 'New task', '2015-08-26 00:52:16'),
(1112, 'english', 'Run', '2015-08-26 00:52:16'),
(1113, 'english', 'Executed task', '2015-08-26 00:52:16'),
(1114, 'english', 'Destination folder for users', '2015-08-26 00:52:16'),
(1115, 'english', 'Select the folder containing the imported tree', '2015-08-26 00:52:16'),
(1116, 'english', 'Write', '2015-08-26 00:52:16'),
(1117, 'english', 'File not specified', '2015-08-26 00:52:16'),
(1118, 'english', 'File to upload<br />(this will overwrite the old one)', '2015-08-26 00:52:16'),
(1119, 'english', 'File type', '2015-08-26 00:52:16'),
(1120, 'english', 'Upload files', '2015-08-26 00:52:16'),
(1121, 'english', 'Show all', '2015-08-26 00:52:16'),
(1122, 'english', 'Categorized only', '2015-08-26 00:52:16'),
(1123, 'english', 'Switch from scorm categorization to chapters categorization', '2015-08-26 00:52:16'),
(1124, 'english', 'Contained in', '2015-08-26 00:52:16'),
(1125, 'english', 'This resource is mobile compliant.', '2015-08-26 00:52:16'),
(1126, 'english', 'Original name stored in the platform', '2015-08-26 00:52:16'),
(1127, 'english', 'Only related users can see this object', '2015-08-26 00:52:16'),
(1128, 'english', 'Everyone can access this object', '2015-08-26 00:52:17'),
(1129, 'english', 'Uncategorized only', '2015-08-26 00:52:17'),
(1130, 'english', 'Make this resource playable also by people that cannot access it.', '2015-08-26 00:52:17'),
(1131, 'english', 'Switching between categorization mode will delete the current categorization.', '2015-08-26 00:52:17'),
(1132, 'english', 'All the courses you are enrolled in.', '2015-08-26 00:52:17'),
(1133, 'english', 'Guest', '2015-08-26 00:52:17'),
(1134, 'english', 'Ghost', '2015-08-26 00:52:17'),
(1135, 'english', 'Student', '2015-08-26 00:52:17'),
(1136, 'english', 'Tutor', '2015-08-26 00:52:17'),
(1137, 'english', 'Mentor', '2015-08-26 00:52:17'),
(1138, 'english', 'Instructor', '2015-08-26 00:52:17'),
(1139, 'english', 'Administrator', '2015-08-26 00:52:17'),
(1140, 'english', 'Add file to repository', '2015-08-26 00:52:17'),
(1141, 'english', 'Files uploaded', '2015-08-26 00:52:17'),
(1142, 'english', 'Uploaded files', '2015-08-26 00:52:17'),
(1143, 'english', 'New repository', '2015-08-26 00:52:17'),
(1144, 'english', 'No repositories available', '2015-08-26 00:52:17'),
(1145, 'english', 'new files', '2015-08-26 00:52:17'),
(1146, 'english', 'Repository', '2015-08-26 00:52:17'),
(1147, 'english', 'View student files', '2015-08-26 00:52:17'),
(1148, 'english', 'Add link', '2015-08-26 00:52:17'),
(1149, 'english', 'Allow to add a new link', '2015-08-26 00:52:17'),
(1150, 'english', 'Back to top', '2015-08-26 00:52:17'),
(1151, 'english', 'Keywords (separate by comma please)', '2015-08-26 00:52:17'),
(1152, 'english', 'All the links will be opened in a new window', '2015-08-26 00:52:17'),
(1153, 'english', 'URL (Ex. http://www.website.com)', '2015-08-26 00:52:17'),
(1154, 'english', 'Link', '2015-08-26 00:52:17'),
(1155, 'english', 'Select a word', '2015-08-26 00:52:17'),
(1156, 'english', 'Link list in category', '2015-08-26 00:52:17'),
(1157, 'english', 'Keywords view', '2015-08-26 00:52:17'),
(1158, 'english', 'List view', '2015-08-26 00:52:17'),
(1159, 'english', 'Words', '2015-08-26 00:52:17'),
(1160, 'english', 'Locked access', '2015-08-26 00:52:17'),
(1161, 'english', 'Request access from social, cancel by user', '2015-08-26 00:52:17'),
(1162, 'english', 'Unable to find social id account', '2015-08-26 00:52:17'),
(1163, 'english', 'Home page', '2015-08-26 00:52:17'),
(1164, 'english', 'forma.lms is an Open Source e-Learning platform (LMS and LCMS) used in corporate and higher education markets.<br/>\n<br/>\nThe Platform supports 25 languages, it''s compliant with the SCORM 1.2 and 2004 standards, and supports different didactic models, including: Blended, Self-Directed, Collaborative and even Social Learning through Chat, Wiki, Forums and other different functions.<br/>\n<br/>\n<br/>\nTo change these words please go to Admin/Language management, search for <b>login</b> and edit the key <b>_INTRO_STD_TEXT</b>', '2015-08-26 00:52:17'),
(1165, 'english', 'Jump to login form', '2015-08-26 00:52:17'),
(1166, 'english', 'LDAP authentication is active, functionality unavailable please call your administrator', '2015-08-26 00:52:17'),
(1167, 'english', 'Login', '2015-08-26 00:52:17'),
(1168, 'english', 'Accessible Login', '2015-08-26 00:52:17'),
(1169, 'english', 'Login', '2015-08-26 00:52:17'),
(1170, 'english', 'Login with', '2015-08-26 00:52:17'),
(1171, 'english', 'Login', '2015-08-26 00:52:17'),
(1172, 'english', 'Lost password', '2015-08-26 00:52:17'),
(1173, 'english', 'Fill this field with your user ID and you will receive an email (at your registration address) with the instruction for generate a new password.', '2015-08-26 00:52:17'),
(1174, 'english', 'Fill this field with the email given in your registration process and you will receive an email that contains your username for this site.', '2015-08-26 00:52:17'),
(1175, 'english', 'I lost my username', '2015-08-26 00:52:17'),
(1176, 'english', 'System in mainteinance mode.<br/><br/>To change these text please go to Admin/Language management, search for login and edit the key _MAINTENANCE_TEXT', '2015-08-26 00:52:17'),
(1177, 'english', 'Access denied, please check your password', '2015-08-26 00:52:17'),
(1178, 'english', 'The two provided passwords are not equal or password field is empty.', '2015-08-26 00:52:17'),
(1179, 'english', 'Please [login] or [signin] to buy or proceed with this course', '2015-08-26 00:52:17'),
(1180, 'english', 'Please [login] to buy or proceed with this course', '2015-08-26 00:52:17'),
(1181, 'english', 'register with Facebook', '2015-08-26 00:52:17'),
(1182, 'english', 'This request is expired.', '2015-08-26 00:52:17'),
(1183, 'english', 'Privacy policy', '2015-08-26 00:52:17'),
(1184, 'english', 'Session expired', '2015-08-26 00:52:17'),
(1185, 'english', 'Register', '2015-08-26 00:52:17'),
(1186, 'english', 'Social id connection failed', '2015-08-26 00:52:17'),
(1187, 'english', 'Social id connection successs', '2015-08-26 00:52:17'),
(1188, 'english', 'Another user has logged in with your username', '2015-08-26 00:52:17'),
(1189, 'english', 'Unknown error in social login', '2015-08-26 00:52:17'),
(1190, 'english', 'You are logged out', '2015-08-26 00:52:17'),
(1191, 'english', 'Add new custom menu', '2015-08-26 00:52:17'),
(1192, 'english', 'Check all', '2015-08-26 00:52:17'),
(1193, 'english', 'Personalized name', '2015-08-26 00:52:17'),
(1194, 'english', 'Create as a copy of', '2015-08-26 00:52:17'),
(1195, 'english', 'Levels', '2015-08-26 00:52:17'),
(1196, 'english', 'Assign modules to menu item', '2015-08-26 00:52:17'),
(1197, 'english', 'Customized name', '2015-08-26 00:52:17'),
(1198, 'english', 'Sequence', '2015-08-26 00:52:17'),
(1199, 'english', 'Icons', '2015-08-26 00:52:17'),
(1200, 'english', 'Choose an icon for this menu', '2015-08-26 00:52:17'),
(1201, 'english', 'Custom Menu', '2015-08-26 00:52:17'),
(1202, 'english', 'List of custom menus created', '2015-08-26 00:52:17'),
(1203, 'english', 'Available modules for import', '2015-08-26 00:52:17'),
(1204, 'english', 'Main menu', '2015-08-26 00:52:17'),
(1205, 'english', 'Main items of the current custom menu', '2015-08-26 00:52:17'),
(1206, 'english', 'Modules assigned to this menu', '2015-08-26 00:52:17'),
(1207, 'english', 'Modules assigned to this menu', '2015-08-26 00:52:17'),
(1208, 'english', 'Add custom menu', '2015-08-26 00:52:17'),
(1209, 'english', 'Assign this module to this menu', '2015-08-26 00:52:17'),
(1210, 'english', 'Menu management', '2015-08-26 00:52:17'),
(1211, 'english', 'Menu items', '2015-08-26 00:52:17'),
(1212, 'english', 'Module', '2015-08-26 00:52:17'),
(1213, 'english', 'Uncheck all', '2015-08-26 00:52:17'),
(1214, 'english', 'You are importing the module to this menu', '2015-08-26 00:52:17'),
(1215, 'english', 'You are working on this module', '2015-08-26 00:52:17'),
(1216, 'english', 'Main preferences', '2015-08-26 00:52:17'),
(1217, 'english', 'Administrators management', '2015-08-26 00:52:17'),
(1218, 'english', 'Administrator profile', '2015-08-26 00:52:17'),
(1219, 'english', 'Associate Users', '2015-08-26 00:52:17'),
(1220, 'english', 'Jump to the main menu', '2015-08-26 00:52:17'),
(1221, 'english', 'Jump to the modules list', '2015-08-26 00:52:17'),
(1222, 'english', 'Certificates', '2015-08-26 00:52:17'),
(1223, 'english', 'Communications', '2015-08-26 00:52:17'),
(1224, 'english', 'Settings', '2015-08-26 00:52:17'),
(1225, 'english', 'Welcome Page', '2015-08-26 00:52:17'),
(1226, 'english', 'Event manager', '2015-08-26 00:52:17'),
(1227, 'english', 'Events', '2015-08-26 00:52:17'),
(1228, 'english', 'Additional fields', '2015-08-26 00:52:17'),
(1229, 'english', 'Main', '2015-08-26 00:52:17'),
(1230, 'english', 'E-Learning', '2015-08-26 00:52:17'),
(1231, 'english', 'I/O Task', '2015-08-26 00:52:17'),
(1232, 'english', 'Jump to:', '2015-08-26 00:52:17'),
(1233, 'english', 'Language management', '2015-08-26 00:52:17'),
(1234, 'english', 'User management', '2015-08-26 00:52:17'),
(1235, 'english', 'E-Learning', '2015-08-26 00:52:17'),
(1236, 'english', 'Reservation Management', '2015-08-26 00:52:17'),
(1237, 'english', 'Certificates Management', '2015-08-26 00:52:17'),
(1238, 'english', 'Aggregated certificates', '2015-08-26 00:52:17'),
(1239, 'english', 'User area in LMS', '2015-08-26 00:52:17'),
(1240, 'english', 'Module name', '2015-08-26 00:52:17'),
(1241, 'english', 'Manage news in users area', '2015-08-26 00:52:17'),
(1242, 'english', 'Template player', '2015-08-26 00:52:17'),
(1243, 'english', 'Plugin Manager', '2015-08-26 00:52:17'),
(1244, 'english', 'Privacy policies', '2015-08-26 00:52:17'),
(1245, 'english', 'Public Administrators management', '2015-08-26 00:52:17'),
(1246, 'english', 'Public Administrator profile', '2015-08-26 00:52:17'),
(1247, 'english', 'Question category', '2015-08-26 00:52:17'),
(1248, 'english', 'Quest Category', '2015-08-26 00:52:17'),
(1249, 'english', 'Issued Certificates', '2015-08-26 00:52:17'),
(1250, 'english', 'Reservations', '2015-08-26 00:52:17'),
(1251, 'english', 'Subscribe to course', '2015-08-26 00:52:17'),
(1252, 'english', 'Configuration', '2015-08-26 00:52:17'),
(1253, 'english', 'Users', '2015-08-26 00:52:17'),
(1254, 'english', 'Web pages', '2015-08-26 00:52:17'),
(1255, 'english', 'Collaborative Area', '2015-08-26 00:52:17'),
(1256, 'english', 'Stat Area', '2015-08-26 00:52:17'),
(1257, 'english', 'Student Area', '2015-08-26 00:52:17'),
(1258, 'english', 'Teacher Area', '2015-08-26 00:52:17'),
(1259, 'english', 'Announcements', '2015-08-26 00:52:17'),
(1260, 'english', 'Course charts', '2015-08-26 00:52:17'),
(1261, 'english', 'Grade book', '2015-08-26 00:52:17'),
(1262, 'english', 'User/objects grid', '2015-08-26 00:52:17'),
(1263, 'english', 'E-Portfolio', '2015-08-26 00:52:17'),
(1264, 'english', 'Report card', '2015-08-26 00:52:17'),
(1265, 'english', 'Group management', '2015-08-26 00:52:17'),
(1266, 'english', 'Introduction', '2015-08-26 00:52:17'),
(1267, 'english', 'Course Info', '2015-08-26 00:52:17'),
(1268, 'english', 'Repository', '2015-08-26 00:52:17'),
(1269, 'english', 'Course Documents', '2015-08-26 00:52:17'),
(1270, 'english', 'My Profile', '2015-08-26 00:52:17'),
(1271, 'english', 'Project management', '2015-08-26 00:52:17'),
(1272, 'english', 'Quest bank', '2015-08-26 00:52:17'),
(1273, 'english', 'Reservation module', '2015-08-26 00:52:17'),
(1274, 'english', 'Usage stats', '2015-08-26 00:52:17'),
(1275, 'english', 'Learning object stats', '2015-08-26 00:52:17'),
(1276, 'english', 'User stats', '2015-08-26 00:52:17'),
(1277, 'english', 'Learning object management', '2015-08-26 00:52:17'),
(1278, 'english', 'Video conference', '2015-08-26 00:52:17'),
(1279, 'english', 'Wiki', '2015-08-26 00:52:17'),
(1280, 'english', 'Authoring', '2015-08-26 00:52:17'),
(1281, 'english', 'Jump to the main menu', '2015-08-26 00:52:17'),
(1282, 'english', 'Jump to your information related to this course', '2015-08-26 00:52:17'),
(1283, 'english', 'Community', '2015-08-26 00:52:17'),
(1284, 'english', 'Activate course', '2015-08-26 00:52:17'),
(1285, 'english', 'Admin area', '2015-08-26 00:52:17'),
(1286, 'english', 'Authoring', '2015-08-26 00:52:17'),
(1287, 'english', 'Campus', '2015-08-26 00:52:17'),
(1288, 'english', 'General menu', '2015-08-26 00:52:17'),
(1289, 'english', 'Competences', '2015-08-26 00:52:17'),
(1290, 'english', 'My Courses', '2015-08-26 00:52:17'),
(1291, 'english', 'My area', '2015-08-26 00:52:17'),
(1292, 'english', 'Certificates', '2015-08-26 00:52:17'),
(1293, 'english', 'Manage', '2015-08-26 00:52:17'),
(1294, 'english', 'Certificates', '2015-08-26 00:52:17'),
(1295, 'english', 'Course management', '2015-08-26 00:52:17'),
(1296, 'english', 'Community', '2015-08-26 00:52:17'),
(1297, 'english', 'Newsletter', '2015-08-26 00:52:17'),
(1298, 'english', 'Report', '2015-08-26 00:52:17'),
(1299, 'english', 'Course subscriptions management', '2015-08-26 00:52:17'),
(1300, 'english', 'Users management', '2015-08-26 00:52:17'),
(1301, 'english', 'Support', '2015-08-26 00:52:17'),
(1302, 'english', 'The message has attachments', '2015-08-26 00:52:17'),
(1303, 'english', 'Send a message to users of the course:', '2015-08-26 00:52:17'),
(1304, 'english', 'High', '2015-08-26 00:52:17'),
(1305, 'english', 'Received', '2015-08-26 00:52:17'),
(1306, 'english', 'Low', '2015-08-26 00:52:17'),
(1307, 'english', 'Mime type', '2015-08-26 00:52:17'),
(1308, 'english', 'You have inserted a blank subject', '2015-08-26 00:52:17'),
(1309, 'english', 'Normal', '2015-08-26 00:52:17'),
(1310, 'english', 'Sent', '2015-08-26 00:52:17'),
(1311, 'english', 'Priority', '2015-08-26 00:52:17'),
(1312, 'english', 'Refresh', '2015-08-26 00:52:17'),
(1313, 'english', 'Message read', '2015-08-26 00:52:17'),
(1314, 'english', 'Very high', '2015-08-26 00:52:17'),
(1315, 'english', 'Very low', '2015-08-26 00:52:17'),
(1316, 'english', 'Blocks', '2015-08-26 00:52:17'),
(1317, 'english', 'Select who can view this block', '2015-08-26 00:52:17'),
(1318, 'english', 'Complete user profile', '2015-08-26 00:52:17'),
(1319, 'english', 'Make block visible', '2015-08-26 00:52:17'),
(1320, 'english', 'Home', '2015-08-26 00:52:17'),
(1321, 'english', 'Internal area', '2015-08-26 00:52:17'),
(1322, 'english', 'Simplified user profile', '2015-08-26 00:52:17'),
(1323, 'english', 'New notes', '2015-08-26 00:52:17'),
(1324, 'english', 'Show note', '2015-08-26 00:52:17'),
(1325, 'english', 'Notes', '2015-08-26 00:52:17'),
(1326, 'english', 'Vertical menu bar', '2015-08-26 00:52:17'),
(1327, 'english', 'Empty menu', '2015-08-26 00:52:17'),
(1328, 'english', 'Vertical menu', '2015-08-26 00:52:17'),
(1329, 'english', 'Attempt', '2015-08-26 00:52:17'),
(1330, 'english', 'Attempts', '2015-08-26 00:52:17'),
(1331, 'english', 'Autoplay', '2015-08-26 00:52:17'),
(1332, 'english', 'Your progress will be saved.', '2015-08-26 00:52:17'),
(1333, 'english', 'Hide menu', '2015-08-26 00:52:17'),
(1334, 'english', 'Blocked', '2015-08-26 00:52:17'),
(1335, 'english', 'Objective', '2015-08-26 00:52:17'),
(1336, 'english', 'Lectures', '2015-08-26 00:52:17'),
(1337, 'english', 'End object marker', '2015-08-26 00:52:17'),
(1338, 'english', 'Prerequisites not satisfied', '2015-08-26 00:52:17'),
(1339, 'english', 'Bookmark', '2015-08-26 00:52:17'),
(1340, 'english', 'Final', '2015-08-26 00:52:17'),
(1341, 'english', 'Begin', '2015-08-26 00:52:17'),
(1342, 'english', 'Execute object', '2015-08-26 00:52:17'),
(1343, 'english', 'Lectures', '2015-08-26 00:52:17'),
(1344, 'english', 'Access', '2015-08-26 00:52:17'),
(1345, 'english', 'Publish from', '2015-08-26 00:52:17'),
(1346, 'english', 'Publish until', '2015-08-26 00:52:17'),
(1347, 'english', 'Select the destination folder for the copy operation', '2015-08-26 00:52:17'),
(1348, 'english', 'Resource', '2015-08-26 00:52:17'),
(1349, 'english', 'Interactions', '2015-08-26 00:52:17'),
(1350, 'english', 'Elapsed time', '2015-08-26 00:52:17'),
(1351, 'english', 'Show menu', '2015-08-26 00:52:17'),
(1352, 'english', 'Node Fields', '2015-08-26 00:52:17'),
(1353, 'english', 'Group name', '2015-08-26 00:52:17'),
(1354, 'english', 'Do not import', '2015-08-26 00:52:17'),
(1355, 'english', 'Import schema', '2015-08-26 00:52:17'),
(1356, 'english', 'User inserted, wait for Admin approval', '2015-08-26 00:52:17'),
(1357, 'english', 'Assign node fields', '2015-08-26 00:52:17'),
(1358, 'english', 'Associate extra fields to user', '2015-08-26 00:52:17'),
(1359, 'english', 'Organization chart', '2015-08-26 00:52:17'),
(1360, 'english', 'Cascade', '2015-08-26 00:52:17'),
(1361, 'english', 'Inherited', '2015-08-26 00:52:17'),
(1362, 'english', 'Invisible to the user', '2015-08-26 00:52:17'),
(1363, 'english', 'Invisible', '2015-08-26 00:52:17'),
(1364, 'english', 'File charset', '2015-08-26 00:52:17'),
(1365, 'english', 'Choose file to import', '2015-08-26 00:52:17'),
(1366, 'english', 'Manage the first line as header', '2015-08-26 00:52:17'),
(1367, 'english', 'Choose separator (; or ,)', '2015-08-26 00:52:17'),
(1368, 'english', 'Import users', '2015-08-26 00:52:17'),
(1369, 'english', 'Descendants', '2015-08-26 00:52:17'),
(1370, 'english', 'List fields for the folder', '2015-08-26 00:52:17'),
(1371, 'english', 'Rename', '2015-08-26 00:52:17'),
(1372, 'english', 'Show also suspended users', '2015-08-26 00:52:17'),
(1373, 'english', 'This username already exists, please choose a different one.', '2015-08-26 00:52:17'),
(1374, 'english', 'Ass. user to group', '2015-08-26 00:52:17'),
(1375, 'english', 'Delete user', '2015-08-26 00:52:17'),
(1376, 'english', 'Personal learning objects', '2015-08-26 00:52:17'),
(1377, 'english', 'LO available in the course', '2015-08-26 00:52:17'),
(1378, 'english', 'Shared learning object with other instructors', '2015-08-26 00:52:17'),
(1379, 'english', 'send to all', '2015-08-26 00:52:17'),
(1380, 'english', 'allow to send messages only to instructors', '2015-08-26 00:52:17'),
(1381, 'english', 'Allow file upload', '2015-08-26 00:52:17'),
(1382, 'english', 'LMS', '2015-08-26 00:52:17'),
(1383, 'english', 'Selected by', '2015-08-26 00:52:17'),
(1384, 'english', 'Answer text', '2015-08-26 00:52:17'),
(1385, 'english', 'Stat question', '2015-08-26 00:52:17'),
(1386, 'english', 'insert new question', '2015-08-26 00:52:17'),
(1387, 'english', 'no questions in this survey, please verify.', '2015-08-26 00:52:17'),
(1388, 'english', 'Add question', '2015-08-26 00:52:17'),
(1389, 'english', 'New survey', '2015-08-26 00:52:17'),
(1390, 'english', 'Add answer', '2015-08-26 00:52:17'),
(1391, 'english', 'After the quest', '2015-08-26 00:52:17'),
(1392, 'english', 'You have already completed this survey', '2015-08-26 00:52:17'),
(1393, 'english', 'List of the available answers for this question', '2015-08-26 00:52:17'),
(1394, 'english', 'Begin the survey', '2015-08-26 00:52:17'),
(1395, 'english', 'Question list of the survey ( [tot_element] elements in [tot_page] pages )', '2015-08-26 00:52:17'),
(1396, 'english', 'Survey completed, thanks for your contribution.', '2015-08-26 00:52:17'),
(1397, 'english', 'Back to the lesson', '2015-08-26 00:52:17'),
(1398, 'english', 'Submit survey', '2015-08-26 00:52:17'),
(1399, 'english', 'As the first', '2015-08-26 00:52:17'),
(1400, 'english', 'and put it after', '2015-08-26 00:52:17'),
(1401, 'english', 'As the last', '2015-08-26 00:52:17'),
(1402, 'english', 'Previous page', '2015-08-26 00:52:17'),
(1403, 'english', 'Order', '2015-08-26 00:52:17'),
(1404, 'english', 'Question''s title', '2015-08-26 00:52:17'),
(1405, 'english', 'Remove question', '2015-08-26 00:52:17'),
(1406, 'english', 'Survey', '2015-08-26 00:52:17'),
(1407, 'english', 'Remove answer', '2015-08-26 00:52:17'),
(1408, 'english', 'List of all the questions created in this survey', '2015-08-26 00:52:17'),
(1409, 'english', 'Question', '2015-08-26 00:52:17'),
(1410, 'english', 'BP', '2015-08-26 00:52:17'),
(1411, 'english', 'CH', '2015-08-26 00:52:17'),
(1412, 'english', 'MC', '2015-08-26 00:52:17'),
(1413, 'english', 'CV', '2015-08-26 00:52:17'),
(1414, 'english', 'DV', '2015-08-26 00:52:17'),
(1415, 'english', 'ET', '2015-08-26 00:52:17'),
(1416, 'english', 'TI', '2015-08-26 00:52:17'),
(1417, 'english', 'Answer text', '2015-08-26 00:52:17'),
(1418, 'english', 'Break page', '2015-08-26 00:52:17'),
(1419, 'english', 'Single choice', '2015-08-26 00:52:17'),
(1420, 'english', 'Multiple choice', '2015-08-26 00:52:17'),
(1421, 'english', 'user can choose more than one answer', '2015-08-26 00:52:17'),
(1422, 'english', 'Single choice - only one answer can be selected', '2015-08-26 00:52:17'),
(1423, 'english', 'Course evaluation', '2015-08-26 00:52:17'),
(1424, 'english', 'Teacher evaluation', '2015-08-26 00:52:17'),
(1425, 'english', 'Text answer', '2015-08-26 00:52:17'),
(1426, 'english', 'Title', '2015-08-26 00:52:17'),
(1427, 'english', 'Title - a free text', '2015-08-26 00:52:17'),
(1428, 'english', 'List of the answers to this question with the relative statistics', '2015-08-26 00:52:17'),
(1429, 'english', 'Survey', '2015-08-26 00:52:17'),
(1430, 'english', 'Create new assessment', '2015-08-26 00:52:17'),
(1431, 'english', 'Add effects', '2015-08-26 00:52:17'),
(1432, 'english', 'New rule', '2015-08-26 00:52:17'),
(1433, 'english', 'Effects', '2015-08-26 00:52:17'),
(1434, 'english', 'Assign teacher at the assessment', '2015-08-26 00:52:17'),
(1435, 'english', 'Assign teacher that can manage assessment', '2015-08-26 00:52:17'),
(1436, 'english', 'Assign rule to the assessment', '2015-08-26 00:52:17'),
(1437, 'english', 'Assign courses where the user will be subscribed after completing assessment', '2015-08-26 00:52:17'),
(1438, 'english', 'Assessment list', '2015-08-26 00:52:17'),
(1439, 'english', 'Rules list', '2015-08-26 00:52:17'),
(1440, 'english', 'Do nothing', '2015-08-26 00:52:17'),
(1441, 'english', 'Completing rules', '2015-08-26 00:52:17'),
(1442, 'english', 'Courses where the user will be subscribed', '2015-08-26 00:52:17'),
(1443, 'english', 'If no rules has been applied', '2015-08-26 00:52:17'),
(1444, 'english', 'If two rules are in conflict, both of them will be applied', '2015-08-26 00:52:17'),
(1445, 'english', 'Rule description', '2015-08-26 00:52:17'),
(1446, 'english', 'Rules list to apply when assessment is completed', '2015-08-26 00:52:17'),
(1447, 'english', 'Template', '2015-08-26 00:52:17'),
(1448, 'english', 'Privacy Policies', '2015-08-26 00:52:17'),
(1449, 'english', 'Number of log in', '2015-08-26 00:52:17'),
(1450, 'english', 'Time in course', '2015-08-26 00:52:17'),
(1451, 'english', '[firstname]''s activity', '2015-08-26 00:52:17'),
(1452, 'english', 'Just png, gif and jpg image formats are allowed for the upload. If size exceeds [max_px] pixel it will be automatically resized.<br />\nPlease don''t upload offensive images.', '2015-08-26 00:52:17'),
(1453, 'english', 'Career', '2015-08-26 00:52:17'),
(1454, 'english', 'Available Certificates', '2015-08-26 00:52:17'),
(1455, 'english', 'Change password', '2015-08-26 00:52:17'),
(1456, 'english', 'Fields visibility', '2015-08-26 00:52:17'),
(1457, 'english', 'Community', '2015-08-26 00:52:17'),
(1458, 'english', 'Skill name', '2015-08-26 00:52:17'),
(1459, 'english', 'Acquired score', '2015-08-26 00:52:17'),
(1460, 'english', 'Contacts', '2015-08-26 00:52:17'),
(1461, 'english', 'Courses subscribed', '2015-08-26 00:52:17'),
(1462, 'english', 'Course enrolled as mentor', '2015-08-26 00:52:17'),
(1463, 'english', 'Course enrolled as instructor', '2015-08-26 00:52:17'),
(1464, 'english', 'Course enrolled as tutor', '2015-08-26 00:52:17'),
(1465, 'english', 'Completed Courses', '2015-08-26 00:52:17'),
(1466, 'english', 'Expiring Courses', '2015-08-26 00:52:17'),
(1467, 'english', 'Deleted users list', '2015-08-26 00:52:17'),
(1468, 'english', 'Delete date', '2015-08-26 00:52:17'),
(1469, 'english', 'Field content', '2015-08-26 00:52:17'),
(1470, 'english', 'Operator first name', '2015-08-26 00:52:17'),
(1471, 'english', 'Welcome to the e-learning platform', '2015-08-26 00:52:17'),
(1472, 'english', 'Forum post', '2015-08-26 00:52:17'),
(1473, 'english', 'Goto [firstname]''s blog', '2015-08-26 00:52:17'),
(1474, 'english', 'Go to user blog', '2015-08-26 00:52:17'),
(1475, 'english', 'Go to [firstname]''s profile', '2015-08-26 00:52:17'),
(1476, 'english', 'Database ID', '2015-08-26 00:52:17'),
(1477, 'english', 'Operator last name', '2015-08-26 00:52:17'),
(1478, 'english', 'Who have seen this profile', '2015-08-26 00:52:17'),
(1479, 'english', 'Message text', '2015-08-26 00:52:17'),
(1480, 'english', 'The new password is valid for', '2015-08-26 00:52:17'),
(1481, 'english', '(Visit in the last [days] days)', '2015-08-26 00:52:17'),
(1482, 'english', 'No avatar', '2015-08-26 00:52:17');
INSERT INTO `core_lang_translation` (`id_text`, `lang_code`, `translation_text`, `save_date`) VALUES
(1483, 'english', 'No audio found', '2015-08-26 00:52:17'),
(1484, 'english', 'No images found', '2015-08-26 00:52:17'),
(1485, 'english', 'No files found', '2015-08-26 00:52:17'),
(1486, 'english', 'This profile has not received visits yet', '2015-08-26 00:52:17'),
(1487, 'english', 'No videos found', '2015-08-26 00:52:17'),
(1488, 'english', 'The inserted password is not yours', '2015-08-26 00:52:17'),
(1489, 'english', 'Old password', '2015-08-26 00:52:17'),
(1490, 'english', 'Other options', '2015-08-26 00:52:17'),
(1491, 'english', 'no one', '2015-08-26 00:52:17'),
(1492, 'english', 'teachers', '2015-08-26 00:52:17'),
(1493, 'english', 'Rule assigned to the field', '2015-08-26 00:52:17'),
(1494, 'english', 'Accept private messages from', '2015-08-26 00:52:17'),
(1495, 'english', 'User Profile', '2015-08-26 00:52:17'),
(1496, 'english', 'Member since', '2015-08-26 00:52:17'),
(1497, 'english', 'The new password must differ from the used ones', '2015-08-26 00:52:17'),
(1498, 'english', 'Final test score', '2015-08-26 00:52:17'),
(1499, 'english', 'Starting test score', '2015-08-26 00:52:17'),
(1500, 'english', 'Shared files', '2015-08-26 00:52:17'),
(1501, 'english', 'Show my online status (teacher can view it anyway)', '2015-08-26 00:52:17'),
(1502, 'english', 'Curriculum', '2015-08-26 00:52:17'),
(1503, 'english', 'Teacher profile', '2015-08-26 00:52:17'),
(1504, 'english', 'Publications', '2015-08-26 00:52:17'),
(1505, 'english', 'Your password is expired', '2015-08-26 00:52:17'),
(1506, 'english', 'Total Courses', '2015-08-26 00:52:17'),
(1507, 'english', 'No limits configured', '2015-08-26 00:52:17'),
(1508, 'english', 'The user is offline', '2015-08-26 00:52:17'),
(1509, 'english', 'Skills', '2015-08-26 00:52:17'),
(1510, 'english', 'User''s courses', '2015-08-26 00:52:17'),
(1511, 'english', 'User''s courses', '2015-08-26 00:52:17'),
(1512, 'english', 'User statistics', '2015-08-26 00:52:17'),
(1513, 'english', 'User status', '2015-08-26 00:52:17'),
(1514, 'english', 'Picture, avatar and signature', '2015-08-26 00:52:17'),
(1515, 'english', 'Operator ID', '2015-08-26 00:52:17'),
(1516, 'english', 'Offline', '2015-08-26 00:52:17'),
(1517, 'english', 'Online', '2015-08-26 00:52:17'),
(1518, 'english', 'User parameters', '2015-08-26 00:52:17'),
(1519, 'english', 'Your details stored in the system', '2015-08-26 00:52:17'),
(1520, 'english', 'Audio', '2015-08-26 00:52:17'),
(1521, 'english', 'Other files', '2015-08-26 00:52:17'),
(1522, 'english', 'Used disk space', '2015-08-26 00:52:17'),
(1523, 'english', 'Now the user is', '2015-08-26 00:52:17'),
(1524, 'english', 'Video', '2015-08-26 00:52:17'),
(1525, 'english', 'Video', '2015-08-26 00:52:17'),
(1526, 'english', 'Welcome!', '2015-08-26 00:52:17'),
(1527, 'english', 'Write a message for your request', '2015-08-26 00:52:17'),
(1528, 'english', 'Manage admins', '2015-08-26 00:52:17'),
(1529, 'english', 'Projects you are attending', '2015-08-26 00:52:17'),
(1530, 'english', 'New project', '2015-08-26 00:52:17'),
(1531, 'english', 'This project has no active features at this time.', '2015-08-26 00:52:17'),
(1532, 'english', 'Project admins', '2015-08-26 00:52:17'),
(1533, 'english', 'Project group', '2015-08-26 00:52:17'),
(1534, 'english', 'Project options', '2015-08-26 00:52:17'),
(1535, 'english', 'Files', '2015-08-26 00:52:17'),
(1536, 'english', 'You must specify a title', '2015-08-26 00:52:17'),
(1537, 'english', 'You selected an invalid group and/or you''re not a member of it.', '2015-08-26 00:52:17'),
(1538, 'english', 'Total progress', '2015-08-26 00:52:17'),
(1539, 'english', 'Tasks', '2015-08-26 00:52:17'),
(1540, 'english', 'To do', '2015-08-26 00:52:17'),
(1541, 'english', 'Project manager', '2015-08-26 00:52:17'),
(1542, 'english', 'List of all the projects that you are following', '2015-08-26 00:52:17'),
(1543, 'english', 'Show files area', '2015-08-26 00:52:17'),
(1544, 'english', 'Enable internal messages', '2015-08-26 00:52:17'),
(1545, 'english', 'Show news area', '2015-08-26 00:52:17'),
(1546, 'english', 'Show tasks area', '2015-08-26 00:52:17'),
(1547, 'english', 'Show To Do area', '2015-08-26 00:52:17'),
(1548, 'english', 'Project title', '2015-08-26 00:52:17'),
(1549, 'english', 'Task description', '2015-08-26 00:52:17'),
(1550, 'english', 'Task name', '2015-08-26 00:52:17'),
(1551, 'english', 'Task progress (%)', '2015-08-26 00:52:17'),
(1552, 'english', 'Just yourself', '2015-08-26 00:52:17'),
(1553, 'english', 'Activity', '2015-08-26 00:52:17'),
(1554, 'english', 'Special settings for:', '2015-08-26 00:52:17'),
(1555, 'english', 'Category in use, you can''t delete it', '2015-08-26 00:52:17'),
(1556, 'english', 'Quest categories', '2015-08-26 00:52:17'),
(1557, 'english', 'I agree', '2015-08-26 00:52:17'),
(1558, 'english', 'Change language', '2015-08-26 00:52:17'),
(1559, 'english', 'Choose a new password', '2015-08-26 00:52:17'),
(1560, 'english', 'This email is already used by another user.', '2015-08-26 00:52:17'),
(1561, 'english', 'This user ID is not available, choose another one', '2015-08-26 00:52:17'),
(1562, 'english', 'You must enter a valid email address', '2015-08-26 00:52:17'),
(1563, 'english', 'Username is blank or invalid', '2015-08-26 00:52:17'),
(1564, 'english', 'Password must contain numbers and characters', '2015-08-26 00:52:17'),
(1565, 'english', 'The password does not match with the second one typed', '2015-08-26 00:52:17'),
(1566, 'english', 'You must accept the privacy policy in order to register', '2015-08-26 00:52:17'),
(1567, 'english', 'The old password is wrong', '2015-08-26 00:52:17'),
(1568, 'english', 'This is the first time you log in to the system. Please change your temporary password', '2015-08-26 00:52:17'),
(1569, 'english', 'Please select a new password', '2015-08-26 00:52:17'),
(1570, 'english', 'Back to login page', '2015-08-26 00:52:17'),
(1571, 'english', 'This is the field associated with the group selected', '2015-08-26 00:52:17'),
(1572, 'english', 'Registration', '2015-08-26 00:52:17'),
(1573, 'english', 'The userID you''ve inserted doesn''t exist. Please check and retry', '2015-08-26 00:52:17'),
(1574, 'english', 'Activation code not valid', '2015-08-26 00:52:17'),
(1575, 'english', 'The security code is invalid', '2015-08-26 00:52:17'),
(1576, 'english', 'Back to login', '2015-08-26 00:52:17'),
(1577, 'english', 'If you have lost your password insert your userID in the field below, you will receive a email with some instruction', '2015-08-26 00:52:17'),
(1578, 'english', 'If you have lost your username insert your registration mail address in the field below, you will receive a email', '2015-08-26 00:52:17'),
(1579, 'english', 'This is the process to generate a new password for the user associated to this email address. Click the link below to generate a new password.<br/>\n<br/>\n<a href="[link]">[link]</a>', '2015-08-26 00:52:17'),
(1580, 'english', 'New password', '2015-08-26 00:52:17'),
(1581, 'english', 'I lost my password', '2015-08-26 00:52:17'),
(1582, 'english', 'I lost my username', '2015-08-26 00:52:17'),
(1583, 'english', 'Your username for the [url] website community is [userid]', '2015-08-26 00:52:17'),
(1584, 'english', 'Recover username', '2015-08-26 00:52:17'),
(1585, 'english', 'Please confirm your registration request', '2015-08-26 00:52:17'),
(1586, 'english', 'Congratulations! You just registered', '2015-08-26 00:52:17'),
(1587, 'english', 'Thank you! We have sent you an email with your username.', '2015-08-26 00:52:17'),
(1588, 'english', 'Thank you! We have sent you an email with the link to reset your password.', '2015-08-26 00:52:17'),
(1589, 'english', 'Your new password is valid for [valid_for_day] days.', '2015-08-26 00:52:17'),
(1590, 'english', 'New password', '2015-08-26 00:52:17'),
(1591, 'english', 'Blank space before and after userID fields are not valid and will be erased', '2015-08-26 00:52:17'),
(1592, 'english', 'Your old password', '2015-08-26 00:52:17'),
(1593, 'english', 'Password too short', '2015-08-26 00:52:17'),
(1594, 'english', 'The confirmation of your account is failed', '2015-08-26 00:52:17'),
(1595, 'english', 'The request is not valid because the validity period is elapsed', '2015-08-26 00:52:17'),
(1596, 'english', 'This request will expire after <b>[hour] hours</b>', '2015-08-26 00:52:17'),
(1597, 'english', 'We have received your subscription request with the following information:<br />\n<br />\nUserID : [userid]<br />\nPassword : [password]<br />\n<br />\nTo complete  the registration process, please click on the link below, (or copy it in your web browser address bar)<br />\n<br />\n<a href="[link]">[link]</a><br />\n<br />\nThis request will be valid for the next [hour] hours', '2015-08-26 00:52:17'),
(1598, 'english', 'We received your registration request with the following data:<br/>\n<br/>\n\nUserid: [userid]<br/>\nPassword: [password]', '2015-08-26 00:52:17'),
(1599, 'english', 'You must fill the mandatory fields, marked with the symbol [mandatory]', '2015-08-26 00:52:17'),
(1600, 'english', 'From this page you can register to the platform; follow the instructions below and fill in the fields properly.', '2015-08-26 00:52:17'),
(1601, 'english', 'Registration is not active', '2015-08-26 00:52:17'),
(1602, 'english', 'The password must contain at least <b>[min_char] chars</b>', '2015-08-26 00:52:17'),
(1603, 'english', 'The password must contain <b>characters</b> and <b>numbers</b>', '2015-08-26 00:52:17'),
(1604, 'english', 'The new password must be different', '2015-08-26 00:52:17'),
(1605, 'english', 'Activation code', '2015-08-26 00:52:17'),
(1606, 'english', 'I accept the terms of the privacy policy', '2015-08-26 00:52:17'),
(1607, 'english', 'Any information collected by us, relating to an identifiable person, shall be used only in accordance with the procedures and for the purposes that are here acknowledged to the data subject and where the latter, as required by law, has expressely consented. <br><br>\n\n- User login and private area<br>\n- User newsletter<br>\n- User custom content purpose<br><br>\n\nIn handling this information, accuracy and precision shall be met to ensure the integrity and quality of the processed personal data, if you have any question please contact us.', '2015-08-26 00:52:17'),
(1608, 'english', 'Privacy policy', '2015-08-26 00:52:17'),
(1609, 'english', 'You must accept the privacy policy', '2015-08-26 00:52:17'),
(1610, 'english', 'Thank you for the request of registration to our community.\nIn order to protect your privacy you will receive an email with the confirmation link.\nYou have to confirm your account before using it.', '2015-08-26 00:52:17'),
(1611, 'english', 'Thanks for registering, you will receive a confirmation email with your data.', '2015-08-26 00:52:17'),
(1612, 'english', 'your username', '2015-08-26 00:52:17'),
(1613, 'english', 'Your registration has been confirmed, you will receive an email as soon as the administrator approves it', '2015-08-26 00:52:17'),
(1614, 'english', 'Registration confirmed', '2015-08-26 00:52:17'),
(1615, 'english', 'Retype the password', '2015-08-26 00:52:17'),
(1616, 'english', 'Select the group you want to subscribe', '2015-08-26 00:52:17'),
(1617, 'english', 'List of groups available for subscription', '2015-08-26 00:52:17'),
(1618, 'english', 'You haven''t filled in some mandatory fields', '2015-08-26 00:52:17'),
(1619, 'english', 'This procedure is required for security or legal reason by the website administrator and consists in changing password periodically.', '2015-08-26 00:52:17'),
(1620, 'english', 'Data aggregation on users and course', '2015-08-26 00:52:17'),
(1621, 'english', 'Courses', '2015-08-26 00:52:17'),
(1622, 'english', 'Subdivide data according to the organization chart', '2015-08-26 00:52:17'),
(1623, 'english', 'Show results', '2015-08-26 00:52:17'),
(1624, 'english', 'Users', '2015-08-26 00:52:17'),
(1625, 'english', 'Aggregate data on', '2015-08-26 00:52:17'),
(1626, 'english', '<< Back to report list', '2015-08-26 00:52:17'),
(1627, 'english', 'Choose time range to show', '2015-08-26 00:52:17'),
(1628, 'english', 'Choose users that you want to analyse', '2015-08-26 00:52:17'),
(1629, 'english', 'Competences filters settings', '2015-08-26 00:52:17'),
(1630, 'english', 'You can set filters about selected users competences.', '2015-08-26 00:52:17'),
(1631, 'english', '(select a competence)', '2015-08-26 00:52:17'),
(1632, 'english', '(select a condition)', '2015-08-26 00:52:17'),
(1633, 'english', 'Course''s end date', '2015-08-26 00:52:17'),
(1634, 'english', 'Inscription date', '2015-08-26 00:52:17'),
(1635, 'english', 'Score in course', '2015-08-26 00:52:17'),
(1636, 'english', 'Initial score', '2015-08-26 00:52:17'),
(1637, 'english', 'Session count', '2015-08-26 00:52:17'),
(1638, 'english', 'Courses selection', '2015-08-26 00:52:17'),
(1639, 'english', 'Users that haven''t completed the course', '2015-08-26 00:52:17'),
(1640, 'english', 'Display courses information', '2015-08-26 00:52:17'),
(1641, 'english', 'Display user''s information about courses', '2015-08-26 00:52:17'),
(1642, 'english', 'Users who haven''t started the course', '2015-08-26 00:52:17'),
(1643, 'english', 'Creation date', '2015-08-26 00:52:17'),
(1644, 'english', 'Current selection', '2015-08-26 00:52:17'),
(1645, 'english', 'User defined time range', '2015-08-26 00:52:17'),
(1646, 'english', 'Completion date', '2015-08-26 00:52:17'),
(1647, 'english', 'Subscription date', '2015-08-26 00:52:17'),
(1648, 'english', 'Course expiring on (specify date)', '2015-08-26 00:52:17'),
(1649, 'english', 'After (specify number) days from their subscription', '2015-08-26 00:52:17'),
(1650, 'english', 'Course expiring in (specify number) days', '2015-08-26 00:52:17'),
(1651, 'english', 'All conditions must be satisfied', '2015-08-26 00:52:17'),
(1652, 'english', 'At least one condition must be satisfied', '2015-08-26 00:52:17'),
(1653, 'english', 'Reset filters', '2015-08-26 00:52:17'),
(1654, 'english', 'Subscribed', '2015-08-26 00:52:17'),
(1655, 'english', 'Last 30 days', '2015-08-26 00:52:17'),
(1656, 'english', 'Last 6 months', '2015-08-26 00:52:17'),
(1657, 'english', 'Last 3 months', '2015-08-26 00:52:17'),
(1658, 'english', 'Last seven days', '2015-08-26 00:52:17'),
(1659, 'english', 'Last year', '2015-08-26 00:52:17'),
(1660, 'english', 'First attempt', '2015-08-26 00:52:17'),
(1661, 'english', 'Last attempt', '2015-08-26 00:52:17'),
(1662, 'english', 'Milestone', '2015-08-26 00:52:17'),
(1663, 'english', 'L.O. type', '2015-08-26 00:52:17'),
(1664, 'english', 'Mail body', '2015-08-26 00:52:17'),
(1665, 'english', 'To begin', '2015-08-26 00:52:17'),
(1666, 'english', 'Not activated', '2015-08-26 00:52:17'),
(1667, 'english', 'No user found', '2015-08-26 00:52:17'),
(1668, 'english', 'No courses have been selected', '2015-08-26 00:52:17'),
(1669, 'english', 'No results found.', '2015-08-26 00:52:17'),
(1670, 'english', 'No values have been selected', '2015-08-26 00:52:17'),
(1671, 'english', 'Num.', '2015-08-26 00:52:17'),
(1672, 'english', 'Perc.', '2015-08-26 00:52:17'),
(1673, 'english', 'Course categories', '2015-08-26 00:52:17'),
(1674, 'english', 'Years', '2015-08-26 00:52:17'),
(1675, 'english', 'Relates courses with users votes (from poll).', '2015-08-26 00:52:17'),
(1676, 'english', 'Relates courses with the teachers votes (from poll)', '2015-08-26 00:52:17'),
(1677, 'english', 'Relates courses to users.', '2015-08-26 00:52:17'),
(1678, 'english', 'Users competences details', '2015-08-26 00:52:17'),
(1679, 'english', 'Columns filter''s setting', '2015-08-26 00:52:17'),
(1680, 'english', 'Conditions on selected courses', '2015-08-26 00:52:17'),
(1681, 'english', 'Select Courses', '2015-08-26 00:52:17'),
(1682, 'english', 'Everyday', '2015-08-26 00:52:17'),
(1683, 'english', 'Report for all the users', '2015-08-26 00:52:17'),
(1684, 'english', 'Edit columns filters', '2015-08-26 00:52:17'),
(1685, 'english', 'Edit rows filters', '2015-08-26 00:52:17'),
(1686, 'english', 'Every month, on the day:', '2015-08-26 00:52:17'),
(1687, 'english', 'Columns data', '2015-08-26 00:52:17'),
(1688, 'english', 'Rows filter''s settings', '2015-08-26 00:52:17'),
(1689, 'english', 'Time period', '2015-08-26 00:52:17'),
(1690, 'english', 'Define time period and options to consider for delay analysis', '2015-08-26 00:52:17'),
(1691, 'english', 'Every week, on the day:', '2015-08-26 00:52:17'),
(1692, 'english', 'This table contains the statistic about the selected users in the courses in the platform', '2015-08-26 00:52:17'),
(1693, 'english', 'User courses details', '2015-08-26 00:52:17'),
(1694, 'english', 'Relates users to communications', '2015-08-26 00:52:17'),
(1695, 'english', 'Relates users to competences', '2015-08-26 00:52:17'),
(1696, 'english', 'Relates users to courses', '2015-08-26 00:52:17'),
(1697, 'english', 'Make delay analysis', '2015-08-26 00:52:17'),
(1698, 'english', 'Relates users to corporate contest', '2015-08-26 00:52:17'),
(1699, 'english', 'Relates users to Learning Objects', '2015-08-26 00:52:17'),
(1700, 'english', 'Select milestones', '2015-08-26 00:52:17'),
(1701, 'english', 'Learning Objects types', '2015-08-26 00:52:17'),
(1702, 'english', '<< SAVE and back to report list', '2015-08-26 00:52:17'),
(1703, 'english', 'Save and back to list', '2015-08-26 00:52:17'),
(1704, 'english', 'Description:', '2015-08-26 00:52:17'),
(1705, 'english', 'Save and show', '2015-08-26 00:52:17'),
(1706, 'english', 'Every week,', '2015-08-26 00:52:17'),
(1707, 'english', 'Learning Objects options', '2015-08-26 00:52:17'),
(1708, 'english', 'Select report category:', '2015-08-26 00:52:17'),
(1709, 'english', 'Check the columns you want to view in the report table', '2015-08-26 00:52:17'),
(1710, 'english', 'Courses manual selection', '2015-08-26 00:52:17'),
(1711, 'english', 'Send e-mail', '2015-08-26 00:52:17'),
(1712, 'english', 'Shown columns', '2015-08-26 00:52:17'),
(1713, 'english', 'Show but do not save', '2015-08-26 00:52:17'),
(1714, 'english', 'Show statistics about courses', '2015-08-26 00:52:17'),
(1715, 'english', 'Created by', '2015-08-26 00:52:17'),
(1716, 'english', 'Public', '2015-08-26 00:52:17'),
(1717, 'english', 'Path', '2015-08-26 00:52:17'),
(1718, 'english', 'Estimated time', '2015-08-26 00:52:17'),
(1719, 'english', 'Course score', '2015-08-26 00:52:17'),
(1720, 'english', 'Subscribed date', '2015-08-26 00:52:17'),
(1721, 'english', 'Number of sessions', '2015-08-26 00:52:17'),
(1722, 'english', 'Start score', '2015-08-26 00:52:17'),
(1723, 'english', 'Date range', '2015-08-26 00:52:17'),
(1724, 'english', 'Range', '2015-08-26 00:52:17'),
(1725, 'english', 'Filter for time periods', '2015-08-26 00:52:17'),
(1726, 'english', 'Time', '2015-08-26 00:52:17'),
(1727, 'english', 'Show users custom fields', '2015-08-26 00:52:17'),
(1728, 'english', 'Add users', '2015-08-26 00:52:17'),
(1729, 'english', 'assign', '2015-08-26 00:52:17'),
(1730, 'english', 'Are you sure you want to subscribe?', '2015-08-26 00:52:17'),
(1731, 'english', 'Are you sure you want to cancel this subscription?', '2015-08-26 00:52:17'),
(1732, 'english', 'Available', '2015-08-26 00:52:17'),
(1733, 'english', 'Event subscription canceled', '2015-08-26 00:52:17'),
(1734, 'english', 'Cancel Registration', '2015-08-26 00:52:17'),
(1735, 'english', 'Categories', '2015-08-26 00:52:17'),
(1736, 'english', 'Manage Category', '2015-08-26 00:52:17'),
(1737, 'english', 'Max Event for Category', '2015-08-26 00:52:17'),
(1738, 'english', 'Subscribe users', '2015-08-26 00:52:17'),
(1739, 'english', 'Please confirm your data', '2015-08-26 00:52:17'),
(1740, 'english', 'Deadline', '2015-08-26 00:52:17'),
(1741, 'english', 'Register this event instead of', '2015-08-26 00:52:17'),
(1742, 'english', 'Cancel Reservation', '2015-08-26 00:52:17'),
(1743, 'english', 'Event list', '2015-08-26 00:52:17'),
(1744, 'english', 'From Time', '2015-08-26 00:52:17'),
(1745, 'english', 'Laboratory management', '2015-08-26 00:52:17'),
(1746, 'english', 'Max number of subscriptions for this category', '2015-08-26 00:52:17'),
(1747, 'english', 'Max user', '2015-08-26 00:52:17'),
(1748, 'english', 'No reservations found', '2015-08-26 00:52:17'),
(1749, 'english', 'No users enrolled', '2015-08-26 00:52:17'),
(1750, 'english', 'Num of  registered', '2015-08-26 00:52:17'),
(1751, 'english', 'Registration', '2015-08-26 00:52:17'),
(1752, 'english', 'Reservation', '2015-08-26 00:52:17'),
(1753, 'english', 'Category management', '2015-08-26 00:52:17'),
(1754, 'english', 'Available Events', '2015-08-26 00:52:17'),
(1755, 'english', 'Email Send', '2015-08-26 00:52:17'),
(1756, 'english', 'My Registration', '2015-08-26 00:52:17'),
(1757, 'english', 'Past Events', '2015-08-26 00:52:17'),
(1758, 'english', 'Reservation', '2015-08-26 00:52:17'),
(1759, 'english', 'Manage Events', '2015-08-26 00:52:17'),
(1760, 'english', 'List of current reservations', '2015-08-26 00:52:17'),
(1761, 'english', 'FULL', '2015-08-26 00:52:17'),
(1762, 'english', 'Modify event', '2015-08-26 00:52:17'),
(1763, 'english', 'Who can reserve this event', '2015-08-26 00:52:17'),
(1764, 'english', 'Unsubscribe from event', '2015-08-26 00:52:17'),
(1765, 'english', 'Subscribe users', '2015-08-26 00:52:17'),
(1766, 'english', 'Switch (choose this event instead of another)', '2015-08-26 00:52:17'),
(1767, 'english', 'End Time', '2015-08-26 00:52:17'),
(1768, 'english', 'Undefined', '2015-08-26 00:52:17'),
(1769, 'english', 'Unlimited', '2015-08-26 00:52:17'),
(1770, 'english', 'User enrolled', '2015-08-26 00:52:17'),
(1771, 'english', 'View enrolled user', '2015-08-26 00:52:17'),
(1772, 'english', 'Wrong date', '2015-08-26 00:52:17'),
(1773, 'english', 'Wrong time range', '2015-08-26 00:52:17'),
(1774, 'english', 'Back to list', '2015-08-26 00:52:17'),
(1775, 'english', 'Select a content package with .zip or .pif extension', '2015-08-26 00:52:17'),
(1776, 'english', 'You have to specify the file to upload', '2015-08-26 00:52:17'),
(1777, 'english', 'SCORM 1.2 and 2004 importer', '2015-08-26 00:52:17'),
(1778, 'english', 'Create complete objects list', '2015-08-26 00:52:17'),
(1779, 'english', 'Upload SCORM package', '2015-08-26 00:52:17'),
(1780, 'english', 'SCORM', '2015-08-26 00:52:17'),
(1781, 'english', 'Load scorm package', '2015-08-26 00:52:17'),
(1782, 'english', 'Advanced selection', '2015-08-26 00:52:17'),
(1783, 'english', 'WARNING: Watch additional details', '2015-08-26 00:52:17'),
(1784, 'english', 'to edit them.', '2015-08-26 00:52:17'),
(1785, 'english', 'Simplified selection', '2015-08-26 00:52:17'),
(1786, 'english', 'Simplified selection', '2015-08-26 00:52:17'),
(1787, 'english', 'E-learning: course ''[course]'', new announcement: [title]', '2015-08-26 00:52:17'),
(1788, 'english', 'Your subscription request at course [course] has been approved by the administrator', '2015-08-26 00:52:17'),
(1789, 'english', 'Your subscription request has been approved', '2015-08-26 00:52:17'),
(1790, 'english', 'E-Learning: Your account with the username [userid] has been deleted', '2015-08-26 00:52:17'),
(1791, 'english', 'Your account at the site <a href="[url]">[url]</a>   has been modified:\n\nUsername: [userid]', '2015-08-26 00:52:17'),
(1792, 'english', 'E-learning: course ''[course]'' new forum ''[title]''', '2015-08-26 00:52:17'),
(1793, 'english', 'New forum', '2015-08-26 00:52:17'),
(1794, 'english', 'E-learning: in the course ''[course]'', there is a new message in ''[forum_title]'' > ''[thread_title]''', '2015-08-26 00:52:17'),
(1795, 'english', 'E-learning: course ''[course]'' there''s a new thread in ''[forum_title]'': [thread_title]', '2015-08-26 00:52:17'),
(1796, 'english', 'and your password has been changed to: [password]', '2015-08-26 00:52:17'),
(1797, 'english', 'You are now registered in our system with this account:\n\nUsername: [userid]\nPassword: [password]', '2015-08-26 00:52:17'),
(1798, 'english', 'There is a new user subscription to a moderate group waiting for approval', '2015-08-26 00:52:17'),
(1799, 'english', 'New user is registered and awaiting your approval', '2015-08-26 00:52:17'),
(1800, 'english', 'New user registered', '2015-08-26 00:52:17'),
(1801, 'english', 'There is a new user waiting for the approval', '2015-08-26 00:52:17'),
(1802, 'english', 'You have received a new message in the e-learning system in the course [course] from the user [from]', '2015-08-26 00:52:17'),
(1803, 'english', 'You received a new message on the  e-learning platform in course [course] from the user [from]', '2015-08-26 00:52:17'),
(1804, 'english', 'Accounts connected:', '2015-08-26 00:52:17'),
(1805, 'english', 'Link your forma.lms account with:', '2015-08-26 00:52:17'),
(1806, 'english', 'Started', '2015-08-26 00:52:17'),
(1807, 'english', 'Started', '2015-08-26 00:52:17'),
(1808, 'english', 'Completed', '2015-08-26 00:52:17'),
(1809, 'english', 'Failed', '2015-08-26 00:52:17'),
(1810, 'english', 'Not completed', '2015-08-26 00:52:17'),
(1811, 'english', 'Not attempted', '2015-08-26 00:52:17'),
(1812, 'english', 'Not attempted', '2015-08-26 00:52:17'),
(1813, 'english', 'Passed', '2015-08-26 00:52:17'),
(1814, 'english', 'Accesses', '2015-08-26 00:52:17'),
(1815, 'english', 'Activate', '2015-08-26 00:52:17'),
(1816, 'english', 'Active', '2015-08-26 00:52:17'),
(1817, 'english', '(Current area)', '2015-08-26 00:52:17'),
(1818, 'english', 'Activity', '2015-08-26 00:52:17'),
(1819, 'english', 'Add', '2015-08-26 00:52:17'),
(1820, 'english', 'Add tags', '2015-08-26 00:52:17'),
(1821, 'english', 'Administrator', '2015-08-26 00:52:17'),
(1822, 'english', 'Administrators', '2015-08-26 00:52:17'),
(1823, 'english', 'Advanced', '2015-08-26 00:52:17'),
(1824, 'english', 'Advanced search', '2015-08-26 00:52:17'),
(1825, 'english', 'All', '2015-08-26 00:52:17'),
(1826, 'english', 'All categories', '2015-08-26 00:52:17'),
(1827, 'english', 'All courses', '2015-08-26 00:52:17'),
(1828, 'english', 'All pages', '2015-08-26 00:52:17'),
(1829, 'english', 'Check', '2015-08-26 00:52:17'),
(1830, 'english', '-', '2015-08-26 00:52:17'),
(1831, 'english', '', '2015-08-26 00:52:17'),
(1832, 'english', 'Root', '2015-08-26 00:52:17'),
(1833, 'english', 'Answer', '2015-08-26 00:52:17'),
(1834, 'english', 'Approve', '2015-08-26 00:52:17'),
(1835, 'english', 'Waiting for users approval', '2015-08-26 00:52:17'),
(1836, 'english', 'Are you sure?', '2015-08-26 00:52:17'),
(1837, 'english', 'Assessment', '2015-08-26 00:52:17'),
(1838, 'english', 'Assign', '2015-08-26 00:52:17'),
(1839, 'english', 'Assign administrators', '2015-08-26 00:52:17'),
(1840, 'english', 'Assign users', '2015-08-26 00:52:17'),
(1841, 'english', 'Attachment', '2015-08-26 00:52:17'),
(1842, 'english', 'Attendance', '2015-08-26 00:52:17'),
(1843, 'english', 'Author', '2015-08-26 00:52:17'),
(1844, 'english', 'Auto-detect', '2015-08-26 00:52:17'),
(1845, 'english', 'Automatic subscription', '2015-08-26 00:52:17'),
(1846, 'english', 'Avatar', '2015-08-26 00:52:17'),
(1847, 'english', 'Average', '2015-08-26 00:52:17'),
(1848, 'english', '&lt;&lt; Back', '2015-08-26 00:52:17'),
(1849, 'english', 'Basic search', '2015-08-26 00:52:17'),
(1850, 'english', 'Big Blue Button', '2015-08-26 00:52:17'),
(1851, 'english', 'by', '2015-08-26 00:52:17'),
(1852, 'english', 'Calendar', '2015-08-26 00:52:17'),
(1853, 'english', 'Cancel', '2015-08-26 00:52:17'),
(1854, 'english', 'Career', '2015-08-26 00:52:17'),
(1855, 'english', 'Course catalog', '2015-08-26 00:52:17'),
(1856, 'english', 'Categorization', '2015-08-26 00:52:17'),
(1857, 'english', 'Categorize', '2015-08-26 00:52:17'),
(1858, 'english', 'Category', '2015-08-26 00:52:17'),
(1859, 'english', 'Chapters', '2015-08-26 00:52:17'),
(1860, 'english', 'Chat', '2015-08-26 00:52:17'),
(1861, 'english', 'Classroom', '2015-08-26 00:52:17'),
(1862, 'english', 'Close', '2015-08-26 00:52:17'),
(1863, 'english', 'Code', '2015-08-26 00:52:17'),
(1864, 'english', 'Collapse', '2015-08-26 00:52:17'),
(1865, 'english', 'Comments', '2015-08-26 00:52:17'),
(1866, 'english', 'Communications', '2015-08-26 00:52:17'),
(1867, 'english', 'Community blog', '2015-08-26 00:52:17'),
(1868, 'english', 'Company blog', '2015-08-26 00:52:17'),
(1869, 'english', 'Competence', '2015-08-26 00:52:17'),
(1870, 'english', 'Competences', '2015-08-26 00:52:17'),
(1871, 'english', 'Completed', '2015-08-26 00:52:17'),
(1872, 'english', 'Confirm', '2015-08-26 00:52:17'),
(1873, 'english', 'Connect', '2015-08-26 00:52:17'),
(1874, 'english', 'Connection error', '2015-08-26 00:52:17'),
(1875, 'english', 'Contains', '2015-08-26 00:52:17'),
(1876, 'english', 'Contents', '2015-08-26 00:52:17'),
(1877, 'english', 'Content library', '2015-08-26 00:52:17'),
(1878, 'english', 'Contest', '2015-08-26 00:52:17'),
(1879, 'english', 'Continue', '2015-08-26 00:52:17'),
(1880, 'english', 'Course', '2015-08-26 00:52:17'),
(1881, 'english', 'Course categories', '2015-08-26 00:52:17'),
(1882, 'english', 'Curricula', '2015-08-26 00:52:17'),
(1883, 'english', 'Courses', '2015-08-26 00:52:17'),
(1884, 'english', 'Course code', '2015-08-26 00:52:17'),
(1885, 'english', 'Courses list', '2015-08-26 00:52:17'),
(1886, 'english', 'Course name', '2015-08-26 00:52:17'),
(1887, 'english', 'Free', '2015-08-26 00:52:17'),
(1888, 'english', 'Create', '2015-08-26 00:52:17'),
(1889, 'english', 'Credits', '2015-08-26 00:52:17'),
(1890, 'english', 'Current file', '2015-08-26 00:52:17'),
(1891, 'english', 'Date', '2015-08-26 00:52:17'),
(1892, 'english', 'Date begin', '2015-08-26 00:52:17'),
(1893, 'english', 'Date end', '2015-08-26 00:52:17'),
(1894, 'english', 'First access date', '2015-08-26 00:52:17'),
(1895, 'english', 'Date format', '2015-08-26 00:52:17'),
(1896, 'english', 'Last access date', '2015-08-26 00:52:17'),
(1897, 'english', 'Day', '2015-08-26 00:52:17'),
(1898, 'english', 'Day(s)', '2015-08-26 00:52:17'),
(1899, 'english', 'Deactivate', '2015-08-26 00:52:17'),
(1900, 'english', 'Default language', '2015-08-26 00:52:17'),
(1901, 'english', 'Delete', '2015-08-26 00:52:17'),
(1902, 'english', 'Delete file', '2015-08-26 00:52:17'),
(1903, 'english', 'Delete selected', '2015-08-26 00:52:17'),
(1904, 'english', 'Recover', '2015-08-26 00:52:17'),
(1905, 'english', 'Reject', '2015-08-26 00:52:17'),
(1906, 'english', 'Description', '2015-08-26 00:52:17'),
(1907, 'english', 'Details', '2015-08-26 00:52:17'),
(1908, 'english', 'Difficulty', '2015-08-26 00:52:17'),
(1909, 'english', 'Hard', '2015-08-26 00:52:17'),
(1910, 'english', 'Easy', '2015-08-26 00:52:17'),
(1911, 'english', 'Medium', '2015-08-26 00:52:17'),
(1912, 'english', 'Very hard', '2015-08-26 00:52:17'),
(1913, 'english', 'Very easy', '2015-08-26 00:52:17'),
(1914, 'english', 'DimDim', '2015-08-26 00:52:17'),
(1915, 'english', 'Disconnect', '2015-08-26 00:52:17'),
(1916, 'english', 'Down', '2015-08-26 00:52:17'),
(1917, 'english', 'Download', '2015-08-26 00:52:17'),
(1918, 'english', 'Edition', '2015-08-26 00:52:17'),
(1919, 'english', 'Editions', '2015-08-26 00:52:17'),
(1920, 'english', 'Edit score', '2015-08-26 00:52:17'),
(1921, 'english', 'Edit setting', '2015-08-26 00:52:17'),
(1922, 'english', 'E-Learning', '2015-08-26 00:52:17'),
(1923, 'english', 'Email', '2015-08-26 00:52:17'),
(1924, 'english', 'Empty selection', '2015-08-26 00:52:17'),
(1925, 'english', 'End', '2015-08-26 00:52:17'),
(1926, 'english', 'Last element', '2015-08-26 00:52:17'),
(1927, 'english', 'End with', '2015-08-26 00:52:17'),
(1928, 'english', 'Enrollment rules', '2015-08-26 00:52:17'),
(1929, 'english', 'Enrolled', '2015-08-26 00:52:17'),
(1930, 'english', 'Enter', '2015-08-26 00:52:17'),
(1931, 'english', 'Environment', '2015-08-26 00:52:17'),
(1932, 'english', 'Equal to', '2015-08-26 00:52:17'),
(1933, 'english', 'Errors', '2015-08-26 00:52:17'),
(1934, 'english', 'You can''t move folder in to their descendant', '2015-08-26 00:52:17'),
(1935, 'english', 'You are required to fill in the name', '2015-08-26 00:52:17'),
(1936, 'english', 'Error while uploading the object, object not uploaded', '2015-08-26 00:52:17'),
(1937, 'english', 'Event', '2015-08-26 00:52:17'),
(1938, 'english', 'Expand', '2015-08-26 00:52:17'),
(1939, 'english', 'Expire on', '2015-08-26 00:52:17'),
(1940, 'english', 'Export', '2015-08-26 00:52:17'),
(1941, 'english', 'Export as CSV', '2015-08-26 00:52:17'),
(1942, 'english', 'Export as HTML', '2015-08-26 00:52:17'),
(1943, 'english', 'Export as XLS', '2015-08-26 00:52:17'),
(1944, 'english', 'Export as XML', '2015-08-26 00:52:17'),
(1945, 'english', 'Facebook', '2015-08-26 00:52:17'),
(1946, 'english', 'Field name', '2015-08-26 00:52:17'),
(1947, 'english', 'File', '2015-08-26 00:52:17'),
(1948, 'english', 'File name', '2015-08-26 00:52:17'),
(1949, 'english', 'Filter by', '2015-08-26 00:52:17'),
(1950, 'english', 'All conditions must be satisfied', '2015-08-26 00:52:17'),
(1951, 'english', 'At least one condition must be satisfied', '2015-08-26 00:52:17'),
(1952, 'english', 'Final score', '2015-08-26 00:52:17'),
(1953, 'english', 'First name', '2015-08-26 00:52:17'),
(1954, 'english', 'Fix sequence error', '2015-08-26 00:52:17'),
(1955, 'english', 'Forum', '2015-08-26 00:52:17'),
(1956, 'english', 'from', '2015-08-26 00:52:17'),
(1957, 'english', 'Fullname', '2015-08-26 00:52:17'),
(1958, 'english', 'Company roles', '2015-08-26 00:52:17'),
(1959, 'english', 'Gap', '2015-08-26 00:52:17'),
(1960, 'english', 'Google', '2015-08-26 00:52:17'),
(1961, 'english', 'Groups', '2015-08-26 00:52:17'),
(1962, 'english', 'Height', '2015-08-26 00:52:17'),
(1963, 'english', 'Hidden', '2015-08-26 00:52:17'),
(1964, 'english', 'History', '2015-08-26 00:52:17'),
(1965, 'english', 'Home tab', '2015-08-26 00:52:17'),
(1966, 'english', 'Hours', '2015-08-26 00:52:17'),
(1967, 'english', 'Image', '2015-08-26 00:52:17'),
(1968, 'english', 'Images', '2015-08-26 00:52:17'),
(1969, 'english', 'Import', '2015-08-26 00:52:17'),
(1970, 'english', 'Important', '2015-08-26 00:52:17'),
(1971, 'english', 'Import XML', '2015-08-26 00:52:17'),
(1972, 'english', 'Descendants', '2015-08-26 00:52:17'),
(1973, 'english', 'Insert', '2015-08-26 00:52:17'),
(1974, 'english', 'Instructions', '2015-08-26 00:52:17'),
(1975, 'english', 'Invalid extension', '2015-08-26 00:52:17'),
(1976, 'english', 'Jump to', '2015-08-26 00:52:17'),
(1977, 'english', 'Jump to module content', '2015-08-26 00:52:17'),
(1978, 'english', 'Label', '2015-08-26 00:52:17'),
(1979, 'english', 'Labels', '2015-08-26 00:52:17'),
(1980, 'english', 'Language', '2015-08-26 00:52:17'),
(1981, 'english', 'Last name', '2015-08-26 00:52:17'),
(1982, 'english', 'Insert your code', '2015-08-26 00:52:17'),
(1983, 'english', 'Subscribe', '2015-08-26 00:52:17'),
(1984, 'english', 'Learning Objects', '2015-08-26 00:52:17'),
(1985, 'english', 'Level', '2015-08-26 00:52:17'),
(1986, 'english', 'Library', '2015-08-26 00:52:17'),
(1987, 'english', 'Link', '2015-08-26 00:52:17'),
(1988, 'english', 'Linkedin', '2015-08-26 00:52:17'),
(1989, 'english', 'Uploaded files', '2015-08-26 00:52:17'),
(1990, 'english', 'Loading', '2015-08-26 00:52:17'),
(1991, 'english', 'Locations', '2015-08-26 00:52:17'),
(1992, 'english', 'Logout', '2015-08-26 00:52:17'),
(1993, 'english', 'Assignment of users to a functional role', '2015-08-26 00:52:17'),
(1994, 'english', 'Assignment of users to a group', '2015-08-26 00:52:17'),
(1995, 'english', 'Make a copy', '2015-08-26 00:52:17'),
(1996, 'english', 'Manage', '2015-08-26 00:52:17'),
(1997, 'english', 'Groups management', '2015-08-26 00:52:17'),
(1998, 'english', 'Mandatory', '2015-08-26 00:52:17'),
(1999, 'english', 'Manual', '2015-08-26 00:52:17'),
(2000, 'english', 'Manage menu', '2015-08-26 00:52:17'),
(2001, 'english', 'Mark as important', '2015-08-26 00:52:17'),
(2002, 'english', 'Max score', '2015-08-26 00:52:17'),
(2003, 'english', 'Meet', '2015-08-26 00:52:17'),
(2004, 'english', 'Messages', '2015-08-26 00:52:17'),
(2005, 'english', 'Mime type', '2015-08-26 00:52:17'),
(2006, 'english', 'Minutes', '2015-08-26 00:52:17'),
(2007, 'english', 'Min score', '2015-08-26 00:52:17'),
(2008, 'english', 'Edit', '2015-08-26 00:52:17'),
(2009, 'english', 'Moderate', '2015-08-26 00:52:17'),
(2010, 'english', 'Edit selected', '2015-08-26 00:52:17'),
(2011, 'english', 'Edit title', '2015-08-26 00:52:17'),
(2012, 'english', 'January', '2015-08-26 00:52:17'),
(2013, 'english', 'February', '2015-08-26 00:52:17'),
(2014, 'english', 'March', '2015-08-26 00:52:17'),
(2015, 'english', 'April', '2015-08-26 00:52:17'),
(2016, 'english', 'May', '2015-08-26 00:52:17'),
(2017, 'english', 'June', '2015-08-26 00:52:17'),
(2018, 'english', 'July', '2015-08-26 00:52:17'),
(2019, 'english', 'August', '2015-08-26 00:52:17'),
(2020, 'english', 'September', '2015-08-26 00:52:17'),
(2021, 'english', 'October', '2015-08-26 00:52:17'),
(2022, 'english', 'November', '2015-08-26 00:52:17'),
(2023, 'english', 'December', '2015-08-26 00:52:17'),
(2024, 'english', 'More actions', '2015-08-26 00:52:17'),
(2025, 'english', 'Add further attachments', '2015-08-26 00:52:17'),
(2026, 'english', 'More info', '2015-08-26 00:52:17'),
(2027, 'english', 'Move', '2015-08-26 00:52:17'),
(2028, 'english', 'Move down', '2015-08-26 00:52:17'),
(2029, 'english', 'Move up', '2015-08-26 00:52:17'),
(2030, 'english', 'Name', '2015-08-26 00:52:17'),
(2031, 'english', 'Never', '2015-08-26 00:52:17'),
(2032, 'english', 'New', '2015-08-26 00:52:17'),
(2033, 'english', 'News', '2015-08-26 00:52:17'),
(2034, 'english', 'Newsletter', '2015-08-26 00:52:17'),
(2035, 'english', 'New category', '2015-08-26 00:52:17'),
(2036, 'english', 'New course', '2015-08-26 00:52:17'),
(2037, 'english', 'New event', '2015-08-26 00:52:17'),
(2038, 'english', 'New filter', '2015-08-26 00:52:17'),
(2039, 'english', 'New folder', '2015-08-26 00:52:17'),
(2040, 'english', 'New user', '2015-08-26 00:52:17'),
(2041, 'english', 'Next', '2015-08-26 00:52:17'),
(2042, 'english', 'No', '2015-08-26 00:52:17'),
(2043, 'english', 'None', '2015-08-26 00:52:17'),
(2044, 'english', 'Notes', '2015-08-26 00:52:17'),
(2045, 'english', 'No title', '2015-08-26 00:52:17'),
(2046, 'english', 'Not assigned', '2015-08-26 00:52:17'),
(2047, 'english', 'Does not contain', '2015-08-26 00:52:17'),
(2048, 'english', 'Is not equal to', '2015-08-26 00:52:17'),
(2049, 'english', 'Not satisfied', '2015-08-26 00:52:17'),
(2050, 'english', 'Not started', '2015-08-26 00:52:17'),
(2051, 'english', 'Untranslated languages, click here to expand', '2015-08-26 00:52:17'),
(2052, 'english', 'No answers', '2015-08-26 00:52:17'),
(2053, 'english', 'No, please get back', '2015-08-26 00:52:17'),
(2054, 'english', 'No categories', '2015-08-26 00:52:17'),
(2055, 'english', 'No content available', '2015-08-26 00:52:17'),
(2056, 'english', 'of', '2015-08-26 00:52:17'),
(2057, 'english', 'Off', '2015-08-26 00:52:17'),
(2058, 'english', 'On', '2015-08-26 00:52:17'),
(2059, 'english', 'One month', '2015-08-26 00:52:17'),
(2060, 'english', 'Only one time', '2015-08-26 00:52:17'),
(2061, 'english', 'Open', '2015-08-26 00:52:17'),
(2062, 'english', 'Error while processing the requested operation', '2015-08-26 00:52:17'),
(2063, 'english', 'Operation successfully completed', '2015-08-26 00:52:17'),
(2064, 'english', 'Successful password change', '2015-08-26 00:52:17'),
(2065, 'english', 'Order by', '2015-08-26 00:52:17'),
(2066, 'english', 'Order asc', '2015-08-26 00:52:17'),
(2067, 'english', 'Ascending order', '2015-08-26 00:52:17'),
(2068, 'english', 'Order desc', '2015-08-26 00:52:17'),
(2069, 'english', 'Desc', '2015-08-26 00:52:17'),
(2070, 'english', 'Descending order', '2015-08-26 00:52:17'),
(2071, 'english', 'Organization chart', '2015-08-26 00:52:17'),
(2072, 'english', 'Add node', '2015-08-26 00:52:17'),
(2073, 'english', 'Pages', '2015-08-26 00:52:17'),
(2074, 'english', 'Password', '2015-08-26 00:52:17'),
(2075, 'english', 'Percentage', '2015-08-26 00:52:17'),
(2076, 'english', 'Planned', '2015-08-26 00:52:17'),
(2077, 'english', 'Play', '2015-08-26 00:52:17'),
(2078, 'english', 'Number of views', '2015-08-26 00:52:17'),
(2079, 'english', 'Complete the missing fields', '2015-08-26 00:52:17'),
(2080, 'english', 'Prerequisites', '2015-08-26 00:52:17'),
(2081, 'english', 'Previous', '2015-08-26 00:52:17'),
(2082, 'english', 'Previous element', '2015-08-26 00:52:17'),
(2083, 'english', 'Preview', '2015-08-26 00:52:17'),
(2084, 'english', 'Previous', '2015-08-26 00:52:17'),
(2085, 'english', 'Progress', '2015-08-26 00:52:17'),
(2086, 'english', 'Properties', '2015-08-26 00:52:17'),
(2087, 'english', 'Public Administrator', '2015-08-26 00:52:17'),
(2088, 'english', 'Publish', '2015-08-26 00:52:17'),
(2089, 'english', 'Question', '2015-08-26 00:52:17'),
(2090, 'english', 'Elements:', '2015-08-26 00:52:17'),
(2091, 'english', 'Reactivate', '2015-08-26 00:52:17'),
(2092, 'english', 'Read', '2015-08-26 00:52:17'),
(2093, 'english', 'Recipients', '2015-08-26 00:52:17'),
(2094, 'english', 'Register', '2015-08-26 00:52:17'),
(2095, 'english', 'Join date', '2015-08-26 00:52:17'),
(2096, 'english', 'Remove from node', '2015-08-26 00:52:17'),
(2097, 'english', 'Reply', '2015-08-26 00:52:17'),
(2098, 'english', 'Paste Learning Object', '2015-08-26 00:52:17'),
(2099, 'english', 'Report', '2015-08-26 00:52:17'),
(2100, 'english', 'Required score', '2015-08-26 00:52:17'),
(2101, 'english', 'Reset', '2015-08-26 00:52:17'),
(2102, 'english', 'Rollback', '2015-08-26 00:52:17'),
(2103, 'english', 'root', '2015-08-26 00:52:17'),
(2104, 'english', 'Row', '2015-08-26 00:52:17'),
(2105, 'english', 'Save changes', '2015-08-26 00:52:17'),
(2106, 'english', 'Schedule', '2015-08-26 00:52:17'),
(2107, 'english', 'Score', '2015-08-26 00:52:17'),
(2108, 'english', 'Search', '2015-08-26 00:52:17'),
(2109, 'english', 'seconds', '2015-08-26 00:52:17'),
(2110, 'english', 'Select', '2015-08-26 00:52:17'),
(2111, 'english', 'Selected elements', '2015-08-26 00:52:17'),
(2112, 'english', 'Select all', '2015-08-26 00:52:17'),
(2113, 'english', 'Send', '2015-08-26 00:52:17'),
(2114, 'english', 'Sender', '2015-08-26 00:52:17'),
(2115, 'english', 'Send to', '2015-08-26 00:52:17'),
(2116, 'english', 'Set', '2015-08-26 00:52:17'),
(2117, 'english', 'Short description', '2015-08-26 00:52:17'),
(2118, 'english', 'Show', '2015-08-26 00:52:17'),
(2119, 'english', 'Results', '2015-08-26 00:52:17'),
(2120, 'english', 'Signature', '2015-08-26 00:52:17'),
(2121, 'english', 'Order by', '2015-08-26 00:52:17'),
(2122, 'english', 'Standings', '2015-08-26 00:52:17'),
(2123, 'english', 'Start', '2015-08-26 00:52:17'),
(2124, 'english', 'Started', '2015-08-26 00:52:17'),
(2125, 'english', 'Start with', '2015-08-26 00:52:17'),
(2126, 'english', 'Start date', '2015-08-26 00:52:17'),
(2127, 'english', 'Start page', '2015-08-26 00:52:17'),
(2128, 'english', 'Start', '2015-08-26 00:52:17'),
(2129, 'english', 'Statistics', '2015-08-26 00:52:17'),
(2130, 'english', 'Status', '2015-08-26 00:52:17'),
(2131, 'english', 'Subject', '2015-08-26 00:52:17'),
(2132, 'english', 'Subscribe', '2015-08-26 00:52:17'),
(2133, 'english', 'Subscribed by', '2015-08-26 00:52:17'),
(2134, 'english', 'Course Subscription', '2015-08-26 00:52:17'),
(2135, 'english', 'Suspend', '2015-08-26 00:52:17'),
(2136, 'english', 'Suspended', '2015-08-26 00:52:17'),
(2137, 'english', 'Tabs', '2015-08-26 00:52:17'),
(2138, 'english', 'Tags', '2015-08-26 00:52:17'),
(2139, 'english', 'Teleskill', '2015-08-26 00:52:17'),
(2140, 'english', 'Text', '2015-08-26 00:52:17'),
(2141, 'english', 'Time periods', '2015-08-26 00:52:17'),
(2142, 'english', 'Title', '2015-08-26 00:52:17'),
(2143, 'english', 'to', '2015-08-26 00:52:17'),
(2144, 'english', 'Total', '2015-08-26 00:52:17'),
(2145, 'english', 'Total time', '2015-08-26 00:52:17'),
(2146, 'english', 'Transaction', '2015-08-26 00:52:17'),
(2147, 'english', 'Twitter', '2015-08-26 00:52:17'),
(2148, 'english', 'Type', '2015-08-26 00:52:17'),
(2149, 'english', 'Typology', '2015-08-26 00:52:17'),
(2150, 'english', 'Unassign', '2015-08-26 00:52:17'),
(2151, 'english', 'Undo', '2015-08-26 00:52:18'),
(2152, 'english', 'Infinite', '2015-08-26 00:52:18'),
(2153, 'english', 'Unpublish', '2015-08-26 00:52:18'),
(2154, 'english', 'Not read', '2015-08-26 00:52:18'),
(2155, 'english', 'Unselect all', '2015-08-26 00:52:18'),
(2156, 'english', 'Until not completed/passed', '2015-08-26 00:52:18'),
(2157, 'english', 'Up', '2015-08-26 00:52:18'),
(2158, 'english', 'Upload file(s)', '2015-08-26 00:52:18'),
(2159, 'english', 'URL', '2015-08-26 00:52:18'),
(2160, 'english', 'User', '2015-08-26 00:52:18'),
(2161, 'english', 'Username', '2015-08-26 00:52:18'),
(2162, 'english', 'Users', '2015-08-26 00:52:18'),
(2163, 'english', 'User release', '2015-08-26 00:52:18'),
(2164, 'english', 'In progress', '2015-08-26 00:52:18'),
(2165, 'english', 'Deleted', '2015-08-26 00:52:18'),
(2166, 'english', 'Subscriptions to confirm', '2015-08-26 00:52:18'),
(2167, 'english', 'Completed', '2015-08-26 00:52:18'),
(2168, 'english', 'Enter', '2015-08-26 00:52:18'),
(2169, 'english', 'Reserved', '2015-08-26 00:52:18'),
(2170, 'english', 'Subscribed', '2015-08-26 00:52:18'),
(2171, 'english', 'Suspended', '2015-08-26 00:52:18'),
(2172, 'english', 'Version', '2015-08-26 00:52:18'),
(2173, 'english', 'Video conference', '2015-08-26 00:52:18'),
(2174, 'english', 'View', '2015-08-26 00:52:18'),
(2175, 'english', 'Edit view rights', '2015-08-26 00:52:18'),
(2176, 'english', 'Waiting', '2015-08-26 00:52:18'),
(2177, 'english', 'Waiting users', '2015-08-26 00:52:18'),
(2178, 'english', 'Warning', '2015-08-26 00:52:18'),
(2179, 'english', 'Width', '2015-08-26 00:52:18'),
(2180, 'english', 'Year', '2015-08-26 00:52:18'),
(2181, 'english', 'Yes', '2015-08-26 00:52:18'),
(2182, 'english', 'At hour', '2015-08-26 00:52:18'),
(2183, 'english', 'day', '2015-08-26 00:52:18'),
(2184, 'english', 'month', '2015-08-26 00:52:18'),
(2185, 'english', 'Show page views in the last 24 hours', '2015-08-26 00:52:18'),
(2186, 'english', 'Show page views in the last 30 days', '2015-08-26 00:52:18'),
(2187, 'english', 'Show page views in the last 7 days', '2015-08-26 00:52:18'),
(2188, 'english', 'Show page views in the last 12 months', '2015-08-26 00:52:18'),
(2189, 'english', 'week', '2015-08-26 00:52:18'),
(2190, 'english', 'year', '2015-08-26 00:52:18'),
(2191, 'english', 'Duration', '2015-08-26 00:52:18'),
(2192, 'english', 'Session ends at', '2015-08-26 00:52:18'),
(2193, 'english', 'Last op.', '2015-08-26 00:52:18'),
(2194, 'english', 'Number of op.', '2015-08-26 00:52:18'),
(2195, 'english', 'Order by duration', '2015-08-26 00:52:18'),
(2196, 'english', 'Order by number of operations', '2015-08-26 00:52:18'),
(2197, 'english', 'Order by session start', '2015-08-26 00:52:18'),
(2198, 'english', 'Page view', '2015-08-26 00:52:18'),
(2199, 'english', 'Session started at', '2015-08-26 00:52:18'),
(2200, 'english', 'Duration', '2015-08-26 00:52:18'),
(2201, 'english', 'Operation', '2015-08-26 00:52:18'),
(2202, 'english', 'User list', '2015-08-26 00:52:18'),
(2203, 'english', 'User sessions list', '2015-08-26 00:52:18'),
(2204, 'english', 'User session list', '2015-08-26 00:52:18'),
(2205, 'english', 'User list', '2015-08-26 00:52:18'),
(2206, 'english', 'User total time in this course', '2015-08-26 00:52:18'),
(2207, 'english', 'Session details', '2015-08-26 00:52:18'),
(2208, 'english', 'Show', '2015-08-26 00:52:18'),
(2209, 'english', 'Sun', '2015-08-26 00:52:18'),
(2210, 'english', 'Mon', '2015-08-26 00:52:18'),
(2211, 'english', 'Tue', '2015-08-26 00:52:18'),
(2212, 'english', 'Wed', '2015-08-26 00:52:18'),
(2213, 'english', 'Thu', '2015-08-26 00:52:18'),
(2214, 'english', 'Fri', '2015-08-26 00:52:18'),
(2215, 'english', 'Sat', '2015-08-26 00:52:18'),
(2216, 'english', 'Choose one option', '2015-08-26 00:52:18'),
(2217, 'english', 'Filter by edition', '2015-08-26 00:52:18'),
(2218, 'english', 'Show only users that have seen at least one Learning Object', '2015-08-26 00:52:18'),
(2219, 'english', 'All status', '2015-08-26 00:52:18'),
(2220, 'english', 'Stats by object', '2015-08-26 00:52:18'),
(2221, 'english', 'Objects', '2015-08-26 00:52:18'),
(2222, 'english', 'User stas', '2015-08-26 00:52:18'),
(2223, 'english', 'Statistics', '2015-08-26 00:52:18'),
(2224, 'english', 'No data for user/lesson', '2015-08-26 00:52:18'),
(2225, 'english', 'for lesson', '2015-08-26 00:52:18'),
(2226, 'english', 'Stats by object:', '2015-08-26 00:52:18'),
(2227, 'english', 'Stats by Student/Object', '2015-08-26 00:52:18'),
(2228, 'english', 'Fullname', '2015-08-26 00:52:18'),
(2229, 'english', 'Users stats', '2015-08-26 00:52:18'),
(2230, 'english', 'My Objects', '2015-08-26 00:52:18'),
(2231, 'english', 'Locked', '2015-08-26 00:52:18'),
(2232, 'english', 'FAQ', '2015-08-26 00:52:18'),
(2233, 'english', 'Glossary', '2015-08-26 00:52:18'),
(2234, 'english', 'HTML page', '2015-08-26 00:52:18'),
(2235, 'english', 'Upload file', '2015-08-26 00:52:18'),
(2236, 'english', 'Links', '2015-08-26 00:52:18'),
(2237, 'english', 'Survey', '2015-08-26 00:52:18'),
(2238, 'english', 'Scorm chapter', '2015-08-26 00:52:18'),
(2239, 'english', 'SCORM', '2015-08-26 00:52:18'),
(2240, 'english', 'Test', '2015-08-26 00:52:18'),
(2241, 'english', 'Folder name', '2015-08-26 00:52:18'),
(2242, 'english', 'End course marker', '2015-08-26 00:52:18'),
(2243, 'english', 'Requisites not satisfied', '2015-08-26 00:52:18'),
(2244, 'english', 'Play object', '2015-08-26 00:52:18'),
(2245, 'english', 'Course objects', '2015-08-26 00:52:18'),
(2246, 'english', 'Shared objects', '2015-08-26 00:52:18'),
(2247, 'english', 'Rename', '2015-08-26 00:52:18'),
(2248, 'english', 'Copy Learning Object', '2015-08-26 00:52:18'),
(2249, 'english', 'New Learning Object', '2015-08-26 00:52:18'),
(2250, 'english', 'Select destination for :', '2015-08-26 00:52:18'),
(2251, 'english', 'Watching rules', '2015-08-26 00:52:18'),
(2252, 'english', 'Select Learning Object', '2015-08-26 00:52:18'),
(2253, 'english', 'Select destination folder', '2015-08-26 00:52:18'),
(2254, 'english', 'Absence', '2015-08-26 00:52:18'),
(2255, 'english', 'The users subscription to this course will be confirmed only after the adminstator approval', '2015-08-26 00:52:18'),
(2256, 'english', 'Select the level for the user selected', '2015-08-26 00:52:18'),
(2257, 'english', 'Select the students to be subscribed to the course', '2015-08-26 00:52:18'),
(2258, 'english', 'Copy', '2015-08-26 00:52:18'),
(2259, 'english', 'Copy Subscriptions', '2015-08-26 00:52:18'),
(2260, 'english', 'Correct subscription', '2015-08-26 00:52:18'),
(2261, 'english', 'Active from', '2015-08-26 00:52:18'),
(2262, 'english', 'Active until', '2015-08-26 00:52:18'),
(2263, 'english', 'Date of first completion', '2015-08-26 00:52:18'),
(2264, 'english', 'Date of last completion', '2015-08-26 00:52:18'),
(2265, 'english', 'Your subscription request at course [course] has been refused by the administrator', '2015-08-26 00:52:18'),
(2266, 'english', 'For this course you must select only [max_subscribe] users to subscribe', '2015-08-26 00:52:18'),
(2267, 'english', 'Select file(s) to import', '2015-08-26 00:52:18'),
(2268, 'english', 'Import users from course', '2015-08-26 00:52:18'),
(2269, 'english', 'Use first row as header', '2015-08-26 00:52:18'),
(2270, 'english', 'For import use a file with a users list (one per row)', '2015-08-26 00:52:18'),
(2271, 'english', 'Correct insertions', '2015-08-26 00:52:18');
INSERT INTO `core_lang_translation` (`id_text`, `lang_code`, `translation_text`, `save_date`) VALUES
(2272, 'english', 'Insertions not necessary', '2015-08-26 00:52:18'),
(2273, 'english', 'Insertion status', '2015-08-26 00:52:18'),
(2274, 'english', 'Yes, justified', '2015-08-26 00:52:18'),
(2275, 'english', 'Level of users to import', '2015-08-26 00:52:18'),
(2276, 'english', 'Move', '2015-08-26 00:52:18'),
(2277, 'english', 'Move Subscriptions', '2015-08-26 00:52:18'),
(2278, 'english', 'Without expiration', '2015-08-26 00:52:18'),
(2279, 'english', 'Not expired', '2015-08-26 00:52:18'),
(2280, 'english', 'Yes, not justified', '2015-08-26 00:52:18'),
(2281, 'english', 'Not necessary, already subscribed to course', '2015-08-26 00:52:18'),
(2282, 'english', 'Only expired', '2015-08-26 00:52:18'),
(2283, 'english', 'Remove validity dates', '2015-08-26 00:52:18'),
(2284, 'english', 'Select who wants to confirm', '2015-08-26 00:52:18'),
(2285, 'english', 'Send an alert to subscribed users', '2015-08-26 00:52:18'),
(2286, 'english', 'Show only', '2015-08-26 00:52:18'),
(2287, 'english', 'Status of users to import', '2015-08-26 00:52:18'),
(2288, 'english', 'Subscribe', '2015-08-26 00:52:18'),
(2289, 'english', 'Confirmation text (will be sent to the user)', '2015-08-26 00:52:18'),
(2290, 'english', 'Not acceptance text (will be sent to the user)', '2015-08-26 00:52:18'),
(2291, 'english', 'List of selected user, choose a level', '2015-08-26 00:52:18'),
(2292, 'english', 'List of users waiting for the approval', '2015-08-26 00:52:18'),
(2293, 'english', 'User is busy in the same period', '2015-08-26 00:52:18'),
(2294, 'english', 'Overbooking', '2015-08-26 00:52:18'),
(2295, 'english', 'Detailes of subscriptions', '2015-08-26 00:52:18'),
(2296, 'english', 'Valid at date', '2015-08-26 00:52:18'),
(2297, 'english', 'Do nothing', '2015-08-26 00:52:18'),
(2298, 'english', 'You can subscribe only [user_subscribe_limit] before reach your subscrition limit', '2015-08-26 00:52:18'),
(2299, 'english', 'Confirm Subscription', '2015-08-26 00:52:18'),
(2300, 'english', 'New message', '2015-08-26 00:52:18'),
(2301, 'english', 'This message has been locked', '2015-08-26 00:52:18'),
(2302, 'english', 'Lock message', '2015-08-26 00:52:18'),
(2303, 'english', 'Popular', '2015-08-26 00:52:18'),
(2304, 'english', 'Use commas to separate tags.', '2015-08-26 00:52:18'),
(2305, 'english', 'Yours', '2015-08-26 00:52:18'),
(2306, 'english', 'Any difficulty', '2015-08-26 00:52:18'),
(2307, 'english', 'Any category', '2015-08-26 00:52:18'),
(2308, 'english', 'Any type', '2015-08-26 00:52:18'),
(2309, 'english', 'Attempts remaining before suspension', '2015-08-26 00:52:18'),
(2310, 'english', 'Bonus assigned for this test (with round or manual modification)', '2015-08-26 00:52:18'),
(2311, 'english', 'Selected answer', '2015-08-26 00:52:18'),
(2312, 'english', 'Deselect page', '2015-08-26 00:52:18'),
(2313, 'english', 'Empty answer', '2015-08-26 00:52:18'),
(2314, 'english', 'Feedback management', '2015-08-26 00:52:18'),
(2315, 'english', 'Textual feedback', '2015-08-26 00:52:18'),
(2316, 'english', 'GIFT', '2015-08-26 00:52:18'),
(2317, 'english', 'Hard', '2015-08-26 00:52:18'),
(2318, 'english', 'Ask the user to answer all questions', '2015-08-26 00:52:18'),
(2319, 'english', 'Maximum number of attempts to answer the test (set 0 for no limits)', '2015-08-26 00:52:18'),
(2320, 'english', 'You must answer all questions to proceed with the test.', '2015-08-26 00:52:18'),
(2321, 'english', 'Assign a new score for this question', '2015-08-26 00:52:18'),
(2322, 'english', 'As a new test', '2015-08-26 00:52:18'),
(2323, 'english', 'Number of remaining attempts <b>[remaining_attempt]</b>', '2015-08-26 00:52:18'),
(2324, 'english', 'Random choice per category', '2015-08-26 00:52:18'),
(2325, 'english', '(sub-group of question)', '2015-08-26 00:52:18'),
(2326, 'english', 'Question', '2015-08-26 00:52:18'),
(2327, 'english', 'AS', '2015-08-26 00:52:18'),
(2328, 'english', 'BR', '2015-08-26 00:52:18'),
(2329, 'english', 'SC', '2015-08-26 00:52:18'),
(2330, 'english', 'MC', '2015-08-26 00:52:18'),
(2331, 'english', 'ET', '2015-08-26 00:52:18'),
(2332, 'english', 'HT', '2015-08-26 00:52:18'),
(2333, 'english', 'IC', '2015-08-26 00:52:18'),
(2334, 'english', 'TE', '2015-08-26 00:52:18'),
(2335, 'english', 'TL', '2015-08-26 00:52:18'),
(2336, 'english', 'UP', '2015-08-26 00:52:18'),
(2337, 'english', 'Answer...', '2015-08-26 00:52:18'),
(2338, 'english', 'Association', '2015-08-26 00:52:18'),
(2339, 'english', 'Page break', '2015-08-26 00:52:18'),
(2340, 'english', 'Single Choice', '2015-08-26 00:52:18'),
(2341, 'english', 'Multiple Choice', '2015-08-26 00:52:18'),
(2342, 'english', 'Extended Text', '2015-08-26 00:52:18'),
(2343, 'english', 'Write here...', '2015-08-26 00:52:18'),
(2344, 'english', 'Hot Text (find the wrong word)', '2015-08-26 00:52:18'),
(2345, 'english', 'write [answerN]', '2015-08-26 00:52:18'),
(2346, 'english', 'Inline Choice', '2015-08-26 00:52:18'),
(2347, 'english', 'Students can anwser using a select menu that appears in the position of [anwser] tag', '2015-08-26 00:52:18'),
(2348, 'english', 'No errors', '2015-08-26 00:52:18'),
(2349, 'english', 'Reference tag', '2015-08-26 00:52:18'),
(2350, 'english', 'Text Entry', '2015-08-26 00:52:18'),
(2351, 'english', 'Answer Here', '2015-08-26 00:52:18'),
(2352, 'english', 'Title (no answer)', '2015-08-26 00:52:18'),
(2353, 'english', 'Difference with previous time: [time_difference]', '2015-08-26 00:52:18'),
(2354, 'english', 'Difference between previous total score', '2015-08-26 00:52:18'),
(2355, 'english', 'Set difficult', '2015-08-26 00:52:18'),
(2356, 'english', 'Set score', '2015-08-26 00:52:18'),
(2357, 'english', 'Set time:', '2015-08-26 00:52:18'),
(2358, 'english', 'Upload file', '2015-08-26 00:52:18'),
(2359, 'english', 'Restart test execution from beginning', '2015-08-26 00:52:18'),
(2360, 'english', 'Select page', '2015-08-26 00:52:18'),
(2361, 'english', 'Suspend the test after the following number of failed attempts', '2015-08-26 00:52:18'),
(2362, 'english', 'Suspend the test for the following number of hours', '2015-08-26 00:52:18'),
(2363, 'english', 'After the test suspension, require a new completion of all the test prerequisites', '2015-08-26 00:52:18'),
(2364, 'english', 'Add question', '2015-08-26 00:52:18'),
(2365, 'english', 'Description is shown to students before attempting the test', '2015-08-26 00:52:18'),
(2366, 'english', 'Add one more anwser', '2015-08-26 00:52:18'),
(2367, 'english', 'after row', '2015-08-26 00:52:18'),
(2368, 'english', 'Answers :', '2015-08-26 00:52:18'),
(2369, 'english', 'Selected', '2015-08-26 00:52:18'),
(2370, 'english', 'Not selected', '2015-08-26 00:52:18'),
(2371, 'english', 'Correct association', '2015-08-26 00:52:18'),
(2372, 'english', 'Back to score administration page', '2015-08-26 00:52:18'),
(2373, 'english', 'Click to begin', '2015-08-26 00:52:18'),
(2374, 'english', 'You can jump to the next or previous page (if the test has multiple pages)', '2015-08-26 00:52:18'),
(2375, 'english', 'You can <b>not</b> jump to the next or previous page (if the test has multiple pages)', '2015-08-26 00:52:18'),
(2376, 'english', 'Complete list of questions available in the test. ( %tot_element% elements in %tot_page% pages)', '2015-08-26 00:52:18'),
(2377, 'english', 'Time administration', '2015-08-26 00:52:18'),
(2378, 'english', 'Test completed', '2015-08-26 00:52:18'),
(2379, 'english', 'Resume the test', '2015-08-26 00:52:18'),
(2380, 'english', 'Correct', '2015-08-26 00:52:18'),
(2381, 'english', 'OK', '2015-08-26 00:52:18'),
(2382, 'english', 'Submit (test completed)', '2015-08-26 00:52:18'),
(2383, 'english', 'Not passed', '2015-08-26 00:52:18'),
(2384, 'english', 'You didn''t upload any file', '2015-08-26 00:52:18'),
(2385, 'english', 'as first', '2015-08-26 00:52:18'),
(2386, 'english', 'Select answer', '2015-08-26 00:52:18'),
(2387, 'english', 'If correct', '2015-08-26 00:52:18'),
(2388, 'english', 'If wrong', '2015-08-26 00:52:18'),
(2389, 'english', 'Wrong', '2015-08-26 00:52:18'),
(2390, 'english', 'Information about the test', '2015-08-26 00:52:18'),
(2391, 'english', 'New Test', '2015-08-26 00:52:18'),
(2392, 'english', 'Correct anwser', '2015-08-26 00:52:18'),
(2393, 'english', 'the right answer is:', '2015-08-26 00:52:18'),
(2394, 'english', ', was the right choice', '2015-08-26 00:52:18'),
(2395, 'english', 'as last', '2015-08-26 00:52:18'),
(2396, 'english', 'Some questions need instructor''s grading. Your score could increase of:', '2015-08-26 00:52:18'),
(2397, 'english', 'Max Score: <b>[max_score]</b>', '2015-08-26 00:52:18'),
(2398, 'english', 'Answers view', '2015-08-26 00:52:18'),
(2399, 'english', 'Random (if allowed by question type)', '2015-08-26 00:52:18'),
(2400, 'english', 'Arrange in sequence', '2015-08-26 00:52:18'),
(2401, 'english', 'Show questions grouped in one or more pages (clustering by break pages)', '2015-08-26 00:52:18'),
(2402, 'english', 'show one question per page', '2015-08-26 00:52:18'),
(2403, 'english', 'Random choice of [random_quest] questions on  <b>[tot_quest]</b> available.', '2015-08-26 00:52:18'),
(2404, 'english', '(All questions) Random (clustering by break page)', '2015-08-26 00:52:18'),
(2405, 'english', '(All questions) Arranged in sequence', '2015-08-26 00:52:18'),
(2406, 'english', 'Allow backtracking (button Previous Page active)', '2015-08-26 00:52:18'),
(2407, 'english', 'Hide info for test in use', '2015-08-26 00:52:18'),
(2408, 'english', 'Allow answers edit', '2015-08-26 00:52:18'),
(2409, 'english', 'Allow attempts in more sessions (saving questions answered)', '2015-08-26 00:52:18'),
(2410, 'english', 'Show score grouped by question category (if it''s calculable)', '2015-08-26 00:52:18'),
(2411, 'english', 'Show all the answers inserted by user', '2015-08-26 00:52:18'),
(2412, 'english', 'Show correct answers', '2015-08-26 00:52:18'),
(2413, 'english', 'Show final score (if it''s calculable)', '2015-08-26 00:52:18'),
(2414, 'english', '3 - Details shown at the end of attempt', '2015-08-26 00:52:18'),
(2415, 'english', '1 - set questions visualization', '2015-08-26 00:52:18'),
(2416, 'english', '2-  set attempts option', '2015-08-26 00:52:18'),
(2417, 'english', 'Test options', '2015-08-26 00:52:18'),
(2418, 'english', 'You can edit the answer', '2015-08-26 00:52:18'),
(2419, 'english', 'You <span class="text_bold">can''t</span>  edit the answer', '2015-08-26 00:52:18'),
(2420, 'english', 'row', '2015-08-26 00:52:18'),
(2421, 'english', 'Next page', '2015-08-26 00:52:18'),
(2422, 'english', 'the correct answer is', '2015-08-26 00:52:18'),
(2423, 'english', 'is wrong', '2015-08-26 00:52:18'),
(2424, 'english', 'is wrong', '2015-08-26 00:52:18'),
(2425, 'english', 'Right answer', '2015-08-26 00:52:18'),
(2426, 'english', 'Page', '2015-08-26 00:52:18'),
(2427, 'english', 'Express score as percentage', '2015-08-26 00:52:18'),
(2428, 'english', 'Express score as points', '2015-08-26 00:52:18'),
(2429, 'english', 'Min score required to pass the test', '2015-08-26 00:52:18'),
(2430, 'english', 'Different amount based on question difficulty', '2015-08-26 00:52:18'),
(2431, 'english', 'Same point for each question (total score/number of question)', '2015-08-26 00:52:18'),
(2432, 'english', 'Choose score for every question', '2015-08-26 00:52:18'),
(2433, 'english', '1 - set final score calculation', '2015-08-26 00:52:18'),
(2434, 'english', 'Set score preferences', '2015-08-26 00:52:18'),
(2435, 'english', 'Distributed by', '2015-08-26 00:52:18'),
(2436, 'english', '2 - Set score for each question', '2015-08-26 00:52:18'),
(2437, 'english', 'Administration points', '2015-08-26 00:52:18'),
(2438, 'english', 'Points Management', '2015-08-26 00:52:18'),
(2439, 'english', 'Previous page', '2015-08-26 00:52:18'),
(2440, 'english', 'The test has <b>[question_number]</b> questions', '2015-08-26 00:52:18'),
(2441, 'english', 'Question category', '2015-08-26 00:52:18'),
(2442, 'english', 'element', '2015-08-26 00:52:18'),
(2443, 'english', 'Group A elements', '2015-08-26 00:52:18'),
(2444, 'english', 'Group B elements', '2015-08-26 00:52:18'),
(2445, 'english', 'N. elements', '2015-08-26 00:52:18'),
(2446, 'english', 'Maximum test score', '2015-08-26 00:52:18'),
(2447, 'english', 'New max score', '2015-08-26 00:52:18'),
(2448, 'english', 'Order', '2015-08-26 00:52:18'),
(2449, 'english', 'Next (set right associations)', '2015-08-26 00:52:18'),
(2450, 'english', 'Max answer time', '2015-08-26 00:52:18'),
(2451, 'english', 'Time assigned (seconds)', '2015-08-26 00:52:18'),
(2452, 'english', 'Pass mark: <b>[score_req]</b>', '2015-08-26 00:52:18'),
(2453, 'english', 'Pass Mark:', '2015-08-26 00:52:18'),
(2454, 'english', 'Restart test', '2015-08-26 00:52:18'),
(2455, 'english', 'Show your answers', '2015-08-26 00:52:18'),
(2456, 'english', 'For this test there is an outstanding compilation: do you want to resume or to do it again?', '2015-08-26 00:52:18'),
(2457, 'english', 'You can save and resume test later', '2015-08-26 00:52:18'),
(2458, 'english', 'Back to course', '2015-08-26 00:52:18'),
(2459, 'english', 'Back to test', '2015-08-26 00:52:18'),
(2460, 'english', 'Test must be completed now. It <span class="text_bold">cannot</span> be resumed later', '2015-08-26 00:52:18'),
(2461, 'english', 'Save test, you can resume later', '2015-08-26 00:52:18'),
(2462, 'english', 'Points', '2015-08-26 00:52:18'),
(2463, 'english', 'Test', '2015-08-26 00:52:18'),
(2464, 'english', 'Choose answers from library', '2015-08-26 00:52:18'),
(2465, 'english', 'Show last results', '2015-08-26 00:52:18'),
(2466, 'english', 'Final score will be shown after the test completion', '2015-08-26 00:52:18'),
(2467, 'english', 'Final score will not be shown after the test completion', '2015-08-26 00:52:18'),
(2468, 'english', 'Solutions will be shown after the test completion', '2015-08-26 00:52:18'),
(2469, 'english', 'You <span class="text_bold">can''t</span> know the right answer to questions after completing the test', '2015-08-26 00:52:18'),
(2470, 'english', 'Remove last answer', '2015-08-26 00:52:18'),
(2471, 'english', 'Test question list', '2015-08-26 00:52:18'),
(2472, 'english', 'Test has been suspended', '2015-08-26 00:52:18'),
(2473, 'english', 'The test has been suspended until', '2015-08-26 00:52:18'),
(2474, 'english', 'answer text', '2015-08-26 00:52:18'),
(2475, 'english', 'Choose the right word', '2015-08-26 00:52:18'),
(2476, 'english', 'Test time limit : <b>[time_assigned] minutes</b>', '2015-08-26 00:52:18'),
(2477, 'english', '<span class="text_bold">No</span> time limits', '2015-08-26 00:52:18'),
(2478, 'english', 'A time limit is defined for each question', '2015-08-26 00:52:18'),
(2479, 'english', 'Admin Attempting time', '2015-08-26 00:52:18'),
(2480, 'english', 'No time limit', '2015-08-26 00:52:18'),
(2481, 'english', 'Time limit, test based', '2015-08-26 00:52:18'),
(2482, 'english', 'Time limit question based; every question has a specific time limit', '2015-08-26 00:52:18'),
(2483, 'english', 'Test time limited', '2015-08-26 00:52:18'),
(2484, 'english', 'Set difficulty and score for each question', '2015-08-26 00:52:18'),
(2485, 'english', 'same time for each question (total time/number of question)', '2015-08-26 00:52:18'),
(2486, 'english', 'Choose a time limit for the answer to each question', '2015-08-26 00:52:18'),
(2487, 'english', 'New total time', '2015-08-26 00:52:18'),
(2488, 'english', 'New total time :', '2015-08-26 00:52:18'),
(2489, 'english', 'penalty if question time limit has been exceeded', '2015-08-26 00:52:18'),
(2490, 'english', 'penalty if total time limit has been exceeded', '2015-08-26 00:52:18'),
(2491, 'english', 'Apply changes', '2015-08-26 00:52:18'),
(2492, 'english', 'Apply and Set time', '2015-08-26 00:52:18'),
(2493, 'english', 'Distributed by:', '2015-08-26 00:52:18'),
(2494, 'english', 'Set time assigned to the questions', '2015-08-26 00:52:18'),
(2495, 'english', '1 - set Test time', '2015-08-26 00:52:18'),
(2496, 'english', 'Set time for each question', '2015-08-26 00:52:18'),
(2497, 'english', '2 - Set total time for attempting', '2015-08-26 00:52:18'),
(2498, 'english', 'Total score:', '2015-08-26 00:52:18'),
(2499, 'english', 'This test does not support the action required', '2015-08-26 00:52:18'),
(2500, 'english', 'Time elapsed', '2015-08-26 00:52:18'),
(2501, 'english', 'Time left', '2015-08-26 00:52:18'),
(2502, 'english', 'You didn''t complete the prerequisites', '2015-08-26 00:52:18'),
(2503, 'english', 'Use test suspension', '2015-08-26 00:52:18'),
(2504, 'english', 'Very hard', '2015-08-26 00:52:18'),
(2505, 'english', 'Yes, if the test has been passed', '2015-08-26 00:52:18'),
(2506, 'english', 'Mark as paid', '2015-08-26 00:52:18'),
(2507, 'english', 'Price', '2015-08-26 00:52:18'),
(2508, 'english', 'Set as not paid', '2015-08-26 00:52:18'),
(2509, 'english', 'Empty', '2015-08-26 00:52:18'),
(2510, 'english', 'Don''t use self registration in the organizational tree', '2015-08-26 00:52:18'),
(2511, 'english', 'Login/registration options', '2015-08-26 00:52:18'),
(2512, 'english', 'No selections have been made', '2015-08-26 00:52:18'),
(2513, 'english', 'You have failed to log in for [attempt] times, for security reasons wait [time] minutes before trying again', '2015-08-26 00:52:18'),
(2514, 'english', 'Only by administrator', '2015-08-26 00:52:18'),
(2515, 'english', 'Moderated self registration', '2015-08-26 00:52:18'),
(2516, 'english', 'Free self registration', '2015-08-26 00:52:18'),
(2517, 'english', 'Subscription code inserted manually', '2015-08-26 00:52:18'),
(2518, 'english', 'Subscription code chosen from a dropdown menu', '2015-08-26 00:52:18'),
(2519, 'english', 'Add wiki', '2015-08-26 00:52:18'),
(2520, 'english', 'Go to this page', '2015-08-26 00:52:18'),
(2521, 'english', 'View page revision', '2015-08-26 00:52:18'),
(2522, 'english', 'Compare selected versions', '2015-08-26 00:52:18'),
(2523, 'english', 'Export selected pages', '2015-08-26 00:52:18'),
(2524, 'english', 'To create a new page and link write  [[page|title]] or only [[page]] if title and name are the same', '2015-08-26 00:52:18'),
(2525, 'english', 'Index', '2015-08-26 00:52:18'),
(2526, 'english', 'Level up', '2015-08-26 00:52:18'),
(2527, 'english', 'Map', '2015-08-26 00:52:18'),
(2528, 'english', 'Other language', '2015-08-26 00:52:18'),
(2529, 'english', 'Page', '2015-08-26 00:52:18'),
(2530, 'english', 'Please specify some text to search (at least 3 characters)', '2015-08-26 00:52:18'),
(2531, 'english', 'Revisions', '2015-08-26 00:52:18'),
(2532, 'english', 'Select a wiki', '2015-08-26 00:52:18'),
(2533, 'english', 'choose a wiki', '2015-08-26 00:52:18'),
(2534, 'english', 'Wiki', '2015-08-26 00:52:18'),
(2535, 'english', 'Index', '2015-08-26 00:52:18'),
(2536, 'english', 'WARNING: if you proceed with SAVE, this page will become the last version', '2015-08-26 00:52:18'),
(2537, 'english', 'default language', '2015-08-26 00:52:18'),
(2538, 'english', 'Level up', '2015-08-26 00:52:18'),
(2539, 'english', 'select other languages for pages', '2015-08-26 00:52:18'),
(2540, 'english', 'Prev.', '2015-08-26 00:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `core_menu`
--

CREATE TABLE IF NOT EXISTS `core_menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `collapse` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `core_menu`
--

INSERT INTO `core_menu` (`idMenu`, `name`, `image`, `sequence`, `collapse`) VALUES
(1, '', '', 1, 'true'),
(2, '_USER_MANAGMENT', '', 2, 'false'),
(3, '_TRASV_MANAGMENT', '', 3, 'false'),
(4, '_ADMINISTRATORS', '', 4, 'false'),
(5, '_LANGUAGE', '', 5, 'false'),
(6, '', '', 6, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `core_menu_under`
--

CREATE TABLE IF NOT EXISTS `core_menu_under` (
  `idUnder` int(11) NOT NULL AUTO_INCREMENT,
  `idMenu` int(11) NOT NULL DEFAULT '0',
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `default_name` varchar(255) NOT NULL DEFAULT '',
  `default_op` varchar(255) NOT NULL DEFAULT '',
  `associated_token` varchar(255) NOT NULL DEFAULT '',
  `of_platform` varchar(255) DEFAULT NULL,
  `sequence` int(3) NOT NULL DEFAULT '0',
  `class_file` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `mvc_path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idUnder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `core_menu_under`
--

INSERT INTO `core_menu_under` (`idUnder`, `idMenu`, `module_name`, `default_name`, `default_op`, `associated_token`, `of_platform`, `sequence`, `class_file`, `class_name`, `mvc_path`) VALUES
(1, 1, 'dashboard', '_DASHBOARD', '', 'view', NULL, 1, '', '', 'adm/dashboard/show'),
(3, 2, 'groupmanagement', '_MANAGE_GROUPS', '', 'view', NULL, 2, '', '', 'adm/groupmanagement/show'),
(4, 3, 'field_manager', '_FIELD_MANAGER', 'field_list', 'view', NULL, 3, 'class.field_manager.php', 'Module_Field_Manager', ''),
(5, 3, 'setting', '_CONFIGURATION', '', 'view', NULL, 1, 'class.configuration.php', 'Module_Configuration', 'adm/setting/show'),
(7, 3, 'event_manager', '_EVENTMANAGER', 'display', 'view_event_manager', NULL, 3, 'class.event_manager.php', 'Module_Event_Manager', ''),
(8, 3, 'iotask', '_IOTASK', 'iotask', 'view', NULL, 4, 'class.iotask.php', 'Module_IOTask', ''),
(9, 3, 'pluginmanager', '_PLUGIN_MANAGER', '', 'view', NULL, 7, '', '', 'adm/pluginmanager/show'),
(10, 5, 'lang', '_LANG', '', 'view', NULL, 1, '', '', 'adm/lang/show'),
(13, 6, 'newsletter', '_NEWSLETTER', 'newsletter', 'view', NULL, 1, 'class.newsletter.php', 'Module_Newsletter', ''),
(16, 2, 'usermanagement', '_LISTUSER', '', 'view', NULL, 1, '', '', 'adm/usermanagement/show'),
(18, 4, 'adminrules', '_ADMIN_RULES', '', 'view', NULL, 1, '', '', 'adm/adminrules/show'),
(19, 4, 'publicadminrules', '_PUBLIC_ADMIN_RULES', '', 'view', NULL, 1, '', '', 'adm/publicadminrules/show'),
(20, 4, 'adminmanager', '_ADMIN_MANAGER', '', 'view', NULL, 1, '', '', 'adm/adminmanager/show'),
(21, 4, 'publicadminmanager', '_PUBLIC_ADMIN_MANAGER', '', 'view', NULL, 1, '', '', 'adm/publicadminmanager/show'),
(22, 2, 'functionalroles', '_FUNCTIONAL_ROLE', '', 'view', NULL, 4, '', '', 'adm/functionalroles/show'),
(23, 2, 'competences', '_COMPETENCES', '', 'view', NULL, 3, '', '', 'adm/competences/show'),
(24, 3, 'code', '_CODE', 'list', 'view', NULL, 5, 'class.code.php', 'Module_Code', ''),
(25, 3, 'privacypolicy', '_PRIVACYPOLICIES', '', 'view', NULL, 6, '', '', 'adm/privacypolicy/show');

-- --------------------------------------------------------

--
-- Table structure for table `core_message`
--

CREATE TABLE IF NOT EXISTS `core_message` (
  `idMessage` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `sender` int(11) NOT NULL DEFAULT '0',
  `posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `textof` text NOT NULL,
  `attach` varchar(255) NOT NULL DEFAULT '',
  `priority` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMessage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_message_user`
--

CREATE TABLE IF NOT EXISTS `core_message_user` (
  `idMessage` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMessage`,`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_newsletter`
--

CREATE TABLE IF NOT EXISTS `core_newsletter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_send` int(11) NOT NULL DEFAULT '0',
  `sub` varchar(255) NOT NULL DEFAULT '',
  `msg` text NOT NULL,
  `fromemail` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(255) NOT NULL DEFAULT '',
  `tot` int(11) NOT NULL DEFAULT '0',
  `send_type` enum('email','sms') NOT NULL DEFAULT 'email',
  `stime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `file` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_newsletter_sendto`
--

CREATE TABLE IF NOT EXISTS `core_newsletter_sendto` (
  `id_send` int(11) NOT NULL DEFAULT '0',
  `idst` int(11) NOT NULL DEFAULT '0',
  `stime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_send`,`idst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_org_chart`
--

CREATE TABLE IF NOT EXISTS `core_org_chart` (
  `id_dir` int(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(50) NOT NULL DEFAULT '',
  `translation` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_dir`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_org_chart_field`
--

CREATE TABLE IF NOT EXISTS `core_org_chart_field` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `id_field` varchar(11) NOT NULL DEFAULT '0',
  `mandatory` enum('true','false') NOT NULL DEFAULT 'false',
  `useraccess` enum('readonly','readwrite','noaccess') NOT NULL DEFAULT 'readonly',
  PRIMARY KEY (`idst`,`id_field`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_org_chart_fieldentry`
--

CREATE TABLE IF NOT EXISTS `core_org_chart_fieldentry` (
  `id_common` varchar(11) NOT NULL DEFAULT '',
  `id_common_son` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `user_entry` text NOT NULL,
  PRIMARY KEY (`id_common`,`id_common_son`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_org_chart_tree`
--

CREATE TABLE IF NOT EXISTS `core_org_chart_tree` (
  `idOrg` int(11) NOT NULL AUTO_INCREMENT,
  `idParent` int(11) NOT NULL DEFAULT '0',
  `path` text NOT NULL,
  `lev` int(3) NOT NULL DEFAULT '0',
  `iLeft` int(5) NOT NULL DEFAULT '0',
  `iRight` int(5) NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL DEFAULT '',
  `idst_oc` int(11) NOT NULL DEFAULT '0',
  `idst_ocd` int(11) NOT NULL DEFAULT '0',
  `associated_policy` int(11) unsigned DEFAULT NULL,
  `associated_template` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idOrg`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_password_history`
--

CREATE TABLE IF NOT EXISTS `core_password_history` (
  `idst_user` int(11) NOT NULL DEFAULT '0',
  `pwd_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `passw` varchar(100) NOT NULL DEFAULT '',
  `changed_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idst_user`,`pwd_date`),
  KEY `pwd_date` (`pwd_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_platform`
--

CREATE TABLE IF NOT EXISTS `core_platform` (
  `platform` varchar(255) NOT NULL DEFAULT '',
  `class_file` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `class_file_menu` varchar(255) NOT NULL DEFAULT '',
  `class_name_menu` varchar(255) NOT NULL DEFAULT '',
  `class_name_menu_managment` varchar(255) NOT NULL DEFAULT '',
  `file_class_config` varchar(255) NOT NULL DEFAULT '',
  `class_name_config` varchar(255) NOT NULL DEFAULT '',
  `var_default_template` varchar(255) NOT NULL DEFAULT '',
  `class_default_admin` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `is_active` enum('true','false') NOT NULL DEFAULT 'true',
  `mandatory` enum('true','false') NOT NULL DEFAULT 'true',
  `dependencies` text NOT NULL,
  `main` enum('true','false') NOT NULL DEFAULT 'true',
  `hidden_in_config` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`platform`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_platform`
--

INSERT INTO `core_platform` (`platform`, `class_file`, `class_name`, `class_file_menu`, `class_name_menu`, `class_name_menu_managment`, `file_class_config`, `class_name_config`, `var_default_template`, `class_default_admin`, `sequence`, `is_active`, `mandatory`, `dependencies`, `main`, `hidden_in_config`) VALUES
('framework', '', '', 'class.admin_menu_fw.php', 'Admin_Framework', 'Admin_Managment_Framework', 'class.conf_fw.php', 'Config_Framework', 'defaultTemplate', 'Module', 1, 'true', 'true', '', 'false', 'false'),
('lms', '', '', 'class.admin_menu_lms.php', 'Admin_Lms', 'Admin_Managment_Lms', 'class.conf_lms.php', 'Config_Lms', 'defaultTemplate', 'LmsAdminModule', 2, 'true', 'false', '', 'true', 'false'),
('scs', '', '', 'class.admin_menu_scs.php', 'Admin_Scs', '', 'class.conf_scs.php', 'Config_Scs', 'defaultTemplate', 'ScsAdminModule', 4, 'true', 'false', '', 'false', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `core_plugin`
--

CREATE TABLE IF NOT EXISTS `core_plugin` (
  `plugin_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `version` varchar(16) NOT NULL,
  `author` varchar(128) NOT NULL,
  `link` varchar(255) NOT NULL,
  `priority` int(5) NOT NULL,
  `description` text NOT NULL,
  `active` int(1) NOT NULL,
  PRIMARY KEY (`plugin_id`),
  UNIQUE KEY `name` (`name`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_privacypolicy`
--

CREATE TABLE IF NOT EXISTS `core_privacypolicy` (
  `id_policy` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_policy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_privacypolicy_lang`
--

CREATE TABLE IF NOT EXISTS `core_privacypolicy_lang` (
  `id_policy` int(11) unsigned NOT NULL DEFAULT '0',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `translation` text NOT NULL,
  PRIMARY KEY (`id_policy`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_pwd_recover`
--

CREATE TABLE IF NOT EXISTS `core_pwd_recover` (
  `idst_user` int(11) NOT NULL DEFAULT '0',
  `random_code` varchar(255) NOT NULL DEFAULT '',
  `request_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idst_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_reg_list`
--

CREATE TABLE IF NOT EXISTS `core_reg_list` (
  `region_id` varchar(100) NOT NULL DEFAULT '',
  `lang_code` varchar(50) NOT NULL DEFAULT '',
  `region_desc` varchar(255) NOT NULL DEFAULT '',
  `default_region` tinyint(1) NOT NULL DEFAULT '0',
  `browsercode` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_reg_list`
--

INSERT INTO `core_reg_list` (`region_id`, `lang_code`, `region_desc`, `default_region`, `browsercode`) VALUES
('england', 'english', 'england, usa, ...', 0, 'en-EN, en-US'),
('italy', 'italian', 'Italia', 1, 'it');

-- --------------------------------------------------------

--
-- Table structure for table `core_reg_setting`
--

CREATE TABLE IF NOT EXISTS `core_reg_setting` (
  `region_id` varchar(100) NOT NULL DEFAULT '',
  `val_name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`region_id`,`val_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_reg_setting`
--

INSERT INTO `core_reg_setting` (`region_id`, `val_name`, `value`) VALUES
('england', 'custom_date_format', ''),
('england', 'custom_time_format', ''),
('england', 'date_format', 'd_m_Y'),
('england', 'date_sep', '/'),
('england', 'time_format', 'H_i'),
('italy', 'custom_date_format', ''),
('italy', 'custom_time_format', ''),
('italy', 'date_format', 'd_m_Y'),
('italy', 'date_sep', '-'),
('italy', 'time_format', 'H_i');

-- --------------------------------------------------------

--
-- Table structure for table `core_rest_authentication`
--

CREATE TABLE IF NOT EXISTS `core_rest_authentication` (
  `id_user` int(11) NOT NULL DEFAULT '0',
  `user_level` int(11) NOT NULL DEFAULT '0',
  `token` varchar(255) NOT NULL DEFAULT '',
  `generation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_enter_date` datetime DEFAULT NULL,
  `expiry_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_revision`
--

CREATE TABLE IF NOT EXISTS `core_revision` (
  `type` enum('wiki','faq') NOT NULL DEFAULT 'faq',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `sub_key` varchar(80) NOT NULL DEFAULT '0',
  `author` int(11) NOT NULL DEFAULT '0',
  `rev_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` longtext NOT NULL,
  PRIMARY KEY (`type`,`parent_id`,`version`,`sub_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_role`
--

CREATE TABLE IF NOT EXISTS `core_role` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `roleid` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idst`),
  KEY `roleid` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

--
-- Dumping data for table `core_role`
--

INSERT INTO `core_role` (`idst`, `roleid`, `description`) VALUES
(7, '/framework/admin/adminmanager/mod', NULL),
(8, '/framework/admin/adminmanager/view', NULL),
(9, '/framework/admin/adminrules/view', NULL),
(10, '/framework/admin/dashboard/view', NULL),
(11, '/framework/admin/dashboard/view', NULL),
(12, '/framework/admin/directory/approve_waiting_user', NULL),
(13, '/framework/admin/event_manager/view_event_manager', NULL),
(14, '/framework/admin/field_manager/add', NULL),
(15, '/framework/admin/field_manager/del', NULL),
(16, '/framework/admin/field_manager/mod', NULL),
(17, '/framework/admin/field_manager/view', NULL),
(18, '/framework/admin/groupmanagement/add', NULL),
(19, '/framework/admin/groupmanagement/associate_user', NULL),
(20, '/framework/admin/groupmanagement/del', NULL),
(21, '/framework/admin/groupmanagement/mod', NULL),
(22, '/framework/admin/groupmanagement/view', NULL),
(23, '/framework/admin/iotask/view', NULL),
(24, '/framework/admin/kb/mod', NULL),
(25, '/framework/admin/kb/view', NULL),
(26, '/framework/admin/lang/mod', NULL),
(27, '/framework/admin/lang/view', NULL),
(28, '/framework/admin/newsletter/view', NULL),
(29, '/framework/admin/publicadminmanager/mod', NULL),
(30, '/framework/admin/publicadminmanager/view', NULL),
(31, '/framework/admin/usermanagement/add', NULL),
(32, '/framework/admin/usermanagement/approve_waiting_user', NULL),
(33, '/framework/admin/usermanagement/del', NULL),
(34, '/framework/admin/usermanagement/mod', NULL),
(35, '/framework/admin/usermanagement/view', NULL),
(36, '/lms/admin/amanmenu/mod', NULL),
(37, '/lms/admin/amanmenu/view', NULL),
(38, '/lms/admin/catalogue/mod', NULL),
(39, '/lms/admin/catalogue/view', NULL),
(40, '/lms/admin/certificate/mod', NULL),
(41, '/lms/admin/certificate/view', NULL),
(42, '/lms/admin/classroom/view', NULL),
(43, '/lms/admin/communication/mod', NULL),
(44, '/lms/admin/communication/view', NULL),
(45, '/lms/admin/course/add', NULL),
(46, '/lms/admin/course/del', NULL),
(47, '/lms/admin/course/mod', NULL),
(48, '/lms/admin/course/moderate', NULL),
(49, '/lms/admin/course/subscribe', NULL),
(50, '/lms/admin/course/view', NULL),
(51, '/lms/admin/coursepath/mod', NULL),
(52, '/lms/admin/coursepath/moderate', NULL),
(53, '/lms/admin/coursepath/subscribe', NULL),
(54, '/lms/admin/coursepath/view', NULL),
(55, '/lms/admin/enrollrules/view', NULL),
(56, '/lms/admin/games/mod', NULL),
(57, '/lms/admin/games/subscribe', NULL),
(58, '/lms/admin/games/view', NULL),
(59, '/lms/admin/internal_news/mod', NULL),
(60, '/lms/admin/internal_news/view', NULL),
(61, '/lms/admin/kb/view', NULL),
(62, '/lms/admin/label/view', NULL),
(63, '/lms/admin/middlearea/view', NULL),
(64, '/lms/admin/news/mod', NULL),
(65, '/lms/admin/news/view', NULL),
(66, '/lms/admin/preassessment/mod', NULL),
(67, '/lms/admin/preassessment/subscribe', NULL),
(68, '/lms/admin/preassessment/view', NULL),
(69, '/lms/admin/questcategory/mod', NULL),
(70, '/lms/admin/questcategory/view', NULL),
(71, '/lms/admin/report/mod', NULL),
(72, '/lms/admin/report/view', NULL),
(73, '/lms/admin/reservation/mod', NULL),
(74, '/lms/admin/reservation/view', NULL),
(75, '/lms/admin/timeperiods/mod', NULL),
(76, '/lms/admin/timeperiods/view', NULL),
(77, '/lms/admin/transaction/view', NULL),
(78, '/lms/admin/webpages/mod', NULL),
(79, '/lms/admin/webpages/view', NULL),
(80, '/lms/course/public/course/view', NULL),
(81, '/lms/course/public/course_autoregistration/view', NULL),
(82, '/lms/course/public/coursecatalogue/view', NULL),
(83, '/lms/course/public/message/send_all', NULL),
(84, '/lms/course/public/message/view', NULL),
(85, '/lms/course/public/mycertificate/view', NULL),
(86, '/lms/course/public/mycompetences/view', NULL),
(87, '/lms/course/public/mygroup/view', NULL),
(88, '/lms/course/public/profile/mod', NULL),
(89, '/lms/course/public/profile/view', NULL),
(90, '/lms/course/public/tprofile/view', NULL),
(91, '/lms/course/public/public_forum/view', NULL),
(92, '/lms/course/public/public_forum/add', NULL),
(93, '/lms/course/public/public_forum/del', NULL),
(94, '/lms/course/public/public_forum/mod', NULL),
(95, '/lms/course/public/public_forum/moderate', NULL),
(96, '/lms/course/public/public_forum/upload', NULL),
(97, '/lms/course/public/public_forum/write', NULL),
(98, '/lms/course/public/pcourse/add', NULL),
(99, '/lms/course/public/pcourse/del', NULL),
(100, '/lms/course/public/pcourse/mod', NULL),
(101, '/lms/course/public/pcourse/moderate', NULL),
(102, '/lms/course/public/pcourse/subscribe', NULL),
(103, '/lms/course/public/pcourse/view', NULL),
(104, '/lms/course/public/public_newsletter_admin/view', NULL),
(105, '/lms/course/public/public_report_admin/view', NULL),
(106, '/lms/course/public/public_subscribe_admin/approve_waiting_user', NULL),
(107, '/lms/course/public/public_subscribe_admin/createuser_org_chart', NULL),
(108, '/lms/course/public/public_subscribe_admin/deluser_org_chart', NULL),
(109, '/lms/course/public/public_subscribe_admin/edituser_org_chart', NULL),
(110, '/lms/course/public/public_subscribe_admin/view_org_chart', NULL),
(111, '/framework/admin/functionalroles/view', NULL),
(112, '/framework/admin/functionalroles/mod', NULL),
(113, '/framework/admin/functionalroles/associate_user', NULL),
(114, '/framework/admin/competences/view', NULL),
(115, '/framework/admin/competences/mod', NULL),
(116, '/framework/admin/competences/associate_user', NULL),
(117, '/framework/admin/publicadminrules/view', NULL),
(118, '/framework/admin/code/view', NULL),
(119, '/framework/admin/setting/view', NULL),
(120, '/lms/admin/meta_certificate/view', NULL),
(121, '/lms/admin/meta_certificate/mod', NULL),
(122, '/framework/admin/usermanagement/mod_org', NULL),
(123, '/lms/course/public/pusermanagement/view', NULL),
(124, '/lms/course/public/pusermanagement/add', NULL),
(125, '/lms/course/public/pusermanagement/mod', NULL),
(126, '/lms/course/public/pusermanagement/del', NULL),
(127, '/lms/course/public/pusermanagement/approve_waiting_user', NULL),
(175, '/lms/course/private/advice/mod', NULL),
(176, '/lms/course/private/advice/view', NULL),
(177, '/lms/course/private/calendar/mod', NULL),
(178, '/lms/course/private/calendar/personal', NULL),
(179, '/lms/course/private/calendar/view', NULL),
(180, '/lms/course/private/chat/view', NULL),
(181, '/lms/course/private/conference/mod', NULL),
(182, '/lms/course/private/conference/view', NULL),
(183, '/lms/course/private/course/mod', NULL),
(184, '/lms/course/private/course/view', NULL),
(185, '/lms/course/private/course/view_info', NULL),
(186, '/lms/course/private/coursereport/mod', NULL),
(187, '/lms/course/private/coursereport/view', NULL),
(188, '/lms/course/private/forum/add', NULL),
(189, '/lms/course/private/forum/del', NULL),
(190, '/lms/course/private/forum/mod', NULL),
(191, '/lms/course/private/forum/moderate', NULL),
(192, '/lms/course/private/forum/upload', NULL),
(193, '/lms/course/private/forum/view', NULL),
(194, '/lms/course/private/forum/write', NULL),
(195, '/lms/course/private/gradebook/view', NULL),
(196, '/lms/course/private/groups/mod', NULL),
(197, '/lms/course/private/groups/subscribe', NULL),
(198, '/lms/course/private/groups/view', NULL),
(199, '/lms/course/private/htmlfront/mod', NULL),
(200, '/lms/course/private/htmlfront/view', NULL),
(201, '/lms/course/private/light_repo/mod', NULL),
(202, '/lms/course/private/light_repo/view', NULL),
(203, '/lms/course/private/manmenu/mod', NULL),
(204, '/lms/course/private/manmenu/view', NULL),
(205, '/lms/course/private/newsletter/view', NULL),
(206, '/lms/course/private/notes/view', NULL),
(207, '/lms/course/private/organization/view', NULL),
(208, '/lms/course/private/project/add', NULL),
(209, '/lms/course/private/project/del', NULL),
(210, '/lms/course/private/project/mod', NULL),
(211, '/lms/course/private/project/view', NULL),
(212, '/lms/course/private/quest_bank/mod', NULL),
(213, '/lms/course/private/quest_bank/view', NULL),
(214, '/lms/course/private/reservation/mod', NULL),
(215, '/lms/course/private/reservation/view', NULL),
(216, '/lms/course/private/statistic/view', NULL),
(217, '/lms/course/private/stats/view_course', NULL),
(218, '/lms/course/private/stats/view_user', NULL),
(219, '/lms/course/private/storage/home', NULL),
(220, '/lms/course/private/storage/lesson', NULL),
(221, '/lms/course/private/storage/public', NULL),
(222, '/lms/course/private/storage/view', NULL),
(223, '/lms/course/private/wiki/admin', NULL),
(224, '/lms/course/private/wiki/edit', NULL),
(225, '/lms/course/private/wiki/view', NULL),
(226, '/lms/admin/location/view', NULL),
(227, '/lms/admin/location/mod', NULL),
(228, '/lms/admin/coursecategory/add', NULL),
(229, '/lms/admin/coursecategory/mod', NULL),
(230, '/lms/admin/coursecategory/del', NULL),
(272, '/lms/course/private/coursecharts/view', ''),
(280, '/framework/admin/pluginmanager/view', ''),
(11553, '/framework/admin/usermanagement/associate_user', NULL),
(11612, '/lms/course/public/pcertificate/view', NULL),
(11613, '/lms/course/public/pcertificate/mod', NULL),
(11757, '/lms/course/private/coursestats/view', ''),
(11835, '/lms/course/private/presence/view', ''),
(11836, '/framework/admin/privacypolicy/view', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `core_role_members`
--

CREATE TABLE IF NOT EXISTS `core_role_members` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `idstMember` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idst`,`idstMember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_role_members`
--

INSERT INTO `core_role_members` (`idst`, `idstMember`) VALUES
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(25, 3),
(26, 3),
(27, 3),
(28, 3),
(29, 3),
(30, 3),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(37, 3),
(38, 3),
(39, 3),
(40, 3),
(41, 3),
(42, 3),
(43, 3),
(44, 3),
(45, 3),
(46, 3),
(47, 3),
(48, 3),
(49, 3),
(50, 3),
(51, 3),
(52, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(89, 1),
(90, 1),
(91, 1),
(92, 3),
(93, 3),
(94, 3),
(95, 3),
(96, 1),
(96, 3),
(97, 1),
(97, 3),
(111, 3),
(112, 3),
(113, 3),
(114, 3),
(115, 3),
(116, 3),
(117, 3),
(118, 3),
(119, 3),
(120, 3),
(121, 3),
(122, 3),
(175, 301),
(175, 302),
(175, 303),
(175, 304),
(176, 301),
(176, 302),
(176, 303),
(176, 304),
(176, 305),
(176, 306),
(176, 307),
(177, 301),
(177, 302),
(177, 303),
(177, 304),
(178, 301),
(178, 302),
(178, 303),
(178, 304),
(178, 305),
(179, 301),
(179, 302),
(179, 303),
(179, 304),
(179, 305),
(179, 306),
(179, 307),
(180, 301),
(180, 302),
(180, 303),
(180, 304),
(180, 305),
(181, 301),
(181, 302),
(181, 303),
(181, 304),
(182, 301),
(182, 302),
(182, 303),
(182, 304),
(182, 305),
(182, 306),
(182, 307),
(183, 301),
(183, 302),
(183, 303),
(183, 304),
(185, 301),
(185, 302),
(185, 303),
(185, 304),
(185, 305),
(185, 306),
(185, 307),
(186, 301),
(186, 302),
(186, 303),
(186, 304),
(186, 10893),
(186, 10894),
(186, 10895),
(187, 301),
(187, 302),
(187, 303),
(187, 304),
(187, 10893),
(187, 10894),
(187, 10895),
(187, 10896),
(187, 10897),
(187, 10898),
(187, 10899),
(188, 301),
(188, 302),
(188, 303),
(188, 304),
(189, 301),
(189, 302),
(189, 303),
(189, 304),
(190, 301),
(190, 302),
(190, 303),
(190, 304),
(191, 301),
(191, 302),
(191, 303),
(191, 304),
(192, 301),
(192, 302),
(192, 303),
(192, 304),
(192, 305),
(193, 301),
(193, 302),
(193, 303),
(193, 304),
(193, 305),
(193, 306),
(193, 307),
(194, 301),
(194, 302),
(194, 303),
(194, 304),
(194, 305),
(195, 301),
(195, 302),
(195, 303),
(195, 304),
(195, 305),
(195, 10893),
(195, 10894),
(195, 10895),
(195, 10896),
(195, 10897),
(195, 10898),
(195, 10899),
(196, 301),
(196, 302),
(196, 303),
(196, 304),
(197, 301),
(197, 302),
(197, 303),
(197, 304),
(198, 301),
(198, 302),
(198, 303),
(198, 304),
(201, 301),
(201, 302),
(201, 303),
(201, 304),
(202, 301),
(202, 302),
(202, 303),
(202, 304),
(202, 305),
(205, 301),
(205, 302),
(205, 303),
(205, 304),
(206, 301),
(206, 302),
(206, 303),
(206, 304),
(206, 305),
(206, 306),
(206, 307),
(207, 301),
(207, 302),
(207, 303),
(207, 304),
(207, 305),
(207, 306),
(207, 307),
(207, 10893),
(207, 10894),
(207, 10895),
(207, 10896),
(207, 10897),
(207, 10898),
(208, 301),
(208, 302),
(208, 303),
(208, 304),
(209, 301),
(209, 302),
(209, 303),
(209, 304),
(210, 301),
(210, 302),
(210, 303),
(210, 304),
(211, 301),
(211, 302),
(211, 303),
(211, 304),
(211, 305),
(211, 306),
(211, 307),
(216, 301),
(216, 302),
(216, 303),
(216, 304),
(216, 10893),
(216, 10894),
(216, 10895),
(216, 10896),
(217, 301),
(217, 302),
(217, 303),
(217, 304),
(217, 10893),
(217, 10894),
(217, 10895),
(217, 10896),
(218, 301),
(218, 302),
(218, 303),
(218, 304),
(218, 10893),
(218, 10894),
(218, 10895),
(218, 10896),
(219, 301),
(219, 302),
(219, 10893),
(219, 10894),
(220, 301),
(220, 302),
(220, 303),
(220, 304),
(220, 10893),
(220, 10894),
(220, 10895),
(221, 301),
(221, 302),
(221, 10893),
(221, 10894),
(222, 301),
(222, 302),
(222, 303),
(222, 304),
(222, 10893),
(222, 10894),
(222, 10895),
(223, 301),
(223, 302),
(223, 303),
(223, 304),
(224, 301),
(224, 302),
(224, 303),
(224, 304),
(224, 305),
(225, 301),
(225, 302),
(225, 303),
(225, 304),
(225, 305),
(225, 306),
(225, 307),
(226, 3),
(227, 3),
(228, 3),
(229, 3),
(230, 3),
(272, 301),
(272, 302),
(272, 303),
(272, 304),
(272, 307),
(272, 10893),
(272, 10894),
(272, 10895),
(272, 10896),
(280, 3),
(11553, 3),
(11612, 3),
(11613, 3),
(11757, 301),
(11757, 302),
(11757, 303),
(11757, 304),
(11757, 10893),
(11757, 10894),
(11757, 10895),
(11757, 10896),
(11835, 301),
(11835, 302),
(11835, 303),
(11835, 304),
(11836, 3);

-- --------------------------------------------------------

--
-- Table structure for table `core_rules`
--

CREATE TABLE IF NOT EXISTS `core_rules` (
  `id_rule` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `rule_type` varchar(10) NOT NULL DEFAULT '',
  `creation_date` date NOT NULL DEFAULT '0000-00-00',
  `rule_active` tinyint(1) NOT NULL DEFAULT '0',
  `course_list` text NOT NULL,
  PRIMARY KEY (`id_rule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `core_rules`
--

INSERT INTO `core_rules` (`id_rule`, `title`, `lang_code`, `rule_type`, `creation_date`, `rule_active`, `course_list`) VALUES
(0, '', 'all', 'base', '0000-00-00', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `core_rules_entity`
--

CREATE TABLE IF NOT EXISTS `core_rules_entity` (
  `id_rule` int(11) NOT NULL DEFAULT '0',
  `id_entity` varchar(50) NOT NULL DEFAULT '',
  `course_list` text NOT NULL,
  PRIMARY KEY (`id_rule`,`id_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_rules_log`
--

CREATE TABLE IF NOT EXISTS `core_rules_log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `log_action` varchar(255) NOT NULL DEFAULT '',
  `log_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `applied` text NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_setting`
--

CREATE TABLE IF NOT EXISTS `core_setting` (
  `param_name` varchar(255) NOT NULL DEFAULT '',
  `param_value` text NOT NULL,
  `value_type` varchar(25) NOT NULL DEFAULT 'string',
  `max_size` int(3) NOT NULL DEFAULT '255',
  `pack` varchar(25) NOT NULL DEFAULT 'main',
  `regroup` int(5) NOT NULL DEFAULT '0',
  `sequence` int(5) NOT NULL DEFAULT '0',
  `param_load` tinyint(1) NOT NULL DEFAULT '1',
  `hide_in_modify` tinyint(1) NOT NULL DEFAULT '0',
  `extra_info` text NOT NULL,
  PRIMARY KEY (`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_setting`
--

INSERT INTO `core_setting` (`param_name`, `param_value`, `value_type`, `max_size`, `pack`, `regroup`, `sequence`, `param_load`, `hide_in_modify`, `extra_info`) VALUES
('accessibility', 'off', 'enum', 255, '0', 8, 5, 1, 0, ''),
('bbb_max_mikes', '2', 'string', 255, 'bbb', 6, 6, 1, 0, ''),
('bbb_max_participant', '300', 'string', 255, 'bbb', 6, 7, 1, 0, ''),
('bbb_max_room', '999', 'string', 255, 'bbb', 6, 8, 1, 0, ''),
('bbb_password_moderator', 'password.moderator', 'string', 255, 'bbb', 6, 4, 1, 0, ''),
('bbb_password_viewer', 'password.viewer', 'string', 255, 'bbb', 6, 5, 1, 0, ''),
('bbb_port', '80', 'string', 255, 'bbb', 6, 2, 1, 0, ''),
('bbb_salt', 'to be changed with a complex string', 'string', 255, 'bbb', 6, 3, 1, 0, ''),
('bbb_server', 'http://test-install.blindsidenetworks.com/bigbluebutton/', 'string', 255, 'bbb', 6, 1, 1, 0, ''),
('bbb_user', '', 'string', 255, 'bbb', 6, 2, 1, 0, ''),
('code_teleskill', '', 'string', 255, 'teleskill', 6, 3, 1, 0, ''),
('common_admin_session', 'on', 'enum', 3, 'security', 8, 24, 1, 0, ''),
('conference_creation_limit_per_user', '99999999999', 'string', 255, '0', 6, 0, 1, 0, ''),
('core_version', '1.4', 'string', 255, '0', 1, 0, 1, 1, ''),
('course_block', 'off', 'enum', 3, '0', 4, 5, 1, 0, ''),
('course_quota', '0', 'string', 255, '0', 4, 5, 1, 0, ''),
('currency_symbol', '&euro;', 'string', 10, '0', 5, 2, 1, 0, ''),
('customer_help_email', '', 'string', 255, '0', 3, 19, 1, 0, ''),
('customer_help_subj_pfx', '', 'string', 255, '0', 3, 20, 1, 0, ''),
('defaultTemplate', 'standard', 'template', 255, '0', 1, 4, 1, 0, ''),
('default_language', 'english', 'language', 255, '0', 1, 3, 1, 0, ''),
('dimdim_max_mikes', '2', 'string', 255, 'dimdim', 6, 7, 1, 0, ''),
('dimdim_max_participant', '300', 'string', 255, 'dimdim', 6, 6, 1, 0, ''),
('dimdim_max_room', '99999999999', 'string', 255, 'dimdim', 6, 5, 1, 0, ''),
('dimdim_password', '', 'password', 255, 'dimdim', 6, 2, 1, 0, ''),
('dimdim_port', '80', 'string', 255, 'dimdim', 6, 2, 1, 0, ''),
('dimdim_server', 'webmeeting.dimdim.com', 'string', 255, 'dimdim', 6, 1, 1, 0, ''),
('dimdim_user', '', 'string', 255, 'dimdim', 6, 2, 1, 0, ''),
('do_debug', 'off', 'enum', 3, 'debug', 8, 8, 1, 0, ''),
('file_upload_whitelist', 'zip,jpg,gif,png,txt,csv,rtf,xml,doc,docx,xls,xlsx,ppt,pptx,odt,ods,odp,pdf,xps,mp4,mp3,flv,swf,mov,wav,ogg,flac,wma,wmv', 'string', 65535, 'security', 8, 25, 1, 0, ''),
('first_catalogue', 'off', 'enum', 3, '0', 4, 2, 1, 0, ''),
('forum_as_table', 'on', 'enum', 3, '0', 4, 4, 1, 0, ''),
('google_stat_code', '', 'textarea', 65535, '0', 10, 2, 1, 0, ''),
('google_stat_in_lms', '0', 'check', 1, '0', 10, 1, 1, 0, ''),
('hour_request_limit', '48', 'int', 2, 'register', 3, 13, 0, 0, ''),
('hteditor', 'tinymce', 'hteditor', 255, '0', 1, 7, 1, 0, ''),
('htmledit_image_admin', '1', 'check', 255, '0', 8, 1, 1, 0, ''),
('htmledit_image_godadmin', '1', 'check', 255, '0', 8, 0, 1, 0, ''),
('htmledit_image_user', '1', 'check', 255, '0', 8, 2, 1, 0, ''),
('kb_filter_by_user_access', 'on', 'enum', 3, 'main', 4, 10, 1, 0, ''),
('kb_show_uncategorized', 'on', 'enum', 3, 'main', 4, 11, 1, 0, ''),
('lang_check', 'off', 'enum', 3, 'debug', 8, 7, 1, 0, ''),
('lastfirst_mandatory', 'off', 'enum', 3, 'register', 3, 14, 2, 0, ''),
('ldap_port', '389', 'string', 5, '0', 7, 3, 1, 0, ''),
('ldap_server', '192.168.0.1', 'string', 255, '0', 7, 2, 1, 0, ''),
('ldap_used', 'off', 'enum', 3, '0', 7, 1, 1, 0, ''),
('ldap_user_string', '$user@domain2.domain1', 'string', 255, '0', 7, 4, 1, 0, ''),
('mail_sender', 'sample@localhost', 'string', 255, 'register', 3, 12, 0, 0, ''),
('maintenance', 'off', 'enum', 3, 'security', 8, 25, 0, 0, ''),
('maintenance_pw', 'manutenzione', 'string', 16, 'security', 8, 25, 0, 0, ''),
('mandatory_code', 'off', 'enum', 3, 'register', 3, 18, 1, 0, ''),
('max_log_attempt', '0', 'int', 3, '0', 3, 4, 0, 0, ''),
('nl_sendpause', '20', 'int', 3, 'newsletter', 8, 10, 1, 0, ''),
('nl_sendpercycle', '200', 'int', 4, 'newsletter', 8, 9, 1, 0, ''),
('no_answer_in_poll', 'off', 'enum', 3, '0', 4, 7, 1, 0, ''),
('no_answer_in_test', 'off', 'enum', 3, '0', 4, 6, 1, 0, ''),
('on_catalogue_empty', 'on', 'enum', 3, '0', 4, 3, 1, 0, ''),
('on_usercourse_empty', 'off', 'enum', 3, '0', 4, 4, 1, 0, ''),
('org_name_teleskill', '', 'string', 255, 'teleskill', 6, 4, 1, 0, ''),
('owned_by', 'Copyright (c) forma.lms', 'html', 255, '0', 1, 7, 1, 0, ''),
('page_title', 'Forma E-learning', 'string', 255, '0', 1, 1, 1, 0, ''),
('pass_alfanumeric', 'off', 'enum', 3, 'password', 3, 6, 1, 0, ''),
('pass_change_first_login', 'off', 'enum', 3, 'password', 3, 8, 1, 0, ''),
('pass_max_time_valid', '0', 'int', 4, 'password', 3, 9, 1, 0, ''),
('pass_min_char', '5', 'int', 2, 'password', 3, 7, 0, 0, ''),
('pathchat', 'chat/', 'string', 255, 'path', 8, 21, 1, 0, ''),
('pathcourse', 'course/', 'string', 255, 'path', 8, 11, 1, 0, ''),
('pathfield', 'field/', 'string', 255, 'path', 8, 12, 1, 0, ''),
('pathforum', 'forum/', 'string', 255, 'path', 8, 14, 1, 0, ''),
('pathlesson', 'item/', 'string', 255, 'path', 8, 15, 1, 0, ''),
('pathmessage', 'message/', 'string', 255, 'path', 8, 16, 1, 0, ''),
('pathphoto', 'photo/', 'string', 255, 'path', 8, 13, 1, 0, ''),
('pathprj', 'project/', 'string', 255, 'path', 8, 20, 1, 1, ''),
('pathscorm', 'scorm/', 'string', 255, 'path', 8, 17, 1, 0, ''),
('pathsponsor', 'sponsor/', 'string', 255, 'path', 8, 18, 1, 0, ''),
('pathtest', 'test/', 'string', 255, 'path', 8, 19, 1, 0, ''),
('paypal_currency', 'EUR', 'string', 255, '0', 5, 1, 1, 0, ''),
('paypal_mail', '', 'string', 255, '0', 5, 0, 1, 0, ''),
('paypal_sandbox', 'on', 'enum', 3, '0', 5, 3, 1, 0, ''),
('privacy_policy', 'on', 'enum', 3, 'register', 3, 15, 0, 0, ''),
('profile_only_pwd', 'on', 'enum', 3, '0', 3, 1, 1, 0, ''),
('register_deleted_user', 'off', 'enum', 3, '0', 3, 3, 1, 0, ''),
('register_type', 'admin', 'register_type', 10, 'register', 3, 11, 0, 0, ''),
('registration_code_type', '0', 'registration_code_type', 3, 'register', 3, 17, 1, 0, ''),
('request_mandatory_fields_compilation', 'off', 'enum', 3, '0', 3, 2, 1, 0, ''),
('rest_auth_api_key', '', 'string', 255, 'api', 9, 7, 1, 0, ''),
('rest_auth_api_secret', '', 'string', 255, 'api', 9, 8, 1, 0, ''),
('rest_auth_code', '', 'string', 255, 'api', 9, 4, 1, 0, ''),
('rest_auth_lifetime', '60', 'int', 3, 'api', 9, 5, 1, 0, ''),
('rest_auth_method', '1', 'rest_auth_sel_method', 3, 'api', 9, 3, 1, 0, ''),
('rest_auth_update', 'off', 'enum', 3, 'api', 9, 6, 1, 0, ''),
('save_log_attempt', 'no', 'save_log_attempt', 255, '0', 3, 5, 0, 0, ''),
('sco_direct_play', 'on', 'enum', 3, '0', 8, 3, 1, 0, ''),
('sender_event', 'sample@localhost', 'string', 255, '0', 1, 5, 1, 0, ''),
('send_cc_for_system_emails', '', 'string', 255, '0', 8, 4, 1, 0, ''),
('session_ip_control', 'off', 'enum', 3, 'security', 8, 22, 1, 0, ''),
('sms_cell_num_field', '1', 'field_select', 5, '0', 11, 6, 1, 0, ''),
('sms_credit', '0', 'string', 20, '0', 1, 0, 1, 1, ''),
('sms_gateway', 'smsmarket', 'string', 50, '0', 11, 0, 1, 1, ''),
('sms_gateway_host', '193.254.241.47', 'string', 15, '0', 11, 8, 1, 0, ''),
('sms_gateway_id', '3', 'sel_sms_gateway', 1, '0', 11, 7, 1, 0, ''),
('sms_gateway_pass', '', 'string', 255, '0', 11, 5, 1, 0, ''),
('sms_gateway_port', '26', 'int', 5, '0', 11, 9, 1, 0, ''),
('sms_gateway_user', '', 'string', 50, '0', 11, 4, 1, 0, ''),
('sms_international_prefix', '+39', 'string', 3, '0', 11, 1, 1, 0, ''),
('sms_sent_from', '0', 'string', 25, '0', 11, 2, 1, 0, ''),
('social_fb_active', 'off', 'enum', 3, 'main', 12, 0, 1, 0, ''),
('social_fb_api', '', 'string', 255, 'main', 12, 1, 1, 0, ''),
('social_fb_secret', '', 'string', 255, 'main', 12, 2, 1, 0, ''),
('social_google_active', 'off', 'enum', 3, 'main', 12, 9, 1, 0, ''),
('social_google_client_id', '', 'string', 255, 'main', 12, 10, 1, 0, ''),
('social_google_secret', '', 'string', 255, 'main', 12, 11, 1, 0, ''),
('social_linkedin_access', '', 'string', 255, 'main', 12, 7, 1, 0, ''),
('social_linkedin_active', 'off', 'enum', 3, 'main', 12, 6, 1, 0, ''),
('social_linkedin_secret', '', 'string', 255, 'main', 12, 8, 1, 0, ''),
('social_twitter_active', 'off', 'enum', 3, 'main', 12, 3, 1, 0, ''),
('social_twitter_consumer', '', 'string', 255, 'main', 12, 4, 1, 0, ''),
('social_twitter_secret', '', 'string', 255, 'main', 12, 5, 1, 0, ''),
('sso_secret', '', 'text', 255, '0', 9, 1, 1, 0, ''),
('sso_token', 'off', 'enum', 3, '0', 9, 0, 1, 0, ''),
('stop_concurrent_user', 'on', 'enum', 3, 'security', 8, 23, 1, 0, ''),
('tablist_mycourses', 'name,status', 'tablist_mycourses', 255, '0', 4, 1, 1, 0, ''),
('teleskill_max_participant', '300', 'string', 255, 'teleskill', 6, 6, 1, 0, ''),
('teleskill_max_room', '99999999999', 'string', 255, 'teleskill', 6, 5, 1, 0, ''),
('template_domain', '', 'textarea', 65535, '0', 8, 8, 1, 0, ''),
('templ_use_field', '0', 'id_field', 11, '0', 1, 0, 1, 1, ''),
('title_organigram_chart', 'Forma', 'string', 255, '0', 1, 0, 1, 1, ''),
('tracking', 'on', 'enum', 3, '0', 4, 8, 1, 0, ''),
('ttlSession', '4000', 'int', 5, '0', 1, 6, 1, 0, ''),
('url', 'http://localhost/', 'string', 255, '0', 1, 2, 1, 0, ''),
('url_checkin_teleskill', 'http://asp.teleskill.it/tvclive/server-1-1.asp', 'string', 255, 'teleskill', 6, 1, 1, 0, ''),
('url_videoconference_teleskill', '', 'string', 255, 'teleskill', 6, 2, 1, 0, ''),
('user_pwd_history_length', '3', 'int', 3, 'password', 3, 10, 1, 0, ''),
('user_quota', '50', 'string', 255, '0', 8, 6, 1, 0, ''),
('use_advanced_form', 'off', 'enum', 3, 'register', 3, 16, 1, 0, ''),
('use_dimdim_api', 'off', 'enum', 3, 'dimdim', 6, 8, 1, 0, ''),
('use_rest_api', 'off', 'enum', 3, 'api', 9, 2, 1, 0, ''),
('use_tag', 'off', 'enum', 3, '0', 4, 5, 1, 0, ''),
('visuItem', '25', 'int', 3, '0', 2, 1, 1, 1, ''),
('visuNewsHomePage', '3', 'int', 5, '0', 1, 0, 1, 1, ''),
('welcome_use_feed', 'on', 'enum', 3, '0', 1, 0, 1, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `core_setting_group`
--

CREATE TABLE IF NOT EXISTS `core_setting_group` (
  `path_name` varchar(255) NOT NULL DEFAULT '',
  `idst` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`path_name`,`idst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_setting_list`
--

CREATE TABLE IF NOT EXISTS `core_setting_list` (
  `path_name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `default_value` text NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `load_at_startup` tinyint(1) NOT NULL DEFAULT '0',
  `sequence` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`path_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_setting_list`
--

INSERT INTO `core_setting_list` (`path_name`, `label`, `default_value`, `type`, `visible`, `load_at_startup`, `sequence`) VALUES
('admin_rules.course_presence_admin', '_COURSE_PRESENCE_ADMIN', 'off', 'enum', 1, 1, 7),
('admin_rules.direct_course_subscribe', '_DIRECT_COURSE_SUBSCRIBE', 'off', 'enum', 1, 1, 6),
('admin_rules.direct_user_insert', '_DIRECT_USER_INSERT', 'off', 'enum', 1, 1, 3),
('admin_rules.limit_course_subscribe', '_LIMIT_COURSE_SUBSCRIBE', 'off', 'enum', 1, 1, 4),
('admin_rules.limit_user_insert', '_LIMIT_USER_INSERT', 'off', 'enum', 1, 1, 1),
('admin_rules.max_course_subscribe', '_MAX_COURSE_SUBSCRIBE', '0', 'integer', 1, 1, 5),
('admin_rules.max_user_insert', '_MAX_USER_INSERT', '0', 'integer', 1, 1, 2),
('admin_rules.user_lang_assigned', '', '', 'string', 0, 1, 0),
('ui.directory.custom_columns', '_CUSTOM_COLUMS', '', 'hidden', 0, 1, 0),
('ui.language', '_LANGUAGE', '', 'language', 1, 1, 0),
('user_rules.field_policy', '', '', 'serialized', 0, 1, 0),
('user_rules.user_quota', '', '-1', 'int', 0, 1, 0),
('user_rules.user_quota_used', '', '0', 'int', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_setting_user`
--

CREATE TABLE IF NOT EXISTS `core_setting_user` (
  `path_name` varchar(255) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  PRIMARY KEY (`path_name`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_st`
--

CREATE TABLE IF NOT EXISTS `core_st` (
  `idst` int(11) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idst`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Security Tokens' AUTO_INCREMENT=11837 ;

--
-- Dumping data for table `core_st`
--

INSERT INTO `core_st` (`idst`) VALUES
(0),
(11831),
(11832),
(11833),
(11834),
(11835),
(11836);

-- --------------------------------------------------------

--
-- Table structure for table `core_tag`
--

CREATE TABLE IF NOT EXISTS `core_tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL DEFAULT '',
  `id_parent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tag`),
  KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_tag_relation`
--

CREATE TABLE IF NOT EXISTS `core_tag_relation` (
  `id_tag` int(11) NOT NULL DEFAULT '0',
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) NOT NULL DEFAULT '',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `id_course` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tag`,`id_resource`,`resource_type`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_tag_resource`
--

CREATE TABLE IF NOT EXISTS `core_tag_resource` (
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `resource_type` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sample_text` text NOT NULL,
  `permalink` text NOT NULL,
  PRIMARY KEY (`id_resource`,`resource_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_task`
--

CREATE TABLE IF NOT EXISTS `core_task` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `conn_source` varchar(50) NOT NULL DEFAULT '',
  `conn_destination` varchar(50) NOT NULL DEFAULT '',
  `schedule_type` enum('at','any') NOT NULL DEFAULT 'at',
  `schedule` varchar(50) NOT NULL DEFAULT '',
  `import_type` varchar(50) NOT NULL DEFAULT '',
  `map` text NOT NULL,
  `last_execution` datetime DEFAULT NULL,
  `sequence` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_transaction`
--

CREATE TABLE IF NOT EXISTS `core_transaction` (
  `id_trans` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `location` varchar(10) NOT NULL DEFAULT '',
  `date_creation` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_activated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_trans`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_transaction_info`
--

CREATE TABLE IF NOT EXISTS `core_transaction_info` (
  `id_trans` int(11) NOT NULL DEFAULT '0',
  `id_course` int(11) NOT NULL DEFAULT '0',
  `id_date` int(11) NOT NULL DEFAULT '0',
  `id_edition` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `price` varchar(255) NOT NULL DEFAULT '',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_trans`,`id_course`,`id_date`,`id_edition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_user`
--

CREATE TABLE IF NOT EXISTS `core_user` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `pass` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `lastenter` datetime DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '1',
  `pwd_expire_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `force_change` tinyint(1) NOT NULL DEFAULT '0',
  `register_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `facebook_id` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL,
  `linkedin_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `privacy_policy` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`idst`),
  UNIQUE KEY `userid` (`userid`),
  UNIQUE KEY `facebook_id` (`facebook_id`),
  UNIQUE KEY `twitter_id` (`twitter_id`),
  UNIQUE KEY `linkedin_id` (`linkedin_id`),
  UNIQUE KEY `google_id` (`google_id`),
  UNIQUE KEY `facebook_id_2` (`facebook_id`),
  UNIQUE KEY `google_id_2` (`google_id`),
  UNIQUE KEY `twitter_id_2` (`twitter_id`),
  UNIQUE KEY `linkedin_id_2` (`linkedin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `core_user`
--

INSERT INTO `core_user` (`idst`, `userid`, `firstname`, `lastname`, `pass`, `email`, `avatar`, `signature`, `level`, `lastenter`, `valid`, `pwd_expire_at`, `force_change`, `register_date`, `facebook_id`, `twitter_id`, `linkedin_id`, `google_id`, `privacy_policy`) VALUES
(270, '/Anonymous', '', '', '', '', '', '', 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', 1, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0),
(11836, '/admin', 'admin', '', '5f4dcc3b5aa765d61d8327deb882cf99', 'abhinay212@gmail.com', '', '', 0, '2015-08-26 01:06:03', 1, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `core_user_file`
--

CREATE TABLE IF NOT EXISTS `core_user_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_idst` int(11) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT '',
  `fname` varchar(255) NOT NULL DEFAULT '',
  `real_fname` varchar(255) NOT NULL DEFAULT '',
  `media_url` varchar(255) NOT NULL DEFAULT '',
  `size` int(11) NOT NULL DEFAULT '0',
  `uldate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_user_log_attempt`
--

CREATE TABLE IF NOT EXISTS `core_user_log_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) NOT NULL DEFAULT '',
  `attempt_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attempt_number` int(5) NOT NULL DEFAULT '0',
  `user_ip` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_user_profileview`
--

CREATE TABLE IF NOT EXISTS `core_user_profileview` (
  `id_owner` int(11) NOT NULL DEFAULT '0',
  `id_viewer` int(11) NOT NULL DEFAULT '0',
  `date_view` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_owner`,`id_viewer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_user_temp`
--

CREATE TABLE IF NOT EXISTS `core_user_temp` (
  `idst` int(11) NOT NULL DEFAULT '0',
  `userid` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `pass` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `language` varchar(50) NOT NULL DEFAULT '',
  `request_on` datetime DEFAULT '0000-00-00 00:00:00',
  `random_code` varchar(255) NOT NULL DEFAULT '',
  `create_by_admin` int(11) NOT NULL DEFAULT '0',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `facebook_id` varchar(255) DEFAULT NULL,
  `twitter_id` varchar(255) DEFAULT NULL,
  `linkedin_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idst`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_wiki`
--

CREATE TABLE IF NOT EXISTS `core_wiki` (
  `wiki_id` int(11) NOT NULL AUTO_INCREMENT,
  `source_platform` varchar(255) NOT NULL DEFAULT '',
  `public` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT '',
  `other_lang` text NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `page_count` int(11) NOT NULL DEFAULT '0',
  `revision_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_wiki_page`
--

CREATE TABLE IF NOT EXISTS `core_wiki_page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_code` varchar(60) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `page_path` varchar(255) NOT NULL DEFAULT '',
  `lev` int(3) NOT NULL DEFAULT '0',
  `wiki_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `core_wiki_page_info`
--

CREATE TABLE IF NOT EXISTS `core_wiki_page_info` (
  `page_id` int(11) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  `last_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `wiki_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`page_id`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `core_wiki_revision`
--

CREATE TABLE IF NOT EXISTS `core_wiki_revision` (
  `wiki_id` int(11) NOT NULL DEFAULT '0',
  `page_id` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `language` varchar(50) NOT NULL DEFAULT '0',
  `author` int(11) NOT NULL DEFAULT '0',
  `rev_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `content` longtext NOT NULL,
  PRIMARY KEY (`wiki_id`,`page_id`,`version`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_advice`
--

CREATE TABLE IF NOT EXISTS `learning_advice` (
  `idAdvice` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `author` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `important` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAdvice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_adviceuser`
--

CREATE TABLE IF NOT EXISTS `learning_adviceuser` (
  `idAdvice` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `archivied` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAdvice`,`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_assessment_rule`
--

CREATE TABLE IF NOT EXISTS `learning_assessment_rule` (
  `rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `from_score` double NOT NULL DEFAULT '0',
  `to_score` double NOT NULL DEFAULT '0',
  `competences_list` text,
  `courses_list` text,
  `feedback_txt` text,
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_assessment_user`
--

CREATE TABLE IF NOT EXISTS `learning_assessment_user` (
  `id_assessment` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `type_of` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_assessment`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_calendar`
--

CREATE TABLE IF NOT EXISTS `learning_calendar` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `idCourse` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_catalogue`
--

CREATE TABLE IF NOT EXISTS `learning_catalogue` (
  `idCatalogue` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`idCatalogue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_catalogue_entry`
--

CREATE TABLE IF NOT EXISTS `learning_catalogue_entry` (
  `idCatalogue` int(11) NOT NULL DEFAULT '0',
  `idEntry` int(11) NOT NULL DEFAULT '0',
  `type_of_entry` enum('course','coursepath') NOT NULL DEFAULT 'course',
  PRIMARY KEY (`idCatalogue`,`idEntry`,`type_of_entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_catalogue_member`
--

CREATE TABLE IF NOT EXISTS `learning_catalogue_member` (
  `idCatalogue` int(11) NOT NULL DEFAULT '0',
  `idst_member` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCatalogue`,`idst_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_category`
--

CREATE TABLE IF NOT EXISTS `learning_category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `idParent` int(11) DEFAULT '0',
  `lev` int(11) NOT NULL DEFAULT '0',
  `path` text NOT NULL,
  `description` text NOT NULL,
  `iLeft` int(5) NOT NULL DEFAULT '0',
  `iRight` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_certificate`
--

CREATE TABLE IF NOT EXISTS `learning_certificate` (
  `id_certificate` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `base_language` varchar(255) NOT NULL DEFAULT '',
  `cert_structure` text NOT NULL,
  `orientation` enum('P','L') NOT NULL DEFAULT 'P',
  `bgimage` varchar(255) NOT NULL DEFAULT '',
  `meta` tinyint(1) NOT NULL DEFAULT '0',
  `user_release` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_certificate`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `learning_certificate`
--

INSERT INTO `learning_certificate` (`id_certificate`, `code`, `name`, `description`, `base_language`, `cert_structure`, `orientation`, `bgimage`, `meta`, `user_release`) VALUES
(2, '0000', 'Certificate sample', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.<br />', 'english', '<table style="margin-left: auto; margin-right: auto;" border="0">\n<tbody>\n<tr>\n<td>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>\n<td style="text-align: center;" colspan="2"><span style="font-size: 65px;"><br /><br /><br /><br /><br /><br /><br />This certificate is awarded to<strong><strong><br />[display_name]<br /></strong><br /><br /><br /></strong>In recognition of your completion of the training course<strong><br />[course_name]<br /><br /><br /><br /><br /><br /></strong></span></td>\n<td>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</td>\n</tr>\n<tr>\n<td>&nbsp;</td>\n<td>&nbsp;</td>\n<td style="text-align: right;"><span style="line-height: 19px; font-size: small;"><strong><br /></strong></span></td>\n<td><span style="font-size: x-large;"><strong>[theacher_list]</strong></span><br /><span style="font-size: x-large;">The Instructor/s</span></td>\n</tr>\n</tbody>\n</table>\n<br />', 'L', 'certificate_sample.jpg', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `learning_certificate_assign`
--

CREATE TABLE IF NOT EXISTS `learning_certificate_assign` (
  `id_certificate` int(11) NOT NULL DEFAULT '0',
  `id_course` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `on_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cert_file` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_certificate`,`id_course`,`id_user`),
  KEY `id_course` (`id_course`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_certificate_course`
--

CREATE TABLE IF NOT EXISTS `learning_certificate_course` (
  `id_certificate` int(11) NOT NULL DEFAULT '0',
  `id_course` int(11) NOT NULL DEFAULT '0',
  `available_for_status` tinyint(1) NOT NULL DEFAULT '0',
  `point_required` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_certificate`,`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_certificate_meta`
--

CREATE TABLE IF NOT EXISTS `learning_certificate_meta` (
  `idMetaCertificate` int(11) NOT NULL AUTO_INCREMENT,
  `idCertificate` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  PRIMARY KEY (`idMetaCertificate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_certificate_meta_assign`
--

CREATE TABLE IF NOT EXISTS `learning_certificate_meta_assign` (
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idMetaCertificate` int(11) NOT NULL DEFAULT '0',
  `idCertificate` int(11) NOT NULL DEFAULT '0',
  `on_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `cert_file` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idUser`,`idMetaCertificate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_certificate_meta_course`
--

CREATE TABLE IF NOT EXISTS `learning_certificate_meta_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idMetaCertificate` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `idCourseEdition` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_certificate_tags`
--

CREATE TABLE IF NOT EXISTS `learning_certificate_tags` (
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`file_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learning_certificate_tags`
--

INSERT INTO `learning_certificate_tags` (`file_name`, `class_name`) VALUES
('certificate.course.php', 'CertificateSubs_Course'),
('certificate.misc.php', 'CertificateSubs_Misc'),
('certificate.user.php', 'CertificateSubs_User'),
('certificate.userstat.php', 'CertificateSubs_UserStat');

-- --------------------------------------------------------

--
-- Table structure for table `learning_classroom`
--

CREATE TABLE IF NOT EXISTS `learning_classroom` (
  `idClassroom` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `location_id` int(11) NOT NULL DEFAULT '0',
  `room` varchar(255) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  `zip_code` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(255) NOT NULL DEFAULT '',
  `fax` varchar(255) NOT NULL DEFAULT '',
  `capacity` varchar(255) NOT NULL DEFAULT '',
  `disposition` text NOT NULL,
  `instrument` text NOT NULL,
  `available_instrument` text NOT NULL,
  `note` text NOT NULL,
  `responsable` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idClassroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_classroom_calendar`
--

CREATE TABLE IF NOT EXISTS `learning_classroom_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classroom_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `owner` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_class_location`
--

CREATE TABLE IF NOT EXISTS `learning_class_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_comment_ajax`
--

CREATE TABLE IF NOT EXISTS `learning_comment_ajax` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `resource_type` varchar(50) NOT NULL DEFAULT '',
  `external_key` varchar(200) NOT NULL DEFAULT '',
  `id_author` int(11) NOT NULL DEFAULT '0',
  `posted_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `textof` text NOT NULL,
  `history_tree` varchar(255) NOT NULL DEFAULT '',
  `id_parent` int(11) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_comment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_commontrack`
--

CREATE TABLE IF NOT EXISTS `learning_commontrack` (
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idTrack` int(11) NOT NULL DEFAULT '0',
  `objectType` varchar(20) NOT NULL DEFAULT '',
  `dateAttempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) NOT NULL DEFAULT '',
  `firstAttempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `first_complete` datetime DEFAULT NULL,
  `last_complete` datetime DEFAULT NULL,
  PRIMARY KEY (`idTrack`,`objectType`),
  KEY `idReference` (`idReference`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_communication`
--

CREATE TABLE IF NOT EXISTS `learning_communication` (
  `id_comm` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `publish_date` date NOT NULL DEFAULT '0000-00-00',
  `type_of` varchar(15) NOT NULL DEFAULT '',
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `id_category` int(11) unsigned NOT NULL DEFAULT '0',
  `id_course` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_comm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_communication_access`
--

CREATE TABLE IF NOT EXISTS `learning_communication_access` (
  `id_comm` int(11) NOT NULL DEFAULT '0',
  `idst` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_comm`,`idst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_communication_category`
--

CREATE TABLE IF NOT EXISTS `learning_communication_category` (
  `id_category` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) unsigned NOT NULL DEFAULT '0',
  `level` int(11) unsigned NOT NULL DEFAULT '0',
  `iLeft` int(11) unsigned NOT NULL DEFAULT '0',
  `iRight` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_communication_category_lang`
--

CREATE TABLE IF NOT EXISTS `learning_communication_category_lang` (
  `id_category` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `translation` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_category`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_communication_track`
--

CREATE TABLE IF NOT EXISTS `learning_communication_track` (
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idTrack` int(11) NOT NULL DEFAULT '0',
  `objectType` varchar(20) NOT NULL DEFAULT '',
  `dateAttempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) NOT NULL DEFAULT '',
  `firstAttempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idReference`,`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence`
--

CREATE TABLE IF NOT EXISTS `learning_competence` (
  `id_competence` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_category` int(10) unsigned NOT NULL DEFAULT '0',
  `type` enum('score','flag') NOT NULL DEFAULT 'score',
  `score` float NOT NULL DEFAULT '0',
  `typology` enum('skill','attitude','knowledge') NOT NULL DEFAULT 'skill',
  `expiration` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_competence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence_category`
--

CREATE TABLE IF NOT EXISTS `learning_competence_category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_parent` int(10) unsigned NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `iLeft` int(10) unsigned NOT NULL DEFAULT '0',
  `iRight` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence_category_lang`
--

CREATE TABLE IF NOT EXISTS `learning_competence_category_lang` (
  `id_category` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id_category`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence_course`
--

CREATE TABLE IF NOT EXISTS `learning_competence_course` (
  `id_competence` int(10) unsigned NOT NULL DEFAULT '0',
  `id_course` int(10) unsigned NOT NULL DEFAULT '0',
  `score` float NOT NULL DEFAULT '0',
  `retraining` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_competence`,`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence_lang`
--

CREATE TABLE IF NOT EXISTS `learning_competence_lang` (
  `id_competence` int(10) unsigned NOT NULL DEFAULT '0',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id_competence`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence_required`
--

CREATE TABLE IF NOT EXISTS `learning_competence_required` (
  `id_competence` int(10) unsigned NOT NULL DEFAULT '0',
  `idst` int(10) unsigned NOT NULL DEFAULT '0',
  `type_of` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_competence`,`idst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence_track`
--

CREATE TABLE IF NOT EXISTS `learning_competence_track` (
  `id_track` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_competence` int(10) unsigned NOT NULL DEFAULT '0',
  `id_user` int(10) unsigned NOT NULL DEFAULT '0',
  `operation` varchar(255) NOT NULL DEFAULT '',
  `id_course` int(11) NOT NULL DEFAULT '0',
  `assigned_by` int(11) NOT NULL DEFAULT '0',
  `date_assignment` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `score_assigned` float NOT NULL DEFAULT '0',
  `score_total` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_track`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_competence_user`
--

CREATE TABLE IF NOT EXISTS `learning_competence_user` (
  `id_competence` int(10) unsigned NOT NULL DEFAULT '0',
  `id_user` int(10) unsigned NOT NULL DEFAULT '0',
  `score_got` float NOT NULL DEFAULT '0',
  `last_assign_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_competence`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course`
--

CREATE TABLE IF NOT EXISTS `learning_course` (
  `idCourse` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `lang_code` varchar(100) NOT NULL DEFAULT '',
  `status` int(1) NOT NULL DEFAULT '0',
  `level_show_user` int(11) NOT NULL DEFAULT '0',
  `subscribe_method` tinyint(1) NOT NULL DEFAULT '0',
  `linkSponsor` varchar(255) NOT NULL DEFAULT '',
  `imgSponsor` varchar(255) NOT NULL DEFAULT '',
  `img_course` varchar(255) NOT NULL DEFAULT '',
  `img_material` varchar(255) NOT NULL DEFAULT '',
  `img_othermaterial` varchar(255) NOT NULL DEFAULT '',
  `course_demo` varchar(255) NOT NULL DEFAULT '',
  `mediumTime` int(10) unsigned NOT NULL DEFAULT '0',
  `permCloseLO` tinyint(1) NOT NULL DEFAULT '0',
  `userStatusOp` int(11) NOT NULL DEFAULT '0',
  `difficult` enum('veryeasy','easy','medium','difficult','verydifficult') NOT NULL DEFAULT 'medium',
  `show_progress` tinyint(1) NOT NULL DEFAULT '1',
  `show_time` tinyint(1) NOT NULL DEFAULT '0',
  `show_who_online` tinyint(1) NOT NULL DEFAULT '0',
  `show_extra_info` tinyint(1) NOT NULL DEFAULT '0',
  `show_rules` tinyint(1) NOT NULL DEFAULT '0',
  `date_begin` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `hour_begin` varchar(5) NOT NULL DEFAULT '',
  `hour_end` varchar(5) NOT NULL DEFAULT '',
  `valid_time` int(10) NOT NULL DEFAULT '0',
  `max_num_subscribe` int(11) NOT NULL DEFAULT '0',
  `min_num_subscribe` int(11) NOT NULL DEFAULT '0',
  `max_sms_budget` double NOT NULL DEFAULT '0',
  `selling` tinyint(1) NOT NULL DEFAULT '0',
  `prize` varchar(255) NOT NULL DEFAULT '',
  `course_type` varchar(255) NOT NULL DEFAULT 'elearning',
  `policy_point` varchar(255) NOT NULL DEFAULT '',
  `point_to_all` int(10) NOT NULL DEFAULT '0',
  `course_edition` tinyint(1) NOT NULL DEFAULT '0',
  `classrooms` varchar(255) NOT NULL DEFAULT '',
  `certificates` varchar(255) NOT NULL DEFAULT '',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `security_code` varchar(255) NOT NULL DEFAULT '',
  `imported_from_connection` varchar(255) DEFAULT NULL,
  `course_quota` varchar(255) NOT NULL DEFAULT '-1',
  `used_space` varchar(255) NOT NULL DEFAULT '0',
  `course_vote` double NOT NULL DEFAULT '0',
  `allow_overbooking` tinyint(1) NOT NULL DEFAULT '0',
  `can_subscribe` tinyint(1) NOT NULL DEFAULT '0',
  `sub_start_date` datetime DEFAULT NULL,
  `sub_end_date` datetime DEFAULT NULL,
  `advance` varchar(255) NOT NULL DEFAULT '',
  `autoregistration_code` varchar(255) NOT NULL DEFAULT '',
  `direct_play` tinyint(1) NOT NULL DEFAULT '0',
  `use_logo_in_courselist` tinyint(1) NOT NULL DEFAULT '0',
  `show_result` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credits` int(11) NOT NULL DEFAULT '0',
  `auto_unsubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `unsubscribe_date_limit` datetime DEFAULT NULL,
  PRIMARY KEY (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_coursepath`
--

CREATE TABLE IF NOT EXISTS `learning_coursepath` (
  `id_path` int(11) NOT NULL AUTO_INCREMENT,
  `path_code` varchar(255) NOT NULL DEFAULT '',
  `path_name` varchar(255) NOT NULL DEFAULT '',
  `path_descr` text NOT NULL,
  `subscribe_method` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_coursepath_courses`
--

CREATE TABLE IF NOT EXISTS `learning_coursepath_courses` (
  `id_path` int(11) NOT NULL DEFAULT '0',
  `id_item` int(11) NOT NULL DEFAULT '0',
  `in_slot` int(11) NOT NULL DEFAULT '0',
  `prerequisites` text NOT NULL,
  `sequence` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_path`,`id_item`,`in_slot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_coursepath_user`
--

CREATE TABLE IF NOT EXISTS `learning_coursepath_user` (
  `id_path` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `waiting` tinyint(1) NOT NULL DEFAULT '0',
  `course_completed` int(3) NOT NULL DEFAULT '0',
  `date_assign` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subscribed_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_path`,`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_coursereport`
--

CREATE TABLE IF NOT EXISTS `learning_coursereport` (
  `id_report` int(11) NOT NULL AUTO_INCREMENT,
  `id_course` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `max_score` float NOT NULL DEFAULT '0',
  `required_score` float NOT NULL DEFAULT '0',
  `weight` int(3) NOT NULL DEFAULT '0',
  `show_to_user` enum('true','false') NOT NULL DEFAULT 'true',
  `use_for_final` enum('true','false') NOT NULL DEFAULT 'true',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `source_of` enum('test','activity','scorm','final_vote','scoitem') NOT NULL DEFAULT 'test',
  `id_source` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_coursereport_score`
--

CREATE TABLE IF NOT EXISTS `learning_coursereport_score` (
  `id_report` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `date_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `score` double(5,2) NOT NULL DEFAULT '0.00',
  `score_status` enum('valid','not_checked','not_passed','passed') NOT NULL DEFAULT 'valid',
  `comment` text NOT NULL,
  PRIMARY KEY (`id_report`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_courseuser`
--

CREATE TABLE IF NOT EXISTS `learning_courseuser` (
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `edition_id` int(11) NOT NULL DEFAULT '0',
  `level` int(11) NOT NULL DEFAULT '0',
  `date_inscr` datetime DEFAULT NULL,
  `date_first_access` datetime DEFAULT NULL,
  `date_complete` datetime DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `waiting` tinyint(1) NOT NULL DEFAULT '0',
  `subscribed_by` int(11) NOT NULL DEFAULT '0',
  `rule_log` int(11) DEFAULT NULL,
  `score_given` int(4) DEFAULT NULL,
  `imported_from_connection` varchar(255) DEFAULT NULL,
  `absent` tinyint(1) NOT NULL DEFAULT '0',
  `cancelled_by` int(11) NOT NULL DEFAULT '0',
  `new_forum_post` int(11) NOT NULL DEFAULT '0',
  `date_begin_validity` datetime DEFAULT NULL,
  `date_expire_validity` datetime DEFAULT NULL,
  `requesting_unsubscribe` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `requesting_unsubscribe_date` datetime DEFAULT NULL,
  PRIMARY KEY (`idUser`,`idCourse`,`edition_id`),
  KEY `idCourse` (`idCourse`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course_date`
--

CREATE TABLE IF NOT EXISTS `learning_course_date` (
  `id_date` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_course` int(10) unsigned NOT NULL DEFAULT '0',
  `code` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `max_par` int(11) NOT NULL DEFAULT '0',
  `price` varchar(255) NOT NULL DEFAULT '0',
  `overbooking` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `test_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` int(10) unsigned NOT NULL DEFAULT '0',
  `medium_time` int(11) NOT NULL DEFAULT '0',
  `sub_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sub_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `unsubscribe_date_limit` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_date`),
  KEY `id_course` (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course_date_day`
--

CREATE TABLE IF NOT EXISTS `learning_course_date_day` (
  `id_day` int(11) NOT NULL DEFAULT '0',
  `id_date` int(11) NOT NULL DEFAULT '0',
  `classroom` int(11) unsigned NOT NULL DEFAULT '0',
  `date_begin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pause_begin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pause_end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_day`,`id_date`),
  KEY `id_date` (`id_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course_date_presence`
--

CREATE TABLE IF NOT EXISTS `learning_course_date_presence` (
  `day` date NOT NULL DEFAULT '0000-00-00',
  `id_date` int(11) unsigned NOT NULL DEFAULT '0',
  `id_user` int(11) unsigned NOT NULL DEFAULT '0',
  `id_day` int(11) unsigned NOT NULL DEFAULT '0',
  `presence` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `score` varchar(255) DEFAULT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`day`,`id_date`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course_date_user`
--

CREATE TABLE IF NOT EXISTS `learning_course_date_user` (
  `id_date` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `date_subscription` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_complete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `presence` mediumtext,
  `subscribed_by` int(10) unsigned NOT NULL DEFAULT '0',
  `overbooking` int(10) DEFAULT '0',
  `requesting_unsubscribe` tinyint(1) unsigned DEFAULT NULL,
  `requesting_unsubscribe_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_date`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course_editions`
--

CREATE TABLE IF NOT EXISTS `learning_course_editions` (
  `id_edition` int(11) NOT NULL AUTO_INCREMENT,
  `id_course` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `date_begin` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `max_num_subscribe` int(11) NOT NULL DEFAULT '0',
  `min_num_subscribe` int(11) NOT NULL DEFAULT '0',
  `price` varchar(255) NOT NULL DEFAULT '',
  `overbooking` tinyint(1) NOT NULL DEFAULT '0',
  `can_subscribe` tinyint(1) NOT NULL DEFAULT '0',
  `sub_date_begin` date NOT NULL DEFAULT '0000-00-00',
  `sub_date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_edition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course_editions_user`
--

CREATE TABLE IF NOT EXISTS `learning_course_editions_user` (
  `id_edition` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `date_subscription` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_complete` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `subscribed_by` int(10) unsigned NOT NULL DEFAULT '0',
  `requesting_unsubscribe` tinyint(1) unsigned DEFAULT NULL,
  `requesting_unsubscribe_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_edition`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_course_file`
--

CREATE TABLE IF NOT EXISTS `learning_course_file` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `id_course` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_faq`
--

CREATE TABLE IF NOT EXISTS `learning_faq` (
  `idFaq` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `keyword` text NOT NULL,
  `answer` text NOT NULL,
  `sequence` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idFaq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_faq_cat`
--

CREATE TABLE IF NOT EXISTS `learning_faq_cat` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_forum`
--

CREATE TABLE IF NOT EXISTS `learning_forum` (
  `idForum` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `num_thread` int(11) NOT NULL DEFAULT '0',
  `num_post` int(11) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `sequence` int(5) NOT NULL DEFAULT '0',
  `emoticons` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idForum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_forummessage`
--

CREATE TABLE IF NOT EXISTS `learning_forummessage` (
  `idMessage` int(11) NOT NULL AUTO_INCREMENT,
  `idThread` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `answer_tree` text NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `textof` text NOT NULL,
  `posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `author` int(11) NOT NULL DEFAULT '0',
  `generator` tinyint(1) NOT NULL DEFAULT '0',
  `attach` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `modified_by_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idMessage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_forumthread`
--

CREATE TABLE IF NOT EXISTS `learning_forumthread` (
  `idThread` int(11) NOT NULL AUTO_INCREMENT,
  `id_edition` int(11) NOT NULL DEFAULT '0',
  `idForum` int(11) NOT NULL DEFAULT '0',
  `posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(255) NOT NULL DEFAULT '',
  `author` int(11) NOT NULL DEFAULT '0',
  `num_post` int(11) NOT NULL DEFAULT '0',
  `num_view` int(5) NOT NULL DEFAULT '0',
  `last_post` int(11) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `erased` tinyint(1) NOT NULL DEFAULT '0',
  `emoticons` varchar(255) NOT NULL DEFAULT '',
  `rilevantForum` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idThread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_forum_access`
--

CREATE TABLE IF NOT EXISTS `learning_forum_access` (
  `idForum` int(11) NOT NULL DEFAULT '0',
  `idMember` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idForum`,`idMember`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_forum_notifier`
--

CREATE TABLE IF NOT EXISTS `learning_forum_notifier` (
  `id_notify` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `notify_is_a` enum('forum','thread') NOT NULL DEFAULT 'forum',
  PRIMARY KEY (`id_notify`,`id_user`,`notify_is_a`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_forum_timing`
--

CREATE TABLE IF NOT EXISTS `learning_forum_timing` (
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `last_access` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idUser`,`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_games`
--

CREATE TABLE IF NOT EXISTS `learning_games` (
  `id_game` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  `type_of` varchar(15) NOT NULL DEFAULT '',
  `id_resource` int(11) NOT NULL DEFAULT '0',
  `play_chance` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_games_access`
--

CREATE TABLE IF NOT EXISTS `learning_games_access` (
  `id_game` int(11) NOT NULL DEFAULT '0',
  `idst` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_game`,`idst`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_games_track`
--

CREATE TABLE IF NOT EXISTS `learning_games_track` (
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idTrack` int(11) NOT NULL DEFAULT '0',
  `objectType` varchar(20) NOT NULL DEFAULT '',
  `dateAttempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` varchar(20) NOT NULL DEFAULT '',
  `firstAttempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `current_score` int(11) DEFAULT NULL,
  `max_score` int(11) DEFAULT NULL,
  `num_attempts` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTrack`,`objectType`),
  KEY `idReference` (`idReference`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_glossary`
--

CREATE TABLE IF NOT EXISTS `learning_glossary` (
  `idGlossary` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idGlossary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_glossaryterm`
--

CREATE TABLE IF NOT EXISTS `learning_glossaryterm` (
  `idTerm` int(11) NOT NULL AUTO_INCREMENT,
  `idGlossary` int(11) NOT NULL DEFAULT '0',
  `term` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`idTerm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_homerepo`
--

CREATE TABLE IF NOT EXISTS `learning_homerepo` (
  `idRepo` int(11) NOT NULL AUTO_INCREMENT,
  `idParent` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `lev` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `objectType` varchar(20) NOT NULL DEFAULT '',
  `idResource` int(11) NOT NULL DEFAULT '0',
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idAuthor` int(11) NOT NULL DEFAULT '0',
  `version` varchar(8) NOT NULL DEFAULT '',
  `difficult` enum('_VERYEASY','_EASY','_MEDIUM','_DIFFICULT','_VERYDIFFICULT') NOT NULL DEFAULT '_VERYEASY',
  `description` text NOT NULL,
  `language` varchar(50) NOT NULL DEFAULT '',
  `resource` varchar(255) NOT NULL DEFAULT '',
  `objective` text NOT NULL,
  `dateInsert` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idOwner` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRepo`),
  KEY `idParent` (`idParent`),
  KEY `path` (`path`),
  KEY `idOwner` (`idOwner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_htmlfront`
--

CREATE TABLE IF NOT EXISTS `learning_htmlfront` (
  `id_course` int(11) NOT NULL DEFAULT '0',
  `textof` text NOT NULL,
  PRIMARY KEY (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_htmlpage`
--

CREATE TABLE IF NOT EXISTS `learning_htmlpage` (
  `idPage` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `textof` text NOT NULL,
  `author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_htmlpage_attachment`
--

CREATE TABLE IF NOT EXISTS `learning_htmlpage_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `idpage` int(11) unsigned NOT NULL,
  `file` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_instmsg`
--

CREATE TABLE IF NOT EXISTS `learning_instmsg` (
  `id_msg` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_sender` int(11) NOT NULL DEFAULT '0',
  `id_receiver` int(11) NOT NULL DEFAULT '0',
  `msg` text,
  `status` smallint(2) NOT NULL DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_msg`),
  KEY `id_sender` (`id_sender`,`id_receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_kb_rel`
--

CREATE TABLE IF NOT EXISTS `learning_kb_rel` (
  `res_id` int(11) NOT NULL DEFAULT '0',
  `parent_id` varchar(45) NOT NULL DEFAULT '',
  `rel_type` enum('tag','folder') NOT NULL DEFAULT 'tag',
  PRIMARY KEY (`res_id`,`parent_id`,`rel_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_kb_res`
--

CREATE TABLE IF NOT EXISTS `learning_kb_res` (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(255) NOT NULL DEFAULT '',
  `original_name` varchar(255) DEFAULT NULL,
  `r_desc` text,
  `r_item_id` int(11) NOT NULL DEFAULT '0',
  `r_type` varchar(45) NOT NULL DEFAULT '',
  `r_env` varchar(45) NOT NULL DEFAULT '',
  `r_env_parent_id` int(11) DEFAULT NULL,
  `r_param` varchar(255) DEFAULT NULL,
  `r_alt_desc` varchar(255) DEFAULT NULL,
  `r_lang` varchar(50) NOT NULL DEFAULT '',
  `force_visible` tinyint(1) NOT NULL DEFAULT '0',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `sub_categorize` tinyint(1) NOT NULL DEFAULT '-1',
  `is_categorized` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_kb_tag`
--

CREATE TABLE IF NOT EXISTS `learning_kb_tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_kb_tree`
--

CREATE TABLE IF NOT EXISTS `learning_kb_tree` (
  `node_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `lev` int(11) NOT NULL DEFAULT '0',
  `iLeft` int(11) NOT NULL DEFAULT '0',
  `iRight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_kb_tree_info`
--

CREATE TABLE IF NOT EXISTS `learning_kb_tree_info` (
  `id_dir` int(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(50) NOT NULL DEFAULT '',
  `node_title` varchar(255) NOT NULL DEFAULT '',
  `node_desc` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_label`
--

CREATE TABLE IF NOT EXISTS `learning_label` (
  `id_common_label` int(11) NOT NULL DEFAULT '0',
  `lang_code` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_common_label`,`lang_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_label_course`
--

CREATE TABLE IF NOT EXISTS `learning_label_course` (
  `id_common_label` int(11) NOT NULL DEFAULT '0',
  `id_course` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_common_label`,`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_light_repo`
--

CREATE TABLE IF NOT EXISTS `learning_light_repo` (
  `id_repository` int(11) NOT NULL AUTO_INCREMENT,
  `id_course` int(11) NOT NULL DEFAULT '0',
  `repo_title` varchar(255) NOT NULL DEFAULT '',
  `repo_descr` text NOT NULL,
  PRIMARY KEY (`id_repository`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_light_repo_files`
--

CREATE TABLE IF NOT EXISTS `learning_light_repo_files` (
  `id_file` int(11) NOT NULL AUTO_INCREMENT,
  `id_repository` int(11) NOT NULL DEFAULT '0',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `file_descr` text NOT NULL,
  `id_author` int(11) NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id_file`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_light_repo_user`
--

CREATE TABLE IF NOT EXISTS `learning_light_repo_user` (
  `id_repo` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL DEFAULT '0',
  `last_enter` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `repo_lock` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_repo`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_link`
--

CREATE TABLE IF NOT EXISTS `learning_link` (
  `idLink` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `link_address` varchar(255) NOT NULL DEFAULT '',
  `keyword` text NOT NULL,
  `description` text NOT NULL,
  `sequence` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idLink`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_link_cat`
--

CREATE TABLE IF NOT EXISTS `learning_link_cat` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_lo_param`
--

CREATE TABLE IF NOT EXISTS `learning_lo_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idParam` int(11) NOT NULL DEFAULT '0',
  `param_name` varchar(20) NOT NULL DEFAULT '',
  `param_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idParam_name` (`idParam`,`param_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_lo_types`
--

CREATE TABLE IF NOT EXISTS `learning_lo_types` (
  `objectType` varchar(20) NOT NULL DEFAULT '',
  `className` varchar(20) NOT NULL DEFAULT '',
  `fileName` varchar(50) NOT NULL DEFAULT '',
  `classNameTrack` varchar(255) NOT NULL DEFAULT '',
  `fileNameTrack` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`objectType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learning_lo_types`
--

INSERT INTO `learning_lo_types` (`objectType`, `className`, `fileName`, `classNameTrack`, `fileNameTrack`) VALUES
('faq', 'Learning_Faq', 'learning.faq.php', 'Track_Faq', 'track.faq.php'),
('glossary', 'Learning_Glossary', 'learning.glossary.php', 'Track_Glossary', 'track.glossary.php'),
('htmlpage', 'Learning_Htmlpage', 'learning.htmlpage.php', 'Track_Htmlpage', 'track.htmlpage.php'),
('item', 'Learning_Item', 'learning.item.php', 'Track_Item', 'track.item.php'),
('link', 'Learning_Link', 'learning.link.php', 'Track_Link', 'track.link.php'),
('poll', 'Learning_Poll', 'learning.poll.php', 'Track_Poll', 'track.poll.php'),
('scormorg', 'Learning_ScormOrg', 'learning.scorm.php', 'Track_Scormorg', 'track.scorm.php'),
('test', 'Learning_Test', 'learning.test.php', 'Track_Test', 'track.test.php');

-- --------------------------------------------------------

--
-- Table structure for table `learning_materials_lesson`
--

CREATE TABLE IF NOT EXISTS `learning_materials_lesson` (
  `idLesson` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idLesson`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_materials_track`
--

CREATE TABLE IF NOT EXISTS `learning_materials_track` (
  `idTrack` int(11) NOT NULL AUTO_INCREMENT,
  `idResource` int(11) NOT NULL DEFAULT '0',
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTrack`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_menu`
--

CREATE TABLE IF NOT EXISTS `learning_menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `collapse` enum('true','false') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `learning_menu`
--

INSERT INTO `learning_menu` (`idMenu`, `name`, `image`, `sequence`, `collapse`) VALUES
(1, '_MANAGEMENT_COURSE', '', 1, 'false'),
(2, '', '', 2, 'true'),
(3, '_ASSESSMENT', '', 3, 'false'),
(4, '', '', 4, 'true'),
(5, '', '', 5, 'true'),
(6, '_CONTENTS', '', 6, 'false'),
(7, '_MAN_CERTIFICATE', '', 7, 'false'),
(8, '_MANAGEMENT_RESERVATION', '', 8, 'false'),
(9, '_CONFIGURATION', '', 9, 'false'),
(10, '', '', 10, 'true'),
(11, '', '', 11, 'true'),
(12, '', '', 12, 'true'),
(13, '', '', 13, 'true'),
(14, '', '', 14, 'true');

-- --------------------------------------------------------

--
-- Table structure for table `learning_menucourse_main`
--

CREATE TABLE IF NOT EXISTS `learning_menucourse_main` (
  `idMain` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idMain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_menucourse_under`
--

CREATE TABLE IF NOT EXISTS `learning_menucourse_under` (
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `idModule` int(11) NOT NULL DEFAULT '0',
  `idMain` int(11) NOT NULL DEFAULT '0',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `my_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idCourse`,`idModule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learning_menucourse_under`
--

INSERT INTO `learning_menucourse_under` (`idCourse`, `idModule`, `idMain`, `sequence`, `my_name`) VALUES
(0, 1, 0, 1, ''),
(0, 2, 0, 2, ''),
(0, 3, 0, 3, ''),
(0, 4, 0, 4, ''),
(0, 5, 0, 5, ''),
(0, 6, 0, 6, ''),
(0, 7, 0, 2, ''),
(0, 8, 0, 8, ''),
(0, 9, 0, 9, ''),
(0, 32, 0, 4, ''),
(0, 33, 5, 11, ''),
(0, 34, 0, 3, ''),
(0, 35, 1, 1, ''),
(0, 36, 1, 2, ''),
(0, 37, 1, 3, ''),
(0, 38, 1, 4, ''),
(0, 39, 1, 5, '');

-- --------------------------------------------------------

--
-- Table structure for table `learning_menucustom`
--

CREATE TABLE IF NOT EXISTS `learning_menucustom` (
  `idCustom` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`idCustom`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Dumping data for table `learning_menucustom`
--

INSERT INTO `learning_menucustom` (`idCustom`, `title`, `description`) VALUES
(11, 'Collaboration', 'Menu with standard collaboration features'),
(21, 'Self - Training', 'Training based on multimedia content');

-- --------------------------------------------------------

--
-- Table structure for table `learning_menucustom_main`
--

CREATE TABLE IF NOT EXISTS `learning_menucustom_main` (
  `idMain` int(11) NOT NULL AUTO_INCREMENT,
  `idCustom` int(11) NOT NULL DEFAULT '0',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idMain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=44 ;

--
-- Dumping data for table `learning_menucustom_main`
--

INSERT INTO `learning_menucustom_main` (`idMain`, `idCustom`, `sequence`, `name`, `image`) VALUES
(25, 11, 1, 'Student Area', ''),
(26, 11, 3, 'Teacher Area', ''),
(27, 11, 4, 'Stat Area', ''),
(41, 11, 2, 'Collaborative Area', ''),
(42, 21, 1, 'Student Area', ''),
(43, 21, 2, 'Teacher', '');

-- --------------------------------------------------------

--
-- Table structure for table `learning_menucustom_under`
--

CREATE TABLE IF NOT EXISTS `learning_menucustom_under` (
  `idCustom` int(11) NOT NULL DEFAULT '0',
  `idModule` int(11) NOT NULL DEFAULT '0',
  `idMain` int(11) NOT NULL DEFAULT '0',
  `sequence` int(3) NOT NULL DEFAULT '0',
  `my_name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idCustom`,`idModule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learning_menucustom_under`
--

INSERT INTO `learning_menucustom_under` (`idCustom`, `idModule`, `idMain`, `sequence`, `my_name`) VALUES
(0, 1, 0, 1, ''),
(0, 2, 0, 2, ''),
(0, 3, 0, 3, ''),
(0, 4, 0, 4, ''),
(0, 5, 0, 5, ''),
(0, 6, 0, 6, ''),
(0, 7, 0, 7, ''),
(0, 8, 0, 8, ''),
(0, 9, 0, 9, ''),
(0, 32, 0, 10, ''),
(0, 33, 0, 11, ''),
(11, 11, 25, 2, ''),
(11, 12, 26, 1, ''),
(11, 13, 25, 4, ''),
(11, 14, 25, 5, ''),
(11, 15, 25, 8, ''),
(11, 17, 41, 6, ''),
(11, 19, 41, 1, ''),
(11, 20, 41, 2, ''),
(11, 21, 41, 5, ''),
(11, 22, 41, 4, ''),
(11, 23, 41, 3, ''),
(11, 24, 26, 2, ''),
(11, 25, 25, 3, ''),
(11, 26, 26, 5, ''),
(11, 27, 26, 3, ''),
(11, 29, 27, 1, ''),
(11, 30, 27, 2, ''),
(11, 31, 27, 3, ''),
(11, 41, 27, 17, ''),
(11, 42, 27, 18, ''),
(11, 43, 26, 16, ''),
(21, 12, 43, 1, ''),
(21, 14, 42, 2, ''),
(21, 25, 42, 1, ''),
(21, 26, 43, 2, ''),
(21, 29, 43, 6, ''),
(21, 30, 43, 7, ''),
(21, 31, 43, 5, ''),
(21, 41, 43, 3, ''),
(21, 42, 43, 4, '');

-- --------------------------------------------------------

--
-- Table structure for table `learning_menu_under`
--

CREATE TABLE IF NOT EXISTS `learning_menu_under` (
  `idUnder` int(11) NOT NULL AUTO_INCREMENT,
  `idMenu` int(11) NOT NULL DEFAULT '0',
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `default_name` varchar(255) NOT NULL DEFAULT '',
  `default_op` varchar(255) NOT NULL DEFAULT '',
  `associated_token` varchar(255) NOT NULL DEFAULT '',
  `of_platform` varchar(255) DEFAULT NULL,
  `sequence` int(3) NOT NULL DEFAULT '0',
  `class_file` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `mvc_path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idUnder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `learning_menu_under`
--

INSERT INTO `learning_menu_under` (`idUnder`, `idMenu`, `module_name`, `default_name`, `default_op`, `associated_token`, `of_platform`, `sequence`, `class_file`, `class_name`, `mvc_path`) VALUES
(1, 1, 'course', '_COURSE', '', 'view', NULL, 1, '', '', 'alms/course/show'),
(2, 9, 'amanmenu', '_MAN_MENU', 'mancustom', 'view', NULL, 1, 'class.amanmenu.php', 'Module_AManmenu', ''),
(3, 1, 'coursepath', '_COURSEPATH', 'pathlist', 'view', NULL, 2, 'class.coursepath.php', 'Module_Coursepath', ''),
(4, 1, 'catalogue', '_CATALOGUE', 'catlist', 'view', NULL, 3, 'class.catalogue.php', 'Module_Catalogue', ''),
(5, 6, 'webpages', '_WEBPAGES', 'webpages', 'view', NULL, 1, 'class.webpages.php', 'Module_Webpages', ''),
(6, 6, 'news', '_NEWS', 'news', 'view', NULL, 2, 'class.news.php', 'Module_News', ''),
(7, 9, 'questcategory', '_QUESTCATEGORY', '', 'view', NULL, 4, '', '', 'alms/questcategory/show'),
(8, 1, 'coursecategory', '_COURSECATEGORY', '', 'view', NULL, 4, '', '', 'alms/coursecategory/show'),
(9, 11, 'report', '_REPORT', 'reportlist', 'view', NULL, 1, 'class.report.php', 'Module_Report', ''),
(10, 3, 'preassessment', '_ASSESSMENT', 'assesmentlist', 'view', NULL, 1, 'class.preassessment.php', 'Module_PreAssessment', ''),
(14, 7, 'certificate', '_CERTIFICATE', 'certificate', 'view', NULL, 1, 'class.certificate.php', 'Module_Certificate', ''),
(17, 8, 'reservation', '_EVENTS', 'view_event', 'view', NULL, 1, 'class.reservation.php', 'Module_Reservation', ''),
(18, 8, 'reservation', '_CATEGORY', 'view_category', 'view', NULL, 2, 'class.reservation.php', 'Module_Reservation', ''),
(20, 8, 'reservation', '_RESERVATION', 'view_registration', 'view', NULL, 3, 'class.reservation.php', 'Module_Reservation', ''),
(21, 9, 'middlearea', '_MIDDLE_AREA', 'view_area', 'view', NULL, 2, 'class.middlearea.php', 'Module_MiddleArea', ''),
(22, 6, 'internal_news', '_NEWS_INTERNAL', 'news', 'view', NULL, 3, 'class.internal_news.php', 'Module_Internal_News', ''),
(23, 7, 'meta_certificate', '_META_CERTIFICATE', 'meta_certificate', 'view', NULL, 3, 'class.meta_certificate.php', 'Module_Meta_Certificate', ''),
(26, 14, 'transaction', '_TRANSACTION', '', 'view', NULL, 1, '', '', 'alms/transaction/show'),
(27, 2, 'location', '_LOCATION', '', 'view', NULL, 1, '', '', 'alms/location/show'),
(28, 4, 'games', '_CONTEST', '', 'view', NULL, 1, '', '', 'alms/games/show'),
(29, 5, 'communication', '_COMMUNICATION_MAN', '', 'view', NULL, 1, '', '', 'alms/communication/show'),
(30, 12, 'kb', '_CONTENT_LIBRARY', '', 'view', NULL, 1, '', '', 'alms/kb/show'),
(31, 9, 'timeperiods', '_TIME_PERIODS', '', 'view', NULL, 5, '', '', 'alms/timeperiods/show'),
(32, 13, 'enrollrules', '_ENROLLRULES', '', 'view', NULL, 1, '', '', 'alms/enrollrules/show'),
(33, 9, 'label', '_LABEL', '', 'view', NULL, 5, '', '', 'alms/label/show');

-- --------------------------------------------------------

--
-- Table structure for table `learning_middlearea`
--

CREATE TABLE IF NOT EXISTS `learning_middlearea` (
  `obj_index` varchar(255) NOT NULL DEFAULT '',
  `disabled` tinyint(1) NOT NULL DEFAULT '0',
  `idst_list` text NOT NULL,
  `sequence` int(5) NOT NULL,
  PRIMARY KEY (`obj_index`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learning_middlearea`
--

INSERT INTO `learning_middlearea` (`obj_index`, `disabled`, `idst_list`, `sequence`) VALUES
('credits', 1, 'a:0:{}', 0),
('mo_32', 1, 'a:0:{}', 0),
('mo_33', 1, 'a:0:{}', 0),
('mo_34', 1, 'a:0:{}', 0),
('mo_help', 1, 'a:0:{}', 0),
('tb_assessment', 1, 'a:0:{}', 0),
('tb_catalog', 1, 'a:0:{}', 0),
('tb_classroom', 1, 'a:0:{}', 0),
('tb_communication', 1, 'a:0:{}', 0),
('tb_coursepath', 1, 'a:0:{}', 0),
('tb_elearning', 0, 'a:0:{}', 0),
('tb_games', 1, 'a:0:{}', 0),
('tb_home', 1, 'a:0:{}', 0),
('tb_kb', 0, 'a:0:{}', 0),
('tb_label', 1, 'a:0:{}', 0),
('tb_videoconference', 1, 'a:0:{}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `learning_module`
--

CREATE TABLE IF NOT EXISTS `learning_module` (
  `idModule` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(255) NOT NULL DEFAULT '',
  `default_op` varchar(255) NOT NULL DEFAULT '',
  `default_name` varchar(255) NOT NULL DEFAULT '',
  `token_associated` varchar(100) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `module_info` varchar(50) NOT NULL DEFAULT '',
  `mvc_path` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idModule`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=46 ;

--
-- Dumping data for table `learning_module`
--

INSERT INTO `learning_module` (`idModule`, `module_name`, `default_op`, `default_name`, `token_associated`, `file_name`, `class_name`, `module_info`, `mvc_path`) VALUES
(1, 'course', '', '_MYCOURSES', 'view', '', '', 'all', 'elearning/show'),
(3, 'profile', 'profile', '_PROFILE', 'view', 'class.profile.php', 'Module_Profile', '_user', ''),
(7, 'mycertificate', 'mycertificate', '_MY_CERTIFICATE', 'view', 'class.mycertificate.php', 'Module_MyCertificate', 'all', ''),
(10, 'course', 'infocourse', '_INFCOURSE', 'view_info', 'class.course.php', 'Module_Course', '', ''),
(11, 'advice', 'advice', '_ADVICE', 'view', 'class.advice.php', 'Module_Advice', '', ''),
(12, 'storage', 'display', '_STORAGE', 'view', 'class.storage.php', 'Module_Storage', '', ''),
(13, 'calendar', 'calendar', '_CALENDAR', 'view', 'class.calendar.php', 'Module_Calendar', '', ''),
(14, 'gradebook', 'showgrade', '_GRADEBOOK', 'view', 'class.gradebook.php', 'Module_Gradebook', '', ''),
(15, 'notes', 'notes', '_NOTES', 'view', 'class.notes.php', 'Module_Notes', '', ''),
(16, 'reservation', 'reservation', '_RESERVATION', 'view', 'class.reservation.php', 'Module_Reservation', '', ''),
(17, 'light_repo', 'repolist', '_LIGHT_REPO', 'view', 'class.light_repo.php', 'Module_Light_Repo', '', ''),
(18, 'htmlfront', 'showhtml', '_HTMLFRONT', 'view', 'class.htmlfront.php', 'Module_Htmlfront', '', ''),
(19, 'forum', 'forum', '_FORUM', 'view', 'class.forum.php', 'Module_Forum', '', ''),
(20, 'wiki', 'main', '_WIKI', 'view', 'class.wiki.php', 'Module_Wiki', '', ''),
(21, 'chat', 'chat', '_CHAT', 'view', 'class.chat.php', 'Module_Chat', '', ''),
(22, 'conference', 'list', '_VIDEOCONFERENCE', 'view', 'class.conference.php', 'Module_Conference', '', ''),
(23, 'project', 'project', '_PROJECT', 'view', 'class.project.php', 'Module_Project', '', ''),
(24, 'groups', 'groups', '_GROUPS', 'view', 'class.groups.php', 'Module_Groups', '', ''),
(25, 'organization', 'organization', '_ORGANIZATION', 'view', 'class.organization.php', 'Module_Organization', '', ''),
(26, 'coursereport', 'coursereport', '_COURSEREPORT', 'view', 'class.coursereport.php', 'Module_CourseReport', '', ''),
(27, 'newsletter', 'view', '_NEWSLETTER', 'view', 'class.newsletter.php', 'Module_Newsletter', '', ''),
(28, 'manmenu', 'manmenu', '_MAN_MENU', 'view', 'class.manmenu.php', 'Module_CourseManmenu', '', ''),
(29, 'statistic', 'statistic', '_STAT', 'view', 'class.statistic.php', 'Module_Statistic', '', ''),
(30, 'stats', 'statuser', '_STATUSER', 'view_user', 'class.stats.php', 'Module_Stats', '', ''),
(31, 'stats', 'statcourse', '_STATCOURSE', 'view_course', 'class.stats.php', 'Module_Stats', '', ''),
(32, 'public_forum', 'forum', '_PUBLIC_FORUM', 'view', 'class.public_forum.php', 'Module_Public_Forum', 'all', ''),
(33, 'course_autoregistration', 'course_autoregistration', '_COURSE_AUTOREGISTRATION', 'view', 'class.course_autoregistration.php', 'Module_Course_Autoregistration', 'all', ''),
(34, 'mycompetences', 'mycompetences', '_MYCOMPETENCES', 'view', 'class.mycompetences.php', 'Module_MyCompetences', 'all', ''),
(35, 'pusermanagement', '', '_PUBLIC_USER_ADMIN', 'view', '', '', 'public_admin', 'lms/pusermanagement/show'),
(36, 'pcourse', '', '_PUBLIC_COURSE_ADMIN', 'view', '', '', 'public_admin', 'lms/pcourse/show'),
(38, 'public_report_admin', 'reportlist', '_PUBLIC_REPORT_ADMIN', 'view', 'class.public_report_admin.php', 'Module_Public_Report_Admin', 'public_admin', ''),
(39, 'public_newsletter_admin', 'newsletter', '_PUBLIC_NEWSLETTER_ADMIN', 'view', 'class.public_newsletter_admin.php', 'Module_Public_Newsletter_Admin', 'public_admin', ''),
(40, 'quest_bank', 'main', '_QUEST_BANK', 'view', 'class.quest_bank.php', 'Module_QuestBank', '', ''),
(41, 'coursecharts', 'show', '_COURSECHART', 'view', 'class.coursecharts.php', 'Module_Coursecharts', '', 'coursecharts/show'),
(42, 'coursestats', 'show', '_COURSESTATS', 'view', '', '', '', 'coursestats/show'),
(44, 'pcertificate', 'certificate', '_PUBLIC_CERTIFICATE_ADMIN', 'view', 'class.pcertificate.php', 'Module_Pcertificate', 'public_admin', ''),
(45, 'presence', '', '_PRESENCE', 'view', '', '', '', 'presence/presence');

-- --------------------------------------------------------

--
-- Table structure for table `learning_news`
--

CREATE TABLE IF NOT EXISTS `learning_news` (
  `idNews` int(11) NOT NULL AUTO_INCREMENT,
  `publish_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(100) NOT NULL DEFAULT '',
  `short_desc` text NOT NULL,
  `long_desc` text NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT '',
  `important` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idNews`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_news_internal`
--

CREATE TABLE IF NOT EXISTS `learning_news_internal` (
  `idNews` int(11) NOT NULL AUTO_INCREMENT,
  `publish_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(100) NOT NULL DEFAULT '',
  `short_desc` text NOT NULL,
  `long_desc` text NOT NULL,
  `language` varchar(100) NOT NULL DEFAULT '',
  `important` tinyint(1) NOT NULL DEFAULT '0',
  `viewer` longtext NOT NULL,
  PRIMARY KEY (`idNews`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_notes`
--

CREATE TABLE IF NOT EXISTS `learning_notes` (
  `idNotes` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `owner` int(11) NOT NULL DEFAULT '0',
  `data` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(150) NOT NULL DEFAULT '',
  `textof` text NOT NULL,
  PRIMARY KEY (`idNotes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_organization`
--

CREATE TABLE IF NOT EXISTS `learning_organization` (
  `idOrg` int(11) NOT NULL AUTO_INCREMENT,
  `idParent` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `lev` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `objectType` varchar(20) NOT NULL DEFAULT '',
  `idResource` int(11) NOT NULL DEFAULT '0',
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idAuthor` int(11) NOT NULL DEFAULT '0',
  `version` varchar(8) NOT NULL DEFAULT '',
  `difficult` enum('_VERYEASY','_EASY','_MEDIUM','_DIFFICULT','_VERYDIFFICULT') NOT NULL DEFAULT '_VERYEASY',
  `description` text NOT NULL,
  `language` varchar(50) NOT NULL DEFAULT '',
  `resource` varchar(255) NOT NULL DEFAULT '',
  `objective` text NOT NULL,
  `dateInsert` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `prerequisites` varchar(255) NOT NULL DEFAULT '',
  `isTerminator` tinyint(4) NOT NULL DEFAULT '0',
  `idParam` int(11) NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `milestone` enum('start','end','-') NOT NULL DEFAULT '-',
  `width` varchar(4) NOT NULL DEFAULT '',
  `height` varchar(4) NOT NULL DEFAULT '',
  `publish_from` datetime DEFAULT NULL,
  `publish_to` datetime DEFAULT NULL,
  `access` varchar(255) DEFAULT NULL,
  `publish_for` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idOrg`),
  KEY `idParent` (`idParent`),
  KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_organization_access`
--

CREATE TABLE IF NOT EXISTS `learning_organization_access` (
  `idOrgAccess` int(11) NOT NULL DEFAULT '0',
  `kind` set('user','group') NOT NULL DEFAULT '',
  `value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idOrgAccess`,`kind`,`value`),
  KEY `idObject` (`idOrgAccess`),
  KEY `kind` (`kind`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Access to items in area lesson (organization)';

-- --------------------------------------------------------

--
-- Table structure for table `learning_poll`
--

CREATE TABLE IF NOT EXISTS `learning_poll` (
  `id_poll` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  PRIMARY KEY (`id_poll`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_pollquest`
--

CREATE TABLE IF NOT EXISTS `learning_pollquest` (
  `id_quest` int(11) NOT NULL AUTO_INCREMENT,
  `id_poll` int(11) NOT NULL DEFAULT '0',
  `id_category` int(11) NOT NULL DEFAULT '0',
  `type_quest` varchar(255) NOT NULL DEFAULT '',
  `title_quest` text NOT NULL,
  `sequence` int(5) NOT NULL DEFAULT '0',
  `page` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_pollquestanswer`
--

CREATE TABLE IF NOT EXISTS `learning_pollquestanswer` (
  `id_answer` int(11) NOT NULL AUTO_INCREMENT,
  `id_quest` int(11) NOT NULL DEFAULT '0',
  `sequence` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  PRIMARY KEY (`id_answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_pollquest_extra`
--

CREATE TABLE IF NOT EXISTS `learning_pollquest_extra` (
  `id_quest` int(11) NOT NULL DEFAULT '0',
  `id_answer` int(11) NOT NULL DEFAULT '0',
  `extra_info` text NOT NULL,
  PRIMARY KEY (`id_quest`,`id_answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_polltrack`
--

CREATE TABLE IF NOT EXISTS `learning_polltrack` (
  `id_track` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `id_reference` int(11) NOT NULL DEFAULT '0',
  `id_poll` int(11) NOT NULL DEFAULT '0',
  `date_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('valid','not_complete') NOT NULL DEFAULT 'not_complete',
  PRIMARY KEY (`id_track`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_polltrack_answer`
--

CREATE TABLE IF NOT EXISTS `learning_polltrack_answer` (
  `id_track` int(11) NOT NULL DEFAULT '0',
  `id_quest` int(11) NOT NULL DEFAULT '0',
  `id_answer` int(11) NOT NULL DEFAULT '0',
  `more_info` longtext NOT NULL,
  PRIMARY KEY (`id_track`,`id_quest`,`id_answer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_prj`
--

CREATE TABLE IF NOT EXISTS `learning_prj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ptitle` varchar(255) NOT NULL DEFAULT '',
  `pgroup` int(11) NOT NULL DEFAULT '0',
  `pprog` tinyint(3) NOT NULL DEFAULT '0',
  `psfiles` tinyint(1) NOT NULL DEFAULT '0',
  `pstasks` tinyint(1) NOT NULL DEFAULT '0',
  `psnews` tinyint(1) NOT NULL DEFAULT '0',
  `pstodo` tinyint(1) NOT NULL DEFAULT '0',
  `psmsg` tinyint(1) NOT NULL DEFAULT '0',
  `cid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_prj_files`
--

CREATE TABLE IF NOT EXISTS `learning_prj_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `fname` varchar(255) NOT NULL DEFAULT '',
  `ftitle` varchar(255) NOT NULL DEFAULT '',
  `fver` varchar(255) NOT NULL DEFAULT '',
  `fdesc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_prj_news`
--

CREATE TABLE IF NOT EXISTS `learning_prj_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `ntitle` varchar(255) NOT NULL DEFAULT '',
  `ndate` date NOT NULL DEFAULT '0000-00-00',
  `ntxt` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_prj_tasks`
--

CREATE TABLE IF NOT EXISTS `learning_prj_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `tprog` tinyint(3) NOT NULL DEFAULT '0',
  `tname` varchar(255) NOT NULL DEFAULT '',
  `tdesc` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_prj_todo`
--

CREATE TABLE IF NOT EXISTS `learning_prj_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `ttitle` varchar(255) NOT NULL DEFAULT '',
  `ttxt` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_prj_users`
--

CREATE TABLE IF NOT EXISTS `learning_prj_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `userid` int(11) NOT NULL DEFAULT '0',
  `flag` tinyint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_quest_category`
--

CREATE TABLE IF NOT EXISTS `learning_quest_category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `textof` text NOT NULL,
  `author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_quest_type`
--

CREATE TABLE IF NOT EXISTS `learning_quest_type` (
  `type_quest` varchar(255) NOT NULL DEFAULT '',
  `type_file` varchar(255) NOT NULL DEFAULT '',
  `type_class` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learning_quest_type`
--

INSERT INTO `learning_quest_type` (`type_quest`, `type_file`, `type_class`, `sequence`) VALUES
('associate', 'class.associate.php', 'Associate_Question', 8),
('break_page', 'class.break_page.php', 'BreakPage_Question', 10),
('choice', 'class.choice.php', 'Choice_Question', 1),
('choice_multiple', 'class.choice_multiple.php', 'ChoiceMultiple_Question', 2),
('extended_text', 'class.extended_text.php', 'ExtendedText_Question', 3),
('hot_text', 'class.hot_text.php', 'HotText_Question', 6),
('inline_choice', 'class.inline_choice.php', 'InlineChoice_Question', 5),
('text_entry', 'class.text_entry.php', 'TextEntry_Question', 4),
('title', 'class.title.php', 'Title_Question', 9),
('upload', 'class.upload.php', 'Upload_Question', 7);

-- --------------------------------------------------------

--
-- Table structure for table `learning_quest_type_poll`
--

CREATE TABLE IF NOT EXISTS `learning_quest_type_poll` (
  `type_quest` varchar(255) NOT NULL DEFAULT '',
  `type_file` varchar(255) NOT NULL DEFAULT '',
  `type_class` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type_quest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `learning_quest_type_poll`
--

INSERT INTO `learning_quest_type_poll` (`type_quest`, `type_file`, `type_class`, `sequence`) VALUES
('break_page', 'class.break_page.php', 'BreakPage_QuestionPoll', 7),
('choice', 'class.choice.php', 'Choice_QuestionPoll', 1),
('choice_multiple', 'class.choice_multiple.php', 'ChoiceMultiple_QuestionPoll', 2),
('course_valutation', 'class.course_valutation.php', 'CourseValutation_QuestionPoll', 5),
('doc_valutation', 'class.doc_valutation.php', 'DocValutation_QuestionPoll', 4),
('extended_text', 'class.extended_text.php', 'ExtendedText_QuestionPoll', 3),
('title', 'class.title.php', 'Title_QuestionPoll', 6);

-- --------------------------------------------------------

--
-- Table structure for table `learning_repo`
--

CREATE TABLE IF NOT EXISTS `learning_repo` (
  `idRepo` int(11) NOT NULL AUTO_INCREMENT,
  `idParent` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `lev` int(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `objectType` varchar(20) NOT NULL DEFAULT '',
  `idResource` int(11) NOT NULL DEFAULT '0',
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idAuthor` varchar(11) NOT NULL DEFAULT '0',
  `version` varchar(8) NOT NULL DEFAULT '',
  `difficult` enum('_VERYEASY','_EASY','_MEDIUM','_DIFFICULT','_VERYDIFFICULT') NOT NULL DEFAULT '_VERYEASY',
  `description` text NOT NULL,
  `language` varchar(50) NOT NULL DEFAULT '',
  `resource` varchar(255) NOT NULL DEFAULT '',
  `objective` text NOT NULL,
  `dateInsert` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idRepo`),
  KEY `idParent` (`idParent`),
  KEY `path` (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_report`
--

CREATE TABLE IF NOT EXISTS `learning_report` (
  `id_report` int(11) NOT NULL AUTO_INCREMENT,
  `report_name` varchar(255) NOT NULL DEFAULT '',
  `class_name` varchar(255) NOT NULL DEFAULT '',
  `file_name` varchar(255) NOT NULL DEFAULT '',
  `use_user_selection` enum('true','false') NOT NULL DEFAULT 'true',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_report`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `learning_report`
--

INSERT INTO `learning_report` (`id_report`, `report_name`, `class_name`, `file_name`, `use_user_selection`, `enabled`) VALUES
(2, 'user_report', 'Report_User', 'class.report_user.php', 'true', 1),
(4, 'courses_report', 'Report_Courses', 'class.report_courses.php', 'true', 1),
(5, 'aggregate_report', 'Report_Aggregate', 'class.report_aggregate.php', 'true', 1);

-- --------------------------------------------------------

--
-- Table structure for table `learning_report_filter`
--

CREATE TABLE IF NOT EXISTS `learning_report_filter` (
  `id_filter` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_report` int(10) unsigned NOT NULL DEFAULT '0',
  `author` int(10) unsigned NOT NULL DEFAULT '0',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `filter_name` varchar(255) NOT NULL DEFAULT '',
  `filter_data` text NOT NULL,
  `is_public` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `views` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_filter`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data for table `learning_report_filter`
--

INSERT INTO `learning_report_filter` (`id_filter`, `id_report`, `author`, `creation_date`, `filter_name`, `filter_data`, `is_public`, `views`) VALUES
(13, 4, 270, '0000-00-00 00:00:00', 'Courses - Users', 'a:5:{s:9:"id_report";s:1:"4";s:11:"report_name";s:15:"Courses - Users";s:11:"rows_filter";a:2:{s:11:"all_courses";b:1;s:16:"selected_courses";a:0:{}}s:23:"columns_filter_category";s:5:"users";s:14:"columns_filter";a:6:{s:9:"time_belt";a:3:{s:10:"time_range";s:1:"0";s:10:"start_date";s:0:"";s:8:"end_date";s:0:"";}s:21:"org_chart_subdivision";i:0;s:11:"showed_cols";a:7:{i:0;s:12:"_CODE_COURSE";i:1;s:12:"_NAME_COURSE";i:2;s:6:"_INSCR";i:3;s:10:"_MUSTBEGIN";i:4;s:18:"_USER_STATUS_BEGIN";i:5;s:15:"_COMPLETECOURSE";i:6;s:14:"_TOTAL_SESSION";}s:12:"show_percent";b:1;s:9:"all_users";b:1;s:5:"users";a:0:{}}}', 1, 0),
(25, 2, 270, '0000-00-00 00:00:00', 'Users - Courses', 'a:5:{s:9:"id_report";s:1:"2";s:11:"report_name";s:15:"Users - Courses";s:11:"rows_filter";a:2:{s:5:"users";a:0:{}s:9:"all_users";b:1;}s:23:"columns_filter_category";s:7:"courses";s:14:"columns_filter";a:7:{s:21:"org_chart_subdivision";i:0;s:11:"all_courses";b:1;s:16:"selected_courses";a:0:{}s:11:"sub_filters";a:0:{}s:16:"filter_exclusive";s:1:"1";s:14:"showed_columns";a:12:{i:0;s:8:"_TH_CODE";i:1;s:25:"_TH_USER_INSCRIPTION_DATE";i:2;s:19:"_TH_USER_START_DATE";i:3;s:17:"_TH_USER_END_DATE";i:4;s:20:"_TH_LAST_ACCESS_DATE";i:5;s:15:"_TH_USER_STATUS";i:6;s:20:"_TH_USER_START_SCORE";i:7;s:20:"_TH_USER_FINAL_SCORE";i:8;s:21:"_TH_USER_COURSE_SCORE";i:9;s:23:"_TH_USER_NUMBER_SESSION";i:10;s:21:"_TH_USER_ELAPSED_TIME";i:11;s:18:"_TH_ESTIMATED_TIME";}s:13:"custom_fields";a:0:{}}}', 1, 0),
(26, 2, 270, '0000-00-00 00:00:00', 'Users - Learning Objects', 'a:5:{s:9:"id_report";s:1:"2";s:11:"report_name";s:24:"Users - Learning Objects";s:11:"rows_filter";a:2:{s:5:"users";a:0:{}s:9:"all_users";b:1;}s:23:"columns_filter_category";s:2:"LO";s:14:"columns_filter";a:6:{s:11:"all_courses";b:1;s:16:"selected_courses";a:0:{}s:8:"lo_types";a:8:{s:3:"faq";s:3:"faq";s:8:"glossary";s:8:"glossary";s:8:"htmlpage";s:8:"htmlpage";s:4:"item";s:4:"item";s:4:"link";s:4:"link";s:4:"poll";s:4:"poll";s:8:"scormorg";s:8:"scormorg";s:4:"test";s:4:"test";}s:13:"lo_milestones";a:0:{}s:14:"showed_columns";a:8:{i:0;s:9:"user_name";i:1;s:11:"course_name";i:2;s:13:"course_status";i:3;s:7:"lo_type";i:4;s:7:"lo_name";i:5;s:12:"firstAttempt";i:6;s:11:"lastAttempt";i:7;s:9:"lo_status";}s:13:"custom_fields";a:0:{}}}', 1, 0),
(27, 2, 270, '0000-00-00 00:00:00', 'Users - 30 Days Delay', 'a:5:{s:9:"id_report";s:1:"2";s:11:"report_name";s:21:"Users - 30 Days Delay";s:11:"rows_filter";a:2:{s:5:"users";a:0:{}s:9:"all_users";b:1;}s:23:"columns_filter_category";s:5:"delay";s:14:"columns_filter";a:9:{s:21:"report_type_completed";b:1;s:19:"report_type_started";b:1;s:21:"day_from_subscription";s:2:"30";s:20:"day_until_course_end";s:0:"";s:21:"date_until_course_end";s:0:"";s:21:"org_chart_subdivision";i:0;s:11:"all_courses";b:1;s:16:"selected_courses";a:0:{}s:14:"showed_columns";a:7:{i:0;s:9:"_LASTNAME";i:1;s:5:"_NAME";i:2;s:7:"_STATUS";i:3;s:6:"_EMAIL";i:4;s:11:"_DATE_INSCR";i:5;s:18:"_DATE_FIRST_ACCESS";i:6;s:22:"_DATE_COURSE_COMPLETED";}}}', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `learning_report_schedule`
--

CREATE TABLE IF NOT EXISTS `learning_report_schedule` (
  `id_report_schedule` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_report_filter` int(11) unsigned NOT NULL DEFAULT '0',
  `id_creator` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `period` varchar(255) NOT NULL DEFAULT '',
  `time` time NOT NULL DEFAULT '00:00:00',
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_report_schedule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_report_schedule_recipient`
--

CREATE TABLE IF NOT EXISTS `learning_report_schedule_recipient` (
  `id_report_schedule` int(11) unsigned NOT NULL DEFAULT '0',
  `id_user` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_report_schedule`,`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_reservation_category`
--

CREATE TABLE IF NOT EXISTS `learning_reservation_category` (
  `idCategory` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `maxSubscription` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_reservation_events`
--

CREATE TABLE IF NOT EXISTS `learning_reservation_events` (
  `idEvent` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `idLaboratory` int(11) NOT NULL DEFAULT '0',
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `maxUser` int(11) NOT NULL DEFAULT '0',
  `deadLine` date NOT NULL DEFAULT '0000-00-00',
  `fromTime` time NOT NULL DEFAULT '00:00:00',
  `toTime` time NOT NULL DEFAULT '00:00:00',
  PRIMARY KEY (`idEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_reservation_perm`
--

CREATE TABLE IF NOT EXISTS `learning_reservation_perm` (
  `event_id` int(11) NOT NULL DEFAULT '0',
  `user_idst` int(11) NOT NULL DEFAULT '0',
  `perm` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`event_id`,`user_idst`,`perm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_reservation_subscribed`
--

CREATE TABLE IF NOT EXISTS `learning_reservation_subscribed` (
  `idstUser` int(11) NOT NULL DEFAULT '0',
  `idEvent` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idstUser`,`idEvent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_scorm_items`
--

CREATE TABLE IF NOT EXISTS `learning_scorm_items` (
  `idscorm_item` int(11) NOT NULL AUTO_INCREMENT,
  `idscorm_organization` int(11) NOT NULL DEFAULT '0',
  `idscorm_parentitem` int(11) DEFAULT NULL,
  `adlcp_prerequisites` varchar(200) DEFAULT NULL,
  `adlcp_maxtimeallowed` varchar(24) DEFAULT NULL,
  `adlcp_timelimitaction` varchar(24) DEFAULT NULL,
  `adlcp_datafromlms` varchar(255) DEFAULT NULL,
  `adlcp_masteryscore` varchar(200) DEFAULT NULL,
  `item_identifier` varchar(255) DEFAULT NULL,
  `identifierref` varchar(255) DEFAULT NULL,
  `idscorm_resource` int(11) DEFAULT NULL,
  `isvisible` set('true','false') DEFAULT 'true',
  `parameters` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `nChild` int(11) NOT NULL DEFAULT '0',
  `nDescendant` int(11) NOT NULL DEFAULT '0',
  `adlcp_completionthreshold` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`idscorm_item`),
  UNIQUE KEY `idscorm_organization` (`idscorm_organization`,`item_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_scorm_items_track`
--

CREATE TABLE IF NOT EXISTS `learning_scorm_items_track` (
  `idscorm_item_track` int(11) NOT NULL AUTO_INCREMENT,
  `idscorm_organization` int(11) NOT NULL DEFAULT '0',
  `idscorm_item` int(11) DEFAULT NULL,
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idscorm_tracking` int(11) DEFAULT NULL,
  `status` varchar(16) NOT NULL DEFAULT 'not attempted',
  `nChild` int(11) NOT NULL DEFAULT '0',
  `nChildCompleted` int(11) NOT NULL DEFAULT '0',
  `nDescendant` int(11) NOT NULL DEFAULT '0',
  `nDescendantCompleted` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idscorm_item_track`),
  KEY `idscorm_organization` (`idscorm_organization`),
  KEY `idscorm_item` (`idscorm_item`),
  KEY `idUser` (`idUser`),
  KEY `idscorm_tracking` (`idscorm_tracking`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Join table 3 factor' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_scorm_organizations`
--

CREATE TABLE IF NOT EXISTS `learning_scorm_organizations` (
  `idscorm_organization` int(11) NOT NULL AUTO_INCREMENT,
  `org_identifier` varchar(255) NOT NULL DEFAULT '',
  `idscorm_package` int(11) NOT NULL DEFAULT '0',
  `title` varchar(100) DEFAULT NULL,
  `nChild` int(11) NOT NULL DEFAULT '0',
  `nDescendant` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idscorm_organization`),
  UNIQUE KEY `idsco_package_unique` (`org_identifier`,`idscorm_package`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_scorm_package`
--

CREATE TABLE IF NOT EXISTS `learning_scorm_package` (
  `idscorm_package` int(11) NOT NULL AUTO_INCREMENT,
  `idpackage` varchar(255) NOT NULL DEFAULT '',
  `idProg` int(11) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `defaultOrg` varchar(255) NOT NULL DEFAULT '',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `scormVersion` varchar(10) NOT NULL DEFAULT '1.2',
  PRIMARY KEY (`idscorm_package`),
  KEY `idUser` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_scorm_resources`
--

CREATE TABLE IF NOT EXISTS `learning_scorm_resources` (
  `idscorm_resource` int(11) NOT NULL AUTO_INCREMENT,
  `idsco` varchar(255) NOT NULL DEFAULT '',
  `idscorm_package` int(11) NOT NULL DEFAULT '0',
  `scormtype` set('sco','asset') DEFAULT NULL,
  `href` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idscorm_resource`),
  UNIQUE KEY `idsco_package_unique` (`idsco`,`idscorm_package`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_scorm_tracking`
--

CREATE TABLE IF NOT EXISTS `learning_scorm_tracking` (
  `idscorm_tracking` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idscorm_item` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `lesson_location` varchar(255) DEFAULT NULL,
  `credit` varchar(24) DEFAULT NULL,
  `lesson_status` varchar(24) DEFAULT NULL,
  `entry` varchar(24) DEFAULT NULL,
  `score_raw` float DEFAULT NULL,
  `score_max` float DEFAULT NULL,
  `score_min` float DEFAULT NULL,
  `total_time` varchar(15) DEFAULT '0000:00:00.00',
  `lesson_mode` varchar(24) DEFAULT NULL,
  `exit` varchar(24) DEFAULT NULL,
  `session_time` varchar(15) DEFAULT NULL,
  `suspend_data` blob,
  `launch_data` blob,
  `comments` blob,
  `comments_from_lms` blob,
  `xmldata` longblob,
  `first_access` datetime DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  PRIMARY KEY (`idscorm_tracking`),
  UNIQUE KEY `Unique_tracking_usersco` (`idUser`,`idReference`,`idscorm_item`),
  KEY `idUser` (`idUser`),
  KEY `idscorm_resource` (`idReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_scorm_tracking_history`
--

CREATE TABLE IF NOT EXISTS `learning_scorm_tracking_history` (
  `idscorm_tracking` int(11) NOT NULL DEFAULT '0',
  `date_action` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `score_raw` float DEFAULT NULL,
  `score_max` float DEFAULT NULL,
  `session_time` varchar(15) DEFAULT NULL,
  `lesson_status` varchar(24) NOT NULL DEFAULT '',
  PRIMARY KEY (`idscorm_tracking`,`date_action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_statuschangelog`
--

CREATE TABLE IF NOT EXISTS `learning_statuschangelog` (
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `status_user` tinyint(1) NOT NULL DEFAULT '0',
  `when_do` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`idUser`,`idCourse`,`when_do`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_sysforum`
--

CREATE TABLE IF NOT EXISTS `learning_sysforum` (
  `idMessage` int(11) NOT NULL AUTO_INCREMENT,
  `key1` varchar(255) NOT NULL DEFAULT '',
  `key2` int(11) NOT NULL DEFAULT '0',
  `key3` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `textof` text NOT NULL,
  `posted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `author` int(11) NOT NULL DEFAULT '0',
  `attach` varchar(255) NOT NULL DEFAULT '',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idMessage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_teacher_profile`
--

CREATE TABLE IF NOT EXISTS `learning_teacher_profile` (
  `id_user` int(11) NOT NULL DEFAULT '0',
  `curriculum` text NOT NULL,
  `publications` text NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_test`
--

CREATE TABLE IF NOT EXISTS `learning_test` (
  `idTest` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `point_type` tinyint(1) NOT NULL DEFAULT '0',
  `point_required` double NOT NULL DEFAULT '0',
  `display_type` tinyint(1) NOT NULL DEFAULT '0',
  `order_type` tinyint(1) NOT NULL DEFAULT '0',
  `shuffle_answer` tinyint(1) NOT NULL DEFAULT '0',
  `question_random_number` int(4) NOT NULL DEFAULT '0',
  `save_keep` tinyint(1) NOT NULL DEFAULT '0',
  `mod_doanswer` tinyint(1) NOT NULL DEFAULT '1',
  `can_travel` tinyint(1) NOT NULL DEFAULT '1',
  `show_only_status` tinyint(1) NOT NULL DEFAULT '0',
  `show_score` tinyint(1) NOT NULL DEFAULT '1',
  `show_score_cat` tinyint(1) NOT NULL DEFAULT '0',
  `show_doanswer` tinyint(1) NOT NULL DEFAULT '0',
  `show_solution` tinyint(1) NOT NULL DEFAULT '0',
  `time_dependent` tinyint(1) NOT NULL DEFAULT '0',
  `time_assigned` int(6) NOT NULL DEFAULT '0',
  `penality_test` tinyint(1) NOT NULL DEFAULT '0',
  `penality_time_test` double NOT NULL DEFAULT '0',
  `penality_quest` tinyint(1) NOT NULL DEFAULT '0',
  `penality_time_quest` double NOT NULL DEFAULT '0',
  `max_attempt` int(11) NOT NULL DEFAULT '0',
  `hide_info` tinyint(1) NOT NULL DEFAULT '0',
  `order_info` text NOT NULL,
  `use_suspension` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `suspension_num_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `suspension_num_hours` int(10) unsigned NOT NULL DEFAULT '0',
  `suspension_prerequisites` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `chart_options` text NOT NULL,
  `mandatory_answer` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `score_max` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testquest`
--

CREATE TABLE IF NOT EXISTS `learning_testquest` (
  `idQuest` int(11) NOT NULL AUTO_INCREMENT,
  `idTest` int(11) NOT NULL DEFAULT '0',
  `idCategory` int(11) NOT NULL DEFAULT '0',
  `type_quest` varchar(255) NOT NULL DEFAULT '',
  `title_quest` text NOT NULL,
  `difficult` int(1) NOT NULL DEFAULT '3',
  `time_assigned` int(5) NOT NULL DEFAULT '0',
  `sequence` int(5) NOT NULL DEFAULT '0',
  `page` int(11) NOT NULL DEFAULT '0',
  `shuffle` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idQuest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testquestanswer`
--

CREATE TABLE IF NOT EXISTS `learning_testquestanswer` (
  `idAnswer` int(11) NOT NULL AUTO_INCREMENT,
  `idQuest` int(11) NOT NULL DEFAULT '0',
  `sequence` int(11) NOT NULL DEFAULT '0',
  `is_correct` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  `comment` text NOT NULL,
  `score_correct` double NOT NULL DEFAULT '0',
  `score_incorrect` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`idAnswer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testquestanswer_associate`
--

CREATE TABLE IF NOT EXISTS `learning_testquestanswer_associate` (
  `idAnswer` int(11) NOT NULL AUTO_INCREMENT,
  `idQuest` int(11) NOT NULL DEFAULT '0',
  `answer` text NOT NULL,
  PRIMARY KEY (`idAnswer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testquest_extra`
--

CREATE TABLE IF NOT EXISTS `learning_testquest_extra` (
  `idQuest` int(11) NOT NULL DEFAULT '0',
  `idAnswer` int(11) NOT NULL DEFAULT '0',
  `extra_info` text NOT NULL,
  PRIMARY KEY (`idQuest`,`idAnswer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testtrack`
--

CREATE TABLE IF NOT EXISTS `learning_testtrack` (
  `idTrack` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idTest` int(11) NOT NULL DEFAULT '0',
  `date_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_attempt_mod` datetime DEFAULT NULL,
  `date_end_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_page_seen` int(11) NOT NULL DEFAULT '0',
  `last_page_saved` int(11) NOT NULL DEFAULT '0',
  `number_of_save` int(11) NOT NULL DEFAULT '0',
  `number_of_attempt` int(11) NOT NULL DEFAULT '0',
  `score` double DEFAULT NULL,
  `bonus_score` double NOT NULL DEFAULT '0',
  `score_status` enum('valid','not_checked','not_passed','passed','not_complete','doing') NOT NULL DEFAULT 'not_complete',
  `comment` text NOT NULL,
  `attempts_for_suspension` int(10) unsigned NOT NULL DEFAULT '0',
  `suspended_until` datetime DEFAULT NULL,
  PRIMARY KEY (`idTrack`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testtrack_answer`
--

CREATE TABLE IF NOT EXISTS `learning_testtrack_answer` (
  `idTrack` int(11) NOT NULL DEFAULT '0',
  `idQuest` int(11) NOT NULL DEFAULT '0',
  `idAnswer` int(11) NOT NULL DEFAULT '0',
  `score_assigned` double NOT NULL DEFAULT '0',
  `more_info` longtext NOT NULL,
  `manual_assigned` tinyint(1) NOT NULL DEFAULT '0',
  `user_answer` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`idTrack`,`idQuest`,`idAnswer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testtrack_page`
--

CREATE TABLE IF NOT EXISTS `learning_testtrack_page` (
  `idTrack` int(11) NOT NULL DEFAULT '0',
  `page` int(3) NOT NULL DEFAULT '0',
  `display_from` datetime DEFAULT NULL,
  `display_to` datetime DEFAULT NULL,
  `accumulated` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTrack`,`page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testtrack_quest`
--

CREATE TABLE IF NOT EXISTS `learning_testtrack_quest` (
  `idTrack` int(11) NOT NULL DEFAULT '0',
  `idQuest` int(11) NOT NULL DEFAULT '0',
  `page` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTrack`,`idQuest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_testtrack_times`
--

CREATE TABLE IF NOT EXISTS `learning_testtrack_times` (
  `idTrack` int(11) NOT NULL DEFAULT '0',
  `idReference` int(11) NOT NULL DEFAULT '0',
  `idTest` int(11) NOT NULL DEFAULT '0',
  `date_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `number_time` tinyint(4) NOT NULL DEFAULT '0',
  `score` double NOT NULL DEFAULT '0',
  `score_status` varchar(50) NOT NULL DEFAULT '',
  `date_begin` datetime NOT NULL,
  `date_end` datetime NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`idTrack`,`number_time`,`idTest`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_time_period`
--

CREATE TABLE IF NOT EXISTS `learning_time_period` (
  `id_period` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `start_date` date NOT NULL DEFAULT '0000-00-00',
  `end_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_period`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_trackingeneral`
--

CREATE TABLE IF NOT EXISTS `learning_trackingeneral` (
  `idTrack` int(11) NOT NULL AUTO_INCREMENT,
  `idEnter` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `function` varchar(250) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '',
  `timeof` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`idTrack`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_tracksession`
--

CREATE TABLE IF NOT EXISTS `learning_tracksession` (
  `idEnter` int(11) NOT NULL AUTO_INCREMENT,
  `idCourse` int(11) NOT NULL DEFAULT '0',
  `idUser` int(11) NOT NULL DEFAULT '0',
  `session_id` varchar(255) NOT NULL DEFAULT '',
  `enterTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `numOp` int(5) NOT NULL DEFAULT '0',
  `lastFunction` varchar(50) NOT NULL DEFAULT '',
  `lastOp` varchar(5) NOT NULL DEFAULT '',
  `lastTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ip_address` varchar(40) NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idEnter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_transaction`
--

CREATE TABLE IF NOT EXISTS `learning_transaction` (
  `id_transaction` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_confirm` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price` int(11) NOT NULL DEFAULT '0',
  `payment_status` tinyint(1) NOT NULL DEFAULT '0',
  `course_status` tinyint(1) NOT NULL DEFAULT '0',
  `method` varchar(255) DEFAULT '',
  `payment_note` text NOT NULL,
  `course_note` text NOT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_transaction_info`
--

CREATE TABLE IF NOT EXISTS `learning_transaction_info` (
  `id_transaction` int(11) NOT NULL DEFAULT '0',
  `id_course` int(11) NOT NULL DEFAULT '0',
  `id_date` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_transaction`,`id_course`,`id_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `learning_webpages`
--

CREATE TABLE IF NOT EXISTS `learning_webpages` (
  `idPages` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `description` text NOT NULL,
  `language` varchar(255) NOT NULL DEFAULT '',
  `sequence` int(5) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `in_home` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idPages`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learning_wiki_course`
--

CREATE TABLE IF NOT EXISTS `learning_wiki_course` (
  `course_id` int(11) NOT NULL DEFAULT '0',
  `wiki_id` int(11) NOT NULL DEFAULT '0',
  `is_owner` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`course_id`,`wiki_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `core_lang_translation`
--
ALTER TABLE `core_lang_translation`
  ADD CONSTRAINT `core_lang_translation_ibfk_1` FOREIGN KEY (`lang_code`) REFERENCES `core_lang_language` (`lang_code`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `core_lang_translation_ibfk_2` FOREIGN KEY (`id_text`) REFERENCES `core_lang_text` (`id_text`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
