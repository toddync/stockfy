<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';

$database = new Database();
$db = $database->getConnection();

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        // Lógica para obter estatísticas (a ser implementada)
        http_response_code(200);
        echo json_encode(array("message" => "Endpoint de estatísticas (GET) - Funcionalidade a ser implementada."));
        break;

    case 'POST':
        // Lógica para criar estatísticas (a ser implementada)
        http_response_code(200);
        echo json_encode(array("message" => "Endpoint de estatísticas (POST) - Funcionalidade a ser implementada."));
        break;

    case 'PUT':
        // Lógica para atualizar estatísticas (a ser implementada)
        http_response_code(200);
        echo json_encode(array("message" => "Endpoint de estatísticas (PUT) - Funcionalidade a ser implementada."));
        break;

    case 'DELETE':
        // Lógica para deletar estatísticas (a ser implementada)
        http_response_code(200);
        echo json_encode(array("message" => "Endpoint de estatísticas (DELETE) - Funcionalidade a ser implementada."));
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}