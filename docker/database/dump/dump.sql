-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: database
-- Tiempo de generación: 20-11-2023 a las 02:17:55
-- Versión del servidor: 8.2.0
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `rrhh`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document`
--

CREATE TABLE `document` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL,
  `document_category_id` char(36) NOT NULL,
  `attachment` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `document`
--

INSERT INTO `document` (`id`, `name`, `number`, `create_at`, `document_category_id`, `attachment`) VALUES
('12a6fc69-a86f-4137-822f-8947b02c60bf', 'pruevaaaaaaaaaa', '1232', '2021-11-15 15:43:39', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', '[{\"url\":\"pruevaaaaaaaaaa-1232-eeee-6192721b68ac7.pdf\",\"type\":\"2\",\"description\":\"eeee\"}]'),
('1c2f1e4f-ea09-4f05-98aa-ecc592109a7c', 'editor_j', '1232', '2021-11-11 18:19:20', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', '[]'),
('348be4b3-e80b-49e6-a193-41579cc27146', 'employee', '1234', '2021-11-15 18:29:26', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', '[{\"url\":\"employee-1234-eeee-619298f675749.pdf\",\"type\":\"2\",\"description\":\"eeee\"},{\"url\":\"employee-1234-no-se-61951b0c1abe3.xlsx\",\"type\":\"2\",\"description\":\"no se\"}]'),
('369acd21-317f-4723-8467-21b585ea2ee6', 'Decreto', '3434', '2021-11-11 02:50:29', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', NULL),
('46fa6554-caa6-4caf-aa3c-70093cb210c0', 'editor_j', '1232', '2021-11-18 01:54:25', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', NULL),
('5102f0de-8f0c-4b04-95f5-c63282ceda89', 'Resolución', '1232', '2021-11-11 02:27:26', 'eb3c70a2-37e0-4e03-96fc-97a9b710e7a3', NULL),
('69c98c79-b6cc-486e-82ee-8d78c572a9ce', 'Resolución', '123', '2021-11-11 03:44:49', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', NULL),
('926ef876-8280-4a8c-a07d-3e3adfb9b87a', 'editor_j', '1232', '2021-11-11 20:47:05', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', '[{\"url\":\"editor-j-1232-adfds-618d733943744.pdf\",\"type\":\"2\",\"description\":\"adfds\"}]'),
('9e547b4a-be41-435a-8859-4d9d8fbbe178', 'decreto', '111111', '2021-11-11 03:46:36', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', '[{\"url\":\"decreto-111111-unica-618d4b90e219e.pdf\",\"type\":\"2\",\"description\":\"unica\"}]'),
('b9a08de0-41c7-454a-b0df-fbb3ec66dbc4', 'asdfdsf', '1232', '2021-11-18 01:55:47', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', '[{\"url\":\"asdfdsf-1232-eeee-6195a4b19aca9.pdf\",\"type\":\"2\",\"description\":\"eeee\"}]'),
('ea88acf3-435f-40d0-9e13-2fb89de87959', 'editor_j', '', '2021-11-17 17:43:35', '6386b903-e6b4-4e59-8df7-3fa5e2ad6500', '[{\"url\":\"editor-j-psrt-1-61953a5713fff.pdf\",\"type\":\"2\",\"description\":\"psrt 1\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `document_category`
--

CREATE TABLE `document_category` (
  `id` char(36) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `document_category`
--

INSERT INTO `document_category` (`id`, `name`, `create_at`) VALUES
('021939df-dc3d-4670-842d-da19895e6ed8', 'Otro', '2021-11-09 23:58:47'),
('6386b903-e6b4-4e59-8df7-3fa5e2ad6500', 'Decreto', '2021-11-09 23:58:19'),
('9ba430d9-f5d5-4eff-8954-a499619b4477', 'Renuncia', '2021-11-09 23:58:28'),
('eb3c70a2-37e0-4e03-96fc-97a9b710e7a3', 'Resolución', '2021-11-09 23:58:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `identity_card` int DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `job_designation_id` char(36) NOT NULL,
  `employment_contract_id` char(36) NOT NULL,
  `shift_work` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id`, `name`, `surname`, `identity_card`, `phone`, `email`, `hire_date`, `termination_date`, `address`, `job_designation_id`, `employment_contract_id`, `shift_work`, `create_at`, `update_at`, `birthday`) VALUES
