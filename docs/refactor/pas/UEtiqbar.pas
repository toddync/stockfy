unit UEtiqbar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBQuery, Data.DB,
  IBX.IBCustomDataSet, IBX.IBTable, frxClass, frxDBSet, frxBarcode,
  IBX.IBDatabase;

type
  TFrmEtiqbar = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    frxRVEtiqbar: TfrxReport;
    frxDSEtiqbar: TfrxDBDataset;
    IBTEtiqbar: TIBTable;
    IBQEtiqbar: TIBQuery;
    IBTEtiqbarCODETIQ: TIBStringField;
    IBTEtiqbarCODCLI: TIBStringField;
    IBTEtiqbarNOMCLI: TIBStringField;
    IBTEtiqbarSOBNOM: TIBStringField;
    IBTEtiqbarBAIRRO: TIBStringField;
    IBTEtiqbarCODVEN: TIBStringField;
    IBTEtiqbarNOMVEN: TIBStringField;
    IBQEtiqbarCODETIQ: TIBStringField;
    IBQEtiqbarCODCLI: TIBStringField;
    IBQEtiqbarNOMCLI: TIBStringField;
    IBQEtiqbarSOBNOM: TIBStringField;
    IBQEtiqbarBAIRRO: TIBStringField;
    IBQEtiqbarCODVEN: TIBStringField;
    IBQEtiqbarNOMVEN: TIBStringField;
    DTSEtiqbqr: TDataSource;
    Edit3: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    IBTransa1: TIBTransaction;
    IBDataba1: TIBDatabase;
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEtiqbar: TFrmEtiqbar;
  wtamanho,zquant: string;
  wquant,xquant: Extended;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmEtiqbar.ComboBox1Exit(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
     wtamanho:='P '
  else
     if Combobox1.ItemIndex=1 then
        wtamanho:='M '
     else
        if ComboBox1.ItemIndex=2 then
           wtamanho:='G '
        else
           if Combobox1.ItemIndex=3 then
              wtamanho:='GG'
           else
           begin
              showmessage('Tamanho errado  !!!!');
              comboBox1.ItemIndex:=-1;
              Combobox1.SetFocus;
              exit;
           end;
  edit4.SetFocus;
  exit;
end;

procedure TFrmEtiqbar.Edit1Exit(Sender: TObject);
begin
  wtamanho:='';
  wquant:=0;
  edit2.Clear;
  edit4.Text:=FormatFloat('###0',0);
  ComboBox1.ItemIndex:=-1;
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Where Codigo=:cod_digit');
  DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=edit1.Text;
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount=0 then
  begin
    showmessage('Artigo não cadastrado  !!!!!!!');
    DModRosa.IBQLer_art.Close;
    edit1.Clear;
    edit1.SetFocus;
    exit;
  end;
  edit2.Text:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
  DModRosa.IBQLer_art.Close;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmEtiqbar.Edit4Exit(Sender: TObject);
begin
  xquant:=0;
  wquant:=StrToFloat(edit4.text);
  if wquant=0 then
  begin
    showmessage('Quantidade zerada ?????');
    edit1.Clear;
    edit2.Clear;
    edit3.Clear;
    edit4.Clear;
    edit5.Clear;
    edit6.Clear;
    ComboBox1.ItemIndex:=-1;
    Modalresult:=-1;
    exit;
  end;
end;

procedure TFrmEtiqbar.Edit6Exit(Sender: TObject);
begin
  IBTEtiqbar.EmptyTable;
  While wquant>xquant do
  begin
    xquant:=xquant+1;
    zquant:=FloatToStr(xquant);

     // Monta auxiliar ********************************
    if IBQEtiqbar.Active then
      IBQEtiqbar.Active:=False;
    IBQEtiqbar.Sql.Clear;
    IBQEtiqbar.Sql.Add('Insert Into AUXETIQUETA ');
    IBQEtiqbar.Sql.Add('(CODETIQ,CODCLI,NOMCLI,SOBNOM,BAIRRO,CODVEN,NOMVEN) '+
                'Values(:CODETIQ,:CODCLI,:NOMCLI,:SOBNOM,:BAIRRO,:CODVEN,:NOMVEN)');
    IBQEtiqbar.ParamByName('CODETIQ').AsString:=zquant;
    IBQEtiqbar.ParamByName('CODCLI').AsString:=edit1.Text;
    IBQEtiqbar.ParamByName('NOMCLI').AsString:=edit3.text;
    IBQEtiqbar.ParamByName('SOBNOM').AsString:=edit5.text;
    IBQEtiqbar.ParamByName('BAIRRO').AsString:=edit6.text;
    IBQEtiqbar.ParamByName('CODVEN').AsString:=wtamanho;
    IBQEtiqbar.ParamByName('NOMVEN').AsString:=' ';
    IBQEtiqbar.ExecSql;
    IBQEtiqbar.Close;
  end;
  IBQEtiqbar.Close;
  IBQEtiqbar.SQL.Clear;
  IBQEtiqbar.SQL.Add('Select * from AUXETIQUETA '+
                     'Order by CODETIQ');
  IBQEtiqbar.OPen;
  IBQEtiqbar.Close;
  frxRVEtiqbar.ShowReport;
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  ComboBox1.ItemIndex:=-1;
  Modalresult:=-1;
  exit;
end;

procedure TFrmEtiqbar.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmEtiqbar.FormShow(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  ComboBox1.ItemIndex:=-1;
  edit1.SetFocus;
  exit;
end;

end.
