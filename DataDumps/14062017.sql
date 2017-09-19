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
INSERT INTO `alquiler` VALUES (1,10,4500,'0000-00-00','0000-00-00',1);
INSERT INTO `alquiler` VALUES (2,46,5000,'0000-00-00','0000-00-00',1);
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
INSERT INTO `archivos` VALUES (6,'����\0JFIF\0\0\0\0\0\0��\0C\0	\Z!\Z\"$\"$��\0C��\0\0`\0`\"\0��\0\0\0\0\0\0\0\0\0\0\0\0\0\0	��\0;\0\0\0\0\0\0!1A\"Q2aq�B��#Rb���3Cr��S����\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0)\0\0\0\0\0\0\0\0\0!1AQ\"aq2������\0\0\0?\0r�554�Phw�wE>̳jW%H�l���ugd6>jQ�.�O��o����%�O{��Gp=8���6I�\0bO�,�i�p,�f�-T$_5n�\\UfA�\r�+rT2�G�U�Gb�~-3�n����O�qm8�%hZ��A�A\0���K��kS�e�`��˘\0Z�Xۙ������p\0�T�;!f略��Y\Z��j��4O����J�[��AL�r��s�p(I�5��߉�TjQ��y��ĤyR��J��؍��mS|R;oE��}%���Ӏ�Wakz�����\\�����I)��������͋ú���*����f����򶟺���y�L�\"]A�S�d8�^uG*qj9R�Ԓt�{}\\�n5�h�����O�G���\0���KM\rԇ����U�WW��NvR�%#\'�@�\0�|�\\�𒔸\0lj��ԛZbN<�(g��c�M�ң���r�\Z|q5{-�+Xv�\\�o��%!���z�_��ePφ��<ͨ�������1\'9 ��ޙ2�=�-:��Y�Q��W�r}�GN�B�c�̹���P�ꆷhR+\0f�fA�L�G�\']��N&��d&4d�)S��*J�2GA�7;���q�Ƴ��䪪؊��m\r�+Kl�(+!�|Y��Ʋoh�8D�6��Ctĺ*k�(qj	8	G�rs��a�Q���u����->�����i�(�9&G)Np�JH�ߔ��bHP;e�����U��r\"���q�+��Z8!>]��������pT)FU�t��~0��Ф!�%9Q	Q �Jp3�A�5��\0\n�\Z*��E�)ʙN@K2�d)�s�u+�+$����PD�\r\"�Ǉ�܎�5Ssש6�Mb�5�Pc�.:��\0�$�\0ܝ,R����]�n)4[�!�&8=BwK_|���@hkچݸo�h��jYC0 D���m��%N�3�����Æ^�6���qN�<0K�#��1���t����Ժ��L��^p\"K�qի��s�\Zn�˦U�`ƭ]N�?\n]�Sן�U��:�G�1!�9*����Б\"U�OzS�DH�6zB�]��L��3���S�5V�S�Q͹Xa�.4�xxI r8��;�Ї����qʸ�JQ}�Q�|��O�xϩ\'��n�ݵ�!��̛��%ꌑ�Z�\r>�F�������I`�Ge�j\Z|\Zn#c{wH����`�=��Ҥ���K�r~5Bw�����\\/+F����+-�����\0��)��9��0�i\nBy��U�H\Z>�\'ٶ�[aLT*�%���\\x�卜_��}I���ߗ|Iש�Y�%���Q\r�����:��a;t�цF��.`F�7֙wʗJ(yE��O:w�(|C�3�~Y��1�q��^\\jch��n�9���|)�\'d�d\nT�9)\r,�c�8%)���t�t�{J�E��M��ȓB��9Z�����IA\rr�����\'\' ��5*Q�S�L�\Z�N�O��Z����i�$��]�A�SN��_o��j�S��Դ[�e�R�@��aX!G�Cx�yX��ƺx}I�컚�M���Bt�m��m�����נ�f��6��R�3끘�?n�\0�8H\0�q��i�=�s]RL��Ɠd��Q�C,�=R2~�$��D�����jbis�De�;�\0���-��T���m��\r���1ZO8kH��stܓ�\Z]��v���\'7!��cV����y��U�}5�.�T�S۩;Sp^XB[d ��\0��u���n$:�r�*�q���r���T�̣�L�E\r�\\��)aհ��+@�2�$�q���:�sq\"�:��|ǡ�[|�B�V��	�)=��t1K��Q�ۖ�a鱈��9�l�\0	�}��z�&����e��vI[\\��$���S���;ZK��6MFl���v�H\'����D���ϵ������v��d���_�l��S�@�͢Q�*Tz]\"0�F@C,0�T���{�\Z�G?fd6JA)��|�Q�Y�G�Ou�<��yp{���@�+_~�S5��e���c�qK�9R�@qc����N��7\"�ӈ���[8�mc�I��}tn��ÅC��:0fk>��ͨI>\Zǣ�yO�?-^G*���55�X��b`6l̨�K�[X�!���\0*U�-��LZ�Y��%����J��w������Ө��E��T�(�ўPO`�T��\0{k�ˉ��u\rIK�֌�S.�P�I؃�����焺K��5FE�cp&�\Z�{�Ċ�B�ĸ��$31*\'���#c�A��lh�/��*mM�<ڈ->�F;�?��e�2���G�9�/���}A���[v��d鐢��0J�C�Z�0��gC��*��;�<��2q���A�9���f2b���W3j���KF�o��i��_0.-�~^�yN6��ҿEb-]�n:�����n�\\z�@��_X��� �����9�~�\'R$<Q�wc�8\Zw_���[�U^�K��m�mƊd�r�����ly��9�\00{�kbE�*d~_���X7��\'�۾�1�ީIJK�����~\"��͗(���H/�W}~J�h3K�;����]M���Vdx�?4����5f���>��gZ]F��vܥs�<���cu�K;�nɕ�(�]BV���\0�}�Yj�&٥�_��?_\r:��(.+�륛ڻ��7&���#���@�BR7$\0�܀7;��^~�N7�������\0*NI[���6�~��\\��J�&tO����xI�*m��f6$�P>����z`���F�e&ݧAk���2\n�o�� ����\'`;�9\Z\"�m�=~��B+��u��M����Ԕ������<[���q*PRʘ���o���題/&���Zs�c=������ ��V]^�\"c�Rߔ�^�J=\0�l5aN��)��C��/����kL���m%!4���c\nt��?~�A�^\"�,G��6tSZ\Z(,�e2<��J�&�wt�2�%ٗ|ߒ��Ni��^��a��\\II�O��ӜKq�r՞�c�h��\\��>�|%�z%�G�l���V�{Z�\n^I��L�^¼��6$�n��`�?d���e��*�63l�-�e\'�v��F�?�}Z�r�Z�q���`\0�\r3EOf�E�×��I)�#?MY��o���h|;r�,�������{L4s���Ӧ_��','2016-11-03 20:07:48','image/jpeg','duke-java.jpeg',3445);
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
INSERT INTO `carecevivienda` VALUES (1,64,3,1);
INSERT INTO `carecevivienda` VALUES (2,68,1,1);
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
INSERT INTO `cocina` VALUES (6,1,1,26,1);
INSERT INTO `cocina` VALUES (7,4,0,27,1);
INSERT INTO `cocina` VALUES (9,1,1,30,1);
INSERT INTO `cocina` VALUES (10,4,0,31,1);
INSERT INTO `cocina` VALUES (11,4,1,32,1);
INSERT INTO `cocina` VALUES (12,1,1,33,1);
INSERT INTO `cocina` VALUES (13,4,0,34,1);
INSERT INTO `cocina` VALUES (14,4,1,35,1);
INSERT INTO `cocina` VALUES (15,4,0,36,1);
INSERT INTO `cocina` VALUES (16,4,0,37,1);
INSERT INTO `cocina` VALUES (17,4,0,38,1);
INSERT INTO `cocina` VALUES (18,1,1,39,1);
INSERT INTO `cocina` VALUES (20,1,1,41,1);
INSERT INTO `cocina` VALUES (21,4,0,42,1);
INSERT INTO `cocina` VALUES (22,1,1,43,1);
INSERT INTO `cocina` VALUES (23,1,1,44,1);
INSERT INTO `cocina` VALUES (24,4,0,45,1);
INSERT INTO `cocina` VALUES (25,4,0,46,1);
INSERT INTO `cocina` VALUES (26,4,1,47,1);
INSERT INTO `cocina` VALUES (27,1,1,48,1);
INSERT INTO `cocina` VALUES (28,1,1,49,1);
INSERT INTO `cocina` VALUES (29,4,1,50,1);
INSERT INTO `cocina` VALUES (30,4,0,51,1);
INSERT INTO `cocina` VALUES (31,4,0,52,1);
INSERT INTO `cocina` VALUES (32,4,0,53,1);
INSERT INTO `cocina` VALUES (33,4,1,54,1);
INSERT INTO `cocina` VALUES (35,1,0,56,1);
INSERT INTO `cocina` VALUES (36,1,1,57,1);
INSERT INTO `cocina` VALUES (37,1,0,58,1);
INSERT INTO `cocina` VALUES (38,4,1,59,1);
INSERT INTO `cocina` VALUES (39,4,0,60,1);
INSERT INTO `cocina` VALUES (40,1,1,61,1);
INSERT INTO `cocina` VALUES (41,3,1,62,1);
INSERT INTO `cocina` VALUES (42,1,1,63,1);
INSERT INTO `cocina` VALUES (43,6,0,64,1);
INSERT INTO `cocina` VALUES (44,6,1,69,1);
INSERT INTO `cocina` VALUES (45,6,1,70,1);
INSERT INTO `cocina` VALUES (46,6,0,71,1);
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
INSERT INTO `direccion` VALUES (1,'27 de abril','3276','','Alto Alberdi',0,0,8,1);
INSERT INTO `direccion` VALUES (2,'','','','',0,0,8,1);
INSERT INTO `direccion` VALUES (3,'San Martin','1050','','Las palmas',0,0,8,1);
INSERT INTO `direccion` VALUES (4,'Rafael NÃºÃ±ez ','62','','Centro',0,0,1,1);
INSERT INTO `direccion` VALUES (5,'Av Pagani ','388','','Parque industiral',0,0,1,1);
INSERT INTO `direccion` VALUES (6,'Rafael NuÃ±ez ','62','','Centro',0,0,1,1);
INSERT INTO `direccion` VALUES (7,'ColÃ³n','356','','La Milka',0,0,1,1);
INSERT INTO `direccion` VALUES (8,'','','','Matienzo',0,0,1,1);
INSERT INTO `direccion` VALUES (9,'ColÃ³n','356','','La Milka',0,0,1,1);
INSERT INTO `direccion` VALUES (10,'Los Alamos','123','','IPV',0,0,1,1);
INSERT INTO `direccion` VALUES (11,'Los Alamos','123','','IPV',0,0,8,1);
INSERT INTO `direccion` VALUES (12,'Libertad ','1636','','Centro',0,0,1,1);
INSERT INTO `direccion` VALUES (13,'Libertad','1636','','Centro',0,0,1,1);
INSERT INTO `direccion` VALUES (14,'Los Olmos','345','','Parque',0,0,1,1);
INSERT INTO `direccion` VALUES (15,'Sarmiento ','1532','','Almirante Brown ',0,0,8,1);
INSERT INTO `direccion` VALUES (16,'Las PeÃ±as','580','','Comercial',0,0,8,1);
INSERT INTO `direccion` VALUES (17,'Sarmiento ','1582','','Almirante Brown ',0,0,8,1);
INSERT INTO `direccion` VALUES (18,'O\'Higgins','3900','','San Carlos',0,0,8,1);
INSERT INTO `direccion` VALUES (19,'GÃ³ngora ','1025','','Alta CÃ³rdoba',0,0,8,1);
INSERT INTO `direccion` VALUES (20,'Las piedras ','256','','Yupanqui ',0,0,8,1);
INSERT INTO `direccion` VALUES (21,'Pueblos Unidos','356','','Nuestro Hogar III',0,0,8,1);
INSERT INTO `direccion` VALUES (22,'Alianza ','1010','','Matienzo ',0,0,8,1);
INSERT INTO `direccion` VALUES (23,'Alianza','1010','','Matienzo',0,0,8,1);
INSERT INTO `direccion` VALUES (24,'Las Piedras ','38','','Ameguino ',0,0,8,1);
INSERT INTO `direccion` VALUES (25,'RÃ­o Segundo ','1850','','Altamira ',0,0,8,1);
INSERT INTO `direccion` VALUES (26,'Las Piedras ','38','','Ameguino',0,0,8,1);
INSERT INTO `direccion` VALUES (27,'Igualdad ','3650','','Villa Siburu',0,0,8,1);
INSERT INTO `direccion` VALUES (28,'Igualdad ','3650','2 Departamento 1','Villa Siburu',0,0,8,1);
INSERT INTO `direccion` VALUES (29,'San MartÃ­n ','2584','','Los Robles ',0,0,8,1);
INSERT INTO `direccion` VALUES (30,'','','','',0,0,8,1);
INSERT INTO `direccion` VALUES (31,'Acoyte ','165','','YapeyÃº',0,0,8,1);
INSERT INTO `direccion` VALUES (32,'Acoyte ','165','','YapeyÃº',0,0,8,1);
INSERT INTO `direccion` VALUES (33,'Armenia ','1854','','Bajo PueyrredÃ³n',0,0,8,1);
INSERT INTO `direccion` VALUES (34,'Alsina ','2541','','Yofre ',0,0,8,1);
INSERT INTO `direccion` VALUES (35,'Armenia ','1854','','Bajo PueyrredÃ³n ',0,0,8,1);
INSERT INTO `direccion` VALUES (36,'Rivadavia ','1525','','Nuestro Hogar III',0,0,8,1);
INSERT INTO `direccion` VALUES (37,'Oncativo','1736','','Patria ',0,0,8,1);
INSERT INTO `direccion` VALUES (38,'Oncativo ','1736','','Patria ',0,0,8,1);
INSERT INTO `direccion` VALUES (39,'Juan de Morales ','4720','','Villa Urquiza ',0,0,8,1);
INSERT INTO `direccion` VALUES (40,'Juan de Morales ','4720','','Villa Urquiza ',0,0,8,1);
INSERT INTO `direccion` VALUES (41,'Guacalasta ','325','','General Bustos ',0,0,8,1);
INSERT INTO `direccion` VALUES (42,'Guacalasta ','325','','General Bustos ',0,0,8,1);
INSERT INTO `direccion` VALUES (43,'Frente al canal ','','','Granja Baleriana ',0,0,8,1);
INSERT INTO `direccion` VALUES (44,'Antillas ','1474','','Santa Isabel 3era. secciÃ³n ',0,0,8,1);
INSERT INTO `direccion` VALUES (45,'Independencia ','125','4to Departamento A','Centro ',0,0,8,1);
INSERT INTO `direccion` VALUES (46,'Eguia ZanÃ³n ','10150','','Alto Hermoso',0,0,8,1);
INSERT INTO `direccion` VALUES (47,'Eguia ZanÃ³n ','10150','','Alto Hermoso',0,0,8,1);
INSERT INTO `direccion` VALUES (48,'Chacal ','544','','Villa CornÃº',0,0,8,1);
INSERT INTO `direccion` VALUES (49,'','','','Villa Rivera Indarte ',0,0,8,1);
INSERT INTO `direccion` VALUES (50,'Francisco del Prado ','875','','Parque Liceo 3era. SecciÃ³n ',0,0,8,1);
INSERT INTO `direccion` VALUES (51,'Iturraspe ','1576','','Roque SÃ¡enz PeÃ±a',0,0,1,1);
INSERT INTO `direccion` VALUES (52,'Iturraspe','1576','','Roque SÃ¡enz PeÃ±a',0,0,1,1);
INSERT INTO `direccion` VALUES (53,'Iturraspe','1560','','Roque SÃ¡enz PeÃ±a',0,0,1,1);
INSERT INTO `direccion` VALUES (54,'','','','Centro',0,0,1,1);
INSERT INTO `direccion` VALUES (55,'Rafael NÃ¹Ã±ez ','1564','','ItuzaingÃ³ Anexo',0,0,1,1);
INSERT INTO `direccion` VALUES (56,'Ayachucho ','3505','','Industrial',0,0,1,1);
INSERT INTO `direccion` VALUES (57,'Rafael NuÃ±ez','1564','','ItuzaingÃ³ Anexo',0,0,1,1);
INSERT INTO `direccion` VALUES (58,'RincÃ³n ','365','','Arcor',0,0,1,1);
INSERT INTO `direccion` VALUES (59,'','','','Centro',0,0,1,1);
INSERT INTO `direccion` VALUES (60,'RincÃ³n ','365','','Arcor',0,0,1,1);
INSERT INTO `direccion` VALUES (61,'Los Ãlamos','1457','','Parque',0,0,1,1);
INSERT INTO `direccion` VALUES (62,'Los Ãlamos','1457','B','Parque',0,0,1,1);
INSERT INTO `direccion` VALUES (63,'Cali','123','','Centro',0,0,8,1);
INSERT INTO `direccion` VALUES (64,'25 de mayo ','235','','Centro',0,0,1,1);
INSERT INTO `direccion` VALUES (65,'Libertad','1952','','Parque',0,0,1,1);
INSERT INTO `direccion` VALUES (66,'Rafael NÃºÃ±ez','1020','','ItuzaingÃ³ Anexo',0,0,1,1);
INSERT INTO `direccion` VALUES (67,'Rafael NÃºÃ±ez','1020','','ItuzaingÃ³Anexo',0,0,1,1);
INSERT INTO `direccion` VALUES (68,'Iturraspe','1320','','Roque SÃ¡enz PeÃ±a',0,0,1,1);
INSERT INTO `direccion` VALUES (69,'Iturraspe','1320','','Roque SÃ¡enz PeÃ±a',0,0,1,1);
INSERT INTO `direccion` VALUES (70,'Ascasubi ','2134','','Renacimiento',0,0,8,1);
INSERT INTO `direccion` VALUES (71,'Tanti ','1223','','Villa Revol',0,0,8,1);
INSERT INTO `direccion` VALUES (72,'Gral Bustos','454','','Cofico',0,0,8,1);
INSERT INTO `direccion` VALUES (73,'Gral Bustos ','454','','Cofico',0,0,8,1);
INSERT INTO `direccion` VALUES (74,'Gral Bustos ','454','','Cofico',0,0,8,1);
INSERT INTO `direccion` VALUES (75,'JerÃ³nimo','12','','Alta CÃ³rdoba',0,0,8,1);
INSERT INTO `direccion` VALUES (76,'Caseros','333','','Centro',0,0,8,1);
INSERT INTO `direccion` VALUES (77,'Pringles','325','','General Paz',0,0,8,1);
INSERT INTO `direccion` VALUES (78,'Pringles','325','','General',0,0,8,1);
INSERT INTO `direccion` VALUES (79,'Caseros','215','','Centro',0,0,8,1);
INSERT INTO `direccion` VALUES (80,'corro','217','','cof',0,0,8,1);
INSERT INTO `direccion` VALUES (81,'campillo','212','','cofico',0,0,8,1);
INSERT INTO `direccion` VALUES (82,'Fructuoso Rivera','112','','Nueva Cordoa',0,0,8,1);
INSERT INTO `direccion` VALUES (83,'Armad Arg','1245','','Libertador',0,0,8,1);
INSERT INTO `direccion` VALUES (84,'Allende','100','','Independencia',0,0,8,1);
INSERT INTO `direccion` VALUES (85,'San Martin','1245','','San Martin',0,0,1,1);
INSERT INTO `direccion` VALUES (86,'Roca','1562','','Roca',0,0,8,1);
INSERT INTO `direccion` VALUES (87,'Uruguay','367','','Centro',0,0,8,1);
INSERT INTO `direccion` VALUES (88,'Uruguay','234','','Centro',0,0,8,1);
INSERT INTO `direccion` VALUES (89,'espana','611','','roca',0,0,8,1);
INSERT INTO `direccion` VALUES (90,'Acalle','0123','Adpto','Abarrio',123,456,1,0);
INSERT INTO `direccion` VALUES (91,'Acalle22222','0123','Adpto','Abarrio',123,456,1,0);
INSERT INTO `direccion` VALUES (92,'Acalle22222','0123','Adpto','Abarrio',123,456,1,0);
INSERT INTO `direccion` VALUES (93,'27 de abril','3276','','Alto Alberdi',0,0,8,0);
INSERT INTO `direccion` VALUES (94,'27 de abril','3276','','Alto Alberdi',0,0,8,0);
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
INSERT INTO `familia` VALUES (2,4,1,2,2,0,0,2,0);
INSERT INTO `familia` VALUES (3,1,1,3,3,0,0,0,1);
INSERT INTO `familia` VALUES (4,4,1,4,4,0,1,0,1);
INSERT INTO `familia` VALUES (5,4,4,7,8,0,1,0,1);
INSERT INTO `familia` VALUES (6,4,1,10,12,0,0,0,1);
INSERT INTO `familia` VALUES (7,4,1,12,15,0,0,0,1);
INSERT INTO `familia` VALUES (8,4,4,14,18,0,0,0,1);
INSERT INTO `familia` VALUES (9,3,1,15,21,0,1,0,1);
INSERT INTO `familia` VALUES (10,1,1,16,24,0,0,0,1);
INSERT INTO `familia` VALUES (11,1,6,19,28,0,0,0,1);
INSERT INTO `familia` VALUES (12,3,1,20,30,0,1,0,1);
INSERT INTO `familia` VALUES (13,1,3,21,31,0,0,0,1);
INSERT INTO `familia` VALUES (14,3,1,22,33,0,1,0,1);
INSERT INTO `familia` VALUES (15,3,1,24,36,0,0,0,1);
INSERT INTO `familia` VALUES (16,3,4,27,40,0,0,0,1);
INSERT INTO `familia` VALUES (17,3,1,29,42,0,1,0,1);
INSERT INTO `familia` VALUES (18,3,1,31,45,0,1,0,1);
INSERT INTO `familia` VALUES (19,3,1,33,48,0,1,0,1);
INSERT INTO `familia` VALUES (20,3,1,36,52,0,0,0,1);
INSERT INTO `familia` VALUES (21,3,1,37,55,0,1,0,1);
INSERT INTO `familia` VALUES (22,3,1,39,58,0,0,0,1);
INSERT INTO `familia` VALUES (23,3,1,41,61,0,0,0,1);
INSERT INTO `familia` VALUES (24,1,3,43,64,0,0,0,1);
INSERT INTO `familia` VALUES (25,1,1,44,67,0,0,0,1);
INSERT INTO `familia` VALUES (30,1,1,47,72,0,0,0,1);
INSERT INTO `familia` VALUES (31,1,1,48,75,0,0,0,1);
INSERT INTO `familia` VALUES (32,1,3,50,79,0,0,0,1);
INSERT INTO `familia` VALUES (33,4,1,51,82,0,0,0,1);
INSERT INTO `familia` VALUES (34,4,1,53,85,0,0,0,1);
INSERT INTO `familia` VALUES (35,4,1,55,89,0,0,0,1);
INSERT INTO `familia` VALUES (36,4,1,58,93,0,1,0,1);
INSERT INTO `familia` VALUES (37,4,4,61,97,0,1,0,1);
INSERT INTO `familia` VALUES (38,4,1,63,100,0,0,0,1);
INSERT INTO `familia` VALUES (39,4,1,66,104,0,1,0,1);
INSERT INTO `familia` VALUES (40,4,1,68,107,0,1,0,1);
INSERT INTO `familia` VALUES (41,1,4,70,110,0,0,0,1);
INSERT INTO `familia` VALUES (42,1,7,71,113,0,0,0,1);
INSERT INTO `familia` VALUES (43,2,1,73,117,0,0,0,1);
INSERT INTO `familia` VALUES (44,2,1,74,119,0,0,0,1);
INSERT INTO `familia` VALUES (45,2,4,75,122,0,0,0,1);
INSERT INTO `familia` VALUES (46,2,5,76,125,0,0,0,1);
INSERT INTO `familia` VALUES (62,2,1,78,129,0,0,0,1);
INSERT INTO `familia` VALUES (63,2,1,80,133,0,0,0,1);
INSERT INTO `familia` VALUES (64,2,6,82,136,0,0,0,1);
INSERT INTO `familia` VALUES (65,2,2,83,138,0,0,0,1);
INSERT INTO `familia` VALUES (66,2,1,84,141,0,1,0,1);
INSERT INTO `familia` VALUES (67,2,1,85,144,0,0,0,1);
INSERT INTO `familia` VALUES (68,2,1,86,147,0,0,0,1);
INSERT INTO `familia` VALUES (69,4,1,87,149,0,0,0,1);
INSERT INTO `familia` VALUES (70,1,1,89,151,0,0,0,1);
INSERT INTO `familia` VALUES (71,4,1,2,2,0,0,1,1);
INSERT INTO `familia` VALUES (72,4,1,2,2,0,0,1,1);
INSERT INTO `familia` VALUES (73,4,1,94,2,0,0,1,1);
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
INSERT INTO `inmueble` VALUES (24,10,49,3,44,NULL,26,5,0,2,1,1);
INSERT INTO `inmueble` VALUES (25,10,50,3,45,NULL,NULL,1,0,1,0,0);
INSERT INTO `inmueble` VALUES (26,10,51,1,46,1,27,1,0,1,0,1);
INSERT INTO `inmueble` VALUES (27,10,52,4,47,2,28,1,1,3,1,1);
INSERT INTO `inmueble` VALUES (28,10,53,3,48,NULL,NULL,6,0,2,0,1);
INSERT INTO `inmueble` VALUES (30,4,55,1,50,1,30,2,0,2,0,1);
INSERT INTO `inmueble` VALUES (31,5,56,1,51,1,31,1,0,3,1,1);
INSERT INTO `inmueble` VALUES (32,6,57,1,52,1,32,2,0,2,0,1);
INSERT INTO `inmueble` VALUES (33,7,58,1,53,1,33,3,0,2,0,1);
INSERT INTO `inmueble` VALUES (34,9,59,1,54,1,34,2,0,3,1,1);
INSERT INTO `inmueble` VALUES (35,10,60,1,55,1,35,3,0,4,1,1);
INSERT INTO `inmueble` VALUES (36,11,61,3,56,1,36,1,0,1,0,1);
INSERT INTO `inmueble` VALUES (37,14,62,1,57,1,37,2,0,5,1,1);
INSERT INTO `inmueble` VALUES (38,15,63,3,58,1,38,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (39,16,64,3,59,1,39,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (41,17,66,1,61,1,41,2,0,9,1,1);
INSERT INTO `inmueble` VALUES (42,18,67,3,62,1,42,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (43,19,68,3,63,1,43,2,0,4,1,1);
INSERT INTO `inmueble` VALUES (44,21,69,2,64,1,44,3,0,6,1,1);
INSERT INTO `inmueble` VALUES (45,22,70,4,65,1,45,1,0,4,1,1);
INSERT INTO `inmueble` VALUES (46,23,71,3,66,1,46,2,1,4,1,1);
INSERT INTO `inmueble` VALUES (47,24,72,3,67,1,47,1,1,3,1,1);
INSERT INTO `inmueble` VALUES (48,25,73,3,68,1,48,1,0,4,1,1);
INSERT INTO `inmueble` VALUES (49,30,74,3,69,1,49,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (50,31,75,4,70,1,50,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (51,32,76,3,71,1,51,2,0,7,1,1);
INSERT INTO `inmueble` VALUES (52,33,77,3,72,1,52,2,0,6,1,1);
INSERT INTO `inmueble` VALUES (53,34,78,4,73,1,53,0,0,2,1,1);
INSERT INTO `inmueble` VALUES (54,35,79,3,74,1,54,1,0,4,1,1);
INSERT INTO `inmueble` VALUES (56,36,81,1,76,1,56,2,0,4,1,1);
INSERT INTO `inmueble` VALUES (57,37,82,1,77,1,57,1,0,3,1,1);
INSERT INTO `inmueble` VALUES (58,38,83,1,78,1,58,2,0,4,1,1);
INSERT INTO `inmueble` VALUES (59,39,84,1,79,1,59,1,0,3,1,1);
INSERT INTO `inmueble` VALUES (60,40,85,3,80,1,60,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (61,41,86,2,81,1,61,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (62,42,87,3,82,1,62,3,0,7,1,1);
INSERT INTO `inmueble` VALUES (63,44,88,3,83,1,63,1,0,4,1,1);
INSERT INTO `inmueble` VALUES (64,45,89,3,84,2,64,1,0,1,0,1);
INSERT INTO `inmueble` VALUES (65,46,90,3,85,NULL,NULL,2,0,3,1,1);
INSERT INTO `inmueble` VALUES (66,62,91,3,86,NULL,NULL,1,1,2,1,1);
INSERT INTO `inmueble` VALUES (67,63,92,3,87,NULL,NULL,2,0,6,1,1);
INSERT INTO `inmueble` VALUES (68,65,93,3,88,NULL,NULL,1,0,2,1,1);
INSERT INTO `inmueble` VALUES (69,66,94,3,89,2,NULL,1,0,1,0,1);
INSERT INTO `inmueble` VALUES (70,67,95,3,90,2,65,2,0,6,1,1);
INSERT INTO `inmueble` VALUES (71,69,96,4,91,3,66,1,0,1,0,1);
INSERT INTO `inmueble` VALUES (72,10,49,3,44,NULL,26,5,0,2,0,1);
INSERT INTO `inmueble` VALUES (73,10,49,3,44,NULL,26,5,0,2,0,1);
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
INSERT INTO `pared` VALUES (2,1,2,1);
INSERT INTO `pared` VALUES (3,0,2,1);
INSERT INTO `pared` VALUES (17,0,2,1);
INSERT INTO `pared` VALUES (21,0,2,1);
INSERT INTO `pared` VALUES (25,1,2,1);
INSERT INTO `pared` VALUES (32,0,2,1);
INSERT INTO `pared` VALUES (34,0,2,1);
INSERT INTO `pared` VALUES (42,0,2,1);
INSERT INTO `pared` VALUES (45,0,2,1);
INSERT INTO `pared` VALUES (46,0,2,1);
INSERT INTO `pared` VALUES (47,0,2,1);
INSERT INTO `pared` VALUES (48,1,2,1);
INSERT INTO `pared` VALUES (49,1,4,1);
INSERT INTO `pared` VALUES (50,0,2,1);
INSERT INTO `pared` VALUES (51,0,1,1);
INSERT INTO `pared` VALUES (52,0,3,1);
INSERT INTO `pared` VALUES (53,0,2,1);
INSERT INTO `pared` VALUES (55,1,1,1);
INSERT INTO `pared` VALUES (56,1,1,1);
INSERT INTO `pared` VALUES (57,0,1,1);
INSERT INTO `pared` VALUES (58,0,1,1);
INSERT INTO `pared` VALUES (59,1,1,1);
INSERT INTO `pared` VALUES (60,1,1,1);
INSERT INTO `pared` VALUES (61,0,1,1);
INSERT INTO `pared` VALUES (62,0,1,1);
INSERT INTO `pared` VALUES (63,0,1,1);
INSERT INTO `pared` VALUES (64,0,1,1);
INSERT INTO `pared` VALUES (66,1,1,1);
INSERT INTO `pared` VALUES (67,1,1,1);
INSERT INTO `pared` VALUES (68,1,1,1);
INSERT INTO `pared` VALUES (69,0,1,1);
INSERT INTO `pared` VALUES (70,0,4,1);
INSERT INTO `pared` VALUES (71,0,1,1);
INSERT INTO `pared` VALUES (72,0,2,1);
INSERT INTO `pared` VALUES (73,1,1,1);
INSERT INTO `pared` VALUES (74,1,1,1);
INSERT INTO `pared` VALUES (75,0,2,1);
INSERT INTO `pared` VALUES (76,0,3,1);
INSERT INTO `pared` VALUES (77,0,1,1);
INSERT INTO `pared` VALUES (78,0,1,1);
INSERT INTO `pared` VALUES (79,0,1,1);
INSERT INTO `pared` VALUES (81,0,1,1);
INSERT INTO `pared` VALUES (82,0,1,1);
INSERT INTO `pared` VALUES (83,0,1,1);
INSERT INTO `pared` VALUES (84,0,1,1);
INSERT INTO `pared` VALUES (85,0,3,1);
INSERT INTO `pared` VALUES (86,0,1,1);
INSERT INTO `pared` VALUES (87,0,1,1);
INSERT INTO `pared` VALUES (88,1,2,1);
INSERT INTO `pared` VALUES (89,1,2,1);
INSERT INTO `pared` VALUES (90,0,2,1);
INSERT INTO `pared` VALUES (91,0,2,1);
INSERT INTO `pared` VALUES (92,0,2,1);
INSERT INTO `pared` VALUES (93,0,2,1);
INSERT INTO `pared` VALUES (94,1,2,1);
INSERT INTO `pared` VALUES (95,1,2,1);
INSERT INTO `pared` VALUES (96,0,1,1);
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
INSERT INTO `persona` VALUES (1,'Diego Alejandro','Gordo','25469112','20254691128','2017-06-13',30000,'a@b','',1,4,1,1,2,1,1,6,2,1,5,0,0);
INSERT INTO `persona` VALUES (2,'fffffuuu','rsfhfdgh','25469112','20254691128','2017-06-12',30000,'a@b',NULL,1,4,1,1,3,1,1,6,2,1,5,0,1);
INSERT INTO `persona` VALUES (3,'Joaquin','Gordo','44551983','20445519838','2017-07-05',0,'','',1,4,5,1,1,1,1,4,1,3,6,0,0);
INSERT INTO `persona` VALUES (4,'Manuel','Gordo','46718939','20467189399','2017-07-05',0,'','',1,4,5,1,1,1,1,1,1,3,6,0,1);
INSERT INTO `persona` VALUES (5,'Felipe','Gordo','50034513','20500345139','2017-07-05',0,'','',1,4,5,1,1,1,1,1,1,3,6,0,1);
INSERT INTO `persona` VALUES (6,'Carolina Beatriz','Pacheco','26456789','27264567897','2017-07-05',8000,'','',1,5,1,2,4,1,1,7,3,1,9,0,1);
INSERT INTO `persona` VALUES (7,'Micaela','Pacheco','40567890','27405678907','2017-07-05',0,'','',1,5,5,2,1,1,1,4,1,3,10,0,1);
INSERT INTO `persona` VALUES (8,'SofÃ­a','Pacheco','47906221','27479062217','2017-07-05',0,'','',1,5,5,2,1,1,1,1,1,3,10,0,1);
INSERT INTO `persona` VALUES (9,'Mauricio ','Lucero','24167987','20241679879','2017-07-05',25000,'','',1,6,2,1,2,1,1,7,2,1,13,0,1);
INSERT INTO `persona` VALUES (10,'Carolina','AchÃ¡val','22345679','20223456798','2017-07-05',0,'','',1,6,3,2,2,1,1,5,1,2,14,0,1);
INSERT INTO `persona` VALUES (11,'Ricardo','Gargantini','17564345','20175643459','2017-07-05',20000,'','',1,7,2,2,2,1,1,7,2,1,16,0,1);
INSERT INTO `persona` VALUES (12,'Ana','Carignano','18904340','27189043407','2017-07-05',0,'','',1,7,4,2,2,1,1,7,1,2,17,0,1);
INSERT INTO `persona` VALUES (13,'Carlos ','GoirÃ¡n','27540012','20275400127','2017-07-05',14000,'','',1,8,1,1,2,1,1,5,3,1,19,0,1);
INSERT INTO `persona` VALUES (14,'Natalia','Comelli','28456789','27284567897','2017-07-05',0,'','',1,8,1,2,2,1,1,7,3,2,20,0,1);
INSERT INTO `persona` VALUES (15,'Christhian','GoirÃ¡n','52987333','20529873339','2017-07-05',0,'','',1,8,5,1,1,1,1,1,1,3,20,0,1);
INSERT INTO `persona` VALUES (16,'Martina','GoirÃ¡n','54123456','27541234567','2017-07-05',0,'','',1,8,5,2,1,1,1,1,1,3,20,0,1);
INSERT INTO `persona` VALUES (17,'Luis Julio ','Beladelli','26672084','20266720845','2017-07-05',5000,'','',1,9,2,1,2,1,1,5,1,1,22,0,1);
INSERT INTO `persona` VALUES (18,'Vanina','PÃ©rez','24963455','20249634555','2017-07-05',2500,'','',1,9,3,2,2,2,1,4,1,2,23,0,1);
INSERT INTO `persona` VALUES (19,'Rosa','Beladelli','52852963','27528529630','2017-07-05',0,'','',1,9,4,2,1,1,1,1,1,3,23,0,1);
INSERT INTO `persona` VALUES (20,'Francisco','PeÃ±aloza','20323555','27230235555','2017-07-05',21000,'chacho_penaloza@hotmail.com','',1,10,1,1,2,1,1,5,3,1,25,0,1);
INSERT INTO `persona` VALUES (21,'Rosa','Pascual','21450879','20214508793','2017-07-05',11000,'rosi70pascual@yahoo.com','',1,10,1,2,2,1,1,5,1,2,26,0,1);
INSERT INTO `persona` VALUES (22,'Milagros','Pascual','38542669','20385426693','2017-07-05',0,'','',1,10,5,2,2,1,1,3,1,3,26,0,1);
INSERT INTO `persona` VALUES (23,'PeÃ±aloza','MatÃ­as','40125635','21401256350','2017-07-05',0,'','',1,10,5,1,1,1,1,3,1,3,26,0,1);
INSERT INTO `persona` VALUES (24,'BUstos','JosÃ©','7562031','2075620315','2017-07-05',6500,'','7562031',1,11,5,1,6,1,1,2,1,1,29,0,1);
INSERT INTO `persona` VALUES (25,'Marcelo ','Villaroel ','30852471','27308524710','2017-07-05',12000,'marcelo471@hotmail.com','',1,12,2,1,2,1,1,6,3,1,32,0,1);
INSERT INTO `persona` VALUES (26,'Marcelo ','Villarroel','25343757','20253437570','2017-07-05',6000,'','',1,14,5,1,3,1,1,2,1,1,34,0,1);
INSERT INTO `persona` VALUES (27,'Maria Victoria ','Acosta ','26896323','27268963235','2017-07-05',0,'mariacosta@hotmail.com','',1,14,4,2,3,1,1,3,1,2,35,0,1);
INSERT INTO `persona` VALUES (28,'Milagros ','LeguizamÃ³n','36741852','27367418523','2017-07-05',0,'mililegui@gmail.com','',1,14,4,2,1,1,1,4,1,3,35,0,1);
INSERT INTO `persona` VALUES (29,'JeremÃ­as ','LeguizamÃ³n','40859632','20408596320','2017-07-05',0,'jere2005@gamil.com','',1,14,5,1,1,1,1,3,1,3,35,0,1);
INSERT INTO `persona` VALUES (30,'Marcelo ','Acosta','43968574','27439685744','2017-07-05',0,'','',1,14,5,1,1,1,1,2,1,3,35,0,1);
INSERT INTO `persona` VALUES (31,'Mateo','Villarroel','53455122','23534551220','2017-07-05',0,'','',1,14,5,1,1,1,1,1,1,3,35,0,1);
INSERT INTO `persona` VALUES (32,'Pedro','GonzÃ¡lez','36452147','27364521470','2017-07-05',9000,'pedrito@hotmail.com','',1,15,1,1,2,1,1,5,3,1,37,0,1);
INSERT INTO `persona` VALUES (33,'Celeste ','Peirano','37586923','20375869230','2017-07-05',3500,'celepeirano@gmail.com','',1,15,4,2,2,1,1,5,1,2,38,0,1);
INSERT INTO `persona` VALUES (34,'Luis Miguel ','SÃ¡nchez','38568923','20385689231','2017-07-05',6500,'luismi1987@gmail.com','',1,16,3,1,4,1,1,2,1,1,41,0,1);
INSERT INTO `persona` VALUES (35,'Patricia ','Guevara','26585213','20265852130','2017-07-05',12000,'patoguevara1@gmail.com','',1,17,2,2,6,1,1,5,1,1,43,0,1);
INSERT INTO `persona` VALUES (36,'RubÃ©n ','Guevara','9886644','2798866441','2017-07-05',5660,'','58745',1,17,4,1,6,1,1,3,1,6,44,0,1);
INSERT INTO `persona` VALUES (37,'Natalia Alejandra','Tabares','39564712','20395647120','2017-07-05',3500,'natitabares@hotmail.com','',1,17,3,2,1,1,1,5,1,3,44,0,1);
INSERT INTO `persona` VALUES (38,'Ricardo RubÃ©n ','Tabares','41852963','20418529630','2017-07-05',0,'rickiruben@gmail.com','',1,17,5,1,1,1,1,6,1,3,44,0,1);
INSERT INTO `persona` VALUES (39,'Edgar David ','Tabares','42852963','20428529630','2017-07-05',0,'edgarcitotaba@gmail.com','',1,17,5,1,1,1,1,4,1,3,44,0,1);
INSERT INTO `persona` VALUES (40,'Pablo Angel','Tabares','45789456','20457894565','2017-07-05',0,'angeltabares13@hotmail.com','',1,17,4,1,1,1,1,3,1,3,44,0,1);
INSERT INTO `persona` VALUES (41,'Laura Soledad ','Tabares','47895623','20478956230','2017-07-05',0,'','',1,17,5,2,1,1,1,2,1,3,44,0,1);
INSERT INTO `persona` VALUES (42,'Walter Ariel ','Tabares','49852741','27498527411','2017-07-05',0,'','',1,17,5,1,1,1,1,2,1,3,44,0,1);
INSERT INTO `persona` VALUES (43,'Serena JazmÃ­n ','Reynoso','50594132','20505941320','2017-07-05',0,'','',1,17,5,2,1,1,1,1,1,5,44,0,1);
INSERT INTO `persona` VALUES (44,'Ezequiel ','Romero','10589632','20105896320','2017-07-05',5680,'','25417',1,18,5,1,2,1,1,3,1,1,46,0,1);
INSERT INTO `persona` VALUES (45,'Mercedes','VÃ¡zquez ','11784521','27117845212','2017-07-05',0,'','25478',1,18,5,2,2,1,1,3,1,2,47,0,1);
INSERT INTO `persona` VALUES (46,'Eduardo ','Gimenez','8965374','2089653744','2017-07-05',24000,'eduardogimenez@hotmail.com','',1,19,1,1,2,1,1,7,3,1,49,0,1);
INSERT INTO `persona` VALUES (47,'Elsa Rosa','PÃ©rez','14587422','20145874224','2017-07-05',5400,'elsitaperez@hotmail.com','',1,19,3,2,2,1,1,5,1,2,50,0,1);
INSERT INTO `persona` VALUES (48,'RocÃ­o ','Gimenez','41852987','27418529875','2017-07-05',3500,'ro1992@hotmail.com','',1,19,1,2,1,1,1,6,1,3,50,0,1);
INSERT INTO `persona` VALUES (49,'Lourdes','Gimenez','44854741','20448547410','2017-07-05',3000,'','',1,19,5,2,1,1,1,5,1,3,50,0,1);
INSERT INTO `persona` VALUES (50,'Valeria ','Gorosito ','30124578','20301245780','2017-07-05',7400,'','',1,20,3,2,4,1,1,4,1,1,53,0,1);
INSERT INTO `persona` VALUES (51,'RaÃºl','Gorosito','6541789','2765417897','2017-07-05',5900,'','6987',1,20,5,1,6,1,1,3,3,6,54,0,1);
INSERT INTO `persona` VALUES (52,'Tomas ','Reinoso','40589678','27405896784','2017-07-05',8500,'tommyreinoso@hotmail.com','',1,20,1,1,4,1,1,5,1,8,54,0,1);
INSERT INTO `persona` VALUES (53,'Valeria ','Gorosito','27550575','20275505750','2017-07-05',8000,'valegorosito@gmail.com','',1,21,2,2,5,1,1,5,3,1,56,0,1);
INSERT INTO `persona` VALUES (54,'RaÃºl','Gorosito','8555333','2785553335','2017-07-05',6000,'','',1,21,5,1,6,1,1,3,1,6,57,0,1);
INSERT INTO `persona` VALUES (55,'TomÃ¡s ','Reinoso','30897456','20308974560','2017-07-05',12000,'tommyreinoso@hotmail.com','',1,21,1,1,1,1,1,7,3,8,57,0,1);
INSERT INTO `persona` VALUES (56,'Santiago ','Romero ','40852963','20408529630','2017-07-05',0,'santiromero@hotmail.com','',1,21,5,1,1,1,1,4,1,3,57,0,1);
INSERT INTO `persona` VALUES (57,'Federico ','Romero ','42518475','20425184750','2017-07-05',0,'federomero@gmail.com','',1,21,5,1,1,1,1,4,1,3,57,0,1);
INSERT INTO `persona` VALUES (58,'Maria Gracia','Romero ','54598456','27545984562','2017-07-05',0,'','',1,21,5,2,1,1,1,1,1,3,57,0,1);
INSERT INTO `persona` VALUES (59,'Luis Julio ','Casas','24566122','20245661220','2017-07-05',14000,'ceramistaluisjulio@gmail.com','',1,22,2,1,3,1,1,5,3,1,59,0,1);
INSERT INTO `persona` VALUES (60,'Mariana','LÃ³pez','25455788','27254557885','2017-07-05',7000,'marianita1976@hotmail.com','',1,22,3,2,3,1,1,5,1,2,60,0,1);
INSERT INTO `persona` VALUES (61,'Guadalupe ','Casas','44888963','20448889630','2017-07-05',0,'','',1,22,5,2,1,1,1,2,1,3,60,0,1);
INSERT INTO `persona` VALUES (62,'Manuela','Casas','46852741','20468527410','2017-07-05',0,'','',1,22,5,2,1,1,1,2,1,3,60,0,1);
INSERT INTO `persona` VALUES (63,'Nora Beatriz ','FernÃ¡ndez ','26896452','20268964520','2017-07-05',5600,'','',1,23,3,2,4,1,1,5,1,1,62,0,1);
INSERT INTO `persona` VALUES (64,'Mariela ','FernÃ¡ndez ','42158745','20421587450','2017-07-05',2500,'marifernandez@hotmail.com','',1,23,3,2,1,1,1,4,1,3,63,0,1);
INSERT INTO `persona` VALUES (65,'Carlos Miguel ','Ferreyra ','39654321','27396543215','2017-07-05',4500,'carlitosfe@gmail.com','',1,23,3,1,1,1,1,5,1,4,63,0,1);
INSERT INTO `persona` VALUES (66,'Julio ','Ferreyra ','55854785','20558547850','2017-07-05',0,'','',1,23,5,1,1,1,1,1,1,5,63,0,1);
INSERT INTO `persona` VALUES (67,'AnalÃ­a','Carpio','25457878','20254578780','2017-07-05',0,'','',1,24,5,2,3,1,1,5,1,1,65,0,1);
INSERT INTO `persona` VALUES (68,'Cristian ','Gutierrez','25896363','27258963635','2017-07-05',6500,'','',1,24,3,1,3,1,1,4,1,2,66,0,1);
INSERT INTO `persona` VALUES (69,'Camila ','Gutierrez','38451245','20384512450','2017-07-05',0,'','',1,24,5,2,1,1,1,2,1,3,66,0,1);
INSERT INTO `persona` VALUES (70,'Emanuel ','FalcÃ³n ','22858596','20228585960','2017-07-05',10400,'','',1,25,1,1,2,1,1,5,3,1,68,0,1);
INSERT INTO `persona` VALUES (71,'Rita ','GÃ³mez','24789632','20247896320','2017-07-05',4500,'','',1,25,3,2,2,1,1,5,1,2,69,0,1);
INSERT INTO `persona` VALUES (72,'Irene ','FalcÃ³n ','48524511','20485245110','2017-07-05',0,'','',1,25,5,2,1,1,1,2,1,3,69,0,1);
INSERT INTO `persona` VALUES (73,'Lucila ','FalcÃ³n ','51235689','20512356890','2017-07-05',0,'','',1,25,5,2,1,1,1,1,1,3,69,0,1);
INSERT INTO `persona` VALUES (74,'NÃ©stor Fabian ','Sequeira ','14859685','20148596850','2017-07-05',14000,'','',1,30,2,1,2,1,1,5,1,1,73,0,1);
INSERT INTO `persona` VALUES (75,'Maria Teresa ','Saavedra ','16857421','27168574210','2017-07-05',5000,'','568547',1,30,3,2,2,1,1,5,1,2,74,0,1);
INSERT INTO `persona` VALUES (76,'Celeste Evelin ','Tita','25857411','27258574115','2017-07-05',6000,'','',1,31,1,2,1,1,1,3,1,1,76,0,1);
INSERT INTO `persona` VALUES (77,'Eduardo ','Tita ','9452179','2094521790','2017-07-05',8000,'','65987',1,31,5,1,6,1,1,2,3,6,77,0,1);
INSERT INTO `persona` VALUES (78,'MarÃ­a del Carmen ','MartÃ­nez ','28966587','27289665874','2017-07-05',4500,'','',1,32,3,2,4,1,1,4,1,1,80,0,1);
INSERT INTO `persona` VALUES (79,'Micaela ','Lucero ','36857485','20368574850','2017-07-05',0,'','',1,32,5,2,1,1,1,5,1,3,81,0,1);
INSERT INTO `persona` VALUES (80,'Pedro ','Lucero ','55486969','27554869695','2017-07-05',0,'','',1,32,5,1,1,1,1,1,1,5,81,0,1);
INSERT INTO `persona` VALUES (81,'Marcos ','Lucero ','45783221','20457832210','2017-07-05',0,'','',1,32,5,1,1,1,1,2,1,3,81,0,1);
INSERT INTO `persona` VALUES (82,'Leonel ','Lucero ','40857412','20408574125','2017-07-05',3000,'','',1,32,5,1,1,1,1,4,1,3,81,0,1);
INSERT INTO `persona` VALUES (83,'Santiago','Lucero ','39856523','20398565230','2017-07-05',0,'','',1,32,5,1,1,1,1,5,1,3,81,0,1);
INSERT INTO `persona` VALUES (84,'RaÃºl ','Lucero ','11548263','20115482630','2017-07-05',6000,'','65874',1,32,5,1,2,1,1,3,1,7,81,0,1);
INSERT INTO `persona` VALUES (85,'Sara','Suarez','14856200','27148562003','2017-07-05',5600,'','69874',1,32,5,2,2,1,1,2,1,7,81,0,1);
INSERT INTO `persona` VALUES (86,'Roberto ','Peralta','18667593','20186675939','2017-07-05',0,'','142333366',1,33,3,1,2,1,1,2,1,1,83,0,1);
INSERT INTO `persona` VALUES (87,'Mirta','LudueÃ±a','18567498','27185674987','2017-07-05',0,'','',1,33,5,2,2,1,1,4,1,2,84,0,1);
INSERT INTO `persona` VALUES (88,'Roberto Eduardo','Peralta','39876543','20398765439','2017-07-05',5000,'','',1,33,3,1,1,1,1,5,1,3,84,0,1);
INSERT INTO `persona` VALUES (89,'Wilson Jorge','Peralta','40879238','20408792389','2017-07-05',3000,'','',1,33,3,1,1,1,1,1,1,3,84,0,1);
INSERT INTO `persona` VALUES (90,'Jessica del Valle','Peralta','45874009','27458740097','2017-07-05',3000,'','',1,33,4,2,1,1,1,5,3,3,84,0,1);
INSERT INTO `persona` VALUES (91,'AyelÃ©n Beatriz','Peralta','50967789','27509677897','2017-07-05',0,'','',1,33,5,2,1,1,1,2,1,3,84,0,1);
INSERT INTO `persona` VALUES (92,'MarÃ­a de las Mercedes','CÃ¡ceres de LudueÃ±a','12228975','27122289757','2017-07-05',4000,'','',1,33,5,2,6,1,1,2,1,7,84,0,1);
INSERT INTO `persona` VALUES (93,'Roxana Matilde','Peralta','24188520','27241885207','2017-07-05',6000,'','',1,34,1,2,4,1,1,5,1,1,86,0,1);
INSERT INTO `persona` VALUES (94,'Brian','Peralta','52896772','20528967729','2017-07-05',0,'','',1,34,5,1,1,1,1,1,1,3,87,0,1);
INSERT INTO `persona` VALUES (95,'NatalÃ­','Peralta','54188796','27541887969','2017-07-05',0,'','',1,34,5,2,1,1,1,1,1,3,87,0,1);
INSERT INTO `persona` VALUES (96,'Rodrigo ','Pedraza','27892336','20278923369','2017-07-05',13000,'','',1,35,1,1,3,1,1,4,3,1,90,0,1);
INSERT INTO `persona` VALUES (97,'MarÃ­a Luz ','Martiarena','29753268','27297532687','2017-07-05',0,'','',1,35,5,2,3,1,1,4,1,2,91,0,1);
INSERT INTO `persona` VALUES (98,'Maximiliano ','Pedraza','48976888','20489768889','2017-07-05',0,'','',1,35,5,1,1,1,1,2,1,3,91,0,1);
INSERT INTO `persona` VALUES (99,'BelÃ©n','Pedraza','53987664','27539876647','2017-07-05',0,'','',1,35,5,2,1,1,1,1,1,3,91,0,1);
INSERT INTO `persona` VALUES (100,'Gustavo','Montenegro','30198755','20301987559','2017-07-05',13000,'','',1,36,1,1,2,1,1,6,2,1,94,0,1);
INSERT INTO `persona` VALUES (101,'Mariela','Ballatore','36987569','27369875697','2017-07-05',6000,'','',1,36,1,2,2,1,1,6,1,2,95,0,1);
INSERT INTO `persona` VALUES (102,'Pedro','Montenegro','54779666','20547796669','2017-07-05',0,'','',1,36,5,1,1,1,1,1,1,3,95,0,1);
INSERT INTO `persona` VALUES (103,'Edith','Ballatore','42998756','27429987567','2017-07-05',0,'','123456',1,36,5,2,6,1,1,5,1,7,95,0,1);
INSERT INTO `persona` VALUES (104,'JosÃ© ','Quinteros','22789429','20227894299','2017-07-05',15000,'','',1,37,4,1,2,1,1,5,1,1,98,0,1);
INSERT INTO `persona` VALUES (105,'Adriana','Pagani','23789456','27237894567','2017-07-05',0,'','',1,37,5,2,2,1,1,7,3,2,99,0,1);
INSERT INTO `persona` VALUES (106,'JosÃ©','Quinteros','46879249','20468792499','2017-07-05',0,'','',1,37,5,1,1,1,1,2,1,3,99,0,1);
INSERT INTO `persona` VALUES (107,'RaÃºl','Gordon','17564892','20175648929','2017-07-05',25000,'','',1,38,1,1,2,1,1,7,2,1,101,0,1);
INSERT INTO `persona` VALUES (108,'Liliana','Pacheco','56298123','27562981237','2017-07-05',6000,'','',1,38,5,2,2,1,1,7,3,2,102,0,1);
INSERT INTO `persona` VALUES (109,'Juan Pablo ','Gordon','29100356','20291003569','2017-07-05',0,'','',1,38,5,1,1,1,1,4,1,3,102,0,1);
INSERT INTO `persona` VALUES (110,'RocÃ­o','Gordon','57896243','27578962437','2017-07-05',0,'','',1,38,5,2,1,1,1,1,1,5,102,0,1);
INSERT INTO `persona` VALUES (111,'Rosana','Costa','24789561','27247895617','2017-07-05',15000,'','',1,39,2,2,5,1,1,7,2,1,105,0,1);
INSERT INTO `persona` VALUES (112,'SofÃ­a','Stoppani','53986489','27539864897','2017-07-05',0,'','',1,39,5,2,1,1,1,4,1,3,106,0,1);
INSERT INTO `persona` VALUES (113,'Marianela ','Stoppani','49789123','27497891237','2017-07-05',0,'','',1,39,5,2,1,1,1,1,1,3,106,0,1);
INSERT INTO `persona` VALUES (114,'Rodolfo','Pedrotti','2687596','2026875969','2017-07-05',12000,'','',1,40,2,1,3,1,1,6,3,1,108,0,1);
INSERT INTO `persona` VALUES (115,'Julia','Mattoni','19879204','27198792047','2017-07-05',3000,'','',1,40,3,2,3,1,1,4,1,2,109,0,1);
INSERT INTO `persona` VALUES (116,'Marianela','Pedrotti','57896321','27578963217','2017-07-05',0,'','',1,40,5,2,1,1,1,1,1,3,109,0,1);
INSERT INTO `persona` VALUES (117,'Navarro','Hilario','33877952','20338779525','2017-07-05',21000,'hnava86@hotmail.com','',1,41,2,1,3,1,1,7,2,1,111,0,1);
INSERT INTO `persona` VALUES (118,'Carolina','Sappori','32054123','22320541233','2017-07-05',29000,'carosappori@yahoo.com','',1,41,1,2,3,2,1,7,1,2,112,0,1);
INSERT INTO `persona` VALUES (119,'Antonio','Martinez','22012336','23220123368','2017-07-05',16900,'','',1,42,3,1,2,1,1,4,3,1,114,0,1);
INSERT INTO `persona` VALUES (120,'Marta','Blanes','27895623','20278956235','2017-07-05',7000,'','',1,42,3,2,2,1,1,5,1,2,115,0,1);
INSERT INTO `persona` VALUES (121,'MatÃ­as','Martinez','33250123','20332501235','2017-07-05',0,'','',1,42,4,2,1,1,1,4,1,3,115,0,1);
INSERT INTO `persona` VALUES (122,'Marcos','Martinez','34100256','22341002566','2017-07-05',0,'','',1,42,5,1,2,1,1,4,1,3,115,0,1);
INSERT INTO `persona` VALUES (123,'Aylen','Martinez','34562300','20345623003','2017-07-05',0,'','',1,42,4,2,1,1,1,3,1,3,115,0,1);
INSERT INTO `persona` VALUES (124,'Antonia','Martinez','360123012','203601230125','2017-07-05',0,'','',1,42,5,2,1,1,1,3,1,3,115,0,1);
INSERT INTO `persona` VALUES (125,'Ester','Blanes','7805774','2278057745','2017-07-05',6900,'','7805774',1,42,5,2,6,1,1,5,1,6,115,0,1);
INSERT INTO `persona` VALUES (126,'Caro33lina','Fragueiro','35578785','27355787856','2017-07-05',5000,'carofragueiro@gmail.com','',1,43,4,2,2,1,1,1,1,1,118,0,1);
INSERT INTO `persona` VALUES (127,'Carolina','Fragueiro','35578785','27355787856','2017-07-05',15000,'car@gmail.com','',1,44,5,2,2,1,1,7,2,1,120,0,1);
INSERT INTO `persona` VALUES (128,'AgustÃ­n','Fragueiro','4000000','2040000003','2017-07-05',0,'','',1,44,5,1,1,1,1,1,1,3,121,0,1);
INSERT INTO `persona` VALUES (129,'Elizabet','Fragueiro','21112362','27203623529','2017-07-05',0,'','',1,44,5,2,1,1,1,3,1,3,121,0,1);
INSERT INTO `persona` VALUES (130,'Sebastian','Fragueiro','45236263','20456325896','2017-07-05',10000,'','',1,44,1,1,1,1,1,7,1,2,121,0,1);
INSERT INTO `persona` VALUES (131,'Sebastian','Carbone','21456789','20214567896','2017-07-05',8000,'','',1,45,3,1,2,1,1,5,3,1,123,0,1);
INSERT INTO `persona` VALUES (132,'Andrea','Icardi','32564785','12325647856','2017-07-05',0,'','',1,45,5,2,2,1,1,7,1,2,124,0,1);
INSERT INTO `persona` VALUES (133,'Lidia','Zalazar','12365452','20123564523','2017-07-05',0,'','',1,46,5,2,3,1,1,4,1,1,126,0,1);
INSERT INTO `persona` VALUES (134,'Santino','Zalazar','42536521','20425632512','2017-07-05',0,'','',1,46,5,1,1,1,1,1,1,3,127,0,1);
INSERT INTO `persona` VALUES (135,'Sebastian','Zalazar','25632563','20256325632','2017-07-05',10000,'','',1,46,1,1,3,1,1,7,2,2,127,0,1);
INSERT INTO `persona` VALUES (136,'Andrea','Icardi','25639589','12253654523','2017-07-05',15000,'','',1,62,1,2,4,1,1,5,1,1,130,0,1);
INSERT INTO `persona` VALUES (137,'Luis','Icardi','45263362','20452633626','2017-07-05',0,'','',1,62,5,1,1,1,1,1,1,3,131,0,1);
INSERT INTO `persona` VALUES (138,'Bautista','Icardi','48659326','20486956593','2017-07-05',0,'','',1,62,5,1,1,1,1,1,1,3,131,0,1);
INSERT INTO `persona` VALUES (139,'Adolfo','Arbach','21345654','20213456546','2017-07-05',15000,'','',1,63,2,1,3,1,1,7,2,1,134,0,1);
INSERT INTO `persona` VALUES (140,'Julieta','Dep','14562356','20146523652','2017-07-05',0,'','',1,63,5,2,3,1,1,5,1,2,135,0,1);
INSERT INTO `persona` VALUES (141,'MatÃ­as','Sales','21345658','20214569876','2017-07-05',0,'','',1,63,5,1,1,1,1,3,1,3,135,0,1);
INSERT INTO `persona` VALUES (142,'Guillermo','Frags','21456321','2012354659','2017-07-05',5000,'','',1,63,2,1,5,1,1,1,2,7,135,0,1);
INSERT INTO `persona` VALUES (143,'Pablo','Tevez','12456987','20126547896','2017-07-05',0,'','',1,63,5,1,1,1,1,1,1,9,135,0,1);
INSERT INTO `persona` VALUES (144,'RomÃ¡n','Comba','32562365','274567896','2017-07-05',0,'','',1,63,5,1,1,1,1,5,3,8,135,0,1);
INSERT INTO `persona` VALUES (145,'Estefania','Gherra','30265985','20325623589','2017-07-05',10000,'','',1,64,5,2,1,1,1,7,2,1,137,0,1);
INSERT INTO `persona` VALUES (146,'Liliana','Arraya','146589765','27146598756','2017-07-05',15000,'','',1,65,3,2,5,1,1,7,2,1,139,0,1);
INSERT INTO `persona` VALUES (147,'MamÃ¡Liliana','Arraya','76589568','2776586549','2017-07-05',2000,'','22565487',1,65,5,2,6,1,1,7,1,6,140,0,1);
INSERT INTO `persona` VALUES (148,'Federico','Castro','12546987','20125469876','2017-07-05',20000,'','',1,66,2,1,3,1,1,7,2,1,142,0,1);
INSERT INTO `persona` VALUES (149,'Angeles','Villasuso','25645985','20256459876','2017-07-05',10000,'','',1,66,2,2,3,1,1,7,2,2,143,0,1);
INSERT INTO `persona` VALUES (150,'Cecilia','Gomez','25648956','27153689546','2017-07-05',54000,'','',1,67,4,2,5,1,1,7,2,1,145,0,1);
INSERT INTO `persona` VALUES (151,'Sofia','Navarro','30526526','27356256253','2017-07-05',2000,'','',1,67,4,2,1,1,1,7,2,3,146,0,1);
INSERT INTO `persona` VALUES (152,'Sebastian','Carb','26598654','20265322145','2017-07-05',0,'','',1,67,5,1,3,1,1,1,1,4,146,0,1);
INSERT INTO `persona` VALUES (153,'Pilar','Navarro','12654987','20126549876','2017-07-05',5000,'','',1,67,4,2,1,1,1,5,1,3,146,0,1);
INSERT INTO `persona` VALUES (154,'MarÃ­a','Gomez','4658658','2746586589','2017-07-05',2000,'','5465456',1,67,5,2,5,1,1,7,1,6,146,0,1);
INSERT INTO `persona` VALUES (155,'Florencia','Gomez','23654987','20326549879','2017-07-05',0,'','',1,67,5,2,1,1,1,7,1,8,146,0,1);
INSERT INTO `persona` VALUES (156,'BebÃ©','Pololo','45658965','27456899856','2017-07-05',0,'','',1,67,5,1,1,1,1,1,1,5,146,0,1);
INSERT INTO `persona` VALUES (157,'Paolo','Lopez','12546985','20125469876','2017-07-05',2000,'','2256454',1,68,5,1,1,1,1,1,1,1,148,0,1);
INSERT INTO `persona` VALUES (158,'Daniela','RodrÃ­guez','14256987','27142569877','2017-07-05',3500,'','',1,69,3,2,5,1,1,1,1,1,150,0,1);
INSERT INTO `persona` VALUES (159,'Diego Alejandro','Gordo','25469112','20254691128','2017-06-12',30000,'a@b',NULL,1,4,1,1,2,1,1,6,2,1,5,0,1);
INSERT INTO `persona` VALUES (160,'fffffuuu','Gordo','25469112','20254691128','2017-06-12',30000,'a@b',NULL,1,4,1,1,2,1,1,6,2,1,5,0,1);
INSERT INTO `persona` VALUES (161,'fffffuuu','Gordo','25469112','20254691128','2017-06-12',30000,'a@b',NULL,1,4,1,1,2,1,1,6,2,1,5,0,1);
INSERT INTO `persona` VALUES (162,'fffffuuu','rsfhfdgh','25469112','20254691128','2017-06-12',30000,'a@b',NULL,1,4,1,1,3,1,1,6,2,1,152,0,1);
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
INSERT INTO `plan` VALUES (1,1,'0000-00-00',1);
INSERT INTO `plan` VALUES (2,3,'0000-00-00',1);
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
INSERT INTO `servicioagua` VALUES (1,1,1,1);
INSERT INTO `servicioagua` VALUES (2,5,6,1);
INSERT INTO `servicioagua` VALUES (3,5,6,1);
INSERT INTO `servicioagua` VALUES (13,5,6,1);
INSERT INTO `servicioagua` VALUES (17,5,6,1);
INSERT INTO `servicioagua` VALUES (19,5,6,1);
INSERT INTO `servicioagua` VALUES (24,5,6,1);
INSERT INTO `servicioagua` VALUES (25,5,6,1);
INSERT INTO `servicioagua` VALUES (26,5,4,1);
INSERT INTO `servicioagua` VALUES (27,1,2,1);
INSERT INTO `servicioagua` VALUES (28,1,5,1);
INSERT INTO `servicioagua` VALUES (30,1,2,1);
INSERT INTO `servicioagua` VALUES (31,1,2,1);
INSERT INTO `servicioagua` VALUES (32,1,2,1);
INSERT INTO `servicioagua` VALUES (33,1,2,1);
INSERT INTO `servicioagua` VALUES (34,1,2,1);
INSERT INTO `servicioagua` VALUES (35,1,2,1);
INSERT INTO `servicioagua` VALUES (36,5,2,1);
INSERT INTO `servicioagua` VALUES (37,1,2,1);
INSERT INTO `servicioagua` VALUES (38,5,2,1);
INSERT INTO `servicioagua` VALUES (39,1,2,1);
INSERT INTO `servicioagua` VALUES (41,1,2,1);
INSERT INTO `servicioagua` VALUES (42,2,5,1);
INSERT INTO `servicioagua` VALUES (43,1,2,1);
INSERT INTO `servicioagua` VALUES (44,1,2,1);
INSERT INTO `servicioagua` VALUES (45,4,3,1);
INSERT INTO `servicioagua` VALUES (46,1,2,1);
INSERT INTO `servicioagua` VALUES (47,5,2,1);
INSERT INTO `servicioagua` VALUES (48,1,2,1);
INSERT INTO `servicioagua` VALUES (49,1,2,1);
INSERT INTO `servicioagua` VALUES (50,5,1,1);
INSERT INTO `servicioagua` VALUES (51,4,5,1);
INSERT INTO `servicioagua` VALUES (52,3,5,1);
INSERT INTO `servicioagua` VALUES (53,5,5,1);
INSERT INTO `servicioagua` VALUES (54,3,5,1);
INSERT INTO `servicioagua` VALUES (56,1,2,1);
INSERT INTO `servicioagua` VALUES (57,1,2,1);
INSERT INTO `servicioagua` VALUES (58,1,2,1);
INSERT INTO `servicioagua` VALUES (59,1,2,1);
INSERT INTO `servicioagua` VALUES (60,5,5,1);
INSERT INTO `servicioagua` VALUES (61,1,2,1);
INSERT INTO `servicioagua` VALUES (62,1,2,1);
INSERT INTO `servicioagua` VALUES (63,5,2,1);
INSERT INTO `servicioagua` VALUES (64,4,6,1);
INSERT INTO `servicioagua` VALUES (65,5,6,1);
INSERT INTO `servicioagua` VALUES (66,4,6,1);
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
INSERT INTO `sininmueble` VALUES (33,0,0,1,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (34,0,0,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (35,1,0,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (36,0,0,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (37,0,0,0,NULL,0,NULL,1,1);
INSERT INTO `sininmueble` VALUES (38,0,1,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (39,0,0,0,NULL,0,NULL,1,1);
INSERT INTO `sininmueble` VALUES (40,0,0,0,NULL,1,NULL,0,1);
INSERT INTO `sininmueble` VALUES (41,1,0,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (43,0,1,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (44,0,0,0,NULL,0,NULL,1,1);
INSERT INTO `sininmueble` VALUES (45,0,0,0,NULL,0,NULL,1,1);
INSERT INTO `sininmueble` VALUES (46,0,0,1,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (47,1,0,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (48,0,1,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (49,0,0,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (50,0,0,1,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (51,0,0,0,NULL,0,NULL,0,1);
INSERT INTO `sininmueble` VALUES (52,0,0,0,NULL,1,NULL,0,1);
INSERT INTO `sininmueble` VALUES (53,0,0,0,NULL,1,NULL,0,1);
INSERT INTO `sininmueble` VALUES (54,0,0,0,NULL,0,NULL,1,1);
INSERT INTO `sininmueble` VALUES (55,0,0,0,NULL,0,NULL,0,1);
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
INSERT INTO `techo` VALUES (1,1,1,1);
INSERT INTO `techo` VALUES (2,2,1,1);
INSERT INTO `techo` VALUES (3,2,0,1);
INSERT INTO `techo` VALUES (17,2,0,1);
INSERT INTO `techo` VALUES (21,2,0,1);
INSERT INTO `techo` VALUES (27,2,0,1);
INSERT INTO `techo` VALUES (29,2,0,1);
INSERT INTO `techo` VALUES (37,2,0,1);
INSERT INTO `techo` VALUES (40,2,0,1);
INSERT INTO `techo` VALUES (41,2,0,1);
INSERT INTO `techo` VALUES (42,2,0,1);
INSERT INTO `techo` VALUES (43,2,1,1);
INSERT INTO `techo` VALUES (44,2,0,1);
INSERT INTO `techo` VALUES (45,2,0,1);
INSERT INTO `techo` VALUES (46,2,0,1);
INSERT INTO `techo` VALUES (47,5,0,1);
INSERT INTO `techo` VALUES (48,2,0,1);
INSERT INTO `techo` VALUES (50,2,1,1);
INSERT INTO `techo` VALUES (51,4,1,1);
INSERT INTO `techo` VALUES (52,4,0,1);
INSERT INTO `techo` VALUES (53,2,0,1);
INSERT INTO `techo` VALUES (54,4,1,1);
INSERT INTO `techo` VALUES (55,2,0,1);
INSERT INTO `techo` VALUES (56,4,0,1);
INSERT INTO `techo` VALUES (57,5,1,1);
INSERT INTO `techo` VALUES (58,2,1,1);
INSERT INTO `techo` VALUES (59,6,0,1);
INSERT INTO `techo` VALUES (61,2,1,1);
INSERT INTO `techo` VALUES (62,2,0,1);
INSERT INTO `techo` VALUES (63,2,1,1);
INSERT INTO `techo` VALUES (64,2,1,1);
INSERT INTO `techo` VALUES (65,4,0,1);
INSERT INTO `techo` VALUES (66,5,0,1);
INSERT INTO `techo` VALUES (67,4,0,1);
INSERT INTO `techo` VALUES (68,2,1,1);
INSERT INTO `techo` VALUES (69,2,1,1);
INSERT INTO `techo` VALUES (70,6,0,1);
INSERT INTO `techo` VALUES (71,4,0,1);
INSERT INTO `techo` VALUES (72,4,0,1);
INSERT INTO `techo` VALUES (73,4,0,1);
INSERT INTO `techo` VALUES (74,4,0,1);
INSERT INTO `techo` VALUES (76,3,0,1);
INSERT INTO `techo` VALUES (77,2,1,1);
INSERT INTO `techo` VALUES (78,4,0,1);
INSERT INTO `techo` VALUES (79,4,0,1);
INSERT INTO `techo` VALUES (80,1,0,1);
INSERT INTO `techo` VALUES (81,2,0,1);
INSERT INTO `techo` VALUES (82,2,0,1);
INSERT INTO `techo` VALUES (83,1,1,1);
INSERT INTO `techo` VALUES (84,2,1,1);
INSERT INTO `techo` VALUES (85,2,0,1);
INSERT INTO `techo` VALUES (86,2,0,1);
INSERT INTO `techo` VALUES (87,2,0,1);
INSERT INTO `techo` VALUES (88,2,0,1);
INSERT INTO `techo` VALUES (89,2,1,1);
INSERT INTO `techo` VALUES (90,2,1,1);
INSERT INTO `techo` VALUES (91,5,0,1);
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
INSERT INTO `telefono` VALUES (1,1,'155076720',1);
INSERT INTO `telefono` VALUES (2,0,'0',1);
INSERT INTO `telefono` VALUES (3,0,'4123456',1);
INSERT INTO `telefono` VALUES (4,0,'450293',1);
INSERT INTO `telefono` VALUES (5,0,'0',1);
INSERT INTO `telefono` VALUES (6,0,'0',1);
INSERT INTO `telefono` VALUES (7,0,'0',1);
INSERT INTO `telefono` VALUES (8,0,'0',1);
INSERT INTO `telefono` VALUES (9,0,'0',1);
INSERT INTO `telefono` VALUES (10,0,'0',1);
INSERT INTO `telefono` VALUES (11,0,'0',1);
INSERT INTO `telefono` VALUES (12,0,'0',1);
INSERT INTO `telefono` VALUES (13,0,'0',1);
INSERT INTO `telefono` VALUES (14,0,'0',1);
INSERT INTO `telefono` VALUES (15,0,'0',1);
INSERT INTO `telefono` VALUES (16,0,'0',1);
INSERT INTO `telefono` VALUES (17,0,'0',1);
INSERT INTO `telefono` VALUES (18,1,'0',1);
INSERT INTO `telefono` VALUES (19,0,'0',1);
INSERT INTO `telefono` VALUES (20,0,'0',1);
INSERT INTO `telefono` VALUES (21,0,'4520494',1);
INSERT INTO `telefono` VALUES (22,0,'0',1);
INSERT INTO `telefono` VALUES (23,0,'0',1);
INSERT INTO `telefono` VALUES (24,0,'0',1);
INSERT INTO `telefono` VALUES (25,0,'0',1);
INSERT INTO `telefono` VALUES (26,0,'0',1);
INSERT INTO `telefono` VALUES (27,0,'0',1);
INSERT INTO `telefono` VALUES (28,1,'3516452136',1);
INSERT INTO `telefono` VALUES (29,0,'0',1);
INSERT INTO `telefono` VALUES (30,1,'3516373020',1);
INSERT INTO `telefono` VALUES (31,1,'3516896521',1);
INSERT INTO `telefono` VALUES (32,0,'0',1);
INSERT INTO `telefono` VALUES (33,1,'3516896633',1);
INSERT INTO `telefono` VALUES (34,0,'0',1);
INSERT INTO `telefono` VALUES (35,0,'0',1);
INSERT INTO `telefono` VALUES (36,1,'3517456123',1);
INSERT INTO `telefono` VALUES (37,0,'0',1);
INSERT INTO `telefono` VALUES (38,0,'0',1);
INSERT INTO `telefono` VALUES (39,0,'3514572121',1);
INSERT INTO `telefono` VALUES (40,1,'3514698574',1);
INSERT INTO `telefono` VALUES (41,0,'0',1);
INSERT INTO `telefono` VALUES (42,1,'3518456123',1);
INSERT INTO `telefono` VALUES (43,0,'0',1);
INSERT INTO `telefono` VALUES (44,0,'0',1);
INSERT INTO `telefono` VALUES (45,1,'3516119939',1);
INSERT INTO `telefono` VALUES (46,0,'0',1);
INSERT INTO `telefono` VALUES (47,0,'0',1);
INSERT INTO `telefono` VALUES (48,0,'4518407',1);
INSERT INTO `telefono` VALUES (49,0,'0',1);
INSERT INTO `telefono` VALUES (50,0,'0',1);
INSERT INTO `telefono` VALUES (51,0,'4511199',1);
INSERT INTO `telefono` VALUES (52,1,'3515845621',1);
INSERT INTO `telefono` VALUES (53,0,'0',1);
INSERT INTO `telefono` VALUES (54,0,'0',1);
INSERT INTO `telefono` VALUES (55,0,'4519632',1);
INSERT INTO `telefono` VALUES (56,0,'0',1);
INSERT INTO `telefono` VALUES (57,0,'0',1);
INSERT INTO `telefono` VALUES (58,1,'156895623',1);
INSERT INTO `telefono` VALUES (59,0,'0',1);
INSERT INTO `telefono` VALUES (60,0,'0',1);
INSERT INTO `telefono` VALUES (61,1,'155325132',1);
INSERT INTO `telefono` VALUES (62,0,'0',1);
INSERT INTO `telefono` VALUES (63,0,'0',1);
INSERT INTO `telefono` VALUES (64,1,'155269898',1);
INSERT INTO `telefono` VALUES (65,0,'0',1);
INSERT INTO `telefono` VALUES (66,0,'0',1);
INSERT INTO `telefono` VALUES (67,1,'158451212',1);
INSERT INTO `telefono` VALUES (68,0,'0',1);
INSERT INTO `telefono` VALUES (69,0,'0',1);
INSERT INTO `telefono` VALUES (70,0,'4248598',1);
INSERT INTO `telefono` VALUES (71,0,'3543401260',1);
INSERT INTO `telefono` VALUES (72,0,'3543401260',1);
INSERT INTO `telefono` VALUES (73,0,'0',1);
INSERT INTO `telefono` VALUES (74,0,'0',1);
INSERT INTO `telefono` VALUES (75,1,'154784545',1);
INSERT INTO `telefono` VALUES (76,0,'0',1);
INSERT INTO `telefono` VALUES (77,0,'0',1);
INSERT INTO `telefono` VALUES (78,0,'0',1);
INSERT INTO `telefono` VALUES (79,1,'0',1);
INSERT INTO `telefono` VALUES (80,0,'0',1);
INSERT INTO `telefono` VALUES (81,0,'0',1);
INSERT INTO `telefono` VALUES (82,0,'0',1);
INSERT INTO `telefono` VALUES (83,0,'0',1);
INSERT INTO `telefono` VALUES (84,0,'0',1);
INSERT INTO `telefono` VALUES (85,0,'0',1);
INSERT INTO `telefono` VALUES (86,0,'0',1);
INSERT INTO `telefono` VALUES (87,0,'0',1);
INSERT INTO `telefono` VALUES (88,0,'0',1);
INSERT INTO `telefono` VALUES (89,1,'0',1);
INSERT INTO `telefono` VALUES (90,0,'0',1);
INSERT INTO `telefono` VALUES (91,0,'0',1);
INSERT INTO `telefono` VALUES (92,0,'0',1);
INSERT INTO `telefono` VALUES (93,1,'0',1);
INSERT INTO `telefono` VALUES (94,0,'0',1);
INSERT INTO `telefono` VALUES (95,0,'0',1);
INSERT INTO `telefono` VALUES (96,0,'0',1);
INSERT INTO `telefono` VALUES (97,1,'0',1);
INSERT INTO `telefono` VALUES (98,0,'0',1);
INSERT INTO `telefono` VALUES (99,0,'0',1);
INSERT INTO `telefono` VALUES (100,0,'0',1);
INSERT INTO `telefono` VALUES (101,0,'0',1);
INSERT INTO `telefono` VALUES (102,0,'0',1);
INSERT INTO `telefono` VALUES (103,0,'0',1);
INSERT INTO `telefono` VALUES (104,0,'0',1);
INSERT INTO `telefono` VALUES (105,0,'0',1);
INSERT INTO `telefono` VALUES (106,0,'0',1);
INSERT INTO `telefono` VALUES (107,1,'0',1);
INSERT INTO `telefono` VALUES (108,0,'0',1);
INSERT INTO `telefono` VALUES (109,0,'0',1);
INSERT INTO `telefono` VALUES (110,0,'3514876654',1);
INSERT INTO `telefono` VALUES (111,0,'0',1);
INSERT INTO `telefono` VALUES (112,0,'0',1);
INSERT INTO `telefono` VALUES (113,0,'0',1);
INSERT INTO `telefono` VALUES (114,0,'0',1);
INSERT INTO `telefono` VALUES (115,0,'0',1);
INSERT INTO `telefono` VALUES (116,1,'3516339003',1);
INSERT INTO `telefono` VALUES (117,1,'3516339003',1);
INSERT INTO `telefono` VALUES (118,0,'0',1);
INSERT INTO `telefono` VALUES (119,1,'3516339003',1);
INSERT INTO `telefono` VALUES (120,0,'0',1);
INSERT INTO `telefono` VALUES (121,0,'0',1);
INSERT INTO `telefono` VALUES (122,0,'0',1);
INSERT INTO `telefono` VALUES (123,0,'0',1);
INSERT INTO `telefono` VALUES (124,0,'0',1);
INSERT INTO `telefono` VALUES (125,0,'0',1);
INSERT INTO `telefono` VALUES (126,0,'0',1);
INSERT INTO `telefono` VALUES (127,0,'0',1);
INSERT INTO `telefono` VALUES (128,0,'3514252242',1);
INSERT INTO `telefono` VALUES (129,0,'3516226',1);
INSERT INTO `telefono` VALUES (130,0,'0',1);
INSERT INTO `telefono` VALUES (131,0,'0',1);
INSERT INTO `telefono` VALUES (132,0,'0',1);
INSERT INTO `telefono` VALUES (133,1,'35162',1);
INSERT INTO `telefono` VALUES (134,0,'0',1);
INSERT INTO `telefono` VALUES (135,0,'0',1);
INSERT INTO `telefono` VALUES (136,1,'0',1);
INSERT INTO `telefono` VALUES (137,0,'0',1);
INSERT INTO `telefono` VALUES (138,0,'0',1);
INSERT INTO `telefono` VALUES (139,0,'0',1);
INSERT INTO `telefono` VALUES (140,0,'0',1);
INSERT INTO `telefono` VALUES (141,0,'0',1);
INSERT INTO `telefono` VALUES (142,0,'0',1);
INSERT INTO `telefono` VALUES (143,0,'0',1);
INSERT INTO `telefono` VALUES (144,0,'4565895',1);
INSERT INTO `telefono` VALUES (145,0,'0',1);
INSERT INTO `telefono` VALUES (146,0,'0',1);
INSERT INTO `telefono` VALUES (147,0,'0',1);
INSERT INTO `telefono` VALUES (148,0,'0',1);
INSERT INTO `telefono` VALUES (149,1,'',1);
INSERT INTO `telefono` VALUES (150,0,'',1);
INSERT INTO `telefono` VALUES (151,0,'420342',1);
INSERT INTO `telefono` VALUES (152,0,'0',1);
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
INSERT INTO `terreno` VALUES (1,4,6,500000,100,1,1);
INSERT INTO `terreno` VALUES (2,5,9,400000,74,1,1);
INSERT INTO `terreno` VALUES (3,6,11,300000,250,1,1);
INSERT INTO `terreno` VALUES (4,7,13,450000,300,1,1);
INSERT INTO `terreno` VALUES (5,9,17,458000,80,1,1);
INSERT INTO `terreno` VALUES (6,14,23,150000,60,1,1);
INSERT INTO `terreno` VALUES (7,15,26,80000,50,1,1);
INSERT INTO `terreno` VALUES (8,16,28,50000,40,0,1);
INSERT INTO `terreno` VALUES (10,17,30,350000,350,1,1);
INSERT INTO `terreno` VALUES (11,18,32,189000,250,1,1);
INSERT INTO `terreno` VALUES (12,19,35,320000,320,1,1);
INSERT INTO `terreno` VALUES (13,21,38,740000,400,1,1);
INSERT INTO `terreno` VALUES (14,22,40,250000,250,1,1);
INSERT INTO `terreno` VALUES (15,23,42,420000,250,1,1);
INSERT INTO `terreno` VALUES (16,33,52,200000,250,1,1);
INSERT INTO `terreno` VALUES (17,35,57,300000,270000,1,1);
INSERT INTO `terreno` VALUES (18,36,60,400000,300,1,1);
INSERT INTO `terreno` VALUES (19,37,62,150,150000,1,1);
INSERT INTO `terreno` VALUES (20,38,65,300000,300,1,1);
INSERT INTO `terreno` VALUES (21,39,67,250000,250,1,1);
INSERT INTO `terreno` VALUES (22,40,69,150000,200,1,1);
INSERT INTO `terreno` VALUES (23,63,81,100000,400,0,1);
INSERT INTO `terreno` VALUES (24,69,88,150000,150,1,1);
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
INSERT INTO `trabajoautonomo` VALUES (1,'2017-09-18',10,0);
INSERT INTO `trabajoautonomo` VALUES (2,'2017-09-18',11,0);
INSERT INTO `trabajoautonomo` VALUES (3,'2017-09-18',17,1);
INSERT INTO `trabajoautonomo` VALUES (4,'2017-09-18',35,1);
INSERT INTO `trabajoautonomo` VALUES (5,'2017-09-18',53,1);
INSERT INTO `trabajoautonomo` VALUES (6,'2017-09-18',59,1);
INSERT INTO `trabajoautonomo` VALUES (7,'2017-09-18',74,1);
INSERT INTO `trabajoautonomo` VALUES (8,'2017-09-18',111,1);
INSERT INTO `trabajoautonomo` VALUES (9,'2017-09-18',114,1);
INSERT INTO `trabajoautonomo` VALUES (10,'2017-09-18',117,1);
INSERT INTO `trabajoautonomo` VALUES (11,'2017-09-18',139,1);
INSERT INTO `trabajoautonomo` VALUES (12,'2017-09-18',148,1);
INSERT INTO `trabajoautonomo` VALUES (13,'2017-09-18',9,1);
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
INSERT INTO `trabajodependencia` VALUES (1,'Cartocor SA','2017-09-18',7,5,1,0);
INSERT INTO `trabajodependencia` VALUES (2,'Escuela 9 de julio','2017-09-18',11,8,6,0);
INSERT INTO `trabajodependencia` VALUES (3,'VW','2017-09-18',27,18,20,1);
INSERT INTO `trabajodependencia` VALUES (4,'Lavadero La Gota Loca ','2017-09-18',39,25,32,1);
INSERT INTO `trabajodependencia` VALUES (5,'MetalÃºrgica Danieli Hnos','2017-09-18',51,34,46,1);
INSERT INTO `trabajodependencia` VALUES (6,'Watchman S.A','2017-09-18',70,45,70,1);
INSERT INTO `trabajodependencia` VALUES (7,'Familia Salcedo ','2017-09-18',78,49,76,1);
INSERT INTO `trabajodependencia` VALUES (8,'Casa particular','2017-09-18',88,54,93,1);
INSERT INTO `trabajodependencia` VALUES (9,'Cartesiana SA','2017-09-18',92,56,96,1);
INSERT INTO `trabajodependencia` VALUES (10,'Bertorello Inmobiliaria','2017-09-18',96,59,100,1);
INSERT INTO `trabajodependencia` VALUES (11,'Tribunales Federales','2017-09-18',103,64,107,1);
INSERT INTO `trabajodependencia` VALUES (12,'Tribunales','2017-09-18',132,79,136,1);
INSERT INTO `trabajodependencia` VALUES (13,'Cartocor SA','2017-09-18',7,5,1,1);
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

-- Dump completed on 2017-09-18 22:23:29
