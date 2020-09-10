-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 04, 2020 at 12:23 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `call_center_db_voip`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_added_admin`
--

CREATE TABLE `user_added_admin` (
  `user_added_Admin_id` int(11) NOT NULL,
  `user_added_Admin_name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `user_added_Admin_email` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_added_admin`
--

INSERT INTO `user_added_admin` (`user_added_Admin_id`, `user_added_Admin_name`, `user_added_Admin_email`) VALUES
(1, 'Saad Sohail', 'rishat.5@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_information`
--

CREATE TABLE `user_information` (
  `user_id` int(11) NOT NULL,
  `user_full_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_username` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `user_email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `user_contact_Number` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `user_password` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `user_added_Admin_user_added_Admin_id` int(11) NOT NULL,
  `user_Type_user_type_id` int(11) NOT NULL,
  `user_first_time_login` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`user_id`, `user_full_name`, `user_username`, `user_email`, `user_contact_Number`, `user_password`, `user_added_Admin_user_added_Admin_id`, `user_Type_user_type_id`, `user_first_time_login`) VALUES
(0, 'Farooq Sohail', 'saad14', 'binfarooq@gmail.com', '0345-5536125', '$2b$10$ABixtpZL2jGPg6ua2fArt.ShQspPGAI3O8xA5l9mI0UpBaHwDMwli', 1, 1, NULL),
(1, 'Farooq Sohail', 'saad14', 'binfarooq@gmail.com', '0345-5536125', 'saad1234', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `user_type_id` int(11) NOT NULL,
  `user_type_namel` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `user_Typecol` varchar(45) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`user_type_id`, `user_type_namel`, `user_Typecol`) VALUES
(1, 'saad', 'SEO');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_added_admin`
--
ALTER TABLE `user_added_admin`
  ADD PRIMARY KEY (`user_added_Admin_id`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`user_id`,`user_added_Admin_user_added_Admin_id`),
  ADD KEY `fk_User_Information_user_added_Admin_idx` (`user_added_Admin_user_added_Admin_id`),
  ADD KEY `fk_User_Information_user_Type1_idx` (`user_Type_user_type_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`user_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user_added_admin`
--
ALTER TABLE `user_added_admin`
  MODIFY `user_added_Admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_information`
--
ALTER TABLE `user_information`
  ADD CONSTRAINT `fk_User_Information_user_Type1` FOREIGN KEY (`user_Type_user_type_id`) REFERENCES `user_type` (`user_type_id`),
  ADD CONSTRAINT `fk_User_Information_user_added_Admin` FOREIGN KEY (`user_added_Admin_user_added_Admin_id`) REFERENCES `user_added_admin` (`user_added_Admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
