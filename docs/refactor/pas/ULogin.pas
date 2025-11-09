unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls,
  IBX.IBQuery, Data.DB, IBX.IBCustomDataSet, IBX.IBTable, Vcl.Imaging.jpeg,
  Vcl.Imaging.GIFImg, frxClass;

type
  TFrmLogin = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery3: TIBQuery;
    SaveDialog1: TSaveDialog;
    IBQuery1NOME: TIBStringField;
    IBQuery1SENHA: TIBStringField;
    IBQuery1SENHAS: TIBStringField;
    IBQuery1COL001: TIBStringField;
    IBQuery1COL002: TIBStringField;
    IBQuery1COL003: TIBStringField;
    IBQuery1COL004: TIBStringField;
    IBQuery1COL005: TIBStringField;
    IBQuery1COL006: TIBStringField;
    IBQuery1COL007: TIBStringField;
    IBQuery1COL008: TIBStringField;
    IBQuery1COL009: TIBStringField;
    IBQuery1COL010: TIBStringField;
    IBQuery1COL011: TIBStringField;
    IBQuery1COL012: TIBStringField;
    IBQuery1COL013: TIBStringField;
    IBQuery1COL014: TIBStringField;
    IBQuery1COL015: TIBStringField;
    IBQuery1COL016: TIBStringField;
    IBQuery1COL017: TIBStringField;
    IBQuery1COL018: TIBStringField;
    IBQuery1COL019: TIBStringField;
    IBQuery1COL020: TIBStringField;
    IBQuery1COL021: TIBStringField;
    IBQuery1COL022: TIBStringField;
    IBQuery1COL023: TIBStringField;
    IBQuery1COL024: TIBStringField;
    IBQuery1COL025: TIBStringField;
    IBQuery1COL026: TIBStringField;
    IBQuery1COL027: TIBStringField;
    IBQuery1COL028: TIBStringField;
    IBQuery1COL029: TIBStringField;
    IBQuery1COL030: TIBStringField;
    IBQuery1COL031: TIBStringField;
    IBQuery1COL032: TIBStringField;
    IBQuery1COL033: TIBStringField;
    IBQuery1COL034: TIBStringField;
    IBQuery1COL035: TIBStringField;
    IBQuery1COL036: TIBStringField;
    IBQuery1COL037: TIBStringField;
    IBQuery1COL038: TIBStringField;
    IBQuery1COL039: TIBStringField;
    IBQuery1COL040: TIBStringField;
    IBQuery1COL041: TIBStringField;
    IBQuery1COL042: TIBStringField;
    IBQuery1COL043: TIBStringField;
    IBQuery1COL044: TIBStringField;
    IBQuery1COL045: TIBStringField;
    IBQuery1COL046: TIBStringField;
    IBQuery1COL047: TIBStringField;
    IBQuery1COL048: TIBStringField;
    IBQuery1COL049: TIBStringField;
    IBQuery1COL050: TIBStringField;
    IBQuery1COL051: TIBStringField;
    IBQuery1COL052: TIBStringField;
    IBQuery1COL053: TIBStringField;
    IBQuery1COL054: TIBStringField;
    IBQuery1COL055: TIBStringField;
    IBQuery1COL056: TIBStringField;
    IBQuery1COL057: TIBStringField;
    IBQuery1COL058: TIBStringField;
    IBQuery1COL059: TIBStringField;
    IBQuery1COL060: TIBStringField;
    IBQuery1COL061: TIBStringField;
    IBQuery1COL062: TIBStringField;
    IBQuery1COL063: TIBStringField;
    IBQuery1COL064: TIBStringField;
    IBQuery1COL065: TIBStringField;
    IBQuery1COL066: TIBStringField;
    IBQuery1COL067: TIBStringField;
    IBQuery1COL068: TIBStringField;
    IBQuery1COL069: TIBStringField;
    IBQuery1COL070: TIBStringField;
    IBQuery1COL071: TIBStringField;
    IBQuery1COL072: TIBStringField;
    IBQuery1COL073: TIBStringField;
    IBQuery1COL074: TIBStringField;
    IBQuery1COL075: TIBStringField;
    IBQuery1COL076: TIBStringField;
    IBQuery1COL077: TIBStringField;
    IBQuery1COL078: TIBStringField;
    IBQuery1COL079: TIBStringField;
    IBQuery1COL080: TIBStringField;
    IBQuery1DATXI: TIBStringField;
    IBQuery1DATXL: TIBStringField;
    IBQuery2NOME: TIBStringField;
    IBQuery2SENHA: TIBStringField;
    IBQuery2SENHAS: TIBStringField;
    IBQuery2COL001: TIBStringField;
    IBQuery2COL002: TIBStringField;
    IBQuery2COL003: TIBStringField;
    IBQuery2COL004: TIBStringField;
    IBQuery2COL005: TIBStringField;
    IBQuery2COL006: TIBStringField;
    IBQuery2COL007: TIBStringField;
    IBQuery2COL008: TIBStringField;
    IBQuery2COL009: TIBStringField;
    IBQuery2COL010: TIBStringField;
    IBQuery2COL011: TIBStringField;
    IBQuery2COL012: TIBStringField;
    IBQuery2COL013: TIBStringField;
    IBQuery2COL014: TIBStringField;
    IBQuery2COL015: TIBStringField;
    IBQuery2COL016: TIBStringField;
    IBQuery2COL017: TIBStringField;
    IBQuery2COL018: TIBStringField;
    IBQuery2COL019: TIBStringField;
    IBQuery2COL020: TIBStringField;
    IBQuery2COL021: TIBStringField;
    IBQuery2COL022: TIBStringField;
    IBQuery2COL023: TIBStringField;
    IBQuery2COL024: TIBStringField;
    IBQuery2COL025: TIBStringField;
    IBQuery2COL026: TIBStringField;
    IBQuery2COL027: TIBStringField;
    IBQuery2COL028: TIBStringField;
    IBQuery2COL029: TIBStringField;
    IBQuery2COL030: TIBStringField;
    IBQuery2COL031: TIBStringField;
    IBQuery2COL032: TIBStringField;
    IBQuery2COL033: TIBStringField;
    IBQuery2COL034: TIBStringField;
    IBQuery2COL035: TIBStringField;
    IBQuery2COL036: TIBStringField;
    IBQuery2COL037: TIBStringField;
    IBQuery2COL038: TIBStringField;
    IBQuery2COL039: TIBStringField;
    IBQuery2COL040: TIBStringField;
    IBQuery2COL041: TIBStringField;
    IBQuery2COL042: TIBStringField;
    IBQuery2COL043: TIBStringField;
    IBQuery2COL044: TIBStringField;
    IBQuery2COL045: TIBStringField;
    IBQuery2COL046: TIBStringField;
    IBQuery2COL047: TIBStringField;
    IBQuery2COL048: TIBStringField;
    IBQuery2COL049: TIBStringField;
    IBQuery2COL050: TIBStringField;
    IBQuery2COL051: TIBStringField;
    IBQuery2COL052: TIBStringField;
    IBQuery2COL053: TIBStringField;
    IBQuery2COL054: TIBStringField;
    IBQuery2COL055: TIBStringField;
    IBQuery2COL056: TIBStringField;
    IBQuery2COL057: TIBStringField;
    IBQuery2COL058: TIBStringField;
    IBQuery2COL059: TIBStringField;
    IBQuery2COL060: TIBStringField;
    IBQuery2COL061: TIBStringField;
    IBQuery2COL062: TIBStringField;
    IBQuery2COL063: TIBStringField;
    IBQuery2COL064: TIBStringField;
    IBQuery2COL065: TIBStringField;
    IBQuery2COL066: TIBStringField;
    IBQuery2COL067: TIBStringField;
    IBQuery2COL068: TIBStringField;
    IBQuery2COL069: TIBStringField;
    IBQuery2COL070: TIBStringField;
    IBQuery2COL071: TIBStringField;
    IBQuery2COL072: TIBStringField;
    IBQuery2COL073: TIBStringField;
    IBQuery2COL074: TIBStringField;
    IBQuery2COL075: TIBStringField;
    IBQuery2COL076: TIBStringField;
    IBQuery2COL077: TIBStringField;
    IBQuery2COL078: TIBStringField;
    IBQuery2COL079: TIBStringField;
    IBQuery2COL080: TIBStringField;
    IBQuery2DATXI: TIBStringField;
    IBQuery2DATXL: TIBStringField;
    IBQuery3NOME: TIBStringField;
    IBQuery3SENHA: TIBStringField;
    IBQuery3SENHAS: TIBStringField;
    IBQuery3COL001: TIBStringField;
    IBQuery3COL002: TIBStringField;
    IBQuery3COL003: TIBStringField;
    IBQuery3COL004: TIBStringField;
    IBQuery3COL005: TIBStringField;
    IBQuery3COL006: TIBStringField;
    IBQuery3COL007: TIBStringField;
    IBQuery3COL008: TIBStringField;
    IBQuery3COL009: TIBStringField;
    IBQuery3COL010: TIBStringField;
    IBQuery3COL011: TIBStringField;
    IBQuery3COL012: TIBStringField;
    IBQuery3COL013: TIBStringField;
    IBQuery3COL014: TIBStringField;
    IBQuery3COL015: TIBStringField;
    IBQuery3COL016: TIBStringField;
    IBQuery3COL017: TIBStringField;
    IBQuery3COL018: TIBStringField;
    IBQuery3COL019: TIBStringField;
    IBQuery3COL020: TIBStringField;
    IBQuery3COL021: TIBStringField;
    IBQuery3COL022: TIBStringField;
    IBQuery3COL023: TIBStringField;
    IBQuery3COL024: TIBStringField;
    IBQuery3COL025: TIBStringField;
    IBQuery3COL026: TIBStringField;
    IBQuery3COL027: TIBStringField;
    IBQuery3COL028: TIBStringField;
    IBQuery3COL029: TIBStringField;
    IBQuery3COL030: TIBStringField;
    IBQuery3COL031: TIBStringField;
    IBQuery3COL032: TIBStringField;
    IBQuery3COL033: TIBStringField;
    IBQuery3COL034: TIBStringField;
    IBQuery3COL035: TIBStringField;
    IBQuery3COL036: TIBStringField;
    IBQuery3COL037: TIBStringField;
    IBQuery3COL038: TIBStringField;
    IBQuery3COL039: TIBStringField;
    IBQuery3COL040: TIBStringField;
    IBQuery3COL041: TIBStringField;
    IBQuery3COL042: TIBStringField;
    IBQuery3COL043: TIBStringField;
    IBQuery3COL044: TIBStringField;
    IBQuery3COL045: TIBStringField;
    IBQuery3COL046: TIBStringField;
    IBQuery3COL047: TIBStringField;
    IBQuery3COL048: TIBStringField;
    IBQuery3COL049: TIBStringField;
    IBQuery3COL050: TIBStringField;
    IBQuery3COL051: TIBStringField;
    IBQuery3COL052: TIBStringField;
    IBQuery3COL053: TIBStringField;
    IBQuery3COL054: TIBStringField;
    IBQuery3COL055: TIBStringField;
    IBQuery3COL056: TIBStringField;
    IBQuery3COL057: TIBStringField;
    IBQuery3COL058: TIBStringField;
    IBQuery3COL059: TIBStringField;
    IBQuery3COL060: TIBStringField;
    IBQuery3COL061: TIBStringField;
    IBQuery3COL062: TIBStringField;
    IBQuery3COL063: TIBStringField;
    IBQuery3COL064: TIBStringField;
    IBQuery3COL065: TIBStringField;
    IBQuery3COL066: TIBStringField;
    IBQuery3COL067: TIBStringField;
    IBQuery3COL068: TIBStringField;
    IBQuery3COL069: TIBStringField;
    IBQuery3COL070: TIBStringField;
    IBQuery3COL071: TIBStringField;
    IBQuery3COL072: TIBStringField;
    IBQuery3COL073: TIBStringField;
    IBQuery3COL074: TIBStringField;
    IBQuery3COL075: TIBStringField;
    IBQuery3COL076: TIBStringField;
    IBQuery3COL077: TIBStringField;
    IBQuery3COL078: TIBStringField;
    IBQuery3COL079: TIBStringField;
    IBQuery3COL080: TIBStringField;
    IBQuery3DATXI: TIBStringField;
    IBQuery3DATXL: TIBStringField;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button19: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    IBTSenhas: TIBTable;
    ColorDialog1: TColorDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button26Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button23Click(Sender: TObject);
    procedure Button24Click(Sender: TObject);
    procedure Button25Click(Sender: TObject);
    procedure Button22Click(Sender: TObject);
    procedure Button21Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure Button28Click(Sender: TObject);
  private
    { Private declarations }
      sl: TStringList;
  public
    { Public declarations }
    function ExisteForm(pForm: TForm): Boolean;
    function StrZero(strValor: string;intComprimento: Integer): string;
    function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
  end;

