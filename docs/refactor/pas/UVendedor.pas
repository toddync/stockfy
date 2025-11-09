unit UVendedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, Data.DB;

type
  TFrmVendedor = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit9: TEdit;
    Edit13: TEdit;
    Edit7: TEdit;
    Edit14: TEdit;
    Edit12: TEdit;
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
    Label20: TLabel;
    Label22: TLabel;
    Label16: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit8: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    MaskEdit3: TMaskEdit;
    Edit18: TEdit;
    Label5: TLabel;
    Label15: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit8Exit(Sender: TObject);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit9KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit16Exit(Sender: TObject);
    procedure Edit16KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Geracodigo;
    function ExisteForm(pForm: TForm): Boolean;
  end;

var
  FrmVendedor: TFrmVendedor;
  wp1,wp2,wp3,wp4: string;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmVendedor.Button1Click(Sender: TObject);
begin
   if (edit11.Text='Implantar') and (edit1.Text<>'') then
  begin
    if DModRosa.IBQVer_ven.Active then
       DModRosa.IBQVer_ven.Active:=False;
    DModRosa.IBQVer_ven.Sql.Clear;
    DModRosa.IBQVer_ven.Sql.Add('Insert Into VENDEDOR ');
    DModRosa.IBQVer_ven.Sql.Add('(CODVEN,NOME,NCPF,NIFP,ENDE,BAIR,CIDA,ESTA,'+
                                 'NCEP,NTEL,PRACA1,PRACA2,PRACA3,PRACA4,EMAIL,'+
                                 'DATSOL,NUMSOL) '+
                         'Values(:CODVEN,:NOME,:NCPF,:NIFP,:ENDE,:BAIR,:CIDA,:ESTA,'+
                                 ':NCEP,:NTEL,:PRACA1,:PRACA2,:PRACA3,:PRACA4,'+
                                 ':EMAIL,:DATSOL,:NUMSOL)');
    DModRosa.IBQVer_ven.ParamByName('CODVEN').AsString:=edit1.Text;
    DModRosa.IBQVer_ven.ParamByName('NOME').AsString:=edit2.Text;
    DModRosa.IBQVer_ven.ParamByName('NCPF').AsString:=maskedit2.Text;
    DModRosa.IBQVer_ven.ParamByName('NIFP').AsString:=edit10.Text;
    DModRosa.IBQVer_ven.ParamByName('ENDE').AsString:=edit3.Text;
    DModRosa.IBQVer_ven.ParamByName('BAIR').AsString:=edit4.Text;
    DModRosa.IBQVer_ven.ParamByName('CIDA').AsString:=edit5.Text;
    DModRosa.IBQVer_ven.ParamByName('ESTA').AsString:=ComboBox1.Text;
    DModRosa.IBQVer_ven.ParamByName('NCEP').AsString:=maskedit1.Text;
    DModRosa.IBQVer_ven.ParamByName('NTEL').AsString:=edit6.Text;
    DModRosa.IBQVer_ven.ParamByName('PRACA1').AsString:=edit7.Text;
    DModRosa.IBQVer_ven.ParamByName('PRACA2').AsString:=edit8.Text;
    DModRosa.IBQVer_ven.ParamByName('PRACA3').AsString:=edit9.text;
    DModRosa.IBQVer_ven.ParamByName('PRACA4').AsString:=edit16.text;
    DModRosa.IBQVer_ven.ParamByName('EMAIL').AsString:=edit12.text;
    DModRosa.IBQVer_ven.ParamByName('DATSOL').AsString:='';
    DModRosa.IBQVer_ven.ParamByName('NUMSOL').AsString:='';
    DModRosa.IBQVer_ven.ExecSql;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_ven.Close;
  end;
  if (edit11.Text='Alterar') and (edit1.Text<>'') then
  begin
    DModRosa.IBQVer_ven.Close;
    DModRosa.IBQVer_ven.Sql.Clear;
    DModRosa.IBQVer_ven.SqL.Add('Update VENDEDOR ');
    DModRosa.IBQVer_ven.Sql.Add('Set NOME=:NOME,'+
                                'NCPF=:NCPF,'+
                                'NIFP=:NIFP,'+
                                'ENDE=:ENDE,'+
                                'BAIR=:BAIR,'+
                                'CIDA=:CIDA,'+
                                'ESTA=:ESTA,'+
                                'NCEP=:NCEP,'+
                                'NTEL=:NTEL,'+
                                'PRACA1=:PRACA1,'+
                                'PRACA2=:PRACA2,'+
                                'PRACA3=:PRACA3,'+
                                'PRACA4=:PRACA4,'+
                                'EMAIL=:EMAIL '+
                                'Where CODVEN=:CODVEN');
    DModRosa.IBQVer_ven.ParamByName('NOME').AsString:=edit2.Text;
    DModRosa.IBQVer_ven.ParamByName('NCPF').AsString:=maskedit2.Text;
    DModRosa.IBQVer_ven.ParamByName('NIFP').AsString:=edit10.Text;
    DModRosa.IBQVer_ven.ParamByName('ENDE').AsString:=edit3.Text;
    DModRosa.IBQVer_ven.ParamByName('BAIR').AsString:=edit4.Text;
    DModRosa.IBQVer_ven.ParamByName('CIDA').AsString:=edit5.Text;
    DModRosa.IBQVer_ven.ParamByName('ESTA').AsString:=ComboBox1.Text;
    DModRosa.IBQVer_ven.ParamByName('NCEP').AsString:=maskedit1.Text;
    DModRosa.IBQVer_ven.ParamByName('NTEL').AsString:=edit6.Text;
    DModRosa.IBQVer_ven.ParamByName('PRACA1').AsString:=edit7.Text;
    DModRosa.IBQVer_ven.ParamByName('PRACA2').AsString:=edit8.Text;
    DModRosa.IBQVer_ven.ParamByName('PRACA3').AsString:=edit9.text;
    DModRosa.IBQVer_ven.ParamByName('PRACA4').AsString:=edit16.text;
    DModRosa.IBQVer_ven.ParamByName('EMAIL').AsString:=edit12.text;
    DModRosa.IBQVer_ven.ParamByName('CODVEN').AsString:=edit1.Text;
    DModRosa.IBQVer_ven.ExecSql;
    DModRosa.IBTransaction1.CommitRetaining;
    DModRosa.IBQVer_ven.Close;
  end;
  if (edit11.Text='Excluir') and (edit1.Text<>'') then
  begin
    DModRosa.IBQVer_ven.Active:=False;
    DModRosa.IBQVer_ven.Sql.Clear;
    DModRosa.IBQVer_ven.SqL.Add('Delete from VENDEDOR '+
                                'Where Codven=:ven_digit');
    DModRosa.IBQVer_ven.ParamByName('ven_digit').AsString:=edit1.Text;
    DModRosa.IBQVer_ven.Active:=True;
    DModRosa.IBQVer_ven.Active:=false;
    DModRosa.IBTransaction1.Commit;
  end;
  Button2Click(Sender);
  exit;

