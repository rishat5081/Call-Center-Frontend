-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2020 at 12:10 PM
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
-- Database: `v_call_center`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(11) NOT NULL,
  `admin_username` text,
  `admin_email` text,
  `admin_password` text,
  `admin_contact_Number` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_username`, `admin_email`, `admin_password`, `admin_contact_Number`) VALUES
(1, 'admin11', 'admin@gmail.com', 'saad1234', '0345-5536125');

-- --------------------------------------------------------

--
-- Table structure for table `call_center_compaign_info`
--

CREATE TABLE `call_center_compaign_info` (
  `compaign_id` int(11) NOT NULL,
  `compaign_name` text,
  `compaign_country` text,
  `compaign_start_Date` text,
  `compaign_type` text,
  `call_cent_id` int(11) DEFAULT NULL,
  `compaign_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_center_compaign_info`
--

INSERT INTO `call_center_compaign_info` (`compaign_id`, `compaign_name`, `compaign_country`, `compaign_start_Date`, `compaign_type`, `call_cent_id`, `compaign_deleted`) VALUES
(1, 'Cyber Crime Alert', 'UK', '2012-06-28', 'Sale', 1, 0),
(2, 'Garage Security ', 'USA', '1998-01-30', 'Sale', 2, 0),
(3, 'Security Homeland ', 'Canada', '2002-08-29', 'Sale', 2, 0),
(4, 'Garage Paints', 'USA', '1996-03-31', 'Sale', 2, 0),
(5, 'Saad Sohail', 'PK', '2020-01-13', 'Service', 1, 0),
(6, 'Pak e Property', 'India', '2020-06-18', 'Call Service', 1, 0),
(7, 'Camera Cyberghggh', 'Canada', '2020-10-08', 'Service', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `call_center_employees`
--

CREATE TABLE `call_center_employees` (
  `emp_id` int(11) NOT NULL,
  `emp_fullName` text,
  `emp_username` text,
  `emp_email` text,
  `emp_password` text,
  `emp_role` text,
  `emp_timing` text,
  `emp_salary` int(20) DEFAULT NULL,
  `emp_commission` text,
  `call_cent_id` int(11) DEFAULT NULL,
  `emp_target` int(11) DEFAULT NULL,
  `compaign_id` int(11) DEFAULT NULL,
  `emp_deleted` tinyint(1) NOT NULL,
  `did_Num_id` int(11) NOT NULL,
  `emp_isPaused` tinyint(1) NOT NULL,
  `emp_profile_pic` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_center_employees`
--

