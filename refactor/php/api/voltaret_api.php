<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once '../models/Database.php';
require_once '../models/Pedido.php';
require_once '../models/Itempedido.php';
require_once '../models/Artigo.php';

$database = new Database();
$db = $database->getConnection();

$pedido = new Pedido($db);
$itemPedido = new Itempedido($db);
$artigo = new Artigo($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!isset($_GET['numeroPedido'])) {
            http_response_code(400);
            echo json_encode(array("message" => "Número do pedido é obrigatório."));
            exit();
        }
        $numeroPedido = $_GET['numeroPedido'];

        $stmt_pedido = $pedido->findByNumeroPedido($numeroPedido);
        $pedido_data = $stmt_pedido->fetch(PDO::FETCH_ASSOC);

        if (!$pedido_data) {
            http_response_code(404);
            echo json_encode(array("message" => "Pedido não encontrado."));
            exit();
        }

        $stmt_itens = $itemPedido->readByPedido($numeroPedido);
        $itens_data = $stmt_itens->fetchAll(PDO::FETCH_ASSOC);

        http_response_code(200);
        echo json_encode(array(
            "pedido" => $pedido_data,
            "itens" => $itens_data
        ));
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!isset($data->password) || !isset($data->numeroPedido)) {
            http_response_code(400);
            echo json_encode(array("message" => "Senha e número do pedido são obrigatórios."));
            exit();
        }

        $password = $data->password;
        $numeroPedido = $data->numeroPedido;

        // Validação da senha
        if ($password !== "LULA") {
            http_response_code(401);
            echo json_encode(array("message" => "Senha incorreta."));
            exit();
        }

        // Iniciar transação
        $db->beginTransaction();

        try {
            // 1. Obter detalhes do pedido
            $stmt_pedido = $pedido->findByNumeroPedido($numeroPedido);
            $pedido_data = $stmt_pedido->fetch(PDO::FETCH_ASSOC);

            if (!$pedido_data) {
                throw new Exception("Pedido não encontrado.");
            }

            // 2. Obter itens do pedido
            $stmt_itens = $itemPedido->readByPedido($numeroPedido);
            $itens_data = $stmt_itens->fetchAll(PDO::FETCH_ASSOC);

            if (empty($itens_data)) {
                throw new Exception("Itens do pedido não encontrados.");
            }

            // 3. Atualizar quantidades retornadas em ITEMPEDIDO para 0
            foreach ($itens_data as $item) {
                if (!$itemPedido->updateQuantidadeRetornada($numeroPedido, $item['Codart'], 0)) {
                    throw new Exception("Erro ao zerar quantidade retornada para o artigo " . $item['Codart']);
                }
            }

            // 4. Atualizar status do pedido em PEDIDO para 'E' e zerar Totven e Retorno
            if (!$pedido->updateStatus($numeroPedido, 'E', '', 0.00)) {
                throw new Exception("Erro ao atualizar status do pedido.");
            }

            // 5. Ajustar estoque em ARTIGO
            foreach ($itens_data as $item) {
                $artigo_data = $artigo->findByCodArtigo($item['Codart']);

                if (!$artigo_data) {
                    throw new Exception("Artigo " . $item['Codart'] . " não encontrado.");
                }

                $estoque_atual = $artigo_data['estoque'];
                $qtd_retornada_original = $item['Qtdret']; // Usar a quantidade retornada original do item

                $novo_estoque = $estoque_atual + $qtd_retornada_original;

                if (!$artigo->updateEstoque($item['Codart'], $novo_estoque)) {
                    throw new Exception("Erro ao ajustar estoque para o artigo " . $item['Codart']);
                }
            }

            // Confirmar transação
            $db->commit();
            http_response_code(200);
            echo json_encode(array("message" => "Pedido restaurado com sucesso!"));

        } catch (Exception $e) {
            // Reverter transação em caso de erro
            $db->rollBack();
            http_response_code(500);
            echo json_encode(array("message" => "Erro ao restaurar pedido: " . $e->getMessage()));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>