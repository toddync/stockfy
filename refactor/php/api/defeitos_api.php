<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

require_once __DIR__ . '/../config/database.php';
require_once __DIR__ . '/../models/Defeito.php';
require_once __DIR__ . '/../models/ItemDefeito.php';

$database = new Database();
$db = $database->getConnection();

$defeito = new Defeito($db);
$itemDefeito = new ItemDefeito($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (isset($_GET['dataInicio']) && isset($_GET['dataFim'])) {
            // Filtrar por período de datas (Button10Click)
            $dataInicio = $_GET['dataInicio'];
            $dataFim = $_GET['dataFim'];
            $stmt = $defeito->readFiltered($dataInicio, $dataFim);
            $num = $stmt->num_rows;

            if ($num > 0) {
                $defeitos_arr = array();
                while ($row = $stmt->fetch_assoc()) {
                    extract($row);
                    $defeito_item = array(
                        "Numnot" => $Numnot,
                        "Datnot" => $Datnot,
                        "Valnot" => $Valnot
                    );
                    array_push($defeitos_arr, $defeito_item);
                }
                http_response_code(200);
                echo json_encode(array("success" => true, "data" => $defeitos_arr));
            } else {
                http_response_code(404);
                echo json_encode(array("success" => false, "message" => "Nenhum defeito encontrado para o período."));
            }
        } elseif (isset($_GET['tipoPesquisa']) && isset($_GET['termoPesquisa'])) {
            // Pesquisa geral (Edit1Exit)
            $tipoPesquisa = $_GET['tipoPesquisa'];
            $termoPesquisa = $_GET['termoPesquisa'];

            $stmt = $defeito->readFiltered(null, null, $tipoPesquisa, $termoPesquisa);

            if ($stmt === false) {
                http_response_code(500);
                echo json_encode(array("success" => false, "message" => "Erro ao executar a pesquisa."));
                break;
            }
            
            $num = $stmt->num_rows;

            if ($num > 0) {
                $defeitos_arr = array();
                while ($row = $stmt->fetch_assoc()) {
                    extract($row);
                    $defeito_item = array(
                        "Numnot" => $Numnot,
                        "Datnot" => $Datnot,
                        "Valnot" => $Valnot,
                        "Codart" => isset($Codart) ? $Codart : null,
                        "Descricao" => isset($Descricao) ? $Descricao : null,
                        "Quant" => isset($Quant) ? $Quant : null,
                        "Precus" => isset($Precus) ? $Precus : null
                    );
                    array_push($defeitos_arr, $defeito_item);
                }
                http_response_code(200);
                echo json_encode(array("success" => true, "data" => $defeitos_arr));
            } else {
                http_response_code(404);
                echo json_encode(array("success" => false, "message" => "Nenhum defeito encontrado para o termo de pesquisa."));
            }

        } else {
            // Leitura de todos os defeitos
            $stmt = $defeito->read();

            if ($stmt === false) {
                http_response_code(500);
                echo json_encode(array("success" => false, "message" => "Erro ao buscar todos os defeitos."));
                break;
            }

            $num = $stmt->num_rows;

            if ($num > 0) {
                $defeitos_arr = array();
                while ($row = $stmt->fetch_assoc()) {
                    extract($row);
                    $defeito_item = array(
                        "Numnot" => $Numnot,
                        "Datnot" => $Datnot,
                        "Valnot" => $Valnot
                    );
                    array_push($defeitos_arr, $defeito_item);
                }
                http_response_code(200);
                echo json_encode(array("success" => true, "data" => $defeitos_arr));
            } else {
                http_response_code(404);
                echo json_encode(array("success" => false, "message" => "Nenhum defeito encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->Numnot) && !empty($data->Datnot) && !empty($data->Valnot)) {
            $defeito->Numnot = $data->Numnot;
            $defeito->Datnot = $data->Datnot;
            $defeito->Valnot = $data->Valnot;

            if ($defeito->create()) {
                http_response_code(201);
                echo json_encode(array("success" => true, "message" => "Defeito criado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("success" => false, "message" => "Não foi possível criar o defeito."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("success" => false, "message" => "Dados incompletos para criar o defeito."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->Numnot) && !empty($data->Datnot) && !empty($data->Valnot)) {
            $defeito->Numnot = $data->Numnot;
            $defeito->Datnot = $data->Datnot;
            $defeito->Valnot = $data->Valnot;

            if ($defeito->update()) {
                http_response_code(200);
                echo json_encode(array("success" => true, "message" => "Defeito atualizado com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("success" => false, "message" => "Não foi possível atualizar o defeito."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("success" => false, "message" => "Dados incompletos para atualizar o defeito."));
        }
        break;

    case 'DELETE':
        if (isset($_GET['Numnot'])) {
            $defeito->Numnot = $_GET['Numnot'];

            if ($defeito->delete()) {
                http_response_code(200);
                echo json_encode(array("success" => true, "message" => "Defeito excluído com sucesso."));
            } else {
                http_response_code(503);
                echo json_encode(array("success" => false, "message" => "Não foi possível excluir o defeito."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("success" => false, "message" => "Número da nota não fornecido para exclusão."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("success" => false, "message" => "Método não permitido."));
        break;
}
?>