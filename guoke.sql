-- MySQL dump 10.13  Distrib 5.5.44, for osx10.10 (x86_64)
--
-- Host: localhost    Database: guoke
-- ------------------------------------------------------
-- Server version	5.5.44-log

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
-- Table structure for table `c_article`
--

DROP TABLE IF EXISTS `c_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` text,
  `release_date` datetime NOT NULL,
  `visit_volumn` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `c_article_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `c_image` (`id`),
  CONSTRAINT `c_article_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `c_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_article`
--

LOCK TABLES `c_article` WRITE;
/*!40000 ALTER TABLE `c_article` DISABLE KEYS */;
INSERT INTO `c_article` VALUES (1,'智慧城市','scxv','0000-00-00 00:00:00',0,10,16,'0000-00-00 00:00:00','','',''),(4,'企业应用','依托于开放平台的各类企业应用并不是独立的系统，这些应用多是彼此连接的、\r\n							相互通过不同层次进行交互，同时这些应用又都有可能与其它企业的相关应用连接，从而构成一个结构复\r\n							杂的、跨越Intranet和Internet的分布式企业应用群集........','0000-00-00 00:00:00',0,10,16,'0000-00-00 00:00:00','','',''),(5,'移动互联网','依托于开放平台的各类企业应用并不是独立的系统，这些应用多是彼此连接的、相互通过不同层\r\n							次进行交互，同时这些应用又都有可能与其它企业的相关应用连接，从而构成一个结构复杂的、\r\n							跨越Intranet和Internet的分布式企业应用群集........','0000-00-00 00:00:00',0,10,16,'0000-00-00 00:00:00','','',''),(6,'国科数据中心成功举办开放日活动','6月24日，由苏州国科综合数据中心有限公司主办的“招商载体开放日——揭秘国科数据中心”活动在国科数据中心成功举办。本次活动邀请了20余位来自苏州工业园区各招商中心的业务骨干及相关代表，旨在通过现场宣讲和参观活动与园区负责招商工作的各位合作伙伴进行更加深入的互动，便于在今后的招商工作中能够与客户进行更加有效的沟通，将国科数据中心作为苏州工业园区的一个招商亮点进行推介。同时，通过本次活动，国科数据中心在拓展营销渠道，提高品牌影响力方面也进行了一次有益的尝试。;6月24日，由苏州国科综合数据中心有限公司主办的“招商载体开放日——揭秘国科数据中心”活动在国科数据中心成功举办。本次活动邀请了20余位来自苏州工业园区各招商中心的业务骨干及相关代表，旨在通过现场宣讲和参观活动与园区负责招商工作的各位合作伙伴进行更加深入的互动，便于在今后的招商工作中能够与客户进行更加有效的沟通，将国科数据中心作为苏州工业园区的一个招商亮点进行推介。同时，通过本次活动，国科数据中心在拓展营销渠道，提高品牌影响力方面也进行了一次有益的尝试。','2015-09-01 00:00:00',126,11,21,'0000-00-00 00:00:00','','',''),(8,'国科测试数据','2014年10月20—21日，中国科学院文献情报中心成功举办“2014中国开放获取周（China Open Access Week 2014）”。这是国内第3届面向全国开放获取的宣传活动。本次会议共有22场专题演讲，展示25份来自大陆、香港、台湾的机构知识库案例展板，超过400人参加本次会议。会议由中国科学院文献情报中心主办，中国科学院自然期刊编辑研究会及中国图书馆学会专业图书馆分会秘书处合作召集国内期刊界、图书馆界代表。;2014年10月20—21日，中国科学院文献情报中心成功举办“2014中国开放获取周（China Open Access Week 2014）”。这是国内第3届面向全国开放获取的宣传活动。本次会议共有22场专题演讲，展示25份来自大陆、香港、台湾的机构知识库案例展板，超过400人参加本次会议。会议由中国科学院文献情报中心主办，中国科学院自然期刊编辑研究会及中国图书馆学会专业图书馆分会秘书处合作召集国内期刊界、图书馆界代表。','2015-06-25 00:00:00',52,11,21,'0000-00-00 00:00:00','','',''),(9,'','苏州国科数据中心可以为高科技中小企业、政府机构、金融机构、新兴互联网服务企业提供高品质\r\n							的托管、IDC基础服务和云计算服务，旨在打造成江苏省乃至华东地区最大的灾备中心、云服务中心、IT外包服务中心。','0000-00-00 00:00:00',0,13,27,'0000-00-00 00:00:00','','',''),(10,'','TEST苏州国科数据中心可以为高科技中小企业、政府机构、金融机构、新兴互联网服务企业提供高品质\r\n的托管、IDC基础服务和云计算服务，旨在打造成江苏省乃至华东地区最大的灾备中心、云服务中心、IT外包服务中心。','0000-00-00 00:00:00',0,13,27,'0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_category`
--

DROP TABLE IF EXISTS `c_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mark` varchar(20) NOT NULL,
  `content` text,
  `parent_id` int(11) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_category`
--

LOCK TABLES `c_category` WRITE;
/*!40000 ALTER TABLE `c_category` DISABLE KEYS */;
INSERT INTO `c_category` VALUES (1,'计算test','calculate','公共网络宽带服务;公共网络网络接入端口服务;安全服务',14,'1','0000-00-00 00:00:00','','',''),(4,'存储','storage','公共网络宽带服务;公共网络网络接入端口服务',14,'3','0000-00-00 00:00:00','','',''),(5,'网络','network','公共网络宽带服务;公共网络网络接入端口服务;',14,'4','0000-00-00 00:00:00','','',''),(6,'安全','security','公共网络宽带服务;公共网络网络接入端口服务;',14,'5','0000-00-00 00:00:00','','',''),(7,'软件','software','公共网络宽带服务;公共网络网络接入端口服务;',14,'6','0000-00-00 00:00:00','','',''),(8,'管理','management','公共网络宽带服务;公共网络网络接入端口服务;',14,'7','0000-00-00 00:00:00','','',''),(14,'product','',NULL,0,'0','0000-00-00 00:00:00','','',''),(16,'solution','',NULL,0,'0','0000-00-00 00:00:00','','',''),(18,'news','',NULL,17,'17;18;19;20','0000-00-00 00:00:00','','',''),(21,'公司新闻','',NULL,18,'0','0000-00-00 00:00:00','','',''),(22,'通知活动','',NULL,18,'0','0000-00-00 00:00:00','','',''),(25,'行业动态·','',NULL,18,'0','0000-00-00 00:00:00','','',''),(26,'煤体聚焦','',NULL,18,'0','0000-00-00 00:00:00','','',''),(27,'about','',NULL,0,'14','0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_category_describe`
--

DROP TABLE IF EXISTS `c_category_describe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_category_describe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `describe` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `c_category_describe_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `c_category` (`id`),
  CONSTRAINT `c_category_describe_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `c_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_category_describe`
--

LOCK TABLES `c_category_describe` WRITE;
/*!40000 ALTER TABLE `c_category_describe` DISABLE KEYS */;
INSERT INTO `c_category_describe` VALUES (1,1,2,'Calculate','0000-00-00 00:00:00','','',''),(4,4,2,'Storage','0000-00-00 00:00:00','','',''),(5,5,2,'Network','0000-00-00 00:00:00','','',''),(6,6,2,'Security','0000-00-00 00:00:00','','',''),(7,7,2,'Software','0000-00-00 00:00:00','','',''),(8,8,2,'Management','0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_category_describe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_contact`
--

DROP TABLE IF EXISTS `c_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(30) NOT NULL,
  `fax` varchar(30) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `website` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_contact`
--

LOCK TABLES `c_contact` WRITE;
/*!40000 ALTER TABLE `c_contact` DISABLE KEYS */;
INSERT INTO `c_contact` VALUES (1,'苏州国科综合数据中心有限公司','苏州工业园区创意产业园','86 512 86548754·','86 512 688545121','215123','http://www.sisdc.com.cn','0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_download`
--

DROP TABLE IF EXISTS `c_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_download` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `server_title` varchar(50) NOT NULL,
  `image_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `c_download_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `c_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_download`
--

LOCK TABLES `c_download` WRITE;
/*!40000 ALTER TABLE `c_download` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_group`
--

DROP TABLE IF EXISTS `c_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `note` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_group`
--

LOCK TABLES `c_group` WRITE;
/*!40000 ALTER TABLE `c_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_groups`
--

DROP TABLE IF EXISTS `c_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `notes` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_groups`
--

LOCK TABLES `c_groups` WRITE;
/*!40000 ALTER TABLE `c_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_image`
--

DROP TABLE IF EXISTS `c_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(200) NOT NULL,
  `image_hover_url` varchar(200) NOT NULL,
  `content` text,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_image`
--

LOCK TABLES `c_image` WRITE;
/*!40000 ALTER TABLE `c_image` DISABLE KEYS */;
INSERT INTO `c_image` VALUES (1,'calculate.png','calculate_hover.png',NULL,'0000-00-00 00:00:00','','',''),(3,'storage.png','storage_hover.png',NULL,'0000-00-00 00:00:00','','',''),(4,'network.png','network_hover.png',NULL,'0000-00-00 00:00:00','','',''),(5,'security.png','security_hover.png',NULL,'0000-00-00 00:00:00','','',''),(6,'software.png','software_hover.png',NULL,'0000-00-00 00:00:00','','',''),(7,'management.png','management_hover.png',NULL,'0000-00-00 00:00:00','','',''),(10,'solution.png','',NULL,'0000-00-00 00:00:00','','',''),(11,'guoke/index.php/responsive/size/1167//news/pic2.png','',NULL,'0000-00-00 00:00:00','','',''),(12,'/guoke/index.php/responsive/size/368/about/pic2.png','',NULL,'0000-00-00 00:00:00','','',''),(13,'about/pic1.png','',NULL,'0000-00-00 00:00:00','','',''),(14,'/guoke/application/static/img/about/banner.png','','Tt苏州国科数据中心;苏州国科数据中心2008年开始立项，2009年着手设计，并在同年下半年动工建设。该数据中心严格按照Tier IV标准设计，采用模块化技术，一期建设规划建筑面积为1.8万平方米，提供1800个左右的机柜，已在2010年10月投入使用；二期规划建筑面积为2.4万平方米，提供2400~2600个左右的机柜，预计将在明年投入使用。','0000-00-00 00:00:00','','',''),(16,'home/jiangyisheng_logo.png','',NULL,'0000-00-00 00:00:00','','',''),(17,'http://localhost/guoke/application/static/img/home/support-banner.png','','国科为客户的托管设备提供国际Tier IV标准机房环境与光纤资源的资源租赁服务。;TEST中国唯一TIER IV 国际认证数据中心，特殊设计的服务器冷池，提升制冷效率，降低能耗，预制机柜间万兆高速光纤，无需另行布线','0000-00-00 00:00:00','','',''),(18,'guoke/application/static/img/news/banner.png','',NULL,'0000-00-00 00:00:00','','',''),(19,'guoke/application/static/img/news/banner.png','',NULL,'0000-00-00 00:00:00','','',''),(20,'guoke/application/static/img/news/banner.png','',NULL,'0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_language`
--

DROP TABLE IF EXISTS `c_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_language`
--

LOCK TABLES `c_language` WRITE;
/*!40000 ALTER TABLE `c_language` DISABLE KEYS */;
INSERT INTO `c_language` VALUES (1,'中文','0000-00-00 00:00:00','','',''),(2,'英语','0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_partner`
--

DROP TABLE IF EXISTS `c_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `c_partner_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `c_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_partner`
--

LOCK TABLES `c_partner` WRITE;
/*!40000 ALTER TABLE `c_partner` DISABLE KEYS */;
INSERT INTO `c_partner` VALUES (1,'姜医生',16,'0000-00-00 00:00:00','','',''),(2,'相宜本草',16,'0000-00-00 00:00:00','','',''),(3,'聚美优品',16,'0000-00-00 00:00:00','','',''),(4,'姜医生',16,'0000-00-00 00:00:00','','',''),(5,'姜医生',16,'0000-00-00 00:00:00','','',''),(6,'姜医生',16,'0000-00-00 00:00:00','','',''),(7,'姜医生',16,'0000-00-00 00:00:00','','',''),(8,'姜医生',16,'0000-00-00 00:00:00','','',''),(9,'姜医生',16,'0000-00-00 00:00:00','','',''),(10,'姜医生',16,'0000-00-00 00:00:00','','',''),(11,'姜医生',16,'0000-00-00 00:00:00','','',''),(12,'姜医生',16,'0000-00-00 00:00:00','','',''),(13,'姜医生',16,'0000-00-00 00:00:00','','',''),(14,'姜医生',16,'0000-00-00 00:00:00','','',''),(15,'姜医生',16,'0000-00-00 00:00:00','','',''),(16,'姜医生',16,'0000-00-00 00:00:00','','',''),(17,'姜医生',16,'0000-00-00 00:00:00','','',''),(18,'姜医生',16,'0000-00-00 00:00:00','','',''),(19,'姜医生',16,'0000-00-00 00:00:00','','',''),(20,'姜医生',16,'0000-00-00 00:00:00','','',''),(21,'姜医生',16,'0000-00-00 00:00:00','','',''),(22,'姜医生',16,'0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_product`
--

DROP TABLE IF EXISTS `c_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `mark` varchar(30) NOT NULL,
  `brief` text,
  `feature` text,
  `standard` text,
  `requirement` text,
  `category_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `c_product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `c_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_product`
--

LOCK TABLES `c_product` WRITE;
/*!40000 ALTER TABLE `c_product` DISABLE KEYS */;
INSERT INTO `c_product` VALUES (1,'虚拟服务器','','虚拟服务器简介',NULL,NULL,NULL,1,'0000-00-00 00:00:00','','',''),(2,'空间租赁','','空间租赁简介',NULL,NULL,NULL,1,'0000-00-00 00:00:00','','',''),(3,'备份恢复','',NULL,NULL,NULL,NULL,4,'0000-00-00 00:00:00','','',''),(4,'灾难恢复','',NULL,NULL,NULL,NULL,4,'0000-00-00 00:00:00','','',''),(5,'公有网络','',NULL,NULL,NULL,NULL,5,'0000-00-00 00:00:00','','',''),(6,'私有网络','',NULL,NULL,NULL,NULL,5,'0000-00-00 00:00:00','','',''),(7,'虚拟网关','',NULL,NULL,NULL,NULL,5,'0000-00-00 00:00:00','','',''),(8,'漏洞扫描','',NULL,NULL,NULL,NULL,6,'0000-00-00 00:00:00','','',''),(9,'操作系统','',NULL,NULL,NULL,NULL,7,'0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_recruit`
--

DROP TABLE IF EXISTS `c_recruit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_recruit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `requirement` text,
  `image_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `is_delete` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `image_id` (`image_id`),
  CONSTRAINT `c_recruit_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `c_image` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_recruit`
--

LOCK TABLES `c_recruit` WRITE;
/*!40000 ALTER TABLE `c_recruit` DISABLE KEYS */;
INSERT INTO `c_recruit` VALUES (1,'市场主管','1.主科以上学历，市场营销，广告或者相关专业优先;2.三年以上市场相关经验;3.形象气质良好',12,'0000-00-00 00:00:00','','',''),(2,'销售经理','1.主科以上学历，市场营销，广告或者相关专业优先;2.三年以上市场相关经验;3.形象气质良好',12,'0000-00-00 00:00:00','','',''),(3,'值班主任','1.主科以上学历，市场营销，广告或者相关专业优先;2.三年以上市场相关经验;3.形象气质良好',12,'0000-00-00 00:00:00','','','');
/*!40000 ALTER TABLE `c_recruit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_user`
--

DROP TABLE IF EXISTS `c_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `c_user_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `c_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_user`
--

LOCK TABLES `c_user` WRITE;
/*!40000 ALTER TABLE `c_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_users`
--

DROP TABLE IF EXISTS `c_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `c_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(60) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `c_users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `c_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `c_users`
--

LOCK TABLES `c_users` WRITE;
/*!40000 ALTER TABLE `c_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phinxlog`
--

DROP TABLE IF EXISTS `phinxlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phinxlog` (
  `version` bigint(20) NOT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phinxlog`
--

LOCK TABLES `phinxlog` WRITE;
/*!40000 ALTER TABLE `phinxlog` DISABLE KEYS */;
INSERT INTO `phinxlog` VALUES (20150330082504,'2015-09-06 01:57:16','2015-09-06 01:57:17');
/*!40000 ALTER TABLE `phinxlog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-08 10:39:04
