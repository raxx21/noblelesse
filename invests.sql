-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2024 at 03:04 PM
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
-- Database: `nobl6990_noblelesse_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `invests`
--

CREATE TABLE `invests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `property_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `investment_id` varchar(40) DEFAULT NULL,
  `total_invest_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `initial_invest_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `paid_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `due_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `per_installment_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `invest_status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = running, 2 = completed',
  `next_profit_date` timestamp NULL DEFAULT NULL,
  `profit_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '3 = investment running, 1 = running, 2 = complete',
  `total_profit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `get_profit_count` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invests`
--

INSERT INTO `invests` (`id`, `user_id`, `property_id`, `investment_id`, `total_invest_amount`, `initial_invest_amount`, `paid_amount`, `due_amount`, `per_installment_amount`, `invest_status`, `next_profit_date`, `profit_status`, `total_profit`, `get_profit_count`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '1', 1000.00000000, 100.00000000, 1100.00000000, 900.00000000, 0.00000000, 1, '2024-09-10 20:00:54', 3, 200.00000000, 1, '2024-09-01 20:00:54', '2024-09-01 20:00:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `invests`
--
ALTER TABLE `invests`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `invests`
--
ALTER TABLE `invests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
