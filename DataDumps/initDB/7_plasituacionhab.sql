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
-- Table structure for table `Plan_SituacionHabitacional`
--

DROP TABLE IF EXISTS `Plan_SituacionHabitacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_SituacionHabitacional` (
  `id_Plan_SituacionHabitacional` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_Plan_SituacionHabitacional`),
  KEY `FK_hw963fimakeh40uic7gnidqim` (`idConstante`),
  CONSTRAINT `FK_hw963fimakeh40uic7gnidqim` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_SituacionHabitacional`
--

LOCK TABLES `Plan_SituacionHabitacional` WRITE;
/*!40000 ALTER TABLE `Plan_SituacionHabitacional` DISABLE KEYS */;
INSERT INTO `Plan_SituacionHabitacional` VALUES (1,'Hogares que han perdido su vivienda por desalojo, catástrofes o siniestros',13);
INSERT INTO `Plan_SituacionHabitacional` VALUES (2,'Hogares asentados en zonas de riesgo',14);
INSERT INTO `Plan_SituacionHabitacional` VALUES (3,'Existencia de hacinamiento personal en el hogar',15);
INSERT INTO `Plan_SituacionHabitacional` VALUES (4,'Índice de promiscuidad positivo',16);
INSERT INTO `Plan_SituacionHabitacional` VALUES (5,'Hogar adjudicatario de operatorias habitacionales del estado',17);
/*!40000 ALTER TABLE `Plan_SituacionHabitacional` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-20 17:15:15
