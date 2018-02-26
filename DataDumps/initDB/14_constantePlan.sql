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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-25 21:05:10
