-- SQL script to completely reset and recreate the database
-- This script will DROP everything and recreate from scratch

-- Drop the database if it exists (this will delete all data)
DROP DATABASE IF EXISTS stockify_db;

-- Create the database
CREATE DATABASE stockify_db;

-- Use the newly created database
USE stockify_db;

-- =============================================
-- CREATE TABLES IN CORRECT ORDER TO AVOID FOREIGN KEY ISSUES
-- =============================================

-- First create tables that don't have foreign key dependencies
CREATE TABLE `rotas` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `codigo` VARCHAR(10) UNIQUE NOT NULL,
  `bairro` VARCHAR(100),
  `nome` VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE `vendedores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `codigo` VARCHAR(10) UNIQUE NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(15) UNIQUE,
  `rg` VARCHAR(20),
  `endereco` VARCHAR(255),
  `bairro` VARCHAR(100),
  `cidade` VARCHAR(100),
  `estado` CHAR(2),
  `cep` VARCHAR(9),
  `telefone` VARCHAR(50),
  `email` VARCHAR(100),
  `pracas_atendimento` JSON,
  `data_cadastro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `produto_grupos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `codigo` VARCHAR(10) UNIQUE NOT NULL,
  `descricao` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `fornecedores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `marca` VARCHAR(100),
  `razao_social` VARCHAR(100) NOT NULL,
  `tipo_pessoa` ENUM('F', 'J'),
  `cpf` VARCHAR(15),
  `cnpj` VARCHAR(20),
  `inscricao_estadual` VARCHAR(20),
  `endereco` VARCHAR(255),
  `bairro` VARCHAR(100),
  `cidade` VARCHAR(100),
  `estado` CHAR(2),
  `cep` VARCHAR(9),
  `telefone` VARCHAR(50),
  `responsavel` VARCHAR(100),
  `telefone_responsavel` VARCHAR(50),
  `ativo` BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

CREATE TABLE `tags` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `nome` VARCHAR(50) UNIQUE NOT NULL
) ENGINE=InnoDB;

-- Now create tables that depend on the above tables
CREATE TABLE `clientes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `cpf_cnpj` VARCHAR(20) UNIQUE,
  `ie_rg` VARCHAR(20),
  `endereco` VARCHAR(255),
  `bairro` VARCHAR(100),
  `cidade` VARCHAR(100),
  `estado` CHAR(2),
  `cep` VARCHAR(9),
  `telefone` VARCHAR(50),
  `email` VARCHAR(100),
  `limite_credito` DECIMAL(12, 2) DEFAULT 0,
  `data_nascimento` DATE,
  `nome_mae` VARCHAR(100),
  `nome_pai` VARCHAR(100),
  `naturalidade` VARCHAR(50),
  `rota_id` INT,
  `praça` VARCHAR(50),
  `referencia` VARCHAR(255),
  `ativo` BOOLEAN DEFAULT TRUE,
  `data_cadastro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `hora_visita_inicio` TIME,
  `hora_visita_fim` TIME,
  `dias_visita` VARCHAR(20),
  `observacoes` TEXT,
  FOREIGN KEY (`rota_id`) REFERENCES `rotas`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `produtos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `codigo` VARCHAR(20) UNIQUE NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  `grupo_id` INT NOT NULL,
  `preco_custo` DECIMAL(12, 2),
  `preco_venda` DECIMAL(12, 2),
  `tabela_preco` VARCHAR(10),
  `preco_minimo` DECIMAL(12, 2),
  `data_atualizacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`grupo_id`) REFERENCES `produto_grupos`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `produto_variacoes` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `produto_id` INT NOT NULL,
    `sku` VARCHAR(50) UNIQUE,
    `tamanho` VARCHAR(20),
    `cor` VARCHAR(50),
    `estoque_atual` DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `produto_tags` (
    `produto_id` INT NOT NULL,
    `tag_id` INT NOT NULL,
    PRIMARY KEY (`produto_id`, `tag_id`),
    FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`tag_id`) REFERENCES `tags`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Create tables that depend on clientes, vendedores, produtos
