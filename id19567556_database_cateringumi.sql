-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table food-market-backend.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
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

-- Dumping data for table food-market-backend.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.food
CREATE TABLE IF NOT EXISTS `food` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `ingredients` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `rate` double DEFAULT NULL,
  `types` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picturePath` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.food: ~3 rows (approximately)
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
REPLACE INTO `food` (`id`, `name`, `description`, `ingredients`, `price`, `rate`, `types`, `picturePath`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(18, 'Mie ayam', 'Mie ayam nomor 1', 'Bahan-bahan alami', 30000, 5, 'popular', 'assets/food/QhzoLUTOiuFdtipmEOPza8OW0JdtHe5KCtMaBhi5.png', NULL, '2022-08-30 17:17:01', '2022-09-05 13:11:52'),
	(19, 'Nasi Kuning', 'beras terbaik', 'Bahan-bahan alami', 34000, 3.5, 'new_food', 'assets/food/IGoIyV6daCdXJIeRO1C0KsuEZmYZXAeR562Sspb1.png', NULL, '2022-09-01 13:08:20', '2022-09-01 13:34:44'),
	(20, 'Nasi goreng', 'beras terbaik', 'Bahan-bahan alami', 40000, 4, 'recommended', 'assets/food/IH0sOvmHDYm2xHVrXs6hScYeEC7w31F2z4QPMzXC.png', NULL, '2022-09-01 13:08:54', '2022-09-01 13:08:54');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.migrations: ~11 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
REPLACE INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2020_05_21_100000_create_teams_table', 1),
	(7, '2020_05_21_200000_create_team_user_table', 1),
	(8, '2020_05_21_300000_create_team_invitations_table', 1),
	(9, '2022_04_02_233215_create_sessions_table', 1),
	(10, '2022_04_03_090416_create_food_table', 1),
	(11, '2022_04_03_092039_create_transactions_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.personal_access_tokens: ~20 rows (approximately)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
REPLACE INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
	(1, 'App\\Models\\User', 2, 'authToken', '489f3685cabc4a495cdd4955a4a5861ca8ba71fd0210fbcfba9ac01d81c6a7ac', '["*"]', '2022-08-30 15:24:02', '2022-08-30 15:24:02', '2022-08-30 15:24:02'),
	(2, 'App\\Models\\User', 3, 'authToken', '057675e4f89a743182fb0c7f702d6abb00631f72b6e811b6c8fa943656ead9a5', '["*"]', NULL, '2022-08-30 15:52:07', '2022-08-30 15:52:07'),
	(3, 'App\\Models\\User', 2, 'authToken', '81193a00047c9c5f77e5a94dbe60993124e75927830d433843d3900a5d7da763', '["*"]', NULL, '2022-08-30 16:04:31', '2022-08-30 16:04:31'),
	(4, 'App\\Models\\User', 2, 'authToken', 'ccaafad80f783cc416460f6bdd4148a2089e5eb749b57f3ce3299b441433bfe1', '["*"]', NULL, '2022-09-01 12:53:56', '2022-09-01 12:53:56'),
	(5, 'App\\Models\\User', 4, 'authToken', 'e72b0642110a5c6ed423e7f74e2f009d0d76f133cdfa8c02ffd07812c55ec799', '["*"]', '2022-09-05 14:16:00', '2022-09-05 14:15:59', '2022-09-05 14:16:00'),
	(6, 'App\\Models\\User', 5, 'authToken', '2992a64732ed6bf7934b17f7971326d02a1024bbb673ba580c8a7e68bb8719a4', '["*"]', NULL, '2022-09-05 14:55:04', '2022-09-05 14:55:04'),
	(7, 'App\\Models\\User', 6, 'authToken', '697a3a184cacabf186cfda403b454187d6e3d22c7dc3335d987a0b8768f4b15f', '["*"]', NULL, '2022-09-05 15:01:15', '2022-09-05 15:01:15'),
	(8, 'App\\Models\\User', 7, 'authToken', '8ff7f8170c0d0bb4277676ad62ea47077021afd1b563fc9525aead14ec1e33a1', '["*"]', NULL, '2022-09-05 15:23:33', '2022-09-05 15:23:33'),
	(9, 'App\\Models\\User', 2, 'authToken', '4c053b87cb79d2780fb3282dd6f938da1b4ace85d7817142b867fa053a3ec432', '["*"]', NULL, '2022-09-05 16:07:21', '2022-09-05 16:07:21'),
	(10, 'App\\Models\\User', 2, 'authToken', '3de9cd3fc26c51d405f8922260894bd08067b0491ca09abdb1cdca05b428ed8b', '["*"]', NULL, '2022-09-06 17:06:22', '2022-09-06 17:06:22'),
	(11, 'App\\Models\\User', 8, 'authToken', '40c08783f176aae20d2886a24db2ea8ef76b5c8e6803798b2c23321c5123fa17', '["*"]', NULL, '2022-09-06 17:07:24', '2022-09-06 17:07:24'),
	(12, 'App\\Models\\User', 8, 'authToken', '84c6875395e2f22e0f20cd70ef19c8d08edb220947522bae8762efc611fc99fc', '["*"]', NULL, '2022-09-06 17:24:39', '2022-09-06 17:24:39'),
	(13, 'App\\Models\\User', 9, 'authToken', 'e6fca2fdb5f24aba8c2f5e0202fbdb12082933fd0a206f5570469eafe434ba08', '["*"]', NULL, '2022-09-06 17:29:03', '2022-09-06 17:29:03'),
	(14, 'App\\Models\\User', 7, 'authToken', '5f9cce66470588bcd249a916fef42e32abf65424fdcaf1241b1a9154c4e0cc65', '["*"]', NULL, '2022-09-06 18:15:00', '2022-09-06 18:15:00'),
	(15, 'App\\Models\\User', 7, 'authToken', '552390a8042057846b840350aa200ea2d21c7bd913efdb565524ffa2798e34d5', '["*"]', NULL, '2022-09-06 18:17:15', '2022-09-06 18:17:15'),
	(16, 'App\\Models\\User', 3, 'authToken', '05e5da40922f8060cbbf31d92359adc693622af1e2eb6020f8c31fdaa650ec8f', '["*"]', NULL, '2022-09-06 18:20:31', '2022-09-06 18:20:31'),
	(17, 'App\\Models\\User', 3, 'authToken', '9a4c86bca5a89fe57de2bad47ae762a0a8fa80f4767d6dde3361482742406da2', '["*"]', NULL, '2022-09-06 18:33:38', '2022-09-06 18:33:38'),
	(18, 'App\\Models\\User', 5, 'authToken', 'bbfb2536ef84771a97e28ddfbeeef4ffa903f019a8639977b3d3d0c8a0e7ed6e', '["*"]', NULL, '2022-09-07 16:32:40', '2022-09-07 16:32:40'),
	(19, 'App\\Models\\User', 2, 'authToken', '5d7b0ff278c59a8af93fdb678cee5bd982755174d40abb8aaedb516a1fc9bc2f', '["*"]', '2022-09-07 18:28:43', '2022-09-07 16:53:00', '2022-09-07 18:28:43'),
	(20, 'App\\Models\\User', 2, 'authToken', '7e9160f6348ec50f5abd85b21eb0dd1c69c90152cc5094799bd6c9e35e5f7c8e', '["*"]', '2022-09-07 17:22:03', '2022-09-07 17:04:02', '2022-09-07 17:22:03'),
	(21, 'App\\Models\\User', 2, 'authToken', 'a5ec6c94ef7db520bf9965cfa92c3cec94019071e85bd8deca9b6542adc1c48d', '["*"]', '2022-09-08 15:53:00', '2022-09-08 13:09:46', '2022-09-08 15:53:00');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.sessions: ~4 rows (approximately)
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
REPLACE INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('ApMD1pVn53i8SZFifE8dydn3X22S0Hdqjk8BiBcT', 1, '192.168.0.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36 Edg/104.0.1293.70', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTFBQUmFuOXVmckpTd28xRXFBSk9YZTRpamFIanhEV3hCcGFDVDU0MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xOTIuMTY4LjAuMTQwOjgwMDAvZGFzaGJvYXJkL2Zvb2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1661879822),
	('oTNF4sRPTmEDvdGuCuIxcuMAP9rD2JB4WucKQLn3', NULL, '192.168.0.140', 'PostmanRuntime/7.29.2', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidTR0MTRRMk5CMlRkdFpuM3hMY1BTYkdrV2p4eTB1bEJpV3BPclBpQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHA6Ly8xOTIuMTY4LjAuMTQwOjgwMDAvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1662571304),
	('qnUrSUiPXUFoQi5vO9PM5tU5kCc4aGN6d2vIajhy', 1, '192.168.0.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36 Edg/104.0.1293.70', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWmxsWERMYkxjN25pT1BLcVFUU0NQb0ZXaFVVdzROeldFRWI0RUF5SyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xOTIuMTY4LjAuMTQwOjgwMDAvZGFzaGJvYXJkL2Zvb2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1662039286),
	('XiyZAouiTsEv3xBeUiojfTyNN8cPNh2izfjtqMYp', 1, '192.168.0.140', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.0.0 Safari/537.36 Edg/105.0.1343.27', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid3FDNUdFWTVOYkd3amw3dUlzUHRwUkhteHFzZE1IYkdkU1VJMXV2RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHA6Ly8xOTIuMTY4LjAuMTQwOjgwMDAvZGFzaGJvYXJkL2Zvb2QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1662383516);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.teams
CREATE TABLE IF NOT EXISTS `teams` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_team` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teams_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.teams: ~0 rows (approximately)
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
REPLACE INTO `teams` (`id`, `user_id`, `name`, `personal_team`, `created_at`, `updated_at`) VALUES
	(1, 1, 'adam\'s Team', 1, '2022-08-27 16:24:34', '2022-08-27 16:24:34');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.team_invitations
