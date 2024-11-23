-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 23/11/2024 às 12:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hurti`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `arroba` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Acionadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `valida_arroba` BEFORE INSERT ON `usuario` FOR EACH ROW BEGIN
    -- Verificar se o nome de usuário (arroba) contém caracteres inválidos como especiais, mas mantém caracteres com acento
    IF NOT NEW.arroba REGEXP '^[a-zA-Z0-9áéíóúãõàèìòùçÁÉÍÓÚÃÕÀÈÌÒÙÇ_.-]+$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nome de usuário contém caracteres inválidos. Apenas letras, números, acentos, ponto, e underline são permitidos.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `valida_arroba_update` BEFORE UPDATE ON `usuario` FOR EACH ROW BEGIN
    -- Verificar se o nome de usuário (arroba) contém caracteres inválidos como especiais
    IF NOT NEW.arroba REGEXP '^[a-zA-Z0-9áéíóúãõàèìòùçÁÉÍÓÚÃÕÀÈÌÒÙÇ_.-]+$' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Nome de usuário contém caracteres inválidos. Apenas letras, números, acentos, ponto, e underline são permitidos.';
    END IF;
END
$$
DELIMITER ;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `arroba` (`arroba`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