var
  FrmLogin: TFrmLogin;
  wnome,wsenha,wsenhas: string;
  wcol001,wcol002,wcol003,wcol004,wcol005,wcol006,wcol007,wcol008,wcol009: string;
  wcol010,wcol011,wcol012,wcol013,wcol014,wcol015,wcol016,wcol017,wcol018: string;
  wcol019,wcol020,wcol021,wcol022,wcol023,wcol024,wcol025,wcol026,wcol027: string;
  wcol028,wcol029,wcol030,wcol031,wcol032,wcol033,wcol034,wcol035,wcol036: string;
  wcol037,wcol038,wcol039,wcol040,wcol041,wcol042,wcol043,wcol044,wcol045: string;
  wcol046,wcol047,wcol048,wcol049,wcol050,wcol051,wcol052,wcol053,wcol054: string;
  wcol055,wcol056,wcol057,wcol058,wcol059,wcol060,wcol061,wcol062,wcol063: string;
  wcol064,wcol065,wcol066,wcol067,wcol068,wcol069,wcol070,wcol071,wcol072: string;
  wcol073,wcol074,wcol075,wcol076,wcol077,wcol078,wcol079,wcol080: string;
  wdatxi,wdatxl: string;
implementation

{$R *.dfm}

uses UDModRosa, UManutart, UManutcli, UManutven, UManutfor,UManutped, UManutsol, UManutdev, UManutdef, UDevolucao,
     UManutrot, UManutund, UManutgru, UFilial_cli, UFilial_ret, UFilial_sol, ULanca_pag, UBaixa_pag, UEstatistica,
     UUtilitarios, UFluxo_pag, URegulamentos;

function TFrmLogin.Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
{
   OBJETIVO: Eliminar caracteres inválidos e acrescentar caracteres à esquerda ou à direita do texto original para que a string resultante fique com o tamanho desejado

   Texto : Texto original
   TamanhoDesejado: Tamanho que a string resultante deverá ter
   AcrescentarADireita: Indica se o carácter será acrescentado à direita ou à esquerda
      TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à direita
             Se o tamanho do texto form MAIOR que o desejado, eliminar primeiros caracteres do texto                                    +
      FALSE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à esquerda
             Se o tamanho do texto form MAIOR que o desejado, eliminar últimos caracteres do texto
   CaracterAcrescentar: Carácter que deverá ser acrescentado
}
var
   QuantidadeAcrescentar,
   TamanhoTexto,
   PosicaoInicial,
   i : integer;

