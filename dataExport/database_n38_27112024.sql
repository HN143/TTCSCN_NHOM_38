-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: database_n38
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `app_dulieu`
--

DROP TABLE IF EXISTS `app_dulieu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_dulieu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `don_vi_soan_thao` varchar(100) NOT NULL,
  `so_ky_hieu` varchar(30) NOT NULL,
  `nguoi_ky` varchar(100) NOT NULL,
  `ngay_ban_hanh` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_dulieu`
--

LOCK TABLES `app_dulieu` WRITE;
/*!40000 ALTER TABLE `app_dulieu` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_dulieu` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add du lieu',6,'add_dulieu'),(22,'Can change du lieu',6,'change_dulieu'),(23,'Can delete du lieu',6,'delete_dulieu'),(24,'Can view du lieu',6,'view_dulieu'),(25,'Can add pdf file',7,'add_pdffile'),(26,'Can change pdf file',7,'change_pdffile'),(27,'Can delete pdf file',7,'delete_pdffile'),(28,'Can view pdf file',7,'view_pdffile'),(29,'Can add application',8,'add_application'),(30,'Can change application',8,'change_application'),(31,'Can delete application',8,'delete_application'),(32,'Can view application',8,'view_application'),(33,'Can add access token',9,'add_accesstoken'),(34,'Can change access token',9,'change_accesstoken'),(35,'Can delete access token',9,'delete_accesstoken'),(36,'Can view access token',9,'view_accesstoken'),(37,'Can add grant',10,'add_grant'),(38,'Can change grant',10,'change_grant'),(39,'Can delete grant',10,'delete_grant'),(40,'Can view grant',10,'view_grant'),(41,'Can add refresh token',11,'add_refreshtoken'),(42,'Can change refresh token',11,'change_refreshtoken'),(43,'Can delete refresh token',11,'delete_refreshtoken'),(44,'Can view refresh token',11,'view_refreshtoken'),(45,'Can add id token',12,'add_idtoken'),(46,'Can change id token',12,'change_idtoken'),(47,'Can delete id token',12,'delete_idtoken'),(48,'Can view id token',12,'view_idtoken'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add van ban',14,'add_vanban'),(54,'Can change van ban',14,'change_vanban'),(55,'Can delete van ban',14,'delete_vanban'),(56,'Can view van ban',14,'view_vanban'),(57,'Can add data',15,'add_data'),(58,'Can change data',15,'change_data'),(59,'Can delete data',15,'delete_data'),(60,'Can view data',15,'view_data');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_data`
--

DROP TABLE IF EXISTS `database_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_data` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL,
  `original_file` varchar(512) DEFAULT NULL,
  `converted_file` varchar(512) DEFAULT NULL,
  `text_content` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `convert` tinyint(1) NOT NULL,
  `clean` tinyint(1) NOT NULL,
  `van_ban_id` bigint NOT NULL,
  `data_chinh` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `database_data_van_ban_id_ad97d966_fk_database_vanban_id` (`van_ban_id`),
  CONSTRAINT `database_data_van_ban_id_ad97d966_fk_database_vanban_id` FOREIGN KEY (`van_ban_id`) REFERENCES `database_vanban` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_data`
--

LOCK TABLES `database_data` WRITE;
/*!40000 ALTER TABLE `database_data` DISABLE KEYS */;
INSERT INTO `database_data` VALUES (6,'1155 QĐ-HVM_0001.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\1155 QĐ-HVM_0001.pdf','','',1,0,0,7,1),(7,'1036 TB-HVM_0001.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\1036 TB-HVM_0001.pdf','','',1,0,0,8,1),(8,'1204 KH-HVM_0001.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\1204 KH-HVM_0001.pdf','','',1,0,0,9,1),(9,'QD 1067.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\QD 1067.pdf','','',1,0,0,10,1),(10,'Quy trinh Khao sat y kien nguoi hoc sap tot nghiep.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh Khao sat y kien nguoi hoc sap tot nghiep.pdf','','',1,0,0,10,0),(11,'Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 thang.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 thang.pdf','','',1,0,0,10,0),(12,'Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 nam.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 nam.pdf','','',1,0,0,10,0),(13,'Quy trinh khao sat y kien cuu nguoi hoc.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh khao sat y kien cuu nguoi hoc.pdf','','',1,0,0,10,0),(14,'Quy trinh khao sat y kien nha tuyen dung ve chat luong dao tao cua Hoc vien.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh khao sat y kien nha tuyen dung ve chat luong dao tao cua Hoc vien.pdf','','',1,0,0,10,0),(15,'Quy trinh khao sat y kien can bo giang vien ve cac mat hoat dong cua Hoc vien.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh khao sat y kien can bo giang vien ve cac mat hoat dong cua Hoc vien.pdf','','',1,0,0,10,0),(16,'Quy trinh kiem tra, giam sat dam bao chat luong dao tao.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh kiem tra, giam sat dam bao chat luong dao tao.pdf','','',1,0,0,10,0),(17,'Quy trinh cham thi ket thuc hoc phan.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\Quy trinh cham thi ket thuc hoc phan.pdf','','',1,0,0,10,0),(18,'594 HVM-CTTC_0001.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\594 HVM-CTTC_0001.pdf','','',1,0,0,11,1),(19,'CÔNG VĂN THỰC HÀNH TIẾT KIỆM CHỐNG LÃNG PHÍ.pdf','application/octet-stream','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\CÔNG VĂN THỰC HÀNH TIẾT KIỆM CHỐNG LÃNG PHÍ.pdf','','',1,0,0,12,1),(20,'KH Triển khai thực hiện Chỉ thị số 27 ngày 25122023 về tăng cường sự lãnh đạo caủa Đảng đối với công tác TH TK, CLP.pdf','application/pdf','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\KH Triển khai thực hiện Chỉ thị số 27 ngày 25122023 về tăng cường sự lãnh đạo caủa Đảng đối với công tác TH TK, CLP.pdf','','',1,0,0,12,0),(21,'phieu_trinh_van_ban_di.docx','docx__1731312080188','D:\\TTCSCN_NHOM38\\TTCS_N38\\TTCSCN_NHOM_38\\WEBPDF\\webpdf\\media\\pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,12,0);
/*!40000 ALTER TABLE `database_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_vanban`
--

DROP TABLE IF EXISTS `database_vanban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_vanban` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_ban_hanh` bigint NOT NULL,
  `id_api` int NOT NULL,
  `so_ky_hieu` varchar(255) NOT NULL,
  `loai_van_ban` varchar(100) NOT NULL,
  `nguoi_tao` varchar(100) NOT NULL,
  `trich_yeu` longtext NOT NULL,
  `don_vi_soan_thao` varchar(255) NOT NULL,
  `so_van_ban` varchar(255) NOT NULL,
  `do_mat` varchar(50) NOT NULL,
  `do_khan` varchar(50) NOT NULL,
  `nguoi_ky` varchar(255) NOT NULL,
  `so_luong_data` int NOT NULL,
  `active` tinyint(1) NOT NULL,
  `ngay_tao` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_api` (`id_api`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_vanban`
--

LOCK TABLES `database_vanban` WRITE;
/*!40000 ALTER TABLE `database_vanban` DISABLE KEYS */;
INSERT INTO `database_vanban` VALUES (7,1731974400000,43216,'1155/QĐ-HVM','Quyết định','Nguyễn Thị Thùy','QĐ vv khen thưởng tổng kết công tác năm 2024','Phòng Chính trị - Tổ chức','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',1,1,1731982582679),(8,1731888000000,43112,'1036/TB-HVM','Thông báo','Nguyễn Thị Thùy','TB vv thực hiện cuộc vận động ủng hộ Tháng cao điểm \"Vì người nghèo\" năm 2024','Phòng Chính trị - Tổ chức','Sổ QĐ, BC, KH, TTr..','Thường','Hỏa tốc','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',1,1,1731895973270),(9,1731542400000,42942,'1204/KH-HVM','Kế hoạch','Nguyễn Thị Thùy','KH tổ chức triển khai thực hiện đồ án tốt nghiệp cho sinh viên đại học chính quy, ngành Công nghệ thông tin (CT5)\n','Phòng Đào tạo','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Lương Thế Dũng - Học viện Kỹ thuật mật mã',1,1,1731571914787),(10,1729728000000,42756,'1067/QĐ-HVM','Quyết định','Nguyễn Thị Thùy','Quyết định phê duyệt 08 quy trình triển khai, phối hợp giải quyết công việc của các cơ quan, đơn vị thuộc Học viện Kỹ thuật mật mã theo Kế hoạch số 1078/KH-BCY ngày 14/12/2022','Phòng Hành chính','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',9,1,1731467490909),(11,1731283200000,42498,'594/HVM-CTTC','Công văn','Nguyễn Thị Thùy','V/v triển khai hồ sơ đăng ký thuê nhà ở công vụ trong BCYCP','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Thường','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',1,1,1731301514055),(12,1731283200000,42469,'595/HVM-CTTC','Công văn','Nguyễn Việt Hưng','V/v Sao gửi kế hoạch 980/KH-BCY về  triển khai thực hiện chỉ thị số 27-CT/TW của Bộ Chính trị ','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Thường','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',3,1,1731291563370);
/*!40000 ALTER TABLE `database_vanban` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(6,'app','dulieu'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(15,'database','data'),(14,'database','vanban'),(9,'oauth2_provider','accesstoken'),(8,'oauth2_provider','application'),(10,'oauth2_provider','grant'),(12,'oauth2_provider','idtoken'),(11,'oauth2_provider','refreshtoken'),(7,'pdf_convert','pdffile'),(5,'sessions','session'),(13,'user','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-26 04:06:46.359577'),(2,'contenttypes','0002_remove_content_type_name','2024-11-26 04:06:47.313973'),(3,'auth','0001_initial','2024-11-26 04:06:51.391004'),(4,'auth','0002_alter_permission_name_max_length','2024-11-26 04:06:52.241507'),(5,'auth','0003_alter_user_email_max_length','2024-11-26 04:06:52.306603'),(6,'auth','0004_alter_user_username_opts','2024-11-26 04:06:52.372564'),(7,'auth','0005_alter_user_last_login_null','2024-11-26 04:06:52.415106'),(8,'auth','0006_require_contenttypes_0002','2024-11-26 04:06:52.470466'),(9,'auth','0007_alter_validators_add_error_messages','2024-11-26 04:06:52.513941'),(10,'auth','0008_alter_user_username_max_length','2024-11-26 04:06:52.564523'),(11,'auth','0009_alter_user_last_name_max_length','2024-11-26 04:06:52.621759'),(12,'auth','0010_alter_group_name_max_length','2024-11-26 04:06:52.858488'),(13,'auth','0011_update_proxy_permissions','2024-11-26 04:06:52.896923'),(14,'auth','0012_alter_user_first_name_max_length','2024-11-26 04:06:52.963438'),(15,'user','0001_initial','2024-11-26 04:06:57.044156'),(16,'admin','0001_initial','2024-11-26 04:06:58.628236'),(17,'admin','0002_logentry_remove_auto_add','2024-11-26 04:06:58.664939'),(18,'admin','0003_logentry_add_action_flag_choices','2024-11-26 04:06:58.722771'),(19,'app','0001_initial','2024-11-26 04:06:59.243381'),(20,'database','0001_initial','2024-11-26 04:07:00.735235'),(21,'database','0002_alter_data_original_file','2024-11-26 04:07:01.367121'),(22,'oauth2_provider','0001_initial','2024-11-26 04:07:11.472927'),(23,'oauth2_provider','0002_auto_20190406_1805','2024-11-26 04:07:12.398102'),(24,'oauth2_provider','0003_auto_20201211_1314','2024-11-26 04:07:13.427312'),(25,'oauth2_provider','0004_auto_20200902_2022','2024-11-26 04:07:17.753678'),(26,'oauth2_provider','0005_auto_20211222_2352','2024-11-26 04:07:17.869901'),(27,'oauth2_provider','0006_alter_application_client_secret','2024-11-26 04:07:17.922572'),(28,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-11-26 04:07:18.293134'),(29,'oauth2_provider','0008_alter_accesstoken_token','2024-11-26 04:07:18.434260'),(30,'oauth2_provider','0009_add_hash_client_secret','2024-11-26 04:07:18.909828'),(31,'oauth2_provider','0010_application_allowed_origins','2024-11-26 04:07:19.111911'),(32,'oauth2_provider','0011_refreshtoken_token_family','2024-11-26 04:07:19.550532'),(33,'oauth2_provider','0012_add_token_checksum','2024-11-26 04:07:23.031091'),(34,'pdf_convert','0001_initial','2024-11-26 04:07:23.750554'),(35,'pdf_convert','0002_pdffile_text_content','2024-11-26 04:07:24.246807'),(36,'sessions','0001_initial','2024-11-26 04:07:25.142818'),(37,'database','0003_data_data_chinh_vanban_ngay_tao','2024-11-27 06:06:06.005159'),(38,'database','0004_alter_data_converted_file_alter_data_original_file','2024-11-27 07:06:50.745064');
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
INSERT INTO `django_session` VALUES ('6nzkfrom9g4llp5yel3c3l98vu2jqt3r','.eJxVjEEOwiAQRe_C2pAO0CAu3XsGMsMMUjWQlHbVeHdt0oVu_3vvbyriupS4dpnjxOqiQJ1-N8L0lLoDfmC9N51aXeaJ9K7og3Z9ayyv6-H-HRTs5VubcCYHxFkEOYRkDILNYxLM7AS8DMTeI2YjYG0WF0ZPjAA4JMxW1PsDHlU5ng:1tFnIS:9nrScVu7P6W5vkb6sw-I4bvMD-2ucGoQrx0PDfqMNd8','2024-12-10 04:35:32.364700');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  `token_checksum` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `oauth2_provider_accesstoken_token_checksum_85319a26_uniq` (`token_checksum`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) NOT NULL,
  `redirect_uris` longtext NOT NULL,
  `client_type` varchar(32) NOT NULL,
  `authorization_grant_type` varchar(32) NOT NULL,
  `client_secret` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) NOT NULL,
  `post_logout_redirect_uris` longtext NOT NULL,
  `hash_client_secret` tinyint(1) NOT NULL,
  `allowed_origins` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_user_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext NOT NULL,
  `scope` longtext NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) NOT NULL,
  `code_challenge_method` varchar(10) NOT NULL,
  `nonce` varchar(255) NOT NULL,
  `claims` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_user_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_user_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  `token_family` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_user_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdf_convert_pdffile`
--

DROP TABLE IF EXISTS `pdf_convert_pdffile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdf_convert_pdffile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `original_file` varchar(100) NOT NULL,
  `converted_file` varchar(100) DEFAULT NULL,
  `uploaded_at` datetime(6) NOT NULL,
  `text_content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdf_convert_pdffile`
--

LOCK TABLES `pdf_convert_pdffile` WRITE;
/*!40000 ALTER TABLE `pdf_convert_pdffile` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdf_convert_pdffile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,'pbkdf2_sha256$870000$PCdMFT4DD6c6qXqdLUOecJ$gXZjmmQdzaYK/J5EmJB1NOB6pL7LTigvhfzQuu4EUko=','2024-11-26 04:35:32.296129',1,'admin','','','admin@gmail.com',1,1,'2024-11-26 04:08:29.167977','user');
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_groups`
--

DROP TABLE IF EXISTS `user_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_groups_user_id_group_id_bb60391f_uniq` (`user_id`,`group_id`),
  KEY `user_user_groups_group_id_c57f13c0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_user_groups_group_id_c57f13c0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_user_groups_user_id_13f9a20d_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_groups`
--

LOCK TABLES `user_user_groups` WRITE;
/*!40000 ALTER TABLE `user_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_user_permissions`
--

DROP TABLE IF EXISTS `user_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_user_permissions_user_id_permission_id_64f4d5b8_uniq` (`user_id`,`permission_id`),
  KEY `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_user_user_permi_permission_id_ce49d4de_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_user_user_permissions_user_id_31782f58_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_user_permissions`
--

LOCK TABLES `user_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27 15:03:26
