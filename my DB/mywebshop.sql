-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2021 at 03:22 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mywebshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `quantity`, `product_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-11-01 11:28:53', '2021-11-01 21:15:40'),
(2, 2, 2, '2021-11-01 21:15:49', '2021-11-01 21:15:49');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Mobiles', '2021-10-31 01:33:15', '2021-10-31 01:33:15'),
(2, 'Laptops', '2021-10-31 01:33:22', '2021-10-31 01:33:22'),
(3, 'Watches', '2021-11-01 12:22:11', '2021-11-01 12:22:11'),
(4, 'Accessories', '2021-11-01 12:23:02', '2021-11-01 12:23:02'),
(5, 'Bags', '2021-11-01 12:23:19', '2021-11-01 12:23:19'),
(6, 'Cameras', '2021-11-01 12:23:33', '2021-11-01 12:23:33'),
(7, 'Clothing', '2021-11-01 12:23:47', '2021-11-01 12:23:47'),
(8, 'Computers', '2021-11-01 12:24:06', '2021-11-01 12:24:06'),
(9, 'Cosmetics', '2021-11-01 12:24:21', '2021-11-01 12:24:21'),
(10, 'Furnitures', '2021-11-01 12:24:34', '2021-11-01 12:24:34'),
(11, 'Glasses', '2021-11-01 12:24:49', '2021-11-01 12:24:49'),
(12, 'Jewellery', '2021-11-01 12:25:05', '2021-11-01 12:25:05'),
(13, 'Shoes', '2021-11-01 12:25:21', '2021-11-01 12:25:21'),
(14, 'Tablets', '2021-11-01 12:25:32', '2021-11-01 12:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_10_28_030331_create_user_types_table', 1),
(2, '2021_10_30_173302_create_payments_table', 2),
(3, '2014_10_12_000000_create_users_table', 3),
(4, '2014_10_12_100000_create_password_resets_table', 3),
(5, '2014_10_12_200000_add_two_factor_columns_to_users_table', 3),
(6, '2019_08_19_000000_create_failed_jobs_table', 3),
(7, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(8, '2021_10_14_034831_create_categories_table', 3),
(9, '2021_10_14_035051_create_products_table', 3),
(10, '2021_10_14_035406_create_carts_table', 3),
(11, '2021_10_14_043637_create_orders_table', 3),
(12, '2021_10_14_043744_create_order_details_table', 3),
(13, '2021_10_28_024854_create_sessions_table', 3),
(14, '2021_10_31_170922_create_options_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `copyright` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `website`, `logo`, `copyright`, `email`, `phone`, `created_at`, `updated_at`) VALUES
(1, 'YouMart', '1635705670.jpg', '2021 youmart', 'youmart@gmail.com', '111-222-333', NULL, '2021-10-31 13:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `totalProducts` int(11) NOT NULL,
  `totalAmount` bigint(20) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `shipDate` timestamp NULL DEFAULT NULL,
  `orderStatus` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `totalProducts`, `totalAmount`, `orderDate`, `shipDate`, `orderStatus`, `user_id`, `payment_id`, `created_at`, `updated_at`) VALUES
(1, 1, 180000, '2021-10-31 10:17:11', '2021-11-01 03:59:45', 'Shipped', 2, 2, '2021-10-31 05:17:11', '2021-11-01 03:59:45'),
(2, 1, 270000, '2021-11-01 02:40:27', '2021-11-01 03:57:36', 'Shipped', 2, 3, '2021-10-31 21:40:27', '2021-11-01 03:57:36'),
(3, 1, 180000, '2021-11-01 02:45:10', '2021-11-01 03:57:38', 'Shipped', 2, 4, '2021-10-31 21:45:10', '2021-11-01 03:57:38');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `itemQuantity` int(11) NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `itemQuantity`, `product_id`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 1, '2021-10-31 05:17:11', '2021-10-31 05:17:11'),
(2, 3, 1, 2, '2021-10-31 21:40:27', '2021-10-31 21:40:27'),
(3, 1, 1, 3, '2021-10-31 21:45:10', '2021-10-31 21:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('zaidshahid777@gmail.com', '$2y$10$gKs5F7sE4BHK0g2pLI7Ez.ifucrY6wsfTa.rG9hi0SwTkZK1QZ.k.', '2021-10-31 20:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_expiration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_v_v` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `payment_method`, `name_on_card`, `card_no`, `card_expiration`, `c_v_v`, `created_at`, `updated_at`) VALUES
(2, 'credit_card', 'zaid', '4028187', '2021-12', 321, '2021-10-31 05:17:11', '2021-10-31 05:17:11'),
(3, 'credit_card', 'a', '1', '2021-12', 321, '2021-10-31 21:40:27', '2021-10-31 21:40:27'),
(4, 'credit_card', 'b', '23', '2021-12', 432, '2021-10-31 21:45:10', '2021-10-31 21:45:10');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `image`, `keywords`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'samsung s20 ultra', '100000', '1635662055.jpg', 'samsung s20 ultra,mobiles,phones', 1, '2021-10-31 01:34:15', '2021-10-31 01:34:15'),
(2, 'haiery11c', '25000', '1635662090.jpg', 'haiery11c,haier,laptops', 2, '2021-10-31 01:34:50', '2021-10-31 01:34:50'),
(3, 'Philips PH805', '40000', '1635787675.jpg', 'Philips PH805,HeadPhone', 4, '2021-11-01 12:27:55', '2021-11-01 12:27:55'),
(4, 'Sony WH-1000XM4', '6000', '1635787764.jpg', 'Sony WH-1000XM4,headphone', 4, '2021-11-01 12:29:24', '2021-11-01 12:29:24'),
(5, 'reslme air buds', '3000', '1635787810.jpg', 'reslme air buds,headphones', 4, '2021-11-01 12:30:10', '2021-11-01 12:30:10'),
(6, 'Ferragamo GANCINI bag', '2000', '1635787842.jpg', 'Ferragamo GANCINI bag', 5, '2021-11-01 12:30:42', '2021-11-01 12:30:42'),
(7, 'gray bag', '3000', '1635787871.jpg', 'gray bag', 5, '2021-11-01 12:31:11', '2021-11-01 12:31:11'),
(8, 'laisara bag', '1000', '1635787904.jpg', 'laisara bag', 5, '2021-11-01 12:31:44', '2021-11-01 12:31:44'),
(9, 'nikon camera', '300000', '1635787940.jpg', 'nikon camera,cameras', 6, '2021-11-01 12:32:20', '2021-11-01 12:33:18'),
(10, 'Pentacon Six TL', '400000', '1635787978.jpg', 'Pentacon Six TL, Cameras', 6, '2021-11-01 12:32:58', '2021-11-01 12:32:58'),
(11, 'sony A6600', '500000', '1635788181.jpg', 'sony A6600,cameras', 6, '2021-11-01 12:36:21', '2021-11-01 12:36:21'),
(12, 'dell Computer', '50000', '1635788245.jpg', 'dell,Computers', 8, '2021-11-01 12:37:25', '2021-11-01 12:37:25'),
(13, 'hp pc', '30000', '1635788287.jpg', 'hp pc,computerscomputer', 8, '2021-11-01 12:38:07', '2021-11-01 12:38:07'),
(14, 'black lenovo pc', '25000', '1635788319.jpg', 'black lenovo pc', 8, '2021-11-01 12:38:39', '2021-11-01 12:38:39'),
(15, 'gucci lipstick', '300', '1635788475.jpg', 'gucci lipstick', 9, '2021-11-01 12:41:15', '2021-11-01 12:41:15'),
(16, 'makeup kit', '1000', '1635788496.jpg', 'makeup kit', 9, '2021-11-01 12:41:36', '2021-11-01 12:41:36'),
(17, 'nail polish', '1200', '1635788528.jpg', 'nail polish', 9, '2021-11-01 12:42:08', '2021-11-01 12:42:08'),
(18, 'iphone 11 white', '200000', '1635788650.jpg', 'iphone 11 white', 1, '2021-11-01 12:44:10', '2021-11-01 12:44:10'),
(19, 'Xiaomi Poco M3', '30000', '1635788695.jpg', 'Xiaomi Poco M3,Mobiles,Phones', 1, '2021-11-01 12:44:55', '2021-11-01 12:44:55'),
(20, 'hp chromebook x2', '45000', '1635788784.jpg', 'hp chromebook x2,laptops', 2, '2021-11-01 12:46:24', '2021-11-01 12:46:24'),
(21, 'Lenovo Yoga 9i', '50000', '1635788816.jpg', 'Lenovo Yoga 9i,laptops', 2, '2021-11-01 12:46:56', '2021-11-01 12:46:56'),
(22, 'Patek Philippe', '3000', '1635788881.jpg', 'Patek Philippe,watches', 3, '2021-11-01 12:48:01', '2021-11-01 12:48:01'),
(23, 'royal black watch', '7000', '1635816692.jpg', 'royal black watch', 3, '2021-11-01 20:31:32', '2021-11-01 20:31:32'),
(24, 'white raddo watch', '8000', '1635816724.jpg', 'white raddo watch', 3, '2021-11-01 20:32:04', '2021-11-01 20:32:04'),
(25, 'Apple ipad Air', '150000', '1635816837.jpg', 'Apple ipad Air', 14, '2021-11-01 20:33:57', '2021-11-01 20:33:57'),
(26, 'ASUS Tablet ZenPad 3S', '125000', '1635816865.jpg', 'ASUS Tablet ZenPad 3S', 14, '2021-11-01 20:34:25', '2021-11-01 20:34:25'),
(27, 'Huawei MateBook', '50000', '1635816896.jpg', 'Huawei MateBook', 14, '2021-11-01 20:34:56', '2021-11-01 20:34:56'),
(28, 'Black Chair Pair', '5000', '1635816945.jpg', 'Black Chair Pair', 10, '2021-11-01 20:35:45', '2021-11-01 20:35:45'),
(29, 'comfortable chair', '3000', '1635816972.jpg', 'comfortable chair', 10, '2021-11-01 20:36:12', '2021-11-01 20:36:12'),
(30, 'wodden chair set', '8000', '1635817010.jpg', 'wodden chair set', 10, '2021-11-01 20:36:50', '2021-11-01 20:36:50'),
(31, 'Black Sunglasses', '500', '1635817046.jpg', 'Black Sunglasses', 11, '2021-11-01 20:37:26', '2021-11-01 20:37:26'),
(32, 'eyesight glass prada', '1500', '1635817101.jpg', 'eyesight glass prada', 11, '2021-11-01 20:38:21', '2021-11-01 20:38:21'),
(33, 'gucci glasses', '2500', '1635817159.jpg', 'gucci glasses', 11, '2021-11-01 20:39:19', '2021-11-01 20:39:19'),
(34, 'beautiful ring', '3000', '1635817197.jpg', 'beautiful ring', 12, '2021-11-01 20:39:57', '2021-11-01 20:39:57'),
(35, 'bracelet', '6000', '1635817229.jpg', 'bracelet', 12, '2021-11-01 20:40:29', '2021-11-01 20:40:29'),
(36, 'ring', '12000', '1635817256.jpg', 'ring', 12, '2021-11-01 20:40:56', '2021-11-01 20:40:56'),
(37, 'eric meclean shoes', '15000', '1635817287.jpg', 'eric meclean shoes', 13, '2021-11-01 20:41:27', '2021-11-01 20:41:27'),
(38, 'nike air max', '25000', '1635817319.jpg', 'nike air max shoes', 13, '2021-11-01 20:41:59', '2021-11-01 20:41:59'),
(39, 'nike sneakers', '20000', '1635817350.jpg', 'nike sneakers', 13, '2021-11-01 20:42:30', '2021-11-01 20:42:30'),
(40, 'plaid suit with shoess', '12000', '1635817397.jpg', 'plaid suit with shoess', 7, '2021-11-01 20:43:17', '2021-11-01 20:43:17'),
(41, 'brown and blue suit', '7000', '1635817450.jpg', 'brown and blue suit shoes', 7, '2021-11-01 20:44:10', '2021-11-01 20:44:10'),
(42, 'black plain full suit', '15000', '1635817491.jpg', 'black plain full suit', 7, '2021-11-01 20:44:51', '2021-11-01 20:44:51'),
(43, 'kids full suit', '7000', '1635817678.jpg', 'kids full suit  shoe toy', 7, '2021-11-01 20:47:58', '2021-11-01 20:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6EAUZ6KKNzWAEQYQlRYQpdZ98WP0C60p6IxYeq5x', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.54 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUm54dVpnVnNBbFhTT1BQS0l0WGRsYUh2SXRVRUduUnFWa0Jka2VEMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoxNzoicGFzc3dvcmRfaGFzaF93ZWIiO3M6NjA6IiQyeSQxMCRrY1N0bXpsbG04ODhZY24wNDhkNVdlMkZPRUcwM3BrUlA1d3lDYXBOeUNWMkxZYzYxcHVLNiI7czoyMToicGFzc3dvcmRfaGFzaF9zYW5jdHVtIjtzOjYwOiIkMnkkMTAka2NTdG16bGxtODg4WWNuMDQ4ZDVXZTJGT0VHMDNwa1JQNXd5Q2FwTnlDVjJMWWM2MXB1SzYiO30=', 1635819565);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type_id` bigint(20) UNSIGNED NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `user_type_id`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@gmail.com', 1, '2021-10-31 01:30:42', '$2y$10$h1s.e7mcBEg/cXNjLphHpOHQxuwSeXYezthY8BrJprF2VhXFbyRTO', NULL, NULL, 'wtfk3bVdL7bHC91jX9XejPXsqJPVYhBWfXQ7OHDEjRwe0m8Rf565zXbjSICj', NULL, 'profile-photos/AgBRsTauKe93GwCXr7e4IaGQVeQ746d0nrYcnMPC.jpg', '2021-10-31 01:30:42', '2021-11-01 00:53:11'),
(2, 'Subhan', 'subhan@gmail.com', 2, NULL, '$2y$10$kcStmzllm888Ycn048d5We2FOEG03pkRP5wyCapNyCV2LYc61puK6', NULL, NULL, 'QcjVooskcEU3S9lG7PbJUIRHmww18ac0YBsHuPXAVfjnYyPgQip0KnbHAyge', NULL, NULL, '2021-10-31 01:36:15', '2021-11-01 00:54:36'),
(3, 'Hadi', 'hadi@gmail.com', 3, NULL, '$2y$10$61Ns2t.sP1OiH8XOVa1fzeJ0MR2hKPu.gWiwvSOaBatfh9OH.NV4S', NULL, NULL, NULL, NULL, NULL, '2021-10-31 01:37:10', '2021-10-31 01:37:10'),
(4, 'daud', 'daud@gmail.com', 4, NULL, '$2y$10$DS94chJcJh.xJ.q5hV7MCeWkdcdE6aCKr4TP9HicqZzbKlsD8xGP.', NULL, NULL, NULL, NULL, NULL, '2021-10-31 01:37:43', '2021-10-31 01:37:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `type`, `discount`, `created_at`, `updated_at`) VALUES
(1, 'admin', 0, '2021-10-31 01:22:24', '2021-10-31 01:22:24'),
(2, 'gold', 10, '2021-10-31 01:31:52', '2021-10-31 01:31:52'),
(3, 'silver', 7, '2021-10-31 01:32:06', '2021-10-31 01:32:06'),
(4, 'bronze', 5, '2021-10-31 01:32:16', '2021-10-31 01:32:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_payment_id_foreign` (`payment_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_type_id_foreign` (`user_type_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_payment_id_foreign` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`id`),
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
