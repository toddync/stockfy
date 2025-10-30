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
  `data_cadastro` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `ativo` BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;;
