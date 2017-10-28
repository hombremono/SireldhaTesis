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
-- Table structure for table `SolucionHabitacional_SituacionInmueble`
--

DROP TABLE IF EXISTS `SolucionHabitacional_SituacionInmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SolucionHabitacional_SituacionInmueble` (
  `id_SolucionHabitacional` int(11) NOT NULL,
  `id_SituacionInmueble` int(11) NOT NULL,
  KEY `FK_9i7oluwhixb9gsxxhb92xol0v` (`id_SituacionInmueble`),
  KEY `FK_8hr8sxg9ibtnawvvim62f41la` (`id_SolucionHabitacional`),
  CONSTRAINT `FK_8hr8sxg9ibtnawvvim62f41la` FOREIGN KEY (`id_SolucionHabitacional`) REFERENCES `solucionhabitacional` (`id_SolucionHabitacional`),
  CONSTRAINT `FK_9i7oluwhixb9gsxxhb92xol0v` FOREIGN KEY (`id_SituacionInmueble`) REFERENCES `situacioninmueble` (`id_SituacionInmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SolucionHabitacional_SituacionInmueble`
--

LOCK TABLES `SolucionHabitacional_SituacionInmueble` WRITE;
/*!40000 ALTER TABLE `SolucionHabitacional_SituacionInmueble` DISABLE KEYS */;
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,1);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,2);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,3);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,4);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,5);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,6);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,7);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,8);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,9);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,10);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,11);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (2,12);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (3,13);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (3,14);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (3,15);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (3,16);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,1);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,2);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,3);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,4);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,5);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,7);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,11);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,12);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (1,9);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (4,21);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (4,22);
INSERT INTO `SolucionHabitacional_SituacionInmueble` VALUES (4,23);
/*!40000 ALTER TABLE `SolucionHabitacional_SituacionInmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacioninmueble`
--

DROP TABLE IF EXISTS `situacioninmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacioninmueble` (
  `id_SituacionInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_SituacionInmueble`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacioninmueble`
--

LOCK TABLES `situacioninmueble` WRITE;
/*!40000 ALTER TABLE `situacioninmueble` DISABLE KEYS */;
INSERT INTO `situacioninmueble` VALUES (1,'Casa prestada',1);
INSERT INTO `situacioninmueble` VALUES (2,'Casa alquilada',1);
INSERT INTO `situacioninmueble` VALUES (3,'Departamento prestado',1);
INSERT INTO `situacioninmueble` VALUES (4,'Departamento alquilado',1);
INSERT INTO `situacioninmueble` VALUES (5,'Pieza en hotel, inquilinato o pensión',1);
INSERT INTO `situacioninmueble` VALUES (6,'Casilla o rancho en terreno propio',1);
INSERT INTO `situacioninmueble` VALUES (7,'Casilla o rancho en terreno no propio',1);
INSERT INTO `situacioninmueble` VALUES (8,'Vivienda móvil en terreno propio',1);
INSERT INTO `situacioninmueble` VALUES (9,'Vivienda móvil en terreno no propio',1);
INSERT INTO `situacioninmueble` VALUES (10,'Lugar no construido para habitación en terreno propio',1);
INSERT INTO `situacioninmueble` VALUES (11,'Lugar no construido para habitación en terreno no propio',1);
INSERT INTO `situacioninmueble` VALUES (12,'Situación de calle',1);
INSERT INTO `situacioninmueble` VALUES (13,'Casa en terreno propio',1);
INSERT INTO `situacioninmueble` VALUES (14,'Casa en terreno no propio con aval del propietario',1);
INSERT INTO `situacioninmueble` VALUES (15,'Departamento en terreno propio',1);
INSERT INTO `situacioninmueble` VALUES (16,'Departamento en terreno no propio con aval del propietario',1);
INSERT INTO `situacioninmueble` VALUES (21,'Vivienda propia en terreno fiscal',1);
INSERT INTO `situacioninmueble` VALUES (22,'Vivienda propia en terreno privado',1);
INSERT INTO `situacioninmueble` VALUES (23,'Vivienda propia en terreno de propietario desconocido',1);
/*!40000 ALTER TABLE `situacioninmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solucionhabitacional`
--

DROP TABLE IF EXISTS `solucionhabitacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solucionhabitacional` (
  `id_SolucionHabitacional` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_SolucionHabitacional`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solucionhabitacional`
--

LOCK TABLES `solucionhabitacional` WRITE;
/*!40000 ALTER TABLE `solucionhabitacional` DISABLE KEYS */;
INSERT INTO `solucionhabitacional` VALUES (1,'Terreno',1);
INSERT INTO `solucionhabitacional` VALUES (2,'Vivienda nueva',1);
INSERT INTO `solucionhabitacional` VALUES (3,'Ampliación o Mejoramiento',1);
INSERT INTO `solucionhabitacional` VALUES (4,'Ampliacion',1);
/*!40000 ALTER TABLE `solucionhabitacional` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-28 18:30:11
