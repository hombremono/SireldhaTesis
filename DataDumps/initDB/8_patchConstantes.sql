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
-- Table structure for table `constantePlan`
--

DROP TABLE IF EXISTS `constantePlan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constantePlan` (
  `id_Constante` int(11) NOT NULL AUTO_INCREMENT,
  `constante` varchar(255) NOT NULL,
  `grupo` varchar(255) NOT NULL,
  PRIMARY KEY (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constantePlan`
--

LOCK TABLES `constantePlan` WRITE;
/*!40000 ALTER TABLE `constantePlan` DISABLE KEYS */;
INSERT INTO `constantePlan` VALUES (1,'ANTIGUEDAD','SITUACION_REGISTRO');
INSERT INTO `constantePlan` VALUES (2,'DOCUMENTACION_COMPLETA','SITUACION_REGISTRO');
INSERT INTO `constantePlan` VALUES (3,'PERCEPCION_SUBSIDIOS','SITUACION_HOGAR');
INSERT INTO `constantePlan` VALUES (4,'PRESENCIA_VIOLENCIA','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (5,'PRESENCIA_MAYORES_65','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (6,'PRESENCIA_EXCOMBATIENTES','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (7,'PRESENCIA_ENFERMEDADES_CRONICAS','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (8,'PRESENCIA_DISCAPACIDAD','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (9,'PRESENCIA_ASOC_GREMIO','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (10,'PRESENCIA_ASOC_ENTIDAD_PUBLICA','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (11,'PRESENCIA_JUBILADO','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (12,'HOGAR_UNIPERSONAL','CARACTERISTICAS_HOGAR');
INSERT INTO `constantePlan` VALUES (13,'DESALOJO_CATASTROFE_SINIESTROS','CARACTERISTICAS_SOLUCION_HABITACIONAL');
INSERT INTO `constantePlan` VALUES (14,'ZONA_RIESGO','CARACTERISTICAS_SOLUCION_HABITACIONAL');
INSERT INTO `constantePlan` VALUES (15,'HACINAMIENTO','CARACTERISTICAS_SOLUCION_HABITACIONAL');
INSERT INTO `constantePlan` VALUES (16,'PROMISCUIDAD','CARACTERISTICAS_SOLUCION_HABITACIONAL');
INSERT INTO `constantePlan` VALUES (17,'ADJUDICATARIO_ESTADO','CARACTERISTICAS_SOLUCION_HABITACIONAL');
INSERT INTO `constantePlan` VALUES (18,'CALMAT_1','CALMAT');
INSERT INTO `constantePlan` VALUES (19,'CALMAT_2','CALMAT');
INSERT INTO `constantePlan` VALUES (20,'CALMAT_3','CALMAT');
INSERT INTO `constantePlan` VALUES (21,'CALMAT_4','CALMAT');
INSERT INTO `constantePlan` VALUES (22,'CALMAT_5','CALMAT');
INSERT INTO `constantePlan` VALUES (23,'RANGO_1','RANGO_EDAD');
INSERT INTO `constantePlan` VALUES (24,'RANGO_2','RANGO_EDAD');
INSERT INTO `constantePlan` VALUES (25,'RANGO_3','RANGO_EDAD');
INSERT INTO `constantePlan` VALUES (26,'RANGO_4','RANGO_EDAD');
/*!40000 ALTER TABLE `constantePlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan_RangoEdad`
--

DROP TABLE IF EXISTS `Plan_RangoEdad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_RangoEdad` (
  `id_RangoEdad` int(11) NOT NULL AUTO_INCREMENT,
  `desde` float NOT NULL,
  `hasta` float NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_RangoEdad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_RangoEdad`
--

LOCK TABLES `Plan_RangoEdad` WRITE;
/*!40000 ALTER TABLE `Plan_RangoEdad` DISABLE KEYS */;
INSERT INTO `Plan_RangoEdad` VALUES (1,1,20,23);
INSERT INTO `Plan_RangoEdad` VALUES (2,21,40,24);
INSERT INTO `Plan_RangoEdad` VALUES (3,41,60,25);
INSERT INTO `Plan_RangoEdad` VALUES (4,61,80,26);
/*!40000 ALTER TABLE `Plan_RangoEdad` ENABLE KEYS */;
UNLOCK TABLES;

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
  `id_Plan_CaracteristicasHogar` int(11) NOT NULL,
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
INSERT INTO `Plan_CaracteristicasHogar` VALUES (1,'Hogares unipersonales o personas solas',4,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (3,'Presencia de jubilados en el Hogar',5,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (4,'Presencia en el hogar de miembros con alguna discapacidad',6,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (5,'Presencia en el hogar de miembros mayores de 65 años',7,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (6,'Presencia en el hogar de miembros con enfermedades crónicas',8,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (7,'Presencia en el hogar de miembros excombatientes de Malvinas',9,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (8,'Presencia en el hogar de miembros víctimas de violencia de género y/o violencia familiar',10,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (9,'Presencia en el hogar de miembros asociados a sindicatos y/o gremios',11,0);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (10,'Presencia en el hogar de miembros asociados a entidades de bien público',12,0);
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

-- Dump completed on 2018-01-20 18:36:09
