<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/ContaPagarReceber.php';
include_once '../models/Fornecedor.php'; // Incluir se necessário para buscar detalhes do fornecedor

$database = new Database();
$db = $database->getConnection();

$contaPagarReceber = new ContaPagarReceber($db);
$fornecedor = new Fornecedor($db); // Instanciar se necessário

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $contaPagarReceber->id = $_GET["id"];
            $contaPagarReceber->readOne();
            if ($contaPagarReceber->tipo_documento != null) {
                $conta_arr = array(
                    "id" => $contaPagarReceber->id,
                    "data_emissao" => $contaPagarReceber->data_emissao,
                    "tipo_documento" => $contaPagarReceber->tipo_documento,
                    "numero_documento" => $contaPagarReceber->numero_documento,
                    "parcela" => $contaPagarReceber->parcela,
                    "historico" => $contaPagarReceber->historico,
                    "observacoes" => $contaPagarReceber->observacoes,
                    "valor" => $contaPagarReceber->valor,
                    "tipo_cobranca" => $contaPagarReceber->tipo_cobranca,
                    "numero_cobranca" => $contaPagarReceber->numero_cobranca,
                    "origem_cobranca" => $contaPagarReceber->origem_cobranca,
                    "data_vencimento" => $contaPagarReceber->data_vencimento,
                    "sinal" => $contaPagarReceber->sinal,
                    "sigla" => $contaPagarReceber->sigla,
                    "situacao" => $contaPagarReceber->situacao,
                    "data_pagamento" => $contaPagarReceber->data_pagamento,
                    "vendedor_id" => $contaPagarReceber->vendedor_id,
                    "valor_comissao_acordada" => $contaPagarReceber->valor_comissao_acordada,
                    "valor_comissao_paga" => $contaPagarReceber->valor_comissao_paga,
                    "data_baixa" => $contaPagarReceber->data_baixa,
                    "operador" => $contaPagarReceber->operador,
                    "cliente_id" => $contaPagarReceber->cliente_id,
                    "fornecedor_id" => $contaPagarReceber->fornecedor_id
                );
                http_response_code(200);
                echo json_encode($conta_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Conta a pagar/receber não encontrada."));
            }
        } elseif (!empty($_GET["tipo_documento"]) && !empty($_GET["numero_documento"]) && !empty($_GET["parcela"])) {
            $stmt = $contaPagarReceber->readByDocumentoAndParcela($_GET["tipo_documento"], $_GET["numero_documento"], $_GET["parcela"]);
            $num = $stmt->rowCount();

            if ($num > 0) {
                $contas_arr = array();
                $contas_arr["records"] = array();

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
                        "valor_comissao_acordada" => $valor_comissao_acordada,
                        "valor_comissao_paga" => $valor_comissao_paga,
                        "data_baixa" => $data_baixa,
                        "operador" => $operador,
                        "cliente_id" => $cliente_id,
                        "fornecedor_id" => $fornecedor_id
                    );
                    array_push($contas_arr["records"], $conta_item);
                }
                http_response_code(200);
                echo json_encode($contas_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma conta encontrada para o documento e parcela especificados."));
            }
        } else {
            $stmt = $contaPagarReceber->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $contas_arr = array();
                $contas_arr["records"] = array();

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
                        "valor_comissao_acordada" => $valor_comissao_acordada,
                        "valor_comissao_paga" => $valor_comissao_paga,
                        "data_baixa" => $data_baixa,
                        "operador" => $operador,
                        "cliente_id" => $cliente_id,
                        "fornecedor_id" => $fornecedor_id
                    );
                    array_push($contas_arr["records"], $conta_item);
                }
                http_response_code(200);
                echo json_encode($contas_arr);
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
            !empty($data->historico) &&
            !empty($data->valor) &&
            !empty($data->tipo_cobranca) &&
            !empty($data->numero_cobranca) &&
            !empty($data->origem_cobranca) &&
            !empty($data->data_vencimento) &&
            !empty($data->sinal) &&
            !empty($data->sigla)
        ) {
            $contaPagarReceber->data_emissao = $data->data_emissao;
            $contaPagarReceber->tipo_documento = $data->tipo_documento;
            $contaPagarReceber->numero_documento = $data->numero_documento;
            $contaPagarReceber->parcela = $data->parcela;
            $contaPagarReceber->historico = $data->historico;
            $contaPagarReceber->observacoes = $data->observacoes ?? '';
            $contaPagarReceber->valor = $data->valor;
            $contaPagarReceber->tipo_cobranca = $data->tipo_cobranca;
            $contaPagarReceber->numero_cobranca = $data->numero_cobranca;
            $contaPagarReceber->origem_cobranca = $data->origem_cobranca;
            $contaPagarReceber->data_vencimento = $data->data_vencimento;
            $contaPagarReceber->sinal = $data->sinal;
            $contaPagarReceber->sigla = $data->sigla;
            $contaPagarReceber->situacao = $data->situacao ?? '';
            $contaPagarReceber->data_pagamento = $data->data_pagamento ?? '';
            $contaPagarReceber->vendedor_id = $data->vendedor_id ?? null;
            $contaPagarReceber->valor_comissao_acordada = $data->valor_comissao_acordada ?? 0;
            $contaPagarReceber->valor_comissao_paga = $data->valor_comissao_paga ?? 0;
            $contaPagarReceber->data_baixa = $data->data_baixa ?? '';
            $contaPagarReceber->operador = $data->operador ?? '';
            $contaPagarReceber->cliente_id = $data->cliente_id ?? null;
            $contaPagarReceber->fornecedor_id = $data->fornecedor_id ?? null;

            if ($contaPagarReceber->create()) {
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
            !empty($data->historico) &&
            !empty($data->valor) &&
            !empty($data->tipo_cobranca) &&
            !empty($data->numero_cobranca) &&
            !empty($data->origem_cobranca) &&
            !empty($data->data_vencimento) &&
            !empty($data->sinal) &&
            !empty($data->sigla)
        ) {
            $contaPagarReceber->id = $data->id;
            $contaPagarReceber->data_emissao = $data->data_emissao;
            $contaPagarReceber->tipo_documento = $data->tipo_documento;
            $contaPagarReceber->numero_documento = $data->numero_documento;
            $contaPagarReceber->parcela = $data->parcela;
            $contaPagarReceber->historico = $data->historico;
            $contaPagarReceber->observacoes = $data->observacoes ?? '';
            $contaPagarReceber->valor = $data->valor;
            $contaPagarReceber->tipo_cobranca = $data->tipo_cobranca;
            $contaPagarReceber->numero_cobranca = $data->numero_cobranca;
            $contaPagarReceber->origem_cobranca = $data->origem_cobranca;
            $contaPagarReceber->data_vencimento = $data->data_vencimento;
            $contaPagarReceber->sinal = $data->sinal;
            $contaPagarReceber->sigla = $data->sigla;
            $contaPagarReceber->situacao = $data->situacao ?? '';
            $contaPagarReceber->data_pagamento = $data->data_pagamento ?? '';
            $contaPagarReceber->vendedor_id = $data->vendedor_id ?? null;
            $contaPagarReceber->valor_comissao_acordada = $data->valor_comissao_acordada ?? 0;
            $contaPagarReceber->valor_comissao_paga = $data->valor_comissao_paga ?? 0;
            $contaPagarReceber->data_baixa = $data->data_baixa ?? '';
            $contaPagarReceber->operador = $data->operador ?? '';
            $contaPagarReceber->cliente_id = $data->cliente_id ?? null;
            $contaPagarReceber->fornecedor_id = $data->fornecedor_id ?? null;

            if ($contaPagarReceber->update()) {
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
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id)) {
            $contaPagarReceber->id = $data->id;
            if ($contaPagarReceber->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Conta a pagar/receber excluída com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir a conta a pagar/receber."));
            }
        } elseif (!empty($data->tipo_documento) && !empty($data->numero_documento)) {
            if ($contaPagarReceber->deleteByDocumento($data->tipo_documento, $data->numero_documento)) {
                http_response_code(200);
                echo json_encode(array("message" => "Contas a pagar/receber do documento excluídas com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir as contas a pagar/receber do documento."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir a conta a pagar/receber. ID ou tipo_documento/numero_documento não fornecidos."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}