INSERT INTO `call_center_employees` (`emp_id`, `emp_fullName`, `emp_username`, `emp_email`, `emp_password`, `emp_role`, `emp_timing`, `emp_salary`, `emp_commission`, `call_cent_id`, `emp_target`, `compaign_id`, `emp_deleted`, `did_Num_id`, `emp_isPaused`, `emp_profile_pic`) VALUES
(1, 'Saad Ahmed', 'affan123', 'affan@gmail.com', '$2b$10$6XkzW7H0rXUQBS..JWdsFuM.2/i4cV0qCuNj73/PA40oZBXI21cTi', 'CSR', 'Evening', 1500, '5', 1, 15, 1, 0, 1, 1, ''),
(2, 'Atif Awan', 'atif1234', 'affan@gmcom', '$2b$10$as0yIsoFN5UZ88Fki7fTJO5fjdPW/cnjF8ALYShRVO47BuoAvs6rW', 'CSR', 'Evening', 1500, '5', 1, 15, 1, 0, 1, 1, '/employees/profile_pictures/1.jpg'),
(3, 'Asad Khan', 'asad123', 'asad@gmail.com', 'saad1234', 'RES', 'Evening', 1500, '5', 1, 15, 2, 0, 1, 0, ''),
(4, 'Gujjar', 'gujjar1234', 'gujjar@gmail.com', 'saad1234', 'CSR', 'Evening', 1500, '5', 2, 15, 2, 0, 1, 0, ''),
(5, 'Affan Ahmed', 'affan123', 'affan@gmail.com', 'saad1234', 'CSR', 'Evening', 1500, '5', 1, 15, 3, 0, 2, 0, ''),
(6, 'Atif Awan', 'atif1234', 'affan@gmail.com', 'saad1234', 'CSR', 'Evening', 1500, '5', 1, 15, 3, 0, 3, 0, ''),
(7, 'Asad Khan', 'asad123', 'asad@gmail.com', 'saad1234', 'RES', 'Evening', 1500, '5', 2, 15, 4, 0, 1, 0, ''),
(8, 'Gujjar', 'gujjar1234', 'gujjar@gmail.com', 'saad1234', 'CSR', 'Evening', 1500, '5', 1, 15, 4, 0, 2, 0, ''),
(9, 'req.body.fullname', 'ehtisham12', 'ehtisham@gmail.com', '$2b$10$1mhIpTj4p5ImQLI8FUnxD.2ubCMCRdSCJSs.Ms30MSpe8dJqZBDF6', 'CSSE', 'Part', 13000, '2', 2, 12, 4, 0, 2, 0, ''),
(10, 'FullName', 'fullname_User', 'fullname_email@a', '$2b$10$O4P6DBL5hHhv5lBYjaWVIOvZ/o.whso7l7CU3DyIm4pgZarTZkHda', 'CRR', '', 12300, '3', 2, 15, 2, 0, 3, 1, ''),
(11, 'req.body.fullname', 'ehtisham', 'ehti@gmail.com', '$2b$10$Px7rVkKbfvBQph9DIOedkeD5PZog4qTuinuuiWlrm1H84eLDu7AV2', 'QWE', 'Full', 12000, '3', 1, 12, 4, 0, 3, 0, ''),
(12, 'req.body.fullname', 'req.body.username', 'req.body.email', 'req.body.password', 'AQW', 'Full', 345, '34535', 1, 53, 5, 0, 4, 1, ''),
(13, 'req.body.fullname', 'req.body.username', 'req.body.email', 'req.body.password', 'AQW', 'Full', 345, '34535', 2, 53, 1, 0, 4, 1, ''),
(14, 'Saad Sohail', 'saad1', 'rishat.5081@gmail.com', 'saad1234', 'Lead', 'Full', 123, '123', 1, 213, 3, 0, 4, 0, ''),
(15, 'Saad Sohail', 'saad1', 'hat.5081@gmail.com', 'saad1234', 'Lead', 'Full', 21222, '12', 2, 21, 1, 0, 4, 0, ''),
(16, 'SAAAD', 'saad1', 'risha81@gmail.com', '$2b$10$55iJQ92OzAtiOoOKfaRhr.f0K9.8Anau6W4UW.TbU8be3x7WGT9mW', 'Lead', 'Full', 23, '23', 1, 23, 1, 0, 4, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `call_center_info`
--

CREATE TABLE `call_center_info` (
  `call_cent_id` int(11) NOT NULL,
  `call_cent_Name` text,
  `no_Of_Seat` int(11) DEFAULT NULL,
  `inbound_outbound` text,
  `callback_dialing` tinyint(1) DEFAULT NULL,
  `numberOf_Callback` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `call_Center_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_center_info`
--

INSERT INTO `call_center_info` (`call_cent_id`, `call_cent_Name`, `no_Of_Seat`, `inbound_outbound`, `callback_dialing`, `numberOf_Callback`, `user_id`, `call_Center_deleted`) VALUES
(1, 'Pak E Property', 5, 'In Bound', 1, 5, 1, 0),
(2, 'ITZ Solution', 5, 'In Bound', 1, 5, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `call_center_sales`
--

CREATE TABLE `call_center_sales` (
  `sales_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `sale_status` text,
  `sale_amount` float(20,0) DEFAULT NULL,
  `sale_date` text,
  `compaign_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_center_sales`
--

INSERT INTO `call_center_sales` (`sales_id`, `emp_id`, `sale_status`, `sale_amount`, `sale_date`, `compaign_id`) VALUES
(1, 2, 'Lead', 22, '22-08-2020', 1),
(2, 2, 'Lead', 22, '01-08-1900', 3),
(3, 2, 'Success', 22, '22-08-2020', 3);

-- --------------------------------------------------------

--
-- Table structure for table `call_cent_user_info`
--

CREATE TABLE `call_cent_user_info` (
  `user_id` int(11) NOT NULL,
  `user_full_name` text,
  `user_username` text,
  `user_email` text,
  `user_password` text,
  `user_first_login` tinyint(1) DEFAULT NULL,
  `user_contact_Number` text,
  `admin_id` int(11) DEFAULT NULL,
  `user_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_cent_user_info`
--

INSERT INTO `call_cent_user_info` (`user_id`, `user_full_name`, `user_username`, `user_email`, `user_password`, `user_first_login`, `user_contact_Number`, `admin_id`, `user_deleted`) VALUES
(1, 'Saad Sohail', 'saad11', 'binfarooq@gmail.com', '$2b$10$as0yIsoFN5UZ88Fki7fTJO5fjdPW/cnjF8ALYShRVO47BuoAvs6rW', 0, '0345-5536125', 1, 0),
(2, 'Farooq', 'saad11', 'farooq@aa', '$2b$10$as0yIsoFN5UZ88Fki7fTJO5fjdPW/cnjF8ALYShRVO47BuoAvs6rW', 0, '0345-5536125', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `contacts_lists`
--

CREATE TABLE `contacts_lists` (
  `contact_ID` int(11) NOT NULL,
  `contact_Name` text NOT NULL,
  `contact_Number` text NOT NULL,
  `contact_Country` text NOT NULL,
  `call_cent_id` int(11) NOT NULL,
  `contact_used_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts_lists`
--

INSERT INTO `contacts_lists` (`contact_ID`, `contact_Name`, `contact_Number`, `contact_Country`, `call_cent_id`, `contact_used_status`) VALUES
(1, 'Saad ', '0354', 'USA', 1, 0),
(6, 'Sohail', '1001', 'UK', 1, 0),
(17, 'Saad ', '0354', 'USA', 1, 0),
(18, 'Sohail', '1001', 'UK', 1, 0),
(19, 'Saad ', '0354', 'USA', 1, 0),
(20, 'Sohail', '1001', 'UK', 1, 0),
(21, 'Saad ', '0354', 'USA', 1, 0),
(22, 'Sohail', '1001', 'UK', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `did_numbers_info`
--

CREATE TABLE `did_numbers_info` (
  `did_Num_id` int(11) NOT NULL,
  `did_Num_number` int(11) DEFAULT NULL,
  `call_cent_id` int(11) DEFAULT NULL,
  `compaign_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `did_numbers_info`
--

INSERT INTO `did_numbers_info` (`did_Num_id`, `did_Num_number`, `call_cent_id`, `compaign_id`) VALUES
(1, 66332, 1, 1),
(2, 11332, 2, 5),
(3, 2111, 1, 1),
(4, 8711, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `employees_notification`
--

CREATE TABLE `employees_notification` (
  `id` int(11) NOT NULL,
  `notification_text` text NOT NULL,
  `notification_status` tinyint(1) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `call_cent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees_notification`
--

INSERT INTO `employees_notification` (`id`, `notification_text`, `notification_status`, `emp_id`, `call_cent_id`) VALUES
(1, 'Access Allowed', 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_calling_contacts`
--

CREATE TABLE `employee_calling_contacts` (
  `emp_calling_id` int(11) NOT NULL,
  `time` text NOT NULL,
  `date` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `contact_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `login/logout_activities`
--

CREATE TABLE `login/logout_activities` (
  `login_logout_id` int(11) NOT NULL,
  `loginTime` text NOT NULL,
  `logoutTime` text,
  `ipAddress` text NOT NULL,
  `emp_id` int(11) NOT NULL,
  `activityDate` text NOT NULL,
  `activityStatus` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login/logout_activities`
--

INSERT INTO `login/logout_activities` (`login_logout_id`, `loginTime`, `logoutTime`, `ipAddress`, `emp_id`, `activityDate`, `activityStatus`) VALUES
(3, '12:10:54', '12:24:47', '::1', 2, '4-11-2020', 1),
(4, '12:23:43', '12:24:47', '::1', 2, '4-11-2020', 1),
(5, '12:24:41', '12:24:47', '::1', 2, '4-11-2020', 1),
(6, '12:28:29', '12:28:37', '::1', 2, '4-11-2020', 1),
(7, '14:35:27', NULL, '::1', 2, '4-11-2020', 0),
(8, '14:36:34', NULL, '::1', 2, '4-11-2020', 0),
(9, '16:34:58', NULL, '::1', 2, '4-11-2020', 0),
(10, '17:0:24', NULL, '::1', 2, '4-11-2020', 0),
(11, '11:56:37', NULL, '::ffff:127.0.0.1', 2, '5-11-2020', 0),
(12, '11:58:9', NULL, '::ffff:127.0.0.1', 2, '5-11-2020', 0),
(13, '11:59:15', NULL, '::1', 2, '5-11-2020', 0),
(14, '12:3:36', NULL, '::1', 2, '5-11-2020', 0),
(15, '12:4:2', NULL, '::1', 2, '5-11-2020', 0),
(16, '12:11:6', NULL, '::1', 2, '5-11-2020', 0),
(17, '14:7:32', NULL, '::1', 2, '5-11-2020', 0),
(18, '14:8:7', NULL, '::1', 2, '5-11-2020', 0),
(19, '14:8:24', NULL, '::1', 2, '5-11-2020', 0),
(20, '14:10:10', NULL, '::1', 2, '5-11-2020', 0),
(21, '14:13:47', NULL, '::1', 2, '5-11-2020', 0),
(22, '14:32:17', NULL, '::1', 2, '5-11-2020', 0),
(23, '14:33:28', NULL, '::1', 2, '5-11-2020', 0),
(24, '14:45:28', NULL, '::1', 2, '5-11-2020', 0),
(25, '14:51:15', NULL, '::1', 2, '5-11-2020', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `call_center_compaign_info`
--
ALTER TABLE `call_center_compaign_info`
  ADD PRIMARY KEY (`compaign_id`),
  ADD KEY `IXFK_call_center_compaing_info_call_center_info` (`call_cent_id`);

--
-- Indexes for table `call_center_employees`
--
ALTER TABLE `call_center_employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `IXFK_call_center_employees_call_center_campaign_info` (`compaign_id`),
  ADD KEY `IXFK_call_center_employees_call_center_info` (`call_cent_id`),
  ADD KEY `did_Num_id` (`did_Num_id`);

--
-- Indexes for table `call_center_info`
--
ALTER TABLE `call_center_info`
  ADD PRIMARY KEY (`call_cent_id`),
  ADD KEY `IXFK_call_center_info_call_cent_user_info` (`user_id`);

--
-- Indexes for table `call_center_sales`
--
ALTER TABLE `call_center_sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `IXFK_call_center_sales_call_center_campaign_info` (`compaign_id`),
  ADD KEY `IXFK_call_center_sales_call_center_employees` (`emp_id`);

--
-- Indexes for table `call_cent_user_info`
--
ALTER TABLE `call_cent_user_info`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `IXFK_call_cent_user_info_admin_info` (`admin_id`);

--
-- Indexes for table `contacts_lists`
--
ALTER TABLE `contacts_lists`
  ADD PRIMARY KEY (`contact_ID`),
  ADD KEY `call_cent_id` (`call_cent_id`);

--
-- Indexes for table `did_numbers_info`
--
ALTER TABLE `did_numbers_info`
  ADD PRIMARY KEY (`did_Num_id`),
  ADD KEY `IXFK_did_Numbers_info_call_center_info` (`call_cent_id`),
  ADD KEY `compaign_id` (`compaign_id`);

--
-- Indexes for table `employees_notification`
--
ALTER TABLE `employees_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employees_notification_ibfk_1` (`emp_id`),
  ADD KEY `call_cent_id` (`call_cent_id`);

--
-- Indexes for table `employee_calling_contacts`
--
ALTER TABLE `employee_calling_contacts`
  ADD PRIMARY KEY (`emp_calling_id`),
  ADD KEY `emp_id` (`emp_id`),
  ADD KEY `contact_ID` (`contact_ID`);

--
-- Indexes for table `login/logout_activities`
--
ALTER TABLE `login/logout_activities`
  ADD PRIMARY KEY (`login_logout_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `call_center_compaign_info`
--
ALTER TABLE `call_center_compaign_info`
  MODIFY `compaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `call_center_employees`
--
ALTER TABLE `call_center_employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `call_center_info`
--
ALTER TABLE `call_center_info`
  MODIFY `call_cent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `call_center_sales`
--
ALTER TABLE `call_center_sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `call_cent_user_info`
--
ALTER TABLE `call_cent_user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `contacts_lists`
--
ALTER TABLE `contacts_lists`
  MODIFY `contact_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `did_numbers_info`
--
ALTER TABLE `did_numbers_info`
  MODIFY `did_Num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees_notification`
--
ALTER TABLE `employees_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_calling_contacts`
--
ALTER TABLE `employee_calling_contacts`
  MODIFY `emp_calling_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login/logout_activities`
--
ALTER TABLE `login/logout_activities`
  MODIFY `login_logout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `call_center_compaign_info`
--
ALTER TABLE `call_center_compaign_info`
  ADD CONSTRAINT `FK_call_center_compaing_info_call_center_info` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`);

--
-- Constraints for table `call_center_employees`
--
ALTER TABLE `call_center_employees`
  ADD CONSTRAINT `FK_call_center_employees_call_center_campaign_info` FOREIGN KEY (`compaign_id`) REFERENCES `call_center_compaign_info` (`compaign_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_call_center_employees_call_center_info` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `call_center_employees_ibfk_1` FOREIGN KEY (`did_Num_id`) REFERENCES `did_numbers_info` (`did_Num_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `call_center_info`
--
ALTER TABLE `call_center_info`
  ADD CONSTRAINT `FK_call_center_info_call_cent_user_info` FOREIGN KEY (`user_id`) REFERENCES `call_cent_user_info` (`user_id`);

--
-- Constraints for table `call_center_sales`
--
ALTER TABLE `call_center_sales`
  ADD CONSTRAINT `FK_call_center_sales_call_center_campaign_info` FOREIGN KEY (`compaign_id`) REFERENCES `call_center_compaign_info` (`compaign_id`),
  ADD CONSTRAINT `FK_call_center_sales_call_center_employees` FOREIGN KEY (`emp_id`) REFERENCES `call_center_employees` (`emp_id`),
  ADD CONSTRAINT `call_center_sales_ibfk_1` FOREIGN KEY (`compaign_id`) REFERENCES `call_center_compaign_info` (`compaign_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `call_cent_user_info`
--
ALTER TABLE `call_cent_user_info`
  ADD CONSTRAINT `FK_call_cent_user_info_admin_info` FOREIGN KEY (`admin_id`) REFERENCES `admin_info` (`admin_id`);

--
-- Constraints for table `contacts_lists`
--
ALTER TABLE `contacts_lists`
  ADD CONSTRAINT `contacts_lists_ibfk_1` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `did_numbers_info`
--
ALTER TABLE `did_numbers_info`
  ADD CONSTRAINT `FK_did_Numbers_info_call_center_info` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `did_numbers_info_ibfk_1` FOREIGN KEY (`compaign_id`) REFERENCES `call_center_compaign_info` (`compaign_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employees_notification`
--
ALTER TABLE `employees_notification`
  ADD CONSTRAINT `employees_notification_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `call_center_employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_notification_ibfk_2` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_calling_contacts`
--
ALTER TABLE `employee_calling_contacts`
  ADD CONSTRAINT `employee_calling_contacts_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `call_center_employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_calling_contacts_ibfk_2` FOREIGN KEY (`contact_ID`) REFERENCES `contacts_lists` (`contact_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `login/logout_activities`
--
ALTER TABLE `login/logout_activities`
  ADD CONSTRAINT `login/logout_activities_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `call_center_employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
