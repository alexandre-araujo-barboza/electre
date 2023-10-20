-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20-Out-2023 às 21:04
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
('a1', 18000.00, 5.00, -8.00),
('a2', 20500.00, 6.00, -5.00),
('a3', 24700.00, 6.00, -4.00),
('a4', 28800.00, 8.00, -7.00),
('peso', 0.50, 0.20, 0.30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_cimento`
--

CREATE TABLE `modelo_cimento` (
  `alternativa` varchar(32) NOT NULL,
  `c1` float(9,2) DEFAULT 0.00,
  `c2` float(9,2) DEFAULT 0.00,
  `c3` float(9,2) DEFAULT 0.00,
  `c4` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_cimento`
--

INSERT INTO `modelo_cimento` (`alternativa`, `c1`, `c2`, `c3`, `c4`) VALUES
('a1', 1080.00, 740000.00, 7.00, 5.00),
('a2', 1320.00, 1020000.00, 3.00, 4.00),
('a3', 2000.00, 2350000.00, 10.00, 2.00),
('peso', 0.20, 0.30, 0.40, 0.10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_empresa`
--

CREATE TABLE `modelo_empresa` (
  `alternativa` varchar(32) NOT NULL,
  `gravidade da demanda` float(9,2) DEFAULT 0.00,
  `grau de inovacao` float(9,2) DEFAULT 0.00,
  `viabilidade` float(9,2) DEFAULT 0.00,
  `alinhamento estrategico` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_empresa`
--

INSERT INTO `modelo_empresa` (`alternativa`, `gravidade da demanda`, `grau de inovacao`, `viabilidade`, `alinhamento estrategico`) VALUES
('a1', 8.00, 4.00, 2.00, 7.00),
('a2', 4.00, 3.00, 4.00, 5.00),
('a3', 3.00, 6.00, 6.00, 3.00),
('a4', 5.00, 7.00, 5.00, 6.00),
('peso', 0.25, 0.45, 0.10, 0.80);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_equipamentos`
--

CREATE TABLE `modelo_equipamentos` (
  `alternativa` varchar(32) NOT NULL,
  `perdas de producao` float(9,2) DEFAULT 0.00,
  `risco a seguranca` float(9,2) DEFAULT 0.00,
  `risco ao ambiente` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_equipamentos`
--

INSERT INTO `modelo_equipamentos` (`alternativa`, `perdas de producao`, `risco a seguranca`, `risco ao ambiente`) VALUES
('equip 1', 0.70, 0.80, 0.20),
('equip 2', 0.80, 1.00, 0.50),
('equip 3', 0.50, 1.00, 0.80),
('equip 4', 0.70, 9.00, 6.00),
('peso', 0.20, 0.50, 0.30);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_estudantes`
--

CREATE TABLE `modelo_estudantes` (
  `alternativa` varchar(32) NOT NULL,
  `m1` float(9,2) DEFAULT 0.00,
  `m2` float(9,2) DEFAULT 0.00,
  `m3` float(9,2) DEFAULT 0.00,
  `m4` float(9,2) DEFAULT 0.00,
  `m5` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_estudantes`
--

INSERT INTO `modelo_estudantes` (`alternativa`, `m1`, `m2`, `m3`, `m4`, `m5`) VALUES
('e1', 7.00, 13.00, 8.00, 12.00, 11.00),
('e2', 8.00, 11.00, 11.00, 12.00, 11.00),
('e3', 20.00, 2.00, 10.00, 3.00, 15.00),
('e4', 16.00, 14.00, 16.00, 14.00, 13.00),
('e5', 12.00, 12.00, 8.00, 8.00, 10.00),
('peso', 1.00, 1.00, 1.00, 1.00, 1.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_federal`
--

CREATE TABLE `modelo_federal` (
  `alternativa` varchar(32) NOT NULL,
  `urgencia da demanda` float(9,2) DEFAULT 0.00,
  `viabilidade` float(9,2) DEFAULT 0.00,
  `alinhamento estrategico` float(9,2) DEFAULT 0.00,
  `complexidade da acao` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_federal`
--

INSERT INTO `modelo_federal` (`alternativa`, `urgencia da demanda`, `viabilidade`, `alinhamento estrategico`, `complexidade da acao`) VALUES
('a1', 5.00, 7.00, 9.00, 3.00),
('a2', 2.00, 3.00, 5.00, 5.00),
('a3', 9.00, 7.00, 9.00, 7.00),
('a4', 9.00, 7.00, 9.00, 5.00),
('peso', 0.40, 0.25, 0.20, 0.25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_fornecedores`
--

CREATE TABLE `modelo_fornecedores` (
  `alternativa` varchar(32) NOT NULL,
  `preco` float(9,2) DEFAULT 0.00,
  `relacionamento` float(9,2) DEFAULT 0.00,
  `resolucao de conflitos` float(9,2) DEFAULT 0.00,
  `qualidade` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_fornecedores`
--

INSERT INTO `modelo_fornecedores` (`alternativa`, `preco`, `relacionamento`, `resolucao de conflitos`, `qualidade`) VALUES
('f1', 8.00, 9.00, 8.00, 9.00),
('f2', 9.00, 8.00, 9.00, 8.00),
('f3', 6.00, 7.00, 7.00, 9.00),
('f4', 5.00, 8.00, 6.00, 7.00),
('peso', 0.40, 0.15, 0.20, 0.25);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_impressoras`
--

CREATE TABLE `modelo_impressoras` (
  `alternativa` varchar(32) NOT NULL,
  `cor` float(9,2) DEFAULT 0.00,
  `design` float(9,2) DEFAULT 0.00,
  `velocidade` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_impressoras`
--

INSERT INTO `modelo_impressoras` (`alternativa`, `cor`, `design`, `velocidade`) VALUES
('imp 1', 100.00, 75.00, 10.00),
('imp 2', 50.00, 120.00, 80.00),
('imp 3', 0.00, 0.00, 25.00),
('imp 4', 100.00, 20.00, 50.00),
('peso', 0.30, 0.20, 0.50);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_parque`
--

CREATE TABLE `modelo_parque` (
  `alternativa` varchar(32) NOT NULL,
  `lucro` float(9,2) DEFAULT 0.00,
  `empregos` float(9,2) DEFAULT 0.00,
  `residuos` float(9,2) DEFAULT 0.00,
  `turismo` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_parque`
--

INSERT INTO `modelo_parque` (`alternativa`, `lucro`, `empregos`, `residuos`, `turismo`) VALUES
('alt1', 15.00, 9.00, 6.00, 10.00),
('alt2', 10.00, 5.00, 7.00, 8.00),
('alt3', 22.00, 12.00, 1.00, 14.00),
('alt4', 31.00, 10.00, 6.00, 18.00),
('alt5', 8.00, 9.00, 0.00, 9.00),
('peso', 7.00, 3.00, 5.00, 6.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_restauracao`
--

CREATE TABLE `modelo_restauracao` (
  `alternativa` varchar(32) NOT NULL,
  `qualidade` float(9,2) DEFAULT 0.00,
  `tempo` float(9,2) DEFAULT 0.00,
  `experiencia` float(9,2) DEFAULT 0.00,
  `disponibilidade` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_restauracao`
--

INSERT INTO `modelo_restauracao` (`alternativa`, `qualidade`, `tempo`, `experiencia`, `disponibilidade`) VALUES
('a1', 10.00, 5.00, 10.00, 5.00),
('a2', 8.00, 6.00, 7.00, 10.00),
('a3', 9.00, 10.00, 5.00, 9.00),
('peso', 0.50, 0.10, 0.30, 0.10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo_transporte`
--

CREATE TABLE `modelo_transporte` (
  `alternativa` varchar(32) NOT NULL,
  `preco` float(9,2) DEFAULT 0.00,
  `tempo (horas)` float(9,2) DEFAULT 0.00,
  `nivel de atraso` float(9,2) DEFAULT 0.00,
  `danos a mercadoria` float(9,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `modelo_transporte`
--

INSERT INTO `modelo_transporte` (`alternativa`, `preco`, `tempo (horas)`, `nivel de atraso`, `danos a mercadoria`) VALUES
('aereo', 1900.00, 30.00, 1.00, 1.00),
('rodoviario', 900.00, 90.00, 5.00, 0.50),
('ferroviario', 600.00, 150.00, 0.25, 0.00),
('maritmo', 450.00, 210.00, 0.12, 0.00),
('peso', 0.40, 0.15, 0.20, 0.25);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
