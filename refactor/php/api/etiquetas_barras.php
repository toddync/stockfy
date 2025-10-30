<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once __DIR__ . '/../config/database.php';
include_once __DIR__ . '/../models/Artigo.php';

$database = new Database();
$db = $database->getConnection();

$artigo = new Artigo($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            empty($data->codigoArtigo) ||
            empty($data->descricaoArtigo) ||
            empty($data->quantidade) ||
            empty($data->tamanho) ||
            $data->quantidade <= 0
        ) {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível gerar etiquetas. Dados incompletos ou inválidos."));
            exit();
        }

        $codigoArtigo = $data->codigoArtigo;
        $descricaoArtigo = $data->descricaoArtigo;
        $nomeCliente = $data->nomeCliente ?? '';
        $sobrenomeCliente = $data->sobrenomeCliente ?? '';
        $bairroCliente = $data->bairroCliente ?? '';
        $quantidade = (int)$data->quantidade;
        $tamanho = $data->tamanho;

        // Validação adicional do artigo (opcional, pois o frontend já buscou a descrição)
        $artigo->id = $codigoArtigo;
        if (!$artigo->readOne()) {
            http_response_code(404);
            echo json_encode(array("message" => "Artigo não encontrado no sistema."));
            exit();
        }

        $etiquetasGeradas = [];
        for ($i = 1; $i <= $quantidade; $i++) {
            $etiquetasGeradas[] = [
                "codEtiqueta" => $i, // Simula o CODETIQ do Pascal
                "codigoArtigo" => $codigoArtigo,
                "descricaoArtigo" => $descricaoArtigo,
                "nomeCliente" => $nomeCliente,
                "sobrenomeCliente" => $sobrenomeCliente,
                "bairroCliente" => $bairroCliente,
                "tamanho" => $tamanho,
                "nomeVendedor" => "" // Equivalente ao NOMVEN vazio do Pascal
            ];
        }

        http_response_code(200);
        echo json_encode(array(
            "message" => "Etiquetas geradas com sucesso!",
            "etiquetas" => $etiquetasGeradas
        ));
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>