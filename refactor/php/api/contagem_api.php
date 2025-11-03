<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/ContagemModel.php';
include_once '../models/ArtigoModel.php';
include_once '../models/PedidoModel.php';
include_once '../models/ItemPedidoModel.php';

$database = new Database();
$db = $database->getConnection();

$contagemModel = new ContagemModel($db);
$artigoModel = new ArtigoModel($db);
$pedidoModel = new PedidoModel($db);
$itemPedidoModel = new ItemPedidoModel($db);

$request_method = $_SERVER["REQUEST_METHOD"];
$path_info = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '';
$uri_segments = explode('/', trim($path_info, '/'));

switch ($request_method) {
    case 'GET':
        if (isset($uri_segments[1]) && $uri_segments[0] == 'contagem') {
            $data = $uri_segments[1]; // Expected format YYYY-MM-DD

            if (isset($uri_segments[2]) && $uri_segments[2] == 'artigo' && isset($uri_segments[3])) {
                // GET /api/contagem/{data}/artigo/{codigo}
                $codigo = $uri_segments[3];
                $stmt = $contagemModel->getArtigoInContagem($data, $codigo);
                $num = $stmt->rowCount();

                if ($num > 0) {
                    $artigo_item = $stmt->fetch(PDO::FETCH_ASSOC);
                    http_response_code(200);
                    echo json_encode($artigo_item);
                } else {
                    http_response_code(404);
                    echo json_encode(array("message" => "Artigo não encontrado na contagem."));
                }
            } else {
                // GET /api/contagem/{data}
                $stmt = $contagemModel->getContagemByDate($data);
                $num = $stmt->rowCount();

                if ($num > 0) {
                    $contagem_arr = array();
                    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                        extract($row);
                        $contagem_item = array(
                            "DATCONT" => $DATCONT,
                            "TIPO" => $TIPO,
                            "CODIGO" => $CODIGO,
                            "GRUPO" => $GRUPO,
                            "DESCRICAO" => $DESCRICAO,
                            "INICIAL" => $INICIAL,
                            "SACOL" => $SACOL,
                            "PRECO" => $PRECO
                        );
                        array_push($contagem_arr, $contagem_item);
                    }
                    http_response_code(200);
                    echo json_encode($contagem_arr);
                } else {
                    http_response_code(404);
                    echo json_encode(array("message" => "Nenhuma contagem encontrada para a data."));
                }
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Requisição GET inválida."));
        }
        break;

    case 'POST':
        // Implement POST /api/contagem/nova
        if (isset($uri_segments[0]) && $uri_segments[0] == 'contagem' && isset($uri_segments[1]) && $uri_segments[1] == 'nova') {
            $data = json_decode(file_get_contents("php://input"))->data;

            // 1. Inserir registro inicial
            $contagemModel->insertContagem($data, '1', '0000', '00', 'CONTAGEM', 0, 0, 0);

            // 2. Montar os artigos da nova contagem
            $stmtArtigos = $artigoModel->getAllArtigos();
            while ($rowArtigo = $stmtArtigos->fetch(PDO::FETCH_ASSOC)) {
                extract($rowArtigo);
                $contagemModel->insertContagem($data, '2', $Codigo, substr($Codigo, 0, 2), $Descricao, 0, 0, $Custo);
            }

            // 3. Montar na sacol
            $stmtPedidos = $pedidoModel->getPedidosByDateAndStatus($data, 'E');
            while ($rowPedido = $stmtPedidos->fetch(PDO::FETCH_ASSOC)) {
                extract($rowPedido);
                $pedidoNumero = $Pedido;

                $stmtItemPedidos = $itemPedidoModel->getItemPedidosByPedido($pedidoNumero);
                while ($rowItemPedido = $stmtItemPedidos->fetch(PDO::FETCH_ASSOC)) {
                    extract($rowItemPedido);
                    $codArt = $Codart;
                    $qtdSai = $Qtdsai;

                    $stmtContagemArtigo = $contagemModel->getArtigoInContagem($data, $codArt);
                    $contagemArtigo = $stmtContagemArtigo->fetch(PDO::FETCH_ASSOC);
                    $sacolAtual = $contagemArtigo ? $contagemArtigo['SACOL'] : 0;

                    $contagemModel->updateSacolInContagem($data, $codArt, $sacolAtual + $qtdSai);
                }
            }
            http_response_code(201);
            echo json_encode(array("message" => "Nova contagem implantada com sucesso."));
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Requisição POST inválida."));
        }
        break;

    case 'PUT':
        // Implement PUT /api/contagem/{data}/artigo/{codigo}
        if (isset($uri_segments[1]) && $uri_segments[0] == 'contagem' && isset($uri_segments[2]) && $uri_segments[2] == 'artigo' && isset($uri_segments[3])) {
            $data = $uri_segments[1];
            $codigo = $uri_segments[3];
            $input_data = json_decode(file_get_contents("php://input"));

            if (!empty($input_data->inicial) && !empty($input_data->preco)) {
                $inicial = $input_data->inicial;
                $preco = $input_data->preco;

                if ($contagemModel->updateArtigoInContagem($data, $codigo, $inicial, $preco)) {
                    http_response_code(200);
                    echo json_encode(array("message" => "Artigo na contagem atualizado com sucesso."));
                } else {
                    http_response_code(503);
                    echo json_encode(array("message" => "Não foi possível atualizar o artigo na contagem."));
                }
            } else {
                http_response_code(400);
                echo json_encode(array("message" => "Dados incompletos para atualização."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Requisição PUT inválida."));
        }
        break;

    case 'DELETE':
        // Implement DELETE /api/contagem/{data}
        if (isset($uri_segments[1]) && $uri_segments[0] == 'contagem') {
            $data = $uri_segments[1];

            if ($contagemModel->deleteContagemByDate($data)) {
                http_response_code(200);
                echo json_encode(array("message" => "Contagem excluída com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível excluir a contagem."));
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