begin
   case CaracterAcrescentar of
      '0'..'9','a'..'z','A'..'Z' : ;{Não faz nada}
      else
         CaracterAcrescentar := ' ';
   end;

   Texto := Trim(Texto);
   TamanhoTexto := Length(Texto);
   for i := 1 to (TamanhoTexto) do
   begin
     if Pos(Texto[i],' 0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~''"!@#$%^&*()_-+=|/\{}[]:;,.<>') = 0 then
     begin
         case Texto[i] of
            'á','Á' : Texto[i] := 'A';
            'é','É' : Texto[i] := 'E';
            'í','Í' : Texto[i] := 'I';
            'ó','Ó' : Texto[i] := 'O';
            'ú','Ú' : Texto[i] := 'U';
            'à','À' : Texto[i] := 'A';
            'è','È' : Texto[i] := 'E';
            'ì','Ì' : Texto[i] := 'I';
            'ò','Ò' : Texto[i] := 'O';
            'ù','Ù' : Texto[i] := 'U';
            'â','Â' : Texto[i] := 'A';
            'ê','Ê' : Texto[i] := 'E';
            'î','Î' : Texto[i] := 'I';
            'ô','Ô' : Texto[i] := 'O';
            'û','Û' : Texto[i] := 'U';
            'ä','Ä' : Texto[i] := 'A';
            'ë','Ë' : Texto[i] := 'E';
            'ï','Ï' : Texto[i] := 'I';
            'ö','Ö' : Texto[i] := 'O';
            'ü','Ü' : Texto[i] := 'U';
            'ç','Ç' : Texto[i] := 'C';
            'ñ','Ñ' : Texto[i] := 'N';
            else Texto[i] := ' ';
         end;
      end;
   end;
   QuantidadeAcrescentar := TamanhoDesejado - TamanhoTexto;
   if QuantidadeAcrescentar < 0 then
      QuantidadeAcrescentar := 0;
   if CaracterAcrescentar = '' then
      CaracterAcrescentar := ' ';
   if TamanhoTexto >= TamanhoDesejado then
      PosicaoInicial := TamanhoTexto - TamanhoDesejado + 1
   else
      PosicaoInicial := 1;

   if AcrescentarADireita then
      Texto := Copy(Texto,1,TamanhoDesejado) + StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar)
   else
      Texto := StringOfChar(CaracterAcrescentar,QuantidadeAcrescentar) + Copy(Texto,PosicaoInicial,TamanhoDesejado);

   Result := AnsiUpperCase(Texto);
end;

function TFrmLogin.StrZero(strValor: string; intComprimento: integer) : string;
var
  StrZeros,strRetorno: string;
  intTamanho,intContador: integer;
begin
  intTamanho:=Length(Trim(strValor));
  strZeros:='';
  for intContador:=1 to intComprimento do
      StrZeros:=strZeros+'0';
  strRetorno:=Copy(Trim(strZeros)+Trim(strValor),intTamanho+1,intComprimento);
  Result:=strRetorno;
end;

function TFrmLogin.ExisteForm(pForm: Tform): Boolean;
var
  I: Integer;
begin
  ExisteForm := False;
  For I:= 0 to Screen.FormCount -1 do
      if Screen.Forms[I] = pForm then
      begin
        ExisteForm := True;
        Break;
      end;
end;

procedure TFrmLogin.Button10Click(Sender: TObject);
begin
  if not DModRosa.IBDataBase1.connected then
     DModRosa.IBDatabase1.connected:=True;
  FrmManutfor:=TFrmManutfor.Create(Self);
  FrmManutfor.ShowModal;
  FrmManutfor.release;
end;

procedure TFrmLogin.Button11Click(Sender: TObject);
begin
  if not DModRosa.IBDataBase1.connected then
     DModRosa.IBDatabase1.connected:=True;
  FrmManutped:=TFrmManutped.Create(Self);
  FrmManutped.ShowModal;
  FrmManutped.release;
end;

procedure TFrmLogin.Button12Click(Sender: TObject);
begin
  if not DModRosa.IBDataBase1.connected then
     DModRosa.IBDatabase1.connected:=True;
  FrmManutsol:=TFrmManutsol.Create(Self);
  FrmManutsol.ShowModal;
  FrmManutsol.release;
end;

procedure TFrmLogin.Button13Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col055').AsString='X' then
  begin
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmManutdev:=TFrmManutdev.Create(Self);
    FrmManutdev.ShowModal;
    FrmManutdev.release;
  end else
  begin
      ShowMessage('Não autorizado !!!!');
      Button13.SetFocus;
      exit;
  end;
end;

procedure TFrmLogin.Button14Click(Sender: TObject);
begin
  if IBQuery1.FieldByName('Col056').AsString='X' then
  begin
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmManutdef:=TFrmManutdef.Create(Self);
    FrmManutdef.ShowModal;
    FrmManutdef.release;
  end else
  begin
    ShowMessage('Não autorizado !!!!');
    Button14.SetFocus;
    exit;
  end;
end;

