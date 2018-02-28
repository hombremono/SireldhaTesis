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
  `puntaje` float NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_Plan_Calmat`),
  KEY `FK_clr3e4adyytbamjcikybflt52` (`idConstante`),
  CONSTRAINT `FK_clr3e4adyytbamjcikybflt52` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_Calmat`
--

LOCK TABLES `Plan_Calmat` WRITE;
/*!40000 ALTER TABLE `Plan_Calmat` DISABLE KEYS */;
INSERT INTO `Plan_Calmat` VALUES (1,1,0,18);
INSERT INTO `Plan_Calmat` VALUES (2,2,0,19);
INSERT INTO `Plan_Calmat` VALUES (3,3,0,20);
INSERT INTO `Plan_Calmat` VALUES (4,4,0,21);
INSERT INTO `Plan_Calmat` VALUES (5,5,0,22);
/*!40000 ALTER TABLE `Plan_Calmat` ENABLE KEYS */;
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

--
-- Table structure for table `Plan_Criterio`
--

DROP TABLE IF EXISTS `Plan_Criterio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_Criterio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puntaje` float DEFAULT NULL,
  `requerido` bit(1) DEFAULT NULL,
  `id_Constante` int(11) NOT NULL,
  `idPlan` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `idOperadorLogico` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_mstln3sq1yuvmotxi7ets252g` (`id_Constante`),
  KEY `FK_p37c5lmnci8n5iwo7e5juve96` (`idPlan`),
  KEY `FK_6k05urjy1frwtak64dv7ax7mn` (`idOperadorLogico`),
  CONSTRAINT `FK_6k05urjy1frwtak64dv7ax7mn` FOREIGN KEY (`idOperadorLogico`) REFERENCES `constantePlan` (`id_Constante`),
  CONSTRAINT `FK_mstln3sq1yuvmotxi7ets252g` FOREIGN KEY (`id_Constante`) REFERENCES `constantePlan` (`id_Constante`),
  CONSTRAINT `FK_p37c5lmnci8n5iwo7e5juve96` FOREIGN KEY (`idPlan`) REFERENCES `plan` (`id_Plan`)
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_Criterio`
--

