-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: web3
-- ------------------------------------------------------
-- Server version	5.7.19-0ubuntu0.17.04.1

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `capacidadconstructiva`
--

LOCK TABLES `capacidadconstructiva` WRITE;
/*!40000 ALTER TABLE `capacidadconstructiva` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carecevivienda`
--

LOCK TABLES `carecevivienda` WRITE;
/*!40000 ALTER TABLE `carecevivienda` DISABLE KEYS */;
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
  PRIMARY KEY (`id_Cocina`),
  KEY `fk_cocina_Inmueble_idx` (`id_Inmueble`),
  KEY `fk_cocina_TipoCocina_idx` (`idTipoCocina`),
  CONSTRAINT `fk_cocina_Inmueble` FOREIGN KEY (`id_Inmueble`) REFERENCES `inmueble` (`id_Inmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cocina_TipoCocina` FOREIGN KEY (`idTipoCocina`) REFERENCES `tipococina` (`id_TipoCocina`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cocina`
--

LOCK TABLES `cocina` WRITE;
/*!40000 ALTER TABLE `cocina` DISABLE KEYS */;
/*!40000 ALTER TABLE `cocina` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
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
  PRIMARY KEY (`id_EstadoCivil`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadocivil`
--

LOCK TABLES `estadocivil` WRITE;
/*!40000 ALTER TABLE `estadocivil` DISABLE KEYS */;
INSERT INTO `estadocivil` VALUES (1,'Soltero/a',1);
INSERT INTO `estadocivil` VALUES (2,'Casado/a',1);
INSERT INTO `estadocivil` VALUES (3,'Conviviente',1);
INSERT INTO `estadocivil` VALUES (4,'Separado/a',1);
INSERT INTO `estadocivil` VALUES (5,'Divorciado/a',1);
INSERT INTO `estadocivil` VALUES (6,'Viudo/a',1);
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
INSERT INTO `estudios` VALUES (1,'Nivel incial',1);
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
  `idTelefono` int(11) NOT NULL,
  `ingresoNetoFamiliar` float NOT NULL DEFAULT '0',
  `tarjetaCredito` tinyint(1) NOT NULL DEFAULT '0',
  `antiguedadResidencia` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Familia`),
  KEY `fk_FamiliaSituacionInmueble_idx` (`idSituacionInmueble`),
  KEY `fk_FamiliaDireccion_idx` (`idDireccion`),
  KEY `fk_FamiliaTelefono_idx` (`idTelefono`),
  KEY `fk_FamiliaPlan_idx` (`idSolucionHabitacional`),
  CONSTRAINT `fk_familia_1` FOREIGN KEY (`idSituacionInmueble`) REFERENCES `situacioninmueble` (`id_SituacionInmueble`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_familia_2` FOREIGN KEY (`idDireccion`) REFERENCES `direccion` (`id_Direccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_familia_3` FOREIGN KEY (`idSolucionHabitacional`) REFERENCES `solucionhabitacional` (`id_SolucionHabitacional`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_familia_4` FOREIGN KEY (`idTelefono`) REFERENCES `telefono` (`id_Telefono`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familia`
--

LOCK TABLES `familia` WRITE;
/*!40000 ALTER TABLE `familia` DISABLE KEYS */;
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
  PRIMARY KEY (`id_Inmueble`),
  KEY `fk_InmuebleFamilia_idx` (`idFamilia`),
  KEY `fk_InmuebleMaterialPiso_idx` (`idMaterialPiso`),
  KEY `fk_InmueblePoseeLuz_idx` (`idPoseeLuz`),
  KEY `fk_InmueblePared_idx` (`idPared`),
  KEY `fk_InmuebleTecho_idx` (`idTecho`),
  KEY `fk_InmuebleServicioAgua_idx` (`idServicioAgua`),
  CONSTRAINT `FK_fgxwjm8msjfq8kldb20wmimnq` FOREIGN KEY (`idFamilia`) REFERENCES `familia` (`id_Familia`),
  CONSTRAINT `fk_InmuebleMaterialPiso` FOREIGN KEY (`idMaterialPiso`) REFERENCES `materialpiso` (`id_MaterialPiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmueblePared` FOREIGN KEY (`idPared`) REFERENCES `pared` (`id_Pared`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmueblePoseeLuz` FOREIGN KEY (`idPoseeLuz`) REFERENCES `poseeluz` (`id_PoseeLuz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmuebleServicioAgua` FOREIGN KEY (`idServicioAgua`) REFERENCES `servicioagua` (`id_ServicioAgua`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_InmuebleTecho` FOREIGN KEY (`idTecho`) REFERENCES `techo` (`id_Techo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inmueble`
--

LOCK TABLES `inmueble` WRITE;
/*!40000 ALTER TABLE `inmueble` DISABLE KEYS */;
/*!40000 ALTER TABLE `inmueble` ENABLE KEYS */;
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
  PRIMARY KEY (`id_Localidad`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad`
--

LOCK TABLES `localidad` WRITE;
/*!40000 ALTER TABLE `localidad` DISABLE KEYS */;
INSERT INTO `localidad` VALUES (1,'Laborde',1);
INSERT INTO `localidad` VALUES (8,'Cordoba',1);
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
  PRIMARY KEY (`id_MaterialPared`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialpared`
--

LOCK TABLES `materialpared` WRITE;
/*!40000 ALTER TABLE `materialpared` DISABLE KEYS */;
INSERT INTO `materialpared` VALUES (1,'Ladrillo/Piedra/Bloque/Hormigon',1);
INSERT INTO `materialpared` VALUES (2,'Adobe',1);
INSERT INTO `materialpared` VALUES (3,'Madera',1);
INSERT INTO `materialpared` VALUES (4,'Chapa metal/Fibrocemento',1);
INSERT INTO `materialpared` VALUES (5,'Chrizo/Carton/Palma/Paja',1);
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
  PRIMARY KEY (`id_MaterialPiso`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialpiso`
--

LOCK TABLES `materialpiso` WRITE;
/*!40000 ALTER TABLE `materialpiso` DISABLE KEYS */;
INSERT INTO `materialpiso` VALUES (1,'Ceramica/Baldosa/Mosaico',1);
INSERT INTO `materialpiso` VALUES (2,'Madera/Alfombra',1);
INSERT INTO `materialpiso` VALUES (3,'Cemento/Ladrillo fijo',1);
INSERT INTO `materialpiso` VALUES (4,'Tierra/Ladrillo suelto',1);
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
  PRIMARY KEY (`id_MaterialTecho`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materialtecho`
--

LOCK TABLES `materialtecho` WRITE;
/*!40000 ALTER TABLE `materialtecho` DISABLE KEYS */;
INSERT INTO `materialtecho` VALUES (1,'Cubierta asfaltica/Membrana',1);
INSERT INTO `materialtecho` VALUES (2,'Baldosa/Losa',1);
INSERT INTO `materialtecho` VALUES (3,'Pizarra/Teja',1);
INSERT INTO `materialtecho` VALUES (4,'Chapa de metal',1);
INSERT INTO `materialtecho` VALUES (5,'Chapa de fibrocemento/Plastico',1);
INSERT INTO `materialtecho` VALUES (6,'Chapa de carton',1);
INSERT INTO `materialtecho` VALUES (7,'Palma/Tabla/Paja',1);
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
  PRIMARY KEY (`id_Nacionalidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nacionalidad`
--

LOCK TABLES `nacionalidad` WRITE;
/*!40000 ALTER TABLE `nacionalidad` DISABLE KEYS */;
INSERT INTO `nacionalidad` VALUES (1,1,'Argentino');
INSERT INTO `nacionalidad` VALUES (2,1,'Extranjero');
/*!40000 ALTER TABLE `nacionalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pared`
--

DROP TABLE IF EXISTS `pared`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pared` (
  `id_Pared` int(11) NOT NULL AUTO_INCREMENT,
  `revoque` tinyint(1) NOT NULL,
  `idTipoPared` int(11) NOT NULL,
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_Pared`),
  KEY `fk_Pared_1_idx` (`idTipoPared`),
  CONSTRAINT `FK_dceikt3lffk6craydtipjwxhe` FOREIGN KEY (`idTipoPared`) REFERENCES `materialpiso` (`id_MaterialPiso`),
  CONSTRAINT `fk_pared_1` FOREIGN KEY (`idTipoPared`) REFERENCES `materialpared` (`id_MaterialPared`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pared`
--

LOCK TABLES `pared` WRITE;
/*!40000 ALTER TABLE `pared` DISABLE KEYS */;
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
  `discapacidad` tinyint(1) NOT NULL DEFAULT '0',
  `IsActive` tinyint(1) NOT NULL DEFAULT '1',
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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
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
  PRIMARY KEY (`id_Plan`),
  KEY `fk_plan_1_idx` (`idSolucionHabitacional`),
  CONSTRAINT `fk_plan_1` FOREIGN KEY (`idSolucionHabitacional`) REFERENCES `solucionhabitacional` (`id_SolucionHabitacional`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
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
  PRIMARY KEY (`id_PoseeBano`),
  KEY `fk_PoseeBañoInmueble_idx` (`idInmueble`),
  KEY `fk_poseebano_1_idx` (`idTipoBano`),
  CONSTRAINT `FK_2r6lyto3uaox1192m96njn5og` FOREIGN KEY (`idInmueble`) REFERENCES `inmueble` (`id_Inmueble`),
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
INSERT INTO `roles` VALUES (1,'ADMIN');
INSERT INTO `roles` VALUES (3,'GENERAL');
INSERT INTO `roles` VALUES (2,'USER');
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
  PRIMARY KEY (`id_RolFamiliar`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolfamiliar`
--

LOCK TABLES `rolfamiliar` WRITE;
/*!40000 ALTER TABLE `rolfamiliar` DISABLE KEYS */;
INSERT INTO `rolfamiliar` VALUES (1,'Jefe/a de familia',1);
INSERT INTO `rolfamiliar` VALUES (2,'Conyugue o Pareja',1);
INSERT INTO `rolfamiliar` VALUES (3,'Hijo(a) / Hijastro(a)',1);
INSERT INTO `rolfamiliar` VALUES (4,'Yerno / Nuera',1);
INSERT INTO `rolfamiliar` VALUES (5,'Nieto/a',1);
INSERT INTO `rolfamiliar` VALUES (6,'Padre / Madre',1);
INSERT INTO `rolfamiliar` VALUES (7,'Suegro/a',1);
INSERT INTO `rolfamiliar` VALUES (8,'Otro Familiar',1);
INSERT INTO `rolfamiliar` VALUES (9,'Otro no Familiar',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id_Sexo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexo`
--

LOCK TABLES `sexo` WRITE;
/*!40000 ALTER TABLE `sexo` DISABLE KEYS */;
INSERT INTO `sexo` VALUES (1,'Masculino',1);
INSERT INTO `sexo` VALUES (2,'Femenino',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id_SituacionInmueble`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacioninmueble`
--

LOCK TABLES `situacioninmueble` WRITE;
/*!40000 ALTER TABLE `situacioninmueble` DISABLE KEYS */;
INSERT INTO `situacioninmueble` VALUES (1,'Casa',1);
INSERT INTO `situacioninmueble` VALUES (2,'Rancho',1);
INSERT INTO `situacioninmueble` VALUES (3,'Casilla',1);
INSERT INTO `situacioninmueble` VALUES (4,'Departamento',1);
INSERT INTO `situacioninmueble` VALUES (5,'Pieza en inquilinato',1);
INSERT INTO `situacioninmueble` VALUES (6,'Pieza en hotel familiar o pension',1);
INSERT INTO `situacioninmueble` VALUES (7,'Local no construido para habitacion',1);
INSERT INTO `situacioninmueble` VALUES (8,'Vivienda movil',1);
INSERT INTO `situacioninmueble` VALUES (9,'Situacion de calle',1);
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
  PRIMARY KEY (`id_DependenciaLaboral`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `situacionlaboral`
--

LOCK TABLES `situacionlaboral` WRITE;
/*!40000 ALTER TABLE `situacionlaboral` DISABLE KEYS */;
INSERT INTO `situacionlaboral` VALUES (1,'Ingreso formal relacion de dependencia',1);
INSERT INTO `situacionlaboral` VALUES (2,'Ingreso formal trabajo autonomo',1);
INSERT INTO `situacionlaboral` VALUES (3,'Ingreso informal',1);
INSERT INTO `situacionlaboral` VALUES (4,'A prueba',1);
INSERT INTO `situacionlaboral` VALUES (5,'No trabaja',1);
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
INSERT INTO `solucionhabitacional` VALUES (3,'Mejoramiento',1);
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
  PRIMARY KEY (`id_Techo`),
  KEY `fk_Techo_1_idx` (`idTipoTecho`),
  CONSTRAINT `fk_techo_1` FOREIGN KEY (`idTipoTecho`) REFERENCES `materialtecho` (`id_MaterialTecho`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `techo`
--

LOCK TABLES `techo` WRITE;
/*!40000 ALTER TABLE `techo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `terreno`
--

LOCK TABLES `terreno` WRITE;
/*!40000 ALTER TABLE `terreno` DISABLE KEYS */;
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
  PRIMARY KEY (`id_TipoCapacidadConstructiva`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipocapacidadconstructiva`
--

LOCK TABLES `tipocapacidadconstructiva` WRITE;
/*!40000 ALTER TABLE `tipocapacidadconstructiva` DISABLE KEYS */;
INSERT INTO `tipocapacidadconstructiva` VALUES (1,'Pintor',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (2,'Pocero',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (3,'Ceramista',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (4,'Techador',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (5,'Yesero',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (6,'Soldador',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (7,'Operador de maquinaria',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (8,'Vidriero',1);
INSERT INTO `tipocapacidadconstructiva` VALUES (10,'No Posee',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajodependencia`
--

LOCK TABLES `trabajodependencia` WRITE;
/*!40000 ALTER TABLE `trabajodependencia` DISABLE KEYS */;
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
INSERT INTO `userroles` VALUES (1,1);
INSERT INTO `userroles` VALUES (12,1);
INSERT INTO `userroles` VALUES (15,1);
INSERT INTO `userroles` VALUES (16,1);
INSERT INTO `userroles` VALUES (17,1);
INSERT INTO `userroles` VALUES (18,1);
INSERT INTO `userroles` VALUES (19,1);
INSERT INTO `userroles` VALUES (20,1);
INSERT INTO `userroles` VALUES (21,1);
INSERT INTO `userroles` VALUES (22,1);
INSERT INTO `userroles` VALUES (23,1);
INSERT INTO `userroles` VALUES (24,1);
INSERT INTO `userroles` VALUES (25,1);
INSERT INTO `userroles` VALUES (26,1);
INSERT INTO `userroles` VALUES (27,1);
INSERT INTO `userroles` VALUES (28,1);
INSERT INTO `userroles` VALUES (29,1);
INSERT INTO `userroles` VALUES (1,2);
INSERT INTO `userroles` VALUES (17,2);
INSERT INTO `userroles` VALUES (18,2);
INSERT INTO `userroles` VALUES (19,2);
INSERT INTO `userroles` VALUES (20,2);
INSERT INTO `userroles` VALUES (21,2);
INSERT INTO `userroles` VALUES (22,2);
INSERT INTO `userroles` VALUES (23,2);
INSERT INTO `userroles` VALUES (24,2);
INSERT INTO `userroles` VALUES (25,2);
INSERT INTO `userroles` VALUES (26,2);
INSERT INTO `userroles` VALUES (27,2);
INSERT INTO `userroles` VALUES (28,2);
INSERT INTO `userroles` VALUES (29,2);
INSERT INTO `userroles` VALUES (30,2);
INSERT INTO `userroles` VALUES (31,2);
INSERT INTO `userroles` VALUES (35,2);
INSERT INTO `userroles` VALUES (1,3);
INSERT INTO `userroles` VALUES (13,3);
INSERT INTO `userroles` VALUES (17,3);
INSERT INTO `userroles` VALUES (18,3);
INSERT INTO `userroles` VALUES (19,3);
INSERT INTO `userroles` VALUES (20,3);
INSERT INTO `userroles` VALUES (21,3);
INSERT INTO `userroles` VALUES (22,3);
INSERT INTO `userroles` VALUES (23,3);
INSERT INTO `userroles` VALUES (24,3);
INSERT INTO `userroles` VALUES (25,3);
INSERT INTO `userroles` VALUES (26,3);
INSERT INTO `userroles` VALUES (27,3);
INSERT INTO `userroles` VALUES (28,3);
INSERT INTO `userroles` VALUES (29,3);
INSERT INTO `userroles` VALUES (30,3);
INSERT INTO `userroles` VALUES (31,3);
INSERT INTO `userroles` VALUES (35,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'','\0','\0','\0','yo@gmail.com','Admin','Admin','admin','123');
INSERT INTO `users` VALUES (12,'','\0','\0','\0','aaa@gmail.com','pedro','picapiedras','alal','123');
INSERT INTO `users` VALUES (13,'','\0','\0','\0','pp@fff.com','pedrooo','oooo','ppp','123');
INSERT INTO `users` VALUES (15,'','\0','\0','\0','test@gmail.com','test','testap','test','123');
INSERT INTO `users` VALUES (16,'','\0','\0','\0','magm33@gmail.com','Mariano','García Mattío','magm33','123');
INSERT INTO `users` VALUES (17,'','\0','\0','\0','nuevousuario@mail.com','Nuevo','Usuario','nuevousuario','123');
INSERT INTO `users` VALUES (18,'','\0','\0','\0','nuevousuario61379457@mail.com','Nuevo','Usuario','nuevousuario61379457','123');
INSERT INTO `users` VALUES (19,'','\0','\0','\0','nuevousuario931841653@mail.com','Nuevo','Usuario','nuevousuario931841653','123');
INSERT INTO `users` VALUES (20,'','\0','\0','\0','nuevousuario495585441@mail.com','Nuevo','Usuario','nuevousuario495585441','123');
INSERT INTO `users` VALUES (21,'','\0','\0','\0','nuevousuario32503338@mail.com','Nuevo','Usuario','nuevousuario32503338','123');
INSERT INTO `users` VALUES (22,'','\0','\0','\0','nuevousuario885729996@mail.com','Nuevo','Usuario','nuevousuario885729996','123');
INSERT INTO `users` VALUES (23,'','\0','\0','\0','nuevousuario180793643@mail.com','Nuevo','Usuario','nuevousuario180793643','123');
INSERT INTO `users` VALUES (24,'','\0','\0','\0','nuevousuario158676292@mail.com','Nuevo','Usuario','nuevousuario158676292','123');
INSERT INTO `users` VALUES (25,'','\0','\0','\0','nuevousuario712580477@mail.com','Nuevo','Usuario','nuevousuario712580477','123');
INSERT INTO `users` VALUES (26,'','\0','\0','\0','nuevousuario747002787@mail.com','Nuevo','Usuario','nuevousuario747002787','123');
INSERT INTO `users` VALUES (27,'','\0','\0','\0','nuevousuario426646162@mail.com','Nuevo','Usuario','nuevousuario426646162','123');
INSERT INTO `users` VALUES (28,'','\0','\0','\0','nuevousuario112454569@mail.com','Nuevo','Usuario','nuevousuario112454569','123');
INSERT INTO `users` VALUES (29,'','\0','\0','\0','nuevousuario679789601@mail.com','Nuevo','Usuario','nuevousuario679789601','123');
INSERT INTO `users` VALUES (30,'','\0','\0','\0','nuevousuario674734105@mail.com','Nuevo','Nuevo Apellido','nuevousuario674734105','123');
INSERT INTO `users` VALUES (31,'','\0','\0','\0','nuevousuario361571718@mail.com','Nuevo','Nuevo Apellido','nuevousuario361571718','123');
INSERT INTO `users` VALUES (32,'','\0','\0','\0','juan@aaa.com','juan','juanews','juan','123');
INSERT INTO `users` VALUES (35,'','\0','\0','\0','nuevousuario275466337@mail.com','Nuevo','Nuevo Apellido','nuevousuario275466337','123');
INSERT INTO `users` VALUES (36,'','\0','\0','\0','e@mail','nombre','apellido','alias','pass');
INSERT INTO `users` VALUES (37,'','\0','\0','\0','a@s','aaa','aaa','aaa','aaa');
INSERT INTO `users` VALUES (39,'','\0','\0','\0','sd@sd','sdsd','dssd','sdsd','sdsd');
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

-- Dump completed on 2017-09-18 22:32:23
