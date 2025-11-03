<?php

require_once __DIR__ . '/../core/Database.php';

class RelatorioArtigos {
    private $conn;
    private $table_artigo = "ARTIGO"; // Tabela principal de artigos
    private $table_aux_mapa = "AUXMAPA"; // Tabela auxiliar para relatórios
    private $table_aux_relmapa = "AUXRELMAPA"; // Outra tabela auxiliar para relatórios

    public function __construct() {
        $this->conn = Database::getConnection();
    }

    /**
     * Obtém dados para o relatório "RETOR. NO PERIODO(PROD)".
     * Calcula quantidades e valores de saída e retorno/devolução de produtos em um período.
     *
     * @param string $dataInicial Data de início do período (YYYY-MM-DD)
     * @param string $dataFinal Data de fim do período (YYYY-MM-DD)
     * @return array Dados do relatório
     */
    public function getRetornoNoPeriodo($dataInicial, $dataFinal) {
        // Implementação da lógica para o relatório "RETOR. NO PERIODO(PROD)"
        // Baseado na análise do URelartigos.pas, esta lógica envolve:
        // 1. Limpar tabelas auxiliares (AUXMAPA, AUXRELMAPA)
        // 2. Inserir dados de vendas/saídas na AUXMAPA
        // 3. Inserir dados de devoluções/retornos na AUXMAPA
        // 4. Processar e consolidar dados para o relatório final
        // 5. Selecionar os dados da AUXMAPA ou de uma query consolidada

        // Exemplo simplificado:
        $query = "
            SELECT
                a.CODIGO,
                a.DESCRICAO,
                SUM(CASE WHEN t.TIPO = 'SAIDA' THEN t.QUANTIDADE ELSE 0 END) AS QUANTIDADE_SAIDA,
                SUM(CASE WHEN t.TIPO = 'SAIDA' THEN t.VALOR_TOTAL ELSE 0 END) AS VALOR_SAIDA,
                SUM(CASE WHEN t.TIPO = 'RETORNO' THEN t.QUANTIDADE ELSE 0 END) AS QUANTIDADE_RETORNO,
                SUM(CASE WHEN t.TIPO = 'RETORNO' THEN t.VALOR_TOTAL ELSE 0 END) AS VALOR_RETORNO
            FROM
                " . $this->table_artigo . " a
            LEFT JOIN
                (
                    -- Exemplo de subquery para saídas e retornos (ajustar conforme o schema real)
                    SELECT
                        ia.COD_ARTIGO AS CODIGO,
                        'SAIDA' AS TIPO,
                        ia.QUANTIDADE,
                        ia.QUANTIDADE * ia.PRECO_UNITARIO AS VALOR_TOTAL,
                        p.DATA_PEDIDO AS DATA
                    FROM
                        ITEM_PEDIDO ia
                    JOIN
                        PEDIDO p ON ia.COD_PEDIDO = p.CODIGO
                    WHERE
                        p.DATA_PEDIDO BETWEEN :dataInicial AND :dataFinal
                    UNION ALL
                    SELECT
                        id.COD_ARTIGO AS CODIGO,
                        'RETORNO' AS TIPO,
                        id.QUANTIDADE,
                        id.QUANTIDADE * id.PRECO_UNITARIO AS VALOR_TOTAL,
                        d.DATA_DEVOLUCAO AS DATA
                    FROM
                        ITEM_DEVOLUCAO id
                    JOIN
                        DEVOLUCAO d ON id.COD_DEVOLUCAO = d.CODIGO
                    WHERE
                        d.DATA_DEVOLUCAO BETWEEN :dataInicial AND :dataFinal
                ) t ON a.CODIGO = t.CODIGO
            GROUP BY
                a.CODIGO, a.DESCRICAO
            ORDER BY
                a.DESCRICAO
        ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":dataInicial", $dataInicial);
        $stmt->bindParam(":dataFinal", $dataFinal);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém dados para o relatório "MOVIMENTO DO ESTOQUE".
     * Gera um relatório detalhado do movimento de estoque, considerando estoque inicial, compras, defeitos, devoluções, vendas, e calculando o estoque apurado e a média.
     *
     * @param string $dataInicial Data de início do período (YYYY-MM-DD)
     * @param string $dataFinal Data de fim do período (YYYY-MM-DD)
     * @param bool $atualizarEstoque Indica se o estoque na tabela ARTIGO deve ser atualizado
     * @return array Dados do relatório
     */
    public function getMovimentoEstoque($dataInicial, $dataFinal, $atualizarEstoque = false) {
        // Implementação da lógica para o relatório "MOVIMENTO DO ESTOQUE"
        // Esta é uma lógica complexa que envolve várias tabelas e cálculos.
        // A versão Delphi usa AUXMAPA e AUXRELMAPA para consolidar dados.
        // Aqui, tentaremos fazer em uma única query ou com queries mais otimizadas.

        // 1. Calcular estoque inicial para cada artigo antes de $dataInicial
        // 2. Somar compras, defeitos, devoluções, vendas no período
        // 3. Calcular estoque apurado e média

        // Exemplo simplificado (requer ajuste para o schema real e lógica completa):
        $query = "
            SELECT
                a.CODIGO,
                a.DESCRICAO,
                (
                    SELECT SUM(COALESCE(ic.QUANTIDADE, 0)) - SUM(COALESCE(iv.QUANTIDADE, 0))
                    FROM ITEM_COMPRA ic
                    LEFT JOIN ITEM_VENDA iv ON ic.COD_ARTIGO = iv.COD_ARTIGO AND iv.DATA_VENDA < :dataInicial
                    WHERE ic.COD_ARTIGO = a.CODIGO AND ic.DATA_COMPRA < :dataInicial
                ) AS ESTOQUE_INICIAL,
                SUM(COALESCE(ic.QUANTIDADE, 0)) AS COMPRAS_PERIODO,
                SUM(COALESCE(id.QUANTIDADE, 0)) AS DEFEITOS_PERIODO,
                SUM(COALESCE(idev.QUANTIDADE, 0)) AS DEVOLUCOES_PERIODO,
                SUM(COALESCE(iv.QUANTIDADE, 0)) AS VENDAS_PERIODO
            FROM
                " . $this->table_artigo . " a
            LEFT JOIN
                ITEM_COMPRA ic ON a.CODIGO = ic.COD_ARTIGO AND ic.DATA_COMPRA BETWEEN :dataInicial AND :dataFinal
            LEFT JOIN
                ITEM_DEFEITO id ON a.CODIGO = id.COD_ARTIGO AND id.DATA_DEFEITO BETWEEN :dataInicial AND :dataFinal
            LEFT JOIN
                ITEM_DEVOLUCAO idev ON a.CODIGO = idev.COD_ARTIGO AND idev.DATA_DEVOLUCAO BETWEEN :dataInicial AND :dataFinal
            LEFT JOIN
                ITEM_VENDA iv ON a.CODIGO = iv.COD_ARTIGO AND iv.DATA_VENDA BETWEEN :dataInicial AND :dataFinal
            GROUP BY
                a.CODIGO, a.DESCRICAO
            ORDER BY
                a.DESCRICAO
        ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":dataInicial", $dataInicial);
        $stmt->bindParam(":dataFinal", $dataFinal);
        $stmt->execute();

