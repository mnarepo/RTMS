-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2023 at 03:25 AM
-- Server version: 10.5.21-MariaDB-cll-lve
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tradian_rms`
--

-- --------------------------------------------------------

--
-- Table structure for table `order_item_table`
--

CREATE TABLE `order_item_table` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `product_quantity` int(4) NOT NULL,
  `product_rate` decimal(12,2) NOT NULL,
  `product_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_table`
--

CREATE TABLE `order_table` (
  `order_id` int(11) NOT NULL,
  `order_number` varchar(30) NOT NULL,
  `order_table` varchar(250) NOT NULL,
  `order_gross_amount` decimal(12,2) NOT NULL,
  `order_tax_amount` decimal(12,2) NOT NULL,
  `order_net_amount` decimal(12,2) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `order_waiter` varchar(250) NOT NULL,
  `order_cashier` varchar(250) NOT NULL,
  `order_status` enum('In Process','Completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_tax_table`
--

CREATE TABLE `order_tax_table` (
  `order_tax_table_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_tax_name` varchar(200) NOT NULL,
  `order_tax_percentage` decimal(4,2) NOT NULL,
  `order_tax_amount` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_category_table`
--

CREATE TABLE `product_category_table` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `category_status` enum('Enable','Disable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_table`
--

CREATE TABLE `product_table` (
  `product_id` int(11) NOT NULL,
  `category_name` varchar(250) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `product_price` decimal(10,2) NOT NULL,
  `product_status` enum('Enable','Disable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_table`
--

CREATE TABLE `restaurant_table` (
  `restaurant_id` int(11) NOT NULL,
  `restaurant_name` varchar(250) NOT NULL,
  `restaurant_tag_line` varchar(300) NOT NULL,
  `restaurant_address` text NOT NULL,
  `restaurant_contact_no` varchar(30) NOT NULL,
  `restaurant_email` varchar(250) NOT NULL,
  `restaurant_currency` varchar(10) NOT NULL,
  `restaurant_timezone` varchar(250) NOT NULL,
  `restaurant_logo` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `restaurant_table`
--

INSERT INTO `restaurant_table` (`restaurant_id`, `restaurant_name`, `restaurant_tag_line`, `restaurant_address`, `restaurant_contact_no`, `restaurant_email`, `restaurant_currency`, `restaurant_timezone`, `restaurant_logo`) VALUES
(4, 'Hops &amp; Chops', 'Best Meal at Best Place', 'UCP Airline Campus Lahore', '03150433863', 'nabeelar001@gmail.com', 'PKR', 'Asia/Karachi', '');

-- --------------------------------------------------------

--
-- Table structure for table `table_data`
--

CREATE TABLE `table_data` (
  `table_id` int(11) NOT NULL,
  `table_name` varchar(250) NOT NULL,
  `table_capacity` int(3) NOT NULL,
  `table_status` enum('Enable','Disable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `table_data`
--

INSERT INTO `table_data` (`table_id`, `table_name`, `table_capacity`, `table_status`) VALUES
(2, '01', 4, 'Enable');

-- --------------------------------------------------------

--
-- Table structure for table `tax_table`
--

CREATE TABLE `tax_table` (
  `tax_id` int(11) NOT NULL,
  `tax_name` varchar(250) NOT NULL,
  `tax_percentage` decimal(4,2) NOT NULL,
  `tax_status` enum('Enable','Disable') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) NOT NULL,
  `user_contact_no` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_profile` varchar(250) NOT NULL,
  `user_type` enum('Master','Waiter','Cashier') NOT NULL,
  `user_status` enum('Enable','Disable') NOT NULL,
  `user_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `user_name`, `user_contact_no`, `user_email`, `user_password`, `user_profile`, `user_type`, `user_status`, `user_created_on`) VALUES
(8, '', '', 'nabeelar069@gmail.com', '123456', 'images/1689907680.png', 'Master', 'Enable', '2023-07-20 22:48:00'),
(9, '', '', 'nabeelar001@gmail.com', '123456', 'images/1689909574.png', 'Master', 'Enable', '2023-07-20 23:19:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order_item_table`
--
ALTER TABLE `order_item_table`
  ADD PRIMARY KEY (`order_item_id`);

--
-- Indexes for table `order_table`
--
ALTER TABLE `order_table`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_tax_table`
--
ALTER TABLE `order_tax_table`
  ADD PRIMARY KEY (`order_tax_table_id`);

--
-- Indexes for table `product_category_table`
--
ALTER TABLE `product_category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `product_table`
--
ALTER TABLE `product_table`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  ADD PRIMARY KEY (`restaurant_id`);

--
-- Indexes for table `table_data`
--
ALTER TABLE `table_data`
  ADD PRIMARY KEY (`table_id`);

--
-- Indexes for table `tax_table`
--
ALTER TABLE `tax_table`
  ADD PRIMARY KEY (`tax_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_item_table`
--
ALTER TABLE `order_item_table`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_table`
--
ALTER TABLE `order_table`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_tax_table`
--
ALTER TABLE `order_tax_table`
  MODIFY `order_tax_table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_category_table`
--
ALTER TABLE `product_category_table`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_table`
--
ALTER TABLE `product_table`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_table`
--
ALTER TABLE `restaurant_table`
  MODIFY `restaurant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `table_data`
--
ALTER TABLE `table_data`
  MODIFY `table_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_table`
--
ALTER TABLE `tax_table`
  MODIFY `tax_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
