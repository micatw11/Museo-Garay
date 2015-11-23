-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 23-11-2015 a las 15:26:36
-- Versión del servidor: 5.5.46-0ubuntu0.14.04.2
-- Versión de PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `museo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasificaciones`
--

CREATE TABLE IF NOT EXISTS `clasificaciones` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fondo_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `usuario_id_UNIQUE` (`usuario_id`),
  KEY `fk_clasificaciones_fondos1_idx` (`fondo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donaciones`
--

CREATE TABLE IF NOT EXISTS `donaciones` (
  `id` int(11) NOT NULL,
  `donante_id` int(11) NOT NULL,
  `pieza_id` int(11) NOT NULL,
  `fechaDonacion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_donacion_donante1_idx` (`donante_id`),
  KEY `fk_donacion_pieza1_idx` (`pieza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donantes`
--

CREATE TABLE IF NOT EXISTS `donantes` (
  `id` int(11) NOT NULL COMMENT '	',
  `Persona_id` int(11) NOT NULL,
  `fechaCarga` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Donante_Persona_idx` (`Persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fondos`
--

CREATE TABLE IF NOT EXISTS `fondos` (
  `id` int(10) unsigned NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fechaCarga` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_fondos_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(10) unsigned NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` varchar(45) NOT NULL,
  `operacion` varchar(45) NOT NULL,
  `objeto_id` varchar(45) NOT NULL,
  `tabla` varchar(45) NOT NULL,
  `datos` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_log_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `apellido` varchar(80) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `dni` int(10) unsigned NOT NULL,
  `cuil` int(15) NOT NULL,
  `domicilio` varchar(45) NOT NULL,
  `telefono` int(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `fechaCarga` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `apellido`, `nombre`, `dni`, `cuil`, `domicilio`, `telefono`, `email`, `fechaCarga`) VALUES
(1, 'garay', 'mica', 32659875, 12456698, 'cmcisdsa', 285544566, 'mica@djsfsd.com', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `piezas`
--

CREATE TABLE IF NOT EXISTS `piezas` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `procedencia` varchar(45) NOT NULL,
  `autor` varchar(45) NOT NULL,
  `tema` varchar(45) NOT NULL,
  `observacion` varchar(45) NOT NULL,
  `clasificacion_id` int(11) NOT NULL,
  `fechaEjecucion` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pieza_clasificacion1_idx` (`clasificacion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `revisiones`
--

CREATE TABLE IF NOT EXISTS `revisiones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `pieza_id` int(11) NOT NULL,
  `estadoDeConservacion` varchar(45) NOT NULL,
  `ubicacion` varchar(45) NOT NULL,
  `fechaRevision` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_revisiones_usuario1_idx` (`usuario_id`),
  KEY `fk_revisiones_pieza1_idx` (`pieza_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario_persona1_idx` (`persona_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vigencias`
--

CREATE TABLE IF NOT EXISTS `vigencias` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha alta` date NOT NULL,
  `fecha hasta` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vigencia_usuario1_idx` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clasificaciones`
--
ALTER TABLE `clasificaciones`
  ADD CONSTRAINT `fk_clasificaciones_fondos1` FOREIGN KEY (`fondo_id`) REFERENCES `fondos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `donaciones`
--
ALTER TABLE `donaciones`
  ADD CONSTRAINT `fk_donacion_donante1` FOREIGN KEY (`donante_id`) REFERENCES `donantes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_donacion_pieza1` FOREIGN KEY (`pieza_id`) REFERENCES `piezas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `donantes`
--
ALTER TABLE `donantes`
  ADD CONSTRAINT `fk_Donante_Persona` FOREIGN KEY (`Persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `fondos`
--
ALTER TABLE `fondos`
  ADD CONSTRAINT `fk_fondos_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fondos_clasificacion1` FOREIGN KEY (`usuario_id`) REFERENCES `clasificaciones` (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `piezas`
--
ALTER TABLE `piezas`
  ADD CONSTRAINT `fk_pieza_clasificacion1` FOREIGN KEY (`clasificacion_id`) REFERENCES `clasificaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `revisiones`
--
ALTER TABLE `revisiones`
  ADD CONSTRAINT `fk_revisiones_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_revisiones_pieza1` FOREIGN KEY (`pieza_id`) REFERENCES `piezas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_persona1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `vigencias`
--
ALTER TABLE `vigencias`
  ADD CONSTRAINT `fk_vigencia_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
