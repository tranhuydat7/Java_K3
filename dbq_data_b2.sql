-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: layloihoi_db
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_tiet_su_dung_dv`
--

DROP TABLE IF EXISTS `chi_tiet_su_dung_dv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chi_tiet_su_dung_dv` (
  `MADATPHONG` int(11) NOT NULL,
  `MADV` int(11) NOT NULL,
  `SOLUONG` int(11) DEFAULT NULL,
  PRIMARY KEY (`MADATPHONG`,`MADV`),
  CONSTRAINT `chi_tiet_su_dung_dv_ibfk_1` FOREIGN KEY (`MADATPHONG`) REFERENCES `dat_phong` (`MADATPHONG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_su_dung_dv`
--

LOCK TABLES `chi_tiet_su_dung_dv` WRITE;
/*!40000 ALTER TABLE `chi_tiet_su_dung_dv` DISABLE KEYS */;
INSERT INTO `chi_tiet_su_dung_dv` VALUES (1,1,20),(1,2,10),(1,3,3),(2,2,10),(2,3,1),(3,3,2),(3,4,10);
/*!40000 ALTER TABLE `chi_tiet_su_dung_dv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dat_phong`
--

DROP TABLE IF EXISTS `dat_phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dat_phong` (
  `MADATPHONG` int(11) NOT NULL,
  `MAPHONG` int(11) DEFAULT NULL,
  `MAKH` int(11) DEFAULT NULL,
  `NGAYDAT` date DEFAULT NULL,
  `GIOBATDAU` time DEFAULT NULL,
  `GIOKETTHUC` time DEFAULT NULL,
  `TIENDATCOC` decimal(6,3) DEFAULT NULL,
  `GHICHU` varchar(255) DEFAULT NULL,
  `TRANGTHAIDAT` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`MADATPHONG`),
  KEY `MAPHONG` (`MAPHONG`),
  KEY `MAKH` (`MAKH`),
  CONSTRAINT `dat_phong_ibfk_1` FOREIGN KEY (`MAPHONG`) REFERENCES `phong` (`MAPHONG`),
  CONSTRAINT `dat_phong_ibfk_2` FOREIGN KEY (`MAKH`) REFERENCES `khach_hang` (`MAKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dat_phong`
--

LOCK TABLES `dat_phong` WRITE;
/*!40000 ALTER TABLE `dat_phong` DISABLE KEYS */;
INSERT INTO `dat_phong` VALUES (1,1,2,'2018-03-26','11:00:00','13:00:00',100.000,'','DA DAT'),(2,1,3,'2018-03-27','17:15:00','19:15:00',50.000,'','DA HUY'),(3,2,2,'2018-03-26','20:30:00','22:15:00',100.000,'','DA DAT'),(4,3,1,'2018-04-01','19:30:00','21:15:00',200.000,'','DA DAT');
/*!40000 ALTER TABLE `dat_phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dich_vu_di_kem`
--

DROP TABLE IF EXISTS `dich_vu_di_kem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dich_vu_di_kem` (
  `MADV` int(11) NOT NULL,
  `TENDV` varchar(255) DEFAULT NULL,
  `DONVITINH` varchar(30) DEFAULT NULL,
  `DONGIA` decimal(6,3) DEFAULT NULL,
  PRIMARY KEY (`MADV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dich_vu_di_kem`
--

LOCK TABLES `dich_vu_di_kem` WRITE;
/*!40000 ALTER TABLE `dich_vu_di_kem` DISABLE KEYS */;
INSERT INTO `dich_vu_di_kem` VALUES (1,'HOT GIRL','EM',10.000),(2,'HOA HAU','EM',20.000),(3,'BEER','LON',10.000),(4,'TRAI CAY','DIA',35.000);
/*!40000 ALTER TABLE `dich_vu_di_kem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khach_hang`
--

DROP TABLE IF EXISTS `khach_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `khach_hang` (
  `MAKH` int(11) NOT NULL,
  `TENKH` varchar(30) DEFAULT NULL,
  `DIACHI` varchar(50) DEFAULT NULL,
  `SODT` char(11) DEFAULT NULL,
  PRIMARY KEY (`MAKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khach_hang`
--

LOCK TABLES `khach_hang` WRITE;
/*!40000 ALTER TABLE `khach_hang` DISABLE KEYS */;
INSERT INTO `khach_hang` VALUES (1,'MARIA OZAWA','HOA XUAN','11111111111'),(2,'TOKUDA','HOA XUAN','11111111112'),(3,'MIKAMI YUA','HOA XUAN','11111111113'),(4,'NGUYEN VAN D','HOA XUAN','11111111114');
/*!40000 ALTER TABLE `khach_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phong`
--

DROP TABLE IF EXISTS `phong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phong` (
  `MAPHONG` int(11) NOT NULL,
  `LOAIPHONG` varchar(20) DEFAULT NULL,
  `SOKHACHTOIDA` int(11) DEFAULT NULL,
  `GIAPHONG` decimal(6,3) DEFAULT NULL,
  `MOTA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MAPHONG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phong`
--

LOCK TABLES `phong` WRITE;
/*!40000 ALTER TABLE `phong` DISABLE KEYS */;
INSERT INTO `phong` VALUES (1,'LOAI 1',20,70.000,''),(2,'LOAI 1',25,90.000,''),(3,'LOAI 2',15,60.000,''),(4,'LOAI 3',20,60.000,'');
/*!40000 ALTER TABLE `phong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'layloihoi_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-25  9:39:09
