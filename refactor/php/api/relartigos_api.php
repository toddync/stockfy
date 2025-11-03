<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once __DIR__ . '/../models/RelatorioArtigos.php';

$relatorioArtigos = new RelatorioArtigos();

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!isset($_GET['report_type']) || !isset($_GET['data_inicial']) || !isset($_GET['data_final'])) {
            http_response_code(400);
            echo json_encode(array("message" => "Parâmetros report_type, data_inicial e data_final são obrigatórios."));
            break;
        }

        $reportType = $_GET['report_type'];
        $dataInicial = $_GET['data_inicial'];
        $dataFinal = $_GET['data_final'];
        $atualizarEstoque = isset($_GET['atualizar_estoque']) && $_GET['atualizar_estoque'] === 'true';

        $result = [];
        try {
            switch ($reportType) {
                case 'retorno_no_periodo':
                    $result = $relatorioArtigos->getRetornoNoPeriodo($dataInicial, $dataFinal);
                    break;
                case 'movimento_estoque':
                    $result = $relatorioArtigos->getMovimentoEstoque($dataInicial, $dataFinal, $atualizarEstoque);
                    break;
                case 'movimentacao_geral':
                    $result = $relatorioArtigos->getMovimentacaoGeral($dataInicial, $dataFinal);
                    break;
                default:
                    http_response_code(400);
                    echo json_encode(array("message" => "Tipo de relatório inválido."));
                    exit();
            }
            http_response_code(200);
            echo json_encode($result);
        } catch (PDOException $e) {
            http_response_code(500);
            error_log("Erro na API de relatório de artigos: " . $e->getMessage());
            echo json_encode(array("message" => "Erro interno do servidor ao gerar relatório."));
        }
        break;

    case 'OPTIONS':
        http_response_code(200);
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}

?>