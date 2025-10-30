CREATE TABLE `fornecedores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `razao_social` VARCHAR(100) NOT NULL,
  `nome_fantasia` VARCHAR(100),
  `cnpj` VARCHAR(20) UNIQUE,
  `ie` VARCHAR(20),
  `endereco` VARCHAR(255),
  `cidade` VARCHAR(100),
  `estado` CHAR(2),
  `telefone` VARCHAR(50)
) ENGINE=InnoDB;;
