-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2024 at 10:16 PM
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
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `product_id`, `name`, `type`) VALUES
(1, 5, 'Size', 'text'),
(2, 6, 'Size', 'text'),
(3, 7, 'Color', 'swatch'),
(4, 7, 'Capacity', 'text'),
(5, 8, 'Color', 'swatch'),
(6, 8, 'Capacity', 'text'),
(7, 3, 'Capacity', 'text'),
(8, 3, 'With 3 USB ports', 'text'),
(9, 3, 'Touch ID keyboard', 'text'),
(10, 4, 'Color', 'swatch'),
(11, 4, 'Capacity', 'text');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_items`
--

CREATE TABLE `attribute_items` (
  `id` int(11) NOT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `display_value` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attribute_items`
--

INSERT INTO `attribute_items` (`id`, `attribute_id`, `display_value`, `value`) VALUES
(1, 1, '40', '40'),
(2, 1, '41', '41'),
(3, 1, '42', '42'),
(4, 1, '43', '43'),
(5, 2, 'Small', 'S'),
(6, 2, 'Medium', 'M'),
(7, 2, 'Large', 'L'),
(8, 2, 'Extra Large', 'XL'),
(9, 3, 'Green', '#44FF03'),
(10, 3, 'Cyan', '#03FFF7'),
(11, 3, 'Blue', '#030BFF'),
(12, 3, 'Black', '#000000'),
(13, 3, 'White', '#FFFFFF'),
(14, 4, '512G', '512G'),
(15, 4, '1T', '1T'),
(16, 5, 'Green', '#44FF03'),
(17, 5, 'Cyan', '#03FFF7'),
(18, 5, 'Blue', '#030BFF'),
(19, 5, 'Black', '#000000'),
(20, 5, 'White', '#FFFFFF'),
(21, 6, '512G', '512G'),
(22, 6, '1T', '1T'),
(23, 7, '256GB', '256GB'),
(24, 7, '512GB', '512GB'),
(25, 8, 'Yes', 'Yes'),
(26, 8, 'No', 'No'),
(27, 9, 'Yes', 'Yes'),
(28, 9, 'No', 'No'),
(29, 10, 'Green', '#44FF03'),
(30, 10, 'Cyan', '#03FFF7'),
(31, 10, 'Blue', '#030BFF'),
(32, 10, 'Black', '#000000'),
(33, 10, 'White', '#FFFFFF'),
(34, 11, '512G', '512G'),
(35, 11, '1T', '1T');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'all'),
(2, 'clothes'),
(3, 'tech');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `symbol` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `label`, `symbol`) VALUES
(1, 'USD', '$'),
(2, 'EURO', '€');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`products`)),
  `status` enum('pending','completed','cancelled') DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `products`, `status`, `total_price`, `order_date`) VALUES
