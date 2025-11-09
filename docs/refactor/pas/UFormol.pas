unit UFormol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, Data.DB;

type
  TFrmCompras = class(TForm)
    Label16: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExisteForm(pForm: TForm): Boolean;
  end;

var
  FrmCompras: TFrmCompras;
  xcodcli,wsitu: string;
implementation

{$R *.dfm}

uses UDModRosa;

function TFrmCompras.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCompras.FormKeyDown(Sender: TObject; var Key: Word;
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

end.
