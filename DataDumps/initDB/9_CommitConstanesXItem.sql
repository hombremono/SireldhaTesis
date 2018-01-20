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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
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
INSERT INTO `constantePlan` VALUES (27,'MASCULINO','SEXO');
INSERT INTO `constantePlan` VALUES (28,'FEMENINO','SEXO');
INSERT INTO `constantePlan` VALUES (29,'LABORDE','LOCALIDAD');
INSERT INTO `constantePlan` VALUES (30,'CORDOBA','LOCALIDAD');
INSERT INTO `constantePlan` VALUES (31,'ARGENTINO','NACIONALIDAD');
INSERT INTO `constantePlan` VALUES (32,'EXTRANJERO','NACIONALIDAD');
INSERT INTO `constantePlan` VALUES (33,'SOLTERO','ESTADO_CIVIL');
INSERT INTO `constantePlan` VALUES (34,'CASADO','ESTADO_CIVIL');
INSERT INTO `constantePlan` VALUES (35,'CONVIVIENTE','ESTADO_CIVIL');
INSERT INTO `constantePlan` VALUES (36,'SEPARADO','ESTADO_CIVIL');
INSERT INTO `constantePlan` VALUES (37,'DIVORCIADO','ESTADO_CIVIL');
INSERT INTO `constantePlan` VALUES (38,'VIUDO','ESTADO_CIVIL');
INSERT INTO `constantePlan` VALUES (39,'RELACION_DEPENDENCIA','SITUACION_LABORAL');
INSERT INTO `constantePlan` VALUES (40,'AUTONOMO','SITUACION_LABORAL');
INSERT INTO `constantePlan` VALUES (41,'INFORMAL','SITUACION_LABORAL');
INSERT INTO `constantePlan` VALUES (42,'A_PRUEBA','SITUACION_LABORAL');
INSERT INTO `constantePlan` VALUES (43,'NO_TRABAJA','SITUACION_LABORAL');
INSERT INTO `constantePlan` VALUES (44,'PINTOR','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (45,'POCERO','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (46,'CERAMISTA','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (47,'TECHADOR','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (48,'YESERO','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (49,'SOLDADOR','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (50,'OPERADOR_MAQUINARIA','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (51,'VIDRIERO','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (52,'NO_POSEE','TIPO_CAPACIDAD_CONSTRUCTIVA');
INSERT INTO `constantePlan` VALUES (53,'POSEE','POSEE_INMUEBLE');
INSERT INTO `constantePlan` VALUES (54,'NO POSEE','POSEE_INMUEBLE');
INSERT INTO `constantePlan` VALUES (55,'CASA_PRESTADA','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (56,'CASA_ALQUILADA','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (57,'DEPARTAMENTO_PRESTADO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (58,'DEPARTAMENTO_ALQUILADO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (59,'PENSION','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (60,'RANCHO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (61,'RANCHO_NO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (62,'VIVIENDA_MOVIL_PROPIA','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (63,'VIVIENDA_MOVIL_NO_PROPIA','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (64,'NO_CONSTRUIDO_HABITACION_TERRENO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (65,'NO_CONSTRUIDO_HABITACION_TERRENO_NO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (66,'SITUACION_CALLE','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (67,'CASA_TERRENO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (68,'CASA_TERRENO_NO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (69,'DEPARTAMENTO_TERRENO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (70,'DEPARTAMENO_TERRENO_NO_PROPIO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (71,'VIVIENDA_TERRENO_FISCAL','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (72,'VIVIENDA_TERRENO_PRIVADO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (73,'VIVIENDA_TERRENO_PROPIETARIO_DESCONOCIDO','SITUACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (74,'BUENO','INSTALACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (75,'REGULAR','INSTALACION_INMUEBLE');
INSERT INTO `constantePlan` VALUES (76,'DEFICIENTE','INSTALACION_INMUEBLE');
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
  PRIMARY KEY (`id_RangoEdad`),
  KEY `FK_6ayhfbkho6nqlqvjadfr22a4o` (`idConstante`),
  CONSTRAINT `FK_6ayhfbkho6nqlqvjadfr22a4o` FOREIGN KEY (`idConstante`) REFERENCES `constantePlan` (`id_Constante`)
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
  PRIMARY KEY (`id_EstadoCivil`)
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
  PRIMARY KEY (`id_Nacionalidad`)
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
  PRIMARY KEY (`id_Localidad`)
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
  PRIMARY KEY (`id_SituacionInmueble`)
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
  PRIMARY KEY (`id_DependenciaLaboral`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacionlaboral`
--

LOCK TABLES `situacionlaboral` WRITE;
/*!40000 ALTER TABLE `situacionlaboral` DISABLE KEYS */;
INSERT INTO `situacionlaboral` VALUES (1,'Ingreso formal relacion de dependencia',1,39);
INSERT INTO `situacionlaboral` VALUES (2,'Ingreso formal trabajo autonomo',1,40);
INSERT INTO `situacionlaboral` VALUES (3,'Ingreso informal',1,41);
INSERT INTO `situacionlaboral` VALUES (4,'A prueba',1,42);
INSERT INTO `situacionlaboral` VALUES (5,'No trabaja',1,43);
/*!40000 ALTER TABLE `situacionlaboral` ENABLE KEYS */;
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
  PRIMARY KEY (`id_PoseeInmueble`)
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
  PRIMARY KEY (`id_Sexo`)
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
  PRIMARY KEY (`id_TipoCapacidadConstructiva`)
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
INSERT INTO `Plan_CaracteristicasHogar` VALUES (1,'Hogares unipersonales o personas solas',4);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (3,'Presencia de jubilados en el Hogar',5);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (4,'Presencia en el hogar de miembros con alguna discapacidad',6);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (5,'Presencia en el hogar de miembros mayores de 65 años',7);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (6,'Presencia en el hogar de miembros con enfermedades crónicas',8);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (7,'Presencia en el hogar de miembros excombatientes de Malvinas',9);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (8,'Presencia en el hogar de miembros víctimas de violencia de género y/o violencia familiar',10);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (9,'Presencia en el hogar de miembros asociados a sindicatos y/o gremios',11);
INSERT INTO `Plan_CaracteristicasHogar` VALUES (10,'Presencia en el hogar de miembros asociados a entidades de bien público',12);
/*!40000 ALTER TABLE `Plan_CaracteristicasHogar` ENABLE KEYS */;
UNLOCK TABLES;

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

-- Dump completed on 2018-01-20 19:23:54
