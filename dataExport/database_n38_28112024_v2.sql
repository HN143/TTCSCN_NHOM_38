-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: database_n38
-- ------------------------------------------------------
-- Server version	8.0.37

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_data`
--

LOCK TABLES `database_data` WRITE;
/*!40000 ALTER TABLE `database_data` DISABLE KEYS */;
INSERT INTO `database_data` VALUES (36,'1204 KH-HVM_0001.pdf','application/pdf','pdfdata\\1204 KH-HVM_0001.pdf','pdfconvert/converted_1204 KH-HVM_0001.pdf','BAN CƠ YẾU CHÍNH  PHỦ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập- Tự do- Hạnh phúc\nSố: 407 /KH-HVM Hà Nội, ngày-|“tháng  11 năm 2024\nKẺ HOẠCH\nTổ chức triển khai thực hiện đồ án tốt nghiệp cho sinh viên\nđại học chính quy, ngành Công nghệ thông tin (CT5)\nCăn cứ Văn bản hợp nhất số 17/VBHN-BGDĐT  ngày 15 tháng 5 năm 2014 của\nBộ trưởng Bộ Giáo dục và Đào tạo ban hành Quy chế đào tạo đại học và cao đẳng hệ\nchính quy theo hệ thống tín chỉ;\nCăn cứ Thông báo số 119/QĐ-HVM  ngày 24 tháng 01 năm 2019 của Giám đốc\nHọc viện Kỹ thuật mật mã ban hành Quy định về việc thực hiện chỉ tiết một số điểm\ntrong “Quy chế đào tạo đại học chính quy theo theo học chế tín chỉ”;\nCăn cứ Kế hoạch số 397/KH-HVM  ngày 15 tháng 5 năm 2024 của Học viện Kỹ\nthuật mật mã ban hành kế hoạch đào tạo năm học 2024-2025;\nKế hoạch triển khai thực hiện đồ án tốt nghiệp cho sinh viên đại học chính quy\nngành Công nghệ thông tin (CT5) như sau:\nI.MỤC  ĐÍCH,  YÊU CÀU\n1. Mục đích\n- Tạo cơ hội cho sinh viên tổng hợp kiến thức đã học một cách hệ thống và toàn\ndiện về ngành, chuyên  ngành.\n- Bồi dưỡng phương pháp tư duy khoa học và khả năng vận dụng lý thuyết vào\nthực tiễn.\n- Rèn luyện tính độc lập, tự chủ và tính thần trách nhiệm, phát huy năng lực sáng\ntạo trong học tập và nghiên  cứu của sinh viên.\n- Đánh giá khách quan, chính xác, toàn diện nhiều mặt kết quả rèn luyện, học tập\ncủa mỗi sinh viên.\n- Có thêm cơ sở để tổng kết, đánh giá, rút kinh nghiệm, nghiên cứu điều chỉnh,\nbổ sung nội dung chương  trình, giáo. trình, phương  pháp giảng dạy, học tập và công tác\nquản lý, điều hành cho phù hợp nhằm không ngừng nâng cao chất lượng đào tạo của\nHọc viện, đáp ứng tốt nhất yêu cầu thực tế.\n2. Yêu cầu\n- Nội dung đồ án phải đúng với chuyên ngành đào tạo, có giá trị khoa học và\nthực tiễn, có thể hoàn thành đồ án trong điều kiện và thời gian quy định. Không trùng\nlặp giữa các đề tài.\n- Sinh viên chỉ được chính thức nhận và thực hiện đồ án tốt nghiệp sau khi\nxây dựng được đề cương chỉ tiết đề tài tốt nghiệp và được thông qua Hội đồng xét\nduyệt của Khoa chuyên  ngành.\n2\n- Hình thức trình bày đồ án theo đúng quy cách của Học viện.\n- Tổ chức giao và triển khai thực hiện đồ án tốt nghiệp một cách chặt chẽ, đúng\nkế hoạch, được chuẩn bị chu đáo, giám sát và đánh giá đúng ý thức và năng lực học tập\ncủa sinh viên, tạo điều kiện thuận lợi cho sinh viên thực hiện và bảo vệ đồ án đạt kết\nquả tốt nhất.\nII. NỘI DUNG KẾ HOẠCH\nThời gian Nội dung Đơn vị thực hiện\nĐề xuất và xét duyệt đề tài tốt nghiệp.\nGhỉ chú:\n- Sinh viên được phép phát triển đề tài\nnghiên cứu khoa học thành đề tài tốt\nnghiệp hoặc sinh viên có thể tự đề\nxuất đề tài tốt nghiệp. Khoa CNTT\n- Sinh viên có đề tài và cán bộ hướng\ndẫn ngoài Học viện phải gửi tên đề\ntài, họ tên và học hàm học vị của cắn\nbộ hướng dẫn về Khoa trước ngày\n02/12/2024.13/11/2024-02/12/2024\nXét và lập danh sách sinh viên được\nlàm đồ án tốt nghiệp.\nGhỉ chú\n(Ù Sinh viên thoả mãn các điều sau\nthì được làm đồ án tốt nghiệp:\n- Đủ điều kiện làm đồ án theo quy\nđịnh và là sinh viên khoá 5 (CT5).\n- Tính theo trung bình tích luỹ, lấy từ\ncao xuống thấp (số lượng cụ thể được\nHọc viện quyết dựa trên điều kiện\nthực tế hàng năm). Ưu tiên những sinh\nviên đã tham gia nghiên  cứu khoa học.\n21/11/2024-22/11/2024  | - Tính đến thời điểm đăng ký nhận đồ\nán tốt nghiệp, sinh viên không bị kỷ\nluật từ mức cảnh cáo trở lên.\n(2) Sinh viên khoá 5 (CT5) còn lại và\nsinh viên khoá 4 (CT4) trở về trước,\nhọc các học phần bồ sung với tổng\nkhối lượng 8 tín chỉ và thi tốt nghiệp\n(Nếu SV đủ điều kiện đăng ký học bố\nsung và thỉ tốt nghiệp).\n(3) Sinh viên đủ điều kiện nhận đồ án\nnhưng có nguyện vọng thi tốt nghiệp\nthì làm đơn xin chuyển sang thi tốt\nnghiệp.- Phòng  Đào tạo\n- Hệ QLSV\n3\nThời gian Nội dung Đơn vị thực hiện\nhong lu ø\'loa laa GHẾ - Phòng  Đào tạo\n23/11/2024-25/11/2024  | Sỉnh viên đăng ký học học phân (trực Í_ ra OLSVtuyên trên hệ thông quản lý đào tạo). \"..\n- Sinh viên\nSinh viên đóng học phí học phần đồ | viền26/11/2024-01/12/2024  | Sịnh viên đóng học phí học phân đồ | _ phạnz KH-TC\nán tôt nghiệp R\n- Hệ QLSV\nTông hợp sinh viên đủ điêu kiện được\ngiao-nhận  tỘ ¬ tôt gi  Luu ka - Phòng Đào tạo\n02/12/2024-03/12/2024  | tong danh sách được làm đồ án; đã |_ phòng KH_TCđăng ký học phân trên hệ thông quản Hệ OLSV\nlý đào tạo và đóng học phí học phần | ˆ ẹQ\nđầy đủ)\n- Sinh viên đăng ký nhận đê tài tốt\nnghiệp với Khoa (chỉ những sinh viên\nnằm trong danh sách Phòng Đào tạo Í _ e¡ h viên\n04/12/2024-05/12/2024  | gửi Ới ă ý nhận đồ nn Khoa mới cho đăng ký nhận đô - Khoa CNTT\n- Hướng dẫn sinh viên xây dựng đề\ncương chỉ tiết đề tài tốt nghiệp.\nTổng hợp danh sách sinh viên, tên đề | - Phòng Đào tạo\n06/12/2024-09/12/2024  TINH ASẻ: HếN tài tôt nghiệp và cán bộ hướng dân. - Khoa CNTT\nSinh viên nộp đề cương chỉ tiết (có |-KhoaCNIT -\n27/12/2024 chữ ký xác nhận của cán bộ hướng  | - Cán bộ hướng dân\ndẫn chính) về Khoa để xét duyệt. - Sinh viên\n- Tổ chức xem xét, thông qua để |_ Khoa CNTT\ncương chỉ tiết của sinh viên. ` `\n02/01/2025-03/01/ : › |~ Phòng Đào t/2025-03/01/2025 Ì_ Tảng hợp danh sách sinh viên có đề | ˆ ` \"nã 9 59 146\ncương chỉ tiết được thông qua.\nRa Quyết định giao đồ án tốt nghiệp | - Ban Giám đốc\n1/20ĐI HE óP cho sinh viên - Phòng Đào tạo\n13/01/2025-09/03/2025  | TÍ9€ theo TKB, Nghỉ ải, Thực tập tôi\nnghiệp.\n10/3/2025-25/5/2024  | Thực hiện đồ án tôt nghiệp theo để | _ sình viên\ncương  chỉ tiêt được phê duyệt.\n20/3/2025-21/3/2025_  | Báo cáo tiến độ đồ án (lần 1)\n10/4/2025-11/4/2025  _ | Báo cáo tiến độ đồ án (lần 2) K2\n- R = - Cán bộ hướng  dân\n01/5/2025-02/5/2025  | Báo cáo tiên độ đô án (lân 3) - Sinh viên\n15/5/2025-16/5/2025 Báo cáo tiến độ đồ án (lần 4)\n4\nThời gian Nội dung Đơn vị thực hiện\n^ Ậ À z ` h PS ^^ - Kh CNTT26/5/2025 ếp Huyền đó án và sản phâm nghiên : 0a\ncứu (nêu có) vê Khoa. - Sinh viên\n- Lập danh sách sinh viên có đồ án đủ\nđiều kiện chấm phản biện (được cán\nbộ hướng dẫn đồ án đề nghị cho bảo\n27/5/2025-29/5/2025  | vệ; nộp quyển đồ án và sản phẩm | Khoa CNTT\nhoàn chỉnh về Khoa đúng hạn).\n- Đề xuất Hội đồng chấm đồ án tốt\nnghiệp.\nRa Quyết định thành lập Hội đồng - Ban Giám đốc\n30/5/2025 KG ¿ V Wchâm đô án tôt nghiệp - Phòng  Đào tạo\nTả ‹ SA Ấ z ^ Ậ - Khoa CNTT31/5/2025-02/6/2025  bà đô ăn tôt nghiệp đên cán bộ châm oa :\nphản biện - Sinh viên\n03/6/2025-10/6/2025- Chấm phản biện.\n- Cán bộ chấm phản biện viết Phiếu\nnhận xét đồ án của sinh viên, kết luận\nghi rõ đồng ý hay không đồng ý cho- Cán bộ chấm phản\nbiện (Theo Quyết\nđịnh thành lập Hộ\nHi rõ đồng ÿ hay Không đồng ÿ ©h9 | đồng chấm ĐATN)\nBS viên bảo vệ trước Hội đông, rồi | _ Khoa CNTT\ngửi cho Khoa.\n- Lập danh sách sinh viên không được - Khoa CNTT\n11/6/2025 bảo vệ trước Hội đông châm đô án, „IEhðng  Eløtan\ngửi cho Phòng  Đào tạo. |\n- Hội đồng chấm\n14/6/2025-15/6/2025  | Bảo vệ đồ án tốt nghiệp ĐATN\n- Sinh viên\n- Sinh viên báo cáo kết quả chấm đồ\nán, ý kiến của Hội đồng chấm đồ án\n(bao gồm ý kiến của cán bộ phản biện\nđồ án) với cán bộ hướng dẫn đồ án. | - KhoaCNTT\nTrước ngày 30/6/2025  _ | - Sinh viên chỉnh sửa, hoàn thiện đồ án | - Cán bộ hướng dẫn\ntheo ý kiến của Hội đồng chấm đồ án. | - Sinh viên\nLập phiếu giải trình việc chỉnh sửa đồ\nán (theo mẫu) và xin xác nhận của cán\nbộ hướng dẫn.\nNộp quyển đồ án bìa cứng kèm theo | ” Khoa CNTT\n30/6/2025 Phiếu giải trình việc chỉnh sửa có xác | - Thư ký các Hội\nnhận của cán bộ hướng dẫn cho Thư | đông châm ĐATN\nký hội đồng chấm đồ án tốt nghiệp. - Sinh viên\nHI. TỎ CHỨC  THỰC  HIỆN\n1. Khoa Công nghệ thông tin\n- Đề xuất số lượng sinh viên thực hiện làm đồ án tốt nghiệp dựa trên điều kiện\nthực tế của khoa. Đề xuất đủ số lượng để tài, phân công cán bộ hướng dẫn: cho sinh\nviên đăng ký nhận đề tài đồ án tốt nghiệp; hướng dẫn sinh viên xây dựng đề cương chỉ\ntiết đề tài tốt nghiệp và tổ chức xét duyệt thông qua. Trực tiếp báo cáo với Phó Giám\nđốc phụ trách đào tạo về kết quả xét duyệt đề tài, chất lượng các đề tài và dự kiến phân\ncông cán bộ giảng viên hướng dẫn các đề tài.\n- Gửi về Phòng Đào tạo: danh sách tổng hợp sinh viên, tên đề tài đăng ký và cán\nbộ hướng dẫn; danh sách sinh viên có đề cương chỉ tiết đã được thông qua; danh sách\nsinh viên có đồ án đủ điều kiện chấm phản biện kèm đề xuất hội đồng chấm đồ án tốt\nnghiệp; danh sách sinh viên không được bảo vệ đồ án trước Hội đồng chấm đồ án tốt\nnghiệp.\n- Quản lý, theo dõi, nhắc nhở giảng viên hướng dẫn sát sao với sinh viên, đôn đốc\nsinh viên thực hiện đồ án theo đúng kế hoạch. Tổ chức cho sinh viên báo cáo tiến độ đồ\nán của mình. Báo cáo quá trình thực hiện đồ án của sinh viên trước Hội đồng chấm đồ\nán tốt nghiệp.\n- Chủ trì hoặc phối hợp với đơn vị trong một số công tác tổ chức bảo vệ đồ án tốt\nnghiệp  cho sinh viên.\n2. Phòng  Đào tạo\n- Xét và lập danh sách sinh viên đủ điều kiện nhận đồ án tốt nghiệp.\n- Tổ chức cho sinh viên đăng ký làm đồ án tốt nghiệp trên hệ thống quản lý đào\ntạo của Học viện.\n- Hướng dẫn việc tổ chức thực hiện đồ án tốt nghiệp.\n~ Có trách nhiệm kiểm tra việc tổ chức thực hiện đồ án theo đúng kế hoạch.\n- Chủ trì và phối hợp với các đơn vị triển khai các Hội đồng chấm bảo vệ đồ án tốt\nnghiệp.\n3. Phòng Kế hoạch - Tài chính\n- Rà soát lại nghĩa vụ đóng học phí của sinh viên theo đúng kế hoạch, phối hợp\nvới Phòng Đào tạo tổng hợp danh sách sinh viên được giao - nhận đồ án tốt nghiệp.\n- Đảm bảo kinh phí tài chính thực hiện kế hoạch theo chế độ hiện hành. Hướng\ndẫn thủ tục thanh quyết toán.\n4. Trung  tâm Thông  tin - Thư viện\n- Có trách nhiệm cho sinh viên mượn, trả tài liệu phục vụ việc làm đồ án tốt\nnghiệp  theo quy định của Học viện.\n- Đưa kế hoạch và các văn bản liên quan đến việc triển khai, thực hiện đồ án tốt\nnghiệp lên trang thông tin của Học viện.\n6\n5. Hệ Quản lý Học viên và Sinh viên\n- Phối hợp với phòng Đào tạo rà soát, lập danh sách sinh viên đủ điều kiện nhận\nđồ án tốt nghiệp.\n- Phối hợp với Phòng Đào tạo và Phòng Kế hoạch - Tài chính kiểm tra lại các thủ\ntục, nghĩa vụ sinh viên phải thực hiện trước khi ra Quyết định giao đồ án.\n- Đôn đốc, nhắc nhở sinh viên làm đồ án tốt nghiệp theo đúng kế hoạch Học viện\nban hành.\n- Phối hợp với Phòng Đào tạo, khoa chuyên ngành và các đơn vị khác trong các\ncông tác tổ chức bảo vệ đồ án tốt nghiệp.\nkhai thực hiện./.\nNơi nhận: KT. GIÁM  ĐÓC\n- BGĐ (để báo cáo)”; PHÓ GIÁM  ĐÓC\n- Phòng  ĐT, KH-TC,  HC, KT&ÐBCLĐT,  TB-QT;\n- Khoa CNTT,  ATTT,  ĐTVT,  MM;\n- Viện NCƯD  KH&CN;\n- Trung  tâm TH;\n- Trung  tâm TT-TV;\n- Hệ QLHVSV;\n- Lưu: VT, ĐT. TN17.10Căn cứ 77 nề các cơ quan, đơn vị có liên quan chủ động phối hợp triển\n',1,1,0,21,1),(37,'QD 1067.pdf','application/pdf','pdfdata\\QD 1067.pdf','pdfconvert/converted_QD 1067.pdf','BAN CƠ YÊU CHÍNH  PHỦ CỘNG  HOÀ XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập —- Tự do - Hạnh phúc\nSố: 1067/QĐÐ-HVM Hà Nội, ngày 24 tháng 10 năm 2024\nQUYÉT  ĐỊNH\nPhê duyệt 08 quy trình triển khai, phối hợp giải quyết công việc\ncủa các cơ quan, đơn vị thuộc  Học viện Kỹ thuật mật mã\nTheo Kế hoạch số 1078/KH-BCY  ngày 14/12/2022  -\nGIÁM  ĐÓC HỌC VIỆN KỸ THUẬT  MẬT MÃ\nCăn cứ Thông tư số 54/2014/TT-BQP  ngày 12/6/2014  của Bộ trưởng  Bộ\nQuốc phòng về việc quy định chức năng, nhiệm vụ, quyên hạn và môi quan hệ\ncông tác của Học viện Kỹ thuật mật mã thuộc Ban Cơ yếu Chính  phủ và Quyết\nđịnh số 563/QĐ-BCY  ngày 02/12/2022  của Trưởng  ban Ban Cơ yếu Chính phủ\nquy định cơ cấu, tổ chức, biên chế của Học viện Kỹ thuật mật mã,\nCăn cứ Kế hoạch số 1078/KH-BCY  ngày 14/12/2022  của Trưởng  ban Ban\nCơ yếu Chính  phủ về việc xây dựng các Quy trình triển khai, phối hợp giải quyết\ncông việc của các cơ quan, ẩơn vị thuộc Ban Cơ yếu Chính  phủ;\nCăn cứ Quyết  định số 1336/QĐ-HVM  ngày 06/11/2023  của Giám đốc Học\nviện Kỹ thuật mật mã về việc Thành lập T: Ổ thẩm định các Quy trình triển khai,\nphối hợp giải quyết công việc của các cơ quan, đơn vị thuộc Học viện Kỹ thuật\nmật mã theo Kế hoạch số 1078/KH-BCY  ngày 14/12/2022;\nCăn cứ  ý kiến chỉ đạo của Lãnh đạo Ban tại Tờ trình số 482/TTr-CNTTGSM\nngày 08/10/2024  của Trung  tâm Công nghệ thông tin và Giám sát an ninh mạng.\nTheo đề nghị của Trưởng  phòng  Hành chính.\nQUYẾT  ĐỊNH:\nĐiều 1: Phê duyệt 08 quy trình triển khai, phối hợp giải quyết công việc\ncủa các cơ quan, đơn vị thuộc Học viện Kỹ thuật mật mã theo Kế hoạch số\n1078/KH-BCY  ngày 14/12/2022.\n(Có phụ lục danh sách và các quy trình kèm theo)\nĐiều 2: Quyết định này có hiệu lực thi hành kể từ ngày ký.\nĐiều 3: Trưởng  phòng Hành chính, các đơn vị và tô chức, cá nhân có liên\nquan chịu trách nhiệm thi hành Quyết định này-xy/⁄\nNơi nhận\n- Như Điều 3;\n- Đ/c Giám đốc HV (để b/c);\n- Các cơ quan, đơn vị thuộc Học viện;\n- Lưu: VT, HC. T24.  1u“\noàng Văn Thức\n2\ncPhụlục —\n§ QUY TRÌNH  CUA CÁC CƠ QUAN,  ĐƠN VỊ\nTT Tên quy trình Loại quY | Ghi chú\ntrình\n1 | Quy trình khảo sát ý kiến người học sắp tốt | Cấp Học viện\nnghiệp\n2_| Quy trình khảo sát tình hình việc làm của người | Cấp Học viện\nhọc sau tốt nghiệp 01 tháng\n3| Quy trình khảo sát tình hình việc làm của người Cấp Học viện\nhọc sau tốt nghiệp 01 năm\n4_ | Quy trình khảo sát ý kiến cựu người học Cấp Học viện\n5_ | Quy trình khảo sát ý kiến nhà tuyển dụng Cấp Học viện\n6 | Quy trình khảo sát ý kiến cán bộ, giáng viên về | Cấp Học viện\ncác mặt hoạt động của Học viện\n7| Quy trình kiểm tra, giám sát đảm bảo chất lượng | Cấp Học viện\nđào tạo\n§ | Quy trình chấm thi kết thúc học phần tự luận Cấp Học viện\n',1,1,0,22,1),(38,'Quy trinh Khao sat y kien nguoi hoc sap tot nghiep.pdf','application/pdf','pdfdata\\Quy trinh Khao sat y kien nguoi hoc sap tot nghiep.pdf','pdfconvert/converted_Quy trinh Khao sat y kien nguoi hoc sap tot nghiep.pdf','BAN CƠ YẾU CHÍNH  PHỦ CỘNG  HÒA XÃ HỌI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN  KỸ THUẬT  MẬT MÃ Độc lập —- Tự do - Hạnh phúc\nQUYTRÌNH _\nẶT Ý KIÊN  NGƯỜI  HỌC SẮP TÓT NGHIỆP\nQuyết  định số 1067/QĐ-HMV  ngày 24/10/2024  của\nHọc viện Kỹ thuật mật mã)\nQuy trình này giúp thống nhất cách thức quản lý, thực hiện công tác khảo sát\nsự hài lòng của sinh viên trước khi tốt nghiệp về chất lượng đào tạo tại trường.\nXây dựng quy trình để việc thực hiện và kiểm soát tiến độ công việc được thuận\ntiện, phân định rõ trách nhiệm, quyền hạn trong công tác thực thi công việc.\nII. PHẠM  VI ÁP DỤNG\nQuy trình áp dụng cho tất cả sinh viên năm cuối của Học viện KTMM.\nQuy trình được thực hiện vào cuối khoá học .\nII. TÀI LIỆU VIỆN DẪN\nNgày ban | Cơ quan Š ý tL2Tˆ h ễ Sô ký hiệu Trích  yêu hành ban hành\nBan hành Quy định về hoạt động\n542/QĐ-HVM.  | đảm bảo chất lượng giáo dục tại | 31/5/2023 | Pọc viện\ntA Trx An CA Cà KTMMHọc viện Kỹ thuật mật mã\nHướng dẫn hoạt động đảm bảo Hoe viên\n73/HD-HVM_  | chất lượng giáo dục tại Học viện | 31/01/2024 KTMM\nKỹ thuật mật mã\nIV.ĐỊNH  NGHĨA/VIẾT  TẮT\n- ĐVKTĐBCL:  Đơn vị quán lý về khảo thí và đảm bảo chất lượng đào tạo\ncủa Học viện; ở Cơ sở chính là Phòng KT&ĐBCLĐT,  ở Phân hiệu là Ban\nKT&ĐÐBCLĐT;\n- ĐVQLHVSV:  Đơn vị quản lý học viên, sinh viên; ở Cơ sở chính là Hệ\nQuản lý học viên, sinh viên, ở Phân hiệu là Phòng Tài chính — Tổng hợp;\n-HVSV:  Học viên, sinh viên.\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:2/9\nV. NỘI DUNG  QUY TRÌNH\nV.1. Lưu đồ quy trình khảo sát ý kiến người học sắp tốt nghiệp:\nThực hiện Trình tự công việc TINH Điệu; IÊM TIỂU\nliên quan\nkhảo sát\nỶỲ\nĐVKTĐBCL Phê duyệt phiếu khảo sát TM,\n_ KSYKNHSTN.01\nĐVKTĐBCL Ỷ\nĐVQLHVSV Tiến hành khảo sát\nHVSV\nàÃ BM\nĐVKTĐBCL Tông hợp, xử lý kết quả KSYKNHSTN.02\nBáo cáo, lưu trữ kết BM.Thuy quã KSYKNHSTN.03\nV.2. Diễn giải quy trình:\nThời |TT Trình tự Trách  nhiệm R mâu/ Kết\ngian Rquả\nXây dựng kế hoạch khảo sát\nCăn cứ vào Thời khóa biểu học kỳ\nl1 |cuối cùng của khoá học, ĐVKTĐBCL\nĐVKTĐBCL  xây dựng kê hoạch\nkhảo sát.\nPhê duyệt  phiếu khảo sát BM\n2 |ĐVKTĐBCL  tiến hành xây dựng | ĐVKTĐBCL KSYKNH\nphiêu khảo sát, báo cáo Ban Giám STN.01\nđốc đề ban hành.\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:3/9\nBiêu\nTT Trình tự Trách nhiệm | Thời | mãu/ Kết\ngian >quả\nTiến hành khảo sát\nKhảo sát trực tuyến qua đường link\nđã được thiệt lập (đăng nhập với tài\nkhoản Microsoft  mà Học viện đã | ĐVKTĐBCL\n3 | cung câp). Trong khoảng thời gian ĐVQLHVSV\nnày, ĐVKTĐBCL  và ĐVQLHVSV| #vsv\nphôi hợp theo dõi tiên độ khảo sát (sự\ntham gia của HVSV)  đê có biện pháp\ntuyên truyền,  đôn độc cân thiết.\nXứ lý kết quả _.\nSau khi hết thời gian khảo sát, :\n® ÌPÐVKTĐBCL  tiến hành tổng hợp, | ĐVKTĐBCL, KCDDEBONNIAn nh nối đ LIẤO - hán LÀ: STN.02phân tích các ý kiên phản hôi.\nBáo cáo, lưu trữ kết quả\nĐVKTĐBCL  chuyển  báo cáo kết quả BM.\ns | khảo sát (kết quả tông hợp, phân tích) | ÐVKTĐBCL KSYKNH\nđên Ban Giám đôc và các ĐVĐT  có STN.03\nliên quan. Lưu trữ kêt quả khảo sát./.\nVI. BIỂU MẪU\nTT Ký hiệu Tên Biểu mẫu\n1 |BM.KSYKNHSTN0I  Mẫu  phiêu  lây ý kiên phản hôi của người học\nsắp tôt nghiệp\n2_ |BM.KSYKNHSTN.02_  | Tổng hợp ý kiến phản hồi\nBM.KSYKNHSTN.03_  | Báo cáo tổng hợp về cuộc khảo sát\nVII. LƯU TRỮ\nTT|PL| TênhồsơphụlụecL)  | Mã | Thờigian  | pa nhận lưu trữlưu trữ\nl Ý kiến khảo sát của sinh viên 5năm | P.KT&ĐBCLĐT\nQuy trình... :\nMã số:... Ban hành lần:.... Ngày:... Trang:4/9\nPhụ lục\nCÁC BIÊU MẪU\nBIÊU MẪU BM.KSYKNHSTN.01\nPHIẾU  LÁY Ý KIÊN PHẢN HỎI\nCỦA NGƯỜI  HỌC SẮP TÓT NGHIỆP\n(Kèm theo Kế hoạch số...................................  --- c2 c7 s55 sec sec 2252}\nNhằm nâng cao chất lượng của chương  trình đào tạo, Học viện rất mong nhận\nđược ý kiên của sinh viên về chương  trình đào tạo đang thực hiện. ỹ kiên của bạn sẽ\ngiúp Học viện có các giải pháp điều chỉnh chương  trình, cải thiện chất lượng hoạt động\ndạy và học ngày càng tốt hơn. Học viện cam kết đảm bảo các thông tin trong  phiếu khảo\nsát được hoàn toàn bảo mật và chỉ sử dụng vào mục đích duy nhất là nâng cao chất\nlượng  chương  trình đào tạo (CTĐT).\nSinh viên vui lòng điền thông tin vào khoảng  trắng và đánh dấu (2 vào một ô\nđược cho là phù hợp cho các câu hỏi hoặc nhận định dưới đây:\nNgành  học: .......-..‹..-.\nChuyển  ngành::¿----:sösx cs252106955921523  9659 9)6981940430460)M10819940401430145300093i60695  003%\nhốa 0G: sa: sơn nac oúDndh0 10 ch 0tegt0SPUSY\'ICNGĐDOESRRRIGSI  HhQ)NIJSBOGGUERRIĐE\'GR.GU019.U09001930g0n%\nHãy cho biết mức độ hài lòng được đánh giá theo thang điểm từ 1 đến 4, được\nquy định như sau:\n© - Rất không hài lòng; - Không  hài lòng; ®- Hài lòng; @ - Rất hài lòng\nMức độ đánh giá\n1 2 3 4STT NỘI DUNG  LÁY Ý KIÊN\nChương  trình đào tạo và đề cương các học phần được\ncông bố công khai, dễ dàng tiếp cận\nCác mục tiêu chương trình, năng lực người học cần\n2 __ | đạt được sau khi tôt nghiệp  được miêu tả rõ ràng và cụ\nthể\n3 | Chương  trình đào tạo có khối lượng kiến thức hợp lý\nChương  trình đào tạo cân đối giữa kiến thức đại cương\nvà chuyên  ngành\n5 _ | Tỷ lệ phân bố giữa lý thuyết và thực hành phù hợp\nCông tác tô chức đào tạo của khoa, Học viện tạo thuận\n6 lợi cho sinh viên\nz_ | Các tiêu chí đánh giá kết quả học tập được thiết kế rõ\nràng, phù hợp\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:5/9\nMức độ đánh giá\n1 |2 |3|24STT NỌI DUNG  LÁY Ý KIÊN\nHệ thống có vấn, tư vấn, hỗ trợ quá trình học tập đáp\nứng nhu câu sinh viên\n9 Thư viện có đủ tài liệu đáp ứng nhu cầu học tập,\nnghiên  cứu của sinh viên\nHọc viện có đủ trang thiết bị phục vụ học tập, thực\nhành, thí nghiệm\n11 | Hệ thống CNTT đáp ứng nhu cầu của sinh viên.10\nHọc viện đảm bảo các chế độ chính sách xã hội của\n12 | sinh viên\nl3 Học viện đáp ứng tốt nhu cầu văn nghệ, văn hóa của\nsinh viên\nl4 Học viện đáp ứng tốt nhu cầu thể dục thê thao của\nsinh viên\n15 | Các hoạt động Đoàn, Hội có tác dụng tốt, thiết thực\n16 | Anh/Chị  có hài lòng về chất lượng đào tạo của khóa học\nNhìn chung, Anh/Chị  hài lòng về môi trường sinh17 š . sahoạt, học tập tại Học viện\n1ã. Theo Anh/Chị,  những môn học nào trong chương  trình đào tạo xét thấy cần\nphải điêu chỉnh?\nN2 1.71..2.  4...1.  yngganẢ.\n- Môn học cần giÑm:.ĐÓ†  thối THỢNG! túi tui tát Láy C011 v0 0100059146910)  263516050/88060  0086\n- Môn học cần tăng thêm thời ÏưỢñg: ................-- cà SE xxx vi\n- Môn học bồ HH? TH 1ĩtt tạng t5XE DỊ GG iết SšSS833)4/S0RBS29505X3.1I88i48:435954  4598438844915  8888\n19. Anh/Chị  thấy hài lòng nhất về điều gì khi tham gia khóa học?\nXin chân thành cảm ơn ý kiến đóng  ý của Anh/chị!\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:6/9\nBIÊU MẪU BM.KSYKNHSTN.02\nBAN CƠ YÊU CHÍNHPHỦ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập — Tự do —- Hạnh phúc\nTỎNG  HỢP Ý KIÊN PHẢN HÒI NGƯỜI  HỌC SẮP TÓT NGHIỆP\nNgành  học: ..........................  cọ TH  n Em TH nh tư ty\nChuyên  ngành: s:::z¿:zss-sszizssxssie4  s6 sg 53/555 S00108005 iẾt dế gà 36199060 .659036.00000005/00/0788\n4i D0...  ..............  .\n1. Phản hồi các câu hỏi từ 1-17\nhương  án 1 7 3 4\nCâu hỏi SL | % | SL | % | SL | % | SL | %\nœ|t«6a:|+e|t ||\n17\n2. Phản hồi câu hỏi số 18!\nQuy Nhữ...\nMã số:... Ban hành lần:... Ngày:... Trang:7/9\n4. Phản hồi câu hỏi số 202\n- : Hà Nội, ngày......  thẳng.....  năm 20.....\nTRƯỞNG  PHÒNG  KT&ĐÐĐBCLĐT CÁN BỘ TỎNG  HỢP\n(Kýớ, ghi rõ họ tên) (Ký, ghi rõ họ tên)\n3 Liệt kê các phản hồi của người học, loại bỏ các ý kiến dưới dạng “Không  có ý kiến gì”\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:8/9\nBIẾU MẪU BM.KSYKNHSTN.03\nHỌC VIỆN KỸ THUẬT  MẬTMÃ_ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nPHÒNG  KT&ĐBCLĐT Độc lập - Tự do - Hạnh phúc\nSố: .../BC-KTĐBCL Hà Nội, ngày.... tháng ... năm 20...\nBÁO CÁO\nKết quả lấy ý kiến phản hồi của người học sắp tốt nghiệp\n(Năm học 20...-20...)\nI. THÔNG  TIN CHUNG\nNgành  học: ............................-----  sọ 2n S SH nh nh hờ\nCHDYcm-ïi0anS  se có ca ốc  0 c0 hơn in,\nKhóa học: ....................................-  c2 n SH SH ng ng vs.\nII. ĐÁNH  GIÁ CHUNG\n2.1. Mặt tích cực\nII. KIÊN NGHỊ,  ĐÈ XUẤT\n3.1. Đối với các khoa\nPhòng  KT&ĐÐBCLĐT  trân trọng báo cáo./.\nNơi nhận: 2 `\n- Ban Giám đốc (để b/c); TRƯỞNG  PHÒNG\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:9/9\n',1,1,0,22,0),(39,'Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 thang.pdf','application/pdf','pdfdata\\Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 thang.pdf','pdfconvert/converted_Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 thang.pdf','BAN CƠ YẾU CHÍNH  PHỦ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT MẬT MÃ Độc lập — Tự do - Hạnh phúc\nQUY  TRÌNH\nHÌNH  VIỆC  LÀM CỦA  NGƯỜI  HỌC\n5 SAU TÓT NGHIỆP  01 THÁNG\nsố Quyết  định số 1067/QĐ-HMV  ngày 24/10/2024  của\nHọc viện Kỹ thuật mật mã)\nI. MỤC ĐÍCH\nQuy trình này giúp thu thập thông tin của người học có việc làm trong vòng\n01 năm kể từ khi tốt nghiệp nhằm nâng cao chất lượng quản lý và đào tạo của nhà trường.\nQuy trình này sẽ làm cơ sở bổ sung, điều chỉnh nội dung, chương  trình đào\ntạo phù hợp với thực tiễn, đáp ứng nhu cầu sử dụng nguồn nhân lực của xã hội.\nH. PHẠM  VI ÁP DỤNG\nQuy trình áp dụng cho tất cá sinh viên tốt nghiệp đại học chính quy của Học\nviện Kỹ thuật mật mã.\nII. TÀI LIỆU VIỆN DẪN\nNgày ban | Cơ quan 1) na í é Số ký hiệu Trích  yêu hành | banhành\nBan hành Quy định về hoạt động\n542/QĐ-HVM.  | đảm bảo chất lượng giáo dục tại | 31/5/2023 | PJ9e viện\nKTMMHọc viện Kỹ thuật mật mã\nHướng dân hoạt động đảm bảo =\nF tự . - Học viện73/HD-HVM  . | chất lượng  giáo dục tại Học viện | 31/01/2024 KTMM\nKỹ thuật mật mã\nIV.ĐỊNH  NGHĨA/VIẾT  TẮT\n- ĐVKTĐBCL:  Đơn vị quản lý về khảo thí và đảm bảo chất lượng đào tạo\ncủa Học viện; ở Cơ sở chính là Phòng KT&ĐBCLĐT,  ở Phân hiệu là Ban\nKT&ĐÐBCLĐT;\n- ĐVQLHVSV:  Đơn vị quản lý học viên, sinh viên; ở Cơ sở chính là Hệ\nQuản lý học viên, sinh viên, ở Phân hiệu là Phòng  Tài chính — Tổng hợp;\n-HVSV:  Học viên, sinh viên.\nQuy trình...\nMã số:... Ban hành lần:.... Ngày:... Trang:2/8\nV. NỘI DUNG  QUY TRÌNH\nV.1. Lưu đồ quy trình khảo sát tình hình việc làm của người học sau tốt\nnghiệp  01 tháng:\nThực hiện Trình tự công việc Mu hiệu lại Hậuliên quan\nĐVKTĐBCL, Xây dựng kế hoạch\nkhảo sát\n- BMĐVKTĐBCL Phê duyệt phiêu khảo sát KSVLSTN01T01\nỶỲ\nĐVQLHVSV Thu thập thông  tin, lập danh sách\nsinh viên cần khảo sát\nĐVKTĐBCL\nĐVQLHVSV Tiến hành khảo sát\nHVSV\nỶ BM\nĐWEDBEL Tổng hợp, xử lý kết quả KSVLSTN01T.02\nBáo cáo, lưu trữ kết BM.ĐVKTPBCL Nữn KSVLSTN01T.03\nV.2. Diễn giải quy trình:\nThời | Biểu mẫu/TT Trình tự Trách  nhiệm : h +\nl gian Kêt quả\nXây dựng kế hoạch khảo sát\nÌ |ĐÐVKTĐBCL  xây dựng kế hoạch | ĐVKTĐBCL\nkhảo sát\nQuy trình...\nMã sô:... Ban hành lần:... Ngày:... Trang:3/8\nTTThời | Biểu mẫu/Trình tự Trách  nhiệm š £ :\nB gian Kêt quả\nPhê duyệt  phiếu khảo sát BM.\nĐVKTĐBCL  tiến hành xây dựng | ĐVKTĐBCL KSVLSTN\nphiếu khảo sát, báo cáo Ban Giám 01T.01\nđốc để ban hành.\nThu thập thông tin, lập danh sách\nsinh viên cần khảo sát\nĐVQLHVSV  tiến hành thu thập\nthông tin người học đã tốt nghiệp,  lập\ndanh sách\nTiến hành khảo sát\nKhảo sát trực tuyến qua đường link\nđã được thiết lập (khảo sát ẩn danh). ĐVKTĐBCL,\nTrong khoảng thời gian này, | ĐVQLHVSV\nĐVKTĐBCL  và ĐVQLHVSV  phối HVSV\nhợp theo dõi tiến độ khảo sát (sự tham\ngia của người học) đề có biện pháp\ntuyên truyền, đôn đốc cần thiết.\nXử lý kết quả\nSau khi hết thời gian khảo sát,\nĐVKTĐBCL  tiến hành tổng hợp,\nphân tích các ý kiến phản hồi.BM.\nĐVKTĐBCL KSVLSTN\n01T.02\nBáo cáo, lưu trữ kết quả\nĐVKTĐBCL  chuyển  báo cáo kết quả BM.\nkhảo sát (kết quả tông hợp, phân tích) ĐVKTĐBCL KSVLSTN\nđến Ban Giám đốc và các ĐVĐT có 01T.03\nliên quan. Lưu trữ kết quá khảo sát./.\nVI.BIẾU  MẪU\nTT Ký hiệu Tên Biểu mẫu\nMẫu phiếu lấy ý kiến khảo sát tình hình của\nDI, ECBNÀI LNƯ LÍ dÚ người học sau tôt nghiệp 01 tháng\nBM.KSVLSTN0IT.02  | Tổng hợp ý kiến phản hồi\nBM.KSVLSTN0IT.03  | Báo cáo tổng hợp về cuộc khảo sát\nQuy trình...\nMã sô:... Ban hành lần:... Ngày:... Trang:4/8\nVII. LƯU TRỮ\n4 . Mã | Thời gian n.. 5TTỊ PL Tên hô sơ/ phụ lục (PL) số lưu HEŒ Bộ phận lưu trữ\n1 Ÿ kiến khảo sát của sinh viên 5năm | P.KT&ĐBCLĐT\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:5/8\nPhụ lục\nCÁC BIÊU MẪU\nBIẾU MẪU BM.KSVLSTN0IT.01\nPHIẾU  LÁY Ý KIÊN KHẢO  SÁT TÌNH HÌNH VIỆC LÀM\nCÚA NGƯỜI  HỌC SAU TÓT NGHIỆP  01 THÁNG\n(Kèm theo Kế hoạch số.. SEN Si tt tấu Xết V Sầu ESSai0490sggiessissvrd)\nNhằm nắng cao chất lượng a của ls dưỡng trình đào tạo, Học viện rất mong\nnhận được ý kiến của sinh viên về tình hình việc làm kế từ sau khi tốt nghiệp  01\ntháng. Sinh viên vui lòng điền thông tin vào khoảng  trồng và đánh dấu (2 vào\nmột ô được cho là phù hợp cho các câu hỏi hoặc nhận định dưới đây:\nNgành  học: .............................  S0 2212111  21v n vn n ng ng ky\nM:01/520721  88T 8 n1 ...ố.ố.ố.  .ố ....ố.....\n90 1...4...\n1. Liên quan đến khoá đào tạo của Anh/Chị  tại Học viện Kỹ thuật mật mã,\nhãy cho biết bằng tốt nghiệp của Anh/Chị  xếp loại nào? sa\nLI Trung  bình L] Khá L] Giỏi L] Xuất sắc\n2. Tính đến thời điểm hiện tại, Anh/Chị  đã có công việc chưa? -\nL] Đã xin được việc L] Chưa xin được việc L] Đang  tiếp tục học\n3. Công  việc đang làm có liên quan đến ngành  Anh/Chị  được đào tạo không?\nL] Có liên quan LÏ Liên quan một phần L] Không  liên quan\n4. VỊ trí công việc hiện tại của Anh/Chị  là gì?\nL] Nhân viên đang thử việc\nL] Nhân viên chính thức\nL] Lãnh đạo phụ trách\nLÌ Khác (ghi rõ):.................- --L c0  0011111222111  HH1 ng  sẻ\n5. Anh/Chị  hãy cho biết thu nhập hiện tại của mình (bằng VNĐ).\nL1 Dưới 2 triệu LI 2-4 triệu L] 4-6 triệu LI Trên 6 triệu\n6. Anh/Chị  có đóng góp gì cho Học viện trong hoạt động hỗ trợ cựu sinh\nviên không?\nXin chân thành cảm ơn ý kiến đóng  ý của Anh/chị!\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:6/8\nBIÊU MẪU BM.KSVLSTN01T.02\nBAN CƠ YẾU CHÍNH  PHỦ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập — Tự do —- Hạnh phúc\nTỎNG  HỢP Ý KIÊN PHẢN HÒI VÈ TÌNH HÌNH VIỆC LÀM\nCỦA NGƯỜI  HỌC SAU TÓT NGHIỆP  01 THÁNG\ns/52;1;0søI  2277277576  ỐốỐỒỒỒ\n(Ði01/9:001-7001:0EVVCadidđdđiiaiiiiiẳäáaaäa....\nKhóa  hỌC: ......................cQQQQQ  Q0 2n n HE n ng nh HT TH Hi KH TT nh tk nh sg\n1. Phản hồi các câu hỏi từ 1-5\nhương  án 1 2 3 4\nCâu hỏi SL % SL % SL % SL %\nŒœãA[+®e|o[|Đ|=\n: l Hà Nội, ngày......  tháng.....năm  20....\nTRƯỞNG  PHÒNG  KT&ĐBCLĐT CÁN BỘ TỎNG  HỢP\n(Ký, ghi rõ họ tên) (Ký, ghi rõ họ tên)\nQuy trình. * ụ\nMã sỐ:... Ban hành lân:... Ngày:... Trang:7/8\nBIÊẾU MẪU BM.KSVLSTN0IT.03\nHỌC VIỆN KỸ THUẬT  MẬT MÃ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nPHÒNG  KT&ĐBCLĐT Độc lập - Tự do - Hạnh phúc\nSố: .../BC-KTĐBCL Hà Nội, ngày.... tháng ... năm 2...\nBÁO CÁO\nKết quá lấy ý kiến phản hồi\nvề tình hình việc làm của người học sau tốt nghiệp 01 tháng\nI. THÔNG  TIN CHUNG\nNpànlh  hOGi sussziezzxiaxö228E)ERSERBSRREl1LskSHSš  BI VN Bá is ng nhan Ha besseisso\n000)/-:81  he  a.((((aiAD\nKHốA  D0GE sensssasriotoittsrtiodogtginn  tuãi ti ïu DỤNG DDYENIDURREVRQEILVTGNSSS.NSeseasasesse\nII. KÉT QUÁ KHẢO  SÁT VÈẺ TÌNH HÌNH VIỆC LÀM\n2.1. Tình trạng việc làm hiện tại\nII. KIÊN NGHỊ,  ĐÈ XUẤT\n3.1. Đối với các khoa\nPhòng  KT&ĐÐĐBCLĐT  trân trọng báo cáo./.\nNơi nhận: § Ồ\n- Ban Giám đốc (đề b/c); TRƯỜNG  PHONG\nQuy trình... :\nMã số:... Ban hành lân:... Ngày:... Trang:8/8\n',1,1,0,22,0),(40,'Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 nam.pdf','application/pdf','pdfdata\\Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 nam.pdf','pdfconvert/converted_Quy trinh khao sat tinh hinh viec lam cua nguoi hoc sau tot nghiep 1 nam.pdf','BAN  CƠ YẾU CHÍNH  PHỦ - CỘNG HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN  KỸ THUẬT  MẬT MÃ Độc lập — Tự do - Hạnh phúc\n` ÌNHHÌNH  VIỆC LÀM CỦA NGƯỜI  HỌC\nJRAU TÓT NGHIỆP  01 NĂM\nQuy trình  này giúp thu thập thông tin của người học có việc làm trong vòng\n01 năm kể từ khi tốt nghiệp nhằm nâng cao chất lượng quản lý và đào tạo của nhà trường.\nQuy trình này sẽ làm cơ sở bố sung, điều chỉnh nội dung, chương  trình đào\ntạo phù hợp với thực tiễn, đáp ứng nhu cầu sử dụng nguồn nhân lực của xã hội.\nIH. PHẠM  VI ÁP DỤNG\nQuy trình áp dụng cho tất cả sinh viên tốt nghiệp đại học chính quy của Học\nviện Kỹ thuật mật mã.\nII TÀI LIỆU VIỆN DẪN\n- ¬.. Ngày ban | Cơ quan\nSô ký hiệu Trích yêu hành ban hành\nBan hành Quy định về hoạt động Twerviln\n542/QĐ-HVM.  | đảm bảo chất lượng giáo dục tại | 31/5/2023 KTMM\nHọc viện Kỹ thuật mật mã\nHướng dẫn hoạt động đảm bảo :\nš sẽ . \" Học viện73/HD-HVM  . | chất lượng giáo dục tại Học viện | 31/01/2024 KTMM\nKỹ thuật mật mã\nIV.ĐỊNH  NGHĨA/VIẾT  TẮT\n- ĐVKTĐBCL:  Đơn vị quản lý về khảo thí và đảm bảo chất lượng đào tạo\ncủa Học viện; ở Cơ sở chính là Phòng KT&ĐBCLĐT,  ở Phân hiệu là Ban\nKT&ĐÐĐBCLĐT;\n- ĐVQLHVSV:  Đơn vị quản lý học viên, sinh viên; ở Cơ sở chính là Hệ\nQuản lý học viên, sinh viên, ở Phân hiệu là Phòng Tài chính — Tổng hợp;\n-HVSV: Học viên, sinh viên.\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:2/8\nV. NỘI DUNG QUY TRÌNH\nV.1. Lưu đồ quy trình khảo sát tình hình việc làm của người học sau tốt\nnghiệp  01 tháng:\nThực hiện Trình tự công việc —=...liên quan\nĐVKTĐBCL Xây dựng kế hoạch\nkhảo sát\n^Á BM\nĐVKTĐBCL Phê duyệt phiêu khảo sát KSVLSTN01N01\nÀÀ\nĐVQLHVSV Thu thập thông tin, lập danh sách\nsinh viên cần khảo sát\nĐVKTĐBCL\nĐVQLHVSV Tiến hành khảo sát\nHVSV\n: BM.\nEPVEDLEIDIS Tổng hợp, xử lý kết quả KSVLSTN0IN.02\nBáo cáo, lưu trữ kết BM.\nĐVKTPBCL KSVLSTN0IN.03 quả\nV.2. Diễn giải quy trình:\nTT Trình tự Trách nhiệmThời\ngianBiểu mẫu/\nKêt quả\nXây dựng kế hoạch khảo sát\n¡ |ĐVKTĐBCL  xây dựng kế hoạchĐVKTĐBCL\nkhảo sát\nQuy trình... :\nMã số:... Ban hành lân:... Ngày:... Trang:3/8\nTTThời | Biểu mẫu/Trình tự Trách nhiệm s F h\n: Ỹ gian Kêt quả\nPhê duyệt  phiếu khảo sát\nĐVKTĐBCL  tiến hành xây dựng | ĐVKTĐBCL BM.\nphiếu khảo sát, báo cáo Ban Giám KSVLSTN\nđốc để ban hành. 01N.01\nThu thập thông tin, lập danh sách\nsinh viên cần khảo sát\nĐVQLHVSV  tiến hành thu thập\nthông tin người học đã tốt nghiệp,  lập\ndanh sách\nTiến hành khảo sát\nKhảo sát trực tuyến qua đường link\nđã được thiết lập (khảo sát ân danh).\nTrong khoảng thời gian này, ĐVKTĐBCL\nĐVKTĐBCL  và ĐVQLHVSV  phối | ĐVQLHVSV\nhợp theo dõi tiến độ khảo sát (sự tham | HVSV\ngia của người học) để có biện pháp\ntuyên truyền, đôn đốc cần thiết.\nXứ lý kết quả\nSau khi hết thời gian khảo sát,\nĐVKTĐBCL  tiến hành tổng hợp,\nphân tích các ý kiến phản hồi.BM.\nĐVKTĐBCL KSVLSTN\n01N.02\nBáo cáo, lưu trữ kết quả\nĐVKTĐBCL  chuyên  báo cáo kết quả BM.\nkhảo sát (kết quả tổng hợp, phân tích) | VKTĐBCL KSVILSTN\nđến Ban Giám đốc và các ĐVĐT có 01N.03\nliên quan. Lưu trữ kết quả khảo sát./.\nVI.BIÊU  MẪU\nTT Ký hiệu Tên Biểu mẫu\n1| BM.KSVLSTN0IN0I  Mâu phiêu lây ý kiện khảo sát tình hình của người\nhọc sau tôt nghiệp  01 năm\n2 _|BM.KSVLSTN0IN.02  | Tổng hợp ý kiến phản hồi\n3 |BM.KSVLSTN01N.03  | Báo cáo tổng hợp về cuộc khảo sát\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:4/8\nVI. LƯU TRỮ\n3. sÙÄ Mã | Thời gian . „TTỊPL| Tên hồ sơ/ phụ lục (PL) số lưu trữ Bộ phận lưu trữ\n1 Ý kiến khảo sát của sinh viên 5 năm P.KT&ĐÐBCLĐT\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:5/8\nPhụ lục\nCÁC BIÊU MẪU\nBIÊU MẪU BM.KSVLSTN0IN.01\nPHIẾU  LÁY Ý KIÊN KHẢO  SÁT TÌNH HÌNH VIỆC LÀM\nCỦA NGƯỜI  HỌC SAU TÓT NGHIỆP  01 NĂM\n(Kèm theo Kế hoạch số.. \"113g\nNhằm nâng cao chất T.—<F của ødÌưởng trình đào tạo, Học viện rất mong\nnhận được ý kiến của sinh viên về tình hình việc làm kế từ sau khi tốt nghiệp 01\nnăm.Sinh viên vui lòng điền thông tin vào khoảng  trồng và đánh dấu (⁄) vào một\nô được cho là phù hợp cho các câu hỏi hoặc nhận định dưới đây:\nNgành  h0Gi sossisnuseeo1aott5014310950)6810808106  0806/8606 ĐD.lIG00438  P 0611907 H\'09\'VIEBIGĐS/Đ92008\nChuyên  ngành: ...............................-  SH  SH nen  nh nh nh.\nKhóa  H06! ssssx gi su 20020 5001064983580908801Ÿ16  G0008) 00V0005i)31908l6128.81  81.4 21041908/200800800164\'00l60018%  ch\n1. Liên quan đến khoá đào tạo của Anh/Chị  tại Học viện Kỹ thuật mật mã,\nhãy cho biết bằng tốt nghiệp  của Anh/Chị  xếp loại nào?\nL] Trung bình - L] Khá L] Giỏi TL] Xuất sắc\n2. Tính đên thời điểm hiện tại, Anh/Chị  đã có công việc chưa? „\nL] Đã xin được việc L1 Chưa xin được việc L] Đang tiếp tục học\n3. Bao lâu sau tôt nghiệp  Anh/Chị  xin được việc làm?\nH Có việc làm ngay sau khi tốt nghiệp T] Dưới 01 tháng\nL1 Từ 1 - 6 tháng L] Trên 6 tháng\n4. Công việc đang làm có liên quan đến ngành  Anh/Chị  được đào tạo không?\nL1 Có liên quan Ll Liên quan một phần L] Không  liên quan\n5. Vị trí công việc hiện tại của Anh/Chị  là gì?\nL] Nhân  viên đang thử việc\nL] Nhân viên chính thức\nL] Lãnh đạo phụ trách\nLI Khác (BHÏ1Ồ): s: z:ssysss51  15 D8515  1056013161016  804060450 0040680990.X088142Ä00000161.40n)dgiSE00128\n6. Anh/Chị  hãy cho biết thu nhập hiện tại của mình (bằng VNĐ).\nL] Dưới  2 triệu L] 2-4 triệu L14-6 triệu L] Trên  6 triệu\n7. Anh/Chị  có đóng góp gì cho Học viện trong hoạt động hỗ trợ cựu sinh\nviên không?\nXin chân thành cảm ơn ý kiến đóng ý của Anh/chị!\nQuy trình...\nMã sỐ:... Ban hành lân:... Ngày:... Trang:6/8\nBIÊU MẪU BM.KSVLSTN01N.02\nBAN CƠ YÉU CHÍNH  PHỦ CỘNG HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập — Tự do —- Hạnh phúc\nTỎNG  HỢP Ý KIÊN PHÁN HÒI VỀ TÌNH HÌNH  VIỆC LÀM\nCỦA NGƯỜI  HỌC SAU TÓT NGHIỆP  01 NĂM\nII DAHHCHOCG 7 0.7.7.7...  717 74/9494 4 44 4/0 49 s7\nChuyêH  ngành: ;¿:::::.::z::s255257  062655 0016 0ã Tá E5 đã Su đit cu ấu S4 08l060100000815/01080000289080\nKhóa  học: ...............................----cQ  QQ HS SH ST nh kg\n1. Phản hồi các câu hỏi từ 1-6\nhương  án 1 2 3 4\nCâu hỏi SL | % SL | % SL | % SL | %\nœ|e6a:|+|t3›||—=\n2. Phản hồi câu hỏi số 7:\n: l Hà Nội, ngày  lv, tháng  Sa» 4 năm 20.....\nTRƯỞNG  PHONG  KT&ĐBCLĐT CÁN BỘ TỎNG  HỢP\n(Ký, ghi rõ họ tên) (Ký, ghi rõ họ tên)\nQuy trình... `\nMã sỐ:... Ban hành lân:.... Ngày:... Trang:7/8\nBIÊẾU MẪU BM.KSVLSTN01N.03\nHỌC VIỆN KỸ THUẬT  MẬT MÃ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nPHÒNG  KT&ĐBCLĐT Độc lập —- Tự do - Hạnh phúc\nSố: .../BC-KTĐBCL Hà Nội, ngày.... tháng ... năm 20...\nBÁO CÁO\nKết quá lấy ý kiến phản hồi\nvề tình hình việc làm của người học sau tốt nghiệp 01 năm\nI. THÔNG  TIN CHUNG\nTgănh  hG.,..................... xá s55 g535,2345050%G1ãRi08/0035,S3ilA  li sất HE. INGINRISRDBSIOERIĐMHIQ42I803808\nGhUyeiinpadnh  v.v.  v.v\nKhóa  0G: si s: sp snnnx ống 61g H65 SPEvISEIdSES  GIIDEREDSSISNIHIORIĐIIS)BSISM.ISBI4GIGS  t3 Ất GUES\'0955 098\nII. KÉT QUÁ KHẢO SÁT VÈẺ TÌNH HÌNH VIỆC LÀM\n2.1. Tình trạng  việc làm hiện tại\nPhòng  KT&ĐÐĐBCLĐT  trân trọng báo cáo./.\nNơi nhận: _ TRƯỞNG  PHÒNG\n- Ban Giám đôc (đê b/c);\nQuy trình... :\nMã số:... Ban hành lân:... Ngày:... Trang:8/8\n',1,1,0,22,0),(41,'Quy trinh khao sat y kien cuu nguoi hoc.pdf','application/pdf','pdfdata\\Quy trinh khao sat y kien cuu nguoi hoc.pdf','pdfconvert/converted_Quy trinh khao sat y kien cuu nguoi hoc.pdf','BAN CƠ YẾU CHÍNH  PHỦ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập — Tự do - Hạnh phúc\n: QUY TRÌNH\nÁD SÁT Ý KIỀN CỰU NGƯỜI  HỌC\nQuyết định số 1067/QĐ-HMV  ngày 24/10/2024  của\nHọc viện Kỹ thuật mật mã)\n- Các đơn vị, đối tượng có liên quan dễ dàng nắm bắt được trình tự các bước\ntriển khai và thực hiện khảo sát, đồng thời tạo sự gắn kết và phối hợp chặt chẽ giữa các\nđơn vị có liên quan.\nH. PHẠM  VI ÁP DỤNG\n- Đối tượng áp dụng: Các cựu học viên-sinh  viên đã tốt nghiệp Học viện Kỹ\nthuật mật mã.\n- Đơn vị thực hiện: Phòng khảo thí và đảm bảo chất lượng đào tạo\n- Đơn vị phối hợp: Hệ quản lý học viên và sinh viên\n- Thự hiện theo kế hoach định kỳ hàng năm.\nQuy trình có thể được áp dụng tương tự cho các lớp học khác (lớp tập huấn,\nlớp ngoại khóa...  ).\nII. TÀI LIỆU VIỆN DẪN\n2 W& : Ngày ban Cơ quanSố ký h ếhiện TRÍCH yêu hành ban hành\n2196/BGDĐT |Công văn ban hành ngày| 20/11/2020 BGDĐT-\n22/4/2010  của Bộ giáo dục và GDĐH\nđào tạo về hướng dẫn và xây\ndựng công bố chuẩn đầu ra\nngành  đào tạo\nCV1398/ Công văn ban hành ngày | 05/03/2013 BGDĐT-\nBGDĐT- 05/03/2013  về kiểm định chất KTKĐCLGD\nKTKĐCLGD lượng giáo dục Trường đại\nhọc, Cao đẳng và trung cấp\nQuy trình...\nMã số:... Ban hành lần:.... Ngày:... Trang:2/10\nIV.ĐỊNH  NGHĨA/VIÉT  TẮT\n-_ĐVKTĐBCL:  Đơn vị quản lý về khảo thí và đảm bảo chất lượng đào\ntạo của Học viện; ở Cơ sở chính là Phòng  KT&ĐBCLĐT,  ở Phân hiệu là Ban\nKT&ĐÐBCLĐT;\n- ĐVQLHVSV:  Đơn vị quản lý học viên, sinh viên; ở Cơ sở chính là Hệ\nQuản lý học viên, sinh viên, ở Phân hiệu là Phòng  Tài chính  — Tổng hợp;\n- ĐVĐIT:  Đơn vị đào tạo, là các khoa, bao gồm Trung  tâm Thực hành;\n- HVSV: Học viên, sinh viên\nCHVSV:  Cựu Học viên sinh viên\nCSGŒD:  Cơ sở giáo dục, tức là Học viện Kỹ thuật mật mã\nBGĐ: Ban giám đốc\nQuy trình... l\nMã sô:... Ban hành lân:... Ngày:... Trang:3/10\nV. NỘI DUNG  QUY TRÌNH\nV.1. Lưu đồ quy trình khảo sát ý kiến cựu người học:\nẨ sÄ éXe T1SAMẫu biều, tài liệuThực hiện Trình tự công việc liê\nlên quan\nP.ĐVKTĐBCL Xây dựng KH và link KS BM.KSYKCNH.0I1\nĐVQLHVSV\nHVSV Truy xuất dữ liệu CHVSV\nĐVKTĐBCL Tiến hành KS\nỊ\nĐVKTĐBCL :\nTổng hợp, Phân tích BM.KSYKCNH.02\nBM.KSYKCNH.03\nĐVKTĐBCI, Thông  tin kết quả khảo\nsắt\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:4/10\nV.2. Diễn giải quy trình:\nTTzq ẨBiêu mầu/Trình  tự Trách nhiệm  | Thời gian KẾt quả\nThiết lập các cuộc khảo sát\nCăn cứ vào kế hoạch khảo sát các\nđôi tượng liên quan hàng năm và\nbiêu mẫu khảo sát ` BM.KSYK\n] BM.KSCSV.01.xây  dựng link khảo | ĐVKTĐBCL  | 07 ngày CNH0I\nsát.\n-ĐVQLHVSV.\nHVSV truy xuât dữ liệu thông tin\nliên lạc của CHVSV\nTiến hành khảo sát\n- ĐVKTĐBCL\n- ĐVQLHVSV ĐVKTĐBCL\n2 |HVSV gửi link cho CHVSV qua ĐVQLHVSV  | 03 ngày\nemail.mesenger,  điện thoại HVSV\nTrong khoảng thời gian này,\nĐVKTĐBCL  và ĐVQLHVSV\nphôi hợp theo dõi tiên độ khảo sát\nTổng hợp, Phân tích\nHết thời gian khảo - sát,\nĐVKTĐBCL  tiên hành tông hợp,\n3 |phân tích các ý kiến phản hồi.| ĐVKTĐBCL  | 0sngày | BM.KSYK\nViệc tổng hợp, phân tích được tiến CNH.02\nhành đôi với các nội dung trong\nphiêu KS.\nThông  tin kết quả khảo sát\nĐVKTĐBCL  chuyển báo cáo kết\n4 | quả khảo sát (kết quả tổng hợp,| ĐVKTĐBCL  | 02ngày | PMKSYXKphân tích) đến Ban Giám đốc và CNH.03\ncác ĐVĐT  có liên quan.\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:5/10\nVI BIÊU MẪU\nTT Mã hiệu Tên Biểu mẫu\n1 |BM.KSYKCNH.01  | Phiếu khảo sát cựu người học\n2_|BM.KSYKCNH.02  | Tổng hợp ý kiến phản hồi cựu học viên, sinh viên\n3 | BM.KSYKCNH.03  | Báo cáo kết quả lấy ý kiến phản hồi cựu người học\nVII. LƯU TRỮ\nTên hồ sơ/ phụ lục ~.4 | Thời gian | „ạ va - TT |PL (PL) Mã số lưu trữ Bộ phận lưu trữ\n1 Phiếu khảo sát cựu người học 05 năm Phòng\nKT&ĐBCLĐT\nTổng hợp ý kiến phản hồi cựu `5 øg hợp y P 05 năm Phòng\nhọc viên, sinh viên KT&ĐÐBCLĐT\nBáo cáo kết quả lấy ý kiến `3 Xà lu 05 năm Phòngphản hôi cựu người  học KT&ÐĐBCLĐT\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:6/10\nPhụ lục\nCÁC BIÊU MẪU\nBIẾU MẪU BM.KSYKCNH.01\nPHIẾU  KHẢO  SÁT Ý KIÊN CỰU NGƯỜI  HỌC\nA. THÔNG  TIN CHUNG:\n5.Thời điểm anh/chị  tốt nghiệp chương  trình đào tạo kỹ sư: tháng..............  năm..........\n6. Xếp loại tốt nghiệp:\n6.1 Xuất sắc le 6.2 Giỏi le© 6.3Khá O\n6.4 Trung  bình khá O 6.5 Trung  bình ©\n8. Trước khi vào trường,  anh/chị  sống ở (tính theo địa chỉ hộ khẩu thường  trú):\n8.1 Thành  thị © 8.2Nôngthôn  O\n9. Tên hiện tại của tỉnh, thành phố (theo hộ khẩu thường  trú) của anh/chị  trước khi vào\n10. Địa chỉ thuận tiện nhất hiện nay để có thể liên lạc với anh/chị (cơ quan hoặc nhà\nriêng):\n10.1 Địa chỉ đầy đủ:....................  HH TH HT TH HT TT khen  cay\n10.2 Số điện thoại thuận tiện nhất để liên lạc:...................--  +22 s s2\n10.3 Di động:.....................  -.......  lá su vn gve! g8i09350/250  EImllttssssssssssszsees\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:7/10\nB. MỘT SÓ NỘI DUNG  KHẢO  SÁT:\nTrong năm học cuối cùng ở trường. anh/chị  có đi làm thêm không?\n1. Có O _ (Xin trả lời tiếp phần I)\n2. Không O (Xin trả lời tiếp phần II)\nI.PHẢN  DÀNH  CHO NHỮNG  ANH/CHỊ  ĐÃ ĐI LÀM :\n1.Số giờ làm việc trung bình trong tuần của năm học cuối là:\n12.1 Ít hơn 10 giờ © 12.2 từ 10 đến 20 giờO 12.3 Từ 20 giờ trở O\nlên\n13. Công việc anh/chị  làm thêm có phù hợp với chương  trình học không?\n13.1 Rất phù hợp O 13.2 Phù hợp ©\n13.3Ítphùhợp O 13.4 Không  phù hợp ©\n14. Kế từ khi tốt nghiệp,  anh/chị  đã có việc làm đem lại thu nhập cho bản thân chưa?\n14.1 Chưa có O 142 Đãcó O\n15. Anh/chị  làm việc trong thành phần kinh tế nào?\n15.1Nhànước O 15.2 Tư nhân, cổ phần TNHH O\n15.3 Hợp tácxã O 15.4 Tổ chức nước ngoài l©\n16. Công việc của anh/chị  có phù hợp với chuyên  ngành đã được đào tạo ở trường\nkhông?\n16.1 Có O 16.2 Không O\n17. Kiến thức và kỹ năng học được ở trường có hữu ích cho công việc của anh/chị\nkhông?\n17.1 Rấthữuích Q 17.2 Hữu ích S\n173Íthữuích O 17.4 Không  hữuích O\n18. Anh/chị  làm việc ở:\n18.1 Thànhthị O 18.2 Nông  thôn ©\n19. Thời gian anh/chị  làm việc bình quân trong tuần là:\nQuy trình... :\nMã số:... Ban hành lân:... Ngày:... Trang:8/10\n19.1 Dưới 20 giờ O 19.2 Từ 20 đến 40 giờ O 19.3 Từ 40 giờ trở ©\nlên\n20. Mức thu nhập bình quân/tháng  của anh/chị  từ công việc:\n20.1 Dưới 3.000.000 O 20.2 Từ 3.000.000  đến 5.000.000 O\n20.3 Từ 5.000.000  đến dưới 8.000.000 O_ 20.4 Từ 10.000.000  trở lên ©\n21. Theo anh/chị,  mình tìm được công việc là do(có thể tô kín nhiều lựa chọn):\n21.1 Kiến thức và kỹ năng O© 21.2 Kinh nghiệm  làm việc O©\n21.3 Quen biết © 21.4 Sức khoẻ O\n21.5 Trình độ ngoạingữ 21.6 Trình độ vi tính ©)\n21.7 Ngoại hình l© 21.8 Vốn sống l©\n22. Cơ quan anh/chị  đang công tác có phải tổ chức khoá đào tạo nâng cao cùng chuyên\nngành để anh/chị  đáp ứng được yêu cầu công việc không?\n221Có O 22.2 Không O\n23. Cơ quan anh/chị làm có phải đào tạo lại để anh/chị đáp ứng được yêu cầu công\nviệc?\n23.1Có O 23.2 Không O\n24. Anh/chị  đánh giá thế nào về mức độ ổn định của công việc này trong 03 năm tới?\n24.1 Rấtổn định O© 242Önđịnhh ©\n243Ítônđịnh O 244Khôngổnđịnh  O©\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:9/10\nII. PHÀN  DÀNH  CHO NHỮNG  ANH/CHỊ  CHƯA  TỪNG  ĐI LÀM:\n1. Kế từ khi tốt nghiệp, anh/chị  có tham gia khoá đào tạo nào không?\n1ICó © 1.2 Không ©\n2. Những  khoá đào tạo mà anh/chị  đã tham gia(có thể tô kín nhiều lựa chọn trong cùng\nmột hàng):\n¬ Cùng chuyên | Khác chuyên : ¬\nLoại hình ` Ï Ngoại  ngữ Vị tính\nngành ngành\n1. Ngắn hạn 11 © 12 @ 13. @ 14 O\n2. Bằng 2 21 O© 22 O 23 O 24 O\n3. Thạc sĩ 31 O 32 O BÀ 34.\n4. Tiến sĩ 41 Ố© 42 O 43. © 44. O©\n3. Lý do anh/chị  chưa có việc làm:\n3.1 Còn tiếp tục học S\n3.2 Không  bận học chỉ chưa có ý định đilàm O\n3.3 Đã xin việc nhưng chưa được, vì(có thể tô kín nhiều lựa chon):\na. Thiếu kiến thức và kỹnăng O© b. Thiếu kinh nghiệm  làm việc l@\nc. Thiếu thông tin tuyển dụng © d. Thiếu mối quan hệ ©\nđ. Thiếu sức khoẻ © e. Trình độ ngoại ngữ chưa phù hợp O\nf. Trình độ vi tính chưa phù hợp O ø. Ngoại  hình chưa phù hợp ©\nXin cảm ơn sự hợp tác của anh/chị\nQuy trình...\nMã sô:... Ban hành lần:... Ngày:... Trang:10/10\nBIẾU MẪU BM.KSYKCNH.02\nBAN CƠ YẾU CHÍNH  PHỦ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập - Tự do - Hạnh phúc\nTỎNG  HỢP Ý KIẾN PHẢN  HÒI CỰU HỌC VIÊN SINH VIÊN\nSố CNH được KS:..................... Số lượt phản hồi: .................\n1. Phản hồi các câu hỏi từ 1-24\nhương  án\nCâu hỏi SL % SL | % SL % SL %\n{~xr[|bS[|tC)|t |\n2. Phản hồi câu hỏi số 4( Góp ý của quý đơn vị cho Trường  về việc nâng cao\nkiến thức và kỹ năng của sinh viên tốt nghiệp)\nHà Nói, ngày.... tháng .... năm 20....\nTRƯỞNG  PHÒNG CÁN BỘ TỎNG  HỢP\nKT@&ĐBCLĐT (Ký, ghi rõ họ tên)\n(Ký, ghi rõ họ tên)\nQuy trình...\nMã sô:... Ban hành lần:... Ngày:... Trang:11/10\nBIẾU MẪU BM.KSYKCNH.03\nHỌC VIỆN KỸ THUẬT  MẬT MÃ CỘNG  HÒA XÃ HỌI CHỦ NGHĨA  VIỆT NAM\nPHÒNG  KT&ĐBCLĐT Độc lập — Tự do - Hạnh phúc\nSố: ..../20../BC-KTĐBCL Hà Nội, ngày.... tháng ... năm 20...\nBÁO CÁO\nKết quả lấy ý kiến phản hồi cựu người học\nI. THÔNG  TIN CHUNG\nTổng số CHVSV  được gửi phiếu khảo sát\nTổng số lượt CHVSV  cho ý kiến phản hồi: .....\nI. ĐÁNH  GIÁ CHUNG\n2.1. Mặt tích cực\n2.2. Mặt hạn chế\nII. KIÊN NGHỊ,  ĐÈ XUẤT\n3.1. Đối với các khoa\nKèm theo Báo cáo này là .... bản tổng hợp ý kiến phản hồi của nhà tuyển\ndụng về chất lượng của kỹ sư sau khi tốt nghiệp.\nPhòng  KT&ĐBCLĐT  trân trọng báo cáo./.\nNơi nhận: 2 \'\n- Ban Giám đốc (4); TRƯỞNG  PHÒNG\n- Phòng:  ĐT, CTTC;\n* Lưu: KT:\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:12/10\n',1,1,0,22,0),(42,'Quy trinh khao sat y kien nha tuyen dung ve chat luong dao tao cua Hoc vien.pdf','application/pdf','pdfdata\\Quy trinh khao sat y kien nha tuyen dung ve chat luong dao tao cua Hoc vien.pdf','pdfconvert/converted_Quy trinh khao sat y kien nha tuyen dung ve chat luong dao tao cua Hoc vien.pdf','BAN CƠ YÉU CHÍNH  PHỦ CỘNG HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập — Tự do - Hạnh phúc\nIHÀ TUYẾN  DỰNG/DOANH  NGHIỆP  VỀ CHẤT\nNG ĐÀO  TẠO CỦA  HỌC  VIỆN\nQuyết định số 1067/QĐ-HMV  ngày 24/10/2024  của\nHọc viện Kỹ thuật mật mã)\n- Xây dựng quy trình chuẩn về việc thực hiện và kiểm soát tiến độ công việc\nđược thuận  tiện; phân định rõ trách nhiệm,  quyên  hạn trong công tác thực thi công việc;\n- Các đơn vị, đối tượng có liên quan dễ dàng nắm bắt được trình tự các bước |\ntriển khai và thực hiện khảo sát, đồng thời tạo sự gắn kết và phối hợp chặt chẽ giữa các\nđon vị có liên quan.\nH. PHẠM  VI ÁP DỤNG\n- Đối tượng áp dụng: Các doanh nghệp tuyển dụng, liên kết với Học viện Kỹ\nthuật mật mã.\n- Đơn vị thực hiện: Phòng  khảo thí và đảm bảo chất lượng đào tạo\n- Đơn vị phối hợp: Hệ quản lý học viên và sinh viên\n- Thự hiện theo kế hoach định kỳ hàng năm.\nQuy trình có thể được áp dụng tương tự cho các ngành đào tạo\nII. TÀI LIỆU VIỆN DẪN\nSố ký hiệu Trích yếu Ngày ban | Cơquanhành ban hành\n2196/BGDĐT |Công văn ban hành ngày | 20/11/2020 BGDĐT-\n22/4/2010  của Bộ giáo dục và GDĐH\nđào tạo về hướng dẫn và xây\ndựng công bố chuẩn đầu ra\nngành  đào tạo\n1398/BGDĐT-  | Ban hành ngày 05/03/2013  vẻ | 05/03/2013 BGDĐT-\nKTKĐCILGD |kiểm định chất lượng giáo KTKĐCLGD\ndục Trường đại học, Cao\nQuy  trình...\nMã số:... Ban hành lân:... Ngày:... Trang:2/10\nHI. TÀI LIỆU VIỆN DẪN\nđc z1 Á Ngày ban | Cơ quanSô ký hiệu Trích yêu hành bw hành\n2196/ BGDĐT-  | Công văn về hướng dẫn và xây | 22/4/2010 Bộ\nGDĐH dựng công bố chuẩn đầu ra GD&ĐÐT\nngành  đào tạo\n1398/ BGDĐT-  | Công văn về kiểm định chất| 05/03/2013 Bộ\nKTKĐCLGD lượng giáo dục Trường  đại học, GD&ĐT\nCao đẳng và trung cấp chuyên\nnghiệp  năm 2013.\n73/HD-HVM Hướng  dẫn hoạt động ĐBCLGD  | 01/02/2024  | Học viện\ncủa Học viện Kỹ thuật mật mã. KTMM\nIV.ĐỊNH  NGHĨA/VIẾT  TẮT\n- ĐVKTĐBCL:  Đơn vị quản lý về khảo thí và đảm bảo chất lượng đào\ntạo của Học viện; ở Cơ sở chính là Phòng KT&ĐBCLĐT,  ở Phân hiệu là Ban\nKT&ĐÐĐBCLĐT;\n- ĐVQLHVSV:  Đơn vị quản lý học viên, sinh viên; ở Cơ sở chính là Hệ\nQuản lý học viên, sinh viên, ở Phân hiệu là Phòng Tài chính — Tổng hợp;\n- ĐVĐT:  Đơn vị đào tạo, là các khoa, bao gồm Trung tâm Thực hành;\n- HVSV: Học viên, sinh viên\n- CSGD:  Cơ sở giáo dục, tức là Học viện Kỹ thuật mật mã\n-_BGĐ:  Ban giám đốc\n-_NTD:  Nhà tuyển dụng\n- _DN: Doanh  nghiệp\n- BM: Biểu mẫu\n- KH: Kế hoạch\nQuy trình. sỹ \'\nMã sô:... Ban hành lân:.... Ngày:... Trang:3/10\nV. NỘI DUNG  QUY TRÌNH\nV.1. Lưu đồ quy trình khảo sát ý kiến nhà tuyển dụng:\nẨ tr `e 1SA\nThực hiện Trình tự công việc Mẫu biểu, tài liệu\nliên quan\nP.ĐVKTĐBCL THỜ Dựng, PHIẾU Khô EEDI BM.KSYKNTD.01\nvà link KS\nĐVKTĐBCL u\nĐVQLHVSV Truy xuất dữ liệu NTD/DNHVSV Ï\nĐVKTĐBCL Tiến hành KS BM.KSYKNTD  02\nỶ\nTổng hợp, Phân tích\n|\nỶ\nĐVKTĐBCL, Báo cáo kết quả khảo BM.KSYKNTD.03\nsát\nV.2. Diễn giải quy trình:\nTT Trình  tựBiểu mẫu/Trách nhiệm Thời gianKết quả\nThiết lập các cuộc khảo sát\nCăn cứ vào kế hoạch khảo\nsát các đối tượng liên quan\nhàng năm và biểu mẫu khảo\nsát NTD/DN.  ĐVKTĐBCL\nxây dựng link khảo sát.\n- ĐVQLHVSVHVSYV  truy\nxuất dữ liệu thông tin liên lạc\ncủa NTD, DNĐVKTĐBCL 7 ngàyBM.KSYKN\nTD.0I1\nTiến hành khảo sát\n- ĐVKTĐBCLĐVKTĐBCL\nĐVQLHVSV3 ngày\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:4/10\nTT Trình  tự Trách  nhiệm Thời gianBiểu mẫu/\nKết quả\nĐVQLHVSV\nHVSYV  gửi link cho NTD/DN\nqua email.mesenger,  điện\nthoại\nTrong  khoảng  thời gian này,\nĐVKTĐBCL  và\nĐVQLHVSV  phối hợp theo\ndõi tiến độ khảo sátHVSV\n1 Ống hợp, Phân tích\nHết thời gian khảo sát,\nĐVKTĐBCL  tiến hành tổng\nhợp, phân tích các ý kiến\nphản hồi. Việc tổng hợp,\nphân tích được tiến hành đối\nvới các nội dung trong phiếu\nKS.ĐVKTĐBCLBM.KSYKN\nTD.02\nThông  tin kết quả khảo sát\nĐVKTĐBCL  chuyển  báo\ncáo kết quả khảo sát (kết quả\ntổng hợp, phân tích) đến Ban\nGiám đốc và các ĐVĐT  có\nliên quan.ĐVKTĐBCLBM.KSYKN\nTD.03\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:5/10\nVI. BIỂU MẪU\nTT~ 1$ ^ .sÄMã hiệu Tên Biểu mẫu\n1 |BM.KSYKNTD.0IPhiếu khảo sát nhà tuyển dụng về chất lượng kỹ sư\ntốt nghiệp  học...\n2 |BM.KSYKNTD.02  | Tổng hợp ý kiến phản hồi nhà tuyển dụng\n3 |BM.KSYKNTD.03Báo cáo kết quả lấy ý kiến phản hồi của nhà tuyển\ndụng về chất lượng của kỹ sư sau khi tốt nghiệp\nVII. LƯU TRỮ\nTên hồ sơ/ phụ lục ;- | Thời gian ¬ -TTỊPL Mã số Bộ phận lưu trữ\n(PL) lưu trữ\n| Ý kiến khảo sát NTD 5năm | P.KT&ĐBCLĐT\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:6/10\nPhụ lục\nCÁC BIÊU MẪU\nBIÊU MẪU BM.KSNTD.01\nPHIẾU  KHẢO  SÁT NHÀ TUYẾN  DỤNG\nVẺ CHÁT  LƯỢNG  KỸ SƯ TÓT NGHIỆP  HỌC .....\n-_ Đánh giá theo 04 mức: Hoàn toàn không đồng ý, Không đồng ý, Đồng ý,\nHoàn toàn đông ý l\n- _ Đánh dâu “X” vào ô theo đông chí là phù hợp.\nHoàn\n¬ toàn | Không| „| HoànTiêu chí đánh giá ˆ › „| Đồng ý | toàn\nkhông  | đồng ý đồng ý\nđồng ý\n1. Tư cách, đạo đức l@) l@) l@) l@)\n2. Kiên thức chuyên  môn l@) l@) le) O\n3. Kỹ năng nghiệp  vụ, tay nghê chuyên  môn @ ©) le) ©\n4. Trình độ ngoại ngữ O O @) œ\n5. Trình độ CNTT Oœ @) l@) le)\n6. Sức khoẻ l@) l@) l@) l@)\n7. Tinh thân câu tiên O c5 l© O\n§. Tính năng động, sáng tạo trong công tác O @) le) ©)\nQuy trình... l\nMã số:... Ban hành lần:... Ngày:... Trang:7/10\n9, Ý thức tổ chức kỷ luật OOOO\n10. Ÿ thức tập thể, cộng đồngO ©)O\n11. Khả năng tô chức, điêu hành nhiệm  vụ\nđược phân công 2 ©) © O\n12. Khả năng hoạt động khác (TDTD,\nVH-VN,  Thanh niên,.....) © © © ©\n13. Nhận xét chung  về sinh viên tốt nghiệp  tại\nTrường ©) Ọ l@) O\nII. CÁC NHẬN  XÉT KHÁC:\n1. Quý đơn vị đã phải đào tạo nâng cao (cùng chuyên  ngành) để sinh viên tốt nghiệp\nđáp ứng yêu cầu công việc?\n11Có @ 12Không\n2. Quý đơn vị đã phải đào tạo thêm(ở chuyên ngành khác hoặc gần) để sinh viên tốt\nnghiệp đáp ứng được yêu cầu công việc?\n21Có @ 22Không\n3. Quý đơn vị đã phải đào tạo lại để sinh viên tốt nghiệp đáp ứng yêu cầu công việc?\n31Có @ 32Không\n4. Góp ý của quý đơn vị cho Trường  về việc nâng cao kiến thức và kỹ năng của sinh\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:8/10\nBIÊU MẪU BM.KSYKNTD.02\nBAN CƠ YẾU CHÍNH  PHỦ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nHỌC VIỆN KỸ THUẬT  MẬT MÃ Độc lập - Tự do - Hạnh phúc\nTỎNG  HỢP Ý KIÊN PHÁN  HÒI NHÀ TUYẾN  DỤNG\nSố DN được KS:........................... Số lượt phản hồi: ................\n1. Phản hồi các câu hỏi từ 1-13\nhương  án 1 2 3 4\nCâu hỏi SL % SL | % SL % SL %\n2. Phản hồi các câu hỏi phần II Nhận xét khác từ 1-3\nCâu hỏi 1 2 3 4\nTrung  bình\n3. Phản hồi câu hỏi số 4( Góp ý của quý đơn vị cho Học viện về việc nâng cao\nkiên thức và kỹ năng của sinh viên tôt nghiệp)\nHà Nội, ngày... tháng .... năm 2....\nTRƯỞNG  PHÒNG CÁN BỘ TỎNG  HỢP\nKT&ĐBCLĐT (Ký, ghi rõ họ tên)\n(Ký, ghi rõ họ tên)\nQuy trình...\nMã số:... Ban hành lần:... Ngày:... Trang:9/10\nBIẾU MẪU BM.KSYKNTD.03\nHỌC VIỆN KỸ THUẬT  MẬT MÃ CỘNG  HÒA XÃ HỘI CHỦ NGHĨA  VIỆT NAM\nPHÒNG  KT&ĐBCLĐT Độc lập - Tự do - Hạnh phúc\nSố: ..../20../BC-KTĐBCL Hà Nội, ngày.... tháng ... năm 20...\nBÁO CÁO\nKết quả lấy ý kiến phản hồi của nhà tuyển dụng\nvề chất lượng của kỹ sư sau khi tốt nghiệp\n___LTHÔNG  TIN CHUNG\nTông sô NTD được gửi phiêu khảo sát:.................\nTổng số lượt NTD cho ý kiến phản hồi: ...................\nII. ĐÁNH  GIÁ CHUNG\n2.1. Mặt tích cực\n2.2. Mặt hạn chế\nHI. KIỄN NGHỊ,  ĐÈ XUẤT\n3.1. Đối với các khoa\nKèm theo Báo cáo này là... bản tổng hợp ý kiến phản hồi của nhà tuyển\ndụng về chât lượng của kỹ sư sau khi tôt nghiệp.\nPhòng  KT&ĐBCLĐT  trân trọng báo cáo./.\nNơi nhận: ˆ TRƯỞNG  PHÒNG\n- Ban Giám đôc (4);\n- Phòng:  ĐT, CTTC;\n- Lưu: KT.\nQuy trình... l\nMã sô:... Ban hành lân:... Ngày:... Trang:10/10\n',1,1,0,22,0),(43,'Quy trinh khao sat y kien can bo giang vien ve cac mat hoat dong cua Hoc vien.pdf','application/pdf','pdfdata\\Quy trinh khao sat y kien can bo giang vien ve cac mat hoat dong cua Hoc vien.pdf','','',1,0,0,22,0),(44,'Quy trinh kiem tra, giam sat dam bao chat luong dao tao.pdf','application/pdf','pdfdata\\Quy trinh kiem tra, giam sat dam bao chat luong dao tao.pdf','','',1,0,0,22,0),(45,'Quy trinh cham thi ket thuc hoc phan.pdf','application/pdf','pdfdata\\Quy trinh cham thi ket thuc hoc phan.pdf','','',1,0,0,22,0),(46,'594 HVM-CTTC_0001.pdf','application/pdf','pdfdata\\594 HVM-CTTC_0001.pdf','','',1,0,0,23,1),(47,'CÔNG VĂN THỰC HÀNH TIẾT KIỆM CHỐNG LÃNG PHÍ.pdf','application/octet-stream','pdfdata\\CÔNG VĂN THỰC HÀNH TIẾT KIỆM CHỐNG LÃNG PHÍ.pdf','','',1,0,0,24,1),(48,'KH Triển khai thực hiện Chỉ thị số 27 ngày 25122023 về tăng cường sự lãnh đạo caủa Đảng đối với công tác TH TK, CLP.pdf','application/pdf','pdfdata\\KH Triển khai thực hiện Chỉ thị số 27 ngày 25122023 về tăng cường sự lãnh đạo caủa Đảng đối với công tác TH TK, CLP.pdf','','',1,0,0,24,0),(49,'phieu_trinh_van_ban_di.docx','docx__1731312080188','pdfdata\\phieu_trinh_van_ban_di.docx','','',1,0,0,24,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `database_vanban`
--

