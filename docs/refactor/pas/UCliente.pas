unit UCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, Data.DB;

type
  TFrmCliente = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    GroupBox1: TGroupBox;
    Edit10: TEdit;
    Edit11: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    Label26: TLabel;
    Label27: TLabel;
    Edit20: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit14Exit(Sender: TObject);
    procedure Edit14KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit12KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit8Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
    procedure DBGrid5DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ExisteForm(pForm: TForm): Boolean;
  end;

var
  FrmCliente: TFrmCliente;
  xcodcli: string;
  wtamanho: Integer;
implementation

{$R *.dfm}

uses UDModRosa, UAtiva;

procedure TFrmCliente.Button1Click(Sender: TObject);
begin
  if (edit11.Text='Implantar') and (edit2.text>' ') then
  begin
    if DModRosa.IBQVer_cli.Active then
       DModRosa.IBQVer_cli.Active:=False;
    DModRosa.IBQVer_cli.Sql.Clear;
    DModRosa.IBQVer_cli.Sql.Add('Insert Into CLIENTE ');
    DModRosa.IBQVer_cli.Sql.Add('(NCPF,NIFP,ENDE,BAIR,CIDA,ESTA,'+
                                 'NCEP,NTEL,CONTA,VEND,LCRED,DATIMP,NOMMAE,NOMPAI,'+
                                 'DATNASC,NATU,ROTA,PRACA,REFER,OLDCLI,SITU,NOME,ENDE,'+
                                 'HORAIN,HORAFIN,VISITA,ATIVO,ESPED,OBSV) '+
                         'Values(:NCPF,:NIFP,:ENDE,:BAIR,:CIDA,:ESTA,'+
                                 ':NCEP,:NTEL,:CONTA,:VEND,:LCRED,:DATIMP,'+
                                 ':NOMMAE,:NOMPAI,:DATNASC,:NATU,:ROTA,:PRACA,'+
                                 ':REFER,:OLDCLI,:SITU,:NOME,:ENDE,'+
                                 ':HORAIN,:HORAFIN,:VISITA,:ATIVO,:ESPED,:OBSV)');
    DModRosa.IBQVer_cli.ParamByName('NCPF').AsString:=maskedit2.Text;
    DModRosa.IBQVer_cli.ParamByName('NIFP').AsString:=edit10.Text;
    DModRosa.IBQVer_cli.ParamByName('BAIR').AsString:=edit4.Text;
    DModRosa.IBQVer_cli.ParamByName('CIDA').AsString:=edit5.Text;
    DModRosa.IBQVer_cli.ParamByName('ESTA').AsString:=ComboBox1.Text;
    DModRosa.IBQVer_cli.ParamByName('NCEP').AsString:=maskedit1.Text;
    DModRosa.IBQVer_cli.ParamByName('NTEL').AsString:=edit6.Text;
    DModRosa.IBQVer_cli.ParamByNamE('CONTA').AsString:=edit7.Text;
    DModRosa.IBQVer_cli.ParamByName('VEND').AsString:=edit8.Text;
    DModRosa.IBQVer_cli.ParambYnAME('LCRED').AsFloat:=StrToFloat(edit19.Text);
    DModRosa.IBQVer_cli.ParamByName('DATIMP').AsString:=maskedit3.Text;
    DModRosa.IBQVer_cli.ParamByNamE('NOMMAE').AsString:=edit16.Text;
    DModRosa.IBQVer_cli.ParamByName('NOMPAI').AsString:=edit17.Text;
    DModRosa.IBQVer_cli.ParamByName('DATNASC').AsString:=maskedit4.Text;
    DModRosa.IBQVer_cli.ParamByName('NATU').AsString:=ComboBox2.Text;
    DModRosa.IBQVer_cli.ParamByName('ROTA').AsString:=edit12.Text;
    DModRosa.IBQVer_cli.ParamByName('PRACA').AsString:=edit14.Text;
    DModRosa.IBQVer_cli.ParamByName('REFER').AsString:=edit18.Text;
    DModRosa.IBQVer_cli.ParamByName('OLDCLI').AsString:=' ';
    DModRosa.IBQVer_cli.ParamByName('SITU').AsString:=edit20.text;
    DModRosa.IBQVer_cli.ParamByName('NOME').AsString:=edit2.Text;
    DModRosa.IBQVer_cli.ParamByName('ENDE').AsString:=edit3.Text;
    DModRosa.IBQVer_cli.ParamByName('HORAIN').AsString:=maskedit5.Text;
    DModRosa.IBQVer_cli.ParamByName('HORAFIN').AsString:=maskedit6.Text;
    DModRosa.IBQVer_cli.ParamByName('VISITA').AsString:='';
    DModRosa.IBQVer_cli.ParamByName('ATIVO').AsString:='A';
    DModRosa.IBQVer_cli.ParamByName('ESPED').AsString:=ComboBox3.text;
    DModRosa.IBQVer_cli.ParamByName('OBSV').AsString:='';
    DModRosa.IBQVer_cli.ExecSql;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQLer_cli.Close;
    DModRosa.IBQLer_cli.SQL.Clear;
    DModRosa.IBQLer_cli.SQL.Add('Select * from CLIENTE '+
                                 'Order by Idcli');
    DModRosa.IBQLer_cli.OPen;
    DModRosa.IBQLer_cli.Last;
    edit1.Text:=IntToStr(DModRosa.IBQLer_cli.fieldByName('Idcli').AsInteger);
    // Preencher a chave com zeros a esquerda
    While Length(edit1.Text)<edit1.MaxLength do
          edit1.Text := '0'+ edit1.Text;
    showmessage('CONFIRA NUM. DO CLIENTE !!');
    DModRosa.IBQLer_cli.Close;
  end;
  if (edit11.Text='Alterar') and (edit1.Text<>'') then
  begin
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQVer_cli.Sql.Clear;
    DModRosa.IBQVer_cli.SqL.Add('Update CLIENTE ');
    DModRosa.IBQVer_cli.Sql.Add('Set NOME=:NOME,'+
                                'NCPF=:NCPF,'+
                                'NIFP=:NIFP,'+
                                'ENDE=:ENDE,'+
                                'BAIR=:BAIR,'+
                                'CIDA=:CIDA,'+
                                'ESTA=:ESTA,'+
                                'NCEP=:NCEP,'+
                                'NTEL=:NTEL,'+
                                'CONTA=:CONTA,'+
                                'VEND=:VEND,'+
                                'LCRED=:LCRED,'+
                                'DATIMP=:DATIMP,'+
                                'NOMMAE=:NOMMAE,'+
                                'NOMPAI=:NOMPAI,'+
                                'DATNASC=:DATNASC,'+
                                'NATU=:NATU,'+
                                'ROTA=:ROTA,'+
                                'PRACA=:PRACA,'+
                                'REFER=:REFER,'+
                                'SITU=:SITU,'+
                                'HORAIN=:HORAIN,'+
                                'HORAFIN=:HORAFIN,'+
                                'VISITA=:VISITA,'+
                                'ESPED=:ESPED '+
                                'Where IDCLI=:IDCLI');
    DModRosa.IBQVer_cli.ParamByName('NOME').AsString:=edit2.Text;
    DModRosa.IBQVer_cli.ParamByName('NCPF').AsString:=maskedit2.Text;
    DModRosa.IBQVer_cli.ParamByName('NIFP').AsString:=edit10.Text;
    DModRosa.IBQVer_cli.ParamByName('ENDE').AsString:=edit3.Text;
    DModRosa.IBQVer_cli.ParamByName('BAIR').AsString:=edit4.Text;
    DModRosa.IBQVer_cli.ParamByName('CIDA').AsString:=edit5.Text;
    DModRosa.IBQVer_cli.ParamByName('ESTA').AsString:=ComboBox1.Text;
    DModRosa.IBQVer_cli.ParamByName('NCEP').AsString:=maskedit1.Text;
    DModRosa.IBQVer_cli.ParamByName('NTEL').AsString:=edit6.Text;
    DModRosa.IBQVer_cli.ParamByNamE('CONTA').AsString:=edit7.Text;
    DModRosa.IBQVer_cli.ParamByName('VEND').AsString:=edit8.Text;
    DModRosa.IBQVer_cli.ParambYnAME('LCRED').AsFloat:=StrToFloat(edit19.text);
    DModRosa.IBQVer_cli.ParamByName('DATIMP').AsString:=maskedit3.Text;
    DModRosa.IBQVer_cli.ParamByNamE('NOMMAE').AsString:=edit16.Text;
    DModRosa.IBQVer_cli.ParamByName('NOMPAI').AsString:=edit17.Text;
    DModRosa.IBQVer_cli.ParamByName('DATNASC').AsString:=maskedit4.Text;
    DModRosa.IBQVer_cli.ParamByName('NATU').AsString:=ComboBox2.Text;
    DModRosa.IBQVer_cli.ParamByName('ROTA').AsString:=edit12.Text;
    DModRosa.IBQVer_cli.ParamByName('PRACA').AsString:=edit14.Text;
    DModRosa.IBQVer_cli.ParamByName('REFER').AsString:=edit18.Text;
    DModRosa.IBQVer_cli.ParamByName('SITU').AsString:=edit20.text;
    DModRosa.IBQVer_cli.ParamByName('HORAIN').AsString:=maskedit5.Text;
    DModRosa.IBQVer_cli.ParamByName('HORAFIN').AsString:=maskedit6.Text;
    DModRosa.IBQVer_cli.ParamByName('VISITA').AsString:='';
    DModRosa.IBQVer_cli.ParamByName('ESPED').AsString:=Combobox3.text;
    DModRosa.IBQVer_cli.ParamByName('IDCLI').AsInteger:=StrToInt(edit1.Text);
    DModRosa.IBQVer_cli.ExecSql;
    DModRosa.IBTransaction1.CommitRetaining;
    DModRosa.IBQVer_cli.Close;
  end;
  if (edit11.Text='Excluir') and (edit1.Text<>'') then
  begin
    DModRosa.IBQVer_cli.Active:=False;
    DModRosa.IBQVer_cli.Sql.Clear;
    DModRosa.IBQVer_cli.SqL.Add('Delete from CLIENTE '+
                                'Where IDCLI=:cod_digit');
    DModRosa.IBQVer_cli.ParamByName('cod_digit').AsInteger:=StrToInt(edit1.Text);
    DModRosa.IBQVer_cli.Active:=True;
    DModRosa.IBQVer_cli.Active:=false;
    DModRosa.IBTransaction1.Commit;
  end;
  Button2Click(Sender);
