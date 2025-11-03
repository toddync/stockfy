<?php

header('Content-Type: application/json');
require_once __DIR__ . '/../models/RelatorioMapa.php';

$relatorioMapa = new RelatorioMapa();

$action = $_GET['action'] ?? '';

try {
    switch ($action) {
        case 'movimentacao_geral_artigos':
            $tipo = $_GET['tipo'] ?? '';
            $codigo = $_GET['codigo'] ?? '';
            $dataInicio = $_GET['data_inicio'] ?? '';
            $dataFim = $_GET['data_fim'] ?? '';
            $percentualLimite = isset($_GET['percentual_limite']) ? (float)$_GET['percentual_limite'] : null;

            if (empty($tipo) || empty($codigo) || empty($dataInicio) || empty($dataFim)) {
                throw new Exception("Parâmetros 'tipo', 'codigo', 'data_inicio' e 'data_fim' são obrigatórios.");
            }

            $result = $relatorioMapa->getMovimentacaoGeralArtigos($tipo, $codigo, $dataInicio, $dataFim, $percentualLimite);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'pedidos_com_residuos':
            $codVendedor = $_GET['cod_vendedor'] ?? '';
            $dataInicio = $_GET['data_inicio'] ?? '';
            $dataFim = $_GET['data_fim'] ?? '';
            $pracaInicio = $_GET['praca_inicio'] ?? '';
            $pracaFim = $_GET['praca_fim'] ?? '';

            if (empty($codVendedor) || empty($dataInicio) || empty($dataFim) || empty($pracaInicio) || empty($pracaFim)) {
                throw new Exception("Parâmetros 'cod_vendedor', 'data_inicio', 'data_fim', 'praca_inicio' e 'praca_fim' são obrigatórios.");
            }

            $result = $relatorioMapa->getPedidosComResiduos($codVendedor, $dataInicio, $dataFim, $pracaInicio, $pracaFim);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'cobrancas_efetuadas':
            $codVendedor = $_GET['cod_vendedor'] ?? '';
            $dataInicio = $_GET['data_inicio'] ?? '';
            $dataFim = $_GET['data_fim'] ?? '';
            $pracaInicio = $_GET['praca_inicio'] ?? '';
            $pracaFim = $_GET['praca_fim'] ?? '';

            if (empty($codVendedor) || empty($dataInicio) || empty($dataFim) || empty($pracaInicio) || empty($pracaFim)) {
                throw new Exception("Parâmetros 'cod_vendedor', 'data_inicio', 'data_fim', 'praca_inicio' e 'praca_fim' são obrigatórios.");
            }

            $result = $relatorioMapa->getCobrancasEfetuadas($codVendedor, $dataInicio, $dataFim, $pracaInicio, $pracaFim);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'residuos_perdidos':
            $codVendedor = $_GET['cod_vendedor'] ?? '';
            $dataInicio = $_GET['data_inicio'] ?? '';
            $dataFim = $_GET['data_fim'] ?? '';
            $pracaInicio = $_GET['praca_inicio'] ?? '';
            $pracaFim = $_GET['praca_fim'] ?? '';

            if (empty($codVendedor) || empty($dataInicio) || empty($dataFim) || empty($pracaInicio) || empty($pracaFim)) {
                throw new Exception("Parâmetros 'cod_vendedor', 'data_inicio', 'data_fim', 'praca_inicio' e 'praca_fim' são obrigatórios.");
            }

            $result = $relatorioMapa->getResiduosPerdidos($codVendedor, $dataInicio, $dataFim, $pracaInicio, $pracaFim);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'extrato_cliente':
            $codCliente = $_GET['cod_cliente'] ?? '';
            $dataInicialApuracao = $_GET['data_inicial_apuracao'] ?? '';

            if (empty($codCliente) || empty($dataInicialApuracao)) {
                throw new Exception("Parâmetros 'cod_cliente' e 'data_inicial_apuracao' são obrigatórios.");
            }

            $result = $relatorioMapa->getExtratoCliente($codCliente, $dataInicialApuracao);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'relatorio_produtos':
            $tipo = $_GET['tipo'] ?? '';
            $codigo = $_GET['codigo'] ?? '';
            $dataInicio = $_GET['data_inicio'] ?? '';
            $dataFim = $_GET['data_fim'] ?? '';
            $situacao = $_GET['situacao'] ?? '';
            $codProduto = $_GET['cod_produto'] ?? '';
            $pracaInicio = $_GET['praca_inicio'] ?? '';
            $pracaFim = $_GET['praca_fim'] ?? '';

            if (empty($tipo) || empty($codigo) || empty($dataInicio) || empty($dataFim) || empty($situacao) || empty($codProduto) || empty($pracaInicio) || empty($pracaFim)) {
                throw new Exception("Todos os parâmetros para 'relatorio_produtos' são obrigatórios.");
            }

            $result = $relatorioMapa->getRelatorioProdutos($tipo, $codigo, $dataInicio, $dataFim, $situacao, $codProduto, $pracaInicio, $pracaFim);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'get_vendedor':
            $codVendedor = $_GET['cod_vendedor'] ?? '';
            if (empty($codVendedor)) {
                throw new Exception("Parâmetro 'cod_vendedor' é obrigatório.");
            }
            $result = $relatorioMapa->getVendedor($codVendedor);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'get_cliente':
            $idCliente = $_GET['id_cliente'] ?? '';
            if (empty($idCliente)) {
                throw new Exception("Parâmetro 'id_cliente' é obrigatório.");
            }
            $result = $relatorioMapa->getCliente($idCliente);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        case 'get_rota':
            $rota = $_GET['rota'] ?? '';
            $bairro = $_GET['bairro'] ?? '000';
            if (empty($rota)) {
                throw new Exception("Parâmetro 'rota' é obrigatório.");
            }
            $result = $relatorioMapa->getRota($rota, $bairro);
            echo json_encode(['success' => true, 'data' => $result]);
            break;

        default:
            throw new Exception("Ação inválida.");
    }
} catch (Exception $e) {
    http_response_code(400);
    echo json_encode(['success' => false, 'message' => $e->getMessage()]);
}

?>