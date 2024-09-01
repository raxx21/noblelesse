-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 01, 2024 at 01:15 PM
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
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `location_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invest_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = onetime, 2 = installment',
  `total_share` int(11) NOT NULL DEFAULT 0,
  `per_share_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `is_capital_back` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = yes, 2 = no',
  `profit_back` int(11) NOT NULL DEFAULT 0,
  `total_installment` int(11) NOT NULL DEFAULT 0,
  `per_installment_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `down_payment` decimal(5,2) NOT NULL DEFAULT 0.00,
  `installment_late_fee` decimal(5,2) NOT NULL DEFAULT 0.00,
  `installment_duration` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'time_settings_id',
  `profit_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = fixed, 2 = range',
  `profit_amount_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = fixed, 2 = percent',
  `profit_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `minimum_profit_amount` decimal(28,8) DEFAULT 0.00000000,
  `maximum_profit_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `profit_schedule` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = lifetime, 2 = repeated time, 3 = onetime',
  `profit_schedule_period` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'time_setting_id',
  `profit_repeat_time` int(11) NOT NULL DEFAULT 0,
  `profit_distribution` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = manual, 2 = auto',
  `auto_profit_distribution_amount` decimal(5,2) NOT NULL DEFAULT 0.00,
  `map_url` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `amenities` text DEFAULT NULL,
  `goal_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `invested_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `invest_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = running, 2= completed',
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `thumb_image` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `complete_step` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Completed Property Setting,2=Completed Investment \r\nSetting',
  `keywords` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `title`, `location_id`, `invest_type`, `total_share`, `per_share_amount`, `is_capital_back`, `profit_back`, `total_installment`, `per_installment_amount`, `down_payment`, `installment_late_fee`, `installment_duration`, `profit_type`, `profit_amount_type`, `profit_amount`, `minimum_profit_amount`, `maximum_profit_amount`, `profit_schedule`, `profit_schedule_period`, `profit_repeat_time`, `profit_distribution`, `auto_profit_distribution_amount`, `map_url`, `details`, `amenities`, `goal_amount`, `invested_amount`, `invest_status`, `is_featured`, `thumb_image`, `status`, `complete_step`, `keywords`, `created_at`, `updated_at`) VALUES