end;

procedure TFrmVendedor.Button2Click(Sender: TObject);
begin
  wp1:='';
  wp2:='';
  wp3:='';
  wp4:='';
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
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit3.Clear;
  ComboBox1.ItemIndex:=-1;
  modalresult:=-1;
  exit;
end;

procedure TFrmVendedor.DBGrid1DblClick(Sender: TObject);
begin
   if wp1='1' then
  begin
    wp1:='';
    edit7.Text:=DModRosa.IBQPesq_rot.fields.fields[0].AsString;
    DModRosa.IBQPesq_rot.Close;
    DBGrid1.Visible:=false;
    edit7.SetFocus;
  end;
  if wp2='1' then
  begin
    wp2:='';
    edit8.Text:=DModRosa.IBQPesq_rot.fields.fields[0].AsString;
    DModRosa.IBQPesq_rot.Close;
    DBGrid1.Visible:=false;
    edit8.SetFocus;
  end;
  if wp3='1' then
  begin
    wp3:='';
    edit9.Text:=DModRosa.IBQPesq_rot.fields.fields[0].AsString;
    DModRosa.IBQPesq_rot.Close;
    DBGrid1.Visible:=false;
    edit9.SetFocus;
  end;
  if wp4='1' then
  begin
    wp4:='';
    edit16.Text:=DModRosa.IBQPesq_rot.fields.fields[0].AsString;
    DModRosa.IBQPesq_rot.Close;
    DBGrid1.Visible:=false;
    edit16.SetFocus;
  end;
