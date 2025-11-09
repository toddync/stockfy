unit UPerdido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Data.DB, IBX.IBTable, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmPerdido = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Edit4: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    IBQPesqret: TIBQuery;
    IBQAuxret: TIBQuery;
    IBTAuxretorno: TIBTable;
    DtsAuxret: TDataSource;
    IBTAuxretornoPEDIDO: TIBStringField;
    IBTAuxretornoCODART: TIBStringField;
    IBTAuxretornoDESCRICAO: TIBStringField;
    IBTAuxretornoQTDSAI: TIntegerField;
    IBTAuxretornoQTDRET: TIntegerField;
    IBTAuxretornoPRECUS: TIBBCDField;
    IBTAuxretornoPREVEN: TIBBCDField;
    IBTAuxretornoQTDANT: TIntegerField;
    IBTAuxretornoCUSANT: TIBBCDField;
    IBTAuxretornoVENANT: TIBBCDField;
    IBTAuxretornoOPER: TIBStringField;
    IBQPesqretPEDIDO: TIBStringField;
    IBQPesqretCODART: TIBStringField;
    IBQPesqretDESCRICAO: TIBStringField;
    IBQPesqretQTDSAI: TIntegerField;
    IBQPesqretQTDRET: TIntegerField;
    IBQPesqretPRECUS: TIBBCDField;
    IBQPesqretPREVEN: TIBBCDField;
    IBQPesqretQTDANT: TIntegerField;
    IBQPesqretCUSANT: TIBBCDField;
    IBQPesqretVENANT: TIBBCDField;
    IBQPesqretOPER: TIBStringField;
    IBQAuxretPEDIDO: TIBStringField;
    IBQAuxretCODART: TIBStringField;
    IBQAuxretDESCRICAO: TIBStringField;
    IBQAuxretQTDSAI: TIntegerField;
    IBQAuxretQTDRET: TIntegerField;
    IBQAuxretPRECUS: TIBBCDField;
    IBQAuxretPREVEN: TIBBCDField;
    IBQAuxretQTDANT: TIntegerField;
    IBQAuxretCUSANT: TIBBCDField;
    IBQAuxretVENANT: TIBBCDField;
    IBQAuxretOPER: TIBStringField;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function strZero(const strValor: string;const intComprimento: integer): string;
  end;

var
  FrmPerdido: TFrmPerdido;
  wnomc,wclie,wbase,wreco,wcobr,wpedi,wsitu,wcodart,wdescricao,wvend,wdatped: string;
  chvtem,I,S,R,V,P,X,Y,Z,W,E,F,chvff,PrntOk,chavfr,wopcao,wdatpg,wcob,wvia,wold: string;
  wqtds,wqtdr,wqtdv,wpreco,wqtda,xestoq,zqtda,wvalpg,wresid,wsobra,xvalpg: Extended;
  wtotqts,wtotqtr,wtotqtv,wtotped,wtotret,wtotven,wtotind,wresiduo: Extended;
  witens: Integer;
  wendereco,wempresa,wtelefone,winscricoes,wretor,chvtrava,zitens,wsolicit,wlimite: String;

implementation

uses UDModRosa;

{$R *.dfm}

function TFrmPerdido.strZero(const strValor: string;const intComprimento: integer): string;
var
  strZeros,strRetorno,wopcao: string;
  intTamanho,intContador: Integer;
begin
  intTamanho:=length(Trim(strValor));
  strZeros:='';
  for intContador:=1 to intComprimento do
      strZeros:=strZeros+'0';
  strRetorno:=copy(Trim(strzeros)+Trim(strValor),intTamanho+1,intComprimento);
  result:=strRetorno;
end;


