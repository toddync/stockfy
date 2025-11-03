<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once '../models/Database.php';
require_once '../models/Compra.php';
require_once '../models/ItemCompra.php';
require_once '../models/Artigo.php';
require_once '../models/ContaPagar.php';
require_once '../models/AuxItcom.php';
require_once '../models/AuxConta.php';

$database = new Database();
$db = $database->getConnection();

$request_method = $_SERVER["REQUEST_METHOD"];
$path_info = isset($_SERVER['PATH_INFO']) ? explode('/', $_SERVER['PATH_INFO']) : [];
$resource = $path_info[1] ?? '';
$id = $path_info[2] ?? '';

switch ($request_method) {
    case 'GET':
        if ($resource === 'artigo' && !empty($id)) {
            // GET /api/ajuste-compras/artigo/{codigoArtigo}
            $artigo_obj = new Artigo($db);
            $artigo_data = $artigo_obj->findByCodArtigo($id);
            if ($artigo_data) {
                http_response_code(200);
                echo json_encode($artigo_data);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Artigo não encontrado."));
            }
        } elseif (!empty($resource) && !empty($id)) {
            // GET /api/ajuste-compras/{tipoPedido}/{numPedido}
            $tipoPedido = $resource;
            $numPedido = $id;

            $compra = Compra::find($tipoPedido, $numPedido);
            if ($compra) {
                $itensCompra = ItemCompra::findByCompra($compra->id);
                $contasPagar = ContaPagar::findByCompra($compra->id);

                http_response_code(200);
                echo json_encode(array(
                    "compra" => $compra,
                    "itensCompra" => $itensCompra,
                    "contasPagar" => $contasPagar
                ));
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Pedido de compra não encontrado."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Requisição GET inválida."));
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if ($resource === 'item') {
            // POST /api/ajuste-compras/item
            $auxItcom = new AuxItcom($data);
            if ($auxItcom->save()) {
                http_response_code(201);
                echo json_encode(array("message" => "Item adicionado temporariamente.", "item" => $auxItcom));
            } else {
                http_response_code(500);
                echo json_encode(array("message" => "Erro ao adicionar item temporário."));
            }
        } elseif ($resource === 'parcela') {
            // POST /api/ajuste-compras/parcela
            $auxConta = new AuxConta($data);
            if ($auxConta->save()) {
                http_response_code(201);
                echo json_encode(array("message" => "Parcela adicionada temporariamente.", "parcela" => $auxConta));
            } else {
                http_response_code(500);
                echo json_encode(array("message" => "Erro ao adicionar parcela temporária."));
            }
        } elseif ($resource === 'finalizar') {
            // POST /api/ajuste-compras/finalizar
            // Lógica para persistir as alterações das tabelas temporárias para as tabelas principais
            // Iniciar transação
            $db->beginTransaction();
            try {
                // Exemplo: Salvar itens de AuxItcom para ItemCompra
                // Exemplo: Salvar contas de AuxConta para ContaPagar
                // Exemplo: Atualizar Compra

                $db->commit();
                http_response_code(200);
                echo json_encode(array("message" => "Ajuste de compra finalizado com sucesso."));
            } catch (Exception $e) {
                $db->rollBack();
                http_response_code(500);
                echo json_encode(array("message" => "Erro ao finalizar ajuste: " . $e->getMessage()));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Requisição POST inválida."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));
        if ($resource === 'item' && !empty($id)) {
            // PUT /api/ajuste-compras/item/{item}
            // Lógica para atualizar um item existente na tabela temporária AUXITCOM
            $auxItcom = new AuxItcom($data); // Assumindo que o ID está em $data
            $auxItcom->id = $id; // Garante que o ID do item a ser atualizado é o da URL
            if ($auxItcom->save()) {
                http_response_code(200);
                echo json_encode(array("message" => "Item temporário atualizado.", "item" => $auxItcom));
            } else {
                http_response_code(500);
                echo json_encode(array("message" => "Erro ao atualizar item temporário."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Requisição PUT inválida."));
        }
        break;

    case 'DELETE':
        if ($resource === 'item' && !empty($id)) {
            // DELETE /api/ajuste-compras/item/{item}
            // Lógica para marcar um item para exclusão na tabela temporária AUXITCOM
            $auxItcom = new AuxItcom(['id' => $id]); // Cria um objeto com o ID para exclusão
            if ($auxItcom->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Item temporário marcado para exclusão."));
            } else {
                http_response_code(500);
                echo json_encode(array("message" => "Erro ao marcar item para exclusão."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Requisição DELETE inválida."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>