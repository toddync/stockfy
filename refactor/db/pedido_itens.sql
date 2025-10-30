CREATE TABLE `pedido_itens` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `pedido_id` INT NOT NULL,
  `produto_id` INT NOT NULL,
  `quantidade` DECIMAL(10, 2) NOT NULL,
  `preco_unitario` DECIMAL(12, 2) NOT NULL,
  `valor_total` DECIMAL(12, 2) NOT NULL,
  FOREIGN KEY (`pedido_id`) REFERENCES `pedidos`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`produto_id`) REFERENCES `produtos`(`id`)
) ENGINE=InnoDB;;
