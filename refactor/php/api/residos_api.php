<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Residos.php';

$database = new Database();
$db = $database->getConnection();

$residos = new Residos($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["Datmov"]) && !empty($_GET["Item"])) {
            $residos->Datmov = $_GET["Datmov"];
            $residos->Item = $_GET["Item"];
            if ($residos->findByPrimaryKey($residos->Datmov, $residos->Item)) {
                $residos_arr = array(
                    "Datmov" => $residos->Datmov,
                    "Item" => $residos->Item,
                    "Numdoc" => $residos->Numdoc,
                    "Valpag" => $residos->Valpag
                );
                http_response_code(200);
                echo json_encode($residos_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Resido não encontrado."));
            }
        } else {
            $stmt = $residos->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $residos_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $residos_item = array(
                        "Datmov" => $Datmov,
                        "Item" => $Item,
                        "Numdoc" => $Numdoc,
                        "Valpag" => $Valpag
                    );
                    array_push($residos_arr, $residos_item);
                }
                http_response_code(200);
                echo json_encode($residos_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum resido encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->Datmov) &&
            !empty($data->Item) &&
            !empty($data->Valpag)
        ) {
            $residos->Datmov = $data->Datmov;
            $residos->Item = $data->Item;
            $residos->Numdoc = $data->Numdoc ?? null;
            $residos->Valpag = $data->Valpag;

            if ($residos->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Resido foi criado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o resido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o resido. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->Datmov) &&
            !empty($data->Item) &&
            !empty($data->Valpag)
        ) {
            $residos->Datmov = $data->Datmov;
            $residos->Item = $data->Item;
            $residos->Numdoc = $data->Numdoc ?? null;
            $residos->Valpag = $data->Valpag;

            if ($residos->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Resido foi atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o resido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o resido. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->Datmov) && !empty($data->Item)) {
            $residos->Datmov = $data->Datmov;
            $residos->Item = $data->Item;

            if ($residos->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Resido foi excluído."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o resido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o resido. Dados incompletos."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>