<?php

header('Content-Type: application/json');
require_once __DIR__ . '/../models/Retorno.php';

$retornoModel = new Retorno();

$action = $_GET['action'] ?? $_POST['action'] ?? '';

switch ($action) {
    case 'getPedido':
        $pedidoNumero = $_GET['pedido'] ?? null;
        if ($pedidoNumero) {
            $pedidoInfo = $retornoModel->getPedido($pedidoNumero);
            $itensPedido = $retornoModel->getItensPedido($pedidoNumero);
            if ($pedidoInfo) {
                echo json_encode(['success' => true, 'pedidoInfo' => $pedidoInfo, 'itensPedido' => $itensPedido]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Pedido não encontrado.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Número do pedido não fornecido.']);
        }
        break;

    case 'registrarRetornoItem':
        $data = json_decode(file_get_contents('php://input'), true);
        $pedidoNumero = $data['pedido'] ?? null;
        $codart = $data['codart'] ?? null;
        $qtdret = $data['qtdret'] ?? null;

        if ($pedidoNumero && $codart && $qtdret !== null) {
            if ($retornoModel->updateItemRetorno($pedidoNumero, $codart, $qtdret)) {
                echo json_encode(['success' => true, 'message' => 'Item de retorno registrado com sucesso.']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Erro ao registrar item de retorno.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Dados incompletos para registrar item de retorno.']);
        }
        break;

    case 'fecharRetorno':
        $data = json_decode(file_get_contents('php://input'), true);
        $pedidoNumero = $data['pedido'] ?? null;
        $operacao = $data['operacao'] ?? null;

        // Simulação de senha para "Venda" - Substituir por autenticação real
        if (strtoupper($operacao) === 'V') {
            // Aqui você implementaria a verificação de senha real
            // Por enquanto, vamos assumir que a senha é "LULA" como no Delphi original
            // Isso DEVE ser substituído por um sistema de autenticação seguro
            $senhaFornecida = $data['senha'] ?? ''; // A senha viria do frontend
            if ($senhaFornecida !== 'LULA') {
                echo json_encode(['success' => false, 'message' => 'Senha não autorizada para operação de Venda.']);
                exit;
            }
        }

        if ($pedidoNumero && $operacao) {
            if ($retornoModel->fecharRetorno($pedidoNumero, $operacao)) {
                echo json_encode(['success' => true, 'message' => 'Retorno fechado com sucesso.']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Erro ao fechar retorno.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Dados incompletos para fechar retorno.']);
        }
        break;

    case 'restaurarPedido':
        $data = json_decode(file_get_contents('php://input'), true);
        $pedidoNumero = $data['pedido'] ?? null;

        if ($pedidoNumero) {
            if ($retornoModel->restaurarPedido($pedidoNumero)) {
                echo json_encode(['success' => true, 'message' => 'Pedido restaurado com sucesso.']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Erro ao restaurar pedido.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'Número do pedido não fornecido para restauração.']);
        }
        break;

    default:
        echo json_encode(['success' => false, 'message' => 'Ação inválida.']);
        break;
}

?>