LOCK TABLES `Plan_Criterio` WRITE;
/*!40000 ALTER TABLE `Plan_Criterio` DISABLE KEYS */;
INSERT INTO `Plan_Criterio` VALUES (13,12,'',12,5,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (14,45,'\0',49,5,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (15,124,'',70,5,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (16,12,'',12,6,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (17,45,'\0',49,6,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (18,124,'',70,6,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (19,12,'',12,7,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (20,45,'\0',49,7,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (21,124,'',70,7,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (22,12,'',12,8,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (23,45,'\0',49,8,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (24,124,'',70,8,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (25,12,'',12,10,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (26,45,'\0',49,10,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (27,124,'',70,10,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (28,420,'',2,11,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (29,420,'',2,12,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (30,10,'\0',1,13,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (31,10,'\0',1,14,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (32,420,'\0',2,14,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (33,10,'\0',1,15,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (34,420,'',2,15,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (35,12,'\0',3,16,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (36,123,'',2,17,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (37,10,'\0',27,18,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (38,100,'\0',28,18,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (39,10,'',31,19,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (40,100,'\0',32,19,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (41,10,'\0',33,20,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (42,20,'\0',34,20,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (43,30,'\0',35,20,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (44,40,'\0',37,20,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (45,50,'\0',36,20,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (46,60,'\0',38,20,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (47,10,'\0',39,21,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (48,20,'\0',40,21,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (49,30,'\0',41,21,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (50,40,'\0',42,21,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (51,50,'\0',43,21,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (52,10,'\0',23,22,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (53,20,'\0',24,22,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (54,30,'\0',25,22,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (55,40,'\0',26,22,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (56,10,'\0',29,23,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (57,20,'\0',30,23,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (58,10,'\0',44,24,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (59,20,'\0',45,24,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (60,30,'\0',46,24,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (61,40,'',47,24,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (62,50,'\0',48,24,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (63,60,'\0',49,24,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (64,100,'\0',4,25,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (65,0,'\0',10,26,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (66,420,'',5,27,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (67,540,'\0',6,28,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (68,123,'\0',6,29,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (69,85,'\0',8,30,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (70,22,'\0',9,31,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (71,88,'\0',10,32,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (72,88,'\0',11,33,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (73,88,'\0',12,34,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (74,88,'\0',13,35,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (75,88,'\0',14,36,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (76,88,'\0',17,37,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (77,19,'\0',3,38,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (78,100,'\0',26,38,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (79,420,'\0',48,38,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (80,12,'\0',1,38,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (81,4,'\0',2,38,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (82,10,'\0',53,39,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (83,100,'',54,39,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (84,10,'\0',56,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (85,20,'\0',55,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (86,30,'\0',57,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (87,40,'\0',58,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (88,50,'\0',59,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (89,60,'\0',60,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (90,70,'\0',62,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (91,80,'\0',73,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (92,90,'\0',72,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (93,100,'\0',71,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (94,110,'\0',70,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (95,120,'\0',69,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (96,130,'\0',67,40,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (97,1,'\0',55,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (98,2,'\0',56,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (99,3,'\0',57,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (100,4,'\0',58,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (101,5,'\0',59,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (102,6,'\0',73,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (103,7,'\0',72,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (104,8,'\0',71,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (105,9,'\0',70,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (106,10,'\0',69,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (107,11,'\0',68,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (108,12,'\0',67,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (109,13,'\0',66,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (110,14,'\0',65,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (111,15,'\0',64,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (112,16,'\0',63,41,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (114,16,'\0',15,42,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (115,10,'\0',74,44,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (116,20,'\0',75,44,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (117,30,'\0',76,44,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (118,1,'\0',18,45,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (119,2,'\0',19,45,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (120,3,'\0',20,45,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (121,4,'\0',21,45,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (122,5,'\0',22,45,NULL,NULL);
INSERT INTO `Plan_Criterio` VALUES (123,10,'\0',99,46,1990,80);
INSERT INTO `Plan_Criterio` VALUES (124,20,'\0',99,46,1990,81);
INSERT INTO `Plan_Criterio` VALUES (125,30,'\0',99,46,1990,82);
INSERT INTO `Plan_Criterio` VALUES (126,10,'\0',100,47,1,80);
INSERT INTO `Plan_Criterio` VALUES (127,20,'\0',100,47,1,81);
INSERT INTO `Plan_Criterio` VALUES (128,100,'\0',100,47,1,82);
INSERT INTO `Plan_Criterio` VALUES (129,0,'\0',101,48,NULL,80);
INSERT INTO `Plan_Criterio` VALUES (130,0,'\0',101,48,NULL,81);
INSERT INTO `Plan_Criterio` VALUES (131,0,'\0',101,48,NULL,81);
INSERT INTO `Plan_Criterio` VALUES (132,0,'\0',101,49,NULL,80);
INSERT INTO `Plan_Criterio` VALUES (133,10,'\0',101,50,100,80);
INSERT INTO `Plan_Criterio` VALUES (134,20,'\0',101,50,100,81);
INSERT INTO `Plan_Criterio` VALUES (135,30,'\0',101,50,100,82);
/*!40000 ALTER TABLE `Plan_Criterio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plan_Item`
--

DROP TABLE IF EXISTS `Plan_Item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_Item` (
  `id_PlanItem` int(11) NOT NULL AUTO_INCREMENT,
  `puntaje` float NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_PlanItem`),
  KEY `FK_bvqg2plj90egr1ui33ys5b2m0` (`idConstante`),
  CONSTRAINT `FK_bvqg2plj90egr1ui33ys5b2m0` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_Item`
--

LOCK TABLES `Plan_Item` WRITE;
/*!40000 ALTER TABLE `Plan_Item` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plan_Item` ENABLE KEYS */;
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
  PRIMARY KEY (`id_RangoEdad`),
  KEY `FK_6ayhfbkho6nqlqvjadfr22a4o` (`idConstante`),
  CONSTRAINT `FK_6ayhfbkho6nqlqvjadfr22a4o` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
-- Table structure for table `Plan_SituacionRegistro`
--

DROP TABLE IF EXISTS `Plan_SituacionRegistro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plan_SituacionRegistro` (
  `id_SituacionRegistro` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_SituacionRegistro`),
  KEY `FK_p959h3sgvv2rb8mscna8metrh` (`idConstante`),
  CONSTRAINT `FK_p959h3sgvv2rb8mscna8metrh` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plan_SituacionRegistro`
--

LOCK TABLES `Plan_SituacionRegistro` WRITE;
/*!40000 ALTER TABLE `Plan_SituacionRegistro` DISABLE KEYS */;
INSERT INTO `Plan_SituacionRegistro` VALUES (3,'Antiguedad de la inscripción en el registro',1);
INSERT INTO `Plan_SituacionRegistro` VALUES (4,'Documentación probatoria completa',2);
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
-- Table structure for table `PoseeInmueble`
--

DROP TABLE IF EXISTS `PoseeInmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PoseeInmueble` (
  `id_PoseeInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_PoseeInmueble`),
  KEY `FK_npesxnmk1w8h5oqrycakju1h7` (`idConstante`),
  CONSTRAINT `FK_npesxnmk1w8h5oqrycakju1h7` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PoseeInmueble`
--

LOCK TABLES `PoseeInmueble` WRITE;
/*!40000 ALTER TABLE `PoseeInmueble` DISABLE KEYS */;
INSERT INTO `PoseeInmueble` VALUES (1,'posee',53);
INSERT INTO `PoseeInmueble` VALUES (2,'no posee',54);
/*!40000 ALTER TABLE `PoseeInmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SituacionesEspeciales`
--

DROP TABLE IF EXISTS `SituacionesEspeciales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SituacionesEspeciales` (
  `id_SituacionesEspeciales` int(11) NOT NULL AUTO_INCREMENT,
  `asociacionEntidadPublica` bit(1) DEFAULT NULL,
  `asociacionGremio` bit(1) DEFAULT NULL,
  `enfermedadCronica` bit(1) DEFAULT NULL,
  `excombatiente` bit(1) DEFAULT NULL,
  `victimaViolencia` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_SituacionesEspeciales`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SituacionesEspeciales`
--

LOCK TABLES `SituacionesEspeciales` WRITE;
/*!40000 ALTER TABLE `SituacionesEspeciales` DISABLE KEYS */;
INSERT INTO `SituacionesEspeciales` VALUES (1,'','\0','\0','\0','');
INSERT INTO `SituacionesEspeciales` VALUES (2,'\0','','\0','','');
INSERT INTO `SituacionesEspeciales` VALUES (3,'','\0','\0','','');
INSERT INTO `SituacionesEspeciales` VALUES (4,'\0','','\0','','\0');
INSERT INTO `SituacionesEspeciales` VALUES (5,'\0','\0','','\0','\0');
INSERT INTO `SituacionesEspeciales` VALUES (6,'\0','\0','\0','\0','\0');
/*!40000 ALTER TABLE `SituacionesEspeciales` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Table structure for table `Subsidio`
--

DROP TABLE IF EXISTS `Subsidio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subsidio` (
  `id_Subsidio` int(11) NOT NULL AUTO_INCREMENT,
  `municipal` bit(1) DEFAULT NULL,
  `nacional` bit(1) DEFAULT NULL,
  `provincial` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id_Subsidio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subsidio`
--

LOCK TABLES `Subsidio` WRITE;
/*!40000 ALTER TABLE `Subsidio` DISABLE KEYS */;
INSERT INTO `Subsidio` VALUES (1,'','\0','');
INSERT INTO `Subsidio` VALUES (2,'\0','\0','\0');
INSERT INTO `Subsidio` VALUES (3,'\0','','\0');
INSERT INTO `Subsidio` VALUES (4,'','\0','\0');
/*!40000 ALTER TABLE `Subsidio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler`
--

DROP TABLE IF EXISTS `alquiler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alquiler` (
  `id_Alquiler` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `monto` float NOT NULL,
  `fechaDesde` date NOT NULL,
  `fechaHasta` date NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Alquiler`),
  KEY `fk_AlquilerFamilia_idx` (`idFamilia`),
  CONSTRAINT `fk_alquiler_1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler`
--

LOCK TABLES `alquiler` WRITE;
/*!40000 ALTER TABLE `alquiler` DISABLE KEYS */;
/*!40000 ALTER TABLE `alquiler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivos`
--

DROP TABLE IF EXISTS `archivos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archivos` (
  `idArchivo` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` longblob,
  `fecha` datetime DEFAULT NULL,
  `mimeType` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `size` bigint(20) NOT NULL,
  PRIMARY KEY (`idArchivo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivos`
--

LOCK TABLES `archivos` WRITE;
/*!40000 ALTER TABLE `archivos` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `automotor`
--

DROP TABLE IF EXISTS `automotor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `automotor` (
  `id_Automotor` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `marca` varchar(60) NOT NULL,
  `modelo` varchar(60) NOT NULL,
  `anio` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Automotor`),
  KEY `fk_Automotor_1_idx` (`idFamilia`),
  CONSTRAINT `FK_369k2fml3qnppthb294fqxlpj` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `automotor`
--

LOCK TABLES `automotor` WRITE;
/*!40000 ALTER TABLE `automotor` DISABLE KEYS */;
/*!40000 ALTER TABLE `automotor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calmat`
--

DROP TABLE IF EXISTS `calmat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calmat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoriaPared` int(11) NOT NULL,
  `categoriaPiso` int(11) NOT NULL,
  `categoriaTecho` int(11) NOT NULL,
  `idConstanteCalmat` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_f2lmpgnx1hnmyquw424api5b2` (`idConstanteCalmat`),
  CONSTRAINT `FK_f2lmpgnx1hnmyquw424api5b2` FOREIGN KEY (`idConstanteCalmat`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calmat`
--

LOCK TABLES `calmat` WRITE;
/*!40000 ALTER TABLE `calmat` DISABLE KEYS */;
INSERT INTO `calmat` VALUES (1,1,1,1,18);
INSERT INTO `calmat` VALUES (2,1,1,2,19);
INSERT INTO `calmat` VALUES (3,1,1,3,20);
INSERT INTO `calmat` VALUES (4,1,1,4,21);
INSERT INTO `calmat` VALUES (5,1,2,1,19);
INSERT INTO `calmat` VALUES (6,1,2,2,19);
INSERT INTO `calmat` VALUES (7,1,2,3,20);
INSERT INTO `calmat` VALUES (8,1,2,4,21);
INSERT INTO `calmat` VALUES (9,1,3,1,20);
INSERT INTO `calmat` VALUES (10,1,3,2,20);
INSERT INTO `calmat` VALUES (11,1,3,3,20);
INSERT INTO `calmat` VALUES (12,1,3,4,21);
INSERT INTO `calmat` VALUES (13,1,4,1,21);
INSERT INTO `calmat` VALUES (14,1,4,2,21);
INSERT INTO `calmat` VALUES (15,1,4,3,21);
INSERT INTO `calmat` VALUES (16,1,4,4,21);
INSERT INTO `calmat` VALUES (17,2,1,1,19);
INSERT INTO `calmat` VALUES (18,2,1,2,19);
INSERT INTO `calmat` VALUES (19,2,1,3,20);
INSERT INTO `calmat` VALUES (20,2,1,4,21);
INSERT INTO `calmat` VALUES (21,2,2,1,19);
INSERT INTO `calmat` VALUES (22,2,2,2,20);
INSERT INTO `calmat` VALUES (23,2,2,3,20);
INSERT INTO `calmat` VALUES (24,2,2,4,21);
INSERT INTO `calmat` VALUES (25,2,3,1,20);
INSERT INTO `calmat` VALUES (26,2,3,2,20);
INSERT INTO `calmat` VALUES (27,2,3,3,20);
INSERT INTO `calmat` VALUES (28,2,3,4,21);
INSERT INTO `calmat` VALUES (29,2,4,1,21);
INSERT INTO `calmat` VALUES (30,2,4,2,21);
INSERT INTO `calmat` VALUES (31,2,4,3,21);
INSERT INTO `calmat` VALUES (32,2,4,4,21);
INSERT INTO `calmat` VALUES (33,3,1,1,21);
INSERT INTO `calmat` VALUES (34,3,1,2,21);
INSERT INTO `calmat` VALUES (35,3,1,3,21);
INSERT INTO `calmat` VALUES (36,3,1,4,21);
INSERT INTO `calmat` VALUES (37,3,2,1,21);
INSERT INTO `calmat` VALUES (38,3,2,2,21);
INSERT INTO `calmat` VALUES (39,3,2,3,21);
INSERT INTO `calmat` VALUES (40,3,2,4,21);
INSERT INTO `calmat` VALUES (41,3,3,1,21);
INSERT INTO `calmat` VALUES (42,3,3,2,21);
INSERT INTO `calmat` VALUES (43,3,3,3,21);
INSERT INTO `calmat` VALUES (44,3,3,4,21);
INSERT INTO `calmat` VALUES (45,3,4,1,21);
INSERT INTO `calmat` VALUES (46,3,4,2,21);
INSERT INTO `calmat` VALUES (47,3,4,3,21);
INSERT INTO `calmat` VALUES (48,3,4,4,22);
INSERT INTO `calmat` VALUES (49,3,1,1,21);
INSERT INTO `calmat` VALUES (50,3,1,2,21);
INSERT INTO `calmat` VALUES (51,3,1,3,21);
INSERT INTO `calmat` VALUES (52,3,1,4,21);
INSERT INTO `calmat` VALUES (53,3,2,1,21);
INSERT INTO `calmat` VALUES (54,3,2,2,21);
INSERT INTO `calmat` VALUES (55,3,2,3,21);
INSERT INTO `calmat` VALUES (56,3,2,4,21);
INSERT INTO `calmat` VALUES (57,3,3,1,21);
INSERT INTO `calmat` VALUES (58,3,3,2,21);
INSERT INTO `calmat` VALUES (59,3,3,3,21);
INSERT INTO `calmat` VALUES (60,3,3,4,21);
INSERT INTO `calmat` VALUES (61,3,4,1,21);
INSERT INTO `calmat` VALUES (62,3,4,2,21);
INSERT INTO `calmat` VALUES (63,3,4,3,21);
INSERT INTO `calmat` VALUES (64,3,4,4,22);
/*!40000 ALTER TABLE `calmat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `capacidadconstructiva`
--

DROP TABLE IF EXISTS `capacidadconstructiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `capacidadconstructiva` (
  `id_CapacidadConstructiva` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoCapacidadConstructiva` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_CapacidadConstructiva`),
  KEY `fk_CapacidadConstructivaTipo_idx` (`idTipoCapacidadConstructiva`),
  KEY `fk_CapacidadConstructivaPersona_idx` (`idPersona`),
  CONSTRAINT `fk_capacidadconstructiva_1` FOREIGN KEY (`idTipoCapacidadConstructiva`) REFERENCES `tipocapacidadconstructiva` (`id_TipoCapacidadConstructiva`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_capacidadconstructiva_2` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacidadconstructiva`
--

LOCK TABLES `capacidadconstructiva` WRITE;
/*!40000 ALTER TABLE `capacidadconstructiva` DISABLE KEYS */;
INSERT INTO `capacidadconstructiva` VALUES (55,1,1,1);
INSERT INTO `capacidadconstructiva` VALUES (56,2,1,1);
INSERT INTO `capacidadconstructiva` VALUES (57,3,1,1);
INSERT INTO `capacidadconstructiva` VALUES (58,4,2,1);
INSERT INTO `capacidadconstructiva` VALUES (59,5,2,1);
INSERT INTO `capacidadconstructiva` VALUES (60,6,3,1);
INSERT INTO `capacidadconstructiva` VALUES (61,7,27,1);
INSERT INTO `capacidadconstructiva` VALUES (62,8,3,1);
INSERT INTO `capacidadconstructiva` VALUES (63,2,3,1);
INSERT INTO `capacidadconstructiva` VALUES (64,10,4,1);
INSERT INTO `capacidadconstructiva` VALUES (65,1,4,1);
INSERT INTO `capacidadconstructiva` VALUES (66,2,27,1);
INSERT INTO `capacidadconstructiva` VALUES (67,3,4,1);
INSERT INTO `capacidadconstructiva` VALUES (68,4,5,1);
INSERT INTO `capacidadconstructiva` VALUES (69,5,27,1);
INSERT INTO `capacidadconstructiva` VALUES (70,6,5,1);
INSERT INTO `capacidadconstructiva` VALUES (71,7,6,1);
INSERT INTO `capacidadconstructiva` VALUES (72,8,7,1);
INSERT INTO `capacidadconstructiva` VALUES (73,4,26,1);
INSERT INTO `capacidadconstructiva` VALUES (74,10,26,1);
INSERT INTO `capacidadconstructiva` VALUES (75,1,26,1);
INSERT INTO `capacidadconstructiva` VALUES (76,1,32,1);
INSERT INTO `capacidadconstructiva` VALUES (77,7,32,1);
INSERT INTO `capacidadconstructiva` VALUES (78,8,33,1);
/*!40000 ALTER TABLE `capacidadconstructiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `caracteristicaparticular`
--

DROP TABLE IF EXISTS `caracteristicaparticular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caracteristicaparticular` (
  `id_CaracteristicaParticular` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_CaracteristicaParticular`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caracteristicaparticular`
--

LOCK TABLES `caracteristicaparticular` WRITE;
/*!40000 ALTER TABLE `caracteristicaparticular` DISABLE KEYS */;
/*!40000 ALTER TABLE `caracteristicaparticular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carecevivienda`
--

DROP TABLE IF EXISTS `carecevivienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carecevivienda` (
  `id_CareceVivienda` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `idMotivoCarecimiento` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_CareceVivienda`),
  KEY `fk_CareceViviendaFamilia_idx` (`idFamilia`),
  KEY `fk_CareceViviendaMotivoC_idx` (`idMotivoCarecimiento`),
  CONSTRAINT `fk_carecevivienda_1` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_carecevivienda_2` FOREIGN KEY (`idMotivoCarecimiento`) REFERENCES `motivocarecimiento` (`id_MotivoCarecimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carecevivienda`
--

LOCK TABLES `carecevivienda` WRITE;
/*!40000 ALTER TABLE `carecevivienda` DISABLE KEYS */;
INSERT INTO `carecevivienda` VALUES (1,1,1,1);
INSERT INTO `carecevivienda` VALUES (2,5,2,1);
INSERT INTO `carecevivienda` VALUES (3,2,3,1);
/*!40000 ALTER TABLE `carecevivienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cocina`
--

DROP TABLE IF EXISTS `cocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cocina` (
  `id_Cocina` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoCocina` int(11) NOT NULL,
  `instalacionDeAgua` tinyint(1) NOT NULL,
  `id_Inmueble` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idCocina` int(11) DEFAULT NULL,
  `cocina_id_Inmueble` int(11) DEFAULT NULL,
  `inmueble_id_Inmueble` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Cocina`),
  KEY `fk_cocina_Inmueble_idx` (`id_Inmueble`),
  KEY `fk_cocina_TipoCocina_idx` (`idTipoCocina`),
  KEY `FK_qoq5q6c7pqslow8d1u66ab7i9` (`idCocina`),
  KEY `FK_fbjhnwltc2wjfeixv03w1xx3b` (`cocina_id_Inmueble`),
  KEY `FK_l7op683cianngvf0kjrgh7wqj` (`inmueble_id_Inmueble`),
  CONSTRAINT `FK_fbjhnwltc2wjfeixv03w1xx3b` FOREIGN KEY (`cocina_id_Inmueble`) REFERENCES `inmueble` (`id_Inmueble`),
  CONSTRAINT `FK_l7op683cianngvf0kjrgh7wqj` FOREIGN KEY (`inmueble_id_Inmueble`) REFERENCES `inmueble` (`id_Inmueble`),
  CONSTRAINT `FK_qoq5q6c7pqslow8d1u66ab7i9` FOREIGN KEY (`idCocina`) REFERENCES `inmueble` (`id_Inmueble`),
  CONSTRAINT `fk_cocina_Inmueble` FOREIGN KEY (`id_Inmueble`) REFERENCES `inmueble` (`id_Inmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cocina_TipoCocina` FOREIGN KEY (`idTipoCocina`) REFERENCES `tipococina` (`id_TipoCocina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocina`
--

LOCK TABLES `cocina` WRITE;
/*!40000 ALTER TABLE `cocina` DISABLE KEYS */;
/*!40000 ALTER TABLE `cocina` ENABLE KEYS */;
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
  `claseOperador` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constantePlan`
--

LOCK TABLES `constantePlan` WRITE;
/*!40000 ALTER TABLE `constantePlan` DISABLE KEYS */;
INSERT INTO `constantePlan` VALUES (1,'ANTIGUEDAD','SITUACION_REGISTRO','OperadorAntiguedad');
INSERT INTO `constantePlan` VALUES (2,'DOCUMENTACION_COMPLETA','SITUACION_REGISTRO','OperadorDocumentacionCompleta');
INSERT INTO `constantePlan` VALUES (3,'PERCEPCION_SUBSIDIOS','SITUACION_HOGAR','OperadorPercibeSubsidio');
INSERT INTO `constantePlan` VALUES (4,'PRESENCIA_VIOLENCIA','CARACTERISTICAS_HOGAR','OperadorViolencia');
INSERT INTO `constantePlan` VALUES (5,'PRESENCIA_MAYORES_65','CARACTERISTICAS_HOGAR','OperadorMayores65');
INSERT INTO `constantePlan` VALUES (6,'PRESENCIA_EXCOMBATIENTES','CARACTERISTICAS_HOGAR','OperadorExcombatientes');
INSERT INTO `constantePlan` VALUES (7,'PRESENCIA_ENFERMEDADES_CRONICAS','CARACTERISTICAS_HOGAR','OperadorEnfermedadesCronicas');
INSERT INTO `constantePlan` VALUES (8,'PRESENCIA_DISCAPACIDAD','CARACTERISTICAS_HOGAR','OperadorDiscapacidad');
INSERT INTO `constantePlan` VALUES (9,'PRESENCIA_ASOC_GREMIO','CARACTERISTICAS_HOGAR','OperadorAsociacionGremio');
INSERT INTO `constantePlan` VALUES (10,'PRESENCIA_ASOC_ENTIDAD_PUBLICA','CARACTERISTICAS_HOGAR','OperadorEntidadPublica');
INSERT INTO `constantePlan` VALUES (11,'PRESENCIA_JUBILADO','CARACTERISTICAS_HOGAR','OperadorJubilado');
INSERT INTO `constantePlan` VALUES (12,'HOGAR_UNIPERSONAL','CARACTERISTICAS_HOGAR','OperadorHogarUnipersonal');
INSERT INTO `constantePlan` VALUES (13,'DESALOJO_CATASTROFE_SINIESTROS','CARACTERISTICAS_SOLUCION_HABITACIONAL','OperadorCatastrofe');
INSERT INTO `constantePlan` VALUES (14,'ZONA_RIESGO','CARACTERISTICAS_SOLUCION_HABITACIONAL','OperadorZonaRiesgo');
INSERT INTO `constantePlan` VALUES (15,'HACINAMIENTO','CARACTERISTICAS_SOLUCION_HABITACIONAL','OperadorHacinamiento');
INSERT INTO `constantePlan` VALUES (16,'PROMISCUIDAD','CARACTERISTICAS_SOLUCION_HABITACIONAL','OperadorPromiscuidad');
INSERT INTO `constantePlan` VALUES (17,'ADJUDICATARIO_ESTADO','CARACTERISTICAS_SOLUCION_HABITACIONAL','OperadorAdjudicatarioEstatal');
INSERT INTO `constantePlan` VALUES (18,'CALMAT_1','CALMAT','OperadorCalmat');
INSERT INTO `constantePlan` VALUES (19,'CALMAT_2','CALMAT','OperadorCalmat');
INSERT INTO `constantePlan` VALUES (20,'CALMAT_3','CALMAT','OperadorCalmat');
INSERT INTO `constantePlan` VALUES (21,'CALMAT_4','CALMAT','OperadorCalmat');
INSERT INTO `constantePlan` VALUES (22,'CALMAT_5','CALMAT','OperadorCalmat');
INSERT INTO `constantePlan` VALUES (23,'RANGO_1','RANGO_EDAD','OperadorEdadJefe');
INSERT INTO `constantePlan` VALUES (24,'RANGO_2','RANGO_EDAD','OperadorEdadJefe');
INSERT INTO `constantePlan` VALUES (25,'RANGO_3','RANGO_EDAD','OperadorEdadJefe');
INSERT INTO `constantePlan` VALUES (26,'RANGO_4','RANGO_EDAD','OperadorEdadJefe');
INSERT INTO `constantePlan` VALUES (27,'MASCULINO','SEXO','OperadorGeneroJefe');
INSERT INTO `constantePlan` VALUES (28,'FEMENINO','SEXO','OperadorGeneroJefe');
INSERT INTO `constantePlan` VALUES (29,'LABORDE','LOCALIDAD','OperadorLocalidad');
INSERT INTO `constantePlan` VALUES (30,'CORDOBA','LOCALIDAD','OperadorLocalidad');
INSERT INTO `constantePlan` VALUES (31,'ARGENTINO','NACIONALIDAD','OperadorNacionalidad');
INSERT INTO `constantePlan` VALUES (32,'EXTRANJERO','NACIONALIDAD','OperadorNacionalidad');
INSERT INTO `constantePlan` VALUES (33,'SOLTERO','ESTADO_CIVIL','OperadorEstadoCivil');
INSERT INTO `constantePlan` VALUES (34,'CASADO','ESTADO_CIVIL','OperadorEstadoCivil');
INSERT INTO `constantePlan` VALUES (35,'CONVIVIENTE','ESTADO_CIVIL','OperadorEstadoCivil');
INSERT INTO `constantePlan` VALUES (36,'SEPARADO','ESTADO_CIVIL','OperadorEstadoCivil');
INSERT INTO `constantePlan` VALUES (37,'DIVORCIADO','ESTADO_CIVIL','OperadorEstadoCivil');
INSERT INTO `constantePlan` VALUES (38,'VIUDO','ESTADO_CIVIL','OperadorEstadoCivil');
INSERT INTO `constantePlan` VALUES (39,'RELACION_DEPENDENCIA','SITUACION_LABORAL','OperadorSituacionLaboral');
INSERT INTO `constantePlan` VALUES (40,'AUTONOMO','SITUACION_LABORAL','OperadorSituacionLaboral');
INSERT INTO `constantePlan` VALUES (41,'INFORMAL','SITUACION_LABORAL','OperadorSituacionLaboral');
INSERT INTO `constantePlan` VALUES (42,'A_PRUEBA','SITUACION_LABORAL','OperadorSituacionLaboral');
INSERT INTO `constantePlan` VALUES (43,'NO_TRABAJA','SITUACION_LABORAL','OperadorSituacionLaboral');
INSERT INTO `constantePlan` VALUES (44,'PINTOR','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (45,'POCERO','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (46,'CERAMISTA','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (47,'TECHADOR','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (48,'YESERO','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (49,'SOLDADOR','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (50,'OPERADOR_MAQUINARIA','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (51,'VIDRIERO','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (52,'NO_POSEE','TIPO_CAPACIDAD_CONSTRUCTIVA','OperadorCapacidadConstructiva');
INSERT INTO `constantePlan` VALUES (53,'POSEE','POSEE_INMUEBLE','OperadorPoseeInmueble');
INSERT INTO `constantePlan` VALUES (54,'NO POSEE','POSEE_INMUEBLE','OperadorPoseeInmueble');
INSERT INTO `constantePlan` VALUES (55,'CASA_PRESTADA','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (56,'CASA_ALQUILADA','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (57,'DEPARTAMENTO_PRESTADO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (58,'DEPARTAMENTO_ALQUILADO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (59,'PENSION','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (60,'RANCHO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (61,'RANCHO_NO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (62,'VIVIENDA_MOVIL_PROPIA','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (63,'VIVIENDA_MOVIL_NO_PROPIA','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (64,'NO_CONSTRUIDO_HABITACION_TERRENO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (65,'NO_CONSTRUIDO_HABITACION_TERRENO_NO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (66,'SITUACION_CALLE','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (67,'CASA_TERRENO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (68,'CASA_TERRENO_NO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (69,'DEPARTAMENTO_TERRENO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (70,'DEPARTAMENO_TERRENO_NO_PROPIO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (71,'VIVIENDA_TERRENO_FISCAL','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (72,'VIVIENDA_TERRENO_PRIVADO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (73,'VIVIENDA_TERRENO_PROPIETARIO_DESCONOCIDO','SITUACION_INMUEBLE','OperadorSituacionInmueble');
INSERT INTO `constantePlan` VALUES (74,'BUENO','INSTALACION_INMUEBLE','OperadorConservacionInmueble');
INSERT INTO `constantePlan` VALUES (75,'REGULAR','INSTALACION_INMUEBLE','OperadorConservacionInmueble');
INSERT INTO `constantePlan` VALUES (76,'DEFICIENTE','INSTALACION_INMUEBLE','OperadorConservacionInmueble');
INSERT INTO `constantePlan` VALUES (77,'NACIONAL','ORIGEN_FINANCIAMIENTO',NULL);
INSERT INTO `constantePlan` VALUES (78,'PROVINCIAL','ORIGEN_FINANCIAMIENTO',NULL);
INSERT INTO `constantePlan` VALUES (79,'MUNICIPAL','ORIGEN_FINANCIAMIENTO',NULL);
INSERT INTO `constantePlan` VALUES (80,'MAYOR','OPERADOR_LOGICO',NULL);
INSERT INTO `constantePlan` VALUES (81,'IGUAL','OPERADOR_LOGICO',NULL);
INSERT INTO `constantePlan` VALUES (82,'MENOR','OPERADOR_LOGICO',NULL);
INSERT INTO `constantePlan` VALUES (83,'LADRILLO','MATERIAL_PARED',NULL);
INSERT INTO `constantePlan` VALUES (84,'ADOBE','MATERIAL_PARED',NULL);
INSERT INTO `constantePlan` VALUES (85,'MADERA','MATERIAL_PARED',NULL);
INSERT INTO `constantePlan` VALUES (86,'CHAPA','MATERIAL_PARED',NULL);
INSERT INTO `constantePlan` VALUES (87,'CHORIZO','MATERIAL_PARED',NULL);
INSERT INTO `constantePlan` VALUES (88,'CERAMICA','MATERIAL_PISO',NULL);
INSERT INTO `constantePlan` VALUES (89,'MADERA','MATERIAL_PISO',NULL);
INSERT INTO `constantePlan` VALUES (90,'CEMENTO','MATERIAL_PISO',NULL);
INSERT INTO `constantePlan` VALUES (91,'TIERRA','MATERIAL_PISO',NULL);
INSERT INTO `constantePlan` VALUES (92,'MEMBRANA','MATERIAL_TECHO',NULL);
INSERT INTO `constantePlan` VALUES (93,'BALDOSA','MATERIAL_TECHO',NULL);
INSERT INTO `constantePlan` VALUES (94,'PIZARRA','MATERIAL_TECHO',NULL);
INSERT INTO `constantePlan` VALUES (95,'CHAPA','MATERIAL_TECHO',NULL);
INSERT INTO `constantePlan` VALUES (96,'FIBROCEMENTO','MATERIAL_TECHO',NULL);
INSERT INTO `constantePlan` VALUES (97,'CARTON','MATERIAL_TECHO',NULL);
INSERT INTO `constantePlan` VALUES (98,'PALMA','MATERIAL_TECHO',NULL);
INSERT INTO `constantePlan` VALUES (99,'INICIO_VIGENCIA','OPERACION_LOGICA','OperadorInicioVigencia');
INSERT INTO `constantePlan` VALUES (100,'CANTIDAD_INTEGRANTES','OPERACION_LOGICA','OperadorCantidadIntegrantes');
INSERT INTO `constantePlan` VALUES (101,'INGRESOS','OPERACION_LOGICA','OperadorIngresos');
/*!40000 ALTER TABLE `constantePlan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credito`
--

DROP TABLE IF EXISTS `credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credito` (
  `id_Credito` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `entidad` varchar(60) NOT NULL,
  `monto` float DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_Credito`),
  KEY `fk_CreditoFamilia_idx` (`idFamilia`),
  CONSTRAINT `FK_he5n53ad7owagymx9qsbmt432` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credito`
--

LOCK TABLES `credito` WRITE;
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `direccion` (
  `id_Direccion` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(60) NOT NULL,
  `numero` varchar(60) NOT NULL,
  `dpto` varchar(45) DEFAULT NULL,
  `barrio` varchar(60) NOT NULL,
  `latitud` float NOT NULL,
  `longitud` float NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Direccion`),
  KEY `fk_DireccionLocalidad_idx` (`idLocalidad`),
  CONSTRAINT `fk_direccion_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`id_Localidad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'calleMODIFICADO','1232000','dptoMODIFICADO','barrioMODIFICADO',1232000,4562000,1,0);
INSERT INTO `direccion` VALUES (2,'Acalle22222','0123','Adpto','Abarrio',123,456,1,0);
INSERT INTO `direccion` VALUES (4,'Independencia','1446','','',-31.4324,-64.191,1,1);
INSERT INTO `direccion` VALUES (5,'Independencia','1446','','',-31.4324,-64.191,1,1);
INSERT INTO `direccion` VALUES (6,'Argentina','1446','','',-31.4324,-64.1909,1,1);
INSERT INTO `direccion` VALUES (7,'Independencia','1180','','asdasd',-31.4295,-64.1898,8,1);
INSERT INTO `direccion` VALUES (8,'Argentina','1446','','',-31.4324,-64.1909,1,1);
INSERT INTO `direccion` VALUES (9,'Argentina','1446','','saxfsd',-31.4324,-64.1909,8,1);
INSERT INTO `direccion` VALUES (10,'Independencia','1180','','',-31.4295,-64.1898,1,1);
INSERT INTO `direccion` VALUES (11,'Independencia','1180','','',-31.4295,-64.1898,1,1);
INSERT INTO `direccion` VALUES (12,'Argentina','1446','','ASD',-31.4324,-64.1909,1,1);
INSERT INTO `direccion` VALUES (13,'Argentina','1446','','ASD',-31.4324,-64.1909,1,1);
INSERT INTO `direccion` VALUES (14,'Independencia','1446','','',-31.4324,-64.191,1,1);
INSERT INTO `direccion` VALUES (15,'Independencia','1446','','',-31.4324,-64.191,1,1);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discapacidad`
--

DROP TABLE IF EXISTS `discapacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discapacidad` (
  `id_Discapacidad` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `isActive` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id_Discapacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discapacidad`
--

LOCK TABLES `discapacidad` WRITE;
/*!40000 ALTER TABLE `discapacidad` DISABLE KEYS */;
INSERT INTO `discapacidad` VALUES (1,'No tiene','');
INSERT INTO `discapacidad` VALUES (2,'Sensorial','');
INSERT INTO `discapacidad` VALUES (3,'Motora','');
INSERT INTO `discapacidad` VALUES (4,'Cognitivo/Intelectual','');
INSERT INTO `discapacidad` VALUES (5,'Sensorial','');
INSERT INTO `discapacidad` VALUES (6,'Motora','\0');
INSERT INTO `discapacidad` VALUES (7,'Cognitivo/Intelectual','\0');
/*!40000 ALTER TABLE `discapacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `id_Estado` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `descipcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadocivil`
--

DROP TABLE IF EXISTS `estadocivil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadocivil` (
  `id_EstadoCivil` int(11) NOT NULL AUTO_INCREMENT,
  `estadoCivil` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_EstadoCivil`),
  KEY `FK_79xdcqd3e5f4n49c772u8pou4` (`idConstante`),
  CONSTRAINT `FK_79xdcqd3e5f4n49c772u8pou4` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (1,'Soltero/a',1,33);
INSERT INTO `estadocivil` VALUES (2,'Casado/a',1,34);
INSERT INTO `estadocivil` VALUES (3,'Conviviente',1,35);
INSERT INTO `estadocivil` VALUES (4,'Separado/a',1,36);
INSERT INTO `estadocivil` VALUES (5,'Divorciado/a',1,37);
INSERT INTO `estadocivil` VALUES (6,'Viudo/a',1,38);
/*!40000 ALTER TABLE `estadocivil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudios`
--

DROP TABLE IF EXISTS `estudios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudios` (
  `id_Estudios` int(11) NOT NULL AUTO_INCREMENT,
  `estudios` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Estudios`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudios`
--

LOCK TABLES `estudios` WRITE;
/*!40000 ALTER TABLE `estudios` DISABLE KEYS */;
INSERT INTO `estudios` VALUES (1,'nivel inicial',1);
INSERT INTO `estudios` VALUES (2,'Nivel primario incompleto',1);
INSERT INTO `estudios` VALUES (3,'Nivel primario completo',1);
INSERT INTO `estudios` VALUES (4,'Nivel secundario incompleto',1);
INSERT INTO `estudios` VALUES (5,'Nivel secundario completo',1);
INSERT INTO `estudios` VALUES (6,'Nivel terciaro/universitario incompleto',1);
INSERT INTO `estudios` VALUES (7,'Nivel terciario/universitario completo',1);
/*!40000 ALTER TABLE `estudios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familia`
--

DROP TABLE IF EXISTS `familia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familia` (
  `id_Familia` int(11) NOT NULL AUTO_INCREMENT,
  `idSolucionHabitacional` int(11) NOT NULL,
  `idSituacionInmueble` int(11) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  `idTelefono` int(11) DEFAULT NULL,
  `ingresoNetoFamiliar` float NOT NULL DEFAULT '0',
  `tarjetaCredito` tinyint(1) NOT NULL DEFAULT '0',
  `antiguedadResidencia` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `documentacionCompleta` bit(1) NOT NULL,
  `fechaAlta` datetime DEFAULT NULL,
  `codigoDeAlta` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Familia`),
  KEY `fk_FamiliaSituacionInmueble_idx` (`idSituacionInmueble`),
  KEY `fk_FamiliaDireccion_idx` (`idDireccion`),
  KEY `fk_FamiliaTelefono_idx` (`idTelefono`),
  KEY `fk_FamiliaPlan_idx` (`idSolucionHabitacional`),
  CONSTRAINT `fk_familia_1` FOREIGN KEY (`idSituacionInmueble`) REFERENCES `situacioninmueble` (`id_SituacionInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_familia_2` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`id_Direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_familia_3` FOREIGN KEY (`idSolucionHabitacional`) REFERENCES `solucionhabitacional` (`id_SolucionHabitacional`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_familia_4` FOREIGN KEY (`idTelefono`) REFERENCES `telefono` (`id_Telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
INSERT INTO `familia` VALUES (1,1,2,4,3,0,0,1,1,'\0','2018-02-18 11:34:15','a93ac21:161babcdd28:-7fd2');
INSERT INTO `familia` VALUES (2,1,1,4,3,0,0,5,1,'\0','2018-02-18 11:34:30','a93ac21:161babcdd28:-7fd1');
INSERT INTO `familia` VALUES (3,1,4,4,3,10,0,10,1,'\0','2018-02-21 20:07:19','a93ac21:161babcdd28:-7fd0');
INSERT INTO `familia` VALUES (4,1,7,4,3,0,0,4,1,'','2018-02-18 11:34:34','a93ac21:161babcdd28:-7fcf');
INSERT INTO `familia` VALUES (5,1,12,4,3,0,0,20,1,'\0','2018-02-18 11:34:35','a93ac21:161babcdd28:-7fce');
INSERT INTO `familia` VALUES (6,1,10,4,3,0,0,25,1,'\0','2018-02-18 11:34:36','a93ac21:161babcdd28:-7fcd');
INSERT INTO `familia` VALUES (7,1,15,4,3,0,0,30,1,'','2018-02-18 11:34:37','a93ac21:161babcdd28:-7fcc');
INSERT INTO `familia` VALUES (8,1,5,5,4,0,0,5,1,'\0','2018-02-18 11:39:48','a93ac21:161babcdd28:-7fcb');
INSERT INTO `familia` VALUES (9,4,22,8,NULL,3211,0,3,1,'\0','2018-02-21 20:07:19','a93ac21:161babcdd28:-7fca');
INSERT INTO `familia` VALUES (10,2,4,11,NULL,1,0,15,1,'\0','2018-02-21 20:07:19','a93ac21:161babcdd28:-7fc9');
INSERT INTO `familia` VALUES (11,1,1,14,7,0,0,1795,0,'\0','2018-02-20 20:36:35','3f650c0e:161b5910c5c:-7fd4');
INSERT INTO `familia` VALUES (12,1,1,15,8,0,0,1795,0,'\0','2018-02-20 20:58:03','-152b1cca:161b5a4e35a:-7fd4');
/*!40000 ALTER TABLE `familia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble`
--

DROP TABLE IF EXISTS `inmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmueble` (
  `id_Inmueble` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `idPared` int(11) DEFAULT NULL,
  `idMaterialPiso` int(11) DEFAULT NULL,
  `idTecho` int(11) DEFAULT NULL,
  `idPoseeLuz` int(11) DEFAULT NULL,
  `idServicioAgua` int(11) DEFAULT NULL,
  `cantidadHabitaciones` int(11) DEFAULT NULL,
  `zonaInsalubre` tinyint(1) NOT NULL,
  `cantidadCamas` int(11) DEFAULT NULL,
  `promiscuidad` tinyint(1) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `instalacionAgua` int(11) DEFAULT NULL,
  `instalacionCloacal` int(11) DEFAULT NULL,
  `instalacionElectrica` int(11) DEFAULT NULL,
  `instalacionGas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Inmueble`),
  KEY `fk_InmuebleFamilia_idx` (`idFamilia`),
  KEY `fk_InmuebleMaterialPiso_idx` (`idMaterialPiso`),
  KEY `fk_InmueblePoseeLuz_idx` (`idPoseeLuz`),
  KEY `fk_InmueblePared_idx` (`idPared`),
  KEY `fk_InmuebleTecho_idx` (`idTecho`),
  KEY `fk_InmuebleServicioAgua_idx` (`idServicioAgua`),
  KEY `FK_2jecaw5lytoym2pe5sxujefp1` (`instalacionAgua`),
  KEY `FK_11cgybynxtsiqek383myv92cm` (`instalacionCloacal`),
  KEY `FK_5c3awyuiorfc2rhrw3y9o10gw` (`instalacionElectrica`),
  KEY `FK_p10w7s3xf4jmyxl1iq6137v0n` (`instalacionGas`),
  CONSTRAINT `FK_11cgybynxtsiqek383myv92cm` FOREIGN KEY (`instalacionCloacal`) REFERENCES `instalacionInmueble` (`id_InstalacionInmueble`),
  CONSTRAINT `FK_2jecaw5lytoym2pe5sxujefp1` FOREIGN KEY (`instalacionAgua`) REFERENCES `instalacionInmueble` (`id_InstalacionInmueble`),
  CONSTRAINT `FK_5c3awyuiorfc2rhrw3y9o10gw` FOREIGN KEY (`instalacionElectrica`) REFERENCES `instalacionInmueble` (`id_InstalacionInmueble`),
  CONSTRAINT `FK_fgxwjm8msjfq8kldb20wmimnq` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`),
  CONSTRAINT `FK_p10w7s3xf4jmyxl1iq6137v0n` FOREIGN KEY (`instalacionGas`) REFERENCES `instalacionInmueble` (`id_InstalacionInmueble`),
  CONSTRAINT `fk_InmuebleMaterialPiso` FOREIGN KEY (`idMaterialPiso`) REFERENCES `materialpiso` (`id_MaterialPiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmueblePared` FOREIGN KEY (`idPared`) REFERENCES `pared` (`id_Pared`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmueblePoseeLuz` FOREIGN KEY (`idPoseeLuz`) REFERENCES `poseeluz` (`id_PoseeLuz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmuebleServicioAgua` FOREIGN KEY (`idServicioAgua`) REFERENCES `servicioagua` (`id_ServicioAgua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmuebleTecho` FOREIGN KEY (`idTecho`) REFERENCES `techo` (`id_Techo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble`
--

LOCK TABLES `inmueble` WRITE;
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
INSERT INTO `inmueble` VALUES (1,10,1,1,1,NULL,NULL,12,1,0,0,1,1,2,2,2);
INSERT INTO `inmueble` VALUES (2,3,2,2,2,NULL,NULL,12,1,0,0,1,2,3,3,3);
INSERT INTO `inmueble` VALUES (3,2,3,3,3,NULL,NULL,12,1,0,0,1,3,2,1,1);
INSERT INTO `inmueble` VALUES (6,5,4,4,4,NULL,NULL,12,1,0,0,1,3,2,1,1);
INSERT INTO `inmueble` VALUES (7,12,5,3,5,NULL,NULL,12,1,0,0,1,3,2,1,1);
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble_cocina`
--

DROP TABLE IF EXISTS `inmueble_cocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmueble_cocina` (
  `inmueble_id_Inmueble` int(11) NOT NULL,
  `cocina_id_Cocina` int(11) NOT NULL,
  UNIQUE KEY `UK_kh21ipi21ysb2rosjwuqmbgtw` (`cocina_id_Cocina`),
  KEY `FK_bipkqg392foxq0if1f5jkavf0` (`inmueble_id_Inmueble`),
  CONSTRAINT `FK_bipkqg392foxq0if1f5jkavf0` FOREIGN KEY (`inmueble_id_Inmueble`) REFERENCES `inmueble` (`id_Inmueble`),
  CONSTRAINT `FK_kh21ipi21ysb2rosjwuqmbgtw` FOREIGN KEY (`cocina_id_Cocina`) REFERENCES `cocina` (`id_Cocina`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble_cocina`
--

LOCK TABLES `inmueble_cocina` WRITE;
/*!40000 ALTER TABLE `inmueble_cocina` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmueble_cocina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inmueble_poseebano`
--

DROP TABLE IF EXISTS `inmueble_poseebano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inmueble_poseebano` (
  `inmueble_id_Inmueble` int(11) NOT NULL,
  `poseeBano_id_PoseeBano` int(11) NOT NULL,
  UNIQUE KEY `UK_cqkvky62gsik030np9jlcwl0o` (`poseeBano_id_PoseeBano`),
  KEY `FK_tqa6wx64g61pisbdvd43erpe1` (`inmueble_id_Inmueble`),
  CONSTRAINT `FK_cqkvky62gsik030np9jlcwl0o` FOREIGN KEY (`poseeBano_id_PoseeBano`) REFERENCES `poseebano` (`id_PoseeBano`),
  CONSTRAINT `FK_tqa6wx64g61pisbdvd43erpe1` FOREIGN KEY (`inmueble_id_Inmueble`) REFERENCES `inmueble` (`id_Inmueble`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble_poseebano`
--

LOCK TABLES `inmueble_poseebano` WRITE;
/*!40000 ALTER TABLE `inmueble_poseebano` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmueble_poseebano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instalacionInmueble`
--

DROP TABLE IF EXISTS `instalacionInmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instalacionInmueble` (
  `id_InstalacionInmueble` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `isActive` bit(1) NOT NULL,
  `severidad` int(11) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_InstalacionInmueble`),
  KEY `FK_5exjoruih02xl1b54efllxhqb` (`idConstante`),
  CONSTRAINT `FK_5exjoruih02xl1b54efllxhqb` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalacionInmueble`
--

LOCK TABLES `instalacionInmueble` WRITE;
/*!40000 ALTER TABLE `instalacionInmueble` DISABLE KEYS */;
INSERT INTO `instalacionInmueble` VALUES (1,'Bueno','',1,74);
INSERT INTO `instalacionInmueble` VALUES (2,'Regular','',2,75);
INSERT INTO `instalacionInmueble` VALUES (3,'Deficiente','',3,76);
/*!40000 ALTER TABLE `instalacionInmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidad` (
  `id_Localidad` int(11) NOT NULL AUTO_INCREMENT,
  `localidad` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_Localidad`),
  KEY `FK_k6frjrojfaqub9sy29it7pusx` (`idConstante`),
  CONSTRAINT `FK_k6frjrojfaqub9sy29it7pusx` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Laborde',1,29);
INSERT INTO `localidad` VALUES (8,'Cordoba',1,30);
/*!40000 ALTER TABLE `localidad` ENABLE KEYS */;
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
-- Table structure for table `motivocarecimiento`
--

DROP TABLE IF EXISTS `motivocarecimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motivocarecimiento` (
  `id_MotivoCarecimiento` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_MotivoCarecimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motivocarecimiento`
--

LOCK TABLES `motivocarecimiento` WRITE;
/*!40000 ALTER TABLE `motivocarecimiento` DISABLE KEYS */;
INSERT INTO `motivocarecimiento` VALUES (1,'Desalojo',1);
INSERT INTO `motivocarecimiento` VALUES (2,'Siniestro',1);
INSERT INTO `motivocarecimiento` VALUES (3,'Inundacion',1);
/*!40000 ALTER TABLE `motivocarecimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nacionalidad`
--

DROP TABLE IF EXISTS `nacionalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nacionalidad` (
  `id_Nacionalidad` int(11) NOT NULL AUTO_INCREMENT,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_Nacionalidad`),
  KEY `FK_me0krbk8w8eqo727h1lafutm0` (`idConstante`),
  CONSTRAINT `FK_me0krbk8w8eqo727h1lafutm0` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,1,'Argentino',31);
INSERT INTO `nacionalidad` VALUES (2,1,'Extranjero',32);
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `origenFinanciamiento`
--

DROP TABLE IF EXISTS `origenFinanciamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `origenFinanciamiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9pd6kcpsq5ipgruf1n8rnfyl0` (`idConstante`),
  CONSTRAINT `FK_9pd6kcpsq5ipgruf1n8rnfyl0` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `origenFinanciamiento`
--

LOCK TABLES `origenFinanciamiento` WRITE;
/*!40000 ALTER TABLE `origenFinanciamiento` DISABLE KEYS */;
INSERT INTO `origenFinanciamiento` VALUES (1,'Nacional',77);
INSERT INTO `origenFinanciamiento` VALUES (2,'Provincial',78);
INSERT INTO `origenFinanciamiento` VALUES (3,'Municipal',79);
/*!40000 ALTER TABLE `origenFinanciamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pared`
--

DROP TABLE IF EXISTS `pared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pared` (
  `id_Pared` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoPared` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `grietas` bit(1) NOT NULL,
  `humedad` bit(1) NOT NULL,
  `revoqueExterior` bit(1) NOT NULL,
  `revoqueInterior` bit(1) NOT NULL,
  PRIMARY KEY (`id_Pared`),
  KEY `fk_Pared_1_idx` (`idTipoPared`),
  CONSTRAINT `FK_dceikt3lffk6craydtipjwxhe` FOREIGN KEY (`idTipoPared`) REFERENCES `materialpiso` (`id_MaterialPiso`),
  CONSTRAINT `fk_pared_1` FOREIGN KEY (`idTipoPared`) REFERENCES `materialpared` (`id_MaterialPared`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pared`
--

LOCK TABLES `pared` WRITE;
/*!40000 ALTER TABLE `pared` DISABLE KEYS */;
INSERT INTO `pared` VALUES (1,4,1,'','','','');
INSERT INTO `pared` VALUES (2,2,1,'','','\0','\0');
INSERT INTO `pared` VALUES (3,2,1,'','','','\0');
INSERT INTO `pared` VALUES (4,3,1,'','','\0','\0');
INSERT INTO `pared` VALUES (5,1,1,'','','','\0');
INSERT INTO `pared` VALUES (6,2,1,'','','\0','\0');
/*!40000 ALTER TABLE `pared` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `particularidades`
--

DROP TABLE IF EXISTS `particularidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `particularidades` (
  `id_Particularidades` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `idCaracteristicaParticular` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Particularidades`),
  KEY `fk_ParticularidadesFamilia_idx` (`idFamilia`),
  KEY `fk_ParticularidadesCaracteristicaP_idx` (`idCaracteristicaParticular`),
  CONSTRAINT `FK_94imq9kicxkux40507c0wiysu` FOREIGN KEY (`idCaracteristicaParticular`) REFERENCES `caracteristicaparticular` (`id_CaracteristicaParticular`),
  CONSTRAINT `FK_qatnamda7q7u5qxyt62qyx7jt` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `particularidades`
--

LOCK TABLES `particularidades` WRITE;
/*!40000 ALTER TABLE `particularidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `particularidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `id_Persona` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellido` varchar(60) NOT NULL,
  `nroDocumento` varchar(45) NOT NULL,
  `nroCuil` varchar(45) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `ingresoNeto` float NOT NULL,
  `mail` varchar(60) DEFAULT NULL,
  `nroCarnetJubilacion` varchar(45) CHARACTER SET big5 DEFAULT NULL,
  `idTipoDocumento` int(11) NOT NULL,
  `idFamilia` int(11) DEFAULT NULL,
  `idDependenciaLaboral` int(11) NOT NULL,
  `idSexo` int(11) NOT NULL,
  `idEstadoCivil` int(11) NOT NULL,
  `idNacionalidad` int(11) NOT NULL,
  `idLocalidad` int(11) NOT NULL,
  `idEstudios` int(11) NOT NULL,
  `idProfesion` int(11) NOT NULL,
  `idRolFamiliar` int(11) NOT NULL,
  `idTelefono` int(11) DEFAULT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idTipoCapacidadConstructiva` int(11) DEFAULT NULL,
  `descripcionEnfermedad` varchar(255) DEFAULT NULL,
  `enfermedadCronica` bit(1) DEFAULT NULL,
  `idDiscapacidad` int(11) DEFAULT NULL,
  `subsidio_id_Subsidio` int(11) DEFAULT NULL,
  `adjudicatarioPlanEstatal` bit(1) DEFAULT NULL,
  `situacionesEspeciales_id_SituacionesEspeciales` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Persona`),
  KEY `id_DependenciaLaboral_idx` (`idDependenciaLaboral`),
  KEY `id_TipoDocumento_idx` (`idTipoDocumento`),
  KEY `id_Familia_idx` (`idFamilia`),
  KEY `id_Sexo_idx` (`idSexo`),
  KEY `id_EstadoCivil_idx` (`idEstadoCivil`),
  KEY `id_Nacionalidad_idx` (`idNacionalidad`),
  KEY `id_Localidad_idx` (`idLocalidad`),
  KEY `id_Profesion_idx` (`idProfesion`),
  KEY `id_RolFamiliar_idx` (`idRolFamiliar`),
  KEY `fk_Estudios_idx` (`idEstudios`),
  KEY `fk_Telefono_idx` (`idTelefono`),
  KEY `FK_f1kknxxbfwb39eqlufwooxds2` (`idTipoCapacidadConstructiva`),
  KEY `FK_rrb9eur6fqktoy94fuloyryli` (`idDiscapacidad`),
  KEY `FK_tmwh7a6ngatxgyudrjufbqg95` (`subsidio_id_Subsidio`),
  KEY `FK_mku2neln905pj1dj8jncckitd` (`situacionesEspeciales_id_SituacionesEspeciales`),
  CONSTRAINT `FK_f1kknxxbfwb39eqlufwooxds2` FOREIGN KEY (`idTipoCapacidadConstructiva`) REFERENCES `tipocapacidadconstructiva` (`id_TipoCapacidadConstructiva`),
  CONSTRAINT `FK_mku2neln905pj1dj8jncckitd` FOREIGN KEY (`situacionesEspeciales_id_SituacionesEspeciales`) REFERENCES `SituacionesEspeciales` (`id_SituacionesEspeciales`),
  CONSTRAINT `FK_rrb9eur6fqktoy94fuloyryli` FOREIGN KEY (`idDiscapacidad`) REFERENCES `discapacidad` (`id_Discapacidad`),
  CONSTRAINT `FK_tmwh7a6ngatxgyudrjufbqg95` FOREIGN KEY (`subsidio_id_Subsidio`) REFERENCES `Subsidio` (`id_Subsidio`),
  CONSTRAINT `fk_persona_1` FOREIGN KEY (`idLocalidad`) REFERENCES `localidad` (`id_Localidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_10` FOREIGN KEY (`idEstudios`) REFERENCES `estudios` (`id_Estudios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_11` FOREIGN KEY (`idTelefono`) REFERENCES `telefono` (`id_Telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_2` FOREIGN KEY (`idDependenciaLaboral`) REFERENCES `situacionlaboral` (`id_DependenciaLaboral`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_3` FOREIGN KEY (`idTipoDocumento`) REFERENCES `tipodocumento` (`id_TipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_4` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_5` FOREIGN KEY (`idSexo`) REFERENCES `sexo` (`id_Sexo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_6` FOREIGN KEY (`idEstadoCivil`) REFERENCES `estadocivil` (`id_EstadoCivil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_7` FOREIGN KEY (`idNacionalidad`) REFERENCES `nacionalidad` (`id_Nacionalidad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_8` FOREIGN KEY (`idProfesion`) REFERENCES `profesion` (`id_Profesion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_9` FOREIGN KEY (`idRolFamiliar`) REFERENCES `rolfamiliar` (`id_RolFamiliar`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'nicolas','monaldi','34914250','2034914250','1990-12-02',0,'asd@das',NULL,1,1,5,1,1,1,1,6,2,1,NULL,1,NULL,'','\0',NULL,2,'\0',NULL);
INSERT INTO `persona` VALUES (2,'nicolas','monaldi','34914250','2034914250','1990-12-02',0,'asd@das','12341234',1,1,5,1,1,1,1,6,2,1,NULL,1,NULL,'','',2,NULL,'',2);
INSERT INTO `persona` VALUES (3,'pikachu','dragon ball','34914250','2034914250','1990-12-02',0,'asd@das',NULL,1,2,5,2,1,1,1,6,2,1,NULL,1,NULL,'','\0',1,NULL,'\0',4);
INSERT INTO `persona` VALUES (4,'goku','digimon','34914250','2034914250','1990-12-02',0,'asd@das','45546',1,3,5,1,1,2,1,6,2,1,NULL,1,NULL,'','\0',4,NULL,'\0',NULL);
INSERT INTO `persona` VALUES (5,'saitama','pokemon','34914250','2034914250','1990-12-02',0,'asd@das',NULL,1,4,1,1,2,1,8,6,2,1,NULL,1,NULL,'','\0',NULL,NULL,'\0',NULL);
INSERT INTO `persona` VALUES (6,'seiya','one punch','34914250','2034914250','1990-12-02',0,'asd@das','123123',1,5,2,1,3,1,1,6,2,1,NULL,1,NULL,'','\0',2,NULL,'\0',1);
INSERT INTO `persona` VALUES (7,'rick','calavera','34914250','2034914250','1980-12-02',0,'asd@das',NULL,1,6,3,1,4,2,8,6,2,1,NULL,1,NULL,'','',1,NULL,'',NULL);
INSERT INTO `persona` VALUES (26,'manny','threepwood','34914250','2034914250','1960-12-15',0,'asd@das',NULL,1,7,4,1,5,1,1,6,2,1,NULL,1,NULL,'','\0',NULL,NULL,'\0',NULL);
INSERT INTO `persona` VALUES (27,'guybrush','marvel','34914250','2034914250','1940-12-27',0,'asd@das','2341234',1,8,5,1,6,1,1,6,2,1,NULL,1,NULL,'','\0',4,NULL,'\0',NULL);
INSERT INTO `persona` VALUES (28,'batman','tropical','34914250','2034914250','1950-12-14',0,'asd@das',NULL,1,7,5,1,1,2,8,6,2,1,NULL,1,NULL,'','',2,NULL,'',NULL);
INSERT INTO `persona` VALUES (29,'gengar','IEEIAA','34914250','2034914250','1990-12-02',0,'asd@das','56745',1,8,5,1,1,1,1,6,2,1,NULL,1,NULL,'','\0',2,NULL,'\0',3);
INSERT INTO `persona` VALUES (30,'gastly','IEEIAA','34914250','2034914250','1990-12-02',0,'asd@das',NULL,1,8,5,1,1,1,1,6,2,1,NULL,1,NULL,'','\0',1,NULL,'\0',NULL);
INSERT INTO `persona` VALUES (31,'hunter','IEEIAA','34914250','2034914250','1990-12-02',0,'asd@das',NULL,1,8,5,2,1,1,1,6,2,1,NULL,1,NULL,'','\0',3,NULL,'\0',NULL);
INSERT INTO `persona` VALUES (32,'Nina','Kraviz','123331','121333','1233-12-11',3211,'n@n.com',NULL,1,9,1,2,2,2,1,5,3,1,5,1,NULL,'asd','\0',7,3,'\0',5);
INSERT INTO `persona` VALUES (33,'tomas','cobragay','555666','2154','1111-11-11',1,'n@n.com',NULL,1,10,5,2,3,2,1,2,1,1,NULL,1,NULL,'','\0',2,4,'',6);
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_tipocapacidadconstructiva`
--

DROP TABLE IF EXISTS `persona_tipocapacidadconstructiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_tipocapacidadconstructiva` (
  `persona_id_Persona` int(11) NOT NULL,
  `capacidadesConstructivas_id_TipoCapacidadConstructiva` int(11) NOT NULL,
  KEY `FK_ptyqacchv8ps8s0603jsywgfo` (`capacidadesConstructivas_id_TipoCapacidadConstructiva`),
  KEY `FK_8odmcr2excsc9rt3l9epuxpqb` (`persona_id_Persona`),
  CONSTRAINT `FK_8odmcr2excsc9rt3l9epuxpqb` FOREIGN KEY (`persona_id_Persona`) REFERENCES `persona` (`id_Persona`),
  CONSTRAINT `FK_ptyqacchv8ps8s0603jsywgfo` FOREIGN KEY (`capacidadesConstructivas_id_TipoCapacidadConstructiva`) REFERENCES `tipocapacidadconstructiva` (`id_TipoCapacidadConstructiva`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_tipocapacidadconstructiva`
--

LOCK TABLES `persona_tipocapacidadconstructiva` WRITE;
/*!40000 ALTER TABLE `persona_tipocapacidadconstructiva` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_tipocapacidadconstructiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `id_Plan` int(11) NOT NULL AUTO_INCREMENT,
  `idSolucionHabitacional` int(11) NOT NULL,
  `fechaAlta` date NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `nombre` varchar(255) DEFAULT NULL,
  `idOrigenFinanciamiento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_Plan`),
  KEY `fk_plan_1_idx` (`idSolucionHabitacional`),
  KEY `FK_5oxjqb98fye9h63mkyetabvvi` (`idOrigenFinanciamiento`),
  CONSTRAINT `FK_5oxjqb98fye9h63mkyetabvvi` FOREIGN KEY (`idOrigenFinanciamiento`) REFERENCES `origenFinanciamiento` (`id`),
  CONSTRAINT `fk_plan_1` FOREIGN KEY (`idSolucionHabitacional`) REFERENCES `solucionhabitacional` (`id_SolucionHabitacional`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
INSERT INTO `plan` VALUES (1,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (2,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (3,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (4,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (5,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (6,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (7,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (8,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (9,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (10,1,'2018-01-28',1,'test',1);
INSERT INTO `plan` VALUES (11,1,'2018-02-18',0,'plan prueba',1);
INSERT INTO `plan` VALUES (12,4,'2018-02-18',0,'prueba',2);
INSERT INTO `plan` VALUES (13,4,'2018-02-18',0,'erre',2);
INSERT INTO `plan` VALUES (14,3,'2018-02-18',0,'erre2',2);
INSERT INTO `plan` VALUES (15,4,'2018-02-18',0,'dfg',2);
INSERT INTO `plan` VALUES (16,2,'2018-02-18',0,'loreee',2);
INSERT INTO `plan` VALUES (17,2,'2018-02-18',0,'eeeee',2);
INSERT INTO `plan` VALUES (18,1,'2018-02-18',0,'eerrrrrwww',3);
INSERT INTO `plan` VALUES (19,1,'2018-02-18',0,'dfdf',2);
INSERT INTO `plan` VALUES (20,2,'2018-02-18',0,'sdf',2);
INSERT INTO `plan` VALUES (21,2,'2018-02-18',0,'ghj',3);
INSERT INTO `plan` VALUES (22,3,'2018-02-19',0,'hjk',1);
INSERT INTO `plan` VALUES (23,2,'2018-02-19',0,'sadgfdf',1);
INSERT INTO `plan` VALUES (24,2,'2018-02-19',0,'asdddd',2);
INSERT INTO `plan` VALUES (25,1,'2018-02-19',0,'asddddd',3);
INSERT INTO `plan` VALUES (26,1,'2018-02-19',0,'ftyuj',1);
INSERT INTO `plan` VALUES (27,4,'2018-02-19',0,'MAYORES 65',2);
INSERT INTO `plan` VALUES (28,4,'2018-02-19',0,'EXCOMBATIENTES',2);
INSERT INTO `plan` VALUES (29,4,'2018-02-19',0,'enfermedades cronicas',2);
INSERT INTO `plan` VALUES (30,4,'2018-02-19',0,'discapacidad',2);
INSERT INTO `plan` VALUES (31,4,'2018-02-19',0,'asociacion gremial',2);
INSERT INTO `plan` VALUES (32,4,'2018-02-19',0,'asociacion entidad publica',2);
INSERT INTO `plan` VALUES (33,4,'2018-02-19',0,'jubilacion',2);
INSERT INTO `plan` VALUES (34,4,'2018-02-19',0,'hogar unipersonal',2);
INSERT INTO `plan` VALUES (35,4,'2018-02-19',0,'Desalojo/catastrofe',2);
INSERT INTO `plan` VALUES (36,4,'2018-02-19',0,'zona insegura',2);
INSERT INTO `plan` VALUES (37,4,'2018-02-19',0,'adjudicatario plan estatal',2);
INSERT INTO `plan` VALUES (38,2,'2018-02-20',0,'plan quinquenal',2);
INSERT INTO `plan` VALUES (39,2,'2018-02-21',0,'POSEE INMUEBLE',2);
INSERT INTO `plan` VALUES (40,1,'2018-02-21',0,'SITUACION INMUEBLE',3);
INSERT INTO `plan` VALUES (41,3,'2018-02-21',0,'HACINAMIENTO',2);
INSERT INTO `plan` VALUES (42,3,'2018-02-21',0,'PROMISCUIDAD',2);
INSERT INTO `plan` VALUES (43,3,'2018-02-21',0,'ESTADO INMUEBLE',2);
INSERT INTO `plan` VALUES (44,2,'2018-02-22',0,'ESTADO INMUEBLE',2);
INSERT INTO `plan` VALUES (45,3,'2018-02-24',0,'CALMAT',3);
INSERT INTO `plan` VALUES (46,2,'2018-02-25',0,'inicio vigencia',3);
INSERT INTO `plan` VALUES (47,3,'2018-02-25',0,'CANTIDAD INTEGRANTES',2);
INSERT INTO `plan` VALUES (48,1,'2018-02-25',1,'INGRESOS',2);
INSERT INTO `plan` VALUES (49,2,'2018-02-25',1,'ds',2);
INSERT INTO `plan` VALUES (50,4,'2018-02-25',0,'kajshd',2);
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseeagua`
--

DROP TABLE IF EXISTS `poseeagua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poseeagua` (
  `id_poseeAgua` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_poseeAgua`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseeagua`
--

LOCK TABLES `poseeagua` WRITE;
/*!40000 ALTER TABLE `poseeagua` DISABLE KEYS */;
INSERT INTO `poseeagua` VALUES (1,'Conectado o corriente de red publica',1);
INSERT INTO `poseeagua` VALUES (2,'De tanque publico cargado con camion de distribucion',1);
INSERT INTO `poseeagua` VALUES (3,'De tanque domiciliario cargado con camion de distribucion',1);
INSERT INTO `poseeagua` VALUES (4,'De aljibe o pozo',1);
INSERT INTO `poseeagua` VALUES (5,'Canilla dentro del lote',1);
INSERT INTO `poseeagua` VALUES (6,'Canilla publica',1);
/*!40000 ALTER TABLE `poseeagua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseebano`
--

DROP TABLE IF EXISTS `poseebano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poseebano` (
  `id_PoseeBano` int(11) NOT NULL AUTO_INCREMENT,
  `idInmueble` int(11) NOT NULL,
  `DescargaInodoro` tinyint(1) NOT NULL,
  `Compartido` tinyint(1) NOT NULL,
  `idTipoBano` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idPoseeBano` int(11) DEFAULT NULL,
  `poseeBano_id_Inmueble` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_PoseeBano`),
  KEY `fk_PoseeBañoInmueble_idx` (`idInmueble`),
  KEY `fk_poseebano_1_idx` (`idTipoBano`),
  KEY `FK_ixmwtxtq47fuenr170taupyvx` (`idPoseeBano`),
  KEY `FK_q3k31xidnvav4p3h1ydl06thx` (`poseeBano_id_Inmueble`),
  CONSTRAINT `FK_2r6lyto3uaox1192m96njn5og` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`id_Inmueble`),
  CONSTRAINT `FK_ixmwtxtq47fuenr170taupyvx` FOREIGN KEY (`idPoseeBano`) REFERENCES `inmueble` (`id_Inmueble`),
  CONSTRAINT `FK_q3k31xidnvav4p3h1ydl06thx` FOREIGN KEY (`poseeBano_id_Inmueble`) REFERENCES `inmueble` (`id_Inmueble`),
  CONSTRAINT `fk_poseebano_1` FOREIGN KEY (`idTipoBano`) REFERENCES `tipobano` (`id_tipobano`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseebano`
--

LOCK TABLES `poseebano` WRITE;
/*!40000 ALTER TABLE `poseebano` DISABLE KEYS */;
/*!40000 ALTER TABLE `poseebano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseecocina`
--

DROP TABLE IF EXISTS `poseecocina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poseecocina` (
  `id_poseeCocina` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_poseeCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseecocina`
--

LOCK TABLES `poseecocina` WRITE;
/*!40000 ALTER TABLE `poseecocina` DISABLE KEYS */;
INSERT INTO `poseecocina` VALUES (1,'Cocina instalada completa',1);
INSERT INTO `poseecocina` VALUES (2,'Cocina instalada incompleta',1);
/*!40000 ALTER TABLE `poseecocina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `poseeluz`
--

DROP TABLE IF EXISTS `poseeluz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `poseeluz` (
  `id_PoseeLuz` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_PoseeLuz`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `poseeluz`
--

LOCK TABLES `poseeluz` WRITE;
/*!40000 ALTER TABLE `poseeluz` DISABLE KEYS */;
INSERT INTO `poseeluz` VALUES (1,'Red',1);
INSERT INTO `poseeluz` VALUES (2,'Generacion propia a motor',1);
INSERT INTO `poseeluz` VALUES (3,'Generacion propia por otro medio',1);
/*!40000 ALTER TABLE `poseeluz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privileges`
--

DROP TABLE IF EXISTS `privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_m2tnonbcaquofx1ccy060ejyc` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privileges`
--

LOCK TABLES `privileges` WRITE;
/*!40000 ALTER TABLE `privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `procedenciaagua`
--

DROP TABLE IF EXISTS `procedenciaagua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `procedenciaagua` (
  `id_ProcedenciaAgua` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(100) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_ProcedenciaAgua`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `procedenciaagua`
--

LOCK TABLES `procedenciaagua` WRITE;
/*!40000 ALTER TABLE `procedenciaagua` DISABLE KEYS */;
INSERT INTO `procedenciaagua` VALUES (1,'Pozo',1);
INSERT INTO `procedenciaagua` VALUES (2,'Red publica',1);
INSERT INTO `procedenciaagua` VALUES (3,'Perforacion con bomba a motor',1);
INSERT INTO `procedenciaagua` VALUES (4,'Perforacion con bomba manual',1);
INSERT INTO `procedenciaagua` VALUES (5,'Transporte por cisterna',1);
INSERT INTO `procedenciaagua` VALUES (6,'Agua de lluvia/Rio/Canal/Arroyo',1);
/*!40000 ALTER TABLE `procedenciaagua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesion`
--

DROP TABLE IF EXISTS `profesion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profesion` (
  `id_Profesion` int(11) NOT NULL AUTO_INCREMENT,
  `profesion` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Profesion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesion`
--

LOCK TABLES `profesion` WRITE;
/*!40000 ALTER TABLE `profesion` DISABLE KEYS */;
INSERT INTO `profesion` VALUES (1,'Ninguna',1);
INSERT INTO `profesion` VALUES (2,'Profesional',1);
INSERT INTO `profesion` VALUES (3,'Tecnico',1);
/*!40000 ALTER TABLE `profesion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleprivileges`
--

DROP TABLE IF EXISTS `roleprivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roleprivileges` (
  `idRole` int(11) NOT NULL,
  `idPrivilege` int(11) NOT NULL,
  PRIMARY KEY (`idRole`,`idPrivilege`),
  KEY `FK_3j7dy62pf0gdsjvsdcm95943e` (`idPrivilege`),
  CONSTRAINT `FK_3j7dy62pf0gdsjvsdcm95943e` FOREIGN KEY (`idPrivilege`) REFERENCES `privileges` (`id`),
  CONSTRAINT `FK_6raf87bs33bcb2ub3gtbaucfy` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleprivileges`
--

LOCK TABLES `roleprivileges` WRITE;
/*!40000 ALTER TABLE `roleprivileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `roleprivileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ofx66keruapi6vyqpv6f2or37` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_ADMIN');
INSERT INTO `roles` VALUES (2,'ROLE_ENTRY');
INSERT INTO `roles` VALUES (3,'ROLE_PLAN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolfamiliar`
--

DROP TABLE IF EXISTS `rolfamiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rolfamiliar` (
  `id_RolFamiliar` int(11) NOT NULL AUTO_INCREMENT,
  `rolFamiliar` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `id_Profesion` int(11) NOT NULL,
  PRIMARY KEY (`id_RolFamiliar`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolfamiliar`
--

LOCK TABLES `rolfamiliar` WRITE;
/*!40000 ALTER TABLE `rolfamiliar` DISABLE KEYS */;
INSERT INTO `rolfamiliar` VALUES (1,'Jefe/a de familia',1,0);
INSERT INTO `rolfamiliar` VALUES (2,'Conyugue o Pareja',1,0);
INSERT INTO `rolfamiliar` VALUES (3,'Hijo(a) / Hijastro(a)',1,0);
INSERT INTO `rolfamiliar` VALUES (4,'Yerno / Nuera',1,0);
INSERT INTO `rolfamiliar` VALUES (5,'Nieto/a',1,0);
INSERT INTO `rolfamiliar` VALUES (6,'Padre / Madre',1,0);
INSERT INTO `rolfamiliar` VALUES (7,'Suegro/a',1,0);
INSERT INTO `rolfamiliar` VALUES (8,'Otro Familiar',1,0);
INSERT INTO `rolfamiliar` VALUES (9,'Otro no Familiar',1,0);
/*!40000 ALTER TABLE `rolfamiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicioagua`
--

DROP TABLE IF EXISTS `servicioagua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicioagua` (
  `id_ServicioAgua` int(11) NOT NULL AUTO_INCREMENT,
  `idPoseeAgua` int(11) NOT NULL,
  `idProcedenciaAgua` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_ServicioAgua`),
  KEY `fk_ServicioAgua_1_idx` (`idPoseeAgua`),
  KEY `fk_ServicioAgua_2_idx` (`idProcedenciaAgua`),
  CONSTRAINT `fk_servicioagua_1` FOREIGN KEY (`idPoseeAgua`) REFERENCES `poseeagua` (`id_poseeAgua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicioagua_2` FOREIGN KEY (`idProcedenciaAgua`) REFERENCES `procedenciaagua` (`id_ProcedenciaAgua`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicioagua`
--

LOCK TABLES `servicioagua` WRITE;
/*!40000 ALTER TABLE `servicioagua` DISABLE KEYS */;
/*!40000 ALTER TABLE `servicioagua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexo`
--

DROP TABLE IF EXISTS `sexo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sexo` (
  `id_Sexo` int(11) NOT NULL AUTO_INCREMENT,
  `sexo` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_Sexo`),
  KEY `FK_q9dhuf7flnt4u5kfal4ftvosu` (`idConstante`),
  CONSTRAINT `FK_q9dhuf7flnt4u5kfal4ftvosu` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino',1,27);
INSERT INTO `sexo` VALUES (2,'Femenino',1,28);
/*!40000 ALTER TABLE `sexo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sininmueble`
--

DROP TABLE IF EXISTS `sininmueble`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sininmueble` (
  `id_sininmueble` int(11) NOT NULL AUTO_INCREMENT,
  `ocupacionTerrenoFiscal` tinyint(1) NOT NULL DEFAULT '0',
  `ocupacionTerrenoPrivado` tinyint(1) NOT NULL DEFAULT '0',
  `comodatoEstado` tinyint(1) NOT NULL DEFAULT '0',
  `idCareceVivienda` int(11) DEFAULT NULL,
  `comodatoTrabajo` tinyint(1) NOT NULL DEFAULT '0',
  `idAlquiler` int(11) DEFAULT NULL,
  `comodatoPariente` tinyint(1) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_sininmueble`),
  KEY `fk_sininmueble_1_idx` (`idAlquiler`),
  KEY `fk_sininmueble_2_idx` (`idCareceVivienda`),
  CONSTRAINT `fk_sininmueble_1` FOREIGN KEY (`idAlquiler`) REFERENCES `alquiler` (`id_Alquiler`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sininmueble_2` FOREIGN KEY (`idCareceVivienda`) REFERENCES `carecevivienda` (`id_CareceVivienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sininmueble`
--

LOCK TABLES `sininmueble` WRITE;
/*!40000 ALTER TABLE `sininmueble` DISABLE KEYS */;
/*!40000 ALTER TABLE `sininmueble` ENABLE KEYS */;
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
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_SituacionInmueble`),
  KEY `FK_c3x8m4o5p0685pk2itaxvydjf` (`idConstante`),
  CONSTRAINT `FK_c3x8m4o5p0685pk2itaxvydjf` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacioninmueble`
--

LOCK TABLES `situacioninmueble` WRITE;
/*!40000 ALTER TABLE `situacioninmueble` DISABLE KEYS */;
INSERT INTO `situacioninmueble` VALUES (1,'Casa prestada',1,55);
INSERT INTO `situacioninmueble` VALUES (2,'Casa alquilada',1,56);
INSERT INTO `situacioninmueble` VALUES (3,'Departamento prestado',1,57);
INSERT INTO `situacioninmueble` VALUES (4,'Departamento alquilado',1,58);
INSERT INTO `situacioninmueble` VALUES (5,'Pieza en hotel, inquilinato o pensión',1,59);
INSERT INTO `situacioninmueble` VALUES (6,'Casilla o rancho en terreno propio',1,60);
INSERT INTO `situacioninmueble` VALUES (7,'Casilla o rancho en terreno no propio',1,61);
INSERT INTO `situacioninmueble` VALUES (8,'Vivienda móvil en terreno propio',1,62);
INSERT INTO `situacioninmueble` VALUES (9,'Vivienda móvil en terreno no propio',1,63);
INSERT INTO `situacioninmueble` VALUES (10,'Lugar no construido para habitación en terreno propio',1,64);
INSERT INTO `situacioninmueble` VALUES (11,'Lugar no construido para habitación en terreno no propio',1,65);
INSERT INTO `situacioninmueble` VALUES (12,'Situación de calle',1,66);
INSERT INTO `situacioninmueble` VALUES (13,'Casa en terreno propio',1,67);
INSERT INTO `situacioninmueble` VALUES (14,'Casa en terreno no propio con aval del propietario',1,68);
INSERT INTO `situacioninmueble` VALUES (15,'Departamento en terreno propio',1,69);
INSERT INTO `situacioninmueble` VALUES (16,'Departamento en terreno no propio con aval del propietario',1,70);
INSERT INTO `situacioninmueble` VALUES (21,'Vivienda propia en terreno fiscal',1,71);
INSERT INTO `situacioninmueble` VALUES (22,'Vivienda propia en terreno privado',1,72);
INSERT INTO `situacioninmueble` VALUES (23,'Vivienda propia en terreno de propietario desconocido',1,73);
/*!40000 ALTER TABLE `situacioninmueble` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `situacionlaboral`
--

DROP TABLE IF EXISTS `situacionlaboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `situacionlaboral` (
  `id_DependenciaLaboral` int(11) NOT NULL AUTO_INCREMENT,
  `dependenciaLaboral` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_DependenciaLaboral`),
  KEY `FK_jm1h2cop415bi8d93tsp3d8jm` (`idConstante`),
  CONSTRAINT `FK_jm1h2cop415bi8d93tsp3d8jm` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacionlaboral`
--

LOCK TABLES `situacionlaboral` WRITE;
/*!40000 ALTER TABLE `situacionlaboral` DISABLE KEYS */;
INSERT INTO `situacionlaboral` VALUES (1,'Ingreso formal relacion de dependencia',1,39);
INSERT INTO `situacionlaboral` VALUES (2,'Ingreso formal trabajo autónomo',1,40);
INSERT INTO `situacionlaboral` VALUES (3,'Ingreso informal',1,41);
INSERT INTO `situacionlaboral` VALUES (4,'A prueba',1,42);
INSERT INTO `situacionlaboral` VALUES (5,'No trabaja',1,43);
/*!40000 ALTER TABLE `situacionlaboral` ENABLE KEYS */;
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

--
-- Table structure for table `techo`
--

DROP TABLE IF EXISTS `techo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `techo` (
  `id_Techo` int(11) NOT NULL AUTO_INCREMENT,
  `idTipoTecho` int(11) NOT NULL,
  `CieloRazo` tinyint(1) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `grietas` bit(1) NOT NULL,
  `humedad` bit(1) NOT NULL,
  PRIMARY KEY (`id_Techo`),
  KEY `fk_Techo_1_idx` (`idTipoTecho`),
  CONSTRAINT `fk_techo_1` FOREIGN KEY (`idTipoTecho`) REFERENCES `materialtecho` (`id_MaterialTecho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techo`
--

LOCK TABLES `techo` WRITE;
/*!40000 ALTER TABLE `techo` DISABLE KEYS */;
INSERT INTO `techo` VALUES (1,1,1,1,'','');
INSERT INTO `techo` VALUES (2,2,0,1,'\0','\0');
INSERT INTO `techo` VALUES (3,3,1,1,'\0','\0');
INSERT INTO `techo` VALUES (4,4,0,1,'\0','\0');
INSERT INTO `techo` VALUES (5,5,1,1,'\0','\0');
INSERT INTO `techo` VALUES (6,3,0,1,'\0','\0');
/*!40000 ALTER TABLE `techo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `telefono` (
  `id_Telefono` int(11) NOT NULL AUTO_INCREMENT,
  `celular` tinyint(1) NOT NULL DEFAULT '0',
  `numero` varchar(100) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES (1,0,'321',0);
INSERT INTO `telefono` VALUES (3,0,'91',1);
INSERT INTO `telefono` VALUES (4,0,'91',1);
INSERT INTO `telefono` VALUES (5,0,'9292488499',1);
INSERT INTO `telefono` VALUES (6,0,'9292488499',1);
INSERT INTO `telefono` VALUES (7,0,'91',1);
INSERT INTO `telefono` VALUES (8,0,'91',1);
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `terreno`
--

DROP TABLE IF EXISTS `terreno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `terreno` (
  `id_Terreno` int(11) NOT NULL AUTO_INCREMENT,
  `idFamilia` int(11) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  `valorFiscal` float DEFAULT NULL,
  `superficie` float NOT NULL,
  `edificacion` tinyint(1) NOT NULL DEFAULT '0',
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Terreno`),
  KEY `fk_terreno_1_idx` (`idDireccion`),
  KEY `fk_terreno_2_idx` (`idFamilia`),
  CONSTRAINT `fk_terreno_1` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`id_Direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_terreno_2` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terreno`
--

LOCK TABLES `terreno` WRITE;
/*!40000 ALTER TABLE `terreno` DISABLE KEYS */;
INSERT INTO `terreno` VALUES (1,9,9,123123,234,1,0);
INSERT INTO `terreno` VALUES (2,10,13,12,12,0,0);
INSERT INTO `terreno` VALUES (3,10,12,12,12,0,0);
/*!40000 ALTER TABLE `terreno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipobano`
--

DROP TABLE IF EXISTS `tipobano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipobano` (
  `id_tipobano` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(120) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tipobano`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipobano`
--

LOCK TABLES `tipobano` WRITE;
/*!40000 ALTER TABLE `tipobano` DISABLE KEYS */;
INSERT INTO `tipobano` VALUES (1,'Red publica',1);
INSERT INTO `tipobano` VALUES (2,'Camara septica y pozo ciego',1);
INSERT INTO `tipobano` VALUES (3,'Solo pozo ciego',1);
INSERT INTO `tipobano` VALUES (4,'Hoyo o excavacion en la tierra',1);
/*!40000 ALTER TABLE `tipobano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipocapacidadconstructiva`
--

DROP TABLE IF EXISTS `tipocapacidadconstructiva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipocapacidadconstructiva` (
  `id_TipoCapacidadConstructiva` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  `idConstante` int(11) NOT NULL,
  PRIMARY KEY (`id_TipoCapacidadConstructiva`),
  KEY `FK_3bpn9t86je0nm7om2d0yswee` (`idConstante`),
  CONSTRAINT `FK_3bpn9t86je0nm7om2d0yswee` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocapacidadconstructiva`
--

LOCK TABLES `tipocapacidadconstructiva` WRITE;
/*!40000 ALTER TABLE `tipocapacidadconstructiva` DISABLE KEYS */;
INSERT INTO `tipocapacidadconstructiva` VALUES (1,'Pintor',1,44);
INSERT INTO `tipocapacidadconstructiva` VALUES (2,'Pocero',1,45);
INSERT INTO `tipocapacidadconstructiva` VALUES (3,'Ceramista',1,46);
INSERT INTO `tipocapacidadconstructiva` VALUES (4,'Techador',1,47);
INSERT INTO `tipocapacidadconstructiva` VALUES (5,'Yesero',1,48);
INSERT INTO `tipocapacidadconstructiva` VALUES (6,'Soldador',1,49);
INSERT INTO `tipocapacidadconstructiva` VALUES (7,'Operador de maquinaria',1,50);
INSERT INTO `tipocapacidadconstructiva` VALUES (8,'Vidriero',1,51);
INSERT INTO `tipocapacidadconstructiva` VALUES (10,'No Posee',1,52);
/*!40000 ALTER TABLE `tipocapacidadconstructiva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipococina`
--

DROP TABLE IF EXISTS `tipococina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipococina` (
  `id_TipoCocina` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_TipoCocina`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipococina`
--

LOCK TABLES `tipococina` WRITE;
/*!40000 ALTER TABLE `tipococina` DISABLE KEYS */;
INSERT INTO `tipococina` VALUES (1,'Gas de red',1);
INSERT INTO `tipococina` VALUES (2,'Gas a granel',1);
INSERT INTO `tipococina` VALUES (3,'Gas en tubo',1);
INSERT INTO `tipococina` VALUES (4,'Gas en garrafa',1);
INSERT INTO `tipococina` VALUES (5,'Electricidad',1);
INSERT INTO `tipococina` VALUES (6,'Carbon/Madera',1);
/*!40000 ALTER TABLE `tipococina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipodocumento`
--

DROP TABLE IF EXISTS `tipodocumento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipodocumento` (
  `id_TipoDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(60) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_TipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipodocumento`
--

LOCK TABLES `tipodocumento` WRITE;
/*!40000 ALTER TABLE `tipodocumento` DISABLE KEYS */;
INSERT INTO `tipodocumento` VALUES (1,'Dni',1);
INSERT INTO `tipodocumento` VALUES (2,'Pasaporte',1);
/*!40000 ALTER TABLE `tipodocumento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajoautonomo`
--

DROP TABLE IF EXISTS `trabajoautonomo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajoautonomo` (
  `id_TrabajoAutonomo` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicioActividades` date NOT NULL,
  `idPersona` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_TrabajoAutonomo`),
  KEY `fk_TrabajoAutonomoPersona_idx` (`idPersona`),
  CONSTRAINT `fk_trabajoautonomo_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajoautonomo`
--

LOCK TABLES `trabajoautonomo` WRITE;
/*!40000 ALTER TABLE `trabajoautonomo` DISABLE KEYS */;
/*!40000 ALTER TABLE `trabajoautonomo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajodependencia`
--

DROP TABLE IF EXISTS `trabajodependencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trabajodependencia` (
  `id_TrabajoDependencia` int(11) NOT NULL AUTO_INCREMENT,
  `empresa` varchar(60) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `idTelefono` int(11) NOT NULL,
  `idDireccion` int(11) NOT NULL,
  `idPersona` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_TrabajoDependencia`),
  KEY `fk_TrabajoDependenciaDireccion_idx` (`idDireccion`),
  KEY `fk_TrabajoDependenciaTelefono_idx` (`idTelefono`),
  KEY `fk_TrabajoDependenciaPersona_idx` (`idPersona`),
  CONSTRAINT `fk_trabajodependencia_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajodependencia_2` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`id_Direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_trabajodependencia_3` FOREIGN KEY (`idTelefono`) REFERENCES `telefono` (`id_Telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajodependencia`
--

LOCK TABLES `trabajodependencia` WRITE;
/*!40000 ALTER TABLE `trabajodependencia` DISABLE KEYS */;
INSERT INTO `trabajodependencia` VALUES (1,'asdas','2322-11-02',6,7,32,1);
/*!40000 ALTER TABLE `trabajodependencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userprivileges`
--

DROP TABLE IF EXISTS `userprivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprivileges` (
  `idUser` int(11) NOT NULL,
  `idPrivilege` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idPrivilege`),
  KEY `FK_pkkmr4ud85uuh1u3goaya3oof` (`idPrivilege`),
  CONSTRAINT `FK_ivqpk9ebss5u47x1wfl9lq13j` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_pkkmr4ud85uuh1u3goaya3oof` FOREIGN KEY (`idPrivilege`) REFERENCES `privileges` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprivileges`
--

LOCK TABLES `userprivileges` WRITE;
/*!40000 ALTER TABLE `userprivileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `userprivileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userroles`
--

DROP TABLE IF EXISTS `userroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userroles` (
  `idUser` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idRole`),
  KEY `FK_kii45804t1tnfyexjurgk9u4` (`idRole`),
  CONSTRAINT `FK_kii45804t1tnfyexjurgk9u4` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`),
  CONSTRAINT `FK_ln5gp4pr3325gnwrlpahmtp7y` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userroles`
--

LOCK TABLES `userroles` WRITE;
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` VALUES (43,1);
INSERT INTO `userroles` VALUES (43,2);
INSERT INTO `userroles` VALUES (44,2);
INSERT INTO `userroles` VALUES (43,3);
INSERT INTO `userroles` VALUES (45,3);
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountEnabled` bit(1) NOT NULL,
  `accountExpired` bit(1) NOT NULL,
  `accountLocked` bit(1) NOT NULL,
  `credentialsExpired` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fistName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`),
  UNIQUE KEY `UK_3g1j96g94xpk3lpxl2qbl985x` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (43,'','\0','\0','\0','ca@admin','carlos','admin','admin','123');
INSERT INTO `users` VALUES (44,'','\0','\0','\0','be@entry','beto','entry','entry','123');
INSERT INTO `users` VALUES (45,'','\0','\0','\0','lp@plan','laura','plan','plan','123');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-27 22:02:13
