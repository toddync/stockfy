unit UManutund;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TFrmManutund = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    GroupBox2: TGroupBox;
    edUnid: TDBEdit;
    edDescrequip: TDBEdit;
    procedure edunidKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutund: TFrmManutund;
  wopera: string;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmManutund.Button1Click(Sender: TObject);
begin
  wopera:='I';
  DModRosa.IBDtsUnidade.Insert;
  edUnid.SetFocus;
  exit;
end;

procedure TFrmManutund.Button2Click(Sender: TObject);
begin
  wopera:='A';
  DModRosa.IBDtsUnidade.Edit;
  edUnid.SetFocus;
  exit;
end;

procedure TFrmManutund.Button3Click(Sender: TObject);
begin
  wopera:='E';
  DModRosa.IBDtsUnidade.Edit;
end;

procedure TFrmManutund.Button4Click(Sender: TObject);
begin
  if wopera<>'' then
  begin
    if wopera='E' then
       DModRosa.IBDtsUnidade.Delete
    else
       DModRosa.IBDtsUnidade.Post;
  end;
  If DModRosa.IBDtsUnidade.Active then
     DModRosa.IBDtsUnidade.Active:=False;
  DModRosa.IBDtsUnidade.Active:=True;
end;

procedure TFrmManutund.Button5Click(Sender: TObject);
begin
  DModRosa.IBDtsUnidade.Active:=False;
  DModRosa.IBDtsUnidade.Active:=True;
end;

procedure TFrmManutund.edunidKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmManutund.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DModRosa.IBDtsUnidade.Active then
     DModRosa.IBDtsUnidade.Active:=False;
  DModRosa.IBDtsUnidade.Cancel;
  Modalresult:=-1;
end;

procedure TFrmManutund.FormKeyDown(Sender: TObject; var Key: Word;
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
