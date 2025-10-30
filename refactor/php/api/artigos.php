<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once __DIR__ . '/../config/database.php';
include_once __DIR__ . '/../models/Artigo.php';

$database = new Database();
$db = $database->getConnection();

$artigo = new Artigo($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $artigo->id = $_GET["id"];
            if ($artigo->readOne()) {
                $artigo_arr = array(
                    "id" => $artigo->id,
                    "descricao" => $artigo->descricao,
                    "grupo_id" => $artigo->grupo_id,
                    "fornecedor_id" => $artigo->fornecedor_id,
                    "referencia" => $artigo->referencia,
                    "ativo" => $artigo->ativo,
                    "estoque_minimo" => $artigo->estoque_minimo,
                    "estoque_maximo" => $artigo->estoque_maximo,
                    "estoque_atual" => $artigo->estoque_atual,
                    "custo" => $artigo->custo,
                    "preco_venda" => $artigo->preco_venda,
                    "data_cadastro" => $artigo->data_cadastro,
                    "data_ultima_alteracao" => $artigo->data_ultima_alteracao
                );
                http_response_code(200);
                echo json_encode($artigo_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Artigo não encontrado."));
            }
        } else {
            $params = $_GET;
            $stmt = $artigo->search($params);
            $num = $stmt->rowCount();

            if ($num > 0) {
                $artigos_arr = array();
                $artigos_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $artigo_item = array(
                        "id" => $id,
                        "descricao" => $descricao,
                        "grupo_id" => $grupo_id,
                        "fornecedor_id" => $fornecedor_id,
                        "referencia" => $referencia,
                        "ativo" => $ativo,
                        "estoque_minimo" => $estoque_minimo,
                        "estoque_maximo" => $estoque_maximo,
                        "estoque_atual" => $estoque_atual,
                        "custo" => $custo,
                        "preco_venda" => $preco_venda,
                        "data_cadastro" => $data_cadastro,
                        "data_ultima_alteracao" => $data_ultima_alteracao
                    );
                    array_push($artigos_arr["records"], $artigo_item);
                }
                http_response_code(200);
                echo json_encode($artigos_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum artigo encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->descricao) &&
            !empty($data->grupo_id) &&
            !empty($data->fornecedor_id) &&
            isset($data->ativo) &&
            isset($data->estoque_minimo) &&
            isset($data->estoque_maximo) &&
            isset($data->estoque_atual) &&
            isset($data->custo) &&
            isset($data->preco_venda)
        ) {
            $artigo->descricao = $data->descricao;
            $artigo->grupo_id = $data->grupo_id;
            $artigo->fornecedor_id = $data->fornecedor_id;
            $artigo->referencia = $data->referencia ?? null;
            $artigo->ativo = $data->ativo;
            $artigo->estoque_minimo = $data->estoque_minimo;
            $artigo->estoque_maximo = $data->estoque_maximo;
            $artigo->estoque_atual = $data->estoque_atual;
            $artigo->custo = $data->custo;
            $artigo->preco_venda = $data->preco_venda;

            if ($artigo->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Artigo foi criado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o artigo."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o artigo. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->descricao) &&
            !empty($data->grupo_id) &&
            !empty($data->fornecedor_id) &&
            isset($data->ativo) &&
            isset($data->estoque_minimo) &&
            isset($data->estoque_maximo) &&
            isset($data->estoque_atual) &&
            isset($data->custo) &&
            isset($data->preco_venda)
        ) {
            $artigo->id = $data->id;
            $artigo->descricao = $data->descricao;
            $artigo->grupo_id = $data->grupo_id;
            $artigo->fornecedor_id = $data->fornecedor_id;
            $artigo->referencia = $data->referencia ?? null;
            $artigo->ativo = $data->ativo;
            $artigo->estoque_minimo = $data->estoque_minimo;
            $artigo->estoque_maximo = $data->estoque_maximo;
            $artigo->estoque_atual = $data->estoque_atual;
            $artigo->custo = $data->custo;
            $artigo->preco_venda = $data->preco_venda;

            if ($artigo->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Artigo foi atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o artigo."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o artigo. Dados incompletos ou ID ausente."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id)) {
            $artigo->id = $data->id;

            if ($artigo->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Artigo foi excluído."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o artigo."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o artigo. ID ausente."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>