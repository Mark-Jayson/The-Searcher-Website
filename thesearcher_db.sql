-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 08:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thesearcher_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `article_id` int(5) NOT NULL,
  `headline` varchar(500) NOT NULL,
  `subhead` varchar(500) NOT NULL,
  `content_text` text NOT NULL,
  `pub_date` timestamp(6) NULL DEFAULT NULL ON UPDATE current_timestamp(6),
  `status` varchar(20) NOT NULL DEFAULT 'draft',
  `category_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`article_id`, `headline`, `subhead`, `content_text`, `pub_date`, `status`, `category_id`) VALUES
(1, '\'Dangerous\' heat index expected in 42 areas', 'Parts of Metro Manila are forecast to be at a danger level on Sunday while the easterlies will bring cloudy skies, according to PAGASA.', 'Lorem ipsum dolor sit amet consectetur. Massa quam aliquam nunc quis laoreet id id ultricies leo. A elit mauris eget tempus. Ac in tempus ipsum amet orci nibh nunc. Consectetur quam nulla in elit amet suspendisse leo aliquet porta. Et mi tortor orci tellus blandit et consectetur turpis ultrices. Proin lectus dictum pharetra elit donec sit tellus. Pellentesque euismod sed ut sit. Ipsum dignissim quis tortor semper. Ornare arcu est auctor nec tortor. Sodales leo lorem quis dui non phasellus sapien cursus ultrices. Et sit ac aliquam vestibulum mi non ultricies nec. Pellentesque eget amet pellentesque blandit sit id. Lorem pellentesque ultrices orci enim ridiculus libero feugiat neque.\r\n<br><br>\r\nMetus urna magna tellus nullam. Nam elit tellus quis volutpat. Malesuada donec nulla sem amet vulputate arcu. Urna senectus ultricies elementum viverra. Tortor platea rhoncus feugiat faucibus ut ultrices a dignissim nam. Nam lectus interdum orci feugiat cras porttitor. Pretium pharetra faucibus tellus sit. Id risus dui et praesent sed massa quis iaculis suspendisse. Volutpat tellus non libero ultrices nisi ipsum neque.\r\n<br><br>\r\nQuis nunc dictum porttitor cursus. Faucibus enim facilisis est elementum. Enim neque porta eget urna convallis sit sit id. Euismod neque consectetur aliquet neque sed auctor. At adipiscing faucibus lacus sed. Tempor eros augue semper aliquam orci nisi dignissim. Amet consequat pulvinar ut cras nunc nibh. Felis at et faucibus vestibulum nulla aliquet in eu. Pretium nunc condimentum placerat lectus. Semper sed neque ut turpis mattis sed. Elementum ut urna tellus vel nullam consequat ut. Lectus fermentum neque nisl erat a. Aliquet ultricies massa odio mattis id mi elementum nulla.\r\n<br><br>\r\nEst fames morbi suspendisse eget enim suspendisse. Ultricies eget id ut parturient. Sed sem ut iaculis purus id auctor lacus odio. Morbi arcu malesuada nisl quisque. Pellentesque gravida risus morbi aliquam lacus. Nisi nulla scelerisque gravida mauris.', '2024-05-26 05:54:04.869844', 'draft', 1);

-- --------------------------------------------------------

--
-- Table structure for table `article_author`
--

CREATE TABLE `article_author` (
  `article_author_id` int(5) NOT NULL,
  `article_id` int(5) DEFAULT NULL,
  `editor_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_author`
--

INSERT INTO `article_author` (`article_author_id`, `article_id`, `editor_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `article_media`
--

CREATE TABLE `article_media` (
  `article_media_id` int(5) NOT NULL,
  `media_id` int(5) DEFAULT NULL,
  `article_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `article_media`
--

INSERT INTO `article_media` (`article_media_id`, `media_id`, `article_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(5) NOT NULL,
  `category_name` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'News'),
(2, 'Opinion'),
(3, 'Literary'),
(4, 'Sports');

-- --------------------------------------------------------

--
-- Table structure for table `editors`
--

