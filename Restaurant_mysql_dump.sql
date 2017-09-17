-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.4.3-beta-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema theson
--

CREATE DATABASE IF NOT EXISTS theson;
USE theson;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(32) NOT NULL,
  `pw` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`id`,`pw`) VALUES 
 ('',''),
 ('???','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category` varchar(30) NOT NULL DEFAULT '',
  `ref` varchar(30) NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` (`category`,`ref`) VALUES 
 ('건어물','식재료'),
 ('곡류','식재료'),
 ('과일류','식재료'),
 ('기타','식재료'),
 ('기타/사리류','부메뉴'),
 ('면류','주메뉴'),
 ('부탄가스','소모품'),
 ('불고기류','주메뉴'),
 ('식기류','소모품'),
 ('어패류','식재료'),
 ('육류','식재료'),
 ('음료','식재료'),
 ('음료/주류','부메뉴'),
 ('전골/찌개류','주메뉴'),
 ('조미료','식재료'),
 ('주류','식재료'),
 ('주방용품','소모품'),
 ('채소류','식재료');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;


--
-- Definition of table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cphone` int(11) NOT NULL,
  `cname` varchar(20) DEFAULT NULL,
  `miliege` int(11) DEFAULT NULL,
  PRIMARY KEY (`cphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


--
-- Definition of table `food`
--

DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `fdate` date DEFAULT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `fleft` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` (`fdate`,`name`,`fleft`) VALUES 
 ('2009-11-18','곱창',1190),
 ('2009-11-18','돼지간',600),
 ('2009-11-18','돼지갈비',2900),
 ('2009-11-18','삼겹살',3250),
 ('2009-11-10','소등심',1400);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;


--
-- Definition of table `gaga`
--

DROP TABLE IF EXISTS `gaga`;
CREATE TABLE `gaga` (
  `num` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `hobby` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gaga`
--

/*!40000 ALTER TABLE `gaga` DISABLE KEYS */;
INSERT INTO `gaga` (`num`,`name`,`hobby`) VALUES 
 (100,'오호호','석우는 갔다');
/*!40000 ALTER TABLE `gaga` ENABLE KEYS */;


--
-- Definition of table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `category` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `menu` varchar(20) CHARACTER SET utf8 NOT NULL,
  `price` int(10) unsigned NOT NULL,
  `food1` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `quant1` int(10) unsigned DEFAULT NULL,
  `food2` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `quant2` int(10) unsigned DEFAULT NULL,
  `imgurl` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`menu`) USING BTREE,
  KEY `category` (`category`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `menu`
--

/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`category`,`menu`,`price`,`food1`,`quant1`,`food2`,`quant2`,`imgurl`) VALUES 
 ('전골/찌개류','갈비탕',5500,'',0,NULL,NULL,0x696D6167652F67616C626974616E672E6A7067),
 ('전골/찌개류','곰탕',4000,'',0,NULL,NULL,0x696D6167652F676F6D74616E672E6A7067),
 ('전골/찌개류','곱창전골',6000,0xEAB3B1ECB0BD,10,NULL,NULL,0x696D6167652F676F706368616E672E6A7067),
 ('음료/주류','국화주',3000,'',0,NULL,NULL,0x696D6167652F677567687577612E6A7067),
 ('전골/찌개류','김치전골',5500,0xEB8FBCECA780EAB084,2,NULL,NULL,0x696D6167652F67696D63686967656E676F6C2E6A7067),
 ('불고기류','등심구이',3500,'',0,NULL,NULL,0x696D6167652F6D6561742E6A7067),
 ('기타/사리류','라면사리',1000,'',0,NULL,NULL,0x696D6167652F72616D79656E736172792E6A7067),
 ('음료/주류','막걸리',2500,'',0,NULL,NULL,0x696D6167652F6D616767656C792E6A7067),
 ('기타/사리류','만두사리',1500,'',0,NULL,NULL,0x696D6167652F6D616E6475736172692E6A7067),
 ('음료/주류','맥주',2000,'',0,NULL,NULL,0x696D6167652F6D61636B6A752E6A7067),
 ('면류','물냉면',3600,'',0,NULL,NULL,0x696D6167652F72616D656E2E6A7067),
 ('기타/사리류','밥 한공기',1000,'',0,NULL,NULL,0x696D6167652F68616E676F6E6767692E6A7067),
 ('면류','비빔냉면',3600,'',0,NULL,NULL,0x696D6167652F626962696D6E616E676D79656E2E6A7067),
 ('음료/주류','사이다',1000,'',0,NULL,NULL,0x696D6167652F736964612E6A7067),
 ('불고기류','삼겹살구이',3300,0xEC82BCEAB2B9EC82B4,10,NULL,NULL,0x696D6167652F73616D6779657073616C2E6A7067),
 ('전골/찌개류','설렁탕',5000,'',0,NULL,NULL,0x696D6167652F73656F6C656E6774616E672E6A7067),
 ('음료/주류','소주',2000,'',0,NULL,NULL,0x696D6167652F736F6A752E6A7067),
 ('기타/사리류','수제비사리',1500,'',0,NULL,NULL,0x696D6167652F737567656269736172692E6A7067),
 ('불고기류','안심구이',4000,'',0,NULL,NULL,0x696D6167652F616E73696D6775692E6A7067),
 ('불고기류','양념갈비',4000,'',0,NULL,NULL,0x696D6167652F79616E676E79656D67616C62692E6A7067),
 ('불고기류','양념불고기',3800,'',0,NULL,NULL,0x696D6167652F79616E676E79656D62756C676F67692E6A7067),
 ('기타/사리류','우동사리',1300,'',0,NULL,NULL,0x696D6167652F75646F6E67736172692E6A7067),
 ('전골/찌개류','육개장',4500,'',0,NULL,NULL,0x696D6167652F796F75636B67616A616E672E6A7067),
 ('면류','잡채',2800,'',0,NULL,NULL,0x696D6167652F6A6F70636861652E6A7067),
 ('면류','칼국수',3000,'',0,NULL,NULL,0x696D6167652F6B616C67756773752E6A7067),
 ('음료/주류','콜라',1000,'',0,NULL,NULL,0x696D6167652F636F6C612E6A7067),
 ('전골/찌개류','해장국',4500,'',0,NULL,NULL,0x696D6167652F6861656A616E6767756B2E6A7067),
 ('음료/주류','환타',1000,'',0,NULL,NULL,0x696D6167652F6877616E74612E6A7067);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;


--
-- Definition of table `nowtable`
--

DROP TABLE IF EXISTS `nowtable`;
CREATE TABLE `nowtable` (
  `tblnum` int(11) NOT NULL DEFAULT '0',
  `menu` varchar(30) NOT NULL DEFAULT '',
  `price` int(11) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  PRIMARY KEY (`tblnum`,`menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nowtable`
--

/*!40000 ALTER TABLE `nowtable` DISABLE KEYS */;
INSERT INTO `nowtable` (`tblnum`,`menu`,`price`,`quant`) VALUES 
 (3,'맥주',2000,2),
 (3,'밥 한공기',1000,3),
 (3,'비빔냉면',3600,2),
 (3,'안심구이',4000,1),
 (7,'국화주',3000,1),
 (7,'라면사리',1000,1),
 (7,'만두사리',1500,1),
 (7,'물냉면',3600,1),
 (7,'밥 한공기',1000,1),
 (7,'비빔냉면',3600,1),
 (7,'수제비사리',1500,1);
/*!40000 ALTER TABLE `nowtable` ENABLE KEYS */;


--
-- Definition of table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE `sales` (
  `sdate` date NOT NULL,
  `stime` time NOT NULL,
  `menu` varchar(30) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `cphone` int(11) DEFAULT NULL,
  `tblnum` int(11) DEFAULT NULL,
  `discnt` int(11) DEFAULT NULL,
  PRIMARY KEY (`sdate`,`stime`,`menu`),
  KEY `cphone` (`cphone`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`cphone`) REFERENCES `customer` (`cphone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sales`
--

/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` (`sdate`,`stime`,`menu`,`amount`,`cphone`,`tblnum`,`discnt`) VALUES 
 ('2009-11-15','14:38:32','사이다',1000,NULL,6,NULL),
 ('2009-11-15','14:38:32','소주',2000,NULL,6,NULL),
 ('2009-11-15','14:38:32','콜라',1000,NULL,6,NULL),
 ('2009-11-15','16:54:28','곰탕',4000,NULL,15,NULL),
 ('2009-11-15','16:54:28','라면사리',1000,NULL,15,NULL),
 ('2009-11-15','16:54:28','만두사리',1500,NULL,15,NULL),
 ('2009-11-15','16:54:28','밥 한공기',1000,NULL,15,NULL),
 ('2009-11-15','16:54:28','설렁탕',5000,NULL,15,NULL),
 ('2009-11-15','16:54:28','수제비사리',1500,NULL,15,NULL),
 ('2009-11-16','20:56:23','안심구이',4000,NULL,6,NULL),
 ('2009-11-16','20:56:23','양념갈비',4000,NULL,6,NULL),
 ('2009-11-16','70:57:03','삼겹살구이',3300,NULL,6,NULL),
 ('2009-11-17','06:53:39','등심구이',3500,NULL,1,NULL),
 ('2009-11-17','06:53:39','라면사리',1000,NULL,1,NULL),
 ('2009-11-17','06:53:39','맥주',2000,NULL,1,NULL),
 ('2009-11-17','06:53:39','밥 한공기',1000,NULL,1,NULL),
 ('2009-11-17','06:53:39','소주',2000,NULL,1,NULL),
 ('2009-11-17','06:53:39','수제비사리',1500,NULL,1,NULL),
 ('2009-11-17','06:53:39','안심구이',4000,NULL,1,NULL),
 ('2009-11-17','06:53:39','양념불고기',3800,NULL,1,NULL),
 ('2009-11-17','06:53:39','콜라',1000,NULL,1,NULL),
 ('2009-11-17','06:53:43','등심구이',3500,NULL,1,NULL),
 ('2009-11-17','06:53:43','라면사리',1000,NULL,1,NULL),
 ('2009-11-17','06:53:43','맥주',2000,NULL,1,NULL),
 ('2009-11-17','06:53:43','밥 한공기',1000,NULL,1,NULL),
 ('2009-11-17','06:53:43','소주',2000,NULL,1,NULL),
 ('2009-11-17','06:53:43','수제비사리',1500,NULL,1,NULL),
 ('2009-11-17','06:53:43','안심구이',4000,NULL,1,NULL),
 ('2009-11-17','06:53:43','양념불고기',3800,NULL,1,NULL),
 ('2009-11-17','06:53:43','콜라',1000,NULL,1,NULL),
 ('2009-11-17','06:54:55','라면사리',1000,NULL,2,NULL),
 ('2009-11-17','06:54:55','만두사리',1500,NULL,2,NULL),
 ('2009-11-17','06:54:55','밥 한공기',1000,NULL,2,NULL),
 ('2009-11-17','06:54:55','비빔냉면',3600,NULL,2,NULL),
 ('2009-11-17','06:54:55','수제비사리',1500,NULL,2,NULL),
 ('2009-11-17','06:54:55','잡채',2800,NULL,2,NULL),
 ('2009-11-17','07:00:39','등심구이',3500,NULL,1,NULL),
 ('2009-11-17','07:00:39','라면사리',1000,NULL,1,NULL),
 ('2009-11-17','07:00:39','맥주',2000,NULL,1,NULL),
 ('2009-11-17','07:00:39','밥 한공기',1000,NULL,1,NULL),
 ('2009-11-17','07:00:39','소주',2000,NULL,1,NULL),
 ('2009-11-17','07:00:39','수제비사리',1500,NULL,1,NULL),
 ('2009-11-17','07:00:39','안심구이',4000,NULL,1,NULL),
 ('2009-11-17','07:00:39','양념불고기',3800,NULL,1,NULL),
 ('2009-11-17','07:00:39','콜라',1000,NULL,1,NULL),
 ('2009-11-17','07:05:22','라면사리',1000,NULL,2,NULL),
 ('2009-11-17','07:05:22','만두사리',1500,NULL,2,NULL),
 ('2009-11-17','07:05:22','밥 한공기',1000,NULL,2,NULL),
 ('2009-11-17','07:05:22','비빔냉면',3600,NULL,2,NULL),
 ('2009-11-17','07:05:22','수제비사리',1500,NULL,2,NULL),
 ('2009-11-17','07:05:22','잡채',2800,NULL,2,NULL),
 ('2009-11-17','07:07:06','라면사리',1000,NULL,2,NULL),
 ('2009-11-17','07:07:06','만두사리',1500,NULL,2,NULL),
 ('2009-11-17','07:07:06','밥 한공기',1000,NULL,2,NULL),
 ('2009-11-17','07:07:06','비빔냉면',3600,NULL,2,NULL),
 ('2009-11-17','07:07:06','수제비사리',1500,NULL,2,NULL),
 ('2009-11-17','07:07:06','잡채',2800,NULL,2,NULL),
 ('2009-11-17','07:09:21','등심구이',3500,NULL,1,NULL),
 ('2009-11-17','07:09:21','라면사리',1000,NULL,1,NULL),
 ('2009-11-17','07:09:21','맥주',2000,NULL,1,NULL),
 ('2009-11-17','07:09:21','밥 한공기',1000,NULL,1,NULL),
 ('2009-11-17','07:09:21','소주',2000,NULL,1,NULL),
 ('2009-11-17','07:09:21','수제비사리',1500,NULL,1,NULL),
 ('2009-11-17','07:09:21','안심구이',4000,NULL,1,NULL),
 ('2009-11-17','07:09:21','양념불고기',3800,NULL,1,NULL),
 ('2009-11-17','07:09:21','콜라',1000,NULL,1,NULL),
 ('2009-11-17','07:09:24','라면사리',1000,NULL,2,NULL),
 ('2009-11-17','07:09:24','만두사리',1500,NULL,2,NULL),
 ('2009-11-17','07:09:24','밥 한공기',1000,NULL,2,NULL),
 ('2009-11-17','07:09:24','비빔냉면',3600,NULL,2,NULL),
 ('2009-11-17','07:09:24','수제비사리',1500,NULL,2,NULL),
 ('2009-11-17','07:09:24','잡채',2800,NULL,2,NULL),
 ('2009-11-17','07:09:27','등심구이',3500,NULL,4,NULL),
 ('2009-11-17','07:09:27','만두사리',1500,NULL,4,NULL),
 ('2009-11-17','07:09:27','밥 한공기',1000,NULL,4,NULL),
 ('2009-11-17','07:09:27','삼겹살구이',3300,NULL,4,NULL),
 ('2009-11-17','07:09:27','수제비사리',1500,NULL,4,NULL),
 ('2009-11-17','07:09:27','안심구이',4000,NULL,4,NULL),
 ('2009-11-17','07:09:27','양념갈비',4000,NULL,4,NULL),
 ('2009-11-17','07:09:32','갈비탕',5500,NULL,15,NULL),
 ('2009-11-17','07:09:32','곱창전골',6000,NULL,15,NULL),
 ('2009-11-17','07:09:32','김치전골',5500,NULL,15,NULL),
 ('2009-11-17','07:09:32','만두사리',1500,NULL,15,NULL),
 ('2009-11-17','07:09:32','밥 한공기',1000,NULL,15,NULL),
 ('2009-11-17','07:09:34','라면사리',1000,NULL,25,NULL),
 ('2009-11-17','07:09:34','만두사리',1500,NULL,25,NULL),
 ('2009-11-17','07:09:34','수제비사리',1500,NULL,25,NULL),
 ('2009-11-17','07:09:34','환타',1000,NULL,25,NULL),
 ('2009-11-17','07:18:56','비빔냉면',3600,NULL,8,NULL),
 ('2009-11-17','07:18:56','칼국수',3000,NULL,8,NULL),
 ('2009-11-17','11:01:22','안심구이',4000,NULL,8,NULL),
 ('2009-11-17','11:01:22','양념불고기',3800,NULL,8,NULL),
 ('2009-11-17','21:13:10','만두사리',1500,NULL,18,NULL),
 ('2009-11-17','21:13:10','맥주',2000,NULL,18,NULL),
 ('2009-11-17','21:13:10','밥 한공기',1000,NULL,18,NULL),
 ('2009-11-17','21:13:10','우동사리',1300,NULL,18,NULL),
 ('2009-11-18','02:27:02','갈비탕',5500,NULL,3,NULL),
 ('2009-11-18','02:27:02','곱창전골',6000,NULL,3,NULL),
 ('2009-11-18','02:27:02','국화주',3000,NULL,3,NULL),
 ('2009-11-18','02:27:02','맥주',2000,NULL,3,NULL),
 ('2009-11-18','02:27:02','사이다',1000,NULL,3,NULL),
 ('2009-11-18','02:27:02','소주',2000,NULL,3,NULL),
 ('2009-11-18','02:27:02','육개장',4500,NULL,3,NULL),
 ('2009-11-18','02:27:02','콜라',1000,NULL,3,NULL),
 ('2009-11-18','02:27:02','해장국',4500,NULL,3,NULL),
 ('2009-11-18','02:27:05','국화주',3000,NULL,2,NULL),
 ('2009-11-18','02:27:05','등심구이',3500,NULL,2,NULL),
 ('2009-11-18','02:27:05','막걸리',2500,NULL,2,NULL),
 ('2009-11-18','02:27:05','맥주',2000,NULL,2,NULL),
 ('2009-11-18','02:27:05','사이다',1000,NULL,2,NULL),
 ('2009-11-18','02:27:05','삼겹살구이',3300,NULL,2,NULL),
 ('2009-11-18','02:27:05','소주',2000,NULL,2,NULL),
 ('2009-11-18','02:27:05','안심구이',4000,NULL,2,NULL),
 ('2009-11-18','02:27:05','콜라',1000,NULL,2,NULL),
 ('2009-11-18','02:27:05','환타',1000,NULL,2,NULL),
 ('2009-11-18','02:27:06','등심구이',3500,NULL,1,NULL),
 ('2009-11-18','02:27:06','만두사리',1500,NULL,1,NULL),
 ('2009-11-18','02:27:06','물냉면',3600,NULL,1,NULL),
 ('2009-11-18','02:27:06','밥 한공기',1000,NULL,1,NULL),
 ('2009-11-18','02:27:06','삼겹살구이',3300,NULL,1,NULL),
 ('2009-11-18','02:27:06','수제비사리',1500,NULL,1,NULL),
 ('2009-11-18','02:27:06','안심구이',4000,NULL,1,NULL),
 ('2009-11-18','02:27:06','우동사리',1300,NULL,1,NULL),
 ('2009-11-18','02:27:08','비빔냉면',3600,NULL,8,NULL),
 ('2009-11-18','02:27:08','칼국수',3000,NULL,8,NULL),
 ('2009-11-18','02:27:11','만두사리',1500,NULL,10,NULL),
 ('2009-11-18','02:27:11','수제비사리',1500,NULL,10,NULL),
 ('2009-11-18','02:27:11','안심구이',4000,NULL,10,NULL),
 ('2009-11-18','02:27:11','양념갈비',4000,NULL,10,NULL),
 ('2009-11-18','02:27:11','양념불고기',3800,NULL,10,NULL),
 ('2009-11-18','02:27:11','우동사리',1300,NULL,10,NULL),
 ('2009-11-18','02:27:13','등심구이',3500,NULL,13,NULL),
 ('2009-11-18','02:27:13','안심구이',4000,NULL,13,NULL),
 ('2009-11-18','02:27:15','비빔냉면',3600,NULL,12,NULL),
 ('2009-11-18','02:27:15','칼국수',3000,NULL,12,NULL),
 ('2009-11-18','05:46:15','삼겹살구이',3300,NULL,3,NULL),
 ('2009-11-18','05:46:15','양념갈비',4000,NULL,3,NULL),
 ('2009-11-18','05:46:15','양념불고기',3800,NULL,3,NULL),
 ('2009-11-18','05:57:35','곱창전골',6000,NULL,1,NULL),
 ('2009-11-18','05:57:35','삼겹살구이',3300,NULL,1,NULL),
 ('2009-11-18','05:57:35','양념갈비',4000,NULL,1,NULL),
 ('2009-11-18','05:57:35','양념불고기',3800,NULL,1,NULL),
 ('2009-11-18','06:18:26','김치전골',5500,NULL,18,NULL),
 ('2009-11-18','06:23:04','비빔냉면',3600,NULL,19,NULL),
 ('2009-11-18','06:23:04','삼겹살구이',3300,NULL,19,NULL),
 ('2009-11-18','06:23:04','양념갈비',4000,NULL,19,NULL),
 ('2009-11-18','06:23:04','양념불고기',3800,NULL,19,NULL),
 ('2009-11-18','06:23:04','잡채',2800,NULL,19,NULL),
 ('2009-11-18','06:23:38','등심구이',3500,NULL,19,NULL),
 ('2009-11-18','06:23:38','비빔냉면',3600,NULL,19,NULL),
 ('2009-11-18','06:23:38','안심구이',4000,NULL,19,NULL),
 ('2009-11-18','06:23:38','양념불고기',3800,NULL,19,NULL),
 ('2009-11-18','06:23:38','잡채',2800,NULL,19,NULL),
 ('2009-11-18','06:25:11','비빔냉면',3600,NULL,1,NULL),
 ('2009-11-18','06:25:11','잡채',2800,NULL,1,NULL),
 ('2009-11-18','06:25:11','칼국수',3000,NULL,1,NULL),
 ('2009-11-18','06:26:09','잡채',2800,NULL,1,NULL),
 ('2009-11-18','06:26:09','칼국수',3000,NULL,1,NULL),
 ('2009-11-18','06:26:53','김치전골',5500,NULL,1,NULL),
 ('2009-11-18','06:30:44','김치전골',5500,NULL,19,NULL),
 ('2009-11-18','06:31:24','김치전골',5500,NULL,18,NULL),
 ('2009-11-18','06:31:38','김치전골',5500,NULL,8,NULL),
 ('2009-11-18','06:32:54','곱창전골',6000,NULL,7,NULL),
 ('2009-11-18','06:33:15','곱창전골',6000,NULL,13,NULL),
 ('2009-11-18','06:34:39','김치전골',5500,NULL,2,NULL),
 ('2009-11-18','06:40:07','수제비사리',1500,NULL,6,NULL),
 ('2009-11-18','06:40:09','우동사리',1300,NULL,6,NULL),
 ('2009-11-18','06:40:46','곱창전골',6000,NULL,1,NULL),
 ('2009-11-18','06:41:03','김치전골',5500,NULL,6,NULL),
 ('2009-11-18','06:42:24','곱창전골',6000,NULL,1,NULL),
 ('2009-11-18','06:42:24','설렁탕',5000,NULL,1,NULL),
 ('2009-11-18','06:42:24','육개장',4500,NULL,1,NULL),
 ('2009-11-18','14:47:39','맥주',2000,NULL,1,NULL),
 ('2009-11-18','14:47:39','소주',2000,NULL,1,NULL),
 ('2009-11-18','14:47:39','환타',1000,NULL,1,NULL),
 ('2009-11-18','15:05:40','등심구이',3500,NULL,13,NULL),
 ('2009-11-18','15:05:40','막걸리',2500,NULL,13,NULL),
 ('2009-11-18','15:05:40','만두사리',1500,NULL,13,NULL),
 ('2009-11-18','15:05:40','소주',2000,NULL,13,NULL),
 ('2009-11-18','15:05:40','안심구이',4000,NULL,13,NULL),
 ('2009-11-18','15:05:40','우동사리',1300,NULL,13,NULL),
 ('2009-11-18','15:06:51','곱창전골',6000,NULL,7,NULL),
 ('2009-11-18','18:10:02','등심구이',3500,NULL,3,NULL),
 ('2009-11-18','19:13:41','삼겹살구이',3300,NULL,1,NULL),
 ('2009-11-18','19:13:41','수제비사리',1500,NULL,1,NULL),
 ('2009-11-18','19:13:41','양념불고기',3800,NULL,1,NULL),
 ('2009-11-18','19:13:41','우동사리',1300,NULL,1,NULL),
 ('2009-11-18','19:17:46','등심구이',3500,NULL,23,NULL),
 ('2009-11-18','19:17:46','만두사리',1500,NULL,23,NULL),
 ('2009-11-18','19:17:46','밥 한공기',1000,NULL,23,NULL),
 ('2009-11-18','19:17:46','양념갈비',4000,NULL,23,NULL),
 ('2009-11-18','19:17:46','양념불고기',3800,NULL,23,NULL);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;


--
-- Definition of table `spend`
--

DROP TABLE IF EXISTS `spend`;
CREATE TABLE `spend` (
  `sdate` date NOT NULL DEFAULT '0000-00-00',
  `content` varchar(30) NOT NULL DEFAULT '',
  `category` varchar(30) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `quant` int(11) DEFAULT NULL,
  `store` varchar(30) DEFAULT NULL,
  KEY `category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `spend`
--

/*!40000 ALTER TABLE `spend` DISABLE KEYS */;
INSERT INTO `spend` (`sdate`,`content`,`category`,`weight`,`price`,`quant`,`store`) VALUES 
 ('2009-11-16','대파','채소류',200,2500,NULL,'한진상회'),
 ('2009-11-16','양파','채소류',200,2000,NULL,'한진상회'),
 ('2009-11-16','쪽파','채소류',250,3000,NULL,'한진상회'),
 ('2009-11-17','부탄가스','부탄가스',0,20000,20,'대양상회'),
 ('2009-11-17','쥐포','건어물',900,10000,50,'소강상회'),
 ('2009-11-18','dfd','건어물',20,30,0,'dd'),
 ('2009-11-18','sds','건어물',23,300,0,''),
 ('2009-11-18','곱창','육류',300,2000,0,'준화상회'),
 ('2009-11-18','돼지간','육류',600,3000,0,'준희상회'),
 ('2009-11-18','돼지갈비','육류',800,3000,0,'준회상회'),
 ('2009-11-18','돼지갈비','육류',900,3000,0,'하하상회'),
 ('2009-11-18','돼지갈비','육류',900,3000,0,'하하상회'),
 ('2009-11-18','곱창','육류',600,6000,0,'한화상회'),
 ('2009-11-18','곱창','육류',1000,3000,0,'한화상회'),
 ('2009-11-18','삼겹살','육류',3000,70000,0,'남해상회');
/*!40000 ALTER TABLE `spend` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