end;

procedure TFrmCliente.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.Clear;
  edit12.Clear;
  edit13.Clear;
  edit14.Clear;
  edit15.Clear;
  edit16.Clear;
  edit17.Clear;
  edit18.Clear;
  edit19.Clear;
  edit20.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit3.Text:=DateToStr(Date());
  maskedit4.Clear;
  maskedit5.Clear;
  maskedit6.Clear;
  ComboBox1.ItemIndex:=-1;
  ComboBox2.ItemIndex:=-1;
  DBgrid4.Visible:=False;
  ModalResult:=-1;
  exit;
end;

procedure TFrmCliente.DBGrid1DblClick(Sender: TObject);
begin
  edit12.Text:=DModRosa.IBQPesq_rot.fields.fields[1].AsString;
  DBGrid1.Visible:=false;
  edit12.SetFocus;
  exit;
end;

procedure TFrmCliente.DBGrid2DblClick(Sender: TObject);
begin
  edit8.Text:=DModRosa.IBQPesq_ven.fields.fields[0].AsString;
  DBGrid2.Visible:=false;
  edit8.SetFocus;
end;

procedure TFrmCliente.DBGrid3DblClick(Sender: TObject);
begin
  edit14.Text:=DModRosa.IBQPesq_rot.fields.fields[0].AsString;
  DBGrid3.Visible:=false;
  edit14.SetFocus;
  exit;
