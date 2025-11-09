unit UManutcli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, IBX.IBQuery, Data.DB, IBX.IBCustomDataSet, IBX.IBTable, frxClass,
  frxDBSet;

type
  TFrmManutcli = class(TForm)
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
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button9: TButton;
    Button10: TButton;
    IBTAuxcliente: TIBTable;
    IBQAuxcliente: TIBQuery;
    IBQuery1: TIBQuery;
    IBTAuxclienteCODCLI: TIBStringField;
    IBTAuxclienteNCPF: TIBStringField;
    IBTAuxclienteNIFP: TIBStringField;
    IBTAuxclienteBAIR: TIBStringField;
    IBTAuxclienteCIDA: TIBStringField;
    IBTAuxclienteESTA: TIBStringField;
    IBTAuxclienteNCEP: TIBStringField;
    IBTAuxclienteNTEL: TIBStringField;
    IBTAuxclienteCONTA: TIBStringField;
    IBTAuxclienteVEND: TIBStringField;
    IBTAuxclienteLCRED: TIBBCDField;
    IBTAuxclienteDATIMP: TIBStringField;
    IBTAuxclienteNOMMAE: TIBStringField;
    IBTAuxclienteNOMPAI: TIBStringField;
    IBTAuxclienteDATNASC: TIBStringField;
    IBTAuxclienteNATU: TIBStringField;
    IBTAuxclienteROTA: TIBStringField;
    IBTAuxclientePRACA: TIBStringField;
    IBTAuxclienteREFER: TIBStringField;
    IBTAuxclienteOLDCLI: TIBStringField;
    IBTAuxclienteSITU: TIBStringField;
    IBTAuxclienteNOME: TIBStringField;
    IBTAuxclienteENDE: TIBStringField;
    IBTAuxclienteHORAIN: TIBStringField;
    IBTAuxclienteHORAFIN: TIBStringField;
    IBTAuxclienteVISITA: TIBStringField;
    IBTAuxclienteATIVO: TIBStringField;
    IBTAuxclienteESPED: TIBStringField;
    IBTAuxclienteOBSV: TBlobField;
    IBQAuxclienteCODCLI: TIBStringField;
    IBQAuxclienteNCPF: TIBStringField;
    IBQAuxclienteNIFP: TIBStringField;
    IBQAuxclienteBAIR: TIBStringField;
    IBQAuxclienteCIDA: TIBStringField;
    IBQAuxclienteESTA: TIBStringField;
    IBQAuxclienteNCEP: TIBStringField;
    IBQAuxclienteNTEL: TIBStringField;
    IBQAuxclienteCONTA: TIBStringField;
    IBQAuxclienteVEND: TIBStringField;
    IBQAuxclienteLCRED: TIBBCDField;
    IBQAuxclienteDATIMP: TIBStringField;
    IBQAuxclienteNOMMAE: TIBStringField;
    IBQAuxclienteNOMPAI: TIBStringField;
    IBQAuxclienteDATNASC: TIBStringField;
    IBQAuxclienteNATU: TIBStringField;
    IBQAuxclienteROTA: TIBStringField;
    IBQAuxclientePRACA: TIBStringField;
    IBQAuxclienteREFER: TIBStringField;
    IBQAuxclienteOLDCLI: TIBStringField;
    IBQAuxclienteSITU: TIBStringField;
    IBQAuxclienteNOME: TIBStringField;
    IBQAuxclienteENDE: TIBStringField;
    IBQAuxclienteHORAIN: TIBStringField;
    IBQAuxclienteHORAFIN: TIBStringField;
    IBQAuxclienteVISITA: TIBStringField;
    IBQAuxclienteATIVO: TIBStringField;
    IBQAuxclienteESPED: TIBStringField;
    IBQAuxclienteOBSV: TBlobField;
    DtsCadcli: TfrxDBDataset;
    RvCadClie: TfrxReport;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure RvCadClieGetValue(const VarName: string; var Value: Variant);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutcli: TFrmManutcli;
  wmarca,xrota,wcodcli,wcida,wvend,wnommae,wnompai,wdatnas,wpraca,wobsv,wdatini: string;
  wdatfin,wrota,wnatu,wnompraca,xopcao,zopcao,xpraca,wopcao: string;
  wlcre: Extended;
