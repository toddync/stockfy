CREATE TABLE `vendedores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(15) UNIQUE,
  `email` VARCHAR(100),
  `telefone` VARCHAR(50)
) ENGINE=InnoDB;;
