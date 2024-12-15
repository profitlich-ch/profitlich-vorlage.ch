/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.10-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.34-MariaDB-1:10.4.34+maria~ubu2004-log

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
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `addressLine3` varchar(255) DEFAULT NULL,
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
  KEY `fk_ozgdxxjzkkokfsoitiyjgvapyzybxoegsrnp` (`primaryOwnerId`),
  CONSTRAINT `fk_ozgdxxjzkkokfsoitiyjgvapyzybxoegsrnp` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_unvwbajetalcgkgvdlxjemuixdmwlelljhzf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES
(34,NULL,3,1,'asset633af76982e267.12846520.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:53:29','2022-10-03 14:53:29','2022-10-03 14:53:29'),
(35,NULL,3,1,'asset633af7a5885197.88769114.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:54:29','2022-10-03 14:54:29','2022-10-03 14:54:29'),
(36,NULL,3,1,'asset633af7bce79232.95857633.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:54:53','2022-10-03 14:54:53','2022-10-03 14:54:53'),
(37,NULL,3,1,'asset633af806260545.50558061.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 14:56:06','2022-10-03 14:56:06','2022-10-03 14:56:06'),
(38,NULL,3,1,'asset633afa46ce7523.62900012.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 15:05:42','2022-10-03 15:05:42','2022-10-03 15:05:42'),
(39,NULL,3,1,'asset633afc5d72c2f9.98811315.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 15:14:37','2022-10-03 15:14:37','2022-10-03 15:14:37'),
(40,NULL,3,1,'asset633b00237c7d68.06510024.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 15:30:43','2022-10-03 15:30:43','2022-10-03 15:30:43'),
(43,NULL,3,1,'asset633b172abcc216.55844537.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:08:58','2022-10-03 17:08:58','2022-10-03 17:08:58'),
(44,NULL,3,1,'asset633b182e4157c9.63276740.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:13:18','2022-10-03 17:13:18','2022-10-03 17:13:18'),
(45,NULL,3,1,'asset633b183a643535.13439729.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:13:30','2022-10-03 17:13:30','2022-10-03 17:13:30'),
(50,2,4,1,'Ts_paralax_191_Ts_a.jpg','image',NULL,1707,2560,1012766,NULL,NULL,NULL,'2022-10-03 17:32:42','2022-10-03 17:32:42','2022-10-04 15:30:54');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `assets_sites`
--

DROP TABLE IF EXISTS `assets_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets_sites` (
  `assetId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `alt` text DEFAULT NULL,
  PRIMARY KEY (`assetId`,`siteId`),
  KEY `fk_juhkcaxicgoablretpliseidancbauzpdkaw` (`siteId`),
  CONSTRAINT `fk_juhkcaxicgoablretpliseidancbauzpdkaw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zikogdgtgogwatkpkdcbxlxvdyjzfjtlltkc` FOREIGN KEY (`assetId`) REFERENCES `assets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets_sites`
--

LOCK TABLES `assets_sites` WRITE;
/*!40000 ALTER TABLE `assets_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `assets_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator`
--

DROP TABLE IF EXISTS `authenticator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `auth2faSecret` varchar(255) DEFAULT NULL,
  `oldTimestamp` int(11) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ikjrodmcempvaxznbnkqfkfnjgkpyrhazsxn` (`userId`),
  CONSTRAINT `fk_ikjrodmcempvaxznbnkqfkfnjgkpyrhazsxn` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator`
--

LOCK TABLES `authenticator` WRITE;
/*!40000 ALTER TABLE `authenticator` DISABLE KEYS */;
/*!40000 ALTER TABLE `authenticator` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
INSERT INTO `changedattributes` VALUES
(1,1,'fullName','2022-09-30 11:48:11',0,1),
(2,1,'title','2022-09-28 12:25:04',0,1);
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
  `layoutElementUid` char(36) NOT NULL DEFAULT '0',
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`,`layoutElementUid`),
  KEY `idx_tgwnverrtttafxpupvfgxvzesdsvgaucafta` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_oprfzzidlkaclebddescvpiihguhudpfsewz` (`siteId`),
  KEY `fk_zfqrmritqlhejkylbpmwethyyzggewbybiog` (`fieldId`),
  KEY `fk_cykardiifvparqvfvcydhhozpezntzmezcan` (`userId`),
  CONSTRAINT `fk_cykardiifvparqvfvcydhhozpezntzmezcan` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_mjdfcjmgxcsuhosylqpphnvbfutexbikxelc` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_oprfzzidlkaclebddescvpiihguhudpfsewz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_zfqrmritqlhejkylbpmwethyyzggewbybiog` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
INSERT INTO `changedfields` VALUES
(2,1,10,'0','2022-10-04 15:45:57',0,1),
(2,1,12,'517fd37a-0de4-4675-abfa-d8b72381c3fa','2024-07-17 17:05:05',0,1),
(2,1,19,'b824efd1-e9f2-4916-9b35-fc51d38c9020','2024-10-06 07:59:03',0,1),
(2,1,20,'d2a5becd-cb13-4dfe-85d3-f09c17e34448','2024-11-02 09:16:40',0,1);
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
  `field_bildbeschreibung_dukgymih` text DEFAULT NULL,
  `field_ckeditor_lnhfbfqy` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qednwlpgzzaomxnqvmvznyitxtydmeumxmxp` (`elementId`,`siteId`),
  KEY `idx_bqqjmtvrchxgkteteqhhjxtgfggysqluixbs` (`siteId`),
  KEY `idx_mbmnuktouxfuiaoklbcmpzlxpxydrlqmkeda` (`title`),
  CONSTRAINT `fk_arxywmxhupmwrpcvgrneqbtwqqriydjwzwud` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nqoftmbiasbiftxdrugixhizslbrjjypujhs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES
