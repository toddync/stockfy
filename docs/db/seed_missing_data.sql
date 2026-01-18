-- Seeding missing test data for Phase 3 tables
USE stockify_db;
SET FOREIGN_KEY_CHECKS = 0;

1. Praças (Some might already be there via migration, but let's ensure we have a solid set)
INSERT IGNORE INTO `pracas` (`codigo`, `nome`) VALUES
('001', 'Rio de Janeiro - Centro'),
('002', 'Niterói'),
('003', 'Baixada Fluminense'),
('004', 'Região dos Lagos');

-- 2. Permissões
INSERT IGNORE INTO `permissoes` (`chave`, `descricao`) VALUES
('ADMIN', 'Acesso total ao sistema'),
('VENDAS_VIEW', 'Visualizar pedidos'),
('VENDAS_EDIT', 'Criar/Editar pedidos'),
('ESTOQUE_MANAGE', 'Gerenciar movimentações de estoque'),
('FINANCEIRO_VIEW', 'Visualizar contas a pagar/receber'),
('FINANCEIRO_BAIXA', 'Realizar baixa de títulos');

-- 3. Usuario Permissões (Admin gets everything)
-- Assuming admin has ID 1
INSERT IGNORE INTO `usuario_permissoes` (`usuario_id`, `permissao_id`)
SELECT 1, id FROM `permissoes`;

-- 4. Solicitações
INSERT IGNORE INTO `solicitacoes` (`numero`, `vendedor_id`, `cliente_id`, `data_solicitacao`, `situacao`) VALUES
('SOL001', 1, 1, '2023-12-15', 'Pendente'),
('SOL002', 2, 2, '2023-12-16', 'Aprovada'),
('SOL003', 1, 3, '2023-12-17', 'Cancelada');

-- 5. Resíduos
INSERT IGNORE INTO `residuos` (`data_movimento`, `item`, `numero_documento`, `valor_pago`) VALUES
('2023-12-10', 'Retalhos', 'RES001', 50.00),
('2023-12-12', 'Embalagens', 'RES002', 25.50),
('2023-12-14', 'Outros', 'RES003', 15.00);

-- Update some existing clients/rotas with praca_id if columns exist
UPDATE `rotas` SET `praca_id` = 1 WHERE `id` = 1;
UPDATE `rotas` SET `praca_id` = 2 WHERE `id` = 2;
UPDATE `clientes` SET `praca_id` = 1 WHERE `id` = 1;
UPDATE `clientes` SET `tabela_preco` = 'A' WHERE `id` = 1;
UPDATE `clientes` SET `praca_id` = 2 WHERE `id` = 2;
UPDATE `clientes` SET `tabela_preco` = 'B' WHERE `id` = 2;

SET FOREIGN_KEY_CHECKS = 1;
