-- MySQL dump 10.13  Distrib 5.7.23, for macos10.13 (x86_64)
--
-- Host: localhost    Database: graduation_project
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Table structure for table `h_admin`
--

DROP TABLE IF EXISTS `h_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `passWord` varchar(20) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `descirbe` varchar(512) DEFAULT '' COMMENT '人员相关描述',
  `role` int(11) DEFAULT NULL COMMENT '用户角色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_admin`
--

LOCK TABLES `h_admin` WRITE;
/*!40000 ALTER TABLE `h_admin` DISABLE KEYS */;
INSERT INTO `h_admin` VALUES (4,'李六','123456','13777777777',1,'北大医学院博士',1),(6,'123','123','123',1,'123',1),(7,'管理员','123456','13888888888',0,'超级管理员',0);
/*!40000 ALTER TABLE `h_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_proposal`
--

DROP TABLE IF EXISTS `h_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_proposal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL COMMENT '用户得分等级',
  `proposal` text COMMENT '分数所对应的建议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_proposal`
--

LOCK TABLES `h_proposal` WRITE;
/*!40000 ALTER TABLE `h_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `h_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_question`
--

DROP TABLE IF EXISTS `h_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `q_name` varchar(256) DEFAULT NULL COMMENT '问题',
  `q_answer` text COMMENT '答案',
  `q_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_question`
--

LOCK TABLES `h_question` WRITE;
/*!40000 ALTER TABLE `h_question` DISABLE KEYS */;
INSERT INTO `h_question` VALUES (6,'您手脚发凉吗？','[1,2,3,4,5]',3),(7,'您胃脘部、背部或腰膝部怕冷吗？','[1,2,3,4,5]',3),(8,'您感到怕冷、衣服比别人穿得多吗？','[1,2,3,4,5]',3),(9,'您比一般人不了寒冷（冬天的寒冷，夏天的冷空调、电扇等。 ','[1,2,3,4,5]',3),(10,'您比别人容易患感冒吗？','[1,2,3,4,5]',3),(11,'您吃（喝）凉的东西会感到不舒服或者怕吃（喝）凉东西吗？','[1,2,3,4,5]',3),(12,'你受凉或吃（喝）凉的东西后，容易腹泻（拉肚子）吗？ ','[1,2,3,4,5]',3),(13,'您感到手脚心发热吗？','[1,2,3,4,5]',4),(14,'您感觉身体、脸上发热吗？ ','[1,2,3,4,5]',4),(15,'您皮肤或口唇干吗？ ','[1,2,3,4,5]',4),(16,'您口唇的颜色比一般人红吗？','[1,2,3,4,5]',4),(17,'您容易便秘或大便干燥吗？','[1,2,3,4,5]',4),(18,'您面部两潮红或偏红吗？','[1,2,3,4,5]',4),(19,'您感到眼睛干涩吗？  ','[1,2,3,4,5]',4),(20,'您活动量稍大就容易出虚汗吗？  ','[1,2,3,4,5]',4),(21,'你容易疲乏吗？','[1,2,3,4,5]',2),(22,'您容易气短（呼吸短促，接不上气吗？ ','[1,2,3,4,5]',2),(23,'您容易心慌吗？ ','[1,2,3,4,5]',2),(24,'您容易头晕或站起时晕眩吗？ ','[1,2,3,4,5]',2),(25,'您比别人容易患感冒吗？ ','[1,2,3,4,5]',2),(26,'您喜欢安静、懒得说话吗？ ','[1,2,3,4,5]',2),(27,'您说话声音无力吗？ ','[1,2,3,4,5]',2),(28,'您活动量就容易出虚汗吗？','[1,2,3,4,5]',2),(29,'您感到胸闷或腹部胀满吗？','[1,2,3,4,5]',5),(30,'您感到身体学生不轻松或不爽快吗？','[1,2,3,4,5]',5),(31,'您腹部肥满松软吗？','[1,2,3,4,5]',5),(32,'您有额部油脂分泌多的现象吗？','[1,2,3,4,5]',5),(33,'您上眼睑比别人肿（仍轻微隆起的现象）吗？ ','[1,2,3,4,5]',5),(34,'您嘴里有黏黏的感觉吗？','[1,2,3,4,5]',5),(35,'您平时痰多，特别是咽喉部总感到有痰堵着吗？','[1,2,3,4,5]',5),(36,'您舌苔厚腻或有舌苔厚厚的感觉吗？','[1,2,3,4,5]',5),(37,'您面部或鼻部有油腻感或者油亮发光吗？','[1,2,3,4,5]',6),(38,'你容易生痤疮或疮疖吗？','[1,2,3,4,5]',6),(39,'您感到口苦或嘴里有民味吗？','[1,2,3,4,5]',6),(40,'您大使黏滞不爽、有解不尽的感觉吗？','[1,2,3,4,5]',6),(41,'您小便时尿道有发热感、尿色浓（深）吗？','[1,2,3,4,5]',6),(42,'您带下色黄（白带颜色发黄）吗？（限女性）','[1,2,3,4,5]',6),(43,'您的阴囊部位潮湿吗？（限男性）','[1,2,3,4,5]',6),(44,'您的皮肤在不知不觉中会出现青紫瘀斑（皮下出血）吗？','[1,2,3,4,5]',7),(45,'您两颧部有细微红丝吗？','[1,2,3,4,5]',7),(46,'您身体上有哪里疼痛吗？','[1,2,3,4,5]',7),(47,'您面色晦黯或容易出现褐斑吗？','[1,2,3,4,5]',7),(48,'您容易有黑眼圈吗？','[1,2,3,4,5]',7),(49,'您容易忘事（健忘）吗 ','[1,2,3,4,5]',7),(50,'您口唇颜色偏黯吗？','[1,2,3,4,5]',7),(51,'您没有感冒时也会打喷嚏吗？','[1,2,3,4,5]',9),(52,'您没有感冒时也会鼻塞、流鼻涕吗？','[1,2,3,4,5]',9),(53,'您有因季节变化、温度变化或异味等原因而咳喘的现象吗？','[1,2,3,4,5]',9),(54,'您容易过敏（对药物、食物、气味、花粉或在季节交替、气候变化时）吗？  ','[1,2,3,4,5]',9),(55,'您的皮肤容易起荨麻疹（风团、风疹块、风疙瘩）吗？','[1,2,3,4,5]',9),(56,'您的因过敏出现过紫癜（紫红色瘀点、瘀斑）吗？','[1,2,3,4,5]',9),(57,'您的皮肤一抓就红，并出现抓痕吗？','[1,2,3,4,5]',9),(58,'您感到闷闷不乐吗？ ','[1,2,3,4,5]',8),(59,'您容易精神紧张、焦虑不安吗？','[1,2,3,4,5]',8),(60,'您多愁善感、感情脆弱吗？','[1,2,3,4,5]',8),(61,'您容易感到害怕或受到惊吓吗？','[1,2,3,4,5]',8),(62,'您胁肋部或乳房腹痛吗？','[1,2,3,4,5]',8),(63,'您无缘无故叹气吗？','[1,2,3,4,5]',8),(64,'您咽喉部有异物感，且吐之不出、咽之不下吗？','[1,2,3,4,5]',8),(65,'您精力充沛吗？ ','[1,2,3,4,5]',1),(67,'您容易疲乏吗？','[5,4,3,2,1]',1),(68,'您说话声音无力吗？','[5,4,3,2,1]',1),(69,'您感到闷闷不乐吗？','[5,4,3,2,1]',1),(70,'您比一般人耐受不了寒冷（冬天的寒冷，夏天的冷空调、电扇）吗？','[5,4,3,2,1]',1),(71,'您能适应外界自然和社会环境的变化吗？','[1,2,3,4,5]',1),(72,'您容易失眠吗？','[5,4,3,2,1]',1),(73,'您容易忘事（健忘）吗？','[5,4,3,2,1]',1);
/*!40000 ALTER TABLE `h_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_question_type`
--

DROP TABLE IF EXISTS `h_question_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_question_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_question_type`
--

LOCK TABLES `h_question_type` WRITE;
/*!40000 ALTER TABLE `h_question_type` DISABLE KEYS */;
INSERT INTO `h_question_type` VALUES (1,'平和质'),(2,'气虚质'),(3,'阳虚质'),(4,'阴虚质'),(5,'痰湿质'),(6,'湿热质'),(7,'血瘀质'),(8,'气郁质'),(9,'特禀质');
/*!40000 ALTER TABLE `h_question_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_user`
--

DROP TABLE IF EXISTS `h_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userName` varchar(30) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `phoneNum` varchar(11) DEFAULT NULL,
  `insider` int(1) DEFAULT NULL COMMENT '是否是会员，1为是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_user`
--

LOCK TABLES `h_user` WRITE;
/*!40000 ALTER TABLE `h_user` DISABLE KEYS */;
INSERT INTO `h_user` VALUES (13,'234','0','234',0,'234',0),(14,'李浩宁','1','123456',23,'18404713245',0),(21,'123245','1','123',123,'1234',0),(22,'李莉莉',NULL,'123456',0,'12345',0),(23,'赵岳',NULL,'123456',0,'777777',0),(29,'123','1','123',12,'12344444444',0),(30,'123','1','123',12,'12344444444',0),(31,'123','1','123',12,'12344444444',0);
/*!40000 ALTER TABLE `h_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_user_question`
--

DROP TABLE IF EXISTS `h_user_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_user_question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '用户id',
  `user_socre` varchar(100) DEFAULT NULL COMMENT '用户得分情况',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_user_question`
--

LOCK TABLES `h_user_question` WRITE;
/*!40000 ALTER TABLE `h_user_question` DISABLE KEYS */;
INSERT INTO `h_user_question` VALUES (1,12,'4'),(17,13,'19'),(18,16,'13'),(21,21,'{\"1\":40,\"2\":43,\"3\":60,\"4\":50,\"5\":46,\"6\":46,\"7\":46,\"8\":46,\"9\":50}'),(22,23,'{\"1\":87,\"2\":12,\"3\":10,\"4\":21,\"5\":15,\"6\":25,\"7\":0,\"8\":10,\"9\":14}'),(23,22,'{\"1\":56,\"2\":34,\"3\":60,\"4\":50,\"5\":50,\"6\":57,\"7\":57,\"8\":50,\"9\":53}');
/*!40000 ALTER TABLE `h_user_question` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-10 16:16:09
