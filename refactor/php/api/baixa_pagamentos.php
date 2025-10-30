<?php
// refactor/php/api/baixa_pagamentos.php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/ContasAPagarReceber.php';

$database = new Database();
$db = $database->getConnection();

$contasAPagarReceber = new ContasAPagarReceber($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        $stmt = $contasAPagarReceber->read();
        $num = $stmt->rowCount();

        if ($num > 0) {
            $contas_arr = array();
            $contas_arr["records"] = array();

            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                extract($row);
                $conta_item = array(
                    "id" => $id,
                    "tipoDoc" => $tipo_documento,
                    "numDoc" => $numero_documento,
                    "parcela" => $parcela,
                    "dataVencimento" => $data_vencimento,
                    "valorOriginal" => $valor_original,
                    "valorPago" => $valor_pago,
                    "dataPagamento" => $data_pagamento,
                    "status" => $status,
                    "fornecedorId" => $fornecedor_id
                );
                array_push($contas_arr["records"], $conta_item);
            }
            http_response_code(200);
            echo json_encode($contas_arr);
        } else {
            http_response_code(404);
            echo json_encode(array("message" => "Nenhuma conta a pagar/receber encontrada."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->status) &&
            !empty($data->valorPago) &&
            !empty($data->dataPagamento)
        ) {
            $contasAPagarReceber->id = $data->id;
            $contasAPagarReceber->status = $data->status;
            $contasAPagarReceber->valor_pago = $data->valorPago;
            $contasAPagarReceber->data_pagamento = $data->dataPagamento;

            if ($contasAPagarReceber->updateStatus()) {
                http_response_code(200);
                echo json_encode(array("message" => "Status da conta atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o status da conta."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o status da conta. Dados incompletos."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}