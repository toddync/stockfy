<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Vendedor.php';

$database = new Database();
$db = $database->getConnection();

$vendedor = new Vendedor($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $vendedor->codven = $_GET["codven"];
            if ($vendedor->readOne()) {
                $vendedor_arr = array(
                    "id" => $vendedor->id,
                    "codven" => $vendedor->codven,
                    "nome" => $vendedor->nome,
                    "cpf" => $vendedor->cpf,
                    "ie_rg" => $vendedor->ie_rg,
                    "endereco" => $vendedor->endereco,
                    "bairro" => $vendedor->bairro,
                    "cidade" => $vendedor->cidade,
                    "estado" => $vendedor->estado,
                    "cep" => $vendedor->cep,
                    "telefone1" => $vendedor->telefone1,
                    "telefone2" => $vendedor->telefone2,
                    "telefone3" => $vendedor->telefone3,
                    "telefone4" => $vendedor->telefone4,
                    "praca1" => $vendedor->praca1,
                    "praca2" => $vendedor->praca2,
                    "praca3" => $vendedor->praca3,
                    "praca4" => $vendedor->praca4,
                    "email" => $vendedor->email,
                    "data_solicitacao" => $vendedor->data_solicitacao,
                    "numero_solicitacao" => $vendedor->numero_solicitacao
                );
                http_response_code(200);
                echo json_encode($vendedor_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Vendedor não encontrado."));
            }
        } else {
            $stmt = $vendedor->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $vendedores_arr = array();
                $vendedores_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $vendedor_item = array(
                        "id" => $id,
                        "codven" => $codven,
                        "nome" => $nome,
                        "cpf" => $cpf,
                        "ie_rg" => $ie_rg,
                        "endereco" => $endereco,
                        "bairro" => $bairro,
                        "cidade" => $cidade,
                        "estado" => $estado,
                        "cep" => $cep,
                        "telefone1" => $telefone1,
                        "telefone2" => $telefone2,
                        "telefone3" => $telefone3,
                        "telefone4" => $telefone4,
                        "praca1" => $praca1,
                        "praca2" => $praca2,
                        "praca3" => $praca3,
                        "praca4" => $praca4,
                        "email" => $email,
                        "data_solicitacao" => $data_solicitacao,
                        "numero_solicitacao" => $numero_solicitacao
                    );
                    array_push($vendedores_arr["records"], $vendedor_item);
                }
                http_response_code(200);
                echo json_encode($vendedores_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum vendedor encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->codven) &&
            !empty($data->nome) &&
            !empty($data->cpf)
        ) {
            $vendedor->codven = $data->codven;
            $vendedor->nome = $data->nome;
            $vendedor->cpf = $data->cpf;
            $vendedor->ie_rg = $data->ie_rg ?? null;
            $vendedor->endereco = $data->endereco ?? null;
            $vendedor->bairro = $data->bairro ?? null;
            $vendedor->cidade = $data->cidade ?? null;
            $vendedor->estado = $data->estado ?? null;
            $vendedor->cep = $data->cep ?? null;
            $vendedor->telefone1 = $data->telefone1 ?? null;
            $vendedor->telefone2 = $data->telefone2 ?? null;
            $vendedor->telefone3 = $data->telefone3 ?? null;
            $vendedor->telefone4 = $data->telefone4 ?? null;
            $vendedor->praca1 = $data->praca1 ?? null;
            $vendedor->praca2 = $data->praca2 ?? null;
            $vendedor->praca3 = $data->praca3 ?? null;
            $vendedor->praca4 = $data->praca4 ?? null;
            $vendedor->email = $data->email ?? null;
            $vendedor->data_solicitacao = $data->data_solicitacao ?? null;
            $vendedor->numero_solicitacao = $data->numero_solicitacao ?? null;

            if ($vendedor->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Vendedor criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o vendedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o vendedor. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->codven) &&
            !empty($data->nome) &&
            !empty($data->cpf)
        ) {
            $vendedor->codven = $data->codven;
            $vendedor->nome = $data->nome;
            $vendedor->cpf = $data->cpf;
            $vendedor->ie_rg = $data->ie_rg ?? null;
            $vendedor->endereco = $data->endereco ?? null;
            $vendedor->bairro = $data->bairro ?? null;
            $vendedor->cidade = $data->cidade ?? null;
            $vendedor->estado = $data->estado ?? null;
            $vendedor->cep = $data->cep ?? null;
            $vendedor->telefone1 = $data->telefone1 ?? null;
            $vendedor->telefone2 = $data->telefone2 ?? null;
            $vendedor->telefone3 = $data->telefone3 ?? null;
            $vendedor->telefone4 = $data->telefone4 ?? null;
            $vendedor->praca1 = $data->praca1 ?? null;
            $vendedor->praca2 = $data->praca2 ?? null;
            $vendedor->praca3 = $data->praca3 ?? null;
            $vendedor->praca4 = $data->praca4 ?? null;
            $vendedor->email = $data->email ?? null;
            $vendedor->data_solicitacao = $data->data_solicitacao ?? null;
            $vendedor->numero_solicitacao = $data->numero_solicitacao ?? null;

            if ($vendedor->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Vendedor atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o vendedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o vendedor. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->codven)) {
            $vendedor->codven = $data->codven;

            if ($vendedor->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Vendedor excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o vendedor."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o vendedor. ID não fornecido."));
        }
        break;

    case 'OPTIONS':
        http_response_code(200);
        echo json_encode(array("message" => "Preflight OK"));
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>