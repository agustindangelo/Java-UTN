-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-12-2020 a las 20:27:40
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

create schema nutricionista;
use nutricionista;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nutricionista`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alimento`
--

CREATE TABLE `alimento` (
  `id_alimento` int UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `calorias` int UNSIGNED NOT NULL,
  `grasas` float UNSIGNED NOT NULL,
  `proteinas` float UNSIGNED NOT NULL,
  `carbohidratos` float UNSIGNED NOT NULL,
  `id_categoria` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `categoria` (
  `id_categoria` int UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE `consumo_paciente` (
  `dni` varchar(45) NOT NULL,
  `id_alimento` int UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `cantidad` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `dni` varchar(45) NOT NULL,
  `cod_postal` int UNSIGNED NOT NULL,
  `calle` varchar(45) NOT NULL,
  `altura` int UNSIGNED NOT NULL,
  `piso` varchar(45) DEFAULT NULL,
  `depto` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Estructura de tabla para la tabla `ejercicio`
--

CREATE TABLE `ejercicio` (
  `id_ejercicio` int UNSIGNED NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `gasto_energetico` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `dni` varchar(45) NOT NULL,
  `dia` varchar(45) NOT NULL,
  `hora_desde` time NOT NULL,
  `hora_hasta` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidad`
--

CREATE TABLE `localidad` (
  `cod_postal` int UNSIGNED NOT NULL,
  `denominacion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `localidad`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nutricionista`
--

CREATE TABLE `nutricionista` (
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nutricionista_paciente`
--

CREATE TABLE `nutricionista_paciente` (
  `dni_nutricionista` varchar(45) NOT NULL,
  `dni_paciente` varchar(45) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `genero` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `altura` int UNSIGNED DEFAULT NULL,
  `peso` float UNSIGNED DEFAULT NULL,
  `imc` float UNSIGNED DEFAULT NULL,
  `metabolismo_basal` float UNSIGNED DEFAULT NULL,
  `peso_objetivo` float UNSIGNED DEFAULT NULL,
  `objetivo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente_ejercicio`
--

CREATE TABLE `paciente_ejercicio` (
  `dni_paciente` varchar(45) NOT NULL,
  `id_ejercicio` int UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `duracion` int NOT NULL,
  `intensidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plan`
--

CREATE TABLE `plan` (
  `id_plan` int UNSIGNED NOT NULL,
  `fecha_desde` date NOT NULL,
  `dni_paciente` varchar(45) NOT NULL,
  `dni_nutricionista` varchar(45) NOT NULL,
  `kcal_diarias` int UNSIGNED NOT NULL,
  `proteinas_diarias` int UNSIGNED NOT NULL,
  `carbohidratos_diarios` int UNSIGNED NOT NULL,
  `grasas_diarias` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitud`
--

CREATE TABLE `solicitud` (
  `dni_paciente` varchar(45) NOT NULL,
  `dni_nutricionista` varchar(45) NOT NULL,
  `estado` varchar(45) DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alimento`
--
ALTER TABLE `alimento`
  ADD PRIMARY KEY (`id_alimento`),
  ADD UNIQUE KEY `id_alimento_UNIQUE` (`id_alimento`),
  ADD KEY `fk_alimento_categoria_idx` (`id_categoria`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `id_categoria_UNIQUE` (`id_categoria`);

--
-- Indices de la tabla `consumo_paciente`
--
ALTER TABLE `consumo_paciente`
  ADD PRIMARY KEY (`dni`,`id_alimento`,`fecha`,`tipo`),
  ADD KEY `fk_consumo_alimento_idx` (`id_alimento`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`dni`,`cod_postal`),
  ADD KEY `fk_direccion_localidad_idx` (`cod_postal`);

--
-- Indices de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  ADD PRIMARY KEY (`id_ejercicio`),
  ADD UNIQUE KEY `id_ejercicio_UNIQUE` (`id_ejercicio`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`dni`,`dia`,`hora_desde`);

--
-- Indices de la tabla `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`cod_postal`),
  ADD UNIQUE KEY `cod_postal_UNIQUE` (`cod_postal`);

--
-- Indices de la tabla `nutricionista`
--
ALTER TABLE `nutricionista`
  ADD PRIMARY KEY (`dni`),
  ADD UNIQUE KEY `matricula_UNIQUE` (`dni`);

--
-- Indices de la tabla `nutricionista_paciente`
--
ALTER TABLE `nutricionista_paciente`
  ADD PRIMARY KEY (`fecha`,`dni_paciente`,`dni_nutricionista`),
  ADD KEY `fk_nutricionista_paciente_2_idx` (`dni_paciente`),
  ADD KEY `fk_nutricionista_paciente_1_idx` (`dni_nutricionista`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`dni`),
  ADD UNIQUE KEY `dni_UNIQUE` (`dni`);

--
-- Indices de la tabla `paciente_ejercicio`
--
ALTER TABLE `paciente_ejercicio`
  ADD PRIMARY KEY (`dni_paciente`,`id_ejercicio`,`fecha`),
  ADD KEY `fk_paciente_ejercicio_2_idx` (`id_ejercicio`);

--
-- Indices de la tabla `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`id_plan`),
  ADD UNIQUE KEY `id_plan_UNIQUE` (`id_plan`),
  ADD KEY `fk_plan_paciente_idx` (`dni_paciente`),
  ADD KEY `fk_plan_nutricionista_idx` (`dni_nutricionista`);

--
-- Indices de la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD PRIMARY KEY (`dni_paciente`,`dni_nutricionista`),
  ADD KEY `fk_solicitud_nutricionista_idx` (`dni_nutricionista`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alimento`
--
ALTER TABLE `alimento`
  MODIFY `id_alimento` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=357;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `ejercicio`
--
ALTER TABLE `ejercicio`
  MODIFY `id_ejercicio` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `plan`
--
ALTER TABLE `plan`
  MODIFY `id_plan` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alimento`
--
ALTER TABLE `alimento`
  ADD CONSTRAINT `fk_alimento_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `consumo_paciente`
--
ALTER TABLE `consumo_paciente`
  ADD CONSTRAINT `fk_consumo_alimento` FOREIGN KEY (`id_alimento`) REFERENCES `alimento` (`id_alimento`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_consumo_paciente` FOREIGN KEY (`dni`) REFERENCES `paciente` (`dni`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `fk_direccion_localidad` FOREIGN KEY (`cod_postal`) REFERENCES `localidad` (`cod_postal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_direccion_nutricionista` FOREIGN KEY (`dni`) REFERENCES `nutricionista` (`dni`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_nutricionista` FOREIGN KEY (`dni`) REFERENCES `nutricionista` (`dni`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `nutricionista_paciente`
--
ALTER TABLE `nutricionista_paciente`
  ADD CONSTRAINT `fk_nutricionista_paciente_1` FOREIGN KEY (`dni_nutricionista`) REFERENCES `nutricionista` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nutricionista_paciente_2` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `paciente_ejercicio`
--
ALTER TABLE `paciente_ejercicio`
  ADD CONSTRAINT `fk_paciente_ejercicio_1` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_paciente_ejercicio_2` FOREIGN KEY (`id_ejercicio`) REFERENCES `ejercicio` (`id_ejercicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `fk_plan_nutricionista` FOREIGN KEY (`dni_nutricionista`) REFERENCES `nutricionista` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_plan_paciente` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `solicitud`
--
ALTER TABLE `solicitud`
  ADD CONSTRAINT `fk_solicitud_nutricionista` FOREIGN KEY (`dni_nutricionista`) REFERENCES `nutricionista` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_solicitud_paciente` FOREIGN KEY (`dni_paciente`) REFERENCES `paciente` (`dni`) ON UPDATE CASCADE;
COMMIT;


--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Vegetal'),
(2, 'Carne'),
(4, 'Lacteo'),
(5, 'Fruta'),
(7, 'Cereal'),
(8, 'Azucarado'),
(9, 'Huevo');


--
-- Volcado de datos para la tabla `alimento`
--

INSERT INTO `alimento` (`id_alimento`, `nombre`, `calorias`, `grasas`, `proteinas`, `carbohidratos`, `id_categoria`) VALUES
(4, 'Batata, dulce', 263, 0.1, 0.9, 65, 8),
(5, 'Chocolatín', 549, 31.5, 5.4, 62.4, 8),
(6, 'Ciruela, mermelada', 306, 0.2, 3.7, 73.1, 8),
(7, 'Dulce de Leche Light', 260, 1.6, 6.2, 52.9, 8),
(8, 'Dulce de leche', 314, 6.6, 6.5, 57.4, 8),
(9, 'Dulce de leche para reposteria', 317, 7.5, 7.3, 55, 8),
(10, 'Dulce de leche repostero suelto', 337, 7.9, 5.3, 7.9, 8),
(11, 'Durazno, mermelada', 304, 0.1, 3.5, 76.4, 8),
(12, 'Frutilla, mermelada', 309, 0.6, 3.8, 73.2, 8),
(13, 'Leche, dulce de leche', 341, 9, 8.1, 56.8, 8),
(14, 'Cerdo, costilla, a la parrilla', 320, 24.3, 25.2, 0, 2),
(15, 'Cerdo, jamón cocido', 211, 14.4, 20.3, 0, 2),
(16, 'Cerdo, jamón crudo', 473, 44.6, 18, 0, 2),
(17, 'Cerdo, panceta', 670, 70.8, 8.3, 0, 2),
(18, 'Cordero, carne de la paleta, flaca, a la parr', 182, 7.8, 28, 0, 2),
(19, 'Pollo, asado a la parrilla', 168, 5.4, 29.8, 0, 2),
(20, 'Pollo, asado al horno', 162, 5.4, 28.4, 0, 2),
(21, 'Pollo, hervido', 198, 11.7, 23.1, 0, 2),
(22, 'Vacuno, bife, a la parrilla', 189, 10.1, 24.6, 0, 2),
(23, 'Vacuno, en conserva, enlatado', 224, 14.4, 23.7, 0, 2),
(24, 'Vacuno, hamburguesas cocidas', 248, 18.4, 20.5, 0, 2),
(25, 'Vacuno, hamburguesas light cocidas', 199, 12.8, 21, 0, 2),
(26, 'Vacuno, jugo de carne', 33, 0.6, 6.8, 0, 2),
(27, 'Vacuno, pasta de hígado', 335, 31, 14, 0, 2),
(28, 'Vacuno, ternera, costilla flaca, a la parrill', 139, 3.4, 27.2, 0, 2),
(29, 'Vacuno, vacío, a la parrilla', 258, 17.3, 25.6, 0, 2),
(30, 'Vacuno, vacío, al horno', 241, 14.3, 28.1, 0, 2),
(31, 'Bife, cocido', 233, 9.9, 36, 0, 2),
(32, 'Nalga, cocida', 197, 4.4, 38.6, 0, 2),
(33, 'Paleta, cocida', 207, 6.4, 37, 0, 2),
(34, 'Vacío, cocido', 231, 6.8, 41.1, 0, 2),
(35, 'Bife, cocido', 236, 9.8, 36.5, 0, 2),
(36, 'Nalga, cocida', 177, 3.8, 35.1, 0, 2),
(37, 'Paleta, cocida', 192, 5.2, 35.5, 0, 2),
(38, 'Vacío, cocido', 203, 5, 38.4, 0, 2),
(39, 'Mortadela', 139, 5.7, 16, 0, 2),
(40, 'Carne de vizcacha', 46, 3.7, 23.9, 0, 2),
(41, 'Amaranto, semilla, cruda (Amarantus caudatus)', 384, 7.6, 15.3, 63.6, 7),
(42, 'Amaranto, semilla, cruda (Amarantus hipochond', 381, 7.4, 14.4, 64.3, 7),
(43, 'Amaranto, semilla, cruda (Amarantus mantegazz', 388, 8.4, 15.4, 62.7, 7),
(44, 'Amaranto, semillia, cruda (Amarantus cruentus', 384, 7.6, 15.6, 63.4, 7),
(45, 'Arroz, grano, blanco, pulido, crudo', 339, 0.2, 6.9, 79.2, 7),
(46, 'Arroz, grano, blanco, pulido, hervido', 82, 0.1, 1.4, 19.4, 7),
(47, 'Avena , grano, arrollada, cruda', 383, 7.8, 15.6, 62.5, 7),
(48, 'Avena, grano, arrollada, cruda', 343, 7.1, 12.8, 0, 7),
(49, 'Avena, grano, arrollada, hervida', 86, 1.9, 3.8, 15.8, 7),
(50, 'Cebada, grano, mondado, perlado, crudo', 317, 1.5, 10.2, 74.9, 7),
(51, 'Cebada, grano, mondado, perlado, hervido', 82, 0.1, 3.8, 19.3, 7),
(52, 'Cebada, harina \"Genser\", cruda', 328, 1.7, 10.2, 76.9, 7),
(53, 'Centeno, harina, clara, cruda', 332, 0.9, 8.9, 78.5, 7),
(54, 'Centeno, pan', 206, 0.6, 8.7, 48.9, 7),
(55, 'Centeno, pan con harina integral', 214, 0.9, 10.4, 49, 7),
(56, 'Maiz amarillo, pisingallo, grano entero, crud', 345, 0.5, 10.9, 74.6, 7),
(57, 'Maiz amarillo, sémola, grano entero, crudo', 305, 1.1, 9, 76.4, 7),
(58, 'Maiz, amarillo Leales, grano entero, crudo', 346, 0.8, 10.6, 74.1, 7),
(59, 'Maiz, amarillo trópico 327, grano entero, cru', 344, 1.1, 9.8, 73.6, 7),
(60, 'Maiz, blanco 8 rayas, grano entero, crudo', 340, 0.9, 7.3, 77.7, 7),
(61, 'Maiz, blanco perla, grano entero, crudo', 335, 0.9, 9, 74.8, 7),
(62, 'Maiz, choclo', 97, 1.2, 3.7, 20.5, 7),
(63, 'Maiz, grano, entero (Zea mays spp)', 346, 0.9, 9.5, 74.9, 7),
(64, 'Maiz, harina amarilla (polenta), cruda', 338, 4.9, 9.1, 73.4, 7),
(65, 'Maiz, harina amarilla (polenta), cruda', 369, 3.2, 11.1, 73.9, 7),
(66, 'Maiz, harina amarilla (polenta), hervida', 68, 0.8, 3.2, 13.7, 7),
(67, 'Maiz, pan', 275, 2.9, 9.1, 53.2, 7),
(68, 'Trigo, bizcochos \"Bay Biscuit\"', 382, 10.1, 5.9, 72.5, 7),
(69, 'Trigo, bizcochos, vainillas', 401, 8.9, 10.2, 70, 7),
(70, 'Trigo, galleta de campo', 300, 1, 9.8, 63, 7),
(71, 'Trigo, galleta marinera', 361, 0.7, 12.8, 75.9, 7),
(72, 'Trigo, galletitas de agua \"Express\"', 442, 15.5, 13.5, 62, 7),
(73, 'Trigo, galletitas de agua \"Traviata\"', 437, 13.1, 12.2, 67.6, 7),
(74, 'Trigo, galletitas de harina blanca', 410, 11.6, 12.2, 0, 7),
(75, 'Trigo, galletitas de harina integral', 411, 15.8, 10.6, 0, 7),
(76, 'Trigo, galletitas dulces \"Manón\"', 417, 10.1, 8.5, 73, 7),
(77, 'Trigo, galletitas dulces \"Minue\"', 419, 13.1, 8.2, 67, 7),
(78, 'Trigo, galletitas oblea \"Opera\"', 442, 21.1, 4.9, 58, 7),
(79, 'Trigo, grano entero, crudo', 347, 2, 12.4, 69.8, 7),
(80, 'Trigo, grisines', 342, 0.2, 12.5, 72.6, 7),
(81, 'Trigo, harina cuatro ceros', 348, 2.6, 10.2, 0, 7),
(82, 'Trigo, harina integral', 308, 3, 11.4, 0, 7),
(83, 'Trigo, harina tres cero', 340, 2.7, 10.3, 0, 7),
(84, 'Trigo, pan alemán', 264, 0.2, 8.9, 56.7, 7),
(85, 'Trigo, pan criollo', 280, 0.3, 8.7, 60.7, 7),
(86, 'Trigo, pan de Viena', 307, 1.9, 9.8, 62.6, 7),
(87, 'Trigo, pan de salvado', 223, 1.6, 9.8, 0, 7),
(88, 'Trigo, pan francés', 268, 0.7, 8.4, 0, 7),
(89, 'Trigo, pan francés', 269, 0.2, 9.3, 57.4, 7),
(90, 'Trigo, pan negro con levadura agria', 271, 0.5, 8.4, 58.3, 7),
(91, 'Trigo, pan negro con levadura comprimida', 269, 2.4, 9.5, 52.4, 7),
(92, 'Trigo, pan negro sin levadura', 269, 0.6, 9.6, 56.3, 7),
(93, 'Trigo, salvado', 171, 5.5, 16.3, 0, 7),
(94, 'Trigo, sémola, cruda', 349, 0.9, 11.7, 73.4, 7),
(95, 'Trigo, sémola, hervida', 70, 0, 2.4, 15, 7),
(96, 'Trigo, tallarines, frescos, hervidos', 98, 1.5, 4.1, 16.9, 7),
(97, 'Aceituna de monte', 93, 0.4, 1.6, 19.4, 5),
(98, 'Aceituna verde, pulpa, encurtida', 144, 13.5, 1.5, 4, 5),
(99, 'A0á enlatado, contenido envase', 87, 0.1, 0.4, 21.1, 5),
(100, 'A0á, pulpa, fresco', 58, 0.2, 0.4, 13.7, 5),
(101, 'Ba0a, pulpa, fresca', 99, 0.2, 1.2, 23, 5),
(102, 'Cereza, pulpa, fresca', 68, 0.5, 1.1, 14.8, 5),
(103, 'Ciruela, pasa, cruda', 255, 0.1, 1.9, 61.6, 5),
(104, 'Ciruela, pasa, hervida', 165, 0.1, 1, 40.1, 5),
(105, 'Ciruela, pulpa, fresca', 56, 0.2, 0.7, 12.9, 5),
(106, 'Coco, pulpa, fresco, crudo', 382, 34.7, 3.4, 14, 5),
(107, 'Damasco, pulpa, fresco, crudo', 57, 0.1, 1, 12.9, 5),
(108, 'Doca', 49, 1, 1.6, 11.5, 5),
(109, 'Durazno orejón, pulpa y piel, hervido', 40, 0, 2.5, 7.5, 5),
(110, 'Durazno, pulpa, envasado al natural', 75, 0.1, 0.4, 18.2, 5),
(111, 'Durazno, pulpa, fresco, crudo', 51, 0.1, 0.5, 12, 5),
(112, 'Frutilla pulpa, fresca, cruda', 41, 0.6, 0.8, 8.1, 5),
(113, 'Granada, pulpa, fresca', 75, 0.2, 0.6, 17.7, 5),
(114, 'Guaraniná, Brumelia obtusifolia', 147, 3.2, 1.6, 23.7, 5),
(115, 'Higo, pulpa, fresca', 88, 0.4, 1.4, 19.6, 5),
(116, 'Kaki, pulpa, fresco', 87, 0.4, 0.8, 20, 5),
(117, 'Kinoto, pulpa y cáscara, fresco, crudo', 73, 0.1, 0.9, 17.1, 5),
(118, 'Limón, pulpa, fresco', 44, 0.6, 0.9, 8.7, 5),
(119, 'Manzana, hervida', 26, 0, 0.5, 6, 5),
(120, 'Manzana, pulpa, fresca, cruda', 64, 0.4, 0.3, 14.9, 5),
(121, 'Mburucuyá maduro', 84, 1.7, 4.7, 23.4, 5),
(122, 'Mburucuyá verde', 59, 1.6, 3.2, 15.7, 5),
(123, 'Melón, pulpa, fresco', 28, 0.2, 0.6, 5.9, 5),
(124, 'Membrillo, pulpa, fresco, crudo', 58, 0.1, 0.3, 13.9, 5),
(125, 'Mora, fresca', 69, 0.6, 1.2, 14.6, 5),
(126, 'Palta, pulpa, fresca', 258, 26.4, 1.7, 3.3, 5),
(127, 'Pera, orejón, crudo', 299, 0.4, 2.3, 71.6, 5),
(128, 'Pera, pulpa, fresca, cruda', 70, 0.4, 0.7, 15.8, 5),
(129, 'Pomelo, pulpa, fresco', 26, 0, 0.5, 5.9, 5),
(130, 'Sandía, pulpa, fresca, cruda', 31, 0.2, 0.5, 6.9, 5),
(131, 'Ubajay', 49, 1.6, 1.1, 8.1, 5),
(132, 'Ñandapirí', 70, 0.7, 1.7, 14.3, 5),
(133, 'Huevo de gallina, clara, cocido', 54, 0.3, 12.8, 0, 9),
(134, 'Huevo de gallina, frito', 196, 14.5, 16.3, 0, 9),
(135, 'Huevo de gallina, poché', 152, 10.9, 13.4, 0, 9),
(136, 'Leche de burra, entera, fluida', 45, 1.4, 1.9, 6.2, 4),
(137, 'Leche de cabra, entera, fluida', 78, 5.9, 3.3, 3, 4),
(138, 'Leche de oveja, entera, fluida', 99, 6.5, 5.5, 4.5, 4),
(139, 'Leche de vaca parcialm. descremada, adic. con', 44, 1.4, 3.2, 4.6, 4),
(140, 'Leche de vaca, entera, fluida, adicionada con', 57, 2.9, 3.1, 4.6, 4),
(141, 'Leche de vaca, entera, fluida, pasteurizada', 57, 2.9, 3.1, 4.6, 4),
(142, 'Leche en polvo descremada', 370, 1, 35.5, 52.2, 4),
(143, 'Leche en polvo entera', 489, 24.8, 25.8, 40.9, 4),
(144, 'Leche humana, entera, en polvo', 520, 31.5, 9.6, 49.5, 4),
(145, 'Leche humana, entera, fluida', 71, 4.2, 1.1, 7.1, 4),
(146, 'Leche, condensada, Nestlé', 328, 8.1, 8, 55.8, 4),
(147, 'Manteca, fresca', 758, 84, 0.5, 0, 4),
(148, 'Queso crema, entero, untable ', 246, 22.6, 6.6, 3.9, 4),
(149, 'Queso descremado, untable', 82, 0.3, 13.7, 6.1, 4),
(150, 'Queso semidescremado, untable', 104, 4, 11.5, 5.5, 4),
(151, 'Queso, Petit Suisse', 182, 14, 14.1, 0, 4),
(152, 'Queso  Blanco Argentino Semimagro ', 104, 4, 11.5, 5.6, 4),
(153, 'Queso Belpaese', 309, 25.3, 20.3, 0, 4),
(154, 'Queso Camembert', 287, 23, 20.1, 0, 4),
(155, 'Queso Limburgués', 324, 26.3, 21.8, 0, 4),
(156, 'Queso Por Salut', 301, 22.7, 20.4, 3.7, 4),
(157, 'Queso cremoso', 302, 22.9, 19.7, 4.2, 4),
(158, 'Queso cuartirolo', 291, 21.4, 20.8, 3.9, 4),
(159, 'Queso doble crema', 260, 20.9, 18, 0, 4),
(160, 'Queso mozarella', 282, 19.3, 23.6, 3.3, 4),
(161, 'Queso Cheddar', 357, 26.5, 29.5, 0, 4),
(162, 'Queso Chubut', 328, 24.9, 25.9, 0, 4),
(163, 'Queso Fontina', 340, 33.6, 24.3, 0, 4),
(164, 'Queso Gorgonzola', 480, 43.7, 21.6, 0, 4),
(165, 'Queso Gruyere', 379, 29.4, 28.6, 0, 4),
(166, 'Queso Holanda', 345, 27.2, 25.1, 0, 4),
(167, 'Queso Pategrás', 410, 34.5, 24.8, 0, 4),
(168, 'Queso Roquefort', 426, 38.8, 19.2, 0, 4),
(169, 'Queso Suizo', 404, 31.3, 28.6, 1.9, 4),
(170, 'Queso Tafí', 358, 30.1, 21.8, 0, 4),
(171, 'Queso Tandil', 345, 27, 25.5, 0, 4),
(172, 'Queso azul', 377, 31.1, 20, 4.3, 4),
(173, 'Queso tipo Mar del Plata  ', 332, 25.6, 25.4, 0, 4),
(174, 'Queso Goya', 402, 31.5, 29.7, 0, 4),
(175, 'Queso Parmesano', 350, 24.4, 32.7, 0, 4),
(176, 'Queso Provolone', 391, 29.2, 32.1, 0, 4),
(177, 'Queso Reggianito', 365, 24.2, 33.4, 3.4, 4),
(178, 'Queso Sardo', 402, 29.1, 30, 5, 4),
(179, 'Queso Sbrinz', 357, 26.6, 29.4, 0, 4),
(180, 'Ricota de leche entera', 168, 11.8, 11.6, 4, 4),
(181, 'Ricotta semidescremada', 168, 11.7, 11.6, 4, 4),
(182, 'Yogur descremado', 59, 0.2, 4.3, 5.9, 4),
(183, 'Yogur descremado bebible', 30, 0.1, 3.3, 4.1, 4),
(184, 'Yogur descremado fortificado con Ca', 48, 0.1, 4.6, 7.1, 4),
(185, 'Yogur entero bebible', 82, 2.2, 2.8, 12.7, 4),
(186, 'Yogur entero natural', 66, 3, 4.6, 5.3, 4),
(187, 'Yogur entero saborizado', 88, 2.4, 4.4, 12.4, 4),
(188, 'Abadejo, fresco, crudo, carne', 72, 0.9, 15.8, 0.2, 2),
(189, 'Amarillo, fresco, a la parrilla, músculo dors', 183, 10.9, 21.3, 0, 2),
(190, 'Amarillo, fresco, al horno, músculo dorsal', 233, 17, 19.9, 0, 2),
(191, 'Amarillo, fresco, crudo, músculo dorsal', 141, 8, 17.3, 0, 2),
(192, 'Amarillo, fresco, frito, músculo dorsal', 232, 15.6, 22.8, 0, 2),
(193, 'Amarillo, fresco, hervido, músculo dorsal', 180, 11.7, 18.7, 0, 2),
(194, 'Anchoa, fresca, cruda, carne', 92, 0.4, 21.5, 0.5, 2),
(195, 'Anchoita, fresca, cruda, carne', 129, 5.4, 19.2, 0.8, 2),
(196, 'Armado, fresco, al horno, músculo dorsal', 128, 3.7, 23.7, 0, 2),
(197, 'Armado, fresco, crudo, músculo dorsal', 75, 1.5, 15.4, 0, 2),
(198, 'Armado, fresco, crudo, músculo ventral', 103, 4.9, 14.6, 0, 2),
(199, 'Armado, fresco, frito, músculo dorsal', 130, 4.9, 21.4, 0, 2),
(200, 'Armado, fresco, hervido, músculo dorsal', 102, 2.1, 20.8, 0, 2),
(201, 'Besugo, fresco, crudo, carne', 100, 2, 20.4, 0, 2),
(202, 'Boga, fresca, a la parrilla, músculo dorsal', 150, 6.1, 23.7, 0, 2),
(203, 'Boga, fresca, al horno, músculo dorsal', 150, 5.5, 25.1, 0, 2),
(204, 'Boga, fresca, cruda, músculo ventral', 180, 11.8, 18.5, 0, 2),
(205, 'Boga, fresca, frita, músculo dorsal', 168, 7.9, 24.3, 0, 2),
(206, 'Boga, fresca, hervida, músculo dorsal', 158, 7.5, 22.7, 0, 2),
(207, 'Bonito, fresco, crudo, carne', 219, 14.5, 22, 0, 2),
(208, 'Brótola, fresca, cruda, carne', 83, 1.2, 17.6, 0.4, 2),
(209, 'Caballa, fresca, cruda, carne', 232, 15.8, 22, 0.4, 2),
(210, 'Castañeta, fresca, cruda, carne', 95, 2.3, 18.4, 0.3, 2),
(211, 'Castañeta, fresca, cruda, entera', 170, 11.1, 17, 0.5, 2),
(212, 'Congrio, fresco, crudo, carne', 107, 4, 17.2, 0.7, 2),
(213, 'Cornalito, fresco, crudo, entero', 86, 2.2, 16, 0.6, 2),
(214, 'Corvina blanca, fresca, cruda, carne', 97, 1.9, 19.5, 0.4, 2),
(215, 'Corvina negra, fresca, cruda, carne', 84, 0.8, 18.8, 0.4, 2),
(216, 'Dorado, fresco, crudo, carne', 80, 0.5, 18.8, 0.1, 2),
(217, 'Gatuso, fresco, crudo, carne', 72, 0.2, 17.4, 0.1, 2),
(218, 'Jurel, fresco, crudo, carne', 149, 8, 19, 0.2, 2),
(219, 'Lenguado, fresco, crudo, carne', 78, 0.8, 17.5, 0.2, 2),
(220, 'Lisa, fresca, cruda, carne', 146, 7.8, 17.9, 1.1, 2),
(221, 'Merluza, fresca, cruda, carne', 81, 1.3, 17.1, 0.1, 2),
(222, 'Mero, fresco, crudo, carne', 83, 1, 17.9, 0.5, 2),
(223, 'Moncholo, fresco, al horno, músculo dorsal', 189, 11.3, 22, 0, 2),
(224, 'Moncholo, fresco, crudo, músculo dorsal', 112, 4.7, 17.5, 0, 2),
(225, 'Moncholo, fresco, crudo, músculo ventral', 148, 9.1, 16.7, 0, 2),
(226, 'Moncholo, fresco, hervido, músculo dorsal', 187, 13.3, 16.7, 0, 2),
(227, 'Palometa, fresca, cruda, carne', 215, 14.8, 20.1, 0.4, 2),
(228, 'Pargo, fresco, crudo, carne', 113, 3.9, 19.1, 0.3, 2),
(229, 'Patí, fresco, a la parrilla, músculo dorsal', 169, 8.8, 22.6, 0, 2),
(230, 'Patí, fresco, al horno, músculo dorsal', 183, 11.2, 20.6, 0, 2),
(231, 'Patí, fresco, crudo, carne', 90, 1.8, 18.2, 0.3, 2),
(232, 'Patí, fresco, crudo, músculo dorsal', 161, 10.8, 15.9, 0, 2),
(233, 'Patí, fresco, crudo, músculo ventral', 159, 10.9, 15.2, 0, 2),
(234, 'Patí, fresco, frito, músculo dorsal', 215, 13.6, 23, 0, 2),
(235, 'Patí, fresco, hervido, músculo dorsal', 133, 6.1, 19.6, 0, 2),
(236, 'Pejerrey agua dulce, fresco, crudo, carne', 77, 0.4, 18.3, 0, 2),
(237, 'Pejerrey mar, fresco, crudo, carne', 86, 1.2, 18.6, 0.2, 2),
(238, 'Pescadilla, fresca, crudo, carne', 97, 2.8, 17.8, 0.2, 2),
(239, 'Pez Gallo, fresco, crudo, carne', 84, 0.4, 20.2, 0, 2),
(240, 'Pez palo, fresco, crudo, carne', 96, 1.7, 20.1, 0, 2),
(241, 'Rubio, fresco, crudo, carne', 109, 4.5, 17.1, 0, 2),
(242, 'Sardina fueguina, fresca, cruda, carne', 136, 8.9, 14, 0, 2),
(243, 'Surubí, fresco, al horno, músculo dorsal', 255, 17.9, 23.5, 0, 2),
(244, 'Surubí, fresco, crudo, carne', 110, 4, 18.2, 0.2, 2),
(245, 'Surubí, fresco, crudo, músculo dorsal', 187, 13, 17.6, 0, 2),
(246, 'Surubí, fresco, frito, músculo dorsal', 269, 18, 26.7, 0, 2),
(247, 'Surubí, fresco, hervido, músculo dorsal', 186, 10.3, 23.4, 0, 2),
(248, 'Sábalo, fresco, a la parrilla, músculo dorsal', 130, 4, 23.4, 0, 2),
(249, 'Sábalo, fresco, al horno, músculo dorsal', 153, 5.8, 25.1, 0, 2),
(250, 'Sábalo, fresco, crudo, músculo dorsal', 145, 8.1, 18, 0, 2),
(251, 'Sábalo, fresco, crudo, músculo ventral', 151, 9, 17.5, 0, 2),
(252, 'Sábalo, fresco, frito, músculo dorsal', 166, 7.4, 24.9, 0, 2),
(253, 'Sábalo, fresco, hervido, músculo dorsal', 130, 5.3, 20.5, 0, 2),
(254, 'Tararira, fresca, cruda, carne', 79, 0.6, 18.1, 0.4, 2),
(255, 'Testolin, fresco, crudo, carne', 98, 2.4, 18.9, 0.2, 2),
(256, 'Calamar, fresco, crudo (tubo aletas y tentácu', 79, 0.6, 18.4, 0, 2),
(257, 'Calamar, fresco, entero, crudo', 80, 0.7, 18.5, 0, 2),
(258, 'Camarón, fresco, crudo, carne de cola', 91, 0.8, 21, 0, 2),
(259, 'Centolla, fresca (carne de pata solamente)', 83, 0.8, 18.8, 0, 2),
(260, 'Centolla, fresca, carne, cruda', 66, 1.1, 13.9, 0, 2),
(261, 'Langostino, fresco, crudo, carne de cola', 97, 0.9, 22, 0.2, 2),
(262, 'Mejillón, fresco, crudo (capturado en primave', 95, 1.6, 17.6, 2.5, 2),
(263, 'Mejillón, fresco, crudo, carne', 64, 1.1, 11.9, 1.7, 2),
(264, 'Mejillón, fresco, pre-cocido, carne', 84, 0, 21.1, 0, 2),
(265, 'Ancho, pasta', 202, 11.6, 20.2, 4.3, 2),
(266, 'Caballa, tronco', 212, 11.8, 26.5, 0, 2),
(267, 'Acelga, hoja', 15, 0.2, 2.9, 0, 1),
(268, 'Acelga, tallo', 8, 0.1, 1.2, 0, 1),
(269, 'Achicoria de Monte', 46, 1.2, 2.8, 7.7, 1),
(270, 'Achicoria, hoja, fresca, cruda', 21, 0.3, 1.6, 2.9, 1),
(271, 'Achira (raíces)', 34, 0.2, 1.7, 7.9, 1),
(272, 'Ajo, bulbo, fresco, crudo', 99, 0.2, 4.4, 20, 1),
(273, 'Alcaucil, inflorescencia, fresco, crudo', 63, 0.4, 2.9, 11.9, 1),
(274, 'Alfalfa, hoja, fresca, cruda', 57, 0.4, 6.6, 6.8, 1),
(275, 'Arveja, semilla, fresca, cruda', 102, 0, 8.9, 16.6, 1),
(276, 'Arveja, semilla, fresca, enlatada', 105, 0.8, 6, 0, 1),
(277, 'Arveja, semilla, fresca, hervida', 77, 0, 5.8, 13.4, 1),
(278, 'Arveja, semilla, seca, entera, cruda ', 304, 2.9, 22.5, 0, 1),
(279, 'Arveja, semilla, seca, partida, cruda', 311, 2.9, 22, 0, 1),
(280, 'Arveja, semilla, seca, partida, hervida', 129, 0.7, 8.2, 22.5, 1),
(281, 'Avellana, pepita, seca', 668, 60.9, 12.7, 17.7, 1),
(282, 'Batata, frita', 212, 7.2, 1.7, 35, 1),
(283, 'Batata, hervida', 92, 0, 1.2, 21.7, 1),
(284, 'Batata, raiz, fresca, cruda', 84, 0, 1.1, 19.8, 1),
(285, 'Berenjena, pulpa, fresca, cruda', 28, 0.2, 1.1, 5.5, 1),
(286, 'Berro (hojas y tallo), fresco, crudo', 23, 0.3, 1.7, 3.3, 1),
(287, 'Brócoli, tallo de hoja, fresco, crudo', 37, 0.2, 3.3, 5.5, 1),
(288, 'Cardo (penca y hojas), fresco, crudo', 25, 0.2, 1.4, 4.4, 1),
(289, 'Castaña de Pará, pepita, cruda', 731, 72.1, 18.1, 2.4, 1),
(290, 'Cebolla blanca, bulbo, cruda', 17, 0, 0.8, 3.5, 1),
(291, 'Cebolla blanca, bulbo, hervida', 10, 0, 0.6, 1.8, 1),
(292, 'Chaucha, vaina y semilla, cruda', 22, 0, 2.4, 3.2, 1),
(293, 'Coliflor, pimpollo, fresco, crudo', 31, 0.2, 2.4, 4.9, 1),
(294, 'Diente de león, hoja', 33, 0.4, 2.6, 6.6, 1),
(295, 'Escarola crespa, hoja, cruda', 24, 0.2, 1.6, 4, 1),
(296, 'Esparrago, tallo tierno, fresco, crudo', 26, 0.2, 2.2, 3.9, 1),
(297, 'Espinaca, hoja, fresca, cruda', 24, 0, 3.9, 2, 1),
(298, 'Espinaca, hoja, fresca, hervida', 13, 0, 2.5, 0.7, 1),
(299, 'Garbanzo, grano entero, seco, hervido', 125, 2.2, 6.1, 20.2, 1),
(300, 'Habas, semilla inmadura, fresca, cruda', 99, 0.8, 6.7, 16.3, 1),
(301, 'Hinojo, tallo, fresco, crudo', 24, 0.2, 1.9, 3.6, 1),
(302, 'Lengua de vaca, hojas, tejido fresco, parte c', 43, 0.8, 3.1, 7.6, 1),
(303, 'Lenteja, semilla entera, seca, cruda', 350, 0.8, 20.8, 64.8, 1),
(304, 'Lupino andino, con cáscara, semilla, crudo', 399, 10, 37.8, 39.5, 1),
(305, 'Lupino andino, sin cáscara, semilla, crudo', 411, 11.6, 38.4, 38.3, 1),
(306, 'Maní, semilla con piel, crudo', 576, 44.3, 33.2, 11.1, 1),
(307, 'Maní, semilla sin piel, tostado', 592, 45.5, 34.8, 10.8, 1),
(308, 'Mastuerzo (hoja y pecíolo), fresco, crudo', 51, 1.4, 4.2, 5.3, 1),
(309, 'Mastuerzo, hoja', 50, 1.4, 3.7, 8.1, 1),
(310, 'Nabo, hervido', 11, 0, 0.8, 1.9, 1),
(311, 'Nabo, raiz (pulpa), fresco, crudo', 10, 0, 1, 1.5, 1),
(312, 'Nuez, pepita', 715, 67.4, 13.9, 13.2, 1),
(313, 'Papa, pulpa sin cáscara, fresca, cruda', 88, 0, 2.7, 19.3, 1),
(314, 'Papa, pulpa sin cáscara, frita, bastón', 162, 6.2, 2.9, 23.6, 1),
(315, 'Papa, pulpa sin cáscara, hervida ', 88, 0, 2.4, 19.6, 1),
(316, 'Pepino, pulpa, fresco, crudo', 15, 0.1, 0.7, 2.7, 1),
(317, 'Perejil, hoja, fresco, crudo', 60, 1, 3.7, 9, 1),
(318, 'Pistacho, pepita, crudo', 648, 54, 22.3, 18.1, 1),
(319, 'Piñon de araucaria, pepita, crudo', 221, 1.2, 14.6, 37.9, 1),
(320, 'Poroto Alubia, semilla, seco', 337, 0.8, 19.8, 62.8, 1),
(321, 'Poroto Carioca, semilla, seco', 336, 0.9, 20, 62, 1),
(322, 'Poroto Colorado, semilla, seco', 333, 1.2, 19.6, 61, 1),
(323, 'Poroto Grand Berry, semilla, seco', 336, 1, 21.5, 60.4, 1),
(324, 'Poroto Great Northern, semilla, seco', 326, 0.5, 21, 60.6, 1),
(325, 'Poroto Negro, semilla, seco', 306, 1, 20.6, 61.5, 1),
(326, 'Poroto Novy Bean, semilla, seco', 336, 1.1, 26, 55.6, 1),
(327, 'Poroto Oval, semilla, seco', 328, 1.1, 18.2, 63.7, 1),
(328, 'Poroto Pallares, semilla, seco', 322, 0.6, 16.6, 63.3, 1),
(329, 'Poroto Small Red, semilla, seco', 336, 0.8, 25.3, 56.7, 1),
(330, 'Poroto, semilla, enlatado', 89, 0.9, 8.4, 0, 1),
(331, 'Poroto, semilla, seco, crudo', 290, 2.8, 23.9, 0, 1),
(332, 'Puerro (bulbo, tallo y hojas), fresco, crudo', 45, 0.4, 2.5, 7.9, 1),
(333, 'Quinua, harina', 341, 1, 4.4, 78.7, 1),
(334, 'Quinua, semilla, cruda', 354, 5.1, 13.8, 63.3, 1),
(335, 'Rabanito, raiz, fresco, crudo', 29, 0.1, 1.3, 5.8, 1),
(336, 'Remolacha, tubérculo, fresca, cruda', 54, 0, 2.4, 11.1, 1),
(337, 'Remolacha, tubérculo, hervida', 36, 0, 1, 7.9, 1),
(338, 'Repollito Bruselas, hoja, fresco, crudo ', 58, 0.5, 4.4, 8.9, 1),
(339, 'Repollo blanco, hoja, fresco, crudo', 17, 0, 2.4, 1.9, 1),
(340, 'Repollo blanco, hoja, hervido', 16, 0, 2.2, 1.8, 1),
(341, 'Salsifí, raiz, fresco, crudo', 85, 1, 3.5, 15.5, 1),
(342, 'Soja FT11, poroto seco', 368, 6.8, 36.9, 39.8, 1),
(343, 'Soja, semilla madura, seca, cruda', 356, 24.2, 34.6, 0, 1),
(344, 'Tapioca, cruda (harina mandioca)', 336, 0, 2, 82, 1),
(345, 'Tapioca, hervida', 55, 0, 0.1, 13.7, 1),
(346, 'Tomate, fresco, crudo', 20, 0, 1, 4.1, 1),
(347, 'Tomate, hervido', 21, 0, 1, 4.2, 1),
(348, 'Tomate, jugo, fresco', 11, 0, 1, 1.7, 1),
(349, 'Verdolaga, hoja', 32, 0.5, 2.4, 5.7, 1),
(350, 'Verdolaga, hoja y tallo, fresca, cruda', 23, 0.4, 1.6, 3.3, 1),
(351, 'Yuyo colorado, hoja', 60, 0.7, 4.1, 11.1, 1),
(352, 'Zanahoria, jugo, fresco', 22, 0, 1, 4.4, 1),
(353, 'Zapallito, parte tierna, fresco, crudo', 13, 0, 0.8, 2.4, 1),
(354, 'Zapallito, parte tierna, hervido ', 16, 0, 1.3, 2.8, 1),
(355, 'Zapallo, pulpa, fresco, crudo', 27, 0.2, 0.5, 5.8, 1),
(356, 'Zapallo, pulpa, hervido', 20, 0, 0.4, 4.6, 1);

--
-- Volcado de datos para la tabla `nutricionista`
--

INSERT INTO `nutricionista` (`dni`, `nombre`, `apellido`, `password`, `telefono`, `email`) VALUES
('22222221', 'Laura', 'Merlo', 'laura', '341 3142424', 'laura@gmail.com'),
('22222222', 'Martina', 'Moron', 'martina', '341 4134243', 'martina@gmail.com'),
('22222223', 'Juan', 'Mendez', 'juan', '341 5543445', 'juan@gmail.com'),
('22222224', 'Paola', 'Martinez', 'paola', '341 5543445', 'paola@gmail.com');

INSERT INTO `localidad` (`cod_postal`, `denominacion`) VALUES
(1200, 'Juarez'),
(1500, 'Buenos Aires'),
(2000, 'Rosario'),
(2113, 'Peyrano');


--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`dni`, `cod_postal`, `calle`, `altura`, `piso`, `depto`) VALUES
('22222221', 2000, 'Zeballos', 1300, NULL, NULL),
('22222222', 2113, 'Av. San Martin', 200, NULL, NULL),
('22222223', 2000, 'Corrientes', 2213, NULL, NULL),
('22222224', 2000, 'Dorrego', 3950, NULL, NULL);

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`id_ejercicio`, `nombre`, `gasto_energetico`) VALUES
(7, 'CORRER', 1000),
(8, 'NADO', 1300),
(9, 'CAMINATA', 500),
(10, 'PESAS', 600),
(11, 'CICLISMO', 400),
(12, 'TENIS', 1000);

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`dni`, `dia`, `hora_desde`, `hora_hasta`) VALUES
('22222221', 'Lunes', '19:57:00', '20:57:00'),
('22222222', 'lunes', '08:00:00', '08:30:00'),
('22222222', 'lunes', '09:00:00', '09:30:00'),
('22222222', 'lunes', '09:30:00', '10:00:00'),
('22222222', 'lunes', '10:00:00', '10:30:00'),
('22222222', 'martes', '08:00:00', '08:30:00'),
('22222222', 'martes', '09:00:00', '09:30:00'),
('22222222', 'martes', '17:00:00', '17:30:00'),
('22222222', 'miercoles', '08:00:00', '08:30:00'),
('22222222', 'miercoles', '09:00:00', '09:30:00'),
('22222222', 'miercoles', '09:30:00', '10:00:00'),
('22222222', 'miercoles', '10:00:00', '10:30:00'),
('22222223', 'martes', '09:00:00', '09:30:00'),
('22222223', 'miercoles', '08:00:00', '08:30:00'),
('22222223', 'miercoles', '09:00:00', '09:30:00'),
('22222223', 'miercoles', '09:30:00', '10:00:00'),
('22222223', 'miercoles', '10:00:00', '10:30:00'),
('22222223', 'viernes', '08:00:00', '08:30:00'),
('22222223', 'viernes', '09:30:00', '10:00:00'),
('22222223', 'viernes', '10:00:00', '10:30:00');

-- --------------------------------------------------------



--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`dni`, `nombre`, `apellido`, `email`, `password`, `telefono`, `genero`, `fecha_nacimiento`, `altura`, `peso`, `imc`, `metabolismo_basal`, `peso_objetivo`, `objetivo`) VALUES
('11111111', 'Agustin', 'Montino', 'agustin@gmail.com', 'agustin', '12313123', 'Masculino', '2000-02-24', 177, 50, 20, 2000, 60, 'subir peso'),
('11111112', 'Camilo', 'Perez', 'rodrigo@gmail.com', 'camilo', '7657567567', 'Masculino', '2005-02-24', 150, 60, 15, 1800, 55, 'bajar peso'),
('11111113', 'Martin', 'Moreno', 'martin@gmail.com', 'martin', '556456', 'Masculino', '2005-01-30', 165, 57, 12, 2150, 70, 'aumentar masa muscular'),
('11111114', 'Lucas', 'Laganar', 'llaganar@gmail.com', 'llaganar', '7657567567', 'Masculino', '1990-05-15', 175, 100, 20, 1850, 75, 'bajar peso'),
('11111115', 'Carlos', 'Pinera', 'cpinera@gmail.com', 'carlos', '7123567567', 'Masculino', '1994-10-10', 180, 95, 14, 1700, 85, 'bajar peso'),
('11111116', 'Ignacio', 'Perra', 'iperra@gmail.com', 'ignacio', '7657561478', 'Masculino', '1996-01-20', 198, 85, 16, 1700, 80, 'aumentar masa muscular'),
('11111117', 'Daniela', 'Meyano', 'dmeyano@gmail.com', 'daniela', '9657567567', 'Femenino', '1998-07-21', 152, 55, 15, 1600, 60, 'subir peso'),
('11111118', 'Maite', 'Aguilar', 'maguilar@gmail.com', 'maite', '7657545647', 'Femenino', '1997-08-07', 151, 72, 14, 1680, 55, 'bajar peso'),
('11111119', 'Franco', 'Sillo', 'fsillo@gmail.com', 'franco', '7534567567', 'Masculino', '1993-05-11', 182, 89, 15, 1800, 80, 'bajar colesterol'),
('11111120', 'Gimena', 'Morro', 'gmorro@gmail.com', 'gimena', '7159867567', 'Femenino', '1995-10-08', 149, 55, 18, 1900, 57, 'tonificar figura'),
('11111121', 'Sergio', 'Oliveti', 'soliveti@gmail.com', 'sergio', '3654567567', 'Masculino', '1993-04-23', 179, 85, 20, 1950, 75, 'prevenir diabetes'),
('11111122', 'Leandrina', 'Gonzalez', 'lgonzalez@gmail.com', 'leandrina', '1937567567', 'Femenino', '1990-03-04', 172, 105, 20, 1700, 80, 'prevenir enfermedades cardiovasculares'),
('11111123', 'Giuliana', 'Pelaez', 'gpelaez@gmail.com', 'giuliana', '1894567567', 'Femenino', '1980-02-15', 145, 65, 15, 1800, 60, 'prevenir cancer'),
('11111124', 'Gabriela', 'Campanu', 'gcampanu@gmail.com', 'gabriela', '7685557567', 'Femenino', '1985-05-29', 173, 80, 20, 1600, 70, 'bajar colesterol'),
('11111125', 'Agustina', 'Bogado', 'abogado@gmail.com', 'agustina', '1237567567', 'Femenino', '2000-01-24', 150, 45, 10, 1850, 60, 'subir peso'),
('11111126', 'Facundo', 'Toretto', 'ftoretto@gmail.com', 'facundo', '7616547567', 'Masculino', '2003-09-23', 140, 50, 20, 1900, 60, 'subir peso'),
('11111127', 'Ramiro', 'Sarmiento', 'rsarmiento@gmail.com', 'ramiro', '6565567567', 'Masculino', '2010-05-09', 140, 90, 10, 1600, 60, 'bajar peso'),
('11111128', 'Lautaro', 'Dibaggio', 'ldibaggio@gmail.com', 'lautaro', '6588567567', 'Masculino', '2001-12-31', 180, 90, 20, 1900, 85, 'prevenir enfermedades cardiovasculares'),
('11111129', 'Soledad', 'Iucula', 'siucula@gmail.com', 'soledad', '6565596367', 'Femenino', '2000-05-20', 150, 80, 15, 1900, 60, 'bajar peso'),
('11111130', 'Joaquin', 'Draculini', 'jdraculini@gmail.com', 'joaquin', '6565596367', 'Masculino', '2015-03-06', 100, 60, 20, 1800, 50, 'prevenir diabetes'),
('11123123', 'Agustin', 'Dangelo', 'agustindsecundario@gmail.com', 'agustin', '3460123', 'Femenino', '2000-02-24', NULL, 50, 0, 0, 60, NULL);


--
-- Volcado de datos para la tabla `nutricionista_paciente`
--


--
-- Volcado de datos para la tabla `consumo_paciente`
--

INSERT INTO `consumo_paciente` (`dni`, `id_alimento`, `fecha`, `tipo`, `cantidad`) VALUES
('11111111', 12, '2020-11-23', 'cena', 300),
('11111111', 12, '2020-11-24', 'cena', 300),
('11111111', 20, '2020-11-23', 'cena', 300),
('11111111', 20, '2020-11-24', 'cena', 300),
('11111111', 25, '2020-11-23', 'cena', 500),
('11111111', 25, '2020-11-24', 'cena', 500),
('11111111', 30, '2020-11-20', 'cena', 300),
('11111111', 30, '2020-11-23', 'cena', 200),
('11111111', 30, '2020-11-24', 'cena', 200),
('11111112', 4, '2020-09-12', 'cena', 2),
('11111112', 4, '2020-09-12', 'almuerzo', 50),
('11111113', 4, '2020-09-12', 'almuerzo', 5),
('11111113', 4, '2020-09-12', 'otro', 5);

INSERT INTO `nutricionista_paciente` (`dni_nutricionista`, `dni_paciente`, `fecha`) VALUES
('22222221', '11111115', '2020-07-16'),
('22222221', '11111114', '2020-08-15'),
('22222221', '11111116', '2020-08-17'),
('22222221', '11111117', '2020-09-18'),
('22222222', '11111113', '2020-10-18'),
('22222221', '11123123', '2020-11-23'),
('22222221', '11111111', '2020-12-02');

--
-- Volcado de datos para la tabla `paciente_ejercicio`
--

INSERT INTO `paciente_ejercicio` (`dni_paciente`, `id_ejercicio`, `fecha`, `duracion`, `intensidad`) VALUES
('11111111', 7, '2020-09-12', 50, 'alta'),
('11111111', 8, '2020-09-12', 10, 'baja'),
('11111111', 9, '2020-09-12', 30, 'moderada'),
('11111112', 7, '2020-09-12', 30, 'moderada'),
('11111112', 8, '2020-09-12', 10, 'baja'),
('11111112', 9, '2020-09-12', 10, 'baja'),
('11111113', 7, '2020-09-12', 30, 'moderada'),
('11111113', 8, '2020-09-12', 50, 'alta'),
('11111113', 9, '2020-09-12', 10, 'baja');

--
-- Volcado de datos para la tabla `plan`
--

INSERT INTO `plan` (`id_plan`, `fecha_desde`, `dni_paciente`, `dni_nutricionista`, `kcal_diarias`, `proteinas_diarias`, `carbohidratos_diarios`, `grasas_diarias`) VALUES
(5, '2020-06-19', '11111112', '22222222', 0, 0, 0, 0),
(6, '2020-08-02', '11111113', '22222223', 0, 0, 0, 0),
(7, '2020-11-20', '11111111', '22222221', 1000, 300, 500, 400),
(8, '2020-11-20', '11111112', '22222222', 20, 50, 50, 20);

--
-- Volcado de datos para la tabla `solicitud`
--

INSERT INTO `solicitud` (`dni_paciente`, `dni_nutricionista`, `estado`) VALUES
('11111111', '22222221', 'confirmada'),
('11111111', '22222222', 'rechazada'),
('11111112', '22222222', 'rechazada'),
('11111113', '22222222', 'confirmada'),
('11111114', '22222221', 'confirmada'),
('11111115', '22222221', 'confirmada'),
('11111116', '22222221', 'confirmada'),
('11111117', '22222221', 'confirmada'),
('11111118', '22222221', 'pendiente'),
('11111119', '22222222', 'pendiente'),
('11111120', '22222221', 'rechazada'),
('11111121', '22222221', 'pendiente'),
('11123123', '22222221', 'confirmada');




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
