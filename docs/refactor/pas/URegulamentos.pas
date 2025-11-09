unit URegulamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Mask, IBX.IBTable, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery,
  Vcl.Imaging.GIFImg, frxClass;

type
  TFrmRegulamentos = class(TForm)
    Label1: TLabel;
    GroupBox4: TGroupBox;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    RvRegnovo: TfrxReport;
    RvDeposito: TfrxReport;
    DBRegula: TfrxUserDataSet;
    DBRegnovo: TfrxUserDataSet;
    DBDeposito: TfrxUserDataSet;
    Button1: TButton;
    Button3: TButton;
    RvFicha: TfrxReport;
    RvFaccao: TfrxReport;
    DBFaccao: TfrxUserDataSet;
    DBFICHA: TfrxUserDataSet;
    RvRegula: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
     sl: TStringList;
  public
    { Public declarations }
    function StrZero(strValor: string;intComprimento: Integer): string;
    function Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
  end;

var
  FrmRegulamentos: TFrmRegulamentos;
  wnome,wsenha,wsenhas,whora,wdata,wcodped,wcodcli: string;
  wcol001,wcol002,wcol003,wcol004,wcol005,wcol006,wcol007,wcol008,wcol009: string;
  wcol010,wcol011,wcol012,wcol013,wcol014,wcol015,wcol016,wcol017,wcol018: string;
  wcol019,wcol020,wcol021,wcol022,wcol023,wcol024,wcol025,wcol026,wcol027: string;
  wcol028,wcol029,wcol030,wcol031,wcol032,wcol033,wcol034,wcol035,wcol036: string;
  wcol037,wcol038,wcol039,wcol040,wcol041,wcol042,wcol043,wcol044,wcol045: string;
  wcol046,wcol047,wcol048,wcol049,wcol050,wcol051,wcol052,wcol053,wcol054: string;
  wcol055,wcol056,wcol057,wcol058,wcol059,wcol060,wcol061,wcol062,wcol063: string;
  wcol064,wcol065,wcol066,wcol067,wcol068,wcol069,wcol070,wcol071,wcol072: string;
  wcol073,wcol074,wcol075,wcol076,wcol077,wcol078,wcol079,wcol080: string;
  wdatxi,wdatxl,wcodven,wmarca,wetiq: string;
implementation

{$R *.dfm}

uses UDModRosa;

function TFrmRegulamentos.Formatar(Texto : string; TamanhoDesejado : integer; AcrescentarADireita : boolean = true; CaracterAcrescentar : char = ' ') : string;
{
   OBJETIVO: Eliminar caracteres inválidos e acrescentar caracteres à esquerda ou à direita do texto original para que a string resultante fique com o tamanho desejado

   Texto : Texto original
   TamanhoDesejado: Tamanho que a string resultante deverá ter
   AcrescentarADireita: Indica se o carácter será acrescentado à direita ou à esquerda
      TRUE - Se o tamanho do texto for MENOR que o desejado, acrescentar carácter à direita
             Se o tamanho do texto form MAIOR que o desejado, eliminar primeiros caracteres do texto
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

function TFrmRegulamentos.StrZero(strValor: string; intComprimento: integer) : string;
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




procedure TFrmRegulamentos.Button1Click(Sender: TObject);
begin
  // Monta resumo final **********************
  sl := TStringList.Create;
  DBFicha.RangeEnd := reCount;
  DBFicha.RangeEndCount := sl.Count;
  RvFicha.ShowReport;
end;

procedure TFrmRegulamentos.Button2Click(Sender: TObject);
begin
  // Monta resumo final **********************
  sl := TStringList.Create;
  DBRegula.RangeEnd := reCount;
  DBRegula.RangeEndCount := sl.Count;
  RvRegula.ShowReport;
end;

procedure TFrmRegulamentos.Button3Click(Sender: TObject);
begin
  // Monta resumo final **********************
  sl := TStringList.Create;
  DBFaccao.RangeEnd := reCount;
  DBFaccao.RangeEndCount := sl.Count;
  RvFaccao.ShowReport;
end;

procedure TFrmRegulamentos.Button4Click(Sender: TObject);
begin
  // Monta resumo final **********************
  sl := TStringList.Create;
  DBRegnovo.RangeEnd := reCount;
  DBRegnovo.RangeEndCount := sl.Count;
  RvRegnovo.ShowReport;
end;

procedure TFrmRegulamentos.Button5Click(Sender: TObject);
begin
  // Monta resumo final **********************
  sl := TStringList.Create;
  DBDeposito.RangeEnd := reCount;
  DBDeposito.RangeEndCount := sl.Count;
  RvDeposito.ShowReport;
end;


procedure TFrmRegulamentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=False;
  if DModRosa.IBDatabase2.Connected then
     DModRosa.IBDatabase2.Connected:=False;
  Application.Terminate;
end;

procedure TFrmRegulamentos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmRegulamentos.FormShow(Sender: TObject);
begin
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
  if not DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=true;
  if not DModRosa.IBDatabase2.Connected then
     DModRosa.IBDatabase2.Connected:=True;
  if not DModRosa.IBTransaction2.Active then
     DModRosa.IBTransaction2.Active:=true;
  Button2.SetFocus;;
  exit;
end;

end.
