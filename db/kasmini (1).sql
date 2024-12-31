-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 31, 2024 at 01:07 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasmini`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id_category` bigint UNSIGNED NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id_category`, `category_name`, `category_description`, `created_at`) VALUES
(3, 'TEST', '123', '2024-12-30 05:59:28');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id_expense` bigint UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `description` text,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_reports`
--

CREATE TABLE `expense_reports` (
  `id_expense_report` bigint UNSIGNED NOT NULL,
  `start_date` timestamp NOT NULL,
  `end_date` timestamp NOT NULL,
  `total_expenses` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_records`
--

CREATE TABLE `payment_records` (
  `id_payment_record` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','transfer') NOT NULL,
  `payment_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payment_records`
--

INSERT INTO `payment_records` (`id_payment_record`, `transaction_id`, `amount`, `payment_method`, `payment_date`) VALUES
(1, 4, 200000.00, 'cash', '2024-12-30 07:13:23'),
(2, 5, 10000000.00, 'cash', '2024-12-30 07:14:05'),
(3, 6, 99000000.00, 'cash', '2024-12-30 07:16:05');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id_product` bigint UNSIGNED NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `unit` int DEFAULT NULL,
  `category_id` bigint UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id_product`, `product_name`, `price`, `purchase_price`, `stock`, `unit`, `category_id`, `image`, `created_at`) VALUES
(5, 'Laptop Acer Predator', 15000000.00, 12000000.00, 2, 1, 3, 'laptop-acer-predator.jpg', '2024-12-30 06:09:05'),
(6, 'Laptop Acer', 15000000.00, 12000000.00, 6, 1, 3, 'laptop-acer-predator.jpg', '2024-12-30 06:17:43'),
(7, 'Figure Suisei', 150.00, 100.00, 12, 1, 3, 'suisei.jpg', '2024-12-30 06:40:46');

-- --------------------------------------------------------

--
-- Table structure for table `stock_records`
--

