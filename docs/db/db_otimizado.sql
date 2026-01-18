-- Tabelas principais
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
  FOREIGN KEY (`rota_id`) REFERENCES `rotas`(`id`)
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

CREATE TABLE `produtos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `codigo` VARCHAR(20) UNIQUE NOT NULL,
  `descricao` VARCHAR(150) NOT NULL,
  `grupo_id` INT NOT NULL,
  `preco_custo` DECIMAL(12, 2),
  `preco_venda` DECIMAL(12, 2),
  `estoque_atual` DECIMAL(10, 2) DEFAULT 0,
  `tabela_preco` VARCHAR(10),
  `preco_minimo` DECIMAL(12, 2),
  `data_atualizacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`grupo_id`) REFERENCES `produto_grupos`(`id`)
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

-- Tabelas de movimentações
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
  `situacao` ENUM('pendente', 'faturado', 'cancelado', 'perdido') NOT NULL,
  `solicitacao_numero` VARCHAR(20),
  `retorno` VARCHAR(20),
  `cobranca` VARCHAR(20),
  `limite` VARCHAR(20),
  `via` VARCHAR(10),
  `pedido_antigo` VARCHAR(20),
  `data_pagamento` DATE,
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`),
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`)
) ENGINE=InnoDB;

CREATE TABLE `pedido_itens` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pedido_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade_saida` INT NOT NULL DEFAULT 0,
  `quantidade_retorno` INT NOT NULL DEFAULT 0,
  `preco_custo` DECIMAL(12, 2),
  `preco_venda` DECIMAL(12, 2) NOT NULL,
  FOREIGN KEY (`pedido_id`) REFERENCES `pedidos`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`)
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
  FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedores`(`id`)
) ENGINE=InnoDB;

CREATE TABLE `compra_itens` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `compra_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_compra` DECIMAL(12, 2) NOT NULL,
  `desconto` DECIMAL(12, 2),
  `valor_total` DECIMAL(12, 2) NOT NULL,
  `tamanho` VARCHAR(10),
  `cor` VARCHAR(30),
  FOREIGN KEY (`compra_id`) REFERENCES `compras`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`)
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
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`),
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`)
) ENGINE=InnoDB;

CREATE TABLE `movimentacao_itens` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `movimentacao_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_custo` DECIMAL(12, 2),
  FOREIGN KEY (`movimentacao_id`) REFERENCES `movimentacoes_estoque`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`)
) ENGINE=InnoDB;

-- Tabelas auxiliares
CREATE TABLE `rotas` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `codigo` VARCHAR(10) UNIQUE NOT NULL,
  `bairro` VARCHAR(100),
  `nome` VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE `solicitacoes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `numero` VARCHAR(20) UNIQUE NOT NULL,
  `vendedor_id` INT NOT NULL,
  `cliente_id` INT NOT NULL,
  `data_solicitacao` DATE NOT NULL,
  `situacao` VARCHAR(20),
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`)
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
  `situacao` VARCHAR(20),
  `data_pagamento` DATE,
  `vendedor_id` INT,
  `acrescimo` DECIMAL(12, 2),
  `comissao` DECIMAL(12, 2),
  `data_baixa` DATE,
  `operacao` VARCHAR(10),
  `cliente_id` INT,
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`)
) ENGINE=InnoDB;

CREATE TABLE `residuos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `data_movimento` DATE NOT NULL,
  `item` VARCHAR(20),
  `numero_documento` VARCHAR(20),
  `valor_pago` DECIMAL(12, 2)
) ENGINE=InnoDB;

-- Tabelas de suporte
CREATE TABLE `etiquetas` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `cliente_id` INT NOT NULL,
  `codigo_vendedor` VARCHAR(10),
  `nome_vendedor` VARCHAR(100),
  `sobrenome` VARCHAR(100),
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`)
) ENGINE=InnoDB;

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

-- Índices para melhor performance
CREATE INDEX idx_clientes_nome ON `clientes`(`nome`);
CREATE INDEX idx_clientes_cidade ON `clientes`(`cidade`);
CREATE INDEX idx_clientes_rota ON `clientes`(`rota_id`);
CREATE INDEX idx_produtos_descricao ON `produtos`(`descricao`);
CREATE INDEX idx_produtos_grupo ON `produtos`(`grupo_id`);
CREATE INDEX idx_pedidos_data ON `pedidos`(`data_pedido`);
CREATE INDEX idx_pedidos_cliente ON `pedidos`(`cliente_id`);
CREATE INDEX idx_pedidos_vendedor ON `pedidos`(`vendedor_id`);
CREATE INDEX idx_compras_fornecedor ON `compras`(`fornecedor_id`);
CREATE INDEX idx_compras_data ON `compras`(`data_pedido`);
CREATE INDEX idx_contas_vencimento ON `contas_financeiras`(`data_vencimento`);
CREATE INDEX idx_contas_situacao ON `contas_financeiras`(`situacao`);