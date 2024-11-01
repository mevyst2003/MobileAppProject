-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 01, 2024 at 09:54 AM
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
  `car_status` enum('Available','Unavailable','Rent','Pending') DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `assetlist`
--

INSERT INTO `assetlist` (`car_id`, `car_type`, `car_brand`, `car_model`, `car_price`, `car_climate_control`, `car_acceleration`, `car_description`, `date_borrow`, `date_return`, `car_status`) VALUES
(1, 'Sedan', 'Toyota', 'Camry', 2000, 'Two zone', '7.6 sec', 'Comfortable mid-size sedan', '', '', 'Available'),
(2, 'Sedan', 'Honda', 'Accord', 2200, 'Two zone', '6.8 sec', 'Spacious and efficient sedan', '', '', 'Available'),
(3, 'Sedan', 'Nissan', 'Altima', 2100, 'Two zone', '6.9 sec', 'Stylish and reliable sedan', '', '', 'Available'),
(4, 'Sedan', 'Ford', 'Fusion', 1800, 'Single zone', '8.0 sec', 'Budget-friendly sedan', '', '', 'Available'),
(5, 'Sedan', 'Hyundai', 'Sonata', 1900, 'Two zone', '7.5 sec', 'Modern and safe sedan', '', '', 'Available'),
(6, 'Sedan', 'Chevrolet', 'Malibu', 2000, 'Single zone', '8.2 sec', 'Comfortable and smooth ride', '', '', 'Available'),
(7, 'SUV', 'Toyota', 'RAV4', 3000, 'Two zone', '8.1 sec', 'Versatile and spacious SUV', '', '', 'Available'),
(8, 'SUV', 'Honda', 'CR-V', 3200, 'Two zone', '7.5 sec', 'Reliable and roomy SUV', '', '', 'Available'),
(9, 'SUV', 'Ford', 'Explorer', 3500, 'Three zone', '6.6 sec', 'Powerful and robust SUV', '', '', 'Available'),
(10, 'SUV', 'Chevrolet', 'Equinox', 2800, 'Two zone', '7.9 sec', 'Stylish and practical SUV', '', '', 'Available'),
(11, 'SUV', 'Nissan', 'Rogue', 3100, 'Two zone', '8.0 sec', 'Comfortable and fuel-efficient SUV', '', '', 'Available'),
(12, 'SUV', 'Hyundai', 'Tucson', 2900, 'Two zone', '7.2 sec', 'Sporty and spacious SUV', '', '', 'Available'),
(13, 'Pick-Up', 'Ford', 'F-150', 4000, 'Single zone', '6.1 sec', 'Durable and powerful truck', '', '', 'Available'),
(14, 'Pick-Up', 'Chevrolet', 'Silverado', 4100, 'Single zone', '5.9 sec', 'Tough and reliable pick-up', '', '', 'Available'),
(15, 'Pick-Up', 'Ram', '1500', 4200, 'Single zone', '5.7 sec', 'Smooth and strong pick-up', '', '', 'Available'),
(16, 'Pick-Up', 'Toyota', 'Tundra', 3900, 'Two zone', '6.4 sec', 'Rugged and spacious pick-up', '', '', 'Available'),
(17, 'Pick-Up', 'GMC', 'Sierra', 4300, 'Two zone', '5.8 sec', 'Luxury and performance pick-up', '', '', 'Available'),
(18, 'Pick-Up', 'Nissan', 'Titan', 3800, 'Single zone', '6.0 sec', 'Tough and capable pick-up', '', '', 'Available'),
(19, 'EV', 'Tesla', 'Model S', 6000, 'Two zone', '2.4 sec', 'High performance electric car', '', '', 'Available'),
(20, 'EV', 'Nissan', 'Leaf', 4000, 'Single zone', '7.9 sec', 'Affordable electric vehicle', '', '', 'Available'),
(21, 'EV', 'Chevrolet', 'Bolt', 4200, 'Two zone', '6.5 sec', 'Compact and efficient EV', '', '', 'Available'),
(22, 'EV', 'Ford', 'Mustang Mach-E', 5000, 'Two zone', '3.5 sec', 'Sporty and stylish electric SUV', '', '', 'Available'),
(23, 'EV', 'Hyundai', 'Kona Electric', 4500, 'Two zone', '6.4 sec', 'Versatile electric SUV', '', '', 'Available'),
(24, 'EV', 'Audi', 'e-tron', 7000, 'Three zone', '5.5 sec', 'Luxury electric SUV', '', '', 'Available');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assetlist`
--
ALTER TABLE `assetlist`
  ADD PRIMARY KEY (`car_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assetlist`
--
ALTER TABLE `assetlist`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
