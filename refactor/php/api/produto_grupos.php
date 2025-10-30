<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/ProdutoGrupo.php';

$database = new Database();
$db = $database->getConnection();

$produtoGrupo = new ProdutoGrupo($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $produtoGrupo->id = $_GET["id"];
            $produtoGrupo->readOne();
            if ($produtoGrupo->descricao != null) {
                $produto_grupo_arr = array(
                    "id" => $produtoGrupo->id,
                    "descricao" => $produtoGrupo->descricao
                );
                http_response_code(200);
                echo json_encode($produto_grupo_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Grupo de produto não encontrado."));
            }
        } else {
            $stmt = $produtoGrupo->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $produto_grupos_arr = array();
                $produto_grupos_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $produto_grupo_item = array(
                        "id" => $id,
                        "descricao" => $descricao
                    );
                    array_push($produto_grupos_arr["records"], $produto_grupo_item);
                }
                http_response_code(200);
                echo json_encode($produto_grupos_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum grupo de produto encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->descricao)) {
            $produtoGrupo->descricao = $data->descricao;

            if ($produtoGrupo->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Grupo de produto criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o grupo de produto."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o grupo de produto. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id) && !empty($data->descricao)) {
            $produtoGrupo->id = $data->id;
            $produtoGrupo->descricao = $data->descricao;

            if ($produtoGrupo->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Grupo de produto atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o grupo de produto."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o grupo de produto. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id)) {
            $produtoGrupo->id = $data->id;
            if ($produtoGrupo->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Grupo de produto excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o grupo de produto."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o grupo de produto. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}