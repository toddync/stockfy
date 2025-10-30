<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Produto.php';

$database = new Database();
$db = $database->getConnection();

$produto = new Produto($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $produto->id = $_GET["id"];
            $produto->readOne();
            if ($produto->descricao != null) {
                $produto_arr = array(
                    "id" => $produto->id,
                    "descricao" => $produto->descricao,
                    "codigo_barras" => $produto->codigo_barras,
                    "grupo_id" => $produto->grupo_id,
                    "preco_custo" => $produto->preco_custo,
                    "preco_venda" => $produto->preco_venda,
                    "estoque_atual" => $produto->estoque_atual
                );
                http_response_code(200);
                echo json_encode($produto_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Produto não encontrado."));
            }
        } else {
            $stmt = $produto->readAll();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $produtos_arr = array();
                $produtos_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $produto_item = array(
                        "id" => $id,
                        "descricao" => $descricao,
                        "codigo_barras" => $codigo_barras,
                        "grupo_id" => $grupo_id,
                        "grupo_descricao" => $grupo_descricao,
                        "preco_custo" => $preco_custo,
                        "preco_venda" => $preco_venda,
                        "estoque_atual" => $estoque_atual
                    );
                    array_push($produtos_arr["records"], $produto_item);
                }
                http_response_code(200);
                echo json_encode($produtos_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum produto encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->descricao) &&
            !empty($data->preco_custo) &&
            !empty($data->preco_venda)
        ) {
            $produto->descricao = $data->descricao;
            $produto->codigo_barras = $data->codigo_barras ?? null;
            $produto->grupo_id = $data->grupo_id ?? null;
            $produto->preco_custo = $data->preco_custo;
            $produto->preco_venda = $data->preco_venda;
            $produto->estoque_atual = $data->estoque_atual ?? 0.00;

            if ($produto->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Produto criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o produto."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o produto. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->descricao) &&
            !empty($data->preco_custo) &&
            !empty($data->preco_venda)
        ) {
            $produto->id = $data->id;
            $produto->descricao = $data->descricao;
            $produto->codigo_barras = $data->codigo_barras ?? null;
            $produto->grupo_id = $data->grupo_id ?? null;
            $produto->preco_custo = $data->preco_custo;
            $produto->preco_venda = $data->preco_venda;
            $produto->estoque_atual = $data->estoque_atual ?? 0.00;

            if ($produto->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Produto atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o produto."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o produto. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["id"])) {
            $produto->id = $_GET["id"];
            if ($produto->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Produto excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o produto."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o produto. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>