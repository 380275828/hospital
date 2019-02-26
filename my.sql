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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_admin`
--

LOCK TABLES `h_admin` WRITE;
/*!40000 ALTER TABLE `h_admin` DISABLE KEYS */;
INSERT INTO `h_admin` VALUES (1,'admin','lhn@lhn','13888888888',1,'系统管理员',0),(4,'李六','123456','13777777777',1,'北大医学院博士',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_question`
--

LOCK TABLES `h_question` WRITE;
/*!40000 ALTER TABLE `h_question` DISABLE KEYS */;
INSERT INTO `h_question` VALUES (1,'你经常感到疲惫吗','[1,2,3,4,5]',1),(3,'你经常使用电脑吗','[1,2,3,4,5]',1),(4,'你经常熬夜吗','[1,2,3,4,5]',2),(5,'你经常使用手机吗','[1,2,3,4,5]',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_user`
--

LOCK TABLES `h_user` WRITE;
/*!40000 ALTER TABLE `h_user` DISABLE KEYS */;
INSERT INTO `h_user` VALUES (13,'234','0','234',0,'234',0),(14,'李浩宁','1','123456',23,'18404713245',0),(16,'小李','1','123456',12,'13444444444',0),(21,'123245','1','123',123,'1234',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_user_question`
--

LOCK TABLES `h_user_question` WRITE;
/*!40000 ALTER TABLE `h_user_question` DISABLE KEYS */;
INSERT INTO `h_user_question` VALUES (1,12,'4'),(17,13,'19'),(18,16,'13'),(20,21,'{\"1\":50,\"2\":62}');
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

-- Dump completed on 2019-02-26 11:29:49
