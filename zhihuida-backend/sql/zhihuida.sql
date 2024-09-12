-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: zhihuida
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app`
--

DROP TABLE IF EXISTS `app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `appName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '应用名',
  `appDesc` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用描述',
  `appIcon` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '应用图标',
  `appType` tinyint NOT NULL DEFAULT '0' COMMENT '应用类型（0-得分类，1-测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT '0' COMMENT '评分策略（0-自定义，1-AI）',
  `reviewStatus` int NOT NULL DEFAULT '0' COMMENT '审核状态：0-待审核, 1-通过, 2-拒绝',
  `reviewMessage` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '审核信息',
  `reviewerId` bigint DEFAULT NULL COMMENT '审核人 id',
  `reviewTime` datetime DEFAULT NULL COMMENT '审核时间',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_appName` (`appName`)
) ENGINE=InnoDB AUTO_INCREMENT=1833486323403468803 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='应用';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app`
--

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;
INSERT INTO `app` VALUES (1,'自定义MBTI性格测试','测试性格','https://pic.imge.cc/2024/09/08/66dd60461984b.jpg',1,0,1,'',1,'2024-09-08 08:31:57',1,'2024-04-24 15:58:05','2024-09-08 16:31:56',0),(2,'MySQL题库','MySQL能力测试','https://pic.imge.cc/2024/09/10/66e03b5260c59.webp',0,0,1,'',1,'2024-09-10 12:28:37',1,'2024-04-25 11:39:30','2024-09-10 20:28:37',0),(3,'AI MBTI 性格测试','快来测测你的 MBTI','https://pic.imge.cc/2024/09/08/66dd618c3ac93.jpg',1,1,1,'',1,'2024-09-08 08:35:01',1,'2024-04-26 16:38:12','2024-09-08 16:35:00',0),(4,'AI 得分测试','看看你熟悉多少首都','https://pic.imge.cc/2024/09/10/66e03e7d8ec94.webp',0,1,1,'',1,'2024-09-10 12:41:52',1,'2024-04-26 16:38:56','2024-09-10 20:41:52',0),(1832476893278912513,'mysql面试题','mysql能力测评','',0,1,0,NULL,NULL,NULL,1,'2024-09-08 01:51:51','2024-09-08 01:51:51',0),(1832690050899378177,'测试1','测试1','',0,0,0,NULL,NULL,NULL,1,'2024-09-08 15:58:52','2024-09-08 15:59:24',1),(1833486323403468802,'国家首都测试','你认识哪些国家的首都','',0,1,1,'',1,'2024-09-10 12:44:57',1,'2024-09-10 20:42:58','2024-09-10 20:44:56',0);
/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `questionContent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '题目内容（json格式）',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_appId` (`appId`)
) ENGINE=InnoDB AUTO_INCREMENT=1833486688001732611 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='题目';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'[{\"options\":[{\"result\":\"I\",\"value\":\"独自工作\",\"key\":\"A\"},{\"result\":\"E\",\"value\":\"与他人合作\",\"key\":\"B\"}],\"title\":\"1. 你通常更喜欢\"},{\"options\":[{\"result\":\"J\",\"value\":\"喜欢有明确的计划\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"更愿意随机应变\",\"key\":\"B\"}],\"title\":\"2. 当安排活动时\"},{\"options\":[{\"result\":\"T\",\"value\":\"认为应该严格遵守\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"认为应灵活运用\",\"key\":\"B\"}],\"title\":\"3. 你如何看待规则\"},{\"options\":[{\"result\":\"E\",\"value\":\"经常是说话的人\",\"key\":\"A\"},{\"result\":\"I\",\"value\":\"更倾向于倾听\",\"key\":\"B\"}],\"title\":\"4. 在社交场合中\"},{\"options\":[{\"result\":\"J\",\"value\":\"先研究再行动\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"边做边学习\",\"key\":\"B\"}],\"title\":\"5. 面对新的挑战\"},{\"options\":[{\"result\":\"S\",\"value\":\"注重细节和事实\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"注重概念和想象\",\"key\":\"B\"}],\"title\":\"6. 在日常生活中\"},{\"options\":[{\"result\":\"T\",\"value\":\"更多基于逻辑分析\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"更多基于个人情感\",\"key\":\"B\"}],\"title\":\"7. 做决定时\"},{\"options\":[{\"result\":\"S\",\"value\":\"喜欢有结构和常规\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"喜欢自由和灵活性\",\"key\":\"B\"}],\"title\":\"8. 对于日常安排\"},{\"options\":[{\"result\":\"P\",\"value\":\"首先考虑可能性\",\"key\":\"A\"},{\"result\":\"J\",\"value\":\"首先考虑后果\",\"key\":\"B\"}],\"title\":\"9. 当遇到问题时\"},{\"options\":[{\"result\":\"T\",\"value\":\"时间是一种宝贵的资源\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"时间是相对灵活的概念\",\"key\":\"B\"}],\"title\":\"10. 你如何看待时间\"}]',1,1,'2024-04-24 16:41:53','2024-05-09 12:28:58',0),(2,'[{\"title\":\"MySQL中，SELECT语句属于哪一类语言？\",\"options\":[{\"score\":1,\"value\":\"数据查询语言\",\"key\":\"A\"},{\"score\":0,\"value\":\"数据定义语言\",\"key\":\"B\"}]},{\"title\":\"使用MySQL，下面哪个命令用于创建新数据库？\",\"options\":[{\"score\":1,\"value\":\"创建数据库\",\"key\":\"A\"},{\"score\":0,\"value\":\"删除表\",\"key\":\"B\"}]},{\"title\":\"在MySQL中，哪种数据类型通常用于存储整数值？\",\"options\":[{\"score\":1,\"value\":\"INT\",\"key\":\"A\"},{\"score\":0,\"value\":\"VARCHAR\",\"key\":\"B\"}]},{\"title\":\"在MySQL中，用于更新表的命令是？\",\"options\":[{\"score\":1,\"value\":\"UPDATE\",\"key\":\"A\"},{\"score\":0,\"value\":\"MODIFY\",\"key\":\"B\"}]},{\"title\":\"在MySQL中，哪个关键字用于合并两个或多个SELECT语句的结果集？\",\"options\":[{\"score\":1,\"value\":\"UNION\",\"key\":\"A\"},{\"score\":0,\"value\":\"JOIN\",\"key\":\"B\"}]}]',2,1,'2024-04-25 15:03:07','2024-09-10 20:32:05',0),(3,'[{\"options\":[{\"result\":\"I\",\"value\":\"独自工作\",\"key\":\"A\"},{\"result\":\"E\",\"value\":\"与他人合作\",\"key\":\"B\"}],\"title\":\"1. 你通常更喜欢\"},{\"options\":[{\"result\":\"J\",\"value\":\"喜欢有明确的计划\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"更愿意随机应变\",\"key\":\"B\"}],\"title\":\"2. 当安排活动时\"},{\"options\":[{\"result\":\"T\",\"value\":\"认为应该严格遵守\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"认为应灵活运用\",\"key\":\"B\"}],\"title\":\"3. 你如何看待规则\"},{\"options\":[{\"result\":\"E\",\"value\":\"经常是说话的人\",\"key\":\"A\"},{\"result\":\"I\",\"value\":\"更倾向于倾听\",\"key\":\"B\"}],\"title\":\"4. 在社交场合中\"},{\"options\":[{\"result\":\"J\",\"value\":\"先研究再行动\",\"key\":\"A\"},{\"result\":\"P\",\"value\":\"边做边学习\",\"key\":\"B\"}],\"title\":\"5. 面对新的挑战\"},{\"options\":[{\"result\":\"S\",\"value\":\"注重细节和事实\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"注重概念和想象\",\"key\":\"B\"}],\"title\":\"6. 在日常生活中\"},{\"options\":[{\"result\":\"T\",\"value\":\"更多基于逻辑分析\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"更多基于个人情感\",\"key\":\"B\"}],\"title\":\"7. 做决定时\"},{\"options\":[{\"result\":\"S\",\"value\":\"喜欢有结构和常规\",\"key\":\"A\"},{\"result\":\"N\",\"value\":\"喜欢自由和灵活性\",\"key\":\"B\"}],\"title\":\"8. 对于日常安排\"},{\"options\":[{\"result\":\"P\",\"value\":\"首先考虑可能性\",\"key\":\"A\"},{\"result\":\"J\",\"value\":\"首先考虑后果\",\"key\":\"B\"}],\"title\":\"9. 当遇到问题时\"},{\"options\":[{\"result\":\"T\",\"value\":\"时间是一种宝贵的资源\",\"key\":\"A\"},{\"result\":\"F\",\"value\":\"时间是相对灵活的概念\",\"key\":\"B\"}],\"title\":\"10. 你如何看待时间\"}]',3,1,'2024-04-26 16:39:29','2024-05-09 12:28:58',0),(4,'[{\"options\":[{\"score\":0,\"value\":\"利马\",\"key\":\"A\"},{\"score\":0,\"value\":\"圣多明各\",\"key\":\"B\"},{\"score\":0,\"value\":\"圣萨尔瓦多\",\"key\":\"C\"},{\"score\":1,\"value\":\"波哥大\",\"key\":\"D\"}],\"title\":\"哥伦比亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"蒙特利尔\",\"key\":\"A\"},{\"score\":0,\"value\":\"多伦多\",\"key\":\"B\"},{\"score\":1,\"value\":\"渥太华\",\"key\":\"C\"},{\"score\":0,\"value\":\"温哥华\",\"key\":\"D\"}],\"title\":\"加拿大的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"大阪\",\"key\":\"A\"},{\"score\":1,\"value\":\"东京\",\"key\":\"B\"},{\"score\":0,\"value\":\"京都\",\"key\":\"C\"},{\"score\":0,\"value\":\"名古屋\",\"key\":\"D\"}],\"title\":\"日本的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"墨尔本\",\"key\":\"A\"},{\"score\":0,\"value\":\"悉尼\",\"key\":\"B\"},{\"score\":0,\"value\":\"布里斯班\",\"key\":\"C\"},{\"score\":1,\"value\":\"堪培拉\",\"key\":\"D\"}],\"title\":\"澳大利亚的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"雅加达\",\"key\":\"A\"},{\"score\":0,\"value\":\"曼谷\",\"key\":\"B\"},{\"score\":0,\"value\":\"胡志明市\",\"key\":\"C\"},{\"score\":0,\"value\":\"吉隆坡\",\"key\":\"D\"}],\"title\":\"印度尼西亚的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"上海\",\"key\":\"A\"},{\"score\":0,\"value\":\"杭州\",\"key\":\"B\"},{\"score\":1,\"value\":\"北京\",\"key\":\"C\"},{\"score\":0,\"value\":\"广州\",\"key\":\"D\"}],\"title\":\"中国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"汉堡\",\"key\":\"A\"},{\"score\":0,\"value\":\"慕尼黑\",\"key\":\"B\"},{\"score\":1,\"value\":\"柏林\",\"key\":\"C\"},{\"score\":0,\"value\":\"科隆\",\"key\":\"D\"}],\"title\":\"德国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"釜山\",\"key\":\"A\"},{\"score\":1,\"value\":\"首尔\",\"key\":\"B\"},{\"score\":0,\"value\":\"大田\",\"key\":\"C\"},{\"score\":0,\"value\":\"仁川\",\"key\":\"D\"}],\"title\":\"韩国的首都是?\"},{\"options\":[{\"score\":0,\"value\":\"瓜达拉哈拉\",\"key\":\"A\"},{\"score\":0,\"value\":\"蒙特雷\",\"key\":\"B\"},{\"score\":1,\"value\":\"墨西哥城\",\"key\":\"C\"},{\"score\":0,\"value\":\"坎昆\",\"key\":\"D\"}],\"title\":\"墨西哥的首都是?\"},{\"options\":[{\"score\":1,\"value\":\"开罗\",\"key\":\"A\"},{\"score\":0,\"value\":\"亚历山大\",\"key\":\"B\"},{\"score\":0,\"value\":\"卢克索\",\"key\":\"C\"},{\"score\":0,\"value\":\"卡利乌比亚\",\"key\":\"D\"}],\"title\":\"埃及的首都是?\"}]',4,1,'2024-04-26 16:39:29','2024-05-09 12:28:58',0),(1833486688001732610,'[{\"title\":\"中国的首都是\",\"options\":[{\"score\":0,\"value\":\"北京\",\"key\":\"A\"},{\"score\":0,\"value\":\"\",\"key\":\"B\"}]},{\"title\":\"日本的首都是\",\"options\":[{\"score\":0,\"value\":\"东京\",\"key\":\"A\"},{\"score\":0,\"value\":\"\",\"key\":\"B\"}]},{\"title\":\"美国的首都是\",\"options\":[{\"score\":0,\"value\":\"华盛顿特区\",\"key\":\"A\"},{\"score\":0,\"value\":\"\",\"key\":\"B\"}]},{\"title\":\"英国的首都是\",\"options\":[{\"score\":0,\"value\":\"伦敦\",\"key\":\"A\"},{\"score\":0,\"value\":\"\",\"key\":\"B\"}]},{\"title\":\"法国的首都是\",\"options\":[{\"score\":0,\"value\":\"巴黎\",\"key\":\"A\"},{\"score\":0,\"key\":\"B\"}]}]',1833486323403468802,1,'2024-09-10 20:44:25','2024-09-10 20:44:25',0);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoring_result`
--

