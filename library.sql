-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2022 at 06:06 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

CREATE TABLE `account_emailaddress` (
  `id` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

CREATE TABLE `account_emailconfirmation` (
  `id` bigint(20) NOT NULL,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add user', 1, 'add_user'),
(2, 'Can change user', 1, 'change_user'),
(3, 'Can delete user', 1, 'delete_user'),
(4, 'Can view user', 1, 'view_user'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add site', 7, 'add_site'),
(26, 'Can change site', 7, 'change_site'),
(27, 'Can delete site', 7, 'delete_site'),
(28, 'Can view site', 7, 'view_site'),
(29, 'Can add snippet', 8, 'add_snippet'),
(30, 'Can change snippet', 8, 'change_snippet'),
(31, 'Can delete snippet', 8, 'delete_snippet'),
(32, 'Can view snippet', 8, 'view_snippet'),
(33, 'Can add email address', 9, 'add_emailaddress'),
(34, 'Can change email address', 9, 'change_emailaddress'),
(35, 'Can delete email address', 9, 'delete_emailaddress'),
(36, 'Can view email address', 9, 'view_emailaddress'),
(37, 'Can add email confirmation', 10, 'add_emailconfirmation'),
(38, 'Can change email confirmation', 10, 'change_emailconfirmation'),
(39, 'Can delete email confirmation', 10, 'delete_emailconfirmation'),
(40, 'Can view email confirmation', 10, 'view_emailconfirmation'),
(41, 'Can add social account', 11, 'add_socialaccount'),
(42, 'Can change social account', 11, 'change_socialaccount'),
(43, 'Can delete social account', 11, 'delete_socialaccount'),
(44, 'Can view social account', 11, 'view_socialaccount'),
(45, 'Can add social application', 12, 'add_socialapp'),
(46, 'Can change social application', 12, 'change_socialapp'),
(47, 'Can delete social application', 12, 'delete_socialapp'),
(48, 'Can view social application', 12, 'view_socialapp'),
(49, 'Can add social application token', 13, 'add_socialtoken'),
(50, 'Can change social application token', 13, 'change_socialtoken'),
(51, 'Can delete social application token', 13, 'delete_socialtoken'),
(52, 'Can view social application token', 13, 'view_socialtoken'),
(53, 'Can add upload pdf', 14, 'add_uploadpdf'),
(54, 'Can change upload pdf', 14, 'change_uploadpdf'),
(55, 'Can delete upload pdf', 14, 'delete_uploadpdf'),
(56, 'Can view upload pdf', 14, 'view_uploadpdf');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-07-25 23:38:58.195558', '2', 'mihipaghdal@gmail.com', 1, '[{\"added\": {}}]', 1, 1),
(2, '2022-07-25 23:39:46.231606', '2', 'mihipaghdal@gmail.com', 3, '', 1, 1),
(3, '2022-07-26 00:21:55.773904', '1', 'Google Library Dev', 1, '[{\"added\": {}}]', 12, 1),
(4, '2022-07-26 13:41:55.469258', '1', 'UploadPDF object (1)', 1, '[{\"added\": {}}]', 14, 1),
(5, '2022-07-26 13:42:15.984915', '1', 'UploadPDF object (1)', 3, '', 14, 1),
(6, '2022-07-26 13:47:03.031367', '2', 'UploadPDF object (2)', 1, '[{\"added\": {}}]', 14, 1),
(7, '2022-07-26 13:49:18.724346', '2', 'UploadPDF object (2)', 3, '', 14, 1),
(8, '2022-07-26 14:06:56.814051', '3', 'UploadPDF object (3)', 1, '[{\"added\": {}}]', 14, 1),
(9, '2022-07-26 14:07:16.415903', '3', 'UploadPDF object (3)', 3, '', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(9, 'account', 'emailaddress'),
(10, 'account', 'emailconfirmation'),
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'contenttypes', 'contenttype'),
(8, 'library', 'snippet'),
(14, 'library', 'uploadpdf'),
(1, 'library_auth', 'user'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(11, 'socialaccount', 'socialaccount'),
(12, 'socialaccount', 'socialapp'),
(13, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-25 23:23:33.588092'),
(2, 'contenttypes', '0002_remove_content_type_name', '2022-07-25 23:23:33.655090'),
(3, 'auth', '0001_initial', '2022-07-25 23:23:33.837011'),
(4, 'auth', '0002_alter_permission_name_max_length', '2022-07-25 23:23:33.880011'),
(5, 'auth', '0003_alter_user_email_max_length', '2022-07-25 23:23:33.886037'),
(6, 'auth', '0004_alter_user_username_opts', '2022-07-25 23:23:33.891011'),
(7, 'auth', '0005_alter_user_last_login_null', '2022-07-25 23:23:33.897011'),
(8, 'auth', '0006_require_contenttypes_0002', '2022-07-25 23:23:33.900011'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2022-07-25 23:23:33.904007'),
(10, 'auth', '0008_alter_user_username_max_length', '2022-07-25 23:23:33.909010'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2022-07-25 23:23:33.913011'),
(12, 'auth', '0010_alter_group_name_max_length', '2022-07-25 23:23:33.922514'),
(13, 'auth', '0011_update_proxy_permissions', '2022-07-25 23:23:33.927260'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2022-07-25 23:23:33.932248'),
(15, 'library_auth', '0001_initial', '2022-07-25 23:23:34.114581'),
(16, 'account', '0001_initial', '2022-07-25 23:23:34.321341'),
(17, 'account', '0002_email_max_length', '2022-07-25 23:23:34.334340'),
(18, 'account', '0003_alter_emailaddress_id_alter_emailconfirmation_id', '2022-07-25 23:23:34.527041'),
(19, 'admin', '0001_initial', '2022-07-25 23:23:34.609150'),
(20, 'admin', '0002_logentry_remove_auto_add', '2022-07-25 23:23:34.618367'),
(21, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-25 23:23:34.624598'),
(22, 'library', '0001_initial', '2022-07-25 23:23:34.635598'),
(23, 'library_auth', '0002_alter_user_managers_alter_user_email', '2022-07-25 23:23:34.652078'),
(24, 'library_auth', '0003_remove_user_username', '2022-07-25 23:23:34.665244'),
(25, 'library_auth', '0004_userregistrationextrafields', '2022-07-25 23:23:34.681221'),
(26, 'library_auth', '0005_delete_userregistrationextrafields_user_exam_and_more', '2022-07-25 23:23:34.834538'),
(27, 'library_auth', '0006_user_is_email_verified', '2022-07-25 23:23:34.853858'),
(28, 'sessions', '0001_initial', '2022-07-25 23:23:34.898647'),
(29, 'sites', '0001_initial', '2022-07-25 23:23:34.925038'),
(30, 'sites', '0002_alter_domain_unique', '2022-07-25 23:23:34.934206'),
(31, 'socialaccount', '0001_initial', '2022-07-25 23:23:35.192157'),
(32, 'socialaccount', '0002_token_max_lengths', '2022-07-25 23:23:35.266681'),
(33, 'socialaccount', '0003_extra_data_default_dict', '2022-07-25 23:23:35.275080'),
(34, 'socialaccount', '0004_alter_socialaccount_id_alter_socialapp_id_and_more', '2022-07-25 23:23:35.666472'),
(35, 'library_auth', '0007_user_username', '2022-07-25 23:28:11.403610'),
(36, 'library_auth', '0008_remove_user_username', '2022-07-25 23:33:38.099480'),
(37, 'library_auth', '0009_remove_user_is_email_verified_user_username', '2022-07-25 23:42:25.278495'),
(38, 'library_auth', '0010_remove_user_username', '2022-07-25 23:46:00.633546'),
(39, 'library', '0002_uploadpdf', '2022-07-26 13:32:01.294860'),
(40, 'library', '0003_uploadpdf_subject_alter_uploadpdf_pdf', '2022-07-26 13:45:44.705316'),
(41, 'library', '0004_alter_uploadpdf_pdf', '2022-07-26 13:48:54.599022'),
(42, 'library', '0005_alter_uploadpdf_pdf', '2022-07-26 14:05:20.973935');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('h2c9kv00nx4brecx3hj1rebddv6re5w0', '.eJxVjMEOwiAQRP-FsyFUCrt49O43EBZYqRpISnsy_rtt0oOeJpn3Zt7Ch3Upfu159lMSFzGI029HIT5z3UF6hHpvMra6zBPJXZEH7fLWUn5dD_fvoIRetvVoHcQclTWZEEc4G5tQY2LYkgkVB7A6JlZEGDMP5ByCIwVaaaNZfL7nljf-:1oGKoK:Bw7mR8PLg1Lm0MGkHQOl_9HIkkT30TFEryaZsW9dIhs', '2022-08-09 13:41:20.668238');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `library_auth_user`
--

CREATE TABLE `library_auth_user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `exam` varchar(20) NOT NULL,
  `social_media` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `library_auth_user`
--

INSERT INTO `library_auth_user` (`id`, `password`, `last_login`, `is_superuser`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `exam`, `social_media`) VALUES
(1, 'pbkdf2_sha256$320000$rDtld2x9MZUPILIEumoltf$G3wiMR7LJX3sNEfb0LxGRfVvdKL5io4v1EUcUvoQZJs=', '2022-07-26 13:41:20.666238', 1, 'Mihir', 'Paghdal', 'mihipaghdal466@gmail.com', 1, 1, '2022-07-25 23:30:48.796959', 'cet', 'none'),
(3, 'pbkdf2_sha256$320000$sIMQSDkepPKyv1hczPM2pM$iuiZYTWGaSqnG8cuSpXh61VOFdx5L8sWqoE6VUXvu+s=', '2022-07-26 00:04:48.247089', 0, '', '', 'mihirpaghdal@gmail.com', 0, 1, '2022-07-26 00:01:34.502999', 'others', 'none'),
(4, 'pbkdf2_sha256$320000$Vs45lSr3nSFXoLrcnL55Q4$wShLwpj8BGfLVNbf2i2nmhptfuH1SuPsw8AJIa91sog=', '2022-07-26 13:41:10.319016', 0, 'Yatin', 'Parakhiya', 'yatinparakhiya@gmail.com', 0, 1, '2022-07-26 00:03:31.863846', 'jee', 'instagram');

-- --------------------------------------------------------

--
-- Table structure for table `library_auth_user_groups`
--

CREATE TABLE `library_auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `library_auth_user_user_permissions`
--

CREATE TABLE `library_auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `library_snippet`
--

CREATE TABLE `library_snippet` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `Email` varchar(254) NOT NULL,
  `Category` varchar(20) NOT NULL,
  `Details` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `library_uploadpdf`
--

CREATE TABLE `library_uploadpdf` (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `pdf` varchar(100) NOT NULL,
  `subject` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

CREATE TABLE `socialaccount_socialaccount` (
  `id` bigint(20) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

CREATE TABLE `socialaccount_socialapp` (
  `id` bigint(20) NOT NULL,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `socialaccount_socialapp`
--

INSERT INTO `socialaccount_socialapp` (`id`, `provider`, `name`, `client_id`, `secret`, `key`) VALUES
(1, 'google', 'Google Library Dev', '738801289782-r1j66k4ngnof1qkh1i6o88ug3o1md16b.apps.googleusercontent.com', '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', '');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

CREATE TABLE `socialaccount_socialapp_sites` (
  `id` bigint(20) NOT NULL,
  `socialapp_id` bigint(20) NOT NULL,
  `site_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

INSERT INTO `socialaccount_socialapp_sites` (`id`, `socialapp_id`, `site_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

CREATE TABLE `socialaccount_socialtoken` (
  `id` bigint(20) NOT NULL,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` bigint(20) NOT NULL,
  `app_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `account_emailaddress_user_id_2c513194_fk_library_auth_user_id` (`user_id`);

--
-- Indexes for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`),
  ADD KEY `account_emailconfirmation_email_address_id_5b7f8c58_fk` (`email_address_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_library_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`);

--
-- Indexes for table `library_auth_user`
--
ALTER TABLE `library_auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_auth_user_email_1447d0fd_uniq` (`email`);

--
-- Indexes for table `library_auth_user_groups`
--
ALTER TABLE `library_auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_auth_user_groups_user_id_group_id_548eb339_uniq` (`user_id`,`group_id`),
  ADD KEY `library_auth_user_groups_group_id_6feeee6e_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `library_auth_user_user_permissions`
--
ALTER TABLE `library_auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_auth_user_user_p_user_id_permission_id_e58f6a64_uniq` (`user_id`,`permission_id`),
  ADD KEY `library_auth_user_us_permission_id_e6d97056_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `library_snippet`
--
ALTER TABLE `library_snippet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `library_uploadpdf`
--
ALTER TABLE `library_uploadpdf`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  ADD KEY `socialaccount_social_user_id_8146e70c_fk_library_a` (`user_id`);

--
-- Indexes for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  ADD KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`);

--
-- Indexes for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  ADD KEY `socialaccount_socialtoken_account_id_951f210e_fk` (`account_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `library_auth_user`
--
ALTER TABLE `library_auth_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `library_auth_user_groups`
--
ALTER TABLE `library_auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_auth_user_user_permissions`
--
ALTER TABLE `library_auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_snippet`
--
ALTER TABLE `library_snippet`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `library_uploadpdf`
--
ALTER TABLE `library_uploadpdf`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp`
--
ALTER TABLE `socialaccount_socialapp`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_emailaddress`
--
ALTER TABLE `account_emailaddress`
  ADD CONSTRAINT `account_emailaddress_user_id_2c513194_fk_library_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `library_auth_user` (`id`);

--
-- Constraints for table `account_emailconfirmation`
--
ALTER TABLE `account_emailconfirmation`
  ADD CONSTRAINT `account_emailconfirmation_email_address_id_5b7f8c58_fk` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_library_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `library_auth_user` (`id`);

--
-- Constraints for table `library_auth_user_groups`
--
ALTER TABLE `library_auth_user_groups`
  ADD CONSTRAINT `library_auth_user_gr_user_id_aa603ca4_fk_library_a` FOREIGN KEY (`user_id`) REFERENCES `library_auth_user` (`id`),
  ADD CONSTRAINT `library_auth_user_groups_group_id_6feeee6e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `library_auth_user_user_permissions`
--
ALTER TABLE `library_auth_user_user_permissions`
  ADD CONSTRAINT `library_auth_user_us_permission_id_e6d97056_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `library_auth_user_us_user_id_551df4dd_fk_library_a` FOREIGN KEY (`user_id`) REFERENCES `library_auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialaccount`
--
ALTER TABLE `socialaccount_socialaccount`
  ADD CONSTRAINT `socialaccount_social_user_id_8146e70c_fk_library_a` FOREIGN KEY (`user_id`) REFERENCES `library_auth_user` (`id`);

--
-- Constraints for table `socialaccount_socialapp_sites`
--
ALTER TABLE `socialaccount_socialapp_sites`
  ADD CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`),
  ADD CONSTRAINT `socialaccount_socialapp_sites_socialapp_id_97fb6e7d_fk` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`);

--
-- Constraints for table `socialaccount_socialtoken`
--
ALTER TABLE `socialaccount_socialtoken`
  ADD CONSTRAINT `socialaccount_socialtoken_account_id_951f210e_fk` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  ADD CONSTRAINT `socialaccount_socialtoken_app_id_636a42d7_fk` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
