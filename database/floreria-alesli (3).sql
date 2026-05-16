-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 16-05-2026 a las 22:27:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `floreria-alesli`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id_item` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `id_producto` int(10) UNSIGNED NOT NULL,
  `cantidad` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `agregado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `id_producto` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `categoria` varchar(80) DEFAULT 'General',
  `foto` varchar(255) DEFAULT NULL,
  `estado` enum('activo','desactivo','agotado') NOT NULL DEFAULT 'activo',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`, `categoria`, `foto`, `estado`, `creado_en`) VALUES
(1, 'Ramo Amanecer', 'Combinación de rosas rosadas y follaje silvestre. Ideal para sorprender en cualquier ocasión.', 50.00, 15, 'Ramos', NULL, 'activo', '2026-05-15 23:06:30'),
(2, 'Ramo Eterna', 'Rosas rojas premium con lazo de satén. El clásico que nunca falla.', 80.00, 10, 'Ramos', NULL, 'activo', '2026-05-15 23:06:30'),
(3, 'Arreglo Primavera', 'Mix de girasoles, margaritas y follaje verde en caja kraft. Fresco y alegre.', 95.00, 8, 'Arreglos', NULL, 'activo', '2026-05-15 23:06:30'),
(4, 'Girasoles x12', 'Docena de girasoles frescos envueltos en papel kraft con moño dorado.', 70.00, 20, 'Ramos', NULL, 'activo', '2026-05-15 23:06:30'),
(5, 'Corona Fúnebre', 'Corona de flores blancas y verdes. Discreta, elegante y de entrega el mismo día.', 150.00, 5, 'Coronas', NULL, 'activo', '2026-05-15 23:06:30'),
(6, 'Ramo Pastel', 'Rosas en tonos pastel: blanco, lila y melocotón. Perfecto para bodas o baby shower.', 90.00, 12, 'Ramos', NULL, 'activo', '2026-05-15 23:06:30'),
(7, 'Caja Sorpresa Roja', 'Caja negra con 24 rosas rojas y chocolates artesanales. Regalo completo.', 200.00, 6, 'Cajas', NULL, 'activo', '2026-05-15 23:06:30'),
(8, 'Orquídea en Maceta', 'Orquídea Phalaenopsis en maceta decorativa. Dura semanas con poco cuidado.', 120.00, 4, 'Plantas', NULL, 'activo', '2026-05-15 23:06:30'),
(9, 'Ramo Lila Dreams', 'Lavanda, lisianthus lila y eucalipto. Aroma suave y presentación romántica.', 75.00, 9, 'Ramos', NULL, 'activo', '2026-05-15 23:06:30'),
(11, 'ramo negro flip', 'wasa', 23.00, 20, '', NULL, 'activo', '2026-05-16 18:37:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `rol` enum('admin','empleado') NOT NULL DEFAULT 'empleado',
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre`, `apellido`, `correo`, `contrasena`, `rol`, `estado`, `creado_en`) VALUES
(1, 'Alejandra', 'Soria', 'admin@floreria.com', '$2b$12$LFZ68cXRzEpgYC.4Mbd.FO1xDPEjIj1zZUas9cE3V/aCXC0xkYH16', 'admin', 'activo', '2026-05-15 23:06:29'),
(2, 'Carlos', 'Mamani', 'empleado@floreria.com', '$2b$12$L85a.j6x4LLjSPa3kL9sl.t1GgdvR47Ni.8gdboZjo7EZjjps4hZW', 'empleado', 'activo', '2026-05-15 23:06:29');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entregas`
--

CREATE TABLE `entregas` (
  `id_entrega` int(10) UNSIGNED NOT NULL,
  `id_pedido` int(10) UNSIGNED DEFAULT NULL,
  `cliente` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) NOT NULL,
  `zona` varchar(80) DEFAULT NULL,
  `producto` varchar(200) NOT NULL,
  `hora` time DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT curdate(),
  `estado` enum('pendiente','en-camino','entregado') DEFAULT 'pendiente',
  `notas` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `entregas`
--

INSERT INTO `entregas` (`id_entrega`, `id_pedido`, `cliente`, `telefono`, `direccion`, `zona`, `producto`, `hora`, `fecha`, `estado`, `notas`) VALUES
(1, 1, 'Ana Flores', '71234567', 'Av. 6 de Agosto 245, piso 3', 'Sopocachi', 'Ramo Eterna', '14:00:00', '2026-05-15', 'en-camino', 'Tocar timbre dos veces'),
(2, 4, 'Roberto Condori', '79876543', 'Calle 21, esq. Costanerita', 'Zona Sur', 'Girasoles x12', '15:30:00', '2026-05-15', 'pendiente', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(10) UNSIGNED NOT NULL,
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `producto` varchar(200) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `prioridad` enum('normal','urgente','vip') DEFAULT 'normal',
  `estado` enum('pendiente','preparando','listo','entregado','cancelado') DEFAULT 'pendiente',
  `notas` text DEFAULT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `producto`, `total`, `telefono`, `fecha_entrega`, `prioridad`, `estado`, `notas`, `fecha_pedido`) VALUES
(1, 1, 'Ramo Eterna', 80.00, '71234567', '2026-05-15', 'urgente', 'preparando', NULL, '2026-05-15 23:06:30'),
(2, 2, 'Arreglo Primavera', 95.00, '76543210', '2026-05-16', 'normal', 'pendiente', NULL, '2026-05-15 23:06:30'),
(3, 1, 'Caja Sorpresa Roja', 200.00, '71234567', '2026-05-17', 'vip', 'pendiente', NULL, '2026-05-15 23:06:30'),
(4, 3, 'Girasoles x12', 70.00, '79876543', '2026-05-15', 'normal', 'listo', NULL, '2026-05-15 23:06:30'),
(5, 2, 'Ramo Amanecer', 50.00, '76543210', '2026-05-14', 'normal', 'entregado', NULL, '2026-05-15 23:06:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `apellido` varchar(80) NOT NULL,
  `correo` varchar(120) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `tipo` enum('nuevo','frecuente','vip','inactivo') DEFAULT 'nuevo',
  `cumpleanos` date DEFAULT NULL,
  `notas` text DEFAULT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `correo`, `contrasena`, `telefono`, `direccion`, `tipo`, `cumpleanos`, `notas`, `estado`, `creado_en`) VALUES
(1, 'Ana', 'Flores', 'ana@cliente.com', '$2b$12$Vib0N4k2LwFLZ4Ap0tI16.0JNQxLsM82LNh/vyE1X4Gw693QfxH6u', '71234567', 'Av. 6 de Agosto, La Paz', 'vip', NULL, NULL, 'activo', '2026-05-15 23:06:30'),
(2, 'María', 'Quispe', 'maria@cliente.com', '$2b$12$pGoZ.ReYNfFhPBV.jEjOXei6FBE17EZrgNDcIm0DX3/NXreIN44t2', '76543210', 'Calle Loayza 123, La Paz', 'frecuente', NULL, NULL, 'activo', '2026-05-15 23:06:30'),
(3, 'Roberto', 'Condori', 'roberto@cliente.com', '$2b$12$RTELk8eC6nmvPovOq23f6utPEI4PDdVBL14.r5.e/0TUt3m9hTKNK', '79876543', 'Zona Sur, La Paz', 'nuevo', NULL, NULL, 'activo', '2026-05-15 23:06:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(10) UNSIGNED NOT NULL,
  `id_pedido` int(10) UNSIGNED DEFAULT NULL,
  `id_empleado` int(10) UNSIGNED DEFAULT NULL,
  `cliente` varchar(120) NOT NULL,
  `producto` varchar(200) NOT NULL,
  `monto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `metodo` enum('efectivo','qr','transferencia','tarjeta') DEFAULT 'efectivo',
  `estado` enum('completado','anulado') DEFAULT 'completado',
  `hora` time DEFAULT NULL,
  `fecha` date NOT NULL DEFAULT curdate()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_pedido`, `id_empleado`, `cliente`, `producto`, `monto`, `metodo`, `estado`, `hora`, `fecha`) VALUES
(1, 5, 2, 'María Quispe', 'Ramo Amanecer', 50.00, 'qr', 'completado', '10:30:00', '2026-05-14'),
(2, 4, 2, 'Roberto Condori', 'Girasoles x12', 70.00, 'efectivo', 'completado', '11:15:00', '2026-05-15'),
(3, 1, 2, 'Ana Flores', 'Ramo Eterna', 80.00, 'tarjeta', 'completado', '14:00:00', '2026-05-15'),
(4, NULL, 1, 'pep', 'ramo', 72.50, 'transferencia', 'completado', '14:36:07', '2026-05-16');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id_item`),
  ADD UNIQUE KEY `uq_usuario_producto` (`id_usuario`,`id_producto`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD PRIMARY KEY (`id_entrega`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id_item` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `id_producto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id_empleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `entregas`
--
ALTER TABLE `entregas`
  MODIFY `id_entrega` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `catalogo` (`id_producto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `entregas`
--
ALTER TABLE `entregas`
  ADD CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE SET NULL;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE SET NULL,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