procedure TFrmLogin.Button19Click(Sender: TObject);
var
  Registro: String;
  Pedido: TStringList;
  NomeArquivo: String;
  whora,wdata,wnome,wdathora,wcodped,wdatpag,wcob,woldped: string;
  wdatbase,wdatrec,wdatcob,wdatped,wlimit,wsolici,wvia,wdatret: String;
  wtotped,wtotven,wvalpag,wresiduo,wqtdsai,wqtdret: Extended;
  wquant: Integer;
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col001').AsString='' then
  begin
    showmessage('Não Autorizado !!!');
    Button19.SetFocus;
    exit;
  end;
  wvend:='';
  While wvend='' do
  begin
    wvend:=InputBox('Informe o codigo do vendedor!!',
                    'Vendedor:',' ');
  end;
  wdatfin:='';
  While wdatfin='' do
  begin
    wdatfin:=InputBox('Informe data Limite do periodo !!',
                      'Data (DD/MM/AAAA):',' ');
  end;
  // Exporta Pedidos *****************************
  whora:=TimeToStr(NOW);
  wdata:=DateToStr(Date());
  Pedido:=TStringList.Create;
  wdathora:=Copy(wdata,7,4)+Copy(wdata,4,2)+Copy(wdata,1,2)+
                             Copy(whora,1,2)+Copy(whora,4,2);
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '\Remessa';
  SaveDialog1.FileName := 'Pedido.txt';
  SaveDialog1.Title := 'Salvar arquivo em ???';
  if SaveDialog1.Execute then
     NomeArquivo := SaveDialog1.FileName
  else
     Exit;
  showmessage('Aguarde  !!!!!!!!!');
  // Cria Cabecalho ****************************************
  wquant:=1;
  Registro:='00';
  Registro:=Registro+Formatar('ARQUIVO REMESSA DE PEDIDOS',40,true,' ');
  Registro:=Registro+Formatar('SIDTEX CONFECÇÕES',20);
  Registro:=Registro+Formatar(wdathora,12,true,'0');
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',25);
  Registro:=Registro+Formatar('P',1);
  Pedido.Add(Registro);
  if DModRosa.IBQVer_ped.Active then
     DModRosa.IBQVer_ped.Active:=False;
  DModRosa.IBQVer_ped.Sql.Clear;
  DModRosa.IBQVer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where CODVEN=:ven_digit '+
                              'and BASE<=:fin_digit '+
                              'and Situ=:sit_digit '+
                              'Order by PEDIDO');
  DModRosa.IBQVer_ped.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQVer_ped.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
  DModRosa.IBQVer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQVer_ped.Active:=True;
  DModRosa.IBQVer_ped.DisableControls;
  DModRosa.IBQVer_ped.First;
  while not DModRosa.IBQVer_ped.Eof do
  begin
    wcodped:=DModRosa.IBQVer_ped.fieldbyName('PEDIDO').AsString;
    wcodcli:=DModRosa.IBQVer_ped.fieldByName('CODCLI').AsString;
    wnome:=DModRosa.IBQVer_ped.fieldByName('NOMCLI').AsString;
    wdatbase:=DateToStr(DModRosa.IBQVer_ped.fieldByName('BASE').AsDateTime);
    wdatrec:=DateToStr(DModRosa.IBQVer_ped.fieldByName('RECOL').AsDateTime);
    wdatcob:=DateToStr(DModRosa.IBQVer_ped.fieldByName('COBRAN').AsDateTime);
    wtotped:=DModRosa.IBQVer_ped.fieldByName('TOTPED').AsFloat;
    wsitu:=DModRosa.IBQVer_ped.fieldByName('SITU').AsString;
    wdatped:=DModRosa.IBQVer_ped.fieldByName('DATPED').AsString;
    wdatret:=DModRosa.IBQVer_ped.fieldbyName('RETORNO').AsString;
    wtotven:=DModRosa.IBQVer_ped.fieldByName('TOTVEN').AsFloat;
    wdatpag:=DModRosa.IBQVer_ped.fieldByName('DATPAG').AsString;
    wsolici:=DModRosa.IBQVer_ped.fieldByName('SOLICIT').AsString;
    wvalpag:=DModRosa.IBQVer_ped.fieldByName('VALPAG').AsFloat;
    wresiduo:=DModRosa.IBQVer_ped.fieldByName('RESIDUO').AsFloat;
    wcob:=DModRosa.IBQVer_ped.fieldByName('COB').AsString;
    wlimit:=DModRosa.IBQVer_ped.fieldByName('LIMITE').AsString;
    wvia:=DModRosa.IBQVer_ped.fieldByName('VIA').AsString;
    woldped:=DModRosa.IBQVer_ped.fieldByName('OLDPED').AsString;
    while Length(wcodcli)<4 do
          wcodcli:='0' + wcodcli;
    while Length(wcodped)<6 do
          wcodped:='0' + wcodped;
    // Cria Reg.detalhe *****************************************
    wquant:=wquant+1;
    Registro:='01';
    Registro:=Registro+Formatar(wcodped,6);
    Registro:=Registro+Formatar(wvend,3,false,'0');
    Registro:=Registro+Formatar(wcodcli,4,false,'0');
    Registro:=Registro+Formatar(wnome,40,true,' ');
    Registro:=Registro+Formatar(wdatbase,10,true,' ');
    Registro:=Registro+Formatar(wdatrec,10,true,' ');
    Registro:=Registro+Formatar(wdatcob,10,true,' ');
    Registro:=Registro+Formatar(FloatToStr(Trunc(wtotped*100)),12,false,'0');
    Registro:=Registro+Formatar(wsitu,1);
    Registro:=Registro+Formatar(wdatped,10,true,' ');
    Registro:=Registro+Formatar(wsolici,6,false,'0');
    Registro:=Registro+Formatar(wdatret,10,true,' ');
    Registro:=Registro+Formatar(FloatToStr(Trunc(wtotven*100)),12,false,'0');
    Registro:=Registro+Formatar(wdatpag,10,true,' ');
    Registro:=Registro+Formatar(FloatToStr(Trunc(wvalpag*100)),12,false,'0');
    Registro:=Registro+Formatar(FloatToStr(Trunc(wresiduo*100)),12,false,'0');
    Registro:=Registro+Formatar(wcob,1);
    Registro:=Registro+Formatar(wlimit,10,true,' ');
    Registro:=Registro+Formatar(wvia,1);
    Registro:=Registro+Formatar(woldped,6,true,' ');
    Registro:=Registro+Formatar(' ',11);
    Registro:=Registro+Formatar('P',1);
    Pedido.Add(Registro);
    // Cria Itens do pedido ************************
    DModRosa.IBQVer_itped.Active:=False;
    DModRosa.IBQVer_itped.Sql.Clear;
    DModRosa.IBQVer_itped.SqL.Add('Select * from ITEMPEDIDO '+
                                  'Where PEDIDO=:ped_digit '+
                                  'Order by CODART');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wcodped;
    DModRosa.IBQVer_itped.Active:=True;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQVer_itped.fieldbyName('Descricao').AsString;
      wqtdsai:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      wqtdret:=DModRosa.IBQVer_itped.fieldbyName('Qtdret').AsFloat;
      wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
      wpreven:=DModRosa.IBQVer_itped.fieldbyName('Preven').AsFloat;
      wquant:=wquant+1;
      Registro:='02';
      Registro:=Registro+Formatar(wcodped,6);
      Registro:=Registro+Formatar(wcodart,4,false,'0');
      Registro:=Registro+Formatar(wdescricao,40,true,' ');
      Registro:=Registro+Formatar(FloatToStr(wqtdsai),5,false,'0');
      Registro:=Registro+Formatar(FloatToStr(wqtdret),5,false,'0');
      Registro:=Registro+Formatar(FloatToStr(wprecus*100),12,false,'0');
      Registro:=Registro+Formatar(FloatToStr(wpreven*100),12,false,'0');
      Registro:=Registro+Formatar(' ',113);
      Registro:=Registro+Formatar('P',1);
      Pedido.Add(Registro);
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_ped.Next;
  end;
  DModRosa.IBQVer_ped.Active:=False;
  // Cria o Trayler *************************
  Registro:='09';
  Registro:=Registro+Formatar(IntToStr(wquant),4,false,'0');
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',73);
  Registro:=Registro+Formatar(wdatini,10);
  Registro:=Registro+Formatar(wdatfin,10);
  Registro:=Registro+Formatar('P',1);
  Pedido.Add(Registro);
  // Grava Arquivo Remessa ******************
  Pedido.SaveToFile(NomeArquivo);
  Pedido.Free;
  showmessage('Arq.Remessa Pedidos para filial foi Criado');
end;

procedure TFrmLogin.Button20Click(Sender: TObject);
begin
  FrmRegulamentos:=TFrmRegulamentos.Create(Self);
  FrmRegulamentos.ShowModal;
  FrmRegulamentos.release;
end;

procedure TFrmLogin.Button21Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col003').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmEstatistica:=TFrmEstatistica.Create(Self);
    FrmEstatistica.ShowModal;
    FrmEstatistica.release;
  end else
      showmessage('Não Autorizado  !!!!');
end;

procedure TFrmLogin.Button22Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Senhas').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmUtilitarios:=TFrmUtilitarios.Create(Self);
    FrmUtilitarios.ShowModal;
    FrmUtilitarios.release;
  end else
      showmessage('Não Autorizado !!!!');
end;

procedure TFrmLogin.Button23Click(Sender: TObject);
begin
  // Inporta Clientes ******************************
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col002').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmFilial_cli:=TFrmFilial_cli.Create(Self);
    FrmFilial_cli.ShowModal;
    FrmFilial_cli.release;
  end else
      showmessage('Não Autorizado !!!!');
end;

procedure TFrmLogin.Button24Click(Sender: TObject);
begin
  // Importa Solicitacoes ***********************
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col002').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmFilial_sol:=TFrmFilial_sol.Create(Self);
    FrmFilial_sol.ShowModal;
    FrmFilial_sol.release;
  end else
      showmessage('Não Autorizado !!!');
end;

procedure TFrmLogin.Button25Click(Sender: TObject);
begin
  // Importa Retornos  **********************************
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col002').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmFilial_ret:=TFrmFilial_ret.Create(Self);
    FrmFilial_ret.ShowModal;
    FrmFilial_ret.release;
  end else
      showmessage('Não Autorizado !!!');
end;

procedure TFrmLogin.Button26Click(Sender: TObject);
var
  Registro: String;
  Artremessa: TStringList;
  NomeArquivo: String;
  wdathora,whora,wdata,wudata, wtabel: string;
  wquant: Integer;
  wcusto,wvenda,westoq,wsacol,waliq,wdevol,wvend: Extended;
