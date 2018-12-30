-- MySQL dump 10.13  Distrib 5.6.18, for Win32 (x86)
--
-- Host: localhost    Database: hehe
-- ------------------------------------------------------
-- Server version	5.6.19-enterprise-commercial-advanced

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'副总经理'),(6,'工程部门'),(10,'总助'),(9,'总师办'),(1,'总经理'),(11,'经营部'),(7,'财务部门'),(8,'财务部门经理'),(5,'采购部门'),(4,'预算部门'),(3,'预算部门经理');
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
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1515 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1213,1,21),(1214,1,22),(1215,1,23),(1216,1,24),(1217,1,25),(1218,1,26),(1265,1,27),(1220,1,28),(1221,1,29),(1222,1,30),(1223,1,31),(1253,1,32),(1254,1,33),(1256,1,34),(1259,1,35),(1228,1,36),(1229,1,37),(1230,1,38),(1231,1,39),(1232,1,40),(1233,1,41),(1234,1,42),(1235,1,43),(1236,1,44),(1237,1,45),(1238,1,46),(1239,1,47),(1240,1,48),(1241,1,49),(1242,1,50),(1243,1,51),(1244,1,52),(1245,1,53),(1246,1,54),(1247,1,55),(1248,1,56),(1249,1,57),(1250,1,58),(1251,1,62),(1252,1,63),(1255,1,75),(1258,1,77),(1257,1,78),(1263,1,79),(1266,1,83),(1260,1,84),(1261,1,88),(1267,1,120),(1268,1,121),(1209,1,129),(1210,1,133),(1211,1,143),(1212,1,145),(1219,1,155),(1224,1,160),(1225,1,161),(1226,1,162),(1227,1,163),(1262,1,164),(1264,1,165),(1344,2,21),(1345,2,22),(1346,2,23),(1347,2,24),(1348,2,25),(1349,2,26),(1393,2,27),(1351,2,28),(1352,2,29),(1353,2,30),(1354,2,31),(1384,2,32),(1385,2,33),(1387,2,34),(1388,2,35),(1359,2,36),(1360,2,37),(1361,2,38),(1362,2,39),(1363,2,40),(1364,2,41),(1365,2,42),(1366,2,43),(1367,2,44),(1368,2,45),(1369,2,46),(1370,2,47),(1371,2,48),(1372,2,49),(1373,2,50),(1374,2,51),(1375,2,52),(1376,2,53),(1377,2,54),(1378,2,55),(1379,2,56),(1380,2,57),(1381,2,58),(1382,2,62),(1383,2,63),(1386,2,75),(1389,2,84),(1390,2,88),(1394,2,120),(1395,2,121),(1340,2,129),(1341,2,133),(1342,2,143),(1343,2,145),(1350,2,155),(1355,2,160),(1356,2,161),(1357,2,162),(1358,2,163),(1391,2,164),(1392,2,165),(1284,3,21),(1285,3,22),(1286,3,23),(1287,3,24),(1288,3,25),(1289,3,26),(1336,3,27),(1291,3,28),(1292,3,29),(1293,3,30),(1294,3,31),(1324,3,32),(1325,3,33),(1327,3,34),(1330,3,35),(1299,3,36),(1300,3,37),(1301,3,38),(1302,3,39),(1303,3,40),(1304,3,41),(1305,3,42),(1306,3,43),(1307,3,44),(1308,3,45),(1309,3,46),(1310,3,47),(1311,3,48),(1312,3,49),(1313,3,50),(1314,3,51),(1315,3,52),(1316,3,53),(1317,3,54),(1318,3,55),(1319,3,56),(1320,3,57),(1321,3,58),(1322,3,62),(1323,3,63),(1326,3,75),(1329,3,77),(1328,3,78),(1334,3,79),(1337,3,83),(1331,3,84),(1332,3,88),(1338,3,120),(1339,3,121),(1280,3,129),(1281,3,133),(1282,3,143),(1283,3,145),(1290,3,155),(1295,3,160),(1296,3,161),(1297,3,162),(1298,3,163),(1333,3,164),(1335,3,165),(900,4,24),(901,4,25),(902,4,26),(933,4,27),(904,4,28),(905,4,29),(906,4,31),(927,4,32),(928,4,33),(929,4,34),(930,4,35),(911,4,36),(912,4,37),(913,4,38),(914,4,39),(915,4,40),(916,4,41),(917,4,42),(918,4,43),(919,4,44),(920,4,48),(921,4,49),(922,4,50),(923,4,51),(924,4,52),(925,4,62),(926,4,63),(934,4,83),(931,4,84),(932,4,88),(935,4,120),(936,4,121),(899,4,129),(903,4,155),(907,4,160),(908,4,161),(909,4,162),(910,4,163),(820,5,30),(822,5,31),(824,5,32),(812,5,45),(813,5,46),(814,5,47),(815,5,48),(816,5,49),(817,5,50),(818,5,51),(819,5,52),(821,5,57),(823,5,63),(825,5,75),(826,5,84),(827,5,88),(828,5,114),(829,5,115),(830,5,116),(831,5,117),(832,5,118),(833,5,119),(834,5,120),(835,5,121),(836,5,122),(837,5,123),(838,5,124),(839,5,125),(840,5,127),(778,5,128),(779,5,129),(780,5,130),(781,5,131),(782,5,132),(783,5,133),(784,5,134),(785,5,135),(786,5,136),(787,5,137),(788,5,138),(789,5,139),(790,5,140),(791,5,141),(792,5,142),(793,5,143),(794,5,144),(795,5,145),(796,5,147),(797,5,148),(798,5,149),(799,5,150),(800,5,151),(801,5,152),(802,5,153),(803,5,154),(804,5,156),(805,5,157),(806,5,158),(807,5,159),(808,5,160),(809,5,161),(810,5,162),(811,5,163),(749,6,31),(768,6,32),(769,6,33),(754,6,36),(755,6,39),(756,6,49),(757,6,50),(758,6,51),(759,6,52),(760,6,53),(761,6,54),(762,6,55),(763,6,56),(764,6,57),(765,6,58),(766,6,62),(767,6,63),(770,6,75),(771,6,76),(772,6,77),(773,6,78),(774,6,79),(775,6,83),(776,6,84),(777,6,88),(750,6,160),(751,6,161),(752,6,162),(753,6,163),(1514,7,31),(1498,7,32),(1503,7,48),(1502,7,49),(1505,7,50),(1499,7,51),(1511,7,52),(1508,7,62),(1512,7,63),(1506,7,83),(1507,7,84),(1510,7,88),(1513,7,120),(1509,7,121),(1501,7,133),(1504,7,145),(1500,7,163),(1495,8,31),(1477,8,32),(1486,8,48),(1482,8,49),(1488,8,50),(1478,8,51),(1494,8,52),(1491,8,62),(1483,8,63),(1484,8,75),(1489,8,83),(1490,8,84),(1493,8,88),(1496,8,120),(1492,8,121),(1497,8,133),(1485,8,143),(1487,8,145),(1479,8,163),(1480,8,164),(1481,8,165),(1020,9,31),(1039,9,32),(1040,9,33),(1025,9,36),(1026,9,39),(1027,9,49),(1028,9,50),(1029,9,51),(1030,9,52),(1031,9,53),(1032,9,54),(1033,9,55),(1034,9,56),(1035,9,57),(1036,9,58),(1037,9,62),(1038,9,63),(1041,9,75),(1042,9,76),(1043,9,77),(1044,9,78),(1045,9,79),(1046,9,83),(1047,9,84),(1048,9,88),(1021,9,160),(1022,9,161),(1023,9,162),(1024,9,163),(991,10,31),(1010,10,32),(1011,10,33),(996,10,36),(997,10,39),(998,10,49),(999,10,50),(1000,10,51),(1001,10,52),(1002,10,53),(1003,10,54),(1004,10,55),(1005,10,56),(1006,10,57),(1007,10,58),(1008,10,62),(1009,10,63),(1012,10,75),(1013,10,76),(1014,10,77),(1015,10,78),(1016,10,79),(1017,10,83),(1018,10,84),(1019,10,88),(992,10,160),(993,10,161),(994,10,162),(995,10,163),(1107,11,31),(1126,11,32),(1127,11,33),(1112,11,36),(1113,11,39),(1114,11,49),(1115,11,50),(1116,11,51),(1117,11,52),(1118,11,53),(1119,11,54),(1120,11,55),(1121,11,56),(1122,11,57),(1123,11,58),(1124,11,62),(1125,11,63),(1128,11,75),(1129,11,76),(1130,11,77),(1131,11,78),(1132,11,79),(1133,11,83),(1134,11,84),(1135,11,88),(1108,11,160),(1109,11,161),(1110,11,162),(1111,11,163);
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
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can view group',2,'view_group'),(8,'Can view permission',1,'view_permission'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add session',4,'add_session'),(14,'Can change session',4,'change_session'),(15,'Can delete session',4,'delete_session'),(16,'Can view session',4,'view_session'),(17,'Can add site',5,'add_site'),(18,'Can change site',5,'change_site'),(19,'Can delete site',5,'delete_site'),(20,'Can view site',5,'view_site'),(21,'Can add 公司管理',6,'add_company'),(22,'Can change 公司管理',6,'change_company'),(23,'Can delete 公司管理',6,'delete_company'),(24,'Can add 项目',7,'add_project'),(25,'Can change 项目',7,'change_project'),(26,'Can delete 项目',7,'delete_project'),(27,'Can add 项目材料',8,'add_projectmaterial'),(28,'Can change 项目材料',8,'change_projectmaterial'),(29,'Can delete 项目材料',8,'delete_projectmaterial'),(30,'Can view 公司管理',6,'view_company'),(31,'Can view 项目',7,'view_project'),(32,'Can view 项目材料',8,'view_projectmaterial'),(33,'Can add 类别',9,'add_category'),(34,'Can change 类别',9,'change_category'),(35,'Can delete 类别',9,'delete_category'),(36,'Can add 规格',10,'add_specification'),(37,'Can change 规格',10,'change_specification'),(38,'Can delete 规格',10,'delete_specification'),(39,'Can add 单位',11,'add_unit'),(40,'Can change 单位',11,'change_unit'),(41,'Can delete 单位',11,'delete_unit'),(42,'Can add 材料',12,'add_material'),(43,'Can change 材料',12,'change_material'),(44,'Can delete 材料',12,'delete_material'),(45,'Can add 供应商',13,'add_vendor'),(46,'Can change 供应商',13,'change_vendor'),(47,'Can delete 供应商',13,'delete_vendor'),(48,'Can view 供应商',13,'view_vendor'),(49,'Can view 单位',11,'view_unit'),(50,'Can view 材料',12,'view_material'),(51,'Can view 类别',9,'view_category'),(52,'Can view 规格',10,'view_specification'),(53,'Can add 单据',14,'add_document'),(54,'Can change 单据',14,'change_document'),(55,'Can delete 单据',14,'delete_document'),(56,'Can add 单据名细',15,'add_documentlineitem'),(57,'Can change 单据名细',15,'change_documentlineitem'),(58,'Can delete 单据名细',15,'delete_documentlineitem'),(62,'Can view 单据',14,'view_document'),(63,'Can view 单据名细',15,'view_documentlineitem'),(65,'Can add 流程',17,'add_route'),(66,'Can change 流程',17,'change_route'),(67,'Can delete 流程',17,'delete_route'),(68,'Can add 步骤',18,'add_actor'),(69,'Can change 步骤',18,'change_actor'),(70,'Can delete 步骤',18,'delete_actor'),(71,'Can add 步骤处理人',19,'add_actoruser'),(72,'Can change 步骤处理人',19,'change_actoruser'),(73,'Can delete 步骤处理人',19,'delete_actoruser'),(74,'Can add 项目申请',20,'add_item'),(75,'Can change 项目申请',20,'change_item'),(76,'Can delete 项目申请',20,'delete_item'),(77,'Can add 任务列表',21,'add_tasklist'),(78,'Can change 任务列表',21,'change_tasklist'),(79,'Can delete 任务列表',21,'delete_tasklist'),(80,'Can add 审核日志',22,'add_taskhistory'),(81,'Can change 审核日志',22,'change_taskhistory'),(82,'Can delete 审核日志',22,'delete_taskhistory'),(83,'Can view 任务列表',21,'view_tasklist'),(84,'Can view 审核日志',22,'view_taskhistory'),(85,'Can view 步骤',18,'view_actor'),(86,'Can view 步骤处理人',19,'view_actoruser'),(87,'Can view 流程',17,'view_route'),(88,'Can view 项目申请',20,'view_item'),(89,'Can add user',23,'add_userinfo'),(90,'Can change user',23,'change_userinfo'),(91,'Can delete user',23,'delete_userinfo'),(92,'Can view user',23,'view_userinfo'),(93,'Can add Bookmark',24,'add_bookmark'),(94,'Can change Bookmark',24,'change_bookmark'),(95,'Can delete Bookmark',24,'delete_bookmark'),(96,'Can add User Setting',25,'add_usersettings'),(97,'Can change User Setting',25,'change_usersettings'),(98,'Can delete User Setting',25,'delete_usersettings'),(99,'Can add User Widget',26,'add_userwidget'),(100,'Can change User Widget',26,'change_userwidget'),(101,'Can delete User Widget',26,'delete_userwidget'),(102,'Can view Bookmark',24,'view_bookmark'),(103,'Can view User Setting',25,'view_usersettings'),(104,'Can view User Widget',26,'view_userwidget'),(105,'Can add comment',27,'add_comment'),(106,'Can change comment',27,'change_comment'),(107,'Can delete comment',27,'delete_comment'),(108,'Can moderate comments',27,'can_moderate'),(109,'Can add comment flag',28,'add_commentflag'),(110,'Can change comment flag',28,'change_commentflag'),(111,'Can delete comment flag',28,'delete_commentflag'),(112,'Can view comment',27,'view_comment'),(113,'Can view comment flag',28,'view_commentflag'),(114,'Can add 采购单',29,'add_order'),(115,'Can change 采购单',29,'change_order'),(116,'Can delete 采购单',29,'delete_order'),(117,'Can add 采购单名细',30,'add_orderline'),(118,'Can change 采购单名细',30,'change_orderline'),(119,'Can delete 采购单名细',30,'delete_orderline'),(120,'Can view 采购单',29,'view_order'),(121,'Can view 采购单名细',30,'view_orderline'),(122,'Can add 到货单名细',31,'add_receivingline'),(123,'Can change 到货单名细',31,'change_receivingline'),(124,'Can delete 到货单名细',31,'delete_receivingline'),(125,'Can view 到货单名细',31,'view_receivingline'),(126,'Can add 对账单',32,'add_checkaccount'),(127,'Can change 对账单',32,'change_checkaccount'),(128,'Can delete 对账单',32,'delete_checkaccount'),(129,'Can view 对账单',32,'view_checkaccount'),(130,'Can add 发票管理',33,'add_invoice'),(131,'Can change 发票管理',33,'change_invoice'),(132,'Can delete 发票管理',33,'delete_invoice'),(133,'Can view 发票管理',33,'view_invoice'),(134,'Can add 支付方式',34,'add_paymenttype'),(135,'Can change 支付方式',34,'change_paymenttype'),(136,'Can delete 支付方式',34,'delete_paymenttype'),(137,'Can add 款项属性',35,'add_paymentproperty'),(138,'Can change 款项属性',35,'change_paymentproperty'),(139,'Can delete 款项属性',35,'delete_paymentproperty'),(140,'Can view 支付方式',34,'view_paymenttype'),(141,'Can view 款项属性',35,'view_paymentproperty'),(142,'Can add 付款',36,'add_payment'),(143,'Can change 付款',36,'change_payment'),(144,'Can delete 付款',36,'delete_payment'),(145,'Can view 付款',36,'view_payment'),(146,'account view payment',36,'accountView_payment'),(147,'Can add 项目设置',37,'add_projectsetting'),(148,'Can change 项目设置',37,'change_projectsetting'),(149,'Can delete 项目设置',37,'delete_projectsetting'),(150,'Can view 项目设置',37,'view_projectsetting'),(151,'Can add 供应商设置',38,'add_vendorsetting'),(152,'Can change 供应商设置',38,'change_vendorsetting'),(153,'Can delete 供应商设置',38,'delete_vendorsetting'),(154,'Can view 供应商设置',38,'view_vendorsetting'),(155,'search_price',30,'search_price_orderline'),(156,'Can add 采购单注意事项',39,'add_ordernote'),(157,'Can change 采购单注意事项',39,'change_ordernote'),(158,'Can delete 采购单注意事项',39,'delete_ordernote'),(159,'Can view 采购单注意事项',39,'view_ordernote'),(160,'Can add 品牌',40,'add_brand'),(161,'Can change 品牌',40,'change_brand'),(162,'Can delete 品牌',40,'delete_brand'),(163,'Can view 品牌',40,'view_brand'),(164,'handle item',20,'handle_item'),(165,'handled item',20,'handled_item');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'content type','contenttypes','contenttype'),(4,'session','sessions','session'),(5,'site','sites','site'),(6,'公司管理','project','company'),(7,'项目','project','project'),(8,'项目材料','project','projectmaterial'),(9,'类别','material','category'),(10,'规格','material','specification'),(11,'单位','material','unit'),(12,'材料','material','material'),(13,'供应商','material','vendor'),(14,'单据','document','document'),(15,'单据名细','document','documentlineitem'),(17,'流程','workflow','route'),(18,'步骤','workflow','actor'),(19,'步骤处理人','workflow','actoruser'),(20,'项目申请','workflow','item'),(21,'任务列表','workflow','tasklist'),(22,'审核日志','workflow','taskhistory'),(23,'user','user','userinfo'),(24,'Bookmark','xadmin','bookmark'),(25,'User Setting','xadmin','usersettings'),(26,'User Widget','xadmin','userwidget'),(27,'comment','comments','comment'),(28,'comment flag','comments','commentflag'),(29,'采购单','order','order'),(30,'采购单名细','order','orderline'),(31,'到货单名细','order','receivingline'),(32,'对账单','order','checkaccount'),(33,'发票管理','order','invoice'),(34,'支付方式','payment','paymenttype'),(35,'款项属性','payment','paymentproperty'),(36,'付款','payment','payment'),(37,'项目设置','setting','projectsetting'),(38,'供应商设置','setting','vendorsetting'),(39,'采购单注意事项','order','ordernote'),(40,'品牌','material','brand');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1mgjhrfku2rbygqgcjm3pv1wmj3m76cc','MTFlMGMxN2QxMDhkNGFiZWZiNzExNDM2MWIyODljNzNkYjMzNWZlMjp7IkxJU1RfUVVFUlkiOltbIndvcmtmbG93IiwiaXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ3aXphcmRfeGFkbWludXNlcndpZGdldF9hZG1pbl93aXphcmRfZm9ybV9wbHVnaW4iOnsic3RlcF9maWxlcyI6e30sInN0ZXAiOm51bGwsImV4dHJhX2RhdGEiOnt9LCJzdGVwX2RhdGEiOnt9fX0=','2014-07-21 04:30:15'),('2d4valnwqugjfwxp03cfzbb7vcxazg7i','ZWY3Y2Y0NWI2NjI5NTI3Yjk2ZDNiMjE5MDJkN2Q5NTU3ODcwOTVhMDp7Il9hdXRoX3VzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwid2l6YXJkX3hhZG1pbnVzZXJ3aWRnZXRfYWRtaW5fd2l6YXJkX2Zvcm1fcGx1Z2luIjp7InN0ZXBfZmlsZXMiOnt9LCJzdGVwIjpudWxsLCJleHRyYV9kYXRhIjp7fSwic3RlcF9kYXRhIjp7fX19','2014-07-21 01:53:55'),('305lzz1c1tk8qk75kll9byojhybrejlx','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-07-04 05:38:46'),('3fe7soxpwgieo0fzqpzebpby2ij7gar2','MzM3NTczOWEzYWI0MDUyNjFiMjM5Y2NmMmRjM2YyOWVjMGI3OTI2NTp7IkxJU1RfUVVFUlkiOltbImRvY3VtZW50IiwiZG9jdW1lbnRsaW5laXRlbSJdLCJfcV89UE0yMDE0MDcyNTIwNTczOCJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==','2014-08-09 04:27:43'),('3hdexuq41cyvo63ddoekqgwvog4x5lxr','M2ZhNDJlNTAxMmZlNjE2NTVlZmFmOTE3OGVhYTJlNzQyMWM1NWRmNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MTB9','2014-07-03 05:25:57'),('5hdtt34fttqyk0gxkqox81qqeku692m0','MTdkMmJlZTEyNzlhMWRlYWEyOWE1NTBhYmQwMDZiNTcwZjMwNTRjZjp7IkxJU1RfUVVFUlkiOltbIndvcmtmbG93IiwiaXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6NDEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2014-08-10 18:46:21'),('70cpoz7yux8dgkmn6tsglwvvwteg8fph','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-06-08 17:07:14'),('7qta3l3bnciek8l6bwwd6aztz2r0h7ys','MTk4N2E2NjkyYjRiZjcxMTlmNTI0OTgyYzllZTFmOGYwYjhmM2NmZTp7IkxJU1RfUVVFUlkiOltbIndvcmtmbG93IiwiaXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ3aXphcmRfeGFkbWludXNlcndpZGdldF9hZG1pbl93aXphcmRfZm9ybV9wbHVnaW4iOnsic3RlcF9maWxlcyI6e30sInN0ZXAiOiJXaWRnZXRcdTdjN2JcdTU3OGIiLCJleHRyYV9kYXRhIjp7fSwic3RlcF9kYXRhIjp7fX19','2014-06-26 05:08:23'),('7zkzb9bggvo5iwp9z6merdzse4bey4cz','ZmJmYjdjZDFmNzAzYTFhMWQzZjBhNzFlMDdlNzhlNTBmYzkxMWNmNjp7IkxJU1RfUVVFUlkiOltbInBheW1lbnQiLCJwYXltZW50Il0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2014-06-09 15:18:32'),('8i34els2lj9vi7di4aubu8uczfdtqva6','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-05-06 06:04:19'),('b8o2xsewr9lwkajpwr2gn3prm1jzj6jr','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-07-21 04:55:07'),('dpmq1z3g8e8oo9ttn29iiyh261lr0h1m','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-05-13 04:10:36'),('dqnjudpjn7fs6l5hr55zmsamw4qepygi','NmY0MDI0NTFlYTgyODU4Y2M5NDJhYTJjZjc0OWY4NWEwNDUwZDYwNzp7IkxJU1RfUVVFUlkiOltbInVzZXIiLCJ1c2VyaW5mbyJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2014-04-30 06:02:30'),('e07mp3iy0wb4b2g037abmequlhriaswr','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-06-28 15:33:46'),('fm1oj0nm3zqz9ko011uoqbszncfvc8nj','ZDMzMmVkZmU2MDY3ZjE4NmRlMGFiNWViNTNmMzk4OGZmNjljNWU5NDp7IkxJU1RfUVVFUlkiOltbIndvcmtmbG93IiwiaXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjoxfQ==','2014-07-21 05:01:22'),('ha0hok1a72ebjvdlrhv5f2vy24p7bwvm','OGMyNzBjNGY0ZWY5Nzc0MDdmMmE5ZmZkZTlkMDA4YjA0M2M3MTQ5Njp7IkxJU1RfUVVFUlkiOltbIndvcmtmbG93IiwiaXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjo3fQ==','2014-06-29 23:55:32'),('ib1bxnrfpwjmh01cbb1dqdkgvx0sy7ul','ZDVhYTczN2RkOWNiNmM3OGQxOTAxOWM5ZDY5YzEyZWNhODQ1Mzc0NDp7IkxJU1RfUVVFUlkiOltbIndvcmtmbG93IiwiaXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjo0LCJ3aXphcmRfcHJvamVjdHByb2plY3RfYWRtaW5fd2l6YXJkX2Zvcm1fcGx1Z2luIjp7InN0ZXBfZmlsZXMiOnt9LCJzdGVwIjoiXHU5ODc5XHU3NmVlXHU3Mjc5XHU1ZjgxIiwiZXh0cmFfZGF0YSI6e30sInN0ZXBfZGF0YSI6e319fQ==','2014-06-25 15:29:24'),('iuqfxw7tu5nr83gk7ay6ykf3d7en6sz4','ZmJmYjdjZDFmNzAzYTFhMWQzZjBhNzFlMDdlNzhlNTBmYzkxMWNmNjp7IkxJU1RfUVVFUlkiOltbInBheW1lbnQiLCJwYXltZW50Il0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjd9','2014-06-10 03:38:43'),('j72iuwlpbnoswauq2n92joyb48nxjqnf','YTA4NDMwZDc1YzEzZTMwOTM3OTYyODU2ODdhMGIxMjNmOTYzOGI2MTp7IkxJU1RfUVVFUlkiOltbImRvY3VtZW50IiwiaW52b2ljZSJdLCIiXSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2lkIjo3fQ==','2014-05-13 03:54:28'),('l99me5bwi3ml2m86ic2pziqk07svt56q','ZmNiY2M0NWNmY2E0Y2YyZmU1Y2QxOTU1NGQxMGQxYjdhOTFiYmEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6NH0=','2014-07-13 17:35:20'),('lef6xawhsxe44truvtuiq79a46qv9qi0','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-05-06 05:42:42'),('m0mq0k55584cqjnx2egln6b72206hq1y','NzA0ZTE0NzExNGFmZjQwY2MyNjU5OTEwZWU5NTRlN2VjMjAwZjhkZDp7IkxJU1RfUVVFUlkiOltbIndvcmtmbG93IiwiaXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJ3aXphcmRfeGFkbWludXNlcndpZGdldF9hZG1pbl93aXphcmRfZm9ybV9wbHVnaW4iOnsic3RlcF9maWxlcyI6eyJXaWRnZXRcdTdjN2JcdTU3OGIiOnt9fSwic3RlcCI6IldpZGdldFx1N2M3Ylx1NTc4YiIsImV4dHJhX2RhdGEiOnt9LCJzdGVwX2RhdGEiOnsiV2lkZ2V0XHU3YzdiXHU1NzhiIjp7InN0ZXBfMC13aWRnZXRfdHlwZSI6WyJsaXN0Il0sIl9zYXZlIjpbIiJdLCJ4YWRtaW51c2Vyd2lkZ2V0X2FkbWluX3dpemFyZF9mb3JtX3BsdWdpbi1jdXJyZW50X3N0ZXAiOlsiV2lkZ2V0XHU3YzdiXHU1NzhiIl0sInN0ZXBfMC1wYWdlX2lkIjpbImhvbWUiXSwidXNlciI6WzFdLCJjc3JmbWlkZGxld2FyZXRva2VuIjpbIlVKazhIMDBTNUJPS3hxVm91eERGWlp1VllpNFMwSFF1IiwiVUprOEgwMFM1Qk9LeHFWb3V4REZaWnVWWWk0UzBIUXUiXX19fX0=','2014-07-21 04:43:55'),('nk1b0fuxgucoz3jea8sj7mpe0qtz2y3h','MmJjMTI3OWMwZGFmNjAwNGQ1Y2RkY2Y5ZWRlMmFhZGZlYjgxYTMzMTp7IkxJU1RfUVVFUlkiOltbImRvY3VtZW50IiwiZG9jdW1lbnQiXSwiIl0sIl9hdXRoX3VzZXJfaWQiOjgsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2014-06-01 03:58:01'),('ojt61uh2k0m39eicqppfj53nwotba80o','MWJhY2Y0MmNiNDRkZmU5MDM4ZjVjNjY2OWM1MzJkNzY5ZjY1MmU2ZTp7IkxJU1RfUVVFUlkiOltbImRvY3VtZW50IiwiZG9jdW1lbnRsaW5laXRlbSJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MTIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2014-08-09 16:12:26'),('pn0hkkeqvnep7s7vnqphguwfe4txgq6v','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-06-28 15:34:11'),('puuzu7ltwfm0gls3mj5lt99suwyys66z','ZDQ5YmM5MDRiNzYzMjY5M2ZiYTk1MTlkYzQ0MWQ3MzAzNDYzYzE5ZTp7IkxJU1RfUVVFUlkiOltbImF1dGgiLCJncm91cCJdLCIiXSwiX2F1dGhfdXNlcl9pZCI6MSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==','2014-06-13 05:51:18'),('qmk3qbiebgdrauuramvmcpoo5spt6lry','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-06-10 04:06:53'),('qshx18f2b26gbjxerttnk7u32q8qyjxy','ZDU0NDkyMDIzNTIyYzBmYzljMGU2MWY5NmI0NTdhOTIxYTZiNTMwNDp7IkxJU1RfUVVFUlkiOltbIm9yZGVyIiwib3JkZXJsaW5lIl0sIl9xXz1QTzIwMTQwNDIxMjEyMDM5Il0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=','2014-05-06 04:47:57'),('qxu49x0l7u77b6n3ovxb4nm4ugwv1nhd','YjQ0MWEzZTkxMGIxNmE5OTA4ZGJmOWNjZWQ0MGRhYWRiYWI5ODZmZTp7IkxJU1RfUVVFUlkiOltbImRvY3VtZW50IiwiZG9jdW1lbnRsaW5laXRlbSJdLCJfcV89UE0yMDE0MDYyODE5MTcxNyJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjEyfQ==','2014-07-13 02:17:21'),('si248fday3gc7b1qgetc3n041le3xi5e','MTRhMjI3NTdiODdhYzkwMTE3NDMyZGRmZGRiOTMwNjQ0OWRmZGMwMzp7IkxJU1RfUVVFUlkiOltbIm9yZGVyIiwib3JkZXIiXSwiIl0sIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6N30=','2014-05-06 06:01:16'),('xocot5pqmjyiocgzhk1n8lshfl79ly1a','NWI1YTM0ZGJmMWRiNDkyMDk4NzhlZTcxZmU3MmU5NWIxZTk0Mjk4OTp7fQ==','2014-08-08 04:06:59'),('xsiqrhivlw9wyz49hz6w54z39hxfof09','MWM4YWRjZmQyMzYxZGExYWM0ODQ1NmMwYWI1NTUwMTM1NmQ1MjcyMjp7IkxJU1RfUVVFUlkiOltbIm9yZGVyIiwiY2hlY2thY2NvdW50Il0sIiJdLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjE5fQ==','2014-07-04 00:23:45');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_document`
--

