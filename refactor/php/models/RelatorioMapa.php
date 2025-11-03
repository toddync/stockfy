<?php

require_once __DIR__ . '/../core/Database.php';

class RelatorioMapa
{
    private $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    /**
     * Busca a movimentação geral de artigos para um vendedor ou cliente em um período.
     * Equivalente à lógica do Button4Click e Button7Click no Delphi.
     *
     * @param string $tipo 'vendedor' ou 'cliente'
     * @param string $codigo Código do vendedor ou cliente
     * @param string $dataInicio Data de início do período (YYYY-MM-DD)
     * @param string $dataFim Data de fim do período (YYYY-MM-DD)
     * @param float|null $percentualLimite Percentual limite para filtro (apenas para tipo 'cliente')
     * @return array
     */
    public function getMovimentacaoGeralArtigos($tipo, $codigo, $dataInicio, $dataFim, $percentualLimite = null)
    {
        $artigos = $this->getArtigos();
        $movimentacao = [];

        foreach ($artigos as $artigo) {
            $movimentacao[$artigo['codigo']] = [
                'codigo' => $artigo['codigo'],
                'descricao' => $artigo['descricao'],
                'custo' => $artigo['custo'],
                'qtdFisica' => 0,
                'valFisico' => 0,
                'qtdSacoleira' => 0,
                'valSacoleira' => 0,
                'qtdRetornoDevolucao' => 0,
                'qtdVendido' => 0,
                'valVendido' => 0,
                'media' => 0,
            ];
        }

        // Processar Saídas (PEDIDO.Situ <> 'X')
        $pedidosSaida = $this->getPedidosPorPeriodoECodigo($tipo, $codigo, $dataInicio, $dataFim, ['X'], false);
        foreach ($pedidosSaida as $pedido) {
            $itensPedido = $this->getItensPedido($pedido['pedido_id']);
            foreach ($itensPedido as $item) {
                if (isset($movimentacao[$item['codart']])) {
                    $movimentacao[$item['codart']]['qtdFisica'] += $item['qtdsai'];
                    $movimentacao[$item['codart']]['valFisico'] += ($item['qtdsai'] * $item['precus']);
                }
            }
        }

        // Processar Retornos (PEDIDO.Situ = 'R')
        $pedidosRetorno = $this->getPedidosPorPeriodoECodigo($tipo, $codigo, $dataInicio, $dataFim, ['R'], true);
        foreach ($pedidosRetorno as $pedido) {
            $itensPedido = $this->getItensPedido($pedido['pedido_id']);
            foreach ($itensPedido as $item) {
                if (isset($movimentacao[$item['codart']])) {
                    $movimentacao[$item['codart']]['qtdRetornoDevolucao'] += $item['qtdret'];
                }
            }
        }

        // Processar Devoluções (PEDIDO.Situ = 'D')
        $pedidosDevolucao = $this->getPedidosPorPeriodoECodigo($tipo, $codigo, $dataInicio, $dataFim, ['D'], true);
        foreach ($pedidosDevolucao as $pedido) {
            $itensPedido = $this->getItensPedido($pedido['pedido_id']);
            foreach ($itensPedido as $item) {
                if (isset($movimentacao[$item['codart']])) {
                    $movimentacao[$item['codart']]['qtdRetornoDevolucao'] += $item['qtdret'];
                }
            }
        }

        // Processar Na Sacoleira (PEDIDO.Situ = 'E')
        $pedidosSacoleira = $this->getPedidosPorPeriodoECodigo($tipo, $codigo, $dataInicio, $dataFim, ['E'], false);
        foreach ($pedidosSacoleira as $pedido) {
            $itensPedido = $this->getItensPedido($pedido['pedido_id']);
            foreach ($itensPedido as $item) {
                if (isset($movimentacao[$item['codart']])) {
                    $movimentacao[$item['codart']]['qtdSacoleira'] += $item['qtdsai'];
                    $movimentacao[$item['codart']]['valSacoleira'] += ($item['qtdsai'] * $item['precus']);
                }
            }
        }

        // Processar Vendido (PEDIDO.Situ <> 'E' e <> 'X')
        $pedidosVendido = $this->getPedidosPorPeriodoECodigo($tipo, $codigo, $dataInicio, $dataFim, ['E', 'X'], false);
        foreach ($pedidosVendido as $pedido) {
            $itensPedido = $this->getItensPedido($pedido['pedido_id']);
            foreach ($itensPedido as $item) {
                if (isset($movimentacao[$item['codart']])) {
                    $qtdVendida = $item['qtdsai'] - $item['qtdret'];
                    $movimentacao[$item['codart']]['qtdVendido'] += $qtdVendida;
                    $movimentacao[$item['codart']]['valVendido'] += ($qtdVendida * $item['precus']);
                }
            }
        }

        // Calcular Média e filtrar por percentualLimite
        $resultados = [];
        foreach ($movimentacao as $artigo) {
            if ($artigo['qtdFisica'] > 0) {
                $artigo['media'] = ($artigo['qtdVendido'] * 100) / $artigo['qtdFisica'];
            }

            if ($artigo['qtdFisica'] > 0 && ($percentualLimite === null || $artigo['media'] > $percentualLimite)) {
                $resultados[] = $artigo;
            }
        }

        return $resultados;
    }

