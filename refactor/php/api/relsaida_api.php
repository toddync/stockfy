<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST, GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once __DIR__ . '/../core/Database.php';
require_once __DIR__ . '/../models/RelatorioSaida.php';

$database = new Database();
$db = $database->getConnection();

$relatorioSaida = new RelatorioSaida();

$request_method = $_SERVER["REQUEST_METHOD"];
$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$path_parts = explode('/', $path);

// Remove 'refactor', 'php', 'api' do caminho
$path_parts = array_slice($path_parts, array_search('api', $path_parts) + 1);

switch ($request_method) {
    case 'GET':
        if ($path_parts[0] == 'relsaida') {
            $tipo = isset($_GET['tipo']) ? $_GET['tipo'] : '';

            switch ($tipo) {
                case 'pedido_individual':
                    $numeroPedido = isset($_GET['pedido']) ? $_GET['pedido'] : die(json_encode(array("message" => "Número do pedido é obrigatório.")));
                    $result = $relatorioSaida->getPedidoIndividual($numeroPedido);
                    if ($result) {
                        http_response_code(200);
                        echo json_encode($result);
                    } else {
                        http_response_code(404);
                        echo json_encode(array("message" => "Pedido individual não encontrado."));
                    }
                    break;

                case 'etiquetas_por_faixa':
                    $etiquetaInicial = isset($_GET['inicial']) ? $_GET['inicial'] : die(json_encode(array("message" => "Etiqueta inicial é obrigatória.")));
                    $etiquetaFinal = isset($_GET['final']) ? $_GET['final'] : die(json_encode(array("message" => "Etiqueta final é obrigatória.")));
                    $vendedor = isset($_GET['vendedor']) ? $_GET['vendedor'] : '';
                    $result = $relatorioSaida->getEtiquetasPorFaixa($etiquetaInicial, $etiquetaFinal, $vendedor);
                    if ($result) {
                        http_response_code(200);
                        echo json_encode($result);
                    } else {
                        http_response_code(404);
                        echo json_encode(array("message" => "Nenhuma etiqueta encontrada para a faixa."));
                    }
                    break;

                case 'pedidos_por_faixa':
                    $pedidoInicial = isset($_GET['inicial']) ? $_GET['inicial'] : die(json_encode(array("message" => "Pedido inicial é obrigatório.")));
                    $pedidoFinal = isset($_GET['final']) ? $_GET['final'] : die(json_encode(array("message" => "Pedido final é obrigatório.")));
                    $vendedor = isset($_GET['vendedor']) ? $_GET['vendedor'] : '';
                    $result = $relatorioSaida->getPedidosPorFaixa($pedidoInicial, $pedidoFinal, $vendedor);
                    if ($result) {
                        http_response_code(200);
                        echo json_encode($result);
                    } else {
                        http_response_code(404);
                        echo json_encode(array("message" => "Nenhum pedido encontrado para a faixa."));
                    }
                    break;

                default:
                    http_response_code(400);
                    echo json_encode(array("message" => "Tipo de relatório inválido."));
                    break;
            }
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}