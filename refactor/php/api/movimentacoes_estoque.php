<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/MovimentacaoEstoque.php';
include_once '../models/Produto.php'; // Será necessário para atualizar o estoque

$database = new Database();
$db = $database->getConnection();

$movimentacaoEstoque = new MovimentacaoEstoque($db);
$produto = new Produto($db); // Instância do modelo Produto

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["numero_documento"])) {
            $movimentacaoEstoque->numero_documento = $_GET["numero_documento"];
            $stmt = $movimentacaoEstoque->readByNumeroDocumento();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $movimentacoes_arr = array();
                $movimentacoes_arr["records"] = array();
                $total_value = 0;

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $movimentacao_item = array(
                        "id" => $id,
                        "numero_documento" => $numero_documento,
                        "data_movimentacao" => $data_movimentacao,
                        "tipo" => $tipo,
                        "produto_id" => $produto_id,
                        "descricao_produto" => $descricao_produto,
                        "quantidade" => $quantidade,
                        "preco_custo" => $preco_custo,
                        "data_registro" => $data_registro
                    );
                    array_push($movimentacoes_arr["records"], $movimentacao_item);
                    $total_value += ($quantidade * $preco_custo);
                }
                $movimentacoes_arr["total_value"] = $total_value;
                http_response_code(200);
                echo json_encode($movimentacoes_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma movimentação de estoque encontrada para o número de documento."));
            }
        } else {
            $stmt = $movimentacaoEstoque->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $movimentacoes_arr = array();
                $movimentacoes_arr["records"] = array();

                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $movimentacao_item = array(
                        "id" => $id,
                        "numero_documento" => $numero_documento,
                        "data_movimentacao" => $data_movimentacao,
                        "tipo" => $tipo,
                        "produto_id" => $produto_id,
                        "descricao_produto" => $descricao_produto,
                        "quantidade" => $quantidade,
                        "preco_custo" => $preco_custo,
                        "data_registro" => $data_registro
                    );
                    array_push($movimentacoes_arr["records"], $movimentacao_item);
                }
                http_response_code(200);
                echo json_encode($movimentacoes_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma movimentação de estoque encontrada."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->produto_id) &&
            !empty($data->quantidade) &&
            !empty($data->preco_custo) &&
            !empty($data->tipo) &&
            !empty($data->data_movimentacao)
        ) {
            // Se numero_documento não for fornecido, gera um novo
            if (empty($data->numero_documento)) {
                $movimentacaoEstoque->numero_documento = $movimentacaoEstoque->generateNumeroDocumento();
            } else {
                $movimentacaoEstoque->numero_documento = $data->numero_documento;
            }

            $movimentacaoEstoque->data_movimentacao = $data->data_movimentacao;
            $movimentacaoEstoque->tipo = $data->tipo;
            $movimentacaoEstoque->produto_id = $data->produto_id;
            $movimentacaoEstoque->quantidade = $data->quantidade;
            $movimentacaoEstoque->preco_custo = $data->preco_custo;

            // Obter descrição do produto
            $produto->id = $data->produto_id;
            if ($produto->readOne()) {
                $movimentacaoEstoque->descricao_produto = $produto->descricao;
            } else {
                http_response_code(400);
                echo json_encode(array("message" => "Não foi possível encontrar o produto."));
                break;
            }

            if ($movimentacaoEstoque->create()) {
                // Atualizar estoque do produto
                $produto->id = $data->produto_id;
                $produto->readOne(); // Carrega os dados atuais do produto
                $produto->estoque_atual += ($data->tipo == 'defeito' ? -$data->quantidade : $data->quantidade); // Ajusta o estoque
                $produto->update(); // Salva a atualização

                http_response_code(201);
                echo json_encode(array("message" => "Movimentação de estoque criada com sucesso.", "numero_documento" => $movimentacaoEstoque->numero_documento));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar a movimentação de estoque."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar a movimentação de estoque. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->id) &&
            !empty($data->numero_documento) &&
            !empty($data->produto_id) &&
            !empty($data->quantidade) &&
            !empty($data->preco_custo) &&
            !empty($data->tipo) &&
            !empty($data->data_movimentacao)
        ) {
            $movimentacaoEstoque->id = $data->id;
            $movimentacaoEstoque->numero_documento = $data->numero_documento;
            $movimentacaoEstoque->data_movimentacao = $data->data_movimentacao;
            $movimentacaoEstoque->tipo = $data->tipo;
            $movimentacaoEstoque->produto_id = $data->produto_id;
            $movimentacaoEstoque->quantidade = $data->quantidade;
            $movimentacaoEstoque->preco_custo = $data->preco_custo;

            // Obter descrição do produto
            $produto->id = $data->produto_id;
            if ($produto->readOne()) {
                $movimentacaoEstoque->descricao_produto = $produto->descricao;
            } else {
                http_response_code(400);
                echo json_encode(array("message" => "Não foi possível encontrar o produto."));
                break;
            }

            // Obter a movimentação antiga para calcular a diferença no estoque
            $oldMovimentacao = new MovimentacaoEstoque($db);
            $oldMovimentacao->id = $data->id;
            $oldMovimentacao->readOne();

            if ($movimentacaoEstoque->update()) {
                // Atualizar estoque do produto
                $produto->id = $data->produto_id;
                $produto->readOne(); // Carrega os dados atuais do produto

                // Reverte o estoque da movimentação antiga
                $produto->estoque_atual += ($oldMovimentacao->tipo == 'defeito' ? $oldMovimentacao->quantidade : -$oldMovimentacao->quantidade);
                // Aplica o estoque da nova movimentação
                $produto->estoque_atual += ($data->tipo == 'defeito' ? -$data->quantidade : $data->quantidade);
                $produto->update(); // Salva a atualização

                http_response_code(200);
                echo json_encode(array("message" => "Movimentação de estoque atualizada com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar a movimentação de estoque."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar a movimentação de estoque. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->id)) {
            $movimentacaoEstoque->id = $data->id;

            // Obter a movimentação antes de deletar para reverter o estoque
            $movimentacaoEstoque->readOne();
            $produto_id_afetado = $movimentacaoEstoque->produto_id;
            $quantidade_afetada = $movimentacaoEstoque->quantidade;
            $tipo_afetado = $movimentacaoEstoque->tipo;

            if ($movimentacaoEstoque->delete()) {
                // Reverter estoque do produto
                $produto->id = $produto_id_afetado;
                $produto->readOne(); // Carrega os dados atuais do produto
                $produto->estoque_atual += ($tipo_afetado == 'defeito' ? $quantidade_afetada : -$quantidade_afetada); // Reverte o estoque
                $produto->update(); // Salva a atualização

                http_response_code(200);
                echo json_encode(array("message" => "Movimentação de estoque excluída com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir a movimentação de estoque."));
            }
        } elseif (!empty($data->numero_documento)) {
            $movimentacaoEstoque->numero_documento = $data->numero_documento;

            // Obter todas as movimentações antes de deletar para reverter o estoque
            $stmt = $movimentacaoEstoque->readByNumeroDocumento();
            $movimentacoes_para_reverter = array();
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                array_push($movimentacoes_para_reverter, $row);
            }

            if ($movimentacaoEstoque->deleteByNumeroDocumento()) {
                // Reverter estoque para cada item
                foreach ($movimentacoes_para_reverter as $item) {
                    $produto->id = $item['produto_id'];
                    $produto->readOne();
                    $produto->estoque_atual += ($item['tipo'] == 'defeito' ? $item['quantidade'] : -$item['quantidade']);
                    $produto->update();
                }

                http_response_code(200);
                echo json_encode(array("message" => "Movimentações de estoque do documento excluídas com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir as movimentações de estoque do documento."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível excluir a movimentação de estoque. ID ou número de documento não fornecido."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>