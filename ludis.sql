-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ludis
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add webpack',7,'add_webpack'),(26,'Can change webpack',7,'change_webpack'),(27,'Can delete webpack',7,'delete_webpack'),(28,'Can view webpack',7,'view_webpack'),(29,'Can add event',8,'add_event'),(30,'Can change event',8,'change_event'),(31,'Can delete event',8,'delete_event'),(32,'Can view event',8,'view_event'),(33,'Can add mainpage',9,'add_mainpage'),(34,'Can change mainpage',9,'change_mainpage'),(35,'Can delete mainpage',9,'delete_mainpage'),(36,'Can view mainpage',9,'view_mainpage'),(37,'Can add blog',10,'add_blog'),(38,'Can change blog',10,'change_blog'),(39,'Can delete blog',10,'delete_blog'),(40,'Can view blog',10,'view_blog'),(41,'Can add about',11,'add_about'),(42,'Can change about',11,'change_about'),(43,'Can delete about',11,'delete_about'),(44,'Can view about',11,'view_about'),(45,'Can add comment',12,'add_comment'),(46,'Can change comment',12,'change_comment'),(47,'Can delete comment',12,'delete_comment'),(48,'Can view comment',12,'view_comment'),(49,'Can add category',13,'add_category'),(50,'Can change category',13,'change_category'),(51,'Can delete category',13,'delete_category'),(52,'Can view category',13,'view_category'),(53,'Can add addblog',14,'add_addblog'),(54,'Can change addblog',14,'change_addblog'),(55,'Can delete addblog',14,'delete_addblog'),(56,'Can view addblog',14,'view_addblog'),(57,'Can add blog_comment',15,'add_blog_comment'),(58,'Can change blog_comment',15,'change_blog_comment'),(59,'Can delete blog_comment',15,'delete_blog_comment'),(60,'Can view blog_comment',15,'view_blog_comment'),(61,'Can add gallery',16,'add_gallery'),(62,'Can change gallery',16,'change_gallery'),(63,'Can delete gallery',16,'delete_gallery'),(64,'Can view gallery',16,'view_gallery'),(65,'Can add password',17,'add_password'),(66,'Can change password',17,'change_password'),(67,'Can delete password',17,'delete_password'),(68,'Can view password',17,'view_password'),(69,'Can add profile',18,'add_profile'),(70,'Can change profile',18,'change_profile'),(71,'Can delete profile',18,'delete_profile'),(72,'Can view profile',18,'view_profile'),(73,'Can add level',19,'add_level'),(74,'Can change level',19,'change_level'),(75,'Can delete level',19,'delete_level'),(76,'Can view level',19,'view_level'),(77,'Can add grade',20,'add_grade'),(78,'Can change grade',20,'change_grade'),(79,'Can delete grade',20,'delete_grade'),(80,'Can view grade',20,'view_grade'),(81,'Can add academic year',21,'add_academicyear'),(82,'Can change academic year',21,'change_academicyear'),(83,'Can delete academic year',21,'delete_academicyear'),(84,'Can view academic year',21,'view_academicyear'),(85,'Can add history',22,'add_history'),(86,'Can change history',22,'change_history'),(87,'Can delete history',22,'delete_history'),(88,'Can view history',22,'view_history'),(89,'Can add test history',23,'add_testhistory'),(90,'Can change test history',23,'change_testhistory'),(91,'Can delete test history',23,'delete_testhistory'),(92,'Can view test history',23,'view_testhistory'),(93,'Can add student',24,'add_student'),(94,'Can change student',24,'change_student'),(95,'Can delete student',24,'delete_student'),(96,'Can view student',24,'view_student'),(97,'Can add chat',25,'add_chat'),(98,'Can change chat',25,'change_chat'),(99,'Can delete chat',25,'delete_chat'),(100,'Can view chat',25,'view_chat'),(101,'Can add library',26,'add_library'),(102,'Can change library',26,'change_library'),(103,'Can delete library',26,'delete_library'),(104,'Can view library',26,'view_library'),(105,'Can add course',27,'add_course'),(106,'Can change course',27,'change_course'),(107,'Can delete course',27,'delete_course'),(108,'Can view course',27,'view_course'),(109,'Can add course comment',28,'add_coursecomment'),(110,'Can change course comment',28,'change_coursecomment'),(111,'Can delete course comment',28,'delete_coursecomment'),(112,'Can view course comment',28,'view_coursecomment'),(113,'Can add test',29,'add_test'),(114,'Can change test',29,'change_test'),(115,'Can delete test',29,'delete_test'),(116,'Can view test',29,'view_test'),(117,'Can add result',30,'add_result'),(118,'Can change result',30,'change_result'),(119,'Can delete result',30,'delete_result'),(120,'Can view result',30,'view_result'),(121,'Can add result history',31,'add_resulthistory'),(122,'Can change result history',31,'change_resulthistory'),(123,'Can delete result history',31,'delete_resulthistory'),(124,'Can view result history',31,'view_resulthistory'),(125,'Can add teacher',32,'add_teacher'),(126,'Can change teacher',32,'change_teacher'),(127,'Can delete teacher',32,'delete_teacher'),(128,'Can view teacher',32,'view_teacher'),(129,'Can add grade post',33,'add_gradepost'),(130,'Can change grade post',33,'change_gradepost'),(131,'Can delete grade post',33,'delete_gradepost'),(132,'Can view grade post',33,'view_gradepost'),(133,'Can add subject',34,'add_subject'),(134,'Can change subject',34,'change_subject'),(135,'Can delete subject',34,'delete_subject'),(136,'Can view subject',34,'view_subject'),(137,'Can add manager',35,'add_manager'),(138,'Can change manager',35,'change_manager'),(139,'Can delete manager',35,'delete_manager'),(140,'Can view manager',35,'view_manager'),(141,'Can add student message',36,'add_studentmessage'),(142,'Can change student message',36,'change_studentmessage'),(143,'Can delete student message',36,'delete_studentmessage'),(144,'Can view student message',36,'view_studentmessage');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (12,'pbkdf2_sha256$390000$A2O3YYpfcZbaxtYuPV3wiY$jl8K0lMsFWaS+ixewomf2WbrxqK/kUBdD0L4h/pj/i4=','2023-01-14 07:44:00.955186',1,'mane','mather','Tefera','leulsegedmelaku1020@gmail.com',1,1,'2023-01-14 07:38:26.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (45,'2023-01-14 09:33:08.976891','11','fetl',3,'',4,12);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(11,'home','about'),(14,'home','addblog'),(10,'home','blog'),(15,'home','blog_comment'),(13,'home','category'),(12,'home','comment'),(8,'home','event'),(16,'home','gallery'),(20,'home','grade'),(19,'home','level'),(9,'home','mainpage'),(17,'home','password'),(18,'home','profile'),(7,'home','webpack'),(35,'manager','manager'),(36,'manager','studentmessage'),(21,'redirector','academicyear'),(22,'redirector','history'),(23,'redirector','testhistory'),(6,'sessions','session'),(25,'student','chat'),(27,'student','course'),(28,'student','coursecomment'),(26,'student','library'),(30,'student','result'),(31,'student','resulthistory'),(24,'student','student'),(29,'student','test'),(33,'teacher','gradepost'),(34,'teacher','subject'),(32,'teacher','teacher');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-01-13 18:22:37.255102'),(2,'auth','0001_initial','2023-01-13 18:22:38.005016'),(3,'admin','0001_initial','2023-01-13 18:22:38.176877'),(4,'admin','0002_logentry_remove_auto_add','2023-01-13 18:22:38.192522'),(5,'admin','0003_logentry_add_action_flag_choices','2023-01-13 18:22:38.208145'),(6,'contenttypes','0002_remove_content_type_name','2023-01-13 18:22:38.317493'),(7,'auth','0002_alter_permission_name_max_length','2023-01-13 18:22:38.411258'),(8,'auth','0003_alter_user_email_max_length','2023-01-13 18:22:38.458111'),(9,'auth','0004_alter_user_username_opts','2023-01-13 18:22:38.473736'),(10,'auth','0005_alter_user_last_login_null','2023-01-13 18:22:38.567496'),(11,'auth','0006_require_contenttypes_0002','2023-01-13 18:22:38.567496'),(12,'auth','0007_alter_validators_add_error_messages','2023-01-13 18:22:38.583107'),(13,'auth','0008_alter_user_username_max_length','2023-01-13 18:22:38.661223'),(14,'auth','0009_alter_user_last_name_max_length','2023-01-13 18:22:38.754964'),(15,'auth','0010_alter_group_name_max_length','2023-01-13 18:22:38.786215'),(16,'auth','0011_update_proxy_permissions','2023-01-13 18:22:38.801837'),(17,'auth','0012_alter_user_first_name_max_length','2023-01-13 18:22:38.895582'),(18,'home','0001_initial','2023-01-13 18:22:38.926827'),(19,'home','0002_event','2023-01-13 18:22:38.942451'),(20,'home','0003_mainpage','2023-01-13 18:22:38.973699'),(21,'home','0004_webpack_slogan','2023-01-13 18:22:38.989344'),(22,'home','0005_webpack_app','2023-01-13 18:22:39.020616'),(23,'home','0006_webpack_about','2023-01-13 18:22:39.036198'),(24,'home','0007_webpack_registration_deadline_and_more','2023-01-13 18:22:39.083101'),(25,'home','0008_alter_webpack_registration_deadline_and_more','2023-01-13 18:22:39.176822'),(26,'home','0009_remove_webpack_registration_start_and_more','2023-01-13 18:22:39.223703'),(27,'home','0010_blog_alter_mainpage_image_alter_webpack_app_and_more','2023-01-13 18:22:39.270557'),(28,'home','0011_blog_date','2023-01-13 18:22:39.286187'),(29,'home','0012_webpack_facebook_webpack_telegram','2023-01-13 18:22:39.333052'),(30,'home','0013_webpack_theme_color','2023-01-13 18:22:39.364319'),(31,'home','0014_about','2023-01-13 18:22:39.426825'),(32,'home','0015_comment','2023-01-13 18:22:39.458063'),(33,'home','0016_categoty_blog_category','2023-01-13 18:22:39.536161'),(34,'home','0017_rename_categoty_category','2023-01-13 18:22:39.676797'),(35,'home','0018_blog_p1_blog_p2_blog_p3','2023-01-13 18:22:39.739292'),(36,'home','0019_alter_blog_cover_addblog','2023-01-13 18:22:39.879888'),(37,'home','0020_blog_comment','2023-01-13 18:22:40.051751'),(38,'home','0021_blog_comment_date_comment_date','2023-01-13 18:22:40.129966'),(39,'home','0022_gallery','2023-01-13 18:22:40.161119'),(40,'home','0023_gallery_event','2023-01-13 18:22:40.223653'),(41,'home','0024_gallery_on_front','2023-01-13 18:22:40.254868'),(42,'home','0025_password','2023-01-13 18:22:40.286115'),(43,'home','0026_rename_name_password_first_name_password_last_name','2023-01-13 18:22:40.317358'),(44,'home','0027_password_phone_password_sex','2023-01-13 18:22:40.358136'),(45,'home','0028_profile','2023-01-13 18:22:40.483127'),(46,'home','0029_profile_is_verified','2023-01-13 18:22:40.530021'),(47,'home','0030_remove_password_password_password_of_and_more','2023-01-13 18:22:40.655013'),(48,'home','0031_rename_passwords_password_password_alter_password_of','2023-01-13 18:22:40.826855'),(49,'home','0032_alter_gallery_event','2023-01-13 18:22:40.842484'),(50,'home','0033_level_grade_alter_profile_grade_alter_profile_level','2023-01-13 18:22:41.373692'),(51,'home','0034_alter_profile_grade_alter_profile_level','2023-01-13 18:22:41.404941'),(52,'home','0035_remove_profile_grade_remove_profile_level','2023-01-13 18:22:41.623680'),(53,'home','0036_profile_grade_profile_level','2023-01-13 18:22:41.795540'),(54,'home','0037_rename_grade_profile_grades_and_more','2023-01-13 18:22:42.108023'),(55,'home','0038_remove_profile_grades_remove_profile_levels','2023-01-13 18:22:42.311131'),(56,'home','0039_rename_level_levels','2023-01-13 18:22:42.436142'),(57,'home','0040_rename_levels_campas','2023-01-13 18:22:42.576762'),(58,'home','0041_remove_grade_level_delete_campas_delete_grade','2023-01-13 18:22:42.654858'),(59,'home','0042_profile_grade_profile_level','2023-01-13 18:22:42.717384'),(60,'home','0043_remove_profile_grade_remove_profile_level','2023-01-13 18:22:42.779887'),(61,'home','0044_profile_grade_profile_level','2023-01-13 18:22:42.842364'),(62,'home','0045_level_grade_alter_profile_grade_alter_profile_level','2023-01-13 18:22:43.357934'),(63,'home','0046_alter_profile_grade','2023-01-13 18:22:43.373580'),(64,'home','0047_blog_by','2023-01-13 18:22:43.482947'),(65,'home','0048_alter_profile_grade_alter_profile_level','2023-01-13 18:22:43.529799'),(66,'home','0049_alter_profile_grade_alter_profile_level','2023-01-13 18:22:43.576674'),(67,'manager','0001_initial','2023-01-13 18:22:43.701661'),(68,'manager','0002_level_grade','2023-01-13 18:22:43.826653'),(69,'manager','0003_delete_grade_delete_level','2023-01-13 18:22:43.857904'),(70,'manager','0004_studentmessage','2023-01-13 18:22:43.873631'),(71,'manager','0005_studentmessage_for_all_studentmessage_grade','2023-01-13 18:22:43.998536'),(72,'manager','0006_remove_studentmessage_for_all','2023-01-13 18:22:44.029802'),(73,'manager','0007_studentmessage_for_all','2023-01-13 18:22:44.061015'),(74,'manager','0008_remove_studentmessage_for_all','2023-01-13 18:22:44.092349'),(75,'manager','0009_alter_studentmessage_link','2023-01-13 18:22:44.123511'),(76,'manager','0010_studentmessage_sender','2023-01-13 18:22:44.201628'),(77,'manager','0011_manager_first_name_manager_last_name','2023-01-13 18:22:44.264148'),(78,'manager','0012_remove_manager_city_remove_manager_nationality','2023-01-13 18:22:44.342265'),(79,'manager','0013_manager_is_verified','2023-01-13 18:22:44.389137'),(80,'teacher','0001_initial','2023-01-13 18:22:44.514107'),(81,'teacher','0002_gradepost','2023-01-13 18:22:44.701598'),(82,'teacher','0003_subject_teacher_subject','2023-01-13 18:22:44.967222'),(83,'teacher','0004_remove_gradepost_image','2023-01-13 18:22:44.998486'),(84,'teacher','0005_teacher_first_name_teacher_last_name','2023-01-13 18:22:45.076572'),(85,'student','0001_initial','2023-01-13 18:22:45.217206'),(86,'student','0002_student_instagram_student_telegram','2023-01-13 18:22:45.264079'),(87,'student','0003_student_template','2023-01-13 18:22:45.295310'),(88,'student','0004_remove_student_template','2023-01-13 18:22:45.326560'),(89,'student','0005_chat','2023-01-13 18:22:45.554597'),(90,'student','0006_alter_chat_reciever_alter_chat_sender','2023-01-13 18:22:45.867075'),(91,'student','0007_student_first_name_student_last_name_and_more','2023-01-13 18:22:46.273320'),(92,'student','0008_student_username','2023-01-13 18:22:46.320263'),(93,'student','0009_chat_code','2023-01-13 18:22:46.351454'),(94,'student','0010_remove_chat_code_chatcode','2023-01-13 18:22:46.507656'),(95,'student','0011_chat_code_delete_chatcode','2023-01-13 18:22:46.570175'),(96,'student','0012_remove_chat_code_chat_grade','2023-01-13 18:22:46.695145'),(97,'student','0013_student_grade','2023-01-13 18:22:46.726406'),(98,'student','0014_remove_chat_reciever_student_view_alter_chat_sender','2023-01-13 18:22:47.085744'),(99,'student','0015_library','2023-01-13 18:22:47.116998'),(100,'student','0016_remove_library_for_all','2023-01-13 18:22:47.148239'),(101,'student','0017_library_author_library_disc','2023-01-13 18:22:47.179509'),(102,'teacher','0006_teacher_subscribers','2023-01-13 18:22:47.382619'),(103,'teacher','0007_remove_teacher_subject_teacher_subject','2023-01-13 18:22:47.710701'),(104,'teacher','0008_alter_teacher_subject_alter_teacher_subscribers','2023-01-13 18:22:47.851321'),(105,'teacher','0009_alter_teacher_subscribers','2023-01-13 18:22:47.976330'),(106,'teacher','0010_alter_teacher_subject_alter_teacher_subscribers','2023-01-13 18:22:48.038824'),(107,'teacher','0011_teacher_view','2023-01-13 18:22:48.116928'),(108,'teacher','0012_teacher_facebook','2023-01-13 18:22:48.163800'),(109,'redirector','0001_initial','2023-01-13 18:22:48.195046'),(110,'redirector','0002_history_testhistory_resulthistory','2023-01-13 18:22:48.820004'),(111,'redirector','0003_delete_resulthistory','2023-01-13 18:22:48.851285'),(112,'redirector','0004_resulthistory','2023-01-13 18:22:49.132485'),(113,'redirector','0005_delete_resulthistory','2023-01-13 18:22:49.148106'),(114,'sessions','0001_initial','2023-01-13 18:22:49.210605'),(115,'student','0018_course','2023-01-13 18:22:49.491833'),(116,'student','0019_course_cover','2023-01-13 18:22:49.554349'),(117,'student','0020_course_views','2023-01-13 18:22:49.757438'),(118,'student','0021_alter_course_views','2023-01-13 18:22:49.804311'),(119,'student','0022_library_posted_by','2023-01-13 18:22:49.913699'),(120,'student','0023_remove_course_views_course_views','2023-01-13 18:22:50.007424'),(121,'student','0024_alter_course_views','2023-01-13 18:22:50.023047'),(122,'student','0025_alter_course_views','2023-01-13 18:22:50.194916'),(123,'student','0023_remove_course_views_coursecomment_course_views','2023-01-13 18:22:50.469188'),(124,'student','0026_merge_20230104_0845','2023-01-13 18:22:50.484833'),(125,'student','0027_remove_course_views','2023-01-13 18:22:50.516091'),(126,'student','0028_course_views','2023-01-13 18:22:50.594181'),(127,'student','0029_test_result','2023-01-13 18:22:50.906656'),(128,'student','0030_result_subject','2023-01-13 18:22:51.031652'),(129,'student','0031_result_total','2023-01-13 18:22:51.062894'),(130,'student','0032_remove_result_total','2023-01-13 18:22:51.094164'),(131,'student','0033_remove_student_section','2023-01-13 18:22:51.156643'),(132,'student','0034_student_year','2023-01-13 18:22:51.281635'),(133,'student','0035_resulthistory','2023-01-13 18:22:51.687857'),(134,'student','0036_student_is_verified','2023-01-13 18:22:51.765977'),(135,'student','0037_alter_student_year','2023-01-13 18:22:52.015962'),(136,'student','0038_student_date','2023-01-13 18:22:52.094080'),(137,'student','0039_student_average','2023-01-13 18:22:52.187841'),(138,'student','0040_alter_library_author','2023-01-13 18:22:52.203447'),(139,'student','0041_test_time','2023-01-13 18:22:52.250317'),(140,'student','0042_remove_test_time_result_time','2023-01-13 18:22:52.312833'),(141,'student','0043_test_time','2023-01-13 18:22:52.359706'),(142,'student','0044_test_year_alter_student_view','2023-01-13 18:22:52.484678'),(143,'student','0045_alter_student_average','2023-01-13 18:22:52.515957'),(144,'teacher','0013_teacher_my_room','2023-01-13 18:22:52.750283'),(145,'teacher','0014_remove_teacher_my_room_teacher_my_room','2023-01-13 18:22:52.953399'),(146,'teacher','0015_remove_teacher_subject_teacher_subject','2023-01-13 18:22:53.125258'),(147,'teacher','0016_remove_teacher_my_room_teacher_my_room','2023-01-13 18:22:53.500328'),(148,'teacher','0017_alter_teacher_view','2023-01-13 18:22:53.531484'),(149,'teacher','0018_teacher_is_verified','2023-01-13 18:22:53.640868'),(150,'student','0046_alter_student_year','2023-01-13 18:40:57.877254'),(151,'redirector','0006_alter_academicyear_year','2023-01-13 19:12:28.661665'),(152,'redirector','0007_alter_academicyear_year','2023-01-13 19:14:22.122764'),(153,'redirector','0008_remove_history_password','2023-01-13 19:31:09.806885'),(154,'student','0047_resulthistory_time','2023-01-13 19:56:21.791756'),(155,'redirector','0009_testhistory_time','2023-01-13 19:57:25.028901'),(156,'redirector','0010_testhistory_academicyear','2023-01-13 20:33:10.661358'),(157,'home','0050_alter_profile_level','2023-01-14 07:39:40.200920');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('r6tet3o9j2aeqjnqa0edm6jd71iu59xx','.eJxVjDEOwjAMRe-SGUW4tevAyN4zRIljSAElUtNOiLtDpQ6w_vfefxkf1iX7tensp2TOBjpz-B1jkIeWjaR7KLdqpZZlnqLdFLvTZsea9HnZ3b-DHFr-1gKogzomcKqghKBX6DkAMARhUUEiQpfYYUxHItbkup6F5MQDknl_AP8FN4k:1pGbCq:xi1FbjJfOnioWkqI14hSpDyBmK-6gLbqeNjVPH4JvbE','2023-01-28 07:44:00.963184');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_about`
--

