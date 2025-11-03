<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../../php/core/Database.php';
include_once '../../php/models/Perdido.php';

$database = new Database();
$db = $database->getConnection();

$perdido = new Perdido($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $perdido->id = $_GET["id"];
            if ($perdido->readOne()) {
                $perdido_arr = array(
                    "id" => $perdido->id,
                    "cliente_id" => $perdido->cliente_id,
                    "cliente_nome" => $perdido->cliente_nome,
                    "vendedor_id" => $perdido->vendedor_id,
                    "vendedor_nome" => $perdido->vendedor_nome,
                    "data_emissao" => $perdido->data_emissao,
                    "data_entrega" => $perdido->data_entrega,
                    "valor_total" => $perdido->valor_total,
                    "status" => $perdido->status,
                    "observacoes" => $perdido->observacoes
                );

                // Get pedido items
                $stmt_items = $perdido->getPedidoItems();
                $num_items = $stmt_items->rowCount();
                $items_arr = array();

                if ($num_items > 0) {
                    while ($row_item = $stmt_items->fetch(PDO::FETCH_ASSOC)) {
                        extract($row_item);
                        $item = array(
                            "id" => $id,
                            "produto_id" => $produto_id,
                            "produto_descricao" => $produto_descricao,
                            "quantidade" => $quantidade,
                            "preco_unitario" => $preco_unitario,
                            "valor_total" => $valor_total
                        );
                        array_push($items_arr, $item);
                    }
                }
                $perdido_arr["itens"] = $items_arr;

                http_response_code(200);
                echo json_encode($perdido_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Pedido não encontrado."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "ID do pedido não fornecido."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id) && !empty($data->status)) {
            $perdido->id = $data->id;
            $perdido->status = $data->status;

            if ($perdido->updateStatus()) {
                http_response_code(200);
                echo json_encode(array("message" => "Status do pedido atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o status do pedido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Dados incompletos para atualizar o status do pedido."));
        }
        break;

    case 'POST': // Para atualizar a quantidade de um item do pedido
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->pedido_id) && !empty($data->item_id) && isset($data->quantidade)) {
            $perdido->id = $data->pedido_id;
            $item_id = $data->item_id;
            $new_quantity = $data->quantidade;

            if ($perdido->updatePedidoItemQuantity($item_id, $new_quantity)) {
                // Recalcular o total do pedido após a atualização do item
                $perdido->updatePedidoTotal();
                http_response_code(200);
                echo json_encode(array("message" => "Quantidade do item do pedido atualizada."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a quantidade do item do pedido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Dados incompletos para atualizar a quantidade do item do pedido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>