procedure TFrmPerdido.Button1Click(Sender: TObject);
begin
  {// Cria itens perdidos  *******************
  DModRosa.IBQVer_itped.Close;
  DModRosa.IBQVer_itped.SQL.Clear;
  DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                'Where Pedido=:ped_digit '+
                                'Order by Codart');
  DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=edit4.Text;
  DModRosa.IBQVer_itped.OPen;
  DModRosa.IBQVer_itped.DisableControls;
  DModRosa.IBQVer_itped.First;
  while not DModRosa.IBQVer_itped.Eof do
  begin
    if DModRosa.IBQVer_itper.Active then
       DModRosa.IBQVer_itper.Active:=False;
    DModRosa.IBQVer_itper.Sql.Clear;
    DModRosa.IBQVer_itper.Sql.Add('Insert Into ITEMPERDIDO ');
    DModRosa.IBQVer_itper.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,'+
                                  'QTDRET,PRECUS,PREVEN) '+
                          'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,'+
                                 ':QTDRET,:PRECUS,:PREVEN)');
    DModRosa.IBQVer_itper.ParamByName('PEDIDO').AsString:=
             DModRosa.IBQVer_itped.fieldByName('PEDIDO').AsString;
    DModRosa.IBQVer_itper.ParamByName('CODART').AsString:=
             DModRosa.IBQVer_itped.fieldByName('CODART').AsString;
    DModRosa.IBQVer_itper.ParamByName('DESCRICAO').AsString:=
             DModRosa.IBQVer_itped.fieldByName('DESCRICAO').AsString;
    DModRosa.IBQVer_itper.ParamByName('QTDSAI').AsFloat:=
             DModRosa.IBQVer_itped.fieldByName('QTDSAI').AsFloat;
    DModRosa.IBQVer_itper.ParamByName('QTDRET').AsFloat:=
             DModRosa.IBQVer_itped.fieldByName('QTDRET').AsFloat;
    DModRosa.IBQVer_itper.ParamByName('PRECUS').AsFloat:=
             DModRosa.IBQVer_itped.fieldByName('PRECUS').AsFloat;
    DModRosa.IBQVer_itper.ParamByName('PREVEN').AsFloat:=
             DModRosa.IBQVer_itped.fieldByName('PREVEN').AsFloat;
    DModRosa.IBQVer_itper.ExecSql;
    DModRosa.IBQVer_itper.Close;
    DModRosa.IBQVer_itped.Next;
  end;
  DModRosa.IBQVer_itped.Close;
  // Limpa itens do pedido **************
  DModRosa.IBQVer_itped.Active:=False;
  DModRosa.IBQVer_itped.Sql.Clear;
  DModRosa.IBQVer_itped.SqL.Add('Delete from ITEMPEDIDO '+
                                'Where PEDIDO=:ped_digit');
  DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=edit4.text;
  DModRosa.IBQVer_itped.Active:=True;
  DModRosa.IBQVer_itped.Active:=False;
  DModRosa.IBTransaction1.Commit;
  DModRosa.IBQVer_itped.Close;
  // Cria pedido perdido ********************
  if DModRosa.IBQVer_per.Active then
     DModRosa.IBQVer_per.Active:=False;
  DModRosa.IBQVer_per.Sql.Clear;
  DModRosa.IBQVer_per.Sql.Add('Insert Into PERDIDO ');
  DModRosa.IBQVer_per.Sql.Add('(PEDIDO,CODVEN,CODCLI,NOMCLI,BASE,RECOL,'+
                              'COBRAN,TOTPED,SITU,DATPED,SOLICIT,RETORNO,'+
                              'TOTVEN,DATPAG,VALPAG,RESIDUO,COB,LIMITE,VIA,OLDPED) '+
                      'Values(:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:BASE,:RECOL,'+
                             ':COBRAN,:TOTPED,:SITU,:DATPED,:SOLICIT,:RETORNO,'+
                             ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO,:COB,:LIMITE,:VIA,:OLDPED)');
  DModRosa.IBQVer_per.ParamByName('PEDIDO').AsString:=wpedi;
  DModRosa.IBQVer_per.ParamByName('CODVEN').AsString:=wvend;
  DModRosa.IBQVer_per.ParamByName('CODCLI').AsString:=wclie;
  DModRosa.IBQVer_per.ParamByName('NOMCLI').AsString:=wnomc;
  DModRosa.IBQVer_per.ParamByName('BASE').AsDate:=StrToDate(wbase);
  DModRosa.IBQVer_per.ParamByName('RECOL').AsDate:=StrTodate(wreco);
  DModRosa.IBQVer_per.ParamByName('COBRAN').AsDate:=StrToDate(wcobr);
  DModRosa.IBQVer_per.ParamByName('TOTPED').AsFloat:=wtotped;
  DModRosa.IBQVer_per.ParamByName('SITU').AsString:=wsitu;
  DModRosa.IBQVer_per.ParamByName('DATPED').AsString:=wdatped;
  DModRosa.IBQVer_per.ParamByName('RETORNO').AsString:=maskedit1.Text;
  DModRosa.IBQVer_per.ParamByName('TOTVEN').AsFloat:=StrToFloat(edit2.Text);
  DModRosa.IBQVer_per.ParamByName('DATPAG').AsString:=wdatpg;
  DModRosa.IBQVer_per.ParamByName('SOLICIT').AsString:=wsolicit;
  DModRosa.IBQVer_per.ParamByName('VALPAG').AsFloat:=StrToFloat(edit3.text);
  DModRosa.IBQVer_per.ParamByName('RESIDUO').AsFloat:=StrToFloat(edit5.text);
  DModRosa.IBQVer_per.ParamByName('COB').AsString:=wcob;
  DModRosa.IBQVer_per.ParamByName('LIMITE').AsString:=wlimite;
  DModRosa.IBQVer_per.ParamByName('VIA').AsString:=wvia;
  DModRosa.IBQVer_per.ParamByName('OLDPED').AsString:=wold;
  DModRosa.IBQVer_per.ExecSql;
  DModRosa.IBQVer_per.Close;
  DModRosa.IBTransaction1.Commit;
  // Limpa  pedido ************************
  DModRosa.IBQVer_ped.Active:=False;
  DModRosa.IBQVer_ped.Sql.Clear;
  DModRosa.IBQVer_ped.SqL.Add('Delete from PEDIDO '+
                              'Where PEDIDO=:ped_digit');
  DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit4.text;
  DModRosa.IBQVer_ped.Active:=True;
  DModRosa.IBQVer_ped.Active:=False;
  DModRosa.IBTransaction1.Commit;
  DModRosa.IBQVer_ped.Close;}
  // IMPEDE A COBRANÇA *****************************************
  if wcob='P' then
  begin
    if MessageDlg('RESIDUO PERDIDO'+CHR(13)+
                  'Vai recuperar ??',
     mtWarning,[mbYes,mbNo],0) = mrYes then
     begin
       DModRosa.IBQVer_ped.Sql.Clear;
       DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
       DModRosa.IBQVer_ped.Sql.Add('Set COB=:cob_digit '+
                                   'Where PEDIDO=:ped_digit');
       DModRosa.IBQVer_ped.ParamByName('cob_digit').AsString:=' ';
       DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit4.Text;
       DModRosa.IBQVer_ped.ExecSql;
       DModRosa.IBTransaction1.Commit;
    end;
  end else
  begin
    if StrToFloat(edit5.Text)>0 then
    begin
      DModRosa.IBQVer_ped.Sql.Clear;
      DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
      DModRosa.IBQVer_ped.Sql.Add('Set COB=:cob_digit '+
                                  'Where PEDIDO=:ped_digit');
      DModRosa.IBQVer_ped.ParamByName('cob_digit').AsString:='P';
      DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit4.Text;
      DModRosa.IBQVer_ped.ExecSql;
      DModRosa.IBTransaction1.Commit;
    end else
        Label2.Caption:='Não tem residuo a baixar !!!!!!!';
  end;
  DModRosa.IBQVer_ped.Close;
  chvff:='';
  chavfr:='1';
  wsitu:='';
  edit4.Clear;
  edit2.Clear;
  edit5.Clear;
  edit3.Clear;
  label2.Caption:=' ';
  maskedit1.Clear;
  Richedit1.Clear;
  Richedit2.Clear;
  Modalresult:=-1;
