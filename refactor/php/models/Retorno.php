<?php

require_once __DIR__ . '/../core/Database.php';

class Retorno {
    private $db;
    private $conn;

    public function __construct() {
        $this->conn = Database::getInstance();
    }

    public function getPedido($pedidoNumero) {
        $stmt = $this->conn->prepare("SELECT p.id, p.data_emissao AS BASE, p.data_entrega AS RECOL, c.nome AS NOMCLI, c.id AS CODCLI, p.status AS SITU, p.observacoes AS RETORNO
                                      FROM pedidos p
                                      JOIN clientes c ON p.cliente_id = c.id
                                      WHERE p.id = :pedido_id");
        $stmt->bindParam(':pedido_id', $pedidoNumero, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    public function getItensPedido($pedidoNumero) {
        $stmt = $this->conn->prepare("SELECT pi.produto_id AS CODART, pr.descricao AS DESCRICAO, pi.quantidade AS QTDSAI, pi.quantidade_retornada AS QTDRET, pr.preco_custo AS PRECUS
                                      FROM pedido_itens pi
                                      JOIN produtos pr ON pi.produto_id = pr.id
                                      WHERE pi.pedido_id = :pedido_id
                                      ORDER BY pi.produto_id");
        $stmt->bindParam(':pedido_id', $pedidoNumero, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function updateItemRetorno($pedidoNumero, $codart, $qtdret) {
        $this->conn->beginTransaction();
        try {
            // 1. Atualizar a quantidade retornada no item do pedido
            $stmt = $this->conn->prepare("UPDATE pedido_itens
                                          SET quantidade_retornada = :qtdret
                                          WHERE pedido_id = :pedido_id AND produto_id = :codart");
            $stmt->bindParam(':qtdret', $qtdret, PDO::PARAM_INT);
            $stmt->bindParam(':pedido_id', $pedidoNumero, PDO::PARAM_INT);
            $stmt->bindParam(':codart', $codart, PDO::PARAM_INT);
            $stmt->execute();

            // 2. Atualizar o estoque do produto (adicionar a quantidade retornada)
            $stmt = $this->conn->prepare("UPDATE produtos
                                          SET estoque_atual = estoque_atual + :qtdret
                                          WHERE id = :codart");
            $stmt->bindParam(':qtdret', $qtdret, PDO::PARAM_INT);
            $stmt->bindParam(':codart', $codart, PDO::PARAM_INT);
            $stmt->execute();

            $this->conn->commit();
            return true;
        } catch (PDOException $e) {
            $this->conn->rollBack();
            error_log("Erro ao atualizar item de retorno: " . $e->getMessage());
            return false;
        }
    }

    public function fecharRetorno($pedidoNumero, $operacao) {
        $this->conn->beginTransaction();
        try {
            // Atualizar o status do pedido
            $status = '';
            switch (strtoupper($operacao)) {
                case 'D':
                    $status = 'devolvido';
                    break;
                case 'V':
                    $status = 'faturado'; // Assumindo que 'Venda' significa faturado
                    break;
                case 'R':
                    $status = 'retornado';
                    break;
                default:
                    throw new Exception("Operação inválida.");
            }

            $stmt = $this->conn->prepare("UPDATE pedidos
                                          SET status = :status
                                          WHERE id = :pedido_id");
            $stmt->bindParam(':status', $status, PDO::PARAM_STR);
            $stmt->bindParam(':pedido_id', $pedidoNumero, PDO::PARAM_INT);
            $stmt->execute();

            // Lógica adicional para atualizar totais do pedido, se necessário
            // ...

            $this->conn->commit();
            return true;
        } catch (PDOException $e) {
            $this->conn->rollBack();
            error_log("Erro ao fechar retorno: " . $e->getMessage());
            return false;
        } catch (Exception $e) {
            $this->conn->rollBack();
            error_log("Erro na operação de retorno: " . $e->getMessage());
            return false;
        }
    }

    public function restaurarPedido($pedidoNumero) {
        $this->conn->beginTransaction();
        try {
            // 1. Obter itens do pedido antes de restaurar
            $itens = $this->getItensPedido($pedidoNumero);

            // 2. Resetar quantidade retornada para 0 e ajustar estoque
            foreach ($itens as $item) {
                if ($item['QTDRET'] > 0) {
                    $stmt = $this->conn->prepare("UPDATE produtos
                                                  SET estoque_atual = estoque_atual - :qtdret
                                                  WHERE id = :codart");
                    $stmt->bindParam(':qtdret', $item['QTDRET'], PDO::PARAM_INT);
                    $stmt->bindParam(':codart', $item['CODART'], PDO::PARAM_INT);
                    $stmt->execute();

                    $stmt = $this->conn->prepare("UPDATE pedido_itens
                                                  SET quantidade_retornada = 0
                                                  WHERE pedido_id = :pedido_id AND produto_id = :codart");
                    $stmt->bindParam(':pedido_id', $pedidoNumero, PDO::PARAM_INT);
                    $stmt->bindParam(':codart', $item['CODART'], PDO::PARAM_INT);
                    $stmt->execute();
                }
            }

            // 3. Resetar status do pedido para um estado inicial (ex: 'emitido')
            $stmt = $this->conn->prepare("UPDATE pedidos
                                          SET status = 'emitido', observacoes = NULL
                                          WHERE id = :pedido_id");
            $stmt->bindParam(':pedido_id', $pedidoNumero, PDO::PARAM_INT);
            $stmt->execute();

            $this->conn->commit();
            return true;
        } catch (PDOException $e) {
            $this->conn->rollBack();
            error_log("Erro ao restaurar pedido: " . $e->getMessage());
            return false;
        }
    }
}