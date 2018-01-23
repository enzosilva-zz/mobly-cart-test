-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: localhost    Database: mobly_cart
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Est','2018-01-23 02:03:35','2018-01-23 02:03:35'),(2,'Necessitatibus','2018-01-23 02:03:35','2018-01-23 02:03:35'),(3,'Repellendus','2018-01-23 02:03:35','2018-01-23 02:03:35'),(4,'Fugit','2018-01-23 02:03:35','2018-01-23 02:03:35'),(5,'Sed','2018-01-23 02:03:35','2018-01-23 02:03:35'),(6,'Natus','2018-01-23 02:03:35','2018-01-23 02:03:35'),(7,'Quia','2018-01-23 02:03:35','2018-01-23 02:03:35'),(8,'Eum','2018-01-23 02:03:35','2018-01-23 02:03:35'),(9,'Tempore','2018-01-23 02:03:35','2018-01-23 02:03:35'),(10,'Voluptatem','2018-01-23 02:03:35','2018-01-23 02:03:35'),(11,'Provident','2018-01-23 02:03:39','2018-01-23 02:03:39'),(12,'Occaecati','2018-01-23 02:03:39','2018-01-23 02:03:39'),(13,'Assumenda','2018-01-23 02:03:39','2018-01-23 02:03:39'),(14,'Atque','2018-01-23 02:03:39','2018-01-23 02:03:39'),(15,'Repudiandae','2018-01-23 02:03:39','2018-01-23 02:03:39'),(16,'Nam','2018-01-23 02:03:39','2018-01-23 02:03:39'),(17,'Vel','2018-01-23 02:03:39','2018-01-23 02:03:39'),(18,'Voluptatum','2018-01-23 02:03:39','2018-01-23 02:03:39'),(19,'Qui','2018-01-23 02:03:39','2018-01-23 02:03:39'),(20,'Quo','2018-01-23 02:03:39','2018-01-23 02:03:39');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristic_values`
--

DROP TABLE IF EXISTS `characteristic_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characteristic_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `characteristic_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `characteristic_values_characteristic_id_foreign` (`characteristic_id`),
  CONSTRAINT `characteristic_values_characteristic_id_foreign` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristic_values`
--

LOCK TABLES `characteristic_values` WRITE;
/*!40000 ALTER TABLE `characteristic_values` DISABLE KEYS */;
INSERT INTO `characteristic_values` VALUES (1,'Nam',11,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(2,'Aperiam',12,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(3,'Tenetur',13,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(4,'Sint',14,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(5,'Dolore',15,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(6,'Facilis',16,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(7,'Fuga',17,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(8,'Vitae',18,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(9,'Blanditiis',19,'2018-01-23 02:03:49','2018-01-23 02:03:49'),(10,'Consequatur',20,'2018-01-23 02:03:49','2018-01-23 02:03:49');
/*!40000 ALTER TABLE `characteristic_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `characteristics`
--

DROP TABLE IF EXISTS `characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `characteristics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristics`
--

LOCK TABLES `characteristics` WRITE;
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
INSERT INTO `characteristics` VALUES (1,'Sequi','2018-01-23 02:03:44','2018-01-23 02:03:44'),(2,'Quia','2018-01-23 02:03:44','2018-01-23 02:03:44'),(3,'Id','2018-01-23 02:03:44','2018-01-23 02:03:44'),(4,'Dolorem','2018-01-23 02:03:44','2018-01-23 02:03:44'),(5,'Consequatur','2018-01-23 02:03:44','2018-01-23 02:03:44'),(6,'Maxime','2018-01-23 02:03:44','2018-01-23 02:03:44'),(7,'Architecto','2018-01-23 02:03:44','2018-01-23 02:03:44'),(8,'Beatae','2018-01-23 02:03:44','2018-01-23 02:03:44'),(9,'Qui','2018-01-23 02:03:44','2018-01-23 02:03:44'),(10,'Ab','2018-01-23 02:03:44','2018-01-23 02:03:44'),(11,'Veniam','2018-01-23 02:03:49','2018-01-23 02:03:49'),(12,'Rerum','2018-01-23 02:03:49','2018-01-23 02:03:49'),(13,'Qui','2018-01-23 02:03:49','2018-01-23 02:03:49'),(14,'Harum','2018-01-23 02:03:49','2018-01-23 02:03:49'),(15,'Aliquid','2018-01-23 02:03:49','2018-01-23 02:03:49'),(16,'Omnis','2018-01-23 02:03:49','2018-01-23 02:03:49'),(17,'Corporis','2018-01-23 02:03:49','2018-01-23 02:03:49'),(18,'Aspernatur','2018-01-23 02:03:49','2018-01-23 02:03:49'),(19,'Est','2018-01-23 02:03:49','2018-01-23 02:03:49'),(20,'Vitae','2018-01-23 02:03:49','2018-01-23 02:03:49');
/*!40000 ALTER TABLE `characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout`
--

DROP TABLE IF EXISTS `checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned DEFAULT NULL,
  `items_qty` int(11) NOT NULL DEFAULT '0',
  `gift_card` int(11) NOT NULL DEFAULT '0',
  `subtotal` decimal(8,2) NOT NULL DEFAULT '0.00',
  `total` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_user_id_foreign` (`user_id`),
  CONSTRAINT `checkout_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