    /**
     * Busca pedidos com resíduos para cobrança para um vendedor em um período.
     * Equivalente à lógica do Button2Click no Delphi.
     *
     * @param string $codVendedor Código do vendedor
     * @param string $dataInicio Data de início do período (YYYY-MM-DD)
     * @param string $dataFim Data de fim do período (YYYY-MM-DD)
     * @param string $pracaInicio Praça inicial (para filtro)
     * @param string $pracaFim Praça final (para filtro)
     * @return array
     */
    public function getPedidosComResiduos($codVendedor, $dataInicio, $dataFim, $pracaInicio, $pracaFim)
    {
        $query = "
            SELECT
                p.pedido_id,
                p.codcli,
                p.nomcli,
                p.base_data AS emissao,
                p.recol_data AS devolucao,
                p.datpag,
                p.cobran_data AS vencimento,
                p.valpag,
                p.totven,
                p.residuo,
                p.situ,
                c.ntel,
                c.bair,
                c.praca
            FROM
                PEDIDO p
            JOIN
                CLIENTE c ON p.codcli = c.idcli
            WHERE
                p.codven = :cod_vendedor AND
                p.residuo > 0 AND
                p.cob = ' ' AND
                p.situ <> 'E' AND
                p.situ <> 'X' AND
                p.base_data >= :data_inicio AND
                p.base_data <= :data_fim AND
                c.praca >= :praca_inicio AND
                c.praca <= :praca_fim
            ORDER BY
                p.pedido_id
        ";

        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':cod_vendedor', $codVendedor);
        $stmt->bindValue(':data_inicio', $dataInicio);
        $stmt->bindValue(':data_fim', $dataFim);
        $stmt->bindValue(':praca_inicio', $pracaInicio);
        $stmt->bindValue(':praca_fim', $pracaFim);
        $stmt->execute();

        $pedidos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Adicionar pagamentos de resíduos
        foreach ($pedidos as &$pedido) {
            $pedido['pagamentos_residuos'] = $this->getPagamentosResiduos($pedido['pedido_id'], $dataInicio, $dataFim);
        }

