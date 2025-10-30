CREATE TABLE `produtos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao` VARCHAR(150) NOT NULL,
  `codigo_barras` VARCHAR(50) UNIQUE,
  `grupo_id` INT,
  `preco_custo` DECIMAL(12, 2),
  `preco_venda` DECIMAL(12, 2),
  `estoque_atual` DECIMAL(10, 2) DEFAULT 0,
  FOREIGN KEY (`grupo_id`) REFERENCES `produto_grupos`(`id`)
) ENGINE=InnoDB;;
