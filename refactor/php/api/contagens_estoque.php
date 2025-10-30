<?php
header('Content-Type: application/json');
require_once '../config/database.php';
require_once '../models/ContagemEstoque.php';
require_once '../models/Produto.php';
require_once '../models/Pedido.php';
require_once '../models/PedidoItem.php';

$database = new Database();
$db = $database->getConnection();

$contagemEstoque = new ContagemEstoque($db);
$produto = new Produto($db);
$pedido = new Pedido($db);
$pedidoItem = new PedidoItem($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["data_contagem"])) {
            $data_contagem = $_GET["data_contagem"];
            $tipo = isset($_GET["tipo"]) ? $_GET["tipo"] : null;

            // Verifica se a contagem já existe para a data
            if ($contagemEstoque->existsByDate($data_contagem)) {
                $stmt = $contagemEstoque->readByDate($data_contagem, $tipo);
                $num = $stmt->rowCount();

                if ($num > 0) {
                    $contagens_arr = array();
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        extract($row);
                        $contagem_item = array(
                            "id" => $id,
                            "data_contagem" => $data_contagem,
                            "tipo" => $tipo,
                            "produto_id" => $produto_id,
                            "descricao_produto" => $descricao_produto,
                            "grupo_produto" => $grupo_produto,
                            "quantidade_inicial" => $quantidade_inicial,
                            "quantidade_sacol" => $quantidade_sacol,
                            "preco_custo_contagem" => $preco_custo_contagem,
                            "data_registro" => $data_registro
                        );
                        array_push($contagens_arr, $contagem_item);
                    }
                    http_response_code(200);
                    echo json_encode($contagens_arr);
                } else {
                    http_response_code(404);
                    echo json_encode(array("message" => "Nenhuma contagem encontrada para a data e/ou tipo."));
                }
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Contagem não realizada nesta data."));
            }
        } elseif (!empty($_GET["tipo"])) {
            $tipo = $_GET["tipo"];
            $stmt = $contagemEstoque->readByType($tipo);
            $num = $stmt->rowCount();

            if ($num > 0) {
                $contagens_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $contagem_item = array(
                        "id" => $id,
                        "data_contagem" => $data_contagem,
                        "tipo" => $tipo,
                        "produto_id" => $produto_id,
                        "descricao_produto" => $descricao_produto,
                        "grupo_produto" => $grupo_produto,
                        "quantidade_inicial" => $quantidade_inicial,
                        "quantidade_sacol" => $quantidade_sacol,
                        "preco_custo_contagem" => $preco_custo_contagem,
                        "data_registro" => $data_registro
                    );
                    array_push($contagens_arr, $contagem_item);
                }
                http_response_code(200);
                echo json_encode($contagens_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhuma contagem encontrada para o tipo especificado."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Parâmetros de busca insuficientes. Forneça 'data_contagem' ou 'tipo'."));
        }
        break;

    case 'POST': // Criar nova contagem (Novacontg do Pascal)
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->data_contagem)) {
            $data_contagem = $data->data_contagem;

            // 1. Inserir registro inicial "CONTAGEM"
            $contagemEstoque->data_contagem = $data_contagem;
            $contagemEstoque->tipo = 'inicial';
            $contagemEstoque->produto_id = 0; // ID 0 para o registro "CONTAGEM"
            $contagemEstoque->descricao_produto = 'CONTAGEM';
            $contagemEstoque->grupo_produto = '00';
            $contagemEstoque->quantidade_inicial = 0;
            $contagemEstoque->quantidade_sacol = 0;
            $contagemEstoque->preco_custo_contagem = 0;

            if (!$contagemEstoque->create()) {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o registro inicial da contagem."));
                exit();
            }

            // 2. Popular com todos os produtos
            $stmt_produtos = $produto->readAll();
            while ($row_produto = $stmt_produtos->fetch(PDO::FETCH_ASSOC)) {
                $contagemEstoque->data_contagem = $data_contagem;
                $contagemEstoque->tipo = 'ajuste';
                $contagemEstoque->produto_id = $row_produto['id'];
                $contagemEstoque->descricao_produto = $row_produto['descricao'];
                $contagemEstoque->grupo_produto = substr($row_produto['codigo_barras'], 0, 2); // Assumindo que os 2 primeiros dígitos são o grupo
                $contagemEstoque->quantidade_inicial = 0;
                $contagemEstoque->quantidade_sacol = 0;
                $contagemEstoque->preco_custo_contagem = $row_produto['preco_custo'];

                if (!$contagemEstoque->create()) {
                    http_response_code(503);
                    echo json_encode(array("message" => "Não foi possível popular a contagem com todos os produtos."));
                    exit();
                }
            }

            // 3. Atualizar 'SACOL' com base nos pedidos
            $stmt_pedidos = $pedido->readByDateAndStatus($data_contagem, 'emitido'); // 'E' no Pascal
            while ($row_pedido = $stmt_pedidos->fetch(PDO::FETCH_ASSOC)) {
                $pedido_id = $row_pedido['id'];
                $stmt_itens_pedido = $pedidoItem->readByPedidoId($pedido_id);
                while ($row_item_pedido = $stmt_itens_pedido->fetch(PDO::FETCH_ASSOC)) {
                    $produto_id = $row_item_pedido['produto_id'];
                    $quantidade_saida = $row_item_pedido['quantidade']; // Qtdsai no Pascal

                    // Buscar a contagem existente para o produto e data
                    if ($contagemEstoque->readByProductAndDate($data_contagem, $produto_id, 'ajuste')) {
                        $nova_quantidade_sacol = $contagemEstoque->quantidade_sacol + $quantidade_saida;
                        $contagemEstoque->updateSacola($contagemEstoque->id, $nova_quantidade_sacol);
                    }
                }
            }

            http_response_code(201);
            echo json_encode(array("message" => "Nova contagem criada e populada com sucesso."));
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Data da contagem é obrigatória para criar."));
        }
        break;

    case 'PUT': // Atualizar contagem (Edit6Exit do Pascal)
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->data_contagem) && !empty($data->produto_id) && isset($data->quantidade_inicial) && isset($data->preco_custo_contagem)) {
            $data_contagem = $data->data_contagem;
            $produto_id = $data->produto_id;
            $quantidade_inicial = $data->quantidade_inicial;
            $preco_custo_contagem = $data->preco_custo_contagem;

            if ($contagemEstoque->readByProductAndDate($data_contagem, $produto_id, 'ajuste')) {
                $contagemEstoque->quantidade_inicial = $quantidade_inicial;
                $contagemEstoque->preco_custo_contagem = $preco_custo_contagem;

                if ($contagemEstoque->update()) {
                    http_response_code(200);
                    echo json_encode(array("message" => "Contagem atualizada com sucesso."));
                } else {
                    http_response_code(503);
                    echo json_encode(array("message" => "Não foi possível atualizar a contagem."));
                }
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Artigo não encontrado na contagem para atualização."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Dados incompletos para atualização da contagem."));
        }
        break;

    case 'DELETE':
        if (!empty($_GET["data_contagem"])) {
            $contagemEstoque->data_contagem = $_GET["data_contagem"];
            if ($contagemEstoque->deleteByDate()) {
                http_response_code(200);
                echo json_encode(array("message" => "Contagem excluída com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir a contagem."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Data da contagem é obrigatória para exclusão."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>