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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add du lieu',6,'add_dulieu'),(22,'Can change du lieu',6,'change_dulieu'),(23,'Can delete du lieu',6,'delete_dulieu'),(24,'Can view du lieu',6,'view_dulieu'),(25,'Can add pdf file',7,'add_pdffile'),(26,'Can change pdf file',7,'change_pdffile'),(27,'Can delete pdf file',7,'delete_pdffile'),(28,'Can view pdf file',7,'view_pdffile'),(29,'Can add application',8,'add_application'),(30,'Can change application',8,'change_application'),(31,'Can delete application',8,'delete_application'),(32,'Can view application',8,'view_application'),(33,'Can add access token',9,'add_accesstoken'),(34,'Can change access token',9,'change_accesstoken'),(35,'Can delete access token',9,'delete_accesstoken'),(36,'Can view access token',9,'view_accesstoken'),(37,'Can add grant',10,'add_grant'),(38,'Can change grant',10,'change_grant'),(39,'Can delete grant',10,'delete_grant'),(40,'Can view grant',10,'view_grant'),(41,'Can add refresh token',11,'add_refreshtoken'),(42,'Can change refresh token',11,'change_refreshtoken'),(43,'Can delete refresh token',11,'delete_refreshtoken'),(44,'Can view refresh token',11,'view_refreshtoken'),(45,'Can add id token',12,'add_idtoken'),(46,'Can change id token',12,'change_idtoken'),(47,'Can delete id token',12,'delete_idtoken'),(48,'Can view id token',12,'view_idtoken'),(49,'Can add user',13,'add_user'),(50,'Can change user',13,'change_user'),(51,'Can delete user',13,'delete_user'),(52,'Can view user',13,'view_user'),(53,'Can add van ban',14,'add_vanban'),(54,'Can change van ban',14,'change_vanban'),(55,'Can delete van ban',14,'delete_vanban'),(56,'Can view van ban',14,'view_vanban'),(57,'Can add data',15,'add_data'),(58,'Can change data',15,'change_data'),(59,'Can delete data',15,'delete_data'),(60,'Can view data',15,'view_data'),(61,'Can add dieu kien tai',16,'add_dieukientai'),(62,'Can change dieu kien tai',16,'change_dieukientai'),(63,'Can delete dieu kien tai',16,'delete_dieukientai'),(64,'Can view dieu kien tai',16,'view_dieukientai'),(65,'Can add file',17,'add_file'),(66,'Can change file',17,'change_file'),(67,'Can delete file',17,'delete_file'),(68,'Can view file',17,'view_file');
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
  `download_converted_file` varchar(512) DEFAULT NULL,
  `download_original_file` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `database_data_van_ban_id_ad97d966_fk_database_vanban_id` (`van_ban_id`),
  CONSTRAINT `database_data_van_ban_id_ad97d966_fk_database_vanban_id` FOREIGN KEY (`van_ban_id`) REFERENCES `database_vanban` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_data`
--

LOCK TABLES `database_data` WRITE;
/*!40000 ALTER TABLE `database_data` DISABLE KEYS */;
INSERT INTO `database_data` VALUES (1,'Về việc báo cáo công tác ĐBCL năm 2024.pdf','application/octet-stream','pdfdata\\Về việc báo cáo công tác ĐBCL năm 2024.pdf','','',1,0,0,1,1,NULL,'http://127.0.0.1:8000/database/download_original/V%E1%BB%81%20vi%E1%BB%87c%20b%C3%A1o%20c%C3%A1o%20c%C3%B4ng%20t%C3%A1c%20%C4%90BCL%20n%C4%83m%202024.pdf'),(2,'phieu_trinh_van_ban_di.docx','docx__1732869236551','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,1,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(3,'phieu_trinh_van_ban_di.docx','docx__1732872075637','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,2,1,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(4,'THÔNG BÁO CÁC ĐVI LƯƠNG 2025.pdf','application/octet-stream','pdfdata\\THÔNG BÁO CÁC ĐVI LƯƠNG 2025.pdf','','',1,0,0,2,0,NULL,'http://127.0.0.1:8000/database/download_original/TH%C3%94NG%20B%C3%81O%20C%C3%81C%20%C4%90VI%20L%C6%AF%C6%A0NG%202025.pdf'),(5,'phieu_trinh_van_ban_di.docx','docx__1732783308462','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,3,1,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(6,'Thông báo Kết quả lấy ý kiến phản hồi về CTĐT và CSVC phục vụ đào tạo.pdf','application/octet-stream','pdfdata\\Thông báo Kết quả lấy ý kiến phản hồi về CTĐT và CSVC phục vụ đào tạo.pdf','','',1,0,0,3,0,NULL,'http://127.0.0.1:8000/database/download_original/Th%C3%B4ng%20b%C3%A1o%20K%E1%BA%BFt%20qu%E1%BA%A3%20l%E1%BA%A5y%20%C3%BD%20ki%E1%BA%BFn%20ph%E1%BA%A3n%20h%E1%BB%93i%20v%E1%BB%81%20CT%C4%90T%20v%C3%A0%20CSVC%20ph%E1%BB%A5c%20v%E1%BB%A5%20%C4%91%C3%A0o%20t%E1%BA%A1o.pdf'),(7,'Q_Báo cáo kq  khảo sát CTĐT và CSVC chốt_da ky so.pdf','application/octet-stream','pdfdata\\Q_Báo cáo kq  khảo sát CTĐT và CSVC chốt_da ky so.pdf','','',1,0,0,3,0,NULL,'http://127.0.0.1:8000/database/download_original/Q_B%C3%A1o%20c%C3%A1o%20kq%20%20kh%E1%BA%A3o%20s%C3%A1t%20CT%C4%90T%20v%C3%A0%20CSVC%20ch%E1%BB%91t_da%20ky%20so.pdf'),(8,'Kế hoạch tổ chức hội nghị giao ban công tác học viên năm 2024.pdf','application/octet-stream','pdfdata\\Kế hoạch tổ chức hội nghị giao ban công tác học viên năm 2024.pdf','','',1,0,0,4,1,NULL,'http://127.0.0.1:8000/database/download_original/K%E1%BA%BF%20ho%E1%BA%A1ch%20t%E1%BB%95%20ch%E1%BB%A9c%20h%E1%BB%99i%20ngh%E1%BB%8B%20giao%20ban%20c%C3%B4ng%20t%C3%A1c%20h%E1%BB%8Dc%20vi%C3%AAn%20n%C4%83m%202024.pdf'),(9,'phieu_trinh_van_ban_di.docx','docx__1732776757218','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,4,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(10,'phieu_trinh_van_ban_di.docx','docx__1732871162083','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,5,1,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(11,'QĐ Thành lập hội đồng nghiệm thu NHCHT năm 2024.pdf','application/octet-stream','pdfdata\\QĐ Thành lập hội đồng nghiệm thu NHCHT năm 2024.pdf','','',1,0,0,5,0,NULL,'http://127.0.0.1:8000/database/download_original/Q%C4%90%20Th%C3%A0nh%20l%E1%BA%ADp%20h%E1%BB%99i%20%C4%91%E1%BB%93ng%20nghi%E1%BB%87m%20thu%20NHCHT%20n%C4%83m%202024.pdf'),(12,'1293 QĐ-HVM_0001.pdf','application/pdf','pdfdata\\1293 QĐ-HVM_0001.pdf','pdfconvert/converted_1293 QĐ-HVM_0001.pdf','BAN CƠ YẾU CHÍNH  PHỦ CỘNG HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập - Tự do - Hạnh phúc\nSố: 4292 /QĐ-HVM Hà Nội, ngày*Ï tháng 11 năm 2024\nQUYÉT  ĐỊNH\nThành lập Tổ chuyên  gia tham mưu và thực hiện nhiệm vụ phát triển\nnguồn  lực đào tạo và nghiên  cứu Thiết kế vi mạch\nGIÁM  ĐÓC HỌC VIỆN KỸ THUẬT  MẬT MÃ\nCăn cứ Thông íư số 54/2014/TT-  -BQP ngày 12/2014  của Bộ trưởng  Bộ\nQuốc phòng về việc quy định chức năng, nhiệm vụ, quyền hạn và môi quan hệ\ncông tác của Học viện Kỹ thuật mật mã thuộc Ban Cơ yêu Chính phú và Quyết\nđịnh số 563/QĐÐ-BCY  ngày 02 tháng 12 năm 2022 của Trưởng  ban Ban Cơ yêu\nChính  phủ quy định cơ cấu, tổ chức, biên chế của Học viện Kỹ thuật mật mã;\nCăn cứ công văn số 9520/BKHĐT-T TĐMST  về việc hướng dẫn triển khai\nChương  trình “Phát triển nguôn nhân lực ngành công nghiệp  bán dân đến năm\n2030 định hướng  đên năm 2050”  của Bộ Kê hoạch và đầu tư;\nTheo đề nghị của Trưởng  phòng Chính trị - Tổ chức và Chủ nhiệm Khoa\nĐiện tử - Viên thông.\nQUYÉT  ĐỊNH:\nĐiều 1. Thành lập Tổ chuyên  gia tham mưu và thực hiện nhiệm vụ phát triển\nnguôn  lực đào tạo và nghiên  cứu Thiết kê vi mạch, gôm các đông chí có tên trong\ndanh sách kèm theo.\nĐiều 2. Tổ chuyên  gia tham mưu và thực hiện nhiệm vụ phát triển nguồn lực\nđào tạo và nghiên  cứu Thiết kê vi mạch thực hiện các nhiệm  vụ sau:\n1. Tham mưu xây dựng chương  trình đào tạo Thiết kế vi mạch.\n2. Tham mưu xây dựng báo cáo đề xuất chủ trương đầu tư phòng thí nghiệm\nbán dân câp cơ sở.\n3. Tham mưu đào tạo nâng cao năng lực giảng dạy và nghiên cứu Thiết kế\nvi mạch.\nĐiều 3. Trưởng  phòng Chính trị - Tổ chức, Chủ nhiệm Khoa Điện tử - Viễn\nthông,  Thủ trưởng  các cơ quan, đơn vị có liên quan và các đông chí có tên tại Điêu\n1 chịu trách nhiệm  thi hành Quyết định này./. Z4.\nNơi nhận: Là: GIÁM  ĐÓC\n- Như điều 3;\n- Ban Giám đốc;\n- Các khoa: MM, CNTT,  ĐTVT;\n- Các phòng: CTTC,  TBQT,  KHTC;\n- Viện NC;\n- Lưu: VT, ĐTVT. A15.Aw⁄\ncủa Giám đốc Học viện Kỹ thuật mật mã)Ä Xã EM : gi4J233vgb. Mngày2#  tháng 11 năm 2024\nTT Họ và tên Chức vụ, đơn vị Vai trò\n1 | Bài Đúc Trình Chủ nhiệm Khoa ĐTVT Tổ trưởng\n2| Trân Ngọc Quý Phó Chủ nhiệm  Khoa ĐTVT Tô phó\n3 | Nguyễn  Đào Trường | Phó Chủ nhiệm Khoa ĐTVT Thư ký\n4_| Đỗ Quang Trung Chủ nhiệm Khoa Mật mã Tổ viên\n5 | Phạm Văn Hưởng Chủ nhiệm Khoa CNTT Tổ viên\nna... Phó Viện trưởng  Viện NCƯD Tổ viên\nKH&CN\n7 | Lưu Văn Lịch Phó Trưởng  phòng TBQT Tổ viên\n§ | Nguyễn  Trung Kiên Phó Trưởng  phòng KHTC Tô viên\n9 _| Nguyễn  Thị Thu Thảo | Phó Trưởng  phòng CTTC Tô viên\n=7\n',1,1,0,6,1,'http://127.0.0.1:8000/database/download_converted/converted_1293%20Q%C4%90-HVM_0001.pdf','http://127.0.0.1:8000/database/download_original/1293%20Q%C4%90-HVM_0001.pdf'),(13,'phieu_trinh_van_ban_di.docx','docx__1732698870175','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,7,1,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(14,'CV yêu cầu cập nhật mã CCCD.pdf','application/octet-stream','pdfdata\\CV yêu cầu cập nhật mã CCCD.pdf','','',1,0,0,7,0,NULL,'http://127.0.0.1:8000/database/download_original/CV%20y%C3%AAu%20c%E1%BA%A7u%20c%E1%BA%ADp%20nh%E1%BA%ADt%20m%C3%A3%20CCCD.pdf'),(15,'KH tổ chức hiến máu tháng 12.pdf','application/octet-stream','pdfdata\\KH tổ chức hiến máu tháng 12.pdf','','',1,0,0,8,1,NULL,'http://127.0.0.1:8000/database/download_original/KH%20t%E1%BB%95%20ch%E1%BB%A9c%20hi%E1%BA%BFn%20m%C3%A1u%20th%C3%A1ng%2012.pdf'),(16,'phieu_trinh_van_ban_di.docx','docx__1732265573925','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,8,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(17,'1155 QĐ-HVM_0001.pdf','application/pdf','pdfdata\\1155 QĐ-HVM_0001.pdf','','',1,0,0,9,1,NULL,'http://127.0.0.1:8000/database/download_original/1155%20Q%C4%90-HVM_0001.pdf'),(18,'1036 TB-HVM_0001.pdf','application/pdf','pdfdata\\1036 TB-HVM_0001.pdf','','',1,0,0,10,1,NULL,'http://127.0.0.1:8000/database/download_original/1036%20TB-HVM_0001.pdf'),(19,'1204 KH-HVM_0001.pdf','application/pdf','pdfdata\\1204 KH-HVM_0001.pdf','','',1,0,0,11,1,NULL,'http://127.0.0.1:8000/database/download_original/1204%20KH-HVM_0001.pdf'),(20,'QD 1067.pdf','application/pdf','pdfdata\\QD 1067.pdf','','',1,0,0,12,1,NULL,'http://127.0.0.1:8000/database/download_original/QD%201067.pdf'),(21,'Quy trinh Khao sat y kien nguoi hoc sap tot nghiep.pdf','application/pdf','pdfdata\\Quy trinh Khao sat y kien nguoi hoc sap tot nghiep.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20Khao%20sat%20y%20kien%20nguoi%20hoc%20sap%20tot%20nghiep.pdf'),(22,'Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 thang.pdf','application/pdf','pdfdata\\Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 thang.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20khao%20sat%20tinh%20hinh%20viec%20lam%20cua%20nguoi%20hoc%20sau%20tot%20nghiep%201%20thang.pdf'),(23,'Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 nam.pdf','application/pdf','pdfdata\\Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 nam.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20khao%20sat%20tinh%20hinh%20viec%20lam%20cua%20nguoi%20hoc%20sau%20tot%20nghiep%201%20nam.pdf'),(24,'Quy trinh khao sat y kien cuu nguoi hoc.pdf','application/pdf','pdfdata\\Quy trinh khao sat y kien cuu nguoi hoc.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20khao%20sat%20y%20kien%20cuu%20nguoi%20hoc.pdf'),(25,'Quy trinh khao sat y kien nha tuyen dung ve chat luong dao tao cua Hoc vien.pdf','application/pdf','pdfdata\\Quy trinh khao sat y kien nha tuyen dung ve chat luong dao tao cua Hoc vien.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20khao%20sat%20y%20kien%20nha%20tuyen%20dung%20ve%20chat%20luong%20dao%20tao%20cua%20Hoc%20vien.pdf'),(26,'Quy trinh khao sat y kien can bo giang vien ve cac mat hoat dong cua Hoc vien.pdf','application/pdf','pdfdata\\Quy trinh khao sat y kien can bo giang vien ve cac mat hoat dong cua Hoc vien.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20khao%20sat%20y%20kien%20can%20bo%20giang%20vien%20ve%20cac%20mat%20hoat%20dong%20cua%20Hoc%20vien.pdf'),(27,'Quy trinh kiem tra, giam sat dam bao chat luong dao tao.pdf','application/pdf','pdfdata\\Quy trinh kiem tra, giam sat dam bao chat luong dao tao.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20kiem%20tra%2C%20giam%20sat%20dam%20bao%20chat%20luong%20dao%20tao.pdf'),(28,'Quy trinh cham thi ket thuc hoc phan.pdf','application/pdf','pdfdata\\Quy trinh cham thi ket thuc hoc phan.pdf','','',1,0,0,12,0,NULL,'http://127.0.0.1:8000/database/download_original/Quy%20trinh%20cham%20thi%20ket%20thuc%20hoc%20phan.pdf'),(29,'594 HVM-CTTC_0001.pdf','application/pdf','pdfdata\\594 HVM-CTTC_0001.pdf','','',1,0,0,13,1,NULL,'http://127.0.0.1:8000/database/download_original/594%20HVM-CTTC_0001.pdf'),(30,'CÔNG VĂN THỰC HÀNH TIẾT KIỆM CHỐNG LÃNG PHÍ.pdf','application/octet-stream','pdfdata\\CÔNG VĂN THỰC HÀNH TIẾT KIỆM CHỐNG LÃNG PHÍ.pdf','','',1,0,0,14,1,NULL,'http://127.0.0.1:8000/database/download_original/C%C3%94NG%20V%C4%82N%20TH%E1%BB%B0C%20H%C3%80NH%20TI%E1%BA%BET%20KI%E1%BB%86M%20CH%E1%BB%90NG%20L%C3%83NG%20PH%C3%8D.pdf'),(31,'KH Triển khai thực hiện Chỉ thị số 27 ngày 25122023 về tăng cường sự lãnh đạo caủa Đảng đối với công tác TH TK, CLP.pdf','application/pdf','pdfdata\\KH Triển khai thực hiện Chỉ thị số 27 ngày 25122023 về tăng cường sự lãnh đạo caủa Đảng đối với công tác TH TK, CLP.pdf','','',1,0,0,14,0,NULL,'http://127.0.0.1:8000/database/download_original/KH%20Tri%C3%AA%CC%89n%20khai%20th%C6%B0%CC%A3c%20hi%C3%AA%CC%A3n%20Chi%CC%89%20thi%CC%A3%20s%C3%B4%CC%81%2027%20nga%CC%80y%2025122023%20v%C3%AA%CC%80%20t%C4%83ng%20c%C6%B0%C6%A1%CC%80ng%20s%C6%B0%CC%A3%20la%CC%83nh%20%C4%91a%CC%A3o%20cau%CC%89a%20%C4%90a%CC%89ng%20%C4%91%C3%B4%CC%81i%20v%C6%A1%CC%81i%20c%C3%B4ng%20ta%CC%81c%20TH%20TK%2C%20CLP.pdf'),(32,'phieu_trinh_van_ban_di.docx','docx__1731312080188','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,14,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(33,'05 TB-KHCN_0001.pdf','application/pdf','pdfdata\\05 TB-KHCN_0001.pdf','','',1,0,0,15,1,NULL,'http://127.0.0.1:8000/database/download_original/05%20TB-KHCN_0001.pdf'),(34,'KẾ HOẠCH BÁO TƯỜNG 20.11.pdf','application/octet-stream','pdfdata\\KẾ HOẠCH BÁO TƯỜNG 20.11.pdf','','',1,0,0,16,1,NULL,'http://127.0.0.1:8000/database/download_original/K%E1%BA%BE%20HO%E1%BA%A0CH%20B%C3%81O%20T%C6%AF%E1%BB%9CNG%2020.11.pdf'),(35,'phieu_trinh_van_ban_di.docx','docx__1730973131259','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,16,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(36,'Kế hoạch VCRIS giai đoạn 2.pdf','application/octet-stream','pdfdata\\Kế hoạch VCRIS giai đoạn 2.pdf','','',1,0,0,17,1,NULL,'http://127.0.0.1:8000/database/download_original/K%E1%BA%BF%20ho%E1%BA%A1ch%20VCRIS%20giai%20%C4%91o%E1%BA%A1n%202.pdf'),(37,'phieu_trinh_van_ban_di.docx','docx__1731042674084','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,17,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(38,'1056 KH-HVM_0001.pdf','application/pdf','pdfdata\\1056 KH-HVM_0001.pdf','','',1,0,0,18,1,NULL,'http://127.0.0.1:8000/database/download_original/1056%20KH-HVM_0001.pdf'),(39,'Kế hoạch 20-11-2024.pdf','application/octet-stream','pdfdata\\Kế hoạch 20-11-2024.pdf','','',1,0,0,19,1,NULL,'http://127.0.0.1:8000/database/download_original/K%E1%BA%BF%20ho%E1%BA%A1ch%2020-11-2024.pdf'),(40,'Phụ lục I.pdf','application/octet-stream','pdfdata\\Phụ lục I.pdf','','',1,0,0,19,0,NULL,'http://127.0.0.1:8000/database/download_original/Ph%E1%BB%A5%20l%E1%BB%A5c%20I.pdf'),(41,'Phụ lục II.pdf','application/octet-stream','pdfdata\\Phụ lục II.pdf','','',1,0,0,19,0,NULL,'http://127.0.0.1:8000/database/download_original/Ph%E1%BB%A5%20l%E1%BB%A5c%20II.pdf'),(42,'Phụ lục III.pdf','application/octet-stream','pdfdata\\Phụ lục III.pdf','','',1,0,0,19,0,NULL,'http://127.0.0.1:8000/database/download_original/Ph%E1%BB%A5%20l%E1%BB%A5c%20III.pdf'),(43,'Phụ lục IV.pdf','application/octet-stream','pdfdata\\Phụ lục IV.pdf','','',1,0,0,19,0,NULL,'http://127.0.0.1:8000/database/download_original/Ph%E1%BB%A5%20l%E1%BB%A5c%20IV.pdf'),(44,'Phụ lục V.pdf','application/octet-stream','pdfdata\\Phụ lục V.pdf','','',1,0,0,19,0,NULL,'http://127.0.0.1:8000/database/download_original/Ph%E1%BB%A5%20l%E1%BB%A5c%20V.pdf'),(45,'phieu_trinh_van_ban_di.docx','docx__1730887344769','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,19,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx'),(46,'VBNB.HC_0001.pdf','application/pdf','pdfdata\\VBNB.HC_0001.pdf','','',1,0,0,20,1,NULL,'http://127.0.0.1:8000/database/download_original/VBNB.HC_0001.pdf'),(47,'Ke hoach TK nam 2024.pdf','application/octet-stream','pdfdata\\Ke hoach TK nam 2024.pdf','','',1,0,0,21,1,NULL,'http://127.0.0.1:8000/database/download_original/Ke%20hoach%20TK%20nam%202024.pdf'),(48,'phieu_trinh_van_ban_di.docx','docx__1730861990887','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,21,0,NULL,'http://127.0.0.1:8000/database/download_original/phieu_trinh_van_ban_di.docx');
/*!40000 ALTER TABLE `database_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_dieukientai`
--

DROP TABLE IF EXISTS `database_dieukientai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `database_dieukientai` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ngay_bat_dau` bigint DEFAULT NULL,
  `ngay_ket_thuc` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_dieukientai`
