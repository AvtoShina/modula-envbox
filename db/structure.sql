--
-- Database: `modula_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `appeal`
--

CREATE TABLE `appeal` (
                          `id` int(11) NOT NULL,
                          `phone` varchar(31) NOT NULL DEFAULT '',
                          `email` varchar(31) NOT NULL DEFAULT '',
                          `name` varchar(127) NOT NULL,
                          `subject` varchar(127) NOT NULL DEFAULT '',
                          `text` text NOT NULL DEFAULT '',
                          `type` tinyint(4) NOT NULL DEFAULT 1,
                          `status` int(11) NOT NULL DEFAULT 1,
                          `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
                          `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
                              `id` int(10) UNSIGNED NOT NULL,
                              `name` varchar(191) DEFAULT NULL,
                              `slug` varchar(191) NOT NULL,
                              `content` text DEFAULT NULL,
                              `photo` varchar(191) DEFAULT NULL,
                              `created_at` timestamp NULL DEFAULT NULL,
                              `updated_at` timestamp NULL DEFAULT NULL,
                              `deleted_at` timestamp NULL DEFAULT NULL,
                              `parent_id` int(10) UNSIGNED DEFAULT NULL,
                              `description` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
                         `id` int(10) UNSIGNED NOT NULL,
                         `name` varchar(191) NOT NULL,
                         `slug` varchar(191) NOT NULL,
                         `content` text DEFAULT NULL,
                         `photo` varchar(191) DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `name` varchar(191) NOT NULL,
                            `slug` varchar(191) NOT NULL,
                            `code` varchar(63) NOT NULL DEFAULT '',
                            `price` int(11) DEFAULT 1500,
                            `content` text DEFAULT NULL,
                            `main_img` varchar(255) DEFAULT '',
                            `hero_img` varchar(255) NOT NULL DEFAULT '',
                            `created_at` timestamp NULL DEFAULT current_timestamp(),
                            `updated_at` timestamp NULL DEFAULT current_timestamp(),
                            `category_id` int(10) UNSIGNED DEFAULT NULL,
                            `status` smallint(6) NOT NULL DEFAULT 1,
                            `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
                            `video` varchar(191) DEFAULT NULL,
                            `deleted_at` timestamp NULL DEFAULT NULL,
                            `content_sub` varchar(255) DEFAULT NULL,
                            `content_description` text DEFAULT NULL,
                            `to_order` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_attachments`
--

CREATE TABLE `product_attachments` (
                                       `id` int(10) UNSIGNED NOT NULL,
                                       `product_id` int(10) UNSIGNED NOT NULL,
                                       `name` varchar(255) NOT NULL,
                                       `type` varchar(255) NOT NULL,
                                       `file` varchar(255) NOT NULL,
                                       `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
                                  `id` int(10) UNSIGNED NOT NULL,
                                  `product_id` int(10) UNSIGNED NOT NULL,
                                  `type` varchar(31) NOT NULL,
                                  `color` varchar(63) NOT NULL DEFAULT '',
                                  `url` varchar(191) NOT NULL,
                                  `image` varchar(191) DEFAULT NULL,
                                  `alt` varchar(191) DEFAULT NULL,
                                  `title` varchar(191) DEFAULT NULL,
                                  `position` smallint(6) NOT NULL DEFAULT 5,
                                  `created_at` timestamp NULL DEFAULT current_timestamp(),
                                  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_props`
--

CREATE TABLE `product_props` (
                                 `id` int(10) UNSIGNED NOT NULL,
                                 `product_id` int(10) UNSIGNED NOT NULL,
                                 `name` varchar(255) NOT NULL DEFAULT '',
                                 `value` varchar(255) NOT NULL,
                                 `section` varchar(255) NOT NULL DEFAULT 'general'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
                                      `id` int(10) UNSIGNED NOT NULL,
                                      `product_id` int(10) UNSIGNED NOT NULL,
                                      `name` varchar(255) NOT NULL,
                                      `code` varchar(63) NOT NULL,
                                      `price` int(11) DEFAULT 1500,
                                      `main_img` varchar(255) NOT NULL DEFAULT '',
                                      `excerpt` varchar(255) NOT NULL DEFAULT '',
                                      `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '{}' CHECK (json_valid(`details`)),
                                      `to_order` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variation_props`
--

CREATE TABLE `product_variation_props` (
                                           `id` int(10) UNSIGNED NOT NULL,
                                           `variation_id` int(10) UNSIGNED NOT NULL,
                                           `name` varchar(255) NOT NULL,
                                           `value` varchar(255) NOT NULL,
                                           `section` varchar(255) NOT NULL DEFAULT 'general'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
                            `id` int(10) UNSIGNED NOT NULL,
                            `key` varchar(191) DEFAULT NULL,
                            `title` varchar(191) DEFAULT NULL,
                            `value` varchar(191) DEFAULT NULL,
                            `section` varchar(191) DEFAULT NULL,
                            `text` text DEFAULT NULL,
                            `created_at` timestamp NULL DEFAULT current_timestamp(),
                            `updated_at` timestamp NULL DEFAULT current_timestamp(),
                            `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `id` int(10) UNSIGNED NOT NULL,
                         `name` varchar(191) NOT NULL,
                         `email` varchar(191) NOT NULL,
                         `password` varchar(191) NOT NULL,
                         `remember_token` varchar(191) DEFAULT NULL,
                         `created_at` timestamp NULL DEFAULT NULL,
                         `updated_at` timestamp NULL DEFAULT NULL,
                         `deleted_at` timestamp NULL DEFAULT NULL,
                         `role_id` int(10) UNSIGNED DEFAULT NULL,
                         `lang` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appeal`
--
ALTER TABLE `appeal`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
    ADD PRIMARY KEY (`id`),
  ADD KEY `120588_5a8a765cccb5f` (`parent_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
    ADD PRIMARY KEY (`id`),
  ADD KEY `pages_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
    ADD PRIMARY KEY (`id`),
  ADD KEY `120585_5a8a73d3a66cb` (`category_id`);

--
-- Indexes for table `product_attachments`
--
ALTER TABLE `product_attachments`
    ADD PRIMARY KEY (`id`),
  ADD KEY `product_attachments_FK_1` (`product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
    ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_props`
--
ALTER TABLE `product_props`
    ADD PRIMARY KEY (`id`),
  ADD KEY `product_props_FK_1` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
    ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_FK_1` (`product_id`);

--
-- Indexes for table `product_variation_props`
--
ALTER TABLE `product_variation_props`
    ADD PRIMARY KEY (`id`),
  ADD KEY `product_variation_props_FK_1` (`variation_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
    ADD PRIMARY KEY (`id`),
  ADD KEY `settings_deleted_at_index` (`deleted_at`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
    ADD PRIMARY KEY (`id`),
  ADD KEY `120575_5a8a6c76d50fa` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appeal`
--
ALTER TABLE `appeal`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_attachments`
--
ALTER TABLE `product_attachments`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_props`
--
ALTER TABLE `product_props`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variation_props`
--
ALTER TABLE `product_variation_props`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
    ADD CONSTRAINT `120588_5a8a765cccb5f` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
    ADD CONSTRAINT `120585_5a8a73d3a66cb` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attachments`
--
ALTER TABLE `product_attachments`
    ADD CONSTRAINT `product_attachments_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
    ADD CONSTRAINT `product_variations_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_variation_props`
--
ALTER TABLE `product_variation_props`
    ADD CONSTRAINT `product_variation_props_FK_1` FOREIGN KEY (`variation_id`) REFERENCES `product_variations` (`id`);
COMMIT;
