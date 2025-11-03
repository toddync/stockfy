<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../php/core/Database.php';
include_once '../../php/models/AuxSolimpa.php';
include_once '../../php/models/Artigo.php';

$database = new Database();
$db = $database->getInstance();

$auxSolimpa = new AuxSolimpa($db);
$artigo = new Artigo($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch($request_method) {
    case 'GET':
        if (!empty($_GET["codart"])) {
            $auxSolimpa->codart = $_GET["codart"];
            $stmt = $auxSolimpa->readOne(); // Assumindo que você adicionará um método readOne ao AuxSolimpa
            $num = $stmt->rowCount();

            if ($num > 0) {
                $row = $stmt->fetch(PDO::FETCH_ASSOC);
                echo json_encode($row);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Item não encontrado na lista temporária."));
            }
        } else {
            $stmt = $auxSolimpa->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $auxSolimpa_arr = array();
                $auxSolimpa_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $auxSolimpa_item = array(
                        "codart" => $codart,
                        "descricao" => $descricao
                    );
                    array_push($auxSolimpa_arr["records"], $auxSolimpa_item);
                }
                http_response_code(200);
                echo json_encode($auxSolimpa_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum item encontrado na lista temporária."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->codart) &&
            !empty($data->descricao)
        ) {
            // Verificar se o artigo existe na tabela principal de artigos
            $artigo->codigo = $data->codart;
            $artigo_exists = $artigo->readOne();
            if ($artigo_exists->rowCount() == 0) {
                http_response_code(400);
                echo json_encode(array("message" => "Artigo não cadastrado."));
                break;
            }

            $auxSolimpa->codart = $data->codart;
            $auxSolimpa->descricao = $data->descricao;

            if ($auxSolimpa->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Item adicionado à lista temporária."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível adicionar o item."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível adicionar o item. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["action"]) && $_GET["action"] == "empty") {
            if ($auxSolimpa->emptyTable()) {
                http_response_code(200);
                echo json_encode(array("message" => "Lista temporária esvaziada."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível esvaziar a lista temporária."));
            }
        } elseif (!empty($_GET["codart"])) {
            $auxSolimpa->codart = $_GET["codart"];
            if ($auxSolimpa->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Item removido da lista temporária."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível remover o item."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível remover o item. Código do artigo não especificado ou ação inválida."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>