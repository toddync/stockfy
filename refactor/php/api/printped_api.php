<?php
header('Content-Type: application/json');
require_once __DIR__ . '/../models/RelatorioPedido.php';

$relatorioPedido = new RelatorioPedido();

$action = $_GET['action'] ?? '';
$pedidoId = $_REQUEST['pedido_id'] ?? null;

if (!$pedidoId) {
    echo json_encode(['success' => false, 'message' => 'ID do pedido não fornecido.']);
    exit();
}

// Garante que o ID do pedido seja um inteiro para consultas no banco de dados
$pedidoIdInt = (int)$pedidoId;

switch ($action) {
    case 'get_pedido_details':
        $details = $relatorioPedido->getPedidoDetails($pedidoIdInt);
        if ($details) {
            echo json_encode(['success' => true, 'data' => $details]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Pedido não encontrado.']);
        }
        break;

    case 'generate_report':
        // A lógica de geração de relatório (PDF/HTML) seria implementada aqui.
        // Por enquanto, vamos retornar os dados processados.
        $reportData = $relatorioPedido->generateReportData($pedidoIdInt);
        if ($reportData) {
            // Em um cenário real, você usaria uma biblioteca como Dompdf ou TCPDF para gerar um PDF
            // e salvaria em um local acessível, retornando o URL.
            // Exemplo: $pdfPath = generatePdfReport($reportData);
            // echo json_encode(['success' => true, 'message' => 'Relatório gerado com sucesso.', 'reportUrl' => $pdfPath]);
            echo json_encode(['success' => true, 'message' => 'Dados para relatório gerados com sucesso.', 'data' => $reportData]);
        } else {
            echo json_encode(['success' => false, 'message' => 'Não foi possível gerar o relatório para o pedido.']);
        }
        break;

    case 'update_via':
        if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
            $updated = $relatorioPedido->updatePedidoVia($pedidoIdInt);
            if ($updated) {
                echo json_encode(['success' => true, 'message' => 'Via do pedido atualizada com sucesso.']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Falha ao atualizar a via do pedido ou pedido não encontrado.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Método não permitido para esta ação.']);
        }
        break;

    default:
        echo json_encode(['success' => false, 'message' => 'Ação inválida.']);
        break;
}
?>