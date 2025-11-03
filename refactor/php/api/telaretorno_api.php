<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Perdido.php';
include_once '../models/Itemperdido.php';
include_once '../models/Cliente.php';
include_once '../models/Vendedor.php';

$database = new Database();
$db = $database->getConnection();

$perdido = new Perdido($db);
$itemperdido = new Itemperdido($db);
$cliente = new Cliente($db);
$vendedor = new Vendedor($db);

$request_method = $_SERVER["REQUEST_METHOD"];
$path_info = isset($_SERVER['PATH_INFO']) ? explode('/', $_SERVER['PATH_INFO']) : [];

switch ($request_method) {
    case 'GET':
        if (!empty($path_info[1])) {
            if ($path_info[1] == 'itens' && isset($path_info[2])) {
                // GET /telaretorno_api.php/itens/{pedido_id}
                $itemperdido->Pedido = $path_info[2];
                $stmt = $itemperdido->readByPedido();
                $num = $stmt->rowCount();

                if ($num > 0) {
                    $itens_arr = array();
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        extract($row);
                        $item_item = array(
                            "Pedido" => $Pedido,
                            "Codart" => $Codart,
                            "Descricao" => $Descricao,
                            "Qtdsai" => $Qtdsai,
                            "Qtdret" => $Qtdret,
                            "Precus" => $Precus,
                            "Preven" => $Preven
                        );
                        array_push($itens_arr, $item_item);
                    }
                    http_response_code(200);
                    echo json_encode($itens_arr);
                } else {
                    http_response_code(404);
                    echo json_encode(array("message" => "Nenhum item encontrado para o pedido."));
                }
            } else {
                // GET /telaretorno_api.php/{pedido_id}
                $perdido->Pedido = $path_info[1];
                $perdido->readOne();

                if ($perdido->Nomcli != null) {
                    $perdido_arr = array(
                        "Pedido" => $perdido->Pedido,
                        "Codven" => $perdido->Codven,
                        "Codcli" => $perdido->Codcli,
                        "Nomcli" => $perdido->Nomcli,
                        "Base" => $perdido->Base,
                        "Recol" => $perdido->Recol,
                        "Cobran" => $perdido->Cobran,
                        "Totped" => $perdido->Totped,
                        "Situ" => $perdido->Situ,
                        "Datped" => $perdido->Datped,
                        "Solicit" => $perdido->Solicit,
                        "Retorno" => $perdido->Retorno,
                        "Totven" => $perdido->Totven,
                        "Datpag" => $perdido->Datpag,
                        "Valpag" => $perdido->Valpag,
                        "Residuo" => $perdido->Residuo,
                        "Cob" => $perdido->Cob,
                        "Limite" => $perdido->Limite,
                        "Via" => $perdido->Via,
                        "Oldped" => $perdido->Oldped
                    );
                    http_response_code(200);
                    echo json_encode($perdido_arr);
                } else {
                    http_response_code(404);
                    echo json_encode(array("message" => "Pedido não encontrado."));
                }
            }
        } else {
            // GET /telaretorno_api.php (listar todos os pedidos)
            $stmt = $perdido->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $pedidos_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $pedido_item = array(
                        "Pedido" => $Pedido,
                        "Codven" => $Codven,
                        "Codcli" => $Codcli,
                        "Nomcli" => $Nomcli,
                        "Base" => $Base,
                        "Recol" => $Recol,
                        "Cobran" => $Cobran,
                        "Totped" => $Totped,
                        "Situ" => $Situ,
                        "Datped" => $Datped,
                        "Solicit" => $Solicit,
                        "Retorno" => $Retorno,
                        "Totven" => $Totven,
                        "Datpag" => $Datpag,
                        "Valpag" => $Valpag,
                        "Residuo" => $Residuo,
                        "Cob" => $Cob,
                        "Limite" => $Limite,
                        "Via" => $Via,
                        "Oldped" => $Oldped
                    );
                    array_push($pedidos_arr, $pedido_item);
                }
                http_response_code(200);
                echo json_encode($pedidos_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum pedido encontrado."));
            }
        }
        break;

    case 'PUT':
        // PUT /telaretorno_api.php/{pedido_id}
        if (!empty($path_info[1])) {
            $data = json_decode(file_get_contents("php://input"));

            $perdido->Pedido = $path_info[1];
            $perdido->Codven = $data->Codven;
            $perdido->Codcli = $data->Codcli;
            $perdido->Nomcli = $data->Nomcli;
            $perdido->Base = $data->Base;
            $perdido->Recol = $data->Recol;
            $perdido->Cobran = $data->Cobran;
            $perdido->Totped = $data->Totped;
            $perdido->Situ = $data->Situ;
            $perdido->Datped = $data->Datped;
            $perdido->Solicit = $data->Solicit;
            $perdido->Retorno = $data->Retorno;
            $perdido->Totven = $data->Totven;
            $perdido->Datpag = $data->Datpag;
            $perdido->Valpag = $data->Valpag;
            $perdido->Residuo = $data->Residuo;
            $perdido->Cob = $data->Cob;
            $perdido->Limite = $data->Limite;
            $perdido->Via = $data->Via;
            $perdido->Oldped = $data->Oldped;

            if ($perdido->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Pedido foi atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o pedido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Pedido ID não especificado para atualização."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}