CREATE TABLE IF NOT EXISTS `team_invitations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_invitations_team_id_email_unique` (`team_id`,`email`),
  CONSTRAINT `team_invitations_team_id_foreign` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.team_invitations: ~0 rows (approximately)
/*!40000 ALTER TABLE `team_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_invitations` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.team_user
CREATE TABLE IF NOT EXISTS `team_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `team_user_team_id_user_id_unique` (`team_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.team_user: ~0 rows (approximately)
/*!40000 ALTER TABLE `team_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_user` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.transactions
CREATE TABLE IF NOT EXISTS `transactions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.transactions: ~27 rows (approximately)
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
REPLACE INTO `transactions` (`id`, `user_id`, `food_id`, `quantity`, `total`, `status`, `payment_url`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(1, 2, 13, 1, 1, 'PENDING', '', NULL, '2022-09-07 17:04:54', '2022-09-07 17:04:54'),
	(2, 2, 13, 1, 1, 'PENDING', '', NULL, '2022-09-07 17:05:29', '2022-09-07 17:05:29'),
	(3, 2, 13, 1, 1, 'CANCELLED', '', NULL, '2022-09-07 17:06:18', '2022-09-07 17:06:18'),
	(4, 2, 13, 1, 1, 'CANCELLED', '', NULL, '2022-09-07 17:07:37', '2022-09-07 17:07:37'),
	(5, 2, 18, 1, 1, 'CANCELLED', '', NULL, '2022-09-07 17:11:35', '2022-09-07 17:11:35'),
	(6, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-07 17:22:03', '2022-09-07 17:22:03'),
	(7, 2, 19, 1, 1, 'PENDING', '', NULL, '2022-09-07 18:24:36', '2022-09-07 18:24:36'),
	(8, 2, 19, 1, 1, 'PENDING', '', NULL, '2022-09-07 18:24:42', '2022-09-07 18:24:42'),
	(9, 2, 19, 1, 1, 'PENDING', '', NULL, '2022-09-07 18:24:44', '2022-09-07 18:24:44'),
	(10, 2, 19, 1, 1, 'PENDING', '', NULL, '2022-09-07 18:26:07', '2022-09-07 18:26:07'),
	(11, 2, 19, 1, 1, 'PENDING', '', NULL, '2022-09-07 18:26:24', '2022-09-07 18:26:24'),
	(12, 2, 19, 1, 1, 'PENDING', '', NULL, '2022-09-07 18:26:26', '2022-09-07 18:26:26'),
	(13, 2, 19, 1, 1, 'PENDING', '', NULL, '2022-09-07 18:28:07', '2022-09-07 18:28:07'),
	(14, 2, 18, 2, 2, 'PENDING', '', NULL, '2022-09-07 18:28:40', '2022-09-07 18:28:40'),
	(15, 2, 18, 2, 2, 'PENDING', '', NULL, '2022-09-07 18:28:41', '2022-09-07 18:28:41'),
	(16, 2, 18, 2, 2, 'PENDING', '', NULL, '2022-09-07 18:28:43', '2022-09-07 18:28:43'),
	(17, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 13:10:09', '2022-09-08 13:10:09'),
	(18, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 13:20:41', '2022-09-08 13:20:41'),
	(19, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 13:20:45', '2022-09-08 13:20:45'),
	(20, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 13:22:21', '2022-09-08 13:22:21'),
	(21, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 13:43:03', '2022-09-08 13:43:03'),
	(22, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 13:43:18', '2022-09-08 13:43:18'),
	(23, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 14:59:45', '2022-09-08 14:59:45'),
	(24, 2, 18, 1, 1, 'CANCLLED', '', NULL, '2022-09-08 15:13:15', '2022-09-08 15:13:15'),
	(25, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 15:31:15', '2022-09-08 15:31:15'),
	(26, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 15:33:03', '2022-09-08 15:33:03'),
	(27, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 15:35:09', '2022-09-08 15:35:09'),
	(28, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 15:35:22', '2022-09-08 15:35:22'),
	(29, 2, 18, 1, 1, 'PENDING', '', NULL, '2022-09-08 15:53:00', '2022-09-08 15:53:00');
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

-- Dumping structure for table food-market-backend.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `houseNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phoneNumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table food-market-backend.users: ~9 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `address`, `houseNumber`, `phoneNumber`, `city`, `roles`, `created_at`, `updated_at`) VALUES
	(1, 'adam', 'adammaulanakh1@gmail.com', NULL, '$2y$10$q3ZCr3UnLkAFAXW.isRN5uxiyEq4fAowQBbu9xbuw5a0JSAS6gvb.', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'ADMIN', '2022-08-27 16:24:34', '2022-08-27 16:24:58'),
	(2, 'adam', 'adam@gmail.com', NULL, '$2y$10$N.KqSVB3rLhe/tj43n8xvuYvwb6/CBsLzwO9/Av1yQHkpM2NKhT.G', NULL, NULL, NULL, NULL, NULL, 'assets/user/pPCwdoBcjVwbQ7EE6FOrobVqxc2hIF5x5bEqOmXt.jpg', 'jl. Komando', '1', '+628877755433', 'Jakarta', 'USER', '2022-08-30 15:24:01', '2022-08-30 15:24:02'),
	(3, 'test', 'test@gmail.com', NULL, '$2y$10$xf0LWIFx5dkXh2PNVUe/xunogn6xH3pyrFY3snDp/j1Id6UgWw2pe', NULL, NULL, NULL, NULL, NULL, NULL, 'komando', '1', '+6209', 'Jakarta', 'USER', '2022-08-30 15:52:07', '2022-08-30 15:52:07'),
	(4, 'wardah', 'wardah@gmail.com', NULL, '$2y$10$uGkd7.pT5pJKpvn4MTqc8.TNsiFFXKTXhTquuJkTap78lQFXif6F2', NULL, NULL, NULL, NULL, NULL, 'assets/user/Ygk8PoMnKDNZ3CwAarScjnSXKEmperrJtUp5NoH4.jpg', 'Jl. Mampang', 'No. 37', '+628778585859', 'Jakarta', 'USER', '2022-09-05 14:15:59', '2022-09-05 14:16:00'),
	(5, 'khosasih', 'khosasih@gmail.com', NULL, '$2y$10$7M17IsIzGSez7W47PvQh7ezh.ybTKc0jx5TUFjGqMSFCy1xrUtKN.', NULL, NULL, NULL, NULL, NULL, NULL, 'jl. komando', 'No. 3', '+628930394848', 'Jakarta', 'USER', '2022-09-05 14:55:04', '2022-09-05 14:55:04'),
	(6, 'maulana', 'maulana@gmail.com', NULL, '$2y$10$aBkChmTNIixNLKUqhVOsXeznED9bI7zfGvYLjsSsEZ4TuslmCcCoO', NULL, NULL, NULL, NULL, NULL, NULL, 'Jl. Komando 3/3', 'No. 3', '+629383283726', 'Jakarta', 'USER', '2022-09-05 15:01:15', '2022-09-05 15:01:15'),
	(7, 'AM', 'AM@gmail.com', NULL, '$2y$10$6qn8gLCL120wj29Y/fD1zebqCB84Sq1nGqxkGGBcpP1jO5lSRBR2C', NULL, NULL, NULL, NULL, NULL, NULL, 'komando1', '12', '+623434376476', 'Jakarta', 'USER', '2022-09-05 15:23:33', '2022-09-05 15:23:33'),
	(8, 'dio', 'dio@gmail.com', NULL, '$2y$10$gYUUEdNenzp9flsGO5FiIO48BF9GwCiO.liyIx88Y8dADwqKZWOl.', NULL, NULL, NULL, NULL, NULL, NULL, 'jl. komando', '03', '+620903290399', 'Jakarta', 'USER', '2022-09-06 17:07:24', '2022-09-06 17:07:24'),
	(9, 'test', 'test1@gmail.com', NULL, '$2y$10$jaSTcXlh2JMsl78w6OQ/.u4O62yjXtRU3YpFeN9Ii2iX6uQD8/eqS', NULL, NULL, NULL, NULL, NULL, NULL, 'komando', '3', '+629303938388', 'Jakarta', 'USER', '2022-09-06 17:29:03', '2022-09-06 17:29:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
