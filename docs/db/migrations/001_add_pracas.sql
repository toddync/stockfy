-- Migration: Adicionar tabela Praças e relacionamentos
-- Data: 2025-12-12
-- Descrição: Fase 1 do sistema SYS_ROSAS
USE stockify_db;

-- =============================================
-- 1. CRIAR TABELA PRAÇAS
-- =============================================
CREATE TABLE IF NOT EXISTS `pracas` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `codigo` VARCHAR(10) UNIQUE NOT NULL,
  `nome` VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- =============================================
-- 2. ADICIONAR praca_id EM ROTAS
-- =============================================
ALTER TABLE `rotas` ADD COLUMN IF NOT EXISTS `praca_id` INT;
ALTER TABLE `rotas` ADD CONSTRAINT `fk_rotas_pracas`
  FOREIGN KEY (`praca_id`) REFERENCES `pracas`(`id`) ON DELETE SET NULL;

-- =============================================
-- 3. ADICIONAR CAMPOS EM PRODUTOS
-- =============================================
ALTER TABLE `produtos` ADD COLUMN IF NOT EXISTS `preco_compra` DECIMAL(12, 2);
ALTER TABLE `produtos` ADD COLUMN IF NOT EXISTS `preco_venda_b` DECIMAL(12, 2);

-- =============================================
-- 4. ADICIONAR CAMPOS EM CLIENTES
-- =============================================
ALTER TABLE `clientes` ADD COLUMN IF NOT EXISTS `praca_id` INT;
ALTER TABLE `clientes` ADD COLUMN IF NOT EXISTS `tabela_preco` CHAR(1) DEFAULT 'A';
ALTER TABLE `clientes` ADD CONSTRAINT `fk_clientes_pracas`
  FOREIGN KEY (`praca_id`) REFERENCES `pracas`(`id`) ON DELETE SET NULL;

-- =============================================
-- 5. CRIAR ÍNDICES
-- =============================================
CREATE INDEX IF NOT EXISTS `idx_rotas_praca` ON `rotas`(`praca_id`);
CREATE INDEX IF NOT EXISTS `idx_clientes_praca` ON `clientes`(`praca_id`);
CREATE INDEX IF NOT EXISTS `idx_clientes_tabela_preco` ON `clientes`(`tabela_preco`);

-- Verificar
SELECT 'Migration completed!' as status;
