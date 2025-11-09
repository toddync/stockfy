unit UManutdev;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable;

type
  TFrmManutdev = class(TForm)
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
    Button10: TButton;
    Label3: TLabel;
    Label5: TLabel;
    IBTAuxdev: TIBTable;
    IBTAuxitdev: TIBTable;
    IBQAuxdev: TIBQuery;
    IBQAuxitdev: TIBQuery;
    IBQAuxdevPEDIDO: TIBStringField;
    IBQAuxdevCODVEN: TIBStringField;
    IBQAuxdevCODCLI: TIBStringField;
    IBQAuxdevNOMCLI: TIBStringField;
    IBQAuxdevENDCLI: TIBStringField;
    IBQAuxdevBAICLI: TIBStringField;
    IBQAuxdevCIDCLI: TIBStringField;
    IBQAuxdevESTCLI: TIBStringField;
    IBQAuxdevBASE: TDateField;
    IBQAuxdevRECOL: TDateField;
    IBQAuxdevCOBRAN: TDateField;
    IBQAuxdevTOTPED: TIBBCDField;
    IBQAuxdevSITU: TIBStringField;
    IBQAuxdevDATPED: TIBStringField;
    IBQAuxdevSOLICIT: TIBStringField;
    IBQAuxdevRETORNO: TIBStringField;
    IBQAuxdevTOTVEN: TIBBCDField;
    IBQAuxdevDATPAG: TIBStringField;
    IBQAuxdevVALPAG: TIBBCDField;
    IBQAuxdevRESIDUO: TIBBCDField;
    IBQAuxdevCOB: TIBStringField;
    IBQAuxdevLIMITE: TIBStringField;
    IBQAuxitdevPEDIDO: TIBStringField;
    IBQAuxitdevCODART: TIBStringField;
    IBQAuxitdevDESCRICAO: TIBStringField;
    IBQAuxitdevQTDSAI: TIntegerField;
    IBQAuxitdevQTDRET: TIntegerField;
    IBQAuxitdevPRECUS: TIBBCDField;
    IBQAuxitdevPREVEN: TIBBCDField;
    IBQAuxitdevQTDANT: TIntegerField;
    IBQAuxitdevCUSANT: TIBBCDField;
    IBQAuxitdevVENANT: TIBBCDField;
    IBQAuxitdevOPER: TIBStringField;
    procedure Edit1Exit(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutdev: TFrmManutdev;
  wmarca,wgrupo,wdatini,wdatfin,wnumnot,wdatnot,wcodart,wdescricao,wnumped,wvend: string;
  wquant,wprecus,wvalnot,wtotal,wqtda,wpreco,wtotpro: Extended;
  wcodigo: string;
implementation

{$R *.dfm}

uses UDModRosa, UDevolucao;

procedure TFrmManutdev.Button10Click(Sender: TObject);
begin
  wdatini:='';
  wdatfin:='';
  wtotal:=0;
  wvend:='';
  While wvend='' do
  begin
    wvend:=InputBox('Informe vendedor ou 999(todos)',
                                    'Vendedor:',' ');
  end;
  While wdatini='' do
  begin
    wdatini:=InputBox('Informe Inicio do periodo',
                                      'data(DD/MM/AAAA):',' ');
  end;
  While wdatfin='' do
  begin
    wdatfin:=InputBox('Informe Final do periodo',
                                     'data(DD/MM/AAAA):',' ');
  end;
  if wvend='999' then
  begin
    DModRosa.IBQPesq_dev.Close;
    DModRosa.IBQVer_dev.Close;
    DModRosa.IBQVer_dev.SQL.Clear;
    DModRosa.IBQVer_dev.SQL.Add('Select * from DEVOLUCAO '+
                                 'Where Datnot>=:ini_digit '+
                                 'and Datnot<=:fin_digit '+
                                 'Order By Datnot,Numnot');
    DModRosa.IBQVer_dev.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
    DModRosa.IBQVer_dev.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
    DModRosa.IBQVer_dev.OPen;
  end else
  begin
    DModRosa.IBQPesq_dev.Close;
    DModRosa.IBQVer_dev.Close;
    DModRosa.IBQVer_dev.SQL.Clear;
    DModRosa.IBQVer_dev.SQL.Add('Select * from DEVOLUCAO '+
                                 'Where Datnot>=:ini_digit '+
                                 'and Datnot<=:fin_digit '+
                                 'and Codven=:ven_digit '+
                                 'Order By Datnot,Numnot');
    DModRosa.IBQVer_dev.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
    DModRosa.IBQVer_dev.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
    DModRosa.IBQVer_dev.ParamByName('ven_digit').AsString:=wvend;
    DModRosa.IBQVer_dev.OPen;
  end;
  DModRosa.IBQVer_dev.DisableControls;
  DModRosa.IBQVer_dev.First;
  IBTAuxdev.EmptyTable;
  IBTAuxitdev.EmptyTable;
  while not DModRosa.IBQVer_dev.Eof do
  begin
    wnumnot:=DModRosa.IBQVer_dev.fieldbyName('Numnot').AsString;
    wnumped:=DModRosa.IBQVer_dev.fieldbyName('Romnot').AsString;
    wdatnot:=DateToStr(DModRosa.IBQVer_dev.fieldbyName('Datnot').AsDateTime);
    wvalnot:=DModRosa.IBQVer_dev.fieldbyName('Valnot').AsFloat;
    wvend:=DModRosa.IBQVer_dev.fieldbyName('Codven').AsString;
    DModRosa.IBQPesq_itdev.Close;
    DModRosa.IBQVer_itdev.Close;
    DModRosa.IBQVer_itdev.SQL.Clear;
    DModRosa.IBQVer_itdev.SQL.Add('Select * from ITEMDEVOLUCAO '+
                                  'Where Numnot=:num_digit '+
                                  'Order By Codart');
    DModRosa.IBQVer_itdev.ParamByName('num_digit').AsString:=wnumnot;
    DModRosa.IBQVer_itdev.OPen;
    DModRosa.IBQVer_itdev.DisableControls;
    DModRosa.IBQVer_itdev.First;
    while not DModRosa.IBQVer_itdev.Eof do
    begin
      wcodigo:=DModRosa.IBQVer_itdev.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQVer_itdev.fieldbyName('Descricao').AsString;
      wqtda:=DModRosa.IBQVer_itdev.fieldbyName('Quant').AsFloat;
      wpreco:=DModRosa.IBQVer_itdev.fieldbyName('Precus').AsFloat;
      wtotal:=wtotal+(wqtda*wpreco);
      wtotpro:=wqtda*wpreco;
      if IBQAuxitdev.Active then
         IBQAuxitdev.Active:=False;
      IBQAuxitdev.Sql.Clear;
      IBQAuxitdev.Sql.Add('Insert Into AUXITENS ');
      IBQAuxitdev.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                          'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                   'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                          ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
      IBQAuxitdev.ParamByName('PEDIDO').AsString:=wnumnot;
      IBQAuxitdev.ParamByName('CODART').AsString:=wcodigo;
      IBQAuxitdev.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQAuxitdev.ParamByName('QTDSAI').AsFloat:=wqtda;
      IBQAuxitdev.ParamByName('QTDRET').AsFloat:=0;
      IBQAuxitdev.ParamByName('PRECUS').AsFloat:=wpreco;
      IBQAuxitdev.ParamByName('PREVEN').AsFloat:=wtotpro;
      IBQAuxitdev.ParamByName('QTDANT').AsFloat:=wqtda;
      IBQAuxitdev.ParamByName('CUSANT').AsFloat:=wpreco;
      IBQAuxitdev.ParamByName('VENANT').AsFloat:=0;
      IBQAuxitdev.ParamByName('OPER').AsString:='';
      IBQAuxitdev.ExecSql;
      IBQAuxitdev.Close;
      DModRosa.IBQVer_itdev.Next;
    end;
    DModRosa.IBQVer_itdev.Close;
    if IBQAuxdev.Active then
       IBQAuxdev.Active:=False;
    IBQAuxdev.Sql.Clear;
    IBQAuxdev.Sql.Add('Insert Into AUXPEDIDO ');
    IBQAuxdev.Sql.Add('(PEDIDO,CODVEN,CODCLI,NOMCLI,BASE,RECOL,COBRAN,'+
                      'TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                      'VALPAG,RESIDUO,COB,LIMITE) '+
               'Values(:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:BASE,:RECOL,:COBRAN,'+
                      ':TOTPED,:SITU,:DATPED,:RETORNO,:TOTVEN,:DATPAG,'+
                      ':VALPAG,:RESIDUO,:COB,:LIMITE)');
    IBQAuxdev.ParamByName('PEDIDO').AsString:=wnumnot;
    IBQAuxdev.ParamByName('CODVEN').AsString:=wvend;
    IBQAuxdev.ParamByName('CODCLI').AsString:='';
    IBQAuxdev.ParamByName('NOMCLI').AsString:=wnumped;
    IBQAuxdev.ParamByName('BASE').AsDateTime:=StrToDate(wdatnot);
    IBQAuxdev.ParamByName('RECOL').AsDateTime:=StrToDate(wdatnot);
    IBQAuxdev.ParamByName('COBRAN').AsDateTime:=StrToDate(wdatnot);
    IBQAuxdev.ParamByName('TOTPED').AsFloat:=wvalnot;
    IBQAuxdev.ParamByName('SITU').AsString:='';
    IBQAuxdev.ParamByName('DATPED').AsString:=wdatnot;
    IBQAuxdev.ParamByName('RETORNO').AsString:=wdatnot;
    IBQAuxdev.ParamByName('TOTVEN').AsFloat:=0;
    IBQAuxdev.ParamByName('DATPAG').AsString:='';
    IBQAuxdev.ParamByName('VALPAG').AsFloat:=wvalnot;
    IBQAuxdev.ParamByName('RESIDUO').AsFloat:=0;
    IBQAuxdev.ParamByName('COB').AsString:='';
    IBQAuxdev.ParamByName('LIMITE').AsFloat:=0;
    IBQAuxdev.ExecSql;
    IBQAuxdev.Close;
    DModRosa.IBQVer_dev.Next;
  end;
  DModRosa.IBQVer_dev.Close;
  IBQAuxdev.Close;
  IBQAuxdev.SQL.Clear;
  IBQAuxdev.SQL.Add('Select * from AUXPEDIDO '+
                     'Order By Pedido');
  IBQAuxdev.OPen;
  IBQAuxdev.Close;
  IBQAuxitdev.Close;
  IBQAuxitdev.SQL.Clear;
  IBQAuxitdev.SQL.Add('Select * from AUXITENS '+
                       'Order By Pedido,Codart');
  IBQAuxitdev.OPen;
  IBQAuxitdev.Close;
  // Emite a relação ******************
 // RvCaddevol.Setparam('Periodo',wdatini+' A '+wdatfin);
 // RvCaddevol.SetParam('Total',FormatFloat('##,##0.00',wtotal));
 // RvCaddevol.SelectReport('Reldevol.rav',True);
 // RvCaddevol.Execute;
  DModRosa.IBQPesq_dev.Close;
  DModRosa.IBQPesq_dev.SQL.Clear;
  DModRosa.IBQPesq_dev.SQL.Add('Select * from DEVOLUCAO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_dev.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

procedure TFrmManutdev.Button1Click(Sender: TObject);
begin
  DModRosa.IBQPesq_dev.Close;
  FrmDevolucao:=TFrmDevolucao.Create(Self);
  FrmDevolucao.edit5.Text:='Implantar';
  FrmDevolucao.ShowModal;
  FrmDevolucao.release;
  DModRosa.IBQPesq_dev.Close;
  DModRosa.IBQPesq_dev.SQL.Clear;
  DModRosa.IBQPesq_dev.SQL.Add('Select * from DEVOLUCAO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_dev.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutdev.Button2Click(Sender: TObject);
begin
  wmarca:=DModRosa.IBQPesq_dev.fields.fields[0].AsString;
  DModRosa.IBQPesq_dev.Close;
  FrmDevolucao:=TFrmDevolucao.Create(Self);
  FrmDevolucao.edit5.Text:='Alterar';
  FrmDevolucao.edit4.Text:=wmarca;
  FrmDevolucao.ShowModal;
  FrmDevolucao.release;
  DModRosa.IBQPesq_dev.Close;
  DModRosa.IBQPesq_dev.SQL.Clear;
  DModRosa.IBQPesq_dev.SQL.Add('Select * from DEVOLUCAO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_dev.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutdev.Button3Click(Sender: TObject);
begin
  wmarca:=DModRosa.IBQPesq_dev.fields.fields[0].AsString;
  DModRosa.IBQPesq_dev.Close;
  FrmDevolucao:=TFrmDevolucao.Create(Self);
  FrmDevolucao.edit5.Text:='Consultar';
  FrmDevolucao.edit4.Text:=wmarca;
  FrmDevolucao.ShowModal;
  FrmDevolucao.release;
  DModRosa.IBQPesq_dev.Close;
  DModRosa.IBQPesq_dev.SQL.Clear;
  DModRosa.IBQPesq_dev.SQL.Add('Select * from DEVOLUCAO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_dev.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutdev.Button4Click(Sender: TObject);
begin
  wmarca:=DModRosa.IBQPesq_dev.fields.fields[0].AsString;
  DModRosa.IBQPesq_dev.Close;
  FrmDevolucao:=TFrmDevolucao.Create(Self);
  FrmDevolucao.edit5.Text:='Excluir';
  FrmDevolucao.edit4.Text:=wmarca;
  FrmDevolucao.ShowModal;
  FrmDevolucao.release;
  DModRosa.IBQPesq_dev.Close;
  DModRosa.IBQPesq_dev.SQL.Clear;
  DModRosa.IBQPesq_dev.SQL.Add('Select * from DEVOLUCAO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_dev.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutdev.Edit1Exit(Sender: TObject);
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
  if DModRosa.IBQPesq_dev.Active=True then
     DModRosa.IBQPesq_dev.Active:=False;
  DModRosa.IBQPesq_dev.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    while Length(edit1.Text)<6 do
          edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_dev.Sql.Add('Select * from DEVOLUCAO '+
                                 'Where NUMNOT=:num_digit');
    DModRosa.IBQPesq_dev.ParamByName('num_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_dev.Active:=True;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    DModRosa.IBQPesq_dev.Sql.Add('Select * from DEVOLUCAO '+
                                 'Where DATNOT=:dat_digit');
    DModRosa.IBQPesq_dev.ParamByName('dat_digit').AsDateTime:=StrToDate(edit1.Text);
    DModRosa.IBQPesq_dev.Active:=True;
  end;
end;

procedure TFrmManutdev.FormShow(Sender: TObject);
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
  if DModRosa.IBQPesq_dev.Active then
     DModRosa.IBQPesq_dev.Active:=False;
  DModRosa.IBQPesq_dev.Sql.Clear;
  DModRosa.IBQPesq_dev.Sql.Add('Select * from DEVOLUCAO '+
                               'Order by Datnot,Numnot');
  DModRosa.IBQPesq_dev.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

end.
