unit URelsaida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBTable, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, frxClass, frxDBSet;

type
  TFrmRelsaida = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Edit7: TEdit;
    Edit4: TEdit;
    Edit11: TEdit;
    Edit1: TEdit;
    Button3: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit9: TEdit;
    Edit10: TEdit;
    Button4: TButton;
    Button5: TButton;
    RvEtiqueta: TfrxReport;
    RvFaixa: TfrxReport;
    RvPedvenda: TfrxReport;
    DtsEtiqueta: TfrxDBDataset;
    DTsFaixa: TfrxDBDataset;
    DtsPedvenda: TfrxDBDataset;
    RvPedvenda1: TfrxReport;
    DtsPevenda1: TfrxDBDataset;
    IBQAuxetiqueta: TIBQuery;
    IBQAuxmaped: TIBQuery;
    IBQAuxrecibo: TIBQuery;
    IBTAuxetiqueta: TIBTable;
    IBTAuxmaped: TIBTable;
    IBTAuxrecibo: TIBTable;
    IBTAuxetiquetaCODETIQ: TIBStringField;
    IBTAuxetiquetaCODCLI: TIBStringField;
    IBTAuxetiquetaNOMCLI: TIBStringField;
    IBTAuxetiquetaSOBNOM: TIBStringField;
    IBTAuxetiquetaBAIRRO: TIBStringField;
    IBTAuxetiquetaCODVEN: TIBStringField;
    IBTAuxetiquetaNOMVEN: TIBStringField;
    IBTAuxmapedPEDIDO: TIBStringField;
    IBTAuxmapedCODVEN: TIBStringField;
    IBTAuxmapedCODCLI: TIBStringField;
    IBTAuxmapedNOMCLI: TIBStringField;
    IBTAuxmapedENDCLI: TIBStringField;
    IBTAuxmapedBAICLI: TIBStringField;
    IBTAuxmapedCIDCLI: TIBStringField;
    IBTAuxmapedESTCLI: TIBStringField;
    IBTAuxmapedBASE: TDateField;
    IBTAuxmapedRECOL: TDateField;
    IBTAuxmapedCOBRAN: TDateField;
    IBTAuxmapedTOTPED: TIBBCDField;
    IBTAuxmapedSITU: TIBStringField;
    IBTAuxmapedDATPED: TIBStringField;
    IBTAuxmapedSOLICIT: TIBStringField;
    IBTAuxmapedRETORNO: TIBStringField;
    IBTAuxmapedTOTVEN: TIBBCDField;
    IBTAuxmapedDATPAG: TIBStringField;
    IBTAuxmapedVALPAG: TIBBCDField;
    IBTAuxmapedRESIDUO: TIBBCDField;
    IBTAuxmapedCOB: TIBStringField;
    IBTAuxmapedLIMITE: TIBStringField;
    IBQAuxmapedPEDIDO: TIBStringField;
    IBQAuxmapedCODVEN: TIBStringField;
    IBQAuxmapedCODCLI: TIBStringField;
    IBQAuxmapedNOMCLI: TIBStringField;
    IBQAuxmapedENDCLI: TIBStringField;
    IBQAuxmapedBAICLI: TIBStringField;
    IBQAuxmapedCIDCLI: TIBStringField;
    IBQAuxmapedESTCLI: TIBStringField;
    IBQAuxmapedBASE: TDateField;
    IBQAuxmapedRECOL: TDateField;
    IBQAuxmapedCOBRAN: TDateField;
    IBQAuxmapedTOTPED: TIBBCDField;
    IBQAuxmapedSITU: TIBStringField;
    IBQAuxmapedDATPED: TIBStringField;
    IBQAuxmapedSOLICIT: TIBStringField;
    IBQAuxmapedRETORNO: TIBStringField;
    IBQAuxmapedTOTVEN: TIBBCDField;
    IBQAuxmapedDATPAG: TIBStringField;
    IBQAuxmapedVALPAG: TIBBCDField;
    IBQAuxmapedRESIDUO: TIBBCDField;
    IBQAuxmapedCOB: TIBStringField;
    IBQAuxmapedLIMITE: TIBStringField;
    IBTAuxreciboITEM: TIBStringField;
    IBTAuxreciboCODART: TIBStringField;
    IBTAuxreciboDESCRICAO: TIBStringField;
    IBTAuxreciboQTDSAI: TIBStringField;
    IBTAuxreciboQTDRET: TIBStringField;
    IBTAuxreciboPRECUS: TIBStringField;
    IBTAuxreciboPREVEN: TIBStringField;
    IBTAuxreciboQTDANT: TIBStringField;
    IBTAuxreciboCUSANT: TIBStringField;
    IBTAuxreciboVENANT: TIBStringField;
    IBTAuxreciboOPER: TIBStringField;
    IBQAuxreciboITEM: TIBStringField;
    IBQAuxreciboCODART: TIBStringField;
    IBQAuxreciboDESCRICAO: TIBStringField;
    IBQAuxreciboQTDSAI: TIBStringField;
    IBQAuxreciboQTDRET: TIBStringField;
    IBQAuxreciboPRECUS: TIBStringField;
    IBQAuxreciboPREVEN: TIBStringField;
    IBQAuxreciboQTDANT: TIBStringField;
    IBQAuxreciboCUSANT: TIBStringField;
    IBQAuxreciboVENANT: TIBStringField;
    IBQAuxreciboOPER: TIBStringField;
    DtsEtiqped2: TfrxDBDataset;
    RvEtiqped2: TfrxReport;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RvFaixaGetValue(const VarName: string; var Value: Variant);
    procedure RvPedvendaGetValue(const VarName: string; var Value: Variant);
    procedure RvPedvenda1GetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelSaida: TFrmRelSaida;
  wsitu,wemissao,wvencimto,wdevoluc,wnumcli,wnomcli,wvend,wvia,wcontato,wturno: string;
  index_lin,cont_pag,xvia,wtotart: Integer;
  wqtda,wtotqtd,wqtart,wprecxg,wqtdr,wvendido,wtotvendido: Extended;
  wprecus,wpreven,wtotpro,wtotped,wtotqtda,wtotven: extended;
  wendereco,wbairro,wcidade,westado,wreferencia,wcep,wnumped,wnumero,wcodven: string;
  wretorno,wcodart,wvencmto,wdescricao,wsoli,wnomvend,wpraca,wrota,wdatped,wreferencias: string;
  wnompraca,wnomrota,wobser,wncpf,wnifp,wtelcli,wnomven,wtelven,whorini,whorfin: string;
  wtotpedid,wtotvenda,wtotretor,xretor,xvendeu,xvalven: extended;

