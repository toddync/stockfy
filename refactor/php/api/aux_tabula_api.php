<?php
header('Content-Type: application/json');
require_once '../config/database.php';
require_once '../models/AuxTabula.php';

$method = $_SERVER['REQUEST_METHOD'];

function handleGet($conn) {
    $sql = "SELECT * FROM aux_tabula ORDER BY artigo";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    $result = $stmt->get_result();
    $auxTabulas = [];
    while ($row = $result->fetch_assoc()) {
        $auxTabulas[] = AuxTabula::fromArray($row);
    }
    echo json_encode($auxTabulas);
}

function handlePost($conn) {
    $data = json_decode(file_get_contents('php://input'), true);
    $auxTabula = AuxTabula::fromArray($data);

    $sql = "INSERT INTO aux_tabula (artigo, descricao, pequeno, medio, grande, xgrande, total) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssddddd", $auxTabula->artigo, $auxTabula->descricao, $auxTabula->pequeno, $auxTabula->medio, $auxTabula->grande, $auxTabula->xgrande, $auxTabula->total);

    if ($stmt->execute()) {
        echo json_encode(["message" => "AuxTabula criada com sucesso."]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Erro ao criar AuxTabula: " . $stmt->error]);
    }
}

function handleDeleteAll($conn) {
    $sql = "DELETE FROM aux_tabula";
    $stmt = $conn->prepare($sql);

    if ($stmt->execute()) {
        echo json_encode(["message" => "Todos os registros de AuxTabula excluídos com sucesso."]);
    } else {
        http_response_code(500);
        echo json_encode(["message" => "Erro ao excluir registros de AuxTabula: " . $stmt->error]);
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
    case 'DELETE':
        handleDeleteAll($conn); // Assuming DELETE is for clearing the table based on Pascal code
        break;
    default:
        http_response_code(405);
        echo json_encode(["message" => "Método não permitido."]);
        break;
}

$conn->close();
?>