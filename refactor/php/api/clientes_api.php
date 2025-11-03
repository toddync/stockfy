<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

include_once '../config/database.php';
include_once '../models/Cliente.php';

$database = new Database();
$db = $database->getConnection();

$cliente = new Cliente($db);

$request_method = $_SERVER["REQUEST_METHOD"];

switch ($request_method) {
    case 'GET':
        if (!empty($_GET["id"])) {
            $cliente->Idcli = $_GET["id"];
            $cliente->readOne();
            if ($cliente->Nome != null) {
                $cliente_arr = array(
                    "Idcli" => $cliente->Idcli,
                    "Ncpf" => $cliente->Ncpf,
                    "Nifp" => $cliente->Nifp,
                    "Bair" => $cliente->Bair,
                    "Cida" => $cliente->Cida,
                    "Esta" => $cliente->Esta,
                    "Ncep" => $cliente->Ncep,
                    "Ntel" => $cliente->Ntel,
                    "Conta" => $cliente->Conta,
                    "Vend" => $cliente->Vend,
                    "Lcred" => $cliente->Lcred,
                    "Datimp" => $cliente->Datimp,
                    "Nommae" => $cliente->Nommae,
                    "Nompai" => $cliente->Nompai,
                    "Datnasc" => $cliente->Datnasc,
                    "Natu" => $cliente->Natu,
                    "Rota" => $cliente->Rota,
                    "Praca" => $cliente->Praca,
                    "Refer" => $cliente->Refer,
                    "Oldcli" => $cliente->Oldcli,
                    "Situ" => $cliente->Situ,
                    "Nome" => $cliente->Nome,
                    "Ende" => $cliente->Ende,
                    "Horain" => $cliente->Horain,
                    "Horafin" => $cliente->Horafin,
                    "Visita" => $cliente->Visita,
                    "Ativo" => $cliente->Ativo,
                    "Esped" => $cliente->Esped,
                    "Obsv" => $cliente->Obsv
                );
                http_response_code(200);
                echo json_encode($cliente_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Cliente não encontrado."));
            }
        } elseif (!empty($_GET["search"])) {
            $keywords = $_GET["search"];
            $stmt = $cliente->search($keywords);
            $num = $stmt->rowCount();

            if ($num > 0) {
                $clientes_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $cliente_item = array(
                        "Idcli" => $Idcli,
                        "Ncpf" => $Ncpf,
                        "Nifp" => $Nifp,
                        "Bair" => $Bair,
                        "Cida" => $Cida,
                        "Esta" => $Esta,
                        "Ncep" => $Ncep,
                        "Ntel" => $Ntel,
                        "Conta" => $Conta,
                        "Vend" => $Vend,
                        "Lcred" => $Lcred,
                        "Datimp" => $Datimp,
                        "Nommae" => $Nommae,
                        "Nompai" => $Nompai,
                        "Datnasc" => $Datnasc,
                        "Natu" => $Natu,
                        "Rota" => $Rota,
                        "Praca" => $Praca,
                        "Refer" => $Refer,
                        "Oldcli" => $Oldcli,
                        "Situ" => $Situ,
                        "Nome" => $Nome,
                        "Ende" => $Ende,
                        "Horain" => $Horain,
                        "Horafin" => $Horafin,
                        "Visita" => $Visita,
                        "Ativo" => $Ativo,
                        "Esped" => $Esped,
                        "Obsv" => $Obsv
                    );
                    array_push($clientes_arr, $cliente_item);
                }
                http_response_code(200);
                echo json_encode($clientes_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum cliente encontrado."));
            }
        } elseif (!empty($_GET["action"]) && $_GET["action"] == "nextId") {
            $nextId = $cliente->getNextIdcli();
            http_response_code(200);
            echo json_encode(array("next_idcli" => $nextId));
        } else {
            $stmt = $cliente->read();
            $num = $stmt->rowCount();

            if ($num > 0) {
                $clientes_arr = array();
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    extract($row);
                    $cliente_item = array(
                        "Idcli" => $Idcli,
                        "Ncpf" => $Ncpf,
                        "Nifp" => $Nifp,
                        "Bair" => $Bair,
                        "Cida" => $Cida,
                        "Esta" => $Esta,
                        "Ncep" => $Ncep,
                        "Ntel" => $Ntel,
                        "Conta" => $Conta,
                        "Vend" => $Vend,
                        "Lcred" => $Lcred,
                        "Datimp" => $Datimp,
                        "Nommae" => $Nommae,
                        "Nompai" => $Nompai,
                        "Datnasc" => $Datnasc,
                        "Natu" => $Natu,
                        "Rota" => $Rota,
                        "Praca" => $Praca,
                        "Refer" => $Refer,
                        "Oldcli" => $Oldcli,
                        "Situ" => $Situ,
                        "Nome" => $Nome,
                        "Ende" => $Ende,
                        "Horain" => $Horain,
                        "Horafin" => $Horafin,
                        "Visita" => $Visita,
                        "Ativo" => $Ativo,
                        "Esped" => $Esped,
                        "Obsv" => $Obsv
                    );
                    array_push($clientes_arr, $cliente_item);
                }
                http_response_code(200);
                echo json_encode($clientes_arr);
            } else {
                http_response_code(404);
                echo json_encode(array("message" => "Nenhum cliente encontrado."));
            }
        }
        break;

    case 'POST':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->Ncpf) && !empty($data->Nome) && !empty($data->Ende) &&
            !empty($data->Bair) && !empty($data->Cida) && !empty($data->Esta) &&
            !empty($data->Ncep) && !empty($data->Ntel) && !empty($data->Vend)
        ) {
            $cliente->Ncpf = $data->Ncpf;
            $cliente->Nifp = $data->Nifp;
            $cliente->Bair = $data->Bair;
            $cliente->Cida = $data->Cida;
            $cliente->Esta = $data->Esta;
            $cliente->Ncep = $data->Ncep;
            $cliente->Ntel = $data->Ntel;
            $cliente->Conta = $data->Conta;
            $cliente->Vend = $data->Vend;
            $cliente->Lcred = $data->Lcred;
            $cliente->Datimp = $data->Datimp;
            $cliente->Nommae = $data->Nommae;
            $cliente->Nompai = $data->Nompai;
            $cliente->Datnasc = $data->Datnasc;
            $cliente->Natu = $data->Natu;
            $cliente->Rota = $data->Rota;
            $cliente->Praca = $data->Praca;
            $cliente->Refer = $data->Refer;
            $cliente->Oldcli = $data->Oldcli;
            $cliente->Situ = $data->Situ;
            $cliente->Nome = $data->Nome;
            $cliente->Ende = $data->Ende;
            $cliente->Horain = $data->Horain;
            $cliente->Horafin = $data->Horafin;
            $cliente->Visita = $data->Visita;
            $cliente->Ativo = $data->Ativo;
            $cliente->Esped = $data->Esped;
            $cliente->Obsv = $data->Obsv;

            if ($cliente->create()) {
                http_response_code(201);
                echo json_encode(array("message" => "Cliente foi criado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível criar o cliente."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível criar o cliente. Dados incompletos."));
        }
        break;

    case 'PUT':
        $data = json_decode(file_get_contents("php://input"));

        if (
            !empty($data->Idcli) && !empty($data->Ncpf) && !empty($data->Nome) && !empty($data->Ende) &&
            !empty($data->Bair) && !empty($data->Cida) && !empty($data->Esta) &&
            !empty($data->Ncep) && !empty($data->Ntel) && !empty($data->Vend)
        ) {
            $cliente->Idcli = $data->Idcli;
            $cliente->Ncpf = $data->Ncpf;
            $cliente->Nifp = $data->Nifp;
            $cliente->Bair = $data->Bair;
            $cliente->Cida = $data->Cida;
            $cliente->Esta = $data->Esta;
            $cliente->Ncep = $data->Ncep;
            $cliente->Ntel = $data->Ntel;
            $cliente->Conta = $data->Conta;
            $cliente->Vend = $data->Vend;
            $cliente->Lcred = $data->Lcred;
            $cliente->Datimp = $data->Datimp;
            $cliente->Nommae = $data->Nommae;
            $cliente->Nompai = $data->Nompai;
            $cliente->Datnasc = $data->Datnasc;
            $cliente->Natu = $data->Natu;
            $cliente->Rota = $data->Rota;
            $cliente->Praca = $data->Praca;
            $cliente->Refer = $data->Refer;
            $cliente->Oldcli = $data->Oldcli;
            $cliente->Situ = $data->Situ;
            $cliente->Nome = $data->Nome;
            $cliente->Ende = $data->Ende;
            $cliente->Horain = $data->Horain;
            $cliente->Horafin = $data->Horafin;
            $cliente->Visita = $data->Visita;
            $cliente->Ativo = $data->Ativo;
            $cliente->Esped = $data->Esped;
            $cliente->Obsv = $data->Obsv;

            if ($cliente->update()) {
                http_response_code(200);
                echo json_encode(array("message" => "Cliente foi atualizado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível atualizar o cliente."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível atualizar o cliente. Dados incompletos."));
        }
        break;

    case 'DELETE':
        $data = json_decode(file_get_contents("php://input"));

        if (!empty($data->Idcli)) {
            $cliente->Idcli = $data->Idcli;

            if ($cliente->delete()) {
                http_response_code(200);
                echo json_encode(array("message" => "Cliente foi deletado."));
            } else {
                http_response_code(503);
                echo json_encode(array("message" => "Não foi possível deletar o cliente."));
            }
        } else {
            http_response_code(400);
            echo json_encode(array("message" => "Não foi possível deletar o cliente. ID não especificado."));
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(array("message" => "Método não permitido."));
        break;
}
?>