/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50739 (5.7.39)
 Source Host           : 127.0.0.1:3307
 Source Schema         : true-cloud-bagisto

 Target Server Type    : MySQL
 Target Server Version : 50739 (5.7.39)
 File Encoding         : 65001

 Date: 27/02/2026 19:18:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `address_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_address_id` int(10) unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) unsigned DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) unsigned DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `warehouse` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vat_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_customer_id_foreign` (`customer_id`),
  KEY `addresses_cart_id_foreign` (`cart_id`),
  KEY `addresses_order_id_foreign` (`order_id`),
  KEY `addresses_parent_address_id_foreign` (`parent_address_id`),
  CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of addresses
-- ----------------------------
BEGIN;
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (1, 'cart_billing', NULL, NULL, 2, NULL, 'Nikita', 'Miahkoy', NULL, '435345', '234234234324', 'Kremenchuk', 'Полтавська область', NULL, NULL, 'UA', '36900', '345345345@4234.com', '0978085640', '12345678910', 0, 1, NULL, '2025-09-12 13:41:39', '2025-09-12 13:41:39');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (2, 'cart_shipping', NULL, NULL, 2, NULL, 'Nikita', 'Miahkoy', NULL, '435345', '234234234324', 'Kremenchuk', 'Полтавська область', NULL, NULL, 'UA', '36900', '345345345@4234.com', '0978085640', NULL, 0, 0, NULL, '2025-09-12 13:41:39', '2025-09-12 13:41:39');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (3, 'order_shipping', NULL, NULL, NULL, 1, 'Nikita', 'Miahkoy', NULL, '435345', '234234234324', 'Kremenchuk', 'Полтавська область', NULL, NULL, 'UA', '36900', '345345345@4234.com', '0978085640', NULL, 0, 0, NULL, '2025-09-12 13:41:51', '2025-09-12 13:41:51');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (4, 'order_billing', NULL, NULL, NULL, 1, 'Nikita', 'Miahkoy', NULL, '435345', '234234234324', 'Kremenchuk', 'Полтавська область', NULL, NULL, 'UA', '36900', '345345345@4234.com', '0978085640', '12345678910', 0, 0, NULL, '2025-09-12 13:41:51', '2025-09-12 13:41:51');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (5, 'cart_billing', NULL, NULL, 6, NULL, 'Nikita', 'Miahkoy', NULL, '435345', '5345345', '87dec947-c41f-11ed-a361-48df37b92096', 'Винницкая', '71508129-9b87-11de-822f-000c2965ae0e', '919aa970-c717-11ed-9eb1-d4f5ef0df2b8', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-13 00:24:38', '2025-09-13 03:18:22');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (6, 'cart_shipping', NULL, NULL, 6, NULL, 'Nikita', 'Miahkoy', NULL, '435345', '5345345', '87dec947-c41f-11ed-a361-48df37b92096', 'Винницкая', '71508129-9b87-11de-822f-000c2965ae0e', '919aa970-c717-11ed-9eb1-d4f5ef0df2b8', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-13 00:24:38', '2025-09-13 03:18:22');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (7, 'order_shipping', NULL, NULL, NULL, 2, 'Nikita', 'Miahkoy', NULL, '435345', '', '87dec947-c41f-11ed-a361-48df37b92096', 'Винницкая', NULL, NULL, 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-13 03:18:31', '2025-09-13 03:18:31');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (8, 'order_billing', NULL, NULL, NULL, 2, 'Nikita', 'Miahkoy', NULL, '435345', '', '87dec947-c41f-11ed-a361-48df37b92096', 'Винницкая', NULL, NULL, 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-13 03:18:31', '2025-09-13 03:18:31');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (9, 'cart_billing', NULL, NULL, 7, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Баковцы', 'Волынская', 'Волынская', 'Пункт приема – выдачи (до 30 кг), ул. Красного Креста 1', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-13 03:50:56', '2025-09-13 03:56:04');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (10, 'cart_shipping', NULL, NULL, 7, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Баковцы', 'Волынская', 'Волынская', 'Пункт приема – выдачи (до 30 кг), ул. Красного Креста 1', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-13 03:50:56', '2025-09-13 03:56:04');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (11, 'order_shipping', NULL, NULL, NULL, 3, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Баковцы', 'Волынская', NULL, NULL, 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-13 04:04:36', '2025-09-13 04:04:36');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (12, 'order_billing', NULL, NULL, NULL, 3, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Баковцы', 'Волынская', NULL, NULL, 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-13 04:04:36', '2025-09-13 04:04:36');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (13, 'cart_billing', NULL, NULL, 10, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', 'Полтавская', 'Почтомат \"Новая Пошта\" №3561: просп. Леси Украинки, 13а (маг. МаркетОпт)', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-14 19:15:00', '2025-09-14 19:15:00');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (14, 'cart_shipping', NULL, NULL, 10, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', 'Полтавская', 'Почтомат \"Новая Пошта\" №3561: просп. Леси Украинки, 13а (маг. МаркетОпт)', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:15:00', '2025-09-14 19:15:00');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (15, 'order_shipping', NULL, NULL, NULL, 4, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', NULL, NULL, 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:15:05', '2025-09-14 19:15:05');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (16, 'order_billing', NULL, NULL, NULL, 4, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', NULL, NULL, 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:15:05', '2025-09-14 19:15:05');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (17, 'cart_billing', NULL, NULL, 11, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Артищев', 'Львовская', 'Львовская', 'Пункт приема – выдачи (до 30 кг), ул. Главная, 1', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-14 19:21:00', '2025-09-14 19:21:00');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (18, 'cart_shipping', NULL, NULL, 11, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Артищев', 'Львовская', 'Львовская', 'Пункт приема – выдачи (до 30 кг), ул. Главная, 1', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:21:00', '2025-09-14 19:21:00');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (19, 'order_shipping', NULL, NULL, NULL, 5, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Артищев', 'Львовская', 'Львовская', 'Пункт приема – выдачи (до 30 кг), ул. Главная, 1', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:21:04', '2025-09-14 19:21:04');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (20, 'order_billing', NULL, NULL, NULL, 5, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Артищев', 'Львовская', 'Львовская', 'Пункт приема – выдачи (до 30 кг), ул. Главная, 1', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:21:04', '2025-09-14 19:21:04');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (21, 'cart_billing', NULL, NULL, 12, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бахив', 'Волынская', 'Волынская', 'Пункт приема-выдачи (до 30 кг): вул. Молодежная, 8', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-14 19:24:52', '2025-09-14 19:24:52');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (22, 'cart_shipping', NULL, NULL, 12, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бахив', 'Волынская', 'Волынская', 'Пункт приема-выдачи (до 30 кг): вул. Молодежная, 8', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:24:52', '2025-09-14 19:24:52');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (23, 'order_shipping', NULL, NULL, NULL, 6, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бахив', 'Волынская', 'Волынская', 'Пункт приема-выдачи (до 30 кг): вул. Молодежная, 8', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:24:57', '2025-09-14 19:24:57');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (24, 'order_billing', NULL, NULL, NULL, 6, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бахив', 'Волынская', 'Волынская', 'Пункт приема-выдачи (до 30 кг): вул. Молодежная, 8', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:24:57', '2025-09-14 19:24:57');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (25, 'cart_billing', NULL, NULL, 13, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бортники', 'Винницкая', 'Винницкая', 'Мобильное отделение №1 (до 30 кг), ул. Ленина, 64 (АМ 6804 АМ)', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-14 19:26:48', '2025-09-14 19:26:48');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (26, 'cart_shipping', NULL, NULL, 13, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бортники', 'Винницкая', 'Винницкая', 'Мобильное отделение №1 (до 30 кг), ул. Ленина, 64 (АМ 6804 АМ)', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:26:48', '2025-09-14 19:26:48');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (27, 'order_shipping', NULL, NULL, NULL, 7, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бортники', 'Винницкая', 'Винницкая', 'Мобильное отделение №1 (до 30 кг), ул. Ленина, 64 (АМ 6804 АМ)', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:26:54', '2025-09-14 19:26:54');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (28, 'order_billing', NULL, NULL, NULL, 7, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бортники', 'Винницкая', 'Винницкая', 'Мобильное отделение №1 (до 30 кг), ул. Ленина, 64 (АМ 6804 АМ)', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:26:54', '2025-09-14 19:26:54');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (29, 'cart_billing', NULL, NULL, 14, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Грузское (Кролевецкий р-н)', 'Сумская', 'Сумская', 'Мобильное отделение №1 (до 30 кг), ул. Победы, 12', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-14 19:57:40', '2025-09-14 19:57:40');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (30, 'cart_shipping', NULL, NULL, 14, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Грузское (Кролевецкий р-н)', 'Сумская', 'Сумская', 'Мобильное отделение №1 (до 30 кг), ул. Победы, 12', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:57:40', '2025-09-14 19:57:40');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (31, 'order_shipping', NULL, NULL, NULL, 8, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Грузское (Кролевецкий р-н)', 'Сумская', 'Сумская', 'Мобильное отделение №1 (до 30 кг), ул. Победы, 12', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:57:44', '2025-09-14 19:57:44');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (32, 'order_billing', NULL, NULL, NULL, 8, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Грузское (Кролевецкий р-н)', 'Сумская', 'Сумская', 'Мобильное отделение №1 (до 30 кг), ул. Победы, 12', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 19:57:44', '2025-09-14 19:57:44');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (33, 'cart_billing', NULL, NULL, 16, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бритавка', 'Винницкая', 'Винницкая', 'Пункт приема-выдачи (до 30 кг): ул. Мира, 68', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-14 21:07:31', '2025-09-14 22:01:39');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (34, 'cart_shipping', NULL, NULL, 16, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бритавка', 'Винницкая', 'Винницкая', 'Пункт приема-выдачи (до 30 кг): ул. Мира, 68', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 21:07:31', '2025-09-14 22:01:39');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (35, 'order_shipping', NULL, NULL, NULL, 9, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бритавка', 'Винницкая', 'Винницкая', 'Пункт приема-выдачи (до 30 кг): ул. Мира, 68', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 22:11:22', '2025-09-14 22:11:22');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (36, 'order_billing', NULL, NULL, NULL, 9, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Бритавка', 'Винницкая', 'Винницкая', 'Пункт приема-выдачи (до 30 кг): ул. Мира, 68', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 22:11:22', '2025-09-14 22:11:22');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (37, 'cart_billing', NULL, NULL, 17, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Плавье', 'Львовская', 'Львовская', 'Пункт приема-выдачи (до 30 кг): ул. Бриновка, 38', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-14 23:08:42', '2025-09-14 23:08:42');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (38, 'cart_shipping', NULL, NULL, 17, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Плавье', 'Львовская', 'Львовская', 'Пункт приема-выдачи (до 30 кг): ул. Бриновка, 38', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 23:08:42', '2025-09-14 23:08:42');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (39, 'order_shipping', NULL, NULL, NULL, 10, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Плавье', 'Львовская', 'Львовская', 'Пункт приема-выдачи (до 30 кг): ул. Бриновка, 38', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 23:08:46', '2025-09-14 23:08:46');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (40, 'order_billing', NULL, NULL, NULL, 10, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Плавье', 'Львовская', 'Львовская', 'Пункт приема-выдачи (до 30 кг): ул. Бриновка, 38', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-14 23:08:46', '2025-09-14 23:08:46');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (41, 'customer', NULL, 2, NULL, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Абранка', 'Закарпатская', 'Полтавская', 'Отделение №9 (до 30 кг на одно место ): ул. Тараса Бульбы, 12', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-19 01:50:16', '2025-09-19 03:13:37');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (42, 'cart_billing', NULL, NULL, 19, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Агрономичное', 'Винницкая', 'Винницкая', 'Отделение №1: ул. Мичурина, 2а', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-19 02:59:42', '2025-09-19 02:59:42');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (43, 'cart_shipping', NULL, NULL, 19, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Агрономичное', 'Винницкая', 'Винницкая', 'Отделение №1: ул. Мичурина, 2а', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-19 02:59:42', '2025-09-19 02:59:42');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (44, 'order_shipping', NULL, NULL, NULL, 11, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Агрономичное', 'Винницкая', 'Винницкая', 'Отделение №1: ул. Мичурина, 2а', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-19 03:00:02', '2025-09-19 03:00:02');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (45, 'order_billing', NULL, NULL, NULL, 11, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Агрономичное', 'Винницкая', 'Винницкая', 'Отделение №1: ул. Мичурина, 2а', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-19 03:00:02', '2025-09-19 03:00:02');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (46, 'cart_billing', 41, 2, 18, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', 'Полтавская', 'Отделение №1: ул. Флотская, 2', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 1, NULL, '2025-09-19 03:00:33', '2025-09-19 03:00:33');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (47, 'cart_shipping', 41, 2, 18, NULL, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', 'Полтавская', 'Отделение №1: ул. Флотская, 2', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-19 03:00:33', '2025-09-19 03:00:33');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (48, 'order_shipping', NULL, NULL, NULL, 12, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', 'Полтавская', 'Отделение №1: ул. Флотская, 2', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-19 03:01:03', '2025-09-19 03:01:03');
INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `area`, `warehouse`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES (49, 'order_billing', NULL, NULL, NULL, 12, 'Nikita', 'Miahkoy', NULL, NULL, '', 'Кременчуг', 'Полтавская', 'Полтавская', 'Отделение №1: ул. Флотская, 2', 'UA', '36900', 'niksgreek@gmail.com', '0978085640', NULL, 0, 0, NULL, '2025-09-19 03:01:03', '2025-09-19 03:01:03');
COMMIT;

-- ----------------------------
-- Table structure for admin_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE `admin_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admin_password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `role_id` int(10) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_email_unique` (`email`),
  UNIQUE KEY `admins_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
BEGIN;
INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES (1, 'Admin', 'niksgreek@gmail.com', '$2y$12$F2osjZEG8/0XYoGmMW8EHOAFMAtWZl3LvEneOGKzvm3sGih01ougC', 'fyMvWxaeDeKrO9k6pnHBMdKjqbAKjkzJnTb5J7rfFAvrrC7ZeK0ktHBMn4NVyGTemGrtRUssE4crtQ9j', 1, 1, NULL, NULL, '2025-09-11 03:20:53', '2025-09-11 03:21:40');
COMMIT;

-- ----------------------------
-- Table structure for attribute_families
-- ----------------------------
DROP TABLE IF EXISTS `attribute_families`;
CREATE TABLE `attribute_families` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_families
-- ----------------------------
BEGIN;
INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES (1, 'default', 'За замовчуванням', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for attribute_group_mappings
-- ----------------------------
DROP TABLE IF EXISTS `attribute_group_mappings`;
CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_group_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`),
  CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_group_mappings
-- ----------------------------
BEGIN;
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (1, 1, 1);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (2, 1, 3);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (3, 1, 4);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (4, 1, 5);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (5, 6, 1);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (6, 6, 2);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (7, 6, 3);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (8, 6, 4);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (9, 2, 1);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (10, 2, 2);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (11, 4, 1);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (12, 4, 2);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (13, 4, 3);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (14, 4, 4);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (15, 4, 5);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (16, 3, 1);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (17, 3, 2);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (18, 3, 3);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (19, 5, 1);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (20, 5, 2);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (21, 5, 3);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (22, 5, 4);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (23, 1, 6);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (24, 1, 7);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (25, 1, 8);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (26, 6, 5);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (27, 1, 2);
INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES (28, 7, 1);
COMMIT;

-- ----------------------------
-- Table structure for attribute_groups
-- ----------------------------
DROP TABLE IF EXISTS `attribute_groups`;
CREATE TABLE `attribute_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column` int(11) NOT NULL DEFAULT '1',
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`),
  CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_groups
-- ----------------------------
BEGIN;
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES (1, 'general', 1, 'Загальні', 1, 1, 0);
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES (2, 'description', 1, 'Опис', 1, 2, 0);
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES (3, 'meta_description', 1, 'Мета-опис', 1, 3, 0);
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES (4, 'price', 1, 'Ціна', 2, 1, 0);
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES (5, 'shipping', 1, 'Доставка', 2, 2, 0);
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES (6, 'settings', 1, 'Налаштування', 2, 3, 0);
INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES (7, 'inventories', 1, 'Запаси', 2, 4, 0);
COMMIT;

-- ----------------------------
-- Table structure for attribute_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_option_translations`;
CREATE TABLE `attribute_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_option_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_option_locale_unique` (`attribute_option_id`,`locale`),
  CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_option_translations
-- ----------------------------
BEGIN;
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (1, 1, 'uk', 'Червоний');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (2, 2, 'uk', 'Зелений');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (3, 3, 'uk', 'Жовтий');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (4, 4, 'uk', 'Чорний');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (5, 5, 'uk', 'Білий');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (6, 6, 'uk', 'S');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (7, 7, 'uk', 'M');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (8, 8, 'uk', 'L');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (9, 9, 'uk', 'XL');
INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES (10, 10, 'uk', 'чері');
COMMIT;

-- ----------------------------
-- Table structure for attribute_options
-- ----------------------------
DROP TABLE IF EXISTS `attribute_options`;
CREATE TABLE `attribute_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `swatch_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_options_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_options
-- ----------------------------
BEGIN;
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (1, 23, 'Червоний', 0, '#ed1212');
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (2, 23, 'Зелений', 1, '#1abc42');
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (3, 23, 'Жовтий', 2, '');
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (4, 23, 'Чорний', 3, '');
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (5, 23, 'Білий', 4, '');
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (6, 24, 'S', 1, NULL);
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (7, 24, 'M', 2, NULL);
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (8, 24, 'L', 3, NULL);
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (9, 24, 'XL', 4, NULL);
INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES (10, 25, 'чері', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for attribute_translations
-- ----------------------------
DROP TABLE IF EXISTS `attribute_translations`;
CREATE TABLE `attribute_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`),
  CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attribute_translations
-- ----------------------------
BEGIN;
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (1, 1, 'uk', 'Артикул');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (2, 2, 'uk', 'Назва');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (3, 3, 'uk', 'URL-ключ');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (4, 4, 'uk', 'Категорія податків');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (5, 5, 'uk', 'Новинка');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (6, 6, 'uk', 'Рекомендовані');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (7, 7, 'uk', 'Видимий окремо');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (8, 8, 'uk', 'Статус');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (9, 9, 'uk', 'Короткий опис');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (10, 10, 'uk', 'Опис');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (11, 11, 'uk', 'Ціна');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (12, 12, 'uk', 'Вартість');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (13, 13, 'uk', 'Спеціальна ціна');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (14, 14, 'uk', 'Спеціальна ціна від');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (15, 15, 'uk', 'Спеціальна ціна до');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (16, 16, 'uk', 'Мета-заголовок');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (17, 17, 'uk', 'Мета-ключові слова');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (18, 18, 'uk', 'Мета-опис');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (19, 19, 'uk', 'Довжина');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (20, 20, 'uk', 'Ширина');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (21, 21, 'uk', 'Висота');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (22, 22, 'uk', 'Вага');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (23, 23, 'uk', 'Колір');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (24, 24, 'uk', 'Розмір');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (25, 25, 'uk', 'Бренд');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (26, 26, 'uk', 'Гостьова покупка');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (27, 27, 'uk', 'Номер продукту');
INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES (28, 28, 'uk', 'Управління запасами');
COMMIT;

-- ----------------------------
-- Table structure for attributes
-- ----------------------------
DROP TABLE IF EXISTS `attributes`;
CREATE TABLE `attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `swatch_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '0',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0',
  `is_filterable` tinyint(1) NOT NULL DEFAULT '0',
  `is_comparable` tinyint(1) NOT NULL DEFAULT '0',
  `is_configurable` tinyint(1) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_locale` tinyint(1) NOT NULL DEFAULT '0',
  `value_per_channel` tinyint(1) NOT NULL DEFAULT '0',
  `default_value` int(11) DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attributes_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of attributes
-- ----------------------------
BEGIN;
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (1, 'sku', 'Артикул', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (2, 'name', 'Назва', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (3, 'url_key', 'URL-ключ', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (4, 'tax_category_id', 'Категорія податків', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (5, 'new', 'Новинка', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (6, 'featured', 'Рекомендовані', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (7, 'visible_individually', 'Видимий окремо', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (8, 'status', 'Статус', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (9, 'short_description', 'Короткий опис', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (10, 'description', 'Опис', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (11, 'price', 'Ціна', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (12, 'cost', 'Вартість', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (13, 'special_price', 'Спеціальна ціна', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (14, 'special_price_from', 'Спеціальна ціна від', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (15, 'special_price_to', 'Спеціальна ціна до', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (16, 'meta_title', 'Мета-заголовок', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (17, 'meta_keywords', 'Мета-ключові слова', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (18, 'meta_description', 'Мета-опис', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (19, 'length', 'Довжина', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (20, 'width', 'Ширина', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (21, 'height', 'Висота', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (22, 'weight', 'Вага', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (23, 'color', 'Колір', 'select', 'color', NULL, NULL, 26, 0, 0, 1, 1, 1, 1, 1, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-12 14:26:31');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (24, 'size', 'Розмір', 'select', NULL, NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (25, 'brand', 'Бренд', 'select', 'dropdown', NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-12 14:26:21');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (26, 'guest_checkout', 'Гостьова покупка', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (27, 'product_number', 'Номер продукту', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES (28, 'manage_stock', 'Управління запасами', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
COMMIT;

-- ----------------------------
-- Table structure for booking_product_appointment_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_appointment_slots`;
CREATE TABLE `booking_product_appointment_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int(10) unsigned NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of booking_product_appointment_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_default_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_default_slots`;
CREATE TABLE `booking_product_default_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int(10) unsigned NOT NULL,
  `booking_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of booking_product_default_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_event_ticket_translations
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_event_ticket_translations`;
CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_event_ticket_id` bigint(20) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bpet_locale_unique` (`booking_product_event_ticket_id`,`locale`),
  CONSTRAINT `bpet_translations_fk` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of booking_product_event_ticket_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_event_tickets
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_event_tickets`;
CREATE TABLE `booking_product_event_tickets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int(10) unsigned NOT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `qty` int(11) DEFAULT '0',
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of booking_product_event_tickets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_rental_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_rental_slots`;
CREATE TABLE `booking_product_rental_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int(10) unsigned NOT NULL,
  `renting_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_price` decimal(12,4) DEFAULT '0.0000',
  `hourly_price` decimal(12,4) DEFAULT '0.0000',
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of booking_product_rental_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_product_table_slots
-- ----------------------------
DROP TABLE IF EXISTS `booking_product_table_slots`;
CREATE TABLE `booking_product_table_slots` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `booking_product_id` int(10) unsigned NOT NULL,
  `price_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guest_limit` int(11) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL,
  `break_time` int(11) NOT NULL,
  `prevent_scheduling_before` int(11) NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`),
  CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of booking_product_table_slots
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for booking_products
-- ----------------------------
DROP TABLE IF EXISTS `booking_products`;
CREATE TABLE `booking_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qty` int(11) DEFAULT '0',
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT '0',
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_products_product_id_foreign` (`product_id`),
  CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of booking_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `qty` int(11) DEFAULT '0',
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `booking_product_event_ticket_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_order_item_id_foreign` (`order_item_id`),
  KEY `bookings_booking_product_event_ticket_id_foreign` (`booking_product_event_ticket_id`),
  KEY `bookings_order_id_foreign` (`order_id`),
  KEY `bookings_product_id_foreign` (`product_id`),
  CONSTRAINT `bookings_booking_product_event_ticket_id_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of bookings
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `tax_total` decimal(12,4) DEFAULT '0.0000',
  `base_tax_total` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `checkout_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_customer_id_foreign` (`customer_id`),
  KEY `cart_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart
-- ----------------------------
BEGIN;
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (1, 'example@example.com', 'Микита', 'Мягкой', NULL, NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 0, 1, NULL, 1, 1, '2025-09-12 00:48:43', '2025-09-13 14:07:49');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (2, '345345345@4234.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 299.0000, 299.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-12 13:39:04', '2025-09-12 13:41:55');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (3, NULL, NULL, NULL, NULL, NULL, 0, 1, 5.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 50.0000, 50.0000, 50.0000, 50.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 50.0000, 50.0000, NULL, 1, 1, NULL, NULL, 1, '2025-09-12 13:46:41', '2025-09-12 16:46:23');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (4, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 1, 1, NULL, NULL, 1, '2025-09-12 21:53:20', '2025-09-12 21:53:20');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (6, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 787.0000, 787.0000, 777.0000, 777.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 777.0000, 777.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-13 00:02:52', '2025-09-13 03:18:34');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (7, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 299.0000, 299.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-13 03:20:16', '2025-09-13 04:04:39');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (8, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, NULL, 1, 1, NULL, NULL, 1, '2025-09-13 04:09:46', '2025-09-13 04:16:15');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (9, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, NULL, 1, 1, NULL, NULL, 1, '2025-09-14 19:14:12', '2025-09-14 19:14:12');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (10, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-14 19:14:28', '2025-09-14 19:15:08');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (11, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-14 19:20:41', '2025-09-14 19:21:08');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (12, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-14 19:24:37', '2025-09-14 19:25:00');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (13, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-14 19:26:33', '2025-09-14 19:26:57');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (14, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-14 19:57:20', '2025-09-14 19:57:49');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (15, NULL, NULL, NULL, NULL, NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 1, 1, NULL, NULL, 1, '2025-09-14 21:06:55', '2025-09-14 21:06:55');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (16, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 299.0000, 299.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-14 21:07:06', '2025-09-14 22:11:28');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (17, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 110.0000, 110.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 100.0000, 100.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-14 23:08:00', '2025-09-14 23:08:51');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (18, 'niksgreek@gmail.com', 'Микита', 'Мягкой', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 299.0000, 299.0000, NULL, 0, 0, NULL, 2, 1, '2025-09-16 23:34:00', '2025-09-19 03:01:07');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (19, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 299.0000, 299.0000, NULL, 1, 0, NULL, NULL, 1, '2025-09-19 01:56:11', '2025-09-19 03:00:06');
INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES (20, 'niksgreek@gmail.com', 'Микита', 'Мягкой', NULL, NULL, 0, 1, 1.0000, NULL, 'UAH', 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 0, 1, NULL, 2, 1, '2025-09-19 03:06:08', '2025-09-19 03:13:51');
COMMIT;

-- ----------------------------
-- Table structure for cart_item_inventories
-- ----------------------------
DROP TABLE IF EXISTS `cart_item_inventories`;
CREATE TABLE `cart_item_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(10) unsigned NOT NULL DEFAULT '0',
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `cart_item_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_item_inventories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL DEFAULT '0',
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price` decimal(12,4) NOT NULL DEFAULT '1.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `cart_id` int(10) unsigned NOT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_items_parent_id_foreign` (`parent_id`),
  KEY `cart_items_product_id_foreign` (`product_id`),
  KEY `cart_items_cart_id_foreign` (`cart_id`),
  KEY `cart_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_items
-- ----------------------------
BEGIN;
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (1, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 1, NULL, NULL, '{\"cart_id\": 1, \"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"11\"}', '2025-09-12 00:48:44', '2025-09-13 14:07:01');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (2, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 2, NULL, NULL, '{\"cart_id\": 2, \"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"11\"}', '2025-09-12 13:39:04', '2025-09-12 13:39:04');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (3, 5, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 385.0000, 385.0000, 10.0000, 10.0000, NULL, 50.0000, 50.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 50.0000, 50.0000, NULL, NULL, 11, 3, NULL, NULL, '{\"cart_id\": 3, \"quantity\": 5, \"is_buy_now\": \"0\", \"product_id\": \"11\"}', '2025-09-12 13:46:41', '2025-09-12 13:46:57');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (4, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 4, NULL, NULL, '{\"cart_id\": 4, \"quantity\": 1, \"product_id\": 11}', '2025-09-12 21:53:20', '2025-09-12 21:53:20');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (5, 1, 'SP-0010', 'configurable', 'gfegerg', NULL, 6.0000, 6.0000, 6.0000, 777.0000, 777.0000, NULL, 777.0000, 777.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 777.0000, 777.0000, 777.0000, 777.0000, NULL, NULL, 12, 6, NULL, NULL, '{\"cart_id\": 6, \"quantity\": 1, \"attributes\": {\"size\": {\"option_id\": 6, \"option_label\": \"S\", \"attribute_name\": \"Розмір\"}, \"color\": {\"option_id\": 2, \"option_label\": \"Зелений\", \"attribute_name\": \"Колір\"}}, \"is_buy_now\": \"0\", \"product_id\": \"12\", \"super_attribute\": {\"23\": \"2\", \"24\": \"6\"}, \"selected_configurable_option\": \"14\"}', '2025-09-13 00:02:53', '2025-09-13 00:02:53');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (6, 0, 'SP-0010-variant-2-6', 'simple', 'Variant 2 6', NULL, 0.0000, 0.0000, 0.0000, 1.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 5, 14, 6, NULL, NULL, '{\"parent_id\": 12, \"product_id\": 14}', '2025-09-13 00:02:53', '2025-09-13 00:02:53');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (7, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 7, NULL, NULL, '{\"cart_id\": 7, \"quantity\": 1, \"product_id\": 11}', '2025-09-13 03:20:16', '2025-09-13 03:20:16');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (8, 1, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 10.0000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 9, 8, NULL, NULL, '{\"cart_id\": 8, \"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"9\"}', '2025-09-13 04:09:46', '2025-09-13 04:09:46');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (9, 1, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 10.0000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 9, 9, NULL, NULL, '{\"cart_id\": 9, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 19:14:12', '2025-09-14 19:14:12');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (10, 1, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 10.0000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 9, 10, NULL, NULL, '{\"cart_id\": 10, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 19:14:28', '2025-09-14 19:14:28');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (11, 1, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 10.0000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 9, 11, NULL, NULL, '{\"cart_id\": 11, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 19:20:41', '2025-09-14 19:20:41');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (12, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 12, NULL, NULL, '{\"cart_id\": 12, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:24:37', '2025-09-14 19:24:37');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (13, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 13, NULL, NULL, '{\"cart_id\": 13, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:26:33', '2025-09-14 19:26:33');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (14, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 14, NULL, NULL, '{\"cart_id\": 14, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:57:20', '2025-09-14 19:57:20');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (15, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 15, NULL, NULL, '{\"cart_id\": 15, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 21:06:55', '2025-09-14 21:06:55');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (16, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 16, NULL, NULL, '{\"cart_id\": 16, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 21:07:06', '2025-09-14 21:07:06');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (17, 1, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 10.0000, 100.0000, 100.0000, NULL, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, NULL, NULL, 9, 17, NULL, NULL, '{\"cart_id\": 17, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 23:08:00', '2025-09-14 23:08:00');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (18, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 18, NULL, NULL, '{\"cart_id\": 18, \"quantity\": 1, \"product_id\": 11}', '2025-09-16 23:34:00', '2025-09-16 23:34:00');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (19, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 19, NULL, NULL, '{\"cart_id\": 19, \"quantity\": 1, \"product_id\": 11}', '2025-09-19 01:56:11', '2025-09-19 01:56:11');
INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES (20, 1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 77.0000, 299.0000, 299.0000, NULL, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, NULL, NULL, 11, 20, NULL, NULL, '{\"cart_id\": 20, \"quantity\": 1, \"product_id\": 11}', '2025-09-19 03:06:08', '2025-09-19 03:06:08');
COMMIT;

-- ----------------------------
-- Table structure for cart_payment
-- ----------------------------
DROP TABLE IF EXISTS `cart_payment`;
CREATE TABLE `cart_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_payment_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_payment
-- ----------------------------
BEGIN;
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (3, 'moneytransfer', 'Money Transfer', 2, '2025-09-12 13:41:50', '2025-09-12 13:41:50');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (6, 'cashondelivery', 'Cash On Delivery', 6, '2025-09-13 03:18:30', '2025-09-13 03:18:30');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (7, 'cashondelivery', 'Cash On Delivery', 7, '2025-09-13 04:04:35', '2025-09-13 04:04:35');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (8, 'cashondelivery', 'Cash On Delivery', 10, '2025-09-14 19:15:03', '2025-09-14 19:15:03');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (9, 'cashondelivery', 'Cash On Delivery', 11, '2025-09-14 19:21:03', '2025-09-14 19:21:03');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (10, 'cashondelivery', 'Cash On Delivery', 12, '2025-09-14 19:24:56', '2025-09-14 19:24:56');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (11, 'cashondelivery', 'Cash On Delivery', 13, '2025-09-14 19:26:52', '2025-09-14 19:26:52');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (12, 'cashondelivery', 'Cash On Delivery', 14, '2025-09-14 19:57:43', '2025-09-14 19:57:43');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (23, 'cashondelivery', 'Cash On Delivery', 16, '2025-09-14 22:01:43', '2025-09-14 22:01:43');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (24, 'cashondelivery', 'Накладений платіж', 17, '2025-09-14 23:08:44', '2025-09-14 23:08:44');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (25, 'cashondelivery', 'Накладений платіж', 19, '2025-09-19 02:59:55', '2025-09-19 02:59:55');
INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES (27, 'cashondelivery', 'Накладений платіж', 18, '2025-09-19 03:01:00', '2025-09-19 03:01:00');
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_channels
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_channels`;
CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`channel_id`),
  KEY `cart_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_rule_channels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_coupon_usage
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_coupon_usage`;
CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` int(11) NOT NULL DEFAULT '0',
  `cart_rule_coupon_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_rule_coupon_usage
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_coupons
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_coupons`;
CREATE TABLE `cart_rule_coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usage_limit` int(10) unsigned NOT NULL DEFAULT '0',
  `usage_per_customer` int(10) unsigned NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `type` int(10) unsigned NOT NULL DEFAULT '0',
  `is_primary` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`),
  CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_rule_coupons
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_customer_groups`;
CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_rule_customer_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_customers
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_customers`;
CREATE TABLE `cart_rule_customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times_used` bigint(20) unsigned NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL,
  `cart_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  KEY `cart_rule_customers_customer_id_foreign` (`customer_id`),
  CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_rule_customers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rule_translations
-- ----------------------------
DROP TABLE IF EXISTS `cart_rule_translations`;
CREATE TABLE `cart_rule_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `cart_rule_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`),
  CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_rule_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_rules
-- ----------------------------
DROP TABLE IF EXISTS `cart_rules`;
CREATE TABLE `cart_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `coupon_type` int(11) NOT NULL DEFAULT '1',
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT '0',
  `usage_per_customer` int(11) NOT NULL DEFAULT '0',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_quantity` int(11) NOT NULL DEFAULT '1',
  `discount_step` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `free_shipping` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_rules
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cart_shipping_rates
-- ----------------------------
DROP TABLE IF EXISTS `cart_shipping_rates`;
CREATE TABLE `cart_shipping_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `carrier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT '0',
  `base_price` double DEFAULT '0',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_percent` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `applied_tax_rate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT '1',
  `cart_address_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`),
  CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cart_shipping_rates
-- ----------------------------
BEGIN;
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (3, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 2, '2025-09-12 13:41:41', '2025-09-12 13:41:41', 2);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (4, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 2, '2025-09-12 13:41:41', '2025-09-12 13:41:41', 2);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (11, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 6, '2025-09-13 03:18:26', '2025-09-13 03:18:26', 6);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (12, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 6, '2025-09-13 03:18:26', '2025-09-13 03:18:26', 6);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (21, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 10, '2025-09-13 04:04:33', '2025-09-13 04:04:33', 7);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (22, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 10, '2025-09-13 04:04:33', '2025-09-13 04:04:33', 7);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (25, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 14, '2025-09-14 19:15:02', '2025-09-14 19:15:02', 10);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (26, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 14, '2025-09-14 19:15:02', '2025-09-14 19:15:02', 10);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (29, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 18, '2025-09-14 19:21:02', '2025-09-14 19:21:02', 11);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (30, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 18, '2025-09-14 19:21:02', '2025-09-14 19:21:02', 11);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (33, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 22, '2025-09-14 19:24:54', '2025-09-14 19:24:54', 12);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (34, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 22, '2025-09-14 19:24:54', '2025-09-14 19:24:54', 12);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (37, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 26, '2025-09-14 19:26:50', '2025-09-14 19:26:50', 13);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (38, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 26, '2025-09-14 19:26:50', '2025-09-14 19:26:50', 13);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (41, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 30, '2025-09-14 19:57:41', '2025-09-14 19:57:41', 14);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (42, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 30, '2025-09-14 19:57:41', '2025-09-14 19:57:41', 14);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (71, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 34, '2025-09-14 22:11:22', '2025-09-14 22:11:22', 16);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (72, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 34, '2025-09-14 22:11:22', '2025-09-14 22:11:22', 16);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (73, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 38, '2025-09-14 23:08:42', '2025-09-14 23:08:42', 17);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (74, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 38, '2025-09-14 23:08:42', '2025-09-14 23:08:42', 17);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (75, 'flatrate', 'Нова пошта', 'flatrate_flatrate', 'Нова пошта', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 43, '2025-09-19 02:59:42', '2025-09-19 02:59:42', 19);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (76, 'free', 'Нова пошта', 'free_free', 'Нова пошта', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 43, '2025-09-19 02:59:42', '2025-09-19 02:59:42', 19);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (79, 'flatrate', 'Нова пошта', 'flatrate_flatrate', 'Нова пошта', 'Flat Rate Shipping', 10, 10, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, NULL, 1, 47, '2025-09-19 03:00:55', '2025-09-19 03:00:55', 18);
INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES (80, 'free', 'Нова пошта', 'free_free', 'Нова пошта', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 47, '2025-09-19 03:00:55', '2025-09-19 03:00:55', 18);
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_channels
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_channels`;
CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of catalog_rule_channels
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_customer_groups`;
CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of catalog_rule_customer_groups
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_product_prices
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_product_prices`;
CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of catalog_rule_product_prices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rule_products
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rule_products`;
CREATE TABLE `catalog_rule_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned NOT NULL,
  `catalog_rule_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  KEY `catalog_rule_products_channel_id_foreign` (`channel_id`),
  CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of catalog_rule_products
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for catalog_rules
-- ----------------------------
DROP TABLE IF EXISTS `catalog_rules`;
CREATE TABLE `catalog_rules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `condition_type` tinyint(1) NOT NULL DEFAULT '1',
  `conditions` json DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT '0',
  `action_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of catalog_rules
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) NOT NULL DEFAULT '0',
  `logo_path` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `display_mode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'products_and_description',
  `_lft` int(10) unsigned NOT NULL DEFAULT '0',
  `_rgt` int(10) unsigned NOT NULL DEFAULT '0',
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `banner_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
BEGIN;
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (1, 1, NULL, 1, 'products_and_description', 1, 16, NULL, NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (5, 2, 'category/5/o5I1u3WykYnyFOyGTUFs1XNNESsATvn7js2IKnzS.webp', 1, 'products_and_description', 2, 3, 1, NULL, NULL, '2025-09-12 00:44:03', '2025-09-12 02:10:13');
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (6, 3, 'category/6/jCO93DEqO5KlaT9QFRRPAWZw2ilu7uuSMlJZO4tY.webp', 1, 'products_and_description', 4, 5, 1, NULL, NULL, '2025-09-12 00:44:55', '2025-09-12 02:14:57');
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (7, 4, 'category/7/XiEKxHvGcl8ypDIW9ma1LvOjGUG57Q2204Wbh9yM.webp', 1, 'products_and_description', 6, 7, 1, NULL, NULL, '2025-09-12 00:45:25', '2025-09-12 02:12:20');
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (8, 5, 'category/8/9x6JwQykuYbO7q8wi0VHukwGY4R8MRTycrXGFYqF.webp', 1, 'products_and_description', 8, 9, 1, NULL, NULL, '2025-09-12 00:46:02', '2025-09-12 02:12:45');
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (9, 6, 'category/9/Cy2ChyPwRLG6rKO4kp9YYI6THUUyth0YD4gAdUGd.webp', 1, 'products_and_description', 10, 11, 1, NULL, NULL, '2025-09-12 00:46:31', '2025-09-12 02:13:21');
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (10, 7, 'category/10/XVznpPs1j3ptBtIrguZpyw2XjtzyHGMOOLZKRcMk.webp', 1, 'products_and_description', 12, 13, 1, NULL, NULL, '2025-09-12 00:47:21', '2025-09-12 02:14:28');
INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES (11, 8, 'category/11/iDRsO5ZLlTpgIhk7CRB6ubuSRSxcEdYZClr8nouQ.webp', 1, 'products_only', 14, 15, 1, NULL, NULL, '2025-09-12 00:47:41', '2025-09-14 01:37:00');
COMMIT;

-- ----------------------------
-- Table structure for category_filterable_attributes
-- ----------------------------
DROP TABLE IF EXISTS `category_filterable_attributes`;
CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category_filterable_attributes
-- ----------------------------
BEGIN;
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (5, 11);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (5, 23);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (5, 24);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (5, 25);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (6, 11);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (6, 23);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (6, 24);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (6, 25);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (7, 11);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (7, 23);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (7, 24);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (7, 25);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (8, 11);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (8, 23);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (8, 24);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (8, 25);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (9, 11);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (9, 23);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (9, 24);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (9, 25);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (10, 11);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (10, 23);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (10, 24);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (10, 25);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (11, 11);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (11, 23);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (11, 24);
INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES (11, 25);
COMMIT;

-- ----------------------------
-- Table structure for category_translations
-- ----------------------------
DROP TABLE IF EXISTS `category_translations`;
CREATE TABLE `category_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale_id` int(10) unsigned DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  KEY `category_translations_locale_id_foreign` (`locale_id`),
  CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of category_translations
-- ----------------------------
BEGIN;
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (1, 1, 'Коренева', 'root', '', 'Опис кореневої категорії', '', '', '', NULL, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (5, 5, 'Кальяни', 'кальяни', '', '<p>Кальяни</p>', '', '', '', 1, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (6, 6, 'Тютюн', 'тютюн', '', '<p>Тютюн</p>', '', '', '', 1, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (7, 7, 'Вугілля', 'вугілля', '', '<ul class=\"flex flex-wrap items-center gap-5 text-[15px] font-medium\">\r\n<li><a class=\"hover:text-primary\" href=\"https://true-cloud.app/catalog?category=coal\">Вугілля</a></li>\r\n</ul>', '', '', '', 1, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (8, 8, 'Чаші', 'чаші', '', '<p>Чаші</p>', '', '', '', 1, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (9, 9, 'Шланги', 'шланги', '', '<p>Шланги</p>', '', '', '', 1, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (10, 10, 'Аксесуари', 'аксесуари', '', '<p>Аксесуари</p>', '', '', '', 1, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (11, 11, 'Набори', 'набори', '', '<p>Набори</p>', '', '', '', 1, 'uk');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (12, 11, 'Наборы', 'наборы', '', '', '', '', '', NULL, 'en');
INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES (13, 11, 'кальяны', 'кальяны', '', '', '', '', '', NULL, 'ru');
COMMIT;

-- ----------------------------
-- Table structure for channel_currencies
-- ----------------------------
DROP TABLE IF EXISTS `channel_currencies`;
CREATE TABLE `channel_currencies` (
  `channel_id` int(10) unsigned NOT NULL,
  `currency_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`currency_id`),
  KEY `channel_currencies_currency_id_foreign` (`currency_id`),
  CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_currencies
-- ----------------------------
BEGIN;
INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channel_inventory_sources
-- ----------------------------
DROP TABLE IF EXISTS `channel_inventory_sources`;
CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) unsigned NOT NULL,
  `inventory_source_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `channel_inventory_source_unique` (`channel_id`,`inventory_source_id`),
  KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_inventory_sources
-- ----------------------------
BEGIN;
INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for channel_locales
-- ----------------------------
DROP TABLE IF EXISTS `channel_locales`;
CREATE TABLE `channel_locales` (
  `channel_id` int(10) unsigned NOT NULL,
  `locale_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`locale_id`),
  KEY `channel_locales_locale_id_foreign` (`locale_id`),
  CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_locales
-- ----------------------------
BEGIN;
INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES (1, 1);
INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES (1, 4);
COMMIT;

-- ----------------------------
-- Table structure for channel_translations
-- ----------------------------
DROP TABLE IF EXISTS `channel_translations`;
CREATE TABLE `channel_translations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `maintenance_mode_text` text COLLATE utf8mb4_unicode_ci,
  `home_seo` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  KEY `channel_translations_locale_index` (`locale`),
  CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channel_translations
-- ----------------------------
BEGIN;
INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES (1, 1, 'uk', 'За замовчуванням', NULL, '', '{\"meta_title\": \"Демонстраційний магазин\", \"meta_keywords\": \"Мета-ключові слова демонстраційного магазину\", \"meta_description\": \"Мета-опис демонстраційного магазину\"}', NULL, '2025-09-14 01:47:01');
COMMIT;

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `home_seo` json DEFAULT NULL,
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT '0',
  `allowed_ips` text COLLATE utf8mb4_unicode_ci,
  `root_category_id` int(10) unsigned DEFAULT NULL,
  `default_locale_id` int(10) unsigned NOT NULL,
  `base_currency_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `channels_root_category_id_foreign` (`root_category_id`),
  KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  KEY `channels_base_currency_id_foreign` (`base_currency_id`),
  CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of channels
-- ----------------------------
BEGIN;
INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES (1, 'default', NULL, 'default', 'https://true-cloud-bagisto.hh', NULL, NULL, NULL, 0, '', 1, 1, 1, '2025-09-11 03:20:52', '2025-09-14 01:47:01');
COMMIT;

-- ----------------------------
-- Table structure for cms_page_channels
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_channels`;
CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  KEY `cms_page_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_page_channels
-- ----------------------------
BEGIN;
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (1, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (2, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (3, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (4, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (5, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (6, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (7, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (8, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (9, 1);
INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES (10, 1);
COMMIT;

-- ----------------------------
-- Table structure for cms_page_translations
-- ----------------------------
DROP TABLE IF EXISTS `cms_page_translations`;
CREATE TABLE `cms_page_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `html_content` longtext COLLATE utf8mb4_unicode_ci,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cms_page_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`),
  CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_page_translations
-- ----------------------------
BEGIN;
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (1, 'Про нас', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Про нас</div></div>', 'about us', '', 'aboutus', 'uk', 1);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (2, 'Політика повернення', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Політики повернення</div></div>', 'return policy', '', 'return, policy', 'uk', 2);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (3, 'Політика повернення', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Політики повернення</div></div>', 'Refund policy', '', 'refund, policy', 'uk', 3);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (4, 'Умови та положення', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Умови та положення</div></div>', 'Terms & Conditions', '', 'term, conditions', 'uk', 4);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (5, 'Умови використання', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Умови використання</div></div>', 'Terms of use', '', 'term, use', 'uk', 5);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (6, 'Обслуговування клієнтів', 'customer-service', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Обслуговування клієнтів</div></div>', 'Customer Service', '', 'customer, service', 'uk', 6);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (7, 'Що нового', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Що нового</div></div>', 'What\'s New', '', 'new', 'uk', 7);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (8, 'Політика оплати', 'payment-policy', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Політика оплати</div></div>', 'Payment Policy', '', 'payment, policy', 'uk', 8);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (9, 'Політика доставки', 'shipping-policy', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Політика доставки</div></div>', 'Shipping Policy', '', 'shipping, policy', 'uk', 9);
INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES (10, 'Політика конфіденційності', 'privacy-policy', '<div class=\"static-container\"><div class=\"mb-5\">Зміст сторінки Політика конфіденційності</div></div>', 'Privacy Policy', '', 'privacy, policy', 'uk', 10);
COMMIT;

-- ----------------------------
-- Table structure for cms_pages
-- ----------------------------
DROP TABLE IF EXISTS `cms_pages`;
CREATE TABLE `cms_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cms_pages
-- ----------------------------
BEGIN;
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (1, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (2, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (3, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (4, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (5, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (6, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (7, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (8, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (9, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES (10, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
COMMIT;

-- ----------------------------
-- Table structure for compare_items
-- ----------------------------
DROP TABLE IF EXISTS `compare_items`;
CREATE TABLE `compare_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_items_product_id_foreign` (`product_id`),
  KEY `compare_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of compare_items
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for core_config
-- ----------------------------
DROP TABLE IF EXISTS `core_config`;
CREATE TABLE `core_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of core_config
-- ----------------------------
BEGIN;
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (1, 'sales.checkout.shopping_cart.allow_guest_checkout', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (4, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '0', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (5, 'emails.general.notifications.emails.general.notifications.customer_account_credentials', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (6, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (7, 'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (8, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (9, 'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin', '0', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (10, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (11, 'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin', '0', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (12, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (13, 'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin', '0', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (14, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (15, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (16, 'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin', '0', NULL, NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (17, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (18, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (19, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (20, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (21, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (22, 'catalog.rich_snippets.products.enable', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (23, 'catalog.rich_snippets.products.show_sku', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (24, 'catalog.rich_snippets.products.show_weight', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (25, 'catalog.rich_snippets.products.show_categories', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (26, 'catalog.rich_snippets.products.show_images', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (27, 'catalog.rich_snippets.products.show_reviews', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (28, 'catalog.rich_snippets.products.show_ratings', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (29, 'catalog.rich_snippets.products.show_offers', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (30, 'catalog.rich_snippets.categories.enable', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (31, 'catalog.rich_snippets.categories.show_search_input_field', '1', NULL, NULL, '2025-09-12 14:22:21', '2025-09-12 14:22:21');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (32, 'sales.payment_methods.cashondelivery.title', 'Накладений платіж', 'default', 'uk', '2025-09-12 15:17:02', '2025-09-14 23:05:58');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (33, 'sales.payment_methods.cashondelivery.description', 'Cash On Delivery', 'default', 'uk', '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (34, 'sales.payment_methods.cashondelivery.instructions', '', 'default', 'uk', '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (35, 'sales.payment_methods.cashondelivery.generate_invoice', '0', 'default', NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (36, 'sales.payment_methods.cashondelivery.active', '1', 'default', NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (37, 'sales.payment_methods.cashondelivery.sort', '1', NULL, NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (38, 'sales.payment_methods.moneytransfer.title', 'Банківський переказ', 'default', 'uk', '2025-09-12 15:17:03', '2025-09-14 23:05:58');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (39, 'sales.payment_methods.moneytransfer.description', 'Money Transfer', 'default', 'uk', '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (40, 'sales.payment_methods.moneytransfer.generate_invoice', '0', 'default', NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (41, 'sales.payment_methods.moneytransfer.mailing_address', '', 'default', 'uk', '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (42, 'sales.payment_methods.moneytransfer.active', '1', 'default', NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (43, 'sales.payment_methods.moneytransfer.sort', '2', NULL, NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (44, 'sales.payment_methods.paypal_standard.description', 'PayPal Standard', 'default', 'uk', '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (45, 'sales.payment_methods.paypal_standard.active', '0', 'default', NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (46, 'sales.payment_methods.paypal_standard.sandbox', '1', 'default', NULL, '2025-09-12 15:17:03', '2025-09-12 15:17:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (47, 'sales.payment_methods.paypal_standard.sort', '3', NULL, NULL, '2025-09-12 15:17:04', '2025-09-12 15:17:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (48, 'sales.payment_methods.paypal_smart_button.description', 'PayPal', 'default', 'uk', '2025-09-12 15:17:04', '2025-09-12 15:17:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (49, 'sales.payment_methods.paypal_smart_button.active', '0', 'default', NULL, '2025-09-12 15:17:04', '2025-09-12 15:17:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (50, 'sales.payment_methods.paypal_smart_button.sandbox', '1', 'default', NULL, '2025-09-12 15:17:04', '2025-09-12 15:17:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (51, 'sales.payment_methods.paypal_smart_button.sort', '4', NULL, NULL, '2025-09-12 15:17:04', '2025-09-12 15:17:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (52, 'general.magic_ai.settings.enabled', '1', 'default', NULL, '2025-09-13 12:35:03', '2025-09-13 12:35:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (53, 'general.magic_ai.settings.api_key', '', 'default', NULL, '2025-09-13 12:35:03', '2025-09-13 12:35:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (54, 'general.magic_ai.settings.organization', '', 'default', NULL, '2025-09-13 12:35:03', '2025-09-13 12:35:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (55, 'general.magic_ai.settings.api_domain', '', 'default', NULL, '2025-09-13 12:35:03', '2025-09-13 12:35:03');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (56, 'general.magic_ai.content_generation.enabled', '1', NULL, NULL, '2025-09-13 12:35:03', '2025-09-13 12:35:11');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (57, 'general.magic_ai.content_generation.product_short_description_prompt', '', NULL, 'uk', '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (58, 'general.magic_ai.content_generation.product_description_prompt', '', NULL, 'uk', '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (59, 'general.magic_ai.content_generation.category_description_prompt', '', NULL, 'uk', '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (60, 'general.magic_ai.content_generation.cms_page_content_prompt', '', NULL, 'uk', '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (61, 'general.magic_ai.image_generation.enabled', '0', 'default', NULL, '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (62, 'general.magic_ai.review_translation.enabled', '0', 'default', NULL, '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (63, 'general.magic_ai.checkout_message.enabled', '0', 'default', NULL, '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (64, 'general.magic_ai.checkout_message.prompt', '', 'default', 'uk', '2025-09-13 12:35:04', '2025-09-13 12:35:04');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (65, 'general.design.categories.category_view', 'default', NULL, NULL, '2025-09-14 19:40:23', '2025-09-14 19:40:23');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (66, 'general.design.admin_logo.logo_image', 'configuration/XP1Hnl1UTpChrbRG7NnC3lLlNeVgyrzpb14Ejr4E.png', NULL, NULL, '2025-09-14 19:40:24', '2025-09-14 19:40:24');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (67, 'general.design.admin_logo.favicon', 'configuration/cRrfEcMvaLTtmQyjhnASwf2CP0oy9A1NXzal6u2v.png', NULL, NULL, '2025-09-14 19:40:24', '2025-09-14 19:40:24');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (68, 'sales.invoice_settings.invoice_number.invoice_number_prefix', '', 'default', 'uk', '2025-09-14 20:01:07', '2025-09-14 20:01:07');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (69, 'sales.invoice_settings.invoice_number.invoice_number_length', '', 'default', 'uk', '2025-09-14 20:01:07', '2025-09-14 20:01:07');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (70, 'sales.invoice_settings.invoice_number.invoice_number_suffix', '', 'default', 'uk', '2025-09-14 20:01:07', '2025-09-14 20:01:07');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (71, 'sales.invoice_settings.invoice_number.invoice_number_generator_class', '', 'default', 'uk', '2025-09-14 20:01:07', '2025-09-14 20:01:07');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (72, 'sales.invoice_settings.payment_terms.due_duration', '', 'default', NULL, '2025-09-14 20:01:07', '2025-09-14 20:01:07');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (73, 'sales.invoice_settings.pdf_print_outs.invoice_id', '1', NULL, NULL, '2025-09-14 20:01:08', '2025-09-14 20:01:08');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (74, 'sales.invoice_settings.pdf_print_outs.order_id', '1', NULL, NULL, '2025-09-14 20:01:08', '2025-09-14 20:01:08');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (75, 'sales.invoice_settings.pdf_print_outs.footer_text', '', 'default', 'uk', '2025-09-14 20:01:08', '2025-09-14 20:01:08');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (77, 'sales.invoice_settings.invoice_reminders.reminders_limit', '', 'default', NULL, '2025-09-14 20:01:08', '2025-09-14 20:01:08');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (78, 'sales.payment_methods.cashondelivery.title', 'Наложенный платеж', 'default', 'ru', '2025-09-14 23:06:32', '2025-09-14 23:06:32');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (79, 'sales.payment_methods.moneytransfer.title', 'Банковский перевод', 'default', 'ru', '2025-09-14 23:06:32', '2025-09-14 23:06:32');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (80, 'sales.carriers.free.title', 'Новая почта', 'default', 'ru', '2025-09-14 23:11:10', '2025-09-14 23:11:10');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (81, 'sales.carriers.flatrate.title', 'Новая почта', 'default', 'ru', '2025-09-14 23:11:10', '2025-09-14 23:11:10');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (82, 'sales.carriers.free.title', 'Нова пошта', 'default', 'uk', '2025-09-14 23:11:27', '2025-09-14 23:11:27');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (83, 'sales.carriers.flatrate.title', 'Нова пошта', 'default', 'uk', '2025-09-14 23:11:27', '2025-09-14 23:11:27');
INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES (84, 'catalog.products.review.censoring_reviewer_name', '0', 'default', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of countries
-- ----------------------------
BEGIN;
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (1, 'AF', 'Afghanistan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (2, 'AX', 'Åland Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (3, 'AL', 'Albania');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (4, 'DZ', 'Algeria');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (5, 'AS', 'American Samoa');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (6, 'AD', 'Andorra');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (7, 'AO', 'Angola');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (8, 'AI', 'Anguilla');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (9, 'AQ', 'Antarctica');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (10, 'AG', 'Antigua & Barbuda');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (11, 'AR', 'Argentina');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (12, 'AM', 'Armenia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (13, 'AW', 'Aruba');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (14, 'AC', 'Ascension Island');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (15, 'AU', 'Australia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (16, 'AT', 'Austria');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (17, 'AZ', 'Azerbaijan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (18, 'BS', 'Bahamas');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (19, 'BH', 'Bahrain');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (20, 'BD', 'Bangladesh');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (21, 'BB', 'Barbados');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (22, 'BY', 'Belarus');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (23, 'BE', 'Belgium');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (24, 'BZ', 'Belize');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (25, 'BJ', 'Benin');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (26, 'BM', 'Bermuda');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (27, 'BT', 'Bhutan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (28, 'BO', 'Bolivia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (29, 'BA', 'Bosnia & Herzegovina');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (30, 'BW', 'Botswana');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (31, 'BR', 'Brazil');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (32, 'IO', 'British Indian Ocean Territory');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (33, 'VG', 'British Virgin Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (34, 'BN', 'Brunei');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (35, 'BG', 'Bulgaria');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (36, 'BF', 'Burkina Faso');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (37, 'BI', 'Burundi');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (38, 'KH', 'Cambodia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (39, 'CM', 'Cameroon');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (40, 'CA', 'Canada');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (41, 'IC', 'Canary Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (42, 'CV', 'Cape Verde');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (43, 'BQ', 'Caribbean Netherlands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (44, 'KY', 'Cayman Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (45, 'CF', 'Central African Republic');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (46, 'EA', 'Ceuta & Melilla');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (47, 'TD', 'Chad');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (48, 'CL', 'Chile');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (49, 'CN', 'China');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (50, 'CX', 'Christmas Island');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (51, 'CC', 'Cocos (Keeling) Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (52, 'CO', 'Colombia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (53, 'KM', 'Comoros');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (54, 'CG', 'Congo - Brazzaville');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (55, 'CD', 'Congo - Kinshasa');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (56, 'CK', 'Cook Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (57, 'CR', 'Costa Rica');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (58, 'CI', 'Côte d’Ivoire');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (59, 'HR', 'Croatia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (60, 'CU', 'Cuba');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (61, 'CW', 'Curaçao');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (62, 'CY', 'Cyprus');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (63, 'CZ', 'Czechia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (64, 'DK', 'Denmark');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (65, 'DG', 'Diego Garcia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (66, 'DJ', 'Djibouti');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (67, 'DM', 'Dominica');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (68, 'DO', 'Dominican Republic');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (69, 'EC', 'Ecuador');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (70, 'EG', 'Egypt');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (71, 'SV', 'El Salvador');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (72, 'GQ', 'Equatorial Guinea');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (73, 'ER', 'Eritrea');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (74, 'EE', 'Estonia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (75, 'ET', 'Ethiopia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (76, 'EZ', 'Eurozone');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (77, 'FK', 'Falkland Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (78, 'FO', 'Faroe Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (79, 'FJ', 'Fiji');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (80, 'FI', 'Finland');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (81, 'FR', 'France');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (82, 'GF', 'French Guiana');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (83, 'PF', 'French Polynesia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (84, 'TF', 'French Southern Territories');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (85, 'GA', 'Gabon');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (86, 'GM', 'Gambia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (87, 'GE', 'Georgia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (88, 'DE', 'Germany');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (89, 'GH', 'Ghana');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (90, 'GI', 'Gibraltar');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (91, 'GR', 'Greece');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (92, 'GL', 'Greenland');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (93, 'GD', 'Grenada');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (94, 'GP', 'Guadeloupe');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (95, 'GU', 'Guam');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (96, 'GT', 'Guatemala');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (97, 'GG', 'Guernsey');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (98, 'GN', 'Guinea');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (99, 'GW', 'Guinea-Bissau');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (100, 'GY', 'Guyana');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (101, 'HT', 'Haiti');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (102, 'HN', 'Honduras');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (103, 'HK', 'Hong Kong SAR China');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (104, 'HU', 'Hungary');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (105, 'IS', 'Iceland');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (106, 'IN', 'India');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (107, 'ID', 'Indonesia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (108, 'IR', 'Iran');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (109, 'IQ', 'Iraq');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (110, 'IE', 'Ireland');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (111, 'IM', 'Isle of Man');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (112, 'IL', 'Israel');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (113, 'IT', 'Italy');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (114, 'JM', 'Jamaica');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (115, 'JP', 'Japan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (116, 'JE', 'Jersey');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (117, 'JO', 'Jordan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (118, 'KZ', 'Kazakhstan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (119, 'KE', 'Kenya');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (120, 'KI', 'Kiribati');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (121, 'XK', 'Kosovo');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (122, 'KW', 'Kuwait');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (123, 'KG', 'Kyrgyzstan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (124, 'LA', 'Laos');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (125, 'LV', 'Latvia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (126, 'LB', 'Lebanon');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (127, 'LS', 'Lesotho');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (128, 'LR', 'Liberia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (129, 'LY', 'Libya');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (130, 'LI', 'Liechtenstein');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (131, 'LT', 'Lithuania');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (132, 'LU', 'Luxembourg');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (133, 'MO', 'Macau SAR China');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (134, 'MK', 'Macedonia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (135, 'MG', 'Madagascar');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (136, 'MW', 'Malawi');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (137, 'MY', 'Malaysia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (138, 'MV', 'Maldives');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (139, 'ML', 'Mali');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (140, 'MT', 'Malta');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (141, 'MH', 'Marshall Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (142, 'MQ', 'Martinique');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (143, 'MR', 'Mauritania');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (144, 'MU', 'Mauritius');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (145, 'YT', 'Mayotte');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (146, 'MX', 'Mexico');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (147, 'FM', 'Micronesia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (148, 'MD', 'Moldova');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (149, 'MC', 'Monaco');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (150, 'MN', 'Mongolia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (151, 'ME', 'Montenegro');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (152, 'MS', 'Montserrat');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (153, 'MA', 'Morocco');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (154, 'MZ', 'Mozambique');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (155, 'MM', 'Myanmar (Burma)');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (156, 'NA', 'Namibia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (157, 'NR', 'Nauru');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (158, 'NP', 'Nepal');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (159, 'NL', 'Netherlands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (160, 'NC', 'New Caledonia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (161, 'NZ', 'New Zealand');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (162, 'NI', 'Nicaragua');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (163, 'NE', 'Niger');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (164, 'NG', 'Nigeria');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (165, 'NU', 'Niue');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (166, 'NF', 'Norfolk Island');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (167, 'KP', 'North Korea');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (168, 'MP', 'Northern Mariana Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (169, 'NO', 'Norway');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (170, 'OM', 'Oman');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (171, 'PK', 'Pakistan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (172, 'PW', 'Palau');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (173, 'PS', 'Palestinian Territories');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (174, 'PA', 'Panama');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (175, 'PG', 'Papua New Guinea');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (176, 'PY', 'Paraguay');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (177, 'PE', 'Peru');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (178, 'PH', 'Philippines');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (179, 'PN', 'Pitcairn Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (180, 'PL', 'Poland');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (181, 'PT', 'Portugal');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (182, 'PR', 'Puerto Rico');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (183, 'QA', 'Qatar');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (184, 'RE', 'Réunion');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (185, 'RO', 'Romania');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (186, 'RU', 'Russia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (187, 'RW', 'Rwanda');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (188, 'WS', 'Samoa');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (189, 'SM', 'San Marino');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (190, 'ST', 'São Tomé & Príncipe');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (191, 'SA', 'Saudi Arabia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (192, 'SN', 'Senegal');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (193, 'RS', 'Serbia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (194, 'SC', 'Seychelles');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (195, 'SL', 'Sierra Leone');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (196, 'SG', 'Singapore');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (197, 'SX', 'Sint Maarten');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (198, 'SK', 'Slovakia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (199, 'SI', 'Slovenia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (200, 'SB', 'Solomon Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (201, 'SO', 'Somalia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (202, 'ZA', 'South Africa');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (203, 'GS', 'South Georgia & South Sandwich Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (204, 'KR', 'South Korea');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (205, 'SS', 'South Sudan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (206, 'ES', 'Spain');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (207, 'LK', 'Sri Lanka');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (208, 'BL', 'St. Barthélemy');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (209, 'SH', 'St. Helena');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (210, 'KN', 'St. Kitts & Nevis');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (211, 'LC', 'St. Lucia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (212, 'MF', 'St. Martin');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (213, 'PM', 'St. Pierre & Miquelon');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (214, 'VC', 'St. Vincent & Grenadines');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (215, 'SD', 'Sudan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (216, 'SR', 'Suriname');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (217, 'SJ', 'Svalbard & Jan Mayen');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (218, 'SZ', 'Swaziland');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (219, 'SE', 'Sweden');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (220, 'CH', 'Switzerland');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (221, 'SY', 'Syria');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (222, 'TW', 'Taiwan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (223, 'TJ', 'Tajikistan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (224, 'TZ', 'Tanzania');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (225, 'TH', 'Thailand');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (226, 'TL', 'Timor-Leste');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (227, 'TG', 'Togo');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (228, 'TK', 'Tokelau');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (229, 'TO', 'Tonga');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (230, 'TT', 'Trinidad & Tobago');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (231, 'TA', 'Tristan da Cunha');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (232, 'TN', 'Tunisia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (233, 'TR', 'Turkey');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (234, 'TM', 'Turkmenistan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (235, 'TC', 'Turks & Caicos Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (236, 'TV', 'Tuvalu');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (237, 'UM', 'U.S. Outlying Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (238, 'VI', 'U.S. Virgin Islands');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (239, 'UG', 'Uganda');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (240, 'UA', 'Ukraine');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (241, 'AE', 'United Arab Emirates');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (242, 'GB', 'United Kingdom');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (244, 'US', 'United States');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (245, 'UY', 'Uruguay');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (246, 'UZ', 'Uzbekistan');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (247, 'VU', 'Vanuatu');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (248, 'VA', 'Vatican City');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (249, 'VE', 'Venezuela');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (250, 'VN', 'Vietnam');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (251, 'WF', 'Wallis & Futuna');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (252, 'EH', 'Western Sahara');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (253, 'YE', 'Yemen');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (254, 'ZM', 'Zambia');
INSERT INTO `countries` (`id`, `code`, `name`) VALUES (255, 'ZW', 'Zimbabwe');
COMMIT;

-- ----------------------------
-- Table structure for country_state_translations
-- ----------------------------
DROP TABLE IF EXISTS `country_state_translations`;
CREATE TABLE `country_state_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_state_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default_name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_state_translations_country_state_id_foreign` (`country_state_id`),
  CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of country_state_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for country_states
-- ----------------------------
DROP TABLE IF EXISTS `country_states`;
CREATE TABLE `country_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned DEFAULT NULL,
  `country_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `country_states_country_id_foreign` (`country_id`),
  CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=587 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of country_states
-- ----------------------------
BEGIN;
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (1, 244, 'US', 'AL', 'Alabama');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (2, 244, 'US', 'AK', 'Alaska');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (3, 244, 'US', 'AS', 'American Samoa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (4, 244, 'US', 'AZ', 'Arizona');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (5, 244, 'US', 'AR', 'Arkansas');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (6, 244, 'US', 'AE', 'Armed Forces Africa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (7, 244, 'US', 'AA', 'Armed Forces Americas');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (8, 244, 'US', 'AE', 'Armed Forces Canada');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (9, 244, 'US', 'AE', 'Armed Forces Europe');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (10, 244, 'US', 'AE', 'Armed Forces Middle East');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (11, 244, 'US', 'AP', 'Armed Forces Pacific');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (12, 244, 'US', 'CA', 'California');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (13, 244, 'US', 'CO', 'Colorado');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (14, 244, 'US', 'CT', 'Connecticut');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (15, 244, 'US', 'DE', 'Delaware');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (16, 244, 'US', 'DC', 'District of Columbia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (17, 244, 'US', 'FM', 'Federated States Of Micronesia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (18, 244, 'US', 'FL', 'Florida');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (19, 244, 'US', 'GA', 'Georgia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (20, 244, 'US', 'GU', 'Guam');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (21, 244, 'US', 'HI', 'Hawaii');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (22, 244, 'US', 'ID', 'Idaho');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (23, 244, 'US', 'IL', 'Illinois');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (24, 244, 'US', 'IN', 'Indiana');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (25, 244, 'US', 'IA', 'Iowa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (26, 244, 'US', 'KS', 'Kansas');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (27, 244, 'US', 'KY', 'Kentucky');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (28, 244, 'US', 'LA', 'Louisiana');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (29, 244, 'US', 'ME', 'Maine');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (30, 244, 'US', 'MH', 'Marshall Islands');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (31, 244, 'US', 'MD', 'Maryland');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (32, 244, 'US', 'MA', 'Massachusetts');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (33, 244, 'US', 'MI', 'Michigan');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (34, 244, 'US', 'MN', 'Minnesota');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (35, 244, 'US', 'MS', 'Mississippi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (36, 244, 'US', 'MO', 'Missouri');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (37, 244, 'US', 'MT', 'Montana');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (38, 244, 'US', 'NE', 'Nebraska');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (39, 244, 'US', 'NV', 'Nevada');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (40, 244, 'US', 'NH', 'New Hampshire');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (41, 244, 'US', 'NJ', 'New Jersey');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (42, 244, 'US', 'NM', 'New Mexico');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (43, 244, 'US', 'NY', 'New York');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (44, 244, 'US', 'NC', 'North Carolina');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (45, 244, 'US', 'ND', 'North Dakota');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (46, 244, 'US', 'MP', 'Northern Mariana Islands');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (47, 244, 'US', 'OH', 'Ohio');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (48, 244, 'US', 'OK', 'Oklahoma');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (49, 244, 'US', 'OR', 'Oregon');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (50, 244, 'US', 'PW', 'Palau');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (51, 244, 'US', 'PA', 'Pennsylvania');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (52, 244, 'US', 'PR', 'Puerto Rico');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (53, 244, 'US', 'RI', 'Rhode Island');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (54, 244, 'US', 'SC', 'South Carolina');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (55, 244, 'US', 'SD', 'South Dakota');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (56, 244, 'US', 'TN', 'Tennessee');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (57, 244, 'US', 'TX', 'Texas');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (58, 244, 'US', 'UT', 'Utah');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (59, 244, 'US', 'VT', 'Vermont');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (60, 244, 'US', 'VI', 'Virgin Islands');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (61, 244, 'US', 'VA', 'Virginia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (62, 244, 'US', 'WA', 'Washington');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (63, 244, 'US', 'WV', 'West Virginia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (64, 244, 'US', 'WI', 'Wisconsin');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (65, 244, 'US', 'WY', 'Wyoming');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (66, 40, 'CA', 'AB', 'Alberta');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (67, 40, 'CA', 'BC', 'British Columbia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (68, 40, 'CA', 'MB', 'Manitoba');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (69, 40, 'CA', 'NL', 'Newfoundland and Labrador');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (70, 40, 'CA', 'NB', 'New Brunswick');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (71, 40, 'CA', 'NS', 'Nova Scotia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (72, 40, 'CA', 'NT', 'Northwest Territories');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (73, 40, 'CA', 'NU', 'Nunavut');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (74, 40, 'CA', 'ON', 'Ontario');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (75, 40, 'CA', 'PE', 'Prince Edward Island');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (76, 40, 'CA', 'QC', 'Quebec');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (77, 40, 'CA', 'SK', 'Saskatchewan');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (78, 40, 'CA', 'YT', 'Yukon Territory');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (79, 88, 'DE', 'NDS', 'Niedersachsen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (80, 88, 'DE', 'BAW', 'Baden-Württemberg');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (81, 88, 'DE', 'BAY', 'Bayern');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (82, 88, 'DE', 'BER', 'Berlin');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (83, 88, 'DE', 'BRG', 'Brandenburg');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (84, 88, 'DE', 'BRE', 'Bremen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (85, 88, 'DE', 'HAM', 'Hamburg');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (86, 88, 'DE', 'HES', 'Hessen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (89, 88, 'DE', 'RHE', 'Rheinland-Pfalz');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (90, 88, 'DE', 'SAR', 'Saarland');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (91, 88, 'DE', 'SAS', 'Sachsen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (92, 88, 'DE', 'SAC', 'Sachsen-Anhalt');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (93, 88, 'DE', 'SCN', 'Schleswig-Holstein');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (94, 88, 'DE', 'THE', 'Thüringen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (95, 16, 'AT', 'WI', 'Wien');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (96, 16, 'AT', 'NO', 'Niederösterreich');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (97, 16, 'AT', 'OO', 'Oberösterreich');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (98, 16, 'AT', 'SB', 'Salzburg');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (99, 16, 'AT', 'KN', 'Kärnten');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (100, 16, 'AT', 'ST', 'Steiermark');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (101, 16, 'AT', 'TI', 'Tirol');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (102, 16, 'AT', 'BL', 'Burgenland');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (103, 16, 'AT', 'VB', 'Vorarlberg');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (104, 220, 'CH', 'AG', 'Aargau');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (105, 220, 'CH', 'AI', 'Appenzell Innerrhoden');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (107, 220, 'CH', 'BE', 'Bern');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (108, 220, 'CH', 'BL', 'Basel-Landschaft');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (109, 220, 'CH', 'BS', 'Basel-Stadt');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (110, 220, 'CH', 'FR', 'Freiburg');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (111, 220, 'CH', 'GE', 'Genf');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (112, 220, 'CH', 'GL', 'Glarus');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (113, 220, 'CH', 'GR', 'Graubünden');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (114, 220, 'CH', 'JU', 'Jura');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (115, 220, 'CH', 'LU', 'Luzern');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (116, 220, 'CH', 'NE', 'Neuenburg');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (117, 220, 'CH', 'NW', 'Nidwalden');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (118, 220, 'CH', 'OW', 'Obwalden');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (119, 220, 'CH', 'SG', 'St. Gallen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (120, 220, 'CH', 'SH', 'Schaffhausen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (121, 220, 'CH', 'SO', 'Solothurn');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (122, 220, 'CH', 'SZ', 'Schwyz');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (123, 220, 'CH', 'TG', 'Thurgau');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (124, 220, 'CH', 'TI', 'Tessin');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (125, 220, 'CH', 'UR', 'Uri');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (126, 220, 'CH', 'VD', 'Waadt');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (127, 220, 'CH', 'VS', 'Wallis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (128, 220, 'CH', 'ZG', 'Zug');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (129, 220, 'CH', 'ZH', 'Zürich');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (130, 206, 'ES', 'A Coruсa', 'A Coruña');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (131, 206, 'ES', 'Alava', 'Alava');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (132, 206, 'ES', 'Albacete', 'Albacete');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (133, 206, 'ES', 'Alicante', 'Alicante');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (134, 206, 'ES', 'Almeria', 'Almeria');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (135, 206, 'ES', 'Asturias', 'Asturias');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (136, 206, 'ES', 'Avila', 'Avila');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (137, 206, 'ES', 'Badajoz', 'Badajoz');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (138, 206, 'ES', 'Baleares', 'Baleares');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (139, 206, 'ES', 'Barcelona', 'Barcelona');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (140, 206, 'ES', 'Burgos', 'Burgos');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (141, 206, 'ES', 'Caceres', 'Caceres');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (142, 206, 'ES', 'Cadiz', 'Cadiz');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (143, 206, 'ES', 'Cantabria', 'Cantabria');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (144, 206, 'ES', 'Castellon', 'Castellon');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (145, 206, 'ES', 'Ceuta', 'Ceuta');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (146, 206, 'ES', 'Ciudad Real', 'Ciudad Real');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (147, 206, 'ES', 'Cordoba', 'Cordoba');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (148, 206, 'ES', 'Cuenca', 'Cuenca');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (149, 206, 'ES', 'Girona', 'Girona');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (150, 206, 'ES', 'Granada', 'Granada');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (151, 206, 'ES', 'Guadalajara', 'Guadalajara');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (153, 206, 'ES', 'Huelva', 'Huelva');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (154, 206, 'ES', 'Huesca', 'Huesca');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (155, 206, 'ES', 'Jaen', 'Jaen');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (156, 206, 'ES', 'La Rioja', 'La Rioja');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (157, 206, 'ES', 'Las Palmas', 'Las Palmas');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (158, 206, 'ES', 'Leon', 'Leon');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (159, 206, 'ES', 'Lleida', 'Lleida');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (160, 206, 'ES', 'Lugo', 'Lugo');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (161, 206, 'ES', 'Madrid', 'Madrid');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (162, 206, 'ES', 'Malaga', 'Malaga');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (163, 206, 'ES', 'Melilla', 'Melilla');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (164, 206, 'ES', 'Murcia', 'Murcia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (165, 206, 'ES', 'Navarra', 'Navarra');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (166, 206, 'ES', 'Ourense', 'Ourense');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (167, 206, 'ES', 'Palencia', 'Palencia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (168, 206, 'ES', 'Pontevedra', 'Pontevedra');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (169, 206, 'ES', 'Salamanca', 'Salamanca');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (171, 206, 'ES', 'Segovia', 'Segovia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (172, 206, 'ES', 'Sevilla', 'Sevilla');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (173, 206, 'ES', 'Soria', 'Soria');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (174, 206, 'ES', 'Tarragona', 'Tarragona');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (175, 206, 'ES', 'Teruel', 'Teruel');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (176, 206, 'ES', 'Toledo', 'Toledo');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (177, 206, 'ES', 'Valencia', 'Valencia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (178, 206, 'ES', 'Valladolid', 'Valladolid');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (179, 206, 'ES', 'Vizcaya', 'Vizcaya');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (180, 206, 'ES', 'Zamora', 'Zamora');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (181, 206, 'ES', 'Zaragoza', 'Zaragoza');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (182, 81, 'FR', '1', 'Ain');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (183, 81, 'FR', '2', 'Aisne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (184, 81, 'FR', '3', 'Allier');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (185, 81, 'FR', '4', 'Alpes-de-Haute-Provence');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (186, 81, 'FR', '5', 'Hautes-Alpes');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (187, 81, 'FR', '6', 'Alpes-Maritimes');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (188, 81, 'FR', '7', 'Ardèche');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (189, 81, 'FR', '8', 'Ardennes');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (190, 81, 'FR', '9', 'Ariège');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (191, 81, 'FR', '10', 'Aube');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (192, 81, 'FR', '11', 'Aude');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (193, 81, 'FR', '12', 'Aveyron');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (194, 81, 'FR', '13', 'Bouches-du-Rhône');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (195, 81, 'FR', '14', 'Calvados');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (196, 81, 'FR', '15', 'Cantal');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (197, 81, 'FR', '16', 'Charente');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (198, 81, 'FR', '17', 'Charente-Maritime');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (199, 81, 'FR', '18', 'Cher');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (200, 81, 'FR', '19', 'Corrèze');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (201, 81, 'FR', '2A', 'Corse-du-Sud');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (202, 81, 'FR', '2B', 'Haute-Corse');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (203, 81, 'FR', '21', 'Côte-d\'Or');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (204, 81, 'FR', '22', 'Côtes-d\'Armor');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (205, 81, 'FR', '23', 'Creuse');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (206, 81, 'FR', '24', 'Dordogne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (207, 81, 'FR', '25', 'Doubs');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (208, 81, 'FR', '26', 'Drôme');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (209, 81, 'FR', '27', 'Eure');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (210, 81, 'FR', '28', 'Eure-et-Loir');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (211, 81, 'FR', '29', 'Finistère');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (212, 81, 'FR', '30', 'Gard');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (213, 81, 'FR', '31', 'Haute-Garonne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (214, 81, 'FR', '32', 'Gers');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (215, 81, 'FR', '33', 'Gironde');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (216, 81, 'FR', '34', 'Hérault');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (217, 81, 'FR', '35', 'Ille-et-Vilaine');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (218, 81, 'FR', '36', 'Indre');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (219, 81, 'FR', '37', 'Indre-et-Loire');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (220, 81, 'FR', '38', 'Isère');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (221, 81, 'FR', '39', 'Jura');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (222, 81, 'FR', '40', 'Landes');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (223, 81, 'FR', '41', 'Loir-et-Cher');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (224, 81, 'FR', '42', 'Loire');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (225, 81, 'FR', '43', 'Haute-Loire');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (226, 81, 'FR', '44', 'Loire-Atlantique');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (227, 81, 'FR', '45', 'Loiret');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (228, 81, 'FR', '46', 'Lot');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (229, 81, 'FR', '47', 'Lot-et-Garonne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (230, 81, 'FR', '48', 'Lozère');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (231, 81, 'FR', '49', 'Maine-et-Loire');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (232, 81, 'FR', '50', 'Manche');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (233, 81, 'FR', '51', 'Marne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (234, 81, 'FR', '52', 'Haute-Marne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (235, 81, 'FR', '53', 'Mayenne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (236, 81, 'FR', '54', 'Meurthe-et-Moselle');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (237, 81, 'FR', '55', 'Meuse');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (238, 81, 'FR', '56', 'Morbihan');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (239, 81, 'FR', '57', 'Moselle');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (240, 81, 'FR', '58', 'Nièvre');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (241, 81, 'FR', '59', 'Nord');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (242, 81, 'FR', '60', 'Oise');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (243, 81, 'FR', '61', 'Orne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (244, 81, 'FR', '62', 'Pas-de-Calais');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (245, 81, 'FR', '63', 'Puy-de-Dôme');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (246, 81, 'FR', '64', 'Pyrénées-Atlantiques');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (247, 81, 'FR', '65', 'Hautes-Pyrénées');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (248, 81, 'FR', '66', 'Pyrénées-Orientales');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (249, 81, 'FR', '67', 'Bas-Rhin');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (250, 81, 'FR', '68', 'Haut-Rhin');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (251, 81, 'FR', '69', 'Rhône');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (252, 81, 'FR', '70', 'Haute-Saône');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (253, 81, 'FR', '71', 'Saône-et-Loire');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (254, 81, 'FR', '72', 'Sarthe');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (255, 81, 'FR', '73', 'Savoie');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (256, 81, 'FR', '74', 'Haute-Savoie');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (257, 81, 'FR', '75', 'Paris');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (258, 81, 'FR', '76', 'Seine-Maritime');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (259, 81, 'FR', '77', 'Seine-et-Marne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (260, 81, 'FR', '78', 'Yvelines');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (261, 81, 'FR', '79', 'Deux-Sèvres');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (262, 81, 'FR', '80', 'Somme');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (263, 81, 'FR', '81', 'Tarn');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (264, 81, 'FR', '82', 'Tarn-et-Garonne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (265, 81, 'FR', '83', 'Var');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (266, 81, 'FR', '84', 'Vaucluse');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (267, 81, 'FR', '85', 'Vendée');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (268, 81, 'FR', '86', 'Vienne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (269, 81, 'FR', '87', 'Haute-Vienne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (270, 81, 'FR', '88', 'Vosges');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (271, 81, 'FR', '89', 'Yonne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (272, 81, 'FR', '90', 'Territoire-de-Belfort');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (273, 81, 'FR', '91', 'Essonne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (274, 81, 'FR', '92', 'Hauts-de-Seine');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (275, 81, 'FR', '93', 'Seine-Saint-Denis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (276, 81, 'FR', '94', 'Val-de-Marne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (277, 81, 'FR', '95', 'Val-d\'Oise');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (278, 185, 'RO', 'AB', 'Alba');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (279, 185, 'RO', 'AR', 'Arad');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (280, 185, 'RO', 'AG', 'Argeş');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (281, 185, 'RO', 'BC', 'Bacău');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (282, 185, 'RO', 'BH', 'Bihor');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (283, 185, 'RO', 'BN', 'Bistriţa-Năsăud');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (284, 185, 'RO', 'BT', 'Botoşani');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (285, 185, 'RO', 'BV', 'Braşov');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (286, 185, 'RO', 'BR', 'Brăila');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (287, 185, 'RO', 'B', 'Bucureşti');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (288, 185, 'RO', 'BZ', 'Buzău');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (289, 185, 'RO', 'CS', 'Caraş-Severin');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (290, 185, 'RO', 'CL', 'Călăraşi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (291, 185, 'RO', 'CJ', 'Cluj');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (292, 185, 'RO', 'CT', 'Constanţa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (293, 185, 'RO', 'CV', 'Covasna');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (294, 185, 'RO', 'DB', 'Dâmboviţa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (295, 185, 'RO', 'DJ', 'Dolj');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (296, 185, 'RO', 'GL', 'Galaţi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (297, 185, 'RO', 'GR', 'Giurgiu');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (298, 185, 'RO', 'GJ', 'Gorj');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (299, 185, 'RO', 'HR', 'Harghita');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (300, 185, 'RO', 'HD', 'Hunedoara');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (301, 185, 'RO', 'IL', 'Ialomiţa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (302, 185, 'RO', 'IS', 'Iaşi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (303, 185, 'RO', 'IF', 'Ilfov');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (304, 185, 'RO', 'MM', 'Maramureş');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (305, 185, 'RO', 'MH', 'Mehedinţi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (306, 185, 'RO', 'MS', 'Mureş');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (307, 185, 'RO', 'NT', 'Neamţ');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (308, 185, 'RO', 'OT', 'Olt');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (309, 185, 'RO', 'PH', 'Prahova');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (310, 185, 'RO', 'SM', 'Satu-Mare');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (311, 185, 'RO', 'SJ', 'Sălaj');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (312, 185, 'RO', 'SB', 'Sibiu');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (313, 185, 'RO', 'SV', 'Suceava');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (314, 185, 'RO', 'TR', 'Teleorman');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (315, 185, 'RO', 'TM', 'Timiş');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (316, 185, 'RO', 'TL', 'Tulcea');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (317, 185, 'RO', 'VS', 'Vaslui');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (318, 185, 'RO', 'VL', 'Vâlcea');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (319, 185, 'RO', 'VN', 'Vrancea');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (320, 80, 'FI', 'Lappi', 'Lappi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (322, 80, 'FI', 'Kainuu', 'Kainuu');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (329, 80, 'FI', 'Satakunta', 'Satakunta');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (336, 80, 'FI', 'Uusimaa', 'Uusimaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (340, 74, 'EE', 'EE-37', 'Harjumaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (341, 74, 'EE', 'EE-39', 'Hiiumaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (342, 74, 'EE', 'EE-44', 'Ida-Virumaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (343, 74, 'EE', 'EE-49', 'Jõgevamaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (344, 74, 'EE', 'EE-51', 'Järvamaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (345, 74, 'EE', 'EE-57', 'Läänemaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (346, 74, 'EE', 'EE-59', 'Lääne-Virumaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (347, 74, 'EE', 'EE-65', 'Põlvamaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (348, 74, 'EE', 'EE-67', 'Pärnumaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (349, 74, 'EE', 'EE-70', 'Raplamaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (350, 74, 'EE', 'EE-74', 'Saaremaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (351, 74, 'EE', 'EE-78', 'Tartumaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (352, 74, 'EE', 'EE-82', 'Valgamaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (353, 74, 'EE', 'EE-84', 'Viljandimaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (354, 74, 'EE', 'EE-86', 'Võrumaa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (355, 125, 'LV', 'LV-DGV', 'Daugavpils');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (356, 125, 'LV', 'LV-JEL', 'Jelgava');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (357, 125, 'LV', 'Jēkabpils', 'Jēkabpils');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (358, 125, 'LV', 'LV-JUR', 'Jūrmala');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (359, 125, 'LV', 'LV-LPX', 'Liepāja');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (360, 125, 'LV', 'LV-LE', 'Liepājas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (361, 125, 'LV', 'LV-REZ', 'Rēzekne');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (362, 125, 'LV', 'LV-RIX', 'Rīga');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (363, 125, 'LV', 'LV-RI', 'Rīgas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (364, 125, 'LV', 'Valmiera', 'Valmiera');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (365, 125, 'LV', 'LV-VEN', 'Ventspils');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (366, 125, 'LV', 'Aglonas novads', 'Aglonas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (367, 125, 'LV', 'LV-AI', 'Aizkraukles novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (368, 125, 'LV', 'Aizputes novads', 'Aizputes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (370, 125, 'LV', 'Alojas novads', 'Alojas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (371, 125, 'LV', 'Alsungas novads', 'Alsungas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (372, 125, 'LV', 'LV-AL', 'Alūksnes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (373, 125, 'LV', 'Amatas novads', 'Amatas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (374, 125, 'LV', 'Apes novads', 'Apes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (375, 125, 'LV', 'Auces novads', 'Auces novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (376, 125, 'LV', 'Babītes novads', 'Babītes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (377, 125, 'LV', 'Baldones novads', 'Baldones novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (379, 125, 'LV', 'LV-BL', 'Balvu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (380, 125, 'LV', 'LV-BU', 'Bauskas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (386, 125, 'LV', 'Ciblas novads', 'Ciblas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (387, 125, 'LV', 'LV-CE', 'Cēsu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (388, 125, 'LV', 'Dagdas novads', 'Dagdas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (389, 125, 'LV', 'LV-DA', 'Daugavpils novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (390, 125, 'LV', 'LV-DO', 'Dobeles novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (391, 125, 'LV', 'Dundagas novads', 'Dundagas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (392, 125, 'LV', 'Durbes novads', 'Durbes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (393, 125, 'LV', 'Engures novads', 'Engures novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (396, 125, 'LV', 'LV-GU', 'Gulbenes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (397, 125, 'LV', 'Iecavas novads', 'Iecavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (404, 125, 'LV', 'LV-JL', 'Jelgavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (405, 125, 'LV', 'LV-JK', 'Jēkabpils novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (406, 125, 'LV', 'Kandavas novads', 'Kandavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (407, 125, 'LV', 'Kokneses novads', 'Kokneses novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (409, 125, 'LV', 'Krustpils novads', 'Krustpils novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (410, 125, 'LV', 'LV-KR', 'Krāslavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (411, 125, 'LV', 'LV-KU', 'Kuldīgas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (414, 125, 'LV', 'LV-LM', 'Limbažu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (415, 125, 'LV', 'Lubānas novads', 'Lubānas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (416, 125, 'LV', 'LV-LU', 'Ludzas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (418, 125, 'LV', 'Līvānu novads', 'Līvānu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (419, 125, 'LV', 'LV-MA', 'Madonas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (421, 125, 'LV', 'Mālpils novads', 'Mālpils novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (422, 125, 'LV', 'Mārupes novads', 'Mārupes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (424, 125, 'LV', 'Neretas novads', 'Neretas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (425, 125, 'LV', 'Nīcas novads', 'Nīcas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (426, 125, 'LV', 'LV-OG', 'Ogres novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (427, 125, 'LV', 'Olaines novads', 'Olaines novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (429, 125, 'LV', 'LV-PR', 'Preiļu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (430, 125, 'LV', 'Priekules novads', 'Priekules novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (435, 125, 'LV', 'Raunas novads', 'Raunas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (437, 125, 'LV', 'Rojas novads', 'Rojas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (438, 125, 'LV', 'Ropažu novads', 'Ropažu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (439, 125, 'LV', 'Rucavas novads', 'Rucavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (440, 125, 'LV', 'Rugāju novads', 'Rugāju novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (441, 125, 'LV', 'Rundāles novads', 'Rundāles novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (442, 125, 'LV', 'LV-RE', 'Rēzeknes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (445, 125, 'LV', 'Salas novads', 'Salas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (446, 125, 'LV', 'Salaspils novads', 'Salaspils novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (447, 125, 'LV', 'LV-SA', 'Saldus novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (449, 125, 'LV', 'Siguldas novads', 'Siguldas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (450, 125, 'LV', 'Skrundas novads', 'Skrundas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (454, 125, 'LV', 'Strenču novads', 'Strenču novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (455, 125, 'LV', 'Sējas novads', 'Sējas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (456, 125, 'LV', 'LV-TA', 'Talsu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (457, 125, 'LV', 'LV-TU', 'Tukuma novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (460, 125, 'LV', 'LV-VK', 'Valkas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (461, 125, 'LV', 'LV-VM', 'Valmieras novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (465, 125, 'LV', 'LV-VE', 'Ventspils novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (466, 125, 'LV', 'Viesītes novads', 'Viesītes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (467, 125, 'LV', 'Viļakas novads', 'Viļakas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (468, 125, 'LV', 'Viļānu novads', 'Viļānu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (470, 125, 'LV', 'Zilupes novads', 'Zilupes novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (471, 125, 'LV', 'Ādažu novads', 'Ādažu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (476, 131, 'LT', 'LT-KU', 'Kauno Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (482, 131, 'LT', 'LT-TE', 'Telšių Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (483, 131, 'LT', 'LT-UT', 'Utenos Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (485, 31, 'BR', 'AC', 'Acre');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (486, 31, 'BR', 'AL', 'Alagoas');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (487, 31, 'BR', 'AP', 'Amapá');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (488, 31, 'BR', 'AM', 'Amazonas');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (489, 31, 'BR', 'BA', 'Bahia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (490, 31, 'BR', 'CE', 'Ceará');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (491, 31, 'BR', 'ES', 'Espírito Santo');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (492, 31, 'BR', 'GO', 'Goiás');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (493, 31, 'BR', 'MA', 'Maranhão');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (494, 31, 'BR', 'MT', 'Mato Grosso');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (495, 31, 'BR', 'MS', 'Mato Grosso do Sul');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (496, 31, 'BR', 'MG', 'Minas Gerais');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (497, 31, 'BR', 'PA', 'Pará');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (498, 31, 'BR', 'PB', 'Paraíba');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (499, 31, 'BR', 'PR', 'Paraná');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (500, 31, 'BR', 'PE', 'Pernambuco');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (501, 31, 'BR', 'PI', 'Piauí');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (502, 31, 'BR', 'RJ', 'Rio de Janeiro');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (503, 31, 'BR', 'RN', 'Rio Grande do Norte');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (504, 31, 'BR', 'RS', 'Rio Grande do Sul');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (505, 31, 'BR', 'RO', 'Rondônia');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (506, 31, 'BR', 'RR', 'Roraima');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (507, 31, 'BR', 'SC', 'Santa Catarina');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (508, 31, 'BR', 'SP', 'São Paulo');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (509, 31, 'BR', 'SE', 'Sergipe');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (510, 31, 'BR', 'TO', 'Tocantins');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (511, 31, 'BR', 'DF', 'Distrito Federal');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (512, 59, 'HR', 'HR-01', 'Zagrebačka županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (515, 59, 'HR', 'HR-04', 'Karlovačka županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (516, 59, 'HR', 'HR-05', 'Varaždinska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (520, 59, 'HR', 'HR-09', 'Ličko-senjska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (524, 59, 'HR', 'HR-13', 'Zadarska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (529, 59, 'HR', 'HR-18', 'Istarska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (531, 59, 'HR', 'HR-20', 'Međimurska županija');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (532, 59, 'HR', 'HR-21', 'Grad Zagreb');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (534, 106, 'IN', 'AP', 'Andhra Pradesh');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (535, 106, 'IN', 'AR', 'Arunachal Pradesh');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (536, 106, 'IN', 'AS', 'Assam');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (537, 106, 'IN', 'BR', 'Bihar');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (538, 106, 'IN', 'CH', 'Chandigarh');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (539, 106, 'IN', 'CT', 'Chhattisgarh');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (541, 106, 'IN', 'DD', 'Daman and Diu');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (542, 106, 'IN', 'DL', 'Delhi');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (543, 106, 'IN', 'GA', 'Goa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (544, 106, 'IN', 'GJ', 'Gujarat');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (545, 106, 'IN', 'HR', 'Haryana');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (546, 106, 'IN', 'HP', 'Himachal Pradesh');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (547, 106, 'IN', 'JK', 'Jammu and Kashmir');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (548, 106, 'IN', 'JH', 'Jharkhand');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (549, 106, 'IN', 'KA', 'Karnataka');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (550, 106, 'IN', 'KL', 'Kerala');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (551, 106, 'IN', 'LD', 'Lakshadweep');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (552, 106, 'IN', 'MP', 'Madhya Pradesh');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (553, 106, 'IN', 'MH', 'Maharashtra');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (554, 106, 'IN', 'MN', 'Manipur');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (555, 106, 'IN', 'ML', 'Meghalaya');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (556, 106, 'IN', 'MZ', 'Mizoram');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (557, 106, 'IN', 'NL', 'Nagaland');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (558, 106, 'IN', 'OR', 'Odisha');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (559, 106, 'IN', 'PY', 'Puducherry');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (560, 106, 'IN', 'PB', 'Punjab');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (561, 106, 'IN', 'RJ', 'Rajasthan');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (562, 106, 'IN', 'SK', 'Sikkim');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (563, 106, 'IN', 'TN', 'Tamil Nadu');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (564, 106, 'IN', 'TG', 'Telangana');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (565, 106, 'IN', 'TR', 'Tripura');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (566, 106, 'IN', 'UP', 'Uttar Pradesh');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (567, 106, 'IN', 'UT', 'Uttarakhand');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (568, 106, 'IN', 'WB', 'West Bengal');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (569, 176, 'PY', 'PY-16', 'Alto Paraguay');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (570, 176, 'PY', 'PY-10', 'Alto Paraná');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (571, 176, 'PY', 'PY-13', 'Amambay');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (572, 176, 'PY', 'PY-ASU', 'Asunción');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (573, 176, 'PY', 'PY-19', 'Boquerón');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (574, 176, 'PY', 'PY-5', 'Caaguazú');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (575, 176, 'PY', 'PY-6', 'Caazapá');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (576, 176, 'PY', 'PY-14', 'Canindeyú');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (577, 176, 'PY', 'PY-11', 'Central');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (578, 176, 'PY', 'PY-1', 'Concepción');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (579, 176, 'PY', 'PY-3', 'Cordillera');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (580, 176, 'PY', 'PY-4', 'Guairá');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (581, 176, 'PY', 'PY-7', 'Itapúa');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (582, 176, 'PY', 'PY-8', 'Misiones');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (583, 176, 'PY', 'PY-9', 'Paraguarí');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (584, 176, 'PY', 'PY-15', 'Presidente Hayes');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (585, 176, 'PY', 'PY-2', 'San Pedro');
INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES (586, 176, 'PY', 'PY-12', 'Ñeembucú');
COMMIT;

-- ----------------------------
-- Table structure for country_translations
-- ----------------------------
DROP TABLE IF EXISTS `country_translations`;
CREATE TABLE `country_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `country_translations_country_id_foreign` (`country_id`),
  CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of country_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for currencies
-- ----------------------------
DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `decimal` int(10) unsigned NOT NULL DEFAULT '2',
  `group_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '.',
  `currency_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of currencies
-- ----------------------------
BEGIN;
INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `group_separator`, `decimal_separator`, `currency_position`, `created_at`, `updated_at`) VALUES (1, 'UAH', 'Українська Гривня', '₴', 2, ',', '.', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for currency_exchange_rates
-- ----------------------------
DROP TABLE IF EXISTS `currency_exchange_rates`;
CREATE TABLE `currency_exchange_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`),
  CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of currency_exchange_rates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_groups_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customer_groups
-- ----------------------------
BEGIN;
INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES (1, 'guest', 'Гість', 0, NULL, NULL);
INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES (2, 'general', 'Загальний', 0, NULL, NULL);
INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES (3, 'wholesale', 'Оптовий', 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for customer_notes
-- ----------------------------
DROP TABLE IF EXISTS `customer_notes`;
CREATE TABLE `customer_notes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_notes_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customer_notes
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `customer_password_resets`;
CREATE TABLE `customer_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `customer_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customer_password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customer_social_accounts
-- ----------------------------
DROP TABLE IF EXISTS `customer_social_accounts`;
CREATE TABLE `customer_social_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `provider_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  KEY `customer_social_accounts_customer_id_foreign` (`customer_id`),
  CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customer_social_accounts
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT '0',
  `is_verified` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspended` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customers_email_unique` (`email`),
  UNIQUE KEY `customers_phone_unique` (`phone`),
  UNIQUE KEY `customers_api_token_unique` (`api_token`),
  KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  KEY `customers_channel_id_foreign` (`channel_id`),
  CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------
BEGIN;
INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `channel_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES (1, 'Микита', 'Мягкой', NULL, NULL, 'example@example.com', NULL, NULL, 1, '$2y$12$iYB7b2RdZbbe5keOpkuy5O1JVRv2VELln6jqot.I.fOmEMIB0JUyi', 'M8ayC2of4J9nEW7RkTLpQ3a2Q2jtgG6JFq9pKHO2W7zDrcmBytqhzw1P853iWgNZEHJXufocVAIbtQw4', 1, 1, 0, 1, 0, '0ca3bce8fcfae60d85d1539cf067ab53', NULL, '2025-09-12 02:41:47', '2025-09-12 02:41:47');
INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `channel_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES (2, 'Микита', 'Мягкой', NULL, NULL, 'niksgreek@gmail.com', NULL, NULL, 1, '$2y$12$FoNjU3S50mDytlCYf5erouD.659U0HPuLkkVZiCfY7vucs669ZvNW', 'yt0b51RHg6Lpuwp4wq3Jw6nt4XBN1ctG0lFVnTgoRXsl2dASujkLsMffN7JFOoSBKNsh8t9NxpEZ2TsB', 1, 1, 0, 1, 0, '066ecdde0c089db31ef0e651721d739f', NULL, '2025-09-16 23:26:07', '2025-09-16 23:26:07');
COMMIT;

-- ----------------------------
-- Table structure for datagrid_saved_filters
-- ----------------------------
DROP TABLE IF EXISTS `datagrid_saved_filters`;
CREATE TABLE `datagrid_saved_filters` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of datagrid_saved_filters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for downloadable_link_purchased
-- ----------------------------
DROP TABLE IF EXISTS `downloadable_link_purchased`;
CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT '0',
  `download_used` int(11) NOT NULL DEFAULT '0',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_item_id` int(10) unsigned NOT NULL,
  `download_canceled` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`),
  CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of downloadable_link_purchased
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gdpr_data_request
-- ----------------------------
DROP TABLE IF EXISTS `gdpr_data_request`;
CREATE TABLE `gdpr_data_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gdpr_data_request_customer_id_foreign` (`customer_id`),
  CONSTRAINT `gdpr_data_request_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of gdpr_data_request
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for import_batches
-- ----------------------------
DROP TABLE IF EXISTS `import_batches`;
CREATE TABLE `import_batches` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `data` json NOT NULL,
  `summary` json DEFAULT NULL,
  `import_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `import_batches_import_id_foreign` (`import_id`),
  CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of import_batches
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for imports
-- ----------------------------
DROP TABLE IF EXISTS `imports`;
CREATE TABLE `imports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `validation_strategy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_errors` int(11) NOT NULL DEFAULT '0',
  `processed_rows_count` int(11) NOT NULL DEFAULT '0',
  `invalid_rows_count` int(11) NOT NULL DEFAULT '0',
  `errors_count` int(11) NOT NULL DEFAULT '0',
  `errors` json DEFAULT NULL,
  `field_separator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images_directory_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `error_file_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` json DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of imports
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for inventory_sources
-- ----------------------------
DROP TABLE IF EXISTS `inventory_sources`;
CREATE TABLE `inventory_sources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `inventory_sources_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of inventory_sources
-- ----------------------------
BEGIN;
INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES (1, 'default', 'За замовчуванням', NULL, 'За замовчуванням', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for invoice_items
-- ----------------------------
DROP TABLE IF EXISTS `invoice_items`;
CREATE TABLE `invoice_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `invoice_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  KEY `invoice_items_parent_id_foreign` (`parent_id`),
  CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of invoice_items
-- ----------------------------
BEGIN;
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (1, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 1, 1, '{\"locale\": \"uk\", \"cart_id\": 2, \"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"11\"}', '2025-09-12 13:42:33', '2025-09-12 13:42:33');
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (2, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 7, 2, '{\"locale\": \"uk\", \"cart_id\": 12, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:25:45', '2025-09-14 19:25:45');
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (3, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 8, 3, '{\"locale\": \"uk\", \"cart_id\": 13, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:27:54', '2025-09-14 19:27:54');
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (4, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 9, 4, '{\"locale\": \"uk\", \"cart_id\": 14, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:59:47', '2025-09-14 19:59:47');
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (5, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 10, 5, '{\"locale\": \"uk\", \"cart_id\": 16, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 22:30:42', '2025-09-14 22:30:42');
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (6, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 'SP-006', 1, 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 5, 6, '{\"locale\": \"uk\", \"cart_id\": 10, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 23:00:39', '2025-09-14 23:00:39');
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (7, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 'SP-006', 1, 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 11, 7, '{\"locale\": \"uk\", \"cart_id\": 17, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 23:24:06', '2025-09-14 23:24:06');
INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES (8, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 4, 8, '{\"locale\": \"uk\", \"cart_id\": 7, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 23:28:24', '2025-09-14 23:28:24');
COMMIT;

-- ----------------------------
-- Table structure for invoices
-- ----------------------------
DROP TABLE IF EXISTS `invoices`;
CREATE TABLE `invoices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reminders` int(11) NOT NULL DEFAULT '0',
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `invoices_order_id_foreign` (`order_id`),
  CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of invoices
-- ----------------------------
BEGIN;
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (1, '1', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 309.0000, 309.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, 1, NULL, 0, NULL, '2025-09-12 13:42:33', '2025-09-14 23:28:27');
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (2, '2', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, 6, NULL, 0, NULL, '2025-09-14 19:25:45', '2025-09-14 23:28:27');
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (3, '3', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, 7, NULL, 0, NULL, '2025-09-14 19:27:54', '2025-09-14 23:28:27');
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (4, '4', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, 8, NULL, 0, NULL, '2025-09-14 19:59:47', '2025-09-14 23:28:27');
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (5, '5', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 309.0000, 309.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, 9, NULL, 0, NULL, '2025-09-14 22:30:42', '2025-09-14 23:28:27');
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (6, '6', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 0.0000, 0.0000, 4, NULL, 0, NULL, '2025-09-14 23:00:39', '2025-09-14 23:28:27');
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (7, '7', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 110.0000, 110.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 10.0000, 10.0000, 10, NULL, 0, NULL, '2025-09-14 23:24:06', '2025-09-14 23:28:27');
INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES (8, '8', 'paid', 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 309.0000, 309.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, 3, NULL, 0, NULL, '2025-09-14 23:28:24', '2025-09-14 23:28:27');
COMMIT;

-- ----------------------------
-- Table structure for job_batches
-- ----------------------------
DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of job_batches
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for locales
-- ----------------------------
DROP TABLE IF EXISTS `locales`;
CREATE TABLE `locales` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direction` enum('ltr','rtl') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locales_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of locales
-- ----------------------------
BEGIN;
INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES (1, 'uk', 'Українська', 'ltr', 'locales/HuvkEdwrdFW7l8gHvDKsWVlmo94NYIyglinPMgKq.png', NULL, NULL);
INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES (3, 'en', 'English', 'ltr', NULL, '2025-09-12 14:37:00', '2025-09-12 14:37:00');
INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES (4, 'ru', 'Русский', 'ltr', NULL, '2025-09-14 01:41:00', '2025-09-14 01:41:00');
COMMIT;

-- ----------------------------
-- Table structure for marketing_campaigns
-- ----------------------------
DROP TABLE IF EXISTS `marketing_campaigns`;
CREATE TABLE `marketing_campaigns` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail_to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spooling` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `marketing_template_id` int(10) unsigned DEFAULT NULL,
  `marketing_event_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`),
  CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of marketing_campaigns
-- ----------------------------
BEGIN;
INSERT INTO `marketing_campaigns` (`id`, `name`, `subject`, `status`, `type`, `mail_to`, `spooling`, `channel_id`, `customer_group_id`, `marketing_template_id`, `marketing_event_id`, `created_at`, `updated_at`) VALUES (1, 'тест', 'тест', 1, '', '', NULL, 1, 1, 1, 2, '2025-09-13 14:10:39', '2025-09-13 14:10:39');
COMMIT;

-- ----------------------------
-- Table structure for marketing_events
-- ----------------------------
DROP TABLE IF EXISTS `marketing_events`;
CREATE TABLE `marketing_events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of marketing_events
-- ----------------------------
BEGIN;
INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES (2, 'тест', 'тест', '2025-09-14', '2025-09-13 14:10:23', '2025-09-14 20:03:24');
COMMIT;

-- ----------------------------
-- Table structure for marketing_templates
-- ----------------------------
DROP TABLE IF EXISTS `marketing_templates`;
CREATE TABLE `marketing_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of marketing_templates
-- ----------------------------
BEGIN;
INSERT INTO `marketing_templates` (`id`, `name`, `status`, `content`, `created_at`, `updated_at`) VALUES (1, 'тест', 'active', '<p>**Тема:** Уведомление о новых заказах<br><br>Здравствуйте, [Имя получателя]!<br><br>Мы рады сообщить вам, что в нашем магазине поступили новые заказы! Вот краткая информация о них:<br><br>**Новые заказы:**<br>1. **Заказ №12345**<br>- Клиент: Иван Иванов<br>- Дата заказа: 01.10.2023<br>- Товар: Смартфон XYZ<br>- Статус: Обрабатывается<br><br>2. **Заказ №12346**<br>- Клиент: Анна Петрова<br>- Дата заказа: 01.10.2023<br>- Товар: Ноутбук ABC<br>- Статус: Ожидает отправки<br><br>3. **Заказ №12347**<br>- Клиент: Сергей Смирнов<br>- Дата заказа: 01.10.2023<br>- Товар: Планшет QRS<br>- Статус: Доставляется<br><br>Пожалуйста, проверьте детали и подтвердите выполнение заказов. Если у вас возникнут вопросы, не стесняйтесь обращаться к нам.<br><br>Спасибо за ваше внимание!<br><br>С уважением, <br>[Ваше имя] <br>[Ваша должность] <br>[Название компании] <br>[Контактная информация]</p>', '2025-09-13 14:10:06', '2025-09-13 14:10:06');
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (2, '2014_10_12_100000_create_admin_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (3, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (4, '2018_06_12_111907_create_admins_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (5, '2018_06_13_055341_create_roles_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (6, '2018_07_05_130148_create_attributes_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (7, '2018_07_05_132854_create_attribute_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (8, '2018_07_05_135150_create_attribute_families_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (9, '2018_07_05_135152_create_attribute_groups_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (10, '2018_07_05_140832_create_attribute_options_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (11, '2018_07_05_140856_create_attribute_option_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (12, '2018_07_05_142820_create_categories_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (13, '2018_07_10_055143_create_locales_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (14, '2018_07_20_054426_create_countries_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (15, '2018_07_20_054502_create_currencies_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (16, '2018_07_20_054542_create_currency_exchange_rates_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (17, '2018_07_20_064849_create_channels_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (18, '2018_07_21_142836_create_category_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (19, '2018_07_23_110040_create_inventory_sources_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (20, '2018_07_24_082635_create_customer_groups_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (21, '2018_07_24_082930_create_customers_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22, '2018_07_27_065727_create_products_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (23, '2018_07_27_070011_create_product_attribute_values_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (24, '2018_07_27_092623_create_product_reviews_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (25, '2018_07_27_113941_create_product_images_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (26, '2018_07_27_113956_create_product_inventories_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (27, '2018_08_30_064755_create_tax_categories_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (28, '2018_08_30_065042_create_tax_rates_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (29, '2018_08_30_065840_create_tax_mappings_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (30, '2018_09_05_150444_create_cart_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (31, '2018_09_05_150915_create_cart_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (32, '2018_09_11_064045_customer_password_resets', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (33, '2018_09_19_093453_create_cart_payment', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (34, '2018_09_19_093508_create_cart_shipping_rates_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (35, '2018_09_20_060658_create_core_config_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (36, '2018_09_27_113154_create_orders_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (37, '2018_09_27_113207_create_order_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (38, '2018_09_27_115022_create_shipments_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (39, '2018_09_27_115029_create_shipment_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (40, '2018_09_27_115135_create_invoices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (41, '2018_09_27_115144_create_invoice_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (42, '2018_10_01_095504_create_order_payment_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (43, '2018_10_03_025230_create_wishlist_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (44, '2018_10_12_101803_create_country_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (45, '2018_10_12_101913_create_country_states_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (46, '2018_10_12_101923_create_country_state_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (47, '2018_11_16_173504_create_subscribers_list_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (48, '2018_11_21_144411_create_cart_item_inventories_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (49, '2018_12_06_185202_create_product_flat_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (50, '2018_12_24_123812_create_channel_inventory_sources_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (51, '2018_12_26_165327_create_product_ordered_inventories_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (52, '2019_05_13_024321_create_cart_rules_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (53, '2019_05_13_024322_create_cart_rule_channels_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (55, '2019_05_13_024324_create_cart_rule_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (56, '2019_05_13_024325_create_cart_rule_customers_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (57, '2019_05_13_024326_create_cart_rule_coupons_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (59, '2019_06_17_180258_create_product_downloadable_samples_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (61, '2019_06_17_180325_create_product_downloadable_links_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (64, '2019_07_02_180307_create_booking_products_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (65, '2019_07_05_154415_create_booking_product_default_slots_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (66, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (67, '2019_07_05_154440_create_booking_product_event_tickets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (68, '2019_07_05_154451_create_booking_product_rental_slots_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (69, '2019_07_05_154502_create_booking_product_table_slots_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (70, '2019_07_30_153530_create_cms_pages_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (71, '2019_07_31_143339_create_category_filterable_attributes_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (72, '2019_08_02_105320_create_product_grouped_products_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (73, '2019_08_20_170510_create_product_bundle_options_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (74, '2019_08_20_170520_create_product_bundle_option_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (75, '2019_08_20_170528_create_product_bundle_option_products_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (76, '2019_09_11_184511_create_refunds_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (77, '2019_09_11_184519_create_refund_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (78, '2019_12_03_184613_create_catalog_rules_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (79, '2019_12_03_184651_create_catalog_rule_channels_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (80, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (81, '2019_12_06_101110_create_catalog_rule_products_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (82, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (83, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (84, '2020_01_14_191854_create_cms_page_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (85, '2020_01_15_130209_create_cms_page_channels_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (86, '2020_02_18_165639_create_bookings_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (87, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (88, '2020_04_16_185147_add_table_addresses', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (89, '2020_05_06_171638_create_order_comments_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (90, '2020_05_21_171500_create_product_customer_group_prices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (91, '2020_06_25_162154_create_customer_social_accounts_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (92, '2020_08_07_174804_create_gdpr_data_request_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (93, '2020_11_19_112228_create_product_videos_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (94, '2020_11_26_141455_create_marketing_templates_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (95, '2020_11_26_150534_create_marketing_events_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (96, '2020_11_26_150644_create_marketing_campaigns_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (97, '2020_12_21_000200_create_channel_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (98, '2020_12_27_121950_create_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (99, '2021_03_11_212124_create_order_transactions_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (100, '2021_04_07_132010_create_product_review_images_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (101, '2021_12_15_104544_notifications', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (102, '2022_03_15_160510_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (103, '2022_04_01_094622_create_sitemaps_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (104, '2022_10_03_144232_create_product_price_indices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (105, '2022_10_04_144444_create_job_batches_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (106, '2022_10_08_134150_create_product_inventory_indices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (107, '2023_05_26_213105_create_wishlist_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (108, '2023_05_26_213120_create_compare_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (109, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (110, '2023_07_06_140013_add_logo_path_column_to_locales', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (111, '2023_07_10_184256_create_theme_customizations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (112, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (113, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (114, '2023_07_25_145943_add_regex_column_in_attributes_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (115, '2023_07_25_165945_drop_notes_column_from_customers_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (116, '2023_07_25_171058_create_customer_notes_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (117, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (118, '2023_09_15_170053_create_theme_customization_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (119, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (120, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (121, '2023_09_26_155709_add_columns_to_currencies', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (122, '2023_10_05_163612_create_visits_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (123, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (124, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (125, '2023_11_08_140116_create_search_terms_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (126, '2023_11_09_162805_create_url_rewrites_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (127, '2023_11_17_150401_create_search_synonyms_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (128, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (129, '2024_01_11_154640_create_imports_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (130, '2024_01_11_154741_create_import_batches_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (131, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (132, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (133, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (134, '2024_02_26_153000_add_columns_to_addresses_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (135, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (136, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (137, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (138, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (139, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (140, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (141, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (142, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (143, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (144, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (145, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (146, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (147, '2024_05_10_152848_create_saved_filters_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (148, '2024_06_03_174128_create_product_channels_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (149, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (150, '2024_06_04_134403_add_channel_id_column_in_visits_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (151, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (152, '2024_07_17_172645_add_additional_column_to_sitemaps_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (153, '2024_10_11_135010_create_product_customizable_options_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (154, '2024_10_11_135110_create_product_customizable_option_translations_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (155, '2024_10_11_135228_create_product_customizable_option_prices_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (156, '2025_05_07_121250_update_total_weight_columns_in_shipments_and_weight_shipment_items_tables', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (157, '2025_09_11_015238_add_true_cloud_theme_config', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (158, '2025_09_13_013430_add_nova_poshta_fields_to_addresses_table', 2);
COMMIT;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_order_id_foreign` (`order_id`),
  CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
BEGIN;
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (1, 'order', 0, 1, '2025-09-12 13:41:54', '2025-09-12 13:41:54');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (2, 'order', 0, 2, '2025-09-13 03:18:33', '2025-09-13 03:18:33');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (3, 'order', 0, 3, '2025-09-13 04:04:38', '2025-09-13 04:04:38');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (4, 'order', 0, 4, '2025-09-14 19:15:08', '2025-09-14 19:15:08');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (5, 'order', 0, 5, '2025-09-14 19:21:07', '2025-09-14 19:21:07');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (6, 'order', 0, 6, '2025-09-14 19:24:59', '2025-09-14 19:24:59');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (7, 'order', 0, 7, '2025-09-14 19:26:56', '2025-09-14 19:26:56');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (8, 'order', 0, 8, '2025-09-14 19:57:47', '2025-09-14 19:57:47');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (9, 'order', 0, 9, '2025-09-14 22:11:27', '2025-09-14 22:11:27');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (10, 'order', 0, 10, '2025-09-14 23:08:50', '2025-09-14 23:08:50');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (11, 'order', 0, 11, '2025-09-19 03:00:05', '2025-09-19 03:00:05');
INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES (12, 'order', 0, 12, '2025-09-19 03:01:05', '2025-09-19 03:01:05');
COMMIT;

-- ----------------------------
-- Table structure for order_comments
-- ----------------------------
DROP TABLE IF EXISTS `order_comments`;
CREATE TABLE `order_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_comments_order_id_foreign` (`order_id`),
  CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_comments
-- ----------------------------
BEGIN;
INSERT INTO `order_comments` (`id`, `order_id`, `comment`, `customer_notified`, `created_at`, `updated_at`) VALUES (1, 4, 'тест', 1, '2025-09-14 22:59:14', '2025-09-14 22:59:14');
INSERT INTO `order_comments` (`id`, `order_id`, `comment`, `customer_notified`, `created_at`, `updated_at`) VALUES (2, 4, '234234', 0, '2025-09-14 22:59:41', '2025-09-14 22:59:41');
COMMIT;

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT '0.0000',
  `total_weight` decimal(12,4) DEFAULT '0.0000',
  `qty_ordered` int(11) DEFAULT '0',
  `qty_shipped` int(11) DEFAULT '0',
  `qty_invoiced` int(11) DEFAULT '0',
  `qty_canceled` int(11) DEFAULT '0',
  `qty_refunded` int(11) DEFAULT '0',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_percent` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned DEFAULT NULL,
  `tax_category_id` int(10) unsigned DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_parent_id_foreign` (`parent_id`),
  KEY `order_items_tax_category_id_foreign` (`tax_category_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_items
-- ----------------------------
BEGIN;
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (1, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 1, 1, 0, 0, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 2, \"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"11\"}', '2025-09-12 13:41:51', '2025-09-12 13:42:57');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (2, 'SP-0010', 'configurable', 'gfegerg', NULL, 6.0000, 6.0000, 1, 0, 0, 0, 0, 777.0000, 777.0000, 777.0000, 777.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 777.0000, 777.0000, 777.0000, 777.0000, 12, 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 6, \"quantity\": 1, \"attributes\": {\"size\": {\"option_id\": 6, \"option_label\": \"S\", \"attribute_name\": \"Розмір\"}, \"color\": {\"option_id\": 2, \"option_label\": \"Зелений\", \"attribute_name\": \"Колір\"}}, \"is_buy_now\": \"0\", \"product_id\": \"12\", \"super_attribute\": {\"23\": \"2\", \"24\": \"6\"}, \"selected_configurable_option\": \"14\"}', '2025-09-13 03:18:31', '2025-09-13 03:18:31');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (3, 'SP-0010-variant-2-6', 'simple', 'Variant 2 6', NULL, 0.0000, 0.0000, 0, 0, 0, 0, 0, 1.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 14, 'Webkul\\Product\\Models\\Product', 2, NULL, 2, '{\"locale\": \"uk\", \"parent_id\": 12, \"product_id\": 14}', '2025-09-13 03:18:31', '2025-09-13 03:18:31');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (4, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 1, 1, 0, 0, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 3, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 7, \"quantity\": 1, \"product_id\": 11}', '2025-09-13 04:04:36', '2025-09-14 23:28:24');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (5, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 1, 1, 1, 0, 0, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 4, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 10, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 19:15:05', '2025-09-14 23:00:39');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (6, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 1, 1, 0, 1, 0, 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 5, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 11, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 19:21:04', '2025-09-14 19:24:12');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (7, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 1, 1, 0, 0, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 6, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 12, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:24:57', '2025-09-14 19:25:45');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (8, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 1, 1, 0, 0, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 7, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 13, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:26:54', '2025-09-14 19:27:54');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (9, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 1, 1, 0, 0, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 8, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 14, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:57:44', '2025-09-14 19:59:47');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (10, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 1, 1, 0, 1, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 9, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 16, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 22:11:22', '2025-09-14 22:31:28');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (11, 'SP-006', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 10.0000, 10.0000, 1, 1, 1, 0, 0, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 10, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 17, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 23:08:46', '2025-09-14 23:24:06');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (12, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 0, 0, 0, 0, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 11, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 19, \"quantity\": 1, \"product_id\": 11}', '2025-09-19 03:00:02', '2025-09-19 03:00:02');
INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES (13, 'SP-008', 'simple', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 77.0000, 77.0000, 1, 0, 0, 0, 0, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 12, NULL, NULL, '{\"locale\": \"uk\", \"cart_id\": 18, \"quantity\": 1, \"product_id\": 11}', '2025-09-19 03:01:03', '2025-09-19 03:01:03');
COMMIT;

-- ----------------------------
-- Table structure for order_payment
-- ----------------------------
DROP TABLE IF EXISTS `order_payment`;
CREATE TABLE `order_payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned DEFAULT NULL,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payment_order_id_foreign` (`order_id`),
  CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_payment
-- ----------------------------
BEGIN;
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (1, 1, 'moneytransfer', 'Money Transfer', NULL, '2025-09-12 13:41:51', '2025-09-12 13:41:51');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (2, 2, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-13 03:18:31', '2025-09-13 03:18:31');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (3, 3, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-13 04:04:36', '2025-09-13 04:04:36');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (4, 4, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-14 19:15:05', '2025-09-14 19:15:05');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (5, 5, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-14 19:21:04', '2025-09-14 19:21:04');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (6, 6, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-14 19:24:57', '2025-09-14 19:24:57');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (7, 7, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-14 19:26:54', '2025-09-14 19:26:54');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (8, 8, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-14 19:57:44', '2025-09-14 19:57:44');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (9, 9, 'cashondelivery', 'Cash On Delivery', NULL, '2025-09-14 22:11:22', '2025-09-14 22:11:22');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (10, 10, 'cashondelivery', 'Накладений платіж', NULL, '2025-09-14 23:08:46', '2025-09-14 23:08:46');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (11, 11, 'cashondelivery', 'Накладений платіж', NULL, '2025-09-19 03:00:02', '2025-09-19 03:00:02');
INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES (12, 12, 'cashondelivery', 'Накладений платіж', NULL, '2025-09-19 03:01:03', '2025-09-19 03:01:03');
COMMIT;

-- ----------------------------
-- Table structure for order_transactions
-- ----------------------------
DROP TABLE IF EXISTS `order_transactions`;
CREATE TABLE `order_transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT '0.0000',
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` json DEFAULT NULL,
  `invoice_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_transactions_order_id_foreign` (`order_id`),
  CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of order_transactions
-- ----------------------------
BEGIN;
INSERT INTO `order_transactions` (`id`, `transaction_id`, `status`, `type`, `amount`, `payment_method`, `data`, `invoice_id`, `order_id`, `created_at`, `updated_at`) VALUES (1, '05ab5982197aa5f8cc75f50dd6af065e', 'paid', 'cashondelivery', 299.0000, 'cashondelivery', NULL, 2, 6, '2025-09-14 19:25:45', '2025-09-14 19:25:45');
INSERT INTO `order_transactions` (`id`, `transaction_id`, `status`, `type`, `amount`, `payment_method`, `data`, `invoice_id`, `order_id`, `created_at`, `updated_at`) VALUES (2, 'e0a19e06310aa9d4707dc3519066f8ad', 'paid', 'cashondelivery', 299.0000, 'cashondelivery', NULL, 3, 7, '2025-09-14 19:27:54', '2025-09-14 19:27:54');
INSERT INTO `order_transactions` (`id`, `transaction_id`, `status`, `type`, `amount`, `payment_method`, `data`, `invoice_id`, `order_id`, `created_at`, `updated_at`) VALUES (3, 'a3191f83fe96019012b54734ad78721d', 'paid', 'cashondelivery', 299.0000, 'cashondelivery', NULL, 4, 8, '2025-09-14 19:59:47', '2025-09-14 19:59:47');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT '0',
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_invoiced` decimal(12,4) DEFAULT '0.0000',
  `sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total_refunded` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_discount_refunded` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT '0.0000',
  `tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_invoiced` decimal(12,4) DEFAULT '0.0000',
  `shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_refunded` decimal(12,4) DEFAULT '0.0000',
  `shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `channel_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  KEY `orders_customer_id_foreign` (`customer_id`),
  KEY `orders_channel_id_foreign` (`channel_id`),
  CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (1, '1', 'completed', 'За замовчуванням', 1, '345345345@4234.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 309.0000, 309.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 2, NULL, '2025-09-12 13:41:51', '2025-09-12 13:42:57');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (2, '2', 'pending', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 787.0000, 787.0000, 0.0000, 0.0000, 0.0000, 0.0000, 777.0000, 777.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 777.0000, 777.0000, 10.0000, 10.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 6, NULL, '2025-09-13 03:18:31', '2025-09-13 03:18:31');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (3, '3', 'completed', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 309.0000, 309.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 7, NULL, '2025-09-13 04:04:36', '2025-09-14 23:28:27');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (4, '4', 'completed', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 10, NULL, '2025-09-14 19:15:05', '2025-09-14 23:00:43');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (5, '5', 'canceled', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 11, NULL, '2025-09-14 19:21:04', '2025-09-14 19:24:12');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (6, '6', 'completed', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 12, NULL, '2025-09-14 19:24:57', '2025-09-14 19:25:45');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (7, '7', 'completed', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 13, NULL, '2025-09-14 19:26:54', '2025-09-14 19:27:54');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (8, '8', 'completed', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'free_free', 'Free Shipping - Free Shipping', 'Free Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 14, NULL, '2025-09-14 19:57:44', '2025-09-14 19:59:47');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (9, '9', 'closed', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 309.0000, 309.0000, 309.0000, 309.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 16, NULL, '2025-09-14 22:11:22', '2025-09-14 22:31:28');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (10, '10', 'completed', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 110.0000, 110.0000, 110.0000, 110.0000, 0.0000, 0.0000, 100.0000, 100.0000, 100.0000, 100.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 100.0000, 100.0000, 10.0000, 10.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 17, NULL, '2025-09-14 23:08:46', '2025-09-14 23:24:10');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (11, '11', 'pending', 'За замовчуванням', 1, 'niksgreek@gmail.com', 'Nikita', 'Miahkoy', 'flatrate_flatrate', 'Нова пошта - Нова пошта', 'Flat Rate Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, NULL, NULL, 1, 'Webkul\\Core\\Models\\Channel', 19, NULL, '2025-09-19 03:00:02', '2025-09-19 03:00:02');
INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES (12, '12', 'pending', 'За замовчуванням', 0, 'niksgreek@gmail.com', 'Микита', 'Мягкой', 'flatrate_flatrate', 'Нова пошта - Нова пошта', 'Flat Rate Shipping', NULL, 0, 1, 1, 'UAH', 'UAH', 'UAH', 309.0000, 309.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, 2, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 18, NULL, '2025-09-19 03:01:03', '2025-09-19 03:01:03');
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `product_attribute_values`;
CREATE TABLE `product_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_value` text COLLATE utf8mb4_unicode_ci,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` json DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  KEY `product_attribute_values_product_id_foreign` (`product_id`),
  KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=385 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_attribute_values
-- ----------------------------
BEGIN;
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (1, 'uk', NULL, 'Арктична затишна в\'язана шапка для чоловіків і жінок', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 'uk|1|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (2, 'uk', NULL, 'Стильно насолоджуйтесь холодними днями з нашою Арктичною затишною в\'язаною шапкою. Виготовлена з м\'якого і міцного акрилового в\'язання, ця класична шапка пропонує тепло і універсальність. Підходить як для чоловіків, так і для жінок, вона є ідеальним аксесуаром для невимушеного або зовнішнього одягу. Підніміть свій зимовий гардероб або подаруйте комусь особливому цю необхідну шапку.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, 'uk|1|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (3, 'uk', NULL, 'Арктична затишна в\'язана шапка - ваше рішення для збереження тепла, комфорту і стилю протягом холодних місяців. Виготовлена з м\'якого і міцного акрилового в\'язання, ця шапка призначена для забезпечення затишку і гарного прилягання. Класичний дизайн робить його підходящим як для чоловіків, так і для жінок, пропонуючи універсальний аксесуар, який доповнює різні стилі. Незалежно від того, чи ви вирушаєте на невимушений день в місті, чи насолоджуєтеся великими просторами, ця шапка додає комфорту і тепла вашому образу. М\'який і дихаючий матеріал забезпечує затишок без втрати стилю. Арктична затишна в\'язана шапка - це не просто аксесуар; це вираз зимової моди. Його простота дозволяє легко поєднувати з різними образами, роблячи його основою вашого зимового гардеробу. Ідеально підходить для подарунків або як задоволення для себе, ця шапка є міркуванням про будь-яний зимовий образ. Це універсальний аксесуар, який виходить за межі функціональності, додаючи нотку тепла і стилю вашому вигляду. Прийміть суть зими з Арктичною затишною в\'язаною шапкою. Незалежно від того, чи ви насолоджуєтеся невимушеним днем або стикаєтеся з елементами, нехай ця шапка стане вашим спутником комфорту і стилю. Підніміть свій зимовий гардероб з цим класичним аксесуаром, який легко поєднує тепло з вічним почуттям моди.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 'uk|1|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (4, 'uk', NULL, 'arctic-cozy-knit-unisex-beanie', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 'uk|1|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (5, 'uk', NULL, 'Мета заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16, 'uk|1|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (6, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17, 'uk|1|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (7, 'uk', NULL, 'мета опис', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18, 'uk|1|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (8, 'uk', NULL, 'Арктичний шарф Бліс', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'uk|2|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (9, 'uk', NULL, 'Відчуйте обійми тепла і стилю з нашим Арктичним шарфом Бліс. Виготовлений з розкішного поєднання акрилу і вовни, цей затишний шарф призначений, щоб вас зігрівати в холодні дні. Його стильний і універсальний дизайн, разом з додатковою довжиною, пропонує варіанти налаштування стилю. Підніміть свій зимовий гардероб або порадуйте когось особливого цим необхідним зимовим аксесуаром.', NULL, NULL, NULL, NULL, NULL, NULL, 2, 9, 'uk|2|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (10, 'uk', NULL, 'Арктична шарф зима Бліс - це не просто аксесуар для холодної погоди; це заява про тепло, комфорт і стиль для зимового сезону. Виготовлений з дбайливістю з розкішного поєднання акрилу і вовни, цей шарф призначений, щоб вас зігрівати і затишувати навіть в найхолодніші температури. М\'яка і пухка текстура не тільки забезпечує ізоляцію від холоду, але й додає штрих розкіші до вашого зимового гардеробу. Дизайн Арктичної шарфа Бліс одночасно стильний і універсальний, що робить його ідеальним доповненням до різних зимових образів. Незалежно від того, чи готуєтеся ви до особливої події, чи додаєте шикарний шар до повсякденного вигляду, цей шарф легко поєднується з вашим стилем. Додаткова довжина шарфа пропонує варіанти налаштування стилю. Зав\'яжіть його для додаткового тепла, розпустіть його для невимушеного вигляду або експериментуйте з різними вузлами, щоб виразити свій унікальний стиль. Ця універсальність робить його невід\'ємним аксесуаром для зимового сезону. Шукаєте ідеальний подарунок? Арктичний шарф Бліс - ідеальний вибір. Чи ви здивуєте кохану людину, чи порадуєте себе, цей шарф є вічним і практичним подарунком, який буде цінуватися протягом всіх зимових місяців. Зануртесь у зиму з Арктичним шарфом Бліс, де тепло зустрічається зі стилем в ідеальній гармонії. Підніміть свій зимовий гардероб цим необхідним аксесуаром, який не тільки зігріває, але й додає штрих солідності до вашого зимового образу.', NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, 'uk|2|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (11, 'uk', NULL, 'arctic-bliss-stylish-winter-scarf', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 'uk|2|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (12, 'uk', NULL, 'Мета заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 2, 16, 'uk|2|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (13, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 2, 17, 'uk|2|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (14, 'uk', NULL, 'мета опис', NULL, NULL, NULL, NULL, NULL, NULL, 2, 18, 'uk|2|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (15, 'uk', NULL, 'Арктичні сенсорні зимові рукавички', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 'uk|3|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (16, 'uk', NULL, 'Залишайтесь на зв\'язку і теплими з нашими Арктичними сенсорними зимовими рукавичками. Ці рукавички виготовлені не тільки з високоякісного акрилу для тепла і міцності, але й мають сенсорну функцію для роботи з дотиковим екраном. З утепленою підкладкою, еластичними манжетами для надійної посадки і стильним виглядом, ці рукавички ідеально підходять для щоденного використання в холодних умовах.', NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 'uk|3|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (17, 'uk', NULL, 'Представляємо Арктичні сенсорні зимові рукавички - де тепло, стиль і підключення зустрічаються, щоб покращити вашу зимову витримку. Виготовлені з високоякісного акрилу, ці рукавички призначені для надання виняткового тепла і міцності. Сенсорні кінчики пальців, сумісні з дотиковим екраном, дозволяють вам залишатися на зв\'язку, не викладаючи руки на холод. Відповідайте на дзвінки, відправляйте повідомлення та навігуйте по своїх пристроях легко, не віддаючи свої руки затишку. Утеплена підкладка додає додатковий шар затишку, роблячи ці рукавички вашим вибором для зустрічі зимового холоду. Незалежно від того, чи ви їдете на роботу, виконуєте справи або насолоджуєтеся активними відпочинком на вулиці, ці рукавички надають тепло і захист, які вам потрібні. Еластичні манжети забезпечують надійну посадку, запобігаючи проникненню холодного повітря і утримуючи рукавички на місці під час щоденних справ. Стильний дизайн додає штриху елегантності до вашого зимового образу, роблячи ці рукавички модними і функціональними. Ідеально підходять для подарунків або як задоволення для себе, Арктичні сенсорні зимові рукавички - це необхідний аксесуар для сучасної людини. Попрощайтеся з незручністю видаляти рукавички, щоб користуватися пристроями, і приймайте безшовне поєднання тепла, стилю і підключення. Залишайтесь на зв\'язку, залишайтесь теплими і залишайтесь стильними з Арктичними сенсорними зимовими рукавичками - вашим надійним спутником для завоювання зимового сезону з впевненістю.', NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, 'uk|3|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (18, 'uk', NULL, 'arctic-touchscreen-winter-gloves', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 'uk|3|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (19, 'uk', NULL, 'Мета заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 3, 16, 'uk|3|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (20, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 3, 17, 'uk|3|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (21, 'uk', NULL, 'мета опис', NULL, NULL, NULL, NULL, NULL, NULL, 3, 18, 'uk|3|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (22, 'uk', NULL, 'Арктичні шкарпетки з вовняними сумішами', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 'uk|4|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (23, 'uk', NULL, 'Відчуйте неперевершене тепло і комфорт наших Арктичних шкарпеток з вовняною сумішшю. Виготовлені з суміші мериносової вовни, акрилу, нейлону і спандексу, ці шкарпетки пропонують найвищий комфорт для холодної погоди. З посиленою п\'ятою і носком для міцності, ці універсальні і стильні шкарпетки ідеально підходять для різних випадків.', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9, 'uk|4|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (24, 'uk', NULL, 'Представляємо Арктичні шкарпетки з вовняними сумішами - ваш незамінний спутник для затишку і комфорту ніг протягом холодних сезонів. Виготовлені з преміальної суміші мериносової вовни, акрилу, нейлону і спандексу, ці шкарпетки призначені для надання неперевершеного тепла і комфорту. Вовняна суміш забезпечує, що ваші ноги залишаються теплими навіть в найхолодніших температурах, роблячи ці шкарпетки ідеальним вибором для зимових пригод або просто для затишку вдома. М\'яка і затишна текстура шкарпеток надає розкішного відчуття на шкірі. Попрощайтеся з холодними ногами, насолоджуючись пухнастим теплом, яке надають ці шкарпетки з вовняною сумішшю. Завдяки дизайну для міцності, шкарпетки мають посилену п\'яту і носок, що додає додаткову міцність в зони з високим навантаженням. Це забезпечує, що ваші шкарпетки витримають випробування часу, надаючи довготривалу зручність і затишок. Дихаюча природа матеріалу запобігає перегріванню, дозволяючи вашим ногам залишатися комфортними і сухими протягом усього дня. Незалежно від того, чи ви вирушаєте на зимову прогулянку, чи відпочиваєте вдома, ці шкарпетки пропонують ідеальний баланс тепла і дихання. Універсальні і стильні, ці шкарпетки з вовняною сумішшю підходять для різних випадків. Поєднуйте їх з улюбленими чоботами для модного зимового вигляду або носіть вдома для максимального комфорту. Підніміть свій зимовий гардероб і надайте перевагу комфорту з Арктичними шкарпетками з вовняною сумішшю. Побалуйте свої ноги розкішшю, яку вони заслуговують, і відчуйте затишок, який триває протягом всього сезону.', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10, 'uk|4|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (25, 'uk', NULL, 'arctic-warmth-wool-blend-socks', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, 'uk|4|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (26, 'uk', NULL, 'Мета заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16, 'uk|4|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (27, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17, 'uk|4|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (28, 'uk', NULL, 'мета опис', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18, 'uk|4|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (29, 'uk', NULL, 'Набір аксесуарів для зими Arctic Frost', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 'uk|5|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (30, 'uk', NULL, 'Приймайте зимовий холод з нашим набором аксесуарів Arctic Frost. Цей підібраний набір включає розкішний шарф, затишну шапку, рукавички, сумісні з сенсорним екраном, та шкарпетки зі шерсті. Стильний і функціональний, цей ансамбль виготовлений з високоякісних матеріалів, що гарантує як міцність, так і комфорт. Піднімайте свій зимовий гардероб або радуйте когось особливого цим ідеальним подарунком.', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, 'uk|5|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (31, 'uk', NULL, 'Представляємо вам набір аксесуарів для зими Arctic Frost, ваше рішення для збереження тепла, стилю та зв\'язку під час холодних зимових днів. Цей уважно підібраний набір об\'єднує чотири необхідні зимові аксесуари, щоб створити гармонійний ансамбль. Розкішний шарф, в\'язаний з суміші акрилу та вовни, не тільки додає тепла, але й приносить штрих елегантності до вашого зимового гардеробу. М\'яка в\'язана шапка, виготовлена з дбайливістю, обіцяє зберегти вас затишними, додаючи модний шарм до вашого образу. Але це ще не все - наш набір також включає рукавички, сумісні з сенсорним екраном. Залишайтесь на зв\'язку, не жертвуючи теплом, користуючись своїми пристроями без зусиль. Незалежно від того, чи ви відповідаєте на дзвінки, відправляєте повідомлення або робите знімки зимових моментів на своєму смартфоні, ці рукавички забезпечують зручність без втрати стилю. М\'яка і затишна текстура шкарпеток надає розкішного відчуття на вашій шкірі. Попрощайтеся з холодними ногами, насолоджуючись теплом, яке надають ці шкарпетки зі шерсті. Набір аксесуарів для зими Arctic Frost - це не тільки функціональність, а й вираз моди взимку. Кожен елемент призначений не тільки захищати вас від холоду, але й підкреслювати ваш стиль під час морозної пори року. Матеріали, вибрані для цього набору, пріоритетно поєднують в собі як міцність, так і комфорт, забезпечуючи можливість насолоджуватися зимовим чудом у стилі. Незалежно від того, чи ви радуєте себе, чи шукаєте ідеальний подарунок, набір аксесуарів для зими Arctic Frost є універсальним вибором. Порадуйте когось особливого під час святкового сезону або підніміть свій власний зимовий гардероб за допомогою цього стильного та функціонального ансамблю. Зустрічайте мороз з впевненістю, знаючи, що у вас є ідеальні аксесуари, щоб зігріти вас і підкреслити вашу елегантність.', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, 'uk|5|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (32, 'uk', NULL, 'arctic-frost-winter-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, 'uk|5|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (33, 'uk', NULL, 'Мета-заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 5, 16, 'uk|5|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (34, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 5, 17, 'uk|5|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (35, 'uk', NULL, 'мета-опис', NULL, NULL, NULL, NULL, NULL, NULL, 5, 18, 'uk|5|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (36, 'uk', NULL, 'Набір аксесуарів для зими Arctic Frost', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 'uk|6|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (37, 'uk', NULL, 'Приймайте зимовий холод з нашим набором аксесуарів Arctic Frost. Цей підібраний набір включає розкішний шарф, затишну шапку, рукавички, сумісні з сенсорним екраном, та шкарпетки зі шерсті. Стильний і функціональний, цей ансамбль виготовлений з високоякісних матеріалів, що гарантує як міцність, так і комфорт. Піднімайте свій зимовий гардероб або радуйте когось особливого цим ідеальним подарунком.', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9, 'uk|6|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (38, 'uk', NULL, 'Представляємо вам набір аксесуарів для зими Arctic Frost, ваше рішення для збереження тепла, стилю та зв\'язку під час холодних зимових днів. Цей уважно підібраний набір об\'єднує чотири необхідні зимові аксесуари, щоб створити гармонійний ансамбль. Розкішний шарф, в\'язаний з суміші акрилу та вовни, не тільки додає тепла, але й приносить штрих елегантності до вашого зимового гардеробу. М\'яка в\'язана шапка, виготовлена з дбайливістю, обіцяє зберегти вас затишними, додаючи модний шарм до вашого образу. Але це ще не все - наш набір також включає рукавички, сумісні з сенсорним екраном. Залишайтесь на зв\'язку, не жертвуючи теплом, користуючись своїми пристроями без зусиль. Незалежно від того, чи ви відповідаєте на дзвінки, відправляєте повідомлення або робите знімки зимових моментів на своєму смартфоні, ці рукавички забезпечують зручність без втрати стилю. М\'яка і затишна текстура шкарпеток надає розкішного відчуття на вашій шкірі. Попрощайтеся з холодними ногами, насолоджуючись теплом, яке надають ці шкарпетки зі шерсті. Набір аксесуарів для зими Arctic Frost - це не тільки функціональність, а й вираз моди взимку. Кожен елемент призначений не тільки захищати вас від холоду, але й підкреслювати ваш стиль під час морозної пори року. Матеріали, вибрані для цього набору, пріоритетно поєднують в собі як міцність, так і комфорт, забезпечуючи можливість насолоджуватися зимовим чудом у стилі. Незалежно від того, чи ви радуєте себе, чи шукаєте ідеальний подарунок, набір аксесуарів для зими Arctic Frost є універсальним вибором. Порадуйте когось особливого під час святкового сезону або підніміть свій власний зимовий гардероб за допомогою цього стильного та функціонального ансамблю. Зустрічайте мороз з впевненістю, знаючи, що у вас є ідеальні аксесуари, щоб зігріти вас і підкреслити вашу елегантність.', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10, 'uk|6|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (39, 'uk', NULL, 'arctic-frost-winter-accessories-bundle', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3, 'uk|6|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (40, 'uk', NULL, 'Мета-заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16, 'uk|6|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (41, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17, 'uk|6|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (42, 'uk', NULL, 'мета-опис', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18, 'uk|6|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (43, 'uk', NULL, 'Куртка OmniHeat Men\'s Solid Hooded Puffer', NULL, NULL, NULL, NULL, NULL, NULL, 7, 2, 'uk|7|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (44, 'uk', NULL, 'Залишайтеся теплими та стильними з нашою курткою OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.', NULL, NULL, NULL, NULL, NULL, NULL, 7, 9, 'uk|7|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (45, 'uk', NULL, 'Представляємо вам куртку OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла та модного вигляду під час холодних сезонів. Ця куртка виготовлена з міцністю та теплотою на увазі, що забезпечує їй стати вашим надійним спутником. Капюшон не тільки додає штриху стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів та погодних умов. Повні рукави забезпечують повне покриття, що гарантує, що ви залишитеся затишними від плеча до зап\'ястя. Завдяки кишеням для вставок, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями та ночами. Виготовлена з міцного поліестерового покриття та підкладки, ця куртка створена для того, щоб протистояти елементам та тривати. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю та уподобанням. Універсальна та функціональна, куртка OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадкову прогулянку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту та функціональності з курткою OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб та залишайтеся затишними, насолоджуючись природою. Перемагайте холод у стилі та робіть заяву з цим незамінним елементом.', NULL, NULL, NULL, NULL, NULL, NULL, 7, 10, 'uk|7|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (46, 'uk', NULL, 'omniheat-mens-solid-hooded-puffer-jacket', NULL, NULL, NULL, NULL, NULL, NULL, 7, 3, 'uk|7|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (47, 'uk', NULL, 'Мета-заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 7, 16, 'uk|7|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (48, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 7, 17, 'uk|7|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (49, 'uk', NULL, 'мета-опис', NULL, NULL, NULL, NULL, NULL, NULL, 7, 18, 'uk|7|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (50, 'uk', NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-M', NULL, NULL, NULL, NULL, NULL, NULL, 8, 2, 'uk|8|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (51, 'uk', NULL, 'Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.', NULL, NULL, NULL, NULL, NULL, NULL, 8, 9, 'uk|8|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (52, 'uk', NULL, 'Представляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.', NULL, NULL, NULL, NULL, NULL, NULL, 8, 10, 'uk|8|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (53, 'uk', NULL, 'omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-m', NULL, NULL, NULL, NULL, NULL, NULL, 8, 3, 'uk|8|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (54, 'uk', NULL, 'Мета-заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 8, 16, 'uk|8|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (55, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 8, 17, 'uk|8|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (56, 'uk', NULL, 'мета-опис', NULL, NULL, NULL, NULL, NULL, NULL, 8, 18, 'uk|8|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (57, 'uk', NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, NULL, NULL, NULL, NULL, NULL, 9, 2, 'uk|9|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (58, 'uk', NULL, '<p>Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 9, 'uk|9|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (59, 'uk', NULL, '<p>DescПредставляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.ription 9</p>', NULL, NULL, NULL, NULL, NULL, NULL, 9, 10, 'uk|9|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (60, 'uk', NULL, 'omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-l', NULL, NULL, NULL, NULL, NULL, NULL, 9, 3, 'uk|9|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (61, 'uk', NULL, 'Мета-заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 9, 16, 'uk|9|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (62, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 9, 17, 'uk|9|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (63, 'uk', NULL, 'мета-опис', NULL, NULL, NULL, NULL, NULL, NULL, 9, 18, 'uk|9|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (64, 'uk', NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-M', NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 'uk|10|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (65, 'uk', NULL, 'Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.', NULL, NULL, NULL, NULL, NULL, NULL, 10, 9, 'uk|10|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (66, 'uk', NULL, 'Представляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.', NULL, NULL, NULL, NULL, NULL, NULL, 10, 10, 'uk|10|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (67, 'uk', NULL, 'omniheat-mens-solid-hooded-puffer-jacket-blue-green-m', NULL, NULL, NULL, NULL, NULL, NULL, 10, 3, 'uk|10|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (68, 'uk', NULL, 'Мета-заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 10, 16, 'uk|10|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (69, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 10, 17, 'uk|10|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (70, 'uk', NULL, 'мета-опис', NULL, NULL, NULL, NULL, NULL, NULL, 10, 18, 'uk|10|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (71, 'uk', NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, NULL, NULL, NULL, NULL, NULL, 11, 2, 'uk|11|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (72, 'uk', NULL, '<p>Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 9, 'uk|11|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (73, 'uk', NULL, '<p>Представляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 11, 10, 'uk|11|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (74, 'uk', NULL, 'omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', NULL, NULL, NULL, NULL, NULL, NULL, 11, 3, 'uk|11|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (75, 'uk', NULL, 'Мета-заголовок', NULL, NULL, NULL, NULL, NULL, NULL, 11, 16, 'uk|11|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (76, 'uk', NULL, 'мета1, мета2, мета3', NULL, NULL, NULL, NULL, NULL, NULL, 11, 17, 'uk|11|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (77, 'uk', NULL, 'мета-опис', NULL, NULL, NULL, NULL, NULL, NULL, 11, 18, 'uk|11|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (78, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 19, '11|19');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (79, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 20, '11|20');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (80, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 21, '11|21');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (81, NULL, NULL, '77', NULL, NULL, NULL, NULL, NULL, NULL, 11, 22, '11|22');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (82, NULL, NULL, 'SP-008', NULL, NULL, NULL, NULL, NULL, NULL, 11, 1, '11|1');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (83, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 11, 27, '11|27');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (84, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 28, 'default|11|28');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (85, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 5, '11|5');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (86, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 6, '11|6');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (87, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 7, '11|7');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (88, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 8, 'default|11|8');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (89, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 11, 26, '11|26');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (90, NULL, NULL, NULL, NULL, NULL, 299.0000, NULL, NULL, NULL, 11, 11, '11|11');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 12, '11|12');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 13, '11|13');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (93, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 14, 'default|11|14');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (94, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 15, 'default|11|15');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (95, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 11, 23, '11|23');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (96, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 11, 24, '11|24');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (97, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 19, '9|19');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (98, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 20, '9|20');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (99, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 21, '9|21');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (100, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 9, 22, '9|22');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (101, NULL, NULL, 'SP-006', NULL, NULL, NULL, NULL, NULL, NULL, 9, 1, '9|1');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (102, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 9, 23, '9|23');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (103, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 9, 24, '9|24');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (104, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 9, 27, '9|27');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (105, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 28, 'default|9|28');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (106, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 5, '9|5');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (107, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 6, '9|6');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (108, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 7, '9|7');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (109, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 8, 'default|9|8');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (110, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 9, 26, '9|26');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (111, NULL, NULL, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 9, 11, '9|11');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 12, '9|12');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 13, '9|13');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (114, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 14, 'default|9|14');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (115, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 9, 15, 'default|9|15');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (116, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 11, 25, '11|25');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (117, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, 9, 25, '9|25');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (118, NULL, NULL, 'SP-0010-variant-1-6', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, '13|1');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (119, 'uk', NULL, 'Variant 1 6', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, 'uk|13|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (120, 'uk', NULL, 'SP-0010-variant-1-6', NULL, NULL, NULL, NULL, NULL, NULL, 13, 3, 'uk|13|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (121, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 13, 4, 'default|13|4');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (122, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 8, 'default|13|8');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (123, 'uk', NULL, 'SP-0010-variant-1-6', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9, 'uk|13|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (124, 'uk', NULL, 'SP-0010-variant-1-6', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10, 'uk|13|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (125, NULL, NULL, NULL, NULL, NULL, 666.0000, NULL, NULL, NULL, 13, 11, '13|11');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (126, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, 13, 22, '13|22');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (127, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 13, 23, '13|23');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (128, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 13, 24, '13|24');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (129, NULL, NULL, 'SP-0010-variant-2-6', NULL, NULL, NULL, NULL, NULL, NULL, 14, 1, '14|1');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (130, 'uk', NULL, 'Variant 2 6', NULL, NULL, NULL, NULL, NULL, NULL, 14, 2, 'uk|14|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (131, 'uk', NULL, 'SP-0010-variant-2-6', NULL, NULL, NULL, NULL, NULL, NULL, 14, 3, 'uk|14|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (132, NULL, 'default', NULL, NULL, 0, NULL, NULL, NULL, NULL, 14, 4, 'default|14|4');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (133, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 14, 8, 'default|14|8');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (134, 'uk', NULL, 'SP-0010-variant-2-6', NULL, NULL, NULL, NULL, NULL, NULL, 14, 9, 'uk|14|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (135, 'uk', NULL, 'SP-0010-variant-2-6', NULL, NULL, NULL, NULL, NULL, NULL, 14, 10, 'uk|14|10');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (136, NULL, NULL, NULL, NULL, NULL, 777.0000, NULL, NULL, NULL, 14, 11, '14|11');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (137, NULL, NULL, '6', NULL, NULL, NULL, NULL, NULL, NULL, 14, 22, '14|22');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (138, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 14, 23, '14|23');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (139, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, 14, 24, '14|24');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (370, NULL, NULL, 'SP-0010', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, '12|1');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (371, 'uk', NULL, 'gfegerg', NULL, NULL, NULL, NULL, NULL, NULL, 12, 2, 'uk|12|2');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (372, 'uk', NULL, 'gfegerg', NULL, NULL, NULL, NULL, NULL, NULL, 12, 3, 'uk|12|3');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (373, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 27, '12|27');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (374, NULL, 'default', NULL, 0, NULL, NULL, NULL, NULL, NULL, 12, 28, 'default|12|28');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (375, 'uk', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 16, 'uk|12|16');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (376, 'uk', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 17, 'uk|12|17');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (377, 'uk', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 12, 18, 'uk|12|18');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (378, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 5, '12|5');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (379, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 6, '12|6');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (380, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 7, '12|7');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (381, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 8, 'default|12|8');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (382, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 12, 26, '12|26');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (383, 'uk', NULL, '<p>gerger</p>', NULL, NULL, NULL, NULL, NULL, NULL, 12, 9, 'uk|12|9');
INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES (384, 'uk', NULL, '<p>ergerg</p>', NULL, NULL, NULL, NULL, NULL, NULL, 12, 10, 'uk|12|10');
COMMIT;

-- ----------------------------
-- Table structure for product_bundle_option_products
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_option_products`;
CREATE TABLE `product_bundle_option_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `is_user_defined` tinyint(1) NOT NULL DEFAULT '1',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  KEY `product_bundle_option_id_foreign` (`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_bundle_option_products
-- ----------------------------
BEGIN;
INSERT INTO `product_bundle_option_products` (`id`, `product_id`, `product_bundle_option_id`, `qty`, `is_user_defined`, `is_default`, `sort_order`) VALUES (1, 1, 1, 1, 1, 0, 0);
INSERT INTO `product_bundle_option_products` (`id`, `product_id`, `product_bundle_option_id`, `qty`, `is_user_defined`, `is_default`, `sort_order`) VALUES (2, 2, 2, 2, 1, 1, 1);
INSERT INTO `product_bundle_option_products` (`id`, `product_id`, `product_bundle_option_id`, `qty`, `is_user_defined`, `is_default`, `sort_order`) VALUES (3, 3, 3, 1, 1, 1, 2);
INSERT INTO `product_bundle_option_products` (`id`, `product_id`, `product_bundle_option_id`, `qty`, `is_user_defined`, `is_default`, `sort_order`) VALUES (4, 4, 4, 2, 1, 0, 3);
COMMIT;

-- ----------------------------
-- Table structure for product_bundle_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_option_translations`;
CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_bundle_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`),
  CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_bundle_option_translations
-- ----------------------------
BEGIN;
INSERT INTO `product_bundle_option_translations` (`id`, `locale`, `label`, `product_bundle_option_id`) VALUES (1, 'uk', 'Пакет Варіант 1', 1);
INSERT INTO `product_bundle_option_translations` (`id`, `locale`, `label`, `product_bundle_option_id`) VALUES (2, 'uk', 'Пакет Варіант 1', 2);
INSERT INTO `product_bundle_option_translations` (`id`, `locale`, `label`, `product_bundle_option_id`) VALUES (3, 'uk', 'Пакет Варіант 2', 3);
INSERT INTO `product_bundle_option_translations` (`id`, `locale`, `label`, `product_bundle_option_id`) VALUES (4, 'uk', 'Пакет Варіант 2', 4);
COMMIT;

-- ----------------------------
-- Table structure for product_bundle_options
-- ----------------------------
DROP TABLE IF EXISTS `product_bundle_options`;
CREATE TABLE `product_bundle_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_bundle_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_bundle_options
-- ----------------------------
BEGIN;
INSERT INTO `product_bundle_options` (`id`, `product_id`, `type`, `is_required`, `sort_order`) VALUES (1, 6, 'radio', 1, 0);
INSERT INTO `product_bundle_options` (`id`, `product_id`, `type`, `is_required`, `sort_order`) VALUES (2, 6, 'radio', 1, 1);
INSERT INTO `product_bundle_options` (`id`, `product_id`, `type`, `is_required`, `sort_order`) VALUES (3, 6, 'checkbox', 1, 2);
INSERT INTO `product_bundle_options` (`id`, `product_id`, `type`, `is_required`, `sort_order`) VALUES (4, 6, 'checkbox', 1, 3);
COMMIT;

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
BEGIN;
INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES (9, 5);
INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES (11, 5);
INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES (12, 5);
COMMIT;

-- ----------------------------
-- Table structure for product_channels
-- ----------------------------
DROP TABLE IF EXISTS `product_channels`;
CREATE TABLE `product_channels` (
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_channels_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_channels
-- ----------------------------
BEGIN;
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (1, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (2, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (3, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (4, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (5, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (6, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (7, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (8, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (9, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (10, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (11, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (12, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (13, 1);
INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES (14, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_cross_sells
-- ----------------------------
DROP TABLE IF EXISTS `product_cross_sells`;
CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_cross_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_cross_sells
-- ----------------------------
BEGIN;
INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES (4, 1);
INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES (1, 2);
INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES (1, 3);
INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES (2, 3);
INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES (1, 4);
INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES (2, 4);
COMMIT;

-- ----------------------------
-- Table structure for product_customer_group_prices
-- ----------------------------
DROP TABLE IF EXISTS `product_customer_group_prices`;
CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `value_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`),
  CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_customer_group_prices
-- ----------------------------
BEGIN;
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES (1, 2, 'fixed', 12.0000, 1, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20', '002|1|1');
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES (2, 2, 'fixed', 12.0000, 1, 2, '2025-09-11 03:21:20', '2025-09-11 03:21:20', '002|1|2');
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES (3, 2, 'fixed', 12.0000, 1, 3, '2025-09-11 03:21:20', '2025-09-11 03:21:20', '002|1|3');
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES (4, 3, 'fixed', 50.0000, 1, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20', '003|1|1');
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES (5, 3, 'fixed', 50.0000, 1, 2, '2025-09-11 03:21:20', '2025-09-11 03:21:20', '003|1|2');
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES (6, 3, 'fixed', 50.0000, 1, 3, '2025-09-11 03:21:20', '2025-09-11 03:21:20', '003|1|3');
INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES (7, 5, 'fixed', 10.0000, 11, NULL, '2025-09-12 13:46:19', '2025-09-12 13:46:19', '5|11');
COMMIT;

-- ----------------------------
-- Table structure for product_customizable_option_prices
-- ----------------------------
DROP TABLE IF EXISTS `product_customizable_option_prices`;
CREATE TABLE `product_customizable_option_prices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `label` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_customizable_option_id` int(10) unsigned NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `pcop_product_customizable_option_id_foreign` (`product_customizable_option_id`),
  CONSTRAINT `pcop_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_customizable_option_prices
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_customizable_option_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_customizable_option_translations`;
CREATE TABLE `product_customizable_option_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` text COLLATE utf8mb4_unicode_ci,
  `product_customizable_option_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_customizable_option_id_locale_unique` (`product_customizable_option_id`,`locale`),
  CONSTRAINT `pcot_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_customizable_option_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_customizable_options
-- ----------------------------
DROP TABLE IF EXISTS `product_customizable_options`;
CREATE TABLE `product_customizable_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT '1',
  `max_characters` text COLLATE utf8mb4_unicode_ci,
  `supported_file_extensions` text COLLATE utf8mb4_unicode_ci,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_customizable_options_product_id_foreign` (`product_id`),
  CONSTRAINT `product_customizable_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_customizable_options
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_link_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_link_translations`;
CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_link_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`),
  CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_downloadable_link_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_links
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_links`;
CREATE TABLE `product_downloadable_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sample_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sample_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_links_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_downloadable_links
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_sample_translations
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_sample_translations`;
CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_downloadable_sample_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`),
  CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_downloadable_sample_translations
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_downloadable_samples
-- ----------------------------
DROP TABLE IF EXISTS `product_downloadable_samples`;
CREATE TABLE `product_downloadable_samples` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_downloadable_samples_product_id_foreign` (`product_id`),
  CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_downloadable_samples
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_flat
-- ----------------------------
DROP TABLE IF EXISTS `product_flat`;
CREATE TABLE `product_flat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `short_description` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `url_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text COLLATE utf8mb4_unicode_ci,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci,
  `meta_description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `product_flat_parent_id_foreign` (`parent_id`),
  CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_flat
-- ----------------------------
BEGIN;
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (1, 'SP-001', 'simple', NULL, 'Арктична затишна в\'язана шапка для чоловіків і жінок', 'Стильно насолоджуйтесь холодними днями з нашою Арктичною затишною в\'язаною шапкою. Виготовлена з м\'якого і міцного акрилового в\'язання, ця класична шапка пропонує тепло і універсальність. Підходить як для чоловіків, так і для жінок, вона є ідеальним аксесуаром для невимушеного або зовнішнього одягу. Підніміть свій зимовий гардероб або подаруйте комусь особливому цю необхідну шапку.', 'Арктична затишна в\'язана шапка - ваше рішення для збереження тепла, комфорту і стилю протягом холодних місяців. Виготовлена з м\'якого і міцного акрилового в\'язання, ця шапка призначена для забезпечення затишку і гарного прилягання. Класичний дизайн робить його підходящим як для чоловіків, так і для жінок, пропонуючи універсальний аксесуар, який доповнює різні стилі. Незалежно від того, чи ви вирушаєте на невимушений день в місті, чи насолоджуєтеся великими просторами, ця шапка додає комфорту і тепла вашому образу. М\'який і дихаючий матеріал забезпечує затишок без втрати стилю. Арктична затишна в\'язана шапка - це не просто аксесуар; це вираз зимової моди. Його простота дозволяє легко поєднувати з різними образами, роблячи його основою вашого зимового гардеробу. Ідеально підходить для подарунків або як задоволення для себе, ця шапка є міркуванням про будь-яний зимовий образ. Це універсальний аксесуар, який виходить за межі функціональності, додаючи нотку тепла і стилю вашому вигляду. Прийміть суть зими з Арктичною затишною в\'язаною шапкою. Незалежно від того, чи ви насолоджуєтеся невимушеним днем або стикаєтеся з елементами, нехай ця шапка стане вашим спутником комфорту і стилю. Підніміть свій зимовий гардероб з цим класичним аксесуаром, який легко поєднує тепло з вічним почуттям моди.', 'arctic-cozy-knit-unisex-beanie', 1, 1, 1, 'Мета заголовок', 'мета1, мета2, мета3', 'мета опис', 14.0000, NULL, NULL, NULL, 1.2300, '2025-09-11 03:21:20', 'uk', 'default', 1, 1, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (2, 'SP-002', 'simple', NULL, 'Арктичний шарф Бліс', 'Відчуйте обійми тепла і стилю з нашим Арктичним шарфом Бліс. Виготовлений з розкішного поєднання акрилу і вовни, цей затишний шарф призначений, щоб вас зігрівати в холодні дні. Його стильний і універсальний дизайн, разом з додатковою довжиною, пропонує варіанти налаштування стилю. Підніміть свій зимовий гардероб або порадуйте когось особливого цим необхідним зимовим аксесуаром.', 'Арктична шарф зима Бліс - це не просто аксесуар для холодної погоди; це заява про тепло, комфорт і стиль для зимового сезону. Виготовлений з дбайливістю з розкішного поєднання акрилу і вовни, цей шарф призначений, щоб вас зігрівати і затишувати навіть в найхолодніші температури. М\'яка і пухка текстура не тільки забезпечує ізоляцію від холоду, але й додає штрих розкіші до вашого зимового гардеробу. Дизайн Арктичної шарфа Бліс одночасно стильний і універсальний, що робить його ідеальним доповненням до різних зимових образів. Незалежно від того, чи готуєтеся ви до особливої події, чи додаєте шикарний шар до повсякденного вигляду, цей шарф легко поєднується з вашим стилем. Додаткова довжина шарфа пропонує варіанти налаштування стилю. Зав\'яжіть його для додаткового тепла, розпустіть його для невимушеного вигляду або експериментуйте з різними вузлами, щоб виразити свій унікальний стиль. Ця універсальність робить його невід\'ємним аксесуаром для зимового сезону. Шукаєте ідеальний подарунок? Арктичний шарф Бліс - ідеальний вибір. Чи ви здивуєте кохану людину, чи порадуєте себе, цей шарф є вічним і практичним подарунком, який буде цінуватися протягом всіх зимових місяців. Зануртесь у зиму з Арктичним шарфом Бліс, де тепло зустрічається зі стилем в ідеальній гармонії. Підніміть свій зимовий гардероб цим необхідним аксесуаром, який не тільки зігріває, але й додає штрих солідності до вашого зимового образу.', 'arctic-bliss-stylish-winter-scarf', 1, 1, 1, 'Мета заголовок', 'мета1, мета2, мета3', 'мета опис', 17.0000, NULL, NULL, NULL, 1.2300, '2025-09-11 03:21:20', 'uk', 'default', 1, 2, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (3, 'SP-003', 'simple', NULL, 'Арктичні сенсорні зимові рукавички', 'Залишайтесь на зв\'язку і теплими з нашими Арктичними сенсорними зимовими рукавичками. Ці рукавички виготовлені не тільки з високоякісного акрилу для тепла і міцності, але й мають сенсорну функцію для роботи з дотиковим екраном. З утепленою підкладкою, еластичними манжетами для надійної посадки і стильним виглядом, ці рукавички ідеально підходять для щоденного використання в холодних умовах.', 'Представляємо Арктичні сенсорні зимові рукавички - де тепло, стиль і підключення зустрічаються, щоб покращити вашу зимову витримку. Виготовлені з високоякісного акрилу, ці рукавички призначені для надання виняткового тепла і міцності. Сенсорні кінчики пальців, сумісні з дотиковим екраном, дозволяють вам залишатися на зв\'язку, не викладаючи руки на холод. Відповідайте на дзвінки, відправляйте повідомлення та навігуйте по своїх пристроях легко, не віддаючи свої руки затишку. Утеплена підкладка додає додатковий шар затишку, роблячи ці рукавички вашим вибором для зустрічі зимового холоду. Незалежно від того, чи ви їдете на роботу, виконуєте справи або насолоджуєтеся активними відпочинком на вулиці, ці рукавички надають тепло і захист, які вам потрібні. Еластичні манжети забезпечують надійну посадку, запобігаючи проникненню холодного повітря і утримуючи рукавички на місці під час щоденних справ. Стильний дизайн додає штриху елегантності до вашого зимового образу, роблячи ці рукавички модними і функціональними. Ідеально підходять для подарунків або як задоволення для себе, Арктичні сенсорні зимові рукавички - це необхідний аксесуар для сучасної людини. Попрощайтеся з незручністю видаляти рукавички, щоб користуватися пристроями, і приймайте безшовне поєднання тепла, стилю і підключення. Залишайтесь на зв\'язку, залишайтесь теплими і залишайтесь стильними з Арктичними сенсорними зимовими рукавичками - вашим надійним спутником для завоювання зимового сезону з впевненістю.', 'arctic-touchscreen-winter-gloves', 1, 1, 1, 'Мета заголовок', 'мета1, мета2, мета3', 'мета опис', 21.0000, 17.0000, '2025-09-11', '2025-09-12', 1.0000, '2025-09-11 03:21:20', 'uk', 'default', 1, 3, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (4, 'SP-004', 'simple', NULL, 'Арктичні шкарпетки з вовняними сумішами', 'Відчуйте неперевершене тепло і комфорт наших Арктичних шкарпеток з вовняною сумішшю. Виготовлені з суміші мериносової вовни, акрилу, нейлону і спандексу, ці шкарпетки пропонують найвищий комфорт для холодної погоди. З посиленою п\'ятою і носком для міцності, ці універсальні і стильні шкарпетки ідеально підходять для різних випадків.', 'Представляємо Арктичні шкарпетки з вовняними сумішами - ваш незамінний спутник для затишку і комфорту ніг протягом холодних сезонів. Виготовлені з преміальної суміші мериносової вовни, акрилу, нейлону і спандексу, ці шкарпетки призначені для надання неперевершеного тепла і комфорту. Вовняна суміш забезпечує, що ваші ноги залишаються теплими навіть в найхолодніших температурах, роблячи ці шкарпетки ідеальним вибором для зимових пригод або просто для затишку вдома. М\'яка і затишна текстура шкарпеток надає розкішного відчуття на шкірі. Попрощайтеся з холодними ногами, насолоджуючись пухнастим теплом, яке надають ці шкарпетки з вовняною сумішшю. Завдяки дизайну для міцності, шкарпетки мають посилену п\'яту і носок, що додає додаткову міцність в зони з високим навантаженням. Це забезпечує, що ваші шкарпетки витримають випробування часу, надаючи довготривалу зручність і затишок. Дихаюча природа матеріалу запобігає перегріванню, дозволяючи вашим ногам залишатися комфортними і сухими протягом усього дня. Незалежно від того, чи ви вирушаєте на зимову прогулянку, чи відпочиваєте вдома, ці шкарпетки пропонують ідеальний баланс тепла і дихання. Універсальні і стильні, ці шкарпетки з вовняною сумішшю підходять для різних випадків. Поєднуйте їх з улюбленими чоботами для модного зимового вигляду або носіть вдома для максимального комфорту. Підніміть свій зимовий гардероб і надайте перевагу комфорту з Арктичними шкарпетками з вовняною сумішшю. Побалуйте свої ноги розкішшю, яку вони заслуговують, і відчуйте затишок, який триває протягом всього сезону.', 'arctic-warmth-wool-blend-socks', 0, 0, 1, 'Мета заголовок', 'мета1, мета2, мета3', 'мета опис', 21.0000, NULL, NULL, NULL, 1.0000, '2025-09-11 03:21:20', 'uk', 'default', 1, 4, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (5, 'GP-001', 'grouped', NULL, 'Набір аксесуарів для зими Arctic Frost', 'Приймайте зимовий холод з нашим набором аксесуарів Arctic Frost. Цей підібраний набір включає розкішний шарф, затишну шапку, рукавички, сумісні з сенсорним екраном, та шкарпетки зі шерсті. Стильний і функціональний, цей ансамбль виготовлений з високоякісних матеріалів, що гарантує як міцність, так і комфорт. Піднімайте свій зимовий гардероб або радуйте когось особливого цим ідеальним подарунком.', 'Представляємо вам набір аксесуарів для зими Arctic Frost, ваше рішення для збереження тепла, стилю та зв\'язку під час холодних зимових днів. Цей уважно підібраний набір об\'єднує чотири необхідні зимові аксесуари, щоб створити гармонійний ансамбль. Розкішний шарф, в\'язаний з суміші акрилу та вовни, не тільки додає тепла, але й приносить штрих елегантності до вашого зимового гардеробу. М\'яка в\'язана шапка, виготовлена з дбайливістю, обіцяє зберегти вас затишними, додаючи модний шарм до вашого образу. Але це ще не все - наш набір також включає рукавички, сумісні з сенсорним екраном. Залишайтесь на зв\'язку, не жертвуючи теплом, користуючись своїми пристроями без зусиль. Незалежно від того, чи ви відповідаєте на дзвінки, відправляєте повідомлення або робите знімки зимових моментів на своєму смартфоні, ці рукавички забезпечують зручність без втрати стилю. М\'яка і затишна текстура шкарпеток надає розкішного відчуття на вашій шкірі. Попрощайтеся з холодними ногами, насолоджуючись теплом, яке надають ці шкарпетки зі шерсті. Набір аксесуарів для зими Arctic Frost - це не тільки функціональність, а й вираз моди взимку. Кожен елемент призначений не тільки захищати вас від холоду, але й підкреслювати ваш стиль під час морозної пори року. Матеріали, вибрані для цього набору, пріоритетно поєднують в собі як міцність, так і комфорт, забезпечуючи можливість насолоджуватися зимовим чудом у стилі. Незалежно від того, чи ви радуєте себе, чи шукаєте ідеальний подарунок, набір аксесуарів для зими Arctic Frost є універсальним вибором. Порадуйте когось особливого під час святкового сезону або підніміть свій власний зимовий гардероб за допомогою цього стильного та функціонального ансамблю. Зустрічайте мороз з впевненістю, знаючи, що у вас є ідеальні аксесуари, щоб зігріти вас і підкреслити вашу елегантність.', 'arctic-frost-winter-accessories', 0, 0, 1, 'Мета-заголовок', 'мета1, мета2, мета3', 'мета-опис', NULL, NULL, NULL, NULL, 1.0000, '2025-09-11 03:21:20', 'uk', 'default', 1, 5, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (6, 'BP-001', 'bundle', NULL, 'Набір аксесуарів для зими Arctic Frost', 'Приймайте зимовий холод з нашим набором аксесуарів Arctic Frost. Цей підібраний набір включає розкішний шарф, затишну шапку, рукавички, сумісні з сенсорним екраном, та шкарпетки зі шерсті. Стильний і функціональний, цей ансамбль виготовлений з високоякісних матеріалів, що гарантує як міцність, так і комфорт. Піднімайте свій зимовий гардероб або радуйте когось особливого цим ідеальним подарунком.', 'Представляємо вам набір аксесуарів для зими Arctic Frost, ваше рішення для збереження тепла, стилю та зв\'язку під час холодних зимових днів. Цей уважно підібраний набір об\'єднує чотири необхідні зимові аксесуари, щоб створити гармонійний ансамбль. Розкішний шарф, в\'язаний з суміші акрилу та вовни, не тільки додає тепла, але й приносить штрих елегантності до вашого зимового гардеробу. М\'яка в\'язана шапка, виготовлена з дбайливістю, обіцяє зберегти вас затишними, додаючи модний шарм до вашого образу. Але це ще не все - наш набір також включає рукавички, сумісні з сенсорним екраном. Залишайтесь на зв\'язку, не жертвуючи теплом, користуючись своїми пристроями без зусиль. Незалежно від того, чи ви відповідаєте на дзвінки, відправляєте повідомлення або робите знімки зимових моментів на своєму смартфоні, ці рукавички забезпечують зручність без втрати стилю. М\'яка і затишна текстура шкарпеток надає розкішного відчуття на вашій шкірі. Попрощайтеся з холодними ногами, насолоджуючись теплом, яке надають ці шкарпетки зі шерсті. Набір аксесуарів для зими Arctic Frost - це не тільки функціональність, а й вираз моди взимку. Кожен елемент призначений не тільки захищати вас від холоду, але й підкреслювати ваш стиль під час морозної пори року. Матеріали, вибрані для цього набору, пріоритетно поєднують в собі як міцність, так і комфорт, забезпечуючи можливість насолоджуватися зимовим чудом у стилі. Незалежно від того, чи ви радуєте себе, чи шукаєте ідеальний подарунок, набір аксесуарів для зими Arctic Frost є універсальним вибором. Порадуйте когось особливого під час святкового сезону або підніміть свій власний зимовий гардероб за допомогою цього стильного та функціонального ансамблю. Зустрічайте мороз з впевненістю, знаючи, що у вас є ідеальні аксесуари, щоб зігріти вас і підкреслити вашу елегантність.', 'arctic-frost-winter-accessories-bundle', 0, 0, 1, 'Мета-заголовок', 'мета1, мета2, мета3', 'мета-опис', NULL, NULL, NULL, NULL, 1.0000, '2025-09-11 03:21:20', 'uk', 'default', 1, 6, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (7, 'CP-001', 'configurable', '', 'Куртка OmniHeat Men\'s Solid Hooded Puffer', 'Залишайтеся теплими та стильними з нашою курткою OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.', 'Представляємо вам куртку OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла та модного вигляду під час холодних сезонів. Ця куртка виготовлена з міцністю та теплотою на увазі, що забезпечує їй стати вашим надійним спутником. Капюшон не тільки додає штриху стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів та погодних умов. Повні рукави забезпечують повне покриття, що гарантує, що ви залишитеся затишними від плеча до зап\'ястя. Завдяки кишеням для вставок, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями та ночами. Виготовлена з міцного поліестерового покриття та підкладки, ця куртка створена для того, щоб протистояти елементам та тривати. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю та уподобанням. Універсальна та функціональна, куртка OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадкову прогулянку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту та функціональності з курткою OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб та залишайтеся затишними, насолоджуючись природою. Перемагайте холод у стилі та робіть заяву з цим незамінним елементом.', 'omniheat-mens-solid-hooded-puffer-jacket', 0, 0, 1, 'Мета-заголовок', 'мета1, мета2, мета3', 'мета-опис', NULL, NULL, NULL, NULL, NULL, '2025-09-11 03:21:20', 'uk', 'default', 1, 7, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (8, 'SP-005', 'simple', NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-M', 'Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.', 'Представляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.', 'omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-m', 0, 0, 1, 'Мета-заголовок', 'мета1, мета2, мета3', 'мета-опис', 14.0000, NULL, NULL, NULL, 1.2300, '2025-09-11 03:21:20', 'uk', 'default', 1, 8, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (9, 'SP-006', 'simple', '', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', '<p>Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.</p>', '<p>DescПредставляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.ription 9</p>', 'omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-l', 1, 1, 1, 'Мета-заголовок', 'мета1, мета2, мета3', 'мета-опис', 100.0000, NULL, NULL, NULL, 10.0000, '2025-09-11 03:21:20', 'uk', 'default', 1, 9, '2025-09-14 23:13:52', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (10, 'SP-007', 'simple', NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-M', 'Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.', 'Представляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.', 'omniheat-mens-solid-hooded-puffer-jacket-blue-green-m', 0, 0, 1, 'Мета-заголовок', 'мета1, мета2, мета3', 'мета-опис', 21.0000, 17.0000, '2025-09-11', '2025-09-16', 1.0000, '2025-09-11 03:21:20', 'uk', 'default', 1, 10, '2025-09-11 03:21:20', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (11, 'SP-008', 'simple', '', 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', '<p>Залишайтеся теплими та стильними з нашою курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Ця куртка призначена для надання максимального тепла та має кишені для вставок для зручності. Утеплений матеріал забезпечує комфорт у холодну погоду. Доступна в 5 привабливих кольорах, що робить її універсальним вибором для різних заходів.</p>', '<p>Представляємо вам куртку з капюшоном OmniHeat Men\'s Solid Hooded Puffer, ваше рішення для збереження тепла і модного вигляду в холодну пору року. Ця куртка створена з міцністю і теплом на увазі, що гарантує, що вона стане вашим надійним спутником. Дизайн з капюшоном не тільки додає штрих стилю, але й надає додаткового тепла, захищаючи вас від холодних вітрів і погодних умов. Повні рукави забезпечують повне покриття, що гарантує комфорт від плеча до зап\'ястя. Оснащена кишенями для зручності, ця пухова куртка забезпечує зручність для перенесення необхідних речей або зігрівання рук. Утеплений синтетичний наповнювач забезпечує покращене тепло, що робить його ідеальним для боротьби з холодними днями і ночами. Виготовлена з міцного поліестерового матеріалу і підкладки, ця куртка створена для тривалого використання і витримує вплив неблагоприятних погодних умов. Доступна в 5 привабливих кольорах, ви можете вибрати той, який підходить вашому стилю і уподобанням. Універсальна і функціональна, куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer підходить для різних заходів, чи ви йдете на роботу, вирушаєте на випадок відпочинку або відвідуєте відкриту подію. Відчуйте ідеальне поєднання стилю, комфорту і функціональності з курткою з капюшоном OmniHeat Men\'s Solid Hooded Puffer. Піднімайте свій зимовий гардероб і залишайтеся затишними, насолоджуючись природою. Подолайте холод зі смаком і зробіть враження з цим важливим елементом.</p>', 'omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', 1, 1, 1, 'Мета-заголовок', 'мета1, мета2, мета3', 'мета-опис', 299.0000, NULL, NULL, NULL, 77.0000, '2025-09-11 03:21:20', 'uk', 'default', 1, 11, '2025-09-14 23:25:28', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (12, 'SP-0010', 'configurable', '', 'gfegerg', '<p>gerger</p>', '<p>ergerg</p>', 'gfegerg', 1, 1, 1, '', '', '', NULL, NULL, NULL, NULL, NULL, '2025-09-12 14:39:06', 'uk', 'default', 1, 12, '2025-09-12 14:45:32', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (13, 'SP-0010-variant-1-6', 'simple', NULL, 'Variant 1 6', 'SP-0010-variant-1-6', 'SP-0010-variant-1-6', 'SP-0010-variant-1-6', NULL, NULL, 1, NULL, NULL, NULL, 666.0000, NULL, NULL, NULL, 10.0000, '2025-09-12 14:39:06', 'uk', 'default', 1, 13, '2025-09-12 14:45:32', NULL, NULL);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (14, 'SP-0010-variant-2-6', 'simple', NULL, 'Variant 2 6', 'SP-0010-variant-2-6', 'SP-0010-variant-2-6', 'SP-0010-variant-2-6', NULL, NULL, 1, NULL, NULL, NULL, 777.0000, NULL, NULL, NULL, 6.0000, '2025-09-12 14:39:06', 'uk', 'default', 1, 14, '2025-09-12 14:45:32', NULL, NULL);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (34, 'SP-006', 'simple', '', NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, 100.0000, NULL, NULL, NULL, 10.0000, '2025-09-14 19:23:09', 'ru', 'default', 1, 9, '2025-09-14 23:13:52', NULL, 1);
INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES (35, 'SP-008', 'simple', '', NULL, NULL, NULL, NULL, 1, 1, 1, NULL, NULL, NULL, 299.0000, NULL, NULL, NULL, 77.0000, '2025-09-14 19:25:20', 'ru', 'default', 1, 11, '2025-09-14 23:25:28', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_grouped_products
-- ----------------------------
DROP TABLE IF EXISTS `product_grouped_products`;
CREATE TABLE `product_grouped_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `associated_product_id` int(10) unsigned NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`),
  CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_grouped_products
-- ----------------------------
BEGIN;
INSERT INTO `product_grouped_products` (`id`, `product_id`, `associated_product_id`, `qty`, `sort_order`) VALUES (1, 5, 1, 5, 1);
INSERT INTO `product_grouped_products` (`id`, `product_id`, `associated_product_id`, `qty`, `sort_order`) VALUES (2, 5, 3, 5, 2);
INSERT INTO `product_grouped_products` (`id`, `product_id`, `associated_product_id`, `qty`, `sort_order`) VALUES (3, 5, 4, 5, 3);
COMMIT;

-- ----------------------------
-- Table structure for product_images
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`),
  CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_images
-- ----------------------------
BEGIN;
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (1, 'image', 'product/1/UXOpU3uPT1HffqKTFJI6vRxuf3XvdMNWIyEpihOi.webp', 1, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (2, 'image', 'product/2/4mDvrzToJ5xOcol5IUR5UL2BAc4taaehFb6bFZDn.webp', 2, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (3, 'image', 'product/3/5IxsCXKeCVy1I0Q44Ud4vZsOnvV0hxHz8hsG0oJm.webp', 3, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (4, 'image', 'product/4/mLulJkkJIvmc8VbbrW4BzdqXZU0KXqG3kun5g0A5.webp', 4, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (5, 'image', 'product/5/TGsUvrX8sAkFoHeUtmNM6SSmRnKTVjQfFqf7550p.webp', 5, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (6, 'image', 'product/6/Su4AYs7L0v2a6Awv2jsJaExeGJLFbMp7W0NBamvS.webp', 6, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (7, 'image', 'product/7/uDYi99QS0gpuuHI2HefvOhGvgjqA7VyOZVx8ENUt.webp', 7, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (8, 'image', 'product/7/kaDYMcufIw4oW76F84tARSGRZp6SP5bKG3PwSpEs.webp', 7, 2);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (9, 'image', 'product/7/13BYNkoPldZgfuXk88UdSlucA3ozCF8glHDmsu5E.webp', 7, 3);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (10, 'image', 'product/8/ypwGvtzwQLTDfbjSdgQBBW1E6xjaywNIWDj72RxZ.webp', 8, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (11, 'image', 'product/8/Q6e4gTwpZ3W2JOI8ji1ZqHUebupRUSsFS50FWgWl.webp', 8, 2);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (12, 'image', 'product/9/gATS3jXoNAyDKT8Xz8IR7IvTgX5ytPAvHu91MP1d.webp', 9, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (13, 'image', 'product/9/9xCXOPsGrxJ5iBvYqpc0vShvPSYn17VNcEvkHkvo.webp', 9, 2);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (14, 'image', 'product/10/bquSruSxvNqKv9hd7CsEJHUKg1SBWtFzgSi0bjqi.webp', 10, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (15, 'image', 'product/10/FeVtZN26hNfDgu46iyziMLUqpntCSaN6AuIqxqnz.webp', 10, 2);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (16, 'image', 'product/11/3GXXCRdBAgzI2qDePYP8Halv1VE2X7VCEE6iWM8y.webp', 11, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (17, 'image', 'product/11/p064VlmIHeZZUhCV640B8KBavSRsRHGIB5woO7AP.webp', 11, 2);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (20, 'images', 'product/12/UXNLFlOUpgJZ8hv4P6dNaLUbyfeYNA3VqowgSXPv.webp', 12, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (21, 'images', 'product/13/g1TkV9zcozaSHii8E2Uq8u71aGpxnPWNFIqHTmw7.webp', 13, 1);
INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES (22, 'images', 'product/14/nQUWBW1Nui4wf8FhZXLOFLuCRm63ARE60bL4IL34.webp', 14, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_inventories
-- ----------------------------
DROP TABLE IF EXISTS `product_inventories`;
CREATE TABLE `product_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT '0',
  `inventory_source_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_inventories
-- ----------------------------
BEGIN;
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (1, 100, 1, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (2, 100, 2, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (3, 100, 3, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (4, 100, 4, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (5, 100, 8, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (6, 98, 9, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (7, 100, 10, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (8, 95, 11, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (11, 6, 13, 0, 1);
INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES (12, 99, 14, 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_inventory_indices
-- ----------------------------
DROP TABLE IF EXISTS `product_inventory_indices`;
CREATE TABLE `product_inventory_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_inventory_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_inventory_indices
-- ----------------------------
BEGIN;
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (1, 100, 1, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (2, 100, 2, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (3, 100, 3, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (4, 100, 4, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (5, 100, 8, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (6, 98, 9, 1, '2025-09-11 03:21:20', '2025-09-14 23:08:50');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (7, 100, 10, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (8, 93, 11, 1, '2025-09-11 03:21:20', '2025-09-19 03:01:06');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (9, 0, 7, 1, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (11, 0, 12, 1, NULL, NULL);
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (13, 6, 13, 1, NULL, NULL);
INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES (14, 99, 14, 1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_ordered_inventories
-- ----------------------------
DROP TABLE IF EXISTS `product_ordered_inventories`;
CREATE TABLE `product_ordered_inventories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qty` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_ordered_inventories
-- ----------------------------
BEGIN;
INSERT INTO `product_ordered_inventories` (`id`, `qty`, `product_id`, `channel_id`) VALUES (1, 2, 11, 1);
INSERT INTO `product_ordered_inventories` (`id`, `qty`, `product_id`, `channel_id`) VALUES (2, 0, 14, 1);
INSERT INTO `product_ordered_inventories` (`id`, `qty`, `product_id`, `channel_id`) VALUES (3, 0, 9, 1);
COMMIT;

-- ----------------------------
-- Table structure for product_price_indices
-- ----------------------------
DROP TABLE IF EXISTS `product_price_indices`;
CREATE TABLE `product_price_indices` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `customer_group_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL DEFAULT '1',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  KEY `product_price_indices_channel_id_foreign` (`channel_id`),
  CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_price_indices
-- ----------------------------
BEGIN;
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (2, 1, 2, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (3, 1, 3, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (4, 2, 1, 1, 17.0000, 17.0000, 17.0000, 17.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (5, 2, 2, 1, 17.0000, 17.0000, 17.0000, 17.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (6, 2, 3, 1, 17.0000, 17.0000, 17.0000, 17.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (7, 3, 1, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (8, 3, 2, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (9, 3, 3, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (10, 4, 1, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (11, 4, 2, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (12, 4, 3, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (13, 5, 1, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (14, 5, 2, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (15, 5, 3, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (16, 6, 1, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (17, 6, 2, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (18, 6, 3, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (19, 8, 1, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (20, 8, 2, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (21, 8, 3, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (22, 9, 1, 1, 100.0000, 100.0000, 100.0000, 100.0000, '2025-09-11 03:21:20', '2025-09-12 14:16:01');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (23, 9, 2, 1, 100.0000, 100.0000, 100.0000, 100.0000, '2025-09-11 03:21:20', '2025-09-12 14:16:01');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (24, 9, 3, 1, 100.0000, 100.0000, 100.0000, 100.0000, '2025-09-11 03:21:20', '2025-09-12 14:16:01');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (25, 10, 1, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (26, 10, 2, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (27, 10, 3, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (28, 11, 1, 1, 299.0000, 299.0000, 299.0000, 299.0000, '2025-09-11 03:21:20', '2025-09-12 13:38:36');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (29, 11, 2, 1, 299.0000, 299.0000, 299.0000, 299.0000, '2025-09-11 03:21:20', '2025-09-12 13:38:36');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (30, 11, 3, 1, 299.0000, 299.0000, 299.0000, 299.0000, '2025-09-11 03:21:20', '2025-09-12 13:38:36');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (31, 7, 1, 1, 0.0000, 0.0000, 299.0000, 299.0000, '2025-09-11 03:21:20', '2025-09-14 23:25:28');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (32, 7, 2, 1, 0.0000, 0.0000, 299.0000, 299.0000, '2025-09-11 03:21:20', '2025-09-14 23:25:28');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (33, 7, 3, 1, 0.0000, 0.0000, 299.0000, 299.0000, '2025-09-11 03:21:20', '2025-09-14 23:25:28');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (37, 12, 1, 1, 666.0000, 666.0000, 777.0000, 777.0000, NULL, '2025-09-12 14:45:32');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (38, 12, 2, 1, 666.0000, 666.0000, 777.0000, 777.0000, NULL, '2025-09-12 14:45:32');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (39, 12, 3, 1, 666.0000, 666.0000, 777.0000, 777.0000, NULL, '2025-09-12 14:45:32');
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (43, 13, 1, 1, 666.0000, 666.0000, 666.0000, 666.0000, NULL, NULL);
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (44, 13, 2, 1, 666.0000, 666.0000, 666.0000, 666.0000, NULL, NULL);
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (45, 13, 3, 1, 666.0000, 666.0000, 666.0000, 666.0000, NULL, NULL);
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (46, 14, 1, 1, 777.0000, 777.0000, 777.0000, 777.0000, NULL, NULL);
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (47, 14, 2, 1, 777.0000, 777.0000, 777.0000, 777.0000, NULL, NULL);
INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES (48, 14, 3, 1, 777.0000, 777.0000, 777.0000, 777.0000, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for product_relations
-- ----------------------------
DROP TABLE IF EXISTS `product_relations`;
CREATE TABLE `product_relations` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_relations_child_id_foreign` (`child_id`),
  CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_relations
-- ----------------------------
BEGIN;
INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES (2, 1);
INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES (3, 1);
INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES (4, 1);
INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES (3, 2);
INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES (4, 2);
INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES (1, 4);
COMMIT;

-- ----------------------------
-- Table structure for product_review_attachments
-- ----------------------------
DROP TABLE IF EXISTS `product_review_attachments`;
CREATE TABLE `product_review_attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `review_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'image',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_review_images_review_id_foreign` (`review_id`),
  CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_review_attachments
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for product_reviews
-- ----------------------------
DROP TABLE IF EXISTS `product_reviews`;
CREATE TABLE `product_reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_reviews
-- ----------------------------
BEGIN;
INSERT INTO `product_reviews` (`id`, `name`, `title`, `rating`, `comment`, `status`, `product_id`, `customer_id`, `created_at`, `updated_at`) VALUES (1, 'Микита Мягкой', 'test', 5, 'test', 'approved', 12, 2, '2025-09-16 23:26:55', '2025-09-16 23:27:37');
COMMIT;

-- ----------------------------
-- Table structure for product_super_attributes
-- ----------------------------
DROP TABLE IF EXISTS `product_super_attributes`;
CREATE TABLE `product_super_attributes` (
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`),
  CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_super_attributes
-- ----------------------------
BEGIN;
INSERT INTO `product_super_attributes` (`product_id`, `attribute_id`) VALUES (7, 23);
INSERT INTO `product_super_attributes` (`product_id`, `attribute_id`) VALUES (12, 23);
INSERT INTO `product_super_attributes` (`product_id`, `attribute_id`) VALUES (7, 24);
INSERT INTO `product_super_attributes` (`product_id`, `attribute_id`) VALUES (12, 24);
COMMIT;

-- ----------------------------
-- Table structure for product_up_sells
-- ----------------------------
DROP TABLE IF EXISTS `product_up_sells`;
CREATE TABLE `product_up_sells` (
  `parent_id` int(10) unsigned NOT NULL,
  `child_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  KEY `product_up_sells_child_id_foreign` (`child_id`),
  CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_up_sells
-- ----------------------------
BEGIN;
INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES (4, 1);
INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES (1, 2);
INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES (1, 3);
INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES (2, 3);
INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES (1, 4);
INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES (2, 4);
COMMIT;

-- ----------------------------
-- Table structure for product_videos
-- ----------------------------
DROP TABLE IF EXISTS `product_videos`;
CREATE TABLE `product_videos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_videos_product_id_foreign` (`product_id`),
  CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of product_videos
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `attribute_family_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`),
  KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  KEY `products_parent_id_foreign` (`parent_id`),
  CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
BEGIN;
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (1, 'SP-001', 'simple', NULL, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (2, 'SP-002', 'simple', NULL, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (3, 'SP-003', 'simple', NULL, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (4, 'SP-004', 'simple', NULL, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (5, 'GP-001', 'grouped', NULL, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (6, 'BP-001', 'bundle', NULL, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (7, 'CP-001', 'configurable', NULL, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (8, 'SP-005', 'simple', 7, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (9, 'SP-006', 'simple', 7, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (10, 'SP-007', 'simple', 7, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (11, 'SP-008', 'simple', 7, 1, NULL, '2025-09-11 03:21:20', '2025-09-11 03:21:20');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (12, 'SP-0010', 'configurable', NULL, 1, NULL, '2025-09-12 14:39:06', '2025-09-12 14:39:06');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (13, 'SP-0010-variant-1-6', 'simple', 12, 1, NULL, '2025-09-12 14:39:06', '2025-09-12 14:39:06');
INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES (14, 'SP-0010-variant-2-6', 'simple', 12, 1, NULL, '2025-09-12 14:39:06', '2025-09-12 14:39:06');
COMMIT;

-- ----------------------------
-- Table structure for refund_items
-- ----------------------------
DROP TABLE IF EXISTS `refund_items`;
CREATE TABLE `refund_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `refund_id` int(10) unsigned DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refund_items_parent_id_foreign` (`parent_id`),
  KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  KEY `refund_items_refund_id_foreign` (`refund_id`),
  CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of refund_items
-- ----------------------------
BEGIN;
INSERT INTO `refund_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `refund_id`, `additional`, `created_at`, `updated_at`) VALUES (1, NULL, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 299.0000, 299.0000, 299.0000, 299.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 10, 1, '{\"locale\": \"uk\", \"cart_id\": 16, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 22:31:27', '2025-09-14 22:31:27');
COMMIT;

-- ----------------------------
-- Table structure for refunds
-- ----------------------------
DROP TABLE IF EXISTS `refunds`;
CREATE TABLE `refunds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `increment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_currency_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_refund` decimal(12,4) DEFAULT '0.0000',
  `adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `base_adjustment_fee` decimal(12,4) DEFAULT '0.0000',
  `sub_total` decimal(12,4) DEFAULT '0.0000',
  `base_sub_total` decimal(12,4) DEFAULT '0.0000',
  `grand_total` decimal(12,4) DEFAULT '0.0000',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000',
  `shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `base_shipping_amount` decimal(12,4) DEFAULT '0.0000',
  `tax_amount` decimal(12,4) DEFAULT '0.0000',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000',
  `discount_percent` decimal(12,4) DEFAULT '0.0000',
  `discount_amount` decimal(12,4) DEFAULT '0.0000',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000',
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `order_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `refunds_order_id_foreign` (`order_id`),
  CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of refunds
-- ----------------------------
BEGIN;
INSERT INTO `refunds` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `adjustment_refund`, `base_adjustment_refund`, `adjustment_fee`, `base_adjustment_fee`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `created_at`, `updated_at`) VALUES (1, NULL, 'refunded', 1, 1, 'UAH', 'UAH', 'UAH', 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 309.0000, 309.0000, 10.0000, 10.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 299.0000, 299.0000, 10.0000, 10.0000, 9, '2025-09-14 22:31:27', '2025-09-14 22:31:31');
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES (1, 'Адміністратор', 'Ця роль надає користувачам всі права доступу', 'all', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for search_synonyms
-- ----------------------------
DROP TABLE IF EXISTS `search_synonyms`;
CREATE TABLE `search_synonyms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of search_synonyms
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for search_terms
-- ----------------------------
DROP TABLE IF EXISTS `search_terms`;
CREATE TABLE `search_terms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `results` int(11) NOT NULL DEFAULT '0',
  `uses` int(11) NOT NULL DEFAULT '0',
  `redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `search_terms_channel_id_foreign` (`channel_id`),
  CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of search_terms
-- ----------------------------
BEGIN;
INSERT INTO `search_terms` (`id`, `term`, `results`, `uses`, `redirect_url`, `display_in_suggested_terms`, `locale`, `channel_id`, `created_at`, `updated_at`) VALUES (1, 'ек', 0, 1, NULL, 0, 'uk', 1, '2025-09-12 02:39:18', '2025-09-12 02:39:18');
INSERT INTO `search_terms` (`id`, `term`, `results`, `uses`, `redirect_url`, `display_in_suggested_terms`, `locale`, `channel_id`, `created_at`, `updated_at`) VALUES (2, 'fff', 0, 1, NULL, 0, 'uk', 1, '2025-09-14 16:48:01', '2025-09-14 16:48:01');
COMMIT;

-- ----------------------------
-- Table structure for shipment_items
-- ----------------------------
DROP TABLE IF EXISTS `shipment_items`;
CREATE TABLE `shipment_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT '0.0000',
  `base_price` decimal(12,4) DEFAULT '0.0000',
  `total` decimal(12,4) DEFAULT '0.0000',
  `base_total` decimal(12,4) DEFAULT '0.0000',
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT '0.0000',
  `product_id` int(10) unsigned DEFAULT NULL,
  `product_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_item_id` int(10) unsigned DEFAULT NULL,
  `shipment_id` int(10) unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipment_items_shipment_id_foreign` (`shipment_id`),
  CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shipment_items
-- ----------------------------
BEGIN;
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (1, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 77.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 1, 1, '{\"locale\": \"uk\", \"cart_id\": 2, \"quantity\": 1, \"is_buy_now\": \"0\", \"product_id\": \"11\"}', '2025-09-12 13:42:56', '2025-09-12 13:42:56');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (2, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 'SP-006', 1, 10.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 6, 2, '{\"locale\": \"uk\", \"cart_id\": 11, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 19:23:09', '2025-09-14 19:23:09');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (3, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 77.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 7, 4, '{\"locale\": \"uk\", \"cart_id\": 12, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:25:20', '2025-09-14 19:25:20');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (4, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 77.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 8, 5, '{\"locale\": \"uk\", \"cart_id\": 13, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:27:44', '2025-09-14 19:27:44');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (5, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 77.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 9, 6, '{\"locale\": \"uk\", \"cart_id\": 14, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 19:59:09', '2025-09-14 19:59:09');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (6, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 77.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 10, 7, '{\"locale\": \"uk\", \"cart_id\": 16, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 22:30:30', '2025-09-14 22:30:30');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (7, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 'SP-006', 1, 10.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 5, 8, '{\"locale\": \"uk\", \"cart_id\": 10, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 22:34:05', '2025-09-14 22:34:05');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (8, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Жовта-L', NULL, 'SP-006', 1, 10.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 9, 'Webkul\\Product\\Models\\Product', 11, 9, '{\"locale\": \"uk\", \"cart_id\": 17, \"quantity\": 1, \"product_id\": 9}', '2025-09-14 23:13:52', '2025-09-14 23:13:52');
INSERT INTO `shipment_items` (`id`, `name`, `description`, `sku`, `qty`, `weight`, `price`, `base_price`, `total`, `base_total`, `price_incl_tax`, `base_price_incl_tax`, `product_id`, `product_type`, `order_item_id`, `shipment_id`, `additional`, `created_at`, `updated_at`) VALUES (9, 'Куртка з капюшоном OmniHeat Men\'s Solid Hooded Puffer-Синьо-Зелена-L', NULL, 'SP-008', 1, 77.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 299.0000, 11, 'Webkul\\Product\\Models\\Product', 4, 10, '{\"locale\": \"uk\", \"cart_id\": 7, \"quantity\": 1, \"product_id\": 11}', '2025-09-14 23:25:28', '2025-09-14 23:25:28');
COMMIT;

-- ----------------------------
-- Table structure for shipments
-- ----------------------------
DROP TABLE IF EXISTS `shipments`;
CREATE TABLE `shipments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` decimal(12,4) DEFAULT NULL,
  `carrier_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrier_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `track_number` text COLLATE utf8mb4_unicode_ci,
  `email_sent` tinyint(1) NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `order_address_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_id` int(10) unsigned DEFAULT NULL,
  `inventory_source_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `shipments_order_id_foreign` (`order_id`),
  KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`),
  CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of shipments
-- ----------------------------
BEGIN;
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (1, NULL, 1, 77.0000, NULL, '', '', 1, NULL, NULL, 1, 3, 1, 'За замовчуванням', '2025-09-12 13:42:56', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (2, NULL, 1, 10.0000, NULL, 'авав', '3223', 1, NULL, NULL, 5, 19, 1, 'За замовчуванням', '2025-09-14 19:23:09', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (4, NULL, 1, 77.0000, NULL, 'ььь', '3223', 1, NULL, NULL, 6, 23, 1, 'За замовчуванням', '2025-09-14 19:25:20', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (5, NULL, 1, 77.0000, NULL, 'авав', '3223', 1, NULL, NULL, 7, 27, 1, 'За замовчуванням', '2025-09-14 19:27:44', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (6, NULL, 1, 77.0000, NULL, '23', '2323', 1, NULL, NULL, 8, 31, 1, 'За замовчуванням', '2025-09-14 19:59:09', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (7, NULL, 1, 77.0000, NULL, '34534', '5435', 1, NULL, NULL, 9, 35, 1, 'За замовчуванням', '2025-09-14 22:30:30', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (8, NULL, 1, 10.0000, NULL, 'Новая почта', '3223', 1, NULL, NULL, 4, 15, 1, 'За замовчуванням', '2025-09-14 22:34:05', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (9, NULL, 1, 10.0000, NULL, 'Новая почта', 'T1000003434343', 1, NULL, NULL, 10, 39, 1, 'За замовчуванням', '2025-09-14 23:13:52', '2025-09-14 23:25:33');
INSERT INTO `shipments` (`id`, `status`, `total_qty`, `total_weight`, `carrier_code`, `carrier_title`, `track_number`, `email_sent`, `customer_id`, `customer_type`, `order_id`, `order_address_id`, `inventory_source_id`, `inventory_source_name`, `created_at`, `updated_at`) VALUES (10, NULL, 1, 77.0000, NULL, 'Новая почта', 'T1000003434343', 1, NULL, NULL, 3, 11, 1, 'За замовчуванням', '2025-09-14 23:25:28', '2025-09-14 23:25:33');
COMMIT;

-- ----------------------------
-- Table structure for sitemaps
-- ----------------------------
DROP TABLE IF EXISTS `sitemaps`;
CREATE TABLE `sitemaps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `additional` json DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sitemaps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for subscribers_list
-- ----------------------------
DROP TABLE IF EXISTS `subscribers_list`;
CREATE TABLE `subscribers_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  KEY `subscribers_list_channel_id_foreign` (`channel_id`),
  CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of subscribers_list
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_categories
-- ----------------------------
DROP TABLE IF EXISTS `tax_categories`;
CREATE TABLE `tax_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_categories_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tax_categories
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_categories_tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_categories_tax_rates`;
CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tax_category_id` int(10) unsigned NOT NULL,
  `tax_rate_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`),
  CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tax_categories_tax_rates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tax_rates
-- ----------------------------
DROP TABLE IF EXISTS `tax_rates`;
CREATE TABLE `tax_rates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT '0',
  `zip_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tax_rates_identifier_unique` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of tax_rates
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for theme_customization_translations
-- ----------------------------
DROP TABLE IF EXISTS `theme_customization_translations`;
CREATE TABLE `theme_customization_translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_customization_id` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` json NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customization_id_foreign` (`theme_customization_id`),
  CONSTRAINT `theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of theme_customization_translations
-- ----------------------------
BEGIN;
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES (1, 1, 'uk', '{\"images\": [{\"link\": \"\", \"image\": \"storage/theme/1/eF8vGCx9ADieBprlA8XPUqNp6xhslhygi19kQNzb.webp\", \"title\": \"топові кальяни\"}, {\"link\": \"\", \"image\": \"storage/theme/1/y0SoJ1QIQvCrCgwoo7b5k9YnehJ0jLXIFaDGLp6w.webp\", \"title\": \"Кальяны\"}]}');
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES (3, 3, 'uk', '{\"filters\": {\"sort\": \"asc\", \"limit\": \"10\", \"parent_id\": \"1\"}}');
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES (4, 4, 'uk', '{\"title\": \"Нові продукти\", \"filters\": {\"new\": 1, \"sort\": \"name-asc\", \"limit\": 12}}');
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES (7, 7, 'uk', '{\"title\": \"Рекомендовані продукти\", \"filters\": {\"sort\": \"name-desc\", \"limit\": 12, \"featured\": 1}}');
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES (9, 9, 'uk', '{\"title\": \"Усі продукти\", \"filters\": {\"sort\": \"name-desc\", \"limit\": 12}}');
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES (11, 11, 'uk', '{\"column_1\": [{\"url\": \"https://true-cloud-bagisto.hh/page/about-us\", \"title\": \"Про нас\", \"sort_order\": 1}, {\"url\": \"https://true-cloud-bagisto.hh/contact-us\", \"title\": \"Зв\'яжіться з нами\", \"sort_order\": 2}, {\"url\": \"https://true-cloud-bagisto.hh/page/customer-service\", \"title\": \"Служба підтримки\", \"sort_order\": 3}, {\"url\": \"https://true-cloud-bagisto.hh/page/whats-new\", \"title\": \"Що нового\", \"sort_order\": 4}, {\"url\": \"https://true-cloud-bagisto.hh/page/terms-of-use\", \"title\": \"Умови використання\", \"sort_order\": 5}, {\"url\": \"https://true-cloud-bagisto.hh/page/terms-conditions\", \"title\": \"Умови та положення\", \"sort_order\": 6}], \"column_2\": [{\"url\": \"https://true-cloud-bagisto.hh/page/privacy-policy\", \"title\": \"Політика конфіденційності\", \"sort_order\": 1}, {\"url\": \"https://true-cloud-bagisto.hh/page/payment-policy\", \"title\": \"Політика оплати\", \"sort_order\": 2}, {\"url\": \"https://true-cloud-bagisto.hh/page/shipping-policy\", \"title\": \"Політика доставки\", \"sort_order\": 3}, {\"url\": \"https://true-cloud-bagisto.hh/page/refund-policy\", \"title\": \"Політика повернення коштів\", \"sort_order\": 4}, {\"url\": \"https://true-cloud-bagisto.hh/page/return-policy\", \"title\": \"Політика повернення\", \"sort_order\": 5}]}');
INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES (12, 12, 'uk', '{\"services\": [{\"title\": \"Безкоштовна доставка\", \"description\": \"Насолоджуйтеся безкоштовною доставкою на всі замовлення\", \"service_icon\": \"icon-truck\"}, {\"title\": \"Заміна продукту\", \"description\": \"Доступна легка заміна продукту!\", \"service_icon\": \"icon-product\"}, {\"title\": \"Гарантія оригіналу\", \"description\": \"Тільки сертифікована продукція\", \"service_icon\": \"icon-dollar-sign\"}, {\"title\": \"Підтримка 24/7\", \"description\": \"Присвячена підтримка 24/7 через чат та електронну пошту\", \"service_icon\": \"icon-support\"}]}');
COMMIT;

-- ----------------------------
-- Table structure for theme_customizations
-- ----------------------------
DROP TABLE IF EXISTS `theme_customizations`;
CREATE TABLE `theme_customizations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `channel_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `theme_customizations_channel_id_foreign` (`channel_id`),
  CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of theme_customizations
-- ----------------------------
BEGIN;
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES (1, 'default', 'image_carousel', 'Карусель зображень', 1, 1, 1, '2025-09-11 03:20:52', '2025-09-12 21:22:46');
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES (3, 'default', 'category_carousel', 'Колекції за категоріями', 3, 1, 1, '2025-09-11 03:20:52', '2025-09-12 02:18:21');
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES (4, 'default', 'product_carousel', 'Нові продукти', 4, 1, 1, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES (7, 'default', 'product_carousel', 'Виділені колекції', 7, 1, 1, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES (9, 'default', 'product_carousel', 'Усі продукти', 9, 1, 1, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES (11, 'default', 'footer_links', 'Посилання у нижньому колонтитулі', 11, 1, 1, '2025-09-11 03:20:52', '2025-09-11 03:20:52');
INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES (12, 'default', 'services_content', 'Вміст послуг', 12, 1, 1, '2025-09-11 03:20:52', '2025-09-12 23:12:52');
COMMIT;

-- ----------------------------
-- Table structure for url_rewrites
-- ----------------------------
DROP TABLE IF EXISTS `url_rewrites`;
CREATE TABLE `url_rewrites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entity_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of url_rewrites
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for visits
-- ----------------------------
DROP TABLE IF EXISTS `visits`;
CREATE TABLE `visits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `url` mediumtext COLLATE utf8mb4_unicode_ci,
  `referer` mediumtext COLLATE utf8mb4_unicode_ci,
  `languages` text COLLATE utf8mb4_unicode_ci,
  `useragent` text COLLATE utf8mb4_unicode_ci,
  `headers` text COLLATE utf8mb4_unicode_ci,
  `device` text COLLATE utf8mb4_unicode_ci,
  `platform` text COLLATE utf8mb4_unicode_ci,
  `browser` text COLLATE utf8mb4_unicode_ci,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitable_id` bigint(20) unsigned DEFAULT NULL,
  `visitor_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visitor_id` bigint(20) unsigned DEFAULT NULL,
  `channel_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  KEY `visits_channel_id_foreign` (`channel_id`),
  CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of visits
-- ----------------------------
BEGIN;
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (1, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/search?query=23423', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/search?query=23423\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; true_cloud_session=eyJpdiI6IkN0YWdyUzFZVno0UU5DRXNiUWtSOWc9PSIsInZhbHVlIjoidlZmV1B5cTB2WGc1NXRZeVBTV1NaRGd4Qy9vQVphbi8rcFdjRzZNTnhJd0JnZzZ3TzVWcDFoUzBRN2R6M2ZhS1VXVzJFRmx4VnN1cUVzR2JCOEZ5Y0M3SXByTmk5YkpmQlQ4ZnlwejF6aFI1M0dHamFlVXFuTWdvTGZWTzROb3UiLCJtYWMiOiI1OTJiNmI0Y2Y3ZmI0Y2RhMzg5MWNiZDFmNDU2YjViOTA5OGYzMzZiZTM0MDY2OWJjZTczNTdkNTUxNjFhNWMwIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IldObmViUzJxTG5qaGg2UlBEeUd5a1E9PSIsInZhbHVlIjoiVUNPc1pIbndwZzlEanlodW9MMmhJOVIxbSt1dXY3UnBJekFycWcwWXJMVTVNWFBOS0xaWjhabUR1eXhpa0hWVVJoR0NsMzFtY3ZGZzJNbmNYRGFzTU9PK3lNcEJQeGw3dTBESm1wVHBla0k0S2wxVkhCbElrK3VWWHB5QmdObGoiLCJtYWMiOiIyZDQ4ZGMzYWJmYjA1ODZkMzM2YmE3NjVkZWZmOGEwZTIzMzliOTlmMTc0MjExZWQ3YTNmYjA0NjZiYTA3MzI3IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Ik8xSFAwSWhGUExYcVo2bWhkUVZTNEE9PSIsInZhbHVlIjoiTXVqUXVYSGxBU2lpanhscUFiSk54S2pUQVlyNW1NZU0zUmFNN3VScmtTdXovMnZvS09RT1oxQjJNNFlPUHdrUy9KTmpETFJ0Qi9KU2J6bWhMUjZxZDl6QU9qdi80RHRUaVgrdFA4TXB0b3NJT0czZFpjTVFTU1orSktwd3Z6cmsiLCJtYWMiOiJlYTIwMTE2ZmUxMWQ0MWE3MWEwYzM2OGVjYzQ5NThmMTU3NjllMmVlM2Q4M2IwYjRmYzQwNjViYzI0MWFhNjg4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 03:20:55', '2025-09-11 03:20:55');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (2, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%87%D0%BE%D0%BB%D0%BE%D0%B2%D1%96%D0%BA%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; true_cloud_session=eyJpdiI6IkN0YWdyUzFZVno0UU5DRXNiUWtSOWc9PSIsInZhbHVlIjoidlZmV1B5cTB2WGc1NXRZeVBTV1NaRGd4Qy9vQVphbi8rcFdjRzZNTnhJd0JnZzZ3TzVWcDFoUzBRN2R6M2ZhS1VXVzJFRmx4VnN1cUVzR2JCOEZ5Y0M3SXByTmk5YkpmQlQ4ZnlwejF6aFI1M0dHamFlVXFuTWdvTGZWTzROb3UiLCJtYWMiOiI1OTJiNmI0Y2Y3ZmI0Y2RhMzg5MWNiZDFmNDU2YjViOTA5OGYzMzZiZTM0MDY2OWJjZTczNTdkNTUxNjFhNWMwIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6InhQVUJkbEp1bnc3cmZ1ZStkUTFHbUE9PSIsInZhbHVlIjoiQUthLzJERkdCeCt5YnRDMmJDQ015WDRTb0lNaC9CNGVDWnE0VXVFa3NnZDFnQjU0V3VFSDJoY3VXUWZ5bC9BTkhnZjZ0a2NkK3RsalEySStXQW1qcVpKZ0gvaTJzTjdyQXZrRSt0bHNqTjNPd0lzQ1c1eWsxdm9MNm4xVWM3N04iLCJtYWMiOiI1MTljOTQwY2ZkNTkwNDdkYzFiOTUyYzE5YTdhYmE4OGNkMDQ2ZTllNDVkYjMzMTlkZWU2NjA3MGRhMzA1NTljIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Ik5UWWNXVGpSRU1ibEVPS056Y0J5Qmc9PSIsInZhbHVlIjoiVy94dkxlQTdlV2xqbzVUQjN2anUzRTBLblo0NG1YZzZnd25mZU9jZE4rSnVXSFlyWW12ZVNDVWhqeTkrV2JEMjlVdkhGUUhoWTFaOWkyWGNhYTNzeGVGWGR4aUlVQkk1T1Z6K09FSEdLWE9mTEZkVHJTbGRBZlhqZzQ0M2dnOFUiLCJtYWMiOiI1MTQwYTBmYjBiYzAxNjg5ZDRlNTY3OTE5ZTgxMGM4NDZiNzVkMjQ4NmE2ZDkwMGJjY2I2YWI0OTA1ZTZmY2RmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-09-11 03:21:29', '2025-09-11 03:21:29');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (3, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B7%D0%B8%D0%BC%D0%BE%D0%B2%D0%B8%D0%B9%20%D0%BE%D0%B4%D1%8F%D0%B3', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; true_cloud_session=eyJpdiI6IkN0YWdyUzFZVno0UU5DRXNiUWtSOWc9PSIsInZhbHVlIjoidlZmV1B5cTB2WGc1NXRZeVBTV1NaRGd4Qy9vQVphbi8rcFdjRzZNTnhJd0JnZzZ3TzVWcDFoUzBRN2R6M2ZhS1VXVzJFRmx4VnN1cUVzR2JCOEZ5Y0M3SXByTmk5YkpmQlQ4ZnlwejF6aFI1M0dHamFlVXFuTWdvTGZWTzROb3UiLCJtYWMiOiI1OTJiNmI0Y2Y3ZmI0Y2RhMzg5MWNiZDFmNDU2YjViOTA5OGYzMzZiZTM0MDY2OWJjZTczNTdkNTUxNjFhNWMwIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6IlJzR0tQQnhZTzZ4cm11NUlZcExsWUE9PSIsInZhbHVlIjoiWEErbHMrUHBiUEdtczducEp6blJsTCtpZEZCVWxCYUs5K3FNRXNyaHVqUVpNc0N3SGdXakc0ZGUxZTVaZkFHWEJ1d0paYzVtd2lheFNSVTlJeVlncFVIK29pZlNjNGlYR3A2OGI2NHFOMDFPUzB5QmlFWEx2MjNWYzJHNktsZW0iLCJtYWMiOiJlNGMyMTk2NzMyZmUxOWY3Njg5MjQzOWFiODZiY2Y1MWNkZDU1ZWI0ZjVjMjQ5ODc5NTI3MjU5ODc5Y2UwMTRhIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjBxMWV3cmNvb3czZ0oxeDcvWE5QU1E9PSIsInZhbHVlIjoibDRBSGtVNlM0aXNWUXJacTBzL1lmTTcrNW91Y25nSE55R3NQQnhxVXhBdjlzOWFaM1haVFRidTNvdXdrL2x6OFlvS1BWSU1CNThGNEhrR0QrQzJkaGErLzdWQ0ZTR0VhZGsxYWw3emhubllIS3RtZGdXU1BHb0UvSVF1U3NkeWwiLCJtYWMiOiJkZWYyYWJmNTI5NDY1YWMzN2MyYTNhNDcxODgwYzZhNDdhYzNkNTZiMzI2Y2E2MmU1N2Q2NWE3MjNjNTRjYTFlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 03:21:30', '2025-09-11 03:21:30');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (4, 'GET', '[]', 'https://true-cloud-bagisto.hh/vvcvcvc', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; true_cloud_session=eyJpdiI6IkN0YWdyUzFZVno0UU5DRXNiUWtSOWc9PSIsInZhbHVlIjoidlZmV1B5cTB2WGc1NXRZeVBTV1NaRGd4Qy9vQVphbi8rcFdjRzZNTnhJd0JnZzZ3TzVWcDFoUzBRN2R6M2ZhS1VXVzJFRmx4VnN1cUVzR2JCOEZ5Y0M3SXByTmk5YkpmQlQ4ZnlwejF6aFI1M0dHamFlVXFuTWdvTGZWTzROb3UiLCJtYWMiOiI1OTJiNmI0Y2Y3ZmI0Y2RhMzg5MWNiZDFmNDU2YjViOTA5OGYzMzZiZTM0MDY2OWJjZTczNTdkNTUxNjFhNWMwIiwidGFnIjoiIn0%3D; XSRF-TOKEN=eyJpdiI6InF1RFovRS9ZUURGeXpWK3ZxWi85L1E9PSIsInZhbHVlIjoiM3pMUWdDcC83M1hwRUtHNGNGaFl1NTYvNElCZkxDWmJtbzdEZDgzM2VJT1NxTUIzYW1EOUdMV1ZwQ0R4SUpNU3owVFduaTdHUVJIbHBpaVpsL0liZXZqcTlnNlgzSmFvZjN1R1dIWUhOQ2dOMkZGVUpHTkRRTzZvSzU1N1gyWmMiLCJtYWMiOiJhNTNiNmRlY2YxZTVlZWJkY2JhNDJhMjg5ZTEzNDZmMmQ3YTUyNjdlMzkyOGEyMmFhZmM4MGMxNzU2Yzg3NjRjIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InNvV01MZ1RzenVQdjdnTjk5NGtTWmc9PSIsInZhbHVlIjoibDdKRmQ2L3M1eDQwTjVwOWU3dm1aMlk3eUlWU1ROQ3NqZnYyOXp1NDlyV3c2UWNualErV0o2UU84a0xuOWtHdlNYM1ZITTYvTDkxVDd0RW4vclBBQ1dvUENvUWQrekZzRjJ3OVZKSTlWb1hkckhQVWNkRXgwRDM5bnJRQmVtOXoiLCJtYWMiOiIxZTBiNzczMmFiOWI3NmRlZDZmMmYyZDM1OWRlMjhjNjA5MjE4NDNmYzVhOWY1Mzg0MmI5NDkwMjU0YzBjMmE3IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-09-11 03:24:03', '2025-09-11 03:24:03');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (5, 'GET', '[]', 'https://true-cloud-bagisto.hh/category=accessories', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IlRtWFFKODdpdGRPaEJ2Y3FTNjYwSHc9PSIsInZhbHVlIjoiL1BqVGlaNXB6RGNmdTNTUGZrdHoxNGlMSzVTV1Q3V0Jod1BqTXdaaFpxckxuSUtzWGhzWTNyZTRlSlR3SDNYSzJiNjQxSk9vSXR1STlWTkFEVVV3ZzJoci9oQmhhVXNGcGdZY25Ec1VmaXNjWitCcFEvZjVrQXZDaG9FRTR2SVEiLCJtYWMiOiJmZjgxNWE2OTBjOTBkNzc1MzhmOWM3NTlkOWUxZmY2YzlhOTYyODhkZDA1YzRiNGNiM2MzZDBhN2U5OTZkNDFhIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjcwRFltSUo1VVphN0d2UmdEOGxyZ3c9PSIsInZhbHVlIjoiSnZRZ29TOGdEb1REUnEzYS9XTFM0YllWRnJ2Vmlza0pLZ0NKVDQzejROZndXVW1mL2JzaFdIMlBtWHMwMmp1RVdSZ05sWU45TEFDTjB0VVhNdm8yUk1GRHpZS3BLazVKMGNtb0hrM1pnbEhzcDhUWG9zZCtVanN2UE9YZ2Jrc0UiLCJtYWMiOiJkMjdmZjI2MTMyM2I4NWI1OWNiOGI1MjQyN2YzMWM5YzYyMjNmNDAzYWFkYjVjMTU3YzNkZGRiNDBiOGU3MzgwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 23:04:54', '2025-09-11 23:04:54');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (6, 'GET', '[]', 'https://true-cloud-bagisto.hh/category=hookahs', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Iis2NXdrNThITzhWZEZ4d0pvK1ZwNUE9PSIsInZhbHVlIjoiNlk2YVlubmNjNGtTd003U1JSZXhNempqSFBZdTZlZlJnVFJWRGRyZ1hFUU02bC95ckd1VWU2QUpZRDVsd3JYSThPSXVSc1AvcmJQSWN5N1lwSTNsRWdxNlVzVGZtMDMya2ovSkg3UXcwZmdibmpscmgwUjVnWGxBREt6YWw0OWoiLCJtYWMiOiJjNDg3ZGIxZGFjZmVjMDU0YTg4ZjNlMDlkMGFiNGI1YzgwYzRhNTU4NzA5MDNiYTk3YjM4ZmM5NTQwMzU2MTY2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IkdMZHhVN1dZSXVleExOR29vTmtRcGc9PSIsInZhbHVlIjoiUm1KdHpuNHhHU2V1N2N1L2NFcGkxRSt5LzZXTGpkUXYxRTNtQkhRTno3MERiSXU2b3dPdnpPTnJZbUVtQXlmZllWcmdZeU9MNHFGZ2tqSVB6U0x3RTZlamYza1hMbWg0c0FJMkgzZGdRakRnalA2VEVkSHdHTzNHbnRmaHBwMzgiLCJtYWMiOiI5ODUxNjdlZDRjYmE2ZTI0NzNiMDY5MDg5ODQ0YzFhMzczZmNmMGRhMDVlZmUwNWMxNGU0MzQ3YzdhZGExN2U3IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 23:04:55', '2025-09-11 23:04:55');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (7, 'GET', '[]', 'https://true-cloud-bagisto.hh/category=tobacco', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkFab3FMeDJjQ3kzSjVCZitlUFNUUnc9PSIsInZhbHVlIjoiZTRNdFE2Qm4xb1Z6bW9ndkJhVFJ2MHlmS1R1cnUzN2pYOFRVeEg0OWZkOXhURnRpY3I5VmdwTE8rTm9kZW5kbTFSczlkWnNqRjNNdmdZR1BZaHJZZERDVUtIaFI4c01nT3FlQzFhc3g1MUdxM3ROdlBwVWtObTFtV3B3ckRUZDYiLCJtYWMiOiI4MzU1MDgzM2VkN2VkMTUxMTBkY2Y5MzY1MjlkOWY4NTQwZWFlMjRkYzhhMGZjZjNlYmEwMjJjNzdhYWQ1MjQ1IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Im5ic3ladmFwRkdSeDhLTzFDT1l1Snc9PSIsInZhbHVlIjoiTW1sZFkwN0NYcm4yRHd3VkxBeHI2VkxPY0gvR1lUUnkyZ2Vqa3hqTjkwUGgxRmdPZW51WU5HUm9MTnpHcGRYc09iSWI0WXczeEdYcksyM1ZqMGxoRUltSE9ucWxoRUI4YkMzWFhyVHJ6dzVTa1VjQVNVeFk5amdSWmRoYmRBYVgiLCJtYWMiOiJmNTFiNmMwNjAyYzE5ZDQ1MjUxMzlhZjg1M2Q3YzFkMjJmOTVmMWQwZDM5MjA5NDkxOGFlMTljZDQ4Y2Y5ODdmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 23:04:56', '2025-09-11 23:04:56');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (8, 'GET', '[]', 'https://true-cloud-bagisto.hh/category=coal', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Im0xUG4wOCtaSWp5SWpRc2FXd05sM0E9PSIsInZhbHVlIjoicWluUFNhNEtCclhaaE95SGttTzBoWXUyUVg4VDFhejVueVYvQ2VuRkVnWTVZSjFJTDVmZytqbVpoQTkwRDgzM2EvL2dXc1JLQ0JOd1hOYWVMQXZpL0NaZUpJclRDQUtCaDRZVjJwamx0SlQ5S0RXeUZCZzkxZ2x0WVZFemcxeGIiLCJtYWMiOiI0NjdhNTdhYjU5YzhkMzBiOWUwM2Q4MzQ1YTEwZGRiY2RmMjNkZjk1OGE1MmM5Y2YwNGU5ZWZiZGE3NDBlZWJiIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlpaQWtYWFhsdHN1SHVKdTd5RzJ2cFE9PSIsInZhbHVlIjoieS9pK0ZVZ2ZiQnhZQUcxYTJyVDhTUXNpYVF5VlFTRlExZHFZSHMrVUlFciszdGRNazdxcW9abXh4QndaQnRmREJjUENJbmZ1Q05hSTFNa0JpeTJNaDZNL2dESG9UM0Q0YldYb0hQbzV2LzRRQTRQaTBpa0E2ZXFEeFFDUnFYbjkiLCJtYWMiOiI5YWEyNzkwNjYwMDUwMTZiZjJiNzI2ZDM0MmViZmM4MDI4YTcyNWJjMzEwMmE0N2E3ODNmMjhjY2FhNDIyY2M1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 23:04:56', '2025-09-11 23:04:56');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (9, 'GET', '[]', 'https://true-cloud-bagisto.hh/category=bowls', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IlFsNER1UjA1WCtpd2hlTGpSemZDTlE9PSIsInZhbHVlIjoiQkpmM1d6c0JHZi8xM3E1a3p4aklGODF5bUhrSW9DMEpMeEM1RGFMaURVZXhmdFd2TnJia2tKRno5OFNoN3pwbVdycWVCYkpqS25IalRjOUxsWWJKWERQTmpwWjlpdnhwaTJJbENhMFdxUEpPSFkzUnAzYklNNCs2OXZGcWRuaGMiLCJtYWMiOiI0YmNjZTgzM2JjYjFiOWE0OGMwYmNiNDMyYmMyYmZlOTRiOGU2YzhmZWI5MWFkZDFkYWJlYWFhMzNhYWE1YmRlIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImN0VXB3NzhaWTJ5U1E1aXExSHBlOFE9PSIsInZhbHVlIjoiVU5vRExkVk90Vkw5b05sbzU1RGtLeldvOWJ4eXlhZmphVmhxYU1tdWdxNmJKbW9seEZMU3Y3cVhSUVZlUDhwbnAwK0hhc0RWRVFrZnlwMWlqSk94NFZTMEZMTXA2Vm14b2R0UksxUmRtMm9IQWkrampjem5UcUh0dnZvcWtJdnYiLCJtYWMiOiI4ZTkxMmY2ZWVmMGIyYjM4Zjk4MjljM2ZiMjk0OTdlMWQwOGYyMDc5NTI0OTU5YTNiMGJjMjFiZWRkMjc3ZWIzIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 23:04:57', '2025-09-11 23:04:57');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (10, 'GET', '[]', 'https://true-cloud-bagisto.hh/sale=1', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkNScnMwUFErYXZvM3dSRmhqRFFXQXc9PSIsInZhbHVlIjoiTGxncmhtYXpzc3kzUlZsaW0yelpKb2xvdzNPa1JoNjNTZlI3eEREN29yeEdIVmlHUWFaY05MTFUyQUJvVXMxNnBWM2xKWkZndjNIS29obElIMGwrTlJ0cnZSQlFkR2dTM25vMlo2eTlCd1lwQVlKRDBPWXhxaHA4eFFjcm1zMjQiLCJtYWMiOiJjZWY2NWU2NzgwYTAxNGIzYjUzMzIzMWY5YjdhNzNlZTQyNThlNzlkMjM2ZGEyMTVkNDk5Nzc4YTI0OTZiNDk0IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjNUeVRzcnVFSHA4NDM4ZTRVQjBUYnc9PSIsInZhbHVlIjoiWjRsbUpBWDZmL2hJYUdJQ0htQWttR2dZRDlyUy9PVnJvaXNMWURnbGE2MHlCdlJIa0IxbS9mMEpmMktUb1c3WDN3ZnBJWWthaHRUUW1OUWVBS3F1UkwyN3RwNFZVMkFlczVKSjRrUDRXNHZJMExVTUgwdlo4NCs2ais4bENyQk8iLCJtYWMiOiI0ZDJmOTc1ZjQ0YWMzMmMxODJiY2Y4YmY3MzgzMmNhMmI0YTg5NGY2MmQ2NDcwNzFhMzJkMzIzODdmMTg2NGYyIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-11 23:04:58', '2025-09-11 23:04:58');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (11, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Im9tcnZmK0pEb3NXdndrQmFRVkVBM2c9PSIsInZhbHVlIjoiYU1tVUdlSWRSaUF1YjlVRUlKWDYyQ3l3K3VNemxxcWtOZ0lDRGRPdys4Uk0yNUliTzh1V21DTWJROGZnRUNSS0dkMEVkMTJFbWtjTVRMZUNOTC9rS3JCS2xFU3p4OTlST0JWZUp3UWlSOEExV2FvNnBLYWV1UjRxSjlYNXFoVUwiLCJtYWMiOiJiY2Q1ZWU4NDYxYmQ3YjgxYzFiOTUzNjVkOWMwM2I3ZWY3MjU4N2E4NWZkN2M1MzU3OGVlYmM3NzAyZmI2Nzg2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlAzWkdWUkh6MnBDKy8yajhuSWlJTWc9PSIsInZhbHVlIjoiSnUySWN1R21iN0JXU1hTRFNSWTFXMmlUdjF5d0Qxd05YbkpwTHpZM1JBYTR0WUVvUXBEaXU5UW1DNG9aZHRTU2VlbWx6ZllIME9aVUZzbEQ4QVBCZUgwd3g2MlMySytRUjVoM2kwY1lZYi9kKy80bksyK1BocFJSK3FrRjU2UTAiLCJtYWMiOiI3OGUwNWJiOTAyNTZiOTMxMjU1MGNjZTliYmU1MjQzN2VmYzY0MzcwZmYxYjk5NGRhNzYxZmVmMzliODA2Nzc2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-12 00:00:00', '2025-09-12 00:00:00');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (12, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%87%D0%BE%D0%BB%D0%BE%D0%B2%D1%96%D0%BA%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IlpJSzRkYmJqS0k2N2o3amdYeGxOL3c9PSIsInZhbHVlIjoiQkNtSnFFTUtTcUhpWFphYlNqU09OQThRcnRLMlNGdWMxdzk0aktyWGVmc2VIaENxL29VclNpV0RTR01BMTlZZ3RkRHhwK2pqOFIzQ2lXanc0UUJnZDZPWC9oVEdkdHpWN0pJcTE1U20wSDhNcVVkTW5HbDllZzZzdVpWUFVwYXoiLCJtYWMiOiI0ZjdmNDcwMDlmNzE0YTczMDA1NzNkMmYxOTk5MjgwYzVjOTRhMWZkMjJhOGEzYTBjM2U0NDAwMmU0MzcxMGViIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Im1BR09rejJmeVU1QnpGZ25PUDY5akE9PSIsInZhbHVlIjoiYTE0Tmlia2lhQk5GOFYyN0I5akQzaHdJd01CSlVVaVFqOU9aTG9KUlhLeVBiSHVZWnhuL0haVEtyaWtocDNFcHJINVl0c2d0UkI5SlliTWVGeXlOODdUbW03aFYyclJJTThZdkV5M2FMODVub1p4aVB4NVRNS2M2OHdWVWJqSGQiLCJtYWMiOiIyNzBkMTU2YjYxMWMzMDdiNDk2NWFjOTQwY2E5OTg1YTVmZTg0ZGVhOGE4M2E2ZjEwMGNhNmE3M2I1NWE3OWJlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-09-12 00:12:57', '2025-09-12 00:12:57');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (13, 'GET', '[]', 'https://true-cloud-bagisto.hh/vvcvcvc', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InRJMlV2b2RrOTB1YkVjc2hRQUF2YXc9PSIsInZhbHVlIjoiSkpHYk00b1BLQVd6N0h1RHVVaFg3dnEwMlZjSVVhTExIK3haQ3h0d29HL21JVzhtenQvUW9OMGVmY2V4anlYQnB2NStmdlVtQUhOcU0ydUoyMDUwRnczNENYTXVmdDdRS3gxNXZtL3JzK2d3K0NUV1VmajBhdml6R2Z3WGxrWnEiLCJtYWMiOiJkMzkwY2FiNjc5M2U3MWUyZGVhNzY2NWZkMzBiNDk5MDJlZDZlYmNjOTY0YTBkYmZkM2E0N2QxMGIyMGM0YTc3IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InFJS054eXFON1A1cE11cXdwb0RTSlE9PSIsInZhbHVlIjoiYWJGeTFnVDlMYldDcmxqSnNZc243OVpkNVJBNHVDUm5TTXBYdktuSWhkeks2bXFydG5PT0ZiN1dNMk5UV1VJQkw1MjFXUTk3TXIwVkovVXhYSlBJQ1V0VVIwczZtSWp2d1AzSFZ0aDhTQldaVGthb3JVTzNaYWV4SWY0UDBJYjUiLCJtYWMiOiIxNDg1NWNkNzlmODYwMDdkNTg0ZWZiNTY0YTcyYjg4Y2NjNzdhYTcyM2RlYzA1MTg4NDc0OTc3Y2MzNWQ1ZWY5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-09-12 00:28:06', '2025-09-12 00:28:06');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (14, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B7%D0%B8%D0%BC%D0%BE%D0%B2%D0%B8%D0%B9%20%D0%BE%D0%B4%D1%8F%D0%B3', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik9wVG8zVXRncjNkN2hETmkxREc4cWc9PSIsInZhbHVlIjoiZi90K1czRU44c1RhWThJNWNwVDRETjExOENPV0hBL0cvZ1oyMU4rWVlEb0hyYVE3ZkN5MXpKMlBhTUI1TVlKS3hZWUh1bzZmbzVIdERCTUsvU0NTS1JsS2NlS1pQaUd0QUZVU0prS0tETUtwRWNrajdwOXVnVzRNNlBvRGU5cWEiLCJtYWMiOiIwZmQzN2JkY2E0MDBjOWNlMDY5MDRiZmNjNWI4MmZmMWRjYjI5Yjc4ZGRhOGJlYjdkODk5M2QwOWQ3ZDcyZDE4IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InVjRHg2V1NrSlhTaWtQU1NNUGdOMmc9PSIsInZhbHVlIjoidFQ2V0Y4QmZCSGpyTzQxUDBWeGlBRXdYMFNITytBbWFoNElId0ZSVElTVWlyNGRKai9TQXRWZ0lSZTc0bmdUM21nUFQ2T1lsaGVac1l1cHNYbndxeGxWY2dkVjlpK0ZyaUZOR2NGTDZ6b1htYU9mTVBBRmM4T2xoajRiTFlkYlQiLCJtYWMiOiI2NjRlNDE2N2JhN2VkODE4NzQ4ZWFiMmZjMGM0ZWU3ODg1OTA3MmU1ZjljNDdmYjkyNjQzMTY4YWExMDg0ZTFhIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-12 00:29:15', '2025-09-12 00:29:15');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (15, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%82%D1%8E%D1%82%D1%8E%D0%BD', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Imx0aU9aQWRFUDFnRjRNMVR4OVJ5MHc9PSIsInZhbHVlIjoiWU80QWd4ZkVVK2JEODVPN1QyRGxqeUJzUDY3UUtTZSt4dlZUSE9FQnVvdG9BcG10RkgyRTZxSVNhdUVPa3UvWUxzMVRYWVdUeTUva1FVdEZkSmxSOFRhNXdOdWYwdjMyaVEwSUtBa285aU5weWNtcmJGUnViMWw0dGN0ZHhpaTQiLCJtYWMiOiI3OTE2NjRlZmQ1ZDA0MmRhYWEwZTZmMjBmZTJmNjljNThjZTFkMTdlMmE0NjkyMDk1NDY1MGE5ZjIxZjVjOWM1IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IkJUWmtuZjA5VEd1a3g4Tk1tbmcxd0E9PSIsInZhbHVlIjoiRlJmRWtvVkNmZWk1YlJPRkxmVFNES3BFb2JpRC9OQ05DSXBMeURRcXhSTStzb2JOY05iSzhiTHd0Vjl2YldkOWRIbk56VVdROWkwcjFWVTh0azM0UStKWjA2Sm9HQ2M1enh4UnFLR0F3TEdyTjVlWUVMQkJMV0hNUDVhaUVQeWwiLCJtYWMiOiI2NWY5YTc3Mzc5NTI5OGRjOGExNjNkMTMwZWU4ZjQ1NTRmMTY3ZmQyMjBkZGFmY2MxYTZhOWYxMTRjYThjNzg4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, 1, '2025-09-12 00:45:13', '2025-09-12 00:45:13');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (16, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BA%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImJhNk9HaEZoRjBtV1A4S2lXa0NCV2c9PSIsInZhbHVlIjoiNmdFdEoweTlXUEZzZ1lhdURNVHhLWHpTMEY5SEVkWlVZY0pCQ1BoWGIyd25kc3JTZkVhUCtHODhaZlJ4OWdkSk95Qi9DeUNGREZBaE5wN2NnQnE4dTMzNzRhR2l0OWFNMWUvU2ZFYVVaRXFadVJOaXRRek9tbVpyZHUzN2dINE0iLCJtYWMiOiI3MTE3MWUyOTM5YWRkNzgzMGQ5MTU5YmM1ZTBkZTA4ZjVjZjNjMTYxNzVhZTE3MWI1MWUzMmI0NmNmYjI3MTRhIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlFxZndaODExTER1NThoYkpBL05CbGc9PSIsInZhbHVlIjoiRXE0SVRvTTg2dVdFYXFpNVhoaHg3amQ4L1RZcHU3STlZNWtRM1A0eWl1bzUrSkJCa3hIaXNKNytyMVNTaG13RVNNa2JFSWN4R0FmMUY4RGttWkNiSHhwTCtKbVVOUUhtMmxVbzZsUjFFazc0N29VT0xKczNHUngxR0ZiUS92R2ciLCJtYWMiOiIwYjVhNjVhYjU1NWJlYjc0YzJiMjFiNTg5NGU1MmM2N2Y1NWUyOGRmZjY4NzE1NDgxYTk2NGE3ZjBkNDA3YzJhIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 5, NULL, NULL, 1, '2025-09-12 00:45:14', '2025-09-12 00:45:14');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (17, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B2%D1%83%D0%B3%D1%96%D0%BB%D0%BB%D1%8F', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Im9ZZlp6WTdPNCtBekIrT1drMWxuUkE9PSIsInZhbHVlIjoidks3eVZpb05JWld4UmhMUkloL2ROTmptRTNkWnd4cVVjYWdmVFIraUFpRUhaTkVOSnFjOU9OQ3Y1NWxadmMyeUZ3QVdVZEpGUENrZjAybW9PQmJHbFpReUFTM2M5ZUN2elptalR2Q2tGd1V0YlhicThHUWxEYnZ3L0duZmltQXkiLCJtYWMiOiI4YjVlOWIxOTI0MGRhNDEzYjIyMjQ5ZGQxYjFlMGUzNTRlMmM4NGQxYmQ2ZDg5OTQ1NGFkOTg1ZjUzODQ0ZjgxIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjNlODFBSjY2cmEzSjk4UWRIRS95b1E9PSIsInZhbHVlIjoiK0N6Y2VJYVV1dmIraFdVZ0JVT0twK2NiY3ZoQlh4RlJMRlVNNk41Mm1lUjg3QnRPaWRGaWFTZGZ2bnQwVlZ5V2U0a2J0elp1cEViRzZveko4TG1tb3F1cVltc1dmcVl0MW50WDRwajNVZ0JmMGNBWW5udjdBNjllSXh4L0dxKy8iLCJtYWMiOiJjNWUwMzY1ZGE4MzBhNTA1YjE4MWVmMjE3MDYzMzdmNGNkN2ExMmVkNTY1OGU0NjliMWE2NzMyOTA0ZDNhYzA2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, 1, '2025-09-12 00:47:01', '2025-09-12 00:47:01');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (18, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%88%D0%BB%D0%B0%D0%BD%D0%B3%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InUrUnozcnZEbnRqZkZpeEFFbE84OHc9PSIsInZhbHVlIjoicFBoODJiT3RTNE9QdkFQZkdJWmNiNDdTcmkrbXE4MHJYYk82blFWcmpPK29adjhHTjdOY3Q3bDdDNGJUbytkN256T0NUcWxQaVE3NzVGUTM0WjJGYjlaNnBSQ2IvaGM2YjN6SjR0VG5INENGUmN5RTY3Zm5yZWVYaWVBQmxnMnEiLCJtYWMiOiI4Zjc5M2U3OGEyNzA0MjY0MTA2OGYxMzdlMTFmNTJiZWJhMWEwMTcyYzE3ZGVjYjg1OGQ2Zjc0MzhhYzVmY2FiIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IkFsM2hpaDZSeURDM0JJZk4zOW8rVHc9PSIsInZhbHVlIjoiS0szdDdxcG1DNllZcVZDcTFTRjgybHhBRm1aMFRKTFdFZVJuYlJsVEdUNXFQdkNDUjlPUEJIY2pmNmJuMjY0TE53VVpBM0cweWZNa0tYTVRyamtDSDZ6SGpEVjRoMEVMOFBjOVNSVlkvVUxxaFh2bFppRXZrTk1KamtOZkxqSzEiLCJtYWMiOiJjOTQwYWJhYWI5OWY3Mjc1MjJmNDBjZGIwMmNiMDM2ZGYxMTFhOWI0OTg2MDYzN2RhZjA0Zjc0ZTg0YWU1Mzk5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 9, NULL, NULL, 1, '2025-09-12 00:47:02', '2025-09-12 00:47:02');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (19, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', 'https://true-cloud-bagisto.hh/admin/catalog/products/edit/11', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/admin\\/catalog\\/products\\/edit\\/11\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IllKK1JTTDBRZ01RUVZ4eWZpS2NPV1E9PSIsInZhbHVlIjoiaCtVSDByaTExUlozOVVFWDFHUGtFRUd0UTRUd3lLdTlSMVlueVhVcUNZNHFGWXVjSkg1eW1jTmNzeXRQQmhRZ1FZaUdrYmdnTXg3MVNuQ2EyUmk2MVlRK3VGdnBZRmNzTWQ1dGVrR09WZmZIQW91V1BuUFd1MzdXS0FaeC9kbUgiLCJtYWMiOiIyNzMzMTZlOTA1YTBmYWY2M2RmN2MyNGRmMjhmODBmMjcyZTNhZmEyMmM2NjFiYjhlMjJkMDRjMGQ3ZTE2ZTAxIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Ing0ZEJmaThVaWJJZDdPenVNSzd6Smc9PSIsInZhbHVlIjoiMVJGWGl5U21GM3VrbEw3eG9ybGtPbUo1RDQ3eHAycUtnOWFGZmxieDhlTnJxZHladE9CV0VIdXFvTVdMQVZkMUlOMjFveHhDR1Z4Q0RiQkd6ckxDYlUwNktwMEJNZDk4dXN1OGlOMHIwYXpybE0yNE05YkQ1VVEwRmVPNmZLNHciLCJtYWMiOiJhMmVjN2FkMGQ2MGNkYzNlM2FhZWRkNWIzY2I3NDQ0OGIyMmQ3YTMxZWYyZGM3NjBmZDBiNzE1NWUxOGFlMTBkIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 11, NULL, NULL, 1, '2025-09-12 00:48:41', '2025-09-12 00:48:41');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (20, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B0%D0%BA%D1%81%D0%B5%D1%81%D1%83%D0%B0%D1%80%D0%B8', 'https://true-cloud-bagisto.hh/%D1%88%D0%BB%D0%B0%D0%BD%D0%B3%D0%B8', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/%D1%88%D0%BB%D0%B0%D0%BD%D0%B3%D0%B8\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik1HTnhnK0dMbVI2eEZwalpSdnhWa2c9PSIsInZhbHVlIjoiV3NGSXhKU0tQK1NlVjdIUGZVMHBJT3J6SlFVRDE2aGVsUkc1WFY1dldZOWtPaXBqVmNjb3A0dlltRUxCRXk0b2RaMTJ6UUpFcU5LcTZSUXRic1JFWEhIMVBGdGwxeThaRkJ0UlRUTHRONXZBL2FiZ3ZsN3ZnTi9ManJxc3BJNGMiLCJtYWMiOiJiODdmNzFkOWI2YjU2MDAwY2JjMDU2NDk1NDAwZDI1N2UwY2NlMzczM2VmOTY5ZGVjOWEzNjY4N2VlNzliZDBmIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImN3dVlFNkQ1ZXU0cjJYK3pjNlgrdHc9PSIsInZhbHVlIjoiSFg2anpvWUlxS0JVQm55VDFlVGNqVTJRZnlUWWF4bUJsSGtpUW5VUHVoT2FLeFlsZnFldXJGZmlTSmRLcVBML2NpcVNYRkw5aVZKZU4rbFJRZWd4VDlwc1ViNnBzSzVmSWRuS2ErR2NpSzNwZ1d6M2g2V2I3UENxZEhpNGswc3oiLCJtYWMiOiJlNmJhOGIwNGRmMTAxMzExNGVmOWEwZTRlYmYxMGNjOTU0MDhjOTEwYTY0YzQwOTZiNzY5MTQwNTM2MzUwZGFhIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 10, NULL, NULL, 1, '2025-09-12 00:51:26', '2025-09-12 00:51:26');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (21, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B8', 'https://true-cloud-bagisto.hh/%D1%88%D0%BB%D0%B0%D0%BD%D0%B3%D0%B8', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/%D1%88%D0%BB%D0%B0%D0%BD%D0%B3%D0%B8\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjVJL3BQS0ZBZmkvaFpnWGVsMitjc0E9PSIsInZhbHVlIjoiSldSMVVhTnp2Z3dRS3N3VEJFUjRQU29HZUFYaStVVzFCWDJ1R0F1cnBSd3RyTU9DNVFjb1NackxlcUt1WndzdWxDbW5XU2k2c1doanVrSGxjdTJNeVRzNHlQbUtuV0hXM0RjejhGVUdia21PQURtYUxQUDNLdXBYTm5tUWpKeUQiLCJtYWMiOiI3OWJlOWM5ZDkyODAxMGFjOGRjYWEwMjliZDBhMjNiOTY3ODViMmRiN2E5ODBhZGMyY2I1YzZkODQxYzY3MmM1IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlJLV0h2ZzAxRk1vSStBNVJ3Rkpwa0E9PSIsInZhbHVlIjoiOG5Xa2hLa2VPSGZqMWxJcjBjQzRabzVlTFJyOU5yemE2TjE2WWxnT2tBV0RteGxzZUhGV1RXelVTK2NPSXE5S3pHVVl0YXlMSGdKWGVSL3N3TW96RllnMnd5V3VFc3EzZlRhTS9Vc1E0WEIzRkFTaHpZSnM4eGx1cnZlVFBEc0wiLCJtYWMiOiIyZTc3ZWU4NGYzMTA3ZmYyNzQ4MjBmNTM5OTUyMTExMGM3MmQ0ZDJiZDg1M2E2NGYxMDkxZjdmODE4OTllN2U2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 11, NULL, NULL, 1, '2025-09-12 00:51:27', '2025-09-12 00:51:27');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (22, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%87%D0%B0%D1%88%D1%96', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InlyUDVDK0x5am05Sm45ZXJFR1U0N2c9PSIsInZhbHVlIjoiZ2JNOEptNTNLU0lwaWVoWjV6aEplenhRMmg2eldWV1JpUmEySHA2LzNzWHhDb01SYXRiekZZSmM3amUwZ1liVSsyK0k2SFcrS1EvQVltcHUxWVA0bUF4akxXR0pJcnloNzdGTlJTeHNLeHcxOE9KMkRQcXNYSERqTFJHdW1icE8iLCJtYWMiOiJiNDY5OTI4MTZkMGM2Y2UxNGQwNTdkYWEwYmVjOTQ2ZDRlMzliOTYzYzdlMTc4MjQ3MGRmYjRmMmU4OTA3MmI0IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IkZ0R2gvb0VyaDdMVktZNWdPQXYxOUE9PSIsInZhbHVlIjoiUEVNcHdGSlg3WWtTWERWRFVxOXJEUlgwaGpmbTdKTG9USTdhWVBDWlUwcnYyVnJCQjhOMm5yWlc1dDhUMXhVMEYwcEZuSXZ4TWZ0TmxCcHNha3RXTTRDSXpySk1yTUZBN0pTTWRJQ3FTYVV3UFZldk5QK3VKcW1JTC83V1htRXciLCJtYWMiOiI5OTdkNjQ0NzAwYmNiZjk5YzhlYzhjNjNiN2IwZTQ2YWU3OWIyM2YwNWQzZGQ0YjY0MmNiZTk0MmRmNGI5NjUxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 8, NULL, NULL, 1, '2025-09-12 01:57:07', '2025-09-12 01:57:07');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (23, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-l', 'https://true-cloud-bagisto.hh/compare', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/compare\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik5Idkc1d2ltdnFsbmg0cFJiMmhVRmc9PSIsInZhbHVlIjoiWFRwZ1BlSEJteElFUWhDaDRhN0U2OHJGSy91R0RMT0FzSEdxVHdkelhra3R6R083RVErMHNBVDBtb3JjNm9hVG1VZ2l3UStZam1xRS9ZOFBRbWlJeW9saWxIV1h1d0ttU01RRW1rcXlFVHc4NjhvQ2JlOG1kdStndElRNjhvRXMiLCJtYWMiOiJkMjdhYzYwYzFkZDU4MzdjYWZkNjJmY2U4YWMyMTNiYzNlMzRhMTA2MTdmNGE1OGQ2ZTRjNjg2ZjNhYWEzNzhhIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImR5WHZodjIyaWVwQlAzUUNLMUN3V0E9PSIsInZhbHVlIjoiM0R1eEhseWNPTzN3dkJIK1RPbzMydEJYVC9WaXc5OTFYMDFGcC9mK0w2YllGTHgrQ1RLWExXWmpBcDd4QlhVOUlnbFlVL0xxZ1JzdjltMC9XQUUwcGFEOWpidjZhekVpaFdGY3FxM0ZjdUxqbElQQ3hudWdSZ1VrN3JQd2ROYisiLCJtYWMiOiI2NWU5YTlhMzU0ODAzMzQ1MGUxMDgzZDEyMzAzYzAwYWI1OWQwMzA5ZjgxZWVjZTc0NDkwMzZhNTE3YjVlODI5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 9, NULL, NULL, 1, '2025-09-12 02:39:26', '2025-09-12 02:39:26');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (24, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/customer/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkVaNjdIU3BYU3QvSTdBRzljNjA0T3c9PSIsInZhbHVlIjoidUR0bWNrOGtiMzF6dGxjMEQ5dThtK09DK2gyNCtOVUJjOEhsRHNkRDl1UU9HTHZSN2FtOXllUVlBMmdQMEwyVkZnV3l0c1lLNGVuZlB6QzNMY2JSL240TTJHNDBmenlrays3MlZuS3ptS0wrQXRuSGFJTm5tRWgvakNYb2VXYUgiLCJtYWMiOiIzNTFkYzE1MGUyYWYwZGMzOWQxNTdjMWRkYzM3Yzg4ZDhjMmNiZTQyMzkxNTUzNTBmYTY2Mzg0ZTQ5ZTE4NGVhIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImxXN2EvUnJKKytKaDNJVnI5SlVNU1E9PSIsInZhbHVlIjoiRnh3WlNUcVRiNXJ3NGFpZm5WTE9KdC9zczRVSmlPbmpFYXJ6YmpjYVhOMkNRNVpiVGlXY2JrWlJ3OEkvZnc4QVhBSWJBU1hvVmd1YkUxanFORUsycHRlR2NUTG9mQ2dzb200RVZpN3o5ZERlVWE2c09OWXhta2dSYy9sa2tndGciLCJtYWMiOiJkNjYxZjUxMzc1ZjIxYjFlM2YzMTkwOGM2ZmRhYzI3ZTZkZThhZmE0OGRhNWFkN2I0NzYyMGIyYWNhNWY0ZWQ1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-09-12 02:42:03', '2025-09-12 02:42:03');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (25, 'GET', '[]', 'https://true-cloud-bagisto.hh/SP-0010-variant-5-9', 'https://true-cloud-bagisto.hh/admin/catalog/products/edit/32', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/admin\\/catalog\\/products\\/edit\\/32\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImI2MWFsb0pzOEFXMWwrY2FuZ0szVFE9PSIsInZhbHVlIjoicFJPV29qdCtqZDZPT0RnUzN3QmJNUzZDZ3dNMzVvb1BsdUpBSk9YUklUVnpodkFOUHpMOXd0ZFplNnJDZXdwcVdxS3F5MWU4N1lEeXFySVFzenRjNVV3eExWSEg1bVQrNnRBSjRkM2xSVWY4Qm5BZHZnSzFBM3lTZnJiRmtFQloiLCJtYWMiOiJiM2I1YTZkNjY1MzBhMjM1MTgzYjRiMjg1ZmE1OGU2MDRmNWE1MjE3NWE0NjI4MzExZTI0ZDRkYmY0NjljYWYwIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImYrVEFXb2ZYMGpISStCY0xSSTBmTkE9PSIsInZhbHVlIjoiOG92bEE3emUzemtBd3ZtNm5kTnNvS05TRlZacVJOd2tubmhFR2QrWThoeXVJN3BVcWZZeG5WbDdTN2R4N0pqbVp1TXE4dUJVK0FnY1V4Yy8wNDc2eENBNUUvYjRQcmVGVGlEME9JNUFkRmNCemxaYnZHN1NKcGRVVVNYbEpDSEgiLCJtYWMiOiIwMjQ3OTgxMTk5Y2UxYzY4MmRjMWIzMWJkNmQzMmY4OWE2NjAzYTg2ZWZhZTkyMWI0MGE5ODkwM2MzZmVhYWRlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 32, NULL, NULL, 1, '2025-09-12 14:39:55', '2025-09-12 14:39:55');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (26, 'GET', '[]', 'https://true-cloud-bagisto.hh/SP-0010-variant-5-8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IksxWXRycTY2R3l5QVpBVUpONzRORkE9PSIsInZhbHVlIjoiVXNOWVpvbURtMllIRE9BZGZ6SHZFSUozOTNIQXdrSVRGSjhORThCczNsUy9VM0M5YTd4RGt3RC9TeFkrKzNLSFJ1TzVIOFpvU1BGOExZRVZuK0d1NU9OWEdBbmd0WTZMNjdETi9tdTYyTDcrQnVOSTU1akNUSXMzR0dzL3pma28iLCJtYWMiOiI0ZDgxNGFkNWZlODc2MGVhZmE2MDQxZGJkNGVlYTEyNmMzZDBmZTUyODYxMmZhYmIwZWJlMDEzMGVkYjUzZWU2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlRWcTZjVTdldWVGN0lIVktwS2JmUFE9PSIsInZhbHVlIjoiSnI1bm1UWHo1Kzc2M1l6QzYwc2hSS0xqdEIxUFc1L2dQeFFzVkIrNS8zaDZDYjBjY0hzMjNWYjd4RzJDdWV2QU9RTDAwM0tRRFdHT21ES2FaM0dyb1BsNFpZNC9LSFYvNzJyZ3ZHd1Jmd1NwTVVVd3BqRC96eEVWTitFUk42d0MiLCJtYWMiOiJkMzVhZTY0ZDYzODlmYWEwODIyZTIzNDRjNjhlMmYyMWQ3ZTlkZjRiMTk4MDhlZjBlOWY3MjJkOGMwYTM0YTlkIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 31, NULL, NULL, 1, '2025-09-12 14:41:44', '2025-09-12 14:41:44');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (27, 'GET', '[]', 'https://true-cloud-bagisto.hh/gfegerg', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InE2NzBKOTBMY0prOU9TWWpmQjRCTEE9PSIsInZhbHVlIjoiT1NPb0RWenhEQ0kwYnpmd3RSNVdKd1dNYlZNTFZRUnp6bVBDNHpuTTZPRjVWMGl5Rk1mcjAvekw4MnJGcmFvZklNQnpWV21CdFRLRFpmSFNUd05Hd1J5bXFJNFhySnRxMDJBNEZZMUZpTDlZK2RRYTNRN3lHT1lkUmV0RWpuVmkiLCJtYWMiOiIyZDcyNDkxNGIwYWIxNzkwZTYwYzQyYjk5NWFmNDhlOWRjMGI1ZDVhOTRhMzU2MTc4NzlhMzU5MmFiYmI1NTQzIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImZaY0VLamNzd3ROK3hrMGQxTUlXeEE9PSIsInZhbHVlIjoiRDFmR1A4VmY5a1piQVZHZnlGdkdFMlY3a1c2dVVSc0tQZDBiblFrczRKaGhVNFlCL2xJaEJiL240MklTZ0VFczQ5RFE4N0NyUnRwR1dvdmVLVmZic1E5SWNBZHd4TWxKQUM5aGFVS2kweUN2aXMwMmRQc202YjlSNXR3Ui9VRzciLCJtYWMiOiJjZWIxMmVkMWQzZWMwYzU5NWYzYTNhNGU2ODg3ODFiMzBkOGMwMGJlYzc4YzYzMWJhN2YxOTk5Zjc2Yzg0MWE1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 12, NULL, NULL, 1, '2025-09-12 14:46:07', '2025-09-12 14:46:07');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (28, 'GET', '[]', 'https://true-cloud-bagisto.hh/u2d8dv6jh0lhj35gpk4keh346599svj7.jpg', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"accept\":[\"image\\/avif,image\\/webp,image\\/apng,image\\/svg+xml,image\\/*,*\\/*;q=0.8\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"image\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ik9naGtrMzhZb0Y0dFBoVW9kSjd6anc9PSIsInZhbHVlIjoiQWlzdEpCRWtBSlBVNXFoQkZuZyt3U25DektkbkcyRzB5RWpwK2E4WjgwT1ZleWtoQ25JS1pUSEtCY3RzeFlFQmlnU0RVWVlWL2dNMEx6SlUyUFN0bnBySGpGcjE2NGV6eDZLSVZraGdrV0MrSWJNSGRNNDJ1clI5Y0orTks2elciLCJtYWMiOiI2NGExMDM1NDhhZmZmOTYyMjcwOWMwZTZjYWVhZjBlNzVjYjgyNzZmMDM1YjY4ZGRkZDE1ODBkNmI0YTA5MWMzIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjV3WjVxM093eW1WZk16djVBTWFDemc9PSIsInZhbHVlIjoiQmI0OTR6UTVaV3VXdWFodkN2OFlhY2JSQm9hbkI1b2QxTjZGQVJZVis4SGQyMkc5UTBYVVpVZTJVNjRoYVJkcnVhWWhaNWExRCt3Y1FMUEd0VjZ3UG1MVldXTk9qdEdnbXo2THpNbzBvRmV6bHlMNDV6WWlSaHBMMkFza1RyZUUiLCJtYWMiOiJhYzAzZWVkMjhmYzE2MzdjYmFhZGM4OTkwM2UyYjExMzhjYzg1YTllZTg1MmNhOGQ0MDY4ZjlmZTFhN2RiNWU2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-12 22:11:09', '2025-09-12 22:11:09');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (29, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%87%D0%B0%D1%88%D1%96', 'https://true-cloud-bagisto.hh/gfegerg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/gfegerg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkIxQnJHWktWRnlKbG52RnJ5WkxrU2c9PSIsInZhbHVlIjoiTU5zbGU3dGlOQ0JWbWNCMW9aaDBjbWdDV2ZFN3dKZlVHTkNPUjRTaFhBTW9lZ09OYzljeFd5RWQxdUhTWTczQ2t3czhka3JhUUhKRk1ET2RxY3Z4U3RHQW1EWk10T2JURzh4bXVpQjhzazAvS1IxVGVhckl4OVlwa25uNHZjaHkiLCJtYWMiOiIyMGM5YWE1ZDEwNzE1NWQyNzgxYTI2MmFiZDExOTUwNzVlMjg4OTFmOTJkNjU1NGQzZTFhMjQ2NmQxMTM5MjM2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlBlY0hMY3k1cm0yUDlYajlKWGZ4dEE9PSIsInZhbHVlIjoiR09PanN2eWorK0VWQUZwVVhmOWJDOWlGV0szeFRzOVd6UW1jUm5iQmc0cjJ0SGxqdU9NV0pPdXpGQ3oxNWU3Vjl4MnVvY0VOKzhYdGhzbWhoZDN2UG53ZzRzbkVYSXhOQ2xnUXhkbWJKMFZ2VDUwYWdDdXUyNEZvRHBSUnpkcGciLCJtYWMiOiJiMDYyNmI0YjM2MDM3YzQwZjdlNWNmMzU0YWY4NzkyN2RmZDRjNTY4ZjRhYTZkYzM1YzczYTE5ZmUzNzNiOTgxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 8, NULL, NULL, 1, '2025-09-13 00:00:01', '2025-09-13 00:00:01');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (30, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/%D1%87%D0%B0%D1%88%D1%96', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/%D1%87%D0%B0%D1%88%D1%96\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InBJakhVWmN4UVV6Q2ZjcWw1dFljNUE9PSIsInZhbHVlIjoiVEx6dFozL084Si9SVVJEOHNIYVdFU2VpWUJjd1lNem53eERodWhZUmhpMU5zd1A5QUs0bk82RHFuNWNrLzFGeVhrK3RQRkF1UUM1VllKUjZEY1Y1NC9zb2kyQ3cwQ015d3R0QXE2TXBCQkFEUWpkYUYrcFQ4Zk9IV0ozQUZGTWoiLCJtYWMiOiI1ZWI3MjkzZDZmYmYyNjAzNjFlMDNmODg0N2I1M2Y4NzExODU5OWE4N2NmNWY0NWVhNjZhMzUwZDdjN2M1NDc4IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjJNRXdKK3RhQm52ZjZNMnhTQTI3aFE9PSIsInZhbHVlIjoiSEhHdDR1Umg1d3ZsL2pzNWN1RU53Uzcvak9JZkNnRUdiS3JEM0RpQ1hVdC9JWUY1VThraGhZalRQNHJxWStoMDRxSUlZV21WWjVkcWNJd0FtaTZJOCtNb3p4NksyYjJKMXducFliaWZLS1AzdVJpK0FBeU5KeXRNZkc4aEdnKzYiLCJtYWMiOiI0OWU4OTZmZTU1ZGE0MjI2ODU0YTc5YjcxYWZmM2E4ZWM0ODVkOTgzNzdjNjQ3ZDcyMmExMGRkN2RmNDE1M2NjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-13 00:00:05', '2025-09-13 00:00:05');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (31, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-l', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InJsazRNY3dKNUVxajhoZVFzRTlXdUE9PSIsInZhbHVlIjoiZ2dURDNiTDRqZHdaVHlFcUw3YjNVZ2dvUlFrTFRCSEY3VlV4UVF5REpEQ2pKU1NnbnVoTDhtaEFDK3o3Sm5zbjU3eUg5REsyN0FYUWJoWlBKaWM0ZFYxQlh1dVVBM0hMM3FmRS9sd1Q3N2IzRTV1U1k1MVdueTVOSEQyZ2FVQngiLCJtYWMiOiI4YWNhYmE0YzFiNTFiNTlmYTNkZDc1YjJlZDNhM2VjMzE4MGQ5NWYxNTUyYjA3M2JjZTM4NjNiYmU3MjMyNTFhIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjNleWtYaDZ0R1hubVhhMTJnOE52WHc9PSIsInZhbHVlIjoiRTNkaEc1MCtlMU9Ic29rRGt4RjlVZEVBOXAyYnY5QnE5K0dVbWd0bXJwc1liTU81enlxZ3NLa3NwVUVabVRWb0h5aXM2OXNKN2t3Rm1BUkNkR3dWODF1cy9CaCtiNGNJaXphM094cFd1VXdLdkJGNXgxYm5zcVlxeG5zbDU2SGsiLCJtYWMiOiJjYjI0NjI3ZTZiNDRkZDA4ZDQ1Zjc0MDQ3YjYwNTU3MTJiYzE4ZGI2NTE1ZTQ2NGNhNjRhZWQxNjJmNjhiYzRjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 9, NULL, NULL, 1, '2025-09-13 00:00:13', '2025-09-13 00:00:13');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (32, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B2%D1%83%D0%B3%D1%96%D0%BB%D0%BB%D1%8F', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjZkOXNYNFlEL2RGQXlpbDQ1b2FMOEE9PSIsInZhbHVlIjoieWxQQkFhbHY4dWMwZ3BQM0ZYeGFYUTFhdFh2cTVSZmdSK1o4bnlCVjNkS0lOak4xZUNLVGc4Q2Q5enQvQTNUMXk2dlFnU2I0OHViSzQzb1lIS1JFMkllQnJyUUdWVUtoSCtpSXRQYm9FYTBRS2tPRHJ4Z0hBZUtXTFJvLytTalMiLCJtYWMiOiJlM2EwMDYwMWEyOGVmYzFjZGQ4YWEwMjc0MGNjMmU5NzY1OWU2ODZkNWUxOGNmZDU2M2YxZGRjNDRkYjI0NDYzIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlBvc2hvY25vNHR4SUJEY0ErbVpsbVE9PSIsInZhbHVlIjoicm94QUI1SHRlRXJqUFpqczcveENkeXFXQ0s5WXVrTjBQbW50VDJreTJlb2ZXeXlQSHlaWmY0cXFieGRXWWJ4bnQrbDhFYUs1Wjdrdkk3N3dxYzRmYjRMeVUxMzVpakJxSWJsczR6VytzaktmNUd3ZlRyb2JUR1NCanFiVkUwdHoiLCJtYWMiOiI3YTAzYmE1YWRmYjY2ZGRjODlhNjA3ZWUyZGIyMjc4ZWU3NDgwYTQ1ZDNhNjdmZTgyNDcxNTliMWNmMTUxNDAwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, 1, '2025-09-13 00:00:14', '2025-09-13 00:00:14');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (33, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BD%D0%B0%D0%B1%D0%BE%D1%80%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImJJNVl4VndHcFUvVG5YbjhqakVFUEE9PSIsInZhbHVlIjoiSTJpSUFVT081eDVXODg0cnNxTVU3ZWdxYmlUSjBxTlJLSjRFNlBIT1I0UHJsZXJ3R2wwendVeUFmaHFjdDh2MEtHRUNDaGZEQmthQVk4RzZLcVlBOVJZVEZBbFJCVmNacFcyVEtNV1UrNWV6SXRtMzZoZGVISDFrNTZ1ZE5xRnMiLCJtYWMiOiI4ZjhhYmI0MTZkNjNhOTg4YTk0NDhiZjYwNDQ3MThjZmYzOGQwNjI2ODFlMDQ4Njk4MDRlMjg2MDAyNWE3MmMzIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImYybFVTc3JnQjhab1YyYkNBdUY5N0E9PSIsInZhbHVlIjoiVTcwZlpIUWdRQWtnM09UY0diT3JBMmFWQmkvNGVZeklBZjFRR2pLOFRQUTlsTmFxZGFkOXRQMDFvc1diaW9pTmU4NWlueGIxVnZGUno1U083RFVvT2h3aEpyKzU1N2tyRnRyNXFJbGJYK0ZnYk1WOWl3MjZFSG1Md1p6S1RuOWMiLCJtYWMiOiJjNTc0ZTg3NGQ4ZWIzZTQwYmJiMDMyYzI3OWE4NDY4OTJhMjQ4NzA0YWZiZDljMzUxODZjODgxMzU4YThlOGMyIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 11, NULL, NULL, 1, '2025-09-13 00:01:08', '2025-09-13 00:01:08');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (34, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B0%D0%BA%D1%81%D0%B5%D1%81%D1%83%D0%B0%D1%80%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjJuNHJ0TzlwSlpJWDBzc2FZZ2U4OXc9PSIsInZhbHVlIjoiWncwclNUWWJ4VHo2OGxZVWdmdS9uRGgycExJUFRCUzRkZVI1RzFLaWZWdGFOejNCNituOEhMUHU3WlZFdzh2d3NrSTJvUFV1ZER0anZpSWhjUUpsUHJJVlpFRGtVQjE4dndvWXdYeHJ5clZUK2tEeEJaZ296emNLN211bGZNM0siLCJtYWMiOiJhNDQ4NzdhYjUzNDE1ZTY2ZDdkYmVlYTY4Nzc1M2VmMjEyOTY1OWMyZDdkOThkOWM1YjQ3OGJmZDk0NTIxOWRiIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjFQUmNyb0gzVWc0YXNBVFZIQjlhQ2c9PSIsInZhbHVlIjoiMTJsTzhQSjJhSTdHTDdEcmZheWZNSTFmR2dSZmVrayt4SjZ6cWVNNWxWZ3JnNWZsRDNZMGhQZk00eDh2YlhLWmVGSmpwVnZINVVJRzUzYzM3U09aSzdiQUNsbmVwZUUvQVh2VWNZL1JmclIvNHJKc2gvOWhYSldPQkMzbkRHdWUiLCJtYWMiOiJmOTBkZjBmZTJlMmE4ODI1YzlmYWIyNjMyYzdkZTk5MDNmMWUyZmI3NGUyNjFiMmNkYWZlY2RjYTMwODNkYjg5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 10, NULL, NULL, 1, '2025-09-13 00:01:09', '2025-09-13 00:01:09');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (35, 'GET', '[]', 'https://true-cloud-bagisto.hh/gfegerg', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkRzTjdsV3B4cllhWXY4R1VYT1V5VXc9PSIsInZhbHVlIjoiQ2pmVlFyZktjQUoraCtxbkxaUGdCQnJBZkJrbVRTd2FXeHYzUGZhSlhzNVd2d2RYd0JQbUVUWHNReHROYUZuV0FKU29BamNvaHY0dlFKTTNCUnZDamtLdUREbWZNMEw5MDNEL0txZzdvYm03TGQwT3J2MUpiWXFNNk4zUDkrZDgiLCJtYWMiOiI2YzJhNzEyZTk0NWMzMTMxMWQ5MjA1MzU4NzhlYjIzYmNmZjJiNmM1ZmUyOTRmNTg0NGE5MDZhNDJlNzgwNmM3IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlI0SHJVeC9wbFkrR2NVNDhvT0ZjUXc9PSIsInZhbHVlIjoiUEVQRldrV1Z0RE1menRUd0IyY0N2VHJSVXJPa1lsUTZrYW1CZEt5TjB4Z3JOWEJaT0NoT3RMQTZta3BBMm9RMFhQL1kvMVplQ3lnRjFOY3hVUW1lWldqZmdmaWQ0MzRCWkNPbWZuQ3g5VVRQaUhjRDlhTERlaHlaNFBmUXk5WHUiLCJtYWMiOiI0MzkzY2QyMGIyOTFkNzAyNTQyZWJkM2U1Yzc0MmMyYWI2ZGRkNWEzMTA5NGYyODQzN2Q1YTEzZjk5YTQ4ZGE5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 12, NULL, NULL, 1, '2025-09-13 00:01:31', '2025-09-13 00:01:31');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (36, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BA%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IlRvWE8vZVp6aExCMU9hNG4wSUw5RWc9PSIsInZhbHVlIjoidXFnSS8wU255YzN1Zk1EVGJkTm94QkN2QmVLSU41RVV6bDdJWGdlT1FZLytTcTF4bEJnMzJraXdHdDR4eS9OdnhJRVZKYnBkVkVRS04xTWtRV1BFY2cyMmtKNUxFdlFIQ2NmY0tvSU5sd3NQRlFCY0Nsd3JaVWVSSHBscXRhN1EiLCJtYWMiOiJiMTI5MGFjMDViMTQ5Y2Y2NzUzYTM1YjU3M2E4N2EyMWViZmI3MzBmNTNlN2Q3OWZiMDJlMWQ5ZTgyZjU4ZDNhIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjBrZk42QWJZa3o1dTlzMlVheHRhMGc9PSIsInZhbHVlIjoiTkxCOWQzT0FWVDF6L1FHcmNzMTJyS0FmdkxYUGRPVzM3VnBZa1NVMlBNbytMNFNlcmp4U05ocElqNjFvN3hDZzRPcys0UmVrK0ZBSWwrYWxlWWFET0JhaGgya2FDNE1lYXpVS3hOR3dJQUJpZVRaWnR2bjhWTUwxQUtKWFRTTHAiLCJtYWMiOiIzNWEzZDAxZTNmZDRmYWE5NjFhMmQ3ZjQ2NjI2ZDlhYjI5YTAyZjBmNzcwOTY2Y2I2MDU2ZWFjMmUzZGI3ZDBiIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-13 00:21:13', '2025-09-13 00:21:13');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (37, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%82%D1%8E%D1%82%D1%8E%D0%BD', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjR1V0dhMmI1MnRwMGNGNVVVTCtWeHc9PSIsInZhbHVlIjoiNUM4MFJvUi9IK1c1WHhMRkZZQnJaUFlxTjNvb2lzNFRXbERFaGlXWFEySDNFekNwVnJrYkh4VGJFQ0RuR1RIaXV5TEJKYTg0aytqQytEVEtrbno4aWZCNmhNZklEdzdiYTY5MTJaZVdTb3Njd3BkVVhXZVM4S1FhcWhrOFlJWCsiLCJtYWMiOiI3OTUxMjRmNzk3ZTkxOTE2OWQ4NmMzNTNiZDFiYjRhM2EwYTExZWQwZTkzNTk3ZGI4YTRmNTI2NDNjZWRlNjViIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImFUKzZuMzUwSjd6MURKOENDU01LVnc9PSIsInZhbHVlIjoiUEVPUHlJQ2l0Mit3WXpvVVp1VjJFN0dFVHpGRW1kZ2dhanhiUmk5NVZ2L2t4eDVGQXU4OWk3QUhpVVl4a1Z6QVdMUVFrQk1DdjJ5Ykg1NFp3VHQ3V2FwY2xnT2YyRlF5cXk0R3U0V0R4d1p4MG5SM280QUJPbXhzdTY0ZmJNMHAiLCJtYWMiOiIzOGNlMmZlODBhYWIxNWRjZWMxNjM1OTU5NTAxYjNlOGVkZTc1YWZmYjc0MGZlMWM4MzI0YzU4NTdhNTVmNGNmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, 1, '2025-09-13 00:21:33', '2025-09-13 00:21:33');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (38, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Im1ydmRuUXRWbVZHK1VDYlZjN2RVeWc9PSIsInZhbHVlIjoieUpEWHpzQm1vOEdVWnR3MkVyOUp6Z05BTkF3bzI1Z0huQW9sampCU09ySmRaZm1RM2pMdG50UUVqRkllZXdHbklwR255cE9RZXA4YnFCbnRpaUNzRUxCWG90QWtnYkxCc0dXZ0NFaC8yckpDNG1ZTk5VUUdoTW1RQjJwZEJyWjYiLCJtYWMiOiJiY2ZjNzE1YTkxM2ZlOWIwYmNkNmM4NjRhMzdjMjRlMjc2NTZhYmM4ZWI0MmFmOTA1OWFmODYxOTAwNDBiODJlIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjhaR3dkUUFDaEpKTTdRK1oyRysxSUE9PSIsInZhbHVlIjoiOHpSQzQ4eExtOE5sRGo0QzVQcmtvNEFuNVBDNnozV3BNVEwzV041b0VtNDIrS09vdCtmWE93bmNNdStVZGtIaEkyOURmTU04enRVcCtvTUJEUkNkM3JDc1ZpeU43b0V2b0kyUktqVmthc2JmbDErOXhrMHhyT3hycFgrVGtETlciLCJtYWMiOiI1MWNmZWUzZmZhZDhlN2M2NTE4YjIxMmFiMzU5OWUzY2I0YjY5MmJjN2ZkYjc5ZGZlZmI4NmViYzQ0NDA3ZWI5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 11, NULL, NULL, 1, '2025-09-13 03:20:14', '2025-09-13 03:20:14');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (39, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/customer/account/wishlist', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/account\\/wishlist\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ill5bVY1emMvdk95SnB1VEJ1Nlo0VEE9PSIsInZhbHVlIjoiNGJUeTVDSHBZL1p3R1kwbVdQRWZKV2NuMWVzZzFjblFnSnh2VWF2UEJaQlg2ZWZVYzBwRURpN0xNeVluMUJYbU42enZQdzlFU1VqMzR0TkVjMzIxcEdOSXN0dTg4U2VKSjBYTWU5QXBrRGUzY3BPMGJPd1h1eTNIRHVrSEpIN28iLCJtYWMiOiJhNmNiMjUwZjIwM2MzZTczZjk1YzZmMjlkZTNiZDI4ODAyY2EzZDliM2FmYzk2MmQ1N2FkNWIyYTEzNWZiNTMwIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlNjOWlRU0VsTzNVbjdZVWhRMzNWUVE9PSIsInZhbHVlIjoiMnBEa2pvRnlONXQ4V0JYci9RSjJscHplcUUvQlpONytMNmZ0aTMwZm5LRytObzB1TkZtVTlJWTFyK3hpaGwvVWRxRFVvQlpJUmhZL0ZPQy90U1pXakVTU0dPVlc1SkpsQUwydno1ZDhZSDV2cVZ4dTZQUE9Vd0dPTlNSc3g2RU8iLCJtYWMiOiJmNjM4ZWNjNTZiMzc2NzA5ZDRiZDMyNWE4MTI2NGMzZTdlYTYwZDYzYjhkZDA5NzViYmI4MGE2OWUxYjFjZjc2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-09-13 14:07:48', '2025-09-13 14:07:48');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (40, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 11, NULL, NULL, 1, '2025-09-14 00:22:13', '2025-09-14 00:22:13');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (41, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B2%D1%83%D0%B3%D1%96%D0%BB%D0%BB%D1%8F', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImFQZjdjVGxVWS82UVd3REt0VzVmOFE9PSIsInZhbHVlIjoiVFl6T0d2VllqaGVlUndGdlF1YVlVZHcrZjJQclB0L283N09pbGVYS01YdHlSUnZEQVU2Vm45MGh5YnczRVJJU2lUaUR3emJLMjlnWVRSZWlwclhnOEpySGI4aExjMFI1NVA3RTVqSzN6c2lxQlhLaUsxK3VRV1pqQW5yMHMyQ3UiLCJtYWMiOiI2NjIzYTFiZDBkMDcwN2FmNmZjNDgzMWRlZmYxNTExNjUxOTk5Mjg1MDk0MjM5NDY1NTEzYTQ3YTc0NTA5OGViIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImkxQVQyR0JYTnp1ZHYyM3R0NnJyZVE9PSIsInZhbHVlIjoiVk5MREh3ZHdveFhISjJVSE16UEo4WEdtWExUb1NjQ01KWEF0VTJJa2JOUGd3dlZJZHN2a0xPbVZNZjVqRHZ3cUJTTnBsd1VqZUErVG84SW9LTjk4U0ZtM0xER1FNQmhIaU00WXNoV2s1UVZuOGJpSTRFbTBhVy9mVXNPL3BXanMiLCJtYWMiOiIwMjhjZTdlZTcwNTNmMmMyYWY2ODQ5ODNiNTdmYzI1MmNhMGNhMmI5N2RjMzMxMDZhOTMzODMwOGE5NTUxZjkzIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, 1, '2025-09-14 00:23:14', '2025-09-14 00:23:14');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (42, 'GET', '[]', 'https://true-cloud-bagisto.hh/gfegerg', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InZ3OXhyYjRTWTM0K1kwUklXREgwaWc9PSIsInZhbHVlIjoieGEwV3YwRTZZRFVHL0w3dy9qM2VlZEV5Q2lodDl1NWxROG5XRit5VUJ6QTFuWjg5K0lJQWJENWFMQ3FYbTAxamVNL3F1Vm0raFNEVGdwWllnd0hkWGRXem8xbk42WCtqSkN1N2xvMDhEazZFVHVzMndpeG5IajRKUFhOUHJvVUEiLCJtYWMiOiJiYzA1ZDgzYjEzNzJhZjM3NTIwNDlhZWFmNjM0MzkxODdmZjljYTEwNmRjMWQ1N2QyYTY0NDFkYjVhMTVlYmE4IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjBZaVNPN0cvNE1WRGdvR0JmSW9tUlE9PSIsInZhbHVlIjoiZ3dKRjdSS08wbnBIZVJxOU9XWnZzOVdlL2lJbUNDc2NaRTFQVFBmOGlMVU8vWklYdTNBYmNoTDdHVE1WV0tzT1UvRkNUaUFpc3puZUt4NWs2ZUN2Qk9kYzBWMFlGTUtJQkpiOW5yam02YS92anEvRmRqNUdoVnppbENBd3V6bnMiLCJtYWMiOiI5NWE1NzFmM2ZiNmNkOWQ0ZDBkN2QxZGU2ZmFlNDk3ZWM0YjFhZGVmYThmMTQ5N2NhOTBiZWJlMWQzMDAyODQwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 12, NULL, NULL, 1, '2025-09-14 00:23:15', '2025-09-14 00:23:15');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (43, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/admin/settings/channels', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/admin\\/settings\\/channels\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InNJRlpqVHNzNUZBWHJVUmNjWS91bEE9PSIsInZhbHVlIjoidGdwZldXNGE5WjRPUWV5VmRxUTJwZWRwZVdidkRKb3RpRmFadFNPcWRKeE5WSXlCUzRzOGVPazdUUDdqRHBMSzZCTUsxR2xWd080NGZYSWJBSTdMYzA1MmdXK1lzVGRGa1hFYWgzR3pyRGVObzdxdGJxNlR2OXZOK2lBcEFFbDEiLCJtYWMiOiI2OTM1MjEzNDg4NzZlYzgzMjE0MjIxNjQ5OTkxMGZhNDFiNzA1ZjRhZWY2YmM5NzJkZTBlZWRjMTg4MWFlOWY3IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjByQnNTUXMrRys3b2R4WS91OWhRWnc9PSIsInZhbHVlIjoiNnRkY3I2SDcxbm93L3JXdGVFMjlqVnpDY1VYMXcxM2VEYnpxN1h4RGNReVU0YzJaNjR6TkRjRGlGenBJMFk3eWc4endvSHY0YmRyd1hPVVV5NDBaUW9OSTRQWWV1UTliWHpTU2lXWUtlS1gyd0tqLzZ5SW9aa2xOeFBuY0RhMHAiLCJtYWMiOiJiZDEwZWMxMDFmYjIzMzliYjk5MGNmNjUzYTcxYTAwNDg5NDRjYjBiMTFjZTU3MmU1NTgzMTg5ZWFlYTIzYWUwIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-14 01:41:58', '2025-09-14 01:41:58');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (44, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%87%D0%B0%D1%88%D1%96', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImRFSW9Ib2hJb1p1N2srclhTdFgyeVE9PSIsInZhbHVlIjoic1dyVlJYQiswdStKYm12T2ZsMDNYdll4QklMbjVRRFo2Zi81ek12NUVKUHJSQ0hnTTB0QlVmb2w3MmMxcGRKWWE3WU1KRVFHcko5bGRucGRmdGJxS1d0eGg2RWppclliK1E0dmEyeG12bW9Qc3p5ZVFzLzBVRVMzaWhCV3ZzZVYiLCJtYWMiOiI3ZmQ2M2E4MjUwNzM0ZGZiZmUzYjg5YWYzOTI4ZGIyYjEwOTFjODM1NjgzYjI4NTg2ODIyN2JhODY0ODgyNTU3IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InJhZDNvRHUrY0lPUmFzTkxxVFBkZlE9PSIsInZhbHVlIjoiQkVaQzdRWEtXU2NYR1JTcVpiNmhkZDVlVkFhYWN5KzhGSGFyREZhSmZaZ3hyRklOK1BCTlZLQjZsNmJVdnByYmFkT01QbTQwVFB5UnJHSEl4UUVtcFUxaVZXOWkrRmE5VzR1cUJWUGJiTE9iRFZNZWN2OXBBT2p6emwrOXhzM3AiLCJtYWMiOiI4OTBhYjgxZWM4ODZjN2M2ZTdhMzA2YTNiYTIxNzQzZWE4Yzg2YjYwZjNkN2NiM2U1NWExYzhlMTczMmViN2U4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 8, NULL, NULL, 1, '2025-09-14 01:42:02', '2025-09-14 01:42:02');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (45, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-l', 'https://true-cloud-bagisto.hh/?locale=ru', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/?locale=ru\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjQwcTVtSXN3azJrS1gyQTNZdzJrK2c9PSIsInZhbHVlIjoiOUFheUxuanppZk5RUlV1K05SeUZ4QTFXNEhORkNCbE85L09oYWoxLzhwQ0RYa3h2UXpqRE9lR2lnVXZQK0dLcnZ2S3p5Q0srWnowM29XM2lFblEvK291NnRoR3pMQmZSMjJSSXlWN3FEVmFYSXFUS2l3RWxuSjNNK0gwSGR5RXoiLCJtYWMiOiIyNjM1Mjc0NDY5MzFhNWJmNmI0MTZiZjk0MjE0NThlODAyYzc2N2EzYWI3NTdlNTNjZWYxOWYxMTEyZTk3ZDUyIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InNJOHR1WnQvbk9SWHQ1ajE4WVU4MlE9PSIsInZhbHVlIjoiM3N6TnlFby9Ec1BQejIzVDAralg0RHA1eE1aVDRnVVgvVi9WRSs3amJSYlErOVo4dnZoVHBmQXNkTjF3WkRtZHg0YmozWGNCL0ZaK0FOdDhFS1F4VkIwbVNxZkhISmlOdVh6V0VpZHlSc1hCNjJjVngzQ3dQRVdYZnhmWDlCYzEiLCJtYWMiOiI3NWYwYjIxNzEzYjlmMGU3YzgzY2ZiZDliMzlkZjYyOGViMzExYzNhYzY1MGRiYTEwMDg3YWQ3ODAxMTJhYTQ5IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 9, NULL, NULL, 1, '2025-09-14 11:55:04', '2025-09-14 11:55:04');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (46, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B0%D0%BA%D1%81%D0%B5%D1%81%D1%83%D0%B0%D1%80%D0%B8', 'https://true-cloud-bagisto.hh/search?query=fff', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/search?query=fff\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IlMzM2RqSU5JbDhlVlJEbG92SmxVNmc9PSIsInZhbHVlIjoiRTVMOTA1RjFBMnZKdmpwbnJVWjErL0YzeGMvWi93RWRKb3RKMDJrQWh3Umd3cU53U2FnTmU0NFlLeVJKRjhwanZpejJYRWJYd1QrS0ZtbUYrY21zNWhrbzg5MGhNTllKNEZwOVloVlZnSy8yZEpuaXRUelE1N0RWdHM3UTJjZmYiLCJtYWMiOiI1NWJhODkwN2RhNDdhOGZkNGQ3ZmExNDU0OWQyN2Y5M2QxOGJkOGYyN2FkOWI4MTQxYmM2NTgzMTllNzQ5MWNmIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Ik9WSnoxcnhwRytuVnJXNktXVHBFN0E9PSIsInZhbHVlIjoiY3RZT0JQWjMzRDhwbVQxY0ozRTFQR29RT2dSWHQ1bXBPOW9SV1VzTEdhOENQVTY1MTE3SWJtTnRIYzBDMEZaaVpiZDl4SGUzOXBiR0xoY2xwUForb0tvWVZkcStpYVRBdUgvcmQvRURWSi9uamJBYjhDWUMwaEhnSDNLWWc1WVMiLCJtYWMiOiIwNmY5Mjg5M2EyYWU3YzljYTM4NmU1YzQyYTRiMDVjMDY5MzMzZTZiOTUyMTU4OWY1NmJiZGY3YTEyZTkwZDhlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 10, NULL, NULL, 1, '2025-09-14 16:48:06', '2025-09-14 16:48:06');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (47, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%88%D0%BB%D0%B0%D0%BD%D0%B3%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IlNCSHBzQ3hjUms4cll6d2Naei9vaFE9PSIsInZhbHVlIjoicFJSd3FwbVVQU01ncy8wTzlCd3BicndqajUzSmZzTFJqSlhSY29abG5uUGNPSkZXcWE2Y0dMdTN0Sno0OWpnZFJGZTF3eDBOTlBNcHdYMU5VTXY3d2ZmMlBWbytpYmJneGNFaVgzQmEwV2dGZk1KdEROSk1BQkxaaDlHaExvdVgiLCJtYWMiOiJiZTUzYjU3ODY1OWU4NDM0MWQ0MmFmZjgyNTViNWQ0Nzc0YzFkYmY4ZTI1NWRmN2JmNGQyZWU4ZTNmNTViM2RiIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjR3MHVkYng0aU1MalpCU3lXa2JSeGc9PSIsInZhbHVlIjoiOGR1MVdLWnAxbjdkRGoxblkwY1VLRG5HUWM1c25jMk5IQ3N2WGVWQ29TQ1kyM0xFdzUvR1c1UE9JK3NKdlRiY1d1VzRLUEtnZmNwemphVjdUbXJDRnc4RzZpSGxoR2FudFhmdkI4aEhHQlI0NWNmNkhSc2ZJQWczK1lvREgrd3ciLCJtYWMiOiIyZDgyOThhNTMxNTRhZjk4Y2ZlOWVjNDgzZTEwN2JiYzYzNzM5NjYxNGEzYzdiMWQ2M2YyMjBkMDJlM2VlYzdjIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 9, NULL, NULL, 1, '2025-09-14 16:48:22', '2025-09-14 16:48:22');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (48, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%82%D1%8E%D1%82%D1%8E%D0%BD', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Im53M3B5RmNMeVUrbVc3WXU4UE9WQkE9PSIsInZhbHVlIjoiYkN0MUR1QXY3b25LQ0t2VUZLTGJWcVFVQXNWSE5EcEgxY1ZzR1R0RmZWVTluSjN2MTNraDBkMjNmZ2lmK1ZUdFl5Nmw0R1NReGlJVmV2MUZLQzJ3OE53TWNsWVIwbFMyTDdKaXpma3Q2U3BwVnVwTkZKK1Q2eTdXaWdoMDVpa3YiLCJtYWMiOiIwNGMyMDkzM2VjNWExNzVlODNiMGJkNzFkNmE4M2IxOWU0NjVmNmRjMzRiYmRlNjlkYTlkZWY1YTUyNmRjNmY4IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Im5zSTVBZ0pWaytvRFNEWnZWcThVTHc9PSIsInZhbHVlIjoiTFA0THl6enVPenlpemRkbGxLYUNjcGF3Z0llT0ZYbmFRTExWYWZ1OWdyR2lkbUlJbEtFZXF1VzIwZzE2K2ZVYkhwQWtrSXVENER3UDhxNGUvaEJSSEZ3cFdKR3podTVaa2E4blg2a04zbm5iOXgyMURkbVdhQmd3c0xmQTFON0oiLCJtYWMiOiIzNDA5MWI1MzYzOGU3MTk2YzBhMzYwYjI5NDQ2MGI1OGJiZDlmZDFhMGU2Y2JmYjY2MTFlMDAwOWM4Njg2MTdiIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, 1, '2025-09-14 16:48:24', '2025-09-14 16:48:24');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (49, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BA%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D0%B8', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InhOQmVDKzl1RmtLMGpVVmFUOG85UVE9PSIsInZhbHVlIjoiT3pPU01ZUVQyS2I0dzhibmF1ZUdKblhnd2crRjdhZjlVbW9iM2RsWWYrVTgzN1psVEpWL1pJaDVJbFExTEh2YXB1Q2tmZ3pzVkxvY1g1aTduVkJ1TzRNQzJZbUl2cGJNRFRjbzkrNytpelZlZ01KRjgvS1A3b3FaRFNZaWkybnciLCJtYWMiOiI4NWFjYjcyOGNhYTQ3NzI2YTUyZjVmZTA0MWI3M2M5MGIyZTEwMGZhYzAwZDI3YzAyNWM4Yzk2MGMyZjNkZTIyIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImhybUE4ejVFY21RNFZFTkRhVkwxTlE9PSIsInZhbHVlIjoiVVloK3VqaGY0MlpEZ0NrNEVoZTFDNUdxZjRtSC84WWI3U1dPMnR2bFJNejlGbm5PckZoTHdRYmNBUzhQNGllbHJWSlVZaFJXMmo4WkFRMkliODJqN0dvOGZ3VzlKcTQ3bjhaVDg1NmphMWVnOUJEUTVIem0rM2hiZmVNUXJWSEkiLCJtYWMiOiI1MWMzMjQxMWU0YTk3NmNlNGRhNWVjMjUxNjMwY2JiZmYzZTNhMWYxMDc0ZjY2Y2EyOWYyMzg1NTRkYjIxYTUzIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 5, NULL, NULL, 1, '2025-09-14 16:48:25', '2025-09-14 16:48:25');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (50, 'GET', '[]', 'https://true-cloud-bagisto.hh', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImN6V3FKNDAzcGgxcjA1bG55aWtyUVE9PSIsInZhbHVlIjoiQVVpUVBZczlweHpGL2ZISm5uM0tObkdGZDVrQkUxOUJ4VEFsUXg0TlVWZUpieVNiUnlDZmUwTDJvem1RV1FBZzRiM2pBYmVTc2VFSGllUTZwRW5hbjIzYzBraEJySktBL0p2bXVYRHQ5Vmg0MFUrNXZtaXRsN1F5cDdQMGxkS1giLCJtYWMiOiI0ZGVlNjgxZWExNWE5MGFmYzU3ODE2MjRkMGU4MTIwMDkxMjNjOGVjMzRjYzExNjM4ZTM3MzlhNWRhMTBkMDk2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlpPRVJqYTNaQ0lGUUV1eGg4V0FhMmc9PSIsInZhbHVlIjoiVVhGYVJ1T2hlb2hPNzQ4K01ORE0vVGcvZ2pxVWJIQTkzOTVDSGFMK3EzSDZVUTdUYW1ZZU1KcjV3VnB2RlpoYjhTYUFWUDRiVlBOWWl2Y1FlTVlCOWxnVDdHT3U0b2E2Z1ViVUR1RXlyNjlXblRIV3BaS1d1TXNYajhLUGhqclciLCJtYWMiOiI3OWI0YWM2YTJmOTdlNDEyNTAxNjc2NmYxMmQ1M2ZkZGM5MzYwOTIxMmQ4OGQzNmQ3ZWQwMjFjMTZmM2ZiOGM4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-15 03:56:42', '2025-09-15 03:56:42');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (51, 'GET', '[]', 'https://true-cloud-bagisto.hh', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-16 23:25:11', '2025-09-16 23:25:11');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (52, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/customer/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ikd6Uy9CRndHdnVHS0hKMVVTaWx4dlE9PSIsInZhbHVlIjoiV0JNNGt5OUFYK0ova3gwbDBDTWcwY3p5Y1RSOVlFVFAzMEdjalV1bVdlSUdoOHdaYVpiM3JLZmU4S21hMjdZczA1Wk9mWkxvTGpUZ25qOUVHaE16MTdxTStQL3RvcEptOWc2ZmxrVHBZK08rNjNFVUY5N3dJaitrV0xWYkxSSEYiLCJtYWMiOiI2YWJmNTY4NzA5ZmNjOTZkMjAyMmRmNGViZDU5MDg1YjczZGM5ZjgxZTljNGQ0OWJkZmIxMTM2NzZmYWViNDhiIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InpqZzhOdHNHNlM2UUZBZ1dFc01wZlE9PSIsInZhbHVlIjoidTZ3OU8rVXU0Y3NYTXFucDBpeGZTM0NWZG82ZGl4aWFTbDJxWXp1K3VESk1FQkM2V3ROdnZRLzdKYWVNN0ZjcGtKNUlkTjM2RXpxTVhpbU9rM2tDbXpiSkFQOUxveEl0WGp3cTdOUWNOb0Fsb0NMWS9KclludVA5YzJMTzVMcHgiLCJtYWMiOiIwNzQyYjZlZGViNzcwMjBiZDNiNTA2ZDFmZWFmNzZmOTcyZGUwMmY0MGIyNGRmMjVkOWNjMWUxZTYyNmFkODJkIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:26:22', '2025-09-16 23:26:22');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (53, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BA%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D0%B8', 'https://true-cloud-bagisto.hh/customer/account/profile', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/account\\/profile\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IloxNSt5dHRWYXVOTEs3VXZhK250YUE9PSIsInZhbHVlIjoib0haYlc1UGEyREU1RGN6eTVXVm90V3g0R3JLUmNlZVdEWmF6Q2IwTVl4ZkZ6MWVPZjJNYVlkeHFqMU9JZ3YxZVJLcGZpSzR5bjlvQlZjZmRBMmdvUGt1NXRZRG5OQjdITVdsZFFqZWdYL0JzOWNvNGdseU9oamMyaHhhTFc1UVkiLCJtYWMiOiJlZWI0NjFlOTlhMGZmZWI0OWJhNDAzMDFmNTU4NGFmN2U4Njc2ZWNjOWVlMzJiYWI2NmFiY2YyNTRiMTEzZTNjIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InR4WWo5ZTJaTHlib1ZOeWNsbFpIQ1E9PSIsInZhbHVlIjoiUTJPaGRnZ2gwNWVXeGpuVUxHeWZPcDRPc1JmVmErNDhyZTRyWlZqdENCU0M0ZHBJVlNTVTRSNmZBaHBveUVCcVR1d0xRUGVvVEdRendxMVRURGl1d2hKUnAwNC9yNVlLZnI2WE9lLzczeVlLU0tJVExyNlhWTmFrNGt4enNTWXQiLCJtYWMiOiIwMTIyMjI5NWI1M2FmMzYwOTZkYzc0NGMyOWYxOTIyZDc4M2NlYjNmMmZmYTcxZjgyZDk1MjdkN2FkZjQ2ZGJlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 5, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:26:38', '2025-09-16 23:26:38');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (54, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-yellow-l', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImE0alNWd3JLVEJZMDlLWFJKMnpIMkE9PSIsInZhbHVlIjoiNFJXSGVKaXRLd3dqSmZjNHFnNWVXUVcyL25mT0cvOU95WTBMUVBJNTE5ZkhvOGNpSW1IUUZUMFRURW40SzNDaGFvdUx4VCtyZ0tWWFRoeXdzMmtUeHV4THFZTFNTSDJFNE41UFVkRTVweUdXanJzNXJkMUt4eHFkNDdEK1lYaVAiLCJtYWMiOiI0MjFmZGMyNjU0Y2NkYjNmYjA0NTQ3M2NmMzIxZjA3ZGFlZThlZGI4MTJmODQ5NWM1Y2MzOGIyODQ4YjE5ZmQxIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IlV3WGowK2pmSDcvMkM4aUZGaERsd3c9PSIsInZhbHVlIjoiYVdyZ0F0R0ZpUE93TkdNMjFsbllQK0FaaWpFalJkRVBOMVpBVE9raXZDMlVrZ2RlSHYyVGt3b0ZIUjd5L3hYMEtFNXVFVGhjRDVmWVcyd0RmZDA2R3RTTTB3VElsemI2MmkzNGIrOWM3b3pQWjN0R1ovSTQrRVBsV2FGbmE5SWQiLCJtYWMiOiJjMjZjZmRmZTZiZWZlYjk0Mzg1OTc4ZWZhMTdkMjZlZmJhZTkxN2Y5NmM2MTYzYWRkYTQ4ZjdmZmNjODFiZWU4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 9, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:26:41', '2025-09-16 23:26:41');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (55, 'GET', '[]', 'https://true-cloud-bagisto.hh/gfegerg', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjNZQUZWdHdBMGV1ZlpjdnFSSFFTdUE9PSIsInZhbHVlIjoieGdJUkFsZFpQY0lXZ0NRa2pmMUkyUVpya1pVOXFuVjYwS0hLQ2tNdjVOaXFieVFiTW1SNmpVd1hzc3Z0aFRnMEtKV0padGpkdUhYM0gyWktkT2ovMzhKSllyZENlamNBK3E3d1NSdVBLRm1sUE5QYnlHTFFjMVFWM0s3dXo5Um8iLCJtYWMiOiI5YzJmNTNiZGU5NzMyMmFkZGNkOWZhMjEyYWViNGIxMzU2NzMyNjEwNTVjYWJlYmY1MjZhODBmZjQ0ZmVlZTU2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IkNaMXRPZXZLZFAvWjRVaXkranBLS1E9PSIsInZhbHVlIjoiVEREbmVGNVl0U0pON2RzSE8wam05WG9sRC9tNlZRQWVKY2xwcGpTemhvZm5LWWhJVklkenA4VEwzaTNxWTlLdUk5RXNKWmJyc2dmZDd1QURSMVl2OEVCUDlQcUNqL1dLSS9CNFlpZTFyUlpxSUN5TUtxaVZGTmJUeGcxeDJvOEIiLCJtYWMiOiI0MGM4YmVlNGRiZGYyMjhjN2I5ZGQ3MTljOWZlNmQ0NzIyZGZhZDA2NWY4NTc0ZDUwMzhkNzE3MDA0ZjUwYmUxIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 12, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:26:42', '2025-09-16 23:26:42');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (56, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%82%D1%8E%D1%82%D1%8E%D0%BD', 'https://true-cloud-bagisto.hh/gfegerg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/gfegerg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkF0eTNQTG5KcDArNExuSWZMK0RpeFE9PSIsInZhbHVlIjoiVEFscFJ6M0tEYWNwbjd3dTh1bmJyVGJWNm8va0tEVFY4M01wWDQyNkxDTCtyVDROdzhTY0hmbDE1dlVkb1JJVE9kRUtiZnVJY0I1aUw4Z0J4ZjVqWE1RVFNyMDZOVjh3bU5kTS9CWE9EaFR1WDY0ME9sV0FRbE4rVGx1Yndjc1oiLCJtYWMiOiIxZjY0NThhZWNlZGVlMGFjZTkyZmFjZGNmODUxYTIzMTkzYjJkNWQwNzdmN2NmNzZhYWZlNGMyZTkwN2IzYzI2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IkNveUtzNWlueWlBYXMrbFUxUGRGRXc9PSIsInZhbHVlIjoiTXE5ZHExdWZMOXZFYkNoV1Q0WGJCVmZNQW5GVmp0eHp6cWF5ZnpTeVoxMUlDcERFc0pCUnJuc2pRM1J4WHE5bVhZQTBVMEZEZHR4N21SRmpuR3NoNVgyU2s5UnljR0c0clZYNnBLQ3VlU2crRVhzSEQwbFF1dmFjVlo5d3RzUUoiLCJtYWMiOiJhM2E5NTJkYWZhYzlhODAwY2JlOTVkMWRkM2MxY2RmNGRjMjBkM2Y5OGJlMjBhYzM3OTQyYjljYzhjZjAyYmRmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 6, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:26:59', '2025-09-16 23:26:59');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (57, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%B0%D0%BA%D1%81%D0%B5%D1%81%D1%83%D0%B0%D1%80%D0%B8', 'https://true-cloud-bagisto.hh/gfegerg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/gfegerg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6InlWZXRnRlVIbUJUeEpoL3VNK0NxNEE9PSIsInZhbHVlIjoiY3hrS2ZLQ1BLR0tIQ0FsdlU0T25ZV3VBNnpNK3lzZVF2a1RSbzFSUXI5TGhseDRGalZRdy9kRkFIbEZGTXE1cmVyS1ZIVStVbVBqc1lEdlZJTTdQOW1GblR1RmdxZG5GdFpEZWwwQUdaOU1wc1JjYjRteUJWWTFKRHl0TUYzbEQiLCJtYWMiOiIzYzYxMTljNmIyZmI2N2JiMmE2YzFjMWMwZmU5ODk4ZTYwNWQ3ZWUzMjc5Yjc2NmZlZDI0MGMzYmNjZjEwNjY3IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InkwQ0dydTZMYUhmN21lTDdvK1JPNUE9PSIsInZhbHVlIjoiNWZwNFVXcHlpUGNnTnVpdTRvQ3NydmUvMWpZdzZRaDJaYXdpazFRUWRSdUs5NlplM2J6aHJ4OXR0MVhvSnIrcU1teEhNcVRLV212QXE2Y3UvTUI4ODF2VHBRazJ2T2NncHRFUFpBVnJHazlzNWFpWFB2c1dXN2NXSWo3OFgzUEUiLCJtYWMiOiIwYThjNWQwMTUyYmQyNTRkMWQ4NTlhN2FiNGRlMjQ3YmFiZTE0NGE1MTA1NDJlM2JhY2JiMGFjOTdjNjA2MmE4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 10, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:32:32', '2025-09-16 23:32:32');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (58, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D1%88%D0%BB%D0%B0%D0%BD%D0%B3%D0%B8', 'https://true-cloud-bagisto.hh/gfegerg', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/gfegerg\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IlZ3ay9qeUhCSEs4WVhndXhZWm1NVnc9PSIsInZhbHVlIjoiTzdjRE4zRzcwN2t3WHljSTJVTkJkWGdFRE9nQnJ5eGh6RjZON3VCbkwwSm1uMnk0RWF4QVE0ekEvU3JtbnhyNjFpS0ZlcGNLSUk1aWFwenh3TFJyd0M4WTdweXBDWUdFanVSc2VhOUxST21WUzF1alFrZ09DOUdoZ3UyVnJVK2siLCJtYWMiOiIzNTBhYjMzODA0ODMzNjU2MzYzMTUyNDY4YjkxNjJlY2ExOTM3NjUzZGQ4NTc1ZTM3NGJmM2RlNTM5MmQzNWVkIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjZXbjBaV3U1N1ZEaHUzdWRwVjVtNUE9PSIsInZhbHVlIjoiVVc3VXVycllWS1N6WjlIalVjUFB4aTRHek5PeEEyaWlqa0ExcDE3TXpSencvUFMrTjZqMXg0ZG8xK3RjTGQ1Sm5HbERYKzNIUC9mSUQwL0JFaDlKd2srKytmcHB5SHNsb1AzTXNkcnJ4MzNKSlV2cVRCaEJFY0ZuNzVZR2VnRmgiLCJtYWMiOiI5ZDA1YmM0OGE0ZjY4ZjEzMjgxNDY5ZWM2NGE4MmJhY2QxZDI3YWY0MjM1ZWM1ZTQ1MWU1NmRjMDFkNTBiMzUyIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 9, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:32:34', '2025-09-16 23:32:34');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (59, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', 'https://true-cloud-bagisto.hh/checkout/cart', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImY4UVIxbU0wS09haWJCQTRLMUFUSWc9PSIsInZhbHVlIjoidldtUk1haWtjMElLdXVXcmtvZG9JbWtCejJUeUQ1RHk3MUc5R29XOWpZcE5ETTRka1h0R2d5MUVKclNkZU5IZjVoS21xK1VwT3lHT0ZrSzFzbmRmL2NVaEpEeG9KOVZiQnBjR2x2RS9NVzVncG5CaU5mNVpqL2VuaXMrTldsN3ciLCJtYWMiOiJkYWEyMDE2YzE2NTc2ODUyOTdkMThmNTE3OTVkZGY3NTMzZjBmNGI2ODExNDIxNzI5YTU3OTdjYmYwYjAyZWZmIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InBVdE9qeTVSTlFXTEhseEFEenVKdGc9PSIsInZhbHVlIjoibW84NHBmUkdYeVplSTlmbHlyZ0ZWZlZXVGtZNExubCtwaFNlYVNNRlEzYllMcHVaK2ZiNUkxNS8yeGlvQ0VYYmNscFJWdFQvNHYraW1RRG9xcyt6Ry9nVnRYUjY5WTBWL1lTMFNFbitFVWlvZWNHS0NrMi9iRXhGVUszeHQ4RkEiLCJtYWMiOiJjODBkYTYwYzU5OTAwYjJkMjU4MmEzNTljYjRmYmI2MjljM2U3NzQxOGQ5NWVlZGQxZTI2NWQ0YzVkMDZmN2U4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 11, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-16 23:35:56', '2025-09-16 23:35:56');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (60, 'GET', '[]', 'https://true-cloud-bagisto.hh', NULL, '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-18 21:19:58', '2025-09-18 21:19:58');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (61, 'GET', '[]', 'https://true-cloud-bagisto.hh/gfegerg', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjN1VHgrb09wTG4wanlZN2Nqb3JUbWc9PSIsInZhbHVlIjoiWkwyYnhBd1IxUVQwd1RETkFhM1J3UWRUWXNQUUdZR3pubWtqc2RHMU1zcXg5S25OcVdmRklqcStxUGhaS2ZIVlRRQ25Kd2xlZnpIbnZFQlVIOTJxeFk2bERlRnlpS1dUNHN4OEZVaEl3blVUWjJyOHZPQTlUYldGa0JCcHU4eEwiLCJtYWMiOiIwYWJhMjgwNGRjMmI2ODUzMTQ2ZWI0OTFiODgzMGFhZjNhMzdjYzQ1ZTU3ZTU2YzM4YWEwY2ZkNmViMTU5ZTRmIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjkvbXBUMDdaeW03OWZVcVV0enk3TEE9PSIsInZhbHVlIjoib2gzMGJsRm9yWWF0U1lsdlVwelM3QnhqcW02eklpT1hVMmlaQ3BMc3llWUlFSU9ZWW5WMGFDK3pwckgvbFI1ajhMMFdxYmtFQ281a0VPTk1hZzErRGxVNlVCT2U2YzhYMFh0UWpaRTBUZmdxejBmNGJrNk43eHhDV3ZybFREOXIiLCJtYWMiOiJkZDEzZWIzYTcwMmE2YjQwMDZjNzY5MGJkMjMzMzM5YTU3NWY0ZjBmMGE2YWJkOWYzODJjODhkYTM4MGQ3OTc2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 12, NULL, NULL, 1, '2025-09-18 21:20:03', '2025-09-18 21:20:03');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (62, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImtXdmZxdTRvVzJGSGpGalVyNWd1MkE9PSIsInZhbHVlIjoieEdKZWZDT21lWG5NZWF2UmVUMFJEVUpqSmIzVzc0Tkc1NFNORWF6WVVMRXlwRks0cll4cmJKakwxOW9KWEFuaS8yTmpqc252enhIVkFubU1tbkY2dHZ1L0l4WWNjR2tiMFBDKy94bVlwVnM1T3RNbGFNQ1EyY2NFcVpLaUZYV1MiLCJtYWMiOiI1ZGI1MTM5YmY5ZDU0OTY0YzE2NGFmMjNlMmJkNzA1NzE2YzhkNmNlN2M0MDgyNDc5NDcxYzNiMDU5NTQ2Zjc2IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjZadjcxTEJnczJEV3NxVUhQZDZFY2c9PSIsInZhbHVlIjoiU3FINExhaHlOUWFyd1pmbml0djd0b1BiT3dWcUFPSEhBZCtxK0JWenVVNUdicHFhY1E0dU8zQXVjeG5DSjZaRWdPNDVmNFZEaHVyTkVMQ0RpeHpNQVAvT0sxRWg1VEhhSVJsakdyYStKNTVkMGd3dkFua3U2LzBqdXB0SkExdzkiLCJtYWMiOiI2ZTEzNjQ3MmQ0MzIxNzk3ZTMxMmYxY2YzMjI0NzdlOTExNGE0MDgxOGE2MTdiODcxYjliNDRiNTllMDlkZmY4IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 11, NULL, NULL, 1, '2025-09-18 21:20:03', '2025-09-18 21:20:03');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (63, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/customer/login', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IkphZit1Y1k4SlB1MjNJR01Bdm5Sc1E9PSIsInZhbHVlIjoiVVJxMEgwMi9PR1h4MGdXdWthQVdkMlRMVWtBcTVkTXJ6NXk5RXlSTDd5MnkxT1Jod0ViSXdURmZIZjhXazFLaGUxTVlJMFUydlNlUWJackhGSkpKUkNPKzRzUDJIY0JuT1VOblZFL1dxUk85T0NwNzVpRklEQ1VwRCt1WjRjcTIiLCJtYWMiOiI1NjA1ZTZmYmI0MDM5MDM2NWY2MmUxNDczMWRkOTkzMjY0NzJhODY3YzZhMjlmMDVmNGY0OTZkZGRkYzVmOGZiIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImE2bXJ6WVlPZERqaFRBcThoOGZyK0E9PSIsInZhbHVlIjoieStYUStXdk8wT3BpYTBYOXBKZUJadW9pOG5RSkwweEJQcXRmdktOdVBBNi90OUJVdzlWSldLTit0VnJvWXVGcHF6d2JsYWZ0ZTdrU0RRRjc2K2g0UTJ1azZjZVM2enJ0QVV4ekkrblo5SG50QUNXNTM5SWdCMEFXU3BRR2pMNzIiLCJtYWMiOiIzYWI5ZWE0ZDFjZGU3YTg0ZjM1OWY4MzRiY2FiMjg0MTQ5MDhhZTcxMjFmZDMzZTllMTM5MWQ0MDJkMjQ0NWJlIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-18 21:20:24', '2025-09-18 21:20:24');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (64, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BA%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D0%B8', 'https://true-cloud-bagisto.hh/customer/account/addresses/create', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/account\\/addresses\\/create\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjJrNDJyUEo2bHZxS2oyZmVsbWE1VWc9PSIsInZhbHVlIjoia2s3T1BpVkhOcWxwUWN5Sms2UzBnUHRPNlQwTElMZEs4ZDFlbndERnM2WDhOclB2ekRiWmg0bkQ2TEtaSHRmOTN4Q2JPVUIwTGFHVkR3M2JLOGgvMG1wVkIzOVgrbVVic2tXMWNnRGxPdHVSaGVEUWI0R0ZFc3JOYlZ5d21wcGYiLCJtYWMiOiI1M2E0YTgyYjc0YzVkZGFjY2RlNDc0MmExYmZjYjQwMzFmMzc0ZDExMTdlYTM4ZGZhMTkxYzhlNzQ2OGRjYWIyIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IjVIZlZkSEUyZXBMTFpsS0JWVElmdmc9PSIsInZhbHVlIjoiRGJldE5yM044dFEyYWdoRkEvQzdQSVF0SzFDaGF0Sjg5V2JYdHJtQnJ2RTI4cm1WQkRiQjVMdmJUeHpjTTJvRVhFNElWNmpJZitNM0pmYnNOWVhoM3BZSnpHTERpQTIzS05EZ3huZk5vNm1aUFExWEFEY29PQ1cxV2syZGhVNmEiLCJtYWMiOiI2M2Y5NDMzODc4Yjc0MzczYmMyOTNkZDkwOTdkZGY1ZWM1ODk1OTUwMDZiYmQzMDdhNWVkNTAzNWM4OTU3NmRmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 5, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-18 23:55:20', '2025-09-18 23:55:20');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (65, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/customer/account/addresses/create', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/account\\/addresses\\/create\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6ImJoWmVBOFI2aEdkVHU0Z1VIYkpJNGc9PSIsInZhbHVlIjoiMGcvb0drbDFJSy9TNWJERlVZYlF1UDRlRVIrelFtd2pZSHIzU1BETEZDUCs5ZDg3NWdTVExSZHd2UUVLcHBRSy9yWW9TRVllT2s4ZmY4eHJzdHUvTUQyelhTS1ZLM2dkU09Od0RpR2U5M2pyY0FrdkdLc3dzZUZOVCtPS1BBWi8iLCJtYWMiOiJkYzk3M2YxZGZmYzMxNWZhZTc2OTc0NjhiNjY3MTAyYTU2NDBhMGFhZjk3MGIzZTg1ZGU5NDdjMTM1MDEzYmNmIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6ImVrLzR3WmFuMkJ4aFVoN3MzcXYrY2c9PSIsInZhbHVlIjoidnFjcndERGFrTzJiRlZneTltZWpYc2dyaXY3OTBkd3BzS0kzNUhzQVVQa05idjNpaGpHdFpTZkdaQnJENm9wOHVVMDZIempCemdMUkpVYWtXNjg4bnNoVkRsTXcwZjZtQ2pTS1RQR3N6QytpNmRBUVhxY09rdzkzN29EVnAyajkiLCJtYWMiOiI5ZGI4Y2RkYzE5MjY0MTRjYzQ2M2VkMzA1YWEyYjM3NjBjMTM0MjA5ZmE3NWIxNGM0MjY4NjU3MWIzYmM2NTE2IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-19 00:02:10', '2025-09-19 00:02:10');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (66, 'GET', '[]', 'https://true-cloud-bagisto.hh/%D0%BA%D0%B0%D0%BB%D1%8C%D1%8F%D0%BD%D0%B8', 'https://true-cloud-bagisto.hh/customer/account/addresses/create', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/customer\\/account\\/addresses\\/create\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjRWdStHMmU2WW9QSGllcVlkanFyUmc9PSIsInZhbHVlIjoicnRVVldYSE5ISXZYd2VBTjFOME5zK3R0RjlHM2dydWNVZk16aDhFYjZDYlVNRkk3YUZBZlExODRUZDlNOThjLzNmNXBLZjBBQ2ZFRzJ4ZG1IQ2xEM1RZUmZ0eXdZY1N6UUZYemp6MUZxL013dUJ0ZVI3c3BKY2U2bjQrSWhsODgiLCJtYWMiOiI0MDVhMWZiNjM4YWFkYWFiYmRlZmM1ZWE0NjkzZWFlNmUxNDg5MDQ0MjA0ZjE0MGE0ZjdkZTQ2ZWJhNDMyZWJiIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InBVbEpGVmtjMjFCZVNuQURIL3NHbVE9PSIsInZhbHVlIjoiWHBTSk95aFl4RGlRa1BlZStuMDlkRHgwTkVFcFBEV2k3ZWh5Qk9EVVFMbXppVWtnaDNtRlJ2aW5zZCttdk9RSVNaZkN6dHVjUEo5YVl1MkJRY2ZmRnl3dVlPZ2d6RFZKSS8waW1paXlhSUZ1a3VNS3FFcmtsSmxQV1hEQlpJdVciLCJtYWMiOiI5MTU1ODUwMTM4YmM4NGMzMDcyYzZkOGZhMDE0YTc4YzM2Nzg4MmRkMDQxZDZkOWEyNDFlMjJjYzlkNDZhYTQ1IiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Category\\Models\\Category', 5, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-19 01:40:01', '2025-09-19 01:40:01');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (67, 'GET', '[]', 'https://true-cloud-bagisto.hh/omniheat-mens-solid-hooded-puffer-jacket-blue-green-l', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6IjJEb1NoTlhuWm1TWmNVd09NR1YyR3c9PSIsInZhbHVlIjoiVjdWaWFkRjZENFNyeStvSVJMSmEwbm5lV2oxaUNZU2xBcjREMTlER0VnMXcxd1dZY2piUHpJZ01CK2QyVXpBYjRrMGtPQkd3YkZpQU15dkZyQmtyMFNhR2Q4SE9Nb09iY3ZGUDlhaGJyaXAyOFAyaTVqdGdTYWhGWnA3TmRDNVciLCJtYWMiOiIwODc2YzcxNmQ1NGI4NDE0ZWQzYzI2M2QyNTkyZmEwMjVkMjBlZDg3M2QyNDgzYTA5N2EwYmMyNmE0OTVhZGVjIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6Ijh0NUgyTVdKbmRUU0VmNVlURjVxYWc9PSIsInZhbHVlIjoiZGJoQUpSdi8vZDk1Q1Z5ZUg2QWtzVURTZ2VPUWJSYXI5ZXhKc3ZIaFcybkRSUldJa1R5d2Vyc2N6VklITFkzbkY4dDE5TlFOT2w4UytJV3dQYWdOMXNEZXpwcjRHQmNyQ2VmbE9DM1l5R3BaQ0xIWjkyRGl5ZS9NRGNOcFBZTjQiLCJtYWMiOiJiMGY3NTk4MDZkMDFjODc3NGQyMWUwYjE3NzgzMGE5M2NhN2Q3ZjE4OWQ2YTU5ZWI3NjkwOWYwZjAzMTVhNjNmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 11, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-19 01:52:23', '2025-09-19 01:52:23');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (68, 'GET', '[]', 'https://true-cloud-bagisto.hh/gfegerg', 'https://true-cloud-bagisto.hh/', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en,ru-RU;q=0.9,ru;q=0.8,en-US;q=0.7\"],\"cookie\":[\"dark_mode=0; XSRF-TOKEN=eyJpdiI6Ii9HNERlK1p4N2ZjRlJyeXBrUUpGUEE9PSIsInZhbHVlIjoidWlEdkJRc2J4bmtLREZ5MVhmdWhsTS9yb09ETEk4Rk5SNkd5TnhOaEF4STNmRGZabnJrSnFJWEpvQm9XU0lPTmZPclNtOEZLcG5xMjhsSGlnc0dLS0p6TFVtREhmaHN0V2RnYmF1SHpjQTNUVGpjQUVLMjR1UkJGTDRkQStFbjYiLCJtYWMiOiJkNjhiODk3OTM0MWRiMTk3YWFkOGNkYmQ3ODgyZDQyNzhkYTYwMzQxYjZhNzUxOGJiNzgyZjk3NzY0ZjEwNzM0IiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6IkxFQzZkR3M3WWUwcFVUSno1cGVqNGc9PSIsInZhbHVlIjoiUVd3TGJEZTZIUTlaajRhSzZQdE83LzNsN2haT0hsdm9odGQ5RGRlTngzaHlFRkZvbGJSeC8weWJ1Vm4xZUs5ckdSUUJxZkpCOVgxY1YvYWgrejZtSW1xdXZLSnMySGRlSXN5VEZTck9LMWV4eEpsOHI0MkJkZnM3M0E3Snh1OUUiLCJtYWMiOiIxOGEzM2QyMjcwOGU1ZjRkNzEzOGUxNzVjNDg2OWQ2NjJmZDVkMTRjNzEzMmQ4ZTM2MDQ1NTkxZDFlNGIyNzRmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', 'Webkul\\Product\\Models\\Product', 12, 'Webkul\\Customer\\Models\\Customer', 2, 1, '2025-09-19 01:52:25', '2025-09-19 01:52:25');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES (69, 'GET', '[]', 'https://true-cloud-bagisto.hh', 'https://true-cloud-bagisto.hh/checkout/cart', '[]', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36', '{\"host\":[\"true-cloud-bagisto.hh\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Chromium\\\";v=\\\"140\\\", \\\"Not=A?Brand\\\";v=\\\"24\\\", \\\"Google Chrome\\\";v=\\\"140\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"macOS\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/140.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"https:\\/\\/true-cloud-bagisto.hh\\/checkout\\/cart\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Im9OU0FNN24vR2J4WWxSbnh3Qk9YUUE9PSIsInZhbHVlIjoiVVlFOXY5UjlqSU8vWWUzZEhUdk1mUWVOdFlYaVZFNmh4ajl3bDQ1NjU3RFpEN2p1RmVSdEcvTWtLM29mZ3hHVGQxTzBQenY2bGVuam9pa3VNeUtzeGdJdjdlY0NySE83azBZRy85QlFubVU2eXlwR1ZEWUcvYWtSY2gvOGRjZG0iLCJtYWMiOiJkZjE3NGNmNzhkOTA2MGFkNDc3NzkzYmEzMzc5ODI1ZDRlNzE1NzgxNTgxNDAzMTRlMDU2ZjQ4NTdkNGYwZGJmIiwidGFnIjoiIn0%3D; truecloud_session=eyJpdiI6InBNZlpzSlZ6UGFtc0JUU1lTN0J4cEE9PSIsInZhbHVlIjoiMnNHMmFPbEZPakloUk1DSFFoNUNqeXBUZkl4VHpOMGRPWVlia0l2eGJtNGhyVFBYQnR4bE5KNlNKZEFnSm9mb0QxUVZWYWtOL1JXK216NjN5YkNCdDBRUG5lbU5RcmpBVFVyWGllSlVDcHovd1RQeXdZVmJ5QTZnQjFVakhYeXAiLCJtYWMiOiIzOGJhNmM0N2RmN2M3ODUxNTJjNDk2ZDhhMDk0MzI4OTJlMzQ4NzI3MTZjYjBhOWIxYTg5NWJkZDI5MDgyMzBmIiwidGFnIjoiIn0%3D\"]}', 'Macintosh', 'OS X', 'Chrome', '::1', NULL, NULL, NULL, NULL, 1, '2025-09-19 01:56:07', '2025-09-19 01:56:07');
COMMIT;

-- ----------------------------
-- Table structure for wishlist
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `item_options` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_channel_id_foreign` (`channel_id`),
  KEY `wishlist_product_id_foreign` (`product_id`),
  KEY `wishlist_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for wishlist_items
-- ----------------------------
DROP TABLE IF EXISTS `wishlist_items`;
CREATE TABLE `wishlist_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `additional` json DEFAULT NULL,
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  KEY `wishlist_items_product_id_foreign` (`product_id`),
  KEY `wishlist_items_customer_id_foreign` (`customer_id`),
  CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wishlist_items
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
