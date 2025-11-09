unit UManutped;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, IBX.IBTable, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmManutped = class(TForm)
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
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    IBQuery1: TIBQuery;
    IBTAuxped: TIBTable;
    IBQAuxped: TIBQuery;
    IBTAuxitped: TIBTable;
    IBQAuxitped: TIBQuery;
    IBQAuxpedPEDIDO: TIBStringField;
    IBQAuxpedCODVEN: TIBStringField;
    IBQAuxpedCODCLI: TIBStringField;
    IBQAuxpedNOMCLI: TIBStringField;
    IBQAuxpedENDCLI: TIBStringField;
    IBQAuxpedBAICLI: TIBStringField;
    IBQAuxpedCIDCLI: TIBStringField;
    IBQAuxpedESTCLI: TIBStringField;
    IBQAuxpedBASE: TDateField;
    IBQAuxpedRECOL: TDateField;
    IBQAuxpedCOBRAN: TDateField;
    IBQAuxpedTOTPED: TIBBCDField;
    IBQAuxpedSITU: TIBStringField;
    IBQAuxpedDATPED: TIBStringField;
    IBQAuxpedSOLICIT: TIBStringField;
    IBQAuxpedRETORNO: TIBStringField;
    IBQAuxpedTOTVEN: TIBBCDField;
    IBQAuxpedDATPAG: TIBStringField;
    IBQAuxpedVALPAG: TIBBCDField;
    IBQAuxpedRESIDUO: TIBBCDField;
    IBQAuxpedCOB: TIBStringField;
    IBQAuxpedLIMITE: TIBStringField;
    IBQAuxitpedPEDIDO: TIBStringField;
    IBQAuxitpedCODART: TIBStringField;
    IBQAuxitpedDESCRICAO: TIBStringField;
    IBQAuxitpedQTDSAI: TIntegerField;
    IBQAuxitpedQTDRET: TIntegerField;
    IBQAuxitpedPRECUS: TIBBCDField;
    IBQAuxitpedPREVEN: TIBBCDField;
    IBQAuxitpedQTDANT: TIntegerField;
    IBQAuxitpedCUSANT: TIBBCDField;
    IBQAuxitpedVENANT: TIBBCDField;
    IBQAuxitpedOPER: TIBStringField;
    Button12: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Button11: TButton;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutped: TFrmManutped;
  wmarca,wgrupo,wdatini,wdatfin,wnumnot,wdatnot,wcodart,wdescricao,wfornec,wcodven: string;
  wquant,wprecus,wpreven,wvalnot,wtotal: Extended;
  wsolic: string;
implementation

{$R *.dfm}

uses UDModRosa, UPedido, URetorno, UPerdido, UBaixaresi,
     UEtiqueta, URelsaida, UVoltaret;