LOCK TABLES `database_vanban` WRITE;
/*!40000 ALTER TABLE `database_vanban` DISABLE KEYS */;
INSERT INTO `database_vanban` VALUES (21,1731542400000,42942,'1204/KH-HVM','Kế hoạch','Nguyễn Thị Thùy','KH tổ chức triển khai thực hiện đồ án tốt nghiệp cho sinh viên đại học chính quy, ngành Công nghệ thông tin (CT5)\n','Phòng Đào tạo','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Lương Thế Dũng - Học viện Kỹ thuật mật mã',1,1,1731571914787),(22,1729728000000,42756,'1067/QĐ-HVM','Quyết định','Nguyễn Thị Thùy','Quyết định phê duyệt 08 quy trình triển khai, phối hợp giải quyết công việc của các cơ quan, đơn vị thuộc Học viện Kỹ thuật mật mã theo Kế hoạch số 1078/KH-BCY ngày 14/12/2022','Phòng Hành chính','Sổ QĐ, BC, KH, TTr..','Thường','Thường','Hoàng Văn Thức - Học viện Kỹ thuật mật mã',9,1,1731467490909),(23,1731283200000,42498,'594/HVM-CTTC','Công văn','Nguyễn Thị Thùy','V/v triển khai hồ sơ đăng ký thuê nhà ở công vụ trong BCYCP','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Thường','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',1,1,1731301514055),(24,1731283200000,42469,'595/HVM-CTTC','Công văn','Nguyễn Việt Hưng','V/v Sao gửi kế hoạch 980/KH-BCY về  triển khai thực hiện chỉ thị số 27-CT/TW của Bộ Chính trị ','Phòng Chính trị - Tổ chức','Sổ Công văn đi','Thường','Thường','Vũ Văn Vinh - Phòng Chính trị - Tổ chức',3,1,1731291563370);
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

-- Dump completed on 2024-11-28 22:18:35
