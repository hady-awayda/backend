-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 24, 2024 at 01:28 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `recipe-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `rating` int(1) DEFAULT NULL CHECK (`rating` >= 1 and `rating` <= 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `title`, `description`, `rating`, `created_at`, `updated_at`, `user_id`, `recipe_id`) VALUES
(1, 'Delicious!', 'This spaghetti bolognese was amazing!', 5, '2024-07-22 17:31:35', '2024-07-22 17:44:33', 1, 1),
(2, 'Too Spicy', 'The curry was too spicy for my taste.', 3, '2024-07-22 17:31:35', '2024-07-22 17:44:33', 1, 2),
(3, 'Very Healthy', 'Loved the vegetable stir fry, very healthy and tasty.', 4, '2024-07-22 17:31:35', '2024-07-23 22:19:03', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `recipe_id`, `created_at`) VALUES
(1, 1, 1, '2024-07-22 17:32:01'),
(2, 1, 2, '2024-07-22 17:32:01'),
(3, 1, 3, '2024-07-22 17:32:01'),
(4, 1, 6, '2024-07-22 17:34:05');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ingredients` text NOT NULL,
  `steps` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `name`, `ingredients`, `steps`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Spaghetti Bolognese', 'Spaghetti, Ground Beef, Tomato Sauce, Onion, Garlic, Olive Oil, Salt, Pepper', '1. Cook spaghetti. 2. Prepare sauce. 3. Combine and serve.', '2024-07-22 17:23:31', '2024-07-22 17:27:03', 1),
(2, 'Caesar Salad', 'Romaine Lettuce, Croutons, Parmesan Cheese, Caesar Dressing', '1. Chop lettuce. 2. Add croutons and cheese. 3. Toss with dressing.', '2024-07-22 17:26:46', '2024-07-22 17:27:50', 1),
(3, 'Chocolate Cake', 'Flour, Sugar, Cocoa Powder, Baking Powder, Eggs, Milk, Vegetable Oil, Vanilla Extract', '1. Preheat oven. 2. Mix ingredients. 3. Bake for 30 minutes.', '2024-07-22 17:26:46', '2024-07-22 17:27:11', 1),
(4, 'Spaghetti Bolognese', 'Spaghetti, Ground Beef, Tomato Sauce, Onion, Garlic, Olive Oil, Salt, Pepper', '1. Cook spaghetti. 2. Prepare sauce with ground beef and tomato sauce. 3. Mix and serve.', '2024-07-22 17:31:00', '2024-07-22 17:32:42', 1),
(5, 'Chicken Curry', 'Chicken, Curry Powder, Coconut Milk, Onion, Garlic, Ginger, Salt, Pepper', '1. Cook chicken. 2. Prepare curry sauce. 3. Mix and serve.', '2024-07-22 17:31:00', '2024-07-22 17:32:45', 1),
(6, 'Vegetable Stir Fry', 'Broccoli, Bell Pepper, Carrot, Soy Sauce, Garlic, Ginger, Olive Oil', '1. Stir fry vegetables. 2. Add soy sauce. 3. Serve.', '2024-07-22 17:31:00', '2024-07-22 17:32:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `recipe_tags`
--

CREATE TABLE `recipe_tags` (
  `id` int(11) NOT NULL,
  `recipe_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe_tags`
--

INSERT INTO `recipe_tags` (`id`, `recipe_id`, `tag_id`, `created_at`) VALUES
(1, 1, 1, '2024-07-22 17:42:36'),
(2, 2, 2, '2024-07-22 17:42:36'),
(3, 3, 3, '2024-07-22 17:42:36'),
(4, 3, 4, '2024-07-22 17:42:36'),
(5, 3, 5, '2024-07-22 17:42:36');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(2, 'Dessert'),
(3, 'Healthy'),
(6, 'Indian'),
(1, 'Italian'),
(4, 'Quick'),
(5, 'Vegetarian');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone_number`, `role`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'user@example.com', 'user1234', '1234567890', 'user', '2024-07-22 17:23:14', '2024-07-22 17:23:14'),
(2, 'Hady', 'hady@example.com', '$2y$10$8X1bGEBVdqrba3Gg.33f4u7.ifFWDBRr9alJP4LE.Z.EUwgnqnn8W', '9617694110', 'user', '2024-07-23 12:30:22', '2024-07-23 12:33:15'),
(3, 'Hady', 'hadi@example.com', '$2y$10$QYAP2xqiib7M99a3RFduPOqQxQCw/AQZh5slUTul2DHeYvej4acsW', '9617694111', 'user', '2024-07-23 12:34:53', '2024-07-23 12:34:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`recipe_id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recipe_id` (`recipe_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `favorites_ibfk_2` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`);

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `recipe_tags`
--
ALTER TABLE `recipe_tags`
  ADD CONSTRAINT `recipe_tags_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`),
  ADD CONSTRAINT `recipe_tags_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
