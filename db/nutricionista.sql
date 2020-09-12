CREATE DATABASE  IF NOT EXISTS `nutricionista` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nutricionista`;
-- MySQL dump 10.13  Distrib 8.0.20, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: nutricionista
-- ------------------------------------------------------
-- Server version	8.0.20-0ubuntu0.20.04.1

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
-- Table structure for table `alimento`
--

DROP TABLE IF EXISTS `alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alimento` (
  `id_alimento` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `calorias` int unsigned NOT NULL,
  `grasas` float unsigned NOT NULL,
  `proteinas` float unsigned NOT NULL,
  `carbohidratos` float unsigned NOT NULL,
  `id_categoria` int unsigned NOT NULL,
  PRIMARY KEY (`id_alimento`),
  UNIQUE KEY `id_alimento_UNIQUE` (`id_alimento`),
  KEY `fk_alimento_categoria_idx` (`id_categoria`),
  CONSTRAINT `fk_alimento_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`),
  UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `consumo_paciente`
--

DROP TABLE IF EXISTS `consumo_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo_paciente` (
  `id_paciente` varchar(45) NOT NULL,
  `id_alimento` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `cantidad` int unsigned NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_alimento`,`fecha`,`tipo`),
  KEY `fk_consumo_alimento_idx` (`id_alimento`),
  CONSTRAINT `fk_consumo_alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_consumo_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_nutricionista` varchar(45) NOT NULL,
  `cod_postal` int unsigned NOT NULL,
  `calle` varchar(45) NOT NULL,
  `altura` int unsigned NOT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `depto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_nutricionista`,`cod_postal`),
  KEY `fk_direccion_localidad_idx` (`cod_postal`),
  CONSTRAINT `fk_direccion_localidad` FOREIGN KEY (`cod_postal`) REFERENCES `localidad` (`cod_postal`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_direccion_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ejercicio` (
  `id_ejercicio` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `gasto_energetico` int unsigned NOT NULL,
  PRIMARY KEY (`id_ejercicio`),
  UNIQUE KEY `id_ejercicio_UNIQUE` (`id_ejercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estado_animo`
--

DROP TABLE IF EXISTS `estado_animo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_animo` (
  `id_estado_animo` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_estado_animo`),
  UNIQUE KEY `id_estado_animo_UNIQUE` (`id_estado_animo`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `id_nutricionista` varchar(45) NOT NULL,
  `dia` varchar(45) NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time DEFAULT NULL,
  PRIMARY KEY (`id_nutricionista`,`dia`,`hora_desde`),
  CONSTRAINT `fk_horario_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `localidad`
--

DROP TABLE IF EXISTS `localidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad` (
  `cod_postal` int unsigned NOT NULL,
  `denominacion` varchar(45) NOT NULL,
  PRIMARY KEY (`cod_postal`),
  UNIQUE KEY `cod_postal_UNIQUE` (`cod_postal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `nutricionista`
--

DROP TABLE IF EXISTS `nutricionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutricionista` (
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `matricula_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `nutricionista_paciente`
--

DROP TABLE IF EXISTS `nutricionista_paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nutricionista_paciente` (
  `id_nutricionista` varchar(45) NOT NULL,
  `id_paciente` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`fecha`,`id_paciente`,`id_nutricionista`),
  KEY `fk_nutricionista_paciente_2_idx` (`id_paciente`),
  KEY `fk_nutricionista_paciente_1_idx` (`id_nutricionista`),
  CONSTRAINT `fk_nutricionista_paciente_1` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_nutricionista_paciente_2` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `genero` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `altura` int unsigned DEFAULT NULL,
  `peso` float unsigned DEFAULT NULL,
  `imc` float unsigned DEFAULT NULL,
  `metabolismo_basal` float unsigned DEFAULT NULL,
  `peso_objetivo` float unsigned DEFAULT NULL,
  `objetivo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  UNIQUE KEY `dni_UNIQUE` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `paciente_ejercicio`
--

DROP TABLE IF EXISTS `paciente_ejercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_ejercicio` (
  `id_paciente` varchar(45) NOT NULL,
  `id_ejercicio` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  `duracion` int NOT NULL,
  `intensidad` varchar(45) NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_ejercicio`,`fecha`),
  KEY `fk_paciente_ejercicio_2_idx` (`id_ejercicio`),
  CONSTRAINT `fk_paciente_ejercicio_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_ejercicio_2` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id_ejercicio`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `paciente_estado_animo`
--

DROP TABLE IF EXISTS `paciente_estado_animo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_estado_animo` (
  `id_paciente` varchar(45) NOT NULL,
  `id_estado_animo` int unsigned NOT NULL,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id_paciente`,`id_estado_animo`,`fecha`),
  KEY `fk_paciente_estado_animo_2_idx` (`id_estado_animo`),
  CONSTRAINT `fk_paciente_estado_animo_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_paciente_estado_animo_2` FOREIGN KEY (`id_estado_animo`) REFERENCES `estado_animo` (`id_estado_animo`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan` (
  `id_plan` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_desde` date NOT NULL,
  `id_paciente` varchar(45) NOT NULL,
  `id_nutricionista` varchar(45) NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE KEY `id_plan_UNIQUE` (`id_plan`),
  KEY `fk_plan_paciente_idx` (`id_paciente`),
  KEY `fk_plan_nutricionista_idx` (`id_nutricionista`),
  CONSTRAINT `fk_plan_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_plan_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;



--
-- Table structure for table `plan_alimento`
--

DROP TABLE IF EXISTS `plan_alimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_alimento` (
  `id_alimento` int unsigned NOT NULL,
  `id_plan` int unsigned NOT NULL,
  PRIMARY KEY (`id_alimento`,`id_plan`),
  KEY `fk_plan_alimento_alimento_idx` (`id_alimento`),
  KEY `fk_plan_alimento_2_idx` (`id_plan`),
  CONSTRAINT `fk_plan_alimento_1` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_plan_alimento_2` FOREIGN KEY (`id_plan`) REFERENCES `plan` (`id_plan`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id_paciente` varchar(45) NOT NULL,
  `id_nutricionista` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT 'Pendiente',
  PRIMARY KEY (`id_paciente`,`id_nutricionista`),
  KEY `fk_solicitud_nutricionista_idx` (`id_nutricionista`),
  CONSTRAINT `fk_solicitud_nutricionista` FOREIGN KEY (`id_nutricionista`) REFERENCES `nutricionista` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_solicitud_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`dni`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
