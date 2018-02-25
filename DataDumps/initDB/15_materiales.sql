-- MySQL dump 10.13  Distrib 5.7.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: web3
-- ------------------------------------------------------
-- Server version	5.7.20-0ubuntu0.17.04.1

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
-- Table structure for table `materialtecho`
--

DROP TABLE IF EXISTS `materialtecho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialtecho` (
  `id_MaterialTecho` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_MaterialTecho`),
  KEY `FK_tbngx82uv37v7yqj1bp8diklg` (`idConstante`),
  CONSTRAINT `FK_tbngx82uv37v7yqj1bp8diklg` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialtecho`
--

LOCK TABLES `materialtecho` WRITE;
/*!40000 ALTER TABLE `materialtecho` DISABLE KEYS */;
INSERT INTO `materialtecho` VALUES (1,'Cubierta asfaltica/Membrana',1,92);
INSERT INTO `materialtecho` VALUES (2,'Baldosa/Losa',1,93);
INSERT INTO `materialtecho` VALUES (3,'Pizarra/Teja',1,94);
INSERT INTO `materialtecho` VALUES (4,'Chapa de metal',1,95);
INSERT INTO `materialtecho` VALUES (5,'Chapa de fibrocemento/Plastico',1,96);
INSERT INTO `materialtecho` VALUES (6,'Chapa de carton',1,97);
INSERT INTO `materialtecho` VALUES (7,'Palma/Tabla/Paja',1,98);
/*!40000 ALTER TABLE `materialtecho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialpared`
--

DROP TABLE IF EXISTS `materialpared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialpared` (
  `id_MaterialPared` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_MaterialPared`),
  KEY `FK_c3swx21kirrw4np68jv18vyv7` (`idConstante`),
  CONSTRAINT `FK_c3swx21kirrw4np68jv18vyv7` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialpared`
--

LOCK TABLES `materialpared` WRITE;
/*!40000 ALTER TABLE `materialpared` DISABLE KEYS */;
INSERT INTO `materialpared` VALUES (1,'Ladrillo/Piedra/Bloque/Hormigon',1,83);
INSERT INTO `materialpared` VALUES (2,'Adobe',1,84);
INSERT INTO `materialpared` VALUES (3,'Madera',1,85);
INSERT INTO `materialpared` VALUES (4,'Chapa metal/Fibrocemento',1,86);
INSERT INTO `materialpared` VALUES (5,'Chrizo/Carton/Palma/Paja',1,87);
/*!40000 ALTER TABLE `materialpared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materialpiso`
--

DROP TABLE IF EXISTS `materialpiso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `materialpiso` (
  `id_MaterialPiso` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_MaterialPiso`),
  KEY `FK_pcptutd9fxpn4iflby2ef8nxe` (`idConstante`),
  CONSTRAINT `FK_pcptutd9fxpn4iflby2ef8nxe` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialpiso`
--

LOCK TABLES `materialpiso` WRITE;
/*!40000 ALTER TABLE `materialpiso` DISABLE KEYS */;
INSERT INTO `materialpiso` VALUES (1,'Ceramica/Baldosa/Mosaico',1,88);
INSERT INTO `materialpiso` VALUES (2,'Madera/Alfombra',1,89);
INSERT INTO `materialpiso` VALUES (3,'Cemento/Ladrillo fijo',1,90);
INSERT INTO `materialpiso` VALUES (4,'Tierra/Ladrillo suelto',1,91);
/*!40000 ALTER TABLE `materialpiso` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-25 18:49:36
