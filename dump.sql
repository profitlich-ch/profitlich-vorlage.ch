-- MariaDB dump 10.19  Distrib 10.5.15-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.25-MariaDB-1:10.4.25+maria~focal-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ozgdxxjzkkokfsoitiyjgvapyzybxoegsrnp` (`ownerId`),
  CONSTRAINT `fk_ozgdxxjzkkokfsoitiyjgvapyzybxoegsrnp` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_unvwbajetalcgkgvdlxjemuixdmwlelljhzf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mwgsrwqeqfwjhrikeyjzsisgnfncksamwiva` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_mlpkcgmwmxsdvudrhglvlzhhrthtewikrgom` (`dateRead`),
  KEY `fk_wfwimdndnrdcnfocszwejzxktjnkpmvtdbbc` (`pluginId`),
  CONSTRAINT `fk_cpokuvmomgabgqjkywgudctlhjlqgwzwptow` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wfwimdndnrdcnfocszwejzxktjnkpmvtdbbc` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_unpscgxjhvfzckfxembabflxopiixyfgonrh` (`sessionId`,`volumeId`),
  KEY `idx_kffuxliwknkmldsmtspyyehjvqtlgnvvtfyf` (`volumeId`),
  CONSTRAINT `fk_ddddikldqkeiumzuzugdsecazfphbzjljcip` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tiodbvgxfkooorssspjcuqaummhzhfsbwrdc` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexdata`
--

LOCK TABLES `assetindexdata` WRITE;
/*!40000 ALTER TABLE `assetindexdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hzzpopshxtwkofoztqslenomshgqoxpjxnlq` (`filename`,`folderId`),
  KEY `idx_hczpljhfoukbgvgrzqvvcpzruwurboctuiqv` (`folderId`),
  KEY `idx_wtvulrgpfjpropukygbjiniahslwutsklfyp` (`volumeId`),
  KEY `fk_jkpqrcdmnzerwlppuuyowwgckymmbrftdocc` (`uploaderId`),
  CONSTRAINT `fk_iuappkanntmmldwldivrumyrcovavybenwjs` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jkpqrcdmnzerwlppuuyowwgckymmbrftdocc` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_jyjihvphgptaggxglfhkiqoodakoopulnjlm` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_teqvxwabxfqpgsslovcjkfkwxtdvntzyaggv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (34,NULL,3,1,'asset633af76982e267.12846520.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:53:29','2022-10-03 14:53:29','2022-10-03 14:53:29'),(35,NULL,3,1,'asset633af7a5885197.88769114.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:54:29','2022-10-03 14:54:29','2022-10-03 14:54:29'),(36,NULL,3,1,'asset633af7bce79232.95857633.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:54:53','2022-10-03 14:54:53','2022-10-03 14:54:53'),(37,NULL,3,1,'asset633af806260545.50558061.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:56:06','2022-10-03 14:56:06','2022-10-03 14:56:06'),(38,NULL,3,1,'asset633afa46ce7523.62900012.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 15:05:42','2022-10-03 15:05:42','2022-10-03 15:05:42'),(39,NULL,3,1,'asset633afc5d72c2f9.98811315.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 15:14:37','2022-10-03 15:14:37','2022-10-03 15:14:37'),(40,NULL,3,1,'asset633b00237c7d68.06510024.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 15:30:43','2022-10-03 15:30:43','2022-10-03 15:30:43'),(43,NULL,3,1,'asset633b172abcc216.55844537.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:08:58','2022-10-03 17:08:58','2022-10-03 17:08:58'),(44,NULL,3,1,'asset633b182e4157c9.63276740.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:13:18','2022-10-03 17:13:18','2022-10-03 17:13:18'),(45,NULL,3,1,'asset633b183a643535.13439729.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:13:30','2022-10-03 17:13:30','2022-10-03 17:13:30'),(50,2,4,1,'Ts_paralax_191_Ts_a.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:32:42','2022-10-03 17:32:42','2022-10-04 15:30:54');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tmukawgdanhcpleyonuefclfhnbedgrbfxhc` (`groupId`),
  KEY `fk_aiiduzquiusuhscalhhkdlvinseflmspaetb` (`parentId`),
  CONSTRAINT `fk_aiiduzquiusuhscalhhkdlvinseflmspaetb` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wfbngzxazxoifzzxhjdocryafrouqzenlizj` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wwirjxpaeomraebbhdpvrnzudrfyzjaxgjgq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aetllllvkayqpztiaoiiljefwvaunvqmqjne` (`name`),
  KEY `idx_oicljrfletxhczuqjjschwphnsofqcxxpscb` (`handle`),
  KEY `idx_egsbiegztftymgqztoqpupxshghzunymvihh` (`structureId`),
  KEY `idx_zgurjgtdodcfcaxvnmckmqprvuposfstqxyp` (`fieldLayoutId`),
  KEY `idx_dfxvqfaqokivupiadxcmoxoupvnrzkgwvwwh` (`dateDeleted`),
  CONSTRAINT `fk_kmbjlpqglnibgivearldiynrgzuctutwvyss` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zwbwtdmwrtbdmtdurkipcuubziunukbvbrny` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vjbxinqqchbdwvdrpcxqwfcigxdlkkynhorb` (`groupId`,`siteId`),
  KEY `idx_dvtzaxxlketfsfdyynfojulvjunpahevftjt` (`siteId`),
  CONSTRAINT `fk_jcysjcqkuklyuuxwgqtobzhtljqmamsqxbpv` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_uzsaemgadzbwglijalicspvfeknbaiakybwz` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_clondfdmibmmxbxgwaubiawjqehcaxkydcey` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_qttamkjokglbjolklaqubkzgoyziqrfrjhep` (`siteId`),
  KEY `fk_cyubgkkimtbdvbquckwyvrwbdefxoszyjybz` (`userId`),
  CONSTRAINT `fk_cyubgkkimtbdvbquckwyvrwbdefxoszyjybz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_qttamkjokglbjolklaqubkzgoyziqrfrjhep` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wzaagutugiciuwzhrthchvfbrbmhxzdsccwt` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES (1,1,'fullName','2022-09-30 11:48:11',0,1),(2,1,'title','2022-09-28 12:25:04',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_tgwnverrtttafxpupvfgxvzesdsvgaucafta` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_oprfzzidlkaclebddescvpiihguhudpfsewz` (`siteId`),
  KEY `fk_zfqrmritqlhejkylbpmwethyyzggewbybiog` (`fieldId`),
  KEY `fk_cykardiifvparqvfvcydhhozpezntzmezcan` (`userId`),
  CONSTRAINT `fk_cykardiifvparqvfvcydhhozpezntzmezcan` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mjdfcjmgxcsuhosylqpphnvbfutexbikxelc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oprfzzidlkaclebddescvpiihguhudpfsewz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zfqrmritqlhejkylbpmwethyyzggewbybiog` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES (2,1,3,'2022-09-29 10:18:16',0,1),(2,1,5,'2022-09-29 12:30:31',0,1),(2,1,8,'2022-09-29 12:31:04',0,1),(2,1,10,'2022-10-04 15:45:57',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_filipa2_eymkjnns` text DEFAULT NULL,
  `field_felix_toxwzikf` int(10) DEFAULT NULL,
  `field_konflikt_lftxpsoa` text DEFAULT NULL,
  `field_farbe_ctrdgacg` varchar(7) DEFAULT NULL,
  `field_konflikt20MitBranch_munkpyzi` text DEFAULT NULL,
  `field_bildbeschreibung_dukgymih` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qednwlpgzzaomxnqvmvznyitxtydmeumxmxp` (`elementId`,`siteId`),
  KEY `idx_bqqjmtvrchxgkteteqhhjxtgfggysqluixbs` (`siteId`),
  KEY `idx_mbmnuktouxfuiaoklbcmpzlxpxydrlqmkeda` (`title`),
  CONSTRAINT `fk_arxywmxhupmwrpcvgrneqbtwqqriydjwzwud` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nqoftmbiasbiftxdrugixhizslbrjjypujhs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,1,1,NULL,'2022-09-28 08:08:17','2022-09-30 11:48:11','f6126d7e-dfbc-43c0-87ae-29ed1ee2c271',NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,'Reiner Zufall','2022-09-28 12:24:30','2022-10-04 15:45:57','9c0f2851-afff-4e96-9859-af68a1d0344d','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(3,3,1,'Startseite','2022-09-28 12:24:30','2022-09-28 12:24:30','6223cd7a-2d4d-4219-b487-c06c5b7bf143',NULL,NULL,NULL,NULL,NULL,NULL),(4,4,1,'Startseite','2022-09-28 12:24:30','2022-09-28 12:24:30','4b049a88-fd52-407f-b214-f86551a5d276',NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'Startseite','2022-09-28 12:24:30','2022-09-28 12:24:30','f84faa64-bb59-4a62-b46e-81992218cdc5',NULL,NULL,NULL,NULL,NULL,NULL),(7,7,1,'Startseite','2022-09-28 12:24:56','2022-09-28 12:24:56','0507bf25-fc6b-49e0-817b-d077ce62ff86',NULL,NULL,NULL,NULL,NULL,NULL),(8,8,1,'Reiner Zufall','2022-09-28 12:25:04','2022-09-28 12:25:04','0122f609-a250-4c2a-a51c-a886f60a1087',NULL,NULL,NULL,NULL,NULL,NULL),(9,9,1,'Reiner Zufall','2022-09-28 12:27:24','2022-09-28 12:27:24','021ad7d1-66e5-46a1-8d05-dd8133989382',NULL,NULL,NULL,NULL,NULL,NULL),(10,10,1,'Reiner Zufall','2022-09-28 12:27:24','2022-09-28 12:27:24','467a3c56-99fe-4b97-8c19-248bed77d802',NULL,NULL,NULL,NULL,NULL,NULL),(11,11,1,'Reiner Zufall','2022-09-28 12:27:24','2022-09-28 12:27:24','9a8e4947-14da-4826-8fad-75a83746d42c',NULL,NULL,NULL,NULL,NULL,NULL),(12,12,1,'Reiner Zufall','2022-09-28 12:27:24','2022-09-28 12:27:24','824cbc6a-d25e-48f7-b6ea-900e4461e71b',NULL,NULL,NULL,NULL,NULL,NULL),(14,14,1,'Reiner Zufall','2022-09-28 12:56:27','2022-09-28 12:56:27','0f86a201-64d3-4957-b798-3e58f6c5826f',NULL,NULL,NULL,NULL,NULL,NULL),(16,16,1,'Reiner Zufall','2022-09-28 12:57:03','2022-09-28 12:57:03','31a3e95d-c61e-4ba3-942e-0a6a0e3708fa',NULL,NULL,NULL,NULL,NULL,NULL),(17,17,1,'Reiner Zufall','2022-09-29 09:53:37','2022-09-29 09:53:37','a6052e35-af26-47ac-889c-d6dfb4538ec7',NULL,NULL,NULL,NULL,NULL,NULL),(18,18,1,'Reiner Zufall','2022-09-29 09:53:50','2022-09-29 09:53:50','c283f4fd-1ace-410b-84f8-f609d711d641',NULL,NULL,NULL,NULL,NULL,NULL),(19,19,1,'Reiner Zufall','2022-09-29 09:54:19','2022-09-29 09:54:19','58c3a131-81be-43e9-b954-209cf79034a9',NULL,NULL,NULL,NULL,NULL,NULL),(20,20,1,'Reiner Zufall','2022-09-29 10:18:02','2022-09-29 10:18:02','2a757f79-6c0e-4ee3-b4da-0f8e38ec7e1f',NULL,NULL,NULL,NULL,NULL,NULL),(22,22,1,'Reiner Zufall','2022-09-29 10:18:16','2022-09-29 10:18:16','f26fcbac-2b83-4390-bf9e-ebb2e3240155','Test Test',NULL,NULL,NULL,NULL,NULL),(23,23,1,'Reiner Zufall','2022-09-29 12:26:47','2022-09-29 12:26:47','f8f628eb-d168-4a3b-b3e9-482681cf38fd','Test Test',NULL,NULL,NULL,NULL,NULL),(24,24,1,'Reiner Zufall','2022-09-29 12:26:47','2022-09-29 12:26:47','265b16cb-5f88-4bd6-a78a-56445380f81d','Test Test',NULL,NULL,NULL,NULL,NULL),(25,25,1,'Reiner Zufall','2022-09-29 12:27:49','2022-09-29 12:27:49','dedc4dcb-0127-4a27-84d6-65df483cf14f','Test Test',NULL,NULL,NULL,NULL,NULL),(27,27,1,'Reiner Zufall','2022-09-29 12:30:31','2022-09-29 12:30:31','460eddc0-92b3-4ce3-b51d-533b4c02360e','Test Test',23456,NULL,NULL,NULL,NULL),(28,28,1,'Reiner Zufall','2022-09-29 12:30:55','2022-09-29 12:30:55','0c89160e-d028-4d14-8775-f44a0240ff4f','Test Test',23456,NULL,NULL,NULL,NULL),(30,30,1,'Reiner Zufall','2022-09-29 12:31:04','2022-09-29 12:31:04','fa8af6d3-0d4a-4aa1-b0ba-12c8b9fd02b7','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(31,31,1,'Reiner Zufall','2022-09-29 12:38:02','2022-09-29 12:38:02','4e4ce98f-8232-4337-a5a1-d93326b3f68d','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(32,32,1,'Reiner Zufall','2022-09-29 12:38:02','2022-09-29 12:38:02','918c5566-f46d-4a4a-a04e-f5f9c8100e2c','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(33,33,1,'Reiner Zufall','2022-10-03 14:52:57','2022-10-03 14:52:57','caedb3dd-0e0e-422e-8786-bdf177bf8a74','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(34,34,1,'Asset633af76982e267 12846520','2022-10-03 14:53:29','2022-10-03 14:53:29','f73c38b5-dcd2-4243-9720-be221bfbb648',NULL,NULL,NULL,NULL,NULL,NULL),(35,35,1,'Asset633af7a5885197 88769114','2022-10-03 14:54:29','2022-10-03 14:54:29','4366ff28-426f-459e-9ab5-41c1f7087eee',NULL,NULL,NULL,NULL,NULL,NULL),(36,36,1,'Asset633af7bce79232 95857633','2022-10-03 14:54:52','2022-10-03 14:54:52','b2f0d835-1ec8-492d-81ba-b5b6c972d11e',NULL,NULL,NULL,NULL,NULL,NULL),(37,37,1,'Asset633af806260545 50558061','2022-10-03 14:56:06','2022-10-03 14:56:06','4ddef3a6-a27d-491a-9008-df134cc46128',NULL,NULL,NULL,NULL,NULL,NULL),(38,38,1,'Asset633afa46ce7523 62900012','2022-10-03 15:05:42','2022-10-03 15:05:42','b542b0be-721a-4df1-9e6a-d81d530c22eb',NULL,NULL,NULL,NULL,NULL,NULL),(39,39,1,'Asset633afc5d72c2f9 98811315','2022-10-03 15:14:37','2022-10-03 15:14:37','53a71c67-21c9-48b3-9900-aa66152fa9f1',NULL,NULL,NULL,NULL,NULL,NULL),(40,40,1,'Asset633b00237c7d68 06510024','2022-10-03 15:30:43','2022-10-03 15:30:43','558cb587-d3c3-4295-a741-9a9f1a07209b',NULL,NULL,NULL,NULL,NULL,NULL),(41,41,1,'Reiner Zufall','2022-10-03 16:18:58','2022-10-03 16:18:58','c32f2b70-9392-4b31-89da-f6d04898ea4e','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(42,42,1,'Reiner Zufall','2022-10-03 16:19:08','2022-10-03 16:19:08','e2f2925c-800d-4b10-a55e-09d9c4d482b7','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(43,43,1,'Asset633b172abcc216 55844537','2022-10-03 17:08:58','2022-10-03 17:08:58','65418e8e-35da-4099-8fbd-7d3e49b00ba7',NULL,NULL,NULL,NULL,NULL,NULL),(44,44,1,'Asset633b182e4157c9 63276740','2022-10-03 17:13:18','2022-10-03 17:13:18','78cf7020-c7b3-4821-b796-ba5856a57596',NULL,NULL,NULL,NULL,NULL,NULL),(45,45,1,'Asset633b183a643535 13439729','2022-10-03 17:13:30','2022-10-03 17:13:30','01021c1a-142e-4a9c-a2ee-c30dd02d3ce1',NULL,NULL,NULL,NULL,NULL,NULL),(50,50,1,'Ts paralax 191 Ts a','2022-10-03 17:32:41','2022-10-04 15:30:54','5576cfaa-eb57-4887-bf10-1f55a42eb372',NULL,NULL,NULL,NULL,NULL,'Atomuhr'),(52,52,1,'Reiner Zufall','2022-10-03 21:37:42','2022-10-03 21:37:42','3f101192-2058-4c01-a7a3-ba8629f5a8de','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(53,53,1,'Reiner Zufall','2022-10-04 09:51:59','2022-10-04 09:51:59','239c5578-ebcf-413b-87b6-89b5d64688a5','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(54,54,1,'Reiner Zufall','2022-10-04 09:55:54','2022-10-04 09:55:54','7e481f59-a160-4563-b4d2-fddf41c63b93','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(55,55,1,'Reiner Zufall','2022-10-04 15:30:56','2022-10-04 15:30:56','5707325b-41bb-480b-8ac8-d987c3598ce7','Test Test',23456,NULL,'#90e2ef',NULL,NULL),(57,57,1,'Reiner Zufall','2022-10-04 15:45:57','2022-10-04 15:45:57','d813e71e-8c7a-4ee5-91e3-6f44032d6711','Test Test',23456,NULL,'#90e2ef',NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cyrjjtnqosykuakjxocqlqlrbolrpnjhamro` (`userId`),
  CONSTRAINT `fk_cyrjjtnqosykuakjxocqlqlrbolrpnjhamro` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mixbmrzriqmrltkdwbzqwpgeuxuxnzgurejf` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_bvrxcedubqblhzoqrngtqorwscpxlbhnrkqn` (`creatorId`,`provisional`),
  KEY `idx_mmikaeuabpuxctdwhyfykvnsetwiunnudgak` (`saved`),
  KEY `fk_rpkptkmdrzagtoikvymtkbjjvyxcthalzhvm` (`canonicalId`),
  CONSTRAINT `fk_jzcdarnqzhwghlweuumfwkhsbrnxeoecqfwj` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rpkptkmdrzagtoikvymtkbjjvyxcthalzhvm` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fveekhluzqtkvjdugdfmxbzrnoihwpopwzge` (`dateDeleted`),
  KEY `idx_jbkkualscvmsctrgmdsgmowikgwquloevkpu` (`fieldLayoutId`),
  KEY `idx_ybmttfeyowumtoxwxhnlwdjqfsqzihsgsuxs` (`type`),
  KEY `idx_gzmhrfieltblhsmafytngevctcphjsqwjgxl` (`enabled`),
  KEY `idx_itsujpugmgskysshqhwyhnlobvrzsefqqpfq` (`archived`,`dateCreated`),
  KEY `idx_bqyivutztorrjrjymakqatyytfeneicvumof` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_maaifqpxxcnzaphufytrfgvvmcbxbymuzjbc` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_rtdiwkydecvqrlqbbmstmjjvhgiiucwmmvqo` (`canonicalId`),
  KEY `fk_aneqzzoebavudwmquciuunjdcyisaybsozjr` (`draftId`),
  KEY `fk_nidfhzmawapvwynoziaxtwvrnckzhyhqdpvb` (`revisionId`),
  CONSTRAINT `fk_aneqzzoebavudwmquciuunjdcyisaybsozjr` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cedzikdlhfaypgjcgjqpbimyolsfyznvempo` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nidfhzmawapvwynoziaxtwvrnckzhyhqdpvb` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rtdiwkydecvqrlqbbmstmjjvhgiiucwmmvqo` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-09-28 08:08:17','2022-09-30 11:48:11',NULL,NULL,'93ff1eae-a809-48c5-8c5c-102b24b5db0b'),(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2022-10-04 15:45:57',NULL,NULL,'439cd31e-c532-45b2-8bc3-453ad109657b'),(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2022-09-28 12:24:30',NULL,NULL,'b9f4b01d-79e6-4ee8-8065-bb8aaf430f02'),(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2022-09-28 12:24:30',NULL,NULL,'a4bbb624-ee50-4e42-87e2-3122257bfa20'),(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2022-09-28 12:24:30',NULL,NULL,'8350a19c-f110-4ee5-adc1-43309377d8f0'),(7,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:56','2022-09-28 12:24:56',NULL,NULL,'de21f3cd-9941-4911-803f-9f5d0539e141'),(8,2,NULL,5,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:25:04','2022-09-28 12:25:04',NULL,NULL,'edc2c919-26b6-4cd2-947a-4c30f28157e7'),(9,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,'960cd6ea-182d-4fa0-84fb-d3cbf85690bc'),(10,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,'760c7448-66b7-4630-aef2-94a95eddac23'),(11,2,NULL,8,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,'f76f372b-e5a7-4dfc-936c-68af6dda63a7'),(12,2,NULL,9,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,'afa9baeb-c067-46a1-8bfb-3257855e4a7d'),(14,2,NULL,10,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:56:27','2022-09-28 12:56:27',NULL,NULL,'62213552-b2bd-49d1-bc5e-b955a040c305'),(16,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:57:03','2022-09-28 12:57:03',NULL,NULL,'693409d4-c9e3-4cdc-b999-66502f434cfa'),(17,2,NULL,12,1,'craft\\elements\\Entry',1,0,'2022-09-29 09:53:37','2022-09-29 09:53:37',NULL,NULL,'7a3342f1-6b67-4bd7-9bd3-b74a30b857bf'),(18,2,NULL,13,1,'craft\\elements\\Entry',1,0,'2022-09-29 09:53:50','2022-09-29 09:53:50',NULL,NULL,'389ecbeb-ed62-4bc2-93ca-56ebfe42bf2a'),(19,2,NULL,14,1,'craft\\elements\\Entry',1,0,'2022-09-29 09:54:19','2022-09-29 09:54:19',NULL,NULL,'2ac74abf-f5e3-4251-b968-88a3982273e8'),(20,2,NULL,15,1,'craft\\elements\\Entry',1,0,'2022-09-29 10:18:02','2022-09-29 10:18:02',NULL,NULL,'12c9477c-8fd4-4347-9e37-390cc9380efe'),(22,2,NULL,16,1,'craft\\elements\\Entry',1,0,'2022-09-29 10:18:16','2022-09-29 10:18:16',NULL,NULL,'f6f74bd5-1c21-44e7-a27c-737f2800d2ae'),(23,2,NULL,17,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:26:47','2022-09-29 12:26:47',NULL,NULL,'1d34be13-e997-4376-8d0b-82effa50ffd2'),(24,2,NULL,18,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:26:47','2022-09-29 12:26:47',NULL,NULL,'f55b33b0-da59-41a5-8dde-664361a2a235'),(25,2,NULL,19,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:27:49','2022-09-29 12:27:49',NULL,NULL,'8693a192-3f45-4612-a584-0cfde6c4f7cf'),(27,2,NULL,20,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:30:31','2022-09-29 12:30:31',NULL,NULL,'026e85a1-1788-4c42-ae7c-7c5fd8676e8d'),(28,2,NULL,21,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:30:55','2022-09-29 12:30:55',NULL,NULL,'3a73fa4b-3c12-4f1b-8893-d0b7751a60c0'),(30,2,NULL,22,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:31:04','2022-09-29 12:31:04',NULL,NULL,'602732a3-0a86-4161-9282-ae4582b5baa3'),(31,2,NULL,23,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:38:02','2022-09-29 12:38:02',NULL,NULL,'d12b22e0-2918-4c27-a5c2-4ba6a79ce17c'),(32,2,NULL,24,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:38:02','2022-09-29 12:38:02',NULL,NULL,'9459ebd6-58dc-4734-92e2-a8573d2d7c13'),(33,2,NULL,25,1,'craft\\elements\\Entry',1,0,'2022-10-03 14:52:57','2022-10-03 14:52:57',NULL,NULL,'8c8f795f-011e-4f96-8f79-27ce6cb6b6f1'),(34,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:53:29','2022-10-03 14:53:29',NULL,NULL,'291c1bcb-43d5-4ff1-920b-6b7d87a79d3e'),(35,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:54:29','2022-10-03 14:54:29',NULL,NULL,'d5507006-f6ba-4932-ba32-7835c0a92e46'),(36,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:54:52','2022-10-03 14:54:52',NULL,NULL,'4eca4cb5-650c-466a-8784-5663fe8cfaf1'),(37,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:56:06','2022-10-03 14:56:06',NULL,NULL,'024914a4-4cbe-461d-ad84-5366fe9aa2b9'),(38,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 15:05:42','2022-10-03 15:05:42',NULL,NULL,'83ce9f72-03af-460f-bed6-858e9f57e4c4'),(39,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 15:14:37','2022-10-03 15:14:37',NULL,NULL,'ffd168e9-3bff-4962-926b-fb53e0eae0f8'),(40,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 15:30:43','2022-10-03 15:30:43',NULL,NULL,'12113e47-02c8-448b-b4ed-8d9085dd1f25'),(41,2,NULL,26,1,'craft\\elements\\Entry',1,0,'2022-10-03 16:18:58','2022-10-03 16:18:58',NULL,NULL,'923807a3-2d10-4120-abc5-cb67f3e0aeaa'),(42,2,NULL,27,1,'craft\\elements\\Entry',1,0,'2022-10-03 16:19:08','2022-10-03 16:19:08',NULL,NULL,'bad78aa6-ebe8-453b-85fb-7066b01c7b21'),(43,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 17:08:58','2022-10-03 17:08:58',NULL,NULL,'3ee9460b-d66d-4d96-8776-a9ca60c1511e'),(44,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 17:13:18','2022-10-03 17:13:18',NULL,NULL,'2c0280e6-9c41-4b0b-9499-f2aa95ac1e67'),(45,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 17:13:30','2022-10-03 17:13:30',NULL,NULL,'245225f2-862e-4c8f-ab2c-4072d3281bbc'),(50,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-10-03 17:32:41','2022-10-04 15:30:54',NULL,NULL,'d7a1142c-f47a-49e3-b3ba-77bd1836b47f'),(52,2,NULL,28,1,'craft\\elements\\Entry',1,0,'2022-10-03 21:37:42','2022-10-03 21:37:42',NULL,NULL,'68e62069-6da4-4aa7-b619-1d782627a098'),(53,2,NULL,29,1,'craft\\elements\\Entry',1,0,'2022-10-04 09:51:59','2022-10-04 09:51:59',NULL,NULL,'66217ec0-40c5-4808-bcaa-e4d883021bc8'),(54,2,NULL,30,1,'craft\\elements\\Entry',1,0,'2022-10-04 09:55:54','2022-10-04 09:55:54',NULL,NULL,'f1088f95-c8ec-4374-b695-8d548012445e'),(55,2,NULL,31,1,'craft\\elements\\Entry',1,0,'2022-10-04 15:30:56','2022-10-04 15:30:56',NULL,NULL,'4e808f59-aa31-4824-bf7a-26a360de0bd8'),(57,2,NULL,32,1,'craft\\elements\\Entry',1,0,'2022-10-04 15:45:57','2022-10-04 15:45:57',NULL,NULL,'21bd8a62-d8c0-490e-a867-5c7c77bf23b1');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ztwyxjxtgvlgcdqsnagtdnnpoazgtzfymuvf` (`elementId`,`siteId`),
  KEY `idx_dzcfdsarkvzkiyilipjcatiwkvbtuevricgk` (`siteId`),
  KEY `idx_ahlwcijeamqwssfdmcaluldwkfdnvspdvrjo` (`slug`,`siteId`),
  KEY `idx_hqkpnwxguubagxjelpaxjwjojlsjgkjmubno` (`enabled`),
  KEY `idx_zlvtcukezcrpptrzvjjwximyfmkuvjzergqd` (`uri`,`siteId`),
  CONSTRAINT `fk_temteqgowhfhpxokeldgqekhgfidcvcbqngc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yceeftjuorghylwmascvixnayjfwilrtffcy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2022-09-28 08:08:17','2022-09-28 08:08:17','3383af9f-5662-4bca-83c6-62ceb0a97ac3'),(2,2,1,'startseite','__home__',1,'2022-09-28 12:24:30','2022-09-28 12:24:30','92ab4b47-56a4-4bfd-9e11-38837b48cc2f'),(3,3,1,'startseite','__home__',1,'2022-09-28 12:24:30','2022-09-28 12:24:30','bc2c96e8-4b47-4d63-904d-6b4535a2e017'),(4,4,1,'startseite','__home__',1,'2022-09-28 12:24:30','2022-09-28 12:24:30','6ac103ad-ffcb-47dc-8b3f-4b6de5caa1cc'),(5,5,1,'startseite','__home__',1,'2022-09-28 12:24:30','2022-09-28 12:24:30','5e0b824d-bae7-4de6-8cfe-3bc6284471cc'),(7,7,1,'startseite','__home__',1,'2022-09-28 12:24:56','2022-09-28 12:24:56','629a850e-c233-45ef-b4bc-7aed9bbe107e'),(8,8,1,'startseite','__home__',1,'2022-09-28 12:25:04','2022-09-28 12:25:04','424cf592-1ac0-4d33-848d-f2005f939f9b'),(9,9,1,'startseite','__home__',1,'2022-09-28 12:27:24','2022-09-28 12:27:24','dddf4b69-5e42-4b41-82e3-d6d43cd253a1'),(10,10,1,'startseite','__home__',1,'2022-09-28 12:27:24','2022-09-28 12:27:24','ebabd95e-17b5-48dd-801b-b13bf2e98d8e'),(11,11,1,'startseite','__home__',1,'2022-09-28 12:27:24','2022-09-28 12:27:24','c1e6f1fb-516d-410a-8e22-70c99f6a8bd1'),(12,12,1,'startseite','__home__',1,'2022-09-28 12:27:24','2022-09-28 12:27:24','550eacaf-91ca-4d18-a9b2-55d0182c92c2'),(14,14,1,'startseite','__home__',1,'2022-09-28 12:56:27','2022-09-28 12:56:27','130657d8-399a-4c42-94e6-7cf176932bd9'),(16,16,1,'startseite','__home__',1,'2022-09-28 12:57:03','2022-09-28 12:57:03','b9458bd3-0fa1-4050-bce0-78a903d391a1'),(17,17,1,'startseite','__home__',1,'2022-09-29 09:53:37','2022-09-29 09:53:37','7425028b-2d5d-4b55-b27a-80ff7fffa76e'),(18,18,1,'startseite','__home__',1,'2022-09-29 09:53:50','2022-09-29 09:53:50','037895cb-cb9c-49ed-8fd4-fe94fa1936b4'),(19,19,1,'startseite','__home__',1,'2022-09-29 09:54:19','2022-09-29 09:54:19','5ba564c7-869a-43b1-a0fe-4a55d1380f8a'),(20,20,1,'startseite','__home__',1,'2022-09-29 10:18:02','2022-09-29 10:18:02','5f04923f-7521-4a25-bef7-fd9242883fee'),(22,22,1,'startseite','__home__',1,'2022-09-29 10:18:16','2022-09-29 10:18:16','69858c9f-4ff0-48ec-aac8-a92ec525277c'),(23,23,1,'startseite','__home__',1,'2022-09-29 12:26:47','2022-09-29 12:26:47','11174c96-b1b9-4af4-b382-7a58b8197d29'),(24,24,1,'startseite','__home__',1,'2022-09-29 12:26:47','2022-09-29 12:26:47','350c73b3-0a67-46d3-b27c-e0c12ac1406b'),(25,25,1,'startseite','__home__',1,'2022-09-29 12:27:49','2022-09-29 12:27:49','c622c92c-6ef1-4d5e-b14d-f1e6bb81b24b'),(27,27,1,'startseite','__home__',1,'2022-09-29 12:30:31','2022-09-29 12:30:31','5a5983df-d33a-489f-9133-63a1d82c7f97'),(28,28,1,'startseite','__home__',1,'2022-09-29 12:30:55','2022-09-29 12:30:55','f805e54a-5fab-4a3f-9f13-28bdb0a93a41'),(30,30,1,'startseite','__home__',1,'2022-09-29 12:31:04','2022-09-29 12:31:04','7a92d30c-a904-4bc3-94b0-2f474d1bea34'),(31,31,1,'startseite','__home__',1,'2022-09-29 12:38:02','2022-09-29 12:38:02','9a5db8a2-5c93-456d-b2fb-5840d3c8ac5d'),(32,32,1,'startseite','__home__',1,'2022-09-29 12:38:02','2022-09-29 12:38:02','47b49878-c1ad-407e-943e-2efac9edb994'),(33,33,1,'startseite','__home__',1,'2022-10-03 14:52:57','2022-10-03 14:52:57','aa854d0c-ae53-46f4-a1dc-be87e8c83c26'),(34,34,1,NULL,NULL,1,'2022-10-03 14:53:29','2022-10-03 14:53:29','34cbce8f-4949-452a-a7e2-940f4446cb84'),(35,35,1,NULL,NULL,1,'2022-10-03 14:54:29','2022-10-03 14:54:29','f648b03f-0e5b-4ee9-934a-b241ff8f6f61'),(36,36,1,NULL,NULL,1,'2022-10-03 14:54:52','2022-10-03 14:54:52','9fdca72a-0ed1-42e9-937f-69dc7f2f77a2'),(37,37,1,NULL,NULL,1,'2022-10-03 14:56:06','2022-10-03 14:56:06','a194874f-104b-4c17-b9c7-000bfd512514'),(38,38,1,NULL,NULL,1,'2022-10-03 15:05:42','2022-10-03 15:05:42','8c307b98-3362-4911-b2ed-257411c663c4'),(39,39,1,NULL,NULL,1,'2022-10-03 15:14:37','2022-10-03 15:14:37','0f3ca417-ccee-46c3-8e05-38ba28062179'),(40,40,1,NULL,NULL,1,'2022-10-03 15:30:43','2022-10-03 15:30:43','9366a9cc-b055-4f95-bccb-4741575282af'),(41,41,1,'startseite','__home__',1,'2022-10-03 16:18:58','2022-10-03 16:18:58','15a405a1-2507-4ab3-a3d1-0b37e60c497a'),(42,42,1,'startseite','__home__',1,'2022-10-03 16:19:08','2022-10-03 16:19:08','a5dd67be-ed50-4e2b-8b85-eea17220d969'),(43,43,1,NULL,NULL,1,'2022-10-03 17:08:58','2022-10-03 17:08:58','b48d22f8-2d2d-4300-bc5b-c447a34f4e40'),(44,44,1,NULL,NULL,1,'2022-10-03 17:13:18','2022-10-03 17:13:18','51e64a4f-3656-4ca2-a43c-cfa2b73129bb'),(45,45,1,NULL,NULL,1,'2022-10-03 17:13:30','2022-10-03 17:13:30','981fc04c-bbca-41e9-a9bf-0af68f365d71'),(50,50,1,NULL,NULL,1,'2022-10-03 17:32:41','2022-10-03 17:32:41','b0d53038-467b-4d93-b1c8-8442b7de0b83'),(52,52,1,'startseite','__home__',1,'2022-10-03 21:37:42','2022-10-03 21:37:42','565272a1-f873-40b2-a4a8-62680ca17896'),(53,53,1,'startseite','__home__',1,'2022-10-04 09:51:59','2022-10-04 09:51:59','eaefe781-2875-4cff-9731-9cf0ea8d44c0'),(54,54,1,'startseite','__home__',1,'2022-10-04 09:55:54','2022-10-04 09:55:54','b8460001-28f1-49d0-b349-4a9355ffb80b'),(55,55,1,'startseite','__home__',1,'2022-10-04 15:30:56','2022-10-04 15:30:56','208638ee-d922-48e6-b8b4-d42563181dd3'),(57,57,1,'startseite','__home__',1,'2022-10-04 15:45:57','2022-10-04 15:45:57','79963ac0-443c-415a-9861-d7f149d7238e');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mwvizdvaplnjmxrqiuptufgflbpjwocdzrss` (`postDate`),
  KEY `idx_peitcyerfrvtlhdupvvcnwlgicxqaaftsisj` (`expiryDate`),
  KEY `idx_yeatvwltxtkzzvvpdrpazivgrbkkwfvksnfw` (`authorId`),
  KEY `idx_rcpodikdkpgynkszgfrjdovzhbghkwevzvza` (`sectionId`),
  KEY `idx_kbanlphaeouztchnslevmmyvhnwurwtsfumt` (`typeId`),
  KEY `fk_loemjlsvmbbuexjmatcjrxrcetvokouetlkw` (`parentId`),
  CONSTRAINT `fk_igesgyrjmrocgutezkgvryijhfkzpvxrhkwu` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kcgybmsoyahhblrzoshlmaldkfrcmbamdrvl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lgcgwwlwvlqqxhkwbyrzqegknqcahlqotvvx` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_loemjlsvmbbuexjmatcjrxrcetvokouetlkw` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vxznnjlykxfszteiabycdkfhmyofmiswwtke` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (2,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),(3,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),(4,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),(5,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),(7,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:24:56','2022-09-28 12:24:56'),(8,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:25:04','2022-09-28 12:25:04'),(9,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),(10,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),(11,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),(12,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),(14,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:56:27','2022-09-28 12:56:27'),(16,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-28 12:57:03','2022-09-28 12:57:03'),(17,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 09:53:37','2022-09-29 09:53:37'),(18,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 09:53:50','2022-09-29 09:53:50'),(19,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 09:54:19','2022-09-29 09:54:19'),(20,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 10:18:02','2022-09-29 10:18:02'),(22,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 10:18:16','2022-09-29 10:18:16'),(23,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:26:47','2022-09-29 12:26:47'),(24,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:26:47','2022-09-29 12:26:47'),(25,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:27:49','2022-09-29 12:27:49'),(27,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:30:31','2022-09-29 12:30:31'),(28,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:30:55','2022-09-29 12:30:55'),(30,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:31:04','2022-09-29 12:31:04'),(31,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:38:02','2022-09-29 12:38:02'),(32,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-09-29 12:38:02','2022-09-29 12:38:02'),(33,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-03 14:52:57','2022-10-03 14:52:57'),(41,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-03 16:18:58','2022-10-03 16:18:58'),(42,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-03 16:19:08','2022-10-03 16:19:08'),(52,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-03 21:37:42','2022-10-03 21:37:42'),(53,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-04 09:51:59','2022-10-04 09:51:59'),(54,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-04 09:55:54','2022-10-04 09:55:54'),(55,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-04 15:30:56','2022-10-04 15:30:56'),(57,1,NULL,1,NULL,'2022-09-28 12:24:00',NULL,NULL,'2022-10-04 15:45:57','2022-10-04 15:45:57');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xfbobybjaoiufvrgvldjhrnbapltfpzmhxbx` (`name`,`sectionId`),
  KEY `idx_uvkmzhjppdcbwuujvsvkvsjsegmdgqwdbvrw` (`handle`,`sectionId`),
  KEY `idx_nwvlqybdobxmggeqhirmbvrrojcmsoeezpsg` (`sectionId`),
  KEY `idx_bbjfbcelkueahisyjscvmpgplqpjknbwsoco` (`fieldLayoutId`),
  KEY `idx_oemaojqaauvkpsfrckxtnjlbjtyjkdlxlbiw` (`dateDeleted`),
  CONSTRAINT `fk_lqrdycgjrzqbvprfduevlrnssqmrolwicgrm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pzvqhapiyrmnddhuzrcijyezrovxhymyqjjj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES (1,1,1,'Startseite','startseite',1,'site',NULL,NULL,1,'2022-09-28 12:24:11','2022-09-28 12:24:30',NULL,'0e793c4c-3298-4c14-a50e-fe050eeaee18');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bjcyxcwtqgsbjtdgbqjygjbufqphpvorbvkr` (`name`),
  KEY `idx_upzlelcputbqawafqtrzxsecdokywvtzsvrj` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
INSERT INTO `fieldgroups` VALUES (1,'Common','2022-09-28 08:08:17','2022-09-28 08:08:17',NULL,'25d2e79d-a04c-4824-a49f-c3baa6642d8a'),(2,'Test','2022-09-28 12:23:42','2022-09-28 12:23:42',NULL,'d6ebc0e2-f57d-43d9-b5ad-e53f1b9394a5');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gzhfiujvgcrawwnrqgzrxbicqiisfzbhzuvd` (`layoutId`,`fieldId`),
  KEY `idx_pwjqlhutxzwxupvqvjygdaiuxswrgrejidaq` (`sortOrder`),
  KEY `idx_eqanujlhabiofpgdgqhhweayfqcdukefaeuv` (`tabId`),
  KEY `idx_ibppjbvyddodggcouzegstsjvhdayaeexvqb` (`fieldId`),
  CONSTRAINT `fk_gkrlyqkdpbgsghznlzenarbpwrpfymktcpir` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tgrixigwfilknfgcjksodeqqnaqvvblmicou` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_txmcgbpfytyqlspbdymtldhtdqcnijxkgahs` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
INSERT INTO `fieldlayoutfields` VALUES (51,1,20,3,0,1,'2022-10-03 16:19:08','2022-10-03 16:19:08','79067273-5eab-40aa-bc75-a94676edd60e'),(52,1,20,5,0,2,'2022-10-03 16:19:08','2022-10-03 16:19:08','5b303f53-1d0d-47b5-b669-0d850a695890'),(53,1,20,7,0,3,'2022-10-03 16:19:08','2022-10-03 16:19:08','401dc0bc-6c8f-489b-b6ae-33cb0fabc721'),(54,1,20,8,0,4,'2022-10-03 16:19:08','2022-10-03 16:19:08','6753a2e6-b8a5-4626-b4d3-d8974ab263ef'),(55,1,20,9,0,5,'2022-10-03 16:19:08','2022-10-03 16:19:08','75c5a94d-6858-4b95-87aa-e8db5776c6bd'),(56,1,20,10,0,6,'2022-10-03 16:19:08','2022-10-03 16:19:08','37c37cbe-10c2-40bf-851f-324fefd2baa3'),(57,3,22,11,1,1,'2022-10-04 09:51:41','2022-10-04 09:51:41','62f03091-5c46-414e-b1bb-7e96bda0120d');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mxviibmsollegbigmyggahsevjyvwezmknjh` (`dateDeleted`),
  KEY `idx_ptvqlhbjvxzrparbdvucycfzhwxeekciooca` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Entry','2022-09-28 12:24:11','2022-09-28 12:24:11',NULL,'8b195686-1317-4797-8d9f-8106393d5d59'),(2,'craft\\elements\\Asset','2022-10-03 14:52:04','2022-10-03 14:52:04','2022-10-03 17:07:18','e6565791-f8cf-4a18-85f0-1eb2df8e7e78'),(3,'craft\\elements\\Asset','2022-10-03 17:08:22','2022-10-03 17:08:22',NULL,'413aa4a6-e2a6-4c94-b2e0-08be3e37fc65');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iwqwjrvwnulhaqroeitdawivatnlzrtnqibo` (`sortOrder`),
  KEY `idx_rvcfqljdetlryrofhagcwxkplrmkgdlweysq` (`layoutId`),
  CONSTRAINT `fk_uthndfojogrdmkashpygylianhxlhwjqpwdf` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
INSERT INTO `fieldlayouttabs` VALUES (18,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"a2e13eb2-9932-4cdb-9d14-9b0f443b06f1\",\"userCondition\":null,\"elementCondition\":null}]',1,'2022-10-03 15:31:53','2022-10-03 15:31:53','15de266a-3730-4118-a31a-3dc0a28bf385'),(20,1,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"b0f3b706-9654-4e91-ad6c-c7a6fde59439\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"7c44bdd9-cfcb-4033-a105-598f7648e8e8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6b8cfffa-f693-418b-bedc-62d6d047943e\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"e01198ce-221f-4fa3-9256-543762ee2ef4\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"7689ffd6-2bc9-4ccb-9f0e-705955ea7777\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"ed9bbc29-08ed-4b45-a43a-a51095449276\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"82491024-fe0a-4331-a632-7b4e1a03d628\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8e610b7c-7931-4225-a570-5057ec906e28\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0a064e6b-5fcd-4a2b-acb7-b46630ad5244\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"aab27a7a-6385-497b-9c31-d79be08791f3\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"33e4e2e0-ac84-49fd-ad87-186f3ea0666b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"2fef81bc-44ba-4070-967c-51790791d3b6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"12994855-fd13-4d38-8ad9-156bb1960e74\"}]',1,'2022-10-03 16:19:08','2022-10-03 16:19:08','68594230-9efe-49da-80cf-dc0970f98312'),(22,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"2124b4b0-5b72-4089-a532-43c097daaf1d\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"e1f9bdf7-3e08-4419-8e6f-4bb6c8eebfdd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"396abe4e-d4af-4c68-a2fb-7a3bce13f340\"}]',1,'2022-10-04 09:51:41','2022-10-04 09:51:41','6b9c9049-f380-4f5d-8db8-2e6fa1a74f1c');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hqlkqtznjkmctpcmdfasqabrnoifpwdqtpqg` (`handle`,`context`),
  KEY `idx_hfgnjvnubgifxuduqtzhglgobbjmhqqjcerq` (`groupId`),
  KEY `idx_fpdazeqmbuzxtbvqurcuqqegkvlrpbmyunhn` (`context`),
  CONSTRAINT `fk_jitppgepvobogbtovuuwslsdfgeovlloqncd` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES (3,1,'Filipa 2','filipa2','global','eymkjnns',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-09-29 10:17:51','2022-09-29 10:17:51','6b8cfffa-f693-418b-bedc-62d6d047943e'),(5,1,'Felix','felix','global','toxwzikf',NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}','2022-09-29 12:26:47','2022-09-29 12:26:47','7689ffd6-2bc9-4ccb-9f0e-705955ea7777'),(7,1,'Konflikt ;)','konflikt','global','lftxpsoa',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-09-29 12:26:47','2022-09-29 12:26:47','82491024-fe0a-4331-a632-7b4e1a03d628'),(8,1,'Farbe','farbe','global','ctrdgacg',NULL,0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":null}','2022-09-29 12:30:44','2022-09-29 12:30:44','0a064e6b-5fcd-4a2b-acb7-b46630ad5244'),(9,1,'Konflikt 2','konflikt20MitBranch','global','munkpyzi',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-09-29 12:38:02','2022-09-29 12:38:02','33e4e2e0-ac84-49fd-ad87-186f3ea0666b'),(10,1,'Projektbilder','projektbilder','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-10-03 14:52:37','2022-10-03 17:08:49','12994855-fd13-4d38-8ad9-156bb1960e74'),(11,1,'Bildbeschreibung','bildbeschreibung','global','dukgymih',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-10-04 09:51:25','2022-10-04 09:51:25','396abe4e-d4af-4c68-a2fb-7a3bce13f340');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xvsfoatscxzwxwvwlqzgjonzzjwrcbprpzvv` (`name`),
  KEY `idx_zlmvoqdhgvrzznsifuxdzhlcskddapnasbet` (`handle`),
  KEY `idx_djhtyepjwxgcgporljynruposueqevhgequf` (`fieldLayoutId`),
  KEY `idx_npierlnqotijbwebxpxlxkfobcezcxjluimu` (`sortOrder`),
  CONSTRAINT `fk_gkzwgjitlylredjsrckhccgtxxhusanfglkr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xsudsscqsxqrkiooikhxyluazbpwxpnajwex` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tkeitzoafbfeumgrcwjzzafealewyknmvihb` (`accessToken`),
  UNIQUE KEY `idx_yrtsxvxxgkspawidjxgavbldzounnpihgmop` (`name`),
  KEY `fk_sformqzwliqveairitisokhmopntejhmhaos` (`schemaId`),
  CONSTRAINT `fk_sformqzwliqveairitisokhmopntejhmhaos` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dsjzmnttnpnadvrnkqnquziejgllppzqdyrc` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
INSERT INTO `imagetransformindex` VALUES (1,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_22x34_crop_center-center_none',1,0,0,'2022-10-03 17:32:42','2022-10-03 17:32:42','2022-10-03 17:32:46','b94cab6c-0e78-40bb-8009-417d24b38ff8'),(2,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_45x68_crop_center-center_none',1,0,0,'2022-10-03 17:32:42','2022-10-03 17:32:42','2022-10-03 17:32:42','50fe5348-6f6e-4680-bef9-8d0f8a776520'),(3,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_126x190_crop_center-center_none',1,0,0,'2022-10-03 17:32:46','2022-10-03 17:32:46','2022-10-03 17:32:46','c7c668cd-9274-44de-8acb-00fb3083c49a'),(4,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_252x380_crop_center-center_none',1,0,0,'2022-10-03 17:32:46','2022-10-03 17:32:46','2022-10-03 17:32:46','848cac6c-6d75-468e-a66e-9e101a13858f'),(5,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_100xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','bb55e715-52f7-46f8-802c-ae07698c3476'),(6,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','6de03cf6-1740-4d10-bda7-04cc2602c001'),(7,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','aefd5a22-a72c-418d-bbc8-6a8374c28358'),(8,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_600xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','d799a673-76bb-4a2a-8931-0a2775cee2ca'),(9,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_800xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','3abd5cfb-9577-4684-89a0-7433463418a7'),(10,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1000xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','08e12edf-cfe1-46a3-b13d-a6c26a539a6d'),(11,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','972eed3d-e42b-483c-90ca-c5db8d37b820'),(12,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','3e650413-08dc-4032-9ca7-0d69cd7eba8e'),(13,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1600xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','a88e58bd-2ce6-429e-9ad4-06a3da0af442'),(14,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1800xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:31','dd5b6dad-fa4f-46e5-86be-95d1459b2af5'),(15,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2000xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:31','3dbfc4d4-caad-47bb-9bc1-ea110fbc9fc7'),(16,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:32','0147a8ef-687c-4c0e-a481-b454545bca5e'),(17,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:33','1cedeb38-8344-49f1-9652-129dfe241429'),(18,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2600xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:34','d489b76b-69fc-4646-80fb-a240845c3bd7'),(19,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2800xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:35','5a3784c3-3891-498c-889e-fd4299ed7fbd'),(20,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3000xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:44','699eb55a-0f40-48ef-9a49-f5ea67d90a28'),(21,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:39:03','ac3acab0-b912-4765-910c-ce3d4f8ee1d6'),(22,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:39:24','59dd0b8d-4acf-49e3-b473-018852877457'),(23,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3600xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:41:53','b0aa233e-c549-49c2-a3ed-95cbb8005e51'),(24,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3800xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:41:55','e92cc470-7030-4a7a-85d7-af781048cdf9'),(25,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4000xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:42:17','82a39312-8199-4976-951b-f6512d969479'),(26,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4200xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:42:53','bc83e10c-9f2b-4ee5-8b2e-a8f28ef7947b'),(27,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4400xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 06:51:57','183c5402-3fd4-4a2a-b917-6993152b9391'),(28,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4600xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 06:52:19','17cef19f-269b-4138-a05f-4b5e0e5ba948'),(29,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4800xAUTO_crop_center-center_none',0,1,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 06:54:25','f08f43a8-aa4b-4729-a129-6f7452d7489d'),(30,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_5000xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 08:43:54','cba56d57-7723-4ce4-bd43-e72b15392435'),(31,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_300x300_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:41:49','5cf06df9-c1f8-4ba2-b0be-780e228832ba'),(32,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_666x1000_crop_center-center_none',1,0,0,'2022-10-04 15:15:09','2022-10-04 15:15:09','2022-10-04 15:15:09','1795a88d-e2cd-44f4-aaaf-4deaa8dc22f1'),(33,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_300xAUTO_crop_center-center_none',1,0,0,'2022-10-04 15:49:41','2022-10-04 15:49:41','2022-10-04 15:49:41','e5bc1e1d-09dc-4e1b-be58-8385286f0a26');
/*!40000 ALTER TABLE `imagetransformindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fbkmbkyxmmidgojxerqcwbactamxcsmkmick` (`name`),
  KEY `idx_cppuicjukenejfclizzrytmyubqbjtjphnrm` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'4.2.5.2','4.0.0.9',0,'qrmslsckxbet','3@navmzhycbg','2022-09-28 08:08:17','2022-10-04 15:16:52','7e6daab9-2991-4d5f-bb87-ffbee2fc0cc5');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_dvsoinrkciqefxvpmrwpxxrpbfzsboibnqnq` (`primaryOwnerId`),
  KEY `idx_kocuhbqyvbsxcztyhqrjccyghtqunphqsmxy` (`fieldId`),
  KEY `idx_zymhccrgeiwolwrchguaxvjaeifbneqxhosw` (`typeId`),
  CONSTRAINT `fk_betabldvaujziexcxxsefkryxtdcycuzkxmw` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fezdmbrcejztwgddkonxwccijfxfdcewilqd` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ryhwierapwufxjdqfugvoggmvpuzzuabriff` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_umysoetwkqdnrjblydjvsqedlfwioshodgkr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_alzdxzhrqtaglbnpfgvugjhgqhlxfyrrbrlr` (`ownerId`),
  CONSTRAINT `fk_alzdxzhrqtaglbnpfgvugjhgqhlxfyrrbrlr` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lexspjkeaahqjferokvldawsvnfycxpfduhz` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tizvlskrtrockokhdzobotogbcbyyndvkixz` (`name`,`fieldId`),
  KEY `idx_nowffjgcjctbqjwgwomuhbjjmkndyazpargs` (`handle`,`fieldId`),
  KEY `idx_zuugziwzsykpwldxyuspckgtetlrpbtzpkru` (`fieldId`),
  KEY `idx_ficdbtyrmxczbnnycgivyemugodwppcmcvqx` (`fieldLayoutId`),
  CONSTRAINT `fk_ijsmsjflwjfyukydzidvmsdvgfrocfypcjyj` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pphbutxlgmoowbzwskjocagnfhuxvliaokjt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uvdmqkcsluyfebluxvoxsgkdjswwdqoihest` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'craft','Install','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','9792b61d-9328-49c8-a678-fbffcd6911c6'),(2,'craft','m210121_145800_asset_indexing_changes','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','21de8979-0e64-483e-bf96-a547509c21b6'),(3,'craft','m210624_222934_drop_deprecated_tables','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','67e4515d-2565-4794-ae61-23eb29bc3a61'),(4,'craft','m210724_180756_rename_source_cols','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','58d47c6a-0e95-497a-acde-6994ee5899e7'),(5,'craft','m210809_124211_remove_superfluous_uids','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','0ccacfd8-e993-410b-9a9e-ededa499f081'),(6,'craft','m210817_014201_universal_users','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','5c5994da-ae0a-44ba-8656-0bf16eda89c0'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','3755c340-7ed3-44bc-b9f8-8c33ddc0af1f'),(8,'craft','m211115_135500_image_transformers','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','4807bd19-04e1-4818-af52-969d8bc3584a'),(9,'craft','m211201_131000_filesystems','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','2eff0f96-3cce-4e53-967f-475e875c3977'),(10,'craft','m220103_043103_tab_conditions','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','72246268-1283-4a0d-8ada-f06c2985824c'),(11,'craft','m220104_003433_asset_alt_text','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','01c568f4-2aa8-449e-a0ee-92675419aa02'),(12,'craft','m220123_213619_update_permissions','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','f153f3ea-f1b1-44ea-a41f-e3689cecec9a'),(13,'craft','m220126_003432_addresses','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','0d003718-331f-4228-b64f-b8073ea16f4c'),(14,'craft','m220209_095604_add_indexes','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','c502e590-9b00-4bca-b8dd-47792960b319'),(15,'craft','m220213_015220_matrixblocks_owners_table','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','d98a3e89-2636-43c7-8c18-69f711da5318'),(16,'craft','m220214_000000_truncate_sessions','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','7837c47d-0847-4544-af63-f949b30b6740'),(17,'craft','m220222_122159_full_names','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','d269692d-05a2-4f3f-808d-cb27a5a4b96f'),(18,'craft','m220223_180559_nullable_address_owner','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','be97ec85-0def-4233-9f64-a08c5563f001'),(19,'craft','m220225_165000_transform_filesystems','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','ff77cb02-e4f9-44aa-bc1f-b22b6b5716d3'),(20,'craft','m220309_152006_rename_field_layout_elements','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','8e126262-cace-4990-b182-b5336c1a8581'),(21,'craft','m220314_211928_field_layout_element_uids','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','bec59e15-3e47-426a-b0ac-4797ac64bf8e'),(22,'craft','m220316_123800_transform_fs_subpath','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','58ef54e9-9d8f-4074-a77c-e3d92601d6ed'),(23,'craft','m220317_174250_release_all_jobs','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','04773981-cd5d-43fc-8aeb-f83e1cbcca22'),(24,'craft','m220330_150000_add_site_gql_schema_components','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','dbef9aab-af8e-44b6-8fa0-7c2b3d25f9ab'),(25,'craft','m220413_024536_site_enabled_string','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','9a373fb9-a230-4aba-8378-69226b87cd07');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ddsqzsroivbxuxdmttstlobprwfbcdrgbzrg` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'password-policy','4.0.0','1.0.0','unknown',NULL,'2022-09-28 12:22:49','2022-09-28 12:22:49','2022-10-04 15:16:55','d3414302-d559-47bd-ac22-135357cb9204');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES ('dateModified','1664877101'),('email.fromEmail','\"dev@profitlich.ch\"'),('email.fromName','\"Profitlich DEV\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.autocapitalize','true'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.autocomplete','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.autocorrect','true'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.class','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.disabled','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.id','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.instructions','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.label','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.max','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.min','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.name','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.orientation','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.placeholder','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.readonly','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.requirable','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.size','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.step','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.tip','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.title','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.uid','\"b0f3b706-9654-4e91-ad6c-c7a6fde59439\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.warning','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.width','100'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.fieldUid','\"6b8cfffa-f693-418b-bedc-62d6d047943e\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.instructions','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.label','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.required','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.tip','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.uid','\"7c44bdd9-cfcb-4033-a105-598f7648e8e8\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.warning','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.width','100'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.fieldUid','\"7689ffd6-2bc9-4ccb-9f0e-705955ea7777\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.instructions','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.label','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.required','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.tip','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.uid','\"e01198ce-221f-4fa3-9256-543762ee2ef4\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.warning','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.width','100'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.fieldUid','\"82491024-fe0a-4331-a632-7b4e1a03d628\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.instructions','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.label','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.required','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.tip','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.uid','\"ed9bbc29-08ed-4b45-a43a-a51095449276\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.warning','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.width','100'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.fieldUid','\"0a064e6b-5fcd-4a2b-acb7-b46630ad5244\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.instructions','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.label','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.required','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.tip','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.uid','\"8e610b7c-7931-4225-a570-5057ec906e28\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.warning','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.4.width','100'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.fieldUid','\"33e4e2e0-ac84-49fd-ad87-186f3ea0666b\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.instructions','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.label','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.required','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.tip','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.uid','\"aab27a7a-6385-497b-9c31-d79be08791f3\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.warning','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.5.width','100'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.elementCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.fieldUid','\"12994855-fd13-4d38-8ad9-156bb1960e74\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.instructions','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.label','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.required','false'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.tip','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.uid','\"2fef81bc-44ba-4070-967c-51790791d3b6\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.warning','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.6.width','100'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.name','\"Inhalt\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.uid','\"68594230-9efe-49da-80cf-dc0970f98312\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.userCondition','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.handle','\"startseite\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.hasTitleField','true'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.name','\"Startseite\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.section','\"10120e23-43ba-494f-ba6c-7241058df713\"'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.sortOrder','1'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.titleFormat','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.titleTranslationKeyFormat','null'),('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.titleTranslationMethod','\"site\"'),('fieldGroups.25d2e79d-a04c-4824-a49f-c3baa6642d8a.name','\"Common\"'),('fieldGroups.d6ebc0e2-f57d-43d9-b5ad-e53f1b9394a5.name','\"Test\"'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.columnSuffix','\"ctrdgacg\"'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.contentColumnType','\"string(7)\"'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.fieldGroup','\"25d2e79d-a04c-4824-a49f-c3baa6642d8a\"'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.handle','\"farbe\"'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.instructions','null'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.name','\"Farbe\"'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.searchable','false'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.settings.defaultColor','null'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.translationKeyFormat','null'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.translationMethod','\"none\"'),('fields.0a064e6b-5fcd-4a2b-acb7-b46630ad5244.type','\"craft\\\\fields\\\\Color\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.columnSuffix','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.contentColumnType','\"string\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.fieldGroup','\"25d2e79d-a04c-4824-a49f-c3baa6642d8a\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.handle','\"projektbilder\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.instructions','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.name','\"Projektbilder\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.searchable','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowedKinds','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowSelfRelations','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowSubfolders','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowUploads','true'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.defaultUploadLocationSource','\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.defaultUploadLocationSubpath','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.localizeRelations','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.maxRelations','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.minRelations','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.previewMode','\"full\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictedDefaultUploadSubpath','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictedLocationSource','\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictedLocationSubpath','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictFiles','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictLocation','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionLabel','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.showSiteMenu','true'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.showUnpermittedFiles','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.showUnpermittedVolumes','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.source','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.sources','\"*\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.targetSiteId','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.validateRelatedElements','false'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.viewMode','\"list\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.translationKeyFormat','null'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.translationMethod','\"site\"'),('fields.12994855-fd13-4d38-8ad9-156bb1960e74.type','\"craft\\\\fields\\\\Assets\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.columnSuffix','\"munkpyzi\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.contentColumnType','\"text\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.fieldGroup','\"25d2e79d-a04c-4824-a49f-c3baa6642d8a\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.handle','\"konflikt20MitBranch\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.instructions','null'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.name','\"Konflikt 2\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.searchable','false'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.byteLimit','null'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.charLimit','null'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.code','false'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.columnType','null'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.initialRows','4'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.multiline','false'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.placeholder','null'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.settings.uiMode','\"normal\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.translationKeyFormat','null'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.translationMethod','\"none\"'),('fields.33e4e2e0-ac84-49fd-ad87-186f3ea0666b.type','\"craft\\\\fields\\\\PlainText\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.columnSuffix','\"dukgymih\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.contentColumnType','\"text\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.fieldGroup','\"25d2e79d-a04c-4824-a49f-c3baa6642d8a\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.handle','\"bildbeschreibung\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.instructions','null'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.name','\"Bildbeschreibung\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.searchable','false'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.byteLimit','null'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.charLimit','null'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.code','false'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.columnType','null'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.initialRows','4'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.multiline','false'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.placeholder','null'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.uiMode','\"normal\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.translationKeyFormat','null'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.translationMethod','\"none\"'),('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.type','\"craft\\\\fields\\\\PlainText\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.columnSuffix','\"eymkjnns\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.contentColumnType','\"text\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.fieldGroup','\"25d2e79d-a04c-4824-a49f-c3baa6642d8a\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.handle','\"filipa2\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.instructions','null'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.name','\"Filipa 2\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.searchable','false'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.byteLimit','null'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.charLimit','null'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.code','false'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.columnType','null'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.initialRows','4'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.multiline','false'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.placeholder','null'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.settings.uiMode','\"normal\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.translationKeyFormat','null'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.translationMethod','\"none\"'),('fields.6b8cfffa-f693-418b-bedc-62d6d047943e.type','\"craft\\\\fields\\\\PlainText\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.columnSuffix','\"toxwzikf\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.contentColumnType','\"integer(10)\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.fieldGroup','\"25d2e79d-a04c-4824-a49f-c3baa6642d8a\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.handle','\"felix\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.instructions','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.name','\"Felix\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.searchable','false'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.decimals','0'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.defaultValue','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.max','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.min','0'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.prefix','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.previewCurrency','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.previewFormat','\"decimal\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.size','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.settings.suffix','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.translationKeyFormat','null'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.translationMethod','\"none\"'),('fields.7689ffd6-2bc9-4ccb-9f0e-705955ea7777.type','\"craft\\\\fields\\\\Number\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.columnSuffix','\"lftxpsoa\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.contentColumnType','\"text\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.fieldGroup','\"25d2e79d-a04c-4824-a49f-c3baa6642d8a\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.handle','\"konflikt\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.instructions','null'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.name','\"Konflikt ;)\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.searchable','false'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.byteLimit','null'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.charLimit','null'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.code','false'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.columnType','null'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.initialRows','4'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.multiline','false'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.placeholder','null'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.settings.uiMode','\"normal\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.translationKeyFormat','null'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.translationMethod','\"none\"'),('fields.82491024-fe0a-4331-a632-7b4e1a03d628.type','\"craft\\\\fields\\\\PlainText\"'),('fs.lokal.hasUrls','true'),('fs.lokal.name','\"Lokal\"'),('fs.lokal.settings.path','\"@assetBasePath\"'),('fs.lokal.type','\"craft\\\\fs\\\\Local\"'),('fs.lokal.url','\"@assetBaseUrl\"'),('meta.__names__.0a064e6b-5fcd-4a2b-acb7-b46630ad5244','\"Farbe\"'),('meta.__names__.0e793c4c-3298-4c14-a50e-fe050eeaee18','\"Startseite\"'),('meta.__names__.10120e23-43ba-494f-ba6c-7241058df713','\"Startseite\"'),('meta.__names__.12994855-fd13-4d38-8ad9-156bb1960e74','\"Projektbilder\"'),('meta.__names__.25d2e79d-a04c-4824-a49f-c3baa6642d8a','\"Common\"'),('meta.__names__.33e4e2e0-ac84-49fd-ad87-186f3ea0666b','\"Konflikt 2\"'),('meta.__names__.396abe4e-d4af-4c68-a2fb-7a3bce13f340','\"Bildbeschreibung\"'),('meta.__names__.44fec1ae-cc09-42b5-b6a8-1c301d066c04','\"Projektbilder\"'),('meta.__names__.6b8cfffa-f693-418b-bedc-62d6d047943e','\"Filipa 2\"'),('meta.__names__.7689ffd6-2bc9-4ccb-9f0e-705955ea7777','\"Felix\"'),('meta.__names__.82491024-fe0a-4331-a632-7b4e1a03d628','\"Konflikt ;)\"'),('meta.__names__.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8','\"Profitlich DEV\"'),('meta.__names__.d6ebc0e2-f57d-43d9-b5ad-e53f1b9394a5','\"Test\"'),('meta.__names__.e814380a-f915-44b8-92b3-a767fa94f64a','\"Profitlich DEV\"'),('plugins.password-policy.edition','\"standard\"'),('plugins.password-policy.enabled','true'),('plugins.password-policy.schemaVersion','\"1.0.0\"'),('plugins.password-policy.settings.cases','true'),('plugins.password-policy.settings.maxLength','160'),('plugins.password-policy.settings.minLength','20'),('plugins.password-policy.settings.numbers','true'),('plugins.password-policy.settings.showStrengthIndicator','true'),('plugins.password-policy.settings.symbols','true'),('sections.10120e23-43ba-494f-ba6c-7241058df713.defaultPlacement','\"end\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.enableVersioning','true'),('sections.10120e23-43ba-494f-ba6c-7241058df713.handle','\"startseite\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.name','\"Startseite\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.0.1','\"Primäre eintrag Seite\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.propagationMethod','\"all\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.enabledByDefault','true'),('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.hasUrls','true'),('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.template','\"startseite/_entry\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.uriFormat','\"__home__\"'),('sections.10120e23-43ba-494f-ba6c-7241058df713.type','\"single\"'),('siteGroups.e814380a-f915-44b8-92b3-a767fa94f64a.name','\"Profitlich DEV\"'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.handle','\"default\"'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.hasUrls','true'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.language','\"de-CH\"'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.name','\"Profitlich DEV\"'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.primary','true'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.siteGroup','\"e814380a-f915-44b8-92b3-a767fa94f64a\"'),('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.sortOrder','1'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"Profitlich DEV\"'),('system.schemaVersion','\"4.0.0.9\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elementCondition','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.autocapitalize','true'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.autocomplete','false'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.autocorrect','true'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.class','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.disabled','false'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.elementCondition','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.id','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.instructions','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.label','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.max','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.min','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.name','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.orientation','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.placeholder','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.readonly','false'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.requirable','false'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.size','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.step','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.tip','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.title','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.uid','\"2124b4b0-5b72-4089-a532-43c097daaf1d\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.userCondition','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.warning','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.width','100'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.elementCondition','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.fieldUid','\"396abe4e-d4af-4c68-a2fb-7a3bce13f340\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.instructions','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.label','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.required','true'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.tip','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.uid','\"e1f9bdf7-3e08-4419-8e6f-4bb6c8eebfdd\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.userCondition','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.warning','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.width','100'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.name','\"Content\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.uid','\"6b9c9049-f380-4f5d-8db8-2e6fa1a74f1c\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.userCondition','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fs','\"lokal\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.handle','\"projektbilder\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.name','\"Projektbilder\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.sortOrder','2'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.titleTranslationKeyFormat','null'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.titleTranslationMethod','\"site\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.transformFs','\"\"'),('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.transformSubpath','\"\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sziryarwktdtumewknzytfdmynnofogwczsp` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_adrmfafzrwbdpodfkvzdiwxjkqdwqersigyh` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_algrdaeoqfnsxrqswfqyethpiazxgkrncvnf` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_vsyaqefrszzqtqzlxnffxjdphyhvmikdjvsr` (`sourceId`),
  KEY `idx_cuhurgthrfbgbalzqihrasgxbdmrwheexeqz` (`targetId`),
  KEY `idx_icknxreniiwfipxviiquclwuoftmavpmwtrb` (`sourceSiteId`),
  CONSTRAINT `fk_airkuqthylrqsyecxtbhwoohrvsqbwdkjsdh` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nsnondvsjuexfbyseuqrvrshjdcsbqosahsy` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ooozrrkijtywulgupnawhgmcvjebfblhhtex` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pbeizbkjushnhdfswbumvghrnmqjaabjvetp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (2,10,2,NULL,50,1,'2022-10-03 21:37:42','2022-10-03 21:37:42','56559761-0e18-46a1-bafd-65a3a132b883'),(3,10,52,NULL,50,1,'2022-10-03 21:37:42','2022-10-03 21:37:42','b23fd353-b7c6-4ff0-a39f-1d3b3345cb45'),(4,10,53,NULL,50,1,'2022-10-04 09:51:59','2022-10-04 09:51:59','ba459030-af81-45e7-bdc0-bfd0214166a6'),(5,10,54,NULL,50,1,'2022-10-04 09:55:54','2022-10-04 09:55:54','c60937ab-a1d2-43fa-a1ac-bb5f6c163edb'),(6,10,55,NULL,50,1,'2022-10-04 15:30:56','2022-10-04 15:30:56','442f4e1a-e473-419c-a102-b8c907562965'),(9,10,57,NULL,50,1,'2022-10-04 15:45:57','2022-10-04 15:45:57','ad549fdf-e160-4062-99e6-57c223806cfc');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES ('12111b52','@craft/web/assets/datepickeri18n/dist'),('1687fc70','@craft/web/assets/edittransform/dist'),('16881fcb','@craft/web/assets/feed/dist'),('198d9022','@craft/web/assets/velocity/dist'),('1c1a9295','@craft/web/assets/jquerypayment/dist'),('1c494df7','@craft/web/assets/jquerytouchevents/dist'),('1e727351','@craft/web/assets/fileupload/dist'),('2041484b','@craft/web/assets/picturefill/dist'),('223df65c','@craft/web/assets/fileupload/dist'),('299d228f','@craft/web/assets/craftsupport/dist'),('2a0fefea','@craft/web/assets/updates/dist'),('2bf9f54b','@craft/web/assets/xregexp/dist'),('2f9135b1','@craft/web/assets/dashboard/dist'),('3341af09','@craft/web/assets/elementresizedetector/dist'),('36a1b0e1','@bower/jquery/dist'),('3c4620f7','@craft/web/assets/jqueryui/dist'),('4053a94b','@craft/web/assets/jqueryui/dist'),('4ab4395d','@bower/jquery/dist'),('4df744c8','@craft/web/assets/vue/dist'),('4f5426b5','@craft/web/assets/elementresizedetector/dist'),('524b17e3','@craft/web/assets/datepickeri18n/dist'),('561a6656','@craft/web/assets/updates/dist'),('56d2137a','@craft/web/assets/feed/dist'),('57ec7cf7','@craft/web/assets/xregexp/dist'),('59d79c93','@craft/web/assets/velocity/dist'),('5c134146','@craft/web/assets/jquerytouchevents/dist'),('5c409e24','@craft/web/assets/jquerypayment/dist'),('5c54c1f7','@craft/web/assets/picturefill/dist'),('5e287fe0','@craft/web/assets/fileupload/dist'),('600f1b29','@craft/web/assets/jquerypayment/dist'),('601b44fa','@craft/web/assets/picturefill/dist'),('605cc44b','@craft/web/assets/jquerytouchevents/dist'),('6598199e','@craft/web/assets/velocity/dist'),('69c72e3e','@craft/web/assets/craftsupport/dist'),('6ba3f9fa','@craft/web/assets/xregexp/dist'),('6e0492ee','@craft/web/assets/datepickeri18n/dist'),('6fcb3900','@craft/web/assets/dashboard/dist'),('74cc3a73','@craft/web/assets/edituser/dist'),('7b1dbb8f','@craft/web/assets/htmx/dist'),('8372f7df','@craft/web/assets/fieldsettings/dist'),('851b22e9','@craft/web/assets/iframeresizer/dist'),('8a301d48','@craft/web/assets/garnish/dist'),('8e31d486','@craft/web/assets/updateswidget/dist'),('8e7a2b5e','@craft/web/assets/d3/dist'),('8ee7396c','@craft/web/assets/utilities/dist'),('903fab4f','@craft/web/assets/sites/dist'),('944f0d17','@craft/web/assets/cp/dist'),('96b4be8c','@craft/web/assets/focusvisible/dist'),('9807af5f','@craft/web/assets/selectize/dist'),('9a5fa','@craft/web/assets/jqueryui/dist'),('9d343d6a','@craft/web/assets/pluginstore/dist'),('9ecdaf52','@craft/web/assets/fabric/dist'),('9f12157d','@craft/web/assets/tailwindreset/dist'),('a2822a5f','@craft/web/assets/fabric/dist'),('a87e03b1','@craft/web/assets/axios/dist'),('aee35ec','@bower/jquery/dist'),('b08b96e8','@craft/web/assets/recententries/dist'),('b2a8bc61','@craft/web/assets/utilities/dist'),('b30cfebc','@craft/web/assets/conditionbuilder/dist'),('b67f9845','@craft/web/assets/garnish/dist'),('b948d0b7','@craft/web/assets/updater/dist'),('c40ecd47','@percipiolondon/passwordpolicy/assetbundles/PasswordPolicy/dist'),('c5412e58','@craft/web/assets/iframeresizer/dist'),('c7448c6c','@craft/web/assets/generalsettings/dist'),('ce2027ef','@craft/web/assets/d3/dist'),('ce6bd837','@craft/web/assets/updateswidget/dist'),('cebd35dd','@craft/web/assets/utilities/dist'),('d065a7fe','@craft/web/assets/sites/dist'),('d41501a6','@craft/web/assets/cp/dist'),('d46b8a0d','@craft/web/assets/axios/dist'),('d6eeb23d','@craft/web/assets/focusvisible/dist'),('d85da3ee','@craft/web/assets/selectize/dist'),('dad4879','@craft/web/assets/vue/dist'),('dd6e31db','@craft/web/assets/pluginstore/dist'),('de97a3e3','@craft/web/assets/fabric/dist'),('df4819cc','@craft/web/assets/tailwindreset/dist'),('df5b826','@craft/web/assets/editsection/dist'),('e212a94f','@craft/web/assets/focalpoint/dist'),('e3079cc1','@craft/web/assets/tailwindreset/dist'),('e41226e3','@craft/web/assets/selectize/dist'),('e8240f00','@craft/web/assets/axios/dist'),('e85a84ab','@craft/web/assets/cp/dist'),('eaa13730','@craft/web/assets/focusvisible/dist'),('f0d19a59','@craft/web/assets/recententries/dist'),('f0e2a04','@craft/web/assets/elementresizedetector/dist'),('f26fa2e2','@craft/web/assets/d3/dist'),('f62594f4','@craft/web/assets/garnish/dist'),('f90eab55','@craft/web/assets/iframeresizer/dist'),('f912dc06','@craft/web/assets/updater/dist');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fwqxmuauqrqzfkyxvajoammiyqvbgemickwv` (`canonicalId`,`num`),
  KEY `fk_nhbxfjmmaexxkfbgzsdhhlrbpufntlwcieae` (`creatorId`),
  CONSTRAINT `fk_mzemovtlyzobnokbyngtuxhamicuzbxeygsm` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nhbxfjmmaexxkfbgzsdhhlrbpufntlwcieae` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES (1,2,1,1,NULL),(2,2,1,2,NULL),(3,2,1,3,NULL),(4,2,1,4,NULL),(5,2,1,5,'Verwende «Entwurf 1»'),(6,2,1,6,NULL),(7,2,1,7,NULL),(8,2,1,8,NULL),(9,2,1,9,NULL),(10,2,1,10,'Verwende «Entwurf 1»'),(11,2,1,11,'Wiederhergestellter Inhalt aus Revision 9.'),(12,2,1,12,NULL),(13,2,1,13,'Verwende «Entwurf 1»'),(14,2,1,14,''),(15,2,1,15,NULL),(16,2,1,16,'Verwende «Entwurf 1»'),(17,2,NULL,17,NULL),(18,2,NULL,18,NULL),(19,2,1,19,NULL),(20,2,1,20,'Verwende «Entwurf 1»'),(21,2,1,21,NULL),(22,2,1,22,''),(23,2,NULL,23,NULL),(24,2,NULL,24,NULL),(25,2,1,25,NULL),(26,2,1,26,NULL),(27,2,1,27,NULL),(28,2,1,28,'Applied “Draft 1”'),(29,2,1,29,''),(30,2,1,30,''),(31,2,1,31,''),(32,2,1,32,'Applied “Draft 1”');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_wdkafveqkdifyboyrfzhowwqqwwbfdvartyv` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' dev profitlich ch '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' pro dev admin '),(2,'slug',0,1,' startseite '),(2,'title',0,1,' reiner zufall '),(34,'extension',0,1,' jpg '),(34,'filename',0,1,' asset633af76982e267 12846520 jpg '),(34,'kind',0,1,' image '),(34,'slug',0,1,''),(34,'title',0,1,' asset633af76982e267 12846520 '),(35,'extension',0,1,' jpg '),(35,'filename',0,1,' asset633af7a5885197 88769114 jpg '),(35,'kind',0,1,' image '),(35,'slug',0,1,''),(35,'title',0,1,' asset633af7a5885197 88769114 '),(36,'extension',0,1,' jpg '),(36,'filename',0,1,' asset633af7bce79232 95857633 jpg '),(36,'kind',0,1,' image '),(36,'slug',0,1,''),(36,'title',0,1,' asset633af7bce79232 95857633 '),(37,'extension',0,1,' jpg '),(37,'filename',0,1,' asset633af806260545 50558061 jpg '),(37,'kind',0,1,' image '),(37,'slug',0,1,''),(37,'title',0,1,' asset633af806260545 50558061 '),(38,'extension',0,1,' jpg '),(38,'filename',0,1,' asset633afa46ce7523 62900012 jpg '),(38,'kind',0,1,' image '),(38,'slug',0,1,''),(38,'title',0,1,' asset633afa46ce7523 62900012 '),(39,'extension',0,1,' jpg '),(39,'filename',0,1,' asset633afc5d72c2f9 98811315 jpg '),(39,'kind',0,1,' image '),(39,'slug',0,1,''),(39,'title',0,1,' asset633afc5d72c2f9 98811315 '),(40,'extension',0,1,' jpg '),(40,'filename',0,1,' asset633b00237c7d68 06510024 jpg '),(40,'kind',0,1,' image '),(40,'slug',0,1,''),(40,'title',0,1,' asset633b00237c7d68 06510024 '),(43,'extension',0,1,' jpg '),(43,'filename',0,1,' asset633b172abcc216 55844537 jpg '),(43,'kind',0,1,' image '),(43,'slug',0,1,''),(43,'title',0,1,' asset633b172abcc216 55844537 '),(44,'extension',0,1,' jpg '),(44,'filename',0,1,' asset633b182e4157c9 63276740 jpg '),(44,'kind',0,1,' image '),(44,'slug',0,1,''),(44,'title',0,1,' asset633b182e4157c9 63276740 '),(45,'extension',0,1,' jpg '),(45,'filename',0,1,' asset633b183a643535 13439729 jpg '),(45,'kind',0,1,' image '),(45,'slug',0,1,''),(45,'title',0,1,' asset633b183a643535 13439729 '),(50,'extension',0,1,' jpg '),(50,'filename',0,1,' ts paralax 191 ts a jpg '),(50,'kind',0,1,' image '),(50,'slug',0,1,''),(50,'title',0,1,' ts paralax 191 ts a ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fooatfohdocwasohwrwqwjgnnlfrfyoayrtq` (`handle`),
  KEY `idx_iljcefemiyqnxilzqswgruzbaomwidpicrvs` (`name`),
  KEY `idx_sawlklneyutuosmvzcefuophawclsncwxnin` (`structureId`),
  KEY `idx_uefexhuelblytghauvimyfhbgbxyqfiytkau` (`dateDeleted`),
  CONSTRAINT `fk_amqvrmxjjfjuzboxfdxmcgbjysszqhdjimtn` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'Startseite','startseite','single',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-09-28 12:24:11','2022-09-28 12:24:30',NULL,'10120e23-43ba-494f-ba6c-7241058df713');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ctmgchiozqetpldqhtpshcujpmedfevpqehy` (`sectionId`,`siteId`),
  KEY `idx_thtzpgjhdfhilslrrzbygtdacdakjafjpzxc` (`siteId`),
  CONSTRAINT `fk_renlsoycvfnjrkrhmbopryaabkmpocufsxeb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdgeaphvzzvvepfxcitatncacqtzlfpmavvz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','startseite/_entry',1,'2022-09-28 12:24:11','2022-09-28 12:24:30','e66ee714-d528-4c82-a060-4de0376029ac');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dwecqdcwpeqwxvzidskbpfkxlqsntxyedwvm` (`uid`),
  KEY `idx_jdkekxzmvgizwlmdqyzsoyltbjlatlfljsmb` (`token`),
  KEY `idx_cslgbqqcglkcjkvoqwyagkwzmuyibtyozqsu` (`dateUpdated`),
  KEY `idx_elfaknonyntxharvevkxelqijvgawxsfbezy` (`userId`),
  CONSTRAINT `fk_oevoxpcummfcdwyqehbkqpmiynnxmilnpcjt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,'NSf1Pro1GkxshNDC_BuVT4gmAx6UTGEvSfW3_5vBNaDe0oDESUMmcvkIvMMw4szKPkWU5tZ-3xEI2EPU0mgzGHXBRbMkpXBcsl8N','2022-09-28 12:12:59','2022-09-28 12:27:25','926eac7c-fc35-4f0e-bf14-e25348be794b'),(2,1,'19MBL7O79-1xspw7XqnXAjTVYHNwMnSaitOC1IuPBKT6V2s4wuKd5tLQuINi8z2PGrOvr3Em8HV9anfkwXt3waeDLe9rglkWLy9o','2022-09-28 12:56:15','2022-09-28 13:34:04','ae1b911f-78bc-42fd-9208-207797f05743'),(3,1,'Y9OFts-mfN1BArreeSMNARZS8OxQIQKhpv7YQ1FQy0MchK54RRhjUguy6j2CVRNSK9gJH677oBG2xgQihLjjcRqtQKb7Vce7lDny','2022-09-29 09:53:10','2022-09-29 10:31:06','60048f38-2e74-4359-9b98-96332fa7eacf');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_amnlwswcuadenqiavuvlbwcmdwvtljlsvocg` (`userId`,`message`),
  CONSTRAINT `fk_gtlivxrneammzelokosnnlloktpaiffzoawh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lpzmgvnebryruojezazwbscbbygasrcjwlqn` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES (1,'Profitlich DEV','2022-09-28 08:08:17','2022-09-28 08:08:17',NULL,'e814380a-f915-44b8-92b3-a767fa94f64a');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cihmvnsiqlvlhetrctqkeblknyfgxgllwgby` (`dateDeleted`),
  KEY `idx_rmcmmjxoodmhbdxqzwcaadfquvyoiytyyzsm` (`handle`),
  KEY `idx_unifiuypznisggzmymjjpzfbkkvpquwocaxt` (`sortOrder`),
  KEY `fk_bbcddolqfguzaaibmavckxetqsmloksmprxr` (`groupId`),
  CONSTRAINT `fk_bbcddolqfguzaaibmavckxetqsmloksmprxr` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (1,1,1,'true','Profitlich DEV','default','de-CH',1,'$PRIMARY_SITE_URL',1,'2022-09-28 08:08:17','2022-09-28 08:08:17',NULL,'c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hjphnmaipkziwwmxnbodmqecfjjytnzutghu` (`structureId`,`elementId`),
  KEY `idx_rvliksukixrjqqvferjflsliqivmsefwpjhb` (`root`),
  KEY `idx_ebwxglpidszqqmpghinczvwkuarefkmrktpf` (`lft`),
  KEY `idx_gyxmalsryxpjziofejjfgwcllwitpzuejglb` (`rgt`),
  KEY `idx_gfcmmejisiqmywmlrsjgeleygncjtzikoorf` (`level`),
  KEY `idx_qqgappepxbevivpxwwmgflwfreglukhjfljo` (`elementId`),
  CONSTRAINT `fk_kvaydgmhtfmjgefhjsldfrtmrpxpiupjolba` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tvvgrfsvfpxboulpunjuraaprvpvrzthyauo` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jsrdjlgrlxohlwotdxyhjirfgsisapzsyjre` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_upcribbczxasfybctejwakkridajwuvvjqhc` (`key`,`language`),
  KEY `idx_sbhysqapzderpkpzuqgyfvgmvdajkjengqgp` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_pgogijkkiixwipoodoxqzvbalkkqppvkdlgc` (`name`),
  KEY `idx_dhvtipsmyakgbmcgssopjaulqxonjqigxcmx` (`handle`),
  KEY `idx_ltiooomccwgbiyupuunqyeerwsanjnwjvqte` (`dateDeleted`),
  KEY `fk_nmvbivtyjpyjmlsgcgvnkrpnxqeeifpaxcgt` (`fieldLayoutId`),
  CONSTRAINT `fk_nmvbivtyjpyjmlsgcgvnkrpnxqeeifpaxcgt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_klanruxalasftwntgieucrzhmtypgeljilye` (`groupId`),
  CONSTRAINT `fk_iglimxcyimelafygsiahvzshzoazlqztbavc` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jvkvvjenvyfhvwwgkixwbjkqjuypggokseah` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jbefzhzrdzpkmlllteuaajcrsijsahudqtna` (`token`),
  KEY `idx_suwoftdaojqkclpekkcwckinfjfarlwkyyfr` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_butayiviikqihbtjhjjvkcmqskoufsmqrdup` (`handle`),
  KEY `idx_gwwjcojypssboxngfmkmakylvdofwhaeofmc` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wsviryhajfcqwjmrmgmdjvwpkakeylhzmlmq` (`groupId`,`userId`),
  KEY `idx_kjoxokadqhqyemthcqajsubbbgcggbkberjm` (`userId`),
  CONSTRAINT `fk_borrzvooknohxfwwwudsonerbjrkbsosotja` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_scqbqxhlalfzlajxkmferfnoqdqntfaiwdpv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yszcvijekhkwuyjgatmcktcmhxktihrgzeor` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sbdwodagtlovqujeqibmcxjhkdqcjuzhcnxe` (`permissionId`,`groupId`),
  KEY `idx_jsnfxcoeywaltekqbqotbbaxhtgxcotwouwa` (`groupId`),
  CONSTRAINT `fk_nahjqbvhxkpotvecybpotagnrkdtgijeblss` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zegwmrikoqwbcsriikujxijsvemokgtkjmhd` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kemzjziktohzxisdyucyoevwwblgfegkdirv` (`permissionId`,`userId`),
  KEY `idx_mrsffxvnncfsflfybnxmaumxosbkftknugro` (`userId`),
  CONSTRAINT `fk_sddsputuxjtqueejnlokztbrfhoijolkyqzk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzpghwnrltzobfyfyndederviepqftesgkmf` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_mblksozgcoouhibqtuzzggzmguqmdpsxwxjb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-GB\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_sdcjeohcwepxmpqvctqoyponyuzkgpuaamec` (`active`),
  KEY `idx_rfrkiznzhmjzpgtbczxemzqovcyiteliditf` (`locked`),
  KEY `idx_vfkcjnkhpzlkdntrqqnyuzzxpqqpvyylljtq` (`pending`),
  KEY `idx_nsgelsettukdspuzhazuiilktrqqwgxbkkke` (`suspended`),
  KEY `idx_prtdfitsystdxhisveugctnmlvjacbofufag` (`verificationCode`),
  KEY `idx_phqmhcxycaneheqfhwtibvivtebsraklhzgc` (`email`),
  KEY `idx_ujypcurnvjujjkviwcdvvtirbxruevnobpqa` (`username`),
  KEY `fk_lwvifrrtpczqftvywgfnocbgyvpambvkjwvw` (`photoId`),
  CONSTRAINT `fk_lwvifrrtpczqftvywgfnocbgyvpambvkjwvw` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uivnxbgvxwmsjbkvfzifdzgpkbyohlkgzgwu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,1,0,0,0,1,'pro-dev-admin','',NULL,NULL,'dev@profitlich.ch','$2y$13$oBBJ1H9/Py3nN6/0EVDZd.FEgoTk4mQLApI5iqR2ISdlY1Af5j7f2','2022-10-04 15:14:57',NULL,NULL,NULL,'2022-09-28 12:08:05',NULL,1,NULL,NULL,NULL,0,'2022-09-28 08:08:18','2022-09-28 08:08:18','2022-10-04 15:14:57');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_eohuhcjcfrbafcntyozzhyjlppxpxdyllxrw` (`name`,`parentId`,`volumeId`),
  KEY `idx_zcpbkqiagtaalvxyerazgsczrshdqbzcsinz` (`parentId`),
  KEY `idx_oggweewjdiqazrjdnuvhzeoqdwbfkxwtzjhx` (`volumeId`),
  CONSTRAINT `fk_djyspedoarrqmliyezknohmvutamuvgqablt` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qzafdtprvnxslqoeiajgrxtitvwcgywwzsui` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Projektbilder',NULL,'2022-10-03 14:52:04','2022-10-03 15:31:53','d296efc7-b86d-4838-9374-f8df61df5ccc'),(2,NULL,NULL,'Temporary filesystem',NULL,'2022-10-03 14:53:18','2022-10-03 14:53:18','e7c80088-a678-4d68-9482-a8c6a556abc6'),(3,2,NULL,'user_1','user_1/','2022-10-03 14:53:18','2022-10-03 14:53:18','b5187b32-31e3-4de3-a58d-482ab25fcc4c'),(4,NULL,2,'Projektbilder',NULL,'2022-10-03 17:08:22','2022-10-04 09:51:41','47944018-7869-4780-98f6-100cf3866975');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_obajibnhwljxmfntxmjjtgwemimhyqlujpsd` (`name`),
  KEY `idx_rgfhesbvajfcampqfohezgjruvvgbcrhfvbw` (`handle`),
  KEY `idx_oeghhbpawoaicraarrqdwblhxhoftpdvaeei` (`fieldLayoutId`),
  KEY `idx_kgjwhvsgaovuvcngkhljbfgcwgqmcgbhowxz` (`dateDeleted`),
  CONSTRAINT `fk_mtqdferqqgqxkwwyofyapdwwamjvvtsemtib` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES (1,2,'Projektbilder','projektbilder','','','','site',NULL,1,'2022-10-03 14:52:04','2022-10-03 15:31:53','2022-10-03 17:07:18','f6e40493-74a7-4e2e-ac86-65f353155213'),(2,3,'Projektbilder','projektbilder','lokal','','','site',NULL,2,'2022-10-03 17:08:22','2022-10-03 17:08:22',NULL,'44fec1ae-cc09-42b5-b6a8-1c301d066c04');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nkythpigpwrjpspvhffrktyturwtfmikwhim` (`userId`),
  CONSTRAINT `fk_gzgaoogznweipcvlskditwidqxfjgwulkrne` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','def7b0c4-c650-4d58-8c04-403e54ec55c2'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','66eea0d8-0993-4622-86f7-ca4b2f792a42'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','c6f0d03c-0537-48bf-a29d-efcf0301288f'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','62381c44-6e0d-4a2d-8b1c-16cc2cec4163');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06  7:58:45