end;

procedure TFrmCliente.DBGrid5DblClick(Sender: TObject);
begin
  edit4.Text:=DModRosa.IBQPesq_rot.fields.fields[2].AsString;
  DBGrid5.Visible:=false;
  edit4.SetFocus;
  exit;
end;

procedure TFrmCliente.Edit12Exit(Sender: TObject);
begin
  if edit12.text>'' then
  begin
    while Length(edit12.Text)<edit12.MaxLength do
        edit12.Text := '0' + edit12.Text;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit ');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit14.Text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:=edit12.Text;
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit13.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
end;

procedure TFrmCliente.Edit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F3 then
  begin
    Label27.Caption:='          ROTAS       ';
    DBGrid1.Visible:=true;
    DModRosa.IBQPesq_rot.Close;
    DModRosa.IBQPesq_rot.SQL.Clear;
    DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                                 'Where Rota=:rot_digit '+
                                 'and Bair>:bai_digit '+
                                 'Order by Rota,Bair');
    DModRosa.IBQPesq_rot.ParamByName('rot_digit').AsString:=edit14.text;
    DModRosa.IBQPesq_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQPesq_rot.OPen;
    DBGrid1.SetFocus;
    exit;
  end;
end;

procedure TFrmCliente.Edit14Exit(Sender: TObject);
begin
  if edit14.text>'' then
  begin
    while Length(edit14.Text)<edit14.MaxLength do
        edit14.Text := '0' + edit14.Text;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit14.Text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit15.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
