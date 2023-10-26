-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/10/2023 às 19:59
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `electre`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo_futebol`
--

CREATE TABLE `modelo_futebol` (
  `alternativa` varchar(32) NOT NULL,
  `gols` float(9,2) DEFAULT 0.00,
  `faltas` float(9,2) DEFAULT 0.00,
  `cartoes` float(9,2) DEFAULT 0.00,
  `defesas` float(9,2) DEFAULT 0.00,
  `passes errados` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `modelo_futebol`
--

INSERT INTO `modelo_futebol` (`alternativa`, `gols`, `faltas`, `cartoes`, `defesas`, `passes errados`) VALUES
('america', 20.00, -8.00, 0.00, 7.00, -15.00),
('bangu', 8.00, -4.00, -2.00, 5.00, -36.00),
('botafogo', 26.00, -10.00, 0.00, 8.00, -17.00),
('flamengo', 18.00, 0.00, 0.00, 12.00, -4.00),
('fluminense', 9.00, -12.00, -1.00, 5.00, -20.00),
('vasco', 12.00, -8.00, -1.00, 9.00, -14.00),
('peso', 5.00, 3.00, 4.00, 2.00, 1.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