CREATE TABLE `pedidos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `numero_pedido` VARCHAR(20) UNIQUE NOT NULL,
  `cliente_id` INT NOT NULL,
  `vendedor_id` INT,
  `data_pedido` DATE NOT NULL,
  `data_base` DATE,
  `data_recolhimento` DATE,
  `data_cobranca` DATE,
  `valor_total` DECIMAL(12, 2),
  `valor_venda` DECIMAL(12, 2),
  `valor_pago` DECIMAL(12, 2),
  `residuo` DECIMAL(12, 2),
  `situacao` ENUM('pendente', 'faturado', 'cancelado', 'perdido') NOT NULL DEFAULT 'pendente',
  `solicitacao_numero` VARCHAR(20),
  `retorno` VARCHAR(20),
  `cobranca` VARCHAR(20),
  `limite` VARCHAR(20),
  `via` VARCHAR(10),
  `pedido_antigo` VARCHAR(20),
  `data_pagamento` DATE,
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `compras` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `numero_pedido` VARCHAR(20) NOT NULL,
  `tipo_pedido` VARCHAR(10),
  `fornecedor_id` INT NOT NULL,
  `data_pedido` DATE NOT NULL,
  `data_entrega` DATE,
  `data_nota` DATE,
  `tipo_nota` VARCHAR(10),
  `numero_nota` VARCHAR(20),
  `valor_total_pedido` DECIMAL(12, 2),
  `valor_total_nota` DECIMAL(12, 2),
  `desconto` DECIMAL(12, 2),
  `frete` DECIMAL(12, 2),
  `situacao` VARCHAR(20),
  `parcelas` VARCHAR(10),
  `observacoes` TEXT,
  FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `movimentacoes_estoque` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `tipo_movimentacao` ENUM('devolucao', 'defeito', 'ajuste') NOT NULL,
  `numero_documento` VARCHAR(20) NOT NULL,
  `data_documento` DATE NOT NULL,
  `data_base` DATE,
  `cliente_id` INT,
  `vendedor_id` INT,
  `valor_total` DECIMAL(12, 2),
  `romaneio` VARCHAR(20),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `solicitacoes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `numero` VARCHAR(20) UNIQUE NOT NULL,
  `vendedor_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `data_solicitacao` DATE NOT NULL,
  `situacao` VARCHAR(20),
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `contas_financeiras` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `data_emissao` DATE NOT NULL,
  `tipo_documento` VARCHAR(10) NOT NULL,
  `numero_documento` VARCHAR(20) NOT NULL,
  `parcela` VARCHAR(10),
  `historico` VARCHAR(255),
  `observacoes` TEXT,
  `valor` DECIMAL(12, 2) NOT NULL,
  `tipo_cobranca` VARCHAR(10),
  `numero_cobranca` VARCHAR(20),
  `origem_cobranca` VARCHAR(20),
  `data_vencimento` DATE NOT NULL,
  `sinal` VARCHAR(1),
  `sigla` VARCHAR(10),
  `situacao` VARCHAR(20) DEFAULT 'pendente',
  `data_pagamento` DATE,
  `vendedor_id` INT,
  `acrescimo` DECIMAL(12, 2),
  `comissao` DECIMAL(12, 2),
  `data_baixa` DATE,
  `operacao` VARCHAR(10),
  `cliente_id` INT,
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Now create junction tables and tables with multiple dependencies
CREATE TABLE `pedido_itens` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pedido_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `variacao_id` INT,
  `quantidade_saida` INT NOT NULL DEFAULT 0,
  `quantidade_retorno` INT NOT NULL DEFAULT 0,
  `preco_custo` DECIMAL(12, 2),
  `preco_venda` DECIMAL(12, 2) NOT NULL,
  FOREIGN KEY (`pedido_id`) REFERENCES `pedidos`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacoes`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `compra_itens` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `compra_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `variacao_id` INT,
  `quantidade` INT NOT NULL,
  `preco_compra` DECIMAL(12, 2) NOT NULL,
  `desconto` DECIMAL(12, 2),
  `valor_total` DECIMAL(12, 2) NOT NULL,
  FOREIGN KEY (`compra_id`) REFERENCES `compras`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacoes`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE `movimentacao_itens` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `movimentacao_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `variacao_id` INT,
  `quantidade` INT NOT NULL,
  `preco_custo` DECIMAL(12, 2),
  FOREIGN KEY (`movimentacao_id`) REFERENCES `movimentacoes_estoque`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`variacao_id`) REFERENCES `produto_variacoes`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB;

-- Create remaining tables
CREATE TABLE `residuos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `data_movimento` DATE NOT NULL,
  `item` VARCHAR(20),
  `numero_documento` VARCHAR(20),
  `valor_pago` DECIMAL(12, 2)
) ENGINE=InnoDB;

