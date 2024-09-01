-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2024 at 07:14 AM
-- Server version: 10.11.8-MariaDB-cll-lve
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nobl6990_Noblelesse15`
--

-- --------------------------------------------------------

--
-- Table structure for table `property_galleries`
--

CREATE TABLE `property_galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `property_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `image` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_galleries`
--

INSERT INTO `property_galleries` (`id`, `property_id`, `image`, `created_at`, `updated_at`) VALUES
(6, 1, '66673bd741e311718041559.jpg', '2024-06-10 17:45:59', '2024-06-10 17:45:59'),
(7, 1, '66673bd75d9c81718041559.jpg', '2024-06-10 17:45:59', '2024-06-10 17:45:59'),
(8, 1, '66673bd797df61718041559.jpg', '2024-06-10 17:45:59', '2024-06-10 17:45:59'),
(9, 1, '66673bd7c91901718041559.jpg', '2024-06-10 17:45:59', '2024-06-10 17:45:59'),
(10, 2, '66676499b0ebe1718051993.png', '2024-06-10 20:39:54', '2024-06-10 20:39:54'),
(11, 2, '6667649a1778e1718051994.png', '2024-06-10 20:39:54', '2024-06-10 20:39:54'),
(12, 2, '6667649a6a4f11718051994.png', '2024-06-10 20:39:54', '2024-06-10 20:39:54'),
(13, 2, '6667649ab10171718051994.png', '2024-06-10 20:39:55', '2024-06-10 20:39:55'),
(14, 2, '6667649b0a1c61718051995.png', '2024-06-10 20:39:55', '2024-06-10 20:39:55'),
(15, 2, '6667649b4b1dc1718051995.png', '2024-06-10 20:39:55', '2024-06-10 20:39:55'),
(16, 1, '66676698e75dc1718052504.jpg', '2024-06-10 20:48:25', '2024-06-10 20:48:25'),
(17, 1, '666766bd7df521718052541.jpeg', '2024-06-10 20:49:01', '2024-06-10 20:49:01'),
(18, 1, '666766bd89bb41718052541.jpeg', '2024-06-10 20:49:01', '2024-06-10 20:49:01'),
(19, 1, '666766bd950761718052541.jpeg', '2024-06-10 20:49:01', '2024-06-10 20:49:01'),
(20, 1, '666766bda03911718052541.jpeg', '2024-06-10 20:49:01', '2024-06-10 20:49:01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `property_galleries`
--
ALTER TABLE `property_galleries`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `property_galleries`
--
ALTER TABLE `property_galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
