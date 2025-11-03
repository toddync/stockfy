<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';

$database = new Database();
$db = $database->getConnection();

$dataInicial = isset($_GET['dataInicial']) ? $_GET['dataInicial'] : '';
$dataFinal = isset($_GET['dataFinal']) ? $_GET['dataFinal'] : '';
$tipoMovimentacao = isset($_GET['tipoMovimentacao']) ? $_GET['tipoMovimentacao'] : 'todos'; // 'todos', 'pagar', 'receber'

$query = "SELECT data_vencimento as data, descricao, tipo_movimentacao as tipo, valor
          FROM contas_a_pagar_receber
          WHERE 1=1";

$params = [];

if (!empty($dataInicial)) {
    $query .= " AND data_vencimento >= :dataInicial";
    $params[':dataInicial'] = $dataInicial;
}
if (!empty($dataFinal)) {
    $query .= " AND data_vencimento <= :dataFinal";
    $params[':dataFinal'] = $dataFinal;
}
if ($tipoMovimentacao !== 'todos') {
    $query .= " AND tipo_movimentacao = :tipoMovimentacao";
    $params[':tipoMovimentacao'] = $tipoMovimentacao;
}

$query .= " ORDER BY data_vencimento ASC";

$stmt = $db->prepare($query);

foreach ($params as $key => &$val) {
    $stmt->bindParam($key, $val);
}

$stmt->execute();

$num = $stmt->rowCount();

if ($num > 0) {
    $fluxo_arr = [];
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $fluxo_item = [
            "data" => $data,
            "descricao" => $descricao,
            "tipo" => $tipo,
            "valor" => $valor
        ];
        array_push($fluxo_arr, $fluxo_item);
    }
    http_response_code(200);
    echo json_encode($fluxo_arr);
} else {
    http_response_code(404);
    echo json_encode(["message" => "Nenhum fluxo de pagamento encontrado."]);
}
?>