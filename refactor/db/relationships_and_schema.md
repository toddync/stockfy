# Documentação do Esquema do Banco de Dados

## Tabela: `clientes`

```sql
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
```

## Tabela: `fornecedores`

```sql
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
```

## Tabela: `pedido_itens`

```sql
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
```

**Relacionamentos:**
- A coluna `pedido_id` referencia a tabela `pedidos` (coluna `id`).
- A coluna `produto_id` referencia a tabela `produtos` (coluna `id`).

## Tabela: `pedidos`

```sql
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
```

**Relacionamentos:**
- A coluna `cliente_id` referencia a tabela `clientes` (coluna `id`).
- A coluna `vendedor_id` referencia a tabela `vendedores` (coluna `id`).

## Tabela: `produto_grupos`

```sql
CREATE TABLE `produto_grupos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;;
```

## Tabela: `produtos`

```sql
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
```

**Relacionamentos:**
- A coluna `grupo_id` referencia a tabela `produto_grupos` (coluna `id`).

## Tabela: `usuarios`

```sql
CREATE TABLE `usuarios` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL UNIQUE,
  `senha_hash` VARCHAR(255) NOT NULL,
  `ativo` BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;;
```

## Tabela: `vendedores`

```sql
CREATE TABLE `vendedores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(15) UNIQUE,
  `email` VARCHAR(100),
  `telefone` VARCHAR(50)
) ENGINE=InnoDB;;
```

