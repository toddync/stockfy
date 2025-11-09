unit UManutrot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TFrmManutrot = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    GroupBox2: TGroupBox;
    edCod: TDBEdit;
    edVend: TDBEdit;
    edNome: TDBEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutrot: TFrmManutrot;
  wopera: string;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmManutrot.Button1Click(Sender: TObject);
begin
  wopera:='I';
  DModRosa.IBDtsRota.Insert;
  edCod.SetFocus;
  exit;
end;

procedure TFrmManutrot.Button2Click(Sender: TObject);
begin
  wopera:='A';
  DModRosa.IBDtsRota.Edit;
  edCod.SetFocus;
  exit;
end;

procedure TFrmManutrot.Button3Click(Sender: TObject);
begin
  wopera:='E';
  DModRosa.IBDtsRota.Edit;
end;

procedure TFrmManutrot.Button4Click(Sender: TObject);
begin
  if wopera='' then
  begin
    if DModRosa.IBDtsRota.Active then
       DModRosa.IBDtsRota.Active:=False;
    DModRosa.IBDtsRota.Cancel;
    Modalresult:=-1;
  end;
  if wopera='E' then
     DModRosa.IBDtsRota.Delete
  else
     DModRosa.IBDtsRota.Post;
  If DModRosa.IBDtsRota.Active then
     DModRosa.IBDtsRota.Active:=False;
  DModRosa.IBDtsRota.Active:=True;
end;

procedure TFrmManutrot.Button5Click(Sender: TObject);
begin
  DModRosa.IBDtsRota.Active:=False;
  DModRosa.IBDtsRota.Active:=True;
end;

procedure TFrmManutrot.Button6Click(Sender: TObject);
begin
  if DModRosa.IBQPesq_rot.Active then
     DModRosa.IBQPesq_rot.Active:=False;
  DModRosa.IBQPesq_rot.Sql.Clear;
  DModRosa.IBQPesq_rot.Sql.Add('Select * from ROTA '+
                               'Order by Rota,Bair');
  DModRosa.IBQPesq_rot.Active:=True;
  DModRosa.IBQPesq_rot.Close;
 // RvListrota.SetParam('Datdia',DateToStr(Date()));
 // RvListrota.SelectReport('Listrota.rav',True);
 // RvListrota.Execute;
end;

procedure TFrmManutrot.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DModRosa.IBDtsRota.Active then
     DModRosa.IBDtsRota.Active:=False;
  DModRosa.IBDtsRota.Cancel;
  Modalresult:=-1;
end;

procedure TFrmManutrot.FormKeyDown(Sender: TObject; var Key: Word;
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
