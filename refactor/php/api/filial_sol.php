<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/FilialSol.php';

$database = new Database();
$db = $database->getConnection();

$filial = new FilialSol($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $filial->id = $_GET["id"];
            $stmt = $filial->readOne(); // Assumindo que existe um método readOne para buscar uma única filial
            $num = $stmt->rowCount();

            if ($num > 0) {
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                extract($row);
                $filial_item = array(
                    "id" => $id,
                    "nome" => $nome,
                    "endereco" => $endereco,
                    "telefone" => $telefone,
                    "data_cadastro" => $data_cadastro
                );
                http_response_code(200);
                echo json_encode($filial_item);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Filial não encontrada."));
            }
        } else {
            $stmt = $filial->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $filiais_arr = array();
                $filiais_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $filial_item = array(
                        "id" => $id,
                        "nome" => $nome,
                        "endereco" => $endereco,
                        "telefone" => $telefone,
                        "data_cadastro" => $data_cadastro
                    );
                    array_push($filiais_arr["records"], $filial_item);
                }
                http_response_code(200);
                echo json_encode($filiais_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma filial encontrada."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->nome) &&
            !empty($data->endereco) &&
            !empty($data->telefone)
        ) {
            $filial->nome = $data->nome;
            $filial->endereco = $data->endereco;
            $filial->telefone = $data->telefone;
            $filial->data_cadastro = date('Y-m-d H:i:s');

            if ($filial->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Filial criada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a filial."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a filial. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->nome) &&
            !empty($data->endereco) &&
            !empty($data->telefone)
        ) {
            $filial->id = $data->id;
            $filial->nome = $data->nome;
            $filial->endereco = $data->endereco;
            $filial->telefone = $data->telefone;

            if ($filial->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Filial atualizada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a filial."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar a filial. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id)) {
            $filial->id = $data->id;

            if ($filial->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Filial deletada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível deletar a filial."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível deletar a filial. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}