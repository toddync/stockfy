CREATE TABLE `pedidos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `cliente_id` INT NOT NULL,
  `vendedor_id` INT,
  `data_emissao` DATE NOT NULL,
  `data_entrega` DATE,
  `valor_total` DECIMAL(12, 2),
  `status` ENUM('orçamento', 'emitido', 'faturado', 'cancelado', 'perdido') NOT NULL,
  `observacoes` TEXT,
  FOREIGN KEY (`cliente_id`) REFERENCES `clientes`(`id`),
  FOREIGN KEY (`vendedor_id`) REFERENCES `vendedores`(`id`)
) ENGINE=InnoDB;;
