-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: asistencia_bd
-- ------------------------------------------------------
-- Server version	8.0.33

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
  PRIMARY KEY (`idAlumno`),
  KEY `idPersona` (`idPersona`),
  CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`idPersona`) REFERENCES `persona` (`idPersona`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `idAlumno` int DEFAULT NULL,
  `idHorario` int DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  `Estatus` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `idAlumno` (`idAlumno`),
  KEY `idHorario` (`idHorario`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`),
  CONSTRAINT `asistencia_ibfk_2` FOREIGN KEY (`idHorario`) REFERENCES `horario` (`idHorario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
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
  `carrera` varchar(45) DEFAULT NULL,
  `especialidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCarrera`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directivo`
--

LOCK TABLES `directivo` WRITE;
/*!40000 ALTER TABLE `directivo` DISABLE KEYS */;
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
  `idMateria` int DEFAULT NULL,
  `idAlumno` int DEFAULT NULL,
  PRIMARY KEY (`idGrupo`),
  KEY `idCarrera` (`idCarrera`),
  KEY `idAlumno` (`idAlumno`),
  KEY `idMateria` (`idMateria`),
  CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`idCarrera`) REFERENCES `carrera` (`idCarrera`),
  CONSTRAINT `grupo_ibfk_2` FOREIGN KEY (`idAlumno`) REFERENCES `alumno` (`idAlumno`),
  CONSTRAINT `grupo_ibfk_3` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
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
  `Dia` varchar(15) DEFAULT NULL,
  `HoraInicio` time DEFAULT NULL,
  `HoraFin` time DEFAULT NULL,
  `idMaestro` int DEFAULT NULL,
  `idGrupo` int DEFAULT NULL,
  PRIMARY KEY (`idHorario`),
  KEY `idMaestro` (`idMaestro`),
  KEY `idGrupo` (`idGrupo`),
  CONSTRAINT `horario_ibfk_1` FOREIGN KEY (`idMaestro`) REFERENCES `maestro` (`idMaestro`),
  CONSTRAINT `horario_ibfk_2` FOREIGN KEY (`idGrupo`) REFERENCES `grupo` (`idGrupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maestro`
--

LOCK TABLES `maestro` WRITE;
/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `padrefamilia`
--

LOCK TABLES `padrefamilia` WRITE;
/*!40000 ALTER TABLE `padrefamilia` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Juan','Perez','Gomez','AL231868','AL231868'),(2,'Juan','Perez','Gomez','AL236232','AL236232'),(3,'Ruben','Lopez','Gonzalez','AL235558','AL235558');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistagrupo`
--

DROP TABLE IF EXISTS `vistagrupo`;
/*!50001 DROP VIEW IF EXISTS `vistagrupo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistagrupo` AS SELECT 
 1 AS `idGrupo`,
 1 AS `grado`,
 1 AS `grupo`,
 1 AS `carrera`,
 1 AS `especialidad`,
 1 AS `materia`,
 1 AS `maestro`,
 1 AS `dia`,
 1 AS `horaInicio`,
 1 AS `horaFin`,
 1 AS `idAlumno`,
 1 AS `nombreAlumno`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vistagrupo`
--

/*!50001 DROP VIEW IF EXISTS `vistagrupo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistagrupo` AS select `g`.`idGrupo` AS `idGrupo`,`g`.`grado` AS `grado`,`g`.`grupo` AS `grupo`,`c`.`carrera` AS `carrera`,`c`.`especialidad` AS `especialidad`,`m`.`nombre` AS `materia`,concat(`p`.`nombre`,' ',`p`.`primerApellido`,' ',`p`.`segundoApellido`) AS `maestro`,`h`.`Dia` AS `dia`,`h`.`HoraInicio` AS `horaInicio`,`h`.`HoraFin` AS `horaFin`,`a`.`idAlumno` AS `idAlumno`,concat(`ap`.`nombre`,' ',`ap`.`primerApellido`,' ',`ap`.`segundoApellido`) AS `nombreAlumno` from (((((((`grupo` `g` join `carrera` `c` on((`g`.`idCarrera` = `c`.`idCarrera`))) join `materia` `m` on((`g`.`idMateria` = `m`.`idMateria`))) join `horario` `h` on((`g`.`idGrupo` = `h`.`idGrupo`))) join `maestro` `mst` on((`h`.`idMaestro` = `mst`.`idMaestro`))) join `persona` `p` on((`mst`.`idPersona` = `p`.`idPersona`))) left join `alumno` `a` on((`g`.`idAlumno` = `a`.`idAlumno`))) left join `persona` `ap` on((`a`.`idPersona` = `ap`.`idPersona`))) */;
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

-- Dump completed on 2023-12-02  8:48:08