        $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Lógica para calcular estoque apurado e média (pode ser feita no PHP ou na query)
        foreach ($results as &$row) {
            $row['ESTOQUE_APURADO'] = $row['ESTOQUE_INICIAL'] + $row['COMPRAS_PERIODO'] - $row['DEFEITOS_PERIODO'] + $row['DEVOLUCOES_PERIODO'] - $row['VENDAS_PERIODO'];
            // Lógica para média (ex: média de vendas no período)
            $row['MEDIA'] = $row['VENDAS_PERIODO'] > 0 ? $row['VENDAS_PERIODO'] / (strtotime($dataFinal) - strtotime($dataInicial) + 1) : 0; // Exemplo simples
        }

        if ($atualizarEstoque) {
            // Lógica para atualizar o campo ESTOQUE na tabela ARTIGO
            // Isso deve ser feito em uma transação para garantir a integridade dos dados.
            foreach ($results as $row) {
                $updateQuery = "UPDATE " . $this->table_artigo . " SET ESTOQUE = :estoqueApurado WHERE CODIGO = :codigo";
                $updateStmt = $this->conn->prepare($updateQuery);
                $updateStmt->bindParam(":estoqueApurado", $row['ESTOQUE_APURADO']);
                $updateStmt->bindParam(":codigo", $row['CODIGO']);
                $updateStmt->execute();
            }
        }

        return $results;
    }

    /**
     * Obtém dados para o relatório "MOVIMENTAÇÃO GERAL".
     * Similar ao movimento de estoque, mas focado em valores.
     *
     * @param string $dataInicial Data de início do período (YYYY-MM-DD)
     * @param string $dataFinal Data de fim do período (YYYY-MM-DD)
     * @return array Dados do relatório
     */
    public function getMovimentacaoGeral($dataInicial, $dataFinal) {
        // Implementação da lógica para o relatório "MOVIMENTAÇÃO GERAL"
        // Esta lógica é muito similar ao "MOVIMENTO DO ESTOQUE", mas foca em valores.
        // Reutilizar ou adaptar a lógica do getMovimentoEstoque, ajustando para valores.

        // Exemplo simplificado:
        $query = "
            SELECT
                a.CODIGO,
                a.DESCRICAO,
                SUM(COALESCE(ic.VALOR_TOTAL, 0)) AS VALOR_COMPRAS_PERIODO,
                SUM(COALESCE(id.VALOR_TOTAL, 0)) AS VALOR_DEFEITOS_PERIODO,
                SUM(COALESCE(idev.VALOR_TOTAL, 0)) AS VALOR_DEVOLUCOES_PERIODO,
                SUM(COALESCE(iv.VALOR_TOTAL, 0)) AS VALOR_VENDAS_PERIODO
            FROM
                " . $this->table_artigo . " a
            LEFT JOIN
                ITEM_COMPRA ic ON a.CODIGO = ic.COD_ARTIGO AND ic.DATA_COMPRA BETWEEN :dataInicial AND :dataFinal
            LEFT JOIN
                ITEM_DEFEITO id ON a.CODIGO = id.COD_ARTIGO AND id.DATA_DEFEITO BETWEEN :dataInicial AND :dataFinal
            LEFT JOIN
                ITEM_DEVOLUCAO idev ON a.CODIGO = idev.COD_ARTIGO AND idev.DATA_DEVOLUCAO BETWEEN :dataInicial AND :dataFinal
            LEFT JOIN
                ITEM_VENDA iv ON a.CODIGO = iv.COD_ARTIGO AND iv.DATA_VENDA BETWEEN :dataInicial AND :dataFinal
            GROUP BY
                a.CODIGO, a.DESCRICAO
            ORDER BY
                a.DESCRICAO
        ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(":dataInicial", $dataInicial);
        $stmt->bindParam(":dataFinal", $dataFinal);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

?>