-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 18-Set-2020 às 04:19
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bd_ptlbc`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `nomeRazao` varchar(45) NOT NULL,
  `cpfCnpj` varchar(45) NOT NULL,
  `rgIe` varchar(45) NOT NULL,
  `dataNascAbertura` date NOT NULL,
  `tipo` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nomeRazao`, `cpfCnpj`, `rgIe`, `dataNascAbertura`, `tipo`, `status`) VALUES
(1, 'Joaquina Cristina', '123.232.231.12', '1312.411', '2912-12-02', 1, 2),
(3, 'Jaozin', '231-312-123.12', '213123-12', '2008-03-21', 1, 2),
(4, 'Jaosda', '12312', '23213', '2121-12-02', 1, 2),
(5, 'Joao PJL', '123-122-212-12', '212312-12', '2001-12-02', 1, 1),
(6, 'Marquin PJL', '123-312-123.12', '213123.12', '2010-12-02', 1, 1),
(7, 'Everson Zoio', '123-123-312.22', '21312-12', '2000-06-02', 1, 2),
(8, 'Erivelto Cunha', '092.942.421-24', '1542.142', '2001-01-01', 1, 1),
(9, 'Vinizeira Matador', '123.123.123-24', '2141.122', '2006-01-01', 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fornecedor`
--

CREATE TABLE IF NOT EXISTS `fornecedor` (
  `idfornecedor` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  PRIMARY KEY (`idfornecedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `fornecedor`
--

INSERT INTO `fornecedor` (`idfornecedor`, `nome`) VALUES
(1, 'Mercado Livre'),
(2, 'Spark'),
(3, 'GL IMPORTS');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `exibir` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=40 ;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idMenu`, `nome`, `link`, `icone`, `exibir`) VALUES
(1, 'Home', 'index.jsp', '', 1),
(2, 'Produtos', 'listar_produto.jsp', NULL, 1),
(3, 'Produtos Cadastrar', 'form_produto.jsp', NULL, 2),
(4, 'Produto Alterar', 'gerenciar_produto.do?acao=alterar', NULL, 2),
(5, 'Produto Deletar', 'gerenciar_produto.do?acao=deletar', NULL, 2),
(6, 'Perfil', 'listar_perfil.jsp', NULL, 1),
(7, 'Perfil Alterar', 'gerenciar_perfil.do?acao=alterar', NULL, 2),
(8, 'Perfil Deletar', 'gerenciar_perfil.do?acao=deletar', NULL, 2),
(9, 'Perfil Cadastrar', 'form_perfil', NULL, 2),
(11, 'Menus', 'listar_menu.jsp', NULL, 1),
(12, 'Menu Cadastrar', 'form_menu.jsp', NULL, 2),
(13, 'Menu Alterar', 'gerenciar_menu.do?acao=alterar', NULL, 2),
(14, 'Menu Deletar', 'gerenciar_menu.do?acao=deletar', NULL, 2),
(20, 'Fornecedor', 'listar_fornecedor.jsp', NULL, 1),
(21, 'Fornecedor Cadastrar', 'form_fornecedor.jsp', NULL, 2),
(22, 'Fornecedor Alterar', 'gerenciar_fornecedor.do?acao=alterar', NULL, 2),
(23, 'Fornecedor Deletar', 'gerenciar_fornecedor.do?acao=deletar', NULL, 2),
(24, 'Usuarios', 'listar_usuario.jsp', NULL, 1),
(25, 'Usuario Cadastrar', 'form_usuario.jsp', NULL, 2),
(26, 'Usuario Alterar', 'gerenciar_usuarios.do?acao=alterar', NULL, 2),
(27, 'Usuario Deletar', 'gerenciar_usuarios.do?acao=deletar', NULL, 2),
(28, 'Acessos Perfis', 'gerenciar_menu_perfil.do?acao=gerenciar', NULL, 2),
(29, 'Clientes', 'listar_cliente.jsp', NULL, 1),
(30, 'Clientes Cadastrar', 'form_cliente', NULL, 2),
(31, 'Clientes Alterar', 'gerenciar_cliente.do?acao=alterar', NULL, 2),
(32, 'Clientes Deletar', 'gerenciar_cliente.do?acao=deletar', NULL, 2),
(33, 'Venda Nova', 'form_venda.jsp?acao=novo', NULL, 2),
(34, '', '', NULL, 2),
(36, 'Continuar Vendendo', 'orm_venda.jsp?acao=c', NULL, 2),
(37, 'Finalizar Venda', 'form_finalizar_venda.jsp', NULL, 2),
(39, 'Vendas', 'listar_venda.jsp', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE IF NOT EXISTS `menu_perfil` (
  `idMenu` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`,`idPerfil`),
  KEY `fk_menu_has_perfil_perfil1_idx` (`idPerfil`),
  KEY `fk_menu_has_perfil_menu_idx` (`idMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idMenu`, `idPerfil`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(36, 1),
(37, 1),
(39, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(1, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `idPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `nome`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(5, 'Funcionarios');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE IF NOT EXISTS `produto` (
  `idProduto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `marca` varchar(20) DEFAULT NULL,
  `tamanho` varchar(2) NOT NULL,
  `preco` double NOT NULL,
  `imagem` varchar(200) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `qntd` int(11) NOT NULL,
  `idFornecedor` int(11) NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_produto_fornecedor1_idx` (`idFornecedor`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `nome`, `marca`, `tamanho`, `preco`, `imagem`, `status`, `qntd`, `idFornecedor`) VALUES
(12, 'Camisa PTL Cinza', 'Spark', 'G', 70, 'C:\\Users\\yasmin\\Documents\\NetBeansProjects\\PROJETOOO\\web\\imagens\\CamisaPTL1.jpeg', 1, 10, 2),
(13, 'Camisa PTL Cinza 2', 'Spark', 'G', 69.9, 'C:\\Users\\yasmin\\Documents\\NetBeansProjects\\PROJETOOO\\web\\imagens\\CamisaPTL2.jpeg', 1, 10, 2),
(16, 'Camisa Preta', 'Spark', 'G', 29.9, 'C:\\Users\\yasmin\\Documents\\NetBeansProjects\\PROJETOOO\\web\\imagens\\camisa18.png', 1, 10, 2),
(17, 'Camisa Vasco da gama', 'Adidas', 'P', 29.9, 'C:\\Users\\yasmin\\Documents\\NetBeansProjects\\PROJETOOO\\web\\imagens\\camisa17.jpg', 1, 2, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `login` varchar(10) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuario_perfil1_idx` (`idPerfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `login`, `senha`, `status`, `idPerfil`) VALUES
(1, 'Administrador', 'admin', '123', 1, 1),
(2, 'Anazinha', 'ana', '123', 1, 2),
(3, 'junin', 'junin', '123', 1, 1),
(4, 'Marcinho', 'marcin', '123', 1, 2),
(5, 'Jose comecu', 'jose', '123', 1, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda`
--

CREATE TABLE IF NOT EXISTS `venda` (
  `idVenda` int(11) NOT NULL AUTO_INCREMENT,
  `dataVenda` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `exibir` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `fk_venda_cliente1_idx` (`idCliente`),
  KEY `fk_venda_usuario1_idx` (`idUsuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

--
-- Extraindo dados da tabela `venda`
--

INSERT INTO `venda` (`idVenda`, `dataVenda`, `idCliente`, `idUsuario`, `exibir`) VALUES
(3, '2020-09-14', 1, 1, 0),
(4, '2020-09-14', 3, 1, 0),
(8, '2020-09-14', 1, 1, 0),
(10, '2020-09-14', 1, 1, 2),
(11, '2020-09-14', 3, 1, 2),
(12, '2020-09-14', 1, 1, 2),
(13, '2020-09-14', 5, 1, 2),
(14, '2020-09-15', 5, 1, 2),
(16, '2020-09-15', 5, 1, NULL),
(17, '2020-09-15', 5, 1, NULL),
(18, '2020-09-15', 5, 1, 2),
(19, '2020-09-15', 5, 1, NULL),
(22, '2020-09-16', 7, 1, 2),
(23, '2020-09-16', 7, 1, NULL),
(24, '2020-09-16', 6, 1, NULL),
(25, '2020-09-17', 5, 1, 2),
(26, '2020-09-17', 8, 1, 2),
(27, '2020-09-17', 9, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_produto`
--

CREATE TABLE IF NOT EXISTS `venda_produto` (
  `idVenda` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `qntdVendida` int(11) NOT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `fk_venda_has_produto_produto1_idx` (`idProduto`),
  KEY `fk_venda_has_produto_venda1_idx` (`idVenda`),
  KEY `idProduto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda_produto`
--

INSERT INTO `venda_produto` (`idVenda`, `idProduto`, `qntdVendida`, `valor`) VALUES
(26, 16, 1, 29.9);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_menu_has_perfil_menu` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `fk_produto_fornecedor1` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idfornecedor`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `fk_venda_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venda_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `venda_produto`
--
ALTER TABLE `venda_produto`
  ADD CONSTRAINT `fk_venda_has_produto_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_venda_has_produto_venda1` FOREIGN KEY (`idVenda`) REFERENCES `venda` (`idVenda`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
