<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Pedido.php';
include_once '../models/ItemPedido.php';

$database = new Database();
$db = $database->getConnection();

$pedido = new Pedido($db);
$itemPedido = new ItemPedido($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch($request_method) {
    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!isset($data->dataLimite)) {
            http_response_code(400);
            echo json_encode(array("message" => "Data limite é obrigatória."));
            exit();
        }

        $dataLimiteStr = $data->dataLimite;
        // Converter a data de DD/MM/AAAA para AAAA-MM-DD para o MySQL
        $dataLimite = DateTime::createFromFormat('d/m/Y', $dataLimiteStr);
        if (!$dataLimite) {
            http_response_code(400);
            echo json_encode(array("message" => "Formato de data inválido. Use DD/MM/AAAA."));
            exit();
        }
        $dataLimiteFormatted = $dataLimite->format('Y-m-d');

        $db->beginTransaction();

        try {
            // 1. Selecionar pedidos com data base anterior à data limite
            $queryPedidos = "SELECT PEDIDO FROM " . $pedido->getTableName() . " WHERE BASE < :dataLimite";
            $stmtPedidos = $db->prepare($queryPedidos);
            $stmtPedidos->bindParam(':dataLimite', $dataLimiteFormatted);
            $stmtPedidos->execute();
            $pedidosParaExcluir = $stmtPedidos->fetchAll(PDO::FETCH_ASSOC);

            if (empty($pedidosParaExcluir)) {
                $db->rollBack();
                http_response_code(200);
                echo json_encode(array("message" => "Nenhum pedido encontrado para exclusão antes da data limite."));
                exit();
            }

            foreach ($pedidosParaExcluir as $p) {
                $numeroPedido = $p['PEDIDO'];

                // 2. Excluir itens do pedido
                $queryDeleteItemPedidos = "DELETE FROM " . $itemPedido->getTableName() . " WHERE PEDIDO = :numeroPedido";
                $stmtDeleteItemPedidos = $db->prepare($queryDeleteItemPedidos);
                $stmtDeleteItemPedidos->bindParam(':numeroPedido', $numeroPedido);
                if (!$stmtDeleteItemPedidos->execute()) {
                    throw new Exception("Erro ao excluir itens do pedido " . $numeroPedido);
                }

                // 3. Excluir o pedido
                $queryDeletePedido = "DELETE FROM " . $pedido->getTableName() . " WHERE PEDIDO = :numeroPedido";
                $stmtDeletePedido = $db->prepare($queryDeletePedido);
                $stmtDeletePedido->bindParam(':numeroPedido', $numeroPedido);
                if (!$stmtDeletePedido->execute()) {
                    throw new Exception("Erro ao excluir pedido " . $numeroPedido);
                }
            }

            $db->commit();
            http_response_code(200);
            echo json_encode(array("message" => "Pedidos anteriores a " . $dataLimiteStr . " excluídos com sucesso!"));

        } catch (Exception $e) {
            $db->rollBack();
            http_response_code(500);
            echo json_encode(array("message" => "Erro ao excluir pedidos: " . $e->getMessage()));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>