<?php
header('Content-Type: application/json');
require_once '../config/database.php';
require_once '../models/ItemSolicitacao.php';

$method = $_SERVER['REQUEST_METHOD'];

function handleGet($conn) {
    $vendedor = $_GET['vendedor'] ?? '';
    $numero = $_GET['numero'] ?? '';

    if (empty($vendedor) || empty($numero)) {
        http_response_code(400);
        echo json_encode(["message" => "Parâmetros 'vendedor' e 'numero' são obrigatórios."]);
        return;
    }

    $sql = "SELECT * FROM itens_solicitacao WHERE vendedor = ? AND numero = ? ORDER BY artigo";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ss", $vendedor, $numero);
    $stmt->execute();
    $result = $stmt->get_result();
    $itensSolicitacao = [];
    while ($row = $result->fetch_assoc()) {
        $itensSolicitacao[] = ItemSolicitacao::fromArray($row);
    }
    echo json_encode($itensSolicitacao);
}

function handlePost($conn) {
    $data = json_decode(file_get_contents('php://input'), true);
    $itemSolicitacao = ItemSolicitacao::fromArray($data);

    $sql = "INSERT INTO itens_solicitacao (vendedor, numero, artigo, descricao, pequeno, medio, grande, xgrande, observacao) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssdddds", $itemSolicitacao->vendedor, $itemSolicitacao->numero, $itemSolicitacao->artigo, $itemSolicitacao->descricao, $itemSolicitacao->pequeno, $itemSolicitacao->medio, $itemSolicitacao->grande, $itemSolicitacao->xgrande, $itemSolicitacao->observacao);

    if ($stmt->execute()) {
        echo json_encode(["message" => "Item de solicitação criado com sucesso."]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Erro ao criar item de solicitação: " . $stmt->error]);
    }
}

function handlePut($conn) {
    $data = json_decode(file_get_contents('php://input'), true);
    $itemSolicitacao = ItemSolicitacao::fromArray($data);

    $sql = "UPDATE itens_solicitacao SET descricao = ?, pequeno = ?, medio = ?, grande = ?, xgrande = ?, observacao = ? WHERE vendedor = ? AND numero = ? AND artigo = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sddddssss", $itemSolicitacao->descricao, $itemSolicitacao->pequeno, $itemSolicitacao->medio, $itemSolicitacao->grande, $itemSolicitacao->xgrande, $itemSolicitacao->observacao, $itemSolicitacao->vendedor, $itemSolicitacao->numero, $itemSolicitacao->artigo);

    if ($stmt->execute()) {
        echo json_encode(["message" => "Item de solicitação atualizado com sucesso."]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Erro ao atualizar item de solicitação: " . $stmt->error]);
    }
}

function handleDelete($conn) {
    $vendedor = $_GET['vendedor'] ?? '';
    $numero = $_GET['numero'] ?? '';
    $artigo = $_GET['artigo'] ?? '';

    if (empty($vendedor) || empty($numero) || empty($artigo)) {
        http_response_code(400);
        echo json_encode(["message" => "Parâmetros 'vendedor', 'numero' e 'artigo' são obrigatórios."]);
        return;
    }

    $sql = "DELETE FROM itens_solicitacao WHERE vendedor = ? AND numero = ? AND artigo = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("sss", $vendedor, $numero, $artigo);

    if ($stmt->execute()) {
        echo json_encode(["message" => "Item de solicitação excluído com sucesso."]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Erro ao excluir item de solicitação: " . $stmt->error]);
    }
}

$conn = connectDatabase();

switch ($method) {
    case 'GET':
        handleGet($conn);
        break;
    case 'POST':
        handlePost($conn);
        break;
    case 'PUT':
        handlePut($conn);
        break;
    case 'DELETE':
        handleDelete($conn);
        break;
    default:
        http_response_code(405);
        echo json_encode(["message" => "Método não permitido."]);
        break;
}

$conn->close();
?>