(34,34,1,'Asset633af76982e267 12846520','2022-10-03 14:53:29','2022-10-03 14:53:29','f73c38b5-dcd2-4243-9720-be221bfbb648',NULL,NULL),
(35,35,1,'Asset633af7a5885197 88769114','2022-10-03 14:54:29','2022-10-03 14:54:29','4366ff28-426f-459e-9ab5-41c1f7087eee',NULL,NULL),
(36,36,1,'Asset633af7bce79232 95857633','2022-10-03 14:54:52','2022-10-03 14:54:52','b2f0d835-1ec8-492d-81ba-b5b6c972d11e',NULL,NULL),
(37,37,1,'Asset633af806260545 50558061','2022-10-03 14:56:06','2022-10-03 14:56:06','4ddef3a6-a27d-491a-9008-df134cc46128',NULL,NULL),
(38,38,1,'Asset633afa46ce7523 62900012','2022-10-03 15:05:42','2022-10-03 15:05:42','b542b0be-721a-4df1-9e6a-d81d530c22eb',NULL,NULL),
(39,39,1,'Asset633afc5d72c2f9 98811315','2022-10-03 15:14:37','2022-10-03 15:14:37','53a71c67-21c9-48b3-9900-aa66152fa9f1',NULL,NULL),
(40,40,1,'Asset633b00237c7d68 06510024','2022-10-03 15:30:43','2022-10-03 15:30:43','558cb587-d3c3-4295-a741-9a9f1a07209b',NULL,NULL),
(43,43,1,'Asset633b172abcc216 55844537','2022-10-03 17:08:58','2022-10-03 17:08:58','65418e8e-35da-4099-8fbd-7d3e49b00ba7',NULL,NULL),
(44,44,1,'Asset633b182e4157c9 63276740','2022-10-03 17:13:18','2022-10-03 17:13:18','78cf7020-c7b3-4821-b796-ba5856a57596',NULL,NULL),
(45,45,1,'Asset633b183a643535 13439729','2022-10-03 17:13:30','2022-10-03 17:13:30','01021c1a-142e-4a9c-a2ee-c30dd02d3ce1',NULL,NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `traces` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`traces`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mixbmrzriqmrltkdwbzqwpgeuxuxnzgurejf` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementactivity` (
  `elementId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_vcqagpnwoctqpzriebxbliknvqphrzvjxrtw` (`elementId`,`timestamp`,`userId`),
  KEY `fk_xfbuzuqtccqiazopwneqlxtmtdnsrsgnxixh` (`userId`),
  KEY `fk_pojuvdbthsvtdnezrlkwyqmlabietrzorbjr` (`siteId`),
  KEY `fk_yoyeordkubclcpvhwgrddlubiuolagzheeie` (`draftId`),
  CONSTRAINT `fk_jzunbrdfdmrdatjglaqxlhhjnkhmfvqidvgh` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pojuvdbthsvtdnezrlkwyqmlabietrzorbjr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xfbuzuqtccqiazopwneqlxtmtdnsrsgnxixh` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yoyeordkubclcpvhwgrddlubiuolagzheeie` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
INSERT INTO `elementactivity` VALUES
(2,1,1,NULL,'edit','2024-11-02 09:16:40'),
(2,1,1,NULL,'save','2024-11-02 09:16:40'),
(2,1,1,NULL,'view','2024-11-02 09:16:41');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
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
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES
(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2022-09-28 08:08:17','2022-09-30 11:48:11',NULL,NULL,NULL,'93ff1eae-a809-48c5-8c5c-102b24b5db0b'),
(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2024-11-02 09:16:40',NULL,NULL,NULL,'439cd31e-c532-45b2-8bc3-453ad109657b'),
(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2022-09-28 12:24:30',NULL,NULL,NULL,'b9f4b01d-79e6-4ee8-8065-bb8aaf430f02'),
(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2022-09-28 12:24:30',NULL,NULL,NULL,'a4bbb624-ee50-4e42-87e2-3122257bfa20'),
(5,2,NULL,3,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:30','2022-09-28 12:24:30',NULL,NULL,NULL,'8350a19c-f110-4ee5-adc1-43309377d8f0'),
(7,2,NULL,4,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:24:56','2022-09-28 12:24:56',NULL,NULL,NULL,'de21f3cd-9941-4911-803f-9f5d0539e141'),
(8,2,NULL,5,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:25:04','2022-09-28 12:25:04',NULL,NULL,NULL,'edc2c919-26b6-4cd2-947a-4c30f28157e7'),
(9,2,NULL,6,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,NULL,'960cd6ea-182d-4fa0-84fb-d3cbf85690bc'),
(10,2,NULL,7,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,NULL,'760c7448-66b7-4630-aef2-94a95eddac23'),
(11,2,NULL,8,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,NULL,'f76f372b-e5a7-4dfc-936c-68af6dda63a7'),
(12,2,NULL,9,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:27:24','2022-09-28 12:27:24',NULL,NULL,NULL,'afa9baeb-c067-46a1-8bfb-3257855e4a7d'),
(14,2,NULL,10,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:56:27','2022-09-28 12:56:27',NULL,NULL,NULL,'62213552-b2bd-49d1-bc5e-b955a040c305'),
(16,2,NULL,11,1,'craft\\elements\\Entry',1,0,'2022-09-28 12:57:03','2022-09-28 12:57:03',NULL,NULL,NULL,'693409d4-c9e3-4cdc-b999-66502f434cfa'),
(17,2,NULL,12,1,'craft\\elements\\Entry',1,0,'2022-09-29 09:53:37','2022-09-29 09:53:37',NULL,NULL,NULL,'7a3342f1-6b67-4bd7-9bd3-b74a30b857bf'),
(18,2,NULL,13,1,'craft\\elements\\Entry',1,0,'2022-09-29 09:53:50','2022-09-29 09:53:50',NULL,NULL,NULL,'389ecbeb-ed62-4bc2-93ca-56ebfe42bf2a'),
(19,2,NULL,14,1,'craft\\elements\\Entry',1,0,'2022-09-29 09:54:19','2022-09-29 09:54:19',NULL,NULL,NULL,'2ac74abf-f5e3-4251-b968-88a3982273e8'),
(20,2,NULL,15,1,'craft\\elements\\Entry',1,0,'2022-09-29 10:18:02','2022-09-29 10:18:02',NULL,NULL,NULL,'12c9477c-8fd4-4347-9e37-390cc9380efe'),
(22,2,NULL,16,1,'craft\\elements\\Entry',1,0,'2022-09-29 10:18:16','2022-09-29 10:18:16',NULL,NULL,NULL,'f6f74bd5-1c21-44e7-a27c-737f2800d2ae'),
(23,2,NULL,17,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:26:47','2022-09-29 12:26:47',NULL,NULL,NULL,'1d34be13-e997-4376-8d0b-82effa50ffd2'),
(24,2,NULL,18,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:26:47','2022-09-29 12:26:47',NULL,NULL,NULL,'f55b33b0-da59-41a5-8dde-664361a2a235'),
(25,2,NULL,19,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:27:49','2022-09-29 12:27:49',NULL,NULL,NULL,'8693a192-3f45-4612-a584-0cfde6c4f7cf'),
(27,2,NULL,20,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:30:31','2022-09-29 12:30:31',NULL,NULL,NULL,'026e85a1-1788-4c42-ae7c-7c5fd8676e8d'),
(28,2,NULL,21,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:30:55','2022-09-29 12:30:55',NULL,NULL,NULL,'3a73fa4b-3c12-4f1b-8893-d0b7751a60c0'),
(30,2,NULL,22,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:31:04','2022-09-29 12:31:04',NULL,NULL,NULL,'602732a3-0a86-4161-9282-ae4582b5baa3'),
(31,2,NULL,23,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:38:02','2022-09-29 12:38:02',NULL,NULL,NULL,'d12b22e0-2918-4c27-a5c2-4ba6a79ce17c'),
(32,2,NULL,24,1,'craft\\elements\\Entry',1,0,'2022-09-29 12:38:02','2022-09-29 12:38:02',NULL,NULL,NULL,'9459ebd6-58dc-4734-92e2-a8573d2d7c13'),
(33,2,NULL,25,1,'craft\\elements\\Entry',1,0,'2022-10-03 14:52:57','2022-10-03 14:52:57',NULL,NULL,NULL,'8c8f795f-011e-4f96-8f79-27ce6cb6b6f1'),
(34,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:53:29','2022-10-03 14:53:29',NULL,NULL,NULL,'291c1bcb-43d5-4ff1-920b-6b7d87a79d3e'),
(35,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:54:29','2022-10-03 14:54:29',NULL,NULL,NULL,'d5507006-f6ba-4932-ba32-7835c0a92e46'),
(36,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:54:52','2022-10-03 14:54:52',NULL,NULL,NULL,'4eca4cb5-650c-466a-8784-5663fe8cfaf1'),
(37,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 14:56:06','2022-10-03 14:56:06',NULL,NULL,NULL,'024914a4-4cbe-461d-ad84-5366fe9aa2b9'),
(38,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 15:05:42','2022-10-03 15:05:42',NULL,NULL,NULL,'83ce9f72-03af-460f-bed6-858e9f57e4c4'),
(39,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 15:14:37','2022-10-03 15:14:37',NULL,NULL,NULL,'ffd168e9-3bff-4962-926b-fb53e0eae0f8'),
(40,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 15:30:43','2022-10-03 15:30:43',NULL,NULL,NULL,'12113e47-02c8-448b-b4ed-8d9085dd1f25'),
(41,2,NULL,26,1,'craft\\elements\\Entry',1,0,'2022-10-03 16:18:58','2022-10-03 16:18:58',NULL,NULL,NULL,'923807a3-2d10-4120-abc5-cb67f3e0aeaa'),
(42,2,NULL,27,1,'craft\\elements\\Entry',1,0,'2022-10-03 16:19:08','2022-10-03 16:19:08',NULL,NULL,NULL,'bad78aa6-ebe8-453b-85fb-7066b01c7b21'),
(43,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 17:08:58','2022-10-03 17:08:58',NULL,NULL,NULL,'3ee9460b-d66d-4d96-8776-a9ca60c1511e'),
(44,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 17:13:18','2022-10-03 17:13:18',NULL,NULL,NULL,'2c0280e6-9c41-4b0b-9499-f2aa95ac1e67'),
(45,NULL,NULL,NULL,NULL,'craft\\elements\\Asset',1,0,'2022-10-03 17:13:30','2022-10-03 17:13:30',NULL,NULL,NULL,'245225f2-862e-4c8f-ab2c-4072d3281bbc'),
(50,NULL,NULL,NULL,3,'craft\\elements\\Asset',1,0,'2022-10-03 17:32:41','2022-10-04 15:30:54',NULL,NULL,NULL,'d7a1142c-f47a-49e3-b3ba-77bd1836b47f'),
(52,2,NULL,28,1,'craft\\elements\\Entry',1,0,'2022-10-03 21:37:42','2022-10-03 21:37:42',NULL,NULL,NULL,'68e62069-6da4-4aa7-b619-1d782627a098'),
(53,2,NULL,29,1,'craft\\elements\\Entry',1,0,'2022-10-04 09:51:59','2022-10-04 09:51:59',NULL,NULL,NULL,'66217ec0-40c5-4808-bcaa-e4d883021bc8'),
(54,2,NULL,30,1,'craft\\elements\\Entry',1,0,'2022-10-04 09:55:54','2022-10-04 09:55:54',NULL,NULL,NULL,'f1088f95-c8ec-4374-b695-8d548012445e'),
(55,2,NULL,31,1,'craft\\elements\\Entry',1,0,'2022-10-04 15:30:56','2022-10-04 15:30:56',NULL,NULL,NULL,'4e808f59-aa31-4824-bf7a-26a360de0bd8'),
(57,2,NULL,32,1,'craft\\elements\\Entry',1,0,'2022-10-04 15:45:57','2022-10-04 15:45:57',NULL,NULL,NULL,'21bd8a62-d8c0-490e-a867-5c7c77bf23b1'),
(58,2,NULL,33,1,'craft\\elements\\Entry',1,0,'2024-07-17 16:33:23','2024-07-17 16:33:23',NULL,NULL,NULL,'ae81097f-53f6-4421-a46d-6b7f32d4f5bf'),
(59,2,NULL,34,1,'craft\\elements\\Entry',1,0,'2024-07-17 16:33:23','2024-07-17 16:33:23',NULL,NULL,NULL,'4a85174c-c76b-4cbd-a89c-c9bf3aa60acb'),
(60,2,NULL,35,1,'craft\\elements\\Entry',1,0,'2024-07-17 16:33:23','2024-07-17 16:33:23',NULL,NULL,NULL,'9f8a34f4-8af9-43c1-bd86-f8d5ebd67d71'),
(61,2,NULL,36,1,'craft\\elements\\Entry',1,0,'2024-07-17 16:33:23','2024-07-17 16:33:23',NULL,NULL,NULL,'2d039c0d-1e6e-47c4-90e5-d556ae06e687'),
(62,2,NULL,37,1,'craft\\elements\\Entry',1,0,'2024-07-17 17:02:03','2024-07-17 17:02:03',NULL,NULL,NULL,'0fc0fec0-96cc-42cc-ae0b-02f3fe306b97'),
(63,2,NULL,38,1,'craft\\elements\\Entry',1,0,'2024-07-17 17:05:05','2024-07-17 17:05:05',NULL,NULL,NULL,'03931f90-3d37-43b6-a05d-b895b80771c9'),
(65,2,NULL,39,1,'craft\\elements\\Entry',1,0,'2024-10-06 07:59:03','2024-10-06 07:59:03',NULL,NULL,NULL,'721db0c1-d8bd-45c2-b686-4994140ea6e4'),
(67,2,NULL,40,1,'craft\\elements\\Entry',1,0,'2024-11-02 09:12:42','2024-11-02 09:12:42',NULL,NULL,NULL,'89b2154c-bebd-4ce2-9395-014e2937e205'),
(68,2,NULL,41,1,'craft\\elements\\Entry',1,0,'2024-11-02 09:12:51','2024-11-02 09:12:51',NULL,NULL,NULL,'7dc49e81-147f-4c6b-a8b0-ee0cb8615ad8'),
(70,2,NULL,42,1,'craft\\elements\\Entry',1,0,'2024-11-02 09:15:27','2024-11-02 09:15:27',NULL,NULL,NULL,'1e814acb-9300-48a9-9464-19aff1669ec9'),
(72,2,NULL,43,1,'craft\\elements\\Entry',1,0,'2024-11-02 09:16:40','2024-11-02 09:16:40',NULL,NULL,NULL,'2c6a581c-8ae4-418f-be10-9c96964a0aab');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_bulkops`
--

DROP TABLE IF EXISTS `elements_bulkops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_bulkops` (
  `elementId` int(11) NOT NULL,
  `key` char(10) NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`elementId`,`key`),
  KEY `idx_vypfjftabuwugluiekadunatipksqorcmouj` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_bulkops`
--

LOCK TABLES `elements_bulkops` WRITE;
/*!40000 ALTER TABLE `elements_bulkops` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements_bulkops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements_owners`
--

DROP TABLE IF EXISTS `elements_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_owners` (
  `elementId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`elementId`,`ownerId`),
  KEY `fk_fkrqqmvqcfqtyvxmooroipjlfglxakjiydxq` (`ownerId`),
  CONSTRAINT `fk_fkrqqmvqcfqtyvxmooroipjlfglxakjiydxq` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_thnzbspsvccnjmblrelcdsijyzdjeumwfwxs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_owners`
--

LOCK TABLES `elements_owners` WRITE;
/*!40000 ALTER TABLE `elements_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `elements_owners` ENABLE KEYS */;
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
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`content`)),
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
  KEY `idx_fjweliconneugqkntlrjikpjgqcxuhdgyvtj` (`title`,`siteId`),
  CONSTRAINT `fk_temteqgowhfhpxokeldgqekhgfidcvcbqngc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yceeftjuorghylwmascvixnayjfwilrtffcy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
INSERT INTO `elements_sites` VALUES
(1,1,1,NULL,NULL,NULL,NULL,1,'2022-09-28 08:08:17','2022-09-28 08:08:17','3383af9f-5662-4bca-83c6-62ceb0a97ac3'),
(2,2,1,'Reiner Zufall','startseite','__home__','{\"2fef81bc-44ba-4070-967c-51790791d3b6\":[50],\"d2a5becd-cb13-4dfe-85d3-f09c17e34448\":\"<p class=\\\"module-text__2-spalten\\\">sdsddsfds </p><p>sdfdsfsdffds</p><p> </p>\"}',1,'2022-09-28 12:24:30','2024-11-02 09:12:42','92ab4b47-56a4-4bfd-9e11-38837b48cc2f'),
(3,3,1,'Startseite','startseite','__home__',NULL,1,'2022-09-28 12:24:30','2022-09-28 12:24:30','bc2c96e8-4b47-4d63-904d-6b4535a2e017'),
(4,4,1,'Startseite','startseite','__home__',NULL,1,'2022-09-28 12:24:30','2022-09-28 12:24:30','6ac103ad-ffcb-47dc-8b3f-4b6de5caa1cc'),
(5,5,1,'Startseite','startseite','__home__',NULL,1,'2022-09-28 12:24:30','2022-09-28 12:24:30','5e0b824d-bae7-4de6-8cfe-3bc6284471cc'),
(7,7,1,'Startseite','startseite','__home__',NULL,1,'2022-09-28 12:24:56','2022-09-28 12:24:56','629a850e-c233-45ef-b4bc-7aed9bbe107e'),
(8,8,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-28 12:25:04','2022-09-28 12:25:04','424cf592-1ac0-4d33-848d-f2005f939f9b'),
(9,9,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-28 12:27:24','2022-09-28 12:27:24','dddf4b69-5e42-4b41-82e3-d6d43cd253a1'),
(10,10,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-28 12:27:24','2022-09-28 12:27:24','ebabd95e-17b5-48dd-801b-b13bf2e98d8e'),
(11,11,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-28 12:27:24','2022-09-28 12:27:24','c1e6f1fb-516d-410a-8e22-70c99f6a8bd1'),
(12,12,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-28 12:27:24','2022-09-28 12:27:24','550eacaf-91ca-4d18-a9b2-55d0182c92c2'),
(14,14,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-28 12:56:27','2022-09-28 12:56:27','130657d8-399a-4c42-94e6-7cf176932bd9'),
(16,16,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-28 12:57:03','2022-09-28 12:57:03','b9458bd3-0fa1-4050-bce0-78a903d391a1'),
(17,17,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 09:53:37','2022-09-29 09:53:37','7425028b-2d5d-4b55-b27a-80ff7fffa76e'),
(18,18,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 09:53:50','2022-09-29 09:53:50','037895cb-cb9c-49ed-8fd4-fe94fa1936b4'),
(19,19,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 09:54:19','2022-09-29 09:54:19','5ba564c7-869a-43b1-a0fe-4a55d1380f8a'),
(20,20,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 10:18:02','2022-09-29 10:18:02','5f04923f-7521-4a25-bef7-fd9242883fee'),
(22,22,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 10:18:16','2022-09-29 10:18:16','69858c9f-4ff0-48ec-aac8-a92ec525277c'),
(23,23,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:26:47','2022-09-29 12:26:47','11174c96-b1b9-4af4-b382-7a58b8197d29'),
(24,24,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:26:47','2022-09-29 12:26:47','350c73b3-0a67-46d3-b27c-e0c12ac1406b'),
(25,25,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:27:49','2022-09-29 12:27:49','c622c92c-6ef1-4d5e-b14d-f1e6bb81b24b'),
(27,27,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:30:31','2022-09-29 12:30:31','5a5983df-d33a-489f-9133-63a1d82c7f97'),
(28,28,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:30:55','2022-09-29 12:30:55','f805e54a-5fab-4a3f-9f13-28bdb0a93a41'),
(30,30,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:31:04','2022-09-29 12:31:04','7a92d30c-a904-4bc3-94b0-2f474d1bea34'),
(31,31,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:38:02','2022-09-29 12:38:02','9a5db8a2-5c93-456d-b2fb-5840d3c8ac5d'),
(32,32,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-09-29 12:38:02','2022-09-29 12:38:02','47b49878-c1ad-407e-943e-2efac9edb994'),
(33,33,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-03 14:52:57','2022-10-03 14:52:57','aa854d0c-ae53-46f4-a1dc-be87e8c83c26'),
(34,34,1,NULL,NULL,NULL,NULL,1,'2022-10-03 14:53:29','2022-10-03 14:53:29','34cbce8f-4949-452a-a7e2-940f4446cb84'),
(35,35,1,NULL,NULL,NULL,NULL,1,'2022-10-03 14:54:29','2022-10-03 14:54:29','f648b03f-0e5b-4ee9-934a-b241ff8f6f61'),
(36,36,1,NULL,NULL,NULL,NULL,1,'2022-10-03 14:54:52','2022-10-03 14:54:52','9fdca72a-0ed1-42e9-937f-69dc7f2f77a2'),
(37,37,1,NULL,NULL,NULL,NULL,1,'2022-10-03 14:56:06','2022-10-03 14:56:06','a194874f-104b-4c17-b9c7-000bfd512514'),
(38,38,1,NULL,NULL,NULL,NULL,1,'2022-10-03 15:05:42','2022-10-03 15:05:42','8c307b98-3362-4911-b2ed-257411c663c4'),
(39,39,1,NULL,NULL,NULL,NULL,1,'2022-10-03 15:14:37','2022-10-03 15:14:37','0f3ca417-ccee-46c3-8e05-38ba28062179'),
(40,40,1,NULL,NULL,NULL,NULL,1,'2022-10-03 15:30:43','2022-10-03 15:30:43','9366a9cc-b055-4f95-bccb-4741575282af'),
(41,41,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-03 16:18:58','2022-10-03 16:18:58','15a405a1-2507-4ab3-a3d1-0b37e60c497a'),
(42,42,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-03 16:19:08','2022-10-03 16:19:08','a5dd67be-ed50-4e2b-8b85-eea17220d969'),
(43,43,1,NULL,NULL,NULL,NULL,1,'2022-10-03 17:08:58','2022-10-03 17:08:58','b48d22f8-2d2d-4300-bc5b-c447a34f4e40'),
(44,44,1,NULL,NULL,NULL,NULL,1,'2022-10-03 17:13:18','2022-10-03 17:13:18','51e64a4f-3656-4ca2-a43c-cfa2b73129bb'),
(45,45,1,NULL,NULL,NULL,NULL,1,'2022-10-03 17:13:30','2022-10-03 17:13:30','981fc04c-bbca-41e9-a9bf-0af68f365d71'),
(50,50,1,'Ts paralax 191 Ts a',NULL,NULL,'{\"e1f9bdf7-3e08-4419-8e6f-4bb6c8eebfdd\":\"Atomuhr\"}',1,'2022-10-03 17:32:41','2022-10-03 17:32:41','b0d53038-467b-4d93-b1c8-8442b7de0b83'),
(52,52,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-03 21:37:42','2022-10-03 21:37:42','565272a1-f873-40b2-a4a8-62680ca17896'),
(53,53,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-04 09:51:59','2022-10-04 09:51:59','eaefe781-2875-4cff-9731-9cf0ea8d44c0'),
(54,54,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-04 09:55:54','2022-10-04 09:55:54','b8460001-28f1-49d0-b349-4a9355ffb80b'),
(55,55,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-04 15:30:56','2022-10-04 15:30:56','208638ee-d922-48e6-b8b4-d42563181dd3'),
(57,57,1,'Reiner Zufall','startseite','__home__',NULL,1,'2022-10-04 15:45:57','2022-10-04 15:45:57','79963ac0-443c-415a-9861-d7f149d7238e'),
(58,58,1,'Reiner Zufall','startseite','__home__',NULL,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','526fb306-7322-4c94-9249-8224b06f9a64'),
(59,59,1,'Reiner Zufall','startseite','__home__',NULL,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','61a2e2e3-8ee9-4e27-9f01-1952c14aa51b'),
(60,60,1,'Reiner Zufall','startseite','__home__',NULL,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','819e1551-1ccc-4aed-a006-25339688db51'),
(61,61,1,'Reiner Zufall','startseite','__home__',NULL,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','e5a44a39-347e-4c80-90a5-5b403a84a2f0'),
(62,62,1,'Reiner Zufall','startseite','__home__','{\"517fd37a-0de4-4675-abfa-d8b72381c3fa\":\"<p>Test</p>\"}',1,'2024-07-17 17:02:03','2024-07-17 17:02:03','3da753ed-a204-49d1-ab18-ac80022e8e7e'),
(63,63,1,'Reiner Zufall','startseite','__home__',NULL,1,'2024-07-17 17:05:05','2024-07-17 17:05:05','f4fbff1b-6e02-469f-957a-18065db20679'),
(65,65,1,'Reiner Zufall','startseite','__home__','{\"2fef81bc-44ba-4070-967c-51790791d3b6\":[50],\"b824efd1-e9f2-4916-9b35-fc51d38c9020\":\"<p>Lala</p><p>Lulu</p><p><a href=\\\"mailto:mail@mail.mail\\\">Mail</a></p>\"}',1,'2024-10-06 07:59:03','2024-10-06 07:59:03','b6a4662a-6246-45f7-a02b-870ad94777f7'),
(67,67,1,'Reiner Zufall','startseite','__home__','{\"2fef81bc-44ba-4070-967c-51790791d3b6\":[50],\"d2a5becd-cb13-4dfe-85d3-f09c17e34448\":\"<p class=\\\"module-text__2-spalten\\\">sdsddsfds </p><p>sdfdsfsdffds</p><p> </p>\"}',1,'2024-11-02 09:12:42','2024-11-02 09:12:42','5a723060-6ede-4445-bee5-8e0c5a2cc63e'),
(68,68,1,'Reiner Zufall','startseite','__home__','{\"2fef81bc-44ba-4070-967c-51790791d3b6\":[50],\"d2a5becd-cb13-4dfe-85d3-f09c17e34448\":\"<p class=\\\"module-text__2-spalten\\\">sdsddsfds </p><p>sdfdsfsdffds</p><p> </p>\"}',1,'2024-11-02 09:12:51','2024-11-02 09:12:51','0f771e44-feca-458f-8fb4-86f7efd958ce'),
(70,70,1,'Reiner Zufall','startseite','__home__','{\"2fef81bc-44ba-4070-967c-51790791d3b6\":[50],\"d2a5becd-cb13-4dfe-85d3-f09c17e34448\":\"<p class=\\\"module-text__2-spalten\\\">sdsddsfds </p><p>sdfdsfsdffds</p><p> </p>\"}',1,'2024-11-02 09:15:27','2024-11-02 09:15:27','7b55e9b8-cb5e-4a45-adb6-67cd1b93679e'),
(72,72,1,'Reiner Zufall','startseite','__home__','{\"2fef81bc-44ba-4070-967c-51790791d3b6\":[50],\"d2a5becd-cb13-4dfe-85d3-f09c17e34448\":\"<p class=\\\"module-text__2-spalten\\\">sdsddsfds </p><p>sdfdsfsdffds</p><p> </p>\"}',1,'2024-11-02 09:16:40','2024-11-02 09:16:40','2c72584c-535e-4ae0-a21b-43d80f1f2fa5');
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
  `sectionId` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `primaryOwnerId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `deletedWithSection` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mwvizdvaplnjmxrqiuptufgflbpjwocdzrss` (`postDate`),
  KEY `idx_peitcyerfrvtlhdupvvcnwlgicxqaaftsisj` (`expiryDate`),
  KEY `idx_rcpodikdkpgynkszgfrjdovzhbghkwevzvza` (`sectionId`),
  KEY `idx_kbanlphaeouztchnslevmmyvhnwurwtsfumt` (`typeId`),
  KEY `fk_loemjlsvmbbuexjmatcjrxrcetvokouetlkw` (`parentId`),
  KEY `idx_ejabkdhzpuivppjazqluormzngtuhhrtxuwm` (`primaryOwnerId`),
  KEY `idx_rkgtffpezqsvtlbmabnpeupkbijibebivbwu` (`fieldId`),
  CONSTRAINT `fk_igesgyrjmrocgutezkgvryijhfkzpvxrhkwu` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kcgybmsoyahhblrzoshlmaldkfrcmbamdrvl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_loemjlsvmbbuexjmatcjrxrcetvokouetlkw` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mtwzvzwzhsrztndaqejckcwjxqcwfcsphnoc` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rqhqhgqxqlyasdempckdnprhosgkfzrderuy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vxznnjlykxfszteiabycdkfhmyofmiswwtke` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES
(2,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),
(3,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),
(4,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),
(5,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:24:30','2022-09-28 12:24:30'),
(7,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:24:56','2022-09-28 12:24:56'),
(8,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:25:04','2022-09-28 12:25:04'),
(9,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),
(10,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),
(11,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),
(12,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:27:24','2022-09-28 12:27:24'),
(14,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:56:27','2022-09-28 12:56:27'),
(16,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-28 12:57:03','2022-09-28 12:57:03'),
(17,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 09:53:37','2022-09-29 09:53:37'),
(18,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 09:53:50','2022-09-29 09:53:50'),
(19,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 09:54:19','2022-09-29 09:54:19'),
(20,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 10:18:02','2022-09-29 10:18:02'),
(22,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 10:18:16','2022-09-29 10:18:16'),
(23,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:26:47','2022-09-29 12:26:47'),
(24,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:26:47','2022-09-29 12:26:47'),
(25,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:27:49','2022-09-29 12:27:49'),
(27,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:30:31','2022-09-29 12:30:31'),
(28,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:30:55','2022-09-29 12:30:55'),
(30,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:31:04','2022-09-29 12:31:04'),
(31,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:38:02','2022-09-29 12:38:02'),
(32,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-09-29 12:38:02','2022-09-29 12:38:02'),
(33,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-03 14:52:57','2022-10-03 14:52:57'),
(41,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-03 16:18:58','2022-10-03 16:18:58'),
(42,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-03 16:19:08','2022-10-03 16:19:08'),
(52,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-03 21:37:42','2022-10-03 21:37:42'),
(53,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-04 09:51:59','2022-10-04 09:51:59'),
(54,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-04 09:55:54','2022-10-04 09:55:54'),
(55,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-04 15:30:56','2022-10-04 15:30:56'),
(57,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2022-10-04 15:45:57','2022-10-04 15:45:57'),
(58,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-07-17 16:33:23','2024-07-17 16:33:23'),
(59,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-07-17 16:33:23','2024-07-17 16:33:23'),
(60,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-07-17 16:33:23','2024-07-17 16:33:23'),
(61,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-07-17 16:33:23','2024-07-17 16:33:23'),
(62,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-07-17 17:02:03','2024-07-17 17:02:03'),
(63,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-07-17 17:05:05','2024-07-17 17:05:05'),
(65,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-10-06 07:59:03','2024-10-06 07:59:03'),
(67,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-11-02 09:12:42','2024-11-02 09:12:42'),
(68,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-11-02 09:12:51','2024-11-02 09:12:51'),
(70,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-11-02 09:15:27','2024-11-02 09:15:27'),
(72,1,NULL,NULL,NULL,1,'2022-09-28 12:24:00',NULL,NULL,NULL,'2024-11-02 09:16:40','2024-11-02 09:16:40');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_authors`
--

DROP TABLE IF EXISTS `entries_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_authors` (
  `entryId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`entryId`,`authorId`),
  KEY `idx_aizlljutgjhlraajcmxlzfvtvvrpdznpgocq` (`authorId`),
  KEY `idx_hyipmvvkvnvhlteegfclfarxcgsxvzhfwtns` (`entryId`,`sortOrder`),
  CONSTRAINT `fk_clwsnmiqrpxumpafrhwumztnoaaadokzrfhj` FOREIGN KEY (`entryId`) REFERENCES `entries` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iccbasjfanmdlkiixssjlstdehvmjurfquca` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_authors`
--

LOCK TABLES `entries_authors` WRITE;
/*!40000 ALTER TABLE `entries_authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `showSlugField` tinyint(1) DEFAULT 1,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text DEFAULT NULL,
  `showStatusField` tinyint(1) DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bbjfbcelkueahisyjscvmpgplqpjknbwsoco` (`fieldLayoutId`),
  KEY `idx_oemaojqaauvkpsfrckxtnjlbjtyjkdlxlbiw` (`dateDeleted`),
  CONSTRAINT `fk_pzvqhapiyrmnddhuzrcijyezrovxhymyqjjj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
INSERT INTO `entrytypes` VALUES
(1,1,'Startseite','startseite','',NULL,1,'site',NULL,'',1,'site',NULL,1,'2022-09-28 12:24:11','2024-10-04 19:32:56',NULL,'0e793c4c-3298-4c14-a50e-fe050eeaee18');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
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
  `config` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`config`)),
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mxviibmsollegbigmyggahsevjyvwezmknjh` (`dateDeleted`),
  KEY `idx_ptvqlhbjvxzrparbdvucycfzhwxeekciooca` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
INSERT INTO `fieldlayouts` VALUES
(1,'craft\\elements\\Entry','{\"tabs\":[{\"name\":\"Inhalt\",\"uid\":\"68594230-9efe-49da-80cf-dc0970f98312\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-10-04T17:41:11+00:00\",\"uid\":\"b0f3b706-9654-4e91-ad6c-c7a6fde59439\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-10-04T17:41:11+00:00\",\"uid\":\"2fef81bc-44ba-4070-967c-51790791d3b6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"12994855-fd13-4d38-8ad9-156bb1960e74\"}]}]}','2022-09-28 12:24:11','2024-12-10 22:37:37',NULL,'8b195686-1317-4797-8d9f-8106393d5d59'),
(2,'craft\\elements\\Asset',NULL,'2022-10-03 14:52:04','2022-10-03 14:52:04','2022-10-03 17:07:18','e6565791-f8cf-4a18-85f0-1eb2df8e7e78'),
(3,'craft\\elements\\Asset','{\"tabs\":[{\"name\":\"Content\",\"uid\":\"6b9c9049-f380-4f5d-8db8-2e6fa1a74f1c\",\"userCondition\":null,\"elementCondition\":null,\"elements\":[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"inputType\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-10-04T10:41:11-07:00\",\"uid\":\"2124b4b0-5b72-4089-a532-43c097daaf1d\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"handle\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"providesThumbs\":false,\"includeInCards\":false,\"width\":100,\"dateAdded\":\"2024-10-04T10:41:11-07:00\",\"uid\":\"e1f9bdf7-3e08-4419-8e6f-4bb6c8eebfdd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"396abe4e-d4af-4c68-a2fb-7a3bce13f340\"}]}]}','2022-10-03 17:08:22','2024-10-04 17:42:11',NULL,'413aa4a6-e2a6-4c94-b2e0-08be3e37fc65');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
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
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hqlkqtznjkmctpcmdfasqabrnoifpwdqtpqg` (`handle`,`context`),
  KEY `idx_fpdazeqmbuzxtbvqurcuqqegkvlrpbmyunhn` (`context`),
  KEY `idx_jsriqkjieqhjghpyhkflaskwkvigjcowwnow` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
INSERT INTO `fields` VALUES
(10,'Projektbilder','projektbilder','global',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":null,\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":null,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":false,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\",\"restrictedLocationSubpath\":null,\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2022-10-03 14:52:37','2024-10-04 17:42:11',NULL,'12994855-fd13-4d38-8ad9-156bb1960e74'),
(11,'SEO Bildbeschreibung','seoBildbeschreibung','global','dukgymih',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2022-10-04 09:51:25','2024-10-04 19:56:14',NULL,'396abe4e-d4af-4c68-a2fb-7a3bce13f340'),
(12,'CKEditor','ckeditor','global','lnhfbfqy',NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"9e7d0f16-c377-4f3b-a734-ed1f646f1fed\",\"columnType\":\"text\",\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-10-04 17:42:11','dffdb509-f1db-4d98-897e-971108a169e2'),
(13,'Farbe','farbe','global','ctrdgacg',NULL,0,'none',NULL,'craft\\fields\\Color','{\"defaultColor\":null}','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-06 08:03:59','0a064e6b-5fcd-4a2b-acb7-b46630ad5244'),
(14,'Konflikt 2','konflikt20MitBranch','global','munkpyzi',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-04 19:33:08','33e4e2e0-ac84-49fd-ad87-186f3ea0666b'),
(15,'Felix','felix','global','toxwzikf',NULL,0,'none',NULL,'craft\\fields\\Number','{\"decimals\":0,\"defaultValue\":null,\"max\":null,\"min\":0,\"prefix\":null,\"previewCurrency\":null,\"previewFormat\":\"decimal\",\"size\":null,\"suffix\":null}','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-04 19:33:04','7689ffd6-2bc9-4ccb-9f0e-705955ea7777'),
(16,'Filipa 2','filipa2','global','eymkjnns',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-04 19:33:10','6b8cfffa-f693-418b-bedc-62d6d047943e'),
(17,'Konflikt ;)','konflikt','global','lftxpsoa',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-04 19:33:11','82491024-fe0a-4331-a632-7b4e1a03d628'),
(18,'SEO Meta Description','seoMetaDescription','global',NULL,'Kurzer Text, den Suchmaschinen (wahrscheinlich) unter dem Namen der Seite anzeigt',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2024-10-04 19:55:42','2024-10-04 19:56:24',NULL,'e667dda0-024e-49cf-b865-a2bb0a7c491e'),
(19,'CKEditor','ckeditor','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":null,\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-10-06 07:58:30','2024-10-06 07:58:30','2024-10-06 08:03:56','352e4f04-b337-41cf-a259-2df2eb9be025'),
(20,'Test CKEditor','testCkeditor','global',NULL,NULL,0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"*\",\"ckeConfig\":\"cb39eaf1-d815-499d-a1b7-bbf293af0c6e\",\"createButtonLabel\":null,\"defaultTransform\":null,\"enableSourceEditingForNonAdmins\":false,\"purifierConfig\":null,\"purifyHtml\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"showWordCount\":false,\"wordLimit\":null}','2024-11-01 23:35:49','2024-11-01 23:35:49','2024-12-10 22:37:37','116cf140-dea1-4764-a15b-a90c197516e3');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_emailtemplates`
--

DROP TABLE IF EXISTS `formie_emailtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_emailtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_emailtemplates`
--

LOCK TABLES `formie_emailtemplates` WRITE;
/*!40000 ALTER TABLE `formie_emailtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_emailtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_forms`
--

DROP TABLE IF EXISTS `formie_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(64) NOT NULL,
  `fieldContentTable` varchar(74) NOT NULL,
  `settings` mediumtext DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `submitActionEntryId` int(11) DEFAULT NULL,
  `submitActionEntrySiteId` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dataRetention` enum('forever','minutes','hours','days','weeks','months','years') NOT NULL DEFAULT 'forever',
  `dataRetentionValue` int(11) DEFAULT NULL,
  `userDeletedAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fileUploadsAction` enum('retain','delete') NOT NULL DEFAULT 'retain',
  `fieldLayoutId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fihbmbnvnerogudvlipsyazellmzsregabri` (`templateId`),
  KEY `idx_drcmumcwuhwmvqhuyfiiohbmfsfbvjxcsvvv` (`defaultStatusId`),
  KEY `idx_vhowpsqsjpwzxyxdlqvhwyfzbsxhsdwfcbwd` (`submitActionEntryId`),
  KEY `idx_oayinwrtqvfmyeymjpkbaneaezeqkcqhxfws` (`submitActionEntrySiteId`),
  KEY `idx_rytvaeupkjkvecswlobmklwbheytpjkqdsvn` (`fieldLayoutId`),
  CONSTRAINT `fk_bajjmvwmvbboewlwqmpqwpvoiyqmegerstel` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ijivgddlzmlasqpgoybceabfymooxwhusxcq` FOREIGN KEY (`submitActionEntryId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_itwfblyudymbaaxzceaievvfkzvjrfropolp` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mmnlzeocmbmenytvfyqvhattdugulmhowbyq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_viutyzvdovdimmuwohieiqtwxgwytotjadpv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_forms`
--

LOCK TABLES `formie_forms` WRITE;
/*!40000 ALTER TABLE `formie_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_formtemplates`
--

DROP TABLE IF EXISTS `formie_formtemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_formtemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) DEFAULT NULL,
  `useCustomTemplates` tinyint(1) DEFAULT 1,
  `outputCssLayout` tinyint(1) DEFAULT 1,
  `outputCssTheme` tinyint(1) DEFAULT 1,
  `outputJsBase` tinyint(1) DEFAULT 1,
  `outputJsTheme` tinyint(1) DEFAULT 1,
  `outputCssLocation` varchar(255) DEFAULT NULL,
  `outputJsLocation` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qlcglrxhjxzuyzltptebbjzisrdqirxwwwag` (`fieldLayoutId`),
  CONSTRAINT `fk_gnyeblvxhsmajbjydugleooiaiuzdcsjmtdj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_formtemplates`
--

LOCK TABLES `formie_formtemplates` WRITE;
/*!40000 ALTER TABLE `formie_formtemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_formtemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_integrations`
--

DROP TABLE IF EXISTS `formie_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `settings` text DEFAULT NULL,
  `cache` longtext DEFAULT NULL,
  `tokenId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_integrations`
--

LOCK TABLES `formie_integrations` WRITE;
/*!40000 ALTER TABLE `formie_integrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_integrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_nested`
--

DROP TABLE IF EXISTS `formie_nested`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_nested` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_edyucyoilocdhhvdywjkpfmzupuiawkuklcf` (`fieldId`),
  KEY `idx_moovkaadlidahcrpdkfmkbrdulkozwxthzme` (`fieldLayoutId`),
  CONSTRAINT `fk_clzcykdmbrggumhztrihbdftvfuuwpvkjiub` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ehtqxhtvopxadmrqfshsyroehgvnsztzotkj` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_nested`
--

LOCK TABLES `formie_nested` WRITE;
/*!40000 ALTER TABLE `formie_nested` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_nested` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_nestedfieldrows`
--

DROP TABLE IF EXISTS `formie_nestedfieldrows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_nestedfieldrows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_glbgvtzurhfqzcjgsyssdcavqlirswtbkdzy` (`ownerId`),
  KEY `idx_bpkpfkdsuuwpkmnltilbifoicqsesveoyhfp` (`fieldId`),
  KEY `idx_pggzwzwitfprgmzxxqohbzmbsryuizrfxekx` (`sortOrder`),
  CONSTRAINT `fk_awvgxvsoaytvmtefiyjtfytxgmqxbnprjony` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lcuoejocbjsqqqvdjybfckklqolsovwgbwfn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_terswkknozexwoqsoqsoyimwxcylfyizwczx` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_nestedfieldrows`
--

LOCK TABLES `formie_nestedfieldrows` WRITE;
/*!40000 ALTER TABLE `formie_nestedfieldrows` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_nestedfieldrows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_notifications`
--

DROP TABLE IF EXISTS `formie_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `templateId` int(11) DEFAULT NULL,
  `pdfTemplateId` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  `subject` text DEFAULT NULL,
  `recipients` enum('email','conditions') NOT NULL DEFAULT 'email',
  `to` text DEFAULT NULL,
  `toConditions` text DEFAULT NULL,
  `cc` text DEFAULT NULL,
  `bcc` text DEFAULT NULL,
  `replyTo` text DEFAULT NULL,
  `replyToName` text DEFAULT NULL,
  `from` text DEFAULT NULL,
  `fromName` text DEFAULT NULL,
  `sender` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `attachFiles` tinyint(1) DEFAULT 1,
  `attachPdf` tinyint(1) DEFAULT 0,
  `attachAssets` text DEFAULT NULL,
  `enableConditions` tinyint(1) DEFAULT 0,
  `conditions` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tgmhfpjjlbinqhwyvlrbcdmysyppnxbhsmob` (`formId`),
  KEY `idx_iqpfihdqncdqxwvwelxljajphrncxjgnemtv` (`templateId`),
  KEY `fk_ekhuwcvhlalefisbruauwyofsmkehvqutgqp` (`pdfTemplateId`),
  CONSTRAINT `fk_axiydtxpomlgahnayzwpmhmhxijjstfvqnro` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eehmpkvgshdjwhhyrksryrhvffueflrnkfks` FOREIGN KEY (`templateId`) REFERENCES `formie_emailtemplates` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ekhuwcvhlalefisbruauwyofsmkehvqutgqp` FOREIGN KEY (`pdfTemplateId`) REFERENCES `formie_pdftemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_notifications`
--

LOCK TABLES `formie_notifications` WRITE;
/*!40000 ALTER TABLE `formie_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_pagesettings`
--

DROP TABLE IF EXISTS `formie_pagesettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_pagesettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) NOT NULL,
  `fieldLayoutTabId` int(11) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tltsrsthnocjanrkbgtczcsbljswoizxojqo` (`fieldLayoutTabId`),
  KEY `idx_ltqmldplqvhmnanwzlkgxsrqqonowvuuwjcc` (`fieldLayoutId`),
  CONSTRAINT `fk_jsxkbdhwzpwyntilmfmsijtrsmbhvxbnnkjm` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_pagesettings`
--

LOCK TABLES `formie_pagesettings` WRITE;
/*!40000 ALTER TABLE `formie_pagesettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_pagesettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_payments`
--

DROP TABLE IF EXISTS `formie_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `subscriptionId` int(11) DEFAULT NULL,
  `amount` decimal(14,4) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `status` enum('pending','redirect','success','failed','processing') NOT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `note` mediumtext DEFAULT NULL,
  `response` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_naomowvfvcksfdvenhuzjowzftskmvnhxvuh` (`integrationId`),
  KEY `idx_ekksuvdoawvdmxqpqmhqupjbsxgnsmqmyrqi` (`fieldId`),
  KEY `idx_snzefinhuzepdamuamhqwxyzbtphxvdawvcz` (`reference`),
  KEY `fk_gpmolxwfpjcbeuxebgfadulvqthmgtxlihfh` (`submissionId`),
  KEY `fk_exgnlpsrmxksfhkrzhputkbjqfxcnbpztjag` (`subscriptionId`),
  CONSTRAINT `fk_exgnlpsrmxksfhkrzhputkbjqfxcnbpztjag` FOREIGN KEY (`subscriptionId`) REFERENCES `formie_payments_subscriptions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gpmolxwfpjcbeuxebgfadulvqthmgtxlihfh` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xmnqshrfumzjjpgsqaequjyppjgevkwcztyu` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xtkbharamwgenurngwunmsrbtaokjxolrmgx` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_payments`
--

LOCK TABLES `formie_payments` WRITE;
/*!40000 ALTER TABLE `formie_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_payments_plans`
--

DROP TABLE IF EXISTS `formie_payments_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `planData` text DEFAULT NULL,
  `isArchived` tinyint(1) NOT NULL,
  `dateArchived` datetime DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dxszargbxflmlrlmibprpmyvdwirteqfuhrw` (`handle`),
  KEY `idx_syvxgzijnlllxncbonganhpbtyhedieiygqx` (`integrationId`),
  KEY `idx_onzgugwxyyafnhlvlhohyesmhocywhypjjpe` (`reference`),
  CONSTRAINT `fk_odnkuznpxujnwwjxazfsherqeehszlhfhpeh` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_payments_plans`
--

LOCK TABLES `formie_payments_plans` WRITE;
/*!40000 ALTER TABLE `formie_payments_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_payments_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_payments_subscriptions`
--

DROP TABLE IF EXISTS `formie_payments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_payments_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) DEFAULT NULL,
  `submissionId` int(11) DEFAULT NULL,
  `fieldId` int(11) DEFAULT NULL,
  `planId` int(11) DEFAULT NULL,
  `reference` varchar(255) NOT NULL,
  `subscriptionData` text DEFAULT NULL,
  `trialDays` int(11) NOT NULL,
  `nextPaymentDate` datetime DEFAULT NULL,
  `hasStarted` tinyint(1) NOT NULL DEFAULT 1,
  `isSuspended` tinyint(1) NOT NULL DEFAULT 0,
  `dateSuspended` datetime DEFAULT NULL,
  `isCanceled` tinyint(1) NOT NULL,
  `dateCanceled` datetime DEFAULT NULL,
  `isExpired` tinyint(1) NOT NULL,
  `dateExpired` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kbpqfsthxuaonjmrvzugsvdqvjalkezyumte` (`integrationId`),
  KEY `idx_azbbbkxfgneuacocpysbdafjulltuzbyctqr` (`submissionId`),
  KEY `idx_oqpeaafuujznmlunuaebkafkljsawmwkxlik` (`fieldId`),
  KEY `idx_jmfehrwfaecjrcdeasfcmxrcqhecrmfugehg` (`planId`),
  KEY `idx_ajtoqbtyxntbxfssqdgodhdeormjuhdirwse` (`reference`),
  KEY `idx_xwmkjzjhtsuvegjseegoldiceejsmwhfojdr` (`nextPaymentDate`),
  KEY `idx_qjtimefzpgskxlitmgqhlmlttlzcgjpayjyi` (`dateExpired`),
  KEY `idx_qidovlszpmaredzhppyscpsagjiepgycdmjj` (`dateExpired`),
  CONSTRAINT `fk_aendfgchbeubitdwqvwdmerqrawhogsbcvfu` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`),
  CONSTRAINT `fk_fkhaxnydqzefmiswscldzgklfjybfyehtdnq` FOREIGN KEY (`planId`) REFERENCES `formie_payments_plans` (`id`),
  CONSTRAINT `fk_lkmnjopnqgoswrpbfcnhvwdbpveaiblxfqlq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`),
  CONSTRAINT `fk_zjqjiiuswzgepxdazkxrtzzsghmtonwzkwzi` FOREIGN KEY (`integrationId`) REFERENCES `formie_integrations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_payments_subscriptions`
--

LOCK TABLES `formie_payments_subscriptions` WRITE;
/*!40000 ALTER TABLE `formie_payments_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_payments_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_pdftemplates`
--

DROP TABLE IF EXISTS `formie_pdftemplates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_pdftemplates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `template` varchar(255) NOT NULL,
  `filenameFormat` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_pdftemplates`
--

LOCK TABLES `formie_pdftemplates` WRITE;
/*!40000 ALTER TABLE `formie_pdftemplates` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_pdftemplates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_relations`
--

DROP TABLE IF EXISTS `formie_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nzrdpzxxaczpkfngpxvvibarovqzaaufkqix` (`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_xcgwlxkvqtqmliegtlncystnlewwicxhxxim` (`sourceId`),
  KEY `idx_fufdqtmhufxfcfdyvratyhjnnfqcpnmmgtep` (`targetId`),
  KEY `idx_bzhinieqpplzdaoyliaqugezmsopsahspxku` (`sourceSiteId`),
  CONSTRAINT `fk_bisbusyadfclhkfthyhbxyllpdgbtkngveqg` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fxnoemiqltzkvprihenpvjjmfhmizvraemfu` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_nfwavhqymkfjrxzivroxgagptuwdykhlobxd` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_relations`
--

LOCK TABLES `formie_relations` WRITE;
/*!40000 ALTER TABLE `formie_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_rows`
--

DROP TABLE IF EXISTS `formie_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_rows` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) NOT NULL,
  `fieldLayoutFieldId` int(11) NOT NULL,
  `row` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fjmdufosgmyejlzztqlnkfxnfmsymclotbze` (`fieldLayoutFieldId`),
  KEY `idx_ghhahyehqkwwxbdpynhjugqsoajfmiyguswj` (`fieldLayoutId`),
  CONSTRAINT `fk_jivggqfuzyjdojqrdvjdfajqkvrwooppzriv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_rows`
--

LOCK TABLES `formie_rows` WRITE;
/*!40000 ALTER TABLE `formie_rows` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_sentnotifications`
--

DROP TABLE IF EXISTS `formie_sentnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_sentnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `formId` int(11) DEFAULT NULL,
  `submissionId` int(11) DEFAULT NULL,
  `notificationId` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `replyTo` varchar(255) DEFAULT NULL,
  `replyToName` varchar(255) DEFAULT NULL,
  `from` varchar(255) DEFAULT NULL,
  `fromName` varchar(255) DEFAULT NULL,
  `sender` varchar(255) DEFAULT NULL,
  `body` mediumtext DEFAULT NULL,
  `htmlBody` mediumtext DEFAULT NULL,
  `info` text DEFAULT NULL,
  `success` tinyint(1) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `dateCreated` datetime DEFAULT NULL,
  `dateUpdated` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_kigawkunncvweeskovdvcsgiatbpswhzlbfy` (`formId`),
  KEY `fk_iucbjutlrpcmanhxqvusmiretddyxtpydqaq` (`submissionId`),
  KEY `fk_eeqvwqtoeynxeonujtfjnzzamcdozmebawdm` (`notificationId`),
  CONSTRAINT `fk_eeqvwqtoeynxeonujtfjnzzamcdozmebawdm` FOREIGN KEY (`notificationId`) REFERENCES `formie_notifications` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_gttoqdsftqxyedxngvbfxxiimnsisfxqqpvu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iucbjutlrpcmanhxqvusmiretddyxtpydqaq` FOREIGN KEY (`submissionId`) REFERENCES `formie_submissions` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kigawkunncvweeskovdvcsgiatbpswhzlbfy` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_sentnotifications`
--

LOCK TABLES `formie_sentnotifications` WRITE;
/*!40000 ALTER TABLE `formie_sentnotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_sentnotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_statuses`
--

DROP TABLE IF EXISTS `formie_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `color` enum('green','orange','red','blue','yellow','pink','purple','turquoise','light','grey','black') NOT NULL DEFAULT 'green',
  `description` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_statuses`
--

LOCK TABLES `formie_statuses` WRITE;
/*!40000 ALTER TABLE `formie_statuses` DISABLE KEYS */;
INSERT INTO `formie_statuses` VALUES
(1,'New','new','green',NULL,1,1,NULL,'2024-07-17 15:11:57','2024-07-17 15:11:57','c9004b70-8ede-4500-b44d-1638afd790aa');
/*!40000 ALTER TABLE `formie_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_stencils`
--

DROP TABLE IF EXISTS `formie_stencils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_stencils` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `data` mediumtext DEFAULT NULL,
  `templateId` int(11) DEFAULT NULL,
  `submitActionEntryId` int(11) DEFAULT NULL,
  `submitActionEntrySiteId` int(11) DEFAULT NULL,
  `defaultStatusId` int(11) DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_guztfeusufwurxlfrpgeaeznrdwzncxzeyof` (`templateId`),
  KEY `idx_jegfxjhjrtsevyhbcswbetbmgfracqveennq` (`defaultStatusId`),
  CONSTRAINT `fk_eqdsaqiwxtdvgmjdpzekvvuexoawribjzwhi` FOREIGN KEY (`defaultStatusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zxqfhvmudkhraxtsfmsuoiddcygybhvqqfcc` FOREIGN KEY (`templateId`) REFERENCES `formie_formtemplates` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_stencils`
--

LOCK TABLES `formie_stencils` WRITE;
/*!40000 ALTER TABLE `formie_stencils` DISABLE KEYS */;
INSERT INTO `formie_stencils` VALUES
(1,'Contact Form','contactForm','{\"dataRetention\":\"forever\",\"dataRetentionValue\":null,\"fileUploadsAction\":\"retain\",\"notifications\":[{\"attachFiles\":true,\"attachPdf\":false,\"bcc\":null,\"cc\":null,\"conditions\":\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"A user submission has been made on the \\\\\\\"\\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Form Name\\\",\\\"value\\\":\\\"{formName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"\\\\\\\" form on \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Site Name\\\",\\\"value\\\":\\\"{siteName}\\\"}},{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\" at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Their submission details are:\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enableConditions\":false,\"enabled\":true,\"formId\":null,\"from\":null,\"fromName\":null,\"id\":\"new981-8077\",\"name\":\"Admin Notification\",\"pdfTemplateId\":null,\"recipients\":\"email\",\"replyTo\":\"{field.emailAddress}\",\"replyToName\":null,\"subject\":\"A new submission was made on \\\"{formName}\\\"\",\"templateId\":null,\"to\":\"{systemEmail}\",\"toConditions\":\"{\\\"toRecipients\\\":[]}\",\"uid\":null},{\"attachFiles\":true,\"attachPdf\":false,\"bcc\":null,\"cc\":null,\"conditions\":\"{\\\"sendRule\\\":\\\"send\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"content\":\"[{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"Thanks again for contacting us. Our team will get back to you as soon as we can.\\\"}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"text\\\",\\\"text\\\":\\\"As a reminder, you submitted the following details at \\\"},{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"Timestamp (yyyy-mm-dd hh:mm:ss)\\\",\\\"value\\\":\\\"{timestamp}\\\"}}]},{\\\"type\\\":\\\"paragraph\\\",\\\"content\\\":[{\\\"type\\\":\\\"variableTag\\\",\\\"attrs\\\":{\\\"label\\\":\\\"All Form Fields\\\",\\\"value\\\":\\\"{allFields}\\\"}}]}]\",\"enableConditions\":false,\"enabled\":true,\"formId\":null,\"from\":null,\"fromName\":null,\"id\":\"new7052-5168\",\"name\":\"User Notification\",\"pdfTemplateId\":\"\",\"recipients\":\"email\",\"replyTo\":null,\"replyToName\":null,\"subject\":\"Thanks for contacting us!\",\"templateId\":\"\",\"to\":\"{field.emailAddress}\",\"toConditions\":\"{\\\"toRecipients\\\":[]}\",\"uid\":null}],\"pages\":[{\"id\":\"new1272610411\",\"label\":\"Page 1\",\"notificationFlag\":true,\"rows\":[{\"fields\":[{\"brandNewField\":false,\"handle\":\"yourName\",\"hasLabel\":true,\"id\":\"new7715-7348\",\"label\":\"Your Name\",\"settings\":{\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"firstNameCollapsed\":false,\"firstNameDefaultValue\":\"\",\"firstNameEnabled\":true,\"firstNameLabel\":\"First Name\",\"firstNamePlaceholder\":\"e.g. Peter\",\"firstNameRequired\":true,\"handle\":\"yourName\",\"instructions\":\"Please enter your full name.\",\"instructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"label\":\"Your Name\",\"labelPosition\":\"verbb\\\\formie\\\\positions\\\\Hidden\",\"lastNameCollapsed\":false,\"lastNameDefaultValue\":\"\",\"lastNameEnabled\":true,\"lastNameLabel\":\"Last Name\",\"lastNamePlaceholder\":\"e.g. Sherman\",\"lastNameRequired\":true,\"maxType\":\"characters\",\"middleNameCollapsed\":true,\"middleNameDefaultValue\":\"\",\"middleNameEnabled\":false,\"middleNameLabel\":\"Middle Name\",\"placeholder\":\"Your name\",\"prefixCollapsed\":true,\"prefixDefaultValue\":\"\",\"prefixEnabled\":false,\"prefixLabel\":\"Prefix\",\"subfieldLabelPosition\":\"\",\"useMultipleFields\":true,\"visibility\":\"\"},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Name\"}],\"id\":\"new8990-9934\"},{\"fields\":[{\"brandNewField\":false,\"handle\":\"emailAddress\",\"hasLabel\":true,\"id\":\"new6482-9528\",\"label\":\"Email Address\",\"settings\":{\"handle\":\"emailAddress\",\"instructions\":\"Please enter your email so we can get in touch.\",\"instructionsPosition\":\"\",\"label\":\"Email Address\",\"labelPosition\":\"\",\"maxType\":\"characters\",\"placeholder\":\"e.g. psherman@wallaby.com\",\"required\":true},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\Email\"}],\"id\":\"new9524-8509\"},{\"fields\":[{\"brandNewField\":false,\"handle\":\"message\",\"hasLabel\":true,\"id\":\"new982-7322\",\"label\":\"Message\",\"settings\":{\"conditions\":\"{\\\"showRule\\\":\\\"show\\\",\\\"conditionRule\\\":\\\"all\\\",\\\"conditions\\\":[]}\",\"handle\":\"message\",\"instructions\":\"Please enter your comments.\",\"instructionsPosition\":\"\",\"label\":\"Message\",\"labelPosition\":\"\",\"maxType\":\"characters\",\"placeholder\":\"e.g. The reason for my enquiry is...\",\"required\":true,\"visibility\":\"\"},\"type\":\"verbb\\\\formie\\\\fields\\\\formfields\\\\MultiLineText\"}],\"id\":\"new2177-9685\"}],\"settings\":{\"backButtonLabel\":\"Back\",\"buttonsPosition\":\"left\",\"label\":\"Page 1\",\"showBackButton\":false,\"submitButtonLabel\":\"Contact us\"},\"sortOrder\":0}],\"settings\":{\"collectIp\":false,\"collectUser\":false,\"dataRetention\":null,\"dataRetentionValue\":null,\"defaultEmailTemplateId\":null,\"defaultInstructionsPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"defaultLabelPosition\":\"verbb\\\\formie\\\\positions\\\\AboveInput\",\"disableCaptchas\":false,\"displayCurrentPageTitle\":false,\"displayFormTitle\":false,\"displayPageProgress\":false,\"displayPageTabs\":false,\"errorMessage\":[{\"content\":[{\"text\":\"Couldn’t save submission due to errors.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"errorMessagePosition\":\"top-form\",\"fileUploadsAction\":null,\"limitSubmissions\":false,\"limitSubmissionsMessage\":null,\"limitSubmissionsNumber\":null,\"limitSubmissionsType\":null,\"loadingIndicator\":\"spinner\",\"loadingIndicatorText\":null,\"progressPosition\":\"end\",\"redirectUrl\":null,\"requireUser\":false,\"requireUserMessage\":null,\"scheduleForm\":false,\"scheduleFormEnd\":null,\"scheduleFormExpiredMessage\":null,\"scheduleFormPendingMessage\":null,\"scheduleFormStart\":null,\"scrollToTop\":true,\"submissionTitleFormat\":\"{timestamp}\",\"submitAction\":\"message\",\"submitActionFormHide\":false,\"submitActionMessage\":[{\"content\":[{\"text\":\"Thank you for contacting us! Our team will get in touch shortly to follow up on your message.\",\"type\":\"text\"}],\"type\":\"paragraph\"}],\"submitActionMessagePosition\":\"top-form\",\"submitActionMessageTimeout\":null,\"submitActionTab\":null,\"submitActionUrl\":null,\"submitMethod\":\"ajax\",\"validationOnFocus\":true,\"validationOnSubmit\":true},\"userDeletedAction\":\"retain\"}',NULL,NULL,NULL,1,NULL,'2024-07-17 15:11:57','2024-07-17 15:11:57','d9d672c4-8aa3-4a45-bb07-6e3471e03007');
/*!40000 ALTER TABLE `formie_stencils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_submissions`
--

DROP TABLE IF EXISTS `formie_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `formId` int(11) NOT NULL,
  `statusId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `isIncomplete` tinyint(1) DEFAULT 0,
  `isSpam` tinyint(1) DEFAULT 0,
  `spamReason` text DEFAULT NULL,
  `spamClass` varchar(255) DEFAULT NULL,
  `snapshot` text DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_efabkbmuaohrkwthgjrypbzweqjfmcvqscoi` (`formId`),
  KEY `idx_zzxlojxuagfhzkcxdepfcmbpsmsrslmcfgwv` (`statusId`),
  KEY `idx_sxlxejjsojpnxkczmcwbwitglkxvdxqqotba` (`userId`),
  CONSTRAINT `fk_bvukyjeaijgntfrpwlvagbxrhxbziecrwasg` FOREIGN KEY (`statusId`) REFERENCES `formie_statuses` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_fhvcgcdmsasuyouqtxjuaarolfmnyqsstkwx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tilojsmskjjgejztzgogymtjevvolhbswqsp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vmmkmammecvecoapqyiusmdgtpajxxxeccdo` FOREIGN KEY (`formId`) REFERENCES `formie_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_submissions`
--

LOCK TABLES `formie_submissions` WRITE;
/*!40000 ALTER TABLE `formie_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_syncfields`
--

DROP TABLE IF EXISTS `formie_syncfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_syncfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `syncId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xjwcpzvgtnibuwyjlpbwqyhbedxzcsfrfrgl` (`syncId`,`fieldId`),
  KEY `fk_ftodovkcxcmekxbcearmenpxancnyeuueokr` (`fieldId`),
  CONSTRAINT `fk_ftodovkcxcmekxbcearmenpxancnyeuueokr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kjqevaaoeqlrvkyjvldstwxeggmmmegylrah` FOREIGN KEY (`syncId`) REFERENCES `formie_syncs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_syncfields`
--

LOCK TABLES `formie_syncfields` WRITE;
/*!40000 ALTER TABLE `formie_syncfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_syncfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_syncs`
--

DROP TABLE IF EXISTS `formie_syncs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_syncs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_syncs`
--

LOCK TABLES `formie_syncs` WRITE;
/*!40000 ALTER TABLE `formie_syncs` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_syncs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formie_tokens`
--

DROP TABLE IF EXISTS `formie_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formie_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `accessToken` text DEFAULT NULL,
  `secret` text DEFAULT NULL,
  `endOfLife` varchar(255) DEFAULT NULL,
  `refreshToken` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formie_tokens`
--

LOCK TABLES `formie_tokens` WRITE;
/*!40000 ALTER TABLE `formie_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `formie_tokens` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`scope`)),
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagetransformindex`
--

LOCK TABLES `imagetransformindex` WRITE;
/*!40000 ALTER TABLE `imagetransformindex` DISABLE KEYS */;
INSERT INTO `imagetransformindex` VALUES
(1,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_22x34_crop_center-center_none',1,0,0,'2022-10-03 17:32:42','2022-10-03 17:32:42','2022-10-03 17:32:46','b94cab6c-0e78-40bb-8009-417d24b38ff8'),
(2,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_45x68_crop_center-center_none',1,0,0,'2022-10-03 17:32:42','2022-10-03 17:32:42','2022-10-03 17:32:42','50fe5348-6f6e-4680-bef9-8d0f8a776520'),
(3,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_126x190_crop_center-center_none',1,0,0,'2022-10-03 17:32:46','2022-10-03 17:32:46','2022-10-03 17:32:46','c7c668cd-9274-44de-8acb-00fb3083c49a'),
(4,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_252x380_crop_center-center_none',1,0,0,'2022-10-03 17:32:46','2022-10-03 17:32:46','2022-10-03 17:32:46','848cac6c-6d75-468e-a66e-9e101a13858f'),
(5,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_100xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','bb55e715-52f7-46f8-802c-ae07698c3476'),
(6,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','6de03cf6-1740-4d10-bda7-04cc2602c001'),
(7,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','aefd5a22-a72c-418d-bbc8-6a8374c28358'),
(8,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_600xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:29','d799a673-76bb-4a2a-8931-0a2775cee2ca'),
(9,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_800xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','3abd5cfb-9577-4684-89a0-7433463418a7'),
(10,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1000xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','08e12edf-cfe1-46a3-b13d-a6c26a539a6d'),
(11,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','972eed3d-e42b-483c-90ca-c5db8d37b820'),
(12,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','3e650413-08dc-4032-9ca7-0d69cd7eba8e'),
(13,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1600xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:30','a88e58bd-2ce6-429e-9ad4-06a3da0af442'),
(14,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_1800xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:31','dd5b6dad-fa4f-46e5-86be-95d1459b2af5'),
(15,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2000xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:31','3dbfc4d4-caad-47bb-9bc1-ea110fbc9fc7'),
(16,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:32','0147a8ef-687c-4c0e-a481-b454545bca5e'),
(17,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:33','1cedeb38-8344-49f1-9652-129dfe241429'),
(18,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2600xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:34','d489b76b-69fc-4646-80fb-a240845c3bd7'),
(19,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_2800xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:35','5a3784c3-3891-498c-889e-fd4299ed7fbd'),
(20,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3000xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:38:44','699eb55a-0f40-48ef-9a49-f5ea67d90a28'),
(21,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3200xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:39:03','ac3acab0-b912-4765-910c-ce3d4f8ee1d6'),
(22,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3400xAUTO_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:39:24','59dd0b8d-4acf-49e3-b473-018852877457'),
(23,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3600xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:41:53','b0aa233e-c549-49c2-a3ed-95cbb8005e51'),
(24,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_3800xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:41:55','e92cc470-7030-4a7a-85d7-af781048cdf9'),
(25,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4000xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:42:17','82a39312-8199-4976-951b-f6512d969479'),
(26,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4200xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:42:53','bc83e10c-9f2b-4ee5-8b2e-a8f28ef7947b'),
(27,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4400xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 06:51:57','183c5402-3fd4-4a2a-b917-6993152b9391'),
(28,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4600xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 06:52:19','17cef19f-269b-4138-a05f-4b5e0e5ba948'),
(29,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_4800xAUTO_crop_center-center_none',0,1,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 06:54:25','f08f43a8-aa4b-4729-a129-6f7452d7489d'),
(30,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_5000xAUTO_crop_center-center_none',1,0,1,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-04 08:43:54','cba56d57-7723-4ce4-bd43-e72b15392435'),
(31,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_300x300_crop_center-center_none',1,0,0,'2022-10-03 21:38:29','2022-10-03 21:38:29','2022-10-03 21:41:49','5cf06df9-c1f8-4ba2-b0be-780e228832ba'),
(32,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_666x1000_crop_center-center_none',1,0,0,'2022-10-04 15:15:09','2022-10-04 15:15:09','2022-10-04 15:15:09','1795a88d-e2cd-44f4-aaaf-4deaa8dc22f1'),
(33,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_300xAUTO_crop_center-center_none',1,0,0,'2022-10-04 15:49:41','2022-10-04 15:49:41','2022-10-04 15:49:41','e5bc1e1d-09dc-4e1b-be58-8385286f0a26'),
(34,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_20x30_crop_center-center_none',0,0,1,'2024-07-17 17:01:57','2024-07-17 17:01:57','2024-11-02 09:16:41','36b1d84c-39d1-42c3-88df-3a6d4a46e7a3'),
(35,50,'craft\\imagetransforms\\ImageTransformer','Ts_paralax_191_Ts_a.jpg',NULL,'_40x60_crop_center-center_none',0,0,1,'2024-07-17 17:01:57','2024-07-17 17:01:57','2024-12-10 22:38:43','502eeba7-2b68-4938-97dc-7cdc7de98593');
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
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fbkmbkyxmmidgojxerqcwbactamxcsmkmick` (`name`),
  KEY `idx_cppuicjukenejfclizzrytmyubqbjtjphnrm` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES
(1,'5.5.6','5.5.0.0',0,'nwbcbclyzuhz','3@qcgnfgfxgn','2022-09-28 08:08:17','2024-12-10 22:38:27','7e6daab9-2991-4d5f-bb87-ffbee2fc0cc5');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES
(1,'craft','Install','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','9792b61d-9328-49c8-a678-fbffcd6911c6'),
(2,'craft','m210121_145800_asset_indexing_changes','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','21de8979-0e64-483e-bf96-a547509c21b6'),
(3,'craft','m210624_222934_drop_deprecated_tables','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','67e4515d-2565-4794-ae61-23eb29bc3a61'),
(4,'craft','m210724_180756_rename_source_cols','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','58d47c6a-0e95-497a-acde-6994ee5899e7'),
(5,'craft','m210809_124211_remove_superfluous_uids','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','0ccacfd8-e993-410b-9a9e-ededa499f081'),
(6,'craft','m210817_014201_universal_users','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','5c5994da-ae0a-44ba-8656-0bf16eda89c0'),
(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','3755c340-7ed3-44bc-b9f8-8c33ddc0af1f'),
(8,'craft','m211115_135500_image_transformers','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','4807bd19-04e1-4818-af52-969d8bc3584a'),
(9,'craft','m211201_131000_filesystems','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','2eff0f96-3cce-4e53-967f-475e875c3977'),
(10,'craft','m220103_043103_tab_conditions','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','72246268-1283-4a0d-8ada-f06c2985824c'),
(11,'craft','m220104_003433_asset_alt_text','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','01c568f4-2aa8-449e-a0ee-92675419aa02'),
(12,'craft','m220123_213619_update_permissions','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','f153f3ea-f1b1-44ea-a41f-e3689cecec9a'),
(13,'craft','m220126_003432_addresses','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','0d003718-331f-4228-b64f-b8073ea16f4c'),
(14,'craft','m220209_095604_add_indexes','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','c502e590-9b00-4bca-b8dd-47792960b319'),
(15,'craft','m220213_015220_matrixblocks_owners_table','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','d98a3e89-2636-43c7-8c18-69f711da5318'),
(16,'craft','m220214_000000_truncate_sessions','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','7837c47d-0847-4544-af63-f949b30b6740'),
(17,'craft','m220222_122159_full_names','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','d269692d-05a2-4f3f-808d-cb27a5a4b96f'),
(18,'craft','m220223_180559_nullable_address_owner','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','be97ec85-0def-4233-9f64-a08c5563f001'),
(19,'craft','m220225_165000_transform_filesystems','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','ff77cb02-e4f9-44aa-bc1f-b22b6b5716d3'),
(20,'craft','m220309_152006_rename_field_layout_elements','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','8e126262-cace-4990-b182-b5336c1a8581'),
(21,'craft','m220314_211928_field_layout_element_uids','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','bec59e15-3e47-426a-b0ac-4797ac64bf8e'),
(22,'craft','m220316_123800_transform_fs_subpath','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','58ef54e9-9d8f-4074-a77c-e3d92601d6ed'),
(23,'craft','m220317_174250_release_all_jobs','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','04773981-cd5d-43fc-8aeb-f83e1cbcca22'),
(24,'craft','m220330_150000_add_site_gql_schema_components','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','dbef9aab-af8e-44b6-8fa0-7c2b3d25f9ab'),
(25,'craft','m220413_024536_site_enabled_string','2022-09-28 08:08:18','2022-09-28 08:08:18','2022-09-28 08:08:18','9a373fb9-a230-4aba-8378-69226b87cd07'),
(26,'craft','m221027_160703_add_image_transform_fill','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','b5cacdd4-cfc5-4c58-954e-5f431fe79939'),
(27,'craft','m221028_130548_add_canonical_id_index','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','df08ad9f-cb0f-474a-9c16-490b09f3cacf'),
(28,'craft','m221118_003031_drop_element_fks','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','1cb271d6-f5ed-4980-99dd-a6f6e0c48165'),
(29,'craft','m230131_120713_asset_indexing_session_new_options','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','db1a0ab4-dce8-457f-ba88-85383a62f7d7'),
(30,'craft','m230226_013114_drop_plugin_license_columns','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','090886da-650a-4829-9057-5af35cfd4e55'),
(31,'craft','m230531_123004_add_entry_type_show_status_field','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','8c5631ff-d913-4255-96d1-ced5c26dcc4e'),
(32,'craft','m230607_102049_add_entrytype_slug_translation_columns','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','6fc13a83-a46d-4554-a1e2-ec0caceebd74'),
(33,'craft','m230710_162700_element_activity','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','1bd1377a-f18b-4faa-ae9e-8572ea4016b8'),
(34,'craft','m230820_162023_fix_cache_id_type','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','de8dab04-0510-479d-b43a-b573d690892b'),
(35,'craft','m230826_094050_fix_session_id_type','2024-07-17 16:33:23','2024-07-17 16:33:23','2024-07-17 16:33:23','784a4ead-e135-454f-bc80-8d5e4a1625c6'),
(38,'craft','m221101_115859_create_entries_authors_table','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','39c07aed-9fe1-49af-afb9-f364ae1fb649'),
(39,'craft','m221107_112121_add_max_authors_to_sections','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','3f9ea3c5-cc18-45b4-a24e-764b5a6a8c2b'),
(40,'craft','m221205_082005_translatable_asset_alt_text','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','ae573feb-824e-4259-bac8-984d5fe5ce10'),
(41,'craft','m230314_110309_add_authenticator_table','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','449b7d4e-bc0c-45f5-b903-92822fb2e10b'),
(42,'craft','m230314_111234_add_webauthn_table','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','90cf684f-9fd9-426e-93b3-6c8e2fdf82e5'),
(43,'craft','m230503_120303_add_recoverycodes_table','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','17a590f4-ccd8-4cea-bd69-879323f101d1'),
(44,'craft','m230511_000000_field_layout_configs','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','82bf6a5c-f0bb-40c7-bd24-e4f9ce30a437'),
(45,'craft','m230511_215903_content_refactor','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','90f0420c-ff60-4e2b-ba13-af787a5567da'),
(46,'craft','m230524_000000_add_entry_type_show_slug_field','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','f1ea4a29-a3cf-4b9f-bbb4-9c550e53d1ab'),
(47,'craft','m230524_000001_entry_type_icons','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','4b37881d-837a-40c4-91c3-8cf9bad1742f'),
(48,'craft','m230524_000002_entry_type_colors','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','0817758e-57fb-4a04-b501-3039136eea2b'),
(49,'craft','m230524_220029_global_entry_types','2024-07-17 16:55:55','2024-07-17 16:55:55','2024-07-17 16:55:55','991877de-9ed7-4a71-ad0d-9c8a69942ba9'),
(50,'craft','m230616_173810_kill_field_groups','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','21329864-e778-4e4e-8333-f3d58448ee02'),
(51,'craft','m230616_183820_remove_field_name_limit','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','1e08cd71-a066-46a9-847a-ce1804fd34d6'),
(52,'craft','m230617_070415_entrify_matrix_blocks','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','c2c28f05-ecf5-4ec6-9010-9af3e8dc147e'),
(53,'craft','m230904_190356_address_fields','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','7da468e6-ab80-4543-b766-2b72ba2b2333'),
(54,'craft','m230928_144045_add_subpath_to_volumes','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','ca82824d-227e-4950-a377-4661dd25caac'),
(55,'craft','m231013_185640_changedfields_amend_primary_key','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','cd91f69c-2aab-4fc3-b0ec-25cee022e194'),
(56,'craft','m231213_030600_element_bulk_ops','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','e91acfc8-5885-48ad-a54a-123bf989a52b'),
(57,'craft','m240129_150719_sites_language_amend_length','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','320a0dd1-7d9c-44c7-98b8-22c7d9c76801'),
(58,'craft','m240206_035135_convert_json_columns','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','a3dcaca1-af66-4b7a-b583-33bdb788d195'),
(59,'craft','m240207_182452_address_line_3','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','0a2b9050-fd17-43b0-92cc-aa1d4c9839de'),
(60,'craft','m240302_212719_solo_preview_targets','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','5f12f3da-ca84-45a4-95d4-42f88966cfbd'),
(61,'craft','m240619_091352_add_auth_2fa_timestamp','2024-07-17 16:55:56','2024-07-17 16:55:56','2024-07-17 16:55:56','4a820bab-a0f2-4ff9-93f7-499e93a63478'),
(62,'craft','m240723_214330_drop_bulkop_fk','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-04 17:42:11','25946e7f-e15f-471f-b546-bcd45daa3441'),
(63,'craft','m240731_053543_soft_delete_fields','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-04 17:42:11','eab35be3-f60f-4671-ab76-607720565063'),
(64,'craft','m240805_154041_sso_identities','2024-10-04 17:42:11','2024-10-04 17:42:11','2024-10-04 17:42:11','12eeb666-b0ee-436e-9fdf-a174a1c62a08'),
(66,'plugin:ckeditor','Install','2024-10-04 19:59:35','2024-10-04 19:59:35','2024-10-04 19:59:35','6a1fa6ad-6288-43d0-bf1e-26c9c1f3a659'),
(67,'plugin:ckeditor','m230408_163704_v3_upgrade','2024-10-04 19:59:35','2024-10-04 19:59:35','2024-10-04 19:59:35','3f1f1856-e3cb-43f3-ab89-2e7be98aa465'),
(68,'craft','m240926_202248_track_entries_deleted_with_section','2024-12-10 22:38:27','2024-12-10 22:38:27','2024-12-10 22:38:27','8260309d-49a3-47ad-b90d-9013c17f9602');
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
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ddsqzsroivbxuxdmttstlobprwfbcdrgbzrg` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES
(1,'password-policy','5.0.0-beta1','1.0.0','2022-09-28 12:22:49','2022-09-28 12:22:49','2024-10-04 17:42:05','d3414302-d559-47bd-ac22-135357cb9204'),
(7,'content-security-policy','3.0.0','1.0.0','2024-10-04 19:57:43','2024-10-04 19:57:43','2024-10-04 19:57:43','186e1270-6c17-4a5c-b230-27cc4b8fdd15'),
(8,'ckeditor','4.4.0','3.0.0.0','2024-10-04 19:59:35','2024-10-04 19:59:35','2024-12-10 22:38:24','0e2d0533-8a79-4601-ab08-def7bfd38e07'),
(9,'obfuscator','1.2.0','1.0.0','2024-10-06 07:56:12','2024-10-06 07:56:12','2024-10-06 07:56:12','8502b7fb-7387-45d0-b73f-32189c958484');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
INSERT INTO `projectconfig` VALUES
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.headingLevels.0','1'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.headingLevels.1','2'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.headingLevels.2','3'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.headingLevels.3','4'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.headingLevels.4','5'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.headingLevels.5','6'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.name','\"Simple\"'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.toolbar.0','\"heading\"'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.toolbar.1','\"|\"'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.toolbar.2','\"bold\"'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.toolbar.3','\"italic\"'),
('ckeditor.configs.c2146f3a-86c4-4929-ad3b-bfa61123b4c1.toolbar.4','\"link\"'),
('dateModified','1733870307'),
('email.fromEmail','\"dev@profitlich.ch\"'),
('email.fromName','\"Profitlich DEV\"'),
('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.color','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elementCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.autocomplete','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.autocorrect','true'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.class','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.dateAdded','\"2024-10-04T17:41:11+00:00\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.disabled','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.elementCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.id','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.includeInCards','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.inputType','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.instructions','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.label','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.max','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.min','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.name','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.orientation','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.placeholder','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.providesThumbs','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.readonly','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.requirable','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.size','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.step','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.tip','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.title','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.uid','\"b0f3b706-9654-4e91-ad6c-c7a6fde59439\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.userCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.warning','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.0.width','100'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.dateAdded','\"2024-10-04T17:41:11+00:00\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.elementCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.fieldUid','\"0a064e6b-5fcd-4a2b-acb7-b46630ad5244\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.handle','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.includeInCards','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.instructions','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.label','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.providesThumbs','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.required','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.tip','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.uid','\"8e610b7c-7931-4225-a570-5057ec906e28\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.userCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.warning','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.1.width','100'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.dateAdded','\"2024-10-04T17:41:11+00:00\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.elementCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.fieldUid','\"12994855-fd13-4d38-8ad9-156bb1960e74\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.handle','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.includeInCards','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.instructions','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.label','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.providesThumbs','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.required','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.tip','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.uid','\"2fef81bc-44ba-4070-967c-51790791d3b6\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.userCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.warning','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.2.width','100'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.dateAdded','\"2024-10-06T07:58:37+00:00\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.elementCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.fieldUid','\"352e4f04-b337-41cf-a259-2df2eb9be025\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.handle','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.includeInCards','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.instructions','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.label','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.providesThumbs','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.required','false'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.tip','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.uid','\"b824efd1-e9f2-4916-9b35-fc51d38c9020\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.userCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.warning','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.elements.3.width','100'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.name','\"Inhalt\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.uid','\"68594230-9efe-49da-80cf-dc0970f98312\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.fieldLayouts.8b195686-1317-4797-8d9f-8106393d5d59.tabs.0.userCondition','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.handle','\"startseite\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.hasTitleField','true'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.icon','\"\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.name','\"Startseite\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.showSlugField','true'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.showStatusField','true'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.slugTranslationKeyFormat','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.slugTranslationMethod','\"site\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.titleFormat','\"\"'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.titleTranslationKeyFormat','null'),
('entryTypes.0e793c4c-3298-4c14-a50e-fe050eeaee18.titleTranslationMethod','\"site\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.columnSuffix','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.contentColumnType','\"string\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.handle','\"projektbilder\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.instructions','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.name','\"Projektbilder\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.searchable','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowedKinds','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowSelfRelations','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowSubfolders','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.allowUploads','true'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.branchLimit','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.defaultUploadLocationSource','\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.defaultUploadLocationSubpath','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.localizeRelations','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.maintainHierarchy','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.maxRelations','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.minRelations','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.previewMode','\"full\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictedDefaultUploadSubpath','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictedLocationSource','\"volume:44fec1ae-cc09-42b5-b6a8-1c301d066c04\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictedLocationSubpath','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictFiles','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.restrictLocation','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.selectionLabel','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.showSiteMenu','true'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.showUnpermittedFiles','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.showUnpermittedVolumes','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.sources','\"*\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.targetSiteId','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.validateRelatedElements','false'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.settings.viewMode','\"list\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.translationKeyFormat','null'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.translationMethod','\"site\"'),
('fields.12994855-fd13-4d38-8ad9-156bb1960e74.type','\"craft\\\\fields\\\\Assets\"'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.columnSuffix','\"dukgymih\"'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.handle','\"seoBildbeschreibung\"'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.instructions','null'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.name','\"SEO Bildbeschreibung\"'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.searchable','false'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.byteLimit','null'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.charLimit','null'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.code','false'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.initialRows','4'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.multiline','false'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.placeholder','null'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.settings.uiMode','\"normal\"'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.translationKeyFormat','null'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.translationMethod','\"none\"'),
('fields.396abe4e-d4af-4c68-a2fb-7a3bce13f340.type','\"craft\\\\fields\\\\PlainText\"'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.columnSuffix','null'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.handle','\"seoMetaDescription\"'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.instructions','\"Kurzer Text, den Suchmaschinen (wahrscheinlich) unter dem Namen der Seite anzeigt\"'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.name','\"SEO Meta Description\"'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.searchable','false'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.settings.byteLimit','null'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.settings.charLimit','null'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.settings.code','false'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.settings.initialRows','4'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.settings.multiline','false'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.settings.placeholder','null'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.settings.uiMode','\"normal\"'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.translationKeyFormat','null'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.translationMethod','\"none\"'),
('fields.e667dda0-024e-49cf-b865-a2bb0a7c491e.type','\"craft\\\\fields\\\\PlainText\"'),
('fs.lokal.hasUrls','true'),
('fs.lokal.name','\"Lokal\"'),
('fs.lokal.settings.path','\"@assetBasePath\"'),
('fs.lokal.type','\"craft\\\\fs\\\\Local\"'),
('fs.lokal.url','\"@assetBaseUrl\"'),
('graphql.publicToken.enabled','false'),
('graphql.publicToken.expiryDate','null'),
('meta.__names__.0e793c4c-3298-4c14-a50e-fe050eeaee18','\"Startseite\"'),
('meta.__names__.10120e23-43ba-494f-ba6c-7241058df713','\"Startseite\"'),
('meta.__names__.12994855-fd13-4d38-8ad9-156bb1960e74','\"Projektbilder\"'),
('meta.__names__.396abe4e-d4af-4c68-a2fb-7a3bce13f340','\"SEO Bildbeschreibung\"'),
('meta.__names__.44fec1ae-cc09-42b5-b6a8-1c301d066c04','\"Projektbilder\"'),
('meta.__names__.c2146f3a-86c4-4929-ad3b-bfa61123b4c1','\"Simple\"'),
('meta.__names__.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8','\"Profitlich DEV\"'),
('meta.__names__.e667dda0-024e-49cf-b865-a2bb0a7c491e','\"SEO Meta Description\"'),
('meta.__names__.e814380a-f915-44b8-92b3-a767fa94f64a','\"Profitlich DEV\"'),
('plugins.ckeditor.edition','\"standard\"'),
('plugins.ckeditor.enabled','true'),
('plugins.ckeditor.schemaVersion','\"3.0.0.0\"'),
('plugins.content-security-policy.edition','\"standard\"'),
('plugins.content-security-policy.enabled','true'),
('plugins.content-security-policy.schemaVersion','\"1.0.0\"'),
('plugins.obfuscator.edition','\"standard\"'),
('plugins.obfuscator.enabled','true'),
('plugins.obfuscator.schemaVersion','\"1.0.0\"'),
('plugins.password-policy.edition','\"standard\"'),
('plugins.password-policy.enabled','true'),
('plugins.password-policy.schemaVersion','\"1.0.0\"'),
('plugins.password-policy.settings.cases','true'),
('plugins.password-policy.settings.maxLength','160'),
('plugins.password-policy.settings.minLength','20'),
('plugins.password-policy.settings.numbers','true'),
('plugins.password-policy.settings.showStrengthIndicator','true'),
('plugins.password-policy.settings.symbols','true'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.defaultPlacement','\"end\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.enableVersioning','true'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.entryTypes.0','\"0e793c4c-3298-4c14-a50e-fe050eeaee18\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.handle','\"startseite\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.name','\"Startseite\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.0.0','\"label\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.0.1','\"Primäre eintrag Seite\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.1.1','\"{url}\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.2.0','\"refresh\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.previewTargets.0.__assoc__.2.1','\"1\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.propagationMethod','\"all\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.enabledByDefault','true'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.hasUrls','true'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.template','\"startseite/_entry\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.siteSettings.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.uriFormat','\"__home__\"'),
('sections.10120e23-43ba-494f-ba6c-7241058df713.type','\"single\"'),
('siteGroups.e814380a-f915-44b8-92b3-a767fa94f64a.name','\"Profitlich DEV\"'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.baseUrl','\"$PRIMARY_SITE_URL\"'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.enabled','true'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.handle','\"default\"'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.hasUrls','true'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.language','\"de-CH\"'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.name','\"Profitlich DEV\"'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.primary','true'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.siteGroup','\"e814380a-f915-44b8-92b3-a767fa94f64a\"'),
('sites.c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8.sortOrder','1'),
('system.edition','\"pro\"'),
('system.live','true'),
('system.name','\"Profitlich DEV\"'),
('system.schemaVersion','\"5.5.0.0\"'),
('system.timeZone','\"America/Los_Angeles\"'),
('users.allowPublicRegistration','false'),
('users.defaultGroup','null'),
('users.photoSubpath','null'),
('users.photoVolumeUid','null'),
('users.requireEmailVerification','true'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elementCondition','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.autocapitalize','true'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.autocomplete','false'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.autocorrect','true'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.class','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.disabled','false'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.elementCondition','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.id','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.inputType','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.instructions','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.label','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.max','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.min','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.name','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.orientation','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.placeholder','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.readonly','false'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.requirable','false'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.size','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.step','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.tip','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.title','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.uid','\"2124b4b0-5b72-4089-a532-43c097daaf1d\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.userCondition','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.warning','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.0.width','100'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.elementCondition','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.fieldUid','\"396abe4e-d4af-4c68-a2fb-7a3bce13f340\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.instructions','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.label','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.required','true'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.tip','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.uid','\"e1f9bdf7-3e08-4419-8e6f-4bb6c8eebfdd\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.userCondition','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.warning','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.elements.1.width','100'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.name','\"Content\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.uid','\"6b9c9049-f380-4f5d-8db8-2e6fa1a74f1c\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fieldLayouts.413aa4a6-e2a6-4c94-b2e0-08be3e37fc65.tabs.0.userCondition','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.fs','\"lokal\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.handle','\"projektbilder\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.name','\"Projektbilder\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.sortOrder','2'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.titleTranslationKeyFormat','null'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.titleTranslationMethod','\"site\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.transformFs','\"\"'),
('volumes.44fec1ae-cc09-42b5-b6a8-1c301d066c04.transformSubpath','\"transforms\"');
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
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
INSERT INTO `queue` VALUES
(371,'queue','O:39:\"craft\\queue\\jobs\\GenerateImageTransform\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"transformId\";i:34;}','t9n:[\"app\",\"Generating image transform\"]',1733870322,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL),
(372,'queue','O:39:\"craft\\queue\\jobs\\GenerateImageTransform\":4:{s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;s:11:\"transformId\";i:35;}','t9n:[\"app\",\"Generating image transform\"]',1733870322,300,0,2048,NULL,NULL,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recoverycodes`
--

DROP TABLE IF EXISTS `recoverycodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recoverycodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `recoveryCodes` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mrtohrgjzbbyhoxptvtipgrmzzwtfemkxjyb` (`userId`),
  CONSTRAINT `fk_mrtohrgjzbbyhoxptvtipgrmzzwtfemkxjyb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recoverycodes`
--

LOCK TABLES `recoverycodes` WRITE;
/*!40000 ALTER TABLE `recoverycodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `recoverycodes` ENABLE KEYS */;
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
  CONSTRAINT `fk_pbeizbkjushnhdfswbumvghrnmqjaabjvetp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES
(2,10,2,NULL,50,1,'2022-10-03 21:37:42','2022-10-03 21:37:42','56559761-0e18-46a1-bafd-65a3a132b883'),
(3,10,52,NULL,50,1,'2022-10-03 21:37:42','2022-10-03 21:37:42','b23fd353-b7c6-4ff0-a39f-1d3b3345cb45'),
(4,10,53,NULL,50,1,'2022-10-04 09:51:59','2022-10-04 09:51:59','ba459030-af81-45e7-bdc0-bfd0214166a6'),
(5,10,54,NULL,50,1,'2022-10-04 09:55:54','2022-10-04 09:55:54','c60937ab-a1d2-43fa-a1ac-bb5f6c163edb'),
(6,10,55,NULL,50,1,'2022-10-04 15:30:56','2022-10-04 15:30:56','442f4e1a-e473-419c-a102-b8c907562965'),
(9,10,57,NULL,50,1,'2022-10-04 15:45:57','2022-10-04 15:45:57','ad549fdf-e160-4062-99e6-57c223806cfc'),
(10,10,58,NULL,50,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','e9bc8cc3-3d05-4bb1-bd90-eb6a92914118'),
(11,10,59,NULL,50,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','cfca88d8-d833-4a6b-8579-ee26d61af08e'),
(12,10,60,NULL,50,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','f1e5b893-6c00-4d4a-b7b7-75c7de66a5c7'),
(13,10,61,NULL,50,1,'2024-07-17 16:33:23','2024-07-17 16:33:23','0ef54b5c-d7c0-45ee-99c8-c00b11dcfec4'),
(14,10,62,NULL,50,1,'2024-07-17 17:02:03','2024-07-17 17:02:03','4ae90cc6-e550-421b-9974-75d4b367de65'),
(15,10,63,NULL,50,1,'2024-07-17 17:05:05','2024-07-17 17:05:05','21d3ca0a-7a49-46b0-b786-8a165d869030'),
(17,10,65,NULL,50,1,'2024-10-06 07:59:03','2024-10-06 07:59:03','55222149-92a3-4e4a-91b0-e2a378028fb3'),
(19,10,67,NULL,50,1,'2024-11-02 09:12:42','2024-11-02 09:12:42','27664115-9abe-4303-ab92-5f92d22f1651'),
(20,10,68,NULL,50,1,'2024-11-02 09:12:51','2024-11-02 09:12:51','6c6533ff-de99-4c44-a581-81da55f07932'),
(22,10,70,NULL,50,1,'2024-11-02 09:15:27','2024-11-02 09:15:27','b788de4e-e4e6-4f63-95ed-871a5fa6fe93'),
(24,10,72,NULL,50,1,'2024-11-02 09:16:40','2024-11-02 09:16:40','9f6f35ce-96a4-48d0-81f8-c48f27a24755');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
INSERT INTO `resourcepaths` VALUES
('105651f2','@craft/web/assets/updater/dist'),
('119f7c1a','@craft/web/assets/elementresizedetector/dist'),
('12111b52','@craft/web/assets/datepickeri18n/dist'),
('1246b350','@craft/web/assets/cp/dist'),
('12c7352f','@craft/web/assets/datepickeri18n/dist'),
('13231297','@craft/web/assets/tailwindreset/dist'),
('136939d1','@craft/web/assets/datepickeri18n/dist'),
('1436a8b5','@craft/web/assets/selectize/dist'),
('147f63f2','@bower/jquery/dist'),
('15458015','@spicyweb/embeddedassets/assets/main/dist'),
('159d996d','@craft/web/assets/iframeresizer/dist'),
('15cf6f90','@craft/web/assets/datepickeri18n/dist'),
('16082f4','@craft/web/assets/axios/dist'),
('165e31b6','@craft/web/assets/feed/dist'),
('1687fc70','@craft/web/assets/edittransform/dist'),
('16881fcb','@craft/web/assets/feed/dist'),
('168ca9a6','@craft/web/assets/utilities/dist'),
('187e0afd','@craft/web/assets/cp/dist'),
('18f5b2a1','@craft/web/assets/velocity/dist'),
('191bab3a','@craft/web/assets/tailwindreset/dist'),
('195bbe5f','@craft/web/assets/velocity/dist'),
('198d9022','@craft/web/assets/velocity/dist'),
('1b973935','@craft/web/assets/jquerytouchevents/dist'),
('1bc4e657','@craft/web/assets/jquerypayment/dist'),
('1c1a9295','@craft/web/assets/jquerypayment/dist'),
('1c494df7','@craft/web/assets/jquerytouchevents/dist'),
('1c9f638a','@craft/web/assets/jquerytouchevents/dist'),
('1caa4a9c','@cloudgrayau/utils/resources'),
('1cccbce8','@craft/web/assets/jquerypayment/dist'),
('1d316f74','@craft/web/assets/jquerytouchevents/dist'),
('1d62b016','@craft/web/assets/jquerypayment/dist'),
('1e0e1118','@craft/web/assets/selectize/dist'),
('1e53e4e0','@craft/web/assets/velocity/dist'),
('1e727351','@craft/web/assets/fileupload/dist'),
('1e98f3e4','@craft/web/assets/jqueryui/dist'),
('1eb76f02','@craft/web/assets/updateswidget/dist'),
('1efc90da','@craft/web/assets/d3/dist'),
('200d2d6c','@craft/web/assets/recententries/dist'),
('200d36c','@craft/web/assets/updateswidget/dist'),
('2021f168','@craft/web/assets/plugins/dist'),
('2041484b','@craft/web/assets/picturefill/dist'),
('20976636','@craft/web/assets/picturefill/dist'),
('21396ac8','@craft/web/assets/picturefill/dist'),
('223df65c','@craft/web/assets/fileupload/dist'),
('244f045b','@craft/web/assets/axios/dist'),
('24b2cb4','@craft/web/assets/d3/dist'),
('26a05d25','@craft/web/assets/vue/dist'),
('2764aa1b','@craft/web/assets/d3/dist'),
('279f3c89','@craft/web/assets/picturefill/dist'),
('29037d3','@craft/web/assets/craftsupport/dist'),
('294b0cf2','@craft/web/assets/craftsupport/dist'),
('299d228f','@craft/web/assets/craftsupport/dist'),
('2a0fefea','@craft/web/assets/updates/dist'),
('2a81d7c8','@craft/web/assets/xregexp/dist'),
('2b2fdb36','@craft/web/assets/xregexp/dist'),
('2bf9f54b','@craft/web/assets/xregexp/dist'),
('2c05a3ac','@craft/web/assets/iframeresizer/dist'),
('2c278189','@craft/web/assets/xregexp/dist'),
('2e000198','@craft/web/assets/generalsettings/dist'),
('2e14088f','@craft/web/assets/garnish/dist'),
('2e77bdf6','@craft/web/assets/axios/dist'),
('2ec34228','@spicyweb/embeddedassets/assets/main/dist'),
('2f9135b1','@craft/web/assets/dashboard/dist'),
('310063af','@craft/web/assets/dashboard/dist'),
('31192e1a','@craft/web/assets/selectize/dist'),
('3129cae','@craft/web/assets/iframeresizer/dist'),
('3280857e','@craft/web/assets/velocity/dist'),
('3341af09','@craft/web/assets/elementresizedetector/dist'),
('360c9438','@craft/web/assets/tailwindreset/dist'),
('36a1b0e1','@bower/jquery/dist'),
('371787c9','@craft/web/assets/jquerypayment/dist'),
('374458ab','@craft/web/assets/jquerytouchevents/dist'),
('3767c8f8','@craftpulse/passwordpolicy/assetbundles/PasswordPolicy/dist'),
('38f8b835','@craft/web/assets/axios/dist'),
('391c0e0e','@craft/web/assets/datepickeri18n/dist'),
('3c4620f7','@craft/web/assets/jqueryui/dist'),
('3cba9102','@craft/web/assets/recententries/dist'),
('3d518c52','@craft/web/assets/cp/dist'),
('3d850a97','@craft/web/assets/feed/dist'),
('3f9a4b70','@craft/web/assets/admintable/dist'),
('40363324','@craft/web/assets/selectize/dist'),
('4053a94b','@craft/web/assets/jqueryui/dist'),
('40858736','@craft/web/assets/jqueryui/dist'),
('412b8bc8','@craft/web/assets/jqueryui/dist'),
('42821758','@craft/web/assets/jquerytouchevents/dist'),
('42d1c83a','@craft/web/assets/jquerypayment/dist'),
('44c62c5c','@craft/web/assets/dashboard/dist'),
('47238906','@craft/web/assets/tailwindreset/dist'),
('4746ca8d','@craft/web/assets/velocity/dist'),
('478ddd89','@craft/web/assets/jqueryui/dist'),
('48434564','@craft/web/assets/feed/dist'),
('488a5277','@craft/web/assets/elementresizedetector/dist'),
('4a621720','@bower/jquery/dist'),
('4ab4395d','@bower/jquery/dist'),
('4bcc1bde','@bower/jquery/dist'),
('4c7e916c','@craft/web/assets/cp/dist'),
('4c9b693','@craft/web/assets/cp/dist'),
('4cda41fd','@craft/web/assets/datepickeri18n/dist'),
('4d6a4d9f','@bower/jquery/dist'),
('4df744c8','@craft/web/assets/vue/dist'),
('4e111867','@craft/web/assets/fabric/dist'),
('4e2c0436','@craft/web/assets/elementresizedetector/dist'),
('4f5426b5','@craft/web/assets/elementresizedetector/dist'),
('51c41294','@craft/web/assets/updates/dist'),
('524b17e3','@craft/web/assets/datepickeri18n/dist'),
('52a6a409','@craft/web/assets/fabric/dist'),
('557672f4','@craft/web/assets/prismjs/dist'),
('561a6656','@craft/web/assets/updates/dist'),
('564bb725','@craft/web/assets/d3/dist'),
('56cc482b','@craft/web/assets/updates/dist'),
('56d2137a','@craft/web/assets/feed/dist'),
('576244d5','@craft/web/assets/updates/dist'),
('57ec7cf7','@craft/web/assets/xregexp/dist'),
('589e1da4','@craft/web/assets/fabric/dist'),
('59d79c93','@craft/web/assets/velocity/dist'),
('59f60b22','@craft/web/assets/fileupload/dist'),
('5b436ba4','@craft/web/assets/fieldsettings/dist'),
('5c134146','@craft/web/assets/jquerytouchevents/dist'),
('5c409e24','@craft/web/assets/jquerypayment/dist'),
('5c54c1f7','@craft/web/assets/picturefill/dist'),
('5d2abe92','@craft/web/assets/iframeresizer/dist'),
('5e287fe0','@craft/web/assets/fileupload/dist'),
('5e3b8e59','@craft/web/assets/utilities/dist'),
('5efe519d','@craft/web/assets/fileupload/dist'),
('5f2f1ca6','@craft/web/assets/generalsettings/dist'),
('5f3b15b1','@craft/web/assets/garnish/dist'),
('5f505d63','@craft/web/assets/fileupload/dist'),
('600f1b29','@craft/web/assets/jquerypayment/dist'),
('601b44fa','@craft/web/assets/picturefill/dist'),
('605cc44b','@craft/web/assets/jquerytouchevents/dist'),
('6083cfe6','@spicyweb/embeddedassets/assets/main/dist'),
('61b92c01','@bower/jquery/dist'),
('645933e9','@craft/web/assets/elementresizedetector/dist'),
('6598199e','@craft/web/assets/velocity/dist'),
('66a32f70','@craft/web/assets/garnish/dist'),
('67a3b498','@craft/web/assets/utilities/dist'),
('69c72e3e','@craft/web/assets/craftsupport/dist'),
('6a63f98','@craft/web/assets/fabric/dist'),
('6b3d62c7','@craft/web/assets/conditionbuilder/dist'),
('6b5ebc17','@craft/web/assets/jqueryui/dist'),
('6ba3f9fa','@craft/web/assets/xregexp/dist'),
('6e0492ee','@craft/web/assets/datepickeri18n/dist'),
('6f1d177d','@craft/web/assets/dashboard/dist'),
('6fcb3900','@craft/web/assets/dashboard/dist'),
('702c2ab3','@craft/web/assets/garnish/dist'),
('704f9fca','@craft/web/assets/axios/dist'),
('74cc3a73','@craft/web/assets/edituser/dist'),
('75256abc','@craft/web/assets/fileupload/dist'),
('7532afe4','@craft/web/assets/xregexp/dist'),
('77567820','@craft/web/assets/craftsupport/dist'),
('778922a6','@craft/web/assets/fabric/dist'),
('7a14931e','@craft/web/assets/garnish/dist'),
('7b1dbb8f','@craft/web/assets/htmx/dist'),
('7e8a12e4','@craft/web/assets/picturefill/dist'),
('7ead49d5','@craft/web/assets/prismjs/dist'),
('805cf94c','@craft/web/assets/fabric/dist'),
('819c4f93','@craft/web/assets/vue/dist'),
('8297a0d6','@craft/web/assets/datepickeri18n/dist'),
('82c5562b','@craft/web/assets/iframeresizer/dist'),
('82e7740e','@craft/web/assets/xregexp/dist'),
('8372f7df','@craft/web/assets/fieldsettings/dist'),
('837316ed','@craft/web/assets/axios/dist'),
('837852a2','@craftpulse/passwordpolicy/assetbundles/PasswordPolicy/dist'),
('83a4d9a2','@craft/web/assets/fieldsettings/dist'),
('8463006a','@craft/web/assets/iframeresizer/dist'),
('851b22e9','@craft/web/assets/iframeresizer/dist'),
('85cd0c94','@craft/web/assets/iframeresizer/dist'),
('8619e39b','@craft/web/assets/fileupload/dist'),
('8739519','@craft/web/assets/d3/dist'),
('88114db','@craft/web/assets/selectize/dist'),
('88851407','@craft/web/assets/login/dist'),
('890b2ba6','@craft/web/assets/velocity/dist'),
('895fc90e','@craft/web/assets/picturefill/dist'),
('899676f7','@craft/ckeditor/web/assets/ckeditor/dist'),
('89a45f9c','@craft/web/assets/d3/dist'),
('8a301d48','@craft/web/assets/garnish/dist'),
('8a85073','@craft/ckeditor/web/assets/ckeditor/dist'),
('8c9c2911','@craft/web/assets/jquerypayment/dist'),
('8ccff673','@craft/web/assets/jquerytouchevents/dist'),
('8d13cf9','@craft/web/assets/updates/dist'),
('8d91c0f2','@craft/web/assets/prismjs/dist'),
('8e2bfa2d','@craft/web/assets/updates/dist'),
('8e31d486','@craft/web/assets/updateswidget/dist'),
('8e7a2b5e','@craft/web/assets/d3/dist'),
('8eac0523','@craft/web/assets/d3/dist'),
('8ee7396c','@craft/web/assets/utilities/dist'),
('8ee7fafb','@craft/web/assets/updateswidget/dist'),
('8f0209dd','@craft/web/assets/d3/dist'),
('8f09f716','@spicyweb/embeddedassets/resources'),
('902b957f','@craft/web/assets/jquerypayment/dist'),
('903fab4f','@craft/web/assets/sites/dist'),
('90766f72','@craft/web/assets/utilities/dist'),
('90784a1d','@craft/web/assets/jquerytouchevents/dist'),
('9245c5eb','@craft/web/assets/updater/dist'),
('9285a526','@bower/jquery/dist'),
('92a2503','@craft/web/assets/iframeresizer/dist'),
('939179d5','@craft/web/assets/cp/dist'),
('9418a515','@craft/web/assets/datepickeri18n/dist'),
('944f0d17','@craft/web/assets/cp/dist'),
('9499236a','@craft/web/assets/cp/dist'),
('95372f94','@craft/web/assets/cp/dist'),
('95bc97c8','@craft/web/assets/velocity/dist'),
('96b4be8c','@craft/web/assets/focusvisible/dist'),
('96d1b769','@spicyweb/embeddedassets/resources'),
('9807af5f','@craft/web/assets/selectize/dist'),
('98623530','@craft/web/assets/jqueryui/dist'),
('98cc61bf','@craft/web/assets/tailwindreset/dist'),
('98d18122','@craft/web/assets/selectize/dist'),
('997f8ddc','@craft/web/assets/selectize/dist'),
('9a132cd2','@craft/web/assets/jquerypayment/dist'),
('9a40f3b0','@craft/web/assets/jquerytouchevents/dist'),
('9a5fa','@craft/web/assets/jqueryui/dist'),
('9ab91821','@craft/web/assets/feed/dist'),
('9b8683b4','@craft/web/assets/recententries/dist'),
('9d343d6a','@craft/web/assets/pluginstore/dist'),
('9e201cb8','@craft/web/assets/datepickeri18n/dist'),
('9e6a37fe','@craft/web/assets/tailwindreset/dist'),
('9ecdaf52','@craft/web/assets/fabric/dist'),
('9f12157d','@craft/web/assets/tailwindreset/dist'),
('9f842e65','@craft/web/assets/velocity/dist'),
('9fc43b00','@craft/web/assets/tailwindreset/dist'),
('9fd9db9d','@craft/web/assets/selectize/dist'),
('a2326571','@craft/web/assets/plugins/dist'),
('a24d4dd6','@craft/ckeditor/web/assets/ckeditor/dist'),
('a2822a5f','@craft/web/assets/fabric/dist'),
('a32c27f4','@craft/web/assets/htmx/dist'),
('a4b3c93c','@craft/web/assets/vue/dist'),
('a53cc1da','@craft/web/assets/updateswidget/dist'),
('a54c6b7','@craft/web/assets/plugins/dist'),
('a5773e02','@craft/web/assets/d3/dist'),
('a5ac2565','@craft/web/assets/craftsupport/dist'),
('a648f60c','@craft/web/assets/picturefill/dist'),
('a733cbb','@craft/web/assets/vue/dist'),
('a7c8f2a1','@craft/web/assets/xregexp/dist'),
('a87e03b1','@craft/web/assets/axios/dist'),
('a8a82dcc','@craft/web/assets/axios/dist'),
('a8eece5b','@craft/web/assets/garnish/dist'),
('a9062132','@craft/web/assets/axios/dist'),
('aa5511c8','@nystudio107/codeeditor/web/assets/dist'),
('ac704fa1','@craft/web/assets/picturefill/dist'),
('adf04b0c','@craft/web/assets/xregexp/dist'),
('ae1637b5','@craft/web/assets/iframeresizer/dist'),
('aee35ec','@bower/jquery/dist'),
('afa07773','@craft/web/assets/axios/dist'),
('b05db895','@craft/web/assets/recententries/dist'),
('b08b96e8','@craft/web/assets/recententries/dist'),
('b0931167','@craft/web/assets/velocity/dist'),
('b0c7f3cf','@craft/web/assets/picturefill/dist'),
('b1b858c2','@craftpulse/passwordpolicy/assetbundles/PasswordPolicy/dist'),
('b2a8bc61','@craft/web/assets/utilities/dist'),
('b30aba03','@craft/web/assets/selectize/dist'),
('b30cfebc','@craft/web/assets/conditionbuilder/dist'),
('b37c2e82','@spicyweb/embeddedassets/resources'),
('b41f0021','@craft/web/assets/tailwindreset/dist'),
('b44c4415','@spicyweb/embeddedassets/resources'),
('b4c5d17','@craft/web/assets/picturefill/dist'),
('b50413d0','@craft/web/assets/jquerypayment/dist'),
('b557ccb2','@craft/web/assets/jquerytouchevents/dist'),
('b6392836','@craft/web/assets/pluginstore/dist'),
('b67f9845','@craft/web/assets/garnish/dist'),
('b6edbc3','@spicyweb/embeddedassets/assets/main/dist'),
('b91b990b','@craft/web/assets/craftsupport/dist'),
('b948d0b7','@craft/web/assets/updater/dist'),
('bb0f9a17','@craft/web/assets/datepickeri18n/dist'),
('bb7f4ecf','@craft/web/assets/xregexp/dist'),
('bc598eb0','@craft/ckeditor/web/assets/ckeconfig/dist'),
('bf42184b','@craft/web/assets/cp/dist'),
('c1bc0c59','@craft/web/assets/velocity/dist'),
('c1d94fd2','@craft/web/assets/tailwindreset/dist'),
('c40ecd47','@percipiolondon/passwordpolicy/assetbundles/PasswordPolicy/dist'),
('c42b0eee','@craft/web/assets/jquerypayment/dist'),
('c478d18c','@craft/web/assets/jquerytouchevents/dist'),
('c526e70d','@craft/web/assets/prismjs/dist'),
('c5412e58','@craft/web/assets/iframeresizer/dist'),
('c65a170c','@craft/web/assets/jqueryui/dist'),
('c6853eb7','@bower/jquery/dist'),
('c69cddd2','@craft/web/assets/updates/dist'),
('c6ccf5f0','@craft/web/assets/selectize/dist'),
('c7448c6c','@craft/web/assets/generalsettings/dist'),
('c963411f','@craft/web/assets/utilities/dist'),
('ca208729','@craft/web/assets/datepickeri18n/dist'),
('ca8457b8','@craft/web/assets/cp/dist'),
('cc62aea1','@craft/web/assets/jqueryui/dist'),
('cca6c257','@craft/web/assets/admintable/dist'),
('ccbd871a','@bower/jquery/dist'),
('ce2027ef','@craft/web/assets/d3/dist'),
('ce6b1ba0','@craft/web/assets/utilities/dist'),
('ce6bd837','@craft/web/assets/updateswidget/dist'),
('ceaec464','@craft/web/assets/fileupload/dist'),
('cebd35dd','@craft/web/assets/utilities/dist'),
('cfc5175e','@craft/web/assets/utilities/dist'),
('d065a7fe','@craft/web/assets/sites/dist'),
('d0b171f1','@craft/web/assets/d3/dist'),
('d0d512cf','@craft/web/assets/jqueryui/dist'),
('d0fa8e29','@craft/web/assets/updateswidget/dist'),
('d219780a','@craft/web/assets/fileupload/dist'),
('d23965b','@craft/web/assets/editsection/dist'),
('d2ee59e8','@percipiolondon/passwordpolicy/assetbundles/PasswordPolicy/dist'),
('d31d784f','@craft/web/assets/plugins/dist'),
('d41501a6','@craft/web/assets/cp/dist'),
('d46b8a0d','@craft/web/assets/axios/dist'),
('d59cd402','@craft/web/assets/vue/dist'),
('d5c4245d','@craft/web/assets/editsection/dist'),
('d6eeb23d','@craft/web/assets/focusvisible/dist'),
('d7b6604','@craft/web/assets/vue/dist'),
('d821c1a7','@craft/web/assets/fileupload/dist'),
('d85da3ee','@craft/web/assets/selectize/dist'),
('d949d721','@craft/web/assets/fabric/dist'),
('da3282d9','@bower/jquery/dist'),
('dad4879','@craft/web/assets/vue/dist'),
('dbd07846','@craft/web/assets/iframeresizer/dist'),
('dd2881a8','@craft/web/assets/garnish/dist'),
('dd6e31db','@craft/web/assets/pluginstore/dist'),
('de418d9e','@craft/web/assets/fabric/dist'),
('de97a3e3','@craft/web/assets/fabric/dist'),
('df4819cc','@craft/web/assets/tailwindreset/dist'),
('df5b826','@craft/web/assets/editsection/dist'),
('dfef8160','@craft/web/assets/fabric/dist'),
('e075a3c9','@craft/web/assets/admintable/dist'),
('e212a94f','@craft/web/assets/focalpoint/dist'),
('e3079cc1','@craft/web/assets/tailwindreset/dist'),
('e3254f','@craft/web/assets/fileupload/dist'),
('e3aab818','@bower/jquery/dist'),
('e3fa3eea','@craft/web/assets/dashboard/dist'),
('e41226e3','@craft/web/assets/selectize/dist'),
('e64aa7f0','@craft/web/assets/elementresizedetector/dist'),
('e77df976','@craft/web/assets/admintable/dist'),
('e8240f00','@craft/web/assets/axios/dist'),
('e85a84ab','@craft/web/assets/cp/dist'),
('e94d280e','@craft/web/assets/jqueryui/dist'),
('eaa13730','@craft/web/assets/focusvisible/dist'),
('ee40cc47','@craft/web/assets/recententries/dist'),
('efa52c10','@craftpulse/passwordpolicy/assetbundles/PasswordPolicy/dist'),
('f0d19a59','@craft/web/assets/recententries/dist'),
('f0e2a04','@craft/web/assets/elementresizedetector/dist'),
('f1fbe036','@craft/web/assets/garnish/dist'),
('f26fa2e2','@craft/web/assets/d3/dist'),
('f3c86930','@craft/web/assets/xregexp/dist'),
('f4e017','@craft/web/assets/xregexp/dist'),
('f59ab6bf','@craft/web/assets/fabric/dist'),
('f62594f4','@craft/web/assets/garnish/dist'),
('f6b5591e','@craft/web/assets/axios/dist'),
('f6f3ba89','@craft/web/assets/garnish/dist'),
('f736fea5','@craft/web/assets/fileupload/dist'),
('f75db677','@craft/web/assets/garnish/dist'),
('f870d430','@craft/web/assets/picturefill/dist'),
('f90eab55','@craft/web/assets/iframeresizer/dist'),
('f912dc06','@craft/web/assets/updater/dist'),
('f94aef9','@craft/web/assets/tailwindreset/dist'),
('ff04e713','@craft/web/assets/updates/dist'),
('ff4d8284','@craft/web/assets/dashboard/dist');
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
INSERT INTO `revisions` VALUES
(1,2,1,1,NULL),
(2,2,1,2,NULL),
(3,2,1,3,NULL),
(4,2,1,4,NULL),
(5,2,1,5,'Verwende «Entwurf 1»'),
(6,2,1,6,NULL),
(7,2,1,7,NULL),
(8,2,1,8,NULL),
(9,2,1,9,NULL),
(10,2,1,10,'Verwende «Entwurf 1»'),
(11,2,1,11,'Wiederhergestellter Inhalt aus Revision 9.'),
(12,2,1,12,NULL),
(13,2,1,13,'Verwende «Entwurf 1»'),
(14,2,1,14,''),
(15,2,1,15,NULL),
(16,2,1,16,'Verwende «Entwurf 1»'),
(17,2,NULL,17,NULL),
(18,2,NULL,18,NULL),
(19,2,1,19,NULL),
(20,2,1,20,'Verwende «Entwurf 1»'),
(21,2,1,21,NULL),
(22,2,1,22,''),
(23,2,NULL,23,NULL),
(24,2,NULL,24,NULL),
(25,2,1,25,NULL),
(26,2,1,26,NULL),
(27,2,1,27,NULL),
(28,2,1,28,'Applied “Draft 1”'),
(29,2,1,29,''),
(30,2,1,30,''),
(31,2,1,31,''),
(32,2,1,32,'Applied “Draft 1”'),
(33,2,NULL,33,NULL),
(34,2,NULL,34,NULL),
(35,2,NULL,35,NULL),
(36,2,NULL,36,NULL),
(37,2,1,37,''),
(38,2,1,38,''),
(39,2,1,39,'Applied “Draft 1”'),
(40,2,1,40,'Applied “Draft 1”'),
(41,2,1,41,''),
(42,2,1,42,'Applied “Draft 1”'),
(43,2,1,43,'Applied “Draft 1”');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
INSERT INTO `searchindex` VALUES
(1,'email',0,1,' dev profitlich ch '),
(1,'firstname',0,1,''),
(1,'fullname',0,1,''),
(1,'lastname',0,1,''),
(1,'slug',0,1,''),
(1,'username',0,1,' pro dev admin '),
(2,'slug',0,1,' startseite '),
(2,'title',0,1,' reiner zufall '),
(34,'extension',0,1,' jpg '),
(34,'filename',0,1,' asset633af76982e267 12846520 jpg '),
(34,'kind',0,1,' image '),
(34,'slug',0,1,''),
(34,'title',0,1,' asset633af76982e267 12846520 '),
(35,'extension',0,1,' jpg '),
(35,'filename',0,1,' asset633af7a5885197 88769114 jpg '),
(35,'kind',0,1,' image '),
(35,'slug',0,1,''),
(35,'title',0,1,' asset633af7a5885197 88769114 '),
(36,'extension',0,1,' jpg '),
(36,'filename',0,1,' asset633af7bce79232 95857633 jpg '),
(36,'kind',0,1,' image '),
(36,'slug',0,1,''),
(36,'title',0,1,' asset633af7bce79232 95857633 '),
(37,'extension',0,1,' jpg '),
(37,'filename',0,1,' asset633af806260545 50558061 jpg '),
(37,'kind',0,1,' image '),
(37,'slug',0,1,''),
(37,'title',0,1,' asset633af806260545 50558061 '),
(38,'extension',0,1,' jpg '),
(38,'filename',0,1,' asset633afa46ce7523 62900012 jpg '),
(38,'kind',0,1,' image '),
(38,'slug',0,1,''),
(38,'title',0,1,' asset633afa46ce7523 62900012 '),
(39,'extension',0,1,' jpg '),
(39,'filename',0,1,' asset633afc5d72c2f9 98811315 jpg '),
(39,'kind',0,1,' image '),
(39,'slug',0,1,''),
(39,'title',0,1,' asset633afc5d72c2f9 98811315 '),
(40,'extension',0,1,' jpg '),
(40,'filename',0,1,' asset633b00237c7d68 06510024 jpg '),
(40,'kind',0,1,' image '),
(40,'slug',0,1,''),
(40,'title',0,1,' asset633b00237c7d68 06510024 '),
(43,'extension',0,1,' jpg '),
(43,'filename',0,1,' asset633b172abcc216 55844537 jpg '),
(43,'kind',0,1,' image '),
(43,'slug',0,1,''),
(43,'title',0,1,' asset633b172abcc216 55844537 '),
(44,'extension',0,1,' jpg '),
(44,'filename',0,1,' asset633b182e4157c9 63276740 jpg '),
(44,'kind',0,1,' image '),
(44,'slug',0,1,''),
(44,'title',0,1,' asset633b182e4157c9 63276740 '),
(45,'extension',0,1,' jpg '),
(45,'filename',0,1,' asset633b183a643535 13439729 jpg '),
(45,'kind',0,1,' image '),
(45,'slug',0,1,''),
(45,'title',0,1,' asset633b183a643535 13439729 '),
(50,'extension',0,1,' jpg '),
(50,'filename',0,1,' ts paralax 191 ts a jpg '),
(50,'kind',0,1,' image '),
(50,'slug',0,1,''),
(50,'title',0,1,' ts paralax 191 ts a ');
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
  `maxAuthors` smallint(6) unsigned NOT NULL DEFAULT 1,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`previewTargets`)),
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES
(1,NULL,'Startseite','startseite','single',1,1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2022-09-28 12:24:11','2022-09-28 12:24:30',NULL,'10120e23-43ba-494f-ba6c-7241058df713');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections_entrytypes`
--

DROP TABLE IF EXISTS `sections_entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_entrytypes` (
  `sectionId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`sectionId`,`typeId`),
  KEY `fk_ffijdvqmnvnxyrwrxcktskvkvntkkxytandx` (`typeId`),
  CONSTRAINT `fk_ffijdvqmnvnxyrwrxcktskvkvntkkxytandx` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lpbrzaxkbvosxbgyqclvoeqiwhqkkhezkxmc` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_entrytypes`
--

LOCK TABLES `sections_entrytypes` WRITE;
/*!40000 ALTER TABLE `sections_entrytypes` DISABLE KEYS */;
INSERT INTO `sections_entrytypes` VALUES
(1,1,1);
/*!40000 ALTER TABLE `sections_entrytypes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
INSERT INTO `sections_sites` VALUES
(1,1,1,1,'__home__','startseite/_entry',1,'2022-09-28 12:24:11','2022-09-28 12:24:30','e66ee714-d528-4c82-a060-4de0376029ac');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES
(1,1,'NSf1Pro1GkxshNDC_BuVT4gmAx6UTGEvSfW3_5vBNaDe0oDESUMmcvkIvMMw4szKPkWU5tZ-3xEI2EPU0mgzGHXBRbMkpXBcsl8N','2022-09-28 12:12:59','2022-09-28 12:27:25','926eac7c-fc35-4f0e-bf14-e25348be794b'),
(2,1,'19MBL7O79-1xspw7XqnXAjTVYHNwMnSaitOC1IuPBKT6V2s4wuKd5tLQuINi8z2PGrOvr3Em8HV9anfkwXt3waeDLe9rglkWLy9o','2022-09-28 12:56:15','2022-09-28 13:34:04','ae1b911f-78bc-42fd-9208-207797f05743'),
(3,1,'Y9OFts-mfN1BArreeSMNARZS8OxQIQKhpv7YQ1FQy0MchK54RRhjUguy6j2CVRNSK9gJH677oBG2xgQihLjjcRqtQKb7Vce7lDny','2022-09-29 09:53:10','2022-09-29 10:31:06','60048f38-2e74-4359-9b98-96332fa7eacf'),
(13,1,'VcIWAI0VoO_nU1Bp_aH6uOAZsUAmT4DzuMB4X1_zHMIie58cNKaRt_CLlg7D-jMrtM25dF9JhQPbSHpWFJAHfdzjSrIeRmJZ_w2T','2024-07-17 16:48:46','2024-07-17 16:53:20','6eac660e-70ae-4de3-9832-f73349efa42e'),
(14,1,'ckFEnPFH_C04J7AQhvADaiT06hFEli7OGEBhe_wal_YUH3sLshKuieNAsnEkofOEF5ETAIl10KEFRcov050kaUdsolDm_aokqInx','2024-07-17 16:53:20','2024-07-17 16:54:29','f5f36d5a-fd2b-4fbe-8d6c-d45acf88c8c6'),
(15,1,'zOE1VNU71fNXAmnI3j5ftcZwqh2wQpmVrcq_itm4Wnos0cyd0R138JLqq7VuNP0tc7eQbgk56Q3NupQmrJ7uipL_fBO9hxxUhdjW','2024-07-17 16:56:44','2024-07-17 17:06:39','71882460-0747-42c2-8a29-4c89a19caf37'),
(16,1,'UBm-r4Gp42JuI9Zp0M6Mriww18feHdeGtHg-Vieuf2oKp7L9AWoYQDBETUrKzxpEuX0BM0EcVUGBOGBd4kDXOeA3UEWNW-Ftg28L','2024-07-18 10:35:36','2024-07-18 10:43:28','2b43427b-202d-46f7-acd1-5f4e795d0eda'),
(19,1,'bCmzgGdMwx38MY7lFat9pC4vKwg-IedET1qu0x-qA9QdcCioALkD_yWk2nKnIQVV2jphqlqXVckOSTZCq9Ka2clQ8H5il186PbP-','2024-10-06 07:56:00','2024-10-06 09:07:29','63cfb4b4-16f9-4cbf-82a9-976f2670150d'),
(20,1,'huZlzf7QZ2GNZh7QKWT0vgHQfp5d-KCQ1oRF1k2ci19uew_43F0tIzzcbtFR_EVbuKn_tlZDU7L6e7r2GSIyi_VWHOcH834ScArr','2024-10-06 09:07:29','2024-10-06 09:11:01','c30972e5-7098-42cf-869e-fce090414b93'),
(23,1,'Cn_LHLddehUvOZhzRJk3O0leksp_a-qEguig1mtKcvv3G-pppffJCXHzHVZW2NHpryZmulE_yfyafPKNSciKKKWtcdH3Hmg8yV00','2024-12-10 22:37:30','2024-12-10 22:39:43','a3d398fe-bc7b-4057-9d27-45179ea05c9c');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
INSERT INTO `sitegroups` VALUES
(1,'Profitlich DEV','2022-09-28 08:08:17','2022-09-28 08:08:17',NULL,'e814380a-f915-44b8-92b3-a767fa94f64a');
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
  `language` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES
(1,1,1,'true','Profitlich DEV','default','de-CH',1,'$PRIMARY_SITE_URL',1,'2022-09-28 08:08:17','2022-09-28 08:08:17',NULL,'c81f04dd-a4dc-4e6f-a97b-5ce6004b8cf8');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sso_identities`
--

DROP TABLE IF EXISTS `sso_identities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sso_identities` (
  `provider` varchar(255) NOT NULL,
  `identityId` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`provider`,`identityId`,`userId`),
  KEY `fk_mnpcwylkmxgllmorfjzdzziryyhoknurpscg` (`userId`),
  CONSTRAINT `fk_mnpcwylkmxgllmorfjzdzziryyhoknurpscg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sso_identities`
--

LOCK TABLES `sso_identities` WRITE;
/*!40000 ALTER TABLE `sso_identities` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso_identities` ENABLE KEYS */;
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
  CONSTRAINT `fk_tvvgrfsvfpxboulpunjuraaprvpvrzthyauo` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `preferences` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferences`)),
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_mblksozgcoouhibqtuzzggzmguqmdpsxwxjb` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
INSERT INTO `userpreferences` VALUES
(1,'{\"language\":\"en-GB\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,NULL,1,0,0,0,1,'pro-dev-admin','',NULL,NULL,'dev@profitlich.ch','$2y$13$oBBJ1H9/Py3nN6/0EVDZd.FEgoTk4mQLApI5iqR2ISdlY1Af5j7f2','2024-12-10 22:37:30',NULL,NULL,NULL,'2022-09-28 12:08:05',NULL,1,NULL,NULL,NULL,0,'2022-09-28 08:08:18','2022-09-28 08:08:18','2024-12-10 22:37:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
INSERT INTO `volumefolders` VALUES
(1,NULL,1,'Projektbilder',NULL,'2022-10-03 14:52:04','2022-10-03 15:31:53','d296efc7-b86d-4838-9374-f8df61df5ccc'),
(2,NULL,NULL,'Temporary filesystem',NULL,'2022-10-03 14:53:18','2022-10-03 14:53:18','e7c80088-a678-4d68-9482-a8c6a556abc6'),
(3,2,NULL,'user_1','user_1/','2022-10-03 14:53:18','2022-10-03 14:53:18','b5187b32-31e3-4de3-a58d-482ab25fcc4c'),
(4,NULL,2,'Projektbilder',NULL,'2022-10-03 17:08:22','2024-10-04 17:42:11','47944018-7869-4780-98f6-100cf3866975');
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
  `subpath` varchar(255) DEFAULT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `altTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `altTranslationKeyFormat` text DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
INSERT INTO `volumes` VALUES
(1,2,'Projektbilder','projektbilder','',NULL,'','','site',NULL,'site',NULL,1,'2022-10-03 14:52:04','2022-10-03 15:31:53','2022-10-03 17:07:18','f6e40493-74a7-4e2e-ac86-65f353155213'),
(2,3,'Projektbilder','projektbilder','lokal',NULL,'','transforms','site',NULL,'none',NULL,2,'2022-10-03 17:08:22','2024-10-04 17:42:11',NULL,'44fec1ae-cc09-42b5-b6a8-1c301d066c04');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webauthn`
--

DROP TABLE IF EXISTS `webauthn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webauthn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `credentialId` varchar(255) DEFAULT NULL,
  `credential` text DEFAULT NULL,
  `credentialName` varchar(255) DEFAULT NULL,
  `dateLastUsed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_xwiktyxynfiijtfyaalptwhcncfafqlwoybf` (`userId`),
  CONSTRAINT `fk_xwiktyxynfiijtfyaalptwhcncfafqlwoybf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webauthn`
--

LOCK TABLES `webauthn` WRITE;
/*!40000 ALTER TABLE `webauthn` DISABLE KEYS */;
/*!40000 ALTER TABLE `webauthn` ENABLE KEYS */;
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
  `settings` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`settings`)),
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nkythpigpwrjpspvhffrktyturwtfmikwhim` (`userId`),
  CONSTRAINT `fk_gzgaoogznweipcvlskditwidqxfjgwulkrne` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES
(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','def7b0c4-c650-4d58-8c04-403e54ec55c2'),
(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','66eea0d8-0993-4622-86f7-ca4b2f792a42'),
(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','c6f0d03c-0537-48bf-a29d-efcf0301288f'),
(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2022-09-28 12:12:59','2022-09-28 12:12:59','62381c44-6e0d-4a2d-8b1c-16cc2cec4163');
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

-- Dump completed on 2024-12-15 17:08:20
