unit UBaixaresi;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Data.DB, IBX.IBTable, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmBaixaresi = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    GroupBox2: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RichEdit1: TRichEdit;
    Edit2: TEdit;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    Label6: TLabel;
    IBTAuxretorno: TIBTable;
    IBQPesqret: TIBQuery;
    IBQAuxret: TIBQuery;
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
    DtsAuxret: TDataSource;
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
    RichEdit2: TRichEdit;
    Label8: TLabel;
    DBGrid2: TDBGrid;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Monta_resi;
    function strZero(const strValor: string;const intComprimento: integer): string;

  end;

var
  FrmBaixaresi: TFrmBaixaresi;
  wnomc,wclie,wbase,wreco,wcobr,wpedi,wsitu,wcodart,wdescricao,wvend: string;
  chvtem,I,S,R,V,P,X,Y,Z,W,E,F,chvff,PrntOk,chavfr,wopcao,wdatpg: string;
  wqtds,wqtdr,wqtdv,wpreco,wqtda,xestoq,zqtda,wvalpg,wresid,wsobra,xvalpg: Extended;
  wtotqts,wtotqtr,wtotqtv,wtotped,wtotret,wtotven,wtotind,wresiduo: Extended;
  witens: Integer;
  wendereco,wempresa,wtelefone,winscricoes,wretor,chvtrava,zitens: String;
implementation

{$R *.dfm}

uses UDModRosa;

function TFrmBaixaresi.strZero(const strValor: string;const intComprimento: integer): string;
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

procedure TFrmBaixaresi.Button1Click(Sender: TObject);
begin
  if wsitu='P' then
  begin
    DModRosa.IBQVer_ped.Sql.Clear;
    DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
    DModRosa.IBQVer_ped.Sql.Add('Set VALPAG=:val_digit,'+
                                'DATPAG=:dat_digit,'+
                                'RESIDUO=:resi_digit '+
                                'Where PEDIDO=:ped_digit');
    DModRosa.IBQVer_ped.ParamByName('val_digit').AsFloat:=StrToFloat(edit5.Text);
    DModRosa.IBQVer_ped.ParamByName('dat_digit').AsString:=maskedit2.text;
    DModRosa.IBQVer_ped.ParamByName('resi_digit').AsFloat:=StrToFloat(edit4.Text);
    DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
    DModRosa.IBQVer_ped.ExecSql;
    DModRosa.IBQVer_ped.Close;
    DModRosa.IBQVer_ped.Close;
    // Grava Resido pago ******************************
    witens:=0;
    if DModrosa.IBQPesq_resi.Active then
       DModrosa.IBQPesq_resi.Active:=False;
    DModrosa.IBQPesq_resi.Sql.Clear;
    DModrosa.IBQPesq_resi.Sql.Add('Select * from RESIDOS '+
                                  'Where Datmov=:dat_digit '+
                                  'Order by Item');
    DModrosa.IBQPesq_resi.ParamByName('dat_digit').AsDate:=StrToDate(maskedit2.Text);
    DModrosa.IBQPesq_resi.Active:=True;
    if DModrosa.IBQPesq_resi.RecordCount>0 then
    begin
      DModrosa.IBQPesq_resi.Last;
      witens:=StrToInt(DModrosa.IBQPesq_resi.fieldbyName('Item').AsString);
    end;
    witens:=witens+1;
    zitens:=FormatFloat('##0',witens);
    // Preencher a chave com zeros a esquerda
    While Length(zitens)<3 do
          zitens := '0'+ zitens;
    if DModrosa.IBQVer_resi.Active then
       DModrosa.IBQVer_resi.Active:=False;
    DModrosa.IBQVer_resi.Sql.Clear;
    DModrosa.IBQVer_resi.Sql.Add('Insert Into RESIDOS ');
    DModrosa.IBQVer_resi.Sql.Add('(DATMOV,ITEM,NUMDOC,VALPAG) '+
                         'Values(:DATMOV,:ITEM,:NUMDOC,:VALPAG)');
    DModrosa.IBQVer_resi.ParamByName('DATMOV').AsDate:=StrTodate(maskedit2.Text);
    DModrosa.IBQVer_resi.ParamByName('ITEM').AsString:=zitens;
    DModrosa.IBQVer_resi.ParamByName('NUMDOC').AsString:=edit1.text;
    DModrosa.IBQVer_resi.ParamByName('VALPAG').AsFloat:=StrToFloat(edit2.text);
    DModrosa.IBQVer_resi.ExecSql;
    DModrosa.IBQVer_resi.Close;
    Monta_resi;
  end;
  Button2Click(Sender);
end;

procedure TFrmBaixaresi.Button2Click(Sender: TObject);
begin
  chvff:='';
  chavfr:='1';
  wsitu:='';
  edit4.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  Richedit1.Clear;
  Richedit2.Clear;
  Modalresult:=-1;
end;

