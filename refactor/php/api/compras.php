<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Compra.php';

$database = new Database();
$db = $database->getConnection();

$compra = new Compra($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $compra->id = $_GET["id"];
            $compra->readOne();
            if ($compra->fornecedor_id != null) {
                $compra_arr = array(
                    "id" => $compra->id,
                    "fornecedor_id" => $compra->fornecedor_id,
                    "data_pedido" => $compra->data_pedido,
                    "data_entrega" => $compra->data_entrega,
                    "valor_total" => $compra->valor_total,
                    "desconto" => $compra->desconto,
                    "frete" => $compra->frete,
                    "observacoes" => $compra->observacoes,
                    "status" => $compra->status
                );
                http_response_code(200);
                echo json_encode($compra_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Compra não encontrada."));
            }
        } else {
            $stmt = $compra->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $compras_arr = array();
                $compras_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $compra_item = array(
                        "id" => $id,
                        "fornecedor_id" => $fornecedor_id,
                        "fornecedor_nome" => $fornecedor_nome,
                        "data_pedido" => $data_pedido,
                        "data_entrega" => $data_entrega,
                        "valor_total" => $valor_total,
                        "desconto" => $desconto,
                        "frete" => $frete,
                        "observacoes" => $observacoes,
                        "status" => $status
                    );
                    array_push($compras_arr["records"], $compra_item);
                }
                http_response_code(200);
                echo json_encode($compras_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma compra encontrada."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->fornecedor_id) &&
            !empty($data->data_pedido) &&
            !empty($data->valor_total) &&
            !empty($data->status)
        ) {
            $compra->fornecedor_id = $data->fornecedor_id;
            $compra->data_pedido = $data->data_pedido;
            $compra->data_entrega = $data->data_entrega ?? null;
            $compra->valor_total = $data->valor_total;
            $compra->desconto = $data->desconto ?? 0.00;
            $compra->frete = $data->frete ?? 0.00;
            $compra->observacoes = $data->observacoes ?? "";
            $compra->status = $data->status;

            if ($compra->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Compra criada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a compra."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a compra. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->fornecedor_id) &&
            !empty($data->data_pedido) &&
            !empty($data->valor_total) &&
            !empty($data->status)
        ) {
            $compra->id = $data->id;
            $compra->fornecedor_id = $data->fornecedor_id;
            $compra->data_pedido = $data->data_pedido;
            $compra->data_entrega = $data->data_entrega ?? null;
            $compra->valor_total = $data->valor_total;
            $compra->desconto = $data->desconto ?? 0.00;
            $compra->frete = $data->frete ?? 0.00;
            $compra->observacoes = $data->observacoes ?? "";
            $compra->status = $data->status;

            if ($compra->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Compra atualizada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a compra."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar a compra. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["id"])) {
            $compra->id = $_GET["id"];
            if ($compra->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Compra excluída com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir a compra."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir a compra. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>