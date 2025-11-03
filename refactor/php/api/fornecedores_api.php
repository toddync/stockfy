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

switch($request_method) {
    case 'GET':
        if(!empty($_GET["id"])) {
            $fornecedor->id = $_GET["id"];
            $fornecedor->readOne();
            if($fornecedor->razao_social != null) {
                $fornecedor_arr = array(
                    "id" => $fornecedor->id,
                    "codigo_fornecedor" => $fornecedor->codigo_fornecedor,
                    "razao_social" => $fornecedor->razao_social,
                    "nome_fantasia" => $fornecedor->nome_fantasia,
                    "tipo_pessoa" => $fornecedor->tipo_pessoa,
                    "cpf" => $fornecedor->cpf,
                    "cnpj" => $fornecedor->cnpj,
                    "ie" => $fornecedor->ie,
                    "endereco" => $fornecedor->endereco,
                    "bairro" => $fornecedor->bairro,
                    "cidade" => $fornecedor->cidade,
                    "estado" => $fornecedor->estado,
                    "cep" => $fornecedor->cep,
                    "telefone" => $fornecedor->telefone,
                    "responsavel" => $fornecedor->responsavel,
                    "telefone_responsavel" => $fornecedor->telefone_responsavel,
                    "situacao" => $fornecedor->situacao
                );
                http_response_code(200);
                echo json_encode($fornecedor_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Fornecedor não encontrado."));
            }
        } elseif (!empty($_GET["search"])) {
            $keywords = $_GET["search"];
            $stmt = $fornecedor->search($keywords);
            $num = $stmt->rowCount();

            if($num > 0) {
                $fornecedores_arr = array();
                $fornecedores_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $fornecedor_item = array(
                        "id" => $id,
                        "codigo_fornecedor" => $codigo_fornecedor,
                        "razao_social" => $razao_social,
                        "nome_fantasia" => $nome_fantasia,
                        "tipo_pessoa" => $tipo_pessoa,
                        "cpf" => $cpf,
                        "cnpj" => $cnpj,
                        "ie" => $ie,
                        "endereco" => $endereco,
                        "bairro" => $bairro,
                        "cidade" => $cidade,
                        "estado" => $estado,
                        "cep" => $cep,
                        "telefone" => $telefone,
                        "responsavel" => $responsavel,
                        "telefone_responsavel" => $telefone_responsavel,
                        "situacao" => $situacao
                    );
                    array_push($fornecedores_arr["records"], $fornecedor_item);
                }
                http_response_code(200);
                echo json_encode($fornecedores_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum fornecedor encontrado."));
            }
        } else {
            $stmt = $fornecedor->read();
            $num = $stmt->rowCount();

            if($num > 0) {
                $fornecedores_arr = array();
                $fornecedores_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $fornecedor_item = array(
                        "id" => $id,
                        "codigo_fornecedor" => $codigo_fornecedor,
                        "razao_social" => $razao_social,
                        "nome_fantasia" => $nome_fantasia,
                        "tipo_pessoa" => $tipo_pessoa,
                        "cpf" => $cpf,
                        "cnpj" => $cnpj,
                        "ie" => $ie,
                        "endereco" => $endereco,
                        "bairro" => $bairro,
                        "cidade" => $cidade,
                        "estado" => $estado,
                        "cep" => $cep,
                        "telefone" => $telefone,
                        "responsavel" => $responsavel,
                        "telefone_responsavel" => $telefone_responsavel,
                        "situacao" => $situacao
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

        if(
            !empty($data->codigo_fornecedor) &&
            !empty($data->razao_social)
        ) {
            $fornecedor->codigo_fornecedor = $data->codigo_fornecedor;
            $fornecedor->razao_social = $data->razao_social;
            $fornecedor->nome_fantasia = $data->nome_fantasia ?? null;
            $fornecedor->tipo_pessoa = $data->tipo_pessoa ?? null;
            $fornecedor->cpf = $data->cpf ?? null;
            $fornecedor->cnpj = $data->cnpj ?? null;
            $fornecedor->ie = $data->ie ?? null;
            $fornecedor->endereco = $data->endereco ?? null;
            $fornecedor->bairro = $data->bairro ?? null;
            $fornecedor->cidade = $data->cidade ?? null;
            $fornecedor->estado = $data->estado ?? null;
            $fornecedor->cep = $data->cep ?? null;
            $fornecedor->telefone = $data->telefone ?? null;
            $fornecedor->responsavel = $data->responsavel ?? null;
            $fornecedor->telefone_responsavel = $data->telefone_responsavel ?? null;
            $fornecedor->situacao = $data->situacao ?? null;

            if($fornecedor->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Fornecedor foi criado."));
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

        $fornecedor->id = $data->id;

        if($fornecedor->readOne()) {
            $fornecedor->codigo_fornecedor = $data->codigo_fornecedor ?? $fornecedor->codigo_fornecedor;
            $fornecedor->razao_social = $data->razao_social ?? $fornecedor->razao_social;
            $fornecedor->nome_fantasia = $data->nome_fantasia ?? $fornecedor->nome_fantasia;
            $fornecedor->tipo_pessoa = $data->tipo_pessoa ?? $fornecedor->tipo_pessoa;
            $fornecedor->cpf = $data->cpf ?? $fornecedor->cpf;
            $fornecedor->cnpj = $data->cnpj ?? $fornecedor->cnpj;
            $fornecedor->ie = $data->ie ?? $fornecedor->ie;
            $fornecedor->endereco = $data->endereco ?? $fornecedor->endereco;
            $fornecedor->bairro = $data->bairro ?? $fornecedor->bairro;
            $fornecedor->cidade = $data->cidade ?? $fornecedor->cidade;
            $fornecedor->estado = $data->estado ?? $fornecedor->estado;
            $fornecedor->cep = $data->cep ?? $fornecedor->cep;
            $fornecedor->telefone = $data->telefone ?? $fornecedor->telefone;
            $fornecedor->responsavel = $data->responsavel ?? $fornecedor->responsavel;
            $fornecedor->telefone_responsavel = $data->telefone_responsavel ?? $fornecedor->telefone_responsavel;
            $fornecedor->situacao = $data->situacao ?? $fornecedor->situacao;

            if($fornecedor->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Fornecedor foi atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o fornecedor."));
            }
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Fornecedor não encontrado para atualização."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        $fornecedor->id = $data->id;

        if($fornecedor->delete()) {
            http_response_code(200);
            echo json_encode(array("message" => "Fornecedor foi excluído."));
        } else {
            http_response_code(503);
            echo json_encode(array("message" => "Não foi possível excluir o fornecedor."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>