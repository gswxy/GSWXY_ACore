/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `chartitles_dbc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = UTF8MB4 */;
CREATE TABLE `chartitles_dbc` 
(
  `ID` INT NOT NULL DEFAULT 0,
  `Condition_ID` INT NOT NULL DEFAULT 0,
  `Name_Lang_enUS` varchar(100) DEFAULT NULL,
  `Name_Lang_enGB` varchar(100) DEFAULT NULL,
  `Name_Lang_koKR` varchar(100) DEFAULT NULL,
  `Name_Lang_frFR` varchar(100) DEFAULT NULL,
  `Name_Lang_deDE` varchar(100) DEFAULT NULL,
  `Name_Lang_enCN` varchar(100) DEFAULT NULL,
  `Name_Lang_zhCN` varchar(100) DEFAULT NULL,
  `Name_Lang_enTW` varchar(100) DEFAULT NULL,
  `Name_Lang_zhTW` varchar(100) DEFAULT NULL,
  `Name_Lang_esES` varchar(100) DEFAULT NULL,
  `Name_Lang_esMX` varchar(100) DEFAULT NULL,
  `Name_Lang_ruRU` varchar(100) DEFAULT NULL,
  `Name_Lang_ptPT` varchar(100) DEFAULT NULL,
  `Name_Lang_ptBR` varchar(100) DEFAULT NULL,
  `Name_Lang_itIT` varchar(100) DEFAULT NULL,
  `Name_Lang_Unk` varchar(100) DEFAULT NULL,
  `Name_Lang_Mask` INT unsigned NOT NULL DEFAULT 0,
  `Name1_Lang_enUS` varchar(100) DEFAULT NULL,
  `Name1_Lang_enGB` varchar(100) DEFAULT NULL,
  `Name1_Lang_koKR` varchar(100) DEFAULT NULL,
  `Name1_Lang_frFR` varchar(100) DEFAULT NULL,
  `Name1_Lang_deDE` varchar(100) DEFAULT NULL,
  `Name1_Lang_enCN` varchar(100) DEFAULT NULL,
  `Name1_Lang_zhCN` varchar(100) DEFAULT NULL,
  `Name1_Lang_enTW` varchar(100) DEFAULT NULL,
  `Name1_Lang_zhTW` varchar(100) DEFAULT NULL,
  `Name1_Lang_esES` varchar(100) DEFAULT NULL,
  `Name1_Lang_esMX` varchar(100) DEFAULT NULL,
  `Name1_Lang_ruRU` varchar(100) DEFAULT NULL,
  `Name1_Lang_ptPT` varchar(100) DEFAULT NULL,
  `Name1_Lang_ptBR` varchar(100) DEFAULT NULL,
  `Name1_Lang_itIT` varchar(100) DEFAULT NULL,
  `Name1_Lang_Unk` varchar(100) DEFAULT NULL,
  `Name1_Lang_Mask` INT unsigned NOT NULL DEFAULT 0,
  `Mask_ID` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8MB4;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `chartitles_dbc` WRITE;
/*!40000 ALTER TABLE `chartitles_dbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `chartitles_dbc` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