CREATE TABLE `etiquetas` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `cliente_id` INT NOT NULL,
  `codigo_vendedor` VARCHAR(10),
  `nome_vendedor` VARCHAR(100),
  `sobrenome` VARCHAR(100),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- User management tables
CREATE TABLE `usuarios` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL UNIQUE,
  `senha_hash` VARCHAR(255) NOT NULL,
  `ativo` BOOLEAN DEFAULT TRUE,
  `data_criacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE `permissoes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `chave` VARCHAR(50) NOT NULL UNIQUE,
  `descricao` VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE `usuario_permissoes` (
  `usuario_id` INT NOT NULL,
  `permissao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `permissao_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`permissao_id`) REFERENCES `permissoes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

-- =============================================
-- CREATE INDEXES FOR PERFORMANCE
-- =============================================

-- Indexes for clientes
CREATE INDEX idx_clientes_nome ON `clientes`(`nome`);
CREATE INDEX idx_clientes_cidade ON `clientes`(`cidade`);
CREATE INDEX idx_clientes_rota ON `clientes`(`rota_id`);
CREATE INDEX idx_clientes_ativo ON `clientes`(`ativo`);

-- Indexes for produtos
CREATE INDEX idx_produtos_descricao ON `produtos`(`descricao`);
CREATE INDEX idx_produtos_grupo ON `produtos`(`grupo_id`);
CREATE INDEX idx_produtos_codigo ON `produtos`(`codigo`);
CREATE INDEX idx_produtos_preco_venda ON `produtos`(`preco_venda`);

-- Indexes for produto_variacoes
CREATE INDEX idx_variacoes_produto ON `produto_variacoes`(`produto_id`);
CREATE INDEX idx_variacoes_sku ON `produto_variacoes`(`sku`);

-- Indexes for tags
CREATE INDEX idx_tags_nome ON `tags`(`nome`);

-- Indexes for produto_tags
CREATE INDEX idx_produto_tags_produto ON `produto_tags`(`produto_id`);
CREATE INDEX idx_produto_tags_tag ON `produto_tags`(`tag_id`);

-- Indexes for pedidos
CREATE INDEX idx_pedidos_data ON `pedidos`(`data_pedido`);
CREATE INDEX idx_pedidos_cliente ON `pedidos`(`cliente_id`);
CREATE INDEX idx_pedidos_vendedor ON `pedidos`(`vendedor_id`);
CREATE INDEX idx_pedidos_situacao ON `pedidos`(`situacao`);
CREATE INDEX idx_pedidos_numero ON `pedidos`(`numero_pedido`);

-- Indexes for compras
CREATE INDEX idx_compras_fornecedor ON `compras`(`fornecedor_id`);
CREATE INDEX idx_compras_data ON `compras`(`data_pedido`);
CREATE INDEX idx_compras_situacao ON `compras`(`situacao`);

-- Indexes for contas_financeiras
CREATE INDEX idx_contas_vencimento ON `contas_financeiras`(`data_vencimento`);
CREATE INDEX idx_contas_situacao ON `contas_financeiras`(`situacao`);
CREATE INDEX idx_contas_cliente ON `contas_financeiras`(`cliente_id`);
CREATE INDEX idx_contas_vendedor ON `contas_financeiras`(`vendedor_id`);

-- Indexes for movimentacoes_estoque
CREATE INDEX idx_movimentacoes_tipo ON `movimentacoes_estoque`(`tipo_movimentacao`);
CREATE INDEX idx_movimentacoes_data ON `movimentacoes_estoque`(`data_documento`);
CREATE INDEX idx_movimentacoes_cliente ON `movimentacoes_estoque`(`cliente_id`);

-- Indexes for junction tables
CREATE INDEX idx_pedido_itens_pedido ON `pedido_itens`(`pedido_id`);
CREATE INDEX idx_pedido_itens_produto ON `pedido_itens`(`produto_id`);
CREATE INDEX idx_pedido_itens_variacao ON `pedido_itens`(`variacao_id`);
CREATE INDEX idx_compra_itens_compra ON `compra_itens`(`compra_id`);
CREATE INDEX idx_compra_itens_produto ON `compra_itens`(`produto_id`);
CREATE INDEX idx_compra_itens_variacao ON `compra_itens`(`variacao_id`);
CREATE INDEX idx_movimentacao_itens_mov ON `movimentacao_itens`(`movimentacao_id`);
CREATE INDEX idx_movimentacao_itens_produto ON `movimentacao_itens`(`produto_id`);
CREATE INDEX idx_movimentacao_itens_variacao ON `movimentacao_itens`(`variacao_id`);


-- =============================================
-- INSERT SAMPLE DATA (OPTIONAL)
-- =============================================

-- Insert sample rotas
INSERT INTO `rotas` (`codigo`, `bairro`, `nome`) VALUES
('R001', 'Centro', 'Rota Centro'),
('R002', 'Jardim', 'Rota Jardim'),
('R003', 'Vila Nova', 'Rota Vila Nova');

-- Insert sample vendedores
INSERT INTO `vendedores` (`codigo`, `nome`, `cpf`, `telefone`, `email`) VALUES
('V001', 'João Silva', '123.456.789-00', '(11) 9999-8888', 'joao@email.com'),
('V002', 'Maria Santos', '987.654.321-00', '(11) 7777-6666', 'maria@email.com');

-- Insert sample produto_grupos
INSERT INTO `produto_grupos` (`codigo`, `descricao`) VALUES
('G001', 'Camisetas'),
('G002', 'Calças'),
('G003', 'Vestidos'),
('G004', 'Acessórios');

-- Insert sample fornecedores
INSERT INTO `fornecedores` (`marca`, `razao_social`, `tipo_pessoa`, `cnpj`, `telefone`) VALUES
('Marca A', 'Fornecedor A Ltda', 'J', '12.345.678/0001-90', '(11) 3333-2222'),
('Marca B', 'Fornecedor B ME', 'J', '98.765.432/0001-10', '(11) 4444-3333');

-- Insert sample clientes
INSERT INTO `clientes` (`nome`, `cpf_cnpj`, `telefone`, `email`, `cidade`, `estado`, `rota_id`, `ativo`) VALUES
('Cliente A', '111.222.333-44', '(11) 5555-4444', 'clientea@email.com', 'São Paulo', 'SP', 1, TRUE),
('Cliente B', '222.333.444-55', '(11) 6666-5555', 'clienteb@email.com', 'São Paulo', 'SP', 2, TRUE);

-- Insert sample produtos
INSERT INTO `produtos` (`codigo`, `descricao`, `grupo_id`, `preco_custo`, `preco_venda`) VALUES
('P001', 'Camiseta Básica Branca', 1, 15.00, 29.90),
('P002', 'Calça Jeans Slim', 2, 45.00, 89.90),
('P003', 'Vestido Floral', 3, 35.00, 79.90),
('P004', 'Bolsa Couro', 4, 60.00, 129.90);

-- Insert sample tags
INSERT INTO `tags` (`nome`) VALUES ('Promoção'), ('Novo'), ('Verão'), ('Inverno');

-- Insert sample produto_variacoes
INSERT INTO `produto_variacoes` (`produto_id`, `sku`, `tamanho`, `cor`, `estoque_atual`) VALUES
(1, 'P001-BR-P', 'P', 'Branca', 50),
(1, 'P001-BR-M', 'M', 'Branca', 50),
(2, 'P002-JE-38', '38', 'Jeans Claro', 25),
(2, 'P002-JE-40', '40', 'Jeans Claro', 25);

-- Insert sample produto_tags
INSERT INTO `produto_tags` (`produto_id`, `tag_id`) VALUES (1, 2), (1, 3), (2, 3), (3, 1);


-- Insert sample usuario and permissions
INSERT INTO `usuarios` (`nome`, `senha_hash`, `ativo`) VALUES
('admin', '$2b$10$ExampleHashForAdmin', TRUE);

INSERT INTO `permissoes` (`chave`, `descricao`) VALUES
('clientes_ver', 'Visualizar clientes'),
('clientes_editar', 'Editar clientes'),
('produtos_ver', 'Visualizar produtos'),
('produtos_editar', 'Editar produtos'),
('pedidos_ver', 'Visualizar pedidos'),
('pedidos_editar', 'Editar pedidos');

INSERT INTO `usuario_permissoes` (`usuario_id`, `permissao_id`) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6);

-- =============================================
-- RESET COMPLETE - DATABASE READY FOR USE
-- =============================================

SELECT 'Database reset completed successfully!' as status;