end;

procedure TFrmCliente.Edit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F2 then
  begin
    label27.Caption:='      PRAÇAS      ';
    DBGrid3.Visible:=true;
    DModRosa.IBQPesq_rot.Close;
    DModRosa.IBQPesq_rot.SQL.Clear;
    DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                                 'Where Bair=:bai_digit');
    DModRosa.IBQPesq_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQPesq_rot.OPen;
    DBGrid3.SetFocus;
  end;
end;

procedure TFrmCliente.Edit1Exit(Sender: TObject);
begin
   if edit1.Text<>'' then
  begin
    while Length(edit1.Text)<edit1.MaxLength do
       edit1.Text := '0' + edit1.Text;
    DModRosa.IBQLer_cli.Close;
    DModRosa.IBQLer_cli.SQL.Clear;
    DModRosa.IBQLer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Idcli=:cli_digit');
    DModRosa.IBQLer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(edit1.Text);
    DModRosa.IBQLer_cli.OPen;
    edit2.Text:=DModRosa.IBQLer_cli.fieldbyName('Nome').AsString;
    edit3.Text:=DModRosa.IBQLer_cli.fieldbyName('Ende').AsString;
    edit4.Text:=DModRosa.IBQLer_cli.fieldbyName('Bair').AsString;
    edit5.Text:=DModRosa.IBQLer_cli.fieldbyName('Cida').AsString;
    edit6.Text:=DModRosa.IBQLer_cli.fieldbyName('Ntel').AsString;
    edit7.Text:=DModRosa.IBQLer_cli.fieldbyName('Conta').AsString;
    edit8.Text:=DModRosa.IBQLer_cli.fieldbyName('Vend').AsString;
    edit10.Text:=DModRosa.IBQLer_cli.fieldbyName('Nifp').AsString;
    maskedit1.Text:=DModRosa.IBQLer_cli.fieldbyName('Ncep').AsString;
    maskedit2.Text:=DModRosa.IBQLer_cli.fieldbyName('Ncpf').AsString;
    edit16.Text:=DModRosa.IBQLer_cli.fieldbyName('Nommae').AsString;
    edit17.Text:=DModRosa.IBQLer_cli.fieldbyName('Nompai').AsString;
    maskedit3.Text:=DModRosa.IBQLer_cli.fieldbyName('Datimp').AsString;
    maskedit4.Text:=DModRosa.IBQLer_cli.fieldbyName('Datnasc').AsString;
    ComboBox1.Text:=DModRosa.IBQLer_cli.fieldbyName('Esta').ASString;
    ComboBox2.Text:=DModRosa.IBQLer_cli.fieldbyName('Natu').ASString;
    edit19.Text:=FormatFloat('###,##0.00',DModRosa.IBQLer_cli.fieldbyName('Lcred').AsFloat);
    edit14.Text:=DModRosa.IBQLer_cli.fieldbyName('Praca').AsString;
    edit12.Text:=DModRosa.IBQLer_cli.fieldbyName('Rota').AsString;
    edit18.Text:=DModRosa.IBQLer_cli.fieldbyName('Refer').AsString;
    maskedit5.Text:=DModRosa.IBQLer_cli.fieldbyName('Horain').AsString;
    maskedit6.Text:=DModRosa.IBQLer_cli.fieldbyName('Horafin').AsString;
    edit20.Text:=DModRosa.IBQLer_cli.FieldByName('Situ').AsString;
    ComboBox3.Text:=DModRosa.IBQLer_cli.fieldbyName('Esped').AsString;
    DModRosa.IBQLer_cli.Close;
    // Ler Vendedor ********************************
    DModRosa.IBQLer_ven.Close;
    DModRosa.IBQLer_ven.SQL.Clear;
    DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                                 'Where Codven=:ven_digit');
    DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit8.Text;
    DModRosa.IBQLer_ven.OPen;
    if DModRosa.IBQLer_ven.RecordCount>0 then
       edit9.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_ven.Close;
    // Ler Praca **********************
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit14.text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit15.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    // Ler Rota **********************
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit14.Text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:=edit12.Text;
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit13.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    if edit11.text='Ativa' then
    begin
      FrmAtiva:=TFrmAtiva.Create(Self);
      FrmAtiva.edCli.Text:=edit1.Text;
      FrmAtiva.ShowModal;
      FrmAtiva.release;
    end;
    if edit11.Text='Alterar' then
    begin
      edit2.SetFocus;
      exit;
    end;
    if edit11.Text='Consultar' then
    begin
      Label27.Caption:='      PEDIDOS';
      DBGrid4.Visible:=True;
      DModRosa.IBQPesq_ped.Close;
      DModRosa.IBQPesq_ped.SQL.Clear;
      DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                                   'Where Codcli=:cli_digit '+
                                   'Order by Pedido');
      DModRosa.IBQPesq_ped.ParamByName('cli_digit').AsString:=edit1.Text;
      DModRosa.IBQPesq_ped.OPen;
      Button2.SetFocus;
      exit;
    end;
    if edit11.Text='Excluir' then
    begin
      Button1.SetFocus;
      exit;
    end;
  end else
      ShowMessage('Identifique o Cliente');
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.Clear;
  edit12.Clear;
  edit13.Clear;
  edit14.Clear;
  edit15.Clear;
  edit16.Clear;
  edit17.Clear;
  edit18.Clear;
  edit19.Clear;
  edit20.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit3.Text:=DateToStr(Date());
  maskedit4.Clear;
  maskedit5.Clear;
  maskedit6.Clear;
  ComboBox1.ItemIndex:=-1;
  ComboBox2.ItemIndex:=-1;
  ComboBox3.ItemIndex:=-1;
  DBgrid4.Visible:=False;
  Modalresult:=-1;
  exit;
