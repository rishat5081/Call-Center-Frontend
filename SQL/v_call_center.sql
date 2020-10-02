-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 02, 2020 at 09:31 AM
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
-- Table structure for table `callee_contact_data`
--

CREATE TABLE `callee_contact_data` (
  `callee_id` int(11) NOT NULL,
  `callee_name` text,
  `callee_phoneNumber` text,
  `callee_gender` text,
  `callee_country` text,
  `callee_status` text,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `callee_contact_data`
--

INSERT INTO `callee_contact_data` (`callee_id`, `callee_name`, `callee_phoneNumber`, `callee_gender`, `callee_country`, `callee_status`, `emp_id`) VALUES
(1, 'John Wick', '+102200', 'Male', 'Canada', 'Not Interested', 1);

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
(1, 'Homeland Security ', 'USA', '25-01-2016', 'Sale', 1, 0),
(2, 'Garage Security ', 'USA', '25-01-2016', 'Sale', 1, 0),
(3, 'Homeland Garden', 'USA', '25-01-2016', 'Sale', 1, 0),
(4, 'Garage Paints', 'USA', '25-01-2016', 'Sale', 1, 0);

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
  `emp_salary` text,
  `emp_commission` text,
  `call_cent_id` int(11) DEFAULT NULL,
  `emp_target` int(11) DEFAULT NULL,
  `compaign_id` int(11) DEFAULT NULL,
  `emp_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_center_employees`
--

INSERT INTO `call_center_employees` (`emp_id`, `emp_fullName`, `emp_username`, `emp_email`, `emp_password`, `emp_role`, `emp_timing`, `emp_salary`, `emp_commission`, `call_cent_id`, `emp_target`, `compaign_id`, `emp_deleted`) VALUES
(1, 'Affan Ahmed', 'affan123', 'affan@gmail.com', 'saad1234', 'CSR', 'Evening', '1500', '5', 1, 15, 1, 0),
(2, 'Atif Awan', 'atif1234', 'affan@gmail.com', 'saad1234', 'CSR', 'Evening', '1500', '5', 1, 15, 1, 0),
(3, 'Asad Khan', 'asad123', 'asad@gmail.com', 'saad1234', 'RES', 'Evening', '1500', '5', 1, 15, 2, 0),
(4, 'Gujjar', 'gujjar1234', 'gujjar@gmail.com', 'saad1234', 'CSR', 'Evening', '1500', '5', 1, 15, 2, 0),
(5, 'Affan Ahmed', 'affan123', 'affan@gmail.com', 'saad1234', 'CSR', 'Evening', '1500', '5', 1, 15, 3, 1),
(6, 'Atif Awan', 'atif1234', 'affan@gmail.com', 'saad1234', 'CSR', 'Evening', '1500', '5', 1, 15, 3, 1),
(7, 'Asad Khan', 'asad123', 'asad@gmail.com', 'saad1234', 'RES', 'Evening', '1500', '5', 1, 15, 4, 0),
(8, 'Gujjar', 'gujjar1234', 'gujjar@gmail.com', 'saad1234', 'CSR', 'Evening', '1500', '5', 1, 15, 4, 1);

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
(1, 'Saad Sohail', 5, 'In Bound', 1, 5, 1, 0);

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
  `campaign_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `call_center_sales`
--

INSERT INTO `call_center_sales` (`sales_id`, `emp_id`, `sale_status`, `sale_amount`, `sale_date`, `campaign_id`) VALUES
(1, 1, 'Lead', 22, '22-08-2020', 1);

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
(1, 'Saad Sohail', 'saad11', 'binfarooq@gmail.com', '$2b$10$WtY9J31csWufr0.eyd2iHe58pPqveVnwQ5FNusY/ERaWIiePzWgUu', 0, '0345-5536125', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `did_numbers_info`
--

CREATE TABLE `did_numbers_info` (
  `did_Num_id` int(11) NOT NULL,
  `did_Num_number` int(11) DEFAULT NULL,
  `call_cent_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `did_numbers_info`
--

INSERT INTO `did_numbers_info` (`did_Num_id`, `did_Num_number`, `call_cent_id`, `emp_id`) VALUES
(1, 66332, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `callee_contact_data`
--
ALTER TABLE `callee_contact_data`
  ADD PRIMARY KEY (`callee_id`),
  ADD KEY `IXFK_callee_contact_data_call_center_employees` (`emp_id`);

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
  ADD KEY `IXFK_call_center_employees_call_center_info` (`call_cent_id`);

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
  ADD KEY `IXFK_call_center_sales_call_center_campaign_info` (`campaign_id`),
  ADD KEY `IXFK_call_center_sales_call_center_employees` (`emp_id`);

--
-- Indexes for table `call_cent_user_info`
--
ALTER TABLE `call_cent_user_info`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `IXFK_call_cent_user_info_admin_info` (`admin_id`);

--
-- Indexes for table `did_numbers_info`
--
ALTER TABLE `did_numbers_info`
  ADD PRIMARY KEY (`did_Num_id`),
  ADD KEY `IXFK_did_Numbers_info_call_center_employees` (`emp_id`),
  ADD KEY `IXFK_did_Numbers_info_call_center_info` (`call_cent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `callee_contact_data`
--
ALTER TABLE `callee_contact_data`
  MODIFY `callee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `call_center_compaign_info`
--
ALTER TABLE `call_center_compaign_info`
  MODIFY `compaign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `call_center_employees`
--
ALTER TABLE `call_center_employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `call_center_info`
--
ALTER TABLE `call_center_info`
  MODIFY `call_cent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `call_center_sales`
--
ALTER TABLE `call_center_sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `call_cent_user_info`
--
ALTER TABLE `call_cent_user_info`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `did_numbers_info`
--
ALTER TABLE `did_numbers_info`
  MODIFY `did_Num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `callee_contact_data`
--
ALTER TABLE `callee_contact_data`
  ADD CONSTRAINT `FK_callee_contact_data_call_center_employees` FOREIGN KEY (`emp_id`) REFERENCES `call_center_employees` (`emp_id`);

--
-- Constraints for table `call_center_compaign_info`
--
ALTER TABLE `call_center_compaign_info`
  ADD CONSTRAINT `FK_call_center_compaing_info_call_center_info` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`);

--
-- Constraints for table `call_center_employees`
--
ALTER TABLE `call_center_employees`
  ADD CONSTRAINT `FK_call_center_employees_call_center_campaign_info` FOREIGN KEY (`compaign_id`) REFERENCES `call_center_compaign_info` (`compaign_id`),
  ADD CONSTRAINT `FK_call_center_employees_call_center_info` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`);

--
-- Constraints for table `call_center_info`
--
ALTER TABLE `call_center_info`
  ADD CONSTRAINT `FK_call_center_info_call_cent_user_info` FOREIGN KEY (`user_id`) REFERENCES `call_cent_user_info` (`user_id`);

--
-- Constraints for table `call_center_sales`
--
ALTER TABLE `call_center_sales`
  ADD CONSTRAINT `FK_call_center_sales_call_center_campaign_info` FOREIGN KEY (`campaign_id`) REFERENCES `call_center_compaign_info` (`compaign_id`),
  ADD CONSTRAINT `FK_call_center_sales_call_center_employees` FOREIGN KEY (`emp_id`) REFERENCES `call_center_employees` (`emp_id`);

--
-- Constraints for table `call_cent_user_info`
--
ALTER TABLE `call_cent_user_info`
  ADD CONSTRAINT `FK_call_cent_user_info_admin_info` FOREIGN KEY (`admin_id`) REFERENCES `admin_info` (`admin_id`);

--
-- Constraints for table `did_numbers_info`
--
ALTER TABLE `did_numbers_info`
  ADD CONSTRAINT `FK_did_Numbers_info_call_center_employees` FOREIGN KEY (`emp_id`) REFERENCES `call_center_employees` (`emp_id`),
  ADD CONSTRAINT `FK_did_Numbers_info_call_center_info` FOREIGN KEY (`call_cent_id`) REFERENCES `call_center_info` (`call_cent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
