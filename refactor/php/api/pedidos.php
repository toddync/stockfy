<?php
// Inclui a configuração do banco de dados
require_once __DIR__ . '/../config/database.php';

// Classe para gerenciar Pedidos
class PedidoAPI {
    private $db;
    private $conn;

    // Construtor
    public function __construct() {
        $database = new Database();
        $this->conn = $database->getConnection();
    }

    // Método para obter todos os pedidos ou buscar por critérios
    public function getPedidos($params = []) {
        $query = 'SELECT * FROM PEDIDO';
        $whereClauses = [];
        $queryParams = [];

        // Lógica de busca baseada nos parâmetros recebidos
        if (!empty($params['pedido'])) {
            // Padroniza o número do pedido com zeros à esquerda se necessário
            $pedidoNum = str_pad($params['pedido'], 6, '0', STR_PAD_LEFT);
            $whereClauses[] = 'PEDIDO = :pedido';
            $queryParams[':pedido'] = $pedidoNum;
        }
        if (!empty($params['datped'])) {
            // Valida e formata a data
            $date = DateTime::createFromFormat('Y-m-d', $params['datped']);
            if ($date) {
                $whereClauses[] = 'DATPED = :datped';
                $queryParams[':datped'] = $date->format('Y-m-d');
            } else {
                // Retorna erro se a data for inválida
                return ['error' => 'Formato de data inválido. Use YYYY-MM-DD.'];
            }
        }
        if (!empty($params['nomcli'])) {
            $whereClauses[] = 'NOMCLI LIKE :nomcli';
            $queryParams[':nomcli'] = '%' . $params['nomcli'] . '%';
        }
        if (!empty($params['codven'])) {
            // Padroniza o código do vendedor com zeros à esquerda se necessário
            $codvenNum = str_pad($params['codven'], 3, '0', STR_PAD_LEFT);
            $whereClauses[] = 'CODVEN = :codven';
            $queryParams[':codven'] = $codvenNum;
        }

        // Adiciona cláusulas WHERE se existirem
        if (!empty($whereClauses)) {
            $query .= ' WHERE ' . implode(' AND ', $whereClauses);
        }

        // Adiciona ORDER BY
        $query .= ' ORDER BY PEDIDO';

        try {
            $stmt = $this->conn->prepare($query);
            $stmt->execute($queryParams);
            $pedidos = $stmt->fetchAll(PDO::FETCH_ASSOC);
            return $pedidos;
        } catch (PDOException $e) {
            error_log("Database error: " . $e->getMessage());
            return ['error' => 'Erro ao buscar pedidos.'];
        }
    }

    // Método para obter um pedido específico pelo ID
    public function getPedidoById($id) {
        $query = 'SELECT * FROM PEDIDO WHERE PEDIDO = :id';
        try {
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(':id', $id);
            $stmt->execute();
            $pedido = $stmt->fetch(PDO::FETCH_ASSOC);
            return $pedido;
        } catch (PDOException $e) {
            error_log("Database error: " . $e->getMessage());
            return ['error' => 'Erro ao buscar pedido.'];
        }
    }

    // Método para criar um novo pedido (implementação básica)
    public function createPedido($data) {
        // Implementação para inserir um novo pedido
        // Exemplo:
        // $query = 'INSERT INTO PEDIDO (CODVEN, CODCLI, NOMCLI, BASE, TOTPED, SITU, DATPED) VALUES (:codven, :codcli, :nomcli, :base, :totped, :situ, :datped)';
        // ... preparar e executar a query com os dados de $data
        return ['message' => 'Funcionalidade de criação de pedido não implementada ainda.'];
    }

    // Método para atualizar um pedido existente (implementação básica)
    public function updatePedido($id, $data) {
        // Implementação para atualizar um pedido
        // Exemplo:
        // $query = 'UPDATE PEDIDO SET CODVEN = :codven, CODCLI = :codcli, NOMCLI = :nomcli, BASE = :base, TOTPED = :totped, SITU = :situ, DATPED = :datped WHERE PEDIDO = :id';
        // ... preparar e executar a query com os dados de $data e $id
        return ['message' => 'Funcionalidade de atualização de pedido não implementada ainda.'];
    }

    // Método para excluir um pedido (implementação básica)
    public function deletePedido($id) {
        // Implementação para excluir um pedido
        // Exemplo:
        // $query = 'DELETE FROM PEDIDO WHERE PEDIDO = :id';
        // ... preparar e executar a query com $id
        return ['message' => 'Funcionalidade de exclusão de pedido não implementada ainda.'];
    }
}

// --- Manipulação das Requisições HTTP ---

header('Content-Type: application/json');

$pedidoAPI = new PedidoAPI();
$method = $_SERVER['REQUEST_METHOD'];
$requestUri = $_SERVER['REQUEST_URI'];

// Extrai o caminho base da API (ex: /refactor/php/api/pedidos.php)
$scriptPath = parse_url($_SERVER['SCRIPT_NAME'], PHP_URL_PATH);
$requestPath = parse_url($requestUri, PHP_URL_PATH);
$baseApiUrl = str_replace($scriptPath, '', $requestPath); // Remove o nome do script do caminho

// Remove barras iniciais/finais para facilitar a comparação
$baseApiUrl = trim($baseApiUrl, '/');

// Divide o caminho em segmentos
$pathSegments = explode('/', $baseApiUrl);

// Verifica se o endpoint é para 'pedidos'
if ($pathSegments[0] === 'pedidos') {
    // Remove o segmento 'pedidos' para obter os parâmetros
    array_shift($pathSegments);

    if ($method === 'GET') {
        if (empty($pathSegments) || $pathSegments[0] === '') {
            // GET /pedidos - Listar todos ou com filtros
            $params = $_GET;
            $result = $pedidoAPI->getPedidos($params);
            echo json_encode($result);
        } else {
            // GET /pedidos/{id} - Obter pedido por ID
            $pedidoId = $pathSegments[0];
            $result = $pedidoAPI->getPedidoById($pedidoId);
            echo json_encode($result);
        }
    } elseif ($method === 'POST') {
        // POST /pedidos - Criar novo pedido
        $data = json_decode(file_get_contents('php://input'), true);
        $result = $pedidoAPI->createPedido($data);
        echo json_encode($result);
    } elseif ($method === 'PUT') {
        // PUT /pedidos/{id} - Atualizar pedido
        $pedidoId = $pathSegments[0];
        $data = json_decode(file_get_contents('php://input'), true);
        $result = $pedidoAPI->updatePedido($pedidoId, $data);
        echo json_encode($result);
    } elseif ($method === 'DELETE') {
        // DELETE /pedidos/{id} - Excluir pedido
        $pedidoId = $pathSegments[0];
        $result = $pedidoAPI->deletePedido($pedidoId);
        echo json_encode($result);
    } else {
        http_response_code(405); // Method Not Allowed
        echo json_encode(['error' => 'Método não permitido.']);
    }
} else {
    http_response_code(404); // Not Found
    echo json_encode(['error' => 'Endpoint não encontrado.']);
}
?>