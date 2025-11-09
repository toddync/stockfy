unit UFornec;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, Data.DB;

type
  TFrmFornec = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit11: TEdit;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit7: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit16: TEdit;
    Edit17: TEdit;
    Label5: TLabel;
    ComboBox2: TComboBox;
    MaskEdit4: TMaskEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExisteForm(pForm: TForm): Boolean;
  end;

var
  FrmFornec: TFrmFornec;
  xcodcli,wsitu: string;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmFornec.Button1Click(Sender: TObject);
begin
  if (edit11.Text='Implantar') and (edit2.text>' ') then
  begin
    if DModRosa.IBQVer_for.Active then
       DModRosa.IBQVer_for.Active:=False;
    DModRosa.IBQVer_for.Sql.Clear;
    DModRosa.IBQVer_for.Sql.Add('Insert Into FORNECEDOR ');
    DModRosa.IBQVer_for.Sql.Add('(MARCA,RAZAO,PESSO,NCPF,CNPJ,INSC,ENDE,BAIR,CIDA,ESTA,'+
                                 'NCEP,NTEL,RESP,RTEL,SITU) '+
                         'Values(:MARCA,:RAZAO,:PESSO,:NCPF,:CNPJ,:INSC,:ENDE,:BAIR,:CIDA,:ESTA,'+
                                ':NCEP,:NTEL,:RESP,:RTEL,:SITU)');
    DModRosa.IBQVer_for.ParamByName('MARCA').AsString:=edit1.Text;
    DModRosa.IBQVer_for.ParamByName('RAZAO').AsString:=edit2.Text;
    DModRosa.IBQVer_for.ParamByName('PESSO').AsString:=ComboBox2.text;
    DModRosa.IBQVer_for.ParamByName('NCPF').AsString:=edit7.Text;
    DModRosa.IBQVer_for.ParamByName('CNPJ').AsString:=maskedit4.text;
    DModRosa.IBQVer_for.ParamByName('INSC').AsString:=maskedit2.Text;
    DModRosa.IBQVer_for.ParamByName('ENDE').AsString:=edit3.Text;
    DModRosa.IBQVer_for.ParamByNamE('BAIR').AsString:=edit4.Text;
    DModRosa.IBQVer_for.ParamByName('CIDA').AsString:=edit5.text;
    DModRosa.IBQVer_for.ParamByName('ESTA').AsString:=ComboBox1.text;
    DModRosa.IBQVer_for.ParamByName('NCEP').AsString:=maskedit1.Text;
    DModRosa.IBQVer_for.ParamByName('NTEL').AsString:=edit6.Text;
    DModRosa.IBQVer_for.ParamByNamE('RESP').AsString:=edit16.Text;
    DModRosa.IBQVer_for.ParamByName('RTEL').AsString:=edit17.text;
    DModRosa.IBQVer_for.ParamByName('SITU').AsString:=' ';
    DModRosa.IBQVer_for.ExecSql;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_for.Close;
  end;
  if (edit11.Text='Alterar') and (edit1.Text<>'') then
  begin
    DModRosa.IBQVer_for.Close;
    DModRosa.IBQVer_for.Sql.Clear;
    DModRosa.IBQVer_for.SqL.Add('Update FORNECEDOR ');
    DModRosa.IBQVer_for.Sql.Add('Set RAZAO=:RAZAO,'+
                                'PESSO=:PESSO,'+
                                'NCPF=:NCPF,'+
                                'CNPJ=:CNPJ,'+
                                'INSC=:INSC,'+
                                'ENDE=:ENDE,'+
                                'BAIR=:BAIR,'+
                                'CIDA=:CIDA,'+
                                'ESTA=:ESTA,'+
                                'NCEP=:NCEP,'+
                                'NTEL=:NTEL,'+
                                'RESP=:RESP,'+
                                'RTEL=:RTEL '+
                                'Where MARCA=:MARCA');
    DModRosa.IBQVer_for.ParamByName('RAZAO').AsString:=edit2.Text;
    DModRosa.IBQVer_for.ParamByName('PESSO').AsString:=ComboBox2.text;
    DModRosa.IBQVer_for.ParamByName('NCPF').AsString:=edit7.Text;
    DModRosa.IBQVer_for.ParamByName('CNPJ').AsString:=maskedit4.text;
    DModRosa.IBQVer_for.ParamByName('INSC').AsString:=maskedit2.Text;
    DModRosa.IBQVer_for.ParamByName('ENDE').AsString:=edit3.Text;
    DModRosa.IBQVer_for.ParamByNamE('BAIR').AsString:=edit4.Text;
    DModRosa.IBQVer_for.ParamByName('CIDA').AsString:=edit5.text;
    DModRosa.IBQVer_for.ParamByName('ESTA').AsString:=ComboBox1.text;
    DModRosa.IBQVer_for.ParamByName('NCEP').AsString:=maskedit1.Text;
    DModRosa.IBQVer_for.ParamByName('NTEL').AsString:=edit6.Text;
    DModRosa.IBQVer_for.ParamByNamE('RESP').AsString:=edit16.Text;
    DModRosa.IBQVer_for.ParamByName('RTEL').AsString:=edit17.text;
    DModRosa.IBQVer_for.ParamByName('MARCA').AsString:=edit1.text;
    DModRosa.IBQVer_for.ExecSql;
    DModRosa.IBTransaction1.CommitRetaining;
    DModRosa.IBQVer_for.Close;
  end;
  if (edit11.Text='Excluir') and (edit1.Text<>'') then
  begin
    DModRosa.IBQVer_for.Active:=False;
    DModRosa.IBQVer_for.Sql.Clear;
    DModRosa.IBQVer_for.SqL.Add('Delete from FORNECEDOR '+
                                'Where MARCA=:marc_digit');
    DModRosa.IBQVer_for.ParamByName('marc_digit').AsString:=edit1.Text;
    DModRosa.IBQVer_for.Active:=True;
    DModRosa.IBQVer_for.Active:=false;
    DModRosa.IBTransaction1.Commit;
  end;
  Button2Click(Sender);
  exit;