CREATE TABLE `stock_records` (
  `id_stock_record` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `quantity_change` int NOT NULL,
  `reason` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `stock_records`
--

INSERT INTO `stock_records` (`id_stock_record`, `product_id`, `user_id`, `quantity_change`, `reason`, `date`) VALUES
(1, 6, 7, -3, 'Product sale', '2024-12-30 06:31:54'),
(2, 5, 7, -3, 'Product sale', '2024-12-30 06:31:54'),
(7, 6, 7, -3, 'Product sale', '2024-12-31 00:22:18'),
(8, 5, 7, -3, 'Product sale', '2024-12-31 00:22:18'),
(9, 5, 8, -3, 'Product sale', '2024-12-31 00:46:51'),
(10, 5, 8, -2, 'Product sale', '2024-12-31 00:46:51'),
(11, 6, 7, -3, 'Product sale', '2024-12-31 00:55:02'),
(12, 7, 8, -3, 'Product sale', '2024-12-31 00:56:34'),
(13, 6, 8, -2, 'Product sale', '2024-12-31 00:56:34');

-- --------------------------------------------------------

--
-- Table structure for table `store_settings`
--

CREATE TABLE `store_settings` (
  `id_store_setting` bigint UNSIGNED NOT NULL,
  `store_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id_transaction` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `transaction_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('belum bayar','sudah bayar','dibatalkan') NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `payment_method` enum('cash','transfer') DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00',
  `tax` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id_transaction`, `user_id`, `transaction_date`, `status`, `customer_name`, `payment_method`, `total`, `discount`, `tax`) VALUES
(4, 7, '2024-12-30 06:12:42', 'sudah bayar', 'John Doe', 'cash', 189000.00, 1000.00, 5000.00),
(5, 7, '2024-12-30 06:17:23', 'sudah bayar', 'John Doe', 'cash', 244999.90, 0.05, 5000.00),
(6, 7, '2024-12-30 06:17:57', 'sudah bayar', 'John Doe', 'cash', 244999.90, 0.05, 5000.00),
(7, 8, '2024-12-30 06:25:42', 'belum bayar', 'Miyabi', 'transfer', 264999.89, 0.01, 10000.00),
(8, 7, '2024-12-30 06:31:54', 'dibatalkan', 'John Doe', 'cash', 244999.90, 0.05, 5000.00),
(9, 8, '2024-12-31 00:22:18', 'belum bayar', 'Miyabi', 'transfer', 354999.89, 0.01, 10000.00),
(10, 7, '2024-12-31 00:55:02', 'belum bayar', 'John Doe', 'cash', 244999.90, 0.05, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `id_transaction_detail` bigint UNSIGNED NOT NULL,
  `transaction_id` bigint UNSIGNED DEFAULT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`id_transaction_detail`, `transaction_id`, `product_id`, `unit_price`, `quantity`, `subtotal`, `discount`) VALUES
(4, 4, 5, 30000.00, 3, 90000.00, 0.00),
(5, 5, 5, 50000.00, 3, 149999.95, 0.05),
(7, 6, 6, 50000.00, 3, 149999.95, 0.05),
(8, 6, 5, 30000.00, 3, 90000.00, 0.00),
(9, 7, 6, 50000.00, 3, 149999.95, 0.05),
(10, 7, 5, 30000.00, 3, 90000.00, 0.00),
(11, 8, 6, 50000.00, 3, 149999.95, 0.05),
(12, 8, 5, 30000.00, 3, 90000.00, 0.00),
(13, 9, 6, 60000.00, 2, 119999.95, 0.05),
(14, 9, 5, 45000.00, 5, 224999.95, 0.05),
(17, 10, 6, 50000.00, 3, 149999.95, 0.05),
(18, 10, 5, 30000.00, 3, 90000.00, 0.00),
(19, 9, 7, 45000.00, 3, 134999.95, 0.05);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` bigint UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('kasir','pemilik') NOT NULL,
  `pin` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `username`, `email`, `password`, `role`, `pin`, `created_at`) VALUES
(7, 'mumei', 'mumei@gmail.com', '$2b$10$ZSIuBdKHF4T/zEXzaN9tXezhldJgy4WDVUOF32NkFPAFRKW5ShbBW', 'kasir', '123456', '2024-12-26 02:00:58'),
(8, 'risu', 'risu@gmail.com', '$2b$10$2gneyBBF678bUpa4Gumna.qrNrCHj3qn9cUxaoEW9kHqjdi/hv/2.', 'pemilik', '123456', '2024-12-30 05:40:40');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_category`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id_expense`),
  ADD UNIQUE KEY `id_expense` (`id_expense`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `expense_reports`
--
ALTER TABLE `expense_reports`
  ADD PRIMARY KEY (`id_expense_report`),
  ADD UNIQUE KEY `id_expense_report` (`id_expense_report`);

--
-- Indexes for table `payment_records`
--
ALTER TABLE `payment_records`
  ADD PRIMARY KEY (`id_payment_record`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_product`),
  ADD UNIQUE KEY `id_product` (`id_product`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- Indexes for table `stock_records`
--
ALTER TABLE `stock_records`
  ADD PRIMARY KEY (`id_stock_record`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `store_settings`
--
ALTER TABLE `store_settings`
  ADD PRIMARY KEY (`id_store_setting`),
  ADD UNIQUE KEY `id_store_setting` (`id_store_setting`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id_transaction`),
  ADD UNIQUE KEY `id_transaction` (`id_transaction`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`id_transaction_detail`),
  ADD UNIQUE KEY `id_transaction_detail` (`id_transaction_detail`),
  ADD UNIQUE KEY `UNIQUE_TRANSACTION_PRODUCT` (`transaction_id`,`product_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `transaction_id` (`transaction_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `id_user` (`id_user`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_category` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id_expense` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_reports`
--
ALTER TABLE `expense_reports`
  MODIFY `id_expense_report` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_records`
--
ALTER TABLE `payment_records`
  MODIFY `id_payment_record` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id_product` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stock_records`
--
ALTER TABLE `stock_records`
  MODIFY `id_stock_record` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `store_settings`
--
ALTER TABLE `store_settings`
  MODIFY `id_store_setting` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id_transaction` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `transaction_details`
--
ALTER TABLE `transaction_details`
  MODIFY `id_transaction_detail` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `payment_records`
--
ALTER TABLE `payment_records`
  ADD CONSTRAINT `payment_records_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id_transaction`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stock_records`
--
ALTER TABLE `stock_records`
  ADD CONSTRAINT `stock_records_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `stock_records_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id_product`),
  ADD CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id_transaction`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