end;

procedure TFrmPerdido.Button2Click(Sender: TObject);
begin
  chvff:='';
  chavfr:='1';
  wsitu:='';
  edit4.Clear;
  edit2.Clear;
  edit5.Clear;
  edit3.Clear;
  maskedit1.Clear;
  Richedit1.Clear;
  Richedit2.Clear;
  Modalresult:=-1;
end;

procedure TFrmPerdido.Edit4Exit(Sender: TObject);
begin
  if (ActiveControl=Button2) then
      exit;
  if edit4.Text='' then
  begin
    ShowMessage('Numero da Nota ????');
    Button2Click(Sender);
    exit;
  end;
  While Length(edit4.Text)<6 do
        edit4.Text := '0'+ edit4.Text;
  IBTAuxretorno.EmptyTable;
  // Ler pedido *************************
  DModRosa.IBQVer_ped.Close;
  DModRosa.IBQVer_ped.SQL.Clear;
  DModRosa.IBQVer_ped.SQL.Add('Select * from PEDIDO '+
                              'Where Pedido=:ped_digit');
  DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit4.Text;
  DModRosa.IBQVer_ped.OPen;
  if DModRosa.IBQVer_ped.RecordCount>0 then
  begin
    wvend:=DModRosa.IBQVer_ped.fieldbyName('Codven').AsString;
    wclie:=DModRosa.IBQVer_ped.fieldbyName('Codcli').AsString;
    wnomc:=DModRosa.IBQVer_ped.fieldbyName('Nomcli').AsString ;
    wbase:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Base').AsDateTime);
    wreco:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Recol').AsDateTime);
    wcobr:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Cobran').AsDateTime);
    wpedi:=DModRosa.IBQVer_ped.fieldbyName('Pedido').AsString;
    wsitu:=DModRosa.IBQVer_ped.fieldbyName('Situ').AsString;
    wvalpg:=DModRosa.IBQVer_ped.fieldbyName('Valpag').AsFloat;
    wresid:=DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat;
    wdatpg:=DModRosa.IBQVer_ped.fieldbyName('Datpag').AsString;
    maskedit1.text:=DModRosa.IBQVer_ped.fieldbyName('Retorno').AsString;
    wtotped:=DModRosa.IBQVer_ped.fieldbyName('Totped').AsFloat;
    edit2.text:=FormatFloat('##,##0.00',DModRosa.IBQVer_ped.fieldbyName('Totven').AsFloat);
    edit5.text:=FormatFloat('##,##0.00',DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat);
    edit3.text:=FormatFloat('##,##0.00',DModRosa.IBQVer_ped.fieldbyName('Valpag').AsFloat);
    wcob:=DModRosa.IBQVer_ped.fieldbyName('Cob').AsString;
    wlimite:=DModRosa.IBQVer_ped.fieldbyName('Limite').AsString;
    wvia:=DModRosa.IBQVer_ped.fieldbyName('Via').AsString;
    wold:=DModRosa.IBQVer_ped.fieldbyName('Oldped').AsString;
    wsolicit:=DModRosa.IBQVer_ped.fieldbyName('Solicit').AsString;
    wdatped:=DModRosa.IBQVer_ped.fieldbyName('Datped').AsString;
  end else
  begin
    DModRosa.IBQVer_ped.Close;
    ShowMessage('Pedido nao cadastrado');
    Button2Click(Sender);
    exit;
  end;
  DModRosa.IBQVer_ped.Close;
  Richedit1.Lines.Add('          Client: '+wnomc+'     -     '+wclie);
  Richedit1.Lines.Add('   Vend: '+wvend+' Emis: '+wbase+' Venc: '+wcobr+
                      '  Sit: '+wsitu);
  // Richedit1.Lines.Add('Cod.     Quant                    Descrição                                             Devol        Vend            Valor');
  // Ler Itens do pedido *********************
  DModRosa.IBQLer_itped.Close;
  DModRosa.IBQLer_itped.SQL.Clear;
  DModRosa.IBQLer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                'Where Pedido=:ped_digit '+
                                'Order by Codart');
  DModRosa.IBQLer_itped.ParamByName('ped_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_itped.OPen;
  DModRosa.IBQLer_itped.DisableControls;
  DModRosa.IBQLer_itped.First;
  witens:=0;
  wtotqts:=0;
  wtotqtr:=0;
  wtotqtv:=0;
  wtotped:=0;
  wtotret:=0;
  wtotven:=0;
  wtotind:=0;
  Richedit2.Clear;
  while not DModRosa.IBQLer_itped.Eof do
  begin
    witens:=witens+1;
    wcodart:=DModRosa.IBQLer_itped.fieldbyName('Codart').AsString;
    wdescricao:=DModRosa.IBQLer_itped.fieldbyName('Descricao').AsString;
    wqtds:=DModRosa.IBQLer_itped.fieldbyName('Qtdsai').AsFloat;
    wqtdr:=DModRosa.IBQLer_itped.fieldbyName('Qtdret').AsFloat;
    wpreco:=DModRosa.IBQLer_itped.fieldbyName('Precus').AsFloat;
    if wsitu<>'E' then
       wqtdv:=wqtds-wqtdr;
    wtotqts:=wtotqts+wqtds;
    wtotqtr:=wtotqtr+wqtdr;
    wtotqtv:=wtotqtv+wqtdv;
    wtotped:=wtotped+(wqtds*wpreco);
    wtotret:=wtotret+(wqtdr*wpreco);
    wtotven:=wtotven+(wqtdv*wpreco);
    // Grava Auxiliar *************************
    if IBQAuxret.Active then
       IBQAuxret.Active:=False;
    IBQAuxret.Sql.Clear;
    IBQAuxret.Sql.Add('Insert Into AUXITENS ');
    IBQAuxret.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                      'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
              'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                     ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
    IBQAuxret.ParamByName('PEDIDO').AsString:=edit4.Text;
    IBQAuxret.ParamByName('CODART').AsString:=wcodart;
    IBQAuxret.ParamByName('DESCRICAO').AsString:=wdescricao;
    IBQAuxret.ParamByName('QTDSAI').AsFloat:=wqtds;
    IBQAuxret.ParamByName('QTDRET').AsFloat:=wqtdr;
    IBQAuxret.ParamByName('PRECUS').AsFloat:=wpreco;
    IBQAuxret.ParamByName('PREVEN').AsFloat:=0;
    IBQAuxret.ParamByName('QTDANT').AsFloat:=wqtdv;
    IBQAuxret.ParamByName('CUSANT').AsFloat:=0;
    IBQAuxret.ParamByName('VENANT').AsFloat:=wqtdv*wpreco;
    IBQAuxret.ParamByName('OPER').AsString:='';
    IBQAuxret.ExecSql;
    IBQAuxret.Close;
    DModRosa.IBQLer_itped.Next;
  end;
  DModRosa.IBQLer_itped.Close;
  IBQPesqret.Close;
  IBQPesqret.SQL.Clear;
  IBQPesqret.SQL.Add('Select * from AUXITENS '+
                         'Order by Codart');
  IBQPesqret.Active:=True;
  if wtotven>0 then
     wtotind:=(wtotven*100)/wtotped;
  I:=FormatFloat('#0',witens);
  S:=FormatFloat('####0',wtotqts);
  R:=FormatFloat('####0',wtotqtr);
  V:=FormatFloat('####0',wtotqtv);
  X:=FormatFloat('##,##0.00',wtotped);
  y:=FormatFloat('##,##0.00',wtotret);
  Z:=FormatFloat('##,##0.00',wtotven);
  W:=FormatFloat('##,##0.00',wtotind);
  E:=FormatFloat('##,##0.00',wvalpg);
  F:=FormatFloat('##,##0.00',wresid);
  Richedit2.Lines.Add('   ');
  Richedit2.Lines.Add('  ARTIGOS  '+StringofChar(#32,8-Length(I))+(I));
  Richedit2.Lines.Add('  SAIDA       '+StringofChar(#32,8-Length(S))+(S)+
                                       StringofChar(#32,15-Length(X))+(X));
  Richedit2.Lines.Add('  RETORNO '+StringofChar(#32,8-length(R))+(R)+
                                   StringofChar(#32,15-Length(Y))+(Y));
  Richedit2.Lines.Add('  VENDIDO   '+StringofChar(#32,8-Length(V))+(V)+
                                  StringofChar(#32,15-Length(Z))+(Z));
  Richedit2.Lines.Add('  % VENDA    '+StringofChar(#32,8-Length(W))+(W));
  Richedit2.Lines.Add('   ');
  Richedit2.Lines.Add('  ULTIMO PAGAMENTO '+wdatpg);
  showmessage('Feche o pedido !!!!!!!');
  Button1.SetFocus;
  exit;
end;

procedure TFrmPerdido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPerdido.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmPerdido.FormShow(Sender: TObject);
begin
  chvff:='';
  chavfr:='1';
  edit2.Clear;
  edit5.Clear;
  edit3.Clear;
  Label2.Caption:=' ';
  maskedit1.Clear;
  wempresa:='SIDTEX CONFECÇÕES LTDA.';
  wendereco:='Rua Bernardo de Vanconcelos , 12  Realengo -  RJ';
  wtelefone:='Tel:(021) 3381-8581  /  Cep: 21250-270';
  winscricoes:='CNPJ: 04.704.379/0001-71   -   Insc.Est: 77.260.595';
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit1.Lines.Add('                '+wempresa);
  edit4.SetFocus;
end;

procedure TFrmPerdido.MaskEdit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button2) then
      exit;
end;



end.