implementation

{$R *.dfm}

uses UDModRosa, UCliente, UPendencias,Urelmapa;

procedure TFrmManutcli.Button10Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col016').AsString='X' then
  begin
    DModRosa.IBQPesq_cli.Close;
    FrmPendencias:=TFrmPendencias.Create(Self);
    FrmPendencias.ShowModal;
    FrmPendencias.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col009').AsString='X' then
  begin
    DModRosa.IBQPesq_cli.Close;
    FrmCliente:=TFrmCliente.Create(Self);
    FrmCliente.edit11.Text:='Implantar';
    FrmCliente.ShowModal;
    FrmCliente.release;
  end else
      showmessage('Não Autorizado !!!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button2Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col010').AsString='X' then
  begin
    wmarca:=IntToStr(DModRosa.IBQPesq_cli.fields.fields[0].AsInteger);
    DModRosa.IBQPesq_cli.Close;
    FrmCliente:=TFrmCliente.Create(Self);
    FrmCliente.edit11.Text:='Alterar';
    FrmCliente.edit1.Text:=wmarca;
    FrmCliente.ShowModal;
    FrmCliente.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button3Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col011').AsString='X' then
  begin
    wmarca:=IntToStr(DModRosa.IBQPesq_cli.fields.fields[0].AsInteger);
    DModRosa.IBQPesq_cli.Close;
    FrmCliente:=TFrmCliente.Create(Self);
    FrmCliente.edit11.Text:='Consultar';
    FrmCliente.edit1.Text:=wmarca;
    FrmCliente.ShowModal;
    FrmCliente.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button4Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col012').AsString='X' then
  begin
    wmarca:=IntToStr(DModRosa.IBQPesq_cli.fields.fields[0].AsInteger);
    DModRosa.IBQPesq_cli.Close;
    FrmCliente:=TFrmCliente.Create(Self);
    FrmCliente.edit11.Text:='Excluir';
    FrmCliente.edit1.Text:=wmarca;
    FrmCliente.ShowModal;
    FrmCliente.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button5Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col014').AsString='X' then
  begin
    wopcao:='';
    while wopcao='' do
    begin
      wopcao:=UpperCase(InputBox('Ordem Alfa(A),Ordem Numeric(N) !!!',
                              'Ordem: ',' '));
    end;
    IBTAuxcliente.EmptyTable;
    if wopcao='A' then
    begin
      xopcao:='ALFABETICA';
      DModRosa.IBQVer_cli.Close;
      DModRosa.IBQVer_cli.SQL.Clear;
      DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                  'Order By Nome,Idcli');
      DModRosa.IBQVer_cli.OPen;
    end else
    begin
      Xopcao:='NUMERICA';
      DModRosa.IBQVer_cli.Close;
      DModRosa.IBQVer_cli.SQL.Clear;
      DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                  'Order By Idcli');
      DModRosa.IBQVer_cli.OPen;
    end;
    while not DModRosa.IBQVer_cli.Eof do
    begin
      wcodcli:=IntToStr(DModRosa.IBQVer_cli.fieldbyName('IDCLI').AsInteger);
      while Length(wcodcli)<4 do
            wcodcli:='0' + wcodcli;
      if IBQAuxcliente.Active then
         IBQAuxcliente.Active:=False;
      IBQAuxcliente.Sql.Clear;
      IBQAuxcliente.Sql.Add('Insert Into AUXCLIENTE ');
      IBQAuxcliente.Sql.Add('(CODCLI,NOME,NCPF,NIFP,ENDE,BAIR,CIDA,ESTA,'+
                            'NCEP,NTEL,CONTA,VEND,LCRED,DATIMP,NOMMAE,'+
                            'NOMPAI,DATNASC,NATU,ROTA,PRACA,REFER,OLDCLI,SITU) '+
                    'Values(:CODCLI,:NOME,:NCPF,:NIFP,:ENDE,:BAIR,:CIDA,:ESTA,'+
                           ':NCEP,:NTEL,:CONTA,:VEND,:LCRED,:DATIMP,:NOMMAE,'+
                           ':NOMPAI,:DATNASC,:NATU,:ROTA,:PRACA,:REFER,:OLDCLI,:SITU)');
      IBQAuxcliente.ParamByName('CODCLI').AsString:=wcodcli;
      IBQAuxcliente.ParamByName('NOME').AsString:=DModRosa.IBQVer_cli.fieldByName('NOME').AsString;
      IBQAuxcliente.ParamByname('NCPF').AsString:=DModRosa.IBQVer_cli.fieldByName('NCPF').AsString;
      IBQAuxcliente.ParamByname('NIFP').AsString:=DModRosa.IBQVer_cli.fieldByname('NIFP').AsString;
      IBQAuxcliente.ParamByname('ENDE').AsString:=DModRosa.IBQVer_cli.fieldByName('ENDE').AsString;
      IBQAuxcliente.ParamByname('BAIR').AsString:=DModRosa.IBQVer_cli.fieldByName('BAIR').AsString;
      IBQAuxcliente.ParamByname('CIDA').AsString:=DModRosa.IBQVer_cli.fieldByName('CIDA').AsString;
      IBQAuxcliente.ParamByname('ESTA').AsString:=DModRosa.IBQVer_cli.fieldByName('ESTA').AsString;
      IBQAuxcliente.ParamByname('NCEP').AsString:=DModRosa.IBQVer_cli.fieldByName('NCEP').AsString;
      IBQAuxcliente.ParamByname('NTEL').AsString:=DModRosa.IBQVer_cli.fieldByName('NTEL').AsString;
      IBQAuxcliente.ParamByname('CONTA').AsString:=DModRosa.IBQVer_cli.fieldByNamE('CONTA').AsString;
      IBQAuxcliente.ParamByname('VEND').AsString:=DModRosa.IBQVer_cli.fieldByName('VEND').AsString;
      IBQAuxcliente.ParamByname('LCRED').AsFloat:=DModRosa.IBQVer_cli.fieldBYnAME('LCRED').AsFloat;
      IBQAuxcliente.ParamByname('DATIMP').AsString:=DModRosa.IBQVer_cli.fieldByName('DATIMP').AsString;
      IBQAuxcliente.ParamByname('NOMMAE').AsString:=DModRosa.IBQVer_cli.fieldByName('NOMMAE').AsString;
      IBQAuxcliente.ParamByname('NOMPAI').AsString:=DModRosa.IBQVer_cli.fieldByName('NOMPAI').AsString;
      IBQAuxcliente.ParamByname('DATNASC').AsString:=DModRosa.IBQVer_cli.fieldByName('DATNASC').AsString;
      IBQAuxcliente.ParamByname('NATU').AsString:=DModRosa.IBQVer_cli.fieldByName('NATU').AsString;
      IBQAuxcliente.ParamByname('ROTA').AsString:=DModRosa.IBQVer_cli.fieldByName('ROTA').AsString;
      IBQAuxcliente.ParamByname('PRACA').AsString:=DModRosa.IBQVer_cli.fieldByName('PRACA').AsString;
      IBQAuxcliente.ParamByname('REFER').AsString:=DModRosa.IBQVer_cli.fieldByName('REFER').AsString;
      IBQAuxcliente.ParamByname('OLDCLI').AsString:='';
      IBQAuxcliente.ParamByname('SITU').AsString:='';
      IBQAuxcliente.ExecSql;
      IBQAuxcliente.Close;
      DModRosa.IBQVer_cli.Next;
    end;
    DModRosa.IBQVer_cli.Close;
    if wopcao='A' then
    begin
      IBQAuxcliente.Close;
      IBQAuxcliente.SQL.Clear;
      IBQAuxcliente.SQL.Add('Select * from AUXCLIENTE '+
                            'Order By Nome,Codcli');
      IBQAuxcliente.OPen;
      IBQAuxcliente.Close;
    end;
    if wopcao='N' then
    begin
      IBQAuxcliente.Close;
      IBQAuxcliente.SQL.Clear;
      IBQAuxcliente.SQL.Add('Select * from AUXCLIENTE '+
                            'Order By Codcli');
      IBQAuxcliente.OPen;
      IBQAuxcliente.Close;
    end;
    // Emite a relação ******************
    RvCadClie.ShowReport;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button6Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col013').AsString='X' then
  begin
    wmarca:=IntToStr(DModRosa.IBQPesq_cli.fields.fields[0].AsInteger);
    DModRosa.IBQPesq_cli.Close;
    FrmCliente:=TFrmCliente.Create(Self);
    FrmCliente.edit11.Text:='Ativa';
    FrmCliente.edit1.Text:=wmarca;
    FrmCliente.ShowModal;
    FrmCliente.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button7Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col015').AsString='X' then
  begin
    IBTAuxcliente.EmptyTable;
    DModRosa.IBQPesq_cli.Close;
    xpraca:='';
    xpraca:=UpperCase(InputBox('Informe a praça !!!',
                              'Praça: ',' '));
    xrota:='';
    xrota:=UpperCase(InputBox('Informe a rota !!',
                               'Rota: ',' '));
    xopcao:='';
    xopcao:=UpperCase(InputBox('Informe Ativados <A> Desativados <D>',
                     'Opção: ',' '));
    zopcao:='Ativado';
    if xopcao='D' then
       zopcao:='Desativado';
    DModRosa.IBQVer_rot.Close;
    DModRosa.IBQVer_rot.Close;
    DModRosa.IBQVer_rot.SQL.Clear;
    DModRosa.IBQVer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQVer_rot.ParamByName('rot_digit').AsString:=xpraca;
    DModRosa.IBQVer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQVer_rot.OPen;
    if DModRosa.IBQVer_rot.RecordCount=0 then
    begin
      showmessage('Praça/Rota não cadastrada !!');
      DModRosa.IBQVer_rot.close;
      DModRosa.IBQPesq_cli.Close;
      DModRosa.IBQPesq_cli.SQL.Clear;
      DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                                   'Order By Nome,Idcli');
      DModRosa.IBQPesq_cli.OPen;
      edit1.Clear;
      Combobox1.ItemIndex:=0;
      ComboBox1.SetFocus;
      exit;
    end;
    wnompraca:=DModRosa.IBQVer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQVer_rot.close;
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQVer_cli.SQL.Clear;
    DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Praca=:pra_digit '+
                                'and Rota=:rot_digit '+
                                'and Ativo=:opc_digit '+
                                'Order By Rota,Nome');
    DModRosa.IBQVer_cli.ParamByName('pra_digit').AsString:=xpraca;
    DModRosa.IBQVer_cli.ParamByName('rot_digit').AsString:=xrota;
    DModRosa.IBQVer_cli.ParamByName('opc_digit').AsString:=xopcao;
    DModRosa.IBQVer_cli.OPen;
    DModRosa.IBQVer_cli.DisableControls;
    DModRosa.IBQVer_cli.First;
    while not DModRosa.IBQVer_cli.Eof do
    begin
      wcodcli:=IntToStr(DModRosa.IBQVer_cli.fieldbyName('IDCLI').AsInteger);
      while Length(wcodcli)<4 do
          wcodcli:='0' + wcodcli;
      if IBQAuxcliente.Active then
         IBQAuxcliente.Active:=False;
      IBQAuxcliente.Sql.Clear;
      IBQAuxcliente.Sql.Add('Insert Into AUXCLIENTE ');
      IBQAuxcliente.Sql.Add('(CODCLI,NCPF,NIFP,BAIR,CIDA,ESTA,'+
                            'NCEP,NTEL,CONTA,VEND,LCRED,DATIMP,NOMMAE,'+
                            'NOMPAI,DATNASC,NATU,ROTA,PRACA,REFER,OLDCLI,SITU,'+
                            'NOME,ENDE,HORAIN,HORAFIN,VISITA,ATIVO,OBSV) '+
                    'Values(:CODCLI,:NCPF,:NIFP,:BAIR,:CIDA,:ESTA,'+
                           ':NCEP,:NTEL,:CONTA,:VEND,:LCRED,:DATIMP,:NOMMAE,'+
                           ':NOMPAI,:DATNASC,:NATU,:ROTA,:PRACA,:REFER,:OLDCLI,:SITU,'+
                           ':NOME,:ENDE,:HORAIN,:HORAFIN,:VISITA,:ATIVO,:OBSV)');
      IBQAuxcliente.ParamByName('CODCLI').AsString:=wcodcli;
      IBQAuxcliente.ParamByName('NOME').AsString:=DModRosa.IBQVer_cli.fieldByName('NOME').AsString;
      IBQAuxcliente.ParamByname('NCPF').AsString:=DModRosa.IBQVer_cli.fieldByName('NCPF').AsString;
      IBQAuxcliente.ParamByname('NIFP').AsString:=DModRosa.IBQVer_cli.fieldByname('NIFP').AsString;
      IBQAuxcliente.ParamByname('ENDE').AsString:=DModRosa.IBQVer_cli.fieldByName('ENDE').AsString;
      IBQAuxcliente.ParamByname('BAIR').AsString:=DModRosa.IBQVer_cli.fieldByName('BAIR').AsString;
      IBQAuxcliente.ParamByname('CIDA').AsString:=DModRosa.IBQVer_cli.fieldByName('CIDA').AsString;
      IBQAuxcliente.ParamByname('ESTA').AsString:=DModRosa.IBQVer_cli.fieldByName('ESTA').AsString;
      IBQAuxcliente.ParamByname('NCEP').AsString:=DModRosa.IBQVer_cli.fieldByName('NCEP').AsString;
      IBQAuxcliente.ParamByname('NTEL').AsString:=DModRosa.IBQVer_cli.fieldByName('NTEL').AsString;
      IBQAuxcliente.ParamByname('CONTA').AsString:=DModRosa.IBQVer_cli.fieldByNamE('CONTA').AsString;
      IBQAuxcliente.ParamByname('VEND').AsString:=DModRosa.IBQVer_cli.fieldByName('VEND').AsString;
      IBQAuxcliente.ParamByname('LCRED').AsFloat:=DModRosa.IBQVer_cli.fieldBYnAME('LCRED').AsFloat;
      IBQAuxcliente.ParamByname('DATIMP').AsString:=DModRosa.IBQVer_cli.fieldByName('DATIMP').AsString;
      IBQAuxcliente.ParamByname('NOMMAE').AsString:=DModRosa.IBQVer_cli.fieldByName('NOMMAE').AsString;
      IBQAuxcliente.ParamByname('NOMPAI').AsString:=DModRosa.IBQVer_cli.fieldByName('NOMPAI').AsString;
      IBQAuxcliente.ParamByname('DATNASC').AsString:=DModRosa.IBQVer_cli.fieldByName('DATNASC').AsString;
      IBQAuxcliente.ParamByname('NATU').AsString:=DModRosa.IBQVer_cli.fieldByName('NATU').AsString;
      IBQAuxcliente.ParamByname('ROTA').AsString:=DModRosa.IBQVer_cli.fieldByName('ROTA').AsString;
      IBQAuxcliente.ParamByname('PRACA').AsString:=DModRosa.IBQVer_cli.fieldByName('PRACA').AsString;
      IBQAuxcliente.ParamByname('REFER').AsString:=DModRosa.IBQVer_cli.fieldByName('REFER').AsString;
      IBQAuxcliente.ParamByname('OLDCLI').AsString:='';
      IBQAuxcliente.ParamByname('SITU').AsString:='';
      IBQAuxcliente.ParamByname('HORAIN').AsString:='';
      IBQAuxcliente.ParamByname('HORAFIN').AsString:='';
      IBQAuxcliente.ParamByname('VISITA').AsString:='';
      IBQAuxcliente.ParamByname('ATIVO').AsString:=DModRosa.IBQVer_cli.fieldByName('ATIVO').AsString;
      IBQAuxcliente.ParamByname('OBSV').AsString:=DModRosa.IBQVer_cli.fieldByName('OBSV').AsString;
      IBQAuxcliente.ExecSql;
      IBQAuxcliente.Close;
      DModRosa.IBQVer_cli.Next;
    end;
    DModRosa.IBQVer_cli.Close;
    IBQAuxcliente.Close;
    IBQAuxcliente.SQL.Clear;
    IBQAuxcliente.SQL.Add('Select * from AUXCLIENTE '+
                          'Order By Praca,Rota,Nome,Codcli');
    IBQAuxcliente.OPen;
    IBQAuxcliente.Close;
    // Emite a relação ******************
    xopcao:='Praça: '+xrota+' - '+wnompraca+' - '+zopcao;
    RvCadClie.ShowReport;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Button9Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col017').AsString='X' then
  begin
    wmarca:=IntToStr(DModRosa.IBQPesq_cli.fields.fields[0].AsInteger);
    DModRosa.IBQPesq_cli.Close;
    FrmRelMapa:=TFrmRelMapa.Create(Self);
    FrmRelMapa.Edit2.Text:='X';
    FrmRelMapa.edit4.Text:=wmarca;
    FrmRelMapa.ShowModal;
    FrmRelMapa.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Order By Nome,Idcli');
  DModRosa.IBQPesq_cli.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.Edit1Exit(Sender: TObject);
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
  if DModRosa.IBQPesq_cli.Active=True then
     DModRosa.IBQPesq_cli.Active:=False;
  DModRosa.IBQPesq_cli.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
     while Length(edit1.Text)<4 do
        edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_cli.Sql.Add('Select * from CLIENTE '+
                                 'Where Idcli=:cod_digit');
    DModRosa.IBQPesq_cli.ParamByName('cod_digit').AsInteger:=StrToInt(edit1.Text);
    DModRosa.IBQPesq_cli.Active:=True;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    DModRosa.IBQPesq_cli.Sql.Add('Select * from CLIENTE '+
                                 'Where Nome LIKE '+#39+'%'+edit1.Text+'%'+#39);
    DModRosa.IBQPesq_cli.Active:=True;
  end;
  if ComboBox1.ItemIndex=2 then
  begin
    while Length(edit1.Text)<3 do
        edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_cli.Sql.Add('Select * from CLIENTE '+
                                 'Where Rota=:rot_digit '+
                                 'Order by Nome,Idcli');
    DModRosa.IBQPesq_cli.ParamByName('rot_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_cli.Active:=True;
  end;
end;

procedure TFrmManutcli.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmManutcli.FormShow(Sender: TObject);
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
  if DModRosa.IBQPesq_cli.Active then
     DModRosa.IBQPesq_cli.Active:=False;
  DModRosa.IBQPesq_cli.Sql.Clear;
  DModRosa.IBQPesq_cli.Sql.Add('Select * from CLIENTE '+
                               'Order by Nome,Idcli');
  DModRosa.IBQPesq_cli.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutcli.RvCadClieGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(VarName, 'Opcao') = 0 then
     Value :=xopcao;
end;

end.