('0e025930-083e-4e85-a5ae-844ecf525829', 'Elena', 'Martín', 25392927, NULL, NULL, NULL, NULL, NULL, '97fa2ae0-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-11-19 02:12:12', NULL, NULL),
('4f00510d-e14e-4b18-9886-448a464caf33', 'Jeremías', 'Molinos', 35573471, NULL, NULL, NULL, NULL, NULL, '97fa0c83-15b3-11ec-885b-c5cfbd441ecb', '1fc7ce20-b325-4d30-b4fb-bb2e5b2583c0', '2', '2021-11-19 02:10:20', NULL, NULL),
('55ddabfc-29d5-4249-9866-4bfbfd47fa5d', 'Facundo', 'Luján', 31688573, NULL, NULL, NULL, NULL, NULL, '97f8bc00-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-11-19 02:14:35', NULL, NULL),
('609aa803-df5a-4ae0-9686-e83f5c54e2c6', 'Benjamín', 'Montenegro', 11722455, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-11-19 02:11:32', NULL, NULL),
('61c378c7-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Zelaya', 13546556, NULL, NULL, NULL, NULL, 'Ypf - Chepes, Av. San martin 315', '97f8b256-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1984-11-24'),
('61c385f2-343a-11ec-880f-c4cbacfef3c6', 'Benjamín', 'Zúñiga', 22565416, '3821-154790608', NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1984-09-23'),
('61c38a35-343a-11ec-880f-c4cbacfef3c6', 'Valentino', 'Aguirre', 32187414, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1981-11-28'),
('61c38e19-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Molinos', 23240823, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1976-04-06'),
('61c392c6-343a-11ec-880f-c4cbacfef3c6', 'Alejandro', 'Cáceres', 39641877, NULL, NULL, '2015-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', 'ef23723d-793b-4c74-abe0-a867d22d2c05', '0', '2021-10-23 17:31:11', '2023-11-20 00:56:30', NULL),
('61c39e07-343a-11ec-880f-c4cbacfef3c6', 'Tomás', 'Guevara', 28486914, NULL, NULL, '2017-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c3a555-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Dávila', 13508944, NULL, NULL, '2014-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c4bdc9-343a-11ec-880f-c4cbacfef3c6', 'Benjamín', 'Palacios', 32083977, NULL, NULL, '2015-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c4cc51-343a-11ec-880f-c4cbacfef3c6', 'Nicolás', 'Coronel', 19893055, NULL, NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c4d19b-343a-11ec-880f-c4cbacfef3c6', 'Olivia', 'Almada', 23213346, NULL, NULL, '2014-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c4f060-343a-11ec-880f-c4cbacfef3c6', 'Lucas', 'Fontana', 16387568, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1976-01-25'),
('61c4f795-343a-11ec-880f-c4cbacfef3c6', 'Martín', 'Villegas', 32297802, NULL, NULL, NULL, NULL, 'Padre Amirati - Olta, Los Incas 15', '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1975-12-12'),
('61c4fd07-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Colman', 12326309, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1979-08-25'),
('61c5024f-343a-11ec-880f-c4cbacfef3c6', 'Santiago', 'Villalba', 14738139, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1978-05-23'),
('61c5079f-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Tovar', 26711770, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1987-06-15'),
('61c50ceb-343a-11ec-880f-c4cbacfef3c6', 'Olivia', 'Palacios', 19344432, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c51188-343a-11ec-880f-c4cbacfef3c6', 'Ana', 'Yáñez', 36586854, '3826-154508928', NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1977-01-24'),
('61c516e3-343a-11ec-880f-c4cbacfef3c6', 'Benjamín', 'Escobar', 24900973, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c526df-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Correa', 34744304, NULL, NULL, NULL, NULL, 'Hospital - Milagro, San Martin 877', '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1978-07-03'),
('61c52bb6-343a-11ec-880f-c4cbacfef3c6', 'Nicolás', 'Villegas', 29018603, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1976-01-04'),
('61c53090-343a-11ec-880f-c4cbacfef3c6', 'Joaquín', 'Tejada', 30860106, '3826-154313956', NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1979-10-02'),
('61c55783-343a-11ec-880f-c4cbacfef3c6', 'Martín', 'Montenegro', 27244719, NULL, NULL, '2018-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c56a49-343a-11ec-880f-c4cbacfef3c6', 'Victoria', 'Téllez', 33643282, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1970-04-26'),
('61c5737d-343a-11ec-880f-c4cbacfef3c6', 'Máximo', 'Peralta', 16482254, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1970-10-27'),
('61c57a49-343a-11ec-880f-c4cbacfef3c6', 'Valentino', 'Araya', 31481425, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1976-08-31'),
('61c58047-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Ojeda', 37960362, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1982-02-20'),
('61c58eae-343a-11ec-880f-c4cbacfef3c6', 'Elena', 'Aldana', 25357540, '3821-154402762', NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1973-03-03'),
('61c59863-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Araya', 32906613, NULL, NULL, '2017-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c5a73a-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Villalba', 18460448, '154624191', NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1982-10-14'),
('61c5ad8b-343a-11ec-880f-c4cbacfef3c6', 'Juliana', 'Colman', 13582401, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1973-09-09'),
('61c5b3d1-343a-11ec-880f-c4cbacfef3c6', 'Juliana', 'Tejada', 32530664, NULL, NULL, '2017-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c5d5e4-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Fontana', 21906117, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1981-09-23'),
('61c5db20-343a-11ec-880f-c4cbacfef3c6', 'Mía', 'Araya', 31938593, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1989-12-06'),
('61c6df68-343a-11ec-880f-c4cbacfef3c6', 'Mía', 'Colman', 23974617, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1985-05-31'),
('61c7cb3b-343a-11ec-880f-c4cbacfef3c6', 'Valentino', 'Gutiérrez', 14057309, '3827-154445903', NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1984-05-15'),
('61c7d766-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Godoy', 18362696, '154374869', NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1982-03-07'),
('61c7e104-343a-11ec-880f-c4cbacfef3c6', 'Valentina', 'Dávila', 39641553, NULL, NULL, '2015-01-01', NULL, NULL, '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61c7ecd3-343a-11ec-880f-c4cbacfef3c6', 'Elena', 'Ojeda', 13119677, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c7fa67-343a-11ec-880f-c4cbacfef3c6', 'Isabella', 'Escobar', 26673727, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1977-05-18'),
('61c80203-343a-11ec-880f-c4cbacfef3c6', 'Renata', 'Quiroga', 24009606, '3825-154536619', NULL, '2017-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c80c0c-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Montenegro', 30026850, NULL, NULL, '2018-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c81511-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Quiroga', 38105432, NULL, NULL, '2018-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c82484-343a-11ec-880f-c4cbacfef3c6', 'Emma', 'Godoy', 30446614, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1974-10-30'),
('61c82a01-343a-11ec-880f-c4cbacfef3c6', 'Sol', 'Cáceres', 27916774, '3804926079', NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1980-04-08'),
('61c831d6-343a-11ec-880f-c4cbacfef3c6', 'Matías', 'Beltrán', 38244032, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1982-07-23'),
('61c83982-343a-11ec-880f-c4cbacfef3c6', 'Josefina', 'Yáñez', 37469838, NULL, NULL, NULL, NULL, 'Olivo Cuatricentenario - Aimogasta, Manzana C 16', '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1965-10-29'),
('61c8412b-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Guevara', 32617094, NULL, NULL, '2018-01-01', NULL, NULL, '97f8b256-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c849a7-343a-11ec-880f-c4cbacfef3c6', 'Felipe', 'Yáñez', 10675960, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1978-07-10'),
('61c85187-343a-11ec-880f-c4cbacfef3c6', 'Isabella', 'Martín', 35528517, '3825-154451053', NULL, NULL, NULL, NULL, '97fa3078-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1974-07-27'),
('61c85f23-343a-11ec-880f-c4cbacfef3c6', 'Juliana', 'Vallejo', 15614708, NULL, NULL, NULL, NULL, 'Chilecito, Pelagio B Luna 88 88', '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1978-11-08'),
('61c86eeb-343a-11ec-880f-c4cbacfef3c6', 'Emilia', 'Aldana', 21487989, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1974-09-01'),
('61c877a2-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Colman', 20595824, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c87d84-343a-11ec-880f-c4cbacfef3c6', 'Matías', 'Zabala', 28515155, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c8835d-343a-11ec-880f-c4cbacfef3c6', 'Mateo', 'Roldán', 10788302, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c88947-343a-11ec-880f-c4cbacfef3c6', 'Jazmín', 'Peralta', 18396048, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c88f3d-343a-11ec-880f-c4cbacfef3c6', 'Abril', 'Peralta', 19615337, NULL, NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c895f7-343a-11ec-880f-c4cbacfef3c6', 'Lucía', 'Villalba', 32888541, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c89fb4-343a-11ec-880f-c4cbacfef3c6', 'Valentina', 'Guevara', 35596694, NULL, NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1978-04-01'),
('61c8adc5-343a-11ec-880f-c4cbacfef3c6', 'Sol', 'Requena', 39317851, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1989-01-30'),
('61c8b4dd-343a-11ec-880f-c4cbacfef3c6', 'Gael', 'Zabala', 19799174, '3825-154410189', NULL, '2016-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c8bedf-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Cardozo', 31042317, NULL, NULL, '2015-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61c8c97a-343a-11ec-880f-c4cbacfef3c6', 'Abril', 'López', 25814063, NULL, NULL, '2016-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61c8d3a8-343a-11ec-880f-c4cbacfef3c6', 'Ignacio', 'Correa', 25943368, NULL, NULL, '2016-01-01', '2018-05-28', NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61c90430-343a-11ec-880f-c4cbacfef3c6', 'Catalina', 'Nuñez', 12274654, NULL, NULL, '2017-01-01', '2018-06-01', NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61c90b0b-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Zabala', 33543164, '3804506070', 'andreatizon@gmail.com', NULL, NULL, NULL, '97f8b256-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, NULL),
('61c90ff7-343a-11ec-880f-c4cbacfef3c6', 'Camila', 'Requena', 30891860, NULL, NULL, '2015-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61c91b86-343a-11ec-880f-c4cbacfef3c6', 'Ana', 'Colman', 13829809, NULL, NULL, '2017-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61c9219d-343a-11ec-880f-c4cbacfef3c6', 'Juliana', 'Lemos', 26473465, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61caf5f6-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Colman', 20877902, NULL, NULL, '2017-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '3', '2021-10-23 17:31:11', NULL, NULL),
('61cafda9-343a-11ec-880f-c4cbacfef3c6', 'Luciano', 'Vallejo', 14969117, '3804109066', 'danielasanchez2216@gmail.com', '2016-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cb05a3-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Zelaya', 32211879, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cb0d62-343a-11ec-880f-c4cbacfef3c6', 'Victoria', 'Yáñez', 16152046, NULL, NULL, '2017-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cb1f81-343a-11ec-880f-c4cbacfef3c6', 'Gael', 'Zelaya', 34124593, NULL, NULL, NULL, NULL, 'Matadero - La Rioja, El Chacho 30', '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1982-02-24'),
('61cb23e9-343a-11ec-880f-c4cbacfef3c6', 'Abril', 'Fontana', 22166830, NULL, NULL, NULL, NULL, NULL, '97fa081a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1974-03-15'),
('61cb2901-343a-11ec-880f-c4cbacfef3c6', 'Luciano', 'Gallegos', 28460372, NULL, NULL, NULL, NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cb326a-343a-11ec-880f-c4cbacfef3c6', 'Elena', 'Ojeda', 35801372, NULL, NULL, NULL, NULL, NULL, '97fa081a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cb36a3-343a-11ec-880f-c4cbacfef3c6', 'Nicolás', 'Ocampo', 23625747, NULL, NULL, NULL, NULL, 'Centro - La Rioja, Corrientes 712 712', '97fa081a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1990-02-24'),
('61cb3adb-343a-11ec-880f-c4cbacfef3c6', 'Ana', 'Peralta', 30724618, NULL, NULL, NULL, NULL, 'Faldeo del Velazco Sur - La Rioja, Manzana Y 18', '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1977-12-15'),
('61cb478a-343a-11ec-880f-c4cbacfef3c6', 'Isabella', 'Zelaya', 12745850, NULL, NULL, '2016-08-01', NULL, NULL, '97fa0166-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cb4fd2-343a-11ec-880f-c4cbacfef3c6', 'Juliana', 'Lemos', 21555400, NULL, NULL, '2016-01-01', NULL, NULL, '97fa081a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cb58ed-343a-11ec-880f-c4cbacfef3c6', 'Amelia', 'Lemos', 29539452, NULL, NULL, '2014-01-01', NULL, NULL, '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cbbe2e-343a-11ec-880f-c4cbacfef3c6', 'Victoria', 'López', 13031058, NULL, NULL, NULL, NULL, NULL, '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1989-12-01'),
('61cbc47d-343a-11ec-880f-c4cbacfef3c6', 'Tomás', 'Godoy', 26536938, NULL, NULL, '2018-01-01', NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cbcab9-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Aldana', 23591519, NULL, NULL, '2014-01-01', '2018-05-28', NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cbd4e4-343a-11ec-880f-c4cbacfef3c6', 'Amelia', 'Villalba', 28346779, NULL, NULL, '2016-01-01', NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cbdd6f-343a-11ec-880f-c4cbacfef3c6', 'Elena', 'Vila', 30959341, NULL, NULL, '2017-01-01', NULL, NULL, '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cbe448-343a-11ec-880f-c4cbacfef3c6', 'Máximo', 'Zabala', 29756368, NULL, NULL, '2017-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cbeb06-343a-11ec-880f-c4cbacfef3c6', 'Renata', 'Dávila', 15903819, NULL, NULL, NULL, NULL, NULL, '97f8b256-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cbf62c-343a-11ec-880f-c4cbacfef3c6', 'Camila', 'Páez', 10249994, NULL, NULL, NULL, NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cbfa64-343a-11ec-880f-c4cbacfef3c6', 'Ana', 'Palacios', 23538514, NULL, NULL, NULL, NULL, 'Luis Vernet - La rioja, Capitan Giachino 169', '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1981-04-23'),
('61cbff0d-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Ojeda', 16942591, NULL, NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc033a-343a-11ec-880f-c4cbacfef3c6', 'Ignacio', 'Villegas', 34097413, NULL, NULL, NULL, NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc0c5b-343a-11ec-880f-c4cbacfef3c6', 'Emilia', 'López', 19659293, NULL, NULL, NULL, NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc1075-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Yáñez', 16004227, NULL, NULL, NULL, NULL, NULL, '97f8b8a8-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1979-08-27'),
('61cc1a62-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Peralta', 11043260, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1975-03-08'),
('61cc1fc4-343a-11ec-880f-c4cbacfef3c6', 'Thiago', 'López', 27203619, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc2788-343a-11ec-880f-c4cbacfef3c6', 'Benjamín', 'Molinos', 32888314, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1990-02-09'),
('61cc2ac5-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Albornoz', 12830718, NULL, NULL, NULL, NULL, '25 de Mayo Sur - La Rioja, Dolores De la Vega de Calderon 805 805', '97fa2ccd-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1989-10-27'),
('61cc2e0d-343a-11ec-880f-c4cbacfef3c6', 'Camila', 'Agüero', 15488648, NULL, NULL, NULL, NULL, 'Las Agaves - La Rioja, Sector 2 Manzana J 115', '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1985-02-16'),
('61cc3168-343a-11ec-880f-c4cbacfef3c6', 'Tomás', 'Ávila', 28951087, NULL, NULL, '2015-01-01', NULL, NULL, '97fa2ccd-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc37e4-343a-11ec-880f-c4cbacfef3c6', 'Máximo', 'Escobar', 28289494, NULL, NULL, '2016-01-01', NULL, NULL, '97f8b63b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc3dab-343a-11ec-880f-c4cbacfef3c6', 'Ignacio', 'Requena', 14594208, NULL, NULL, '2014-01-01', NULL, NULL, '97fa2ccd-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc44bb-343a-11ec-880f-c4cbacfef3c6', 'Olivia', 'Gallegos', 38102559, NULL, NULL, '2014-01-01', NULL, NULL, '97fa2ccd-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc4bca-343a-11ec-880f-c4cbacfef3c6', 'Lautaro', 'Colman', 16730174, NULL, NULL, NULL, NULL, 'Evita- La Rioja, Viamonte 1037 1037', '97f8b457-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1989-08-31'),
('61cc4f05-343a-11ec-880f-c4cbacfef3c6', 'Alejandro', 'Galván', 19343195, NULL, 'romera.gomez.jorge@gmail.com', '2015-01-01', NULL, 'Santa justina, Pedro Fonteñez 13', '97f8bc00-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, '1982-09-20'),
('61cc558f-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Requena', 36525455, NULL, NULL, '2015-01-01', NULL, NULL, '97fa2ccd-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cc6de5-343a-11ec-880f-c4cbacfef3c6', 'Tomás', 'Gutiérrez', 24597690, NULL, NULL, NULL, NULL, 'Habitad - La Rioja, Los Granados 6', '97fa2ae0-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1987-11-09'),
('61cce9fe-343a-11ec-880f-c4cbacfef3c6', 'Juan', 'Palacios', 33412088, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1965-03-23'),
('61cced6b-343a-11ec-880f-c4cbacfef3c6', 'Gael', 'Escobar', 23267370, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1988-10-31'),
('61ccf0c3-343a-11ec-880f-c4cbacfef3c6', 'Facundo', 'Zúñiga', 36100589, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1959-12-21'),
('61ccfc09-343a-11ec-880f-c4cbacfef3c6', 'Martina', 'Salinas', 10700837, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1974-08-17'),
('61cd02b1-343a-11ec-880f-c4cbacfef3c6', 'Santiago', 'Cardozo', 25202417, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1978-06-02'),
('61cd05fa-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Galván', 23909577, '3804306677', 'sis26@live.com.ar', NULL, NULL, 'San Martin - La Rioja, Neuquen 656 656', '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '3', '2021-10-23 17:31:11', NULL, '1967-06-26'),
('61cd09fd-343a-11ec-880f-c4cbacfef3c6', 'Amelia', 'Beltrán', 33940635, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1982-04-12'),
('61cd0d65-343a-11ec-880f-c4cbacfef3c6', 'Valentina', 'Salinas', 27974444, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1987-08-05'),
('61cd10b0-343a-11ec-880f-c4cbacfef3c6', 'Sofía', 'Coronel', 28050317, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cd1406-343a-11ec-880f-c4cbacfef3c6', 'Florencia', 'Dávila', 16328256, NULL, NULL, NULL, NULL, 'Los Olmos - La Rioja, Av. Dr. de la Fuente 1320', '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1978-07-22'),
('61cd1759-343a-11ec-880f-c4cbacfef3c6', 'Matías', 'Zúñiga', 17490330, NULL, NULL, '2015-01-01', NULL, NULL, '97fa0c83-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cd21f2-343a-11ec-880f-c4cbacfef3c6', 'Mateo', 'Coronel', 28466883, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cd2873-343a-11ec-880f-c4cbacfef3c6', 'Emilia', 'Gallegos', 19863429, NULL, NULL, '2017-01-01', NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cd337b-343a-11ec-880f-c4cbacfef3c6', 'Lucía', 'Cáceres', 33916494, NULL, NULL, '2017-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cd38ce-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Aguirre', 39992184, NULL, NULL, '2015-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cd43f5-343a-11ec-880f-c4cbacfef3c6', 'Felipe', 'Coronel', 28211440, NULL, NULL, '2016-08-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cd4d9d-343a-11ec-880f-c4cbacfef3c6', 'Jazmín', 'Ibarra', 11080648, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1983-08-25'),
('61cd562e-343a-11ec-880f-c4cbacfef3c6', 'Facundo', 'Ibarra', 20768922, NULL, NULL, '2015-01-01', NULL, NULL, '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cd5d4a-343a-11ec-880f-c4cbacfef3c6', 'Nicolás', 'Martín', 30602666, NULL, NULL, '2014-01-01', NULL, NULL, '97fa0166-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cd64bb-343a-11ec-880f-c4cbacfef3c6', 'Emma', 'Gallegos', 20706566, NULL, NULL, NULL, NULL, 'Emanuel Ginobilli - La RIoja, Rosendo Velarte 72', '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1982-06-19'),
('61cd6c76-343a-11ec-880f-c4cbacfef3c6', 'Nicolás', 'Lemos', 31724836, NULL, NULL, NULL, NULL, NULL, '97fa1921-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cd6fef-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Colman', 26504482, NULL, NULL, NULL, NULL, NULL, '97fa1921-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1983-03-28'),
('61cd7425-343a-11ec-880f-c4cbacfef3c6', 'Felipe', 'Vila', 27347903, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1975-01-06'),
('61cdd50d-343a-11ec-880f-c4cbacfef3c6', 'Luciano', 'Montenegro', 17226070, NULL, NULL, NULL, NULL, 'Panamericano - La Rioja, Quito 57', '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1978-02-27'),
('61cddd63-343a-11ec-880f-c4cbacfef3c6', 'Olivia', 'Zelaya', 24086643, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cde720-343a-11ec-880f-c4cbacfef3c6', 'Mateo', 'Montenegro', 28755008, NULL, NULL, '2017-01-01', '2018-06-27', NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cded1c-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Vila', 31515111, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1983-12-17'),
('61cdf14a-343a-11ec-880f-c4cbacfef3c6', 'Florencia', 'Lemos', 31310535, NULL, NULL, NULL, NULL, NULL, '97fa081a-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cdf71a-343a-11ec-880f-c4cbacfef3c6', 'Emma', 'Téllez', 22007340, NULL, NULL, NULL, NULL, 'Urbano 24, Proyectada 90 90', '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1977-06-23'),
('61cdf97e-343a-11ec-880f-c4cbacfef3c6', 'Isabella', 'Araya', 36105097, NULL, NULL, NULL, NULL, 'San Martin - La Rioja, Av Ramire de Velasco 235 235', '97fa1921-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1963-04-20'),
('61cdfefe-343a-11ec-880f-c4cbacfef3c6', 'Isabella', 'Araya', 14503468, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1976-09-27'),
('61ce05c4-343a-11ec-880f-c4cbacfef3c6', 'Martín', 'Requena', 14202048, NULL, NULL, NULL, NULL, 'Faldeo del Velazco Sur - La Rioja, Palo Cruz 32 32', '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1979-11-23'),
('61ce081f-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Colman', 17499839, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce0a7b-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Beltrán', 34893052, NULL, NULL, '2016-01-01', '2018-03-27', NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61ce0f39-343a-11ec-880f-c4cbacfef3c6', 'Martín', 'Galván', 21965744, NULL, NULL, NULL, NULL, NULL, '97f8b256-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1972-06-01'),
('61ce119e-343a-11ec-880f-c4cbacfef3c6', 'Gael', 'Aguirre', 25149565, NULL, NULL, NULL, NULL, NULL, '97f8b256-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ce13ff-343a-11ec-880f-c4cbacfef3c6', 'Felipe', 'López', 19850596, NULL, NULL, NULL, NULL, 'Vargas - La Rioja, 1 de Julio 5114 5114', '97fa143b-15b3-11ec-885b-c5cfbd441ecb', 'ef23723d-793b-4c74-abe0-a867d22d2c05', '3', '2021-10-23 17:31:11', NULL, '1968-01-07'),
('61ce176b-343a-11ec-880f-c4cbacfef3c6', 'Mía', 'Cáceres', 13804284, NULL, NULL, NULL, NULL, 'Santa Justina -La Rioja, Turin 133 133', '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1978-08-07'),
('61ce19d3-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Aldana', 29469635, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce1c32-343a-11ec-880f-c4cbacfef3c6', 'Camila', 'Molinos', 35935326, NULL, NULL, '2015-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ce20f6-343a-11ec-880f-c4cbacfef3c6', 'Felipe', 'Requena', 21267726, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1982-09-20'),
('61ce235d-343a-11ec-880f-c4cbacfef3c6', 'Amelia', 'Villalba', 18532652, NULL, NULL, NULL, NULL, 'Evita- La Rioja, España 778 778', '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1966-12-11'),
('61ce25b8-343a-11ec-880f-c4cbacfef3c6', 'Mateo', 'Gutiérrez', 18860085, NULL, NULL, NULL, NULL, 'La Rioja, Av Angelelli 991 991', '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1989-06-23'),
('61ce2815-343a-11ec-880f-c4cbacfef3c6', 'Florencia', 'Téllez', 28702470, NULL, NULL, NULL, NULL, 'Mis Montañas - La Rioja, Manzana K 14', '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1984-10-05'),
('61ce2e2a-343a-11ec-880f-c4cbacfef3c6', 'Emilia', 'Araya', 16932096, '3804444008', 'analiasoledad_barrera@hotmail.com', NULL, NULL, 'Los Olivares - La Rioja, Rio Turbio 488', '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1979-10-09'),
('61ce3109-343a-11ec-880f-c4cbacfef3c6', 'Jazmín', 'Galván', 18553070, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1974-09-02'),
('61ce3899-343a-11ec-880f-c4cbacfef3c6', 'Emma', 'Aldana', 31969064, NULL, NULL, '2018-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce3bef-343a-11ec-880f-c4cbacfef3c6', 'Santiago', 'Aguirre', 34186110, NULL, NULL, '2015-01-01', NULL, NULL, '97fa2517-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce40ad-343a-11ec-880f-c4cbacfef3c6', 'Renata', 'Galván', 35023362, NULL, NULL, '2015-01-01', NULL, NULL, '97fa081a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce45cc-343a-11ec-880f-c4cbacfef3c6', 'Lucas', 'Aguirre', 32558482, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1979-08-10'),
('61ce4834-343a-11ec-880f-c4cbacfef3c6', 'Thiago', 'Ocampo', 17722325, '3804364864', 'nancycia11@hotmail.com', NULL, NULL, 'Juan Facundo Quiroga - La Rioja, Aztecas 1316', '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1973-12-04'),
('61ce4d7a-343a-11ec-880f-c4cbacfef3c6', 'Olivia', 'Palacios', 10936181, NULL, NULL, NULL, NULL, 'Mercantil - La Rioja, Calle 157 94', '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1988-09-26'),
('61ce4ff7-343a-11ec-880f-c4cbacfef3c6', 'Isabella', 'Tovar', 21513929, NULL, NULL, '2014-01-01', NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ce552b-343a-11ec-880f-c4cbacfef3c6', 'Juan', 'Galván', 34761106, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1988-01-05'),
('61ce5785-343a-11ec-880f-c4cbacfef3c6', 'Martina', 'Correa', 39263742, NULL, NULL, '2015-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ce5f40-343a-11ec-880f-c4cbacfef3c6', 'Lautaro', 'Villalba', 22035397, '3804545527', 'mariaeugeniacodocea@hotmail.com', NULL, NULL, 'Matadero - La Rioja, Carmelo b. Valdez 378', '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1978-05-05'),
('61ce6222-343a-11ec-880f-c4cbacfef3c6', 'Catalina', 'Godoy', 12385757, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1983-09-16'),
('61ce6486-343a-11ec-880f-c4cbacfef3c6', 'Luciano', 'Araya', 15822595, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '3', '2021-10-23 17:31:11', NULL, NULL),
('61ce6967-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Guevara', 31955706, NULL, NULL, '2016-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce6e0e-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Ojeda', 12310745, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce726e-343a-11ec-880f-c4cbacfef3c6', 'Felipe', 'Molinos', 15686608, NULL, NULL, '2016-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ce798f-343a-11ec-880f-c4cbacfef3c6', 'Tomás', 'Roldán', 31500810, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1981-11-21'),
('61ce7be9-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Cáceres', 10444224, NULL, NULL, NULL, NULL, 'San Martin - La Rioja, San Juan 754', '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1988-07-02'),
('61ce7e6d-343a-11ec-880f-c4cbacfef3c6', 'Nicolás', 'López', 37718693, NULL, NULL, '2015-01-01', NULL, NULL, '97f8b256-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ce8364-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Beltrán', 27260796, '3804418981', 'silviarumilla@hotmail.com', NULL, NULL, 'Mis Montañas - La Rioja, Manzana A 7', '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1973-11-24'),
('61ce8642-343a-11ec-880f-c4cbacfef3c6', 'Emma', 'Tovar', 13147899, NULL, NULL, NULL, NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '1fc7ce20-b325-4d30-b4fb-bb2e5b2583c0', '0', '2021-10-23 17:31:11', NULL, NULL),
('61ce8968-343a-11ec-880f-c4cbacfef3c6', 'Delfina', 'Nuñez', 33957112, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ce933f-343a-11ec-880f-c4cbacfef3c6', 'Renata', 'Godoy', 30341862, NULL, NULL, '2014-04-09', NULL, 'Matadero - La Rioja, San Nicolas de Bari Este 22', '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1988-05-15'),
('61ce95d1-343a-11ec-880f-c4cbacfef3c6', 'Florencia', 'Montenegro', 39837978, NULL, NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1980-03-27'),
('61ce9833-343a-11ec-880f-c4cbacfef3c6', 'Martina', 'Beltrán', 38164305, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1951-11-22'),
('61ce9a90-343a-11ec-880f-c4cbacfef3c6', 'Felipe', 'Martín', 31307592, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ce9cf4-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Aguirre', 32045045, NULL, NULL, NULL, NULL, 'Antartida 1 - La Rioja, Islas Orcadas 548 548', '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1983-12-07'),
('61ce9f50-343a-11ec-880f-c4cbacfef3c6', 'Joaquín', 'Zúñiga', 26302451, NULL, NULL, NULL, NULL, 'Las Agaves - La Rioja, Carlos Pelegrini 333 333', '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1978-08-24'),
('61cea1d3-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Luján', 25377123, '3804538551', NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1969-08-01'),
('61cea435-343a-11ec-880f-c4cbacfef3c6', 'Thiago', 'Araya', 37978264, '3804308153', NULL, '2017-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cea806-343a-11ec-880f-c4cbacfef3c6', 'Luciano', 'Villalba', 13759950, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1988-09-11'),
('61ceaa6c-343a-11ec-880f-c4cbacfef3c6', 'Camila', 'Páez', 34864960, NULL, NULL, NULL, NULL, 'San Roman - La Rioja, Vicente Bustos 408', '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1966-06-14'),
('61ceacef-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Vila', 33044950, NULL, NULL, '2017-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ceb03a-343a-11ec-880f-c4cbacfef3c6', 'Victoria', 'Zelaya', 20629871, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1975-03-21'),
('61ceb2a0-343a-11ec-880f-c4cbacfef3c6', 'Valentino', 'Vallejo', 24014506, NULL, NULL, '2016-08-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cec3a2-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Ibarra', 18182921, NULL, NULL, NULL, NULL, '8 de Diciembre - La Rioja, Cant. Bahia Margarita 910', '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', 'ef23723d-793b-4c74-abe0-a867d22d2c05', '1', '2021-10-23 17:31:11', NULL, '1960-10-16'),
('61cec69c-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Galván', 38871089, NULL, NULL, '2018-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cec9ea-343a-11ec-880f-c4cbacfef3c6', 'Tomás', 'Luján', 39806682, NULL, NULL, '2018-01-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ced2b6-343a-11ec-880f-c4cbacfef3c6', 'Lautaro', 'Gutiérrez', 12420146, NULL, NULL, '2014-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61ceda7d-343a-11ec-880f-c4cbacfef3c6', 'Lucía', 'Molinos', 22680685, NULL, NULL, '2015-01-01', NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cee35a-343a-11ec-880f-c4cbacfef3c6', 'Olivia', 'Araya', 36142989, '3804488952', 'nemago06@gmail.com', NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1964-12-22'),
('61cee67f-343a-11ec-880f-c4cbacfef3c6', 'Abril', 'Ibarra', 12672890, NULL, NULL, '2016-01-01', NULL, NULL, '97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61ceeabf-343a-11ec-880f-c4cbacfef3c6', 'Martín', 'Galván', 34935483, '3804330504', NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1980-11-05'),
('61ceed37-343a-11ec-880f-c4cbacfef3c6', 'Lucía', 'Beltrán', 36658750, NULL, NULL, NULL, NULL, 'Matadero - La Rioja, Gaspar Gomez 282 282', '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '1', '2021-10-23 17:31:11', NULL, '1981-04-13'),
('61ceefbd-343a-11ec-880f-c4cbacfef3c6', 'Juan', 'Quiroga', 38487300, NULL, NULL, '2016-01-01', NULL, NULL, '97fa045e-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cf54b5-343a-11ec-880f-c4cbacfef3c6', 'Isabella', 'Ojeda', 12460253, '3804443626', NULL, '2018-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cf5960-343a-11ec-880f-c4cbacfef3c6', 'Sol', 'Tejada', 26839364, NULL, NULL, NULL, NULL, 'Vargas - La Rioja, Juramento 05 05', '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1982-05-22'),
('61cf5c07-343a-11ec-880f-c4cbacfef3c6', 'Tomás', 'Araya', 26816062, '3804803326', NULL, '2017-01-01', NULL, NULL, '97fa1921-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61cf5ffd-343a-11ec-880f-c4cbacfef3c6', 'Juan', 'Tejada', 13562221, NULL, NULL, '2016-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cf6476-343a-11ec-880f-c4cbacfef3c6', 'Gael', 'Albornoz', 37362919, NULL, NULL, '2016-08-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61cfc45d-343a-11ec-880f-c4cbacfef3c6', 'Victoria', 'Villegas', 16127935, '3804562795', 'jazcoco2@gmail.com', NULL, NULL, 'Joaquin Victor Gonzalez, VInchina 19', '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1979-06-11'),
('61cfc927-343a-11ec-880f-c4cbacfef3c6', 'Máximo', 'Molinos', 18550919, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1965-01-23'),
('61cfcc28-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Colman', 34370793, '3825-154554160', NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1987-04-04');
INSERT INTO `employee` (`id`, `name`, `surname`, `identity_card`, `phone`, `email`, `hire_date`, `termination_date`, `address`, `job_designation_id`, `employment_contract_id`, `shift_work`, `create_at`, `update_at`, `birthday`) VALUES
('61cfced6-343a-11ec-880f-c4cbacfef3c6', 'Gael', 'Beltrán', 16201206, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1981-04-29'),
('61cfd16f-343a-11ec-880f-c4cbacfef3c6', 'Amelia', 'Vallejo', 27893656, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1972-06-20'),
('61cfd3f4-343a-11ec-880f-c4cbacfef3c6', 'Victoria', 'Gutiérrez', 20864660, NULL, NULL, NULL, NULL, NULL, '97fa0c83-15b3-11ec-885b-c5cfbd441ecb', 'ef23723d-793b-4c74-abe0-a867d22d2c05', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cfd707-343a-11ec-880f-c4cbacfef3c6', 'Valentino', 'Villegas', 10642336, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1976-09-06'),
('61cfd9b8-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Yáñez', 10617700, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1973-09-27'),
('61cfdc3d-343a-11ec-880f-c4cbacfef3c6', 'Sol', 'López', 11161496, NULL, NULL, NULL, NULL, 'Argentino - Chamical, Av. N. Majul Ayan 250', '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1974-11-06'),
('61cfe203-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Coronel', 13954378, NULL, NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1986-08-03'),
('61cfe4d2-343a-11ec-880f-c4cbacfef3c6', 'Florencia', 'Palacios', 26287404, '3826-154407407', NULL, NULL, NULL, 'Centro - Chamical, Gabriel Longueville 274', '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1979-03-07'),
('61cfe9ff-343a-11ec-880f-c4cbacfef3c6', 'Martina', 'Gallegos', 19573889, NULL, NULL, NULL, NULL, NULL, '97fa0e5f-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1981-02-15'),
('61cfec96-343a-11ec-880f-c4cbacfef3c6', 'Juan Pablo', 'Agüero', 39007234, NULL, NULL, '2017-01-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cff0ca-343a-11ec-880f-c4cbacfef3c6', 'Clara', 'Beltrán', 36314503, NULL, NULL, NULL, NULL, NULL, '97f8b030-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cff4bd-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Dávila', 24550814, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, '1975-01-25'),
('61cff75e-343a-11ec-880f-c4cbacfef3c6', 'Ana', 'Gallegos', 33810565, '3825-154695582', NULL, NULL, NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cff9f3-343a-11ec-880f-c4cbacfef3c6', 'Alejandro', 'Téllez', 25400383, NULL, NULL, NULL, NULL, NULL, '97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, NULL),
('61cffc87-343a-11ec-880f-c4cbacfef3c6', 'Ana', 'Tejada', 15570222, NULL, NULL, NULL, '2018-06-02', NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '0', '2021-10-23 17:31:11', NULL, NULL),
('61d00391-343a-11ec-880f-c4cbacfef3c6', 'Catalina', 'Luján', 21649961, NULL, NULL, '2018-10-01', NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d00738-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Gutiérrez', 21539143, NULL, NULL, '2018-10-01', NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, '2018-10-08'),
('61d00ae6-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Galván', 32745831, NULL, NULL, '2018-10-01', NULL, NULL, '97fa0166-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d00ec6-343a-11ec-880f-c4cbacfef3c6', 'Renata', 'Molinos', 29111726, NULL, NULL, '2018-10-01', NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d012fe-343a-11ec-880f-c4cbacfef3c6', 'Emilia', 'Palacios', 37321141, NULL, NULL, '2018-10-08', NULL, NULL, '97fa1921-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d01699-343a-11ec-880f-c4cbacfef3c6', 'Sofía', 'Martín', 29270528, NULL, NULL, '2018-10-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d01aa4-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Cardozo', 24389220, NULL, NULL, '2018-10-01', NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d028ab-343a-11ec-880f-c4cbacfef3c6', 'Santiago', 'Ocampo', 24134517, NULL, NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d02ef9-343a-11ec-880f-c4cbacfef3c6', 'Lucas', 'Páez', 37504927, NULL, NULL, '2018-08-01', NULL, NULL, '97fa0166-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d035e2-343a-11ec-880f-c4cbacfef3c6', 'Aitana', 'Fontana', 15121085, NULL, NULL, NULL, NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d03b8e-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Téllez', 13090646, NULL, NULL, NULL, NULL, NULL, '97fa143b-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d04158-343a-11ec-880f-c4cbacfef3c6', 'Agustín', 'Godoy', 10089977, NULL, NULL, NULL, NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '3', '2021-10-23 17:31:11', NULL, NULL),
('61d044e4-343a-11ec-880f-c4cbacfef3c6', 'Gael', 'Requena', 31177946, NULL, NULL, '2018-10-01', NULL, NULL, '97fa1044-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d0a5f6-343a-11ec-880f-c4cbacfef3c6', 'Catalina', 'Colman', 25619803, NULL, NULL, NULL, NULL, NULL, '97fa081a-15b3-11ec-885b-c5cfbd441ecb', '3723de95-2e24-4384-ab5b-7177ac8d8906', '2', '2021-10-23 17:31:11', NULL, '1984-04-28'),
('61d0a8ea-343a-11ec-880f-c4cbacfef3c6', 'Jeremías', 'Aguirre', 24565176, NULL, NULL, NULL, NULL, NULL, '97f8bf41-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d0ac9b-343a-11ec-880f-c4cbacfef3c6', 'Lucía', 'Téllez', 35966474, NULL, NULL, '2016-01-01', NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d0b762-343a-11ec-880f-c4cbacfef3c6', 'Martina', 'Galván', 36136842, NULL, NULL, NULL, NULL, NULL, '97fa0c83-15b3-11ec-885b-c5cfbd441ecb', 'e1cb8b57-f09d-4a11-8b8c-928953e88e43', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d0ba07-343a-11ec-880f-c4cbacfef3c6', 'Mía', 'Ojeda', 32784792, NULL, NULL, '2018-01-01', NULL, NULL, '97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d11582-343a-11ec-880f-c4cbacfef3c6', 'Martín', 'Guevara', 15513433, NULL, NULL, '2015-01-01', NULL, NULL, '97fa0c83-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('61d1250f-343a-11ec-880f-c4cbacfef3c6', 'Ana', 'Nuñez', 29212791, NULL, NULL, '2017-03-01', NULL, NULL, '539fab7c-d0ee-411a-9ab5-e1012ad8ba51', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61d128c1-343a-11ec-880f-c4cbacfef3c6', 'Franco', 'Ávila', 29523659, NULL, NULL, '2018-08-01', NULL, NULL, '539fab7c-d0ee-411a-9ab5-e1012ad8ba51', '2247edaa-0d3a-422c-b268-0e94561872d8', '0', '2021-10-23 17:31:11', NULL, NULL),
('61d12fc8-343a-11ec-880f-c4cbacfef3c6', 'Florencia', 'Vila', 19979924, NULL, NULL, '2019-01-01', NULL, NULL, '97fa2ae0-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d1396f-343a-11ec-880f-c4cbacfef3c6', 'Emma', 'Ocampo', 31328642, NULL, NULL, '2019-01-01', NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2021-10-23 17:31:11', NULL, NULL),
('61d14f5b-343a-11ec-880f-c4cbacfef3c6', 'Bautista', 'Coronel', 26703442, NULL, NULL, NULL, NULL, NULL, '97fa123a-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '2', '2021-10-23 17:31:11', NULL, NULL),
('9cdd3f10-a4d5-4dce-87e0-383675cc683d', 'cordinador prueba', 'cordinador prueba', NULL, NULL, NULL, NULL, NULL, NULL, '97f8bc00-15b3-11ec-885b-c5cfbd441ecb', '2247edaa-0d3a-422c-b268-0e94561872d8', '1', '2023-11-20 00:42:16', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee__document`
--

CREATE TABLE `employee__document` (
  `employee_id` char(36) NOT NULL,
  `document_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `employee__document`
--

INSERT INTO `employee__document` (`employee_id`, `document_id`) VALUES
('61c526df-343a-11ec-880f-c4cbacfef3c6', '12a6fc69-a86f-4137-822f-8947b02c60bf'),
('61d012fe-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c9219d-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c8bedf-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61caf5f6-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce4ff7-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ceb2a0-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d0ba07-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ced2b6-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c8b4dd-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd562e-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce5785-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c80c0c-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d1250f-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd5d4a-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d0a8ea-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c7e104-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cec69c-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d01aa4-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d128c1-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ceda7d-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cbc47d-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cb0d62-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cb4fd2-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d01699-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d12fc8-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cec9ea-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce7e6d-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c59863-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cbdd6f-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cc3168-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce0a7b-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce6486-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cee67f-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c91b86-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cf54b5-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce6967-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d1396f-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c8412b-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cbcab9-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce8968-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c4bdc9-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d00ec6-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce40ad-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c516e3-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c55783-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c5b3d1-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cddd63-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce3bef-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c81511-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cc37e4-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d0ac9b-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cb58ed-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c7ecd3-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c8c97a-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd1759-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cde720-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c4d19b-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d00ae6-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c895f7-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cb478a-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce1c32-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cc3dab-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce6e0e-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cc44bb-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d02ef9-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c3a555-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce726e-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d00738-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c90ff7-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd2873-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cc4f05-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c39e07-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd21f2-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cea435-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c90430-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cfec96-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd38ce-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d044e4-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cafda9-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd337b-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cf5c07-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cbd4e4-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cf6476-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d11582-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d028ab-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c392c6-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cf5ffd-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cd43f5-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cbe448-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d14f5b-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d00391-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cc558f-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c8d3a8-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cb05a3-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ceacef-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61cff0ca-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61ce3899-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61c80203-343a-11ec-880f-c4cbacfef3c6', '348be4b3-e80b-49e6-a193-41579cc27146'),
('61d012fe-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c9219d-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c8bedf-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61caf5f6-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce4ff7-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ceb2a0-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d0ba07-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ced2b6-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c8b4dd-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd562e-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce5785-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c80c0c-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d1250f-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd5d4a-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d0a8ea-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c7e104-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cec69c-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d01aa4-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d128c1-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ceda7d-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cbc47d-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cb0d62-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cb4fd2-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d01699-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d12fc8-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cec9ea-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce7e6d-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c59863-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cbdd6f-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cc3168-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce0a7b-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce6486-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cee67f-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c91b86-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cf54b5-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce6967-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d1396f-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c8412b-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cbcab9-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce8968-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c4bdc9-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d00ec6-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce40ad-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c516e3-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c55783-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c5b3d1-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cddd63-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce3bef-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c81511-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cc37e4-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d0ac9b-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cb58ed-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c7ecd3-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c8c97a-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd1759-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cde720-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c4d19b-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d00ae6-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c895f7-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cb478a-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce1c32-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cc3dab-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce6e0e-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cc44bb-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d02ef9-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c3a555-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce726e-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d00738-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c90ff7-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd2873-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cc4f05-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c39e07-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd21f2-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cea435-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c90430-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cfec96-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd38ce-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d044e4-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cafda9-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd337b-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cf5c07-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cbd4e4-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cf6476-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d11582-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d028ab-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c392c6-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cf5ffd-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cd43f5-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cbe448-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d14f5b-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d00391-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cc558f-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c8d3a8-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cb05a3-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ceacef-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61cff0ca-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61ce3899-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61c80203-343a-11ec-880f-c4cbacfef3c6', '46fa6554-caa6-4caf-aa3c-70093cb210c0'),
('61d012fe-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c9219d-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c8bedf-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61caf5f6-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce4ff7-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ceb2a0-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d0ba07-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ced2b6-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c8b4dd-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd562e-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce5785-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c80c0c-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d1250f-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd5d4a-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d0a8ea-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c7e104-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cec69c-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d01aa4-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d128c1-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ceda7d-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cbc47d-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cb0d62-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cb4fd2-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d01699-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d12fc8-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cec9ea-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce7e6d-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c59863-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cbdd6f-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cc3168-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce0a7b-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce6486-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cee67f-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c91b86-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cf54b5-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce6967-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d1396f-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c8412b-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cbcab9-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce8968-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c4bdc9-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d00ec6-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce40ad-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c516e3-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c55783-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c5b3d1-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cddd63-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce3bef-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c81511-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cc37e4-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d0ac9b-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cb58ed-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c7ecd3-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c8c97a-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd1759-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cde720-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c4d19b-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d00ae6-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c895f7-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cb478a-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce1c32-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cc3dab-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce6e0e-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cc44bb-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d02ef9-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c3a555-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce726e-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d00738-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c90ff7-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd2873-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cc4f05-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c39e07-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd21f2-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cea435-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c90430-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cfec96-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd38ce-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d044e4-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cafda9-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd337b-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cf5c07-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cbd4e4-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cf6476-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d11582-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d028ab-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c392c6-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cf5ffd-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cd43f5-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cbe448-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d14f5b-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61d00391-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cc558f-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c8d3a8-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cb05a3-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ceacef-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61cff0ca-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61ce3899-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4'),
('61c80203-343a-11ec-880f-c4cbacfef3c6', 'b9a08de0-41c7-454a-b0df-fbb3ec66dbc4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee__LST`
--

CREATE TABLE `employee__LST` (
  `employee_id` char(36) NOT NULL,
  `learning_support_team_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `employee__LST`
--

INSERT INTO `employee__LST` (`employee_id`, `learning_support_team_id`) VALUES
('61cce9fe-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61cced6b-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61ccf0c3-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61ccfc09-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61cd02b1-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61cd09fd-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61cd0d65-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61cd10b0-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61cd1406-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61cd1759-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61cd21f2-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61cd2873-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61cd337b-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61cd38ce-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61cd43f5-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61ce9f50-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61ceb2a0-343a-11ec-880f-c4cbacfef3c6', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('61d012fe-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61cd4d9d-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61cd64bb-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61cd6c76-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61cd6fef-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61cd7425-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61cdd50d-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61cddd63-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61cded1c-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61cdf71a-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61cdf97e-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61d00738-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61d0ac9b-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61d0b762-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61d0ba07-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61cdfefe-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce05c4-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce081f-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce0f39-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce119e-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce176b-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce19d3-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce1c32-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce20f6-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce235d-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce25b8-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce2815-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce3109-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce3899-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce3bef-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce45cc-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce9833-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce9a90-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61d01699-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61c7e104-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61ce4ff7-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61ce552b-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61ce5785-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61ce6222-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61ce6967-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61ce6e0e-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61ce726e-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61ce798f-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61ce7e6d-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61ce8968-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61d00391-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61d03b8e-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61d044e4-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61cb0d62-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61ce95d1-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61cea1d3-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61cea435-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61ced2b6-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61ceda7d-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61cee67f-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61ceeabf-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61ceed37-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61cf54b5-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61cf5960-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61cf5c07-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61cf5ffd-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61cf6476-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61d028ab-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61c378c7-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61c38a35-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61c38e19-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61c39e07-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61c3a555-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61c4cc51-343a-11ec-880f-c4cbacfef3c6', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('61c4d19b-343a-11ec-880f-c4cbacfef3c6', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('61c4f060-343a-11ec-880f-c4cbacfef3c6', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('61c4f795-343a-11ec-880f-c4cbacfef3c6', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('61c4fd07-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c5024f-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c5079f-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c50ceb-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c516e3-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c526df-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c52bb6-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c55783-343a-11ec-880f-c4cbacfef3c6', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('61cfd16f-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61cfd3f4-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61cfd707-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61cfd9b8-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61cfdc3d-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61cfe203-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61cfe9ff-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61cfec96-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61c56a49-343a-11ec-880f-c4cbacfef3c6', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('61c5737d-343a-11ec-880f-c4cbacfef3c6', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('61c57a49-343a-11ec-880f-c4cbacfef3c6', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('61c58047-343a-11ec-880f-c4cbacfef3c6', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('61c59863-343a-11ec-880f-c4cbacfef3c6', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('61c5ad8b-343a-11ec-880f-c4cbacfef3c6', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('61c5b3d1-343a-11ec-880f-c4cbacfef3c6', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('61c5d5e4-343a-11ec-880f-c4cbacfef3c6', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('61c5db20-343a-11ec-880f-c4cbacfef3c6', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('61c6df68-343a-11ec-880f-c4cbacfef3c6', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('61c7ecd3-343a-11ec-880f-c4cbacfef3c6', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('61c7fa67-343a-11ec-880f-c4cbacfef3c6', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('61cfc927-343a-11ec-880f-c4cbacfef3c6', '0c0ae26c-3682-11ec-88b9-c6d3d0998ffd'),
('61cfced6-343a-11ec-880f-c4cbacfef3c6', '0c0ae26c-3682-11ec-88b9-c6d3d0998ffd'),
('61cff4bd-343a-11ec-880f-c4cbacfef3c6', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('61cff9f3-343a-11ec-880f-c4cbacfef3c6', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('61cffc87-343a-11ec-880f-c4cbacfef3c6', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('61c82484-343a-11ec-880f-c4cbacfef3c6', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('61c831d6-343a-11ec-880f-c4cbacfef3c6', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('61c83982-343a-11ec-880f-c4cbacfef3c6', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('61c849a7-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c85f23-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c86eeb-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c877a2-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c87d84-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c8835d-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c88947-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c88f3d-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c89fb4-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c8adc5-343a-11ec-880f-c4cbacfef3c6', '0c0ca021-3682-11ec-88b9-c6d3d0998ffd'),
('61cb1f81-343a-11ec-880f-c4cbacfef3c6', '0c0ca41e-3682-11ec-88b9-c6d3d0998ffd'),
('61cb2901-343a-11ec-880f-c4cbacfef3c6', '0c0ca41e-3682-11ec-88b9-c6d3d0998ffd'),
('61cb326a-343a-11ec-880f-c4cbacfef3c6', '0c0ca41e-3682-11ec-88b9-c6d3d0998ffd'),
('61cb36a3-343a-11ec-880f-c4cbacfef3c6', '0c0ca41e-3682-11ec-88b9-c6d3d0998ffd'),
('61cb3adb-343a-11ec-880f-c4cbacfef3c6', '0c0ca41e-3682-11ec-88b9-c6d3d0998ffd'),
('61ceefbd-343a-11ec-880f-c4cbacfef3c6', '0c0e2654-3682-11ec-88b9-c6d3d0998ffd'),
('61d02ef9-343a-11ec-880f-c4cbacfef3c6', '0c0ca41e-3682-11ec-88b9-c6d3d0998ffd'),
('61d035e2-343a-11ec-880f-c4cbacfef3c6', '0c0e2654-3682-11ec-88b9-c6d3d0998ffd'),
('61cb478a-343a-11ec-880f-c4cbacfef3c6', '0c0cad80-3682-11ec-88b9-c6d3d0998ffd'),
('61cb58ed-343a-11ec-880f-c4cbacfef3c6', '0c0cad80-3682-11ec-88b9-c6d3d0998ffd'),
('61cbc47d-343a-11ec-880f-c4cbacfef3c6', '0c0cad80-3682-11ec-88b9-c6d3d0998ffd'),
('61cbd4e4-343a-11ec-880f-c4cbacfef3c6', '0c0e1671-3682-11ec-88b9-c6d3d0998ffd'),
('61cbdd6f-343a-11ec-880f-c4cbacfef3c6', '0c0e1671-3682-11ec-88b9-c6d3d0998ffd'),
('61cbe448-343a-11ec-880f-c4cbacfef3c6', '0c0e1671-3682-11ec-88b9-c6d3d0998ffd'),
('61d00ae6-343a-11ec-880f-c4cbacfef3c6', '0c0e1671-3682-11ec-88b9-c6d3d0998ffd'),
('61d0a5f6-343a-11ec-880f-c4cbacfef3c6', '0c0e1671-3682-11ec-88b9-c6d3d0998ffd'),
('61cbf62c-343a-11ec-880f-c4cbacfef3c6', '0c0cb694-3682-11ec-88b9-c6d3d0998ffd'),
('61cbfa64-343a-11ec-880f-c4cbacfef3c6', '0c0cbaa1-3682-11ec-88b9-c6d3d0998ffd'),
('61cbff0d-343a-11ec-880f-c4cbacfef3c6', '0c0cbaa1-3682-11ec-88b9-c6d3d0998ffd'),
('61cc033a-343a-11ec-880f-c4cbacfef3c6', '0c0cbaa1-3682-11ec-88b9-c6d3d0998ffd'),
('61cc0c5b-343a-11ec-880f-c4cbacfef3c6', '0c0cbaa1-3682-11ec-88b9-c6d3d0998ffd'),
('61cc1075-343a-11ec-880f-c4cbacfef3c6', '0c0cbaa1-3682-11ec-88b9-c6d3d0998ffd'),
('61cc1a62-343a-11ec-880f-c4cbacfef3c6', '0c0cbaa1-3682-11ec-88b9-c6d3d0998ffd'),
('61cc1fc4-343a-11ec-880f-c4cbacfef3c6', '0c0cc2e2-3682-11ec-88b9-c6d3d0998ffd'),
('61cc2788-343a-11ec-880f-c4cbacfef3c6', '0c0cc2e2-3682-11ec-88b9-c6d3d0998ffd'),
('61cc2ac5-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61cc37e4-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61cc3dab-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61cc4bca-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61cc6de5-343a-11ec-880f-c4cbacfef3c6', '0c0ce3ec-3682-11ec-88b9-c6d3d0998ffd'),
('61cc2e0d-343a-11ec-880f-c4cbacfef3c6', '0c0e1e6f-3682-11ec-88b9-c6d3d0998ffd'),
('61cd562e-343a-11ec-880f-c4cbacfef3c6', '0c0e1e6f-3682-11ec-88b9-c6d3d0998ffd'),
('61cd5d4a-343a-11ec-880f-c4cbacfef3c6', '0c0e1e6f-3682-11ec-88b9-c6d3d0998ffd'),
('61cdf14a-343a-11ec-880f-c4cbacfef3c6', '0c0d56e9-3682-11ec-88b9-c6d3d0998ffd'),
('61d00ec6-343a-11ec-880f-c4cbacfef3c6', '0c0e1e6f-3682-11ec-88b9-c6d3d0998ffd'),
('61d0a8ea-343a-11ec-880f-c4cbacfef3c6', '0c0e1e6f-3682-11ec-88b9-c6d3d0998ffd'),
('61cec9ea-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ceb03a-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce40ad-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61ce13ff-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce13ff-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61cb4fd2-343a-11ec-880f-c4cbacfef3c6', '0c0cad80-3682-11ec-88b9-c6d3d0998ffd'),
('61cea806-343a-11ec-880f-c4cbacfef3c6', '0c0cad80-3682-11ec-88b9-c6d3d0998ffd'),
('61cbbe2e-343a-11ec-880f-c4cbacfef3c6', '0c0d56e9-3682-11ec-88b9-c6d3d0998ffd'),
('61cbeb06-343a-11ec-880f-c4cbacfef3c6', '0c0e1671-3682-11ec-88b9-c6d3d0998ffd'),
('61d04158-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61d04158-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61cc3168-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61cc558f-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61cc44bb-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61cd05fa-343a-11ec-880f-c4cbacfef3c6', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('61ce4834-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61ce2e2a-343a-11ec-880f-c4cbacfef3c6', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('61cee35a-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61ce5f40-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61ce8364-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61c385f2-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61c51188-343a-11ec-880f-c4cbacfef3c6', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('61c53090-343a-11ec-880f-c4cbacfef3c6', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('61cfe4d2-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61c58eae-343a-11ec-880f-c4cbacfef3c6', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('61c5a73a-343a-11ec-880f-c4cbacfef3c6', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('61c7cb3b-343a-11ec-880f-c4cbacfef3c6', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('61c7d766-343a-11ec-880f-c4cbacfef3c6', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('61cfcc28-343a-11ec-880f-c4cbacfef3c6', '0c0ae26c-3682-11ec-88b9-c6d3d0998ffd'),
('61cff75e-343a-11ec-880f-c4cbacfef3c6', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('61c82a01-343a-11ec-880f-c4cbacfef3c6', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('61c85187-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c90b0b-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61ce8642-343a-11ec-880f-c4cbacfef3c6', '0c0d73d8-3682-11ec-88b9-c6d3d0998ffd'),
('61ce4d7a-343a-11ec-880f-c4cbacfef3c6', '0c0d73d8-3682-11ec-88b9-c6d3d0998ffd'),
('61ce7be9-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61ce6486-343a-11ec-880f-c4cbacfef3c6', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('61ce6486-343a-11ec-880f-c4cbacfef3c6', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('61cfc45d-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61ceaa6c-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61cec3a2-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61ce9cf4-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61cec69c-343a-11ec-880f-c4cbacfef3c6', '0c0d73d8-3682-11ec-88b9-c6d3d0998ffd'),
('61c4bdc9-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61d01aa4-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61ceacef-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61d14f5b-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61cc4f05-343a-11ec-880f-c4cbacfef3c6', '0c0cdb98-3682-11ec-88b9-c6d3d0998ffd'),
('61d1396f-343a-11ec-880f-c4cbacfef3c6', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('61d12fc8-343a-11ec-880f-c4cbacfef3c6', '0c0dcd7e-3682-11ec-88b9-c6d3d0998ffd'),
('61d128c1-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61d1250f-343a-11ec-880f-c4cbacfef3c6', '0c0c9c80-3682-11ec-88b9-c6d3d0998ffd'),
('61d11582-343a-11ec-880f-c4cbacfef3c6', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('61cb05a3-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61c9219d-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61caf5f6-343a-11ec-880f-c4cbacfef3c6', '0c0d73d8-3682-11ec-88b9-c6d3d0998ffd'),
('61caf5f6-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61ce933f-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61cafda9-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61c91b86-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61c90ff7-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61c8c97a-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61c8bedf-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61c8b4dd-343a-11ec-880f-c4cbacfef3c6', '0c0ca021-3682-11ec-88b9-c6d3d0998ffd'),
('61c895f7-343a-11ec-880f-c4cbacfef3c6', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('61c8412b-343a-11ec-880f-c4cbacfef3c6', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('61c81511-343a-11ec-880f-c4cbacfef3c6', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('61c80c0c-343a-11ec-880f-c4cbacfef3c6', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('61c80203-343a-11ec-880f-c4cbacfef3c6', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('61cbcab9-343a-11ec-880f-c4cbacfef3c6', '0c0d73d8-3682-11ec-88b9-c6d3d0998ffd'),
('61cde720-343a-11ec-880f-c4cbacfef3c6', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('61c90430-343a-11ec-880f-c4cbacfef3c6', '0c0d73d8-3682-11ec-88b9-c6d3d0998ffd'),
('61ce0a7b-343a-11ec-880f-c4cbacfef3c6', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('61cb23e9-343a-11ec-880f-c4cbacfef3c6', '0c0ca41e-3682-11ec-88b9-c6d3d0998ffd'),
('61cff0ca-343a-11ec-880f-c4cbacfef3c6', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('61c8d3a8-343a-11ec-880f-c4cbacfef3c6', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('61c392c6-343a-11ec-880f-c4cbacfef3c6', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('61c392c6-343a-11ec-880f-c4cbacfef3c6', '0c0dcd7e-3682-11ec-88b9-c6d3d0998ffd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employment_contract`
--

CREATE TABLE `employment_contract` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `employment_contract`
--

INSERT INTO `employment_contract` (`id`, `name`, `create_at`) VALUES
('1fc7ce20-b325-4d30-b4fb-bb2e5b2583c0', 'Pta. Perm. y Afectado', '2021-10-26 17:32:38'),
('2247edaa-0d3a-422c-b268-0e94561872d8', 'Contratado', '2021-10-26 17:32:38'),
('3723de95-2e24-4384-ab5b-7177ac8d8906', 'Planta Transitoria', '2021-10-26 17:32:38'),
('e1cb8b57-f09d-4a11-8b8c-928953e88e43', 'Planta Permanente', '2021-10-26 17:32:38'),
('ef23723d-793b-4c74-abe0-a867d22d2c05', 'Pta. Trans. y Afectado', '2021-10-26 17:32:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `job_designation`
--

CREATE TABLE `job_designation` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `job_designation`
--

INSERT INTO `job_designation` (`id`, `name`, `create_at`) VALUES
('539fab7c-d0ee-411a-9ab5-e1012ad8ba51', 'Desconocido', '2021-10-26 17:33:59'),
('97f8b030-15b3-11ec-885b-c5cfbd441ecb', 'Educación Especial', '2021-10-26 17:33:59'),
('97f8b256-15b3-11ec-885b-c5cfbd441ecb', 'Fonoaudióloga', '2021-10-26 17:33:59'),
('97f8b457-15b3-11ec-885b-c5cfbd441ecb', 'Ing. Electronica', '2021-10-26 17:33:59'),
('97f8b63b-15b3-11ec-885b-c5cfbd441ecb', 'Ing. en Sistema', '2021-10-26 17:33:59'),
('97f8b8a8-15b3-11ec-885b-c5cfbd441ecb', 'Lic. Comunicación', '2021-10-26 17:33:59'),
('97f8bc00-15b3-11ec-885b-c5cfbd441ecb', 'Lic. en Sistema', '2021-10-26 17:33:59'),
('97f8bf41-15b3-11ec-885b-c5cfbd441ecb', 'Medico', '2021-10-26 17:33:59'),
('97fa0166-15b3-11ec-885b-c5cfbd441ecb', 'Kinesióloga', '2021-10-26 17:33:59'),
('97fa045e-15b3-11ec-885b-c5cfbd441ecb', 'Nutricionista', '2021-10-26 17:33:59'),
('97fa081a-15b3-11ec-885b-c5cfbd441ecb', 'Odontóloga', '2021-10-26 17:33:59'),
('97fa0c83-15b3-11ec-885b-c5cfbd441ecb', 'PSG', '2021-10-26 17:33:59'),
('97fa0e5f-15b3-11ec-885b-c5cfbd441ecb', 'Periodista', '2021-10-26 17:33:59'),
('97fa1044-15b3-11ec-885b-c5cfbd441ecb', 'Promotor', '2021-10-26 17:33:59'),
('97fa123a-15b3-11ec-885b-c5cfbd441ecb', 'Lic. en Psicologia', '2021-10-26 17:33:59'),
('97fa143b-15b3-11ec-885b-c5cfbd441ecb', 'Lic. en Psicopedagogia', '2021-10-26 17:33:59'),
('97fa164b-15b3-11ec-885b-c5cfbd441ecb', 'Profesor', '2021-10-26 17:33:59'),
('97fa1921-15b3-11ec-885b-c5cfbd441ecb', 'Prof. Psicopedagogia', '2021-10-26 17:33:59'),
('97fa1b2d-15b3-11ec-885b-c5cfbd441ecb', 'Tec. en Sistema', '2021-10-26 17:33:59'),
('97fa1d1a-15b3-11ec-885b-c5cfbd441ecb', 'Trab. Social', '2021-10-26 17:33:59'),
('97fa1f0a-15b3-11ec-885b-c5cfbd441ecb', 'Terapista Ocupacional', '2021-10-26 17:33:59'),
('97fa2310-15b3-11ec-885b-c5cfbd441ecb', 'Estudiante de Medicina', '2021-10-26 17:33:59'),
('97fa2517-15b3-11ec-885b-c5cfbd441ecb', 'Vacunaciòn', '2021-10-26 17:33:59'),
('97fa26f9-15b3-11ec-885b-c5cfbd441ecb', 'Lic. en Ciencias de la Educación', '2021-10-26 17:33:59'),
('97fa28f9-15b3-11ec-885b-c5cfbd441ecb', 'Coord.-Adm. de Emp.', '2021-10-26 17:33:59'),
('97fa2ae0-15b3-11ec-885b-c5cfbd441ecb', 'Contador', '2021-10-26 17:33:59'),
('97fa2ccd-15b3-11ec-885b-c5cfbd441ecb', 'Data Enter', '2021-10-26 17:33:59'),
('97fa2ed7-15b3-11ec-885b-c5cfbd441ecb', 'Docente Apoyo', '2021-10-26 17:33:59'),
('97fa3078-15b3-11ec-885b-c5cfbd441ecb', 'Edu. Diferen.', '2021-10-26 17:33:59');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `learning_support_team`
--

CREATE TABLE `learning_support_team` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `manager` char(36) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `office_of_learning_support_id` char(36) NOT NULL,
  `learning_support_team_category_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `learning_support_team`
--

INSERT INTO `learning_support_team` (`id`, `name`, `manager`, `create_at`, `office_of_learning_support_id`, `learning_support_team_category_id`) VALUES
('0c073265-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Este Turno Mañana', '61cd05fa-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd802e94-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c07545e-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 10', NULL, '2021-10-26 17:35:02', 'cd803653-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c077590-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 11', NULL, '2021-10-26 17:35:02', 'cd8038da-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c098089-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 12', NULL, '2021-10-26 17:35:02', 'cd803af2-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 13', NULL, '2021-10-26 17:35:02', 'cd803ced-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0aa86a-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 14', NULL, '2021-10-26 17:35:02', 'cd803f57-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ab747-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 15', NULL, '2021-10-26 17:35:02', 'cd804189-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0acb9f-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 16', NULL, '2021-10-26 17:35:02', 'cd804352-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ae26c-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 17', NULL, '2021-10-26 17:35:02', 'cd804541-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 18', NULL, '2021-10-26 17:35:02', 'cd8485db-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0aff8d-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 19', NULL, '2021-10-26 17:35:02', 'cd848abf-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0b1926-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Sur Turno Mañana', '61c90b0b-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd848f1a-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0c7789-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 20', NULL, '2021-10-26 17:35:02', 'cd849375-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0c9c80-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 21', NULL, '2021-10-26 17:35:02', 'cd8496b1-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ca021-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 22', NULL, '2021-10-26 17:35:02', 'cd849975-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ca41e-3682-11ec-88b9-c6d3d0998ffd', 'Salud Escolar Zona Centro Turno Mañana', NULL, '2021-10-26 17:35:02', 'cd857049-367a-11ec-88b9-c6d3d0998ffd', 'f2ede275-3678-11ec-88b9-c6d3d0998ffd'),
('0c0cad80-3682-11ec-88b9-c6d3d0998ffd', 'Salud Escolar Zona Norte Turno Mañana', '61cb4fd2-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd857785-367a-11ec-88b9-c6d3d0998ffd', 'f2ede275-3678-11ec-88b9-c6d3d0998ffd'),
('0c0cb694-3682-11ec-88b9-c6d3d0998ffd', 'Responsables Operativos del Programa Crecer Sanos', NULL, '2021-10-26 17:35:02', 'cd857b9a-367a-11ec-88b9-c6d3d0998ffd', 'f2ede756-3678-11ec-88b9-c6d3d0998ffd'),
('0c0cbaa1-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Técnico', NULL, '2021-10-26 17:35:02', 'cd857e82-367a-11ec-88b9-c6d3d0998ffd', 'f2ede756-3678-11ec-88b9-c6d3d0998ffd'),
('0c0cc2e2-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Técnico - Interior', NULL, '2021-10-26 17:35:02', 'cd8581a4-367a-11ec-88b9-c6d3d0998ffd', 'f2ede756-3678-11ec-88b9-c6d3d0998ffd'),
('0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Centro Turno Mañana', '61ce4834-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd85846f-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0cdb98-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Área Informática', NULL, '2021-10-26 17:35:02', 'cd8587ff-367a-11ec-88b9-c6d3d0998ffd', 'f2ede756-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ce3ec-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Área Administración-Contable-Legal', NULL, '2021-10-26 17:35:02', 'cd858aa2-367a-11ec-88b9-c6d3d0998ffd', 'f2ede756-3678-11ec-88b9-c6d3d0998ffd'),
('0c0d56e9-3682-11ec-88b9-c6d3d0998ffd', 'Salud Escolar Zona Sur Turno Mañana', '61cbbe2e-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd858d44-367a-11ec-88b9-c6d3d0998ffd', 'f2ede275-3678-11ec-88b9-c6d3d0998ffd'),
('0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Oeste Turno Mañana', '61ce8364-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd8590cf-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0d73d8-3682-11ec-88b9-c6d3d0998ffd', ' - Sin Equipo -', NULL, '2021-10-26 17:35:02', 'cd85945d-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Sur Turno Tarde', '61cd6fef-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd848f1a-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0db773-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Oeste Turno Tarde', '61ce5f40-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd8590cf-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0dcd7e-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Tecnico Central', NULL, '2021-10-26 17:35:02', 'cd85988c-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0dd3c7-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Tecnico Central Turno Tarde', NULL, '2021-10-26 17:35:02', 'cd85988c-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0dd925-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Este Turno Tarde', NULL, '2021-10-26 17:35:02', 'cd802e94-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0debfa-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Centro Turno Tarde', '61ce2e2a-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd85846f-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0e0042-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Norte Turno Tarde', '61cfc45d-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd859c7f-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0e1671-3682-11ec-88b9-c6d3d0998ffd', 'Salud Escolar Zona Norte Turno Tarde', '61cbd4e4-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd857785-367a-11ec-88b9-c6d3d0998ffd', 'f2ede275-3678-11ec-88b9-c6d3d0998ffd'),
('0c0e1e6f-3682-11ec-88b9-c6d3d0998ffd', 'Salud Escolar Zona Sur Turno Tarde', '61d00ec6-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd858d44-367a-11ec-88b9-c6d3d0998ffd', 'f2ede275-3678-11ec-88b9-c6d3d0998ffd'),
('0c0e2654-3682-11ec-88b9-c6d3d0998ffd', 'Salud Escolar Zona Centro Turno Tarde', NULL, '2021-10-26 17:35:02', 'cd857049-367a-11ec-88b9-c6d3d0998ffd', 'f2ede275-3678-11ec-88b9-c6d3d0998ffd'),
('0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd', 'Equipo Zona Norte Turno Mañana', '61cee35a-343a-11ec-880f-c4cbacfef3c6', '2021-10-26 17:35:02', 'cd859c7f-367a-11ec-88b9-c6d3d0998ffd', 'f2ece027-3678-11ec-88b9-c6d3d0998ffd'),
('0c0e483c-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 7', NULL, '2021-10-26 17:35:02', 'cd85a039-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ede7a-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 8', NULL, '2021-10-26 17:35:02', 'cd85a315-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd'),
('0c0ef897-3682-11ec-88b9-c6d3d0998ffd', 'Equipo N° 9', NULL, '2021-10-26 17:35:02', 'cd85a5f2-367a-11ec-88b9-c6d3d0998ffd', 'f2eced38-3678-11ec-88b9-c6d3d0998ffd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `learning_support_team_category`
--

CREATE TABLE `learning_support_team_category` (
  `id` char(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `learning_support_team_category`
--

INSERT INTO `learning_support_team_category` (`id`, `name`, `create_at`) VALUES
('f2ece027-3678-11ec-88b9-c6d3d0998ffd', 'Capital', '2021-10-26 17:39:08'),
('f2eced38-3678-11ec-88b9-c6d3d0998ffd', 'Interior', '2021-10-26 17:39:08'),
('f2ede275-3678-11ec-88b9-c6d3d0998ffd', 'Equipos de Salud', '2021-10-26 17:39:08'),
('f2ede756-3678-11ec-88b9-c6d3d0998ffd', 'Equipo Tecnico', '2021-10-26 17:39:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `office_of_learning_support`
--

CREATE TABLE `office_of_learning_support` (
  `id` char(36) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `office_of_learning_support_in_district_id` char(36) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `office_of_learning_support`
--

INSERT INTO `office_of_learning_support` (`id`, `address`, `phone`, `office_of_learning_support_in_district_id`, `create_at`) VALUES
('cd802e94-367a-11ec-88b9-c6d3d0998ffd', 'Roque Sáenz Peña N°299 B° Santa Justina', '4425735', 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd803653-367a-11ec-88b9-c6d3d0998ffd', 'Hospital de Portezuelo', NULL, 'e68e9431-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd8038da-367a-11ec-88b9-c6d3d0998ffd', 'Mendoza Bº Tres Esquinas', NULL, 'e68e9764-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd803af2-367a-11ec-88b9-c6d3d0998ffd', 'CIC (Ulapes)', NULL, 'e68e99d8-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd803ced-367a-11ec-88b9-c6d3d0998ffd', 'CIC de Aminga', NULL, 'e68e9b8a-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd803f57-367a-11ec-88b9-c6d3d0998ffd', 'Centro Vecinal (Los Robles)', NULL, 'e68e9d24-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd804189-367a-11ec-88b9-c6d3d0998ffd', 'Hosp. Sta. R. de Lima (Patquía)', NULL, 'e68e9eb9-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd804352-367a-11ec-88b9-c6d3d0998ffd', 'Hospital  Distrital (guandacol)', NULL, 'e68ea24f-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd804541-367a-11ec-88b9-c6d3d0998ffd', 'Hosp. Ramon Martinez (Vinchina)', NULL, 'e68ea3f0-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd8485db-367a-11ec-88b9-c6d3d0998ffd', 'Avda. Emilio de la Vega S/N', NULL, 'e68ea584-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd848abf-367a-11ec-88b9-c6d3d0998ffd', 'CPS San Pio (Aimogasta)', NULL, 'e68ea715-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd848f1a-367a-11ec-88b9-c6d3d0998ffd', 'Centro Administ. Pcial (CAP)', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd849375-367a-11ec-88b9-c6d3d0998ffd', 'G. Pp. T Gordillo 50 (Chilecito)', NULL, 'e68ea8a6-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd8496b1-367a-11ec-88b9-c6d3d0998ffd', NULL, NULL, 'e68eaa33-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd849975-367a-11ec-88b9-c6d3d0998ffd', 'Escuela N° 8 Pcia de Formosa', NULL, 'e68eabc4-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd857049-367a-11ec-88b9-c6d3d0998ffd', NULL, NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd857785-367a-11ec-88b9-c6d3d0998ffd', NULL, NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd857b9a-367a-11ec-88b9-c6d3d0998ffd', 'Centro Administ. Pcial (CAP)', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd857e82-367a-11ec-88b9-c6d3d0998ffd', 'Centro Administ. Pcial (CAP)', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd8581a4-367a-11ec-88b9-c6d3d0998ffd', 'Centro Administ. Pcial (CAP)', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd85846f-367a-11ec-88b9-c6d3d0998ffd', 'Juan Bautista Alberdi 872', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd8587ff-367a-11ec-88b9-c6d3d0998ffd', 'Centro Administ. Pcial (CAP)', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd858aa2-367a-11ec-88b9-c6d3d0998ffd', 'Centro Administ. Pcial (CAP)', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd858d44-367a-11ec-88b9-c6d3d0998ffd', 'Centro Administ. Pcial (CAP)', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd8590cf-367a-11ec-88b9-c6d3d0998ffd', 'República Argentina N° 154 B° Panamericano', '4439386', 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd85945d-367a-11ec-88b9-c6d3d0998ffd', NULL, NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd85988c-367a-11ec-88b9-c6d3d0998ffd', 'Cap', NULL, 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd859c7f-367a-11ec-88b9-c6d3d0998ffd', 'Cerro Ambato y Av. 2 de Abril', '4458560', 'e68d84f7-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd85a039-367a-11ec-88b9-c6d3d0998ffd', 'Kolping S/N Ex jardin N° 8', NULL, 'e68ead5b-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd85a315-367a-11ec-88b9-c6d3d0998ffd', 'Edif. De los Bomberos) Ex Hospital', NULL, 'e68eaef8-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24'),
('cd85a5f2-367a-11ec-88b9-c6d3d0998ffd', 'CIC (Milagro)', NULL, 'e68eb085-367e-11ec-88b9-c6d3d0998ffd', '2021-10-26 17:37:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `office_of_learning_support_in_district`
--

CREATE TABLE `office_of_learning_support_in_district` (
  `id` char(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `office_of_learning_support_in_district`
--

INSERT INTO `office_of_learning_support_in_district` (`id`, `name`, `create_at`) VALUES
('e68d84f7-367e-11ec-88b9-c6d3d0998ffd', 'Capital', '2021-10-26 17:39:51'),
('e68e9431-367e-11ec-88b9-c6d3d0998ffd', 'Malanzán', '2021-10-26 17:39:51'),
('e68e9764-367e-11ec-88b9-c6d3d0998ffd', 'Chamical', '2021-10-26 17:39:51'),
('e68e99d8-367e-11ec-88b9-c6d3d0998ffd', 'Ulapes', '2021-10-26 17:39:51'),
('e68e9b8a-367e-11ec-88b9-c6d3d0998ffd', 'Anillaco', '2021-10-26 17:39:51'),
('e68e9d24-367e-11ec-88b9-c6d3d0998ffd', 'Los Sauces', '2021-10-26 17:39:51'),
('e68e9eb9-367e-11ec-88b9-c6d3d0998ffd', 'Patquia', '2021-10-26 17:39:51'),
('e68ea24f-367e-11ec-88b9-c6d3d0998ffd', 'Villa Unión', '2021-10-26 17:39:51'),
('e68ea3f0-367e-11ec-88b9-c6d3d0998ffd', 'Vinchina', '2021-10-26 17:39:51'),
('e68ea584-367e-11ec-88b9-c6d3d0998ffd', 'Famatina', '2021-10-26 17:39:51'),
('e68ea715-367e-11ec-88b9-c6d3d0998ffd', 'Arauco', '2021-10-26 17:39:51'),
('e68ea8a6-367e-11ec-88b9-c6d3d0998ffd', 'Chilecito', '2021-10-26 17:39:51'),
('e68eaa33-367e-11ec-88b9-c6d3d0998ffd', 'Tama', '2021-10-26 17:39:51'),
('e68eabc4-367e-11ec-88b9-c6d3d0998ffd', 'Villa Castelli', '2021-10-26 17:39:51'),
('e68ead5b-367e-11ec-88b9-c6d3d0998ffd', 'Chepes', '2021-10-26 17:39:51'),
('e68eaef8-367e-11ec-88b9-c6d3d0998ffd', 'Olta', '2021-10-26 17:39:51'),
('e68eb085-367e-11ec-88b9-c6d3d0998ffd', 'Milagro', '2021-10-26 17:39:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `description`) VALUES
('ROLE_ADMIN', 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `school_assisted_by_learning_support_team`
--

CREATE TABLE `school_assisted_by_learning_support_team` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `school_assisted_by_learning_support_team`
--

INSERT INTO `school_assisted_by_learning_support_team` (`id`, `name`, `number`, `create_at`) VALUES
('f6f62746-35bf-11ec-8937-c7d9eb0d7e4f', 'Sarmiento', '191', '2021-10-26 17:40:50'),
('f6f62d54-35bf-11ec-8937-c7d9eb0d7e4f', 'La Cañada', '386', '2021-10-26 17:40:50'),
('f6f63095-35bf-11ec-8937-c7d9eb0d7e4f', 'Bajo Hondo', '214', '2021-10-26 17:40:50'),
('f6f632a5-35bf-11ec-8937-c7d9eb0d7e4f', 'Monte Negro', '373', '2021-10-26 17:40:50'),
('f6f635c7-35bf-11ec-8937-c7d9eb0d7e4f', 'Catuna', '13', '2021-10-26 17:40:50'),
('f6f637c0-35bf-11ec-8937-c7d9eb0d7e4f', 'UTN', NULL, '2021-10-26 17:40:50'),
('f6f639b3-35bf-11ec-8937-c7d9eb0d7e4f', 'Esquina Grande ', '81', '2021-10-26 17:40:50'),
('f6f63b9f-35bf-11ec-8937-c7d9eb0d7e4f', 'Olpas ', '85', '2021-10-26 17:40:50'),
('f6f63d81-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Aguirres ', '86', '2021-10-26 17:40:50'),
('f6f63f5d-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Alaníz - Sergio S. Sosa', '87', '2021-10-26 17:40:50'),
('f6f6413e-35bf-11ec-8937-c7d9eb0d7e4f', 'San Ramón ', '88', '2021-10-26 17:40:50'),
('f6f6431d-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Tellos - Nic. del V. Flores de A.', '93', '2021-10-26 17:40:50'),
('f6f644fd-35bf-11ec-8937-c7d9eb0d7e4f', 'La Isla ', '100', '2021-10-26 17:40:50'),
('f6f646da-35bf-11ec-8937-c7d9eb0d7e4f', 'La Dorada ', '101', '2021-10-26 17:40:50'),
('f6f648b1-35bf-11ec-8937-c7d9eb0d7e4f', 'El Fraile ', '102', '2021-10-26 17:40:50'),
('f6f64a88-35bf-11ec-8937-c7d9eb0d7e4f', 'La Playa ', '111', '2021-10-26 17:40:50'),
('f6f64c5d-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Torrecitas ', '130', '2021-10-26 17:40:50'),
('f6f64e39-35bf-11ec-8937-c7d9eb0d7e4f', 'El Quemado ', '133', '2021-10-26 17:40:50'),
('f6f6501a-35bf-11ec-8937-c7d9eb0d7e4f', 'Miraflores ', '147', '2021-10-26 17:40:50'),
('f6f651f4-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Mistoles ', '152', '2021-10-26 17:40:50'),
('f6f653c8-35bf-11ec-8937-c7d9eb0d7e4f', 'Ambil - Vitalia B. de Hanos', '156', '2021-10-26 17:40:50'),
('f6f655a3-35bf-11ec-8937-c7d9eb0d7e4f', 'Pozo del Medio ', '158', '2021-10-26 17:40:50'),
('f6f6577e-35bf-11ec-8937-c7d9eb0d7e4f', 'Gestión Comunitaria', NULL, '2021-10-26 17:40:50'),
('f6f65a30-35bf-11ec-8937-c7d9eb0d7e4f', 'El Cerco ', '196', '2021-10-26 17:40:50'),
('f6f65c0b-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Banderitas ', '206', '2021-10-26 17:40:50'),
('f6f65de1-35bf-11ec-8937-c7d9eb0d7e4f', 'S. Cristobal -Ramón E. Bazán', '211', '2021-10-26 17:40:50'),
('f6f65fb7-35bf-11ec-8937-c7d9eb0d7e4f', 'Cortaderas ', '220', '2021-10-26 17:40:50'),
('f6f66197-35bf-11ec-8937-c7d9eb0d7e4f', 'San Pedro ', '223', '2021-10-26 17:40:50'),
('f6f66376-35bf-11ec-8937-c7d9eb0d7e4f', 'Agûadita de los Peralta ', '234', '2021-10-26 17:40:50'),
('f6f6654f-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Barrialitos ', '241', '2021-10-26 17:40:50'),
('f6f66726-35bf-11ec-8937-c7d9eb0d7e4f', 'La Maruja ', '273', '2021-10-26 17:40:50'),
('f6f668ff-35bf-11ec-8937-c7d9eb0d7e4f', 'La Colonia ', '281', '2021-10-26 17:40:50'),
('f6f66ad7-35bf-11ec-8937-c7d9eb0d7e4f', 'La Ripiera ', '360', '2021-10-26 17:40:50'),
('f6f66cad-35bf-11ec-8937-c7d9eb0d7e4f', 'Pje. Río Grande ', '385', '2021-10-26 17:40:50'),
('f6f66edb-35bf-11ec-8937-c7d9eb0d7e4f', 'Solca', '30', '2021-10-26 17:40:50'),
('f6f670db-35bf-11ec-8937-c7d9eb0d7e4f', 'Mollaco', '83', '2021-10-26 17:40:50'),
('f6f6730c-35bf-11ec-8937-c7d9eb0d7e4f', 'La Chimenea', '89', '2021-10-26 17:40:50'),
('f6f67571-35bf-11ec-8937-c7d9eb0d7e4f', 'La Loma', '90', '2021-10-26 17:40:50'),
('f6f8fd2a-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Algarrobos', '104', '2021-10-26 17:40:50'),
('f6f90169-35bf-11ec-8937-c7d9eb0d7e4f', 'Atiles', '120', '2021-10-26 17:40:50'),
('f6f9065c-35bf-11ec-8937-c7d9eb0d7e4f', 'Malanzan', '269', '2021-10-26 17:40:50'),
('f6f90885-35bf-11ec-8937-c7d9eb0d7e4f', 'El Unquillar', '315', '2021-10-26 17:40:50'),
('f6f90a9e-35bf-11ec-8937-c7d9eb0d7e4f', 'Casangate', '351', '2021-10-26 17:40:50'),
('f6f90d42-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Tres Cruces', '380', '2021-10-26 17:40:50'),
('f6f90f86-35bf-11ec-8937-c7d9eb0d7e4f', 'Mascasin', '402', '2021-10-26 17:40:50'),
('f6f911b5-35bf-11ec-8937-c7d9eb0d7e4f', 'Santa Maria', '367', '2021-10-26 17:40:50'),
('f6f913e5-35bf-11ec-8937-c7d9eb0d7e4f', 'San Antonio', '49', '2021-10-26 17:40:50'),
('f6f91615-35bf-11ec-8937-c7d9eb0d7e4f', 'Salana', '50', '2021-10-26 17:40:50'),
('f6f9183f-35bf-11ec-8937-c7d9eb0d7e4f', 'El Portezuelo', '91', '2021-10-26 17:40:50'),
('f6f91a69-35bf-11ec-8937-c7d9eb0d7e4f', 'Tuani', '105', '2021-10-26 17:40:50'),
('f6f91ce0-35bf-11ec-8937-c7d9eb0d7e4f', 'Retamal', '145', '2021-10-26 17:40:50'),
('f6f91ef5-35bf-11ec-8937-c7d9eb0d7e4f', 'El Potrero', '181', '2021-10-26 17:40:50'),
('f6f92107-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Barracas', '183', '2021-10-26 17:40:50'),
('f6f92316-35bf-11ec-8937-c7d9eb0d7e4f', 'Puluchan', '274', '2021-10-26 17:40:50'),
('f6f925a7-35bf-11ec-8937-c7d9eb0d7e4f', 'El Porongo', '275', '2021-10-26 17:40:50'),
('f6f927d1-35bf-11ec-8937-c7d9eb0d7e4f', 'San Pedro', '310', '2021-10-26 17:40:50'),
('f6f92a02-35bf-11ec-8937-c7d9eb0d7e4f', 'Paraje Rio Las Cañas', '388', '2021-10-26 17:40:50'),
('f6f92c3a-35bf-11ec-8937-c7d9eb0d7e4f', 'Balde de Amaya', '393', '2021-10-26 17:40:50'),
('f6f92e67-35bf-11ec-8937-c7d9eb0d7e4f', 'El Potrerillo', '404', '2021-10-26 17:40:50'),
('f6f93091-35bf-11ec-8937-c7d9eb0d7e4f', 'El Carrizalillo', '238', '2021-10-26 17:40:50'),
('f6f932c1-35bf-11ec-8937-c7d9eb0d7e4f', 'Tosquia', '313', '2021-10-26 17:40:50'),
('f6f93552-35bf-11ec-8937-c7d9eb0d7e4f', 'Illisca', '347', '2021-10-26 17:40:50'),
('f6f937ca-35bf-11ec-8937-c7d9eb0d7e4f', 'San Ramon', '318', '2021-10-26 17:40:50'),
('f6f93a59-35bf-11ec-8937-c7d9eb0d7e4f', 'Pvcia.de Corrientes', '151', '2021-10-26 17:40:50'),
('f6f93c69-35bf-11ec-8937-c7d9eb0d7e4f', 'Sta. Lucía', '12', '2021-10-26 17:40:50'),
('f6f93ed2-35bf-11ec-8937-c7d9eb0d7e4f', 'Chulo', '31', '2021-10-26 17:40:50'),
('f6f94197-35bf-11ec-8937-c7d9eb0d7e4f', 'Polco - Delina Elizondo', '75', '2021-10-26 17:40:50'),
('f6f94409-35bf-11ec-8937-c7d9eb0d7e4f', 'Esq. Del Norte', '76', '2021-10-26 17:40:50'),
('f6f94626-35bf-11ec-8937-c7d9eb0d7e4f', 'La Cortada', '134', '2021-10-26 17:40:50'),
('f6f94842-35bf-11ec-8937-c7d9eb0d7e4f', 'El Quebrachal', '182', '2021-10-26 17:40:50'),
('f6f94be8-35bf-11ec-8937-c7d9eb0d7e4f', 'La Serena - Cbo. Ppal Darío', '217', '2021-10-26 17:40:50'),
('f6f94e51-35bf-11ec-8937-c7d9eb0d7e4f', 'Sta Rita de la Zanja', '236', '2021-10-26 17:40:50'),
('f6f950c3-35bf-11ec-8937-c7d9eb0d7e4f', 'Rosario Vera Peñaloza', '258', '2021-10-26 17:40:50'),
('f6f953df-35bf-11ec-8937-c7d9eb0d7e4f', 'Pbtro. Luis Torres Molina', '264', '2021-10-26 17:40:50'),
('f6f956d1-35bf-11ec-8937-c7d9eb0d7e4f', 'Sta. Barbara', '286', '2021-10-26 17:40:50'),
('f6f95b05-35bf-11ec-8937-c7d9eb0d7e4f', 'El Retamo', '294', '2021-10-26 17:40:50'),
('f6fb26fe-35bf-11ec-8937-c7d9eb0d7e4f', 'La Aguadita', '300', '2021-10-26 17:40:50'),
('f6fb2947-35bf-11ec-8937-c7d9eb0d7e4f', 'La Invernada -  José de Ugarteche', '304', '2021-10-26 17:40:50'),
('f6fb2be4-35bf-11ec-8937-c7d9eb0d7e4f', 'Bajo de Lucas - Vicente Almonacid', '307', '2021-10-26 17:40:50'),
('f6fb2e39-35bf-11ec-8937-c7d9eb0d7e4f', 'La Resistencia', '312', '2021-10-26 17:40:50'),
('f6fb33aa-35bf-11ec-8937-c7d9eb0d7e4f', 'Villa Carmela', '319', '2021-10-26 17:40:50'),
('f6fb3614-35bf-11ec-8937-c7d9eb0d7e4f', 'Paraje Pozo de la Vaca', '321', '2021-10-26 17:40:50'),
('f6fb3850-35bf-11ec-8937-c7d9eb0d7e4f', 'El Garabato - Cnel. Pringles', '328', '2021-10-26 17:40:50'),
('f6fb3a85-35bf-11ec-8937-c7d9eb0d7e4f', 'El Mollar', '329', '2021-10-26 17:40:50'),
('f6fb3cbe-35bf-11ec-8937-c7d9eb0d7e4f', 'Pozo Redondo', '348', '2021-10-26 17:40:50'),
('f6fb3ef8-35bf-11ec-8937-c7d9eb0d7e4f', 'San Fco. de los Bordos', '349', '2021-10-26 17:40:50'),
('f6fb4130-35bf-11ec-8937-c7d9eb0d7e4f', 'San Rafael', '24', '2021-10-26 17:40:50'),
('f6fb4368-35bf-11ec-8937-c7d9eb0d7e4f', 'Aguayo', '205', '2021-10-26 17:40:50'),
('f6fb459c-35bf-11ec-8937-c7d9eb0d7e4f', 'El Buen Retiro', '229', '2021-10-26 17:40:50'),
('f6fb47d2-35bf-11ec-8937-c7d9eb0d7e4f', 'La Industria', '356', '2021-10-26 17:40:50'),
('f6fb4a05-35bf-11ec-8937-c7d9eb0d7e4f', 'La Lila', '363', '2021-10-26 17:40:50'),
('f6fb4c3f-35bf-11ec-8937-c7d9eb0d7e4f', ' San Solano', '42', '2021-10-26 17:40:50'),
('f6fb4e78-35bf-11ec-8937-c7d9eb0d7e4f', ' Villa Nidia', '112', '2021-10-26 17:40:50'),
('f6fb50ad-35bf-11ec-8937-c7d9eb0d7e4f', ' Nueva Esperanza', '116', '2021-10-26 17:40:50'),
('f6fb52df-35bf-11ec-8937-c7d9eb0d7e4f', ' El Catorce', '139', '2021-10-26 17:40:50'),
('f6fb5590-35bf-11ec-8937-c7d9eb0d7e4f', ' Corral de Isaac', '148', '2021-10-26 17:40:50'),
('f6fb58b3-35bf-11ec-8937-c7d9eb0d7e4f', ' El Abra', '149', '2021-10-26 17:40:50'),
('f6fb5aec-35bf-11ec-8937-c7d9eb0d7e4f', ' Bajo Hondo', '150', '2021-10-26 17:40:50'),
('f6fe3ba9-35bf-11ec-8937-c7d9eb0d7e4f', ' La Represa', '165', '2021-10-26 17:40:50'),
('f6fe4027-35bf-11ec-8937-c7d9eb0d7e4f', ' Siempre Verde', '185', '2021-10-26 17:40:50'),
('f6fe444b-35bf-11ec-8937-c7d9eb0d7e4f', ' El Cadillo', '187', '2021-10-26 17:40:50'),
('f6fe4680-35bf-11ec-8937-c7d9eb0d7e4f', ' Cuatro Esquinas', '207', '2021-10-26 17:40:50'),
('f6fe4893-35bf-11ec-8937-c7d9eb0d7e4f', ' Puesto Dichoso', '226', '2021-10-26 17:40:50'),
('f6fe4aaa-35bf-11ec-8937-c7d9eb0d7e4f', 'Herrera Robledo', '287', '2021-10-26 17:40:50'),
('f6fe4cb3-35bf-11ec-8937-c7d9eb0d7e4f', 'Benjamín de la Vega', '243', '2021-10-26 17:40:50'),
('f6fe4eb9-35bf-11ec-8937-c7d9eb0d7e4f', ' Baldecito', '272', '2021-10-26 17:40:50'),
('f6fe51c9-35bf-11ec-8937-c7d9eb0d7e4f', ' Balde de la Viuda', '283', '2021-10-26 17:40:50'),
('f6fe569d-35bf-11ec-8937-c7d9eb0d7e4f', ' La Lomita', '288', '2021-10-26 17:40:50'),
('f6fe59dc-35bf-11ec-8937-c7d9eb0d7e4f', ' Las Ventanitas', '303', '2021-10-26 17:40:50'),
('f6fe5c92-35bf-11ec-8937-c7d9eb0d7e4f', ' La Suspensión', '317', '2021-10-26 17:40:50'),
('f6fe5f0e-35bf-11ec-8937-c7d9eb0d7e4f', ' Virgen del Valle', '322', '2021-10-26 17:40:50'),
('f6fe61aa-35bf-11ec-8937-c7d9eb0d7e4f', ' Isla del Tigre', '355', '2021-10-26 17:40:50'),
('f6fe63dd-35bf-11ec-8937-c7d9eb0d7e4f', ' Entre Ríos', '357', '2021-10-26 17:40:50'),
('f6fe65f7-35bf-11ec-8937-c7d9eb0d7e4f', ' La Represita', '374', '2021-10-26 17:40:50'),
('f6feb9b1-35bf-11ec-8937-c7d9eb0d7e4f', ' Tres de Mayo', '390', '2021-10-26 17:40:50'),
('f6febce2-35bf-11ec-8937-c7d9eb0d7e4f', 'Francisco Telechea', '244', '2021-10-26 17:40:50'),
('f6fec059-35bf-11ec-8937-c7d9eb0d7e4f', 'Aminga - Domingo Matheu', '19', '2021-10-26 17:40:50'),
('f6fec290-35bf-11ec-8937-c7d9eb0d7e4f', 'B. Rivadavia', '57', '2021-10-26 17:40:50'),
('f6fec496-35bf-11ec-8937-c7d9eb0d7e4f', 'Anillaco -Crnl. N. Barros', '103', '2021-10-26 17:40:50'),
('f6fec6a2-35bf-11ec-8937-c7d9eb0d7e4f', 'Sta. Cruz -V. del Rosario de S. N.', '137', '2021-10-26 17:40:50'),
('f6fec8c4-35bf-11ec-8937-c7d9eb0d7e4f', 'Anjullón - Belinda de la Fuente', '270', '2021-10-26 17:40:50'),
('f6fecac3-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Peñas - Victor A. Ledesma', '23', '2021-10-26 17:40:50'),
('f6feccc1-35bf-11ec-8937-c7d9eb0d7e4f', 'Agua Blanca - E. Torres de Sufán', '140', '2021-10-26 17:40:50'),
('f6fecec0-35bf-11ec-8937-c7d9eb0d7e4f', 'Chaupihuasi - Filomena Navarro de Góndola', '44', '2021-10-26 17:40:50'),
('f6fed0bc-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Robles -Soberanía Arg.', '62', '2021-10-26 17:40:50'),
('f6fed2dd-35bf-11ec-8937-c7d9eb0d7e4f', 'Surillaco - Mtro Guillermo Ríos', '63', '2021-10-26 17:40:50'),
('f6fed4dd-35bf-11ec-8937-c7d9eb0d7e4f', 'San Francisco', '247', '2021-10-26 17:40:50'),
('f6fed5f8-35bf-11ec-8937-c7d9eb0d7e4f', 'Alpasinche - De Retiro', '118', '2021-10-26 17:40:50'),
('f6fed7f1-35bf-11ec-8937-c7d9eb0d7e4f', 'Tuyubil', '142', '2021-10-26 17:40:50'),
('f6fed9f8-35bf-11ec-8937-c7d9eb0d7e4f', 'Schaqui - Flaviano de la Colina', '277', '2021-10-26 17:40:50'),
('f6fedbf7-35bf-11ec-8937-c7d9eb0d7e4f', 'Alcázar', '78', '2021-10-26 17:40:50'),
('f6feddfa-35bf-11ec-8937-c7d9eb0d7e4f', 'Chila', '79', '2021-10-26 17:40:50'),
('f6fedff7-35bf-11ec-8937-c7d9eb0d7e4f', 'Tama', '80', '2021-10-26 17:40:50'),
('f6fee1ee-35bf-11ec-8937-c7d9eb0d7e4f', 'Tuizón', '119', '2021-10-26 17:40:50'),
('f6fee3e8-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Huertas', '121', '2021-10-26 17:40:50'),
('f6fee5de-35bf-11ec-8937-c7d9eb0d7e4f', 'Pta de los Llanos', '168', '2021-10-26 17:40:50'),
('f6fee7d9-35bf-11ec-8937-c7d9eb0d7e4f', 'Carrizal', '171', '2021-10-26 17:40:50'),
('f6fee9df-35bf-11ec-8937-c7d9eb0d7e4f', 'Bartolomé Mitre', '250', '2021-10-26 17:40:50'),
('f6feebda-35bf-11ec-8937-c7d9eb0d7e4f', 'Pacatala', '228', '2021-10-26 17:40:50'),
('f6feedd0-35bf-11ec-8937-c7d9eb0d7e4f', 'Tazquín', '279', '2021-10-26 17:40:50'),
('f6feefcf-35bf-11ec-8937-c7d9eb0d7e4f', 'El Monte', '311', '2021-10-26 17:40:50'),
('f6fef1c3-35bf-11ec-8937-c7d9eb0d7e4f', 'Angel V. Peñaloza', '318', '2021-10-26 17:40:50'),
('f6fef3b9-35bf-11ec-8937-c7d9eb0d7e4f', 'Arturo M. Bass', '327', '2021-10-26 17:40:50'),
('f6fef5ae-35bf-11ec-8937-c7d9eb0d7e4f', 'Bajo Verde', '346', '2021-10-26 17:40:50'),
('f6fef7a6-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Aguaditas', '366', '2021-10-26 17:40:50'),
('f6fef9a6-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Higueras', '381', '2021-10-26 17:40:50'),
('f6fefba3-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Lomitas', '391', '2021-10-26 17:40:50'),
('f6fefd98-35bf-11ec-8937-c7d9eb0d7e4f', ' Alicia Carrizo', '18', '2021-10-26 17:40:50'),
('f6feffa0-35bf-11ec-8937-c7d9eb0d7e4f', 'Pio XII', '263', '2021-10-26 17:40:50'),
('f6ff00bf-35bf-11ec-8937-c7d9eb0d7e4f', ' Guandacol - Herrera Robledo', '28', '2021-10-26 17:40:50'),
('f6ff02bb-35bf-11ec-8937-c7d9eb0d7e4f', ' Los Palacios - Wolf Scholnik', '70', '2021-10-26 17:40:50'),
('f6ff04b4-35bf-11ec-8937-c7d9eb0d7e4f', ' Gullermo Páez', '352', '2021-10-26 17:40:50'),
('f6ff06a8-35bf-11ec-8937-c7d9eb0d7e4f', 'Sta. Clara  - Fronteras Arg.', '21', '2021-10-26 17:40:50'),
('f6ff08a1-35bf-11ec-8937-c7d9eb0d7e4f', 'Paso San Isidro  -Adela R.Sánchez', '52', '2021-10-26 17:40:50'),
('f6ff0a9d-35bf-11ec-8937-c7d9eb0d7e4f', 'Aicuña - Arsenio Salinas', '68', '2021-10-26 17:40:50'),
('f6ff0c94-35bf-11ec-8937-c7d9eb0d7e4f', 'Pagancillo - Gerónimo Flores', '69', '2021-10-26 17:40:50'),
('f6ff0e8b-35bf-11ec-8937-c7d9eb0d7e4f', 'La Banda Florida - Andrea Páez Orquera', '71', '2021-10-26 17:40:50'),
('f6ff1086-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Tambillos - Luis Camilo Seida', '109', '2021-10-26 17:40:50'),
('f6ff127a-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Nacimientos - R. Vera Peñaloza', '125', '2021-10-26 17:40:50'),
('f6ff1470-35bf-11ec-8937-c7d9eb0d7e4f', 'Sagrado Corazón de Jesús', '254', '2021-10-26 17:40:50'),
('f6ff158c-35bf-11ec-8937-c7d9eb0d7e4f', 'La Maravilla - José A. Quiroga Soaje', '135', '2021-10-26 17:40:50'),
('f6ff1840-35bf-11ec-8937-c7d9eb0d7e4f', 'El Zapallar - Felipe Leandro Ávila', '160', '2021-10-26 17:40:50'),
('f6ff1a75-35bf-11ec-8937-c7d9eb0d7e4f', 'Villa Esther - Club Arg. de Serv.', '209', '2021-10-26 17:40:50'),
('f6ff1cad-35bf-11ec-8937-c7d9eb0d7e4f', 'El Molle - Mtro. Eloy López', '231', '2021-10-26 17:40:50'),
('f6ff1ee5-35bf-11ec-8937-c7d9eb0d7e4f', 'Puerto Alegre - Miguel Stanislao', '278', '2021-10-26 17:40:50'),
('f6ff2118-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Patillos - Fray L. Beltrán', '284', '2021-10-26 17:40:50'),
('f6ff234e-35bf-11ec-8937-c7d9eb0d7e4f', 'El Cardón  - Granadero Vargas', '324', '2021-10-26 17:40:50'),
('f6ff257e-35bf-11ec-8937-c7d9eb0d7e4f', 'Las Cuevas ', '343', '2021-10-26 17:40:50'),
('f6ff27ae-35bf-11ec-8937-c7d9eb0d7e4f', 'Plaza Nueva  -Pcia. de Córdoba', '4', '2021-10-26 17:40:50'),
('f6ff29e0-35bf-11ec-8937-c7d9eb0d7e4f', 'Plaza Vieja  - Miguel Robador', '5', '2021-10-26 17:40:50'),
('f6ff2c1d-35bf-11ec-8937-c7d9eb0d7e4f', 'Gabriela Mistral (JC)', NULL, '2021-10-26 17:40:50'),
('f6ff2d46-35bf-11ec-8937-c7d9eb0d7e4f', 'Bajo Carrizal - R. Agapito Luján', '7', '2021-10-26 17:40:50'),
('f6ff2f70-35bf-11ec-8937-c7d9eb0d7e4f', 'Antinaco - Armada Argentina', '36', '2021-10-26 17:40:50'),
('f6ff8909-35bf-11ec-8937-c7d9eb0d7e4f', 'Alto Carrizal - Ej. Argentino', '47', '2021-10-26 17:40:50'),
('f6ff8be5-35bf-11ec-8937-c7d9eb0d7e4f', 'Pituil', '64', '2021-10-26 17:40:50'),
('f6ff8e14-35bf-11ec-8937-c7d9eb0d7e4f', 'Campanas - Ylda M. de Robles', '65', '2021-10-26 17:40:50'),
('f6ff9032-35bf-11ec-8937-c7d9eb0d7e4f', 'Santa Cruz - Antonio O. Vega', '66', '2021-10-26 17:40:50'),
('f6ff925c-35bf-11ec-8937-c7d9eb0d7e4f', 'Bº de Galli  - Leopoldo Caamaño', '122', '2021-10-26 17:40:50'),
('f6ff946f-35bf-11ec-8937-c7d9eb0d7e4f', 'Sto. Domingo - Escuad. 24 Gend. Nac.', '159', '2021-10-26 17:40:50'),
('f6ff9678-35bf-11ec-8937-c7d9eb0d7e4f', 'Chañarmuyo', '200', '2021-10-26 17:40:50'),
('f6ff9923-35bf-11ec-8937-c7d9eb0d7e4f', 'La Cuadra - Mtra. Ester Funes', '67', '2021-10-26 17:40:50'),
('f6ff9b38-35bf-11ec-8937-c7d9eb0d7e4f', 'Gabriela Mistral (JS)', NULL, '2021-10-26 17:40:50'),
('f6ff9c61-35bf-11ec-8937-c7d9eb0d7e4f', 'Angulos', '204', '2021-10-26 17:40:50'),
('f6ff9e5f-35bf-11ec-8937-c7d9eb0d7e4f', 'Potrerillo - Luis Papinutti', '235', '2021-10-26 17:40:50'),
('f6ffa06d-35bf-11ec-8937-c7d9eb0d7e4f', 'Machigasta', '10', '2021-10-26 17:40:50'),
('f6ffa279-35bf-11ec-8937-c7d9eb0d7e4f', 'Est. Mazán -Pedro I. C. Barros', '33', '2021-10-26 17:40:50'),
('f6ffa478-35bf-11ec-8937-c7d9eb0d7e4f', 'Pcia de Jujuy', '51', '2021-10-26 17:40:50'),
('f6ffa670-35bf-11ec-8937-c7d9eb0d7e4f', 'Villa Mazán - Ricardo Rojas', '141', '2021-10-26 17:40:50'),
('f6ffa876-35bf-11ec-8937-c7d9eb0d7e4f', 'Pcia de Salta', '174', '2021-10-26 17:40:50'),
('f6ffaa7d-35bf-11ec-8937-c7d9eb0d7e4f', 'Pcia de Catamarca', '195', '2021-10-26 17:40:50'),
('f6ffac84-35bf-11ec-8937-c7d9eb0d7e4f', 'Gegoria Matorras de Sn M.', '256', '2021-10-26 17:40:50'),
('f6ffae81-35bf-11ec-8937-c7d9eb0d7e4f', 'Gral. José de Sn Martín', '257', '2021-10-26 17:40:50'),
('f6ffb081-35bf-11ec-8937-c7d9eb0d7e4f', 'Rioja Española', '17', '2021-10-26 17:40:50'),
('f6ffb287-35bf-11ec-8937-c7d9eb0d7e4f', 'Inmaculada Concepción', '336', '2021-10-26 17:40:50'),
('f6ffb484-35bf-11ec-8937-c7d9eb0d7e4f', 'San Antonio', '401', '2021-10-26 17:40:50'),
('f6ffb678-35bf-11ec-8937-c7d9eb0d7e4f', 'Upinango', '61', '2021-10-26 17:40:50'),
('f6ffb87d-35bf-11ec-8937-c7d9eb0d7e4f', 'Bañado de los Pantanos', '108', '2021-10-26 17:40:50'),
('f6ffba86-35bf-11ec-8937-c7d9eb0d7e4f', 'Termas de Sta. Teresita', '233', '2021-10-26 17:40:50'),
('f6ffbc84-35bf-11ec-8937-c7d9eb0d7e4f', 'La Canchita', '240', '2021-10-26 17:40:50'),
('f6ffbe85-35bf-11ec-8937-c7d9eb0d7e4f', 'La Cimbrita - Pedo León Gallo', '297', '2021-10-26 17:40:50'),
('f6ffc07f-35bf-11ec-8937-c7d9eb0d7e4f', 'San Miguel -Pte. J. D. Perón', '107', '2021-10-26 17:40:50'),
('f6ffc283-35bf-11ec-8937-c7d9eb0d7e4f', 'Chilecito - Rodolfo Carmona', '166', '2021-10-26 17:40:50'),
('f6ffc480-35bf-11ec-8937-c7d9eb0d7e4f', 'Anguinán  - U. N. La Plata', '169', '2021-10-26 17:40:50'),
('f6ffc710-35bf-11ec-8937-c7d9eb0d7e4f', 'Loreto de Argüello', '164', '2021-10-26 17:40:50'),
('f6ffca04-35bf-11ec-8937-c7d9eb0d7e4f', 'Chilecito - Maestro Emilio Hünicken', '189', '2021-10-26 17:40:50'),
('f6ffcc0d-35bf-11ec-8937-c7d9eb0d7e4f', 'Nonogasta - Dr. B. Mitre', '194', '2021-10-26 17:40:50'),
('f6ffce13-35bf-11ec-8937-c7d9eb0d7e4f', 'Nonogasta - J. R. de Velazco', '260', '2021-10-26 17:40:50'),
('f6ffd013-35bf-11ec-8937-c7d9eb0d7e4f', 'Chilecito - 9 de Julio', '261', '2021-10-26 17:40:50'),
('f6ffd216-35bf-11ec-8937-c7d9eb0d7e4f', 'Chilecito - Mtro. Fermín Morales', '370', '2021-10-26 17:40:50'),
('f6ffd418-35bf-11ec-8937-c7d9eb0d7e4f', 'Chilecito - Joaquín V. González', NULL, '2021-10-26 17:40:50'),
('f6ffd617-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Sarmientos - M. Pablo Pizzurno', '1', '2021-10-26 17:40:50'),
('f6ffd81b-35bf-11ec-8937-c7d9eb0d7e4f', 'Malligasta - Timoteo Gordillo', '2', '2021-10-26 17:40:50'),
('f6ffda21-35bf-11ec-8937-c7d9eb0d7e4f', 'Nonogasta - Dr. J. V. González', '3', '2021-10-26 17:40:50'),
('f6ffdc27-35bf-11ec-8937-c7d9eb0d7e4f', 'Vichigasta -Sgto. J. B. Cabra', '6', '2021-10-26 17:40:50'),
('f6ffde30-35bf-11ec-8937-c7d9eb0d7e4f', 'Juan José Paso', '299', '2021-10-26 17:40:50'),
('f6ffe114-35bf-11ec-8937-c7d9eb0d7e4f', 'Gerónima Barros', '248', '2021-10-26 17:40:50'),
('f6ffe3f1-35bf-11ec-8937-c7d9eb0d7e4f', 'Sañogasta -Prov. de Mendoza', '29', '2021-10-26 17:40:50'),
('f6ffe5f9-35bf-11ec-8937-c7d9eb0d7e4f', 'Guanchín - Ma. L. de Silvano', '106', '2021-10-26 17:40:50'),
('f6ffe7fe-35bf-11ec-8937-c7d9eb0d7e4f', 'Tilimuqui - M. Enzo A. Córdoba', '123', '2021-10-26 17:40:50'),
('f6ffea05-35bf-11ec-8937-c7d9eb0d7e4f', 'Vichigasta - Muni. Ciudad de Bs. As.', '129', '2021-10-26 17:40:50'),
('f6ffec8b-35bf-11ec-8937-c7d9eb0d7e4f', 'Sta. Florentina - M. M. de Güemes', '170', '2021-10-26 17:40:50'),
('f6ffeea0-35bf-11ec-8937-c7d9eb0d7e4f', 'Miranda', '179', '2021-10-26 17:40:50'),
('f6fff0a7-35bf-11ec-8937-c7d9eb0d7e4f', 'Sañogasta - La Puntilla', '188', '2021-10-26 17:40:50'),
('f6fff2a0-35bf-11ec-8937-c7d9eb0d7e4f', 'Chilecito - Nicolás Dávila', '259', '2021-10-26 17:40:50'),
('f6fff4a2-35bf-11ec-8937-c7d9eb0d7e4f', 'Chilecito - Mercedes B. de Dinckage', '262', '2021-10-26 17:40:50'),
('f6fff6aa-35bf-11ec-8937-c7d9eb0d7e4f', 'La Higuera -Prof. Alcira Brizuela', '291', '2021-10-26 17:40:50'),
('f6fff9c5-35bf-11ec-8937-c7d9eb0d7e4f', 'Caudillos Riojanos', '396', '2021-10-26 17:40:50'),
('f6fffb98-35bf-11ec-8937-c7d9eb0d7e4f', 'Nonogasta - El Triángulo', '334', '2021-10-26 17:40:50'),
('f6fffd05-35bf-11ec-8937-c7d9eb0d7e4f', 'Malligasta', '345', '2021-10-26 17:40:50'),
('f6fffe47-35bf-11ec-8937-c7d9eb0d7e4f', 'Anguinán', '372', '2021-10-26 17:40:50'),
('f6ffff81-35bf-11ec-8937-c7d9eb0d7e4f', 'San Nicolás', '378', '2021-10-26 17:40:50'),
('f70000c0-35bf-11ec-8937-c7d9eb0d7e4f', 'Guanchín - Ma. L. de Silvano', '406', '2021-10-26 17:40:50'),
('f7000202-35bf-11ec-8937-c7d9eb0d7e4f', 'Pcia. De Formosa', '8', '2021-10-26 17:40:50'),
('f7000345-35bf-11ec-8937-c7d9eb0d7e4f', 'B. Rivadavia', '41', '2021-10-26 17:40:50'),
('f7000485-35bf-11ec-8937-c7d9eb0d7e4f', 'Escuelas Rurales de Capital', NULL, '2021-10-26 17:40:50'),
('f7000542-35bf-11ec-8937-c7d9eb0d7e4f', 'Raúl Délfor Tapia', '407', '2021-10-26 17:40:50'),
('f7000731-35bf-11ec-8937-c7d9eb0d7e4f', 'Los Boulevares', '410', '2021-10-26 17:40:50'),
('f7000900-35bf-11ec-8937-c7d9eb0d7e4f', NULL, '412', '2021-10-26 17:40:50'),
('f7000ac9-35bf-11ec-8937-c7d9eb0d7e4f', '416', NULL, '2021-10-26 17:40:50'),
('f7000c9a-35bf-11ec-8937-c7d9eb0d7e4f', '417', NULL, '2021-10-26 17:40:50'),
('f7000e68-35bf-11ec-8937-c7d9eb0d7e4f', NULL, '411', '2021-10-26 17:40:50'),
('f7001034-35bf-11ec-8937-c7d9eb0d7e4f', NULL, '418', '2021-10-26 17:40:50'),
('f700121a-35bf-11ec-8937-c7d9eb0d7e4f', 'Tucumán', '11', '2021-10-26 17:40:50'),
('f70013e1-35bf-11ec-8937-c7d9eb0d7e4f', 'Manuel Belgrano', '175', '2021-10-26 17:40:50'),
('f70015a0-35bf-11ec-8937-c7d9eb0d7e4f', 'San José de Calasanz', '394', '2021-10-26 17:40:50'),
('f70016e9-35bf-11ec-8937-c7d9eb0d7e4f', 'Pcia de Buenos Aires', '54', '2021-10-26 17:40:50'),
('f7001917-35bf-11ec-8937-c7d9eb0d7e4f', 'General Manuel Belgrano', '56', '2021-10-26 17:40:50'),
('f7001b11-35bf-11ec-8937-c7d9eb0d7e4f', 'Republica de Venezuela', '199', '2021-10-26 17:40:50'),
('f7001ce0-35bf-11ec-8937-c7d9eb0d7e4f', 'Isla Cantadero', '202', '2021-10-26 17:40:50'),
('f7001eb0-35bf-11ec-8937-c7d9eb0d7e4f', 'Humberto Pereyra', '369', '2021-10-26 17:40:50'),
('f7002075-35bf-11ec-8937-c7d9eb0d7e4f', 'Ortiz Ocampo', '246', '2021-10-26 17:40:50'),
('f70021b7-35bf-11ec-8937-c7d9eb0d7e4f', 'Provincia de Santa Fe', '37', '2021-10-26 17:40:50'),
('f700237a-35bf-11ec-8937-c7d9eb0d7e4f', 'Castro Barros', '245', '2021-10-26 17:40:50'),
('f70024bf-35bf-11ec-8937-c7d9eb0d7e4f', 'San Martin', '190', '2021-10-26 17:40:50'),
('f70026b2-35bf-11ec-8937-c7d9eb0d7e4f', 'Ceferino Namuncura', '251', '2021-10-26 17:40:50'),
('f70027f7-35bf-11ec-8937-c7d9eb0d7e4f', 'Zelada y Dávila', '361', '2021-10-26 17:40:50'),
('f70029c8-35bf-11ec-8937-c7d9eb0d7e4f', 'Tambor de tacuari', '280', '2021-10-26 17:40:50'),
('f7002b9d-35bf-11ec-8937-c7d9eb0d7e4f', 'Enrique Angelleli', '398', '2021-10-26 17:40:50'),
('f7002d68-35bf-11ec-8937-c7d9eb0d7e4f', 'Mariano Moreno', '177', '2021-10-26 17:40:50'),
('f7002f35-35bf-11ec-8937-c7d9eb0d7e4f', NULL, '409', '2021-10-26 17:40:50'),
('f70030a0-35bf-11ec-8937-c7d9eb0d7e4f', 'Bernardino Rivadavia', '252', '2021-10-26 17:40:50'),
('f700326f-35bf-11ec-8937-c7d9eb0d7e4f', 'Colonia Frutiortícola', '353', '2021-10-26 17:40:50'),
('f70033b2-35bf-11ec-8937-c7d9eb0d7e4f', 'Parque Industrial', '403', '2021-10-26 17:40:50'),
('f70034ee-35bf-11ec-8937-c7d9eb0d7e4f', 'Provincia de Misiones', '365', '2021-10-26 17:40:50'),
('f70036b8-35bf-11ec-8937-c7d9eb0d7e4f', 'Malvinas Argentinas', '395', '2021-10-26 17:40:50'),
('f7003803-35bf-11ec-8937-c7d9eb0d7e4f', 'Faldeo del velazco', '408', '2021-10-26 17:40:50'),
('f70039cd-35bf-11ec-8937-c7d9eb0d7e4f', 'Villa Casana', '35', '2021-10-26 17:40:50'),
('f7003b39-35bf-11ec-8937-c7d9eb0d7e4f', 'Novoqué - J. E. Toledo Vera', '95', '2021-10-26 17:40:50'),
('f7003c79-35bf-11ec-8937-c7d9eb0d7e4f', 'La Jarilla', '96', '2021-10-26 17:40:50'),
('f7003db6-35bf-11ec-8937-c7d9eb0d7e4f', 'El Totoral', '98', '2021-10-26 17:40:50'),
('f7003ef6-35bf-11ec-8937-c7d9eb0d7e4f', 'Real del Cadillo', '113', '2021-10-26 17:40:50'),
('f7004039-35bf-11ec-8937-c7d9eb0d7e4f', 'Nicolás Avellaneda', '192', '2021-10-26 17:40:50'),
('f7004173-35bf-11ec-8937-c7d9eb0d7e4f', 'Nicolás Lanziloto', '114', '2021-10-26 17:40:50'),
('f70042b2-35bf-11ec-8937-c7d9eb0d7e4f', 'Mascasín)', '138', '2021-10-26 17:40:50'),
('f7004412-35bf-11ec-8937-c7d9eb0d7e4f', 'D. Tello - Fco. Baigorrí', '161', '2021-10-26 17:40:50'),
('f700455d-35bf-11ec-8937-c7d9eb0d7e4f', 'Joaquín V. González', '255', '2021-10-26 17:40:50'),
('f700469b-35bf-11ec-8937-c7d9eb0d7e4f', 'Casas Viejas', '332', '2021-10-26 17:40:50'),
('f70047da-35bf-11ec-8937-c7d9eb0d7e4f', 'J. Facundo Quiroga', NULL, '2021-10-26 17:40:50'),
('f7004918-35bf-11ec-8937-c7d9eb0d7e4f', ' V. Chepes - J. R. de Velazco', '16', '2021-10-26 17:40:50'),
('f7004a57-35bf-11ec-8937-c7d9eb0d7e4f', ' Chelco', '34', '2021-10-26 17:40:50'),
('f7004b91-35bf-11ec-8937-c7d9eb0d7e4f', ' El Potrerillo', '45', '2021-10-26 17:40:50'),
('f7004cce-35bf-11ec-8937-c7d9eb0d7e4f', 'Nuevo Argentino', '405', '2021-10-26 17:40:50'),
('f7004ec2-35bf-11ec-8937-c7d9eb0d7e4f', ' El Tala - Nelly C. de Aguilar', '97', '2021-10-26 17:40:50'),
('f7005005-35bf-11ec-8937-c7d9eb0d7e4f', ' San Isidro', '99', '2021-10-26 17:40:50'),
('f7005143-35bf-11ec-8937-c7d9eb0d7e4f', ' La Callana', '115', '2021-10-26 17:40:50'),
('f7005283-35bf-11ec-8937-c7d9eb0d7e4f', ' Agua de Piedra', '117', '2021-10-26 17:40:50'),
('f70053c1-35bf-11ec-8937-c7d9eb0d7e4f', ' La Laguna', '128', '2021-10-26 17:40:50'),
('f70054fe-35bf-11ec-8937-c7d9eb0d7e4f', ' Alto Bayo', '131', '2021-10-26 17:40:50'),
('f7005638-35bf-11ec-8937-c7d9eb0d7e4f', ' El Rodeo', '132', '2021-10-26 17:40:50'),
('f7005771-35bf-11ec-8937-c7d9eb0d7e4f', ' Quebrada del Vallecito', '146', '2021-10-26 17:40:50'),
('f70058d4-35bf-11ec-8937-c7d9eb0d7e4f', ' Valle Hermoso', '163', '2021-10-26 17:40:50'),
('f7005a12-35bf-11ec-8937-c7d9eb0d7e4f', ' Agua Blanca', '173', '2021-10-26 17:40:50'),
('f7005b50-35bf-11ec-8937-c7d9eb0d7e4f', 'Juan M. Fangio', NULL, '2021-10-26 17:40:50'),
('f7005c91-35bf-11ec-8937-c7d9eb0d7e4f', ' San José', '180', '2021-10-26 17:40:50'),
('f7005dcd-35bf-11ec-8937-c7d9eb0d7e4f', ' Santa Cruz', '184', '2021-10-26 17:40:50'),
('f7005f0b-35bf-11ec-8937-c7d9eb0d7e4f', ' El Divisadero', '213', '2021-10-26 17:40:50'),
('f7006047-35bf-11ec-8937-c7d9eb0d7e4f', ' La Consulta', '216', '2021-10-26 17:40:50'),
('f7006184-35bf-11ec-8937-c7d9eb0d7e4f', ' Rodeo Grande', '219', '2021-10-26 17:40:50'),
('f70062ee-35bf-11ec-8937-c7d9eb0d7e4f', ' Agua de Aguirre', '221', '2021-10-26 17:40:50'),
('f7006434-35bf-11ec-8937-c7d9eb0d7e4f', ' El Cardón', '227', '2021-10-26 17:40:50'),
('f7006573-35bf-11ec-8937-c7d9eb0d7e4f', ' El Zampal', '237', '2021-10-26 17:40:50'),
('f70066b3-35bf-11ec-8937-c7d9eb0d7e4f', ' La Calera', '239', '2021-10-26 17:40:50'),
('f700b8ba-35bf-11ec-8937-c7d9eb0d7e4f', ' San Antonio de las Toscas', '354', '2021-10-26 17:40:50'),
('f700bad1-35bf-11ec-8937-c7d9eb0d7e4f', 'Timoteo Gordillo', '39', '2021-10-26 17:40:50'),
('f700bcc2-35bf-11ec-8937-c7d9eb0d7e4f', ' Paraje El Totoral', '384', '2021-10-26 17:40:50'),
('f700be5c-35bf-11ec-8937-c7d9eb0d7e4f', 'Esquinq del Sur', '22', '2021-10-26 17:40:50'),
('f700bfb1-35bf-11ec-8937-c7d9eb0d7e4f', 'Cortaderas', '26', '2021-10-26 17:40:50'),
('f700c1e7-35bf-11ec-8937-c7d9eb0d7e4f', 'La Aguada', '43', '2021-10-26 17:40:50'),
('f700c343-35bf-11ec-8937-c7d9eb0d7e4f', 'Talva', '77', '2021-10-26 17:40:50'),
('f700c491-35bf-11ec-8937-c7d9eb0d7e4f', 'Baldes de Pacheco', '154', '2021-10-26 17:40:50'),
('f700c5d2-35bf-11ec-8937-c7d9eb0d7e4f', 'Loma Blanca', '186', '2021-10-26 17:40:50'),
('f700c713-35bf-11ec-8937-c7d9eb0d7e4f', 'Esc. A. Peñaloza', '267', '2021-10-26 17:40:50'),
('f700c8ea-35bf-11ec-8937-c7d9eb0d7e4f', 'La Huerta', '289', '2021-10-26 17:40:50'),
('f700ca39-35bf-11ec-8937-c7d9eb0d7e4f', 'Tala Verde', '320', '2021-10-26 17:40:50'),
('f700cb78-35bf-11ec-8937-c7d9eb0d7e4f', 'Capital Federal', '127', '2021-10-26 17:40:50'),
('f700cd3e-35bf-11ec-8937-c7d9eb0d7e4f', 'El Consuelo', '325', '2021-10-26 17:40:50'),
('f700ce89-35bf-11ec-8937-c7d9eb0d7e4f', 'El Virque', '344', '2021-10-26 17:40:50'),
('f700cfc7-35bf-11ec-8937-c7d9eb0d7e4f', 'Santa Cruz', '387', '2021-10-26 17:40:50'),
('f700d105-35bf-11ec-8937-c7d9eb0d7e4f', 'Esc. Normal', NULL, '2021-10-26 17:40:50'),
('f700d3aa-35bf-11ec-8937-c7d9eb0d7e4f', 'Chañar', '14', '2021-10-26 17:40:50'),
('f700d4f0-35bf-11ec-8937-c7d9eb0d7e4f', 'San Pedro', '38', '2021-10-26 17:40:50'),
('f700d62f-35bf-11ec-8937-c7d9eb0d7e4f', 'Chañar Viejo', '92', '2021-10-26 17:40:50'),
('f700d770-35bf-11ec-8937-c7d9eb0d7e4f', 'Simbolar', '153', '2021-10-26 17:40:50'),
('f700d8ac-35bf-11ec-8937-c7d9eb0d7e4f', 'Castro Barros', '172', '2021-10-26 17:40:50'),
('f700d9e9-35bf-11ec-8937-c7d9eb0d7e4f', 'Monte Grande', '210', '2021-10-26 17:40:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `school__LST`
--

CREATE TABLE `school__LST` (
  `school_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `learning_support_team_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `school__LST`
--

INSERT INTO `school__LST` (`school_id`, `learning_support_team_id`) VALUES
('f6f62746-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f6f62d54-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f6f62d54-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f6f63095-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f6f632a5-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f6f635c7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f637c0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f639b3-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f63b9f-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f63d81-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f63f5d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f6413e-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f6431d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f644fd-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f646da-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f648b1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f64a88-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f64c5d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f64e39-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f6501a-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f651f4-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f653c8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f655a3-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f6577e-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f6f6577e-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f6f65a30-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f65c0b-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f65de1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f65fb7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f66197-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f66376-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f6654f-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f66726-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f668ff-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f66ad7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f66cad-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ef897-3682-11ec-88b9-c6d3d0998ffd'),
('f6f66edb-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f670db-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f6730c-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f67571-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f8fd2a-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f90169-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f9065c-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f90885-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f90a9e-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f90d42-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f90f86-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f911b5-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f913e5-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f91615-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f9183f-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f91a69-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f91ce0-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f91ef5-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f92107-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f92316-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f925a7-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f927d1-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f92a02-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f92c3a-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f92e67-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f93091-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f932c1-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f93552-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f937ca-35bf-11ec-8937-c7d9eb0d7e4f', '0c07545e-3682-11ec-88b9-c6d3d0998ffd'),
('f6f93a59-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f93c69-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f93ed2-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f94197-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f94409-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f94626-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f94842-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f94be8-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f94e51-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f950c3-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f953df-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f956d1-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6f95b05-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb26fe-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb2947-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb2be4-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb2e39-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb33aa-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb3614-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb3850-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb3a85-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb3cbe-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb3ef8-35bf-11ec-8937-c7d9eb0d7e4f', '0c077590-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb4130-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb4368-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb459c-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb47d2-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb4a05-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb4c3f-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb4e78-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb50ad-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb52df-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb5590-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb58b3-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fb5aec-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe3ba9-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe4027-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe444b-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe4680-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe4893-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe4aaa-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe4cb3-35bf-11ec-8937-c7d9eb0d7e4f', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe4eb9-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe51c9-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe569d-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe59dc-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe5c92-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe5f0e-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe61aa-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe63dd-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6fe65f7-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6feb9b1-35bf-11ec-8937-c7d9eb0d7e4f', '0c098089-3682-11ec-88b9-c6d3d0998ffd'),
('f6febce2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('f6fec059-35bf-11ec-8937-c7d9eb0d7e4f', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('f6fec290-35bf-11ec-8937-c7d9eb0d7e4f', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('f6fec496-35bf-11ec-8937-c7d9eb0d7e4f', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('f6fec6a2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('f6fec8c4-35bf-11ec-8937-c7d9eb0d7e4f', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('f6fecac3-35bf-11ec-8937-c7d9eb0d7e4f', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('f6feccc1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0a9aa6-3682-11ec-88b9-c6d3d0998ffd'),
('f6fecec0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('f6fed0bc-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('f6fed2dd-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('f6fed5f8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('f6fed7f1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('f6fed9f8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aa86a-3682-11ec-88b9-c6d3d0998ffd'),
('f6fedbf7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6feddfa-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fedff7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fee1ee-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fee3e8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fee5de-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fee7d9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fee9df-35bf-11ec-8937-c7d9eb0d7e4f', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('f6feebda-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6feedd0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6feefcf-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fef1c3-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fef3b9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fef5ae-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fef7a6-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fef9a6-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fefba3-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ab747-3682-11ec-88b9-c6d3d0998ffd'),
('f6fefd98-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff00bf-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff02bb-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff04b4-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff06a8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff08a1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff0a9d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff0c94-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff0e8b-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff1086-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff127a-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff158c-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff1840-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff1a75-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff1cad-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff1ee5-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff2118-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff234e-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff257e-35bf-11ec-8937-c7d9eb0d7e4f', '0c0acb9f-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff27ae-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff29e0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff2d46-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff2f70-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff8909-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff8be5-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff8e14-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff9032-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff925c-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff946f-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff9678-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff9923-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff9c61-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ff9e5f-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ae9e1-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffa06d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffa279-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffa478-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffa670-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffa876-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffaa7d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffac84-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffae81-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffb081-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffb287-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffb484-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffb678-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffb87d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffba86-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffbc84-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffbe85-35bf-11ec-8937-c7d9eb0d7e4f', '0c0aff8d-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffc07f-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffc283-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffc480-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffc710-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffc710-35bf-11ec-8937-c7d9eb0d7e4f', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffca04-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffcc0d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffce13-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffd013-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffd216-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffd418-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffd617-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffd617-35bf-11ec-8937-c7d9eb0d7e4f', '457eb6fe-9fe7-4b47-9a05-80627e796a8a'),
('f6ffd81b-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffda21-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffdc27-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffde30-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffde30-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffe114-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffe114-35bf-11ec-8937-c7d9eb0d7e4f', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffe3f1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffe5f9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffe7fe-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffea05-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffec8b-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffeea0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6fff0a7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6fff2a0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6fff4a2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6fff6aa-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6fff9c5-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f6fff9c5-35bf-11ec-8937-c7d9eb0d7e4f', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('f6fffb98-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6fffd05-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6fffe47-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f6ffff81-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f70000c0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f7000202-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f7000345-35bf-11ec-8937-c7d9eb0d7e4f', '0c0c7789-3682-11ec-88b9-c6d3d0998ffd'),
('f7000542-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f7000542-35bf-11ec-8937-c7d9eb0d7e4f', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('f7000731-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f7000731-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f7000900-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f7000900-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f7000ac9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f7000ac9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f7000c9a-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f7000c9a-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f7000e68-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f7000e68-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f7001034-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f7001034-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f700121a-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f700121a-35bf-11ec-8937-c7d9eb0d7e4f', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('f70013e1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f70013e1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0db773-3682-11ec-88b9-c6d3d0998ffd'),
('f70015a0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d5d9e-3682-11ec-88b9-c6d3d0998ffd'),
('f70016e9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f70016e9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f7001917-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dcd7e-3682-11ec-88b9-c6d3d0998ffd'),
('f7001917-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd3c7-3682-11ec-88b9-c6d3d0998ffd'),
('f7001b11-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dcd7e-3682-11ec-88b9-c6d3d0998ffd'),
('f7001b11-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd3c7-3682-11ec-88b9-c6d3d0998ffd'),
('f7001ce0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dcd7e-3682-11ec-88b9-c6d3d0998ffd'),
('f7001ce0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd3c7-3682-11ec-88b9-c6d3d0998ffd'),
('f7001eb0-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f7001eb0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f7002075-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f70021b7-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f70021b7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f700237a-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f70024bf-35bf-11ec-8937-c7d9eb0d7e4f', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('f70024bf-35bf-11ec-8937-c7d9eb0d7e4f', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('f70026b2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('f70027f7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f70027f7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f70029c8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f70029c8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f7002b9d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f7002b9d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f7002d68-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f7002d68-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f7002f35-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f70030a0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f70030a0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f700326f-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f70033b2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f70034ee-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f70034ee-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f70036b8-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f7003803-35bf-11ec-8937-c7d9eb0d7e4f', '0c0b1926-3682-11ec-88b9-c6d3d0998ffd'),
('f7003803-35bf-11ec-8937-c7d9eb0d7e4f', '0c0d9f8b-3682-11ec-88b9-c6d3d0998ffd'),
('f70039cd-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7003b39-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7003c79-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7003db6-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7003ef6-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7004039-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f7004173-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f70042b2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7004412-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f700455d-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f700469b-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f70047da-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7004918-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7004a57-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7004b91-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7004cce-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e0042-3682-11ec-88b9-c6d3d0998ffd'),
('f7004cce-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e2bb3-3682-11ec-88b9-c6d3d0998ffd'),
('f7004ec2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005005-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005143-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005283-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f70053c1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f70054fe-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005638-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005771-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f70058d4-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005a12-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005b50-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f7005c91-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005dcd-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7005f0b-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7006047-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7006184-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f70062ee-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7006434-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f7006573-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f70066b3-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f700b8ba-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f700bad1-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f700bad1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f700bcc2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0e483c-3682-11ec-88b9-c6d3d0998ffd'),
('f700be5c-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700bfb1-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700c1e7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700c343-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700c491-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700c5d2-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700c713-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700c8ea-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700ca39-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700cb78-35bf-11ec-8937-c7d9eb0d7e4f', '0c073265-3682-11ec-88b9-c6d3d0998ffd'),
('f700cb78-35bf-11ec-8937-c7d9eb0d7e4f', '0c0dd925-3682-11ec-88b9-c6d3d0998ffd'),
('f700cd3e-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700ce89-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700cfc7-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700d105-35bf-11ec-8937-c7d9eb0d7e4f', '0c0cc7a0-3682-11ec-88b9-c6d3d0998ffd'),
('f700d105-35bf-11ec-8937-c7d9eb0d7e4f', '0c0debfa-3682-11ec-88b9-c6d3d0998ffd'),
('f700d105-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700d3aa-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700d4f0-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700d62f-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700d770-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700d8ac-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd'),
('f700d9e9-35bf-11ec-8937-c7d9eb0d7e4f', '0c0ede7a-3682-11ec-88b9-c6d3d0998ffd');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` varchar(36) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `create_at` datetime NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role_id`, `create_at`, `update_at`, `is_active`, `name`, `surname`) VALUES
('faf517d7-ca92-46e3-95d8-183a76af0944', 'admin', 'admin@example.com', '$2y$13$1Gx3I.7SDNkGUmk1JrLn1OJWTzjGC5ceJ0.HMBRBpV5BGcPylhq/.', 'ROLE_ADMIN', '2023-11-17 21:54:30', '2023-11-17 21:54:30', 1, 'admin', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `document_category_id` (`document_category_id`);

--
-- Indices de la tabla `document_category`
--
ALTER TABLE `document_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `employment_contract_id` (`employment_contract_id`) USING BTREE,
  ADD KEY `job_designation_id` (`job_designation_id`) USING BTREE;

--
-- Indices de la tabla `employee__document`
--
ALTER TABLE `employee__document`
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `employee__document_ibfk_2` (`document_id`);

--
-- Indices de la tabla `employee__LST`
--
ALTER TABLE `employee__LST`
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `employee__LST_ibfk_2` (`learning_support_team_id`);

--
-- Indices de la tabla `employment_contract`
--
ALTER TABLE `employment_contract`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indices de la tabla `job_designation`
--
ALTER TABLE `job_designation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `learning_support_team`
--
ALTER TABLE `learning_support_team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `learning_support_team_category_id` (`learning_support_team_category_id`),
  ADD KEY `manager` (`manager`) USING BTREE,
  ADD KEY `learning_support_team_ibfk_3` (`office_of_learning_support_id`);

--
-- Indices de la tabla `learning_support_team_category`
--
ALTER TABLE `learning_support_team_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `office_of_learning_support`
--
ALTER TABLE `office_of_learning_support`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `office_of_learning_support_in_district_id` (`office_of_learning_support_in_district_id`);

--
-- Indices de la tabla `office_of_learning_support_in_district`
--
ALTER TABLE `office_of_learning_support_in_district`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `description` (`description`);

--
-- Indices de la tabla `school_assisted_by_learning_support_team`
--
ALTER TABLE `school_assisted_by_learning_support_team`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `school__LST`
--
ALTER TABLE `school__LST`
  ADD PRIMARY KEY (`school_id`,`learning_support_team_id`),
  ADD KEY `IDX_7712F0DBC32A47EE` (`school_id`),
  ADD KEY `IDX_7712F0DBEEABAD71` (`learning_support_team_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`) USING BTREE,
  ADD UNIQUE KEY `userName` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_ibfk_1` (`role_id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `document_ibfk_1` FOREIGN KEY (`document_category_id`) REFERENCES `document_category` (`id`);

--
-- Filtros para la tabla `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employment_contract_id` FOREIGN KEY (`employment_contract_id`) REFERENCES `employment_contract` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `job_designation_id` FOREIGN KEY (`job_designation_id`) REFERENCES `job_designation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `employee__document`
--
ALTER TABLE `employee__document`
  ADD CONSTRAINT `employee__document_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee__document_ibfk_2` FOREIGN KEY (`document_id`) REFERENCES `document` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `employee__LST`
--
ALTER TABLE `employee__LST`
  ADD CONSTRAINT `employee__LST_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee__LST_ibfk_2` FOREIGN KEY (`learning_support_team_id`) REFERENCES `learning_support_team` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `learning_support_team`
--
ALTER TABLE `learning_support_team`
  ADD CONSTRAINT `learning_support_team_ibfk_2` FOREIGN KEY (`learning_support_team_category_id`) REFERENCES `learning_support_team_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `learning_support_team_ibfk_3` FOREIGN KEY (`office_of_learning_support_id`) REFERENCES `office_of_learning_support` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `learning_support_team_ibfk_4` FOREIGN KEY (`manager`) REFERENCES `employee` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `office_of_learning_support`
--
ALTER TABLE `office_of_learning_support`
  ADD CONSTRAINT `office_of_learning_support_ibfk_1` FOREIGN KEY (`office_of_learning_support_in_district_id`) REFERENCES `office_of_learning_support_in_district` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