begin
    IBQuery1.Open;
  if IBQuery1.FieldByName('Col001').AsString='' then
  begin
    showmessage('Não Autorizado !!!');
    Button26.SetFocus;
    exit;
  end;
  // Exporta Artigos *****************************
  whora:=TimeToStr(NOW);
  wdata:=DateToStr(Date());
  Artremessa:=TStringList.Create;
  wdathora:=Copy(wdata,7,4)+Copy(wdata,4,2)+Copy(wdata,1,2)+
                             Copy(whora,1,2)+Copy(whora,4,2);
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '\Remessas';
  SaveDialog1.FileName := 'Artigos.txt';
  SaveDialog1.Title := 'Salvar arquivo em ???';
  if SaveDialog1.Execute then
     NomeArquivo := SaveDialog1.FileName
  else
     Exit;
  showmessage('Aguarde  !!!!!!!!!');
  // Cria Cabecalho ****************************************
  wquant:=1;
  Registro:='00';
  Registro:=Registro+Formatar('ARQUIVO REMESSA DE ARTIGOS',40,true,' ');
  Registro:=Registro+Formatar('SIDTEX CONFECÇÕES',20);
  Registro:=Registro+Formatar(wdathora,12,true,'0');
  Registro:=Registro+Formatar(' ',35);
  Registro:=Registro+Formatar('A',1);
  Artremessa.Add(Registro);
  if DModRosa.IBQVer_art.Active then
     DModRosa.IBQVer_art.Active:=False;
  DModRosa.IBQVer_art.Sql.Clear;
  DModRosa.IBQVer_art.Sql.Add('Select * from ARTIGO '+
                              'Order by CODIGO');
  DModRosa.IBQVer_art.Active:=True;
  DModRosa.IBQVer_art.DisableControls;
  DModRosa.IBQVer_art.First;
  while not DModRosa.IBQVer_art.Eof do
  begin
    wcodart:=DModRosa.IBQVer_art.fieldbyName('CODIGO').AsString;
    wgrupo:=DModRosa.IBQVer_art.fieldbyName('GRUPO').AsString;
    wdescricao:=DModRosa.IBQVer_art.fieldbyName('DESCRICAO').AsString;
    wcusto:=DModRosa.IBQVer_art.fieldbyName('CUSTO').AsFloat;
    wvenda:=DModRosa.IBQVer_art.fieldbyName('VENDA').AsFloat;
    westoq:=DModRosa.IBQVer_art.fieldbyName('ESTOQ').AsFloat;
    wudata:=DModRosa.IBQVer_art.fieldbyName('UDATA').AsString;
    wtabel:=DModRosa.IBQVer_art.fieldbyName('TABEL').AsString;
    wsacol:=DModRosa.IBQVer_art.fieldbyName('SACOL').AsFloat;
    waliq:=DModRosa.IBQVer_art.fieldbyName('ALIQ').AsFloat;
    wdevol:=DModRosa.IBQVer_art.fieldbyName('DEVOL').AsFloat;
    wvend:=DModRosa.IBQVer_art.fieldbyName('VEND').AsFloat;
    if westoq<0 then
       westoq:=0;
    // Cria Reg.detalhe *****************************************
    wquant:=wquant+1;
    Registro:='01';
    Registro:=Registro+Formatar(wcodart,4);
    Registro:=Registro+Formatar(wgrupo,2,true,' ');
    Registro:=Registro+Formatar(wdescricao,40,true,' ');
    Registro:=Registro+Formatar(FloatToStr(Trunc(wcusto*100)),12,false,'0');
    Registro:=Registro+Formatar(FloatToStr(Trunc(wvenda*100)),12,false,'0');
    Registro:=Registro+Formatar(FloatToStr(westoq),5,false,'0');
    Registro:=Registro+Formatar(wudata,10,true,' ');
    Registro:=Registro+Formatar(wtabel,1);
    Registro:=Registro+Formatar(FloatToStr(wsacol),6,false,'0');
    Registro:=Registro+Formatar(FloatToStr(waliq),3,false,'0');
    Registro:=Registro+Formatar(FloatToStr(wdevol),6,false,'0');
    Registro:=Registro+Formatar(FloatToStr(wvend),6,false,'0');
    Registro:=Registro+Formatar('A',1);
    Artremessa.Add(Registro);
    DModRosa.IBQVer_art.Next;
  end;
  DModRosa.IBQVer_art.Active:=False;
  // Cria o Trayler *************************
  Registro:='09';
  Registro:=Registro+Formatar(IntToStr(wquant),4,false,'0');
  Registro:=Registro+Formatar(' ',83);
  Registro:=Registro+Formatar(wdatini,10);
  Registro:=Registro+Formatar(wdatfin,10);
  Registro:=Registro+Formatar('A',1);
  Artremessa.Add(Registro);
  // Grava Arquivo Remessa ******************
  Artremessa.SaveToFile(NomeArquivo);
  Artremessa.Free;
  showmessage('Arq.Remessa Artigos para filial foi Criado');
end;

procedure TFrmLogin.Button27Click(Sender: TObject);
var
  Registro: String;
  Cliremessa: TStringList;
  NomeArquivo: String;
  wnome,wende,wbair,westa,wncep,wdathora,wvend: string;
  wnifp,wncpf,wresp,wsitu,wntel: string;
  wdatimp,whora,wdata: string;
  wquant: Integer;
begin
  wvend:='';
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col001').AsString='' then
  begin
    showmessage('Não Autorizado !!!');
    Button27.SetFocus;
    exit;
  end;
  While wvend='' do
  begin
    wvend:=InputBox('Informe o codigo do vendedor!!',
                    'Vendedor:',' ');
  end;
  // Exporta Clientes *****************************
  whora:=TimeToStr(NOW);
  wdata:=DateToStr(Date());
  Cliremessa:=TStringList.Create;
  wdathora:=Copy(wdata,7,4)+Copy(wdata,4,2)+Copy(wdata,1,2)+
                             Copy(whora,1,2)+Copy(whora,4,2);
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName) + '\Remessas';
  SaveDialog1.FileName := 'Clientes.txt';
  SaveDialog1.Title := 'Salvar arquivo em ???';
  if SaveDialog1.Execute then
     NomeArquivo := SaveDialog1.FileName
  else
     Exit;
  showmessage('Aguarde  !!!!!!!!!');
  // Cria Cabecalho ****************************************
  wquant:=1;
  Registro:='00';
  Registro:=Registro+Formatar('ARQUIVO REMESSA DE CLIENTES',40,true,' ');
  Registro:=Registro+Formatar('SIDTEX CONFECÇÕES',20);
  Registro:=Registro+Formatar(wdathora,12,true,'0');
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',62);
  Registro:=Registro+Formatar('C',1);
  Cliremessa.Add(Registro);
  if DModRosa.IBQVer_cli.Active then
     DModRosa.IBQVer_cli.Active:=False;
  DModRosa.IBQVer_cli.Sql.Clear;
  DModRosa.IBQVer_cli.Sql.Add('Select * from CLIENTE '+
                              'Where Vend=:vend_digit '+
                              'Order by IDCLI');
  DModRosa.IBQVer_cli.ParamByName('vend_digit').AsString:=wvend;
  DModRosa.IBQVer_cli.Active:=True;
  DModRosa.IBQVer_cli.DisableControls;
  DModRosa.IBQVer_cli.First;
  while not DModRosa.IBQVer_cli.Eof do
  begin
    wcodcli:=IntToStr(DModRosa.IBQVer_cli.fieldbyName('IDCLI').AsInteger);
    wnome:=DModRosa.IBQVer_cli.fieldbyName('NOME').AsString;
    wnifp:=DModRosa.IBQVer_cli.fieldbyName('NIFP').AsString;
    wncpf:=DModRosa.IBQVer_cli.fieldbyName('NCPF').AsString;
    wende:=DModRosa.IBQVer_cli.fieldbyName('ENDE').AsString;
    wbair:=DModRosa.IBQVer_cli.fieldbyName('BAIR').AsString;
    wcida:=DModRosa.IBQVer_cli.fieldbyName('CIDA').AsString;
    westa:=DModRosa.IBQVer_cli.fieldbyName('ESTA').AsString;
    wncep:=DModRosa.IBQVer_cli.fieldbyName('NCEP').AsString;
    wntel:=DModRosa.IBQVer_cli.fieldbyName('NTEL').AsString;
    wresp:=DModRosa.IBQVer_cli.fieldbyName('CONTA').AsString;
    wvend:=DModRosa.IBQVer_cli.fieldbyName('VEND').AsString;
    wlcre:=DModRosa.IBQVer_cli.fieldbyName('LCRED').AsFloat;
    wdatimp:=DModRosa.IBQVer_cli.fieldbyName('DATIMP').AsString;
    wnommae:=DModRosa.IBQVer_cli.fieldbyName('NOMMAE').AsString;
    wnompai:=DModRosa.IBQVer_cli.fieldbyName('NOMPAI').AsString;
    wdatnas:=DModRosa.IBQVer_cli.fieldbyName('DATNASC').AsString;
    wnatu:=DModRosa.IBQVer_cli.fieldbyName('NATU').AsString;
    wrota:=DModRosa.IBQVer_cli.fieldbyName('ROTA').AsString;
    wpraca:=DModRosa.IBQVer_cli.fieldbyName('PRACA').AsString;
    wobsv:=DModRosa.IBQVer_cli.fieldbyName('REFER').AsString;
    while Length(wcodcli)<4 do
          wcodcli:='0' + wcodcli;
    // Cria Reg.detalhe *****************************************
    wquant:=wquant+1;
    Registro:='01';
    Registro:=Registro+Formatar(wcodcli,4);
    Registro:=Registro+Formatar(wncpf,15,true,' ');
    Registro:=Registro+Formatar(wnifp,15,true,' ');
    Registro:=Registro+Formatar(wbair,20,true,' ');
    Registro:=Registro+Formatar(wcida,20,true,' ');
    Registro:=Registro+Formatar(westa,2);
    Registro:=Registro+Formatar(wncep,9,false,' ');
    Registro:=Registro+Formatar(wntel,30,true,' ');
    Registro:=Registro+Formatar(wresp,30,true,' ');
    Registro:=Registro+Formatar(wvend,3);
    Registro:=Registro+Formatar(FloatToStr(Trunc(wlcre*100)),12,false,'0');
    Registro:=Registro+Formatar(wdatimp,10);
    Registro:=Registro+Formatar(wnommae,35,true,' ');
    Registro:=Registro+Formatar(wnompai,35,true,' ');
    Registro:=Registro+Formatar(wdatnas,10);
    Registro:=Registro+Formatar(wnatu,2);
    Registro:=Registro+Formatar(wrota,3);
    Registro:=Registro+Formatar(wpraca,3);
    Registro:=Registro+Formatar(wobsv,40,true,' ');
    Registro:=Registro+Formatar(' ',4);
    Registro:=Registro+Formatar('E',1);
    Registro:=Registro+Formatar(wnome,50,true,' ');
    Registro:=Registro+Formatar(wende,60,true,' ');
    Registro:=Registro+Formatar(' ',21);
    Registro:=Registro+Formatar('C',1);
    Cliremessa.Add(Registro);
    DModRosa.IBQVer_cli.Next;
  end;
  DModRosa.IBQVer_cli.Active:=False;
  // Cria o Trayler *************************
  Registro:='09';
  Registro:=Registro+Formatar(IntToStr(wquant),4,false,'0');
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',100);
  Registro:=Registro+Formatar(' ',110);
  Registro:=Registro+Formatar(wdatini,10);
  Registro:=Registro+Formatar(wdatfin,10);
  Registro:=Registro+Formatar('C',1);
  Cliremessa.Add(Registro);
  // Grava Arquivo Remessa ******************
  Cliremessa.SaveToFile(NomeArquivo);
  Cliremessa.Free;
  showmessage('Arq.Remessa Cliente para filial foi Criado');
