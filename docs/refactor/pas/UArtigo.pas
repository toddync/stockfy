unit UArtigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Data.DB;

type
  TFrmArtigo = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit3: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit11: TEdit;
    Label13: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    function ExisteForm(pForm: TForm): Boolean;
    procedure Gera_cod;
    function Repetir(N:Integer; Caractere: Char): string;
  public
    { Public declarations }
  end;

var
  FrmArtigo: TFrmArtigo;
  wudata,wopcao: String;
  Cont_lin,Max_lin,Pagina,Coluna,Tamanho,Linha: Integer;
  wtotal: Extended;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmArtigo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmArtigo.FormKeyDown(Sender: TObject; var Key: Word;
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

function TFrmArtigo.Repetir(N: Integer; Caractere: Char): string;
var
  I: Integer;
begin
   Result := '';
   for I:= 1 to N do
     Result := Result + Caractere;
end;

procedure TFrmArtigo.Button1Click(Sender: TObject);
begin
  if (edit6.text='Implantar') and (edit1.Text<>'') then
  begin
    if DModRosa.IBQVer_art.Active then
       DModRosa.IBQVer_art.Active:=False;
    DModRosa.IBQVer_art.Sql.Clear;
    DModRosa.IBQVer_art.Sql.Add('Insert Into ARTIGO ');
    DModRosa.IBQVer_art.Sql.Add('(CODIGO,GRUPO,DESCRICAO,CUSTO,VENDA,ESTOQ,'+
                                 'UDATA,TABEL,PRECOM,PREVIP) '+
                         'Values(:CODIGO,:GRUPO,:DESCRICAO,:CUSTO,:VENDA,:ESTOQ,'+
                                ':UDATA,:TABEL,:PRECOM,:PREVIP)');
    DModRosa.IBQVer_art.ParamByName('CODIGO').AsString:=edit1.Text;
    DModRosa.IBQVer_art.ParamByName('GRUPO').AsString:=edit4.Text;
    DModRosa.IBQVer_art.ParamByName('DESCRICAO').AsString:=edit2.Text;
    DModRosa.IBQVer_art.ParamByName('CUSTO').AsFloat:=StrToFloat(edit8.text);
    DModRosa.IBQVer_art.ParamByName('VENDA').AsFloat:=StrToFloat(edit9.text);
    DModRosa.IBQVer_art.ParamByName('ESTOQ').AsFloat:=StrToFloat(edit3.text);
    DModRosa.IBQVer_art.ParamByName('UDATA').AsString:=wudata;
    DModRosa.IBQVer_art.ParamByName('TABEL').AsString:=edit10.text;
    DModRosa.IBQVer_art.ParamByNamE('PRECOM').AsFloat:=StrToFloat(edit7.Text);
    DModRosa.IBQVer_art.ParamByNamE('PREVIP').AsFloat:=StrToFloat(edit11.Text);
    DModRosa.IBQVer_art.ExecSql;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_art.Close;
  end;
  if (edit6.text='Alterar') and (edit1.Text<>'') then
  begin
    DModRosa.IBQVer_art.Close;
    DModRosa.IBQVer_art.Sql.Clear;
    DModRosa.IBQVer_art.SqL.Add('Update ARTIGO ');
    DModRosa.IBQVer_art.Sql.Add('Set DESCRICAO=:DESCRICAO,'+
                                    'CUSTO=:CUSTO,'+
                                    'VENDA=:VENDA,'+
                                    'PRECOM=:PRECOM,'+
                                    'PREVIP=:PREVIP,'+
                                    'ESTOQ=:ESTOQ,'+
                                    'UDATA=:UDATA,'+
                                    'TABEL=:TABEL '+
                                    'Where CODIGO=:CODIGO');
    DModRosa.IBQVer_art.ParamByName('CODIGO').AsString:=edit1.Text;
    DModRosa.IBQVer_art.ParamByName('DESCRICAO').AsString:=edit2.Text;
    DModRosa.IBQVer_art.ParamByName('CUSTO').AsFloat:=StrToFloat(edit8.Text);
    DModRosa.IBQVer_art.ParamByName('VENDA').AsFloat:=StrToFloat(edit9.Text);
    DModRosa.IBQVer_art.ParamByName('PRECOM').AsFloat:=StrToFloat(edit7.Text);
    DModRosa.IBQVer_art.ParamByNamE('PREVIP').AsFloat:=StrToFloat(edit11.Text);
    DModRosa.IBQVer_art.ParamByName('ESTOQ').AsFloat:=StrToFloat(edit3.Text);
    DModRosa.IBQVer_art.ParamByName('UDATA').AsString:=wudata;
    DModRosa.IBQVer_art.ParamByName('TABEL').AsString:=edit10.text;
    DModRosa.IBQVer_art.ExecSql;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_art.Close;
  end;
  if (edit6.text='Excluir') and (edit1.Text<>'') then
  begin
    if MessageDlg('Confirma a Exclusao do Artigo ?',
       mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      DModRosa.IBQVer_art.Active:=False;
      DModRosa.IBQVer_art.Sql.Clear;
      DModRosa.IBQVer_art.SqL.Add('Delete from ARTIGO '+
                                  'Where Codigo=:cod_digit');
      DModRosa.IBQVer_art.ParamByName('cod_digit').AsString:=edit1.Text;
      DModRosa.IBQVer_art.Active:=True;
      DModRosa.IBQVer_art.Active:=false;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_art.Close;
    end;
  end;
  Button2Click(Sender);
end;

procedure TFrmArtigo.Button2Click(Sender: TObject);
begin
  wudata:='';
  wtotal:=0;
  edit1.Clear;
  edit2.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit3.Text:='S';
  edit8.Clear;
  edit9.Clear;
  edit3.Clear;
  edit7.Clear;
  edit11.Clear;
  Modalresult:=-1;
end;

procedure TFrmArtigo.DBGrid1DblClick(Sender: TObject);
begin
  edit4.Text:=DModRosa.IBQPesq_gru.fields.fields[0].AsString;
  edit4.SetFocus;
end;

procedure TFrmArtigo.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) or (ActiveControl=Button2) then
     exit;
  if edit1.Text<>'' then
  begin
    DModRosa.IBQLer_art.Close;
    DModRosa.IBQLer_art.SQL.Clear;
    DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                'Where Codigo=:cod_digit');
    DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=edit1.Text;
    DModRosa.IBQLer_art.OPen;
    if DModRosa.IBQLer_art.RecordCount>0 then
    begin
      edit2.Text:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
      edit3.Text:=FormatFloat('####0',DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat);
      edit8.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat);
      edit9.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Venda').ASFloat);
      edit7.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Precom').ASFloat);
      edit11.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Previp').ASFloat);
      edit10.Text:=DModRosa.IBQLer_art.fieldbyName('Tabel').AsString;
      wudata:=DModRosa.IBQLer_art.fieldbyName('Udata').AsString;
      DModRosa.IBQLer_art.Close;
      if edit6.Text='Alterar' then
      begin
        edit2.SetFocus;
        exit;
      end;
      if edit6.Text='Consultar' then
      begin
        Button1.SetFocus;
        exit;
      end;
      if edit6.Text='Excluir' then
      begin
        Button1.SetFocus;
        exit;
      end;
    end;
    if edit6.Text='Implantar' then
    begin
      DModRosa.IBQLer_art.Close;
      edit2.SetFocus;
      exit;
    end;
  end else
  begin
    ShowMessage(' Identifique o Artigo');
    edit1.SetFocus;
  end;

