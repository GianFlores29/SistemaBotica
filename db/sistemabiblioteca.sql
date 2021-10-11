-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-12-2019 a las 19:39:51
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistemabiblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `idautor` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`idautor`, `nombre`, `descripcion`, `imagen`, `condicion`) VALUES
(1, 'Paúl Kennedy', '', '', 1),
(2, 'Luis Joyanes Aguilar', '', '', 1),
(3, 'Montejo Raez Arturo', '', '', 1),
(4, 'María Pilar García', '', '', 1),
(5, 'Marialcira Quintero', '', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `editorial`
--

CREATE TABLE `editorial` (
  `ideditorial` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `editorial`
--

INSERT INTO `editorial` (`ideditorial`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Anaya Multimedia', '', 1),
(2, 'IT', '', 1),
(3, 'La casa del programador', '', 1),
(4, 'Organización Panamericana de la Salud', '', 1),
(5, 'Organización Panamericana de la Salud Mundial', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `idestudiante` int(11) NOT NULL,
  `codigo` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`idestudiante`, `codigo`,  `nombre`, `direccion`, `telefono`, `email`, `condicion`) VALUES
(1, '12345671',  'José Luis Montalvo Sandoval', 'Av. Saenz Peña - Lambayeque - Chiclayo', '922222222', '', 1),
(2, '12345672',  'Yassira Castillo', 'Av. Chiclayo 123 -  Chiclayo', '9711111111', '', 1),
(3, '12345673',  'Luis Alberto Lucero Chucas',  'Av. 09 De Octubre - Chiclayo', '927777778', '', 1),
(4, '12345674',  'Yeison Diaz Gómez',  'Oyotùn', '928888889', '', 1),
(5, '12345675',  'Cesy Arcila Diaz',  'Chiclayo', '961245895', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `idlibro` int(11) NOT NULL,
  `titulo` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  `ideditorial` int(11) NOT NULL,
  `year_edicion` date COLLATE utf8_spanish2_ci NOT NULL,
  `idmateria` int(11) NOT NULL,
  `numero_paginas` double NOT NULL,
  `formato` double COLLATE utf8_spanish2_ci NOT NULL,
  `peso` varchar(450) DEFAULT NULL,
  `descripcion` varchar(800) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imagen` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`idlibro`, `titulo`, `cantidad_disponible`, `ideditorial`, `year_edicion`, `idmateria`, `numero_paginas`, `formato`, `peso`, `descripcion`, `imagen`) VALUES
(1, 'Paracetamol', 0, 1, '2022/09/17', 1, 6.50, '8.30', '', '', '1577216903.PNG'),
(2, 'Dolocordalan', 10, 2, '2022/08/17', 3, 4.30, '7.20', '', '', '1577325959.jpeg'),
(3, 'Apronax', 10, 3, '2022/05/17', 4, 2.50, '6.20', '', '', '1577326347.jpeg'),
(4, 'Antalgina', 1, 1, '2022/03/17', 6, 2.00, '5.20', 'tableta', '', '1577325941.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materia`
--

CREATE TABLE `materia` (
  `idmateria` int(11) NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(500) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `condicion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `materia`
--

INSERT INTO `materia` (`idmateria`, `nombre`, `descripcion`, `condicion`) VALUES
(1, 'Introducción a la Ingeniería de Sistemas', '', 1),
(2, 'Fundamentos de la programación', '', 1),
(3, 'Lenguaje de la programación', '', 1),
(4, 'Matemática', '', 1),
(5, 'Programación', '', 1),
(6, 'Salud', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `idprestamo` int(11) NOT NULL,
  `idlibro` int(11) NOT NULL,
  `idestudiante` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `cantidad` int(11) NOT NULL,
  `observacion` double COLLATE utf8_spanish2_ci NOT NULL,
  `condicion` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`idprestamo`, `idlibro`, `idestudiante`, `fecha_prestamo`,  `cantidad`, `observacion`, `condicion`) VALUES
(1, 2, 1, '2019-12-31', 1, 25.00, 'Devuelto'),
(2, 4, 2, '2019-12-31', 2, 30.00, 'Prestado');

--
-- Disparadores `prestamo`
--
DELIMITER $$
CREATE TRIGGER `tr_pr_devuelto` AFTER UPDATE ON `prestamo` FOR EACH ROW BEGIN
UPDATE libro SET cantidad_disponible = cantidad_disponible + NEW.cantidad
WHERE libro.idlibro = NEW.idlibro;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_pr_prestado` AFTER INSERT ON `prestamo` FOR EACH ROW BEGIN
UPDATE libro SET cantidad_disponible = cantidad_disponible - NEW.cantidad
WHERE libro.idlibro = NEW.idlibro;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `numero_trabajador` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `dni` varchar(8) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `profesion` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cargo` varchar(30) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `direccion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `login` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `clave` varchar(20) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `numero_trabajador`, `dni`, `nombre`, `profesion`, `cargo`, `direccion`, `telefono`, `email`, `login`, `clave`) VALUES
(1, '123562', '78945612', 'Liliana Arcila', NULL, 'Administrador', 'Chiclayo', '921803285', NULL, 'admin', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`idautor`);

--
-- Indices de la tabla `editorial`
--
ALTER TABLE `editorial`
  ADD PRIMARY KEY (`ideditorial`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`idestudiante`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`idlibro`),
  ADD KEY `ideditorial` (`ideditorial`),
  ADD KEY `idmateria` (`idmateria`);

--
-- Indices de la tabla `materia`
--
ALTER TABLE `materia`
  ADD PRIMARY KEY (`idmateria`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`idprestamo`),
  ADD KEY `idlibro` (`idlibro`),
  ADD KEY `idestudiante` (`idestudiante`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `idautor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `editorial`
--
ALTER TABLE `editorial`
  MODIFY `ideditorial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `idestudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `idlibro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `materia`
--
ALTER TABLE `materia`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `idprestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `fk_libro_editorial` FOREIGN KEY (`ideditorial`) REFERENCES `editorial` (`ideditorial`),
  ADD CONSTRAINT `fk_libro_materia` FOREIGN KEY (`idmateria`) REFERENCES `materia` (`idmateria`);

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_prestamo_estudiante` FOREIGN KEY (`idestudiante`) REFERENCES `estudiante` (`idestudiante`),
  ADD CONSTRAINT `fk_prestamo_libro` FOREIGN KEY (`idlibro`) REFERENCES `libro` (`idlibro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