CREATE TABLE `editors` (
  `editor_id` int(5) NOT NULL,
  `editor_name` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `registration_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6),
  `role_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `editors`
--

INSERT INTO `editors` (`editor_id`, `editor_name`, `username`, `email`, `password`, `registration_date`, `role_id`) VALUES
(1, 'Jade Reyes', 'jade_reyes', 'jadereyes@gmail.com', 'jadereyes', '0000-00-00 00:00:00.000000', 1),
(2, 'Juan Dela Cruz', 'juandcruz', 'juandelacruz@gmail.com', 'juandelacruz', '0000-00-00 00:00:00.000000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` int(5) NOT NULL,
  `media_filepath` varchar(50) NOT NULL,
  `media_type` varchar(20) NOT NULL,
  `upload_date` timestamp(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `media_filepath`, `media_type`, `upload_date`) VALUES
(1, 'media/photos/heat-index.jpeg', 'photo', '0000-00-00 00:00:00.000000'),
(2, 'media/website-images/logo.png', 'logo', '0000-00-00 00:00:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `media_creator`
--

CREATE TABLE `media_creator` (
  `media_creator_id` int(11) NOT NULL,
  `media_id` int(5) DEFAULT NULL,
  `editor_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `media_creator`
--

INSERT INTO `media_creator` (`media_creator_id`, `media_id`, `editor_id`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `permission`
--

CREATE TABLE `permission` (
  `permission_id` int(5) NOT NULL,
  `permission_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `role_id` int(5) NOT NULL,
  `role_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`role_id`, `role_name`) VALUES
(1, 'Senior Editor'),
(2, 'Photojournalist');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `role_permission_id` int(11) NOT NULL,
  `role_id` int(5) DEFAULT NULL,
  `permission_id` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Indexes for table `article_author`
--
ALTER TABLE `article_author`
  ADD PRIMARY KEY (`article_author_id`),
  ADD KEY `fk_article_id` (`article_id`),
  ADD KEY `fk_user_id` (`editor_id`);

--
-- Indexes for table `article_media`
--
ALTER TABLE `article_media`
  ADD PRIMARY KEY (`article_media_id`),
  ADD KEY `fk_media_id` (`media_id`),
  ADD KEY `fk_article_media_id` (`article_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `editors`
--
ALTER TABLE `editors`
  ADD PRIMARY KEY (`editor_id`),
  ADD UNIQUE KEY `u_username` (`username`),
  ADD UNIQUE KEY `u_email` (`email`),
  ADD KEY `fk_user_role_id` (`role_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`);

--
-- Indexes for table `media_creator`
--
ALTER TABLE `media_creator`
  ADD PRIMARY KEY (`media_creator_id`),
  ADD KEY `fk_media_creator_media_id` (`media_id`),
  ADD KEY `fk_creator_id` (`editor_id`);

--
-- Indexes for table `permission`
--
ALTER TABLE `permission`
  ADD PRIMARY KEY (`permission_id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`role_permission_id`),
  ADD KEY `fk_role_id` (`role_id`),
  ADD KEY `fk_permission_id` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `article_author`
--
ALTER TABLE `article_author`
  MODIFY `article_author_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `article_media`
--
ALTER TABLE `article_media`
  MODIFY `article_media_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `editors`
--
ALTER TABLE `editors`
  MODIFY `editor_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media_creator`
--
ALTER TABLE `media_creator`
  MODIFY `media_creator_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permission`
--
ALTER TABLE `permission`
  MODIFY `permission_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `role_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `role_permission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `article_author`
--
ALTER TABLE `article_author`
  ADD CONSTRAINT `fk_article_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `fk_user_id` FOREIGN KEY (`editor_id`) REFERENCES `editors` (`editor_id`);

--
-- Constraints for table `article_media`
--
ALTER TABLE `article_media`
  ADD CONSTRAINT `fk_article_media_id` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `fk_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`);

--
-- Constraints for table `editors`
--
ALTER TABLE `editors`
  ADD CONSTRAINT `fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);

--
-- Constraints for table `media_creator`
--
ALTER TABLE `media_creator`
  ADD CONSTRAINT `fk_creator_id` FOREIGN KEY (`editor_id`) REFERENCES `editors` (`editor_id`),
  ADD CONSTRAINT `fk_media_creator_media_id` FOREIGN KEY (`media_id`) REFERENCES `media` (`media_id`);

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `fk_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  ADD CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
