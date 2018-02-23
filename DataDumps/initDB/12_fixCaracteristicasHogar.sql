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
-- Table structure for table `Plan_CaracteristicasHogar`
--

DROP TABLE IF EXISTS `Plan_CaracteristicasHogar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_CaracteristicasHogar` (
  `id_CaracteristicasEspecialesHogar` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_CaracteristicasEspecialesHogar`),
  KEY `FK_xmmedvt32x390uo9frverb5y` (`idConstante`),
  CONSTRAINT `FK_xmmedvt32x390uo9frverb5y` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_CaracteristicasHogar`
--

LOCK TABLES `Plan_CaracteristicasHogar` WRITE;
/*!40000 ALTER TABLE `Plan_CaracteristicasHogar` DISABLE KEYS */;
INSERT INTO `Plan_CaracteristicasHogar` VALUES (1,'Hogares unipersonales o personas solas',12);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (3,'Presencia de jubilados en el Hogar',11);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (4,'Presencia en el hogar de miembros con alguna discapacidad',8);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (5,'Presencia en el hogar de miembros mayores de 65 años',5);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (6,'Presencia en el hogar de miembros con enfermedades crónicas',7);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (7,'Presencia en el hogar de miembros excombatientes de Malvinas',6);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (8,'Presencia en el hogar de miembros víctimas de violencia de género y/o violencia familiar',4);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (9,'Presencia en el hogar de miembros asociados a sindicatos y/o gremios',9);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (10,'Presencia en el hogar de miembros asociados a entidades de bien público',10);
/*!40000 ALTER TABLE `Plan_CaracteristicasHogar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-22 20:13:47