end;

procedure TFrmVendedor.Edit16Exit(Sender: TObject);
begin
  if edit16.text>' ' then
  begin
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit16.Text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit17.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
end;

procedure TFrmVendedor.Edit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F5 then
  begin
    wp4:='1';
    DBGrid1.Visible:=true;
    DModRosa.IBQPesq_rot.Close;
    DModRosa.IBQPesq_rot.SQL.Clear;
    DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                                 'Where Bair=:bai_digit');
    DModRosa.IBQPesq_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQPesq_rot.OPen;
    DBGrid1.SetFocus;
    exit;
  end;
end;

procedure TFrmVendedor.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) or (ActiveControl=Button2) then
     exit;
  if edit1.Text<>'' then
  begin
    DModRosa.IBQLer_ven.Close;
    DModRosa.IBQLer_ven.SQL.Clear;
    DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                                'Where Codven=:ven_digit');
    DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit1.Text;
    DModRosa.IBQLer_ven.OPen;
    if DModRosa.IBQLer_ven.RecordCount>0 then
    begin
      edit2.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
      edit3.Text:=DModRosa.IBQLer_ven.fieldbyName('Ende').AsString;
      edit4.Text:=DModRosa.IBQLer_ven.fieldbyName('Bair').AsString;
      edit5.Text:=DModRosa.IBQLer_ven.fieldbyName('Cida').AsString;
      edit6.Text:=DModRosa.IBQLer_ven.fieldbyName('Ntel').AsString;
      edit10.Text:=DModRosa.IBQLer_ven.fieldbyName('Nifp').AsString;
      maskedit1.Text:=DModRosa.IBQLer_ven.fieldbyName('Ncep').AsString;
      maskedit2.Text:=DModRosa.IBQLer_ven.fieldbyName('Ncpf').AsString;
      ComboBox1.Text:=DModRosa.IBQLer_ven.fieldbyName('Esta').ASString;
      edit7.Text:=DModRosa.IBQLer_ven.fieldbyName('Praca1').AsString;
      edit8.Text:=DModRosa.IBQLer_ven.fieldbyName('Praca2').AsString;
      edit9.Text:=DModRosa.IBQLer_ven.fieldbyName('Praca3').AsString;
      edit16.Text:=DModRosa.IBQLer_ven.fieldbyName('Praca4').AsString;
      edit12.Text:=DModRosa.IBQLer_ven.fieldbyName('Email').AsString;
      edit18.Text:=DModRosa.IBQLer_ven.fieldbyName('Numsol').AsString;
      maskedit3.Text:=DModRosa.IBQLer_ven.fieldbyName('Datsol').AsString;
      DModRosa.IBQLer_ven.Close;
      // Ler Praca 1**********************
      DModRosa.IBQLer_rot.Close;
      DModRosa.IBQLer_rot.SQL.Clear;
      DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                  'Where Rota=:rot_digit '+
                                  'and Bair=:bai_digit');
      DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit7.Text;
      DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
      DModRosa.IBQLer_rot.OPen;
      if DModRosa.IBQLer_rot.RecordCount>0 then
         edit13.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
      DModRosa.IBQLer_rot.Close;
      // Ler Praca 2**********************
      DModRosa.IBQLer_rot.Close;
      DModRosa.IBQLer_rot.SQL.Clear;
      DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                  'Where Rota=:rot_digit '+
                                  'and Bair=:bai_digit');
      DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit8.Text;
      DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
      DModRosa.IBQLer_rot.OPen;
      if DModRosa.IBQLer_rot.RecordCount>0 then
         edit14.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
      DModRosa.IBQLer_rot.Close;
      // Ler Praca 3**********************
      DModRosa.IBQLer_rot.Close;
      DModRosa.IBQLer_rot.SQL.Clear;
      DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                  'Where Rota=:rot_digit '+
                                  'and Bair=:bai_digit');
      DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit9.Text;
      DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
      DModRosa.IBQLer_rot.OPen;
      if DModRosa.IBQLer_rot.RecordCount>0 then
         edit15.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
      DModRosa.IBQLer_rot.Close;
      // Ler Praca 4**********************
      DModRosa.IBQLer_rot.Close;
      DModRosa.IBQLer_rot.SQL.Clear;
      DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                  'Where Rota=:rot_digit '+
                                  'and Bair=:bai_digit');
      DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit16.Text;
       DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
      DModRosa.IBQLer_rot.OPen;
      if DModRosa.IBQLer_rot.RecordCount>0 then
         edit17.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
      DModRosa.IBQLer_rot.Close;
      if edit11.Text='Alterar' then
      begin
        edit2.SetFocus;
        exit;
      end;
      if edit11.Text='Consultar' then
      begin
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
      DModRosa.IBQLer_cli.Close;
      edit2.SetFocus;
      exit;
    end;
  end else
     ShowMessage('Identifique o Vendedor');
  Button2Click(Sender);
  exit;
