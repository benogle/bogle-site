-- phpMyAdmin SQL Dump
-- version 2.11.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 05, 2009 at 06:50 PM
-- Server version: 5.0.44
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `bogle-site`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_5886d21f` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_group_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_message`
--

CREATE TABLE IF NOT EXISTS `auth_message` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `auth_message_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `auth_message`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add message', 4, 'add_message'),
(11, 'Can change message', 4, 'change_message'),
(12, 'Can delete message', 4, 'delete_message'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add site', 7, 'add_site'),
(20, 'Can change site', 7, 'change_site'),
(21, 'Can delete site', 7, 'delete_site'),
(22, 'Can add sidebar', 8, 'add_sidebar'),
(23, 'Can change sidebar', 8, 'change_sidebar'),
(24, 'Can delete sidebar', 8, 'delete_sidebar'),
(25, 'Can add image', 9, 'add_image'),
(26, 'Can change image', 9, 'change_image'),
(27, 'Can delete image', 9, 'delete_image'),
(28, 'Can add page', 10, 'add_page'),
(29, 'Can change page', 10, 'change_page'),
(30, 'Can delete page', 10, 'delete_page'),
(31, 'Can add log entry', 11, 'add_logentry'),
(32, 'Can change log entry', 11, 'change_logentry'),
(33, 'Can delete log entry', 11, 'delete_logentry');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `username`, `first_name`, `last_name`, `email`, `password`, `is_staff`, `is_active`, `is_superuser`, `last_login`, `date_joined`) VALUES
(1, 'admin', '', '', 'ben@benogle.com', 'sha1$05787$deb02a6fce451c90121f71b477589134c0b4d3c8', 1, 1, 1, '2009-04-26 00:44:14', '2009-04-12 13:50:37');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f116770` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `auth_user_user_permissions`
--


-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL auto_increment,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) default NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `django_admin_log_user_id` (`user_id`),
  KEY `django_admin_log_content_type_id` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=103 ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2009-04-12 15:01:38', 1, 9, '1', 'Image object', 1, ''),