INSERT INTO `checkout` VALUES (1,4,0,0,0.00,0.00,'2018-01-23 02:12:55','2018-01-23 03:47:25');
/*!40000 ALTER TABLE `checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkout_items`
--

DROP TABLE IF EXISTS `checkout_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkout_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `checkout_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_qty` int(11) NOT NULL DEFAULT '0',
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_items_checkout_id_foreign` (`checkout_id`),
  KEY `checkout_items_product_id_foreign` (`product_id`),
  CONSTRAINT `checkout_items_checkout_id_foreign` FOREIGN KEY (`checkout_id`) REFERENCES `checkout` (`id`),
  CONSTRAINT `checkout_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_items`
--

LOCK TABLES `checkout_items` WRITE;
/*!40000 ALTER TABLE `checkout_items` DISABLE KEYS */;
INSERT INTO `checkout_items` VALUES (2,1,9,'Ducimus',7,90.86,'2018-01-23 02:13:02','2018-01-23 03:23:28'),(3,1,10,'Nobis',5,266.50,'2018-01-23 03:40:42','2018-01-23 03:40:46');
/*!40000 ALTER TABLE `checkout_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_01_18_000040_create_categories_table',1),(4,'2018_01_18_000047_create_products_table',1),(5,'2018_01_18_001950_create_characteristics_table',1),(6,'2018_01_18_003434_create_characteristic_values_table',1),(7,'2018_01_18_004055_create_product_characteristics_table',1),(8,'2018_01_19_000853_create_checkout_table',1),(9,'2018_01_19_001924_create_checkout_items_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_characteristics`
--

DROP TABLE IF EXISTS `product_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_characteristics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned DEFAULT NULL,
  `characteristic_value_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_characteristics_product_id_foreign` (`product_id`),
  CONSTRAINT `product_characteristics_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_characteristics`
--

LOCK TABLES `product_characteristics` WRITE;
/*!40000 ALTER TABLE `product_characteristics` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_characteristics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `category_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_category_id_foreign` (`category_id`),
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Veritatis','Cupiditate at rem enim et corporis voluptatum dolor. Repellendus sunt suscipit sint quod.',NULL,20.97,11,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(2,'Ut','Voluptas impedit placeat odio est. Sed aut qui id harum facilis cum aspernatur.',NULL,7.11,12,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(3,'Vel','Facilis sit vel aut in. Tempora aut quia non saepe possimus ea.',NULL,33.56,13,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(4,'Laudantium','Adipisci adipisci a voluptatibus dolores. Eligendi voluptatem nulla error earum eos autem porro.',NULL,80.90,14,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(5,'Repudiandae','Quam reiciendis eos ut dolores. Impedit repellendus voluptates aut harum quis fugiat.',NULL,65.41,15,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(6,'Nam','Quis sit maiores aut voluptate. Earum quasi est quia natus praesentium molestias sed.',NULL,82.33,16,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(7,'Molestias','Et velit a eligendi et maiores. Eos natus tenetur quidem recusandae.',NULL,86.22,17,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(8,'Natus','Nemo consectetur quaerat debitis. Dolor est voluptas sapiente quas. Quas voluptates magni et est.',NULL,88.20,18,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(9,'Ducimus','Minus blanditiis quibusdam sint. Natus inventore velit et doloremque vero.',NULL,12.98,19,'2018-01-23 02:03:39','2018-01-23 02:03:39'),(10,'Nobis','Nostrum accusantium nesciunt sint itaque laborum. Excepturi vel magni soluta maiores.',NULL,53.30,20,'2018-01-23 02:03:39','2018-01-23 02:03:39');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Myrtis Kling','parker.thelma@example.net','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','Nx4K6mJzMy','2018-01-23 02:03:29','2018-01-23 02:03:29'),(2,'Emery Lowe','dooley.jaquelin@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','nfBTss7M4N','2018-01-23 02:03:29','2018-01-23 02:03:29'),(3,'Rashad Kirlin','julia.cole@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','kVUQFWDkdG','2018-01-23 02:03:29','2018-01-23 02:03:29'),(4,'Dawn Fadel','kwalter@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','K1KKz0C4f7zNWqycuHxlwMF93qjc5ORh3BnqHLJVWdqotDNL7q7joy63uZUd','2018-01-23 02:03:29','2018-01-23 02:03:29'),(5,'Mr. Elmer Steuber','collier.gussie@example.net','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','Ihm0MNjEkV','2018-01-23 02:03:29','2018-01-23 02:03:29'),(6,'Dr. Felicity Schamberger PhD','zachary.mitchell@example.net','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','Zwfvv0cXOX','2018-01-23 02:03:29','2018-01-23 02:03:29'),(7,'Ana Mante III','oran36@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','Ri4ZbavYrL','2018-01-23 02:03:29','2018-01-23 02:03:29'),(8,'Emmanuel Collins','rbarton@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','v373k9tI5N','2018-01-23 02:03:29','2018-01-23 02:03:29'),(9,'Guillermo Hansen','whilll@example.org','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','Vh18A3P8PQ','2018-01-23 02:03:29','2018-01-23 02:03:29'),(10,'Prof. Alessandra Luettgen I','don39@example.com','$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm','4rNXTWjiKx','2018-01-23 02:03:29','2018-01-23 02:03:29');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22 23:54:51