end;

procedure TFrmArtigo.Edit4Exit(Sender: TObject);
begin
  if (ActiveControl=DBGrid1) or
     (ActiveControl=Button2) then
     exit;
  if DModRosa.IBQLer_gru.Active=True then
     DModRosa.IBQLer_gru.Active:=False;
  DModRosa.IBQLer_gru.Sql.Clear;
  DModRosa.IBQLer_gru.Sql.Add('Select * from GRUPO '+
                               'Where Codigo=:grup_digit');
  DModRosa.IBQLer_gru.ParamByName('grup_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_gru.Active:=True;
  if DModRosa.IBQLer_gru.RecordCount>0 then
  begin
    edit5.Text:=DModRosa.IBQLer_gru.fieldbyName('Descricao').AsString;
    DModRosa.IBQLer_gru.Close;
    if edit6.text='Implantar' then
       Gera_cod;
    edit1.SetFocus;
    exit;
  end else
  begin
    DModRosa.IBQLer_gru.Close;
    showmessage('Grupo nao cadastrado !!!!1');
    Button2Click(Sender);
  end;
end;

function TFrmArtigo.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmArtigo.FormShow(Sender: TObject);
begin
  wudata:='';
  wtotal:=0;
  edit2.Clear;
  edit10.Text:='S';
  edit8.Clear;
  edit9.Clear;
  edit7.Clear;
  edit3.Clear;
  edit11.Clear;
  if DModRosa.IBQPesq_gru.Active=True then
     DModRosa.IBQPesq_gru.Active:=False;
  DModRosa.IBQPesq_gru.Sql.Clear;
  DModRosa.IBQPesq_gru.Sql.Add('Select * from GRUPO '+
                               'Order by Descricao');
  DModRosa.IBQPesq_gru.Active:=True;
  edit4.SetFocus;
end;

procedure TfrmArtigo.Gera_cod;
var
  Codigo: Integer;
begin
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Where Grupo=:gru_digit '+
                              'Order By Descricao,Codigo');
  DModRosa.IBQLer_art.ParamByName('gru_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount=0 then
     Codigo:=StrToInt(edit4.Text+'00')
  else
  begin
    DModRosa.IBQLer_art.Last;
    Codigo:=StrToInt(DModRosa.IBQLer_art.fieldbyName('Codigo').AsString);
  end;
  DModRosa.IBQLer_art.Close;
  Codigo:=Codigo+1;
  edit1.Text:=IntToStr(Codigo);
  // Preencher a chave com zeros a esquerda
  While Length(edit1.Text)<4 do
        edit1.Text := '0'+ edit1.Text;
end;

end.
