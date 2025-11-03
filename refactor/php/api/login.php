<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Login.php';

$database = new Database();
$db = $database->getConnection();

$login = new Login($db);

$data = json_decode(file_get_contents("php://input"));

if (!empty($data->nome) && !empty($data->senha)) {
    $login->nome = $data->nome;
    $login->senha = $data->senha;

    if ($login->authenticate()) {
        // Verifica a validade do sistema (credenciais "SEARCH")
        $system_login = new Login($db);
        $system_login->nome = "SEARCH";
        if ($system_login->checkSystemCredential()) {
            $current_date = date("Y-m-d");
            $data_inicio = date("Y-m-d", strtotime($system_login->data_inicio_validade));
            $data_fim = date("Y-m-d", strtotime($system_login->data_fim_validade));

            if ($current_date > $data_inicio) {
                http_response_code(401);
                echo json_encode(array("message" => "Validade DATABASE not found, recommend new configuration!"));
                exit();
            }
            if ($current_date > $data_fim) {
                http_response_code(401);
                echo json_encode(array("message" => "Corruption in DATABASE, recommend new configuration!"));
                exit();
            }
        } else {
            http_response_code(401);
            echo json_encode(array("message" => "O Sistema não esta credenciado!"));
            exit();
        }

        // Autenticação bem-sucedida
        http_response_code(200);
        echo json_encode(array(
            "message" => "Login bem-sucedido.",
            "user" => array(
                "id" => $login->id,
                "nome" => $login->nome,
                "senhas" => $login->senhas,
                "permissao_001" => $login->permissao_001,
                "permissao_002" => $login->permissao_002,
                "permissao_003" => $login->permissao_003,
                "permissao_004" => $login->permissao_004,
                "permissao_005" => $login->permissao_005,
                "permissao_006" => $login->permissao_006,
                "permissao_007" => $login->permissao_007,
                "permissao_008" => $login->permissao_008,
                "permissao_009" => $login->permissao_009,
                "permissao_010" => $login->permissao_010,
                "permissao_011" => $login->permissao_011,
                "permissao_012" => $login->permissao_012,
                "permissao_013" => $login->permissao_013,
                "permissao_014" => $login->permissao_014,
                "permissao_015" => $login->permissao_015,
                "permissao_016" => $login->permissao_016,
                "permissao_017" => $login->permissao_017,
                "permissao_018" => $login->permissao_018,
                "permissao_019" => $login->permissao_019,
                "permissao_020" => $login->permissao_020,
                "permissao_021" => $login->permissao_021,
                "permissao_022" => $login->permissao_022,
                "permissao_023" => $login->permissao_023,
                "permissao_024" => $login->permissao_024,
                "permissao_025" => $login->permissao_025,
                "permissao_026" => $login->permissao_026,
                "permissao_027" => $login->permissao_027,
                "permissao_028" => $login->permissao_028,
                "permissao_029" => $login->permissao_029,
                "permissao_030" => $login->permissao_030,
                "permissao_031" => $login->permissao_031,
                "permissao_032" => $login->permissao_032,
                "permissao_033" => $login->permissao_033,
                "permissao_034" => $login->permissao_034,
                "permissao_035" => $login->permissao_035,
                "permissao_036" => $login->permissao_036,
                "permissao_037" => $login->permissao_037,
                "permissao_038" => $login->permissao_038,
                "permissao_039" => $login->permissao_039,
                "permissao_040" => $login->permissao_040,
                "permissao_041" => $login->permissao_041,
                "permissao_042" => $login->permissao_042,
                "permissao_043" => $login->permissao_043,
                "permissao_044" => $login->permissao_044,
                "permissao_045" => $login->permissao_045,
                "permissao_046" => $login->permissao_046,
                "permissao_047" => $login->permissao_047,
                "permissao_048" => $login->permissao_048,
                "permissao_049" => $login->permissao_049,
                "permissao_050" => $login->permissao_050,
                "permissao_051" => $login->permissao_051,
                "permissao_052" => $login->permissao_052,
                "permissao_053" => $login->permissao_053,
                "permissao_054" => $login->permissao_054,
                "permissao_055" => $login->permissao_055,
                "permissao_056" => $login->permissao_056,
                "permissao_057" => $login->permissao_057,
                "permissao_058" => $login->permissao_058,
                "permissao_059" => $login->permissao_059,
                "permissao_060" => $login->permissao_060,
                "permissao_061" => $login->permissao_061,
                "permissao_062" => $login->permissao_062,
                "permissao_063" => $login->permissao_063,
                "permissao_064" => $login->permissao_064,
                "permissao_065" => $login->permissao_065,
                "permissao_066" => $login->permissao_066,
                "permissao_067" => $login->permissao_067,
                "permissao_068" => $login->permissao_068,
                "permissao_069" => $login->permissao_069,
                "permissao_070" => $login->permissao_070,
                "permissao_071" => $login->permissao_071,
                "permissao_072" => $login->permissao_072,
                "permissao_073" => $login->permissao_073,
                "permissao_074" => $login->permissao_074,
                "permissao_075" => $login->permissao_075,
                "permissao_076" => $login->permissao_076,
                "permissao_077" => $login->permissao_077,
                "permissao_078" => $login->permissao_078,
                "permissao_079" => $login->permissao_079,
                "permissao_080" => $login->permissao_080,
                "data_inicio_validade" => $login->data_inicio_validade,
                "data_fim_validade" => $login->data_fim_validade
            )
        ));
    } else {
        http_response_code(401);
        echo json_encode(array("message" => "Nome de usuário ou senha incorretos."));
    }
} else {
    http_response_code(400);
    echo json_encode(array("message" => "Dados incompletos. Nome de usuário e senha são obrigatórios."));
}
?>