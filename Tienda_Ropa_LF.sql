-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 10-05-2024 a las 14:10:16
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
  `tipo` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Accesorio`
--

INSERT INTO `Accesorio` (`id`, `tipo`) VALUES
(16, 'Mochila'),
(17, 'Mochila'),
(18, 'Gorra'),
(19, 'Gorro'),
(20, 'Ropa Interior');

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
  `tipo_longitud` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Prenda_Inferior`
--

INSERT INTO `Prenda_Inferior` (`id`, `tipo_longitud`) VALUES
(1, 'Corto'),
(2, 'Corto'),
(13, 'Largo'),
(14, 'Largo'),
(15, 'Largo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Prenda_Superior`
--

CREATE TABLE `Prenda_Superior` (
  `id` int(11) NOT NULL,
  `tipo_manga` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Prenda_Superior`
--

INSERT INTO `Prenda_Superior` (`id`, `tipo_manga`) VALUES
(7, 'Larga'),
(9, 'Corta'),
(10, 'Sin Mangas'),
(11, 'Corta'),
(12, 'Corta');

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

--
-- Volcado de datos para la tabla `Ropa`
--

INSERT INTO `Ropa` (`id`, `nombre`, `marca`, `precio`, `stock`, `color`) VALUES
(1, 'Jordan pantalón corto Diamond', 'Jordan', 50, 200, 'Negro'),
(2, 'Jordan pantalón corto Diamond', 'Jordan', 50, 120, 'Celeste'),
(3, 'Adidas Originals Campus 00s', 'Adidas', 120, 80, 'Negro'),
(4, 'Nike Air Force 1 Low', 'Nike', 120, 100, 'Blanco'),
(5, 'Adidas Originals Gazelle Indoor', 'Adidas', 120, 60, 'Verde'),
(6, 'Nike Air VaporMax Plus', 'Nike', 225, 50, 'Negro'),
(7, 'Adidas Originals Chaqueta SST Adicolor Classics', 'Adidas', 70, 70, 'Rojo'),
(8, 'Jordan Air 1 Element GORE-TEX', 'Jordan', 200, 40, 'Marron'),
(9, 'Adidas Originals Camiseta Ice Cream', 'Adidas', 35, 80, 'Blanca'),
(10, 'Nike camiseta de tirantes Foundation', 'Nike', 25, 50, 'Negro'),
(11, 'Nike camiseta Crop Essential Slim', 'Nike', 30, 100, 'Negro'),
(12, 'Adidas Originals Camiseta Essential Boyfriend', 'Adidas', 30, 20, 'Verde'),
(13, 'Adidas Originals Firebird Track Pants', 'Adidas', 65, 60, 'Gris'),
(14, 'Jordan Brooklyn pantalón de chándal', 'Jordan', 70, 80, 'Negro'),
(15, 'Nike Trophy 23 Shorts Junior', 'Nike', 25, 200, 'Negro'),
(16, 'Nike mochila Elemental', 'Nike', 33, 60, 'Negro'),
(17, 'Jordan mochila bandolera Airborne', 'Jordan', 21, 50, 'Negro'),
(18, 'Jordan Rise Metal Logo Cap', 'Jordan', 36, 20, 'Negro'),
(19, 'Adidas Originals Trefoil Beanie', 'Adidas', 23, 45, 'Gris'),
(20, 'Nike 3-Pack Boxers', 'Nike', 40, 80, 'Varios');

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
  `capsula_aire` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `Zapatillas`
--

INSERT INTO `Zapatillas` (`id`, `capsula_aire`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 1),
(8, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
