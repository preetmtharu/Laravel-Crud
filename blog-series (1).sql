-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2018 at 10:10 AM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog-series`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Preet', 'pp@gmail.com', '$2y$10$BJTRlxSyocP0jHpMYJ4kgejNBp6mbOWLG1Ztj9TnxDTo1gyPlxKg2', '1234567890', 1, '2018-10-29 04:13:07', '2018-11-01 05:32:28'),
(4, 'Test', 'test@test.com', '$2y$10$E1HhFVFYCjWH1QsI/C3qh.74ZAycuwRjxy66Rc.XmHptbrKYv1Kk6', '1234567890', 1, '2018-10-29 06:03:50', '2018-10-30 01:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`id`, `admin_id`, `role_id`, `created_at`, `updated_at`) VALUES
(4, 3, 1, NULL, NULL),
(5, 4, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'First Category', 'first-category', '2018-10-24 00:19:56', '2018-10-24 00:19:56'),
(2, 'Second Category', 'second-category', '2018-10-24 00:20:12', '2018-10-24 00:20:12');

-- --------------------------------------------------------

--
-- Table structure for table `category_posts`
--

CREATE TABLE `category_posts` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_posts`
--

INSERT INTO `category_posts` (`post_id`, `category_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2018-10-24 00:20:52', '2018-10-24 00:20:52'),
(3, 1, '2018-10-24 00:39:37', '2018-10-24 00:39:37'),
(4, 1, '2018-10-24 00:40:07', '2018-10-24 00:40:07'),
(4, 2, '2018-10-24 00:40:07', '2018-10-24 00:40:07'),
(2, 2, '2018-10-24 04:04:45', '2018-10-24 04:04:45'),
(5, 2, '2018-10-24 04:40:43', '2018-10-24 04:40:43'),
(6, 1, '2018-10-24 04:41:05', '2018-10-24 04:41:05'),
(7, 1, '2018-10-24 04:41:30', '2018-10-24 04:41:30'),
(8, 2, '2018-10-24 04:42:22', '2018-10-24 04:42:22'),
(9, 2, '2018-10-24 04:42:49', '2018-10-24 04:42:49'),
(10, 1, '2018-10-24 04:43:22', '2018-10-24 04:43:22'),
(10, 2, '2018-10-24 04:43:22', '2018-10-24 04:43:22'),
(11, 1, '2018-10-24 04:43:44', '2018-10-24 04:43:44'),
(12, 1, '2018-10-24 04:44:08', '2018-10-24 04:44:08'),
(13, 1, '2018-10-25 01:18:28', '2018-10-25 01:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2018_10_20_095737_create_posts_table', 1),
(2, '2018_10_20_100248_create_tags_table', 1),
(3, '2018_10_20_100339_create_categories_table', 1),
(4, '2018_10_20_100403_create_category_posts_table', 1),
(5, '2018_10_20_100517_create_post_tags_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `for` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `for`, `created_at`, `updated_at`) VALUES
(16, 'Post-create', 'post', '2018-10-27 01:08:32', '2018-10-27 01:08:32'),
(17, 'Post-Update', 'post', '2018-10-27 01:16:50', '2018-10-27 01:16:50'),
(18, 'Post-Delete', 'post', '2018-10-27 01:16:59', '2018-10-27 01:16:59'),
(19, 'User-Create', 'user', '2018-10-27 01:17:38', '2018-10-27 01:17:38'),
(20, 'User-Update', 'user', '2018-10-27 01:17:50', '2018-10-27 01:17:50'),
(21, 'User-Delete', 'user', '2018-10-27 01:19:03', '2018-10-27 01:19:03'),
(22, 'Post-Publish', 'post', '2018-10-27 01:40:26', '2018-10-27 01:40:26'),
(23, 'Tag-CRUD', 'other', '2018-10-27 01:50:37', '2018-10-27 01:50:37'),
(24, 'Category-CRUD', 'other', '2018-10-27 01:50:47', '2018-10-27 01:50:47');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(11, 2, 22, '2018-10-29 07:37:23', '2018-10-29 07:37:23'),
(12, 3, 16, '2018-10-29 07:37:32', '2018-10-29 07:37:32'),
(13, 3, 17, '2018-10-29 07:37:32', '2018-10-29 07:37:32'),
(18, 2, 18, '2018-10-29 07:38:29', '2018-10-29 07:38:29'),
(19, 3, 23, '2018-10-29 07:38:40', '2018-10-29 07:38:40'),
(20, 3, 24, '2018-10-29 07:38:40', '2018-10-29 07:38:40'),
(21, 4, 16, '2018-10-29 11:19:47', '2018-10-29 11:19:47'),
(22, 4, 17, '2018-10-29 11:19:47', '2018-10-29 11:19:47'),
(27, 1, 18, '2018-10-30 10:02:53', '2018-10-30 10:02:53'),
(29, 1, 17, '2018-10-30 10:20:42', '2018-10-30 10:20:42'),
(30, 1, 23, '2018-10-30 10:26:54', '2018-10-30 10:26:54'),
(34, 1, 20, '2018-10-30 11:01:29', '2018-10-30 11:01:29'),
(35, 1, 21, '2018-10-30 11:01:29', '2018-10-30 11:01:29'),
(36, 1, 19, '2018-10-30 11:02:21', '2018-10-30 11:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `posted_by` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `like` int(11) DEFAULT NULL,
  `dislike` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `subtitle`, `slug`, `body`, `status`, `posted_by`, `image`, `like`, `dislike`, `created_at`, `updated_at`) VALUES
(2, 'Second Title', 'Second Title', 'second', '<p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center &mdash; an equal earth which all men occupy as equals. The airman&#39;s earth, if free men make it, will be truly round: a globe in practice, not in theory.</p>\r\n\r\n<p>Science cuts two ways, of course; its products can be used for both good and evil. But there&#39;s no turning back from science. The early warnings about technological dangers also come from science.</p>\r\n\r\n<p>What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.</p>\r\n\r\n<p>A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That&#39;s how I felt seeing the Earth for the first time. I could not help but love and cherish her.</p>\r\n\r\n<p>For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code class=\"language-css\">p{color:red;}</code></pre>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>The Final Frontier</h2>\r\n\r\n<p>There can be no thought of finishing for &lsquo;aiming for the stars.&rsquo; Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\r\n\r\n<p>There can be no thought of finishing for &lsquo;aiming for the stars.&rsquo; Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\r\n\r\n<blockquote>The dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten.</blockquote>\r\n\r\n<p>Spaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development.</p>\r\n\r\n<h2>Reaching for the Stars</h2>\r\n\r\n<p>As we got further and further away, it [the Earth] diminished in size. Finally it shrank to the size of a marble, the most beautiful you can imagine. That beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man.</p>\r\n\r\n<p><a href=\"http://localhost/laravel_crud/public/post#\"><img alt=\"\" src=\"http://localhost/laravel_crud/public/img/post-sample-image.jpg\" /></a>To go places and do things that have never been done before &ndash; that&rsquo;s what living is all about.</p>\r\n\r\n<p>Space, the final frontier. These are the voyages of the Starship Enterprise. Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before.</p>\r\n\r\n<p>As I stand out here in the wonders of the unknown at Hadley, I sort of realize there&rsquo;s a fundamental truth to our nature, Man must explore, and this is exploration at its greatest.</p>\r\n\r\n<p>Placeholder text by&nbsp;<a href=\"http://spaceipsum.com/\">Space Ipsum</a>. Photographs by&nbsp;<a href=\"https://www.flickr.com/photos/nasacommons/\">NASA on The Commons</a>.</p>', 1, NULL, 'public/cFXdmX2gSGpSivCCzr5JTq1w29X5hXw7DjvnhahO.jpeg', NULL, NULL, '2018-10-24 00:20:52', '2018-10-25 00:51:03'),
(3, 'First Post', 'First Post', 'First Post', '<p>Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center &mdash; an equal earth which all men occupy as equals. The airman&#39;s earth, if free men make it, will be truly round: a globe in practice, not in theory.</p>\r\n\r\n<p>Science cuts two ways, of course; its products can be used for both good and evil. But there&#39;s no turning back from science. The early warnings about technological dangers also come from science.</p>\r\n\r\n<p>What was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.</p>\r\n\r\n<p>A Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That&#39;s how I felt seeing the Earth for the first time. I could not help but love and cherish her.</p>\r\n\r\n<p>For those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.</p>\r\n\r\n<h2>The Final Frontier</h2>\r\n\r\n<p>There can be no thought of finishing for &lsquo;aiming for the stars.&rsquo; Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\r\n\r\n<p>There can be no thought of finishing for &lsquo;aiming for the stars.&rsquo; Both figuratively and literally, it is a task to occupy the generations. And no matter how much progress one makes, there is always the thrill of just beginning.</p>\r\n\r\n<blockquote>The dreams of yesterday are the hopes of today and the reality of tomorrow. Science has not yet mastered prophecy. We predict too much for the next year and yet far too little for the next ten.</blockquote>\r\n\r\n<p>Spaceflights cannot be stopped. This is not the work of any one man or even a group of men. It is a historical process which mankind is carrying out in accordance with the natural laws of human development.</p>\r\n\r\n<h2>Reaching for the Stars</h2>\r\n\r\n<p>As we got further and further away, it [the Earth] diminished in size. Finally it shrank to the size of a marble, the most beautiful you can imagine. That beautiful, warm, living object looked so fragile, so delicate, that if you touched it with a finger it would crumble and fall apart. Seeing this has to change a man.</p>\r\n\r\n<p><a href=\"http://localhost/laravel_crud/public/post#\"><img alt=\"\" src=\"http://localhost/laravel_crud/public/img/post-sample-image.jpg\" /></a>To go places and do things that have never been done before &ndash; that&rsquo;s what living is all about.</p>\r\n\r\n<p>Space, the final frontier. These are the voyages of the Starship Enterprise. Its five-year mission: to explore strange new worlds, to seek out new life and new civilizations, to boldly go where no man has gone before.</p>\r\n\r\n<p>As I stand out here in the wonders of the unknown at Hadley, I sort of realize there&rsquo;s a fundamental truth to our nature, Man must explore, and this is exploration at its greatest.</p>\r\n\r\n<p>Placeholder text by&nbsp;<a href=\"http://spaceipsum.com/\">Space Ipsum</a>. Photographs by&nbsp;<a href=\"https://www.flickr.com/photos/nasacommons/\">NASA on The Commons</a>.</p>', 1, NULL, 'public/ljvQfLsspNqOHH3Pqa2mvZTanzieSHoXQib3yjHJ.png', NULL, NULL, '2018-10-24 00:39:37', '2018-10-25 01:02:17'),
(4, 'Third Post', 'Third Post', 'Third Post', '<p>Third Post&nbsp;Third Post&nbsp;Third Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 00:40:06', '2018-10-24 00:40:06'),
(5, 'Fourth Post', 'Fourth Post', 'fourth', '<p>Fourth Post&nbsp;Fourth Post&nbsp;Fourth Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:40:43', '2018-10-24 04:40:43'),
(6, 'Fifth Post', 'Fifth Post', 'fifth', '<p>Fifth Post&nbsp;Fifth Post&nbsp;Fifth Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:41:05', '2018-10-24 04:41:05'),
(7, 'Sixth Post', 'Sixth Post', 'sixth', '<p>Sixth Post&nbsp;Sixth Post&nbsp;Sixth Post&nbsp;Sixth Post&nbsp;Sixth Post&nbsp;Sixth Post&nbsp;Sixth Post&nbsp;Sixth Post&nbsp;Sixth Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:41:30', '2018-10-24 04:41:30'),
(8, 'Seventh Post', 'Seventh Post', 'seventh', '<p>Seventh Post&nbsp;Seventh Post&nbsp;Seventh Post&nbsp;Seventh Post&nbsp;Seventh Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:42:22', '2018-10-24 04:42:22'),
(9, 'Eighth Post', 'Eighth Post', 'eight', '<p>Eighth Post&nbsp;Eighth Post&nbsp;Eighth Post&nbsp;Eighth Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:42:49', '2018-10-24 04:42:49'),
(10, 'Ninth Post', 'Ninth Post', 'ninth', '<p>Ninth Post&nbsp;Ninth Post&nbsp;Ninth Post&nbsp;Ninth Post&nbsp;Ninth Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:43:22', '2018-10-24 04:43:22'),
(11, 'Tenth Post', 'Tenth Post', 'tenth', '<p>Tenth Post&nbsp;Tenth Post&nbsp;Tenth Post&nbsp;Tenth Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:43:43', '2018-10-24 04:43:43'),
(12, 'Eleventh Post', 'Eleventh Post', 'eleventh', '<p>Eleventh Post&nbsp;Eleventh Post&nbsp;Eleventh Post&nbsp;Eleventh Post&nbsp;Eleventh Post</p>', 1, NULL, NULL, NULL, NULL, '2018-10-24 04:44:08', '2018-10-24 04:44:08'),
(13, 'wrwewerw', 'rwerwerew', 'rwerwe', '<p>rwerwerwerwerwerwer</p>', 1, NULL, 'public/UtKzw3nXIu3EtNb8jDCx6I2BQmXISFbWTww7drN7.png', NULL, NULL, '2018-10-25 01:18:28', '2018-10-25 01:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `post_tags`
--

CREATE TABLE `post_tags` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_tags`
--

INSERT INTO `post_tags` (`post_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(2, 1, '2018-10-24 00:20:52', '2018-10-24 00:20:52'),
(3, 1, '2018-10-24 00:39:37', '2018-10-24 00:39:37'),
(4, 1, '2018-10-24 00:40:06', '2018-10-24 00:40:06'),
(4, 2, '2018-10-24 00:40:06', '2018-10-24 00:40:06'),
(2, 2, '2018-10-24 04:13:18', '2018-10-24 04:13:18'),
(5, 1, '2018-10-24 04:40:43', '2018-10-24 04:40:43'),
(6, 1, '2018-10-24 04:41:05', '2018-10-24 04:41:05'),
(7, 2, '2018-10-24 04:41:30', '2018-10-24 04:41:30'),
(8, 1, '2018-10-24 04:42:22', '2018-10-24 04:42:22'),
(9, 2, '2018-10-24 04:42:49', '2018-10-24 04:42:49'),
(10, 1, '2018-10-24 04:43:22', '2018-10-24 04:43:22'),
(10, 2, '2018-10-24 04:43:22', '2018-10-24 04:43:22'),
(11, 1, '2018-10-24 04:43:43', '2018-10-24 04:43:43'),
(12, 1, '2018-10-24 04:44:08', '2018-10-24 04:44:08'),
(13, 1, '2018-10-25 01:18:28', '2018-10-25 01:18:28');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Editor', '2018-10-26 05:38:42', '2018-10-26 05:38:42'),
(2, 'Publisher', '2018-10-26 05:38:51', '2018-10-26 05:38:51'),
(3, 'Writer', '2018-10-26 05:38:57', '2018-10-26 05:38:57');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'First Tag', 'first-tag', '2018-10-24 00:19:32', '2018-10-24 00:19:32'),
(2, 'Second Tag', 'second-tag', '2018-10-24 00:19:41', '2018-10-24 00:19:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Gurpreet Singh', 'preetmtharu@gmail.com', '$2y$10$.iODJqaOJ0Kgvgs93OSzguGwVt6EXmK6DsULfqNW/Pjid2a0n6j/K', 'fQOOOdKvXiExANxnMPLWzgxFH3UQTwSkFZUARBbh4BCAMl4d8Xr1MYSAdlTi', '2018-10-25 03:44:21', '2018-10-25 03:44:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_posts`
--
ALTER TABLE `category_posts`
  ADD KEY `category_posts_post_id_index` (`post_id`),
  ADD KEY `category_posts_category_id_index` (`category_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD KEY `post_tags_post_id_index` (`post_id`),
  ADD KEY `post_tags_tag_id_index` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `category_posts`
--
ALTER TABLE `category_posts`
  ADD CONSTRAINT `category_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_tags`
--
ALTER TABLE `post_tags`
  ADD CONSTRAINT `post_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
