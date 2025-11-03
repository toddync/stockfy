<?php
class Login {
    private $conn;
    private $table_name = "logins"; // Assumindo que a tabela ARQLOGIN foi normalizada para 'logins'

    public $id;
    public $nome;
    public $senha;
    public $senhas; // Campo 'senhas' do Pascal
    public $permissao_001;
    public $permissao_002;
    public $permissao_003;
    public $permissao_004;
    public $permissao_005;
    public $permissao_006;
    public $permissao_007;
    public $permissao_008;
    public $permissao_009;
    public $permissao_010;
    public $permissao_011;
    public $permissao_012;
    public $permissao_013;
    public $permissao_014;
    public $permissao_015;
    public $permissao_016;
    public $permissao_017;
    public $permissao_018;
    public $permissao_019;
    public $permissao_020;
    public $permissao_021;
    public $permissao_022;
    public $permissao_023;
    public $permissao_024;
    public $permissao_025;
    public $permissao_026;
    public $permissao_027;
    public $permissao_028;
    public $permissao_029;
    public $permissao_030;
    public $permissao_031;
    public $permissao_032;
    public $permissao_033;
    public $permissao_034;
    public $permissao_035;
    public $permissao_036;
    public $permissao_037;
    public $permissao_038;
    public $permissao_039;
    public $permissao_040;
    public $permissao_041;
    public $permissao_042;
    public $permissao_043;
    public $permissao_044;
    public $permissao_045;
    public $permissao_046;
    public $permissao_047;
    public $permissao_048;
    public $permissao_049;
    public $permissao_050;
    public $permissao_051;
    public $permissao_052;
    public $permissao_053;
    public $permissao_054;
    public $permissao_055;
    public $permissao_056;
    public $permissao_057;
    public $permissao_058;
    public $permissao_059;
    public $permissao_060;
    public $permissao_061;
    public $permissao_062;
    public $permissao_063;
    public $permissao_064;
    public $permissao_065;
    public $permissao_066;
    public $permissao_067;
    public $permissao_068;
    public $permissao_069;
    public $permissao_070;
    public $permissao_071;
    public $permissao_072;
    public $permissao_073;
    public $permissao_074;
    public $permissao_075;
    public $permissao_076;
    public $permissao_077;
    public $permissao_078;
    public $permissao_079;
    public $permissao_080;
    public $data_inicio_validade; // Mapeando DATXI para data_inicio_validade
    public $data_fim_validade;    // Mapeando DATXL para data_fim_validade

    public function __construct($db) {
        $this->conn = $db;
    }

