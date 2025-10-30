<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Roteamento simples
$url = isset($_GET['url']) ? $_GET['url'] : '';
$url = rtrim($url, '/');
$urlParts = explode('/', $url);

$resource = $urlParts[0] ?? null;
$id = $urlParts[1] ?? null;

$method = $_SERVER['REQUEST_METHOD'];

if ($method == 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Estrutura de roteamento básica
switch ($resource) {
    case 'clientes':
        // Lógica para o recurso 'clientes'
        // Exemplo: require_once 'api/clientes/clientes_handler.php';
        echo json_encode(['message' => 'Recurso de clientes acessado.']);
        break;
    case 'produtos':
        require_once 'api/produtos.php';
        break;
    case 'produto_grupos':
        require_once 'api/produto_grupos.php';
        break;
    case 'compras':
        require_once 'api/compras.php';
        break;
    case 'compra_itens':
        require_once 'api/compra_itens.php';
        break;
    case 'fornecedores':
        require_once 'api/fornecedores.php';
        break;
    case 'contas_a_pagar_receber':
        require_once 'api/contas_a_pagar_receber.php';
        break;
    default:
        http_response_code(404);
        echo json_encode(['message' => 'Recurso não encontrado.']);
        break;
}
?>