end;

procedure TFrmVendedor.Edit7Exit(Sender: TObject);
begin
  if edit7.text>' ' then
  begin
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit7.Text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit13.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
end;

procedure TFrmVendedor.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F2 then
  begin
    wp1:='1';
    DBGrid1.Visible:=true;
    DModRosa.IBQPesq_rot.Close;
    DModRosa.IBQPesq_rot.SQL.Clear;
    DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                                 'Where Bair=:bai_digit');
    DModRosa.IBQPesq_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQPesq_rot.OPen;
    DBGrid1.SetFocus;
    exit;
  end;
end;

procedure TFrmVendedor.Edit8Exit(Sender: TObject);
begin
  if edit8.text>' ' then
  begin
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit8.Text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit14.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
end;

procedure TFrmVendedor.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F3 then
  begin
    wp2:='1';
    DBGrid1.Visible:=true;
    DModRosa.IBQPesq_rot.Close;
    DModRosa.IBQPesq_rot.SQL.Clear;
    DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                                 'Where Bair=:bai_digit');
    DModRosa.IBQPesq_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQPesq_rot.OPen;
    DBGrid1.SetFocus;
    exit;
  end;
end;

procedure TFrmVendedor.Edit9Exit(Sender: TObject);
begin
  if edit9.text>' ' then
  begin
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit9.Text;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       edit15.Text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
end;

procedure TFrmVendedor.Edit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F4 then
  begin
    wp3:='1';
    DBGrid1.Visible:=true;
    DModRosa.IBQPesq_rot.Close;
    DModRosa.IBQPesq_rot.SQL.Clear;
    DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                                 'Where Bair=:bai_digit');
    DModRosa.IBQPesq_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQPesq_rot.OPen;
    DBGrid1.SetFocus;
    exit;
  end;
end;

function TFrmVendedor.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmVendedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVendedor.FormKeyDown(Sender: TObject; var Key: Word;
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


procedure TFrmVendedor.FormShow(Sender: TObject);
begin
  wp1:='';
  wp2:='';
  wp3:='';
  wp4:='';
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
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit3.Clear;
  ComboBox1.ItemIndex:=-1;
  DModRosa.IBQPesq_rot.Close;
  DModRosa.IBQPesq_rot.SQL.Clear;
  DModRosa.IBQPesq_rot.SQL.Add('Select * from ROTA '+
                               'Where Bair=:bai_digit');
  DModRosa.IBQPesq_rot.ParamByName('bai_digit').AsString:='000';
  DModRosa.IBQPesq_rot.OPen;
  if edit11.text='Implantar' then
     GeraCodigo;
  edit1.SetFocus;
  exit;
end;

procedure TFrmVendedor.GeraCodigo;
var
  Codigo: Integer;
begin
  DModRosa.IBQLer_ven.Close;
  DModRosa.IBQLer_ven.SQL.Clear;
  DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Order By Codven');
  DModRosa.IBQLer_ven.OPen;
  if DModRosa.IBQLer_ven.RecordCount=0 then
     Codigo:=0
  else
  begin
    DModRosa.IBQLer_ven.Last;
    Codigo:=StrToInt(DModRosa.IBQLer_ven.fieldbyName('Codven').AsString);
  end;
  DModRosa.IBQLer_ven.Close;
  Codigo:=Codigo+1;
  edit1.Text:=IntToStr(Codigo);
  // Preencher a chave com zeros a esquerda
  While Length(edit1.Text)<3 do
        edit1.Text := '0'+ edit1.Text;
end;

end.