DROP TABLE IF EXISTS `scoring_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scoring_result` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果图片',
  `resultProp` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果属性集合 JSON，如 [I,S,T,J]',
  `resultScoreRange` int DEFAULT NULL COMMENT '结果得分范围，如 80，表示 80及以上的分数命中此结果',
  `appId` bigint NOT NULL COMMENT '应用 id',
  `userId` bigint NOT NULL COMMENT '创建用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_appId` (`appId`)
) ENGINE=InnoDB AUTO_INCREMENT=1833483928099368963 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='评分结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoring_result`
--

LOCK TABLES `scoring_result` WRITE;
/*!40000 ALTER TABLE `scoring_result` DISABLE KEYS */;
INSERT INTO `scoring_result` VALUES (1,'ISTJ（物流师）','忠诚可靠，被公认为务实，注重细节。','https://pic.imge.cc/2024/09/08/66dd669e535a9.webp','[\"I\",\"S\",\"T\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(2,'ISFJ（守护者）','善良贴心，以同情心和责任为特点。','https://pic.imge.cc/2024/09/08/66dd669e554aa.webp','[\"I\",\"S\",\"F\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(3,'INFJ（占有者）','理想主义者，有着深刻的洞察力，善于理解他人。','https://pic.imge.cc/2024/09/08/66dd66a5d667a.webp','[\"I\",\"N\",\"F\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(4,'INTJ（设计师）','独立思考者，善于规划和实现目标，理性而果断。','https://pic.imge.cc/2024/09/08/66dd66a1e8f0f.webp','[\"I\",\"N\",\"T\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(5,'ISTP（运动员）','冷静自持，善于解决问题，擅长实践技能。','https://pic.imge.cc/2024/09/08/66dd66a58eae1.webp','[\"I\",\"S\",\"T\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(6,'ISFP（艺术家）','具有艺术感和敏感性，珍视个人空间和自由。','https://pic.imge.cc/2024/09/08/66dd66a5d667a.webp','[\"I\",\"S\",\"F\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(7,'INFP（治愈者）','理想主义者，富有创造力，以同情心和理解他人著称。','https://pic.imge.cc/2024/09/08/66dd669e535a9.webp','[\"I\",\"N\",\"F\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(8,'INTP（学者）','思维清晰，探索精神，独立思考且理性。','https://pic.imge.cc/2024/09/08/66dd669e554aa.webp','[\"I\",\"N\",\"T\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(9,'ESTP（拓荒者）','敢于冒险，乐于冒险，思维敏捷，行动果断。','https://pic.imge.cc/2024/09/08/66dd66a58eae1.webp','[\"E\",\"S\",\"T\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(10,'ESFP（表演者）','热情开朗，善于社交，热爱生活，乐于助人。','https://pic.imge.cc/2024/09/08/66dd66a1e8f0f.webp','[\"E\",\"S\",\"F\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(11,'ENFP（倡导者）','富有想象力，充满热情，善于激发他人的活力和潜力。','https://pic.imge.cc/2024/09/08/66dd669e554aa.webp','[\"E\",\"N\",\"F\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(12,'ENTP（发明家）','充满创造力，善于辩论，挑战传统，喜欢探索新领域。','https://pic.imge.cc/2024/09/08/66dd66a5d667a.webp','[\"E\",\"N\",\"T\",\"P\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(13,'ESTJ（主管）','务实果断，善于组织和管理，重视效率和目标。','https://pic.imge.cc/2024/09/08/66dd669e535a9.webp','[\"E\",\"S\",\"T\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(14,'ESFJ（尽责者）','友善热心，以协调、耐心和关怀为特点，善于团队合作。','https://pic.imge.cc/2024/09/08/66dd66a5d667a.webp','[\"E\",\"S\",\"F\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(15,'ENFJ（教导着）','热情关爱，善于帮助他人，具有领导力和社交能力。','https://pic.imge.cc/2024/09/08/66dd66a58eae1.webp','[\"E\",\"N\",\"F\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(16,'ENTJ（统帅）','果断自信，具有领导才能，善于规划和执行目标。','https://pic.imge.cc/2024/09/08/66dd66a1e8f0f.webp','[\"E\",\"N\",\"T\",\"J\"]',NULL,1,1,'2024-04-24 16:57:02','2024-09-08 16:58:58',0),(17,'首都知识大师','你真棒棒哦，首都知识非常出色！',NULL,NULL,9,2,1,'2024-04-25 15:05:44','2024-09-10 20:33:34',1),(18,'地理小能手！','你对于世界各国的首都了解得相当不错，但还有一些小地方需要加强哦！',NULL,NULL,7,2,1,'2024-04-25 15:05:44','2024-09-10 20:33:33',1),(19,'继续加油！','还需努力哦',NULL,NULL,0,2,1,'2024-04-25 15:05:44','2024-05-09 12:28:21',0),(1833483928099368962,'mysql大师','恭喜你','https://pic.imge.cc/2024/09/10/66e03d5bc6052.png','[]',2,2,1,'2024-09-10 20:33:27','2024-09-10 20:37:16',0);
/*!40000 ALTER TABLE `scoring_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_unionId` (`unionId`)
) ENGINE=InnoDB AUTO_INCREMENT=1832446406036586498 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'mhha','91ef2cd53e7a3e365823cdda46145cbe',NULL,NULL,'mhha','https://pic.imge.cc/2024/09/08/66dd5cd4027c1.jpg','欢迎使用智慧答','admin','2024-05-09 11:13:13','2024-09-08 20:49:47',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answer`
--

DROP TABLE IF EXISTS `user_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_answer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT '0' COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT '0' COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '用户答案（JSON 数组）',
  `resultId` bigint DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果图标',
  `resultScore` int DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_appId` (`appId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户答题记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answer`
--

LOCK TABLES `user_answer` WRITE;
/*!40000 ALTER TABLE `user_answer` DISABLE KEYS */;
INSERT INTO `user_answer` VALUES (1,1,1,0,'[\"A\",\"A\",\"A\",\"B\",\"A\",\"A\",\"A\",\"B\",\"B\",\"A\"]',1,'ISTJ（物流师）','忠诚可靠，被公认为务实，注重细节。','icon_url_istj',NULL,1,'2024-05-09 15:08:22','2024-05-09 15:10:13',0),(2,2,0,0,'[\"D\",\"C\",\"B\",\"D\",\"A\",\"C\",\"C\",\"B\",\"C\",\"A\"]',17,'首都知识大师','你真棒棒哦，首都知识非常出色！',NULL,10,1,'2024-05-09 15:08:36','2024-05-09 15:10:13',0);
/*!40000 ALTER TABLE `user_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answer_0`
--

DROP TABLE IF EXISTS `user_answer_0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_answer_0` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT '0' COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT '0' COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '用户答案（JSON 数组）',
  `resultId` bigint DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果图标',
  `resultScore` int DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_appId` (`appId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1833486859112558593 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户答题记录分表 0';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answer_0`
--

LOCK TABLES `user_answer_0` WRITE;
/*!40000 ALTER TABLE `user_answer_0` DISABLE KEYS */;
INSERT INTO `user_answer_0` VALUES (1833484195133927424,2,0,0,'[\"A\",\"A\",\"A\",\"A\",\"B\"]',1833483928099368962,'mysql大师','恭喜你','',20,1,'2024-09-10 20:34:37','2024-09-10 20:34:37',0),(1833486094537076736,4,0,0,'[\"A\",\"B\",\"A\",\"B\",\"B\",\"A\",\"B\",\"C\",\"B\",\"B\"]',NULL,NULL,NULL,NULL,NULL,1,'2024-09-10 20:42:15','2024-09-10 20:42:15',0),(1833486859112558592,1833486323403468802,0,0,'[\"A\",\"A\",\"A\",\"A\",\"A\"]',NULL,NULL,NULL,NULL,NULL,1,'2024-09-10 20:45:15','2024-09-10 20:45:15',0);
/*!40000 ALTER TABLE `user_answer_0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answer_1`
--

DROP TABLE IF EXISTS `user_answer_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_answer_1` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `appId` bigint NOT NULL COMMENT '应用 id',
  `appType` tinyint NOT NULL DEFAULT '0' COMMENT '应用类型（0-得分类，1-角色测评类）',
  `scoringStrategy` tinyint NOT NULL DEFAULT '0' COMMENT '评分策略（0-自定义，1-AI）',
  `choices` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '用户答案（JSON 数组）',
  `resultId` bigint DEFAULT NULL COMMENT '评分结果 id',
  `resultName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果名称，如物流师',
  `resultDesc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '结果描述',
  `resultPicture` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '结果图标',
  `resultScore` int DEFAULT NULL COMMENT '得分',
  `userId` bigint NOT NULL COMMENT '用户 id',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `idx_appId` (`appId`),
  KEY `idx_userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=1832455311810641921 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户答题记录分表 1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answer_1`
--

LOCK TABLES `user_answer_1` WRITE;
/*!40000 ALTER TABLE `user_answer_1` DISABLE KEYS */;
INSERT INTO `user_answer_1` VALUES (1832455311810641920,1,1,0,'[\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\",\"A\"]',1,'ISTJ（物流师）','忠诚可靠，被公认为务实，注重细节。','icon_url_istj',NULL,1832446406036586497,'2024-09-08 00:26:17','2024-09-08 00:26:17',0);
/*!40000 ALTER TABLE `user_answer_1` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-12 22:34:25