(1, '2 Bedroom Apartment Park West, Hyde Park, London, W2 2RB', 1, 1, 614, 3070827.00000000, 1, 30, 0, 0.00000000, 0.00, 0.00, 0, 1, 1, 13000.00000000, 0.00000000, 0.00000000, 2, 1, 12, 1, 0.00, 'https://maps.app.goo.gl/vGhCX94oXGXTw7R88?g_st=iw', '<h3><font color=\"#000000\">2 Bedroom Apartment, Park West, Hyde Park, London, W2 2RB</font></h3><p><font color=\"#000000\">Noblelesse is offering an opportunity to invest in a 2 Bedroom Apartment located on the 6th floor of Block Nine at Park West, Hyde Park, London, W2 2RB. This property is situated within the prestigious Hyde Park Estate development.</font></p><p><font color=\"#000000\"><br></font></p><p><font color=\"#000000\"><b>Description:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Address:&nbsp;2 Bedroom Apartment, Park West, Hyde Park, London, W2 2RB</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Floor:&nbsp;6th floor, Block Nine</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Internal Size:&nbsp;678 sqft</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Rooms:&nbsp;2 Bedrooms, Modern kitchen and lounge, Modern bathroom</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Amenities:&nbsp;24 hour security, Lift access to all floors</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Features:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Security and Porterage:&nbsp;The flat benefits from 24-hour security and porterage services.</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Heating:&nbsp;Equipped with a community heating system.</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Kitchen and Lounge:&nbsp;Separate modern kitchen with integrated appliances and spacious lounge area.</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Transport Links:&nbsp;Excellent connectivity with nearby railway and tube stations including Bakerloo, Circle, District, Hammersmith, and City lines.</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Local Amenities:&nbsp;Close proximity to Hyde Park, various local amenities, and primary and preparatory schools.</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Internal Measurements:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Lounge:&nbsp;4.90m (16 feet 1 inch) x 3.40m (11 feet 2 inches)</font><ul><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Front door leads directly into the lounge, two windows to side, wooden floor, down-lighters, open plan to hall, door leading to kitchen.</font></li></ul></ul></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Kitchen:&nbsp;2.90m (9 feet 6 inches) x 1.30m (4 feet 3 inches)</font><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Modern base and eye level units with granite work surfaces, integrated sink with drainer, ceramic hob with fitted oven under and extractor fan over, ceramic tiled floor.</font></li></ul></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Master Bedroom:&nbsp;3.50m (11 feet 6 inches) x 2.30m (7 feet 7 inches)</font><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Window to side, wooden floor, down-lighters.</font></li></ul></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Bedroom 2:&nbsp;2.70m (8 feet 10 inches) x 2.30m (7 feet 7 inches)</font><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Two windows to side, wooden floor, down-lighters.</font></li></ul></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Bathroom:&nbsp;</font><span style=\"color: rgb(0, 0, 0); font-size: 0.875rem; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">Fitted with a double shower tray and glazed screen, low-level WC with concealed cistern and push button flush, built-in wash-hand basin with drawers under, mirror, ceramic tiled floor and walls, chromium heated wall-mounted towel rail, extractor fan, down-lighters.</span><ul><li><font color=\"#000000\"><br></font></li></ul></li></ul><p><font color=\"#000000\"><b>Location:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Development:&nbsp;Set within the Hyde Park Estate development</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Proximity:&nbsp;Close to Hyde Park with good transport links from a variety of railway and tube stations including Bakerloo, Circle, District, Hammersmith, and City lines</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Local Amenities:&nbsp;Wide variety of local amenities and primary and preparatory schools within close proximity</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Tenancy:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Currently vacant, with tenants available to rent at £3,000 per month</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Financials:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Purchase Price:&nbsp;£660,000</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Lease Remaining:&nbsp;165 years</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Ground Rent:&nbsp;£270 per year</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Service Charge:&nbsp;£6,398 per year</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Investment Summary:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Prime location in Hyde Park Estate</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Secure and modern apartment with high-quality amenities</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Excellent transport links and local amenities</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>High rental income potential</font></li></ul>', NULL, 1885487778.00000000, 0.00000000, 0, 0, '66675dd7bbc941718050263.jpeg', 1, 2, '[\"Two Bedroom Apartment Hyde Park London\",\"Prime London Real Estate Investment\",\"Hyde Park Real Estate\",\"Vacant Apartment for Sale Hyde Park\",\"Investment Property London\",\"Luxury Apartment London W2\",\"2 Bedroom Flat Hyde Park Estate\",\"UK Properties\"]', '2024-06-10 16:02:23', '2024-06-13 21:05:14'),
(2, 'Linea House  Ancells Business Park, Fleet, Gu51 2uz', 1, 1, 3024, 15121496.00000000, 1, 30, 0, 0.00000000, 0.00, 0.00, 0, 1, 1, 1701866.00000000, 0.00000000, 0.00000000, 2, 1, 12, 1, 0.00, 'https://maps.app.goo.gl/5U6hjEnhLwSxtdCz7', '<h3><font color=\"#000000\">Linea House, Fleet, GU51 2UZ</font></h3><p><font color=\"#000000\">Noblelesse is offering an exceptional investment opportunity in Linea House, Ancells Business Park, Fleet, GU51 2UZ. This fully let reversionary office investment is strategically located in the M3 corridor at the heart of the Blackwater Valley, providing excellent connectivity to the South East and Greater London.</font></p><p><font color=\"#000000\"><br></font></p><p><font color=\"#000000\"><b>Description:</b></font></p><span style=\"font-size: 0.875rem; text-align: var(--bs-body-text-align); color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><ul><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>Address:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">Linea House, Ancells Business Park, Fleet, GU51 2UZ</span><br></li><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>Building:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">Freehold office building</span><br></li><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>Size:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">21,696 sq ft across ground and two upper floors</span><br></li><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>Site Area:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">Approximately 1.31 acres (0.53 hectares) with a low site coverage of 16%</span><br></li><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>Parking:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">121 surface car parking spaces (1:175 sq ft ratio)</span><br></li><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>Occupancy:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">Fully let to 6 tenants</span><br></li><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>Rental Income:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">£365,775 per annum (£17.30 psf)</span><br></li><li><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; text-align: var(--bs-body-text-align); background-color: var(--bs-card-bg);\">· &nbsp;&nbsp;</span>WAULT:</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">&nbsp;</span><span style=\"text-align: var(--bs-body-text-align); font-size: 0.875rem; color: rgb(0, 0, 0); background-color: var(--bs-card-bg);\">3.2 years to break and 5.6 years to expiry</span><br></li><li><font color=\"#000000\"><br></font></li></ul></span><span style=\"color: rgb(0, 0, 0); font-size: 0.875rem; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\"></span><p><font color=\"#000000\"><b>Features:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Double Height Reception:&nbsp;Newly refurbished</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Lifts:&nbsp;2 x 8 passenger lifts</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Raised Floors:&nbsp;Throughout the building</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>WCs:&nbsp;Male and Female WCs on all floors, disabled WCs on ground and second floors</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Shower Facilities:&nbsp;Recently installed</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Suspended Ceilings:&nbsp;Throughout the building</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Internal Measurements:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Reception:&nbsp;51 sq m (549 sq ft)</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Ground Floor:&nbsp;651 sq m (7,002 sq ft)</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>First Floor:&nbsp;659 sq m (7,088 sq ft)</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Second Floor:&nbsp;656 sq m (7,057 sq ft)</font></li><li><font color=\"#000000\">Total:&nbsp;2,017 sq m (21,696 sq ft)</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Location:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Connectivity:&nbsp;5-minute drive from Fleet town centre, M3, and Fleet Railway Station</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Amenities:&nbsp;Close to local amenities and schools, with excellent transport links</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Local Market:&nbsp;Fleet offers competitive rental rates compared to nearby office markets like Farnborough and Camberley</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Tenancy:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>PRMA Consulting Limited:&nbsp;£69,615 per annum</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Verisk Limited:&nbsp;£51,930 per annum</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Pabulum Limited:&nbsp;£77,809 per annum</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>FSE C.I.C:&nbsp;£41,854 per annum</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Fundamental Media Limited:&nbsp;£57,348 per annum</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>BCD Meetings &amp; Events Limited:&nbsp;£67,219 per annum</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Financials:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Purchase Price:&nbsp;Offers in excess of £3,250,000</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Net Initial Yield:&nbsp;10.57%</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Reversionary Yield:&nbsp;11.20%</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Capital Value:&nbsp;£150 psf</font></li><li><font color=\"#000000\"><br></font></li></ul><p><font color=\"#000000\"><b>Investment Summary:</b></font></p><ul><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>High-quality multi-let investment in a prime location</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Fully let with minimal void risk</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Secure income from tenants with strong credit ratings</font></li><li><font color=\"#000000\"><span style=\"font-family: &quot;Helvetica Neue&quot;; font-size: 13px; background-color: var(--bs-card-bg); text-align: var(--bs-body-text-align);\">· &nbsp;&nbsp;</span>Opportunities for rental growth and asset management initiatives</font></li></ul>', NULL, -1517236352.00000000, 0.00000000, 0, 1, '66676499a01cf1718051993.jpeg', 1, 2, '[\"Linea House Fleet investment\",\"Ancells Business Park offices\",\"Fleet office space for sale\",\"M3 corridor office investment\",\"Blackwater Valley commercial property\",\"Fleet freehold office building\",\"Reversionary office investment Fleet\"]', '2024-06-10 17:55:07', '2024-06-13 21:05:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
