-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04/12/2025 às 23:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `portfolio_livia`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `config_site`
--

CREATE TABLE `config_site` (
  `id` int(11) NOT NULL,
  `chave` varchar(50) NOT NULL,
  `valor` text DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `config_site`
--

INSERT INTO `config_site` (`id`, `chave`, `valor`, `descricao`) VALUES
(1, 'email_admin', 'admin@exemplo.com', 'Email do administrador para notificações'),
(2, 'tempo_resposta', '24-48 horas', 'Tempo médio de resposta'),
(3, 'contato_habilitado', 'sim', 'Se o formulário de contato está habilitado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `contatos`
--

CREATE TABLE `contatos` (
  `id` int(11) NOT NULL,
  `nome_completo` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `assunto` varchar(50) DEFAULT NULL,
  `mensagem` text NOT NULL,
  `data_envio` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pendente','lida','respondida') DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `contatos`
--

INSERT INTO `contatos` (`id`, `nome_completo`, `email`, `assunto`, `mensagem`, `data_envio`, `status`) VALUES
(1, 'João Silva', 'joao@exemplo.com', 'portfolio', 'Gostei muito do seu portfólio!', '2025-12-04 22:10:21', 'pendente'),
(2, 'Maria Santos', 'maria@exemplo.com', 'collaboration', 'Gostaria de propor uma colaboração.', '2025-12-04 22:10:21', 'pendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs_contato`
--

CREATE TABLE `logs_contato` (
  `id` int(11) NOT NULL,
  `contato_id` int(11) DEFAULT NULL,
  `acao` varchar(50) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `data_log` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `config_site`
--
ALTER TABLE `config_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chave` (`chave`);

--
-- Índices de tabela `contatos`
--
ALTER TABLE `contatos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `logs_contato`
--
ALTER TABLE `logs_contato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contato_id` (`contato_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `config_site`
--
ALTER TABLE `config_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `contatos`
--
ALTER TABLE `contatos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `logs_contato`
--
ALTER TABLE `logs_contato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `logs_contato`
--
ALTER TABLE `logs_contato`
  ADD CONSTRAINT `logs_contato_ibfk_1` FOREIGN KEY (`contato_id`) REFERENCES `contatos` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
