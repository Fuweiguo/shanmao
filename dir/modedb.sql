-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: modedb
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `app_app_carts`
--

DROP TABLE IF EXISTS `app_app_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_app_carts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `isselect` tinyint(1) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_app_carts_goods_id_1dca7b94_fk_app_app_goods_id` (`goods_id`),
  KEY `app_app_carts_user_id_f4034571_fk_app_usermodes_id` (`user_id`),
  CONSTRAINT `app_app_carts_goods_id_1dca7b94_fk_app_app_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `app_app_goods` (`id`),
  CONSTRAINT `app_app_carts_user_id_f4034571_fk_app_usermodes_id` FOREIGN KEY (`user_id`) REFERENCES `app_usermodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_app_carts`
--

LOCK TABLES `app_app_carts` WRITE;
/*!40000 ALTER TABLE `app_app_carts` DISABLE KEYS */;
INSERT INTO `app_app_carts` VALUES (5,3,1,4,2),(6,3,1,5,2),(7,1,1,3,2),(26,6,1,5,1);
/*!40000 ALTER TABLE `app_app_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_app_goods`
--

DROP TABLE IF EXISTS `app_app_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_app_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsname` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` varchar(10) NOT NULL,
  `prices` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_app_goods`
--

LOCK TABLES `app_app_goods` WRITE;
/*!40000 ALTER TABLE `app_app_goods` DISABLE KEYS */;
INSERT INTO `app_app_goods` VALUES (1,'/static/img/lbj2.jpg','iphone','75','117'),(2,'/static/img/lbj3.jpg','MINNETONKA','246','358'),(3,'/static/img/hot_02.jpg','oiwas ipai','248','358'),(4,'/static/img/hot_04.jpg','window','233','450'),(5,'/static/img/hot_05.jpg','vR','666','766');
/*!40000 ALTER TABLE `app_app_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order`
--

DROP TABLE IF EXISTS `app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL,
  `createtime` datetime(6) NOT NULL,
  `identifier` varchar(256) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_order_user_id_f25a9fc4_fk_app_usermodes_id` (`user_id`),
  CONSTRAINT `app_order_user_id_f25a9fc4_fk_app_usermodes_id` FOREIGN KEY (`user_id`) REFERENCES `app_usermodes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (1,0,'2019-01-21 03:56:10.508505','15480429700.8889995359385784',1),(2,0,'2019-01-21 03:56:11.634854','15480429710.9235989733217811',1),(3,0,'2019-01-21 03:56:12.282951','15480429720.7513501370929752',1),(4,0,'2019-01-21 03:56:12.923290','15480429720.9177674859400092',1),(5,0,'2019-01-21 03:56:13.584911','15480429730.5389548746134659',1),(6,0,'2019-01-21 03:56:13.752944','15480429730.6175611675768901',1),(7,0,'2019-01-21 03:56:13.986615','15480429730.06950056114472669',1),(8,0,'2019-01-21 03:56:14.153234','15480429740.9240098296446044',1),(9,0,'2019-01-21 03:56:14.357029','15480429740.847292109825914',1),(10,0,'2019-01-21 03:56:15.062452','15480429750.8932707128811348',1),(11,0,'2019-01-21 03:56:56.074908','15480430160.25425375123179805',1),(12,0,'2019-01-21 04:07:36.440399','15480436560.13207696624592025',1),(13,0,'2019-01-21 04:09:00.002146','15480437400.252021735557978',1),(14,0,'2019-01-21 04:12:44.795657','15480439640.3725604992732753',1),(15,0,'2019-01-21 04:14:17.826735','15480440570.7205265321632758',1),(16,0,'2019-01-21 04:14:19.219228','15480440590.8120386485055028',1),(17,0,'2019-01-21 04:14:45.422409','15480440850.4017250545105039',1),(18,0,'2019-01-21 04:16:45.096061','15480442050.2209404905007205',1),(19,0,'2019-01-21 04:16:46.224237','15480442060.320398127721536',1),(20,0,'2019-01-21 04:17:10.449275','15480442300.029991663073339003',1),(21,0,'2019-01-21 04:21:39.901744','15480444990.3897077851120402',1),(22,0,'2019-01-21 04:23:41.456121','15480446210.9898891254627321',1),(23,0,'2019-01-21 04:47:48.512401','15480460680.6614264802832828',1),(24,0,'2019-01-21 04:52:36.564096','15480463560.2734582404102719',1),(25,0,'2019-01-21 05:03:30.023731','15480470100.08250781106484006',1),(26,0,'2019-01-21 05:09:25.999773','15480473650.5698292264381203',1),(27,0,'2019-01-21 05:10:26.483787','15480474260.8549807027563189',1),(28,0,'2019-01-21 05:23:41.291538','15480482210.4663072643497108',1),(29,0,'2019-01-21 05:24:29.151045','15480482690.44444379657587774',1),(30,0,'2019-01-21 05:24:49.079463','15480482890.8707091078426411',1),(31,0,'2019-01-21 05:26:13.098110','15480483730.3106464082874494',1),(32,0,'2019-01-21 05:32:58.856580','15480487780.15432634398985157',1),(33,0,'2019-01-21 05:33:08.923789','15480487880.2001784058114806',1),(34,0,'2019-01-21 05:44:48.568432','15480494880.14979921184669753',1),(35,0,'2019-01-21 05:47:40.989772','15480496600.7938991894266895',1),(36,0,'2019-01-21 05:56:33.527286','15480501930.16243541788700666',1),(37,0,'2019-01-21 06:06:36.447636','15480507960.7753750658695073',1),(38,0,'2019-01-21 06:08:21.903778','15480509010.2660099487001868',1),(39,0,'2019-01-21 06:16:04.514189','15480513640.23070720591398897',1),(40,0,'2019-01-21 06:16:20.441164','15480513800.1783134905805126',1),(41,0,'2019-01-21 06:21:45.891814','15480517050.4528643184537111',1),(42,0,'2019-01-21 06:22:00.293555','15480517200.6697355440905121',1),(43,0,'2019-01-21 06:25:07.280599','15480519070.9611507305503572',1),(44,0,'2019-01-21 06:27:50.127144','15480520700.7487255608150284',1),(45,0,'2019-01-21 06:29:27.167511','15480521670.9197692600788295',1),(46,0,'2019-01-21 06:37:06.133509','15480526260.29113165249354633',1),(47,0,'2019-01-21 06:41:39.145075','15480528990.10637648104224207',1),(48,0,'2019-01-21 06:43:16.557666','15480529960.9708240885365693',1),(49,0,'2019-01-21 06:43:52.538872','15480530320.00029563847567237733',1),(50,0,'2019-01-21 06:53:29.073764','15480536090.5547724951894293',3),(51,0,'2019-01-21 06:55:17.171097','15480537170.3224311814704445',3),(52,0,'2019-01-21 08:10:36.725185','15480582360.9980925570284603',3);
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_ordergoods`
--

DROP TABLE IF EXISTS `app_ordergoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_ordergoods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_ordergoods_order_id_ef926487_fk_app_order_id` (`order_id`),
  KEY `app_ordergoods_goods_id_b3c19f94_fk_app_app_goods_id` (`goods_id`),
  CONSTRAINT `app_ordergoods_goods_id_b3c19f94_fk_app_app_goods_id` FOREIGN KEY (`goods_id`) REFERENCES `app_app_goods` (`id`),
  CONSTRAINT `app_ordergoods_order_id_ef926487_fk_app_order_id` FOREIGN KEY (`order_id`) REFERENCES `app_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_ordergoods`
--

LOCK TABLES `app_ordergoods` WRITE;
/*!40000 ALTER TABLE `app_ordergoods` DISABLE KEYS */;
INSERT INTO `app_ordergoods` VALUES (1,2,1,28),(2,13,3,28),(3,1,5,28),(4,3,2,28),(5,1,3,32),(6,2,1,34),(7,4,1,36),(8,1,4,36),(9,1,4,37),(10,1,3,37),(11,3,3,38),(12,1,4,40),(18,1,1,47),(19,1,3,48),(20,1,2,48),(21,1,2,49),(22,1,5,49),(23,2,2,50),(24,1,4,50),(25,8,2,52),(26,13,3,52),(27,8,4,52);
/*!40000 ALTER TABLE `app_ordergoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_usermodes`
--

DROP TABLE IF EXISTS `app_usermodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_usermodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `token` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_usermodes`
--

LOCK TABLES `app_usermodes` WRITE;
/*!40000 ALTER TABLE `app_usermodes` DISABLE KEYS */;
INSERT INTO `app_usermodes` VALUES (1,'f123456789','sfs@qq.com','811278734cbf9a25c1ddd786f8ebbba9','ae3b24bd202ad9b3489c2ab679c86583'),(2,'q1234567890','sfsa@dd.com','fccdd5362a9f1653e55dc1d720fbcf0e','7913155b8dc916c77ccba29ea06f976c'),(3,'a123456','aa@qq.com','dc483e80a7a0bd9ef71d8cf973673924','19c5aad224488a62b980446f5b2ec27b');
/*!40000 ALTER TABLE `app_usermodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add app_goods',7,'add_app_goods'),(20,'Can change app_goods',7,'change_app_goods'),(21,'Can delete app_goods',7,'delete_app_goods'),(22,'Can add app_ carts',8,'add_app_carts'),(23,'Can change app_ carts',8,'change_app_carts'),(24,'Can delete app_ carts',8,'delete_app_carts'),(25,'Can add user modes',9,'add_usermodes'),(26,'Can change user modes',9,'change_usermodes'),(27,'Can delete user modes',9,'delete_usermodes'),(28,'Can add order goods',10,'add_ordergoods'),(29,'Can change order goods',10,'change_ordergoods'),(30,'Can delete order goods',10,'delete_ordergoods'),(31,'Can add order',11,'add_order'),(32,'Can change order',11,'change_order'),(33,'Can delete order',11,'delete_order');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'app','app_carts'),(7,'app','app_goods'),(11,'app','order'),(10,'app','ordergoods'),(9,'app','usermodes'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-01-20 06:58:34.613933'),(2,'auth','0001_initial','2019-01-20 06:58:34.966998'),(3,'admin','0001_initial','2019-01-20 06:58:35.107325'),(4,'admin','0002_logentry_remove_auto_add','2019-01-20 06:58:35.134335'),(5,'app','0001_initial','2019-01-20 06:58:35.327581'),(6,'contenttypes','0002_remove_content_type_name','2019-01-20 06:58:35.491003'),(7,'auth','0002_alter_permission_name_max_length','2019-01-20 06:58:35.511873'),(8,'auth','0003_alter_user_email_max_length','2019-01-20 06:58:35.550053'),(9,'auth','0004_alter_user_username_opts','2019-01-20 06:58:35.576160'),(10,'auth','0005_alter_user_last_login_null','2019-01-20 06:58:35.612908'),(11,'auth','0006_require_contenttypes_0002','2019-01-20 06:58:35.617765'),(12,'auth','0007_alter_validators_add_error_messages','2019-01-20 06:58:35.631191'),(13,'auth','0008_alter_user_username_max_length','2019-01-20 06:58:35.650225'),(14,'sessions','0001_initial','2019-01-20 06:58:35.673776'),(15,'app','0002_order_ordergoods','2019-01-20 13:45:28.723418'),(16,'app','0003_auto_20190121_0523','2019-01-21 05:23:15.864588');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('9olm59fqz5col42aapzoasxqslzvzxal','OWNlOTcwN2E3MjRkMjAyMmIyNWZhMWEyYWVhZmI0YzBkYTc2ZmFkMzp7InRva2VuIjoiYjIwZTM3MTRiZTY3Nzk0NTQzNTVhNWFlMDdjNTUxNGMifQ==','2019-02-04 02:54:08.637805'),('bn5jl728sbjekys2cwbilp473m8kxe9u','MGE1NGYyMThiNjZlN2MwYTNhMTI3Yjk1YmFmZjU5YmE1YzE5Y2VkMzp7InRva2VuIjoiODgxNzllM2Y0M2MzYjk0ZDllNWU3MTkzNjZiY2ZmODcifQ==','2019-02-03 13:37:56.442342'),('gr8pp7c973861fidtf73b61q4jrt3w2w','NTI2MzVkYTg3ODQ1YTg5NjNmZDQ3ZWRiYzdlNjQ4OWEyY2ZkNDM1Zjp7InRva2VuIjoiNWIwZGNjNDE2MWQ3OTVkNGJmYTY5NTAyMDY1MWZmMzUifQ==','2019-02-03 13:08:13.351495'),('htv527il8popm38ynyoo36q2hwum2yhl','OTExOTQ1YzhiNmNmYTVkOTc5MmFiZGE1YjViMmI1ZjJiMjZiMjJlOTp7InRva2VuIjoiMWJmNmYwNzJjNDFjY2E0YTYwMzYxYmRjOWFmNzIzNGQifQ==','2019-02-04 00:59:50.428862'),('ie5zt46wd2aj558w0n382jhgnickwaeh','ZDRjZWJhNjZjMmIzZDRhNGU3MGI5Zjk0YjkyNmIwNGU2NDRkMTExZDp7InRva2VuIjoiMTljNWFhZDIyNDQ4OGE2MmI5ODA0NDZmNWIyZWMyN2IifQ==','2019-02-04 07:43:55.531138'),('k4xw4legx0vn2672ilsdzp22aw307jqu','ZjIyZjg2NWEyYWQwOGU1ZjNmZGQwNTQzMDEzZmNmNmNmZDljMzJmYjp7InRva2VuIjoiNzkxMzE1NWI4ZGM5MTZjNzdjY2JhMjllYTA2Zjk3NmMifQ==','2019-02-03 14:24:34.180547'),('o2vws9uj2i6odj0lr9abv1s9djgg0haj','MjZiOTBiMWI1NjBhYzkwMDJhNDU1ZGEzOWM5YWI0NmExMjYwNThkMzp7InRva2VuIjoiYmI0ZGZiYTY2ZjJjZTU4Njk1NTNiNjhmMzRjYjdjYzcifQ==','2019-02-03 14:43:36.315838'),('wrnhu1xo02r7v37495yzb4xv3gjn1ymv','NDc2NDI0Nzk1MDMyMTVkMjcwNGU2NTA2NDIwMTAwMWQwODIyYjY2NTp7InRva2VuIjoiZTdjOGIyZDQ5NTQ2ZDhmM2IzMGU2OGFhYzQ4ZTRiNTkifQ==','2019-02-03 07:03:31.595208'),('xbw9819g1p6nhbud37q9ncjjcrq85nto','ZjExM2Q4ODdhOWVhMTEyNzRlMTM3NTlmYTlhOWQ5YmM2ZWVkMGI3NDp7InRva2VuIjoiMzg4N2VhMThkNzRhNmU2MjA1ODgxYmQ0MTgwZjc1ZDMifQ==','2019-02-03 13:01:23.280280');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-21 19:07:19
