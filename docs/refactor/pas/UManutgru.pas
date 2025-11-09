unit UManutgru;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Data.DB;

type
  TFrmManutgru = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    edGrupo: TDBEdit;
    eddescrequip: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure edDescrequipExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutgru: TFrmManutgru;
  wopera,wgrupo,wprod: string;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmManutgru.Button1Click(Sender: TObject);
begin
  wopera:='I';
  DModRosa.IBDtsGrupo.Insert;
  edGrupo.SetFocus;
  exit;
end;

procedure TFrmManutgru.Button2Click(Sender: TObject);
begin
  wopera:='A';
  DModRosa.IBDtsGrupo.Edit;
  edGrupo.SetFocus;
  exit;
end;

procedure TFrmManutgru.Button3Click(Sender: TObject);
begin
  wopera:='E';
  DModRosa.IBDtsGrupo.Edit;
  Button4.SetFocus;
  exit;
end;

procedure TFrmManutgru.Button4Click(Sender: TObject);
begin
  if wopera='' then
  begin
    if DModRosa.IBDtsGrupo.Active then
       DModRosa.IBDtsGrupo.Active:=False;
    DModRosa.IBDtsGrupo.Cancel;
    Modalresult:=-1;
    exit;
  end;
  if wopera='E' then
  begin
    wgrupo:=edGrupo.Text;
    if DModRosa.IBQPesq_art.Active=True then
       DModRosa.IBQPesq_art.Active:=False;
    DModRosa.IBQPesq_art.Sql.Clear;
    DModRosa.IBQPesq_art.Sql.Add('Delete from ARTIGO '+
                                 'Where Grupo=:grup_digit');
    DModRosa.IBQPesq_art.ParamByName('grup_digit').AsString:=wgrupo;
    DModRosa.IBQPesq_art.Active:=True;
    DModRosa.IBQPesq_art.Active:=False;
    DModRosa.IBDtsGrupo.Delete
  end else
     DModRosa.IBDtsGrupo.Post;
  If DModRosa.IBDtsGrupo.Active then
     DModRosa.IBDtsGrupo.Active:=False;
  DModRosa.IBDtsGrupo.Active:=True;
end;

procedure TFrmManutgru.Button5Click(Sender: TObject);
begin
  DModRosa.IBDtsGrupo.Active:=False;
  DModRosa.IBDtsGrupo.Active:=True;
end;

procedure TFrmManutgru.edDescrequipExit(Sender: TObject);
begin
  edit1.Color:=clRed;
  edit1.SetFocus;
  exit;
end;

procedure TFrmManutgru.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DModRosa.IBDtsGrupo.Active then
     DModRosa.IBDtsGrupo.Active:=False;
  DModRosa.IBDtsGrupo.Cancel;
  Modalresult:=-1;
end;

procedure TFrmManutgru.FormKeyDown(Sender: TObject; var Key: Word;
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
