-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 11, 2020 at 11:19 AM
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
-- Table structure for table `avatarbuttons`
--

CREATE TABLE `avatarbuttons` (
  `avatar_btn_id` int(11) NOT NULL,
  `btn_text` text NOT NULL,
  `deletedStatus` tinyint(1) NOT NULL,
  `avatar_category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avatarbuttons`
--

INSERT INTO `avatarbuttons` (`avatar_btn_id`, `btn_text`, `deletedStatus`, `avatar_category_id`) VALUES
(1, 'hello, how are you?', 0, 1),
(2, 'hello, how are you?', 0, 2),
(3, 'I am fine ', 0, 1),
(4, 'Whats up?', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `avatarcategory`
--

CREATE TABLE `avatarcategory` (
  `avatar_category_id` int(11) NOT NULL,
  `avatarCategory_name` text NOT NULL,
  `deletedStatus` tinyint(1) NOT NULL,
  `compaign_id` int(11) NOT NULL,
  `created_on` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `avatarcategory`
--

INSERT INTO `avatarcategory` (`avatar_category_id`, `avatarCategory_name`, `deletedStatus`, `compaign_id`, `created_on`) VALUES
(1, 'Greeting', 0, 1, ''),
(2, 'Not Greeting', 0, 2, ''),
(3, 'New World', 0, 1, '');

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
(2, 'Atif Awan', 'atif1234', 'affan@gmcom', '$2b$10$as0yIsoFN5UZ88Fki7fTJO5fjdPW/cnjF8ALYShRVO47BuoAvs6rW', 'CSR', 'Evening', 1500, '5', 1, 15, 1, 0, 1, 1, '/employees/profile_pictures/1606385845006affan@gmcom.png'),
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
(1, 'Saad ', '0354', 'USA', 1, 1),
(6, 'Sohail', '1001', 'UK', 1, 1),
(17, 'Saad ', '0354', 'USA', 1, 1),
(18, 'Sohail', '1001', 'UK', 1, 1),
(19, 'Saad ', '0354', 'USA', 1, 1),
(20, 'Sohail', '1001', 'UK', 1, 1),
(21, 'Saad ', '0354', 'USA', 1, 1),
(22, 'Sohail', '1001', 'UK', 1, 1);

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
  `contact_ID` int(11) NOT NULL,
  `callingStatus` text NOT NULL,
  `callingTime` text NOT NULL,
  `callingDate` text NOT NULL,
  `callMinutes` text NOT NULL,
  `callSeconds` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_calling_contacts`
--

INSERT INTO `employee_calling_contacts` (`emp_calling_id`, `time`, `date`, `status`, `emp_id`, `contact_ID`, `callingStatus`, `callingTime`, `callingDate`, `callMinutes`, `callSeconds`) VALUES
(25, '11:18:29', '20-11-2020', 1, 2, 1, 'Not Interested', '16:41:57', '20-11-2020', '00', '05'),
(26, '11:18:29', '20-11-2020', 1, 2, 6, 'CallBack', '15:11:17', '27-11-2020', '00', '05'),
(27, '11:18:29', '20-11-2020', 1, 2, 17, 'Later', '15:11:26', '27-11-2020', '00', '01'),
(28, '11:18:29', '20-11-2020', 1, 2, 18, 'Not Interested', '17:37:27', '10-12-2020', '00', '19'),
(29, '11:18:29', '20-11-2020', 1, 2, 20, 'Not Interested', '17:37:56', '10-12-2020', '00', '20'),
(30, '11:18:29', '20-11-2020', 0, 2, 19, 'null', 'null', 'null', '', ''),
(31, '11:18:29', '20-11-2020', 1, 2, 21, 'Later', '16:42:20', '20-11-2020', '00', '13'),
(32, '11:18:29', '20-11-2020', 0, 2, 22, 'null', 'null', 'null', '', '');

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
(25, '14:51:15', NULL, '::1', 2, '5-11-2020', 0),
(26, '11:50:33', NULL, '::1', 2, '19-11-2020', 0),
(27, '12:46:23', NULL, '::1', 2, '19-11-2020', 0),
(28, '14:7:27', NULL, '::1', 2, '19-11-2020', 0),
(29, '14:38:39', NULL, '::1', 2, '19-11-2020', 0),
(30, '14:47:53', NULL, '::1', 2, '19-11-2020', 0),
(31, '14:48:18', NULL, '::1', 2, '19-11-2020', 0),
(32, '17:27:3', NULL, '::1', 2, '19-11-2020', 0),
(33, '17:29:52', NULL, '::1', 2, '19-11-2020', 0),
(34, '17:32:26', NULL, '::1', 2, '19-11-2020', 0),
(35, '11:18:9', NULL, '::1', 2, '20-11-2020', 0),
(36, '11:53:18', NULL, '::1', 2, '20-11-2020', 0),
(37, '12:1:14', NULL, '::1', 2, '20-11-2020', 0),
(38, '14:52:50', NULL, '::1', 2, '20-11-2020', 0),
(39, '14:53:23', NULL, '::ffff:127.0.0.1', 2, '20-11-2020', 0),
(40, '14:53:57', NULL, '::1', 2, '20-11-2020', 0),
(41, '14:54:33', NULL, '::1', 2, '20-11-2020', 0),
(42, '15:55:53', NULL, '::ffff:127.0.0.1', 2, '20-11-2020', 0),
(43, '16:41:11', NULL, '::ffff:127.0.0.1', 2, '20-11-2020', 0),
(44, '12:23:43', '15:20:37', '::1', 2, '23-11-2020', 1),
(45, '12:24:30', '15:20:37', '::1', 2, '23-11-2020', 1),
(46, '12:24:43', '15:20:37', '::1', 2, '23-11-2020', 1),
(47, '15:0:58', '15:20:37', '::1', 2, '23-11-2020', 1),
(48, '15:9:29', '15:20:37', '::1', 2, '23-11-2020', 1),
(49, '15:10:9', '15:20:37', '::1', 2, '23-11-2020', 1),
(50, '15:12:27', '15:20:37', '::ffff:127.0.0.1', 2, '23-11-2020', 1),
(51, '15:16:48', '15:20:37', '::1', 2, '23-11-2020', 1),
(52, '15:20:45', '16:30:27', '::1', 2, '23-11-2020', 1),
(53, '15:21:7', '16:30:27', '::1', 2, '23-11-2020', 1),
(54, '15:28:47', '16:30:27', '::1', 2, '23-11-2020', 1),
(55, '15:29:34', '16:30:27', '::1', 2, '23-11-2020', 1),
(56, '15:30:11', '16:30:27', '::ffff:127.0.0.1', 2, '23-11-2020', 1),
(57, '15:32:8', '16:30:27', '::1', 2, '23-11-2020', 1),
(58, '15:32:29', '16:30:27', '::ffff:127.0.0.1', 2, '23-11-2020', 1),
(59, '15:35:11', '16:30:27', '::1', 2, '23-11-2020', 1),
(60, '15:37:26', '16:30:27', '::1', 2, '23-11-2020', 1),
(61, '15:51:56', '16:30:27', '::1', 2, '23-11-2020', 1),
(62, '16:20:18', '16:30:27', '::1', 2, '23-11-2020', 1),
(63, '16:30:13', '16:30:27', '::1', 2, '23-11-2020', 1),
(64, '17:7:21', NULL, '::1', 2, '23-11-2020', 0),
(65, '17:8:47', NULL, '::1', 2, '23-11-2020', 0),
(66, '11:11:28', '13:12:41', '::1', 2, '24-11-2020', 1),
(67, '11:19:57', '13:12:41', '::ffff:127.0.0.1', 2, '24-11-2020', 1),
(68, '11:58:32', '13:12:41', '::1', 2, '24-11-2020', 1),
(69, '11:59:36', '13:12:41', '::1', 2, '24-11-2020', 1),
(70, '12:2:40', '13:12:41', '::1', 2, '24-11-2020', 1),
(71, '12:3:53', '13:12:41', '::1', 2, '24-11-2020', 1),
(72, '12:53:57', '13:12:41', '::1', 2, '24-11-2020', 1),
(73, '13:7:12', '13:12:41', '::1', 2, '24-11-2020', 1),
(74, '13:10:17', '13:12:41', '::1', 2, '24-11-2020', 1),
(75, '13:11:1', '13:12:41', '::1', 2, '24-11-2020', 1),
(76, '13:11:30', '13:12:41', '::1', 2, '24-11-2020', 1),
(77, '13:12:45', '16:46:16', '::1', 2, '24-11-2020', 1),
(78, '13:14:24', '16:46:16', '::1', 2, '24-11-2020', 1),
(79, '16:34:12', '16:46:16', '::1', 2, '24-11-2020', 1),
(80, '16:37:12', '16:46:16', '::1', 2, '24-11-2020', 1),
(81, '16:37:40', '16:46:16', '::1', 2, '24-11-2020', 1),
(82, '16:45:19', '16:46:16', '::1', 2, '24-11-2020', 1),
(83, '16:46:57', '17:21:14', '::1', 2, '24-11-2020', 1),
(84, '16:50:1', '17:21:14', '::1', 2, '24-11-2020', 1),
(85, '16:50:41', '17:21:14', '::1', 2, '24-11-2020', 1),
(86, '16:51:26', '17:21:14', '::1', 2, '24-11-2020', 1),
(87, '16:52:19', '17:21:14', '::1', 2, '24-11-2020', 1),
(88, '17:7:39', '17:21:14', '::1', 2, '24-11-2020', 1),
(89, '17:8:8', '17:21:14', '::1', 2, '24-11-2020', 1),
(90, '17:8:55', '17:21:14', '::1', 2, '24-11-2020', 1),
(91, '17:10:25', '17:21:14', '::1', 2, '24-11-2020', 1),
(92, '17:10:56', '17:21:14', '::1', 2, '24-11-2020', 1),
(93, '17:12:7', '17:21:14', '::1', 2, '24-11-2020', 1),
(94, '17:13:49', '17:21:14', '::1', 2, '24-11-2020', 1),
(95, '17:15:12', '17:21:14', '::1', 2, '24-11-2020', 1),
(96, '17:16:17', '17:21:14', '::1', 2, '24-11-2020', 1),
(97, '17:20:31', '17:21:14', '::1', 2, '24-11-2020', 1),
(98, '17:21:18', '17:36:58', '::1', 2, '24-11-2020', 1),
(99, '17:22:5', '17:36:58', '::1', 2, '24-11-2020', 1),
(100, '17:23:33', '17:36:58', '::1', 2, '24-11-2020', 1),
(101, '17:24:45', '17:36:58', '::1', 2, '24-11-2020', 1),
(102, '17:26:16', '17:36:58', '::1', 2, '24-11-2020', 1),
(103, '17:28:56', '17:36:58', '::1', 2, '24-11-2020', 1),
(104, '17:31:15', '17:36:58', '::1', 2, '24-11-2020', 1),
(105, '17:35:13', '17:36:58', '::1', 2, '24-11-2020', 1),
(106, '17:37:2', '17:38:8', '::1', 2, '24-11-2020', 1),
(107, '17:37:53', '17:38:8', '::1', 2, '24-11-2020', 1),
(108, '10:51:52', '13:0:16', '::1', 2, '26-11-2020', 1),
(109, '12:26:50', '13:0:16', '::1', 2, '26-11-2020', 1),
(110, '12:35:48', '13:0:16', '::ffff:127.0.0.1', 2, '26-11-2020', 1),
(111, '13:0:20', '13:1:12', '::1', 2, '26-11-2020', 1),
(112, '13:1:16', '13:1:22', '::1', 2, '26-11-2020', 1),
(113, '14:46:50', NULL, '::1', 2, '26-11-2020', 0),
(114, '14:49:49', NULL, '::1', 2, '26-11-2020', 0),
(115, '14:50:44', NULL, '::1', 2, '26-11-2020', 0),
(116, '14:53:17', NULL, '::1', 2, '26-11-2020', 0),
(117, '14:54:30', NULL, '::1', 2, '26-11-2020', 0),
(118, '14:56:56', NULL, '::1', 2, '26-11-2020', 0),
(119, '14:57:49', NULL, '::1', 2, '26-11-2020', 0),
(120, '14:59:3', NULL, '::1', 2, '26-11-2020', 0),
(121, '15:2:23', NULL, '::1', 2, '26-11-2020', 0),
(122, '15:5:5', NULL, '::ffff:127.0.0.1', 2, '26-11-2020', 0),
(123, '15:6:35', NULL, '::1', 2, '26-11-2020', 0),
(124, '15:7:42', NULL, '::1', 2, '26-11-2020', 0),
(125, '15:10:22', NULL, '::1', 2, '26-11-2020', 0),
(126, '15:10:58', NULL, '::1', 2, '26-11-2020', 0),
(127, '15:11:19', NULL, '::1', 2, '26-11-2020', 0),
(128, '15:12:1', NULL, '::1', 2, '26-11-2020', 0),
(129, '15:12:43', NULL, '::1', 2, '26-11-2020', 0),
(130, '15:13:35', NULL, '::1', 2, '26-11-2020', 0),
(131, '15:14:51', NULL, '::1', 2, '26-11-2020', 0),
(132, '15:16:36', NULL, '::1', 2, '26-11-2020', 0),
(133, '15:17:19', NULL, '::ffff:127.0.0.1', 2, '26-11-2020', 0),
(134, '12:25:53', NULL, '::1', 2, '4-12-2020', 0),
(135, '12:27:8', NULL, '::1', 2, '4-12-2020', 0),
(136, '12:27:57', NULL, '::1', 2, '4-12-2020', 0),
(137, '11:1:1', '14:28:24', '::1', 2, '8-12-2020', 1),
(138, '12:18:27', '14:28:24', '::1', 2, '8-12-2020', 1),
(139, '12:19:39', '14:28:24', '::1', 2, '8-12-2020', 1),
(140, '14:30:6', NULL, '::1', 2, '8-12-2020', 0),
(141, '14:33:2', NULL, '::1', 2, '8-12-2020', 0),
(142, '14:37:6', NULL, '::1', 2, '8-12-2020', 0),
(143, '14:37:22', NULL, '::ffff:127.0.0.1', 2, '8-12-2020', 0),
(144, '14:38:16', NULL, '::ffff:127.0.0.1', 2, '8-12-2020', 0),
(145, '12:3:35', NULL, '::ffff:127.0.0.1', 2, '9-12-2020', 0),
(146, '12:5:1', NULL, '::1', 2, '9-12-2020', 0),
(147, '12:6:2', NULL, '::ffff:127.0.0.1', 2, '9-12-2020', 0),
(148, '12:7:39', NULL, '::1', 2, '9-12-2020', 0),
(149, '12:9:7', NULL, '::1', 2, '9-12-2020', 0),
(150, '17:36:51', '17:48:30', '::1', 2, '10-12-2020', 1),
(151, '14:13:59', NULL, '::1', 2, '11-12-2020', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `avatarbuttons`
--
ALTER TABLE `avatarbuttons`
  ADD PRIMARY KEY (`avatar_btn_id`),
  ADD KEY `avatar_category_id` (`avatar_category_id`);

--
-- Indexes for table `avatarcategory`
--
ALTER TABLE `avatarcategory`
  ADD PRIMARY KEY (`avatar_category_id`),
  ADD KEY `compaign_id` (`compaign_id`);

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
-- AUTO_INCREMENT for table `avatarbuttons`
--
ALTER TABLE `avatarbuttons`
  MODIFY `avatar_btn_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `avatarcategory`
--
ALTER TABLE `avatarcategory`
  MODIFY `avatar_category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `emp_calling_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `login/logout_activities`
--
ALTER TABLE `login/logout_activities`
  MODIFY `login_logout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `avatarbuttons`
--
ALTER TABLE `avatarbuttons`
  ADD CONSTRAINT `avatarbuttons_ibfk_1` FOREIGN KEY (`avatar_category_id`) REFERENCES `avatarcategory` (`avatar_category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `avatarcategory`
--
ALTER TABLE `avatarcategory`
  ADD CONSTRAINT `avatarcategory_ibfk_1` FOREIGN KEY (`compaign_id`) REFERENCES `call_center_compaign_info` (`compaign_id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
