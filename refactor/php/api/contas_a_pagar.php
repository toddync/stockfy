<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/ContaPagar.php';

$database = new Database();
$db = $database->getConnection();

$contaPagar = new ContaPagar($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $contaPagar->id = $_GET["id"];
            $contaPagar->readOne();
            if ($contaPagar->historico != null) {
                $conta_pagar_arr = array(
                    "id" => $contaPagar->id,
                    "data_emissao" => $contaPagar->data_emissao,
                    "tipo_documento" => $contaPagar->tipo_documento,
                    "numero_documento" => $contaPagar->numero_documento,
                    "parcela" => $contaPagar->parcela,
                    "historico" => $contaPagar->historico,
                    "observacoes" => $contaPagar->observacoes,
                    "valor" => $contaPagar->valor,
                    "tipo_cobranca" => $contaPagar->tipo_cobranca,
                    "numero_cobranca" => $contaPagar->numero_cobranca,
                    "origem_cobranca" => $contaPagar->origem_cobranca,
                    "data_vencimento" => $contaPagar->data_vencimento,
                    "sinal" => $contaPagar->sinal,
                    "sigla" => $contaPagar->sigla,
                    "situacao" => $contaPagar->situacao,
                    "data_pagamento" => $contaPagar->data_pagamento,
                    "vendedor_id" => $contaPagar->vendedor_id,
                    "comissao" => $contaPagar->comissao,
                    "data_baixa" => $contaPagar->data_baixa,
                    "operador" => $contaPagar->operador,
                    "cliente_id" => $contaPagar->cliente_id
                );
                http_response_code(200);
                echo json_encode($conta_pagar_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Conta a pagar/receber não encontrada."));
            }
        } else {
            $stmt = $contaPagar->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $contas_pagar_arr = array();
                $contas_pagar_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $conta_item = array(
                        "id" => $id,
                        "data_emissao" => $data_emissao,
                        "tipo_documento" => $tipo_documento,
                        "numero_documento" => $numero_documento,
                        "parcela" => $parcela,
                        "historico" => $historico,
                        "observacoes" => $observacoes,
                        "valor" => $valor,
                        "tipo_cobranca" => $tipo_cobranca,
                        "numero_cobranca" => $numero_cobranca,
                        "origem_cobranca" => $origem_cobranca,
                        "data_vencimento" => $data_vencimento,
                        "sinal" => $sinal,
                        "sigla" => $sigla,
                        "situacao" => $situacao,
                        "data_pagamento" => $data_pagamento,
                        "vendedor_id" => $vendedor_id,
                        "comissao" => $comissao,
                        "data_baixa" => $data_baixa,
                        "operador" => $operador,
                        "cliente_id" => $cliente_id
                    );
                    array_push($contas_pagar_arr["records"], $conta_item);
                }
                http_response_code(200);
                echo json_encode($contas_pagar_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma conta a pagar/receber encontrada."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->data_emissao) &&
            !empty($data->tipo_documento) &&
            !empty($data->numero_documento) &&
            !empty($data->parcela) &&
            !empty($data->valor) &&
            !empty($data->data_vencimento) &&
            !empty($data->sinal) &&
            !empty($data->sigla)
        ) {
            $contaPagar->data_emissao = $data->data_emissao;
            $contaPagar->tipo_documento = $data->tipo_documento;
            $contaPagar->numero_documento = $data->numero_documento;
            $contaPagar->parcela = $data->parcela;
            $contaPagar->historico = $data->historico ?? null;
            $contaPagar->observacoes = $data->observacoes ?? null;
            $contaPagar->valor = $data->valor;
            $contaPagar->tipo_cobranca = $data->tipo_cobranca ?? null;
            $contaPagar->numero_cobranca = $data->numero_cobranca ?? null;
            $contaPagar->origem_cobranca = $data->origem_cobranca ?? null;
            $contaPagar->data_vencimento = $data->data_vencimento;
            $contaPagar->sinal = $data->sinal;
            $contaPagar->sigla = $data->sigla;
            $contaPagar->situacao = $data->situacao ?? 'A';
            $contaPagar->data_pagamento = $data->data_pagamento ?? null;
            $contaPagar->vendedor_id = $data->vendedor_id ?? null;
            $contaPagar->comissao = $data->comissao ?? 0.00;
            $contaPagar->data_baixa = $data->data_baixa ?? null;
            $contaPagar->operador = $data->operador ?? null;
            $contaPagar->cliente_id = $data->cliente_id ?? null;

            if ($contaPagar->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Conta a pagar/receber criada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a conta a pagar/receber."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a conta a pagar/receber. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->data_emissao) &&
            !empty($data->tipo_documento) &&
            !empty($data->numero_documento) &&
            !empty($data->parcela) &&
            !empty($data->valor) &&
            !empty($data->data_vencimento) &&
            !empty($data->sinal) &&
            !empty($data->sigla)
        ) {
            $contaPagar->id = $data->id;
            $contaPagar->data_emissao = $data->data_emissao;
            $contaPagar->tipo_documento = $data->tipo_documento;
            $contaPagar->numero_documento = $data->numero_documento;
            $contaPagar->parcela = $data->parcela;
            $contaPagar->historico = $data->historico ?? null;
            $contaPagar->observacoes = $data->observacoes ?? null;
            $contaPagar->valor = $data->valor;
            $contaPagar->tipo_cobranca = $data->tipo_cobranca ?? null;
            $contaPagar->numero_cobranca = $data->numero_cobranca ?? null;
            $contaPagar->origem_cobranca = $data->origem_cobranca ?? null;
            $contaPagar->data_vencimento = $data->data_vencimento;
            $contaPagar->sinal = $data->sinal;
            $contaPagar->sigla = $data->sigla;
            $contaPagar->situacao = $data->situacao ?? 'A';
            $contaPagar->data_pagamento = $data->data_pagamento ?? null;
            $contaPagar->vendedor_id = $data->vendedor_id ?? null;
            $contaPagar->comissao = $data->comissao ?? 0.00;
            $contaPagar->data_baixa = $data->data_baixa ?? null;
            $contaPagar->operador = $data->operador ?? null;
            $contaPagar->cliente_id = $data->cliente_id ?? null;

            if ($contaPagar->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Conta a pagar/receber atualizada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a conta a pagar/receber."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar a conta a pagar/receber. Dados incompletos."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["id"])) {
            $contaPagar->id = $_GET["id"];
            if ($contaPagar->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Conta a pagar/receber excluída com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir a conta a pagar/receber."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir a conta a pagar/receber. ID não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>