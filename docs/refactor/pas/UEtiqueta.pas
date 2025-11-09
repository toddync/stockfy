unit UEtiqueta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, frxClass,
  frxDBSet, IBX.IBTable, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmetiqueta = class(TForm)
    Label1: TLabel;
    Edit10: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit9: TEdit;
    Label10: TLabel;
    MaskEdit1: TMaskEdit;
    Edit8: TEdit;
    Label11: TLabel;
    Button1: TButton;
    Label12: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frmetiqueta: TFrmetiqueta;
  wcodped,chvprima: string;
  Codigo: Integer;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmetiqueta.Button1Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit9.Clear;
  maskedit1.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmetiqueta.Edit1Exit(Sender: TObject);
begin
   if ActiveControl=Button1 then
     exit;
  if edit1.Text>' ' then
  begin
    // Preencher a chave com zeros a esquerda
     While Length(edit1.Text)<edit1.MaxLength do
        edit1.Text := '0'+ edit1.Text;
    DModRosa.IBQLer_cli.Close;
    DModRosa.IBQLer_cli.SQL.Clear;
    DModRosa.IBQLer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Idcli=:cli_digit');
    DModRosa.IBQLer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(edit1.Text);
    DModRosa.IBQLer_cli.OPen;
    if DModRosa.IBQLer_cli.RecordCount>0 then
    begin
      edit2.Text:=DModRosa.IBQLer_cli.fieldbyName('Nome').AsString;
      edit3.Text:=DModRosa.IBQLer_cli.fieldbyName('Ende').AsString;
      edit4.Text:=DModRosa.IBQLer_cli.fieldbyName('Bair').AsString;
      edit5.Text:=DModRosa.IBQLer_cli.fieldbyName('Cida').AsString;
      edit6.Text:=DModRosa.IBQLer_cli.fieldbyName('Vend').AsString;
      maskedit1.Text:=DModRosa.IBQLer_cli.fieldbyName('Ncep').AsString;
      edit9.text:=DModRosa.IBQLer_cli.fieldbyName('Esta').ASString;
    end else
    begin
      DModRosa.IBQLer_cli.Close;
      showmessage('Cliente não cadastrado');
      Button1Click(Sender);
      exit;
    end;
    if MessageDlg('Confime o cliente!!!!',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      DModRosa.IBQLer_cli.Close;
      DModRosa.IBQLer_ven.Close;
      DModRosa.IBQLer_ven.SQL.Clear;
      DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                                   'Where Codven=:ven_digit');
      DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit6.Text;
      DModRosa.IBQLer_ven.OPen;
      if DModRosa.IBQLer_ven.RecordCount>0 then
      begin
        edit7.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
        DModRosa.IBQLer_ven.Close;
      end else
      begin
        Showmessage('Vendedor não reconhecido !!!!');
        DModRosa.IBQLer_ven.Close;
        Button1Click(Sender);
        exit;
      end;
      if DModRosa.IBQVer_etic.Active then
         DModRosa.IBQVer_etic.Active:=False;
      DModRosa.IBQVer_etic.Sql.Clear;
      DModRosa.IBQVer_etic.Sql.Add('Insert Into ETIQUETA ');
      DModRosa.IBQVer_etic.Sql.Add('(CODCLI,NOMCLI,SOBNOM,BAIRRO,CODVEN,NOMVEN) '+
                           'Values(:CODCLI,:NOMCLI,:SOBNOM,:BAIRRO,:CODVEN,:NOMVEN)');
      DModRosa.IBQVer_etic.ParamByName('CODCLI').AsString:=edit1.Text;
      DModRosa.IBQVer_etic.ParamByName('NOMCLI').AsString:=Copy(edit2.Text,1,20);
      DModRosa.IBQVer_etic.ParamByName('SOBNOM').AsString:=Copy(edit2.Text,21,15);
      DModRosa.IBQVer_etic.ParamByName('BAIRRO').AsString:=edit4.Text;
      DModRosa.IBQVer_etic.ParamByName('CODVEN').AsString:=edit6.Text;
      DModRosa.IBQVer_etic.ParamByName('NOMVEN').AsString:=edit7.text;
      DModRosa.IBQVer_etic.ExecSql;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_etic.Close;
      DModRosa.IBQLer_etic.Close;
      DModRosa.IBQLer_etic.SQL.Clear;
      DModRosa.IBQLer_etic.SQL.Add('Select * from ETIQUETA '+
                                   'Order by Idetiq');
      DModRosa.IBQLer_etic.OPen;
      DModRosa.IBQLer_etic.Last;
      edit8.Text:=IntToStr(DModRosa.IBQLer_etic.fieldByName('Idetiq').AsInteger);
      // Preencher a chave com zeros a esquerda
      While Length(edit8.Text)<edit8.MaxLength do
            edit8.Text := '0'+ edit8.Text;
      showmessage('CONFIRA NUM. DO PEDIDO !!');
      DModRosa.IBQLer_etic.Close;
      edit1.Clear;
      Button1Click(sender);
      exit;
    end;
  end else
  begin
    showmessage('Identifique o Cliente !!!!');
    edit1.SetFocus;
    exit;
  end;
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  maskedit1.Clear;
  edit1.SetFocus;
  exit;
end;

procedure TFrmetiqueta.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmetiqueta.FormShow(Sender: TObject);
begin
  chvprima:='';
  Codigo:=0;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  DModRosa.IBQLer_etic.Close;
  DModRosa.IBQLer_etic.SQL.Clear;
  DModRosa.IBQLer_etic.SQL.Add('Select * from ETIQUETA '+
                                'Order by Idetiq');
  DModRosa.IBQLer_etic.OPen;
  DModRosa.IBQLer_etic.Last;
  edit10.Text:=IntToStr(DModRosa.IBQLer_etic.fieldByName('Idetiq').AsInteger);
  DModRosa.IBQLer_etic.Close;
  // Preencher a chave com zeros a esquerda
  While Length(edit10.Text)<edit10.MaxLength do
        edit10.Text := '0'+ edit10.Text;
  edit1.SetFocus;
  exit;
end;

end.