end;

procedure TFrmFornec.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit16.Clear;
  edit17.Clear;
  DBGrid1.Visible:=False;
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit4.Clear;
  ComboBox1.ItemIndex:=-1;
  ComboBox2.ItemIndex:=0;
  ModalResult:=-1;
  exit;
end;

procedure TFrmFornec.ComboBox2Exit(Sender: TObject);
begin
  if comboBox2.Text='J' then
  begin
    maskedit4.SetFocus;
    exit;
  end;
end;

procedure TFrmFornec.Edit1Exit(Sender: TObject);
begin
  if edit1.Text<>'' then
  begin
    DModRosa.IBQLer_for.Close;
    DModRosa.IBQLer_for.SQL.Clear;
    DModRosa.IBQLer_for.SQL.Add('Select * from FORNECEDOR '+
                                'Where Marca=:marc_digit');
    DModRosa.IBQLer_for.ParamByName('marc_digit').AsString:=edit1.Text;
    DModRosa.IBQLer_for.OPen;
    if DModRosa.IBQLer_for.RecordCount>0 then
    begin
      edit2.Text:=DModRosa.IBQLer_for.fieldbyName('Razao').AsString;
      edit3.Text:=DModRosa.IBQLer_for.fieldbyName('Ende').AsString;
      edit4.Text:=DModRosa.IBQLer_for.fieldbyName('Bair').AsString;
      edit5.Text:=DModRosa.IBQLer_for.fieldbyName('Cida').AsString;
      ComboBox1.Text:=DModRosa.IBQLer_for.fieldbyName('Esta').ASString;
      maskedit1.Text:=DModRosa.IBQLer_for.fieldbyName('Ncep').AsString;
      edit6.Text:=DModRosa.IBQLer_for.fieldbyName('Ntel').AsString;
      ComboBox2.Text:=DModRosa.IBQLer_for.fieldbyName('Pesso').ASString;
      edit7.Text:=DModRosa.IBQLer_for.fieldbyName('Ncpf').AsString;
      maskedit4.Text:=DModRosa.IBQLer_for.fieldbyName('Cnpj').AsString;
      maskedit2.Text:=DModRosa.IBQLer_for.fieldbyName('Insc').AsString;
      edit16.Text:=DModRosa.IBQLer_for.fieldbyName('Resp').AsString;
      edit17.Text:=DModRosa.IBQLer_for.fieldbyName('Rtel').AsString;
      wsitu:=DModRosa.IBQLer_for.fieldbyName('Situ').AsString;
      DModRosa.IBQLer_for.Close;
      if edit11.Text='Alterar' then
      begin
        edit2.SetFocus;
        exit;
      end;
      if edit11.Text='Consultar' then
      begin
        Dbgrid1.Visible:=True;
        DModRosa.IBQPesq_comp.Close;
        DModRosa.IBQPesq_comp.SQL.Clear;
        DModRosa.IBQPesq_comp.SQL.Add('Select * from COMPRA '+
                                     'Where Fornec=:for_digit '+
                                     'Order by Numped,Datped');
        DModRosa.IBQPesq_comp.ParamByName('for_digit').AsString:=edit1.text;
        DModRosa.IBQPesq_comp.OPen;
        Button2.SetFocus;
        exit;
      end;
      if edit11.Text='Excluir' then
      begin
        Button1.SetFocus;
        exit;
      end;
    end;
    if edit11.Text='Implantar' then
    begin
      edit2.SetFocus;
      exit;
    end;
  end else
      ShowMessage('Identifique o Fornecedor');
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit16.Clear;
  edit17.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit4.Clear;
  ComboBox1.ItemIndex:=-1;
  ComboBox2.ItemIndex:=1;
  Modalresult:=-1;
  exit;
end;

procedure TFrmFornec.Edit7Exit(Sender: TObject);
begin
  edit16.SetFocus;
  exit;
end;

function TFrmFornec.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmFornec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmFornec.FormKeyDown(Sender: TObject; var Key: Word;
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


procedure TFrmFornec.FormShow(Sender: TObject);
begin
   edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit16.Clear;
  edit17.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit4.Clear;
  ComboBox1.ItemIndex:=-1;
  ComboBox2.ItemIndex:=1;
  edit1.SetFocus;
  exit;
end;

end.