end;

procedure TFrmLogin.Button28Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col059').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmFluxo_pag:=TFrmFluxo_Pag.Create(Self);
    FrmFluxo_pag.ShowModal;
    FrmFluxo_pag.release;
  end else
      showmessage('Não Autorizado !!!!');
end;

procedure TFrmLogin.Button29Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col058').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmBaixa_pag:=TFrmBaixa_pag.Create(Self);
    FrmBaixa_pag.ShowModal;
    FrmBaixa_pag.release;
  end else
      showmessage('Não Autorizado !!!!');
end;

procedure TFrmLogin.Button30Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col057').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    FrmLanca_pag:=TFrmLanca_pag.Create(Self);
    FrmLanca_pag.ShowModal;
    FrmLanca_pag.release;
  end else
      showmessage('Não Autorizado !!!!');
end;

procedure TFrmLogin.Button4Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col006').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    if not DModRosa.IBDtsGrupo.Active then
       DModRosa.IBDtsGrupo.Active:=True;
    FrmManutgru:=TFrmManutgru.Create(Self);
    FrmManutgru.ShowModal;
    FrmManutgru.release;
  end else
      showmessage('Não autorizado');
end;

procedure TFrmLogin.Button5Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col007').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    if not DModRosa.IBDtsUnidade.Active then
       DModRosa.IBDtsUnidade.Active:=True;
    FrmManutund:=TFrmManutund.Create(Self);
    FrmManutund.ShowModal;
    FrmManutund.release;
  end else
     showmessage('Não autorizado !!!');
end;

procedure TFrmLogin.Button6Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col008').AsString='X' then
  begin
    if not DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=True;
    if not DModRosa.IBDtsRota.Active then
       DModRosa.IBDtsRota.Active:=True;
    FrmManutrot:=TFrmManutrot.Create(Self);
    FrmManutrot.ShowModal;
    FrmManutrot.release;
  end else
     showmessage('Não Autorizado !!!');
end;

procedure TFrmLogin.Button7Click(Sender: TObject);
begin
  if not DModRosa.IBDataBase1.connected then
     DModRosa.IBDatabase1.connected:=True;
  FrmManutcli:=TFrmManutcli.Create(Self);
  FrmManutcli.ShowModal;
  FrmManutcli.release;
end;

procedure TFrmLogin.Button8Click(Sender: TObject);
begin
  if not DModRosa.IBDataBase1.connected then
     DModRosa.IBDatabase1.connected:=True;
  FrmManutven:=TFrmManutven.Create(Self);
  FrmManutven.ShowModal;
  FrmManutven.release;
end;

procedure TFrmLogin.Button9Click(Sender: TObject);
begin
  if not DModRosa.IBDataBase1.connected then
     DModRosa.IBDatabase1.connected:=True;
  FrmManutart:=TFrmManutart.Create(Self);
  FrmManutart.ShowModal;
  FrmManutart.release;
end;

procedure TFrmLogin.Edit1Exit(Sender: TObject);
begin
  if edit1.Text='' then
  begin
    showmessage('Informe Usuario !!!!!');
    edit1.Setfocus;
    exit;
  end;
  if IBQuery1.Active then
     IBQuery1.Active:=False;
  IBQuery1.Sql.Clear;
  IBQuery1.Sql.Add('Select* from ARQLOGIN '+
                   'Where Nome=:nom_digit');
  IBQuery1.ParamByName('nom_digit').AsString:=edit1.Text;
  IBQuery1.Active:=True;
  if IBQuery1.RecordCount=0 then
  begin
    IBQuery1.Close;
    showmessage('Nome não cadastrado');
    edit1.Clear;
    edit1.SetFocus;
    exit;
  end;
  wnome:=IBQuery1.fieldbyName('Nome').AsString;
  wsenha:=IBQuery1.fieldbyName('Senha').AsString;
  edit2.SetFocus;
  exit;
end;