        return $pedidos;
    }

    /**
     * Busca cobranças efetuadas para um vendedor em um período.
     * Equivalente à lógica do Button3Click no Delphi.
     *
     * @param string $codVendedor Código do vendedor
     * @param string $dataInicio Data de início do período (YYYY-MM-DD)
     * @param string $dataFim Data de fim do período (YYYY-MM-DD)
     * @param string $pracaInicio Praça inicial (para filtro)
     * @param string $pracaFim Praça final (para filtro)
     * @return array
     */
    public function getCobrancasEfetuadas($codVendedor, $dataInicio, $dataFim, $pracaInicio, $pracaFim)
    {
        $query = "
            SELECT
                p.pedido_id,
                p.codcli,
                p.nomcli,
                p.cobran_data AS vencimento,
                p.totven,
                p.residuo,
                p.situ,
                c.ntel,
                c.bair,
                c.praca
            FROM
                PEDIDO p
            JOIN
                CLIENTE c ON p.codcli = c.idcli
            WHERE
                p.codven = :cod_vendedor AND
                p.situ <> 'E' AND
                p.situ <> 'X' AND
                p.datpag >= :data_inicio AND
                p.datpag <= :data_fim AND
                c.praca >= :praca_inicio AND
                c.praca <= :praca_fim
            ORDER BY
                p.pedido_id
        ";

        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':cod_vendedor', $codVendedor);
        $stmt->bindValue(':data_inicio', $dataInicio);
        $stmt->bindValue(':data_fim', $dataFim);
        $stmt->bindValue(':praca_inicio', $pracaInicio);
        $stmt->bindValue(':praca_fim', $pracaFim);
        $stmt->execute();

        $pedidos = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Adicionar pagamentos de resíduos
        foreach ($pedidos as &$pedido) {
            $pedido['pagamentos_residuos'] = $this->getPagamentosResiduos($pedido['pedido_id'], $dataInicio, $dataFim);
        }

        return $pedidos;
    }

    /**
     * Busca resíduos perdidos para um vendedor em um período.
     * Equivalente à lógica do Button5Click no Delphi.
     *
     * @param string $codVendedor Código do vendedor
     * @param string $dataInicio Data de início do período (YYYY-MM-DD)
     * @param string $dataFim Data de fim do período (YYYY-MM-DD)
     * @param string $pracaInicio Praça inicial (para filtro)
     * @param string $pracaFim Praça final (para filtro)
     * @return array
     */
    public function getResiduosPerdidos($codVendedor, $dataInicio, $dataFim, $pracaInicio, $pracaFim)
    {
        $query = "
            SELECT
                p.pedido_id,
                p.codcli,
                p.nomcli,
                p.base_data AS emissao,
                p.recol_data AS devolucao,
                p.datpag,
                p.cobran_data AS vencimento,
                p.valpag,
                p.totven,
                p.residuo,
                p.situ,
                c.ntel,
                c.bair,
                c.praca
            FROM
                PEDIDO p
            JOIN
                CLIENTE c ON p.codcli = c.idcli
            WHERE
                p.codven = :cod_vendedor AND
                p.cob = 'P' AND
                p.base_data >= :data_inicio AND
                p.base_data <= :data_fim AND
                c.praca >= :praca_inicio AND
                c.praca <= :praca_fim
            ORDER BY
                p.pedido_id
        ";

        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':cod_vendedor', $codVendedor);
        $stmt->bindValue(':data_inicio', $dataInicio);
        $stmt->bindValue(':data_fim', $dataFim);
        $stmt->bindValue(':praca_inicio', $pracaInicio);
        $stmt->bindValue(':praca_fim', $pracaFim);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Busca extrato de cliente.
     * Equivalente à lógica do Button6Click no Delphi.
     *
     * @param string $codCliente Código do cliente
     * @param string $dataInicialApuracao Data inicial da apuração (YYYY-MM-DD)
     * @return array
     */
    public function getExtratoCliente($codCliente, $dataInicialApuracao)
    {
        $extrato = [];
        $saldoAnterior = 0;

        // Pedidos de venda (Situação diferente de 'X')
        $queryPedidos = "
            SELECT
                pedido_id,
                base_data AS emissao,
                cobran_data AS vencimento,
                totped AS valsaida,
                totven AS valvenda,
                residuo AS valresiduo,
                retorno_data AS retorno,
                datpag,
                situ
            FROM
                PEDIDO
            WHERE
                codcli = :cod_cliente AND
                situ <> 'X'
            ORDER BY
                pedido_id
        ";
        $stmtPedidos = $this->db->prepare($queryPedidos);
        $stmtPedidos->bindValue(':cod_cliente', $codCliente);
        $stmtPedidos->execute();
        $pedidos = $stmtPedidos->fetchAll(PDO::FETCH_ASSOC);

        foreach ($pedidos as $pedido) {
            $valorConsiderado = 0;
            if ($pedido['situ'] === 'E') { // Em sacoleira
                $valorConsiderado = $pedido['valsaida'];
            } else { // Outras situações com resíduo
                $valorConsiderado = $pedido['valresiduo'];
            }

            if ($pedido['vencimento'] < $dataInicialApuracao) {
                $saldoAnterior += $valorConsiderado;
            } else {
                if ($saldoAnterior > 0) {
                    $extrato[] = [
                        'tipo' => 'PENDENCIA ANTERIOR',
                        'valor' => $saldoAnterior,
                        'data' => null,
                        'pedido_id' => null,
                        'situ' => null,
                        'vencimento' => null,
                    ];
                    $saldoAnterior = 0;
                }
                $extrato[] = [
                    'tipo' => 'VENDA A CLIENTE',
                    'valor' => $pedido['valsaida'],
                    'data' => $pedido['emissao'],
                    'pedido_id' => $pedido['pedido_id'],
                    'situ' => $pedido['situ'],
                    'vencimento' => $pedido['vencimento'],
                ];

                // Pagamentos de resíduos para este pedido
                $pagamentosResiduos = $this->getPagamentosResiduos($pedido['pedido_id'], $dataInicialApuracao, date('Y-m-d')); // Buscar até a data atual
                foreach ($pagamentosResiduos as $pagamento) {
                    $extrato[] = [
                        'tipo' => 'PAGAMENTO',
                        'valor' => $pagamento['valpag'],
                        'data' => $pagamento['datmov'],
                        'pedido_id' => null,
                        'situ' => null,
                        'vencimento' => null,
                    ];
                }
            }
        }

        if ($saldoAnterior > 0) {
            $extrato[] = [
                'tipo' => 'PENDENCIA ANTERIOR',
                'valor' => $saldoAnterior,
                'data' => null,
                'pedido_id' => null,
                'situ' => null,
                'vencimento' => null,
            ];
        }

        return $extrato;
    }

    /**
     * Busca relatório de produtos para um vendedor ou cliente em um período e para um produto específico.
     * Equivalente à lógica do Button1Click e Button8Click no Delphi.
     *
     * @param string $tipo 'vendedor' ou 'cliente'
     * @param string $codigo Código do vendedor ou cliente
     * @param string $dataInicio Data de início do período (YYYY-MM-DD)
     * @param string $dataFim Data de fim do período (YYYY-MM-DD)
     * @param string $situacao Opção do relatório (E, X, R)
     * @param string $codProduto Código do produto
     * @param string $pracaInicio Praça inicial (para filtro)
     * @param string $pracaFim Praça final (para filtro)
     * @return array
     */
    public function getRelatorioProdutos($tipo, $codigo, $dataInicio, $dataFim, $situacao, $codProduto, $pracaInicio, $pracaFim)
    {
        $pedidos = [];
        $baseCondition = "";
        $dateField = "p.base_data";

        if ($tipo === 'vendedor') {
            $baseCondition = "p.codven = :codigo";
        } elseif ($tipo === 'cliente') {
            $baseCondition = "p.codcli = :codigo";
        }

        switch ($situacao) {
            case 'R': // Com Retorno
                $dateField = "p.retorno_data";
                $query = "
                    SELECT
                        p.pedido_id,
                        p.codven,
                        p.codcli,
                        p.nomcli,
                        p.base_data AS emissao,
                        p.recol_data AS devolucao,
                        p.retorno_data AS datareto,
                        p.cobran_data AS vencimento,
                        p.valpag,
                        p.totven,
                        p.totped,
                        p.residuo,
                        p.situ,
                        p.oldped AS antes,
                        c.ntel,
                        c.bair,
                        c.praca,
                        ip.qtdsai
                    FROM
                        PEDIDO p
                    JOIN
                        CLIENTE c ON p.codcli = c.idcli
                    JOIN
                        ITEMPEDIDO ip ON p.pedido_id = ip.pedido_id
                    WHERE
                        {$baseCondition} AND
                        p.situ <> 'E' AND
                        p.situ <> 'X' AND
                        ip.codart = :cod_produto AND
                        {$dateField} >= :data_inicio AND
                        {$dateField} <= :data_fim AND
                        c.praca >= :praca_inicio AND
                        c.praca <= :praca_fim
                    ORDER BY
                        p.pedido_id
                ";
                break;
            case 'X': // Cancelado
                $query = "
                    SELECT
                        p.pedido_id,
                        p.codven,
                        p.codcli,
                        p.nomcli,
                        p.base_data AS emissao,
                        p.recol_data AS devolucao,
                        p.retorno_data AS datareto,
                        p.cobran_data AS vencimento,
                        p.valpag,
                        p.totven,
                        p.totped,
                        p.residuo,
                        p.situ,
                        p.oldped AS antes,
                        c.ntel,
                        c.bair,
                        c.praca,
                        ip.qtdsai
                    FROM
                        PEDIDO p
                    JOIN
                        CLIENTE c ON p.codcli = c.idcli
                    JOIN
                        ITEMPEDIDO ip ON p.pedido_id = ip.pedido_id
                    WHERE
                        {$baseCondition} AND
                        p.situ = 'X' AND
                        ip.codart = :cod_produto AND
                        {$dateField} >= :data_inicio AND
                        {$dateField} <= :data_fim AND
                        c.praca >= :praca_inicio AND
                        c.praca <= :praca_fim
                    ORDER BY
                        p.pedido_id
                ";
                break;
            case 'E': // Na Sacoleira
                $query = "
                    SELECT
                        p.pedido_id,
                        p.codven,
                        p.codcli,
                        p.nomcli,
                        p.base_data AS emissao,
                        p.recol_data AS devolucao,
                        p.retorno_data AS datareto,
                        p.cobran_data AS vencimento,
                        p.valpag,
                        p.totven,
                        p.totped,
                        p.residuo,
                        p.situ,
                        p.oldped AS antes,
                        c.ntel,
                        c.bair,
                        c.praca,
                        ip.qtdsai
                    FROM
                        PEDIDO p
                    JOIN
                        CLIENTE c ON p.codcli = c.idcli
                    JOIN
                        ITEMPEDIDO ip ON p.pedido_id = ip.pedido_id
                    WHERE
                        {$baseCondition} AND
                        p.situ = 'E' AND
                        ip.codart = :cod_produto AND
                        {$dateField} >= :data_inicio AND
                        {$dateField} <= :data_fim AND
                        c.praca >= :praca_inicio AND
                        c.praca <= :praca_fim
                    ORDER BY
                        p.pedido_id
                ";
                break;
            default:
                return [];
        }

        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':codigo', $codigo);
        $stmt->bindValue(':cod_produto', $codProduto);
        $stmt->bindValue(':data_inicio', $dataInicio);
        $stmt->bindValue(':data_fim', $dataFim);
        $stmt->bindValue(':praca_inicio', $pracaInicio);
        $stmt->bindValue(':praca_fim', $pracaFim);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém informações de um vendedor.
     *
     * @param string $codVendedor
     * @return array|false
     */
    public function getVendedor($codVendedor)
    {
        $query = "SELECT * FROM VENDEDOR WHERE codven = :cod_vendedor";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':cod_vendedor', $codVendedor);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém informações de um cliente.
     *
     * @param string $idCliente
     * @return array|false
     */
    public function getCliente($idCliente)
    {
        $query = "SELECT * FROM CLIENTE WHERE idcli = :id_cliente";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':id_cliente', $idCliente);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém informações de uma rota/praça.
     *
     * @param string $rota
     * @param string $bairro
     * @return array|false
     */
    public function getRota($rota, $bairro = '000')
    {
        $query = "SELECT * FROM ROTA WHERE rota = :rota AND bair = :bairro";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':rota', $rota);
        $stmt->bindValue(':bairro', $bairro);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém todos os artigos.
     *
     * @return array
     */
    private function getArtigos()
    {
        $query = "SELECT codigo, descricao, custo FROM ARTIGO ORDER BY codigo";
        $stmt = $this->db->prepare($query);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém pedidos filtrados por tipo (vendedor/cliente), código, período e situações.
     *
     * @param string $tipo 'vendedor' ou 'cliente'
     * @param string $codigo Código do vendedor ou cliente
     * @param string $dataInicio Data de início do período (YYYY-MM-DD)
     * @param string $dataFim Data de fim do período (YYYY-MM-DD)
     * @param array $situacoes Situações a serem excluídas ou incluídas
     * @param bool $excluirSituacoes Se true, exclui as situações; se false, inclui.
     * @return array
     */
    private function getPedidosPorPeriodoECodigo($tipo, $codigo, $dataInicio, $dataFim, $situacoes, $excluirSituacoes = true)
    {
        $field = ($tipo === 'vendedor') ? 'codven' : 'codcli';
        $operator = $excluirSituacoes ? 'NOT IN' : 'IN';
        $placeholders = implode(',', array_fill(0, count($situacoes), '?'));

        $query = "
            SELECT
                pedido_id,
                base_data,
                retorno_data
            FROM
                PEDIDO
            WHERE
                {$field} = ? AND
                base_data >= ? AND
                base_data <= ? AND
                situ {$operator} ({$placeholders})
            ORDER BY
                pedido_id
        ";

        $params = [$codigo, $dataInicio, $dataFim];
        $params = array_merge($params, $situacoes);

        $stmt = $this->db->prepare($query);
        $stmt->execute($params);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém itens de um pedido.
     *
     * @param string $pedidoId
     * @return array
     */
    private function getItensPedido($pedidoId)
    {
        $query = "SELECT codart, qtdsai, qtdret, precus FROM ITEMPEDIDO WHERE pedido_id = :pedido_id ORDER BY codart";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':pedido_id', $pedidoId);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Obtém pagamentos de resíduos para um pedido em um período.
     *
     * @param string $numDoc Número do documento (pedido_id)
     * @param string $dataInicio Data de início do período (YYYY-MM-DD)
     * @param string $dataFim Data de fim do período (YYYY-MM-DD)
     * @return array
     */
    private function getPagamentosResiduos($numDoc, $dataInicio, $dataFim)
    {
        $query = "
            SELECT
                datmov,
                valpag
            FROM
                RESIDOS
            WHERE
                numdoc = :num_doc AND
                datmov >= :data_inicio AND
                datmov <= :data_fim
            ORDER BY
                datmov, item
        ";
        $stmt = $this->db->prepare($query);
        $stmt->bindValue(':num_doc', $numDoc);
        $stmt->bindValue(':data_inicio', $dataInicio);
        $stmt->bindValue(':data_fim', $dataFim);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}