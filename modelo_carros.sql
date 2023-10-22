-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22-Out-2023 às 20:52
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 7.4.29

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
-- Estrutura da tabela `modelo_carros`
--

CREATE TABLE `modelo_carros` (
  `alternativa` varchar(32) NOT NULL,
  `preco` float(9,2) DEFAULT 0.00,
  `conforto` float(9,2) DEFAULT 0.00,
  `consumo` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_carros`
--

INSERT INTO `modelo_carros` (`alternativa`, `preco`, `conforto`, `consumo`) VALUES
('a1', 18000.00, 5.00, 8.00),
('a2', 20500.00, 6.00, 5.00),
('a3', 24700.00, 6.00, 4.00),
('a4', 22800.00, 8.00, 7.00),
('peso', 5.00, 2.00, 3.00),
('meta', -1.00, 1.00, 1.00);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
