<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/ItemPedido.php';

$database = new Database();
$db = $database->getConnection();

$itemPedido = new ItemPedido($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch($request_method) {
    case 'GET':
        if (!empty($_GET["pedido"]) && !empty($_GET["codart"])) {
            $itemPedido->PEDIDO = $_GET["pedido"];
            $itemPedido->CODART = $_GET["codart"];
            $stmt = $itemPedido->readOne(); // Supondo que você tenha um método readOne para buscar um item específico
            $num = $stmt->rowCount();

            if ($num > 0) {
                $item_pedido_arr = array();
                $item_pedido_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $item_pedido_item = array(
                        "PEDIDO" => $PEDIDO,
                        "CODART" => $CODART,
                        "DESCRICAO" => $DESCRICAO,
                        "QTDSAI" => $QTDSAI,
                        "QTDRET" => $QTDRET,
                        "PRECUS" => $PRECUS,
                        "PREVEN" => $PREVEN
                    );
                    array_push($item_pedido_arr["records"], $item_pedido_item);
                }
                http_response_code(200);
                echo json_encode($item_pedido_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Item de pedido não encontrado."));
            }
        } else if (!empty($_GET["pedido"])) {
            $itemPedido->PEDIDO = $_GET["pedido"];
            $stmt = $itemPedido->readByPedido(); // Supondo que você tenha um método readByPedido para buscar todos os itens de um pedido
            $num = $stmt->rowCount();

            if ($num > 0) {
                $item_pedido_arr = array();
                $item_pedido_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $item_pedido_item = array(
                        "PEDIDO" => $PEDIDO,
                        "CODART" => $CODART,
                        "DESCRICAO" => $DESCRICAO,
                        "QTDSAI" => $QTDSAI,
                        "QTDRET" => $QTDRET,
                        "PRECUS" => $PRECUS,
                        "PREVEN" => $PREVEN
                    );
                    array_push($item_pedido_arr["records"], $item_pedido_item);
                }
                http_response_code(200);
                echo json_encode($item_pedido_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum item de pedido encontrado para o pedido especificado."));
            }
        } else {
            $stmt = $itemPedido->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $item_pedido_arr = array();
                $item_pedido_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $item_pedido_item = array(
                        "PEDIDO" => $PEDIDO,
                        "CODART" => $CODART,
                        "DESCRICAO" => $DESCRICAO,
                        "QTDSAI" => $QTDSAI,
                        "QTDRET" => $QTDRET,
                        "PRECUS" => $PRECUS,
                        "PREVEN" => $PREVEN
                    );
                    array_push($item_pedido_arr["records"], $item_pedido_item);
                }
                http_response_code(200);
                echo json_encode($item_pedido_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum item de pedido encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->PEDIDO) &&
            !empty($data->CODART) &&
            !empty($data->DESCRICAO) &&
            !empty($data->QTDSAI) &&
            !empty($data->PRECUS) &&
            !empty($data->PREVEN)
        ) {
            $itemPedido->PEDIDO = $data->PEDIDO;
            $itemPedido->CODART = $data->CODART;
            $itemPedido->DESCRICAO = $data->DESCRICAO;
            $itemPedido->QTDSAI = $data->QTDSAI;
            $itemPedido->QTDRET = isset($data->QTDRET) ? $data->QTDRET : 0;
            $itemPedido->PRECUS = $data->PRECUS;
            $itemPedido->PREVEN = $data->PREVEN;

            if ($itemPedido->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Item de pedido criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o item de pedido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o item de pedido. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->PEDIDO) &&
            !empty($data->CODART) &&
            !empty($data->DESCRICAO) &&
            !empty($data->QTDSAI) &&
            !empty($data->PRECUS) &&
            !empty($data->PREVEN)
        ) {
            $itemPedido->PEDIDO = $data->PEDIDO;
            $itemPedido->CODART = $data->CODART;
            $itemPedido->DESCRICAO = $data->DESCRICAO;
            $itemPedido->QTDSAI = $data->QTDSAI;
            $itemPedido->QTDRET = isset($data->QTDRET) ? $data->QTDRET : 0;
            $itemPedido->PRECUS = $data->PRECUS;
            $itemPedido->PREVEN = $data->PREVEN;

            if ($itemPedido->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Item de pedido atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o item de pedido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o item de pedido. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["pedido"]) && !empty($_GET["codart"])) {
            $itemPedido->PEDIDO = $_GET["pedido"];
            $itemPedido->CODART = $_GET["codart"];

            if ($itemPedido->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Item de pedido excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o item de pedido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o item de pedido. Dados incompletos."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>