end;

procedure TFrmCliente.Edit2Exit(Sender: TObject);
begin
  wtamanho:=length(edit2.Text);
  if wtamanho>50 then
  begin
    showmessage('Nome muito grande max=50'+chr(13)+
                'Rebata a informação !!');
    edit2.Clear;
    edit2.SetFocus;
    exit;
  end;
end;

procedure TFrmCliente.Edit3Exit(Sender: TObject);
begin
  wtamanho:=length(edit3.Text);
  if wtamanho>50 then
  begin
    showmessage('Endereço muito grande max=60'+chr(13)+
                'Rebata a informação !!');
    edit3.Clear;
    edit3.SetFocus;
    exit;
  end;
end;

procedure TFrmCliente.Edit4Exit(Sender: TObject);
begin
  if edit4.text>'' then
  begin
    DModRosa.IBQVer_rot.Close;
    DModRosa.IBQVer_rot.SQL.Clear;
    DModRosa.IBQVer_rot.SQL.Add('Select * from ROTA '+
                                 'Where Nome=:nom_digit');
    DModRosa.IBQVer_rot.ParamByName('nom_digit').AsString:=edit4.text;
    DModRosa.IBQVer_rot.OPen;
    if DModRosa.IBQVer_rot.RecordCount=0 then
    begin
      showmessage('Bairro nao encontrado !!!!');
      edit4.Clear;
      edit4.SetFocus;
      exit;
    end;
    edit12.Text:=DModRosa.IBQVer_rot.fieldbyName('Bair').AsString;
    edit13.Text:=DModRosa.IBQVer_rot.fieldbyName('Nome').AsString;
    edit14.Text:=DModRosa.IBQVer_rot.fieldByName('Rota').AsString;
    DModRosa.IBQVer_rot.Close;
    DModRosa.IBQVer_rot.SQL.Clear;
    DModRosa.IBQVer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQVer_rot.ParamByName('rot_digit').AsString:=edit14.text;
    DModRosa.IBQVer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQVer_rot.OPen;
    if DModRosa.IBQVer_rot.RecordCount=0 then
    begin
      showmessage('Praça nao encontrada !!!!');
      edit4.Clear;
      edit12.Clear;
      edit13.Clear;
      edit14.Clear;
      edit4.SetFocus;
      exit;
    end;
    edit15.Text:=DModRosa.IBQVer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQVer_rot.Close;
  end else
  begin
    showmessage('Selecione o bairro  !!');
    label27.Caption:='       BAIRROS   ';
    DBGrid5.Visible:=true;
    DModRosa.IBQPesq_rot.Close;
    DModRosa.IBQPesq_rot.SQL.Clear;
    DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                                 'Order by Rota,Bair');
    DModRosa.IBQPesq_rot.OPen;
    DBGrid5.SetFocus;
    exit;
  end;