DROP TABLE IF EXISTS `home_about`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_about` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `topic` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `paragraph` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_about`
--

LOCK TABLES `home_about` WRITE;
/*!40000 ALTER TABLE `home_about` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_about` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_addblog`
--

DROP TABLE IF EXISTS `home_addblog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_addblog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `Image` varchar(100) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `p1` longtext,
  `p2` longtext,
  `p3` longtext,
  `blog_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_addblog_blog_id_4f128b1b_fk_home_blog_id` (`blog_id`),
  CONSTRAINT `home_addblog_blog_id_4f128b1b_fk_home_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `home_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_addblog`
--

LOCK TABLES `home_addblog` WRITE;
/*!40000 ALTER TABLE `home_addblog` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_addblog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_blog`
--

DROP TABLE IF EXISTS `home_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_blog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cover` varchar(100) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `p1` longtext,
  `p2` longtext,
  `p3` longtext,
  `by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_blog_category_id_0b0b7261_fk_home_category_id` (`category_id`),
  KEY `home_blog_by_id_d0a5c675_fk_auth_user_id` (`by_id`),
  CONSTRAINT `home_blog_by_id_d0a5c675_fk_auth_user_id` FOREIGN KEY (`by_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `home_blog_category_id_0b0b7261_fk_home_category_id` FOREIGN KEY (`category_id`) REFERENCES `home_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_blog`
--

LOCK TABLES `home_blog` WRITE;
/*!40000 ALTER TABLE `home_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_blog_comment`
--

DROP TABLE IF EXISTS `home_blog_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_blog_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `blog_id` bigint NOT NULL,
  `commenter_id` int NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_blog_comment_blog_id_509bbb1d_fk_home_blog_id` (`blog_id`),
  KEY `home_blog_comment_commenter_id_42ad6913_fk_auth_user_id` (`commenter_id`),
  CONSTRAINT `home_blog_comment_blog_id_509bbb1d_fk_home_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `home_blog` (`id`),
  CONSTRAINT `home_blog_comment_commenter_id_42ad6913_fk_auth_user_id` FOREIGN KEY (`commenter_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_blog_comment`
--

LOCK TABLES `home_blog_comment` WRITE;
/*!40000 ALTER TABLE `home_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_blog_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_category`
--

DROP TABLE IF EXISTS `home_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_category`
--

LOCK TABLES `home_category` WRITE;
/*!40000 ALTER TABLE `home_category` DISABLE KEYS */;
INSERT INTO `home_category` VALUES (1,'physics');
/*!40000 ALTER TABLE `home_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_comment`
--

DROP TABLE IF EXISTS `home_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `message` longtext,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_comment`
--

LOCK TABLES `home_comment` WRITE;
/*!40000 ALTER TABLE `home_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_event`
--

DROP TABLE IF EXISTS `home_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_event` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_event`
--

LOCK TABLES `home_event` WRITE;
/*!40000 ALTER TABLE `home_event` DISABLE KEYS */;
INSERT INTO `home_event` VALUES (2,'Graduation');
/*!40000 ALTER TABLE `home_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_gallery`
--

DROP TABLE IF EXISTS `home_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_gallery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `event_id` bigint DEFAULT NULL,
  `on_front` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `home_gallery_event_id_3f34b47c_fk_home_event_id` (`event_id`),
  CONSTRAINT `home_gallery_event_id_3f34b47c_fk_home_event_id` FOREIGN KEY (`event_id`) REFERENCES `home_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_gallery`
--

LOCK TABLES `home_gallery` WRITE;
/*!40000 ALTER TABLE `home_gallery` DISABLE KEYS */;
INSERT INTO `home_gallery` VALUES (2,'','anonymous/gallery/wallpaperflare.com_wallpaper_1.jpg',2,1);
/*!40000 ALTER TABLE `home_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_grade`
--

DROP TABLE IF EXISTS `home_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_grade` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `level_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `home_grade_level_id_cf7e93b4_fk_home_level_id` (`level_id`),
  CONSTRAINT `home_grade_level_id_cf7e93b4_fk_home_level_id` FOREIGN KEY (`level_id`) REFERENCES `home_level` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_grade`
--

LOCK TABLES `home_grade` WRITE;
/*!40000 ALTER TABLE `home_grade` DISABLE KEYS */;
INSERT INTO `home_grade` VALUES (1,'12(Natural)',1);
/*!40000 ALTER TABLE `home_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_level`
--

DROP TABLE IF EXISTS `home_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_level` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_level`
--

LOCK TABLES `home_level` WRITE;
/*!40000 ALTER TABLE `home_level` DISABLE KEYS */;
INSERT INTO `home_level` VALUES (1,'Highschool');
/*!40000 ALTER TABLE `home_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_mainpage`
--

DROP TABLE IF EXISTS `home_mainpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_mainpage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `header` varchar(255) DEFAULT NULL,
  `body` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_mainpage`
--

LOCK TABLES `home_mainpage` WRITE;
/*!40000 ALTER TABLE `home_mainpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_mainpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_password`
--

DROP TABLE IF EXISTS `home_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_password` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `of_id` int DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `home_password_of_id_4e36e064_uniq` (`of_id`),
  CONSTRAINT `home_password_of_id_4e36e064_fk_auth_user_id` FOREIGN KEY (`of_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_password`
--

LOCK TABLES `home_password` WRITE;
/*!40000 ALTER TABLE `home_password` DISABLE KEYS */;
INSERT INTO `home_password` VALUES (7,'mather','leulsegedmelaku1020@gmail.com',NULL,NULL,'manager','Tefera','0991173792','female',12,'oneBitcoin=7000$');
/*!40000 ALTER TABLE `home_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_profile`
--

DROP TABLE IF EXISTS `home_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `is_manager` tinyint(1) DEFAULT NULL,
  `is_teacher` tinyint(1) DEFAULT NULL,
  `is_student` tinyint(1) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `grade_id` bigint DEFAULT NULL,
  `level_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `home_profile_grade_id_b875c8dd` (`grade_id`),
  KEY `home_profile_level_id_485e0888` (`level_id`),
  CONSTRAINT `home_profile_grade_id_b875c8dd_fk_home_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `home_grade` (`id`),
  CONSTRAINT `home_profile_level_id_485e0888_fk_home_level_id` FOREIGN KEY (`level_id`) REFERENCES `home_level` (`id`),
  CONSTRAINT `home_profile_user_id_5bf46ea0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_profile`
--

LOCK TABLES `home_profile` WRITE;
/*!40000 ALTER TABLE `home_profile` DISABLE KEYS */;
INSERT INTO `home_profile` VALUES (7,'0991173792','female',1,0,0,0,12,1,NULL,NULL);
/*!40000 ALTER TABLE `home_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_webpack`
--

DROP TABLE IF EXISTS `home_webpack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `home_webpack` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone1` varchar(255) DEFAULT NULL,
  `phone2` varchar(255) DEFAULT NULL,
  `slogan` varchar(500) DEFAULT NULL,
  `app` varchar(100) DEFAULT NULL,
  `about` longtext,
  `registration_deadline` date DEFAULT NULL,
  `show_register` tinyint(1) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `telegram` varchar(255) DEFAULT NULL,
  `theme_color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_webpack`
--

LOCK TABLES `home_webpack` WRITE;
/*!40000 ALTER TABLE `home_webpack` DISABLE KEYS */;
INSERT INTO `home_webpack` VALUES (1,'Trial Academy','anonymous/webpack/wallpaperflare.com_wallpaper_1.jpg','Addis Ababa, Ethiopia','leulsegedmelaku1020@gmail.com','0991173792','0921615684','School slogan here','','djjdjdjdj',NULL,0,'https://t.me/itz_leul','https://t.me/itz_leul','red');
/*!40000 ALTER TABLE `home_webpack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_manager`
--

DROP TABLE IF EXISTS `manager_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_manager` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(100) DEFAULT NULL,
  `instagram` varchar(5255) DEFAULT NULL,
  `telegram` varchar(5255) DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  CONSTRAINT `manager_manager_profile_id_a192ed66_fk_home_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `home_profile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_manager`
--

LOCK TABLES `manager_manager` WRITE;
/*!40000 ALTER TABLE `manager_manager` DISABLE KEYS */;
INSERT INTO `manager_manager` VALUES (2,'',NULL,NULL,7,'mather','Tefera',1);
/*!40000 ALTER TABLE `manager_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_studentmessage`
--

DROP TABLE IF EXISTS `manager_studentmessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager_studentmessage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `message` longtext,
  `link_name` varchar(20) NOT NULL,
  `link` varchar(2555) NOT NULL,
  `grade_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_studentmessage_grade_id_57134193_fk_home_grade_id` (`grade_id`),
  KEY `manager_studentmessage_sender_id_bdb27490_fk_manager_manager_id` (`sender_id`),
  CONSTRAINT `manager_studentmessage_grade_id_57134193_fk_home_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `home_grade` (`id`),
  CONSTRAINT `manager_studentmessage_sender_id_bdb27490_fk_manager_manager_id` FOREIGN KEY (`sender_id`) REFERENCES `manager_manager` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_studentmessage`
--

LOCK TABLES `manager_studentmessage` WRITE;
/*!40000 ALTER TABLE `manager_studentmessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager_studentmessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirector_academicyear`
--

DROP TABLE IF EXISTS `redirector_academicyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirector_academicyear` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `year` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirector_academicyear`
--

LOCK TABLES `redirector_academicyear` WRITE;
/*!40000 ALTER TABLE `redirector_academicyear` DISABLE KEYS */;
INSERT INTO `redirector_academicyear` VALUES (6,2015);
/*!40000 ALTER TABLE `redirector_academicyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirector_history`
--

DROP TABLE IF EXISTS `redirector_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirector_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `is_manager` tinyint(1) DEFAULT NULL,
  `is_teacher` tinyint(1) DEFAULT NULL,
  `is_student` tinyint(1) DEFAULT NULL,
  `is_staff` tinyint(1) DEFAULT NULL,
  `is_verified` tinyint(1) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `instagram` varchar(5255) DEFAULT NULL,
  `telegram` varchar(5255) DEFAULT NULL,
  `academicYear_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `redirector_history_academicYear_id_46947b89_fk_redirecto` (`academicYear_id`),
  KEY `redirector_history_user_id_5fe54d0b_fk_auth_user_id` (`user_id`),
  CONSTRAINT `redirector_history_academicYear_id_46947b89_fk_redirecto` FOREIGN KEY (`academicYear_id`) REFERENCES `redirector_academicyear` (`id`),
  CONSTRAINT `redirector_history_user_id_5fe54d0b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirector_history`
--

LOCK TABLES `redirector_history` WRITE;
/*!40000 ALTER TABLE `redirector_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirector_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirector_testhistory`
--

DROP TABLE IF EXISTS `redirector_testhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `redirector_testhistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  `history_id` bigint NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `academicYear_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `redirector_testhisto_history_id_d388f1c4_fk_redirecto` (`history_id`),
  KEY `redirector_testhisto_academicYear_id_a6c4ee0e_fk_redirecto` (`academicYear_id`),
  CONSTRAINT `redirector_testhisto_academicYear_id_a6c4ee0e_fk_redirecto` FOREIGN KEY (`academicYear_id`) REFERENCES `redirector_academicyear` (`id`),
  CONSTRAINT `redirector_testhisto_history_id_d388f1c4_fk_redirecto` FOREIGN KEY (`history_id`) REFERENCES `redirector_history` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirector_testhistory`
--

LOCK TABLES `redirector_testhistory` WRITE;
/*!40000 ALTER TABLE `redirector_testhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirector_testhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_chat`
--

DROP TABLE IF EXISTS `student_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_chat` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `date` datetime(6) DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  `grade_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_chat_sender_id_c4f1ee33` (`sender_id`),
  KEY `student_chat_grade_id_96de8167_fk_home_grade_id` (`grade_id`),
  CONSTRAINT `student_chat_grade_id_96de8167_fk_home_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `home_grade` (`id`),
  CONSTRAINT `student_chat_sender_id_c4f1ee33_fk_student_student_id` FOREIGN KEY (`sender_id`) REFERENCES `student_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_chat`
--

LOCK TABLES `student_chat` WRITE;
/*!40000 ALTER TABLE `student_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course`
--

DROP TABLE IF EXISTS `student_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `video` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `about` longtext NOT NULL,
  `posted_by_id` bigint DEFAULT NULL,
  `cover` varchar(100) NOT NULL,
  `views` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `student_course_posted_by_id_94fa7871_fk_teacher_teacher_id` (`posted_by_id`),
  CONSTRAINT `student_course_posted_by_id_94fa7871_fk_teacher_teacher_id` FOREIGN KEY (`posted_by_id`) REFERENCES `teacher_teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course`
--

LOCK TABLES `student_course` WRITE;
/*!40000 ALTER TABLE `student_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_subject`
--

DROP TABLE IF EXISTS `student_course_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_course_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `subject_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_course_subject_course_id_subject_id_9a58f57b_uniq` (`course_id`,`subject_id`),
  KEY `student_course_subject_subject_id_90d7c0f4_fk_teacher_subject_id` (`subject_id`),
  CONSTRAINT `student_course_subject_course_id_95628c20_fk_student_course_id` FOREIGN KEY (`course_id`) REFERENCES `student_course` (`id`),
  CONSTRAINT `student_course_subject_subject_id_90d7c0f4_fk_teacher_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `teacher_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_subject`
--

LOCK TABLES `student_course_subject` WRITE;
/*!40000 ALTER TABLE `student_course_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_course_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_coursecomment`
--

DROP TABLE IF EXISTS `student_coursecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_coursecomment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `date` datetime(6) DEFAULT NULL,
  `course_id` bigint DEFAULT NULL,
  `sender_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_coursecomment_course_id_cad7ec6e_fk_student_course_id` (`course_id`),
  KEY `student_coursecomment_sender_id_0bd36c3a_fk_student_student_id` (`sender_id`),
  CONSTRAINT `student_coursecomment_course_id_cad7ec6e_fk_student_course_id` FOREIGN KEY (`course_id`) REFERENCES `student_course` (`id`),
  CONSTRAINT `student_coursecomment_sender_id_0bd36c3a_fk_student_student_id` FOREIGN KEY (`sender_id`) REFERENCES `student_student` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_coursecomment`
--

LOCK TABLES `student_coursecomment` WRITE;
/*!40000 ALTER TABLE `student_coursecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_coursecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_library`
--

DROP TABLE IF EXISTS `student_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_library` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `cover` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `for_student` tinyint(1) NOT NULL,
  `for_teacher` tinyint(1) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `disc` longtext,
  `posted_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_library_posted_by_id_ab10d84d_fk_home_profile_id` (`posted_by_id`),
  CONSTRAINT `student_library_posted_by_id_ab10d84d_fk_home_profile_id` FOREIGN KEY (`posted_by_id`) REFERENCES `home_profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_library`
--

LOCK TABLES `student_library` WRITE;
/*!40000 ALTER TABLE `student_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_result`
--

DROP TABLE IF EXISTS `student_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_result` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `name_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `subject_id` bigint DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_result_name_id_af3f62f9_fk_student_test_id` (`name_id`),
  KEY `student_result_student_id_ed69fcb4_fk_student_student_id` (`student_id`),
  KEY `student_result_subject_id_0e1ed118_fk_teacher_subject_id` (`subject_id`),
  CONSTRAINT `student_result_name_id_af3f62f9_fk_student_test_id` FOREIGN KEY (`name_id`) REFERENCES `student_test` (`id`),
  CONSTRAINT `student_result_student_id_ed69fcb4_fk_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_student` (`id`),
  CONSTRAINT `student_result_subject_id_0e1ed118_fk_teacher_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `teacher_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_result`
--

LOCK TABLES `student_result` WRITE;
/*!40000 ALTER TABLE `student_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_resulthistory`
--

DROP TABLE IF EXISTS `student_resulthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_resulthistory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `history_id` bigint NOT NULL,
  `name_id` bigint NOT NULL,
  `student_id` bigint DEFAULT NULL,
  `subjects_id` bigint NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_resulthistor_history_id_cb58b9c5_fk_redirecto` (`history_id`),
  KEY `student_resulthistor_name_id_06cc50b2_fk_redirecto` (`name_id`),
  KEY `student_resulthistory_student_id_1d3a60af_fk_student_student_id` (`student_id`),
  KEY `student_resulthistory_subjects_id_6f5d47a8_fk_teacher_subject_id` (`subjects_id`),
  CONSTRAINT `student_resulthistor_history_id_cb58b9c5_fk_redirecto` FOREIGN KEY (`history_id`) REFERENCES `redirector_history` (`id`),
  CONSTRAINT `student_resulthistor_name_id_06cc50b2_fk_redirecto` FOREIGN KEY (`name_id`) REFERENCES `redirector_testhistory` (`id`),
  CONSTRAINT `student_resulthistory_student_id_1d3a60af_fk_student_student_id` FOREIGN KEY (`student_id`) REFERENCES `student_student` (`id`),
  CONSTRAINT `student_resulthistory_subjects_id_6f5d47a8_fk_teacher_subject_id` FOREIGN KEY (`subjects_id`) REFERENCES `teacher_subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_resulthistory`
--

LOCK TABLES `student_resulthistory` WRITE;
/*!40000 ALTER TABLE `student_resulthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_resulthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_student`
--

DROP TABLE IF EXISTS `student_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_student` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(100) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  `instagram` varchar(5255) DEFAULT NULL,
  `telegram` varchar(5255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `view` tinyint(1) NOT NULL,
  `year_id` bigint DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `average` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  KEY `student_student_year_id_cf51a621` (`year_id`),
  CONSTRAINT `student_student_profile_id_6424118c_fk_home_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `home_profile` (`id`),
  CONSTRAINT `student_student_year_id_cf51a621_fk_redirector_academicyear_id` FOREIGN KEY (`year_id`) REFERENCES `redirector_academicyear` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_student`
--

LOCK TABLES `student_student` WRITE;
/*!40000 ALTER TABLE `student_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_test`
--

DROP TABLE IF EXISTS `student_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_test` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  `grade_id` bigint NOT NULL,
  `time` varchar(255) DEFAULT NULL,
  `year_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student_test_grade_id_e94aaf29_fk_home_grade_id` (`grade_id`),
  KEY `student_test_year_id_abe0c629_fk_redirector_academicyear_id` (`year_id`),
  CONSTRAINT `student_test_grade_id_e94aaf29_fk_home_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `home_grade` (`id`),
  CONSTRAINT `student_test_year_id_abe0c629_fk_redirector_academicyear_id` FOREIGN KEY (`year_id`) REFERENCES `redirector_academicyear` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_test`
--

LOCK TABLES `student_test` WRITE;
/*!40000 ALTER TABLE `student_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_gradepost`
--

DROP TABLE IF EXISTS `teacher_gradepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_gradepost` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `disc` longtext,
  `link1` varchar(200) NOT NULL,
  `link2` varchar(200) NOT NULL,
  `link3` varchar(200) NOT NULL,
  `file1` varchar(100) NOT NULL,
  `file2` varchar(100) NOT NULL,
  `file3` varchar(100) NOT NULL,
  `date` datetime(6) DEFAULT NULL,
  `for_grade_id` bigint NOT NULL,
  `teacher_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_gradepost_for_grade_id_33068d44_fk_home_grade_id` (`for_grade_id`),
  KEY `teacher_gradepost_teacher_id_a7292e2f_fk_teacher_teacher_id` (`teacher_id`),
  CONSTRAINT `teacher_gradepost_for_grade_id_33068d44_fk_home_grade_id` FOREIGN KEY (`for_grade_id`) REFERENCES `home_grade` (`id`),
  CONSTRAINT `teacher_gradepost_teacher_id_a7292e2f_fk_teacher_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_gradepost`
--

LOCK TABLES `teacher_gradepost` WRITE;
/*!40000 ALTER TABLE `teacher_gradepost` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_gradepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_subject`
--

DROP TABLE IF EXISTS `teacher_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_subject` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `grade_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_subject_grade_id_10597934_fk_home_grade_id` (`grade_id`),
  CONSTRAINT `teacher_subject_grade_id_10597934_fk_home_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `home_grade` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_subject`
--

LOCK TABLES `teacher_subject` WRITE;
/*!40000 ALTER TABLE `teacher_subject` DISABLE KEYS */;
INSERT INTO `teacher_subject` VALUES (1,'physics',1);
/*!40000 ALTER TABLE `teacher_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teacher`
--

DROP TABLE IF EXISTS `teacher_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_teacher` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(100) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `instagram` varchar(5255) DEFAULT NULL,
  `telegram` varchar(5255) DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `view` tinyint(1) NOT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `is_verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `profile_id` (`profile_id`),
  KEY `teacher_teacher_subject_id_aab18ff8_fk_teacher_subject_id` (`subject_id`),
  CONSTRAINT `teacher_teacher_profile_id_e21fba3b_fk_home_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `home_profile` (`id`),
  CONSTRAINT `teacher_teacher_subject_id_aab18ff8_fk_teacher_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `teacher_subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teacher`
--

LOCK TABLES `teacher_teacher` WRITE;
/*!40000 ALTER TABLE `teacher_teacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teacher_my_room`
--

DROP TABLE IF EXISTS `teacher_teacher_my_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_teacher_my_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint NOT NULL,
  `grade_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_teacher_my_room_teacher_id_grade_id_91116178_uniq` (`teacher_id`,`grade_id`),
  KEY `teacher_teacher_my_room_grade_id_a43f9246_fk_home_grade_id` (`grade_id`),
  CONSTRAINT `teacher_teacher_my_r_teacher_id_e81016ce_fk_teacher_t` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_teacher` (`id`),
  CONSTRAINT `teacher_teacher_my_room_grade_id_a43f9246_fk_home_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `home_grade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teacher_my_room`
--

LOCK TABLES `teacher_teacher_my_room` WRITE;
/*!40000 ALTER TABLE `teacher_teacher_my_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teacher_my_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher_teacher_subscribers`
--

DROP TABLE IF EXISTS `teacher_teacher_subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher_teacher_subscribers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint NOT NULL,
  `profile_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_teacher_subscribers_teacher_id_student_id_c8364648_uniq` (`teacher_id`,`profile_id`),
  KEY `teacher_teacher_subs_profile_id_cff30da8_fk_home_prof` (`profile_id`),
  CONSTRAINT `teacher_teacher_subs_profile_id_cff30da8_fk_home_prof` FOREIGN KEY (`profile_id`) REFERENCES `home_profile` (`id`),
  CONSTRAINT `teacher_teacher_subs_teacher_id_a881873e_fk_teacher_t` FOREIGN KEY (`teacher_id`) REFERENCES `teacher_teacher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher_teacher_subscribers`
--

LOCK TABLES `teacher_teacher_subscribers` WRITE;
/*!40000 ALTER TABLE `teacher_teacher_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacher_teacher_subscribers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-14  1:45:16