procedure TFrmLogin.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then
  begin
    key:=#0;
    if edit2.Text<>wsenha then
    begin
      messagedlg('Senha não Autorizada',
      mtinformation,[mbok],0);
      edit1.Clear;
      edit2.Clear;
      edit1.SetFocus;
      exit;
    end;
    IBtSenhas.EmptyTable;
    with IBQuery1 do
    begin
      // Monta Cadlogin ***************************************
      wsenhas:=IBQuery1.fieldbyName('Senhas').AsString;
      wcol001:=IBQuery1.fieldbyName('Col001').AsString;
      wcol002:=IBQuery1.fieldbyName('Col002').AsString;
      wcol003:=IBQuery1.fieldbyName('Col003').AsString;
      wcol004:=IBQuery1.fieldbyName('Col004').AsString;
      wcol005:=IBQuery1.fieldbyName('Col005').AsString;
      wcol006:=IBQuery1.fieldbyName('Col006').AsString;
      wcol007:=IBQuery1.fieldbyName('Col007').AsString;
      wcol008:=IBQuery1.fieldbyName('Col008').AsString;
      wcol009:=IBQuery1.fieldbyName('Col009').AsString;
      wcol010:=IBQuery1.fieldbyName('Col010').AsString;
      wcol011:=IBQuery1.fieldbyName('Col011').AsString;
      wcol012:=IBQuery1.fieldbyName('Col012').AsString;
      wcol013:=IBQuery1.fieldbyName('Col013').AsString;
      wcol014:=IBQuery1.fieldbyName('Col014').AsString;
      wcol015:=IBQuery1.fieldbyName('Col015').AsString;
      wcol016:=IBQuery1.fieldbyName('Col016').AsString;
      wcol017:=IBQuery1.fieldbyName('Col017').AsString;
      wcol018:=IBQuery1.fieldbyName('Col018').AsString;
      wcol019:=IBQuery1.fieldbyName('Col019').AsString;
      wcol020:=IBQuery1.fieldbyName('Col020').AsString;
      wcol021:=IBQuery1.fieldbyName('Col021').AsString;
      wcol022:=IBQuery1.fieldbyName('Col022').AsString;
      wcol023:=IBQuery1.fieldbyName('Col023').AsString;
      wcol024:=IBQuery1.fieldbyName('Col024').AsString;
      wcol025:=IBQuery1.fieldbyName('Col025').AsString;
      wcol026:=IBQuery1.fieldbyName('Col026').AsString;
      wcol027:=IBQuery1.fieldbyName('Col027').AsString;
      wcol028:=IBQuery1.fieldbyName('Col028').AsString;
      wcol029:=IBQuery1.fieldbyName('Col029').AsString;
      wcol030:=IBQuery1.fieldbyName('Col030').AsString;
      wcol031:=IBQuery1.fieldbyName('Col031').AsString;
      wcol032:=IBQuery1.fieldbyName('Col032').AsString;
      wcol033:=IBQuery1.fieldbyName('Col033').AsString;
      wcol034:=IBQuery1.fieldbyName('Col034').AsString;
      wcol035:=IBQuery1.fieldbyName('Col035').AsString;
      wcol036:=IBQuery1.fieldbyName('Col036').AsString;
      wcol037:=IBQuery1.fieldbyName('Col037').AsString;
      wcol038:=IBQuery1.fieldbyName('Col038').AsString;
      wcol039:=IBQuery1.fieldbyName('Col039').AsString;
      wcol040:=IBQuery1.fieldbyName('Col040').AsString;
      wcol041:=IBQuery1.fieldbyName('Col041').AsString;
      wcol042:=IBQuery1.fieldbyName('Col042').AsString;
      wcol043:=IBQuery1.fieldbyName('Col043').AsString;
      wcol044:=IBQuery1.fieldbyName('Col044').AsString;
      wcol045:=IBQuery1.fieldbyName('Col045').AsString;
      wcol046:=IBQuery1.fieldbyName('Col046').AsString;
      wcol047:=IBQuery1.fieldbyName('Col047').AsString;
      wcol048:=IBQuery1.fieldbyName('Col048').AsString;
      wcol049:=IBQuery1.fieldbyName('Col049').AsString;
      wcol050:=IBQuery1.fieldbyName('Col050').AsString;
      wcol051:=IBQuery1.fieldbyName('Col051').AsString;
      wcol052:=IBQuery1.fieldbyName('Col052').AsString;
      wcol053:=IBQuery1.fieldbyName('Col053').AsString;
      wcol054:=IBQuery1.fieldbyName('Col054').AsString;
      wcol055:=IBQuery1.fieldbyName('Col055').AsString;
      wcol056:=IBQuery1.fieldbyName('Col056').AsString;
      wcol057:=IBQuery1.fieldbyName('Col057').AsString;
      wcol058:=IBQuery1.fieldbyName('Col058').AsString;
      wcol059:=IBQuery1.fieldbyName('Col059').AsString;
      wcol060:=IBQuery1.fieldbyName('Col060').AsString;
      wcol061:=IBQuery1.fieldbyName('Col061').AsString;
      wcol062:=IBQuery1.fieldbyName('Col062').AsString;
      wcol063:=IBQuery1.fieldbyName('Col063').AsString;
      wcol064:=IBQuery1.fieldbyName('Col064').AsString;
      wcol065:=IBQuery1.fieldbyName('Col065').AsString;
      wcol066:=IBQuery1.fieldbyName('Col066').AsString;
      wcol067:=IBQuery1.fieldbyName('Col067').AsString;
      wcol068:=IBQuery1.fieldbyName('Col068').AsString;
      wcol069:=IBQuery1.fieldbyName('Col069').AsString;
      wcol070:=IBQuery1.fieldbyName('Col070').AsString;
      wcol071:=IBQuery1.fieldbyName('Col071').AsString;
      wcol072:=IBQuery1.fieldbyName('Col072').AsString;
      wcol073:=IBQuery1.fieldbyName('Col073').AsString;
      wcol074:=IBQuery1.fieldbyName('Col074').AsString;
      wcol075:=IBQuery1.fieldbyName('Col075').AsString;
      wcol076:=IBQuery1.fieldbyName('Col076').AsString;
      wcol077:=IBQuery1.fieldbyName('Col077').AsString;
      wcol078:=IBQuery1.fieldbyName('Col078').AsString;
      wcol079:=IBQuery1.fieldbyName('Col079').AsString;
      wcol080:=IBQuery1.fieldbyName('Col080').AsString;
      // ******************************************************
      IBQuery1.Close;
      IBQuery2.Close;
      IBQuery2.Sql.Clear;
      IBQuery2.Sql.Add('Insert Into CADLOGIN ');
      IBQuery2.Sql.Add('(NOME,SENHA,SENHAS,Col001,Col002,Col003,Col004,Col005,'+
                       'Col006,Col007,Col008,Col009,Col010,Col011,Col012,Col013,'+
                       'Col014,Col015,Col016,Col017,Col018,Col019,Col020,Col021,'+
                       'Col022,Col023,Col024,Col025,Col026,Col027,Col028,Col029,'+
                       'Col030,Col031,Col032,Col033,Col034,Col035,Col036,Col037,'+
                       'Col038,Col039,Col040,Col041,Col042,Col043,Col044,Col045,'+
                       'Col046,Col047,Col048,Col049,Col050,Col051,Col052,Col053,'+
                       'Col054,Col055,Col056,Col057,Col058,Col059,Col060,Col061,'+
                       'Col062,Col063,Col064,Col065,Col066,Col067,Col068,Col069,'+
                       'Col070,Col071,Col072,Col073,Col074,Col075,Col076,Col077,'+
                       'Col078,Col079,Col080,Datxi,Datxl) '+
                'Values(:NOME,:SENHA,:SENHAS,:Col001,:Col002,:Col003,:Col004,:Col005,'+
                       ':Col006,:Col007,:Col008,:Col009,:Col010,:Col011,:Col012,:Col013,'+
                       ':Col014,:Col015,:Col016,:Col017,:Col018,:Col019,:Col020,:Col021,'+
                       ':Col022,:Col023,:Col024,:Col025,:Col026,:Col027,:Col028,:Col029,'+
                       ':Col030,:Col031,:Col032,:Col033,:Col034,:Col035,:Col036,:Col037,'+
                       ':Col038,:Col039,:Col040,:Col041,:Col042,:Col043,:Col044,:Col045,'+
                       ':Col046,:Col047,:Col048,:Col049,:Col050,:Col051,:Col052,:Col053,'+
                       ':Col054,:Col055,:Col056,:Col057,:Col058,:Col059,:Col060,:Col061,'+
                       ':Col062,:Col063,:Col064,:Col065,:Col066,:Col067,:Col068,:Col069,'+
                       ':Col070,:Col071,:Col072,:Col073,:Col074,:Col075,:Col076,:Col077,'+
                       ':Col078,:Col079,:Col080,:Datxi,:Datxl)');
      IBQuery2.ParamByName('NOME').AsString:=edit1.Text;
      IBQuery2.ParamByName('SENHA').AsString:=edit2.Text;
      IBQuery2.ParamByName('SENHAS').AsString:=wsenhas;
      IBQuery2.ParamByName('Col001').AsString:=wcol001;
      IBQuery2.ParamByName('Col002').AsString:=wcol002;
      IBQuery2.ParamByName('Col003').AsString:=wcol003;
      IBQuery2.ParamByName('Col004').AsString:=wcol004;
      IBQuery2.ParamByName('Col005').AsString:=wcol005;
      IBQuery2.ParamByName('Col006').AsString:=wcol006;
      IBQuery2.ParamByName('Col007').AsString:=wcol007;
      IBQuery2.ParamByName('Col008').AsString:=wcol008;
      IBQuery2.ParamByName('Col009').AsString:=wcol009;
      IBQuery2.ParamByName('Col010').AsString:=wcol010;
      IBQuery2.ParamByName('Col011').AsString:=wcol011;
      IBQuery2.ParamByName('Col012').AsString:=wcol012;
      IBQuery2.ParamByName('Col013').AsString:=wcol013;
      IBQuery2.ParamByName('Col014').AsString:=wcol014;
      IBQuery2.ParamByName('Col015').AsString:=wcol015;
      IBQuery2.ParamByName('Col016').AsString:=wcol016;
      IBQuery2.ParamByName('Col017').AsString:=wcol017;
      IBQuery2.ParamByName('Col018').AsString:=wcol018;
      IBQuery2.ParamByName('Col019').AsString:=wcol019;
      IBQuery2.ParamByName('Col020').AsString:=wcol020;
      IBQuery2.ParamByName('Col021').AsString:=wcol021;
      IBQuery2.ParamByName('Col022').AsString:=wcol022;
      IBQuery2.ParamByName('Col023').AsString:=wcol023;
      IBQuery2.ParamByName('Col024').AsString:=wcol024;
      IBQuery2.ParamByName('Col025').AsString:=wcol025;
      IBQuery2.ParamByName('Col026').AsString:=wcol026;
      IBQuery2.ParamByName('Col027').AsString:=wcol027;
      IBQuery2.ParamByName('Col028').AsString:=wcol028;
      IBQuery2.ParamByName('Col029').AsString:=wcol029;
      IBQuery2.ParamByName('Col030').AsString:=wcol030;
      IBQuery2.ParamByName('Col031').AsString:=wcol031;
      IBQuery2.ParamByName('Col032').AsString:=wcol032;
      IBQuery2.ParamByName('Col033').AsString:=wcol033;
      IBQuery2.ParamByName('Col034').AsString:=wcol034;
      IBQuery2.ParamByName('Col035').AsString:=wcol035;
      IBQuery2.ParamByName('Col036').AsString:=wcol036;
      IBQuery2.ParamByName('Col037').AsString:=wcol037;
      IBQuery2.ParamByName('Col038').AsString:=wcol038;
      IBQuery2.ParamByName('Col039').AsString:=wcol039;
      IBQuery2.ParamByName('Col040').AsString:=wcol040;
      IBQuery2.ParamByName('Col041').AsString:=wcol041;
      IBQuery2.ParamByName('Col042').AsString:=wcol042;
      IBQuery2.ParamByName('Col043').AsString:=wcol043;
      IBQuery2.ParamByName('Col044').AsString:=wcol044;
      IBQuery2.ParamByName('Col045').AsString:=wcol045;
      IBQuery2.ParamByName('Col046').AsString:=wcol046;
      IBQuery2.ParamByName('Col047').AsString:=wcol047;
      IBQuery2.ParamByName('Col048').AsString:=wcol048;
      IBQuery2.ParamByName('Col049').AsString:=wcol049;
      IBQuery2.ParamByName('Col050').AsString:=wcol050;
      IBQuery2.ParamByName('Col051').AsString:=wcol051;
      IBQuery2.ParamByName('Col052').AsString:=wcol052;
      IBQuery2.ParamByName('Col053').AsString:=wcol053;
      IBQuery2.ParamByName('Col054').AsString:=wcol054;
      IBQuery2.ParamByName('Col055').AsString:=wcol055;
      IBQuery2.ParamByName('Col056').AsString:=wcol056;
      IBQuery2.ParamByName('Col057').AsString:=wcol057;
      IBQuery2.ParamByName('Col058').AsString:=wcol058;
      IBQuery2.ParamByName('Col059').AsString:=wcol059;
      IBQuery2.ParamByName('Col060').AsString:=wcol060;
      IBQuery2.ParamByName('Col061').AsString:=wcol061;
      IBQuery2.ParamByName('Col062').AsString:=wcol062;
      IBQuery2.ParamByName('Col063').AsString:=wcol063;
      IBQuery2.ParamByName('Col064').AsString:=wcol064;
      IBQuery2.ParamByName('Col065').AsString:=wcol065;
      IBQuery2.ParamByName('Col066').AsString:=wcol066;
      IBQuery2.ParamByName('Col067').AsString:=wcol067;
      IBQuery2.ParamByName('Col068').AsString:=wcol068;
      IBQuery2.ParamByName('Col069').AsString:=wcol069;
      IBQuery2.ParamByName('Col070').AsString:=wcol070;
      IBQuery2.ParamByName('Col071').AsString:=wcol071;
      IBQuery2.ParamByName('Col072').AsString:=wcol072;
      IBQuery2.ParamByName('Col073').AsString:=wcol073;
      IBQuery2.ParamByName('Col074').AsString:=wcol074;
      IBQuery2.ParamByName('Col075').AsString:=wcol075;
      IBQuery2.ParamByName('Col076').AsString:=wcol076;
      IBQuery2.ParamByName('Col077').AsString:=wcol077;
      IBQuery2.ParamByName('Col078').AsString:=wcol078;
      IBQuery2.ParamByName('Col079').AsString:=wcol079;
      IBQuery2.ParamByName('Col080').AsString:=wcol080;
      IBQuery2.ParamByName('Datxi').AsString:=wdatxi;
      IBQuery2.ParamByName('Datxl').AsString:=wdatxl;
      IBQuery2.ExecSql;
    end;
    IBQuery2.Close;
    if Date()>StrToDate(wdatxi) then
       showmessage('Validade DATABASE not found'+chr(13)+
                   'recommend new configuration !');
    if Date()>StrToDate(wdatxl) then
    begin
      showmessage('Corruption in DATABASE'+chr(13)+
                  'recommend new configuration !');
      edit1.Clear;
      edit1.SetFocus;
      exit;
    end;
    GroupBox2.Visible:=True;
    GroupBox3.Visible:=True;
    GroupBox4.Visible:=True;
    GroupBox5.Visible:=True;
    GroupBox6.Visible:=True;
    GroupBox7.Visible:=True;
    GroupBox8.Visible:=True;
  end;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GroupBox2.Visible:=False;
  GroupBox3.Visible:=False;
  GroupBox4.Visible:=False;
  GroupBox5.Visible:=False;
  GroupBox6.Visible:=False;
  GroupBox7.Visible:=False;
  GroupBox8.Visible:=False;
  if DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=False;
  if DModRosa.IBDatabase2.Connected then
     DModRosa.IBDatabase2.Connected:=False;
  Application.Terminate;