DROP TABLE IF EXISTS `document_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` varchar(50) NOT NULL,
  `document_type` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `document_document_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_49f4e8ac` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_document`
--

LOCK TABLES `document_document` WRITE;
/*!40000 ALTER TABLE `document_document` DISABLE KEYS */;
INSERT INTO `document_document` VALUES (9,'PM20140726110742',0,12,'2014-07-26'),(10,'PM20140726110814',0,12,'2014-07-26'),(11,'PM20140726110829',0,12,'2014-07-26'),(12,'PM20140726110842',0,12,'2014-07-26'),(13,'PM20140726111035',0,12,'2014-07-26'),(14,'PM20140726111046',0,12,'2014-07-26'),(15,'PM20140726111056',0,12,'2014-07-26'),(16,'PM20140726111105',0,12,'2014-07-26'),(17,'PM20140726111114',0,12,'2014-07-26'),(18,'PM20140726111126',0,12,'2014-07-26'),(19,'PM20140726111134',0,12,'2014-07-26'),(20,'PM20140726111144',0,12,'2014-07-26'),(21,'PM20140726111155',0,12,'2014-07-26'),(22,'PM20140726111204',0,12,'2014-07-26'),(23,'PM20140726111214',0,12,'2014-07-26'),(24,'PM20140726111246',0,12,'2014-07-26'),(25,'PM20140726111256',0,12,'2014-07-26'),(26,'PM20140726111306',0,12,'2014-07-26'),(27,'PM20140726111315',0,12,'2014-07-26'),(28,'PM20140726111323',0,12,'2014-07-26'),(29,'PM20140726111331',0,12,'2014-07-26'),(30,'PM20140726111339',0,12,'2014-07-26'),(31,'PM20140726111348',0,12,'2014-07-26'),(32,'PM20140726111822',0,12,'2014-07-26'),(33,'PM20140726111831',0,12,'2014-07-26'),(34,'PM20140726111844',0,12,'2014-07-26'),(35,'PM20140726111853',0,12,'2014-07-26'),(36,'PM20140726111902',0,12,'2014-07-26'),(37,'PM20140726111912',0,12,'2014-07-26'),(38,'PM20140726111921',0,12,'2014-07-26'),(39,'PM20140726111929',0,12,'2014-07-26'),(40,'PM20140726111938',0,12,'2014-07-26'),(41,'PM20140726111946',0,12,'2014-07-26'),(42,'PM20140726112020',0,12,'2014-07-26'),(43,'PM20140726112034',0,12,'2014-07-26'),(44,'PM20140726112100',0,12,'2014-07-26'),(45,'PM20140726112109',0,12,'2014-07-26'),(46,'PM20140726112118',0,12,'2014-07-26'),(47,'PM20140726112127',0,12,NULL),(48,'PM20140726112135',0,12,'2014-07-26'),(49,'PM20140726112151',0,12,'2014-07-26'),(50,'PM20140726112204',0,12,'2014-07-26'),(51,'PM20140726112214',0,12,'2014-07-26'),(52,'PM20140726112226',0,12,'2014-07-26'),(53,'PM20140726112239',0,12,'2014-07-26'),(54,'PM20140726112250',0,12,'2014-07-26'),(55,'PM20140726112258',0,12,'2014-07-26'),(56,'PM20140726112306',0,12,'2014-07-26'),(57,'PM20140726112320',0,12,'2014-07-26'),(58,'PM20140726112329',0,12,'2014-07-26'),(59,'PM20140726112339',0,12,'2014-07-26'),(60,'PM20140726112348',0,12,'2014-07-26'),(61,'PM20140726112402',0,12,'2014-07-26'),(62,'PM20140726112416',0,12,'2014-07-26'),(63,'PT20140726190309',1,19,'2014-07-26'),(64,'PT20140727092017',1,19,'2014-07-27');
/*!40000 ALTER TABLE `document_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_documentlineitem`
--

DROP TABLE IF EXISTS `document_documentlineitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_documentlineitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `projectMaterial_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `expected_quantity` int(11) DEFAULT NULL,
  `posted_quantity` int(11) DEFAULT NULL,
  `audit_quantity` int(11) DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `comments` longtext,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `document_documentlineitem_b7398729` (`document_id`),
  KEY `document_documentlineitem_271e2461` (`projectMaterial_id`),
  KEY `document_documentlineitem_5afadb1e` (`brand_id`),
  CONSTRAINT `brand_id_refs_id_27c3280c` FOREIGN KEY (`brand_id`) REFERENCES `material_brand` (`id`),
  CONSTRAINT `document_id_refs_id_73ca7c56` FOREIGN KEY (`document_id`) REFERENCES `document_document` (`id`),
  CONSTRAINT `projectMaterial_id_refs_id_773995b0` FOREIGN KEY (`projectMaterial_id`) REFERENCES `project_projectmaterial` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_documentlineitem`
