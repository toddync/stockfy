<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Rota.php';

$database = new Database();
$db = $database->getConnection();

$rota = new Rota($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch($request_method) {
    case 'GET':
        if(!empty($_GET["id"])) {
            $rota->id = $_GET["id"];
            $rota->readOne();
            if($rota->codigo_rota != null) {
                $rota_arr = array(
                    "id" => $rota->id,
                    "codigo_rota" => $rota->codigo_rota,
                    "nome_bairro" => $rota->nome_bairro,
                    "vendedor_id" => $rota->vendedor_id
                );
                http_response_code(200);
                echo json_encode($rota_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Rota não encontrada."));
            }
        } elseif (!empty($_GET["search"])) {
            $keywords = $_GET["search"];
            $stmt = $rota->search($keywords);
            $num = $stmt->rowCount();

            if($num > 0) {
                $rotas_arr = array();
                $rotas_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $rota_item = array(
                        "id" => $id,
                        "codigo_rota" => $codigo_rota,
                        "nome_bairro" => $nome_bairro,
                        "vendedor_id" => $vendedor_id
                    );
                    array_push($rotas_arr["records"], $rota_item);
                }
                http_response_code(200);
                echo json_encode($rotas_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma rota encontrada."));
            }
        } else {
            $stmt = $rota->read();
            $num = $stmt->rowCount();

            if($num > 0) {
                $rotas_arr = array();
                $rotas_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $rota_item = array(
                        "id" => $id,
                        "codigo_rota" => $codigo_rota,
                        "nome_bairro" => $nome_bairro,
                        "vendedor_id" => $vendedor_id
                    );
                    array_push($rotas_arr["records"], $rota_item);
                }
                http_response_code(200);
                echo json_encode($rotas_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma rota encontrada."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if(
            !empty($data->codigo_rota) &&
            !empty($data->nome_bairro)
        ) {
            $rota->codigo_rota = $data->codigo_rota;
            $rota->nome_bairro = $data->nome_bairro;
            $rota->vendedor_id = $data->vendedor_id ?? null;

            if($rota->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Rota foi criada."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a rota."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a rota. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        $rota->id = $data->id;

        if($rota->readOne()) {
            $rota->codigo_rota = $data->codigo_rota ?? $rota->codigo_rota;
            $rota->nome_bairro = $data->nome_bairro ?? $rota->nome_bairro;
            $rota->vendedor_id = $data->vendedor_id ?? $rota->vendedor_id;

            if($rota->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Rota foi atualizada."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a rota."));
            }
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Rota não encontrada para atualização."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        $rota->id = $data->id;

        if($rota->delete()) {
            http_response_code(200);
            echo json_encode(array("message" => "Rota foi excluída."));
        } else {
            http_response_code(503);
            echo json_encode(array("message" => "Não foi possível excluir a rota."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>