(2, '2009-04-12 15:01:58', 1, 9, '2', 'Image object', 1, ''),
(3, '2009-04-12 15:02:10', 1, 9, '3', 'Image object', 1, ''),
(4, '2009-04-12 15:03:04', 1, 8, '1', 'Sidebar object', 1, ''),
(5, '2009-04-12 15:20:51', 1, 10, '1', 'Index', 1, ''),
(6, '2009-04-12 15:30:51', 1, 9, '4', 'head-blog', 1, ''),
(7, '2009-04-12 15:31:23', 1, 9, '5', 'accent-about', 1, ''),
(8, '2009-04-12 15:31:37', 1, 9, '6', 'accent-proj', 1, ''),
(9, '2009-04-12 15:32:07', 1, 9, '7', 'accent-contact', 1, ''),
(10, '2009-04-12 15:33:49', 1, 8, '2', 'project', 1, ''),
(11, '2009-04-12 15:34:26', 1, 8, '1', 'about', 2, 'Changed content.'),
(12, '2009-04-12 15:38:50', 1, 10, '1', 'Index', 2, 'Changed slug and content.'),
(13, '2009-04-12 15:43:09', 1, 10, '2', 'Contact Ben', 1, ''),
(14, '2009-04-12 15:44:36', 1, 10, '3', 'About', 1, ''),
(15, '2009-04-12 15:46:15', 1, 10, '4', 'My Projects', 1, ''),
(16, '2009-04-12 17:50:50', 1, 10, '3', 'About', 2, 'Changed accent_image.'),
(17, '2009-04-12 17:55:23', 1, 10, '5', 'BRE: Ben''s ROM Editor', 1, ''),
(18, '2009-04-15 23:24:11', 1, 8, '1', 'about', 2, 'Changed content.'),
(19, '2009-04-15 23:27:46', 1, 8, '1', 'about', 2, 'Changed content.'),
(20, '2009-04-15 23:28:33', 1, 8, '1', 'about', 2, 'Changed content.'),
(21, '2009-04-15 23:30:09', 1, 8, '1', 'about', 2, 'No fields changed.'),
(22, '2009-04-15 23:30:44', 1, 8, '2', 'project', 2, 'Changed content.'),
(23, '2009-04-15 23:32:15', 1, 10, '4', 'My Projects', 2, 'Changed sidebar.'),
(24, '2009-04-15 23:33:49', 1, 8, '3', 'general', 1, ''),
(25, '2009-04-15 23:34:17', 1, 10, '4', 'My Projects', 2, 'Changed sidebar.'),
(26, '2009-04-15 23:38:23', 1, 10, '1', 'Index', 2, 'Changed content.'),
(27, '2009-04-15 23:44:10', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(28, '2009-04-15 23:53:38', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(29, '2009-04-16 00:07:25', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(30, '2009-04-16 00:08:47', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(31, '2009-04-16 00:13:14', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(32, '2009-04-16 00:23:41', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(33, '2009-04-16 00:24:58', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(34, '2009-04-16 00:27:41', 1, 10, '2', 'Contact Ben', 2, 'Changed content.'),
(35, '2009-04-16 00:32:25', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(36, '2009-04-16 00:37:09', 1, 10, '6', 'Ben''s Resume', 1, ''),
(37, '2009-04-16 00:38:56', 1, 8, '3', 'general', 2, 'Changed content.'),
(38, '2009-04-16 00:41:03', 1, 8, '3', 'general', 2, 'Changed content.'),
(39, '2009-04-16 00:41:23', 1, 8, '1', 'about', 2, 'Changed content.'),
(40, '2009-04-17 18:51:57', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(41, '2009-04-17 18:53:58', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(42, '2009-04-17 18:56:06', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(43, '2009-04-17 18:56:39', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(44, '2009-04-17 18:57:36', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(45, '2009-04-17 18:58:08', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(46, '2009-04-17 19:00:59', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(47, '2009-04-17 19:01:15', 1, 10, '6', 'Ben''s Resume', 2, 'Changed content.'),
(48, '2009-04-17 19:01:36', 1, 10, '6', 'Ben Ogle''s Resume', 2, 'Changed title and content.'),
(49, '2009-04-24 10:44:38', 1, 10, '3', 'About', 2, 'Changed sidebar.'),
(50, '2009-04-24 10:44:51', 1, 10, '2', 'Contact Ben', 2, 'Changed sidebar.'),
(51, '2009-04-24 10:45:04', 1, 10, '6', 'Ben Ogle''s Resume', 2, 'Changed sidebar.'),
(52, '2009-04-24 10:51:46', 1, 10, '4', 'My Projects', 2, 'Changed content.'),
(53, '2009-04-24 10:54:03', 1, 8, '3', 'general', 2, 'Changed content.'),
(54, '2009-04-24 11:03:44', 1, 9, '8', 'head-proj', 1, ''),
(55, '2009-04-24 11:04:07', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed header_image.'),
(56, '2009-04-24 11:04:21', 1, 10, '4', 'My Projects', 2, 'Changed header_image.'),
(57, '2009-04-24 12:27:31', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(58, '2009-04-24 12:30:03', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(59, '2009-04-24 12:31:04', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(60, '2009-04-24 12:58:38', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(61, '2009-04-24 13:07:27', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(62, '2009-04-24 13:08:25', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(63, '2009-04-24 13:10:27', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(64, '2009-04-24 13:11:00', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(65, '2009-04-24 13:11:40', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(66, '2009-04-24 13:16:01', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed meta_description.'),
(67, '2009-04-24 13:19:30', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(68, '2009-04-24 13:29:12', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(69, '2009-04-24 13:30:01', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(70, '2009-04-24 13:38:22', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'No fields changed.'),
(71, '2009-04-24 13:48:23', 1, 10, '7', 'Eddy: My EF Civic', 1, ''),
(72, '2009-04-24 13:49:05', 1, 10, '7', 'Eddy: My EF Civic', 2, 'Changed slug.'),
(73, '2009-04-24 19:36:07', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(74, '2009-04-24 20:10:14', 1, 10, '3', 'About', 2, 'Changed content.'),
(75, '2009-04-24 20:17:03', 1, 10, '3', 'About', 2, 'No fields changed.'),
(76, '2009-04-24 21:30:01', 1, 10, '8', 'Zunama''s Titan', 1, ''),
(77, '2009-04-24 21:32:54', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(78, '2009-04-24 21:33:49', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(79, '2009-04-24 21:41:37', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(80, '2009-04-24 21:45:06', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(81, '2009-04-24 21:46:22', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(82, '2009-04-24 21:51:01', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(83, '2009-04-24 21:51:17', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(84, '2009-04-24 21:51:42', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(85, '2009-04-24 22:11:12', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(86, '2009-04-24 22:13:28', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(87, '2009-04-24 22:17:42', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(88, '2009-04-24 22:24:41', 1, 10, '8', 'Zunama''s Titan', 2, 'No fields changed.'),
(89, '2009-04-24 22:25:34', 1, 10, '7', 'Eddy: My EF Civic', 2, 'Changed content.'),
(90, '2009-04-24 22:38:12', 1, 10, '9', 'Fotosaur.us', 1, ''),
(91, '2009-04-24 22:39:47', 1, 10, '9', 'Fotosaur.us', 2, 'Changed content.'),
(92, '2009-04-24 22:40:44', 1, 10, '10', 'Yosle', 1, ''),
(93, '2009-04-24 22:45:37', 1, 10, '10', 'Yosle', 2, 'Changed content.'),
(94, '2009-04-24 22:45:52', 1, 10, '9', 'Fotosaur.us', 2, 'Changed content.'),
(95, '2009-04-24 22:53:23', 1, 10, '10', 'Yosle', 2, 'Changed content.'),
(96, '2009-04-24 23:06:30', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(97, '2009-04-24 23:08:49', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(98, '2009-04-24 23:15:30', 1, 10, '3', 'About', 2, 'Changed content.'),
(99, '2009-04-27 21:43:30', 1, 10, '8', 'Zunama''s Titan', 2, 'Changed content.'),
(100, '2009-04-27 22:31:59', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'Changed content.'),
(101, '2009-04-27 22:39:36', 1, 10, '5', 'BRE: Ben''s ROM Editor', 2, 'No fields changed.'),
(102, '2009-04-27 22:39:50', 1, 10, '7', 'Eddy: My EF Civic', 2, 'Changed content.');

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'permission', 'auth', 'permission'),
(2, 'group', 'auth', 'group'),
(3, 'user', 'auth', 'user'),
(4, 'message', 'auth', 'message'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'site', 'sites', 'site'),
(8, 'sidebar', 'simplesite', 'sidebar'),
(9, 'image', 'simplesite', 'image'),
(10, 'page', 'simplesite', 'page'),
(11, 'log entry', 'admin', 'logentry');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2b7458b5db98ae9c136f1650ebe13bc4', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5jODI0MzA5OWZiNDg0MTIzYWQ0\nODIyZDI1ZjZlYTliYw==\n', '2009-05-10 00:44:15'),
('313b2e8ee26d1ef23c9a66b1e09a71b3', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5jODI0MzA5OWZiNDg0MTIzYWQ0\nODIyZDI1ZjZlYTliYw==\n', '2009-04-29 23:23:18'),
('80991d55ff001aef59e0dc26f5859433', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5jODI0MzA5OWZiNDg0MTIzYWQ0\nODIyZDI1ZjZlYTliYw==\n', '2009-05-08 10:43:59'),
('dd5310dbd5f61203d05a49b56a041f3e', 'gAJ9cQEoVRJfYXV0aF91c2VyX2JhY2tlbmRxAlUpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5k\ncy5Nb2RlbEJhY2tlbmRxA1UNX2F1dGhfdXNlcl9pZHEEigEBdS5jODI0MzA5OWZiNDg0MTIzYWQ0\nODIyZDI1ZjZlYTliYw==\n', '2009-04-26 14:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `simplesite_image`
--

CREATE TABLE IF NOT EXISTS `simplesite_image` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `filename` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `simplesite_image`
--

INSERT INTO `simplesite_image` (`id`, `name`, `filename`) VALUES
(1, 'head-index', 'headindex.png'),
(2, 'head-about', 'headabout.png'),
(3, 'head-contact', 'headcontact.png'),
(4, 'head-blog', 'headblog.png'),
(5, 'accent-about', 'accentabout.png'),
(6, 'accent-proj', 'accentproj.png'),
(7, 'accent-contact', 'accentcontact.png'),
(8, 'head-proj', 'headproj.png');

-- --------------------------------------------------------

--
-- Table structure for table `simplesite_page`
--

CREATE TABLE IF NOT EXISTS `simplesite_page` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(30) NOT NULL,
  `header_image_id` int(11) NOT NULL,
  `accent_image_id` int(11) NOT NULL,
  `sidebar_id` int(11) NOT NULL,
  `meta_description` varchar(256) NOT NULL default ' ',
  `meta_keywords` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `simplesite_page_header_image_id` (`header_image_id`),
  KEY `simplesite_page_accent_image_id` (`accent_image_id`),
  KEY `simplesite_page_sidebar_id` (`sidebar_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `simplesite_page`
--

INSERT INTO `simplesite_page` (`id`, `title`, `header_image_id`, `accent_image_id`, `sidebar_id`, `meta_description`, `meta_keywords`, `content`, `slug`) VALUES
(1, 'Index', 1, 1, 1, 'This is Ben Ogle''s site. He is a computer programmer.', 'ben ogle, bre, honda, code, awesome, programmer, fotosaur.us', 'Ben is one part human, two parts robotically-controlled code-generation machine. This place houses or at least links to most of the stuff he hath created since becoming sentient and capable of wrangling cycles for his own device. Love him or ye shall cease.', '/'),
(2, 'Contact Ben', 3, 7, 3, 'Contact Ben Ogle for freelance work, job offers, nigerian bank scams, or just to say hello!', 'Ben ogle, contact, awesome', 'Love me? Hate me? Want to hire me? Just need someone to talk to? Send me an email!', 'contact'),
(3, 'About', 2, 5, 3, 'Ben Ogle is a programmer.', 'ben ogle, love, greatness, beauty, awesome, wow, python, jquery', 'Ben is a compulsive creator. He has way more ideas than he does time to pursue them. Are they good ideas? Only time will tell. Generally, he makes businessey things, an exception being this epic website. But he secretly wishes he was a designer, musician, or artist so he could create beauty that makes you emote.  Despite the artsy desire, his left-brain induces giddiness when he thinks about writing apps to make him more efficient.\r\n\r\nMr. Ogle is kind of a jack of all trades. He can write you code, then fix your furnace, re-plumb your house, replace the engine in your car, then weld up that little project you''ve had in the back of your mind. He would, of course, charge you.\r\n\r\nHe likes working out. He has, unfortunately, hit a plateau. The last 10lb gain has been tough. Maybe the diet isn''t quite right? \r\n\r\nSmall, nerdy brunette girls are his kryptonite. One of them will be his downfall for sure. He apologizes if he stares. It is involuntary.', 'about'),
(4, 'My Projects', 8, 6, 3, 'Ben Ogle''s projects. From BRE to fotosaur.us and beyond.', 'ben ogle, bre, fotosaur.us, html2markup, rempl', 'Here be my personal projects. If you are interested in projects I worked on for an employer, such as the "Octaire":http://www.amx.com/newsletter/200810/octaire.htm, check out my "resume":/resume.\r\n\r\nCheck out the links below for screenshots, links, and maybe even code (if you''re good).\r\n\r\nh3. Big\r\n\r\n"Titan":/projects/titan -- Titan was the product of our failed startup, Zunama. It was a web-based project management system similar to Trac, Basecamp, and FogBugz. It had a wiki, issue tracker, todo app, forum, and a user configurable dash tied together with love. \r\n\r\n"BRE: Ben''s ROM Editor":/projects/bre -- BRE allows a user to modify and monitor the ECU parameters of their Honda''s engine in real-time. This project combines reverse engineering of an obscure platform, assembly code, and application code (C++/C#) to create a system for tuning your old Honda.\r\n\r\n"Eddy: the turbo, CRV powered EF Civic":/projects/eddy -- Once upon a time I was a Honda nerd. This car is/was my fun/autocross beater.\r\n\r\nh3. Medium\r\n\r\n"fotosaur.us":/projects/fotosaurus -- An image bookmarking app written in python/web.py. I keep any interesting images I find on the web in it!\r\n\r\n"Yosle":/projects/yosle -- Yosle was my first step into web development. It is a classifieds site, and most notably, a "yardsale map":http://yosle.com/yardsales with data scraped from the web.\r\n\r\nh3. Small\r\n\r\n"jQuery pong":http://blog.benogle.com/2009/04/20/jquery-pong/ -- A small pong plugin for jQuery. Really. The "code is on github":http://github.com/benogle/jquery-pong.\r\n\r\n"rempl":http://blog.benogle.com/2009/04/10/rempl-push-playlists-to-remote-a-winamp-install/ -- A script to push your local playlists to a remote WinAMP install. The "code is on github":http://github.com/benogle/rempl.', 'projects'),
(5, 'BRE: Ben''s ROM Editor', 8, 6, 2, 'BRE is an engine mangement system for OBD0 VTEC Honda ECUs.', 'bre, ROM, ecu, honda, obd0 vtec, obd0, vtec, pr3, pw0, jdm', 'BRE is a closed-source (open in the future!), freeware Engine Management System for Old Hondas written by me in C++, and C#, with ECU code written in assembly.\r\n\r\nWhat is an Engine Management System? When a car''s engine is modified by, say, adding a turbo, changing cams, or even using a different exhaust system, the engine will have different needs for fuel and ignition delivery. BRE allows a user to change the code inside the car''s engine computer (ECU) to modify the way it delivers fuel and spark. BRE also has extra features to make tuning the ECU easier such as a "Datalogger":http://en.wikipedia.org/wiki/Data_logger for real-time data gathering, and integration with an EEPROM emulator for real-time ECU code updates. \r\n\r\nThe ECU decides how much fuel and ignition advance to dole out based mostly on static lookup tables. The ECU code picks a cell in each of the main fuel and ignition tables based on how much throttle given (intake manifold vacuum; x axis), and engine speed (RPM; y axis).\r\n\r\nHere is a fuel table as displayed in BRE. Values are in milliseconds of injector duration:\r\n\r\n!(pic)/smedia/img/screenshots/bre_fuel.png!\r\n\r\nHere is an ignition table. Values are in degrees of advance "before top dead center":http://en.wikipedia.org/wiki/BTDC:\r\n\r\n!(pic)/smedia/img/screenshots/bre_ign.png!\r\n\r\nh3. Datalogger\r\n\r\nThe datalogger allows the user to gather data such as RPM, throttle position, "air/fuel mixture":http://en.wikipedia.org/wiki/Air_Fuel_Ratio, engine temp, etc. from a running engine. BRE also has a digital dash to show this real-time data. Epic screenshot of my car pre-turbo doing a 2nd gear pull:\r\n\r\n!(pic)/smedia/img/screenshots/bre_logger.png!\r\n\r\nh3. Data analysis\r\n\r\nBRE has a feature that will analyze a saved log''s air/fuel mixture, then automatically adjust the fuel tables to your target air/fuel mixture settings. Values without color are interpolated based on fuel table values and surrounding air/fuel mixture results. \r\n\r\n!(pic)/smedia/img/screenshots/bre_analyzer.png!\r\n\r\nAdditionally, this auto-tune functionality is available in real-time. So a user can just drive around their neighborhood and have BRE tune on the fly!\r\n\r\nh3. Other features\r\n\r\nThere are many other lookup tables that affect fuel delivery and ignition advance. These include corrections for coolant temp, air temp, battery voltage, and atmospheric pressure. BRE allows users to modify these tables as well. \r\n\r\nOther features include enabling and disabling of factory code, and new additions including fancy use of extra outputs, code for turbo cars, and features for handling large injectors.\r\n\r\nBRE also incorporates a C# library that compiles and loads C# scripts into BRE. Users can add features and change out-of-the-box behavior. One such example is modifying the datalogger definition script to capture new data such as the raw value of some sensor. Or maybe adding support for a new "wideband oxygen sensor":http://en.wikipedia.org/wiki/AFR_sensor#Wide-band_sensor.\r\n\r\nh3. ECU Reverse Engineering\r\n\r\nThe ECU code is stored on a 32k EEPROM. A binary dump of this EEPROM was disassembled using a community-built disassembler. Then I got to work digging through sea of cryptic machine-generated code. \r\n\r\nMost of the thought work in this project was in reverse engineering this code and writing new features for it. This work was done with very little hardware knowledge and a PDF of the microcontroller manual. If you would like to dig through the ECU code, it is in a "public github repository":http://github.com/benogle/obd0vtec_dev.\r\n\r\nh3. Will BRE work in/for my car?\r\n\r\nIf you have an 88-91 Civic or a 90-91 Integra and you use an OBD0 VTEC ecu from Japan or Europe, then yes. BRE supports the PR3, and both the Japanese and European PW0.\r\n\r\nh3. Links to BRE related stuff\r\n\r\n* "ECU code github repository":http://github.com/benogle/obd0vtec_dev\r\n* "BRE support forum":http://forum.pgmfi.org/viewforum.php?f=36', 'projects/bre'),
(6, 'Ben Ogle''s Resume', 2, 5, 3, 'Ben Ogle''s resume. It totally shows the stuff he has done.', 'ben ogle, resume, bre, zunama, titan', 'h3. Skills\r\n    \r\n*Languages:* C++, .NET (C#, ASP.NET), Java, Python  \r\n*Web technologies:* Javascript/JQuery, AJAX, CSS, design using Inkscape/GIMP\r\n\r\nh3. Education\r\n\r\nBachelor of Science, Computer Science, June 2006\r\nEastern Washington University, Cheney, WA\r\nOverall EWU Grade Point Average: 3.92 / 4.0\r\nComputer Science Grade Point Average: 4.0 / 4.0\r\n\r\n\r\nh3. Work Experience\r\n\r\nh5. _Co-founder_ -- Zunama, Spokane, WA  --  July 2008 to January 2009\r\n\r\n* Early-stage startup making a web-based (SaaS) project management application in ASP.NET\r\n* Designed and created a bug tracker, a wiki, a to-do list application, and a forum then seamlessly stitched them together using ASP MVC in C#, MySql, and JQuery/AJAX\r\n* Evaluated and chose technologies for the project\r\n* Demo available at http://mudhut.dnsalias.com\r\n    \r\nh5. _Software Engineer_ -- AMX AutoPatch Group, Cheney, WA  --  December 2005 to July 2008\r\n\r\n* Developed firmware for a recently released matrix switcher  (the AutoPatch Octaire) in C++\r\n* Developed new algorithms to automate the Octaire''s configuration thereby eliminating an entire step in the production process\r\n* Wrote drivers for many new chips including switching chips, DAC, and DSP chips using the I2C protocol\r\n* Ported firmware and developed new features for legacy products\r\n* Massaged memory and code to fit inside our very tight SRAM and Flash constraints\r\n* Continually found ways to make firmware development more efficient benefiting the whole team\r\n* Developed and maintained diagnostic and AutoPatch system configuration applications in Java and C++\r\n* Wrote FIT fixtures in Java and CeeFIT and unit tests in JUnit and CppUnit\r\n    \r\nh3. Personal Projects\r\n\r\nh5. Web Applications - Early 2007 to Mid 2008\r\n\r\n* Developed a peer-to-peer e-commerce website (yosle.com) and a (fun!) image bookmarking webapp (fotosaur.us) on a LAMP stack (Python with web.py)\r\n* Built an HTML scraper to extract location and time/date data from yardsales found on the web (yosle.com/yardsales)\r\n* Deployed both on a production web server (CentOS machine) with Apache and mod_python\r\n      \r\nh5. Engine Management - 2003 to 2006\r\n\r\n* Developed engine management software for Honda Engine Computers (ECUs) in C++ .NET allowing users to modify engine operation in real-time\r\n* Developed new features for said Honda Engine Computers in OKI 66K assembly\r\n* Developed a data logger in C++ .NET which displays real-time data from the ECU\r\n* Interfaced with an EEPROM emulator to allow changes to the ECU code while the engine is running\r\n* Developed a real-time automated tuner based on feedback from the data logger and making corrections through the EEPROM emulator\r\n* Wrote various controls and libraries in C#\r\n* Used by people all over the world!', 'resume'),
(7, 'Eddy: My EF Civic', 8, 6, 2, 'Eddy the turbo CRV EF.', 'honda, civic, ef, eddy', 'Eddy is an 88 civic. Eddy consists mostly of parts from other Hondas, aftermarket stuff, and parts that I made. He weighs 2080lbs with a half tank of gas. He is quicker around an "autocross":http://en.wikipedia.org/wiki/Autocross course than he looks. Once I finally bought proper tires, I was regularly winning in the local Street Mod class and placing in the top five overall ahead of STIs, EVOs, and even the occasional tube-frame, purpose-built autocross car.\r\n\r\n!(pic)/smedia/img/pic/eddy_autox.png!\r\n\r\nEddy has very stiff suspension and is painful to drive on anything but smooth roads. \r\n\r\nEddy sports a motor from a 2000 "CRV":http://en.wikipedia.org/wiki/Honda_CR-V#First_generation_.281996.E2.80.932001.29 with a T3 turbo hanging off the front of it.\r\n\r\n!(pic)/smedia/img/pic/eddy_turbo.png!', 'projects/eddy'),
(8, 'Zunama''s Titan', 8, 6, 2, 'Titan was a project management application.', 'titan, zunama', 'Titan was the product of my failed startup, Zunama. It was a web-based project management application written in C#/ASP.NET MVC and MySQL with heavy use of jQuery/AJAX. We used "SubSonic":http://subsonicproject.com/ for the ORM. In the end, we only used the generated model classes and none of the query functions as they were so limiting.\r\n\r\nTitan was an effort to keep all (software) project data in one place. It has a wiki for documentation, an issue tracker, a ''journal'' (forum) for discussion, a to-do application, and a user-configurable dashboard so the user can aggregate all of this data any way she chooses. We had big plans for it. We wanted to integrate it with revision control repositories, we wanted to add time tracking, we wanted to add a revisioning document store, etc. But that is a lot to do for two guys in six months!\r\n\r\nI was in charge of the front-end. All the design, icons, HTML, CSS, and Javascript was me. I also took on the a couple pieces of the back-end. The wiki, to-do app, search functionality, and all the user/admin/settings code is mine from DB schema to Javascript. \r\n\r\nWe practiced TDD on the Titan project using NUnit. Tests were written for the model layer and the controller layer. Each SVN checkin triggered a build via "CC.NET":http://ccnet.thoughtworks.com/, a test database refresh, then a run through 1k+ tests. \r\n\r\n*Demo:* "http://mudhut.dnsalias.com":http://mudhut.dnsalias.com ( _Note: the server is on a crazy slow connection. sorry :(_ )\r\n\r\nA screenshot walk-through is in order. Click on any screenshot for enlargement!\r\n\r\nh3. Dashboard\r\n\r\nThe dashboard is user-configurable. It allows a user to display only info that is important to them. They can create 5 dash pages (''Overview'', and ''Issues'' are pages in the screenshot), and can add any number of widgets to a page. Widgets can be dragged around, collapsed, removed, and their parameters edited in AJAX style.\r\n\r\n<a class="pic-group" rel="pg" title="User-configurable dashboard!" href="/smedia/img/screenshots/titan_dash.png"> !(pic-fit)/smedia/img/screenshots/titan_dash.png! </a>\r\n\r\nh3. To-do\r\n\r\nThe to-do app is very lightweight. There are simply two fields: the text and a due date. To-do items can be repositioned, added, edited, completed, and removed via JS/AJAX. Notice the red ''Marketing'' link. All text fields in Titan act like a wiki. Marketing is a wiki page that has not been created yet. \r\n\r\n<a class="pic-group" rel="pg" title="To-do application" href="/smedia/img/screenshots/titan_todo.png"> !(pic-fit)/smedia/img/screenshots/titan_todo.png! </a>\r\n\r\nh3. Search\r\n\r\nWe used a "sphinx":http://www.sphinxsearch.com/ server for indexing and retrieving data. We use a simple context finding algorithm to highlight where the searched phrase was found.\r\n\r\n<a class="pic-group" rel="pg" title="Search page" href="/smedia/img/screenshots/titan_search.png"> !(pic-fit)/smedia/img/screenshots/titan_search.png! </a>\r\n\r\nh3. Projects\r\n\r\nData is organized into projects. The front project page is basically a news feed of recent activity in the project. Each project has a wiki, bug tracker, task tracker, and a journal (forum).\r\n\r\n<a class="pic-group" rel="pg" title="Titan project activity feed." href="/smedia/img/screenshots/titan_project.png"> !(pic-fit)/smedia/img/screenshots/titan_project.png! </a>\r\n\r\nh3. Issues\r\n\r\nIssues (bugs and tasks) allow for custom data (OS, Resolution in this example), and tracking of duplicates and dependencies. Notice the incoming links. Titan tracks all links between wiki pages, bugs, tasks, and journal entries (forum threads). Issue comments are added and edited via AJAX. Oh, and the number is bigass. I like it that way. I know what I am looking at. I know it''s a bug because the background is RED! :p\r\n\r\n<a class="pic-group" rel="pg" title="Issue page" href="/smedia/img/screenshots/titan_bug.png"> !(pic-fit)/smedia/img/screenshots/titan_bug.png! </a>\r\n\r\nh3. Wiki\r\n\r\nWikis in Titan are pretty standard: history tracking, version diffs, and a wiki syntax. Our wiki syntax was based on "textile":http://textism.com/tools/textile/ with some additions and changes. We were afraid textile was too scary for new users, so one can edit in textile with "markitup":http://markitup.jaysalvat.com/ or she can switch to the "fckeditor":http://www.fckeditor.net/ RTE. This switch can be done on the fly while editing. No, the "HTML to textile":http://github.com/benogle/html2markup/tree conversion is not perfect.\r\n\r\n<a class="pic-group" rel="pg" title="Wiki page with incoming links on the right." href="/smedia/img/screenshots/titan_wiki.png"> !(pic-fit)/smedia/img/screenshots/titan_wiki.png! </a>\r\n\r\n\r\nh3. Journal\r\n\r\nOur journal is really a forum. We called it a journal because we had different things in mind for it, but it turned into a forum. We''d like to think our ''journal'' is much lighter than a regular forum. It ''feels'' lighter anyway. We ended up using it to detail little changes we made to the code that may need a heads up or extra explanation. eg. "Oh, hey, I added this function. It works like this and you should use it." We jotted down our ideas, and vented about stuff we didn''t like. It turned out to be very useful for our dev process.\r\n\r\n<a class="pic-group" rel="pg" title="Journal main page with all categories" href="/smedia/img/screenshots/titan_journals.png"> !(pic-fit)/smedia/img/screenshots/titan_journals.png! </a>', 'projects/titan'),
(9, 'Fotosaur.us', 8, 6, 2, 'Fotosaur.us explanation.', 'foto, saur, awesome', '"Fotosaur.us":http://fotosaur.us is a simple web application written in Python with the "web.py":http://webpy.org framework. It most notably uses "PIL":http://www.pythonware.com/products/pil/ for image manipulation and "flup":http://trac.saddi.com/flup for session handling. MySQL handles the DB action. It is deployed on a CentOS machine with Apache/mod_python.\r\n\r\nI use it to keep all the random images I find around the web. Usually they are from "ffffound":http://ffffound.com or from "pics reddit":http://www.reddit.com/r/pics. I don''t venture out much. :p', 'projects/fotosaurus'),
(10, 'Yosle', 8, 6, 2, 'Yosle is a classifieds site', 'yosle', '"Yosle":http://yosle.com is free classifieds web application written in Python with the "web.py":http://webpy.org framework. MySQL handles the DB action. It is deployed on a CentOS machine with Apache/mod_python.\r\n\r\nYosle was my first foray into web development. I look at the code now and cringe. I have learned sooo much since early 2007! \r\n\r\nNo one uses the classifieds portion of the site. But the "yardsale map":http://yosle.com/yardsales is still useful. I am seriously contemplating rewriting the map using jQuery (yosle uses a homegrown ajax lib) and maybe even Django.\r\n\r\nThe yardsale map uses "BeautifulSoup":http://www.crummy.com/software/BeautifulSoup/ to parse and pull data from the terrible HTML that makes up the web. Potential yardsale data is then passed through a number of regexes and if a valid, geocodable address is found, the yardsale is added to the map. When I wrote the scraper, I was admittedly surprised at how many sales it was actually able to properly map, given the address format inconsistencies across the country. The scraper also pulls time and date data, which is surprisingly well formatted and simple to extract. ', 'projects/yosle');

-- --------------------------------------------------------

--
-- Table structure for table `simplesite_sidebar`
--

CREATE TABLE IF NOT EXISTS `simplesite_sidebar` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `simplesite_sidebar`
--

INSERT INTO `simplesite_sidebar` (`id`, `name`, `content`) VALUES
(1, 'about', '<ul class="sidebar-list">\r\n<li><h3><a href="/about">about</a></h3></li>\r\n<li><h3><a href="/resume">résumé</a></h3></li>\r\n<li><h3><a href="/contact">contact</a></h3></li>\r\n</ul>'),
(2, 'project', '<ul class="sidebar-list">\r\n<li><h3><a href="/projects">projects home</a></h3></li>\r\n</ul>'),
(3, 'general', '<ul class="sidebar-list">\r\n<li><h3><a href="http://blog.benogle.com">blog</a></h3></li>\r\n<li><h3><a href="/about">about</a></h3></li>\r\n<li><h3><a href="/resume">résumé</a></h3></li>\r\n<li><h3><a href="/projects">projects</a></h3></li>\r\n<li><h3><a href="/contact">contact</a></h3></li>\r\n<li><h3><a href="http://github.com/benogle">github</a></h3></li>\r\n</ul>\r\n');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_message`
--
ALTER TABLE `auth_message`
  ADD CONSTRAINT `user_id_refs_id_650f49a6` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `simplesite_page`
--
ALTER TABLE `simplesite_page`
  ADD CONSTRAINT `accent_image_id_refs_id_6c5bb9a8` FOREIGN KEY (`accent_image_id`) REFERENCES `simplesite_image` (`id`),
  ADD CONSTRAINT `header_image_id_refs_id_6c5bb9a8` FOREIGN KEY (`header_image_id`) REFERENCES `simplesite_image` (`id`),
  ADD CONSTRAINT `sidebar_id_refs_id_4b48feff` FOREIGN KEY (`sidebar_id`) REFERENCES `simplesite_sidebar` (`id`);