--

LOCK TABLES `document_documentlineitem` WRITE;
/*!40000 ALTER TABLE `document_documentlineitem` DISABLE KEYS */;
INSERT INTO `document_documentlineitem` VALUES (9,9,8,2,10,NULL,NULL,'2014-07-26','dd',''),(10,10,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(11,11,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(12,11,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(13,12,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(14,12,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(15,13,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(16,13,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(17,14,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(18,14,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(19,15,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(20,15,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(21,16,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(22,16,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(23,17,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(24,17,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(25,18,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(26,18,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(27,19,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(28,19,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(29,20,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(30,20,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(31,21,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(32,21,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(33,22,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(34,22,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(35,23,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(36,23,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(37,24,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(38,24,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(39,25,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(40,25,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(41,26,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(42,26,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(43,27,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(44,27,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(45,28,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(46,28,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(47,29,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(48,29,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(49,30,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(50,30,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(51,31,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(52,31,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(53,32,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(54,32,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(55,33,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(56,33,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(57,34,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(58,34,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(59,35,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(60,35,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(61,36,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(62,36,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(63,37,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(64,37,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(65,38,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(66,38,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(67,39,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(68,39,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(69,40,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(70,40,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(71,41,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(72,41,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(73,42,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(74,42,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(75,43,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(76,43,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(77,44,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(78,44,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(79,45,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(80,45,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(81,46,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(82,46,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(83,47,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(84,47,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(85,48,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(86,48,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(87,49,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(88,49,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(89,50,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(90,50,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(91,51,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(92,51,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(93,52,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(94,52,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(95,53,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(96,53,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(97,54,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(98,54,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(99,55,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(100,55,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(101,56,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(102,56,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(103,57,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(104,57,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(105,58,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(106,58,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(107,59,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(108,59,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(109,60,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(110,60,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(111,61,8,NULL,NULL,NULL,NULL,NULL,NULL,''),(112,61,7,NULL,NULL,NULL,NULL,NULL,NULL,''),(113,62,8,NULL,NULL,100,100,'2014-07-27',NULL,''),(114,62,7,NULL,NULL,100,100,'2014-07-27',NULL,'');
/*!40000 ALTER TABLE `document_documentlineitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_brand`
--

DROP TABLE IF EXISTS `material_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_brand`
--

LOCK TABLES `material_brand` WRITE;
/*!40000 ALTER TABLE `material_brand` DISABLE KEYS */;
INSERT INTO `material_brand` VALUES (2,'品牌1'),(3,'品牌2');
/*!40000 ALTER TABLE `material_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_category`
--

DROP TABLE IF EXISTS `material_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_category`
--

LOCK TABLES `material_category` WRITE;
/*!40000 ALTER TABLE `material_category` DISABLE KEYS */;
INSERT INTO `material_category` VALUES (1,'钢材'),(2,'电缆'),(3,'报警设备');
/*!40000 ALTER TABLE `material_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_material`
--

DROP TABLE IF EXISTS `material_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `specification_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `material_material_6f33f001` (`category_id`),
  KEY `material_material_9f07568a` (`specification_id`),
  KEY `material_material_b9dcc52b` (`unit_id`),
  CONSTRAINT `category_id_refs_id_5acf0bf5` FOREIGN KEY (`category_id`) REFERENCES `material_category` (`id`),
  CONSTRAINT `specification_id_refs_id_24907d40` FOREIGN KEY (`specification_id`) REFERENCES `material_specification` (`id`),
  CONSTRAINT `unit_id_refs_id_43092818` FOREIGN KEY (`unit_id`) REFERENCES `material_unit` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_material`
--

LOCK TABLES `material_material` WRITE;
/*!40000 ALTER TABLE `material_material` DISABLE KEYS */;
INSERT INTO `material_material` VALUES (1,'角铁',1,1,3),(2,'角铁',1,2,3),(3,'三通',1,3,3),(4,'四通',1,4,3),(5,'镀锌钢管',1,3,1);
/*!40000 ALTER TABLE `material_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_specification`
--

DROP TABLE IF EXISTS `material_specification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_specification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_specification`
--

LOCK TABLES `material_specification` WRITE;
/*!40000 ALTER TABLE `material_specification` DISABLE KEYS */;
INSERT INTO `material_specification` VALUES (1,'4#'),(2,'5#'),(3,'DN150'),(4,'DN100');
/*!40000 ALTER TABLE `material_specification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_unit`
--

DROP TABLE IF EXISTS `material_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_unit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_unit`
--

LOCK TABLES `material_unit` WRITE;
/*!40000 ALTER TABLE `material_unit` DISABLE KEYS */;
INSERT INTO `material_unit` VALUES (1,'米'),(2,'支'),(3,'只');
/*!40000 ALTER TABLE `material_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_vendor`
--

DROP TABLE IF EXISTS `material_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `cellphone` varchar(50) DEFAULT NULL,
  `telephone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `website` varchar(50) DEFAULT NULL,
  `bank` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business_area` longtext,
  `comments` longtext,
  PRIMARY KEY (`id`),
  KEY `material_vendor_6f33f001` (`category_id`),
  CONSTRAINT `category_id_refs_id_d13fce6c` FOREIGN KEY (`category_id`) REFERENCES `material_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_vendor`
--

LOCK TABLES `material_vendor` WRITE;
/*!40000 ALTER TABLE `material_vendor` DISABLE KEYS */;
INSERT INTO `material_vendor` VALUES (1,'二亮管道配件经营部',1,'王经理','139000001','0512 6280990','0512 6280990','admin@exadmin.com','','http://www.abc.com/','','','',''),(2,'健乐儿五金机电商行',3,'王经理','180000001','0512 6280990','0512-6280990','admin@exadmin.com','','http://www.abc.com/','','','','');
/*!40000 ALTER TABLE `material_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_checkaccount`
--

DROP TABLE IF EXISTS `order_checkaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_checkaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `check_account_id` varchar(50) NOT NULL,
  `create_time` date NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_checkaccount_bc787c37` (`vendor_id`),
  KEY `order_checkaccount_0316dde1` (`company_id`),
  CONSTRAINT `company_id_refs_id_d7e9c1ee` FOREIGN KEY (`company_id`) REFERENCES `project_company` (`id`),
  CONSTRAINT `vendor_id_refs_id_ba36f467` FOREIGN KEY (`vendor_id`) REFERENCES `material_vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_checkaccount`
--

LOCK TABLES `order_checkaccount` WRITE;
/*!40000 ALTER TABLE `order_checkaccount` DISABLE KEYS */;
INSERT INTO `order_checkaccount` VALUES (1,'CA20140727091449','2014-07-27','2014-07-01','2014-07-31',1,NULL);
/*!40000 ALTER TABLE `order_checkaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_invoice`
--

DROP TABLE IF EXISTS `order_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_invoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `invoice_type` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `receive_date` date NOT NULL,
  `checkAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_invoice_bc787c37` (`vendor_id`),
  KEY `order_invoice_0316dde1` (`company_id`),
  KEY `order_invoice_6340c63c` (`user_id`),
  KEY `order_invoice_84e0fc55` (`checkAccount_id`),
  CONSTRAINT `checkAccount_id_refs_id_abc20265` FOREIGN KEY (`checkAccount_id`) REFERENCES `order_checkaccount` (`id`),
  CONSTRAINT `company_id_refs_id_79e8dfbe` FOREIGN KEY (`company_id`) REFERENCES `project_company` (`id`),
  CONSTRAINT `user_id_refs_id_c8e7dd38` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`),
  CONSTRAINT `vendor_id_refs_id_648e0dbe` FOREIGN KEY (`vendor_id`) REFERENCES `material_vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_invoice`
--

LOCK TABLES `order_invoice` WRITE;
/*!40000 ALTER TABLE `order_invoice` DISABLE KEYS */;
INSERT INTO `order_invoice` VALUES (1,1,2,'12313',500.00,1,18,'2014-07-27','2014-07-27',1);
/*!40000 ALTER TABLE `order_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_order`
--

DROP TABLE IF EXISTS `order_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(50) NOT NULL,
  `document_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `create_time` date NOT NULL,
  `note_id` int(11) DEFAULT NULL,
  `is_closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_order_b7398729` (`document_id`),
  KEY `order_order_0316dde1` (`company_id`),
  KEY `order_order_37952554` (`project_id`),
  KEY `order_order_bc787c37` (`vendor_id`),
  KEY `order_order_f6e610e1` (`note_id`),
  CONSTRAINT `company_id_refs_id_fa341f7a` FOREIGN KEY (`company_id`) REFERENCES `project_company` (`id`),
  CONSTRAINT `document_id_refs_id_ba90fb63` FOREIGN KEY (`document_id`) REFERENCES `document_document` (`id`),
  CONSTRAINT `note_id_refs_id_207b77f2` FOREIGN KEY (`note_id`) REFERENCES `order_ordernote` (`id`),
  CONSTRAINT `project_id_refs_id_c78edba4` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`),
  CONSTRAINT `vendor_id_refs_id_caac93e2` FOREIGN KEY (`vendor_id`) REFERENCES `material_vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_order`
--

LOCK TABLES `order_order` WRITE;
/*!40000 ALTER TABLE `order_order` DISABLE KEYS */;
INSERT INTO `order_order` VALUES (1,'PO20140727091117',62,2,4,1,'2014-07-27',1,0);
/*!40000 ALTER TABLE `order_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orderline`
--

DROP TABLE IF EXISTS `order_orderline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orderline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `documentLineItem_id` int(11) NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `expected_date` date DEFAULT NULL,
  `purchase_quantity` int(11) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orderline_68d25c7a` (`order_id`),
  KEY `order_orderline_f0d8b8d9` (`documentLineItem_id`),
  CONSTRAINT `documentLineItem_id_refs_id_95720001` FOREIGN KEY (`documentLineItem_id`) REFERENCES `document_documentlineitem` (`id`),
  CONSTRAINT `order_id_refs_id_b91acd28` FOREIGN KEY (`order_id`) REFERENCES `order_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orderline`
--

LOCK TABLES `order_orderline` WRITE;
/*!40000 ALTER TABLE `order_orderline` DISABLE KEYS */;
INSERT INTO `order_orderline` VALUES (1,1,114,3.00,'2014-07-29',100,300.00),(2,1,113,2.00,'2014-07-29',100,200.00);
/*!40000 ALTER TABLE `order_orderline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_ordernote`
--

DROP TABLE IF EXISTS `order_ordernote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_ordernote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `note` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_ordernote`
--

LOCK TABLES `order_ordernote` WRITE;
/*!40000 ALTER TABLE `order_ordernote` DISABLE KEYS */;
INSERT INTO `order_ordernote` VALUES (1,'注意事项1','注意事项：\r\n               1. 签单回传： 供方应于二日内就本合同签章确认回传，逾期未签回视同本合同作废。\r\n               2. 交货事宜： 请供方务必遵守本合同交货日期、数量，如有变动应事先以书面传真\r\n                                        调整交货期。供方延迟交货对本公司造成重大损失的，其损失供方应付全责。\r\n               3. 质量要求： 符合国家标准及我方订货要求，如出现质量与订单不符现象同供方负责\r\n                                        退换，另扣除本合同总价的10%作为违约金。\r\n               4. 请款手续： 凭现场验收合格签收的送货单在每月的25日前至我司进行对账，次月\r\n                                        中旬付款。如当有不前来对账的将延至下个月，付款也如此。\r\n               5. 其它约定： 送货时请附产品检验报告及合格证原件。'),(2,'注意事项2','ddd');
/*!40000 ALTER TABLE `order_ordernote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_receivingline`
--

DROP TABLE IF EXISTS `order_receivingline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_receivingline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderLine_id` int(11) NOT NULL,
  `receiving_quantity` int(11) DEFAULT NULL,
  `original_receiving_quantity` int(11) DEFAULT NULL,
  `receiving_date` date DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  `checkAccount_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_receivingline_52cc8aa7` (`orderLine_id`),
  KEY `order_receivingline_84e0fc55` (`checkAccount_id`),
  CONSTRAINT `checkAccount_id_refs_id_c2cc20ba` FOREIGN KEY (`checkAccount_id`) REFERENCES `order_checkaccount` (`id`),
  CONSTRAINT `orderLine_id_refs_id_e18dfc70` FOREIGN KEY (`orderLine_id`) REFERENCES `order_orderline` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_receivingline`
--

LOCK TABLES `order_receivingline` WRITE;
/*!40000 ALTER TABLE `order_receivingline` DISABLE KEYS */;
INSERT INTO `order_receivingline` VALUES (1,2,20,20,'2014-07-27',40.00,1),(2,2,80,80,'2014-07-27',160.00,1),(3,1,100,100,'2014-07-27',300.00,1);
/*!40000 ALTER TABLE `order_receivingline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_payment`
--

DROP TABLE IF EXISTS `payment_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_payment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_id` varchar(50) NOT NULL,
  `company_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `content` varchar(100) NOT NULL,
  `payment_amount` decimal(15,2) DEFAULT NULL,
  `applied_amount` decimal(15,2) DEFAULT NULL,
  `paymentType_id` int(11) NOT NULL,
  `paymentProperty_id` int(11) NOT NULL,
  `purchase_amount` decimal(15,2) DEFAULT NULL,
  `owed_amount` decimal(15,2) DEFAULT NULL,
  `owed_amount_after_payment` decimal(15,2) DEFAULT NULL,
  `payment_user_id` int(11) NOT NULL,
  `purchase_user_id` int(11) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `is_applied` tinyint(1) NOT NULL,
  `is_closed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payment_payment_0316dde1` (`company_id`),
  KEY `payment_payment_bc787c37` (`vendor_id`),
  KEY `payment_payment_f3d1cff5` (`paymentType_id`),
  KEY `payment_payment_eaac4997` (`paymentProperty_id`),
  KEY `payment_payment_c2c68e9d` (`payment_user_id`),
  KEY `payment_payment_03fed1ad` (`purchase_user_id`),
  CONSTRAINT `company_id_refs_id_c4e05684` FOREIGN KEY (`company_id`) REFERENCES `project_company` (`id`),
  CONSTRAINT `paymentProperty_id_refs_id_e5149e5a` FOREIGN KEY (`paymentProperty_id`) REFERENCES `payment_paymentproperty` (`id`),
  CONSTRAINT `paymentType_id_refs_id_e5e7951e` FOREIGN KEY (`paymentType_id`) REFERENCES `payment_paymenttype` (`id`),
  CONSTRAINT `payment_user_id_refs_id_3f946624` FOREIGN KEY (`payment_user_id`) REFERENCES `user_userinfo` (`id`),
  CONSTRAINT `purchase_user_id_refs_id_3f946624` FOREIGN KEY (`purchase_user_id`) REFERENCES `user_userinfo` (`id`),
  CONSTRAINT `vendor_id_refs_id_dd3df704` FOREIGN KEY (`vendor_id`) REFERENCES `material_vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_payment`
--

LOCK TABLES `payment_payment` WRITE;
/*!40000 ALTER TABLE `payment_payment` DISABLE KEYS */;
INSERT INTO `payment_payment` VALUES (1,'PT20140726190309',1,1,'12323',100.00,NULL,1,1,NULL,100.00,0.00,18,NULL,'2014-07-26',NULL,1,0),(2,'PT20140727092017',2,1,'喷淋',500.00,NULL,1,1,NULL,550.00,50.00,18,NULL,'2014-07-27','2014-07-27',1,1);
/*!40000 ALTER TABLE `payment_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymentproperty`
--

DROP TABLE IF EXISTS `payment_paymentproperty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paymentproperty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymentproperty`
--

LOCK TABLES `payment_paymentproperty` WRITE;
/*!40000 ALTER TABLE `payment_paymentproperty` DISABLE KEYS */;
INSERT INTO `payment_paymentproperty` VALUES (1,'合同预付款'),(2,'合同进度款'),(3,'合同结算款'),(4,'合同拖欠款');
/*!40000 ALTER TABLE `payment_paymentproperty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_paymenttype`
--

DROP TABLE IF EXISTS `payment_paymenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_paymenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_paymenttype`
--

LOCK TABLES `payment_paymenttype` WRITE;
/*!40000 ALTER TABLE `payment_paymenttype` DISABLE KEYS */;
INSERT INTO `payment_paymenttype` VALUES (1,'转帐'),(2,'现金'),(3,'成对汇票');
/*!40000 ALTER TABLE `payment_paymenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_company`
--

DROP TABLE IF EXISTS `project_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_company`
--

LOCK TABLES `project_company` WRITE;
/*!40000 ALTER TABLE `project_company` DISABLE KEYS */;
INSERT INTO `project_company` VALUES (1,'江苏合和机电安装工程有限公司','合和','东方大道 1338号','0512-65290001','0512-65290001','215007'),(2,'南京市消防工程有限公司苏州安装分公司','南消','东方大道 1338号','0512-65290001','0512-65290001','215007');
/*!40000 ALTER TABLE `project_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_project`
--

DROP TABLE IF EXISTS `project_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `construct_unit` varchar(50) DEFAULT NULL,
  `property` varchar(50) DEFAULT NULL,
  `scale` varchar(50) DEFAULT NULL,
  `estimate_user_id` int(11) NOT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `contract_format` varchar(50) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `bid_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `settlement_method` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_project_0316dde1` (`company_id`),
  KEY `project_project_f1510dd8` (`estimate_user_id`),
  CONSTRAINT `company_id_refs_id_afe8c805` FOREIGN KEY (`company_id`) REFERENCES `project_company` (`id`),
  CONSTRAINT `estimate_user_id_refs_id_d34d1bad` FOREIGN KEY (`estimate_user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_project`
--

LOCK TABLES `project_project` WRITE;
/*!40000 ALTER TABLE `project_project` DISABLE KEYS */;
INSERT INTO `project_project` VALUES (3,'北极星花园',1,'','','',21,2000.00,'','',NULL,NULL,NULL,''),(4,'金鹰',2,'金鹰','','',21,20000.00,'','','2014-06-19','2014-06-19','2014-06-19','');
/*!40000 ALTER TABLE `project_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_project_users`
--

DROP TABLE IF EXISTS `project_project_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_project_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`userinfo_id`),
  KEY `project_project_users_37952554` (`project_id`),
  KEY `project_project_users_8835ac30` (`userinfo_id`),
  CONSTRAINT `project_id_refs_id_64cedd69` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`),
  CONSTRAINT `userinfo_id_refs_id_f1bcd8f6` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_project_users`
--

LOCK TABLES `project_project_users` WRITE;
/*!40000 ALTER TABLE `project_project_users` DISABLE KEYS */;
INSERT INTO `project_project_users` VALUES (5,3,25),(6,4,12);
/*!40000 ALTER TABLE `project_project_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_projectmaterial`
--

DROP TABLE IF EXISTS `project_projectmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project_projectmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `received_quantity` int(11) NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `total` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_projectmaterial_37952554` (`project_id`),
  KEY `project_projectmaterial_f6ab4be3` (`material_id`),
  CONSTRAINT `material_id_refs_id_3972f73a` FOREIGN KEY (`material_id`) REFERENCES `material_material` (`id`),
  CONSTRAINT `project_id_refs_id_445896f6` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_projectmaterial`
--

LOCK TABLES `project_projectmaterial` WRITE;
/*!40000 ALTER TABLE `project_projectmaterial` DISABLE KEYS */;
INSERT INTO `project_projectmaterial` VALUES (5,3,1,100,0,5.00,500.00),(6,3,2,200,0,4.00,800.00),(7,4,5,10000,0,95.00,950000.00),(8,4,2,3000,0,10.00,30000.00);
/*!40000 ALTER TABLE `project_projectmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_projectsetting`
--

DROP TABLE IF EXISTS `setting_projectsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_projectsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `before_2014_amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setting_projectsetting_37952554` (`project_id`),
  CONSTRAINT `project_id_refs_id_0a11cdbf` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_projectsetting`
--

LOCK TABLES `setting_projectsetting` WRITE;
/*!40000 ALTER TABLE `setting_projectsetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `setting_projectsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setting_vendorsetting`
--

DROP TABLE IF EXISTS `setting_vendorsetting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setting_vendorsetting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `before_2013_owed_amount` decimal(15,2) DEFAULT NULL,
  `before_2013_owed_invoice` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `setting_vendorsetting_bc787c37` (`vendor_id`),
  KEY `setting_vendorsetting_0316dde1` (`company_id`),
  CONSTRAINT `company_id_refs_id_a60264ea` FOREIGN KEY (`company_id`) REFERENCES `project_company` (`id`),
  CONSTRAINT `vendor_id_refs_id_12db2471` FOREIGN KEY (`vendor_id`) REFERENCES `material_vendor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setting_vendorsetting`
--

LOCK TABLES `setting_vendorsetting` WRITE;
/*!40000 ALTER TABLE `setting_vendorsetting` DISABLE KEYS */;
INSERT INTO `setting_vendorsetting` VALUES (1,1,1,100.00,100.00),(2,1,2,50.00,50.00);
/*!40000 ALTER TABLE `setting_vendorsetting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo`
--

DROP TABLE IF EXISTS `user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo`
--

LOCK TABLES `user_userinfo` WRITE;
/*!40000 ALTER TABLE `user_userinfo` DISABLE KEYS */;
INSERT INTO `user_userinfo` VALUES (1,'pbkdf2_sha256$12000$zWzOq9PrfWdM$Zubg09EKPvH+sxXT/gt6eOb2QWXyz8xerJbtmxYWgzY=','2014-07-27 18:44:56',1,'admin','','','bobshi0213@gmail.com',1,1,'2014-04-16 06:23:43',NULL),(2,'pbkdf2_sha256$12000$aRzrtnecdwPD$h7qwkqdd8G6d7bExJygY7GC0HUe56Q/oY1MgrQOw/jc=','2014-07-27 17:41:31',0,'sk','康','邵','',1,1,'2014-04-16 06:24:29',''),(3,'pbkdf2_sha256$12000$0marWjxuGT5T$NZtfV4ZDHbrlUFtbnQXQpVoAusUwFcBTAKYiQPSLkvM=','2014-07-27 17:42:17',0,'lwy','文艺','刘','',1,1,'2014-04-16 06:34:03',''),(4,'pbkdf2_sha256$12000$iD7bDC9wKrlZ$KMhTmCeN7rZuWkI3wAmA0Slt93L8tg2doNjcTQeOR6w=','2014-07-27 18:44:04',0,'lgm','关明','卢','',1,1,'2014-04-16 06:34:25',''),(10,'pbkdf2_sha256$12000$PjAMD9dMm33s$62X8Oss9Hg0Mj7AGVMkDNwq0WaIik9d3jJNV1mVqIc0=','2014-07-27 18:36:34',0,'gxh','训华','顾','',1,1,'2014-05-30 05:51:57',''),(11,'pbkdf2_sha256$12000$VA2y8FVbbKt4$l2LwdVa2dSWXc0cNUX8GZDEynUQvaDnUEegPK5lrHXc=','2014-07-27 17:44:51',0,'qzx','祖兴','祁','',1,1,'2014-06-19 04:38:43',''),(12,'pbkdf2_sha256$12000$bYfO6L7y7hCo$pOjGd4vD/cGNOJ39oPFxUd54Ba2zDqBz8GvfYarCVcs=','2014-07-27 18:43:46',0,'zz','忠','张','',1,1,'2014-06-19 04:40:11',''),(13,'pbkdf2_sha256$12000$IgOjg6d1jtUd$16mqAmUybiH9SXgPcitEyVaDJQHGU9acmp/08g6jFWw=','2014-07-27 18:35:50',0,'zjx','静霞','赵','',1,1,'2014-06-19 04:43:50',''),(14,'pbkdf2_sha256$12000$1w4iyfk3e2ra$jGY9uPwsW9QGID1VOYGjow9r0HygaXoughWSPUPakek=','2014-07-27 18:40:12',0,'yq','芹','姚','',1,1,'2014-06-19 04:44:40',''),(15,'pbkdf2_sha256$12000$y8n7651jawAG$BdezGM1veXQCi1WiXK8e7qEQMnFb23y+jTBqrwkbMiw=','2014-07-27 18:40:56',0,'cx','欣','蔡','',1,1,'2014-06-19 04:45:09',''),(16,'pbkdf2_sha256$12000$t9tGv8Zjs0Jf$57IX9hYyMw5AZtEhVNMMemqVcn3KCfb5LgI8E4f86Uk=','2014-07-27 18:41:15',0,'lhm','惠明','倪','',1,1,'2014-06-19 04:45:42',''),(17,'pbkdf2_sha256$12000$N2oOgS9a4MiH$MW3Q6Kb5qwMD4dkr+12Baw1HJ3wJ5GJ3JDV7LzX4bYg=','2014-07-26 03:38:00',0,'xy','艳','徐','',1,1,'2014-06-19 04:46:18',''),(18,'pbkdf2_sha256$12000$t8NfitEJlGib$qZBKDNQqypX/tqgL/JWwRo8ococX6KaN0s9rmTGft9g=','2014-07-26 03:38:13',0,'zgz','国珍','张','',1,1,'2014-06-19 04:46:46',''),(19,'pbkdf2_sha256$12000$KDf3Lam0ZjYS$XQ9ubo64rNljRR4uquTFJhVZQe9D/86BBD/m73Rm6IE=','2014-07-27 16:42:31',0,'wl','丽','王','',1,1,'2014-06-19 04:47:10',''),(20,'pbkdf2_sha256$12000$QethqgyJNzN1$rcxy0eo8776L7oZc94FUsEkILa2PLUAATl971aiy3To=','2014-07-27 18:41:26',0,'yqm','秋明','袁','',1,1,'2014-06-19 04:47:32',''),(21,'pbkdf2_sha256$12000$bUGdpuH6xXvC$wrOqF93IqDBMgyd1dmE2ylCfByfhkkJ+2igCrPv1gUs=','2014-07-27 18:41:57',0,'zxh','祥慧','周','',1,1,'2014-06-19 04:48:49',''),(22,'pbkdf2_sha256$12000$FW8zUKIdaGDZ$gcGT/mOyp6CiAnPhk+plmn937yHld73cWMsTMkp3QLM=','2014-07-27 18:42:41',0,'lhl','海玲','梁','',1,1,'2014-06-19 04:49:24',''),(23,'pbkdf2_sha256$12000$U2w7eFww8PJt$atFHlFj0ABNRMEZy1vsZk7GEcRzIWt7laYFg+y4M6fY=','2014-06-19 05:34:30',0,'jlp','莉萍','江','',1,1,'2014-06-19 04:54:20',''),(24,'pbkdf2_sha256$12000$7WUicszy67Wo$zWZIuADCE54zlrrfGqVj03IRcJnUjxJtTjGNytNb9iA=','2014-06-29 17:07:27',0,'glq','利权','葛','',1,1,'2014-06-19 04:55:08',''),(25,'pbkdf2_sha256$12000$HMdvMBq0taim$Da0RrtEoll/5kNt4aTBIlOOzTxSfwlQl5tjRT+3MTVg=','2014-07-27 17:44:05',0,'zj','军','左','',1,1,'2014-06-19 04:55:35',''),(26,'pbkdf2_sha256$12000$tCLiuZffjV3D$UV43aREf5rXCDyhdCgAFjar+hUSpw0na/Iulkde1jl4=','2014-06-19 05:37:41',0,'fql','钦林','范','',1,1,'2014-06-19 04:56:15',''),(27,'pbkdf2_sha256$12000$cUtx4OjxMsBU$bJzueHdBDwmpd15ZxsxSF6RUIqAn4/7jF6lwhDayD58=','2014-07-26 03:43:44',0,'zcx','传新','朱','',1,1,'2014-06-19 04:56:57',''),(28,'pbkdf2_sha256$12000$4XiQq3wCdJ9L$rOgdI0PneY6/ymy1utxi58hJ60YgZnk4NWPek7Cw2zo=','2014-06-19 05:38:13',0,'xf','峰','徐','',1,1,'2014-06-19 04:57:30',''),(29,'pbkdf2_sha256$12000$tXFLZwD4WxAb$VJumRqynsaHI61RH+jQUgsmV2OHGrf0LVZMpO7mOuhk=','2014-06-19 05:38:31',0,'sdl','德荣','苏','',1,1,'2014-06-19 04:58:07',''),(30,'pbkdf2_sha256$12000$iOJDTlBa92K3$cyFSRlzw6QzTiOFZJv6rbiO6+GMx3r7RJYCwEcCrML4=','2014-06-19 05:38:43',0,'zjq','建秋','朱','',1,1,'2014-06-19 04:58:36',''),(31,'pbkdf2_sha256$12000$oCHOmZf04T3q$fjQzGtLDVhjuvc8XXHt05I/czBJX4oDPhQkXNml5B1Y=','2014-06-19 05:38:54',0,'tgz','贵震','汤','',1,1,'2014-06-19 04:59:01',''),(32,'pbkdf2_sha256$12000$Lq5z7fUkaiyB$XHfnjG9ClvRrBe3+gqsJ3b4Jqwft8u9S2WggiyjKi50=','2014-06-19 05:39:06',0,'pj','靖','彭','',1,1,'2014-06-19 04:59:28',''),(33,'pbkdf2_sha256$12000$kPIGyb0vmPbM$hx46tlreTTua7RaV2cvL1ddGhpplZKVd4qC1t4UDF9s=','2014-06-19 05:39:59',0,'ljw','金伟','凌','',1,1,'2014-06-19 04:59:57',''),(34,'pbkdf2_sha256$12000$hAv810NmJwS2$Wp1KiU4NejyAo65hiX0DJuEunTiMTZwHAKKsMCqDx9I=','2014-06-19 05:40:11',0,'wms','茂盛','吴','',1,1,'2014-06-19 05:00:26',''),(35,'pbkdf2_sha256$12000$mMp72L5PDk4k$b7t8f8qZZ81+bdnRCetM69Z+jHn/KaRNmIVjDvKKtoE=','2014-06-19 05:40:21',0,'zl','亮','张','',1,1,'2014-06-19 05:00:58',''),(36,'pbkdf2_sha256$12000$HejkJMrGVwgb$JbzIKBJjflzNvsensA0TMDM8cYcl0wI1QqGEc1jguDY=','2014-06-19 05:40:32',0,'zdj','大晶','张','',1,1,'2014-06-19 05:01:24',''),(37,'pbkdf2_sha256$12000$LDmFFB8EOph3$p00ATmy/92MpCD3bsKfRhDnBbLykqwuN0OWAZRWcP7Q=','2014-06-19 05:40:42',0,'ydh','大亨','杨','',1,1,'2014-06-19 05:01:53',''),(38,'pbkdf2_sha256$12000$TMSgM3GYblOq$3KVUlkw8g33L8iPo4kcXWaQ2f8mES8IKokjx7s/VXYM=','2014-06-19 05:40:52',0,'lm','明','李','',1,1,'2014-06-19 05:02:23',''),(39,'pbkdf2_sha256$12000$BTWGqawaxfxa$wrn8uvrSUlA2CDEou4UVioLlrsbd4nMhDBCg+Y4kHGQ=','2014-06-19 05:41:03',0,'zdq','登强','赵','',1,1,'2014-06-19 05:02:47',''),(40,'pbkdf2_sha256$12000$zxWfsSOEMBvD$Z5HkE4guVIoYglvkx2m5ei5sraV0uj/X4F7Tnkdb78Q=','2014-06-19 05:41:14',0,'fdf','冬峰','范','',1,1,'2014-06-19 05:03:12',''),(41,'pbkdf2_sha256$12000$O8H4yjYLo51y$1eqieD7EMT8iXP1Idztq/emxsNeJ13GxjuZzOvu2q6s=','2014-07-27 18:46:01',0,'zw','望','张','',1,1,'2014-07-27 18:45:11','');
/*!40000 ALTER TABLE `user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo_groups`
--

DROP TABLE IF EXISTS `user_userinfo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userinfo_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userinfo_id` (`userinfo_id`,`group_id`),
  KEY `user_userinfo_groups_8835ac30` (`userinfo_id`),
  KEY `user_userinfo_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_160a6ffe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `userinfo_id_refs_id_6e0f2a7f` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo_groups`
--

LOCK TABLES `user_userinfo_groups` WRITE;
/*!40000 ALTER TABLE `user_userinfo_groups` DISABLE KEYS */;
INSERT INTO `user_userinfo_groups` VALUES (11,2,1),(10,3,2),(13,4,3),(49,10,8),(57,11,6),(56,12,6),(17,13,7),(18,14,7),(50,15,11),(53,16,11),(52,17,11),(20,18,5),(21,19,5),(25,20,5),(22,21,4),(23,22,4),(26,23,4),(54,24,6),(29,25,6),(31,26,6),(32,27,6),(33,28,6),(34,29,6),(35,30,6),(36,31,6),(37,32,6),(55,33,6),(39,34,6),(40,35,6),(41,36,6),(42,37,6),(43,38,6),(44,39,6),(45,40,6),(58,41,4);
/*!40000 ALTER TABLE `user_userinfo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_userinfo_user_permissions`
--

DROP TABLE IF EXISTS `user_userinfo_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_userinfo_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `userinfo_id` (`userinfo_id`,`permission_id`),
  KEY `user_userinfo_user_permissions_8835ac30` (`userinfo_id`),
  KEY `user_userinfo_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_ada3e645` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `userinfo_id_refs_id_41c07eec` FOREIGN KEY (`userinfo_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_userinfo_user_permissions`
--

LOCK TABLES `user_userinfo_user_permissions` WRITE;
/*!40000 ALTER TABLE `user_userinfo_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_userinfo_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_actor`
--

DROP TABLE IF EXISTS `workflow_actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) DEFAULT NULL,
  `actor_name` varchar(20) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_actor_854631fb` (`route_id`),
  CONSTRAINT `route_id_refs_id_380c93bf` FOREIGN KEY (`route_id`) REFERENCES `workflow_route` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_actor`
--

LOCK TABLES `workflow_actor` WRITE;
/*!40000 ALTER TABLE `workflow_actor` DISABLE KEYS */;
INSERT INTO `workflow_actor` VALUES (1,1,'预算部门经理审批',1),(2,1,'副总经理审批',2),(3,1,'总经理审批',3),(4,2,'预算部门经理审批',1),(5,2,'副总经理审批',2),(6,2,'总经理审批',4),(7,2,'财务部门经理申批',3);
/*!40000 ALTER TABLE `workflow_actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_actoruser`
--

DROP TABLE IF EXISTS `workflow_actoruser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_actoruser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_actoruser_b6bbc2ee` (`actor_id`),
  KEY `workflow_actoruser_6340c63c` (`user_id`),
  CONSTRAINT `actor_id_refs_id_f0ec64a6` FOREIGN KEY (`actor_id`) REFERENCES `workflow_actor` (`id`),
  CONSTRAINT `user_id_refs_id_78fb73e7` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_actoruser`
--

LOCK TABLES `workflow_actoruser` WRITE;
/*!40000 ALTER TABLE `workflow_actoruser` DISABLE KEYS */;
INSERT INTO `workflow_actoruser` VALUES (1,1,4),(2,2,3),(3,3,2),(4,4,4),(5,5,3),(6,6,2),(7,7,10);
/*!40000 ALTER TABLE `workflow_actoruser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_item`
--

DROP TABLE IF EXISTS `workflow_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_item_b7398729` (`document_id`),
  KEY `workflow_item_854631fb` (`route_id`),
  KEY `workflow_item_6340c63c` (`user_id`),
  CONSTRAINT `document_id_refs_id_0c431d66` FOREIGN KEY (`document_id`) REFERENCES `document_document` (`id`),
  CONSTRAINT `route_id_refs_id_3dbaff88` FOREIGN KEY (`route_id`) REFERENCES `workflow_route` (`id`),
  CONSTRAINT `user_id_refs_id_86360a1a` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_item`
--

LOCK TABLES `workflow_item` WRITE;
/*!40000 ALTER TABLE `workflow_item` DISABLE KEYS */;
INSERT INTO `workflow_item` VALUES (2,9,'项目材料申请',1,12,0),(3,10,'项目材料申请',1,12,0),(4,11,'项目材料申请',1,12,0),(5,12,'项目材料申请',1,12,0),(6,13,'项目材料申请',1,12,0),(7,14,'项目材料申请',1,12,0),(8,15,'项目材料申请',1,12,0),(9,16,'项目材料申请',1,12,0),(10,17,'项目材料申请',1,12,0),(11,18,'项目材料申请',1,12,0),(12,19,'项目材料申请',1,12,0),(13,20,'项目材料申请',1,12,0),(14,21,'项目材料申请',1,12,0),(15,22,'项目材料申请',1,12,0),(16,23,'项目材料申请',1,12,0),(17,24,'项目材料申请',1,12,0),(18,25,'项目材料申请',1,12,0),(19,26,'项目材料申请',1,12,0),(20,27,'项目材料申请',1,12,0),(21,28,'项目材料申请',1,12,0),(22,29,'项目材料申请',1,12,0),(23,30,'项目材料申请',1,12,0),(24,31,'项目材料申请',1,12,0),(25,32,'项目材料申请',1,12,0),(26,33,'项目材料申请',1,12,0),(27,34,'项目材料申请',1,12,0),(28,35,'项目材料申请',1,12,0),(29,36,'项目材料申请',1,12,0),(30,37,'项目材料申请',1,12,0),(31,38,'项目材料申请',1,12,0),(32,39,'项目材料申请',1,12,0),(33,40,'项目材料申请',1,12,0),(34,41,'项目材料申请',1,12,0),(35,42,'项目材料申请',1,12,0),(36,43,'项目材料申请',1,12,0),(37,44,'项目材料申请',1,12,0),(38,45,'项目材料申请',1,12,0),(39,46,'项目材料申请',1,12,0),(40,48,'项目材料申请',1,12,0),(41,49,'项目材料申请',1,12,0),(42,50,'项目材料申请',1,12,0),(43,51,'项目材料申请',1,12,0),(44,52,'项目材料申请',1,12,0),(45,53,'项目材料申请',1,12,0),(46,54,'项目材料申请',1,12,0),(47,55,'项目材料申请',1,12,0),(48,56,'项目材料申请',1,12,0),(49,57,'项目材料申请',1,12,0),(50,58,'项目材料申请',1,12,0),(51,59,'项目材料申请',1,12,0),(52,60,'项目材料申请',1,12,1),(53,61,'项目材料申请',1,12,1),(54,62,'项目材料申请',1,12,2),(55,63,'付款申请',2,19,0),(56,64,'付款申请',2,19,2);
/*!40000 ALTER TABLE `workflow_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_route`
--

DROP TABLE IF EXISTS `workflow_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_name` varchar(20) NOT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_route_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_fab60d9f` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_route`
--

LOCK TABLES `workflow_route` WRITE;
/*!40000 ALTER TABLE `workflow_route` DISABLE KEYS */;
INSERT INTO `workflow_route` VALUES (1,'项目材料申请',6),(2,'付款申请',5);
/*!40000 ALTER TABLE `workflow_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_taskhistory`
--

DROP TABLE IF EXISTS `workflow_taskhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_taskhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_date` date NOT NULL,
  `comments` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_taskhistory_0a47aae8` (`item_id`),
  KEY `workflow_taskhistory_b6bbc2ee` (`actor_id`),
  KEY `workflow_taskhistory_6340c63c` (`user_id`),
  CONSTRAINT `actor_id_refs_id_0e7a1a95` FOREIGN KEY (`actor_id`) REFERENCES `workflow_actor` (`id`),
  CONSTRAINT `item_id_refs_id_8804e046` FOREIGN KEY (`item_id`) REFERENCES `workflow_item` (`id`),
  CONSTRAINT `user_id_refs_id_8ffdde4e` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_taskhistory`
--

LOCK TABLES `workflow_taskhistory` WRITE;
/*!40000 ALTER TABLE `workflow_taskhistory` DISABLE KEYS */;
INSERT INTO `workflow_taskhistory` VALUES (3,54,1,1,4,'2014-07-26',''),(4,53,1,1,4,'2014-07-26',''),(5,52,1,1,4,'2014-07-26',''),(6,54,2,1,3,'2014-07-26',''),(7,53,2,1,3,'2014-07-26',''),(8,52,2,1,3,'2014-07-26',''),(9,54,3,1,2,'2014-07-27',''),(10,56,4,1,4,'2014-07-27',''),(11,56,5,1,3,'2014-07-27',''),(12,56,7,1,10,'2014-07-27',''),(13,56,6,1,2,'2014-07-27','');
/*!40000 ALTER TABLE `workflow_taskhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_tasklist`
--

DROP TABLE IF EXISTS `workflow_tasklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_tasklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `actor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `workflow_tasklist_0a47aae8` (`item_id`),
  KEY `workflow_tasklist_b6bbc2ee` (`actor_id`),
  CONSTRAINT `actor_id_refs_id_07186254` FOREIGN KEY (`actor_id`) REFERENCES `workflow_actor` (`id`),
  CONSTRAINT `item_id_refs_id_bcada7d7` FOREIGN KEY (`item_id`) REFERENCES `workflow_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_tasklist`
--

LOCK TABLES `workflow_tasklist` WRITE;
/*!40000 ALTER TABLE `workflow_tasklist` DISABLE KEYS */;
INSERT INTO `workflow_tasklist` VALUES (2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,1),(12,12,1),(13,13,1),(14,14,1),(15,15,1),(16,16,1),(17,17,1),(18,18,1),(19,19,1),(20,20,1),(21,21,1),(22,22,1),(23,23,1),(24,24,1),(25,25,1),(26,26,1),(27,27,1),(28,28,1),(29,29,1),(30,30,1),(31,31,1),(32,32,1),(33,33,1),(34,34,1),(35,35,1),(36,36,1),(37,37,1),(38,38,1),(39,39,1),(40,40,1),(41,41,1),(42,42,1),(43,43,1),(44,44,1),(45,45,1),(46,46,1),(47,47,1),(48,48,1),(49,49,1),(50,50,1),(51,51,1),(52,52,3),(53,53,3),(54,54,3),(55,55,4),(56,56,6);
/*!40000 ALTER TABLE `workflow_tasklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `url_name` varchar(64) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_af66fd92` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_6b876262` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_f940d098` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,1,'dashboard:home:pos',''),(3,4,'dashboard:home:pos',''),(4,3,'dashboard:home:pos',''),(6,2,'dashboard:home:pos',''),(8,1,'user_userinfo_editform_portal','box-0,box-1,box-2,box-3,box-4|box-5'),(9,10,'dashboard:home:pos',''),(10,4,'payment_payment_editform_portal','box-0,box-1,box-2'),(12,11,'dashboard:home:pos',''),(13,21,'dashboard:home:pos',''),(14,12,'dashboard:home:pos',''),(15,13,'dashboard:home:pos',''),(16,14,'dashboard:home:pos',''),(17,15,'dashboard:home:pos',''),(18,16,'dashboard:home:pos',''),(19,17,'dashboard:home:pos',''),(20,18,'dashboard:home:pos',''),(21,19,'dashboard:home:pos',''),(22,20,'dashboard:home:pos',''),(23,22,'dashboard:home:pos',''),(24,23,'dashboard:home:pos',''),(25,24,'dashboard:home:pos',''),(26,25,'dashboard:home:pos',''),(27,26,'dashboard:home:pos',''),(28,27,'dashboard:home:pos',''),(29,28,'dashboard:home:pos',''),(30,29,'dashboard:home:pos',''),(31,30,'dashboard:home:pos',''),(32,31,'dashboard:home:pos',''),(33,32,'dashboard:home:pos',''),(34,33,'dashboard:home:pos',''),(35,34,'dashboard:home:pos',''),(36,35,'dashboard:home:pos',''),(37,36,'dashboard:home:pos',''),(38,37,'dashboard:home:pos',''),(39,38,'dashboard:home:pos',''),(40,39,'dashboard:home:pos',''),(41,40,'dashboard:home:pos',''),(42,19,'payment_payment_editform_portal','box-0,box-1,box-2'),(43,41,'dashboard:home:pos','');
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_974aa97d` FOREIGN KEY (`user_id`) REFERENCES `user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-27 11:46:48
