unit UManutven;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmManutven = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button9: TButton;
    Label4: TLabel;
    Label5: TLabel;
    IBQuery1: TIBQuery;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutven: TFrmManutven;
  wmarca: string;
implementation

{$R *.dfm}

uses UDModRosa, UVendedor, URelmapa;

procedure TFrmManutven.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col018').AsString='X' then
  begin
    DModRosa.IBQPesq_ven.Close;
    FrmVendedor:=TFrmVendedor.Create(Self);
    FrmVendedor.edit11.Text:='Implantar';
    FrmVendedor.ShowModal;
    FrmVendedor.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ven.Close;
  DModRosa.IBQPesq_ven.SQL.Clear;
  DModRosa.IBQPesq_ven.SQL.Add('Select * from VENDEDOR '+
                               'Order By Nome,Codven');
  DModRosa.IBQPesq_ven.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutven.Button2Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col019').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ven.fields.fields[0].AsString;
    DModRosa.IBQPesq_ven.Close;
    FrmVendedor:=TFrmVendedor.Create(Self);
    FrmVendedor.Edit1.Text:=wmarca;
    FrmVendedor.edit11.Text:='Alterar';
    FrmVendedor.ShowModal;
    FrmVendedor.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ven.Close;
  DModRosa.IBQPesq_ven.SQL.Clear;
  DModRosa.IBQPesq_ven.SQL.Add('Select * from VENDEDOR '+
                               'Order By Nome,Codven');
  DModRosa.IBQPesq_ven.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutven.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=DBGrid1) or
     (ActiveControl=Button2) then
     exit;
  if edit1.Text='' then
  begin
    showmessage('Informe o elemento de procura');
    ComboBox1.SetFocus;
    exit;
  end;
  // Pesquiza grid *************************
  if DModRosa.IBQPesq_ven.Active=True then
     DModRosa.IBQPesq_ven.Active:=False;
  DModRosa.IBQPesq_ven.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    while Length(edit1.Text)<3 do
          edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_ven.Sql.Add('Select * from VENDEDOR '+
                                 'Where Codven=:cod_digit');
    DModRosa.IBQPesq_ven.ParamByName('cod_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_ven.Active:=True;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    DModRosa.IBQPesq_ven.Sql.Add('Select * from VENDEDOR '+
                                 'Where Nome LIKE '+#39+'%'+edit1.Text+'%'+#39);
    DModRosa.IBQPesq_ven.Active:=True;
  end;
end;

procedure TFrmManutven.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmManutven.FormShow(Sender: TObject);
begin
   if DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=False;
  if DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=False;
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
  if not DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=true;
  // Monta Primeiro Grid ********************
  if DModRosa.IBQPesq_ven.Active then
     DModRosa.IBQPesq_ven.Active:=False;
  DModRosa.IBQPesq_ven.Sql.Clear;
  DModRosa.IBQPesq_ven.Sql.Add('Select * from VENDEDOR '+
                               'Order by Nome,Codven');
  DModRosa.IBQPesq_ven.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

procedure TFrmManutven.Button3Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col020').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ven.fields.fields[0].AsString;
    DModRosa.IBQPesq_ven.Close;
    FrmVendedor:=TFrmVendedor.Create(Self);
    FrmVendedor.Edit1.Text:=wmarca;
    FrmVendedor.edit11.Text:='Consultar';
    FrmVendedor.ShowModal;
    FrmVendedor.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ven.Close;
  DModRosa.IBQPesq_ven.SQL.Clear;
  DModRosa.IBQPesq_ven.SQL.Add('Select * from VENDEDOR '+
                               'Order By Nome,Codven');
  DModRosa.IBQPesq_ven.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

procedure TFrmManutven.Button4Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col020').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ven.fields.fields[0].AsString;
    DModRosa.IBQPesq_ven.Close;
    FrmVendedor:=TFrmVendedor.Create(Self);
    FrmVendedor.Edit1.Text:=wmarca;
    FrmVendedor.edit11.Text:='Excluir';
    FrmVendedor.ShowModal;
    FrmVendedor.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ven.Close;
  DModRosa.IBQPesq_ven.SQL.Clear;
  DModRosa.IBQPesq_ven.SQL.Add('Select * from VENDEDOR '+
                               'Order By Nome,Codven');
  DModRosa.IBQPesq_ven.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutven.Button9Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col021').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ven.fields.fields[0].AsString;
    DModRosa.IBQPesq_ven.Close;
    FrmRelmapa:=TFrmRelmapa.Create(Self);
    FrmRelMapa.Edit1.Text:='X';
    FrmRelmapa.Edit3.Text:=wmarca;
    FrmRelmapa.ShowModal;
    FrmRelmapa.release;
  end else
      showmessage('Não Autorizado !!!!');
  DModRosa.IBQPesq_ven.Close;
  DModRosa.IBQPesq_ven.SQL.Clear;
  DModRosa.IBQPesq_ven.SQL.Add('Select * from VENDEDOR '+
                               'Order By Nome,Codven');
  DModRosa.IBQPesq_ven.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

end.
