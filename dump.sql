-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: mobly_cart
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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
INSERT INTO `categories` VALUES (1,'Hardware','2018-01-26 22:40:06','2018-01-26 22:40:06'),(2,'Game','2018-01-26 22:40:06','2018-01-26 22:40:06'),(3,'Software','2018-01-26 22:40:06','2018-01-26 22:40:06'),(4,'Eletrônico','2018-01-26 22:40:06','2018-01-26 22:40:06'),(5,'Eletroeletrônico','2018-01-26 22:40:06','2018-01-26 22:40:06'),(6,'Informática','2018-01-26 22:40:06','2018-01-26 22:40:06'),(7,'Decoração','2018-01-26 22:40:06','2018-01-26 22:40:06'),(8,'Eletrodoméstico','2018-01-26 22:40:06','2018-01-26 22:40:06'),(9,'Eletroportáteis','2018-01-26 22:40:06','2018-01-26 22:40:06'),(10,'Automotivo','2018-01-26 22:40:06','2018-01-26 22:40:06'),(11,'Brinquedos','2018-01-26 22:40:11','2018-01-26 22:40:11'),(12,'Áudio','2018-01-26 22:40:11','2018-01-26 22:40:11'),(13,'Telefonia','2018-01-26 22:40:11','2018-01-26 22:40:11'),(14,'Smartphones','2018-01-26 22:40:11','2018-01-26 22:40:11'),(15,'Vídeo','2018-01-26 22:40:11','2018-01-26 22:40:11'),(16,'Utensílios','2018-01-26 22:40:11','2018-01-26 22:40:11'),(17,'Ar e Ventilação','2018-01-26 22:40:11','2018-01-26 22:40:11'),(18,'Cameras','2018-01-26 22:40:11','2018-01-26 22:40:11'),(19,'Digital','2018-01-26 22:40:11','2018-01-26 22:40:11'),(20,'Futurístico','2018-01-26 22:40:11','2018-01-26 22:40:11');
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
INSERT INTO `characteristic_values` VALUES (1,'Azul',1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(2,'Plástico',3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(3,'Amarelo',1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(4,'Grande',4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(5,'Verde',1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(6,'Quadrado',2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(7,'+16',5,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(8,'Redondo',2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(9,'Couro',3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(10,'EVA',3,'2018-01-26 23:34:11','2018-01-26 23:34:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `characteristics`
--

LOCK TABLES `characteristics` WRITE;
/*!40000 ALTER TABLE `characteristics` DISABLE KEYS */;
INSERT INTO `characteristics` VALUES (1,'Cor','2018-01-26 23:23:24','2018-01-26 23:23:24'),(2,'Formato','2018-01-26 23:23:24','2018-01-26 23:23:24'),(3,'Material','2018-01-26 23:23:24','2018-01-26 23:23:24'),(4,'Tamanho','2018-01-26 23:23:24','2018-01-26 23:23:24'),(5,'Faixa Etária','2018-01-26 23:23:24','2018-01-26 23:23:24');
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
  `active` int(10) unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `checkout_user_id_foreign` (`user_id`),
  CONSTRAINT `checkout_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout`
--

LOCK TABLES `checkout` WRITE;
/*!40000 ALTER TABLE `checkout` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkout_items`
--

LOCK TABLES `checkout_items` WRITE;
/*!40000 ALTER TABLE `checkout_items` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_01_18_000047_create_products_table',1),(4,'2018_01_18_000102_create_categories_table',1),(5,'2018_01_18_000102_create_product_categories_table',1),(6,'2018_01_18_001950_create_characteristics_table',1),(7,'2018_01_18_003309_create_product_characteristics_table',1),(8,'2018_01_18_003434_create_characteristic_values_table',1),(9,'2018_01_18_003825_create_product_characteristic_values_table',1),(10,'2018_01_19_000853_create_checkout_table',1),(11,'2018_01_19_001924_create_checkout_items_table',1);
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
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `category_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_categories_product_id_foreign` (`product_id`),
  KEY `product_categories_category_id_foreign` (`category_id`),
  CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (1,1,1,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(2,2,2,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(3,3,3,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(4,4,4,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(5,5,5,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(6,6,6,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(7,7,7,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(8,8,8,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(9,9,9,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(10,10,10,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(11,11,11,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(12,12,12,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(13,13,13,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(14,14,14,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(15,15,15,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(16,16,16,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(17,17,17,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(18,18,18,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(19,19,19,'2018-01-26 22:40:11','2018-01-26 22:40:11'),(20,20,20,'2018-01-26 22:40:11','2018-01-26 22:40:11');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_characteristic_values`
--

DROP TABLE IF EXISTS `product_characteristic_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_characteristic_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `characteristic_value_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_characteristic_values_product_id_foreign` (`product_id`),
  KEY `product_characteristic_values_characteristic_value_id_foreign` (`characteristic_value_id`),
  CONSTRAINT `product_characteristic_values_characteristic_value_id_foreign` FOREIGN KEY (`characteristic_value_id`) REFERENCES `characteristic_values` (`id`),
  CONSTRAINT `product_characteristic_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_characteristic_values`
--

LOCK TABLES `product_characteristic_values` WRITE;
/*!40000 ALTER TABLE `product_characteristic_values` DISABLE KEYS */;
INSERT INTO `product_characteristic_values` VALUES (1,1,1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(2,2,3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(3,3,3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(4,4,5,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(5,5,6,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(6,6,8,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(7,7,6,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(8,8,8,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(9,9,2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(10,10,9,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(11,11,10,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(12,12,2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(13,13,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(14,14,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(15,15,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(16,16,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(17,17,7,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(18,18,7,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(19,19,7,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(20,20,7,'2018-01-26 23:34:11','2018-01-26 23:34:11');
/*!40000 ALTER TABLE `product_characteristic_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_characteristics`
--

DROP TABLE IF EXISTS `product_characteristics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_characteristics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned NOT NULL,
  `characteristic_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_characteristics_product_id_foreign` (`product_id`),
  KEY `product_characteristics_characteristic_id_foreign` (`characteristic_id`),
  CONSTRAINT `product_characteristics_characteristic_id_foreign` FOREIGN KEY (`characteristic_id`) REFERENCES `characteristics` (`id`),
  CONSTRAINT `product_characteristics_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_characteristics`
--

LOCK TABLES `product_characteristics` WRITE;
/*!40000 ALTER TABLE `product_characteristics` DISABLE KEYS */;
INSERT INTO `product_characteristics` VALUES (1,1,1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(2,2,1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(3,3,1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(4,4,1,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(5,5,2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(6,6,2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(7,7,2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(8,8,2,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(9,9,3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(10,10,3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(11,11,3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(12,12,3,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(13,13,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(14,14,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(15,15,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(16,16,4,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(17,17,5,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(18,18,5,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(19,19,5,'2018-01-26 23:34:11','2018-01-26 23:34:11'),(20,20,5,'2018-01-26 23:34:11','2018-01-26 23:34:11');
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Teclado','Quam vel totam nisi aliquam id. Voluptas rerum ut sequi. Est ad deleniti consequatur ex in.','https://lorempixel.com/640/480/?10541',74.02,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(2,'Mouse','Veniam id repudiandae sit deserunt sint quis. Quis non voluptas necessitatibus eligendi labore vel.','https://lorempixel.com/640/480/?80278',30.39,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(3,'Fonte ATX','Et explicabo dicta ullam sunt. Nostrum corrupti sit labore rerum. Dolorum quis ut omnis sed quidem.','https://lorempixel.com/640/480/?16320',47.81,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(4,'HD','Reiciendis in blanditiis iure nulla suscipit omnis. Facere dignissimos deserunt pariatur dolores.','https://lorempixel.com/640/480/?76308',6.80,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(5,'SSD','Nulla maiores recusandae odit. Inventore dolor enim est. Dignissimos quis ut labore eos.','https://lorempixel.com/640/480/?68587',75.92,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(6,'Pen Drive','Quaerat et enim non est explicabo doloremque consequatur. Cumque quam iusto illo omnis.','https://lorempixel.com/640/480/?29545',64.20,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(7,'Fone de Ouvido','In quasi quibusdam in similique. Adipisci sed consequuntur id qui. Ducimus inventore autem itaque.','https://lorempixel.com/640/480/?81190',52.45,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(8,'Cadeira Gamer','Est nihil eveniet id. Autem est quisquam et natus et.','https://lorempixel.com/640/480/?62382',11.45,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(9,'Celular Razr','Hic qui quis quia nesciunt vel. Cupiditate veniam aspernatur sed ut fugiat. Quia vel dolorum sit.','https://lorempixel.com/640/480/?48011',75.16,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(10,'Memória RAM','Non qui quae quas qui ipsam ut. Id quo vero est aut neque. Voluptate et sed deleniti dicta.','https://lorempixel.com/640/480/?93917',66.15,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(11,'Gabinete','Et illum veniam qui. Eveniet ab voluptate et optio. Tenetur deserunt provident unde architecto et.','https://lorempixel.com/640/480/?67615',32.35,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(12,'Placa Mãe','Vel dolor nihil autem ex possimus. Expedita labore natus repudiandae rem.','https://lorempixel.com/640/480/?60047',72.76,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(13,'Placa de Vídeo','Omnis sed ut mollitia quo. Est et dolor est dolor nihil earum aut voluptatibus.','https://lorempixel.com/640/480/?82278',87.11,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(14,'Placa de Som','Ut animi est tempora aut sed. Accusamus qui nemo voluptatibus praesentium.','https://lorempixel.com/640/480/?23321',4.29,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(15,'Placa de Rede','Aut ab beatae asperiores. Excepturi aspernatur aliquam sint eum quam aut quibusdam.','https://lorempixel.com/640/480/?76344',5.49,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(16,'Monitor 21','Quia deleniti ut laudantium dolor. Iste est eum quia. Aliquam qui cupiditate quasi quis hic.','https://lorempixel.com/640/480/?84554',80.35,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(17,'Monitor 24','Velit ex asperiores qui voluptatum. Voluptatem voluptatibus ab et nesciunt ea qui exercitationem.','https://lorempixel.com/640/480/?49158',4.78,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(18,'TV 32','Magnam odio aut amet non. Magni inventore deserunt quo. Et et harum quidem.','https://lorempixel.com/640/480/?73054',54.53,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(19,'TV 42','Eos voluptatem iste eveniet aut ut. Ut dolores dolorem quo molestiae nihil. Eius dolorem harum quo.','https://lorempixel.com/640/480/?37541',9.15,'2018-01-26 22:39:58','2018-01-26 22:39:58'),(20,'Receptor Digital','Ratione magni maiores aut aut. Eum aliquam et laudantium quas dolores.','https://lorempixel.com/640/480/?85061',89.17,'2018-01-26 22:39:58','2018-01-26 22:39:58');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2018-01-26 20:03:18
