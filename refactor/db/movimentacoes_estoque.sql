CREATE TABLE `movimentacoes_estoque` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `numero_documento` VARCHAR(6) NOT NULL,
  `data_movimentacao` DATE NOT NULL,
  `tipo` VARCHAR(10) NOT NULL COMMENT 'Ex: "defeito", "devolucao", "ajuste"',
  `produto_id` INT NOT NULL,
  `descricao_produto` VARCHAR(150),
  `quantidade` DECIMAL(10, 2) NOT NULL,
  `preco_custo` DECIMAL(12, 2) DEFAULT 0,
  `data_registro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`)
) ENGINE=InnoDB;