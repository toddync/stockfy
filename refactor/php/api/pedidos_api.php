<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once '../models/Pedido.php';
require_once '../utils/backend_utils.php';

// Instancia o objeto Pedido
$pedido = new Pedido();

// Obtém os dados da requisição
$data = json_decode(file_get_contents("php://input"));

// Verifica se o método da requisição é DELETE
if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
    // Verifica se a data limite foi fornecida
    if (!empty($data->date_limit)) {
        $dateLimit = $data->date_limit;

        // Valida o formato da data
        if (!BackendUtils::isValidDate($dateLimit)) {
            http_response_code(400);
            echo json_encode(array("message" => "Data limite inválida. Use o formato DD/MM/AAAA."));
            exit();
        }

        // Converte a data para o formato do banco de dados (YYYY-MM-DD)
        $dateLimitFormatted = BackendUtils::convertDateFormat($dateLimit);

        // Tenta excluir os pedidos antigos
        if ($pedido->deleteOldPedidos($dateLimitFormatted)) {
            http_response_code(200);
            echo json_encode(array("message" => "Pedidos antigos excluídos com sucesso."));
        } else {
            http_response_code(503);
            echo json_encode(array("message" => "Não foi possível excluir os pedidos antigos."));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Data limite não fornecida."));
    }
} else {
    http_response_code(405);
    echo json_encode(array("message" => "Método não permitido."));
}
?>