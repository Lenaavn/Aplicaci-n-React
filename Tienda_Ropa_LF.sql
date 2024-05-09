-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-05-2024 a las 16:19:58
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Tienda_Ropa_LF`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Accesorio`
--

CREATE TABLE `Accesorio` (
  `id` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `tipo_tela` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Compra`
--

CREATE TABLE `Compra` (
  `id_ropa` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_compra` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Prenda_Inferior`
--

CREATE TABLE `Prenda_Inferior` (
  `id` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `tipo_longitud` varchar(30) NOT NULL,
  `tipo_tela` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Prenda_Superior`
--

CREATE TABLE `Prenda_Superior` (
  `id` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `tipo_manga` varchar(20) NOT NULL,
  `tiene_capucha` tinyint(1) NOT NULL,
  `tipo_tela` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ropa`
--

CREATE TABLE `Ropa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `color` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id` int(11) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `edad` int(3) NOT NULL,
  `telefono` char(9) NOT NULL,
  `email` varchar(40) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `contrasena` varchar(12) NOT NULL,
  `fecha_creacion_cuenta` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Zapatillas`
--

CREATE TABLE `Zapatillas` (
  `id` int(11) NOT NULL,
  `talla` int(11) NOT NULL,
  `tipo_suela` varchar(20) NOT NULL,
  `capsula_aire` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Accesorio`
--
ALTER TABLE `Accesorio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD PRIMARY KEY (`id_ropa`,`id_usuario`,`fecha_compra`),
  ADD KEY `usuario_compra` (`id_usuario`);

--
-- Indices de la tabla `Prenda_Inferior`
--
ALTER TABLE `Prenda_Inferior`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Prenda_Superior`
--
ALTER TABLE `Prenda_Superior`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Ropa`
--
ALTER TABLE `Ropa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `Zapatillas`
--
ALTER TABLE `Zapatillas`
  ADD KEY `zapatillas_ropa` (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Ropa`
--
ALTER TABLE `Ropa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Accesorio`
--
ALTER TABLE `Accesorio`
  ADD CONSTRAINT `accesorio_ropa` FOREIGN KEY (`id`) REFERENCES `Ropa` (`id`);

--
-- Filtros para la tabla `Compra`
--
ALTER TABLE `Compra`
  ADD CONSTRAINT `ropa_compra` FOREIGN KEY (`id_ropa`) REFERENCES `Ropa` (`id`),
  ADD CONSTRAINT `usuario_compra` FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id`);

--
-- Filtros para la tabla `Prenda_Inferior`
--
ALTER TABLE `Prenda_Inferior`
  ADD CONSTRAINT `inferior_ropa` FOREIGN KEY (`id`) REFERENCES `Ropa` (`id`);

--
-- Filtros para la tabla `Prenda_Superior`
--
ALTER TABLE `Prenda_Superior`
  ADD CONSTRAINT `superior_ropa` FOREIGN KEY (`id`) REFERENCES `Ropa` (`id`);

--
-- Filtros para la tabla `Zapatillas`
--
ALTER TABLE `Zapatillas`
  ADD CONSTRAINT `zapatillas_ropa` FOREIGN KEY (`id`) REFERENCES `Ropa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
