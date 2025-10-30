<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Pedido.php';
include_once '../models/PedidoItem.php';
include_once '../models/ContaPagarReceber.php';

$database = new Database();
$db = $database->getConnection();

$pedido = new Pedido($db);
$pedidoItem = new PedidoItem($db);
$contaPagarReceber = new ContaPagarReceber($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (isset($_GET['numero'])) {
            $pedido->id = $_GET['numero'];
            $stmt_pedido = $pedido->readOneByNumero();

            if ($stmt_pedido->rowCount() > 0) {
                $row_pedido = $stmt_pedido->fetch(PDO::FETCH_ASSOC);
                extract($row_pedido);

                $pedido_arr = array(
                    "id" => $id,
                    "cliente_id" => $cliente_id,
                    "nome_cliente" => $nome_cliente, // Assumindo que o model Pedido já faz o JOIN com clientes
                    "vendedor_id" => $vendedor_id,
                    "data_emissao" => $data_emissao,
                    "data_entrega" => $data_entrega,
                    "valor_total" => $valor_total,
                    "status" => $status,
                    "observacoes" => $observacoes,
                    "valor_pago" => $valor_pago, // Novo campo para valor pago acumulado
                    "residuo" => $residuo,       // Novo campo para resíduo
                    "data_pagamento" => $data_pagamento // Novo campo para data do último pagamento
                );

                // Buscar itens do pedido
                $pedidoItem->pedido_id = $id;
                $stmt_itens = $pedidoItem->readByPedidoId();
                $itens_arr = array();

                while ($row_item = $stmt_itens->fetch(PDO::FETCH_ASSOC)) {
                    extract($row_item);
                    $item_data = array(
                        "id" => $id,
                        "pedido_id" => $pedido_id,
                        "produto_id" => $produto_id,
                        "descricao_produto" => $descricao_produto, // Assumindo JOIN com produtos
                        "quantidade" => $quantidade,
                        "preco_unitario" => $preco_unitario,
                        "valor_total" => $valor_total,
                        "quantidade_saida" => $quantidade, // Para compatibilidade com o Pascal
                        "quantidade_retorno" => 0, // Lógica de retorno precisa ser implementada
                        "quantidade_vendida" => $quantidade, // Lógica de vendido precisa ser implementada
                        "preco_custo" => 0 // Preço de custo precisa ser buscado do produto
                    );
                    array_push($itens_arr, $item_data);
                }

                // Buscar resíduos pagos (contas a pagar/receber do tipo 'residuo')
                $contaPagarReceber->num_documento = $pedido->id; // Usar o ID do pedido como num_documento
                $contaPagarReceber->tipo_movimento = 'residuo';
                $stmt_residuos = $contaPagarReceber->readByNumDocumentoAndTipo();
                $residuos_arr = array();

                while ($row_residuo = $stmt_residuos->fetch(PDO::FETCH_ASSOC)) {
                    extract($row_residuo);
                    $residuo_data = array(
                        "id" => $id,
                        "data_movimento" => $data_movimento,
                        "item" => $item, // Se houver um campo 'item' na tabela contas_a_pagar_receber
                        "valor_pago" => $valor_pago
                    );
                    array_push($residuos_arr, $residuo_data);
                }

                echo json_encode(array("pedido" => $pedido_arr, "itens" => $itens_arr, "residuos" => $residuos_arr));
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Pedido não encontrado."));
            }
        } elseif (isset($_GET['num_doc']) && isset($_GET['tipo']) && $_GET['tipo'] == 'residuo') {
            // Endpoint para buscar apenas resíduos pagos por num_doc
            $contaPagarReceber->num_documento = $_GET['num_doc'];
            $contaPagarReceber->tipo_movimento = 'residuo';
            $stmt_residuos = $contaPagarReceber->readByNumDocumentoAndTipo();
            $residuos_arr = array();

            while ($row_residuo = $stmt_residuos->fetch(PDO::FETCH_ASSOC)) {
                extract($row_residuo);
                $residuo_data = array(
                    "id" => $id,
                    "data_movimento" => $data_movimento,
                    "item" => $item,
                    "valor_pago" => $valor_pago
                );
                array_push($residuos_arr, $residuo_data);
            }
            echo json_encode(array("residuos" => $residuos_arr));
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Parâmetros inválidos para busca de pedido ou resíduos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->pedido_numero) &&
            !empty($data->valor_pago_digitado) &&
            !empty($data->data_pagamento_digitada) &&
            isset($data->residuo_calculado) &&
            isset($data->valor_pago_acumulado)
        ) {
            // 1. Atualizar o pedido
            $pedido->id = $data->pedido_numero; // Usar id para o pedido
            $pedido->valor_pago = $data->valor_pago_acumulado;
            $pedido->residuo = $data->residuo_calculado;
            $pedido->data_pagamento = $data->data_pagamento_digitada;

            if ($pedido->updateResiduoAndPayment()) {
                // 2. Registrar o resíduo pago na tabela contas_a_pagar_receber
                $contaPagarReceber->num_documento = $data->pedido_numero;
                $contaPagarReceber->data_movimento = $data->data_pagamento_digitada;
                $contaPagarReceber->valor_pago = $data->valor_pago_digitado;
                $contaPagarReceber->tipo_movimento = 'residuo';
                $contaPagarReceber->descricao = "Pagamento de resíduo do pedido " . $data->pedido_numero;

                // Gerar um item sequencial para o resíduo
                $last_item = $contaPagarReceber->getLastItemByNumDocumentoAndTipo();
                $contaPagarReceber->item = str_pad((int)$last_item + 1, 3, '0', STR_PAD_LEFT);

                if ($contaPagarReceber->create()) {
                    http_response_code(200);
                    echo json_encode(array("success" => true, "message" => "Pagamento de resíduo registrado com sucesso."));
                } else {
                    http_response_code(503);
                    echo json_encode(array("success" => false, "message" => "Não foi possível registrar o resíduo pago."));
                }
            } else {
                http_response_code(503);
                echo json_encode(array("success" => false, "message" => "Não foi possível atualizar o pedido."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("success" => false, "message" => "Dados incompletos para registrar pagamento."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>