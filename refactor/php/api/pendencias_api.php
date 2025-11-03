<?php
require_once '../../php/core/Database.php';
require_once '../../php/models/Pendencia.php';

header('Content-Type: application/json');

$database = new Database();
$db = $database->getConnection();

$response = ['success' => false, 'message' => '', 'data' => []];

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    if (isset($_GET['praca']) && isset($_GET['limite_vencimento'])) {
        $praca_digitada = str_pad($_GET['praca'], 3, '0', STR_PAD_LEFT);
        $limite_vencimento = $_GET['limite_vencimento'];

        try {
            // 1. Validar a Praça na tabela ROTA
            $query_rota = "SELECT Nome FROM ROTA WHERE Rota = :rot_digit AND Bair = '000'";
            $stmt_rota = $db->prepare($query_rota);
            $stmt_rota->bindParam(':rot_digit', $praca_digitada);
            $stmt_rota->execute();
            $rota = $stmt_rota->fetch(PDO::FETCH_ASSOC);

            if (!$rota) {
                $response['message'] = 'Praça não cadastrada!';
                echo json_encode($response);
                exit();
            }

            $nome_praca = $rota['Nome'];

            // 2. Buscar clientes na tabela CLIENTE
            $query_clientes = "SELECT Idcli, Nome, Ende, Bair, Cida, Esta, Ntel, Horain, Horafin, Refer FROM CLIENTE WHERE Praca = :pra_digit ORDER BY Rota, Idcli";
            $stmt_clientes = $db->prepare($query_clientes);
            $stmt_clientes->bindParam(':pra_digit', $praca_digitada);
            $stmt_clientes->execute();
            $clientes = $stmt_clientes->fetchAll(PDO::FETCH_ASSOC);

            if (empty($clientes)) {
                $response['message'] = 'Praça sem Cliente!';
                echo json_encode($response);
                exit();
            }

            $pendencias = [];

            foreach ($clientes as $cliente) {
                $codcli = str_pad($cliente['Idcli'], 4, '0', STR_PAD_LEFT);

                // 3. Para cada cliente, buscar pedidos na tabela PEDIDO
                $query_pedidos = "SELECT Pedido, Base, Totped, Totven, Residuo, Retorno, Cobran, Situ FROM PEDIDO WHERE Codcli = :marc_digit AND Cobran < :limt_digit AND Situ <> :sit_digit ORDER BY Pedido";
                $stmt_pedidos = $db->prepare($query_pedidos);
                $stmt_pedidos->bindParam(':marc_digit', $codcli);
                $stmt_pedidos->bindParam(':limt_digit', $limite_vencimento); // Assumindo que $limite_vencimento já está no formato de data correto
                $situ_excluir = 'X';
                $stmt_pedidos->bindParam(':sit_digit', $situ_excluir);
                $stmt_pedidos->execute();
                $pedidos = $stmt_pedidos->fetchAll(PDO::FETCH_ASSOC);

                $xitens = 0;
                foreach ($pedidos as $pedido) {
                    $wpreco = 0;
                    if ($pedido['Situ'] === 'E') {
                        $wpreco = $pedido['Totped'];
                    } else {
                        $wpreco = $pedido['Residuo'];
                    }

                    if ($wpreco > 0) {
                        $xitens++;
                        $witens = str_pad($xitens, 5, '0', STR_PAD_LEFT);

                        $pendencia = new Pendencia(
                            $codcli,
                            $witens,
                            $pedido['Pedido'],
                            date('d/m/Y', strtotime($pedido['Base'])), // Formatar data
                            'Venda a Cliente',
                            $pedido['Totped'],
                            $pedido['Retorno'],
                            $pedido['Totven'],
                            $wpreco,
                            date('d/m/Y', strtotime($pedido['Cobran'])), // Formatar data
                            $pedido['Situ'],
                            date('d/m/Y', strtotime($pedido['Cobran'])), // Formatar data
                            $cliente['Nome'],
                            $cliente['Ende'],
                            $cliente['Bair'],
                            $cliente['Cida'],
                            $cliente['Esta'],
                            $cliente['Ntel'],
                            $cliente['Horain'],
                            $cliente['Horafin'],
                            $nome_praca
                        );
                        $pendencias[] = $pendencia->toArray();
                    }
                }
            }

            $response['success'] = true;
            $response['message'] = 'Pendências encontradas com sucesso.';
            $response['data'] = $pendencias;

        } catch (PDOException $e) {
            $response['message'] = 'Erro no banco de dados: ' . $e->getMessage();
        }
    } else {
        $response['message'] = 'Parâmetros "praca" e "limite_vencimento" são obrigatórios.';
    }
} else {
    $response['message'] = 'Método não permitido.';
}

echo json_encode($response);
?>