end;

procedure TFrmCliente.Edit8Exit(Sender: TObject);
begin
  if edit8.text='' then
  begin
    showmessage('Selecione o Vendedor !!!');
    lABEL27.Caption:='      VENDEDORES      ';
    DBGrid2.Visible:=true;
    DModRosa.IBQPesq_ven.Close;
    DModRosa.IBQPesq_ven.SQL.Clear;
    DModRosa.IBQPesq_ven.SQL.Add('Select * from VENDEDOR '+
                                 'Order by Nome');
    DModRosa.IBQPesq_ven.OPen;
    DBGrid2.SetFocus;
    exit;
  end;
  while Length(edit8.Text)<edit8.MaxLength do
        edit8.Text := '0' + edit8.Text;
  DModRosa.IBQLer_ven.Close;
  DModRosa.IBQLer_ven.SQL.Clear;
  DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Where Codven=:ven_digit');
  DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit8.Text;
  DModRosa.IBQLer_ven.OPen;
  if DModRosa.IBQLer_ven.RecordCount>0 then
     edit9.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
  DModRosa.IBQLer_ven.Close;
  Button1.SetFocus;
  exit;
end;

function TFrmCliente.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCliente.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCliente.FormShow(Sender: TObject);
begin
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.Clear;
  edit12.Clear;
  edit13.Clear;
  edit14.Clear;
  edit15.Clear;
  edit16.Clear;
  edit17.Clear;
  edit18.Clear;
  edit19.Clear;
  edit20.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit3.Text:=DateToStr(Date());
  maskedit4.Clear;
  ComboBox1.ItemIndex:=-1;
  if edit11.text='Implantar' then
  begin
    edit1.Clear;
    edit2.SetFocus;
  end else
      edit1.SetFocus;
end;

end.
