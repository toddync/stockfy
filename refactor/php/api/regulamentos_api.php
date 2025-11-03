<?php
// Headers para permitir o acesso de qualquer origem (CORS) e definir o tipo de conteúdo como JSON
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

// Inclui os arquivos de configuração do banco de dados e o modelo Regulamento
include_once '../../config/Database.php';
include_once '../models/Regulamento.php';

// Instancia o objeto de banco de dados e obtém a conexão
$database = new Database();
$db = $database->getConnection();

// Instancia o objeto Regulamento
$regulamento = new Regulamento($db);

// Verifica o tipo de relatório solicitado via parâmetro GET
$reportType = isset($_GET['report']) ? $_GET['report'] : '';

$stmt = null;

// Seleciona o método apropriado com base no tipo de relatório
switch ($reportType) {
    case 'regulamento_velho':
        $stmt = $regulamento->getRegulamentoVelho();
        break;
    case 'regulamento_novo':
        $stmt = $regulamento->getRegulamentoNovo();
        break;
    case 'deposito':
        $stmt = $regulamento->getRegulamentoDeposito();
        break;
    case 'ficha_corte':
        $stmt = $regulamento->getFichaCorte();
        break;
    case 'faccao':
        $stmt = $regulamento->getFacao();
        break;
    default:
        // Se nenhum tipo de relatório válido for fornecido, retorna um erro
        http_response_code(400);
        echo json_encode(array("message" => "Tipo de relatório inválido."));
        exit();
}

if ($stmt) {
    $num = $stmt->rowCount();

    // Verifica se algum registro foi encontrado
    if ($num > 0) {
        $data_arr = array();
        $data_arr["records"] = array();

        // Extrai os dados da consulta
        while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
            extract($row);
            array_push($data_arr["records"], $row);
        }

        // Define o código de resposta como 200 OK e retorna os dados em JSON
        http_response_code(200);
        echo json_encode($data_arr);
    } else {
        // Se nenhum registro for encontrado, retorna 404 Not Found
        http_response_code(404);
        echo json_encode(array("message" => "Nenhum registro encontrado."));
    }
}
?>