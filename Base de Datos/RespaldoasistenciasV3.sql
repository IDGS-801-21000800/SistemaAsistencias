-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: asistencia_bd
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alumno` (
  `idAlumno` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  `idGrupo` int DEFAULT NULL,
  PRIMARY KEY (`idAlumno`),
  KEY `idPersona` (`idPersona`),
  KEY `fk_idgrupo` (`idGrupo`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `fk_idgrupo` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,8,1),(9,9,1),(10,10,1),(11,11,2),(12,12,2),(13,13,2),(14,14,2),(15,15,2),(16,16,2),(17,17,2),(18,18,2),(19,19,2),(20,20,2),(21,21,3),(22,22,3),(23,23,3),(24,24,3),(25,25,3),(26,26,3),(27,27,3),(28,28,3),(29,29,3),(30,30,3),(31,31,4),(32,32,4),(33,33,4),(34,34,4),(35,35,4),(36,36,4),(37,37,4),(38,38,4),(39,39,4),(40,96,4);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `idAsistencia` int NOT NULL AUTO_INCREMENT,
  `idAlumno` int DEFAULT NULL,
  `idHorario` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idAsistencia`),
  KEY `idAlumno` (`idAlumno`),
  KEY `idHorario` (`idHorario`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`),
  CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idHorario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
INSERT INTO `asistencia` VALUES (1,1,1,'2023-12-08','J'),(2,1,1,'2023-12-08','J'),(3,1,1,'2023-12-08','J'),(4,1,2,'2023-12-08','A'),(5,1,2,'2023-12-08','A');
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `idCarrera` int NOT NULL AUTO_INCREMENT,
  `carrera` varchar(70) DEFAULT NULL,
  `especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Tecnologías de la información y comunicaciones','Desarrollo de software multiplataforma'),(2,'Tecnologías de la información y comunicaciones','Entornos virtuales y negocios digitales'),(3,'Procesos industriales','Plásticos'),(4,'Administración de empresas','Capital humano');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentoescolares`
--

DROP TABLE IF EXISTS `departamentoescolares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentoescolares` (
  `idDepartamentoEscolares` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  PRIMARY KEY (`idDepartamentoEscolares`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `departamentoescolares_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentoescolares`
--

LOCK TABLES `departamentoescolares` WRITE;
/*!40000 ALTER TABLE `departamentoescolares` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentoescolares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directivo`
--

DROP TABLE IF EXISTS `directivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directivo` (
  `idDirectivo` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  PRIMARY KEY (`idDirectivo`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `directivo_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directivo`
--

LOCK TABLES `directivo` WRITE;
/*!40000 ALTER TABLE `directivo` DISABLE KEYS */;
INSERT INTO `directivo` VALUES (1,40),(2,41),(3,42),(4,43),(5,44),(6,45);
/*!40000 ALTER TABLE `directivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupo` (
  `idGrupo` int NOT NULL AUTO_INCREMENT,
  `grado` varchar(45) DEFAULT NULL,
  `grupo` varchar(45) DEFAULT NULL,
  `idCarrera` int DEFAULT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `idCarrera` (`idCarrera`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (1,'101','DSM',1),(2,'102','EVN',2),(3,'103','PIP',3),(4,'104','ANC',4);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `idHorario` int NOT NULL AUTO_INCREMENT,
  `dia` varchar(15) DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `periodo` varchar(45) DEFAULT NULL,
  `idMaestro` int DEFAULT NULL,
  `idGrupo` int DEFAULT NULL,
  `idMateria` int DEFAULT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `idMaestro` (`idMaestro`),
  KEY `idGrupo` (`idGrupo`),
  KEY `fk_idMateria` (`idMateria`),
  CONSTRAINT `fk_idMateria` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idMaestro`),
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES (1,'lunes','17:10:00','19:40:00','septiembre - diciembre',1,1,1),(2,'lunes','19:40:00','21:20:00','septiembre - diciembre',3,1,2),(3,'martes','17:10:00','18:50:00','septiembre - diciembre',5,1,4),(4,'martes','18:50:00','21:20:00','septiembre - diciembre',7,1,7),(5,'miercoles','17:10:00','18:00:00','septiembre - diciembre',8,1,8),(6,'miercoles','18:00:00','20:30:00','septiembre - diciembre',9,1,3),(7,'miercoles','20:30:00','21:20:00','septiembre - diciembre',7,1,7),(8,'jueves','17:10:00','19:40:00','septiembre - diciembre',5,1,4),(9,'jueves','19:40:00','20:30:00','septiembre - diciembre',7,1,7),(10,'jueves','20:30:00','21:20:00','septiembre - diciembre',8,1,8),(11,'viernes','17:10:00','18:50:00','septiembre - diciembre',3,1,2),(12,'viernes','18:50:00','21:20:00','septiembre - diciembre',1,1,1),(13,'lunes','17:10:00','19:40:00','septiembre - diciembre',2,3,1),(14,'lunes','19:40:00','21:20:00','septiembre - diciembre',4,3,2),(15,'martes','17:10:00','18:50:00','septiembre - diciembre',6,3,4),(16,'martes','18:50:00','21:20:00','septiembre - diciembre',10,3,6),(17,'miercoles','17:10:00','18:00:00','septiembre - diciembre',9,3,5),(18,'miercoles','18:00:00','20:30:00','septiembre - diciembre',5,3,3),(19,'miercoles','20:30:00','21:20:00','septiembre - diciembre',10,3,6),(20,'jueves','17:10:00','19:40:00','septiembre - diciembre',6,3,4),(21,'jueves','19:40:00','20:30:00','septiembre - diciembre',10,3,6),(22,'jueves','20:30:00','21:20:00','septiembre - diciembre',9,3,5),(23,'viernes','17:10:00','18:50:00','septiembre - diciembre',4,3,2),(24,'viernes','18:50:00','21:20:00','septiembre - diciembre',2,3,1),(25,'lunes','17:10:00','18:00:00','septiembre - diciembre',8,2,8),(26,'lunes','18:00:00','19:40:00','septiembre - diciembre',7,2,7),(27,'lunes','19:40:00','21:20:00','septiembre - diciembre',5,2,4),(28,'martes','17:10:00','18:50:00','septiembre - diciembre',3,2,2),(29,'martes','18:50:00','21:20:00','septiembre - diciembre',2,2,1),(30,'miercoles','17:10:00','18:00:00','septiembre - diciembre',5,2,4),(31,'miercoles','18:00:00','20:30:00','septiembre - diciembre',7,2,7),(32,'miercoles','20:30:00','21:20:00','septiembre - diciembre',8,2,8),(33,'jueves','17:10:00','18:50:00','septiembre - diciembre',3,2,2),(34,'jueves','18:50:00','21:20:00','septiembre - diciembre',2,2,1),(35,'viernes','17:10:00','19:40:00','septiembre - diciembre',9,2,3),(36,'viernes','19:40:00','21:20:00','septiembre - diciembre',5,2,4),(37,'lunes','17:10:00','18:00:00','septiembre - diciembre',11,4,9),(38,'lunes','18:00:00','19:40:00','septiembre - diciembre',12,4,7),(39,'lunes','19:40:00','21:20:00','septiembre - diciembre',6,4,4),(40,'martes','17:10:00','18:50:00','septiembre - diciembre',4,4,2),(41,'martes','18:50:00','21:20:00','septiembre - diciembre',1,4,1),(42,'miercoles','17:10:00','18:00:00','septiembre - diciembre',6,4,4),(43,'miercoles','18:00:00','20:30:00','septiembre - diciembre',12,4,7),(44,'miercoles','20:30:00','21:20:00','septiembre - diciembre',11,4,9),(45,'jueves','17:10:00','18:50:00','septiembre - diciembre',4,4,2),(46,'jueves','18:50:00','21:20:00','septiembre - diciembre',1,4,1),(47,'viernes','17:10:00','19:40:00','septiembre - diciembre',7,4,10),(48,'viernes','19:40:00','21:20:00','septiembre - diciembre',6,4,4);
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maestro`
--

DROP TABLE IF EXISTS `maestro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maestro` (
  `idMaestro` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  PRIMARY KEY (`idMaestro`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `maestro_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestro`
--

LOCK TABLES `maestro` WRITE;
/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
INSERT INTO `maestro` VALUES (1,46),(2,47),(3,48),(4,49),(5,50),(6,51),(7,52),(8,53),(9,54),(10,55),(11,98),(12,99);
/*!40000 ALTER TABLE `maestro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `idMateria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`idMateria`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` VALUES (1,'Expresión oral y escrita I'),(2,'Inglés'),(3,'Algebra lineal'),(4,'Formación sociocultural I'),(5,'Quimica básica'),(6,'Metrología I'),(7,'Fundamentos de TI'),(8,'Fundamentos de redes'),(9,'Mercadotecnia'),(10,'Informática');
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `padrefamilia`
--

DROP TABLE IF EXISTS `padrefamilia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `padrefamilia` (
  `idPadreFamilia` int NOT NULL AUTO_INCREMENT,
  `idPersona` int DEFAULT NULL,
  `idAlumno` int DEFAULT NULL,
  PRIMARY KEY (`idPadreFamilia`),
  KEY `idPersona` (`idPersona`),
  KEY `idAlumno` (`idAlumno`),
  CONSTRAINT `padrefamilia_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`),
  CONSTRAINT `padrefamilia_ibfk_2` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padrefamilia`
--

LOCK TABLES `padrefamilia` WRITE;
/*!40000 ALTER TABLE `padrefamilia` DISABLE KEYS */;
INSERT INTO `padrefamilia` VALUES (42,56,1),(43,57,2),(44,58,3),(45,59,4),(46,60,5),(47,61,6),(48,62,7),(49,63,8),(50,64,9),(51,65,10),(52,66,11),(53,67,12),(54,68,13),(55,69,14),(56,70,15),(57,71,16),(58,72,17),(59,73,18),(60,74,19),(61,75,20),(62,76,21),(63,77,22),(64,78,23),(65,79,24),(66,80,25),(67,81,26),(68,82,27),(69,83,28),(70,84,29),(71,85,30),(72,86,31),(73,87,32),(74,88,33),(75,89,34),(76,90,35),(77,91,36),(78,92,37),(79,93,38),(80,94,39),(81,95,40);
/*!40000 ALTER TABLE `padrefamilia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `idPersona` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(70) DEFAULT NULL,
  `primerApellido` varchar(45) DEFAULT NULL,
  `segundoApellido` varchar(45) DEFAULT NULL,
  `clave` varchar(45) DEFAULT NULL,
  `contrasenia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Juan','Pérez','Morales','AL230001','AL230001'),(2,'María','García','Santos','AL230002','AL230002'),(3,'Carlos','Rodríguez','Juárez','AL230003','AL230003'),(4,'Ana','López','Núñez','AL230004','AL230004'),(5,'Pedro','González','León','AL230005','AL230005'),(6,'Laura','Martínez','Cervantes','AL230006','AL230006'),(7,'Luis','Sánchez','Rangel','AL230007','AL230007'),(8,'Carmen','Ramírez','Soto','AL230008','AL230008'),(9,'Jorge','Gómez','Hernández','AL230009','AL230009'),(10,'Raquel','Torres','Cárdenas','AL230010','AL230010'),(11,'Sergio','Vargas','Ibarra','AL230011','AL230011'),(12,'Patricia','Jiménez','Delgado','AL230012','AL230012'),(13,'Miguel','Castro','Sánchez','AL230013','AL230013'),(14,'Isabel','Morales','Miranda','AL230014','AL230014'),(15,'Alejandro','Silva','Guzmán','AL230015','AL230015'),(16,'Marta','Ortega','Valencia','AL230016','AL230016'),(17,'Daniel','Méndez','Franco','AL230017','AL230017'),(18,'Carolina','Aguilar','Vargas','AL230018','AL230018'),(19,'Pablo','Delgado','Villarreal','AL230019','AL230019'),(20,'Sofía','Paredes','Cordero','AL230020','AL230020'),(21,'Oscar','Ríos','Gómez','AL230021','AL230021'),(22,'Gabriela','Mendoza','Castillo','AL230022','AL230022'),(23,'Eduardo','Castro','Huerta','AL230023','AL230023'),(24,'Andrea','Navarro','Díaz','AL230024','AL230024'),(25,'Fernando','Velasco','Guerra','AL230025','AL230025'),(26,'Paula','Rivas','Silva','AL230026','AL230026'),(27,'Alejandro','Peña','Cervantes','AL230027','AL230027'),(28,'Daniela','Cordero','Ríos','AL230028','AL230028'),(29,'Manuel','Contreras','Peña','AL230029','AL230029'),(30,'Teresa','Ponce','Cordero','AL230030','AL230030'),(31,'Raúl','Morales','Ibarra','AL230031','AL230031'),(32,'Beatriz','Santos','Delgado','AL230032','AL230032'),(33,'Mario','Juárez','Mendoza','AL230033','AL230033'),(34,'Rosario','Núñez','Navarro','AL230034','AL230034'),(35,'José','León','Velasco','AL230035','AL230035'),(36,'Ana María','Cervantes','Rivas','AL230036','AL230036'),(37,'Luis','Rangel','Peña','AL230037','AL230037'),(38,'Laura','Soto','Cordero','AL230038','AL230038'),(39,'Carlos','Hernández','Contrera','AL230039','AL230039'),(40,'Patricia','Cárdenas','Ponce','DI230040','DI230040'),(41,'Javier','Ibarra','Morales','DI230041','DI230041'),(42,'Fernanda','Delgado','Santos','DI230042','DI230042'),(43,'Eduardo','Sánchez','Juárez','DI230043','DI230043'),(44,'Mariana','Miranda','Núñez','DI230044','DI230044'),(45,'Alejandro','Guzmán','León','DI230045','DI230045'),(46,'Alejandra','Valencia','Cervantes','DC230046','DC230046'),(47,'Miguel','Franco','Rangel','DC230047','DC230047'),(48,'Gabriela','Vargas','Soto','DC230048','DC230048'),(49,'Manuel','Villarreal','Hernández','DC230049','DC230049'),(50,'Valeria','Cordero','Cárdenas','DC230050','DC230050'),(51,'Pablo','Gómez','Ibarra','DC230051','DC230051'),(52,'Fernanda','Castillo','Delgado','DC230052','DC230052'),(53,'Juan Carlos','Huerta','Sánchez','DC230053','DC230053'),(54,'Sofía','Díaz','Miranda','DC230054','DC230054'),(55,'Antonio','Guerra','Guzmán','DC230055','DC230055'),(56,'Andrea','Morales','Ibarra','TU230056','TU230056'),(57,'José Luis','García','Delgado','TU230057','TU230057'),(58,'María','Juárez','Sánchez','TU230058','TU230058'),(59,'Javier','López','Miranda','TU230059','TU230059'),(60,'Ana Karen','León','Guzmán','TU230060','TU230060'),(61,'Francisco','Martínez','Valencia','TU230061','TU230061'),(62,'Carolina','Rangel','Franco','TU230062','TU230062'),(63,'Luis','Ramírez','Vargas','TU230063','TU230063'),(64,'Daniela','Hernández','Villarreal','TU230064','TU230064'),(65,'Juan','Torres','Cordero','TU230065','TU230065'),(66,'Valentina','Ibarra','Gómez','TU230066','TU230066'),(67,'Eduardo','Jiménez','Castillo','TU230067','TU230067'),(68,'Mariana','Sánchez','Huerta','TU230068','TU230068'),(69,'Alejandro','Morales','Díaz','TU230069','TU230069'),(70,'Renata','Guzmán','Guerra','TU230070','TU230070'),(71,'Raúl','Ortega','Silva','TU230071','TU230071'),(72,'Jimena','Franco','Cervantes','TU230072','TU230072'),(73,'Mario','Aguilar','Ríos','TU230073','TU230073'),(74,'Gabriela','Villarreal','Peña','TU230074','TU230074'),(75,'José','Paredes','Cordero','TU230075','TU230075'),(76,'Ana Paula','Gómez','Ibarra','TU230076','TU230076'),(77,'Luis','Mendoza','Delgado','TU230077','TU230077'),(78,'Laura','Huerta','Mendoza','TU230078','TU230078'),(79,'Carlos','Navarro','Oliva','TU230079','TU230079'),(80,'Patricia','Guerra','Velasco','TU230080','TU230080'),(81,'Javier','Rivas','Navarro','TU230081','TU230081'),(82,'Fernanda','Cervantes','Peña','TU230082','TU230082'),(83,'Eduardo','Cordero','Borrego','TU230083','TU230083'),(84,'Mariana','Peña','Contreras','TU230084','TU230084'),(85,'Alejandro','Ponce','Mendoza','TU230085','TU230085'),(86,'Alejandra','Ibarra','Navarro','TU230086','TU230086'),(87,'Miguel','Santos','Velasco','TU230087','TU230087'),(88,'Gabriela','Mendoza','Rivas','TU230088','TU230088'),(89,'Manuel','Núñez','Peña','TU230089','TU230089'),(90,'Valeria','Velasco','Cordero','TU230090','TU230090'),(91,'Pablo','Cervantes','Contreras','TU230091','TU230091'),(92,'Fernanda','Peña','Ponce','TU230092','TU230092'),(93,'Juan Carlos','Soto','Morales','TU230093','TU230093'),(94,'Sofía','Contrera','Hernández','TU230094','TU230094'),(95,'Antonio','Guerra','Cárdenas','TU230095','TU230095'),(96,'Andrea','Peña','Ibarra','AL230096','AL230096'),(97,'José Luis','Peña','Cervantes','TU230097','TU230097'),(98,'Ismael','Garcia','Rangel','DC230099','DC230099'),(99,'Jorge Alberto','Cristiano','Ronaldo','DC230100','DC230100');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistaalumno`
--

DROP TABLE IF EXISTS `vistaalumno`;
/*!50001 DROP VIEW IF EXISTS `vistaalumno`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaalumno` AS SELECT 
 1 AS `idAlumno`,
 1 AS `idGrupo`,
 1 AS `idPersona`,
 1 AS `nombre`,
 1 AS `primerApellido`,
 1 AS `segundoApellido`,
 1 AS `clave`,
 1 AS `contrasenia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaalumnos`
--

DROP TABLE IF EXISTS `vistaalumnos`;
/*!50001 DROP VIEW IF EXISTS `vistaalumnos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaalumnos` AS SELECT 
 1 AS `idAlumno`,
 1 AS `nombre`,
 1 AS `primerApellido`,
 1 AS `segundoApellido`,
 1 AS `clave`,
 1 AS `contrasenia`,
 1 AS `idGrupo`,
 1 AS `grado`,
 1 AS `grupo`,
 1 AS `idCarrera`,
 1 AS `carrera`,
 1 AS `especialidad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistagrupos`
--

DROP TABLE IF EXISTS `vistagrupos`;
/*!50001 DROP VIEW IF EXISTS `vistagrupos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistagrupos` AS SELECT 
 1 AS `idGrupo`,
 1 AS `grado`,
 1 AS `grupo`,
 1 AS `idCarrera`,
 1 AS `carrera`,
 1 AS `especialidad`,
 1 AS `idhorario`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistahorario`
--

DROP TABLE IF EXISTS `vistahorario`;
/*!50001 DROP VIEW IF EXISTS `vistahorario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistahorario` AS SELECT 
 1 AS `idHorario`,
 1 AS `dia`,
 1 AS `horaInicio`,
 1 AS `horaFin`,
 1 AS `periodo`,
 1 AS `idGrupo`,
 1 AS `idMaestro`,
 1 AS `nombreMaestro`,
 1 AS `primerApellido`,
 1 AS `segundoApellido`,
 1 AS `clave`,
 1 AS `contrasenia`,
 1 AS `idMateria`,
 1 AS `nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vistaalumno`
--

/*!50001 DROP VIEW IF EXISTS `vistaalumno`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaalumno` AS select `a`.`idAlumno` AS `idAlumno`,`a`.`idGrupo` AS `idGrupo`,`p`.`idPersona` AS `idPersona`,`p`.`nombre` AS `nombre`,`p`.`primerApellido` AS `primerApellido`,`p`.`segundoApellido` AS `segundoApellido`,`p`.`clave` AS `clave`,`p`.`contrasenia` AS `contrasenia` from (`alumno` `a` join `persona` `p`) where (`a`.`idPersona` = `p`.`idPersona`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaalumnos`
--

/*!50001 DROP VIEW IF EXISTS `vistaalumnos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaalumnos` AS select `a`.`idAlumno` AS `idAlumno`,`a`.`nombre` AS `nombre`,`a`.`primerApellido` AS `primerApellido`,`a`.`segundoApellido` AS `segundoApellido`,`a`.`clave` AS `clave`,`a`.`contrasenia` AS `contrasenia`,`g`.`idGrupo` AS `idGrupo`,`g`.`grado` AS `grado`,`g`.`grupo` AS `grupo`,`g`.`idCarrera` AS `idCarrera`,`g`.`carrera` AS `carrera`,`g`.`especialidad` AS `especialidad` from (`vistaalumno` `a` join (select `g`.`idGrupo` AS `idGrupo`,`g`.`grado` AS `grado`,`g`.`grupo` AS `grupo`,`c`.`idCarrera` AS `idCarrera`,`c`.`carrera` AS `carrera`,`c`.`especialidad` AS `especialidad` from (`grupo` `g` join `carrera` `c`) where (`g`.`idCarrera` = `c`.`idCarrera`)) `g` on((`a`.`idGrupo` = `g`.`idGrupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistagrupos`
--

/*!50001 DROP VIEW IF EXISTS `vistagrupos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistagrupos` AS select `vg`.`idGrupo` AS `idGrupo`,`vg`.`grado` AS `grado`,`vg`.`grupo` AS `grupo`,`vg`.`idCarrera` AS `idCarrera`,`vg`.`carrera` AS `carrera`,`vg`.`especialidad` AS `especialidad`,`h`.`idHorario` AS `idhorario` from (`horario` `h` join (select `g`.`idGrupo` AS `idGrupo`,`g`.`grado` AS `grado`,`g`.`grupo` AS `grupo`,`c`.`idCarrera` AS `idCarrera`,`c`.`carrera` AS `carrera`,`c`.`especialidad` AS `especialidad` from (`grupo` `g` join `carrera` `c`) where (`g`.`idCarrera` = `c`.`idCarrera`)) `vg` on((`h`.`idGrupo` = `vg`.`idGrupo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistahorario`
--

/*!50001 DROP VIEW IF EXISTS `vistahorario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistahorario` AS select `h`.`idHorario` AS `idHorario`,`h`.`dia` AS `dia`,`h`.`horaInicio` AS `horaInicio`,`h`.`horaFin` AS `horaFin`,`h`.`periodo` AS `periodo`,`h`.`idGrupo` AS `idGrupo`,`vm`.`idMaestro` AS `idMaestro`,`vm`.`nombreMaestro` AS `nombreMaestro`,`vm`.`primerApellido` AS `primerApellido`,`vm`.`segundoApellido` AS `segundoApellido`,`vm`.`clave` AS `clave`,`vm`.`contrasenia` AS `contrasenia`,`m`.`idMateria` AS `idMateria`,`m`.`nombre` AS `nombre` from ((`horario` `h` join (select `d`.`idMaestro` AS `idMaestro`,`p`.`nombre` AS `nombreMaestro`,`p`.`primerApellido` AS `primerApellido`,`p`.`segundoApellido` AS `segundoApellido`,`p`.`clave` AS `clave`,`p`.`contrasenia` AS `contrasenia` from (`maestro` `d` join `persona` `p`) where (`d`.`idPersona` = `p`.`idPersona`)) `vm` on((`h`.`idMaestro` = `vm`.`idMaestro`))) join (select `materia`.`idMateria` AS `idMateria`,`materia`.`nombre` AS `nombre` from `materia`) `m` on((`h`.`idMateria` = `m`.`idMateria`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 15:39:19
