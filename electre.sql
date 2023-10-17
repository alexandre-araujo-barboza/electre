-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18-Out-2023 às 01:05
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
-- Estrutura da tabela `modelo_cimento`
--

CREATE TABLE `modelo_cimento` (
  `alternativa` varchar(32) NOT NULL,
  `c1` float(7,4) DEFAULT 0.0000,
  `c2` float(7,4) DEFAULT 0.0000,
  `c3` float(7,4) DEFAULT 0.0000,
  `c4` float(7,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_cimento`
--

INSERT INTO `modelo_cimento` (`alternativa`, `c1`, `c2`, `c3`, `c4`) VALUES
('a1', 999.9999, 999.9999, 7.0000, 5.0000),
('a2', 999.9999, 999.9999, 3.0000, 4.0000),
('a3', 999.9999, 999.9999, 10.0000, 2.0000),
('peso', 20.0000, 30.0000, 40.0000, 10.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_empresa`
--

CREATE TABLE `modelo_empresa` (
  `alternativa` varchar(32) NOT NULL,
  `c1` float(7,4) DEFAULT 0.0000,
  `c2` float(7,4) DEFAULT 0.0000,
  `c3` float(7,4) DEFAULT 0.0000,
  `c4` float(7,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_empresa`
--

INSERT INTO `modelo_empresa` (`alternativa`, `c1`, `c2`, `c3`, `c4`) VALUES
('a1', 8.0000, 4.0000, 2.0000, 7.0000),
('a2', 4.0000, 3.0000, 4.0000, 5.0000),
('a3', 3.0000, 6.0000, 6.0000, 3.0000),
('a4', 5.0000, 7.0000, 5.0000, 6.0000),
('peso', 25.0000, 45.0000, 10.0000, 8.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_equipamentos`
--

CREATE TABLE `modelo_equipamentos` (
  `alternativa` varchar(32) NOT NULL,
  `c1` float(7,4) DEFAULT 0.0000,
  `c2` float(7,4) DEFAULT 0.0000,
  `c3` float(7,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_equipamentos`
--

INSERT INTO `modelo_equipamentos` (`alternativa`, `c1`, `c2`, `c3`) VALUES
('equip 1', 0.7000, 0.8000, 0.2000),
('equip 2', 0.8000, 1.0000, 0.2000),
('equip 3', 0.5000, 1.0000, 0.8000),
('equip 4', 0.7000, 9.0000, 6.0000),
('peso', 0.2000, 0.5000, 0.3000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_exemplo`
--

CREATE TABLE `modelo_exemplo` (
  `alternativa` varchar(32) NOT NULL,
  `c1` float(7,4) DEFAULT 0.0000,
  `c2` float(7,4) DEFAULT 0.0000,
  `c3` float(7,4) DEFAULT 0.0000,
  `c4` float(7,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_exemplo`
--

INSERT INTO `modelo_exemplo` (`alternativa`, `c1`, `c2`, `c3`, `c4`) VALUES
('alt 1', 15.0000, 9.0000, 6.0000, 10.0000),
('alt 2', 10.0000, 5.0000, 7.0000, 8.0000),
('alt 3', 22.0000, 12.0000, 1.0000, 14.0000),
('alt 4', 31.0000, 10.0000, 6.0000, 18.0000),
('alt 5', 8.0000, 9.0000, 0.0000, 9.0000),
('peso', 7.0000, 3.0000, 5.0000, 6.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_federal`
--

CREATE TABLE `modelo_federal` (
  `alternativa` varchar(32) NOT NULL,
  `c1` float(7,4) DEFAULT 0.0000,
  `c2` float(7,4) DEFAULT 0.0000,
  `c3` float(7,4) DEFAULT 0.0000,
  `c4` float(7,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_federal`
--

INSERT INTO `modelo_federal` (`alternativa`, `c1`, `c2`, `c3`, `c4`) VALUES
('a1', 5.0000, 7.0000, 9.0000, 3.0000),
('a2', 2.0000, 3.0000, 5.0000, 5.0000),
('a3', 9.0000, 7.0000, 9.0000, 7.0000),
('a4', 9.0000, 7.0000, 9.0000, 5.0000),
('peso', 40.0000, 25.0000, 20.0000, 15.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_impressora`
--

CREATE TABLE `modelo_impressora` (
  `alternativa` varchar(32) NOT NULL,
  `c1` float(7,4) DEFAULT 0.0000,
  `c2` float(7,4) DEFAULT 0.0000,
  `c3` float(7,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_impressora`
--

INSERT INTO `modelo_impressora` (`alternativa`, `c1`, `c2`, `c3`) VALUES
('imp 1', 100.0000, 75.0000, 10.0000),
('imp 2', 50.0000, 120.0000, 80.0000),
('imp 3', 0.0000, 0.0000, 25.0000),
('imp 4', 100.0000, 20.0000, 50.0000),
('peso', 30.0000, 20.0000, 30.0000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_restauracao`
--

CREATE TABLE `modelo_restauracao` (
  `alternativa` varchar(32) NOT NULL,
  `qualidade` float(7,4) DEFAULT 0.0000,
  `tempo` float(7,4) DEFAULT 0.0000,
  `experiencia` float(7,4) DEFAULT 0.0000,
  `disponibilidade` float(7,4) DEFAULT 0.0000
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_restauracao`
--

INSERT INTO `modelo_restauracao` (`alternativa`, `qualidade`, `tempo`, `experiencia`, `disponibilidade`) VALUES
('a1', 10.0000, 5.0000, 10.0000, 5.0000),
('a2', 8.0000, 8.0000, 7.0000, 10.0000),
('a3', 9.0000, 10.0000, 5.0000, 9.0000),
('peso', 0.5000, 0.1000, 0.3000, 0.1000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
