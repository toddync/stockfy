<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Fornecedor.php';

$database = new Database();
$db = $database->getConnection();

$fornecedor = new Fornecedor($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $fornecedor->id = $_GET["id"];
            $fornecedor->readOne();
            if ($fornecedor->razao_social != null) {
                $fornecedor_arr = array(
                    "id" => $fornecedor->id,
                    "razao_social" => $fornecedor->razao_social,
                    "nome_fantasia" => $fornecedor->nome_fantasia,
                    "cnpj" => $fornecedor->cnpj,
                    "ie" => $fornecedor->ie,
                    "endereco" => $fornecedor->endereco,
                    "cidade" => $fornecedor->cidade,
                    "estado" => $fornecedor->estado,
                    "telefone" => $fornecedor->telefone
                );
                http_response_code(200);
                echo json_encode($fornecedor_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Fornecedor não encontrado."));
            }
        } else {
            $stmt = $fornecedor->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $fornecedores_arr = array();
                $fornecedores_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $fornecedor_item = array(
                        "id" => $id,
                        "razao_social" => $razao_social,
                        "nome_fantasia" => $nome_fantasia,
                        "cnpj" => $cnpj,
                        "ie" => $ie,
                        "endereco" => $endereco,
                        "cidade" => $cidade,
                        "estado" => $estado,
                        "telefone" => $telefone
                    );
                    array_push($fornecedores_arr["records"], $fornecedor_item);
                }
                http_response_code(200);
                echo json_encode($fornecedores_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum fornecedor encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->razao_social) &&
            !empty($data->cnpj)
        ) {
            $fornecedor->razao_social = $data->razao_social;
            $fornecedor->nome_fantasia = $data->nome_fantasia ?? null;
            $fornecedor->cnpj = $data->cnpj;
            $fornecedor->ie = $data->ie ?? null;
            $fornecedor->endereco = $data->endereco ?? null;
            $fornecedor->cidade = $data->cidade ?? null;
            $fornecedor->estado = $data->estado ?? null;
            $fornecedor->telefone = $data->telefone ?? null;

            if ($fornecedor->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Fornecedor criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o fornecedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o fornecedor. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->razao_social) &&
            !empty($data->cnpj)
        ) {
            $fornecedor->id = $data->id;
            $fornecedor->razao_social = $data->razao_social;
            $fornecedor->nome_fantasia = $data->nome_fantasia ?? null;
            $fornecedor->cnpj = $data->cnpj;
            $fornecedor->ie = $data->ie ?? null;
            $fornecedor->endereco = $data->endereco ?? null;
            $fornecedor->cidade = $data->cidade ?? null;
            $fornecedor->estado = $data->estado ?? null;
            $fornecedor->telefone = $data->telefone ?? null;

            if ($fornecedor->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Fornecedor atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o fornecedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o fornecedor. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["id"])) {
            $fornecedor->id = $_GET["id"];
            if ($fornecedor->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Fornecedor excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o fornecedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o fornecedor. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>