(51, '\"[{\\\"id\\\":\\\"4\\\",\\\"product_id\\\":\\\"apple-iphone-12-pro\\\",\\\"name\\\":\\\"iPhone 12 Pro\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"#000000\\\",\\\"1T\\\"]}]\"', 'pending', 1000.76, '2024-11-19 18:03:41'),
(52, '\"[{\\\"id\\\":\\\"2\\\",\\\"product_id\\\":\\\"apple-airtag\\\",\\\"name\\\":\\\"AirTag\\\",\\\"quantity\\\":1,\\\"attributes\\\":[]},{\\\"id\\\":\\\"3\\\",\\\"product_id\\\":\\\"apple-imac-2021\\\",\\\"name\\\":\\\"iMac 2021\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"512GB\\\",\\\"Yes\\\",\\\"Yes\\\"]},{\\\"id\\\":\\\"4\\\",\\\"product_id\\\":\\\"apple-iphone-12-pro\\\",\\\"name\\\":\\\"iPhone 12 Pro\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"#000000\\\",\\\"1T\\\"]},{\\\"id\\\":\\\"5\\\",\\\"product_id\\\":\\\"huarache-x-stussy-le\\\",\\\"name\\\":\\\"Nike Air Huarache Le\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"43\\\"]},{\\\"id\\\":\\\"6\\\",\\\"product_id\\\":\\\"jacket-canada-goosee\\\",\\\"name\\\":\\\"Jacket\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"L\\\"]},{\\\"id\\\":\\\"7\\\",\\\"product_id\\\":\\\"ps-5\\\",\\\"name\\\":\\\"PlayStation 5\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"#FFFFFF\\\",\\\"1T\\\"]}]\"', 'pending', 4325.81, '2024-11-19 18:04:35'),
(53, '\"[{\\\"id\\\":\\\"2\\\",\\\"product_id\\\":\\\"apple-airtag\\\",\\\"name\\\":\\\"AirTag\\\",\\\"quantity\\\":3,\\\"attributes\\\":[]},{\\\"id\\\":\\\"5\\\",\\\"product_id\\\":\\\"huarache-x-stussy-le\\\",\\\"name\\\":\\\"Nike Air Huarache Le\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"43\\\"]},{\\\"id\\\":\\\"7\\\",\\\"product_id\\\":\\\"ps-5\\\",\\\"name\\\":\\\"PlayStation 5\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"#000000\\\",\\\"1T\\\"]}]\"', 'pending', 1377.42, '2024-11-19 18:14:41'),
(54, '\"[{\\\"id\\\":\\\"2\\\",\\\"product_id\\\":\\\"apple-airtag\\\",\\\"name\\\":\\\"AirTag\\\",\\\"quantity\\\":3,\\\"attributes\\\":[]},{\\\"id\\\":\\\"3\\\",\\\"product_id\\\":\\\"apple-imac-2021\\\",\\\"name\\\":\\\"iMac 2021\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"256GB\\\",\\\"Yes\\\",\\\"Yes\\\"]},{\\\"id\\\":\\\"4\\\",\\\"product_id\\\":\\\"apple-iphone-12-pro\\\",\\\"name\\\":\\\"iPhone 12 Pro\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"#44FF03\\\",\\\"1T\\\"]},{\\\"id\\\":\\\"6\\\",\\\"product_id\\\":\\\"jacket-canada-goosee\\\",\\\"name\\\":\\\"Jacket\\\",\\\"quantity\\\":1,\\\"attributes\\\":[\\\"L\\\"]}]\"', 'pending', 3596.24, '2024-11-19 18:18:44');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `currency_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `product_id`, `currency_id`, `amount`) VALUES
(1, 2, 1, 129.57),
(2, 1, 1, 300.23),
(3, 3, 1, 1688.30),
(4, 4, 1, 1000.76),
(5, 5, 1, 144.69),
(6, 6, 1, 518.47),
(7, 7, 1, 844.02),
(8, 8, 1, 333.99);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `in_stock` tinyint(1) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_id`, `name`, `in_stock`, `description`, `category_id`, `brand`) VALUES
(1, 'apple-airpods-pro', 'AirPods Pro', 0, ' <h3>Magic like you’ve never heard</h3> <p>AirPods Pro have been designed to deliver Active Noise Cancellation for immersive sound, Transparency mode so you can hear your surroundings, and a customizable fit for all-day comfort. Just like AirPods, AirPods Pro connect magically to your iPhone or Apple Watch. And they’re ready to use right out of the case. <h3>Active Noise Cancellation</h3> <p>Incredibly light noise-cancelling headphones, AirPods Pro block out your environment so you can focus on what you’re listening to. AirPods Pro use two microphones, an outward-facing microphone and an inward-facing microphone, to create superior noise cancellation. By continuously adapting to the geometry of your ear and the fit of the ear tips, Active Noise Cancellation silences the world to keep you fully tuned in to your music, podcasts, and calls. <h3>Transparency mode</h3> <p>Switch to Transparency mode and AirPods Pro let the outside sound in, allowing you to hear and connect to your surroundings. Outward- and inward-facing microphones enable AirPods Pro to undo the sound-isolating effect of the silicone tips so things sound and feel natural, like when you’re talking to people around you.</p> <h3>All-new design</h3> <p>AirPods Pro offer a more customizable fit with three sizes of flexible silicone tips to choose from. With an internal taper, they conform to the shape of your ear, securing your AirPods Pro in place and creating an exceptional seal for superior noise cancellation.</p> <h3>Amazing audio quality</h3> <p>A custom-built high-excursion, low-distortion driver delivers powerful bass. A superefficient high dynamic range amplifier produces pure, incredibly clear sound while also extending battery life. And Adaptive EQ automatically tunes music to suit the shape of your ear for a rich, consistent listening experience.</p> <h3>Even more magical</h3> <p>The Apple-designed H1 chip delivers incredibly low audio latency. A force sensor on the stem makes it easy to control music and calls and switch between Active Noise Cancellation and Transparency mode. Announce Messages with Siri gives you the option to have Siri read your messages through your AirPods. And with Audio Sharing, you and a friend can share the same audio stream on two sets of AirPods — so you can play a game, watch a movie, or listen to a song together.</p> ', 3, 'Apple'),
(2, 'apple-airtag', 'AirTag', 1, ' <h1>Lose your knack for losing things.</h1> <p>AirTag is an easy way to keep track of your stuff. Attach one to your keys, slip another one in your backpack. And just like that, they’re on your radar in the Find My app. AirTag has your back.</p> ', 3, 'Apple'),
(3, 'apple-imac-2021', 'iMac 2021', 1, 'The new iMac!', 3, 'Apple'),
(4, 'apple-iphone-12-pro', 'iPhone 12 Pro', 1, 'This is iPhone 12. Nothing else to say.', 3, 'Apple'),
(5, 'huarache-x-stussy-le', 'Nike Air Huarache Le', 1, '<p>Great sneakers for everyday use!</p>', 2, 'Nike x Stussy'),
(6, 'jacket-canada-goosee', 'Jacket', 1, '<p>Awesome winter jacket</p>', 2, 'Canada Goose'),
(7, 'ps-5', 'PlayStation 5', 1, '<p>A good gaming console. Plays games of PS4! Enjoy if you can buy it mwahahahaha</p>', 3, 'Sony'),
(8, 'xbox-series-s', 'Xbox Series S 512GB', 0, '<div> <ul> <li><span>Hardware-beschleunigtes Raytracing macht dein Spiel noch realistischer</span></li> <li><span>Spiele Games mit bis zu 120 Bilder pro Sekunde</span></li> <li><span>Minimiere Ladezeiten mit einer speziell entwickelten 512GB NVMe SSD und wechsle mit Quick Resume nahtlos zwischen mehreren Spielen.</span></li> <li><span>Xbox Smart Delivery stellt sicher, dass du die beste Version deines Spiels spielst, egal, auf welcher Konsole du spielst</span></li> <li><span>Spiele deine Xbox One-Spiele auf deiner Xbox Series S weiter. Deine Fortschritte, Erfolge und Freundesliste werden automatisch auf das neue System übertragen.</span></li> <li><span>Erwecke deine Spiele und Filme mit innovativem 3D Raumklang zum Leben</span></li> <li><span>Der brandneue Xbox Wireless Controller zeichnet sich durch höchste Präzision, eine neue Share-Taste und verbesserte Ergonomie aus</span></li> <li><span>Ultra-niedrige Latenz verbessert die Reaktionszeit von Controller zum Fernseher</span></li> <li><span>Verwende dein Xbox One-Gaming-Zubehör -einschließlich Controller, Headsets und mehr</span></li> <li><span>Erweitere deinen Speicher mit der Seagate 1 TB-Erweiterungskarte für Xbox Series X (separat erhältlich) und streame 4K-Videos von Disney+, Netflix, Amazon, Microsoft Movies &amp; TV und mehr</span></li> </ul> </div>', 3, 'Microsoft');

