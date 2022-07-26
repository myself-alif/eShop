-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2022 at 05:42 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eshop_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `product_image`, `product_title`, `product_price`, `product_quantity`, `created_at`, `updated_at`) VALUES
(25, 1, 'https://i.ibb.co/QdJwgmp/brown-cowboy.png', 'Brown Cowboy', '35', 3, '2022-07-07 03:07:13', '2022-07-07 03:07:32');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Hats', 'https://i.ibb.co/cvpntL1/hats.png', '2022-06-30 09:37:15', '2022-06-30 09:37:15'),
(3, 'Sneakers', 'https://i.ibb.co/0jqHpnp/sneakers.png', '2022-06-30 09:38:17', '2022-06-30 09:38:17'),
(4, 'Jackets', 'https://i.ibb.co/px2tCc3/jackets.png', '2022-06-30 09:37:15', '2022-06-30 09:37:15'),
(5, 'Women', 'https://i.ibb.co/GCCdy8t/womens.png', '2022-06-30 09:38:48', '2022-06-30 09:38:48'),
(6, 'Men', 'https://i.ibb.co/R70vBrQ/men.png', '2022-06-30 09:39:15', '2022-06-30 09:39:15');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_06_24_090203_create_carts_table', 1),
(8, '2022_06_27_070945_create_categories_table', 2),
(9, '2022_06_27_071148_create_products_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(11, 'App\\Models\\User', 1, 'myself.amalif@gmail.com', '5d3dc38cc20062f731f025abb2c4506804ad4eb04885aeee6be47c784e2c3be8', '[\"*\"]', '2022-07-07 03:07:51', '2022-07-07 03:07:48', '2022-07-07 03:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_title`, `product_image`, `product_price`, `created_at`, `updated_at`, `category_id`) VALUES
(1, 'Brown Brim', 'https://i.ibb.co/ZYW3VTp/brown-brim.png', '25', '2022-06-27 07:18:31', '2022-06-27 07:18:31', 2),
(2, 'Blue Beanie', 'https://i.ibb.co/ypkgK0X/blue-beanie.png', '18', '2022-06-27 07:20:21', '2022-06-27 07:20:21', 2),
(3, 'Brown Cowboy', 'https://i.ibb.co/QdJwgmp/brown-cowboy.png', '35', '2022-06-27 07:20:21', '2022-06-27 07:20:21', 2),
(4, 'Grey Brim', 'https://i.ibb.co/RjBLWxB/grey-brim.png', '25', '2022-06-27 07:22:06', '2022-06-27 07:22:06', 2),
(5, 'Green Beanie', 'https://i.ibb.co/YTjW3vF/green-beanie.png', '18', '2022-06-27 07:22:06', '2022-06-27 07:22:06', 2),
(7, 'Palm Tree Cap', 'https://i.ibb.co/rKBDvJX/palm-tree-cap.png', '14', '2022-06-27 07:24:21', '2022-06-27 07:24:21', 2),
(8, 'Red Beanie', 'https://i.ibb.co/bLB646Z/red-beanie.png', '18', '2022-06-27 07:24:21', '2022-06-27 07:24:21', 2),
(9, 'Wolf Cap', 'https://i.ibb.co/1f2nWMM/wolf-cap.png', '14', '2022-06-27 07:24:21', '2022-06-27 07:24:21', 2),
(10, 'Blue Snapback', 'https://i.ibb.co/X2VJP2W/blue-snapback.png', '16', '2022-06-27 07:24:21', '2022-06-27 07:24:21', 2),
(11, 'Adidas NMD', 'https://i.ibb.co/0s3pdnc/adidas-nmd.png', '220', '2022-06-27 07:30:15', '2022-06-27 07:30:15', 3),
(12, 'Adidas Yeezy', 'https://i.ibb.co/dJbG1cT/yeezy.png', '280', '2022-06-27 07:30:15', '2022-06-27 07:30:15', 3),
(13, 'Black Converse', 'https://i.ibb.co/bPmVXyP/black-converse.png', '110', '2022-06-27 07:31:31', '2022-06-27 07:31:31', 3),
(14, 'Nike White AirForce', 'https://i.ibb.co/1RcFPk0/white-nike-high-tops.png', '160', '2022-06-27 07:31:31', '2022-06-27 07:31:31', 3),
(15, 'Nike Red High Tops', 'https://i.ibb.co/QcvzydB/nikes-red.png', '160', '2022-06-27 07:31:31', '2022-06-27 07:31:31', 3),
(16, 'Nike Brown High Tops', 'https://i.ibb.co/fMTV342/nike-brown.png', '160', '2022-06-27 07:31:31', '2022-06-27 07:31:31', 3),
(17, 'Air Jordan Limited', 'https://i.ibb.co/w4k6Ws9/nike-funky.png', '190', '2022-06-27 07:34:58', '2022-06-27 07:34:58', 3),
(18, 'Timberlands', 'https://i.ibb.co/Mhh6wBg/timberlands.png', '200', '2022-06-27 07:34:58', '2022-06-27 07:34:58', 3),
(19, 'Black Jean Shearling', 'https://i.ibb.co/XzcwL5s/black-shearling.png', '125', '2022-06-27 07:37:30', '2022-06-27 07:37:30', 4),
(20, 'Blue Jean Jacket', 'https://i.ibb.co/mJS6vz0/blue-jean-jacket.png', '90', '2022-06-27 07:37:30', '2022-06-27 07:37:30', 4),
(21, 'Grey Jean Jacket', 'https://i.ibb.co/N71k1ML/grey-jean-jacket.png', '90', '2022-06-27 07:39:55', '2022-06-27 07:39:55', 4),
(22, 'Brown Shearling', 'https://i.ibb.co/s96FpdP/brown-shearling.png', '165', '2022-06-27 07:39:55', '2022-06-27 07:39:55', 4),
(23, 'Tan Trench', 'https://i.ibb.co/M6hHc3F/brown-trench.png', '185', '2022-06-27 07:41:47', '2022-06-27 07:41:47', 4),
(24, 'Blue Tanktop', 'https://i.ibb.co/7CQVJNm/blue-tank.png', '25', '2022-06-27 13:32:11', '2022-06-27 13:32:11', 5),
(25, 'Floral Blouse', 'https://i.ibb.co/4W2DGKm/floral-blouse.png', '20', '2022-06-27 13:32:11', '2022-06-27 13:32:11', 5),
(26, 'Floral Dress', 'https://i.ibb.co/KV18Ysr/floral-skirt.png', '80', '2022-06-27 13:33:44', '2022-06-27 13:33:44', 5),
(31, 'Camo Down Vest', 'https://i.ibb.co/xJS0T3Y/camo-vest.png', '325', '2022-06-27 13:39:20', '2022-06-27 13:39:20', 6),
(35, 'Jean Long Sleeve', 'https://i.ibb.co/VpW4x5t/roll-up-jean-shirt.png', '40', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 6),
(37, 'Red Dots Dress', 'https://i.ibb.co/N3BN1bh/red-polka-dot-dress.png', '80', '2022-06-27 13:55:09', '2022-06-27 13:55:09', 5),
(38, 'Striped Sweater', 'https://i.ibb.co/KmSkMbH/striped-sweater.png', '45', '2022-06-27 13:55:09', '2022-06-27 13:55:09', 5),
(39, 'Yellow Track Suit', 'https://i.ibb.co/v1cvwNf/yellow-track-suit.png', '135', '2022-06-27 13:56:39', '2022-06-27 13:56:39', 5),
(40, 'White Blouse', 'https://i.ibb.co/qBcrsJg/white-vest.png', '20', '2022-06-27 13:57:12', '2022-06-27 13:57:12', 5),
(42, 'Floral T-shirt', 'https://i.ibb.co/qMQ75QZ/floral-shirt.png', '20', '2022-06-27 13:58:14', '2022-06-27 13:58:14', 6),
(43, 'Black & White Longsleeve', 'https://i.ibb.co/55z32tw/long-sleeve.png', '25', '2022-06-27 13:59:26', '2022-06-27 13:59:26', 6),
(44, 'Pink T-shirt', 'https://i.ibb.co/RvwnBL8/pink-shirt.png', '25', '2022-06-27 14:00:01', '2022-06-27 14:00:01', 6),
(46, 'Burgundy T-shirt', 'https://i.ibb.co/mh3VM1f/polka-dot-shirt.png', '25', '2022-06-27 14:01:10', '2022-06-27 14:01:10', 6);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `google_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Al Mahmud Alif', 'myself.amalif@gmail.com', NULL, NULL, '110553785508592949349', NULL, '2022-06-28 08:02:59', '2022-06-28 08:02:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
