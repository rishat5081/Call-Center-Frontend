-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 16, 2020 at 11:04 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

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
-- Table structure for table `user_call_center_info`
--

CREATE TABLE `user_call_center_info` (
  `user_call_center_request_id` int(11) NOT NULL,
  `callCenterName` text,
  `no_Of_Seat` int(11) DEFAULT NULL,
  `nameofCompaing` text,
  `nameOfCountry` text,
  `inbound_outbound_select` text,
  `callback_Dialing_YES_checkBox` tinyint(1) DEFAULT NULL,
  `numberOf_Callback` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_call_center_info`
--

INSERT INTO `user_call_center_info` (`user_call_center_request_id`, `callCenterName`, `no_Of_Seat`, `nameofCompaing`, `nameOfCountry`, `inbound_outbound_select`, `callback_Dialing_YES_checkBox`, `numberOf_Callback`, `user_id`) VALUES
(1, 'Saad Call Center', 5, 'Security System', 'Pakistan', 'In bound', 1, 3, 2);

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
  `user_added_Admin_id` int(11) NOT NULL,
  `user_Type_user_type_id` int(11) NOT NULL,
  `user_first_time_login` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `user_information`
--

INSERT INTO `user_information` (`user_id`, `user_full_name`, `user_username`, `user_email`, `user_contact_Number`, `user_password`, `user_added_Admin_id`, `user_Type_user_type_id`, `user_first_time_login`) VALUES
(1, 'Farooq Sohail', 'saad14', 'a@a', '0345-5536125', '$2b$10$gMIfavSiLxMgq7veWB57f.uWOUlGSZuVjhuUvxEl/r8tE0CI0zf06', 1, 1, b'1'),
(2, 'Farooq Sohail', 'saad14', 'binfarooq@gmail.com', '0345-5536125', '$2b$10$WtY9J31csWufr0.eyd2iHe58pPqveVnwQ5FNusY/ERaWIiePzWgUu', 1, 1, b'0');

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
-- Indexes for table `user_call_center_info`
--
ALTER TABLE `user_call_center_info`
  ADD PRIMARY KEY (`user_call_center_request_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_information`
--
ALTER TABLE `user_information`
  ADD PRIMARY KEY (`user_id`) USING BTREE,
  ADD KEY `fk_User_Information_user_added_Admin_idx` (`user_added_Admin_id`),
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
-- AUTO_INCREMENT for table `user_call_center_info`
--
ALTER TABLE `user_call_center_info`
  MODIFY `user_call_center_request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
  MODIFY `user_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_call_center_info`
--
ALTER TABLE `user_call_center_info`
  ADD CONSTRAINT `user_call_center_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_information` (`user_id`);

--
-- Constraints for table `user_information`
--
ALTER TABLE `user_information`
  ADD CONSTRAINT `fk_User_Information_user_Type1` FOREIGN KEY (`user_Type_user_type_id`) REFERENCES `user_type` (`user_type_id`),
  ADD CONSTRAINT `fk_User_Information_user_added_Admin` FOREIGN KEY (`user_added_Admin_id`) REFERENCES `user_added_admin` (`user_added_Admin_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
