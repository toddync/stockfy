# Proposta de Esquema de Banco de Dados Normalizado para MySQL 8+

## 1. Introdução

Este documento descreve uma proposta de refatoração e normalização do esquema de banco de dados original. O objetivo é eliminar redundâncias, consolidar tabelas duplicadas, padronizar a nomenclatura e estabelecer relacionamentos claros através de chaves estrangeiras, resultando em um esquema mais robusto, eficiente e de fácil manutenção.

As tabelas com prefixo `Aux` e `Rel` foram consideradas como visões materializadas ou dados temporários para relatórios e, portanto, foram desconsideradas na criação do novo esquema. Seus dados devem ser gerados por consultas (`queries`) no novo banco de dados.

## 2. Mapeamento de Tabelas Antigas para Novas

| Tabelas Antigas Consolidadas                               | Nova Tabela Normalizada | Justificativa                                                                                                |
| ---------------------------------------------------------- | ----------------------- | ------------------------------------------------------------------------------------------------------------ |
| `Cliente`, `Auxcliente`                                    | `clientes`              | `Auxcliente` era uma cópia redundante de `Cliente`. Os dados foram unificados.                               |
| `Vendedor`                                                 | `vendedores`            | Mapeamento direto.                                                                                           |
| `Fornecedor`, `Auxfornecedor`                              | `fornecedores`          | `Auxfornecedor` era uma cópia redundante.                                                                    |
| `Artigo`, `Produto`                                        | `produtos`              | Ambas as tabelas representavam produtos. Foram unificadas.                                                   |
| `Grupo`                                                    | `produto_grupos`        | Renomeada para clareza.                                                                                      |
| `Compra`, `Auxcompra`                                      | `compras`               | `Auxcompra` era uma cópia redundante.                                                                        |
| `Itemcompra`, `Auxitcom`, `Auxlistcom`                     | `compra_itens`          | Tabelas de itens de compra foram consolidadas.                                                               |
| `Perdido`, `Solicitacao`, `Auxpedido`, `Relpedido`         | `pedidos`               | Todas representavam diferentes estados ou visões de um pedido. Unificadas com uma coluna `status`.           |
| `Itempedido`, `Itemperdido`, `ItSolicit`, `Auxitens`       | `pedido_itens`          | Tabelas de itens de pedido foram consolidadas.                                                               |
| `Contas`, `AuxConta`, `Cobranca`, `Lancamento`             | `contas_a_pagar_receber`| Unifica todas as tabelas relacionadas a movimentações financeiras.                                           |
| `Arqsenhas`, `Cadsenhas`, `Arqlogin`, `Cadlogin`           | `usuarios`, `permissoes`| A estrutura antiga com flags foi normalizada para um sistema de usuários e permissões.                       |
| `Rota`                                                     | `rotas`                 | Mapeamento direto, renomeada para o plural.                                                                  |
| `Defeito`, `Devolucao`                                     | `movimentacoes_estoque` | Representam tipos de movimentação de estoque. Unificadas com uma coluna `tipo` e um `numero_documento` para agrupar itens. |

---

## 3. Esquema Detalhado das Novas Tabelas

A seguir, a estrutura DDL (`CREATE TABLE`) para cada nova tabela.

### `clientes`
- **Origem:** `Cliente`, `Auxcliente`
- **Descrição:** Armazena informações cadastrais dos clientes.
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
) ENGINE=InnoDB;
```

### `vendedores`
- **Origem:** `Vendedor`
- **Descrição:** Cadastro de vendedores.
```sql
CREATE TABLE `vendedores` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(15) UNIQUE,
  `email` VARCHAR(100),
  `telefone` VARCHAR(50)
) ENGINE=InnoDB;
```

### `fornecedores`
- **Origem:** `Fornecedor`, `Auxfornecedor`
- **Descrição:** Cadastro de fornecedores.
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
) ENGINE=InnoDB;
```

### `produto_grupos`
- **Origem:** `Grupo`
- **Descrição:** Categorias ou grupos de produtos.
```sql
CREATE TABLE `produto_grupos` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `descricao` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;
```

### `produtos`
- **Origem:** `Artigo`, `Produto`
- **Descrição:** Cadastro de produtos.
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
) ENGINE=InnoDB;
```

### `pedidos`
- **Origem:** `Perdido`, `Solicitacao`, `Auxpedido`
- **Descrição:** Armazena os pedidos de venda.
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
) ENGINE=InnoDB;
```

### `pedido_itens`
- **Origem:** `Itempedido`, `Itemperdido`, `ItSolicit`
- **Descrição:** Itens que compõem um pedido de venda.
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
) ENGINE=InnoDB;
```

### `usuarios`
- **Origem:** `Arqsenhas`, `Cadsenhas`, `Arqlogin`
- **Descrição:** Usuários do sistema.
```sql
CREATE TABLE `usuarios` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nome` VARCHAR(100) NOT NULL UNIQUE,
  `senha_hash` VARCHAR(255) NOT NULL,
  `ativo` BOOLEAN DEFAULT TRUE
) ENGINE=InnoDB;

### `contagens_estoque`
- **Origem:** `CONTAGEM`
- **Descrição:** Armazena os registros de contagem de estoque por produto e data.
```sql
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
```

### `permissoes`
- **Origem:** Colunas de flags em `Arqsenhas` e `Cadsenhas`
- **Descrição:** Tabela de permissões granulares para um sistema de controle de acesso.
```sql
CREATE TABLE `permissoes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `chave` VARCHAR(50) NOT NULL UNIQUE COMMENT 'Ex: clientes_editar, pedidos_ver',
  `descricao` VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE `usuario_permissoes` (
  `usuario_id` INT NOT NULL,
  `permissao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `permissao_id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `usuarios`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`permissao_id`) REFERENCES `permissoes`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;