<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../config/Database.php';
include_once '../models/Unidade.php';

$database = new Database();
$db = $database->getConnection();

$unidade = new Unidade($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $unidade->id = $_GET["id"];
            if ($unidade->readOne()) {
                $unidade_arr = array(
                    "id" => $unidade->id,
                    "codigo" => $unidade->codigo,
                    "descricao" => $unidade->descricao
                );
                http_response_code(200);
                echo json_encode($unidade_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Unidade não encontrada."));
            }
        } else {
            $stmt = $unidade->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $unidades_arr = array();
                $unidades_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $unidade_item = array(
                        "id" => $id,
                        "codigo" => $codigo,
                        "descricao" => $descricao
                    );
                    array_push($unidades_arr["records"], $unidade_item);
                }
                http_response_code(200);
                echo json_encode($unidades_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma unidade encontrada."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->codigo) && !empty($data->descricao)) {
            $unidade->codigo = $data->codigo;
            $unidade->descricao = $data->descricao;

            if ($unidade->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Unidade criada com sucesso.", "id" => $unidade->id));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a unidade."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a unidade. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id) && !empty($data->codigo) && !empty($data->descricao)) {
            $unidade->id = $data->id;
            $unidade->codigo = $data->codigo;
            $unidade->descricao = $data->descricao;

            if ($unidade->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Unidade atualizada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a unidade."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar a unidade. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["id"])) {
            $unidade->id = $_GET["id"];

            if ($unidade->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Unidade deletada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível deletar a unidade."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível deletar a unidade. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}