-- --------------------------------------------------------

--
-- Table structure for table `product_gallery`
--

CREATE TABLE `product_gallery` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_gallery`
--

INSERT INTO `product_gallery` (`id`, `product_id`, `image_url`) VALUES
(1, 5, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_2_720x.jpg?v=1612816087'),
(2, 5, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_1_720x.jpg?v=1612816087'),
(3, 5, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_3_720x.jpg?v=1612816087'),
(4, 5, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_5_720x.jpg?v=1612816087'),
(5, 5, 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/DD1381200_DEOA_4_720x.jpg?v=1612816087'),
(6, 6, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016105/product-image/2409L_61.jpg'),
(7, 6, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016107/product-image/2409L_61_a.jpg'),
(8, 6, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016108/product-image/2409L_61_b.jpg'),
(9, 6, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016109/product-image/2409L_61_c.jpg'),
(10, 6, 'https://images.canadagoose.com/image/upload/w_480,c_scale,f_auto,q_auto:best/v1576016110/product-image/2409L_61_d.jpg'),
(11, 6, 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058169/product-image/2409L_61_o.png'),
(12, 6, 'https://images.canadagoose.com/image/upload/w_1333,c_scale,f_auto,q_auto:best/v1634058159/product-image/2409L_61_p.png'),
(13, 7, 'https://images-na.ssl-images-amazon.com/images/I/510VSJ9mWDL._SL1262_.jpg'),
(14, 7, 'https://images-na.ssl-images-amazon.com/images/I/610%2B69ZsKCL._SL1500_.jpg'),
(15, 7, 'https://images-na.ssl-images-amazon.com/images/I/51iPoFwQT3L._SL1230_.jpg'),
(16, 7, 'https://images-na.ssl-images-amazon.com/images/I/61qbqFcvoNL._SL1500_.jpg'),
(17, 7, 'https://images-na.ssl-images-amazon.com/images/I/51HCjA3rqYL._SL1230_.jpg'),
(18, 8, 'https://images-na.ssl-images-amazon.com/images/I/71vPCX0bS-L._SL1500_.jpg'),
(19, 8, 'https://images-na.ssl-images-amazon.com/images/I/71q7JTbRTpL._SL1500_.jpg'),
(20, 8, 'https://images-na.ssl-images-amazon.com/images/I/71iQ4HGHtsL._SL1500_.jpg'),
(21, 8, 'https://images-na.ssl-images-amazon.com/images/I/61IYrCrBzxL._SL1500_.jpg'),
(22, 8, 'https://images-na.ssl-images-amazon.com/images/I/61RnXmpAmIL._SL1500_.jpg'),
(23, 3, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/imac-24-blue-selection-hero-202104?wid=904&hei=840&fmt=jpeg&qlt=80&.v=1617492405000'),
(24, 4, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-12-pro-family-hero?wid=940&hei=1112&fmt=jpeg&qlt=80&.v=1604021663000'),
(25, 1, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MWP22?wid=572&hei=572&fmt=jpeg&qlt=95&.v=1591634795000'),
(26, 2, 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airtag-double-select-202104?wid=445&hei=370&fmt=jpeg&qlt=95&.v=1617761672000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `attribute_items`
--
ALTER TABLE `attribute_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_id` (`attribute_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `attribute_items`
--
ALTER TABLE `attribute_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product_gallery`
--
ALTER TABLE `product_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attributes`
--
ALTER TABLE `attributes`
  ADD CONSTRAINT `attributes_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_items`
--
ALTER TABLE `attribute_items`
  ADD CONSTRAINT `attribute_items_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_gallery`
--
ALTER TABLE `product_gallery`
  ADD CONSTRAINT `product_gallery_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