procedure TFrmBaixaresi.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) then
     exit;
  if edit1.Text='' then
  begin
    ShowMessage('Numero da Nota ????');
    Button2Click(Sender);
    exit;
  end;
  While Length(edit1.Text)<6 do
        edit1.Text := '0'+ edit1.Text;
  IBTAuxretorno.EmptyTable;
  // Ler pedido *************************
  DModRosa.IBQVer_ped.Close;
  DModRosa.IBQVer_ped.SQL.Clear;
  DModRosa.IBQVer_ped.SQL.Add('Select * from PEDIDO '+
                              'Where Pedido=:ped_digit');
  DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
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
    wvend:=DModRosa.IBQVer_ped.fieldbyName('Codven').AsString;
    wsitu:=DModRosa.IBQVer_ped.fieldbyName('Situ').AsString;
    wvalpg:=DModRosa.IBQVer_ped.fieldbyName('Valpag').AsFloat;
    wresid:=DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat;
    wdatpg:=DModRosa.IBQVer_ped.fieldbyName('Datpag').AsString;
    maskedit1.text:=DModRosa.IBQVer_ped.fieldbyName('Retorno').AsString;
    edit3.text:=FormatFloat('####0.00',DModRosa.IBQVer_ped.fieldbyName('Totven').AsFloat);
    edit4.text:=FormatFloat('####0.00',DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat);
    edit5.text:=FormatFloat('####0.00',DModRosa.IBQVer_ped.fieldbyName('Valpag').AsFloat);
  end else
  begin
    DModRosa.IBQVer_ped.Close;
    ShowMessage('Pedido nao cadastrado');
    Button2Click(Sender);
    exit;
  end;
  DModRosa.IBQVer_ped.Close;
  Richedit1.Lines.Add('   Client: '+wnomc+'     -     '+wclie);
  Richedit1.Lines.Add('   Vend: '+wvend+' Emis: '+wbase+' Venc: '+wcobr+
                      ' Sit: '+wsitu);
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
    IBQAuxret.ParamByName('PEDIDO').AsString:=edit1.Text;
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
  Monta_resi;
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
  X:=FormatFloat('####0.00',wtotped);
  y:=FormatFloat('####0.00',wtotret);
  Z:=FormatFloat('####0.00',wtotven);
  W:=FormatFloat('####0.00',wtotind);
  E:=FormatFloat('####0.00',wvalpg);
  F:=FormatFloat('####0.00',wresid);
  Richedit2.Lines.Add('  ARTIGOS  '+StringofChar(#32,8-Length(I))+(I));
  Richedit2.Lines.Add('  SAIDA       '+StringofChar(#32,8-Length(S))+(S)+
                                       StringofChar(#32,15-Length(X))+(X));
  Richedit2.Lines.Add('  RETORNO '+StringofChar(#32,8-length(R))+(R)+
                                   StringofChar(#32,15-Length(Y))+(Y));
  Richedit2.Lines.Add('  VENDIDO   '+StringofChar(#32,8-Length(V))+(V)+
                                  StringofChar(#32,15-Length(Z))+(Z));
  Richedit2.Lines.Add('  % VENDA    '+StringofChar(#32,8-Length(W))+(W));
  if wsitu='E' then
  begin
    maskedit1.Text:=wretor;
    ShowMessage('Este Pedido não retornou !!!!');
    Button2Click(Sender);
  end;
  if StrToFloat(edit4.Text)=0 then
  begin
    showmessage('Este pedido não tem resido '+Chr(13)+
                'para pagamento !!!!!!!');
    Button2Click(Sender);
  end;
  wsitu:='';
  maskedit2.setfocus;
  exit;
end;

procedure TFrmBaixaresi.Edit2Exit(Sender: TObject);
begin
  if edit2.text>'0' then
     wsitu:='P';
  edit5.Text:=FormatFloat('####0.00',(StrToFloat(edit5.text)+StrToFloat(edit2.Text)));
  if FormatFloat('####0.00',StrToFloat(edit3.Text))=FormatFloat('##,##0.00',StrToFloat(edit5.Text)) then
  begin
    edit4.Text:=FormatFloat('####0.00',0);
  end else
  begin
    if StrToFloat(edit3.Text)>StrToFloat(edit5.Text) then
    begin
      edit4.Text:=FormatFloat('####0.00',(StrToFloat(edit3.text)-StrToFloat(edit5.Text)));
    end else
    begin
     edit4.Text:=FormatFloat('####0.00',0);
    end;
  end;
  Button1.SetFocus;
  exit;
end;

procedure TFrmBaixaresi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmBaixaresi.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmBaixaresi.FormShow(Sender: TObject);
begin
  chvff:='';
  chavfr:='1';
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  maskedit1.Clear;
  wempresa:='SIDTEX CONFECÇÕES LTDA.';
  wendereco:='Rua Bernardo de Vanconcelos 12 - Realengo -  RJ';
  wtelefone:='Tel:(021) 3381-8581  /  Cep: 21250-270';
  winscricoes:='CNPJ: 04.704.379/0001-71   -   Insc.Est: 77.260.595';
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit1.Lines.Add('                            '+wempresa);
  edit1.SetFocus;
  exit;
end;

procedure TFrmBaixaresi.MaskEdit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button2) then
      exit;
end;

procedure TFrmBaixaresi.MaskEdit2Exit(Sender: TObject);
begin
  edit2.SetFocus;
  exit;
end;

procedure TFrmBaixaresi.Monta_resi;
begin
  dbgrid2.Visible:=True;
  // Ler os residos **********************************
  DModRosa.IBQLer_resi.Close;
  DModRosa.IBQLer_resi.SQL.Clear;
  DModRosa.IBQLer_resi.SQL.Add('Select * from RESIDOS '+
                               'Where Numdoc=:num_digit '+
                               'Order by Datmov,Item');
  DModRosa.IBQLer_resi.ParamByName('num_digit').AsString:=edit1.Text;
  DModRosa.IBQLer_resi.OPen;
end;

end.
