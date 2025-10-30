<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include_once '../config/database.php';
include_once '../models/Cliente.php';

$database = new Database();
$db = $database->getConnection();

$cliente = new Cliente($db);

$keywords = isset($_GET["s"]) ? $_GET["s"] : "";

if (!empty($keywords)) {
    $stmt = $cliente->search($keywords);
} else {
    $stmt = $cliente->read();
}

$num = $stmt->rowCount();

if ($num > 0) {
    $clientes_arr = array();
    $clientes_arr["records"] = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $cliente_item = array(
            "id" => $id,
            "nome" => $nome,
            "cpf_cnpj" => $cpf_cnpj,
            "ie_rg" => $ie_rg,
            "endereco" => $endereco,
            "bairro" => $bairro,
            "cidade" => $cidade,
            "estado" => $estado,
            "cep" => $cep,
            "telefone" => $telefone,
            "email" => $email,
            "limite_credito" => $limite_credito,
            "data_cadastro" => $data_cadastro,
            "ativo" => $ativo
        );
        array_push($clientes_arr["records"], $cliente_item);
    }
    http_response_code(200);
    echo json_encode($clientes_arr);
} else {
    http_response_code(404);
    echo json_encode(array("message" => "Nenhum cliente encontrado."));
}
?>