//procedure TFrmManutped.Button11Click(Sender: TObject);
//begin
  {IBQuery1.Open;
  if IBQuery1.FieldByName('Col048').AsString='X' then
  begin
    wdatini:='';
    wdatfin:='';
    wtotal:=0;
    While wdatini='' do
    begin
      wdatini:=InputBox('Informe Inicio de emissão',
                                        'data(DD/MM/AAAA):',' ');
    end;
    While wdatfin='' do
    begin
      wdatfin:=InputBox('Informe Final de emissão',
                                       'data(DD/MM/AAAA):',' ');
    end;
    DModRosa.IBQPesq_ped.Close;
    DModRosa.IBQVer_ped.Close;
    DModRosa.IBQVer_ped.SQL.Clear;
    DModRosa.IBQVer_ped.SQL.Add('Select * from PEDIDO '+
                                 'Where Base>=:ini_digit '+
                                 'and Base<=:fin_digit '+
                                 'Order By Pedido');
    DModRosa.IBQVer_ped.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
    DModRosa.IBQVer_ped.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
    DModRosa.IBQVer_ped.OPen;
    DModRosa.IBQVer_ped.DisableControls;
    DModRosa.IBQVer_ped.First;
    IBTAuxped.EmptyTable;
    IBTAuxitped.EmptyTable;
    while not DModRosa.IBQVer_ped.Eof do
    begin
      wtotpro:=0;
      wnumped:=DModRosa.IBQVer_ped.fieldbyName('Pedido').AsString;
      wdatnot:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Datped').AsDateTime);
      wvalnot:=DModRosa.IBQVer_ped.fieldbyName('Totped').AsFloat;
      wfornec:=DModRosa.IBQVer_ped.fieldbyName('Nomcli').AsString;
      DModRosa.IBQPesq_itped.Close;
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                     'Where Pedido=:num_digit '+
                                     'Order By Codart');
      DModRosa.IBQVer_itped.ParamByName('num_digit').AsString:=wnumped;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wdescricao:=DModRosa.IBQVer_itped.fieldbyName('Descricao').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        wpreven:=DModRosa.IBQVer_itped.fieldbyName('Preven').AsFloat;
        wtotal:=wtotal+(wqtda*wpreven);
        wtotpro:=wqtda*wpreven;
        if IBQAuxitped.Active then
           IBQAuxitped.Active:=False;
        IBQAuxitped.Sql.Clear;
        IBQAuxitped.Sql.Add('Insert Into AUXITENS ');
        IBQAuxitped.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                            'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                     'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                            ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
        IBQAuxitped.ParamByName('PEDIDO').AsString:=wnumped;
        IBQAuxitped.ParamByName('CODART').AsString:=wcodart;
        IBQAuxitped.ParamByName('DESCRICAO').AsString:=wdescricao;
        IBQAuxitped.ParamByName('QTDSAI').AsFloat:=wqtda;
        IBQAuxitped.ParamByName('QTDRET').AsFloat:=0;
        IBQAuxitped.ParamByName('PRECUS').AsFloat:=wpreven;
        IBQAuxitped.ParamByName('PREVEN').AsFloat:=wtotpro;
        IBQAuxitped.ParamByName('QTDANT').AsFloat:=wqtda;
        IBQAuxitped.ParamByName('CUSANT').AsFloat:=0;
        IBQAuxitped.ParamByName('VENANT').AsFloat:=0;
        IBQAuxitped.ParamByName('OPER').AsString:='';
        IBQAuxitped.ExecSql;
        IBQAuxitped.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
      if IBQAuxped.Active then
         IBQAuxped.Active:=False;
      IBQAuxped.Sql.Clear;
      IBQAuxped.Sql.Add('Insert Into AUXPEDIDO ');
      IBQAuxped.Sql.Add('(PEDIDO,CODVEN,CODCLI,NOMCLI,ENDCLI,BAICLI,CIDCLI,ESTCLI,'+
                        'BASE,RECOL,COBRAN,TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                        'VALPAG,RESIDUO,COB,LIMITE) '+
                'Values(:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:ENDCLI,:BAICLI,:CIDCLI,'+
                        ':ESTCLI,:BASE,:RECOL,:COBRAN,:TOTPED,:SITU,:DATPED,:RETORNO,'+
                        ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO,:COB,:LIMITE)');
      IBQAuxped.ParamByName('PEDIDO').AsString:=wnumped;
      IBQAuxped.ParamByName('CODVEN').AsString:='';
      IBQAuxped.ParamByName('CODCLI').AsString:='';
      IBQAuxped.ParamByName('NOMCLI').AsString:=wfornec;
      IBQAuxped.ParamByName('ENDCLI').AsString:='';
      IBQAuxped.ParamByName('BAICLI').AsString:='';
      IBQAuxped.ParamByName('CIDCLI').AsString:='';
      IBQAuxped.ParamByName('ESTCLI').AsString:='';
      IBQAuxped.ParamByName('BASE').AsDateTime:=StrToDate(wdatnot);
      IBQAuxped.ParamByName('RECOL').AsDateTime:=StrToDate(wdatnot);
      IBQAuxped.ParamByName('COBRAN').AsDateTime:=StrToDate(wdatnot);
      IBQAuxped.ParamByName('TOTPED').AsFloat:=wvalnot;
      IBQAuxped.ParamByName('SITU').AsString:='';
      IBQAuxped.ParamByName('DATPED').AsString:=wdatnot;
      IBQAuxped.ParamByName('RETORNO').AsString:='';
      IBQAuxped.ParamByName('TOTVEN').AsFloat:=0;
      IBQAuxped.ParamByName('DATPAG').AsString:='';
      IBQAuxped.ParamByName('VALPAG').AsFloat:=0;
      IBQAuxped.ParamByName('RESIDUO').AsFloat:=0;
      IBQAuxped.ParamByName('COB').AsString:='';
      IBQAuxped.ParamByName('LIMITE').AsFloat:=0;
      IBQAuxped.ExecSql;
      IBQAuxped.Close;
      DModRosa.IBQVer_ped.Next;
    end;
    DModRosa.IBQVer_ped.Close;
    IBQAuxped.Close;
    IBQAuxped.SQL.Clear;
    IBQAuxped.SQL.Add('Select * from AUXPEDIDO '+
                      'Order By Pedido');
    IBQAuxped.OPen;
    IBQAuxped.Close;
    IBQAuxitped.Close;
    IBQAuxitped.SQL.Clear;
    IBQAuxitped.SQL.Add('Select * from AUXITENS '+
                        'Order By Pedido,Codart');
    IBQAuxitped.OPen;
    IBQAuxitped.Close;
    // Emite a relação ******************
    RvCadped.Setparam('Periodo',wdatini+' A '+wdatfin);
    RvCadped.SetParam('Total',FormatFloat('##,##0.00',wtotal));
    RvCadped.SelectReport('Relcomp.rav',True);
    RvCadped.Execute;
  end else
      Showmessage('Não Autorizado !!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit; }
// end;

procedure TFrmManutped.Button10Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col054').AsString='X' then
  begin
    DModRosa.IBQPesq_ped.Close;
    FrmRelSaida:=TFrmRelSaida.Create(Self);
    FrmRelSaida.edit11.Text:='XXXXXXX';
    FrmRelSaida.ShowModal;
    FrmRelSaida.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

procedure TFrmManutped.Button11Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col049').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmVoltaret:=TFrmVoltaret.Create(Self);
    FrmVoltaret.Edit4.Text:=wmarca;
    FrmVoltaret.ShowModal;
    FrmVoltaret.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button12Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col045').AsString='X' then
  begin
    DModRosa.IBQPesq_ped.Close;
    FrmEtiqueta:=TFrmEtiqueta.Create(Self);
    FrmEtiqueta.ShowModal;
    FrmEtiqueta.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col045').AsString='X' then
  begin
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmPedido:=TFrmPedido.Create(Self);
    FrmPedido.Edit6.Text:='Implantar';
    FrmPedido.ShowModal;
    FrmPedido.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button2Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col046').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmPedido:=TFrmPedido.Create(Self);
    FrmPedido.Edit1.Text:=wmarca;
    FrmPedido.Edit6.Text:='Alterar';
    FrmPedido.ShowModal;
    FrmPedido.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button3Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col047').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmPedido:=TFrmPedido.Create(Self);
    FrmPedido.Edit1.Text:=wmarca;
    FrmPedido.Edit6.Text:='Consultar';
    FrmPedido.ShowModal;
    FrmPedido.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button4Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col048').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmPedido:=TFrmPedido.Create(Self);
    FrmPedido.Edit1.Text:=wmarca;
    FrmPedido.Edit6.Text:='Excluir';
    FrmPedido.ShowModal;
    FrmPedido.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button5Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col049').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmRetorno:=TFrmRetorno.Create(Self);
    FrmRetorno.Edit4.Text:=wmarca;
    FrmRetorno.ShowModal;
    FrmRetorno.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button6Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col050').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmBaixaresi:=TFrmBaixaresi.Create(Self);
    FrmBaixaresi.Edit1.Text:=wmarca;
    FrmBaixaresi.ShowModal;
    FrmBaixaresi.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button7Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col051').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    if not DModRosa.IBDataBase1.connected then
       DModRosa.IBDatabase1.connected:=True;
    FrmPerdido:=TFrmPerdido.Create(Self);
    FrmPerdido.Edit4.Text:=wmarca;
    FrmPerdido.ShowModal;
    FrmPerdido.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Button8Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col052').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_ped.fields.fields[1].AsString;
    DModRosa.IBQPesq_ped.Close;
    FrmRelsaida:=TFrmRelsaida.Create(Self);
    FrmRelsaida.edit1.Text:=wmarca;
    FrmRelsaida.edit7.text:='XX';
    FrmRelsaida.ShowModal;
    FrmRelsaida.release;
  end else
      showmessage(' Não Autorizado !!!');
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutped.Button9Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col053').AsString='X' then
  begin
    DModRosa.IBQPesq_ped.Close;
    FrmRelsaida:=TFrmRelsaida.Create(Self);
    FrmRelsaida.edit4.text:='XX';
    FrmRelsaida.ShowModal;
    FrmRelsaida.release;
  end else
      showmessage('Não Autorizado !!!'  );
  DModRosa.IBQPesq_ped.Close;
  DModRosa.IBQPesq_ped.SQL.Clear;
  DModRosa.IBQPesq_ped.SQL.Add('Select * from PEDIDO '+
                               'Order By Pedido');
  DModRosa.IBQPesq_ped.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutped.Edit1Exit(Sender: TObject);
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
  if DModRosa.IBQPesq_ped.Active=True then
     DModRosa.IBQPesq_ped.Active:=False;
  DModRosa.IBQPesq_ped.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    while Length(edit1.Text)<6 do
        edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_ped.Sql.Add('Select * from PEDIDO '+
                                  'Where PEDIDO=:num_digit');
    DModRosa.IBQPesq_ped.ParamByName('num_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_ped.Active:=True;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    DModRosa.IBQPesq_ped.Sql.Add('Select * from PEDIDO '+
                                 'Where DATPED=:dat_digit');
    DModRosa.IBQPesq_ped.ParamByName('dat_digit').AsDateTime:=StrToDate(edit1.Text);
    DModRosa.IBQPesq_ped.Active:=True;
  end;
  if ComboBox1.ItemIndex=2 then
  begin
    DModRosa.IBQPesq_ped.Sql.Add('Select * from PEDIDO '+
                                 'Where Nomcli LIKE '+#39+'%'+edit1.Text+'%'+#39);
    DModRosa.IBQPesq_ped.Active:=True;
  end;
  if ComboBox1.ItemIndex=3 then
  begin
    while Length(edit1.Text)<3 do
        edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_ped.Sql.Add('Select * from PEDIDO '+
                                 'Where CODVEN=:ven_digit');
    DModRosa.IBQPesq_ped.ParamByName('ven_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_ped.Active:=True;
  end;
end;

procedure TFrmManutped.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmManutped.FormShow(Sender: TObject);
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
  if DModRosa.IBQPesq_ped.Active then
     DModRosa.IBQPesq_ped.Active:=False;
  DModRosa.IBQPesq_ped.Sql.Clear;
  DModRosa.IBQPesq_ped.Sql.Add('Select * from PEDIDO '+
                               'Order by Pedido');
  DModRosa.IBQPesq_ped.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

end.