end;

procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se foi Pressionadao o Enter ou seta para Baixo
   // Muda o foco para o proximo componente
   if (Key = VK_RETURN) or (Key = VK_DOWN) then
   begin
      Perform(WM_NEXTDLGCTL,0,0);
      Key := 0;
   end else
      // SE Foi pressionada seta para cima
      // Muda foco para o componente anterior
      if Key = VK_UP then
      begin
         Perform(WM_NEXTDLGCTL,1,0);
         Key := 0;
      end;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
  if not DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=true;
  if not DModRosa.IBDatabase2.Connected then
     DModRosa.IBDatabase2.Connected:=True;
  if not DModRosa.IBTransaction2.Active then
     DModRosa.IBTransaction2.Active:=true;
  if IBQuery1.Active then
     IBQuery1.Active:=False;
  IBQuery1.Sql.Clear;
  IBQuery1.Sql.Add('Select * from ARQLOGIN '+
                   'Where Nome=:nom_digit');
  IBQuery1.ParamByName('nom_digit').AsString:='SEARCH';
  IBQuery1.Active:=True;
  if IBQuery1.RecordCount=0 then
  begin
    IBQuery1.Close;
    showmessage('O Sistema não esta credenciado !!!!!');
    if DModRosa.IBDatabase1.Connected then
       DModRosa.IBDatabase1.Connected:=False;
    Application.Terminate;
  end;
  wdatxi:=IBQuery1.fieldbyName('Datxi').AsString;
  wdatxl:=IBQuery1.fieldbyName('Datxl').AsString;
  IBQuery1.Close;
  edit2.Clear;
  edit1.Clear;
  edit1.SetFocus;
  exit;
end;

end.
