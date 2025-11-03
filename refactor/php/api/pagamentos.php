<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Pagamento.php'; // Será criado no próximo passo

$database = new Database();
$db = $database->getConnection();

$pagamento = new Pagamento($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $pagamento->id = $_GET["id"];
            $pagamento->readOne();
            if ($pagamento->descricao != null) {
                $pagamento_arr = array(
                    "id" => $pagamento->id,
                    "descricao" => $pagamento->descricao,
                    "valor" => $pagamento->valor,
                    "vencimento" => $pagamento->vencimento
                );
                http_response_code(200);
                echo json_encode($pagamento_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Pagamento não encontrado."));
            }
        } else {
            $stmt = $pagamento->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $pagamentos_arr = array();
                $pagamentos_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $pagamento_item = array(
                        "id" => $id,
                        "descricao" => $descricao,
                        "valor" => $valor,
                        "vencimento" => $vencimento
                    );
                    array_push($pagamentos_arr["records"], $pagamento_item);
                }
                http_response_code(200);
                echo json_encode($pagamentos_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum pagamento encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->descricao) &&
            !empty($data->valor) &&
            !empty($data->vencimento)
        ) {
            $pagamento->descricao = $data->descricao;
            $pagamento->valor = $data->valor;
            $pagamento->vencimento = $data->vencimento;

            if ($pagamento->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Pagamento foi criado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o pagamento."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o pagamento. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->descricao) &&
            !empty($data->valor) &&
            !empty($data->vencimento)
        ) {
            $pagamento->id = $data->id;
            $pagamento->descricao = $data->descricao;
            $pagamento->valor = $data->valor;
            $pagamento->vencimento = $data->vencimento;

            if ($pagamento->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Pagamento foi atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o pagamento."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o pagamento. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["id"])) {
            $pagamento->id = $_GET["id"];

            if ($pagamento->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Pagamento foi excluído."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir o pagamento."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir o pagamento. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>