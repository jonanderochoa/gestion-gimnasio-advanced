-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-03-2017 a las 13:30:31
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `gestiongimnasio`
--
DROP DATABASE `gestiongimnasio`;
CREATE DATABASE IF NOT EXISTS `gestiongimnasio` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `gestiongimnasio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
CREATE TABLE IF NOT EXISTS `ejercicio` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `maquina` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descripcion` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `maquina_UNIQUE` (`maquina`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`codigo`, `maquina`, `descripcion`) VALUES
(1, 'press banca', NULL),
(2, 'abdominales', NULL),
(3, 'mancuerna', NULL),
(4, 'sentadillas', NULL),
(5, 'flexiones', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrenamiento`
--

DROP TABLE IF EXISTS `entrenamiento`;
CREATE TABLE IF NOT EXISTS `entrenamiento` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `usuario_codigo` int(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_entrenamiento_usuario_codigo_idx` (`usuario_codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `entrenamiento`
--

INSERT INTO `entrenamiento` (`codigo`, `fecha`, `usuario_codigo`) VALUES
(1, '2016-03-12', 1),
(2, '2016-03-12', 2),
(3, '2016-03-12', 3),
(4, '2016-03-13', 1),
(5, '2016-04-01', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaejercicios`
--

DROP TABLE IF EXISTS `listaejercicios`;
CREATE TABLE IF NOT EXISTS `listaejercicios` (
  `cod_entrenamiento` int(11) NOT NULL,
  `cod_ejercicio` int(11) NOT NULL,
  `series` int(11) DEFAULT NULL,
  `repeticiones` int(11) DEFAULT NULL,
  `peso` double DEFAULT NULL,
  PRIMARY KEY (`cod_entrenamiento`,`cod_ejercicio`),
  KEY `fk_listaejercicios_ejercicio_codigo_idx` (`cod_ejercicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `listaejercicios`
--

INSERT INTO `listaejercicios` (`cod_entrenamiento`, `cod_ejercicio`, `series`, `repeticiones`, `peso`) VALUES
(1, 1, 5, 15, 40),
(1, 2, 5, 15, NULL),
(1, 3, 5, 15, 10),
(2, 3, 5, 15, 5),
(2, 4, 5, 15, NULL),
(3, 1, 5, 15, 30),
(3, 2, 5, 15, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `user_UNIQUE` (`user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`codigo`, `nombre`, `apellidos`, `user`, `password`, `email`) VALUES
(1, 'jon ander', 'ochoa ruiz', 'jon', 'thor', 'jon@ipartek.com'),
(2, 'jorge', 'megadeth', 'jorge', 'mega', 'jorge@ipartek.com'),
(3, 'nora', 'gatitos', 'nora', 'miau', 'nora@ipartek.com'),
(4, 'santos', 'bateria', 'santos', 'bate', 'santos@ipartek.com'),
(5, 'laura', 'campa', 'lau', 'miniyo', 'lau@ipartek.com');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entrenamiento`
--
ALTER TABLE `entrenamiento`
  ADD CONSTRAINT `fk_entrenamiento_usuario_codigo` FOREIGN KEY (`usuario_codigo`) REFERENCES `usuario` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `listaejercicios`
--
ALTER TABLE `listaejercicios`
  ADD CONSTRAINT `fk_listaejercicios_ejercicio_codigo` FOREIGN KEY (`cod_ejercicio`) REFERENCES `ejercicio` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_listaejercicios_entrenamiento_codigo` FOREIGN KEY (`cod_entrenamiento`) REFERENCES `entrenamiento` (`codigo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
