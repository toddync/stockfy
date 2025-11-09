unit UAtiva;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmAtiva = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label2: TLabel;
    RichEdit1: TRichEdit;
    Button1: TButton;
    edAtiv: TEdit;
    edCli: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAtiva: TFrmAtiva;

implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmAtiva.Button1Click(Sender: TObject);
begin
  DModRosa.IBQVer_cli.Close;
  DModRosa.IBQVer_cli.Sql.Clear;
  DModRosa.IBQVer_cli.SqL.Add('Update CLIENTE ');
  DModRosa.IBQVer_cli.Sql.Add('Set ATIVO=:ATIVO,'+
                              'OBSV=:OBSV '+
                              'Where IDCLI=:IDCLI');
  DModRosa.IBQVer_cli.ParamByName('ATIVO').AsString:=edAtiv.text;
  DModRosa.IBQVer_cli.ParamByName('OBSV').AsString:=RichEdit1.text;
  DModRosa.IBQVer_cli.ParamByName('IDCLI').AsInteger:=StrToInt(edCli.Text);
  DModRosa.IBQVer_cli.ExecSql;
  DModRosa.IBTransaction1.CommitRetaining;
  DModRosa.IBQVer_cli.Close;
  edit1.Clear;
  edCli.Clear;
  Richedit1.Clear;
  ModalResult:=-1;
  exit;
end;

procedure TFrmAtiva.ComboBox1Exit(Sender: TObject);
begin
  if ComboBox1.Itemindex=1 then
     edAtiv.text:='D'
  else
  begin
    edAtiv.text:='A';
    Richedit1.Clear;
  end;
end;

procedure TFrmAtiva.Edit1Exit(Sender: TObject);
begin
  if edit1.text<' ' then
  begin
    Button1.SetFocus;
    exit;
  end;
  Richedit1.Lines.Add(edit1.Text);
  edit1.text:='';
  edit1.SetFocus;
  exit;
end;

procedure TFrmAtiva.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmAtiva.FormShow(Sender: TObject);
begin
  while Length(edCli.Text)<4 do
        edCli.Text := '0' + edCli.Text;
  DModRosa.IBQLer_cli.Close;
  DModRosa.IBQLer_cli.SQL.Clear;
  DModRosa.IBQLer_cli.SQL.Add('Select * from CLIENTE '+
                              'Where Idcli=:cli_digit');
  DModRosa.IBQLer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(edCli.Text);
  DModRosa.IBQLer_cli.OPen;
  edAtiv.text:=DModRosa.IBQLer_cli.fieldByName('Ativo').AsString;
  RichEdit1.Text:=DModRosa.IBQLer_cli.fieldByName('Obsv').AsString;
  DModRosa.IBQLer_cli.Close;
  ComboBox1.ItemIndex:=0;
  if edAtiv.text='D' then
     ComboBox1.ItemIndex:=1;
  edit1.Clear;
  Combobox1.SetFocus;
  exit;
end;

end.