implementation

uses UDModRosa;

{$R *.dfm}

procedure TFrmRelsaida.Button1Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.clear;
  edit7.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmRelsaida.Button3Click(Sender: TObject);
begin
  xretor:=0;
  xvendeu:=0;
  xvalven:=0;
  wtotart:=0;
  wtotqtda:=0;
  wvendido:=0;
  wtotvendido:=0;
  index_lin:=0;
  IBTAuxrecibo.EmptyTable;
  // Ler Itens do pedido *********************
  DModRosa.IBQLer_itped.Close;
  DModRosa.IBQLer_itped.SQL.Clear;
  DModRosa.IBQLer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                'Where Pedido=:ped_digit '+
                                'Order by Codart');
  DModRosa.IBQLer_itped.ParamByName('ped_digit').AsString:=edit1.Text;
  DModRosa.IBQLer_itped.OPen;
  DModRosa.IBQLer_itped.DisableControls;
  DModRosa.IBQLer_itped.First;
  while not DModRosa.IBQLer_itped.Eof do
  begin
    index_lin:=index_lin+1;
    wrota:=IntToStr(Index_lin);
    //  Preencher com zeros a Esquerda
    while Length(wrota)<3 do
          wrota:='0'+wrota;
    wnumped:=DModRosa.IBQLer_itped.fieldbyName('Pedido').AsString;
    wcodart:=DModRosa.IBQLer_itped.fieldbyName('Codart').AsString;
    wdescricao:=DModRosa.IBQLer_itped.fieldbyName('Descricao').AsString;
    wqtda:=DModRosa.IBQLer_itped.fieldbyName('Qtdsai').AsFloat;
    wqtdr:=DModRosa.IBQLer_itped.fieldByName('Qtdret').AsFloat;
    wprecus:=DModRosa.IBQLer_itped.fieldbyName('Precus').AsFloat;
    wpreven:=DModRosa.IBQLer_itped.fieldbyName('Preven').AsFloat;
    wvendido:=wvendido+(wpreven*wqtda);
    wtotqtda:=wtotqtda+wqtda;
    wtotart:=wtotart+1;
    if wsitu<>'E' then
    begin
      xretor:=xretor+wqtdr;
      xvendeu:=xvendeu+(wqtda-wqtdr);
      xvalven:=xvalven+(wprecus*(wqtda-wqtdr));
    end;
    if IBQAuxrecibo.Active then
       IBQAuxrecibo.Active:=False;
    IBQAuxrecibo.Sql.Clear;
    IBQAuxrecibo.Sql.Add('Insert Into AUXRECIBO ');
    IBQAuxrecibo.Sql.Add('(ITEM,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                         'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                 'Values(:ITEM,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                        ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
    IBQAuxrecibo.ParamByName('ITEM').AsString:=wrota;
    IBQAuxrecibo.ParamByName('CODART').AsString:=wcodart;
    IBQAuxrecibo.ParamByName('DESCRICAO').AsString:=wdescricao;
    IBQAuxrecibo.ParamByName('QTDSAI').AsString:=FormatFloat('#,##0',wqtda);
    if wsitu='E' then
    begin
      IBQAuxrecibo.ParamByName('QTDRET').AsString:=' ';
      IBQAuxrecibo.ParamByName('QTDANT').AsString:=' ';
      IBQAuxrecibo.ParamByName('VENANT').AsString:=' ';;
    end else
    begin
      IBQAuxrecibo.ParamByName('QTDRET').AsString:=FormatFloat('#,##0',wqtdr);
      IBQAuxrecibo.ParamByName('QTDANT').AsString:=FormatFloat('#,##0',wqtda-wqtdr);
      IBQAuxrecibo.ParamByName('VENANT').AsString:=FormatFloat('##,##0.00',(wprecus*(wqtda-wqtdr)));
      wtotvendido:=wtotvendido+(wprecus*(wqtda-wqtdr));
    end;
    IBQAuxrecibo.ParamByName('PRECUS').AsString:=FormatFloat('##,##0.00',wprecus);
    IBQAuxrecibo.ParamByName('PREVEN').AsString:=FormatFloat('##,##0.00',wpreven);
    IBQAuxrecibo.ParamByName('CUSANT').AsString:=FormatFloat('##,##0.00',(wprecus*wqtda));
    IBQAuxrecibo.ParamByName('OPER').AsString:='R';
    IBQAuxrecibo.ExecSql;
    IBQAuxrecibo.Close;
    DModRosa.IBQLer_itped.Next;
  end;
  DModRosa.IBQLer_itped.Close;
  {While index_lin<24 do
  begin
    index_lin:=index_lin+1;
    wrota:=IntToStr(Index_lin);
    //  Preencher com zeros a Esquerda
    while Length(wrota)<3 do
          wrota:='0'+wrota;
    if IBQAuxrecibo.Active then
       IBQAuxrecibo.Active:=False;
    IBQAuxrecibo.Sql.Clear;
    IBQAuxrecibo.Sql.Add('Insert Into AUXRECIBO ');
    IBQAuxrecibo.Sql.Add('(ITEM,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                         'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                 'Values(:ITEM,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                        ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
    IBQAuxrecibo.ParamByName('ITEM').AsString:=wrota;
    IBQAuxrecibo.ParamByName('CODART').AsString:=' ';
    IBQAuxrecibo.ParamByName('DESCRICAO').AsString:=' ';
    IBQAuxrecibo.ParamByName('QTDSAI').AsString:=' ';
    IBQAuxrecibo.ParamByName('QTDRET').AsString:=' ';
    IBQAuxrecibo.ParamByName('PRECUS').AsString:=' ';
    IBQAuxrecibo.ParamByName('PREVEN').AsString:=' ';
    IBQAuxrecibo.ParamByName('QTDANT').AsString:=' ';
    IBQAuxrecibo.ParamByName('CUSANT').AsString:=' ';
    IBQAuxrecibo.ParamByName('VENANT').AsString:=' ';
    IBQAuxrecibo.ParamByName('OPER').AsString:='R';
    IBQAuxrecibo.ExecSql;
    IBQAuxrecibo.Close;
  end;
  IBQAuxrecibo.Close; }
  IBQAuxrecibo.SQL.Clear;
  IBQAuxrecibo.SQL.Add('Select * from AUXRECIBO '+
                       'Order by Item');
  IBQAuxrecibo.OPen;
  IBQAuxrecibo.Close;
  RvPedvenda.showreport;
  // Atualiza o numero da via *******************
  DModRosa.IBQVer_ped.Sql.Clear;
  DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
  DModRosa.IBQVer_ped.Sql.Add('Set VIA=:via_digit '+
                              'Where PEDIDO=:ped_digit');
  DModRosa.IBQVer_ped.ParamByName('via_digit').AsString:=wvia;
  DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
  DModRosa.IBQVer_ped.ExecSql;
  DModRosa.IBQVer_ped.Close;
  DModRosa.IBTransaction1.Commit;
  DModRosa.IBQVer_ped.Close;
  Button1Click(Sender);
  exit;
end;

procedure TFrmRelsaida.Button4Click(Sender: TObject);
begin
  wtotpedid:=0;
  wtotvenda:=0;
  wtotretor:=0;
  while Length(edit10.Text)<6 do
        edit10.Text:='0'+edit10.Text;
  IBTAuxmaped.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Pedido>=:pedi_digit '+
                              'and Pedido<=:pedf_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('pedi_digit').AsString:=edit9.Text;
  DModRosa.IBQLer_ped.ParamByName('pedf_digit').AsString:=edit10.Text;
  DModRosa.IBQLer_ped.Active:=True;
  if DModRosa.IBQLer_ped.RecordCount=0 then
  begin
    DModRosa.IBQLer_ped.Close;
    showmessage('Não achei pedido na faixa');
    edit3.Clear;
    edit3.SetFocus;
    exit;
  end;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wpraca:='';
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wcodven:=DModRosa.IBQLer_ped.fieldbyName('Codven').AsString;
    wnumcli:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
    wnomcli:=DModRosa.IBQLer_ped.fieldbyName('Nomcli').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    wdevoluc:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Recol').AsDateTime);
    wvencmto:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Cobran').AsDateTime);
    wtotpedid:=wtotpedid+DModRosa.IBQLer_ped.fieldbyName('Totped').AsFloat;
    wtotvenda:=wtotvenda+DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
    wtotretor:=wtotretor+(DModRosa.IBQLer_ped.fieldbyName('Totped').AsFloat-
                          DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat);
    wdatped:=DModRosa.IBQLer_ped.fieldbyName('Datped').AsString;
    wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
    // Ler o cliente ***********************************
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQVer_cli.SQL.Clear;
    DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Idcli=:cli_digit');
    DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
    DModRosa.IBQVer_cli.OPen;
    if DModRosa.IBQVer_cli.RecordCount>0 then
    begin
      wpraca:=DModRosa.IBQVer_cli.fieldbyName('Praca').AsString ;
    end;
    DModRosa.IBQVer_cli.Close;
    // Ler a praça do cliente ***************
    DModRosa.IBQVer_rot.Close;
    DModRosa.IBQVer_rot.SQL.Clear;
    DModRosa.IBQVer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQVer_rot.ParamByName('rot_digit').AsString:=wpraca;
    DModRosa.IBQVer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQVer_rot.OPen;
    if DModRosa.IBQVer_rot.RecordCount>0 then
       wbairro:=DModRosa.IBQVer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQVer_rot.close;
    if IBQAuxmaped.Active then
       IBQAuxmaped.Active:=False;
    IBQAuxmaped.Sql.Clear;
    IBQAuxmaped.Sql.Add('Insert Into AUXPEDIDO ');
    IBQAuxmaped.Sql.Add('(PEDIDO,CODVEN,CODCLI,NOMCLI,ENDCLI,BAICLI,CIDCLI,ESTCLI,'+
                        'BASE,RECOL,COBRAN,TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                        'VALPAG,RESIDUO,COB,LIMITE) '+
                'Values(:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:ENDCLI,:BAICLI,:CIDCLI,'+
                        ':ESTCLI,:BASE,:RECOL,:COBRAN,:TOTPED,:SITU,:DATPED,:RETORNO,'+
                        ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO,:COB,:LIMITE)');
    IBQAuxmaped.ParamByName('PEDIDO').AsString:=wnumero;
    IBQAuxmaped.ParamByName('CODVEN').AsString:=wcodven;
    IBQAuxmaped.ParamByName('CODCLI').AsString:=wnumcli;
    IBQAuxmaped.ParamByName('NOMCLI').AsString:=wnomcli;
    IBQAuxmaped.ParamByName('ENDCLI').AsString:='';
    IBQAuxmaped.ParamByName('BAICLI').AsString:=wbairro;
    IBQAuxmaped.ParamByName('CIDCLI').AsString:='';
    IBQAuxmaped.ParamByName('ESTCLI').AsString:='';
    IBQAuxmaped.ParamByName('BASE').AsDateTime:=StrToDate(wemissao);
    IBQAuxmaped.ParamByName('RECOL').AsDateTime:=StrToDate(wdevoluc);
    IBQAuxmaped.ParamByName('COBRAN').AsDateTime:=StrToDate(wvencmto);
    IBQAuxmaped.ParamByName('TOTPED').AsFloat:=0;
    IBQAuxmaped.ParamByName('SITU').AsString:=wsitu;
    IBQAuxmaped.ParamByName('DATPED').AsString:=wdatped;
    IBQAuxmaped.ParamByName('RETORNO').AsString:='';
    IBQAuxmaped.ParamByName('TOTVEN').AsFloat:=0;
    IBQAuxmaped.ParamByName('DATPAG').AsString:='';
    IBQAuxmaped.ParamByName('VALPAG').AsFloat:=0;
    IBQAuxmaped.ParamByName('RESIDUO').AsFloat:=0;
    IBQAuxmaped.ParamByName('COB').AsString:='';
    IBQAuxmaped.ParamByName('LIMITE').AsFloat:=0;
    IBQAuxmaped.ExecSql;
    IBQAuxmaped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  IBQAuxmaped.Close;
  IBQAuxmaped.SQL.Clear;
  IBQAuxmaped.SQL.Add('Select * from AUXPEDIDO '+
                    'Order By Pedido');
  IBQAuxmaped.OPen;
  IBQAuxmaped.Close;
  // Emite a relação ******************
  RvFaixa.ShowReport;
end;

procedure TFrmRelsaida.Button5Click(Sender: TObject);
begin
   if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Pedido>=:pedi_digit '+
                              'and Pedido<=:pedf_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('pedi_digit').AsString:=edit9.Text;
  DModRosa.IBQLer_ped.ParamByName('pedf_digit').AsString:=edit10.Text;
  DModRosa.IBQLer_ped.Active:=True;
  if DModRosa.IBQLer_ped.RecordCount=0 then
  begin
    DModRosa.IBQLer_ped.Close;
    showmessage('Não achei pedido na faixa');
    edit3.Clear;
    edit3.SetFocus;
    exit;
  end;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumped:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wnumcli:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    wdevoluc:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Recol').AsDateTime);
    wvencmto:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Cobran').AsDateTime);
    wretorno:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    wtotped:=DModRosa.IBQLer_ped.fieldbyName('Totped').AsFloat;
    wtotven:=DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
    wvend:=DModRosa.IBQLer_ped.fieldbyName('Codven').AsString;
    wsoli:=DModRosa.IBQLer_ped.fieldbyName('Solicit').AsString;
    wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
    xvia:=StrToInt(DModRosa.IBQLer_ped.fieldbyName('Via').AsString);
    while Length(wnumcli)<4 do
          wnumcli:='0'+wnumcli;
    // Ler Cliente *************************
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQVer_cli.SQL.Clear;
    DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Idcli=:cli_digit');
    DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
    DModRosa.IBQVer_cli.OPen;
    if DModRosa.IBQVer_cli.RecordCount>0 then
    begin
      wnomcli:=DModRosa.IBQVer_cli.fieldbyName('Nome').AsString ;
      wendereco:=DModRosa.IBQVer_cli.fieldbyName('Ende').AsString;
      wcontato:=DModRosa.IBQVer_cli.fieldbyName('Conta').AsString;
      wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString ;
      wcidade:=DModRosa.IBQVer_cli.fieldbyName('Cida').AsString;
      wcep:=DModRosa.IBQVer_cli.fieldbyName('Ncep').AsString ;
      westado:=DModRosa.IBQVer_cli.fieldbyName('Esta').AsString ;
      wncpf:=DModRosa.IBQVer_cli.fieldbyName('Ncpf').AsString ;
      wnifp:=DModRosa.IBQVer_cli.fieldbyName('Nifp').AsString;
      wtelcli:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString ;
      wreferencia:=DModRosa.IBQVer_cli.fieldbyName('Refer').AsString;
      whorini:=DModRosa.IBQVer_cli.fieldbyName('Horain').AsString;
      whorfin:=DModRosa.IBQVer_cli.fieldbyName('Horafin').AsString;
      wturno:=DModRosa.IBQVer_cli.fieldbyName('Esped').AsString;
      wreferencias:=DModRosa.IBQVer_cli.fieldbyName('Refer').AsString;
    end;
    DModRosa.IBQVer_cli.Close;
    // Ler Vendedor ***********************************
    DModRosa.IBQVer_ven.Close;
    DModRosa.IBQVer_ven.SQL.Clear;
    DModRosa.IBQVer_ven.SQL.Add('Select * from VENDEDOR '+
                                'Where Codven=:ven_digit');
    DModRosa.IBQVer_ven.ParamByName('ven_digit').AsString:=wvend;
    DModRosa.IBQVer_ven.OPen;
    if DModRosa.IBQVer_ven.RecordCount>0 then
    begin
      wnomven:=DModRosa.IBQVer_ven.fieldbyName('Nome').AsString ;
      wtelven:=DModRosa.IBQVer_ven.fieldbyName('Ntel').AsString;
    end;
    DModRosa.IBQVer_ven.Close;
    wtotart:=0;
    wtotqtda:=0;
    wvendido:=0;
    index_lin:=0;
    IBTAuxrecibo.EmptyTable;
    // Ler Itens do pedido *********************
    DModRosa.IBQLer_itped.Close;
    DModRosa.IBQLer_itped.SQL.Clear;
    DModRosa.IBQLer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQLer_itped.ParamByName('ped_digit').AsString:=wnumped;
    DModRosa.IBQLer_itped.OPen;
    DModRosa.IBQLer_itped.DisableControls;
    DModRosa.IBQLer_itped.First;
    while not DModRosa.IBQLer_itped.Eof do
    begin
      index_lin:=index_lin+1;
      wrota:=IntToStr(Index_lin);
      //  Preencher com zeros a Esquerda
      while Length(wrota)<3 do
            wrota:='0'+wrota;
      wnumped:=DModRosa.IBQLer_itped.fieldbyName('Pedido').AsString;
      wcodart:=DModRosa.IBQLer_itped.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQLer_itped.fieldbyName('Descricao').AsString;
      wqtda:=DModRosa.IBQLer_itped.fieldbyName('Qtdsai').AsFloat;
      wqtdr:=DModRosa.IBQLer_itped.fieldByName('Qtdret').AsFloat;
      wprecus:=DModRosa.IBQLer_itped.fieldbyName('Precus').AsFloat;
      wpreven:=DModRosa.IBQLer_itped.fieldbyName('Preven').AsFloat;
      wvendido:=wvendido+(wpreven*wqtda);
      wtotqtda:=wtotqtda+wqtda;
      wtotart:=wtotart+1;
      if IBQAuxrecibo.Active then
         IBQAuxrecibo.Active:=False;
      IBQAuxrecibo.Sql.Clear;
      IBQAuxrecibo.Sql.Add('Insert Into AUXRECIBO ');
      IBQAuxrecibo.Sql.Add('(ITEM,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                           'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                   'Values(:ITEM,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                          ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
      IBQAuxrecibo.ParamByName('ITEM').AsString:=wrota;
      IBQAuxrecibo.ParamByName('CODART').AsString:=wcodart;
      IBQAuxrecibo.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQAuxrecibo.ParamByName('QTDSAI').AsString:=FormatFloat('#,##0',wqtda);
      if wsitu='E' then
      begin
        IBQAuxrecibo.ParamByName('QTDRET').AsString:=' ';
        IBQAuxrecibo.ParamByName('QTDANT').AsString:=' ';
        IBQAuxrecibo.ParamByName('VENANT').AsString:=' ';;
      end else
      begin
        IBQAuxrecibo.ParamByName('QTDRET').AsString:=FormatFloat('#,##0',wqtdr);
        IBQAuxrecibo.ParamByName('QTDANT').AsString:=FormatFloat('#,##0',wqtda-wqtdr);
        IBQAuxrecibo.ParamByName('VENANT').AsString:=FormatFloat('##,##0.00',(wprecus*(wqtda-wqtdr)));
      end;
      IBQAuxrecibo.ParamByName('PRECUS').AsString:=FormatFloat('##,##0.00',wprecus);
      IBQAuxrecibo.ParamByName('PREVEN').AsString:=FormatFloat('##,##0.00',wpreven);
      IBQAuxrecibo.ParamByName('CUSANT').AsString:=FormatFloat('##,##0.00',(wprecus*wqtda));
      IBQAuxrecibo.ParamByName('OPER').AsString:='R';
      IBQAuxrecibo.ExecSql;
      IBQAuxrecibo.Close;
      DModRosa.IBQLer_itped.Next;
    end;
    DModRosa.IBQLer_itped.Close;
    While index_lin<24 do
    begin
      index_lin:=index_lin+1;
      wrota:=IntToStr(Index_lin);
      //  Preencher com zeros a Esquerda
      while Length(wrota)<3 do
            wrota:='0'+wrota;
      if IBQAuxrecibo.Active then
         IBQAuxrecibo.Active:=False;
      IBQAuxrecibo.Sql.Clear;
      IBQAuxrecibo.Sql.Add('Insert Into AUXRECIBO ');
      IBQAuxrecibo.Sql.Add('(ITEM,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                           'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                   'Values(:ITEM,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                          ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
      IBQAuxrecibo.ParamByName('ITEM').AsString:=wrota;
      IBQAuxrecibo.ParamByName('CODART').AsString:=' ';
      IBQAuxrecibo.ParamByName('DESCRICAO').AsString:=' ';
      IBQAuxrecibo.ParamByName('QTDSAI').AsString:=' ';
      IBQAuxrecibo.ParamByName('QTDRET').AsString:=' ';
      IBQAuxrecibo.ParamByName('PRECUS').AsString:=' ';
      IBQAuxrecibo.ParamByName('PREVEN').AsString:=' ';
      IBQAuxrecibo.ParamByName('QTDANT').AsString:=' ';
      IBQAuxrecibo.ParamByName('CUSANT').AsString:=' ';
      IBQAuxrecibo.ParamByName('VENANT').AsString:=' ';
      IBQAuxrecibo.ParamByName('OPER').AsString:='R';
      IBQAuxrecibo.ExecSql;
      IBQAuxrecibo.Close;
    end;
    IBQAuxrecibo.Close;
    IBQAuxrecibo.SQL.Clear;
    IBQAuxrecibo.SQL.Add('Select * from AUXRECIBO '+
                         'Order by Item');
    IBQAuxrecibo.OPen;
    IBQAuxrecibo.Close;
    RvPedvenda1.Showreport;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  Button1Click(Sender);
  exit;
end;

procedure TFrmRelsaida.Edit10Exit(Sender: TObject);
begin
  while Length(edit10.Text)<6 do
        edit10.Text:='0'+edit10.Text;
end;

procedure TFrmRelsaida.Edit1Exit(Sender: TObject);
begin
   edit7.color:=clRed;
  //  Preencher com zeros a Esquerda
  while Length(edit1.Text)<edit1.MaxLength do
        edit1.Text := '0' + edit1.Text;
  wvia:='';
  wqtart:=0;
  wtotqtd:=0;
  wtotped:=0;
  wtotpro:=0;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Pedido=:ped_digit');
  DModRosa.IBQLer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
  DModRosa.IBQLer_ped.Active:=True;
  if DModRosa.IBQLer_ped.RecordCount=0 then
  begin
    DModRosa.IBQLer_ped.Close;
    showmessage('Não achei este pedido solicitado');
    Button1Click(Sender);
    exit;
  end;
  wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
  if wsitu='E' then
  begin
    DModRosa.IBQLer_ped.Close;
    showmessage('Pedido não retornou');
    Button1Click(Sender);
    exit;
  end;
  wnumped:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
  wnumcli:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
  wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
  wdevoluc:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Recol').AsDateTime);
  wvencmto:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Cobran').AsDateTime);
  wretorno:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
  wtotped:=DModRosa.IBQLer_ped.fieldbyName('Totped').AsFloat;
  wtotven:=DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
  wvend:=DModRosa.IBQLer_ped.fieldbyName('Codven').AsString;
  wsoli:=DModRosa.IBQLer_ped.fieldbyName('Solicit').AsString;
  xvia:=StrToInt(DModRosa.IBQLer_ped.fieldbyName('Via').AsString);
  if xvia<9 then
     xvia:=xvia+1;
  wvia:=IntToStr(xvia);
  DModRosa.IBQLer_ped.Close;
  while Length(wnumcli)<4 do
        wnumcli:='0'+wnumcli;
  // Ler Cliente *************************
  DModRosa.IBQVer_cli.Close;
  DModRosa.IBQVer_cli.SQL.Clear;
  DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                              'Where Idcli=:cli_digit');
  DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
  DModRosa.IBQVer_cli.OPen;
  if DModRosa.IBQVer_cli.RecordCount>0 then
  begin
    wnomcli:=DModRosa.IBQVer_cli.fieldbyName('Nome').AsString ;
    wendereco:=DModRosa.IBQVer_cli.fieldbyName('Ende').AsString;
    wcontato:=DModRosa.IBQVer_cli.fieldbyName('Conta').AsString;
    wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString ;
    wcidade:=DModRosa.IBQVer_cli.fieldbyName('Cida').AsString;
    wcep:=DModRosa.IBQVer_cli.fieldbyName('Ncep').AsString ;
    westado:=DModRosa.IBQVer_cli.fieldbyName('Esta').AsString ;
    wncpf:=DModRosa.IBQVer_cli.fieldbyName('Ncpf').AsString ;
    wnifp:=DModRosa.IBQVer_cli.fieldbyName('Nifp').AsString;
    wtelcli:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString ;
    wreferencia:=DModRosa.IBQVer_cli.fieldbyName('Refer').AsString;
    whorini:=DModRosa.IBQVer_cli.fieldbyName('Horain').AsString;
    whorfin:=DModRosa.IBQVer_cli.fieldbyName('Horafin').AsString;
    wturno:=DModRosa.IBQVer_cli.fieldbyName('Esped').AsString;
    wreferencias:=DModRosa.IBQVer_cli.fieldbyName('Refer').AsString;
  end;
  DModRosa.IBQVer_cli.Close;
  // Ler Vendedor ***********************************
  DModRosa.IBQVer_ven.Close;
  DModRosa.IBQVer_ven.SQL.Clear;
  DModRosa.IBQVer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Where Codven=:ven_digit');
  DModRosa.IBQVer_ven.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQVer_ven.OPen;
  if DModRosa.IBQVer_ven.RecordCount>0 then
  begin
    wnomven:=DModRosa.IBQVer_ven.fieldbyName('Nome').AsString ;
    wtelven:=DModRosa.IBQVer_ven.fieldbyName('Ntel').AsString;
  end;
  DModRosa.IBQVer_ven.Close;
end;

procedure TFrmRelsaida.Edit2Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) then
      exit;
  if edit2.text='' then
  begin
    showmessage('Identifique o pedido inicial !!!!!');
    edit2.SetFocus;
    exit;
  end;
  //  Preencher com zeros a Esquerda
  while Length(edit2.Text)<edit2.MaxLength do
        edit2.Text := '0' + edit2.Text;
  edit3.SetFocus;
  exit;
end;

procedure TFrmRelsaida.Edit3Exit(Sender: TObject);
begin
  edit4.color:=clRed;
  if edit3.text='' then
  begin
    showmessage('Identifique o pedido final !!!!!');
    edit3.SetFocus;
    exit;
  end;
  IBTAuxetiqueta.EmptyTable;
  //  Preencher com zeros a Esquerda
  while Length(edit3.Text)<6 do
        edit3.Text := '0' + edit3.Text;
  showmessage('Impessora OK ???');
  // Ler Pedidos ****************************
  if DModRosa.IBQLer_etic.Active then
     DModRosa.IBQLer_etic.Active:=False;
  DModRosa.IBQLer_etic.Sql.Clear;
  DModRosa.IBQLer_etic.Sql.Add('Select * from ETIQUETA '+
                               'Where Idetiq>=:ini_digit '+
                               'and Idetiq<=:fin_digit '+
                               'Order by Idetiq');
  DModRosa.IBQLer_etic.ParamByName('ini_digit').AsInteger:=StrToInt(edit2.Text);
  DModRosa.IBQLer_etic.ParamByName('fin_digit').AsInteger:=StrToInt(edit3.Text);
  DModRosa.IBQLer_etic.Active:=True;
  DModRosa.IBQLer_etic.DisableControls;
  DModRosa.IBQLer_etic.First;
  while not DModRosa.IBQLer_etic.Eof do
  begin
    wnumped:=IntToStr(DModRosa.IBQLer_etic.fieldbyName('IDETIQ').AsInteger);
    while Length(wnumped)<6 do
          wnumped:='0'+wnumped;
    if IBQAuxetiqueta.Active then
       IBQAuxetiqueta.Active:=False;
    IBQAuxetiqueta.Sql.Clear;
    IBQAuxetiqueta.Sql.Add('Insert Into AUXETIQUETA ');
    IBQAuxetiqueta.Sql.Add('(CODETIQ,CODCLI,NOMCLI,SOBNOM,BAIRRO,CODVEN,NOMVEN) '+
                           'Values(:CODETIQ,:CODCLI,:NOMCLI,:SOBNOM,:BAIRRO,:CODVEN,:NOMVEN)');
    IBQAuxetiqueta.ParamByName('CODETIQ').AsString:=wnumped;
    IBQAuxetiqueta.ParamByName('CODCLI').AsString:=
    DModRosa.IBQLer_etic.fieldbyName('CODCLI').AsString;
    IBQAuxetiqueta.ParamByName('NOMCLI').AsString:=
    Copy(DModRosa.IBQLer_etic.fieldByName('NOMCLI').AsString,1,20);
    IBQAuxetiqueta.ParamByName('SOBNOM').AsString:=
    Copy(DModRosa.IBQLer_etic.fieldByName('SOBNOM').AsString,1,20);
    IBQAuxetiqueta.ParamByName('BAIRRO').AsString:=
    DModRosa.IBQLer_etic.fieldByName('BAIRRO').AsString;
    IBQAuxetiqueta.ParamByName('CODVEN').AsString:=
    DModRosa.IBQLer_etic.fieldByName('CODVEN').AsString;
    IBQAuxetiqueta.ParamByName('NOMVEN').AsString:=
    DModRosa.IBQVer_etic.fieldByName('NOMVEN').AsString;
    IBQAuxetiqueta.ExecSql;
    IBQAuxetiqueta.Close;
    DModRosa.IBQLer_etic.Next;
  end;
  DModRosa.IBQLer_etic.Close;
  if IBQAuxetiqueta.Active then
     IBQAuxetiqueta.Active:=False;
  IBQAuxetiqueta.Sql.Clear;
  IBQAuxetiqueta.Sql.Add('Select * from AUXETIQUETA '+
                         'Order by Codetiq');
  IBQAuxetiqueta.Active:=True;
  IBQAuxetiqueta.Close;
  RvEtiqped2.showreport;
  Button1Click(Sender);
end;

procedure TFrmRelsaida.Edit9Exit(Sender: TObject);
begin
  while Length(edit9.Text)<6 do
        edit9.Text:='0'+edit9.Text;
end;

procedure TFrmRelsaida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmRelsaida.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmRelsaida.FormShow(Sender: TObject);
begin
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
  if edit7.text='XX' then
     edit1.SetFocus;
  if edit4.text='XX' then
     edit2.SetFocus;
  if edit11.text='XXXXXXX'then
     edit9.SetFocus;
  exit;
end;

procedure TFrmRelsaida.RvFaixaGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Datrel')=0 then
     value:=edit9.Text+' A '+edit10.text;
  if Comparetext(Varname,'Totpedido')=0 then
     value:=FormatFloat('##,##0.00',wtotpedid);
  if Comparetext(Varname,'Totretorno')=0 then
     value:=FormatFloat('###0.00',wtotretor);
  if Comparetext(Varname,'Totvenda')=0 then
     value:=FormatFloat('##,##0.00',wtotvenda);
end;

procedure TFrmRelsaida.RvPedvenda1GetValue(const VarName: string;
var Value: Variant);
begin
  if Comparetext(Varname,'Cliente')=0 then
     value:=wnumcli;
  if Comparetext(Varname,'Nomcli')=0 then
     value:=wnomcli;
  if Comparetext(Varname,'Endcli')=0 then
     value:=wendereco;
  if Comparetext(Varname,'Complemento')=0 then
     value:=wcontato;
  if Comparetext(Varname,'Baicli')=0 then
     value:=wbairro;
  if Comparetext(Varname,'Cidcli')=0 then
     value:=wcidade;
  if Comparetext(Varname,'Cepcli')=0 then
     value:=wcep;
  if Comparetext(Varname,'Estcli')=0 then
     value:=westado;
  if Comparetext(Varname,'Telcli')=0 then
     value:=wtelcli;
  if Comparetext(Varname,'Rgncli')=0 then
     value:=wnifp;
  if Comparetext(Varname,'Cpfcli')=0 then
     value:=wncpf;
  if Comparetext(Varname,'Vendedor')=0 then
     value:=wvend+' - '+wnomven;
  if Comparetext(Varname,'Contato')=0 then
     value:='Contato: '+wtelven;
   if Comparetext(Varname,'Emissao')=0 then
     value:=wemissao;
  if Comparetext(Varname,'Devolucao')=0 then
     value:=wdevoluc;
  if Comparetext(Varname,'Vencimento')=0 then
     value:=wvencmto;
  if Comparetext(Varname,'Numped')=0 then
     value:=wnumped;
  if Comparetext(Varname,'Horario')=0 then
     value:='Atendimento: '+wturno+' / '+whorini+ 'a '+whorfin;
  if Comparetext(Varname,'Artigos')=0 then
     value:=FormatFloat('#0',wtotart);
  if Comparetext(Varname,'Quant')=0 then
     value:=FormatFloat('###0.0',wtotqtda);
  if Comparetext(Varname,'Total')=0 then
     value:=FormatFloat('###0.00',wtotped);
  if Comparetext(Varname,'Vendeu')=0 then
     value:=FormatFloat('##,##0.00',wvendido);
  if Comparetext(Varname,'lucro')=0 then
     value:=FormatFloat('##,##0.00',(wvendido-wtotped));
  if Comparetext(Varname,'Via')=0 then
     value:=wvia;
end;

procedure TFrmRelsaida.RvPedvendaGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Cliente')=0 then
     value:=wnumcli;
  if Comparetext(Varname,'Nomcli')=0 then
     value:=wnomcli;
  if Comparetext(Varname,'Endcli')=0 then
     value:=wendereco;
  if Comparetext(Varname,'Complemento')=0 then
     value:=wcontato;
  if Comparetext(Varname,'Baicli')=0 then
     value:=wbairro;
  if Comparetext(Varname,'Cidcli')=0 then
     value:=wcidade;
  if Comparetext(Varname,'Cepcli')=0 then
     value:=wcep;
  if Comparetext(Varname,'Estcli')=0 then
     value:=westado;
  if Comparetext(Varname,'Telcli')=0 then
     value:=wtelcli;
  if Comparetext(Varname,'Rgncli')=0 then
     value:=wnifp;
  if Comparetext(Varname,'Cpfcli')=0 then
     value:=wncpf;
  if Comparetext(Varname,'Vendedor')=0 then
     value:=wvend+' - '+wnomven;
  if Comparetext(Varname,'Contato')=0 then
     value:='Contato: '+wtelven;
   if Comparetext(Varname,'Emissao')=0 then
     value:=wemissao;
  if Comparetext(Varname,'Devolucao')=0 then
     value:=wdevoluc;
  if Comparetext(Varname,'Vencimento')=0 then
     value:=wvencmto;
  if Comparetext(Varname,'Numped')=0 then
     value:=wnumped;
  if Comparetext(Varname,'Horario')=0 then
     value:='Atendimento: '+wturno+' / '+whorini+ 'a '+whorfin;
  if Comparetext(Varname,'Artigos')=0 then
     value:=FormatFloat('#0',wtotart);
  if Comparetext(Varname,'Quant')=0 then
     value:=FormatFloat('###0.0',wtotqtda);
  if Comparetext(Varname,'Total')=0 then
     value:=FormatFloat('###0.00',wtotped);
  if Comparetext(Varname,'Vendeu')=0 then
     value:=FormatFloat('##,##0.00',wvendido);
  if Comparetext(Varname,'lucro')=0 then
     value:=FormatFloat('##,##0.00',(wvendido-wtotped));
  // if Comparetext(Varname,'Valorven')=0 then
  //    value:=FormatFloat('##,##0.00',wtotvendido);
  if Comparetext(Varname,'Via')=0 then
     value:=wvia;
  if Comparetext(Varname,'Referencias')=0 then
     value:='Ref: '+wreferencias;
  if Comparetext(Varname,'Pedido')=0 then
     value:='Pedido Num: '+wnumped+' - '+wemissao;
  if Comparetext(Varname,'Numcliente')=0 then
     value:='Cliente: '+wnumcli+'  -  '+wnomcli;
  if Comparetext(Varname,'zretor')=0 then
     value:=FormatFloat('#0',xretor);
  if Comparetext(Varname,'zvendeu')=0 then
     value:=FormatFloat('#0',xvendeu);
  if Comparetext(Varname,'zvalven')=0 then
     value:=FormatFloat('##,##0.00',xvalven);
  if Comparetext(Varname,'Datret')=0 then
     value:=(wretorno);
end;

end.