--

LOCK TABLES `database_dieukientai` WRITE;
/*!40000 ALTER TABLE `database_dieukientai` DISABLE KEYS */;
INSERT INTO `database_dieukientai` VALUES (2,1730394000000,1732899600000);
/*!40000 ALTER TABLE `database_dieukientai` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_vanban`
--

LOCK TABLES `database_vanban` WRITE;
/*!40000 ALTER TABLE `database_vanban` DISABLE KEYS */;
INSERT INTO `database_vanban` VALUES (1,1732838400000,44186,'636HVM-KTĐBCL','Công văn','Triệu Thị Yến','V/v  báo cáo công tác ĐBCL năm 2024','Phòng Khảo thí và Đảm bảo chất lượng đào tạo','Sổ Công văn đi','Thường','Thường','Nguyễn Duy Phương - Phòng Khảo thí và Đảm bảo chất lượng đào tạo',2,1,1732813200000),(2,1732838400000,44143,'635/HVM-CTTC','Công văn','Trịnh Duy Hải','V/v thực hiện  xét đề nghị  thăng quân và nâng lương năm 2025','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Thường','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',2,1,1732813200000),(3,1732838400000,44085,'1311/TB-HVM','Thông báo','Triệu Thị Yến',' Thông báo Kết quả lấy ý kiến phản hồi về CTĐT và CSVC phục vụ đào tạo','Phòng Khảo thí và Đảm bảo chất lượng đào tạo','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Nguyễn Duy Phương - Phòng Khảo thí và Đảm bảo chất lượng đào tạo',3,1,1732726800000),(4,1732752000000,44023,'1308/KH-HVM','Kế hoạch','Phạm Trọng Công','KH tổ chức Hội nghị giao ban công tác quản lý học viên năm 2024\n','Hệ Quản lý học viên và sinh viên','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Nguyễn Tân Đăng - Học viện Kỹ thuật mật mã',2,1,1732726800000),(5,1732838400000,43986,'1313/QĐ-HVM','Quyết định','Nguyễn Thị Mai Chinh','QĐ Thành lập hội đồng nghiệm thu ngân hàng câu hỏi thi','Phòng Khảo thí và Đảm bảo chất lượng đào tạo','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Nguyễn Hiếu Minh - Học viện Kỹ thuật mật mã',2,1,1732813200000),(6,1732665600000,43951,'1293/QĐ-HVM','Quyết định','Nguyễn Thị Thùy','QĐ thành lập Tổ chuyên gia tham mưu và thực hiện nhiệm vụ phát triển nguồn nhân lực đào tạo và nghiên cứu Thiết kế vi mạch ','Khoa Điện tử - Viễn thông','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Nguyễn Hiếu Minh - Học viện Kỹ thuật mật mã',1,1,1732640400000),(7,1732665600000,43931,'627/HVM-CTTC','Công văn','Đinh Hoài Thương','V/v triển khai thực hiện BHYT năm 2025 đối với CBNV, học viên Cơ yếu và nhân thân ','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Hỏa tốc','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',2,1,1732640400000),(8,1732233600000,43601,'1264/KH-HVM','Kế hoạch','Trịnh Duy Hải','KH tổ chức ngày hội hiến máu tình nguyện\"Trái tim mật mã XII\"','Phòng Chính trị - Tổ chức','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Nguyễn Tân Đăng - Học viện Kỹ thuật mật mã',2,1,1732208400000),(9,1731974400000,43216,'1155/QĐ-HVM','Quyết định','Nguyễn Thị Thùy','QĐ vv khen thưởng tổng kết công tác năm 2024','Phòng Chính trị - Tổ chức','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',1,1,1731949200000),(10,1731888000000,43112,'1036/TB-HVM','Thông báo','Nguyễn Thị Thùy','TB vv thực hiện cuộc vận động ủng hộ Tháng cao điểm \"Vì người nghèo\" năm 2024','Phòng Chính trị - Tổ chức','Sổ QĐ, BC, KH, TTr..','Thường','Hỏa tốc','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',1,1,1731862800000),(11,1731542400000,42942,'1204/KH-HVM','Kế hoạch','Nguyễn Thị Thùy','KH tổ chức triển khai thực hiện đồ án tốt nghiệp cho sinh viên đại học chính quy, ngành Công nghệ thông tin (CT5)\n','Phòng Đào tạo','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Lương Thế Dũng - Học viện Kỹ thuật mật mã',1,1,1731517200000),(12,1729728000000,42756,'1067/QĐ-HVM','Quyết định','Nguyễn Thị Thùy','Quyết định phê duyệt 08 quy trình triển khai, phối hợp giải quyết công việc của các cơ quan, đơn vị thuộc Học viện Kỹ thuật mật mã theo Kế hoạch số 1078/KH-BCY ngày 14/12/2022','Phòng Hành chính','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',9,1,1731430800000),(13,1731283200000,42498,'594/HVM-CTTC','Công văn','Nguyễn Thị Thùy','V/v triển khai hồ sơ đăng ký thuê nhà ở công vụ trong BCYCP','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Thường','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',1,1,1731258000000),(14,1731283200000,42469,'595/HVM-CTTC','Công văn','Nguyễn Việt Hưng','V/v Sao gửi kế hoạch 980/KH-BCY về  triển khai thực hiện chỉ thị số 27-CT/TW của Bộ Chính trị ','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Thường','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',3,1,1731258000000),(15,1731024000000,42455,'5/TB-KHCN','Thông báo','Nguyễn Thị Thùy','TB vv phân công nhiệm vụ Lãnh đạo Phòng Khoa học công nghệ và Hợp tác phát triển ','Phòng Khoa học Công nghệ và hợp tác phát triển','Sổ Văn bản nội bộ','Thường','Thường','Vũ Thị Đào - Phòng Khoa học Công nghệ và hợp tác phát triển',1,1,1730998800000),(16,1730937600000,42336,'1167/KH-HVM','Kế hoạch','Trịnh Duy Hải','KH tổ chức cuộc thi báo tường chào mừng kỷ niệm 42 năm ngày Nhà giáo Việt Nam (20/11/1982 - 20/11/2024)','Phòng Chính trị - Tổ chức','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Nguyễn Tân Đăng - Học viện Kỹ thuật mật mã',2,1,1730912400000),(17,1731024000000,42335,'1173/KH-HVM','Kế hoạch','Trần Thị Hoa','KH tổ chức Hội thảo khoa học quốc tế lần I về Mật mã và An toàn thông tin The 1st IEE International Conference on Cryptography and Information Securty - VCRIS 2024 (Giai đoạn 2)','Phòng Khoa học Công nghệ và hợp tác phát triển','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',2,1,1730912400000),(18,1730937600000,42288,'1056/KH-HVM','Kế hoạch','Nguyễn Thị Thùy','Kế hoạch tổ chức Tọa đàm hướng nghiệp và Trao bằng khen thưởng cho các sinh viên đạt thành tích cao trong các cuộc thi năm 2024','Khoa An toàn thông tin','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Lương Thế Dũng - Học viện Kỹ thuật mật mã',1,1,1730912400000),(19,1730937600000,42153,'1162/KH-HVM','Kế hoạch','Nguyễn Việt Hưng','KH tổ chức Lễ kỷ niệm 42 năm ngày Nhà giáo Việt Nam 20/11/1982 - 20/11/2024 và 20 năm đào tạo ATTT của HVKTMM (2004 - 2024)','Phòng Chính trị - Tổ chức','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',7,1,1730826000000),(20,1730851200000,42133,'11/TB-HC','Thông báo','Nguyễn Thị Thùy','Thông báo về việc phân công nhiệm vụ lãnh đạo Phòng Hành chính','Phòng Hành chính','Sổ Văn bản nội bộ','Thường','Thường','Đào Hồng Nam - Phòng Hành chính',1,1,1730826000000),(21,1730851200000,42084,'1158/KH-HVM','Kế hoạch','Đào Hồng Nam','KH Tổ chức Hội nghị tổng kết công tác năm 2024 của Học viện Kỹ thuật mật mã','Phòng Hành chính','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',2,1,1730739600000);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(6,'app','dulieu'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(15,'database','data'),(16,'database','dieukientai'),(14,'database','vanban'),(17,'nguoi_dung','file'),(9,'oauth2_provider','accesstoken'),(8,'oauth2_provider','application'),(10,'oauth2_provider','grant'),(12,'oauth2_provider','idtoken'),(11,'oauth2_provider','refreshtoken'),(7,'pdf_convert','pdffile'),(5,'sessions','session'),(13,'user','user');
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-12-03 03:06:59.959384'),(2,'contenttypes','0002_remove_content_type_name','2024-12-03 03:07:02.088259'),(3,'auth','0001_initial','2024-12-03 03:07:05.619548'),(4,'auth','0002_alter_permission_name_max_length','2024-12-03 03:07:06.286899'),(5,'auth','0003_alter_user_email_max_length','2024-12-03 03:07:06.329464'),(6,'auth','0004_alter_user_username_opts','2024-12-03 03:07:06.379168'),(7,'auth','0005_alter_user_last_login_null','2024-12-03 03:07:06.450105'),(8,'auth','0006_require_contenttypes_0002','2024-12-03 03:07:06.509473'),(9,'auth','0007_alter_validators_add_error_messages','2024-12-03 03:07:06.562137'),(10,'auth','0008_alter_user_username_max_length','2024-12-03 03:07:06.619988'),(11,'auth','0009_alter_user_last_name_max_length','2024-12-03 03:07:06.686824'),(12,'auth','0010_alter_group_name_max_length','2024-12-03 03:07:06.857613'),(13,'auth','0011_update_proxy_permissions','2024-12-03 03:07:06.939704'),(14,'auth','0012_alter_user_first_name_max_length','2024-12-03 03:07:07.216275'),(15,'user','0001_initial','2024-12-03 03:07:12.311433'),(16,'admin','0001_initial','2024-12-03 03:07:14.770726'),(17,'admin','0002_logentry_remove_auto_add','2024-12-03 03:07:14.815297'),(18,'admin','0003_logentry_add_action_flag_choices','2024-12-03 03:07:14.888616'),(19,'app','0001_initial','2024-12-03 03:07:15.295143'),(20,'database','0001_initial','2024-12-03 03:07:16.713382'),(21,'database','0002_alter_data_original_file','2024-12-03 03:07:17.312863'),(22,'database','0003_data_data_chinh_vanban_ngay_tao','2024-12-03 03:07:17.973313'),(23,'database','0004_alter_data_converted_file_alter_data_original_file','2024-12-03 03:07:18.289172'),(24,'database','0005_dieukientai','2024-12-03 03:07:18.562281'),(25,'database','0006_data_download_converted_file_and_more','2024-12-03 03:07:18.956588'),(26,'database','0007_alter_data_download_converted_file_and_more','2024-12-03 03:07:19.231448'),(27,'nguoi_dung','0001_initial','2024-12-03 03:07:19.570585'),(28,'nguoi_dung','0002_alter_file_converted_doc_alter_file_converted_pdf_and_more','2024-12-03 03:07:19.628307'),(29,'nguoi_dung','0003_alter_file_name','2024-12-03 03:07:20.281805'),(30,'oauth2_provider','0001_initial','2024-12-03 03:07:31.999287'),(31,'oauth2_provider','0002_auto_20190406_1805','2024-12-03 03:07:33.644339'),(32,'oauth2_provider','0003_auto_20201211_1314','2024-12-03 03:07:34.921055'),(33,'oauth2_provider','0004_auto_20200902_2022','2024-12-03 03:07:40.138478'),(34,'oauth2_provider','0005_auto_20211222_2352','2024-12-03 03:07:40.325999'),(35,'oauth2_provider','0006_alter_application_client_secret','2024-12-03 03:07:40.528420'),(36,'oauth2_provider','0007_application_post_logout_redirect_uris','2024-12-03 03:07:40.848075'),(37,'oauth2_provider','0008_alter_accesstoken_token','2024-12-03 03:07:40.901973'),(38,'oauth2_provider','0009_add_hash_client_secret','2024-12-03 03:07:41.688019'),(39,'oauth2_provider','0010_application_allowed_origins','2024-12-03 03:07:41.888365'),(40,'oauth2_provider','0011_refreshtoken_token_family','2024-12-03 03:07:42.270844'),(41,'oauth2_provider','0012_add_token_checksum','2024-12-03 03:07:46.214515'),(42,'pdf_convert','0001_initial','2024-12-03 03:07:46.840289'),(43,'pdf_convert','0002_pdffile_text_content','2024-12-03 03:07:47.146731'),(44,'sessions','0001_initial','2024-12-03 03:07:47.986574');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung_file`
--

DROP TABLE IF EXISTS `nguoi_dung_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `preview_file` varchar(512) DEFAULT NULL,
  `original_file` varchar(512) DEFAULT NULL,
  `converted_pdf` varchar(512) DEFAULT NULL,
  `converted_doc` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung_file`
--

LOCK TABLES `nguoi_dung_file` WRITE;
/*!40000 ALTER TABLE `nguoi_dung_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `nguoi_dung_file` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
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

-- Dump completed on 2024-12-03 11:43:14
