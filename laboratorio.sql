-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2026 a las 02:48:05
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
-- Base de datos: `laboratorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `id_cita` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `disponibilidad` varchar(20) NOT NULL,
  `especialidad` varchar(40) NOT NULL,
  `motivo` varchar(120) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cita_medica`
--

INSERT INTO `cita_medica` (`id_cita`, `id_paciente`, `disponibilidad`, `especialidad`, `motivo`, `id_medico`, `fecha`) VALUES
(1, 1, 'Confirmada', 'Medicina General', 'Chequeo general anual', 1, '2026-10-20 08:00:00'),
(2, 2, 'Confirmada', 'Pediatría', 'Control de niño sano', 2, '2026-10-20 09:30:00'),
(3, 3, 'Pendiente', 'Cardiología', 'Control de presión arterial', 3, '2026-10-21 14:00:00'),
(4, 4, 'Confirmada', 'Dermatología', 'Revisión de alergia en la piel', 4, '2026-10-21 15:30:00'),
(5, 5, 'Reprogramada', 'Ginecología', 'Control ginecológico de rutina', 5, '2026-10-22 10:00:00'),
(6, 6, 'Confirmada', 'Medicina General', 'Dolor de espalda persistente', 6, '2026-10-22 16:00:00'),
(7, 7, 'Pendiente', 'Cardiología', 'Electrocardiograma de control', 7, '2026-10-23 19:00:00'),
(8, 8, 'Confirmada', 'Pediatría', 'Fiebre y tos', 8, '2026-10-23 14:30:00'),
(9, 9, 'Cancelada', 'Dermatología', 'Consulta por acné', 9, '2026-10-24 08:30:00'),
(10, 10, 'Confirmada', 'Ginecología', 'Seguimiento de tratamiento', 10, '2026-10-24 20:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medico`, `nombre`, `apellido`, `telefono`, `correo`, `id_turno`, `id_especialidad`) VALUES
(1, 'Carlos', 'Mejía', '7001-1001', 'carlos.mejia@mediconecta.com', 1, 1),
(2, 'Ana', 'Martínez', '7001-1002', 'ana.martinez@mediconecta.com', 1, 2),
(3, 'Luis', 'Hernández', '7001-1003', 'luis.hernandez@mediconecta.com', 2, 3),
(4, 'María', 'López', '7001-1004', 'maria.lopez@mediconecta.com', 2, 4),
(5, 'José', 'Ramírez', '7001-1005', 'jose.ramirez@mediconecta.com', 1, 5),
(6, 'Sofía', 'Castillo', '7001-1006', 'sofia.castillo@mediconecta.com', 2, 1),
(7, 'Roberto', 'Flores', '7001-1007', 'roberto.flores@mediconecta.com', 3, 3),
(8, 'Patricia', 'Guzmán', '7001-1008', 'patricia.guzman@mediconecta.com', 2, 2),
(9, 'Daniel', 'Rivas', '7001-1009', 'daniel.rivas@mediconecta.com', 1, 4),
(10, 'Gabriela', 'Cruz', '7001-1010', 'gabriela.cruz@mediconecta.com', 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` char(1) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `tipo_sangre` varchar(5) NOT NULL,
  `alergias` varchar(100) DEFAULT 'Ninguna',
  `id_suscripcion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nombre`, `apellido`, `fecha_nacimiento`, `sexo`, `telefono`, `direccion`, `tipo_sangre`, `alergias`, `id_suscripcion`) VALUES
(1, 'Juan', 'Pérez', '1985-03-12', 'M', '7777-2001', 'Col. Escalón, San Salvador', 'O+', 'Ninguna', 1),
(2, 'Valeria', 'Ortiz', '2016-07-21', 'F', '7777-2002', 'Col. Jardines, Antiguo Cuscatlán', 'A+', 'Penicilina', 3),
(3, 'Miguel', 'Alvarado', '1960-11-02', 'M', '7777-2003', 'Santa Tecla, La Libertad', 'B+', 'Ninguna', 2),
(4, 'Daniela', 'Romero', '1998-05-30', 'F', '7777-2004', 'Col. Médica, San Salvador', 'O-', 'Polen', 1),
(5, 'Karla', 'Menjívar', '1992-09-14', 'F', '7777-2005', 'Soyapango, San Salvador', 'A-', 'Ninguna', 2),
(6, 'Pedro', 'Santos', '1978-01-25', 'M', '7777-2006', 'Mejicanos, San Salvador', 'AB+', 'Ibuprofeno', 1),
(7, 'Héctor', 'Vásquez', '1955-04-18', 'M', '7777-2007', 'Col. San Benito, San Salvador', 'O+', 'Ninguna', 2),
(8, 'Mateo', 'Aguilar', '2018-12-03', 'M', '7777-2008', 'Ciudad Merliot, La Libertad', 'B-', 'Lactosa', 3),
(9, 'Lucía', 'Barrientos', '2001-08-09', 'F', '7777-2009', 'Apopa, San Salvador', 'A+', 'Ninguna', 1),
(10, 'Andrea', 'Salazar', '1989-06-17', 'F', '7777-2010', 'Col. Escalón, San Salvador', 'O+', 'Sulfas', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`id_cita`),
  ADD KEY `fk_cita_paciente` (`id_paciente`),
  ADD KEY `fk_cita_medico` (`id_medico`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD CONSTRAINT `fk_cita_medico` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_cita_paciente` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
