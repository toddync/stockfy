<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once '../models/Arqsenhas.php';

$arqsenhas = new Arqsenhas();

$data = json_decode(file_get_contents("php://input"));

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($data->nome) && !empty($data->senha)) {
        $nome = $data->nome;
        $senha = $data->senha;

        $user = $arqsenhas->authenticate($nome, $senha);

        if ($user) {
            http_response_code(200);
            echo json_encode(array("message" => "Autenticação bem-sucedida.", "user" => $user));
        } else {
            http_response_code(401);
            echo json_encode(array("message" => "Nome de usuário ou senha inválidos."));
        }
    } else {
        http_response_code(400);
        echo json_encode(array("message" => "Dados incompletos. Nome e senha são obrigatórios."));
    }
} else {
    http_response_code(405);
    echo json_encode(array("message" => "Método não permitido."));
}
?>