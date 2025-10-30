<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/CompraItem.php';

$database = new Database();
$db = $database->getConnection();

$compraItem = new CompraItem($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $compraItem->id = $_GET["id"];
            $compraItem->readOne();
            if ($compraItem->compra_id != null) {
                $compra_item_arr = array(
                    "id" => $compraItem->id,
                    "compra_id" => $compraItem->compra_id,
                    "produto_id" => $compraItem->produto_id,
                    "quantidade" => $compraItem->quantidade,
                    "preco_unitario" => $compraItem->preco_unitario,
                    "valor_total" => $compraItem->valor_total
                );
                http_response_code(200);
                echo json_encode($compra_item_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Item de compra não encontrado."));
            }
        } elseif (!empty($_GET["compra_id"])) {
            $compraItem->compra_id = $_GET["compra_id"];
            $stmt = $compraItem->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $compra_itens_arr = array();
                $compra_itens_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $item = array(
                        "id" => $id,
                        "compra_id" => $compra_id,
                        "produto_id" => $produto_id,
                        "produto_descricao" => $produto_descricao,
                        "quantidade" => $quantidade,
                        "preco_unitario" => $preco_unitario,
                        "valor_total" => $valor_total
                    );
                    array_push($compra_itens_arr["records"], $item);
                }
                http_response_code(200);
                echo json_encode($compra_itens_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum item de compra encontrado para esta compra."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "ID da compra ou ID do item de compra não fornecido."));
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->compra_id) &&
            !empty($data->produto_id) &&
            !empty($data->quantidade) &&
            !empty($data->preco_unitario) &&
            !empty($data->valor_total)
        ) {
            $compraItem->compra_id = $data->compra_id;
            $compraItem->produto_id = $data->produto_id;
            $compraItem->quantidade = $data->quantidade;
            $compraItem->preco_unitario = $data->preco_unitario;
            $compraItem->valor_total = $data->valor_total;

            if ($compraItem->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Item de compra criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o item de compra."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o item de compra. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->quantidade) &&
            !empty($data->preco_unitario) &&
            !empty($data->valor_total)
        ) {
            $compraItem->id = $data->id;
            $compraItem->quantidade = $data->quantidade;
            $compraItem->preco_unitario = $data->preco_unitario;
            $compraItem->valor_total = $data->valor_total;

            if ($compraItem->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Item de compra atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o item de compra."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o item de compra. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["id"])) {
            $compraItem->id = $_GET["id"];
            if ($compraItem->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Item de compra excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o item de compra."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o item de compra. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>