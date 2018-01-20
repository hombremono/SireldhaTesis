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
-- Table structure for table `Plan_Calmat`
--

DROP TABLE IF EXISTS `Plan_Calmat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_Calmat` (
  `id_Plan_Calmat` int(11) NOT NULL AUTO_INCREMENT,
  `indice` int(11) NOT NULL,
  PRIMARY KEY (`id_Plan_Calmat`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_Calmat`
--

LOCK TABLES `Plan_Calmat` WRITE;
/*!40000 ALTER TABLE `Plan_Calmat` DISABLE KEYS */;
INSERT INTO `Plan_Calmat` VALUES (1,1);
INSERT INTO `Plan_Calmat` VALUES (2,2);
INSERT INTO `Plan_Calmat` VALUES (3,3);
INSERT INTO `Plan_Calmat` VALUES (4,4);
INSERT INTO `Plan_Calmat` VALUES (5,5);
/*!40000 ALTER TABLE `Plan_Calmat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan_SituacionRegistro`
--

DROP TABLE IF EXISTS `Plan_SituacionRegistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_SituacionRegistro` (
  `id_SituacionRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  `id_Plan_SituacionRegistro` int(11) NOT NULL,
  PRIMARY KEY (`id_SituacionRegistro`),
  KEY `FK_3icrehcw60gdfbh9d12i8b4r7` (`idConstante`),
  CONSTRAINT `FK_3icrehcw60gdfbh9d12i8b4r7` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_SituacionRegistro`
--

LOCK TABLES `Plan_SituacionRegistro` WRITE;
/*!40000 ALTER TABLE `Plan_SituacionRegistro` DISABLE KEYS */;
INSERT INTO `Plan_SituacionRegistro` VALUES (3,'Antiguedad de la inscripción en el registro',1,0);
INSERT INTO `Plan_SituacionRegistro` VALUES (4,'Documentación probatoria completa',2,0);
/*!40000 ALTER TABLE `Plan_SituacionRegistro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan_SolucionHabitacional`
--

DROP TABLE IF EXISTS `Plan_SolucionHabitacional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_SolucionHabitacional` (
  `id_Plan_SolucionHabitacional` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_Plan_SolucionHabitacional`),
  KEY `FK_dy7dtb6ojmktqd2e4pjvy3hut` (`idConstante`),
  CONSTRAINT `FK_dy7dtb6ojmktqd2e4pjvy3hut` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_SolucionHabitacional`
--

LOCK TABLES `Plan_SolucionHabitacional` WRITE;
/*!40000 ALTER TABLE `Plan_SolucionHabitacional` DISABLE KEYS */;
INSERT INTO `Plan_SolucionHabitacional` VALUES (1,'Hogares que han perdido su vivienda por desalojo, catástrofes o siniestros',13);
INSERT INTO `Plan_SolucionHabitacional` VALUES (2,'Hogares asentados en zonas de riesgo',14);
INSERT INTO `Plan_SolucionHabitacional` VALUES (3,'Existencia de hacinamiento personal en el hogar',15);
INSERT INTO `Plan_SolucionHabitacional` VALUES (4,'Índice de promiscuidad positivo',16);
INSERT INTO `Plan_SolucionHabitacional` VALUES (5,'Hogar adjudicatario de operatorias habitacionales del estado',17);
/*!40000 ALTER TABLE `Plan_SolucionHabitacional` ENABLE KEYS */;
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

--
-- Table structure for table `Plan_SituacionHogar`
--

DROP TABLE IF EXISTS `Plan_SituacionHogar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_SituacionHogar` (
  `id_SituacionHogar` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  `id_Plan_SituacionHogar` int(11) NOT NULL,
  PRIMARY KEY (`id_SituacionHogar`),
  KEY `FK_8ni85chdv75nne0wbyf8lk80o` (`idConstante`),
  CONSTRAINT `FK_8ni85chdv75nne0wbyf8lk80o` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_SituacionHogar`
--

LOCK TABLES `Plan_SituacionHogar` WRITE;
/*!40000 ALTER TABLE `Plan_SituacionHogar` DISABLE KEYS */;
INSERT INTO `Plan_SituacionHogar` VALUES (1,'Percepción de subsidios',3,0);
/*!40000 ALTER TABLE `Plan_SituacionHogar` ENABLE KEYS */;
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
  `id_Plan_RangoEdad` int(11) NOT NULL,
  PRIMARY KEY (`id_RangoEdad`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_RangoEdad`
--

LOCK TABLES `Plan_RangoEdad` WRITE;
/*!40000 ALTER TABLE `Plan_RangoEdad` DISABLE KEYS */;
INSERT INTO `Plan_RangoEdad` VALUES (1,1,20,0);
INSERT INTO `Plan_RangoEdad` VALUES (2,21,40,0);
INSERT INTO `Plan_RangoEdad` VALUES (3,41,60,0);
INSERT INTO `Plan_RangoEdad` VALUES (4,61,80,0);
INSERT INTO `Plan_RangoEdad` VALUES (5,81,100,0);
/*!40000 ALTER TABLE `Plan_RangoEdad` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
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
/*!40000 ALTER TABLE `constantePlan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-14 21:42:09