    public function authenticate() {
        $query = "SELECT id, nome, senha, senhas, " .
                 "permissao_001, permissao_002, permissao_003, permissao_004, permissao_005, permissao_006, permissao_007, permissao_008, permissao_009, permissao_010, " .
                 "permissao_011, permissao_012, permissao_013, permissao_014, permissao_015, permissao_016, permissao_017, permissao_018, permissao_019, permissao_020, " .
                 "permissao_021, permissao_022, permissao_023, permissao_024, permissao_025, permissao_026, permissao_027, permissao_028, permissao_029, permissao_030, " .
                 "permissao_031, permissao_032, permissao_033, permissao_034, permissao_035, permissao_036, permissao_037, permissao_038, permissao_039, permissao_040, " .
                 "permissao_041, permissao_042, permissao_043, permissao_044, permissao_045, permissao_046, permissao_047, permissao_048, permissao_049, permissao_050, " .
                 "permissao_051, permissao_052, permissao_053, permissao_054, permissao_055, permissao_056, permissao_057, permissao_058, permissao_059, permissao_060, " .
                 "permissao_061, permissao_062, permissao_063, permissao_064, permissao_065, permissao_066, permissao_067, permissao_068, permissao_069, permissao_070, " .
                 "permissao_071, permissao_072, permissao_073, permissao_074, permissao_075, permissao_076, permissao_077, permissao_078, permissao_079, permissao_080, " .
                 "data_inicio_validade, data_fim_validade " .
                 "FROM " . $this->table_name . " " .
                 "WHERE nome = :nome LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':nome', $this->nome);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);

            $this->id = $row['id'];
            $this->nome = $row['nome'];
            $this->senha = $row['senha'];
            $this->senhas = $row['senhas'];
            $this->permissao_001 = $row['permissao_001'];
            $this->permissao_002 = $row['permissao_002'];
            $this->permissao_003 = $row['permissao_003'];
            $this->permissao_004 = $row['permissao_004'];
            $this->permissao_005 = $row['permissao_005'];
            $this->permissao_006 = $row['permissao_006'];
            $this->permissao_007 = $row['permissao_007'];
            $this->permissao_008 = $row['permissao_008'];
            $this->permissao_009 = $row['permissao_009'];
            $this->permissao_010 = $row['permissao_010'];
            $this->permissao_011 = $row['permissao_011'];
            $this->permissao_012 = $row['permissao_012'];
            $this->permissao_013 = $row['permissao_013'];
            $this->permissao_014 = $row['permissao_014'];
            $this->permissao_015 = $row['permissao_015'];
            $this->permissao_016 = $row['permissao_016'];
            $this->permissao_017 = $row['permissao_017'];
            $this->permissao_018 = $row['permissao_018'];
            $this->permissao_019 = $row['permissao_019'];
            $this->permissao_020 = $row['permissao_020'];
            $this->permissao_021 = $row['permissao_021'];
            $this->permissao_022 = $row['permissao_022'];
            $this->permissao_023 = $row['permissao_023'];
            $this->permissao_024 = $row['permissao_024'];
            $this->permissao_025 = $row['permissao_025'];
            $this->permissao_026 = $row['permissao_026'];
            $this->permissao_027 = $row['permissao_027'];
            $this->permissao_028 = $row['permissao_028'];
            $this->permissao_029 = $row['permissao_029'];
            $this->permissao_030 = $row['permissao_030'];
            $this->permissao_031 = $row['permissao_031'];
            $this->permissao_032 = $row['permissao_032'];
            $this->permissao_033 = $row['permissao_033'];
            $this->permissao_034 = $row['permissao_034'];
            $this->permissao_035 = $row['permissao_035'];
            $this->permissao_036 = $row['permissao_036'];
            $this->permissao_037 = $row['permissao_037'];
            $this->permissao_038 = $row['permissao_038'];
            $this->permissao_039 = $row['permissao_039'];
            $this->permissao_040 = $row['permissao_040'];
            $this->permissao_041 = $row['permissao_041'];
            $this->permissao_042 = $row['permissao_042'];
            $this->permissao_043 = $row['permissao_043'];
            $this->permissao_044 = $row['permissao_044'];
            $this->permissao_045 = $row['permissao_045'];
            $this->permissao_046 = $row['permissao_046'];
            $this->permissao_047 = $row['permissao_047'];
            $this->permissao_048 = $row['permissao_048'];
            $this->permissao_049 = $row['permissao_049'];
            $this->permissao_050 = $row['permissao_050'];
            $this->permissao_051 = $row['permissao_051'];
            $this->permissao_052 = $row['permissao_052'];
            $this->permissao_053 = $row['permissao_053'];
            $this->permissao_054 = $row['permissao_054'];
            $this->permissao_055 = $row['permissao_055'];
            $this->permissao_056 = $row['permissao_056'];
            $this->permissao_057 = $row['permissao_057'];
            $this->permissao_058 = $row['permissao_058'];
            $this->permissao_059 = $row['permissao_059'];
            $this->permissao_060 = $row['permissao_060'];
            $this->permissao_061 = $row['permissao_061'];
            $this->permissao_062 = $row['permissao_062'];
            $this->permissao_063 = $row['permissao_063'];
            $this->permissao_064 = $row['permissao_064'];
            $this->permissao_065 = $row['permissao_065'];
            $this->permissao_066 = $row['permissao_066'];
            $this->permissao_067 = $row['permissao_067'];
            $this->permissao_068 = $row['permissao_068'];
            $this->permissao_069 = $row['permissao_069'];
            $this->permissao_070 = $row['permissao_070'];
            $this->permissao_071 = $row['permissao_071'];
            $this->permissao_072 = $row['permissao_072'];
            $this->permissao_073 = $row['permissao_073'];
            $this->permissao_074 = $row['permissao_074'];
            $this->permissao_075 = $row['permissao_075'];
            $this->permissao_076 = $row['permissao_076'];
            $this->permissao_077 = $row['permissao_077'];
            $this->permissao_078 = $row['permissao_078'];
            $this->permissao_079 = $row['permissao_079'];
            $this->permissao_080 = $row['permissao_080'];
            $this->data_inicio_validade = $row['data_inicio_validade'];
            $this->data_fim_validade = $row['data_fim_validade'];

            return true;
        }
        return false;
    }

    public function checkSystemCredential() {
        $query = "SELECT id, nome, data_inicio_validade, data_fim_validade " .
                 "FROM " . $this->table_name . " " .
                 "WHERE nome = :nome LIMIT 0,1";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':nome', $this->nome);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $row = $stmt->fetch(PDO::FETCH_ASSOC);
            $this->data_inicio_validade = $row['data_inicio_validade'];
            $this->data_fim_validade = $row['data_fim_validade'];
            return true;
        }
        return false;
    }
}
?>