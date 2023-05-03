-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: api-sama-keur
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','deactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'2023-03-21 21:09:46','2023-03-21 21:09:46',NULL,'Chambre meublée','active'),(2,'2023-03-21 21:10:06','2023-03-21 21:10:06',NULL,'Appartement meublé','active'),(3,'2023-03-21 21:10:20','2023-03-21 21:10:20',NULL,'Appartement à louer','active'),(4,'2023-03-21 21:10:33','2023-03-21 21:10:33',NULL,'Chambre à louer','active'),(5,'2023-03-21 21:10:46','2023-03-21 21:10:46',NULL,'Studio à louer','active'),(6,'2023-03-21 21:10:56','2023-03-21 21:10:56',NULL,'Studio meublé','active');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `note` enum('1','2','3','4','5') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_user_id_foreign` (`user_id`),
  KEY `comments_product_id_foreign` (`product_id`),
  CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2023-03-25 01:23:57','2023-03-25 01:23:57',NULL,'Ce produit est vraiment super cool',1,18,'5'),(2,'2023-03-25 01:26:17','2023-03-25 01:26:17',NULL,'Ce produit est vraiment super cool',1,18,'5');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `images_product_id_foreign` (`product_id`),
  CONSTRAINT `images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'2023-03-24 22:53:24','2023-03-24 22:53:24',NULL,17,'225324-336760761_952591819072162_228257536969824757_n.jpg','primary'),(2,'2023-03-24 22:53:24','2023-03-24 22:53:24',NULL,17,'225324-anelka.jpg','other'),(3,'2023-03-24 23:42:16','2023-03-24 23:42:16',NULL,18,'234216-336760761_952591819072162_228257536969824757_n.jpg','primary'),(4,'2023-03-24 23:42:16','2023-03-24 23:42:16',NULL,18,'234216-anelka.jpg','other'),(5,'2023-03-25 17:00:15','2023-03-25 17:00:15',NULL,19,'170015-main.jpg','primary'),(6,'2023-03-25 17:00:15','2023-03-25 17:00:15',NULL,19,'170015-maison-piscine.jpg','other'),(7,'2023-03-26 22:08:09','2023-03-26 22:08:09',NULL,20,'220809-facade-immeuble-residentiel.jpg','primary');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_100000_create_password_reset_tokens_table',1),(2,'2019_08_19_000000_create_failed_jobs_table',1),(3,'2019_12_14_000001_create_personal_access_tokens_table',1),(4,'2023_03_20_003632_create_categories_table',1),(5,'2023_03_20_003632_create_comments_table',1),(6,'2023_03_20_003632_create_images_table',1),(7,'2023_03_20_003632_create_products_table',1),(8,'2023_03_20_003632_create_reservations_table',1),(9,'2023_03_20_003632_create_services_table',1),(10,'2023_03_20_003632_create_users_table',1),(11,'2023_03_20_003642_create_foreign_keys',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'DaaraDjiFront','97398f08951b0c5f3a09ccd2cd76ec9058659ac946834412a865af8c22fb0d37','[\"*\"]',NULL,NULL,'2023-03-21 00:01:22','2023-03-21 00:01:22'),(2,'App\\Models\\User',1,'DaaraDjiFront','2833a29438adec94fd0aa30e3e612ba1df0b8d0b6cbf01ee96b5d245b018350c','[\"*\"]',NULL,NULL,'2023-03-21 00:02:51','2023-03-21 00:02:51'),(3,'App\\Models\\User',1,'DaaraDjiFront','6330c91b8af7c5029fcbdd297491f6319a19d0445c0f80cfc4da277bf09cd0ba','[\"*\"]','2023-03-26 22:08:08',NULL,'2023-03-21 20:34:40','2023-03-26 22:08:08');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `piece_number` smallint NOT NULL,
  `user_id` int unsigned NOT NULL,
  `status` enum('pending','onsale','sold','expired','occupied','reserved') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int unsigned DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_air_conditioned` tinyint(1) DEFAULT '0',
  `is_ventilated` tinyint(1) DEFAULT '0',
  `bathroom` smallint NOT NULL,
  `price` int NOT NULL,
  `price_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2023-03-21 23:49:01','2023-03-21 23:49:01',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,NULL),(2,'2023-03-22 00:01:06','2023-03-22 00:01:06',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(3,'2023-03-22 00:02:32','2023-03-22 00:02:32',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(4,'2023-03-22 00:02:59','2023-03-22 00:02:59',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(5,'2023-03-22 00:04:36','2023-03-22 00:04:36',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(6,'2023-03-22 00:45:23','2023-03-22 00:45:23',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(7,'2023-03-22 00:48:08','2023-03-22 00:48:08',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(8,'2023-03-22 00:50:54','2023-03-22 00:50:54',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(9,'2023-03-22 00:53:00','2023-03-22 00:53:00',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(10,'2023-03-22 00:53:51','2023-03-22 00:53:51',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(11,'2023-03-22 00:55:08','2023-03-22 00:55:08',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(12,'2023-03-22 00:55:38','2023-03-22 00:55:38',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(13,'2023-03-22 00:56:11','2023-03-22 00:56:11',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(14,'2023-03-22 00:58:08','2023-03-22 00:58:08',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(15,'2023-03-22 00:59:12','2023-03-22 00:59:12',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(16,'2023-03-22 00:59:28','2023-03-22 00:59:28',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(17,'2023-03-24 22:53:24','2023-03-24 22:53:24',NULL,'Joli appartement meublé','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'pending',2,'Cite Mbackiyou Faye',1,0,1,25000,'m'),(18,'2023-03-24 23:42:16','2023-03-25 01:05:31',NULL,'Joli appartement meublé chic','Nous vous proposons des appartements meubles calmes et discrets pour vos journees',2,1,'onsale',2,'Cite Mbackiyou Faye',1,1,1,25000,'j'),(19,'2023-03-25 17:00:14','2023-03-25 17:00:14',NULL,'Maison avec psicine à saly','Une maison chic avec piscine à saly près de la mer',2,1,'pending',NULL,'Saly, Mbour',1,1,1,35000,'jour'),(20,'2023-03-26 22:08:09','2023-03-26 22:08:09',NULL,'Appartement 3 chambres','Appartement 3 chambres salon plus 2 salles de bains et cuisine',3,1,'pending',NULL,'Maristes',1,1,2,250000,'Mois');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservations`
--

DROP TABLE IF EXISTS `reservations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `product_id` int unsigned NOT NULL,
  `user_id` int unsigned NOT NULL,
  `status` enum('pending','confirmed','canceled') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservations_product_id_foreign` (`product_id`),
  KEY `reservations_user_id_foreign` (`user_id`),
  CONSTRAINT `reservations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservations`
--

LOCK TABLES `reservations` WRITE;
/*!40000 ALTER TABLE `reservations` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `cost` int DEFAULT NULL,
  `user_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `services_user_id_foreign` (`user_id`),
  CONSTRAINT `services_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','suspended','pending') COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_phone_unique` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2023-03-21 00:01:22','2023-03-21 00:01:22',NULL,'Seydina','Diouf','thiema2@yopmail.com','780149756','$2y$10$IdvP45m5JQ616FYqfo/bI.DlpFKY7zVdTV6477oGczLXV2figzcsi',NULL,NULL,'pending');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'api-sama-keur'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-03 20:30:20
