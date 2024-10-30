-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2024 at 09:18 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hertzrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `assetlist`
--

CREATE TABLE `assetlist` (
  `car_id` int(11) NOT NULL,
  `car_type` varchar(60) NOT NULL,
  `car_brand` varchar(255) NOT NULL,
  `car_model` varchar(255) NOT NULL,
  `car_price` int(255) NOT NULL,
  `car_climate_control` varchar(255) NOT NULL,
  `car_acceleration` varchar(255) NOT NULL,
  `car_description` varchar(255) NOT NULL,
  `date_borrow` varchar(255) NOT NULL,
  `date_return` varchar(255) NOT NULL,
  `car_status` enum('Available','Disable','Borrowed') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(11) NOT NULL,
  `car_id` int(11) NOT NULL,
  `lender_id` int(11) NOT NULL,
  `borrower_id` int(11) NOT NULL,
  `car_brand` int(11) NOT NULL,
  `car_model` int(11) NOT NULL,
  `request_status` enum('Pending','Approved','Disapproved','Returned','Lated') DEFAULT 'Pending',
  `date_borrow` varchar(255) DEFAULT NULL,
  `date_return` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `role` enum('admin','borrower','lender') DEFAULT 'borrower'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `password`, `role`) VALUES
(1, 'admin', 'admin@admin', '$2b$10$Gl4JXx3EvhKug21RQrfmQOaVCF0Kx5j7mmRDgZhiGcIZTGKELd4CK', 'admin'),
(3, 'test', 'test@test.test', '$2b$10$WAEGZ0Uz3HBui8kfY2j0LuSOmCDssfoUJkCDTCBw.REhr8.ecDNSO', 'borrower'),
(4, 'johndoe', 'johndoe@gmail.com', '$2b$10$kdYOYD5No0FLz2U9ggVVouNoTKDy0Fqk67sDn0dhQOCH8KVSxveg2', 'lender');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetlist`
--
ALTER TABLE `assetlist`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `lender_id` (`lender_id`),
  ADD KEY `borrower_id` (`borrower_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetlist`
--
ALTER TABLE `assetlist`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `borrower_id` FOREIGN KEY (`borrower_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `car_id` FOREIGN KEY (`car_id`) REFERENCES `assetlist` (`car_id`),
  ADD CONSTRAINT `lender_id` FOREIGN KEY (`lender_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
