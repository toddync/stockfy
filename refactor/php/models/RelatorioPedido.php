<?php
require_once __DIR__ . '/../core/Database.php';

class RelatorioPedido {
    private $db;

    public function __construct() {
        $this->db = Database::getConnection();
    }

    /**
     * Busca os detalhes de um pedido, cliente e vendedor.
     * @param string $pedidoId O ID do pedido formatado (com zeros à esquerda).
     * @return array|null Retorna um array associativo com os dados do pedido ou null se não encontrado.
     */
    public function getPedidoDetails($pedidoId) {
        $stmt = $this->db->prepare("
            SELECT
                p.id AS pedido_id,
                p.data_emissao,
                p.data_entrega,
                p.valor_total,
                p.status,
                p.observacoes,
                p.via,
                c.id AS cliente_id,
                c.nome AS cliente_nome,
                c.endereco,
                c.bairro,
                c.cidade,
                c.estado,
                c.cep,
                c.telefone AS cliente_telefone,
                c.ie_rg,
                c.cpf_cnpj,
                c.referencia,
                c.horario_atendimento_inicio,
                c.horario_atendimento_fim,
                c.observacoes AS cliente_observacoes,
                v.id AS vendedor_id,
                v.nome AS vendedor_nome,
                v.telefone AS vendedor_telefone
            FROM
                pedidos p
            JOIN
                clientes c ON p.cliente_id = c.id
            LEFT JOIN
                vendedores v ON p.vendedor_id = v.id
            WHERE
                p.id = :pedido_id
        ");
        $stmt->bindParam(':pedido_id', $pedidoId, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Busca os itens de um pedido.
     * @param int $pedidoId O ID numérico do pedido.
     * @return array Retorna um array de arrays associativos com os itens do pedido.
     */
    public function getPedidoItems($pedidoId) {
        $stmt = $this->db->prepare("
            SELECT
                pi.quantidade,
                pi.preco_unitario,
                pi.valor_total,
                pr.id AS produto_id,
                pr.descricao AS produto_descricao,
                pr.preco_custo
            FROM
                pedido_itens pi
            JOIN
                produtos pr ON pi.produto_id = pr.id
            WHERE
                pi.pedido_id = :pedido_id
            ORDER BY
                pr.descricao
        ");
        $stmt->bindParam(':pedido_id', $pedidoId, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Processa os dados do pedido e seus itens para gerar o relatório.
     * Realiza cálculos e formatações similares ao UPrintped.pas.
     * @param string $pedidoId O ID do pedido formatado (com zeros à esquerda).
     * @return array|null Retorna um array com todos os dados formatados para o relatório ou null.
     */
    public function generateReportData($pedidoId) {
        $details = $this->getPedidoDetails($pedidoId);
        if (!$details) {
            return null;
        }

        $items = $this->getPedidoItems($details['pedido_id']);

        $reportData = [
            'header' => [
                'data_emissao_relatorio' => date('d/m/Y'),
                'hora_emissao_relatorio' => date('H:i:s'),
                'numero_pedido' => $details['pedido_id'],
                'via' => $details['via'],
                'cliente_id' => $details['cliente_id'],
                'cliente_nome' => $details['cliente_nome'],
                'cliente_endereco' => $details['endereco'],
                'cliente_contato' => $details['cliente_telefone'], // Mapeando 'Conta' para telefone
                'cliente_bairro' => $details['bairro'],
                'cliente_cidade' => $details['cidade'],
                'cliente_cep' => $details['cep'],
                'cliente_estado' => $details['estado'],
                'cliente_ie_rg' => $details['ie_rg'],
                'cliente_cpf_cnpj' => $details['cpf_cnpj'],
                'vendedor_info' => $details['vendedor_id'] . ' - ' . $details['vendedor_nome'],
                'vendedor_contato' => 'Contato: ' . $details['vendedor_telefone'],
                'data_emissao_pedido' => date('d/m/Y', strtotime($details['data_emissao'])),
                'data_devolucao' => $details['data_entrega'] ? date('d/m/Y', strtotime($details['data_entrega'])) : '',
                'data_vencimento' => '', // Não diretamente no pedido, mas pode ser adicionado se houver lógica de cobrança
                'horario_atendimento' => 'Atendimento: ' . ($details['cliente_observacoes'] ?? '') . ' / ' . ($details['horario_atendimento_inicio'] ?? '') . ' a ' . ($details['horario_atendimento_fim'] ?? ''),
                'referencias' => 'Ref: ' . ($details['referencia'] ?? ''),
            ],
            'items' => [],
            'footer' => [
                'total_artigos' => 0,
                'total_quantidade' => 0.0,
                'total_custo' => 0.00,
                'total_venda' => 0.00,
                'total_lucro' => 0.00,
                'total_vendido_anterior' => 0.00, // Corresponde a wtotvendido
            ]
        ];

        $indexLin = 0;
        $totalVendido = 0.0; // Corresponde a wvendido
        $totalQtdSai = 0.0; // Corresponde a wtotqtda

        foreach ($items as $item) {
            $indexLin++;
            $wrota = str_pad($indexLin, 3, '0', STR_PAD_LEFT); // Preencher com zeros à esquerda

            $qtdSai = (float)$item['quantidade'];
            $precoCusto = (float)$item['preco_custo'];
            $precoVenda = (float)$item['preco_unitario']; // No Delphi, preven é preco_venda, aqui preco_unitario

            $valorVendidoItem = $precoVenda * $qtdSai; // wvendido += (wpreven * wqtda)
            $totalVendido += $valorVendidoItem;
            $totalQtdSai += $qtdSai;

            // Simulação de QTDRET e QTDANT, CUSANT, VENANT
            // No Delphi, wsitu='E' (Emitido) significa que QTDRET, QTDANT, VENANT são vazios
            // Caso contrário, são calculados.
            // Para simplificar, vamos assumir que QTDRET é 0 para um pedido "emitido" e QTDANT = QTDSAI
            // Se houver lógica de devolução, precisaria de uma tabela de devoluções.
            $qtdRet = 0.0; // Assumindo 0 para um pedido de impressão simples
            $qtdAnt = $qtdSai - $qtdRet;
            $cusAnt = $precoCusto * $qtdSai;
            $venAnt = $precoCusto * $qtdAnt; // No Delphi, (wprecus*(wqtda-wqtdr))

            $reportData['items'][] = [
                'item_numero' => $wrota,
                'codigo_artigo' => $item['produto_id'],
                'descricao_artigo' => $item['produto_descricao'],
                'quantidade_saida' => number_format($qtdSai, 0, ',', '.'),
                'quantidade_devolvida' => number_format($qtdRet, 0, ',', '.'),
                'quantidade_anterior' => number_format($qtdAnt, 0, ',', '.'),
                'preco_custo_unitario' => number_format($precoCusto, 2, ',', '.'),
                'preco_venda_unitario' => number_format($precoVenda, 2, ',', '.'),
                'custo_anterior' => number_format($cusAnt, 2, ',', '.'),
                'valor_vendido_anterior' => number_format($venAnt, 2, ',', '.'),
                'valor_vendido_item' => number_format($valorVendidoItem, 2, ',', '.'),
            ];

            $reportData['footer']['total_artigos']++;
            $reportData['footer']['total_custo'] += $cusAnt; // Total de custo dos itens
            $reportData['footer']['total_vendido_anterior'] += $venAnt;
        }

        $reportData['footer']['total_quantidade'] = $totalQtdSai;
        $reportData['footer']['total_venda'] = $totalVendido;
        $reportData['footer']['total_lucro'] = $totalVendido - $reportData['footer']['total_custo'];

        // Formatação final dos totais
        $reportData['footer']['total_artigos'] = number_format($reportData['footer']['total_artigos'], 0, ',', '.');
        $reportData['footer']['total_quantidade'] = number_format($reportData['footer']['total_quantidade'], 1, ',', '.');
        $reportData['footer']['total_custo'] = number_format($reportData['footer']['total_custo'], 2, ',', '.');
        $reportData['footer']['total_venda'] = number_format($reportData['footer']['total_venda'], 2, ',', '.');
        $reportData['footer']['total_lucro'] = number_format($reportData['footer']['total_lucro'], 2, ',', '.');
        $reportData['footer']['total_vendido_anterior'] = number_format($reportData['footer']['total_vendido_anterior'], 2, ',', '.');


        return $reportData;
    }

    /**
     * Atualiza o número da via de um pedido.
     * @param string $pedidoId O ID do pedido formatado (com zeros à esquerda).
     * @return bool Retorna true em caso de sucesso, false caso contrário.
     */
    public function updatePedidoVia($pedidoId) {
        // Primeiro, obter a via atual
        $stmt = $this->db->prepare("SELECT via FROM pedidos WHERE id = :pedido_id");
        $stmt->bindParam(':pedido_id', $pedidoId, PDO::PARAM_INT);
        $stmt->execute();
        $currentVia = $stmt->fetchColumn();

        if ($currentVia === false) {
            return false; // Pedido não encontrado
        }

        $newVia = (int)$currentVia + 1;
        if ($newVia > 9) { // Limite de 9 vias, como no Delphi
            $newVia = 9;
        }

        $stmt = $this->db->prepare("UPDATE pedidos SET via = :new_via WHERE id = :pedido_id");
        $stmt->bindParam(':new_via', $newVia, PDO::PARAM_INT);
        $stmt->bindParam(':pedido_id', $pedidoId, PDO::PARAM_INT);
        return $stmt->execute();
    }
}