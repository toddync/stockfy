unit UVoltaret;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBQuery,
  IBX.IBCustomDataSet, IBX.IBTable, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TFrmVoltaret = class(TForm)
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
    DBGrid1: TDBGrid;
    Button1: TButton;
    Edit1: TEdit;
    Edit4: TEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RichEdit1: TRichEdit;
    DTSAuxret: TDataSource;
    RichEdit2: TRichEdit;
    Edit2: TEdit;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Restaura;
    procedure Atu_item;
    procedure Descarrega_ped;
    function strZero(const strValor: string;const intComprimento: integer): string;
  end;

var
  FrmVoltaret: TFrmVoltaret;
  wnomc,wclie,wbase,wreco,wcobr,wpedi,wsitu,wcodart,wdescricao,wvend: string;
  chvtem,I,S,R,V,P,X,Y,Z,W,chvff,PrntOk,chavfr,wopcao,xsitu,wconfirme: string;
  wqtds,wqtdr,wqtdv,wpreco,wqtda,xestoq,zqtda,xqtda,wvalor: Extended;
  wtotqts,wtotqtr,wtotqtv,wtotped,wtotret,wtotven,wtotind,wqtdev,wqtvend: Extended;
  witens: Integer;
  wendereco,wempresa,wtelefone,winscricoes,wretor,chvtrava: String;
implementation

{$R *.dfm}

uses UDModRosa, UPare;

function TFrmVoltaret.strZero(const strValor: string;const intComprimento: integer): string;
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

procedure TFrmVoltaret.BitBtn3Click(Sender: TObject);
begin
  chvff:='';
  chavfr:='1';
  edit4.Clear;
  maskedit1.Clear;
  Richedit2.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmVoltaret.Button1Click(Sender: TObject);
begin
  xsitu:=' ';
  chvff:='';
  chavfr:='1';
  edit1.Clear;
  edit4.Clear;
  maskedit1.Clear;
  Richedit1.Clear;
  Richedit2.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmVoltaret.Edit2Exit(Sender: TObject);
begin
  if edit2.text<>'LULA' then
  begin
    showmessage('Senha não autorizada !!!!');
    xsitu:=' ';
    chvff:='';
    chavfr:='1';
    edit1.Clear;
    edit4.Clear;
    maskedit1.Clear;
    Richedit1.Clear;
    Richedit2.Clear;
    Modalresult:=-1;
    exit;
  end;
end;

procedure TFrmVoltaret.Edit4Exit(Sender: TObject);
begin
  if edit4.Text='' then
  begin
    ShowMessage('Numero do Pedido ????');
    BitBtn3Click(Sender);
    exit;
  end;
  // Preencher a chave com zeros a esquerda
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
    wvend:=DModRosa.IBQVer_ped.fieldbyName('Codven').AsString;
    wretor:=DModRosa.IBQVer_ped.fieldbyName('Retorno').AsString;
    wsitu:=DModRosa.IBQVer_ped.fieldbyName('Situ').AsString;
    maskedit1.Text:=wreco;
    edit1.Text:=wsitu;
  end else
  begin
    DModRosa.IBQVer_ped.Close;
    ShowMessage('Pedido nao cadastrado');
    BitBtn3Click(Sender);
    exit;
  end;
  Richedit1.Lines.Add('  Client: '+wnomc+'     -     '+wclie);
  Richedit1.Lines.Add(' Emis: '+wbase+' Devol: '+wreco+
                      ' Venc: '+wcobr);
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
  DModRosa.IBQVer_ped.Close;
  DModRosa.IBQLer_itped.Close;
  DModRosa.IBQLer_itped.SQL.Clear;
  DModRosa.IBQLer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                'Where Pedido=:ped_digit '+
                                'Order by Codart');
  DModRosa.IBQLer_itped.ParamByName('ped_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_itped.OPen;
  DModRosa.IBQLer_itped.DisableControls;
  DModRosa.IBQLer_itped.First;
  xsitu:=' ';
  witens:=0;
  wtotqts:=0;
  wtotqtr:=0;
  wtotqtv:=0;
  wtotped:=0;
  wtotret:=0;
  wtotven:=0;
  wtotind:=0;
  while not DModRosa.IBQLer_itped.Eof do
  begin
    witens:=witens+1;
    wcodart:=DModRosa.IBQLer_itped.fieldbyName('Codart').AsString;
    wdescricao:=DModRosa.IBQLer_itped.fieldbyName('Descricao').AsString;
    wqtds:=DModRosa.IBQLer_itped.fieldbyName('Qtdsai').AsFloat;
    wqtdr:=DModRosa.IBQLer_itped.fieldbyName('Qtdret').AsFloat;
    wpreco:=DModRosa.IBQLer_itped.fieldbyName('Precus').AsFloat;
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
  Descarrega_ped;
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
  Richedit2.Clear;
  Richedit2.Lines.Add(' ');
  Richedit2.Lines.Add(' ARTIGOS  '+StringofChar(#32,8-Length(I))+(I));
  Richedit2.Lines.Add(' ');
  Richedit2.Lines.Add(' SAIDA       '+StringofChar(#32,8-Length(S))+(S));
  Richedit2.Lines.Add('                 '+StringofChar(#32,12-Length(X))+(X));
  Richedit2.Lines.Add(' ');
  Richedit2.Lines.Add(' RETORNO '+StringofChar(#32,8-length(R))+(R));
  Richedit2.Lines.Add('                 '+StringofChar(#32,12-Length(Y))+(Y));
  Richedit2.Lines.Add(' ');
  Richedit2.Lines.Add(' VENDIDO   '+StringofChar(#32,8-Length(V))+(V));
  Richedit2.Lines.Add('                 '+StringofChar(#32,12-Length(Z))+(Z));
  //Richedit2.Lines.Add('% VENDA      '+StringofChar(#32,8-Length(W))+(W));
  if wsitu='X' then
  begin
    maskedit1.Text:=wretor;
    ShowMessage('Este Pedido foi excluido');
    chvff:='';
    chavfr:='1';
    edit4.Clear;
    maskedit1.Clear;
    Richedit2.Clear;
    Modalresult:=-1;
    exit;
  end;
  if wsitu='V' then
  begin
    maskedit1.Text:=wretor;
    if MessageDlg('Este Pedido foi vendido, deseja recuperar ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      Restaura;
      Atu_item;
    end;
    chvff:='';
    chavfr:='1';
    edit4.Clear;
    maskedit1.Clear;
    Richedit2.Clear;
    Modalresult:=-1;
    exit;
  end;
  if wsitu='D' then
  begin
    maskedit1.Text:=wretor;
    if MessageDlg('Este Pedido foi devolvido, deseja recuperar ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      Restaura;
      Atu_item;
    end;
    chvff:='';
    chavfr:='1';
    edit4.Clear;
    maskedit1.Clear;
    Richedit2.Clear;
    Modalresult:=-1;
    exit;
  end;
  if wsitu='R' then
  begin
    maskedit1.Text:=wretor;
    if MessageDlg('Este Pedido foi retornado, deseja recuperar ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      Restaura;
      Atu_item;
    end;
    chvff:='';
    chavfr:='1';
    edit4.Clear;
    maskedit1.Clear;
    Richedit2.Clear;
    Modalresult:=-1;
    exit;
  end;
  Showmessage('ATENÇÃO ...PEDIDO NA SACOLEIRA  !!!!');
  chvff:='';
  chavfr:='1';
  edit4.Clear;
  maskedit1.Clear;
  Richedit2.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmVoltaret.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmVoltaret.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmVoltaret.FormShow(Sender: TObject);
begin
  xsitu:=' ';
  chvff:='';
  chavfr:='1';
  edit1.Clear;
  edit2.Clear;
  maskedit1.Text:=DateToStr(Date());
  wempresa:='SIDTEX CONFECÇÕES LTDA.';
  wendereco:='Rua Bernardo de Vanconcelos , 12  Realengo -  RJ';
  wtelefone:='Tel:(021) 3381-8581  /  Cep: 21250-270';
  winscricoes:='CNPJ: 04.704.379/0001-71   -   Insc.Est: 77.260.595';
  Richedit1.Clear;
  Richedit2.Clear;
  edit2.SetFocus;
  exit;
end;

procedure TFrmVoltaret.Atu_item;
begin
  // Ler Itens do pedido *********************
  IBQAuxret.Close;
  IBQAuxret.SQL.Clear;
  IBQAuxret.SQL.Add('Select * from AUXITENS '+
                    'Where Pedido=:ped_digit '+
                    'Order by Codart');
  IBQAuxret.ParamByName('ped_digit').AsString:=edit4.Text;
  IBQAuxret.OPen;
  IBQAuxret.DisableControls;
  IBQAuxret.First;
  while not IBQAuxret.Eof do
  begin
    wcodart:=IBQAuxret.fieldbyName('Codart').AsString;
    wqtdr:=IBQAuxret.fieldbyName('Qtdret').AsFloat;
    DModRosa.IBQVer_itped.Sql.Clear;
    DModRosa.IBQVer_itped.Sql.Add('Update ITEMPEDIDO ');
    DModRosa.IBQVer_itped.Sql.Add('Set QTDRET=:qtd_digit '+
                                  'Where Pedido=:ped_digit '+
                                  'and CODART=:cod_digit');
    DModRosa.IBQVer_itped.ParamByName('qtd_digit').AsFloat:=0;
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=edit4.text;
    DModRosa.IBQVer_itped.ParamByName('cod_digit').AsString:=wcodart;
    DModRosa.IBQVer_itped.ExecSql;
    DModRosa.IBQVer_itped.Close;
    IBQAuxret.Next;
  end;
  IBQAuxret.Close;
  DModRosa.IBQVer_ped.Sql.Clear;
  DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
  DModRosa.IBQVer_ped.Sql.Add('Set SITU=:sit_digit, '+
                              'RETORNO=:ret_digit,'+
                              'TOTVEN=:tot_digit '+
                              'Where Pedido=:ped_digit');
  DModRosa.IBQVer_ped.ParamByName('Sit_digit').AsString:='E';
  DModRosa.IBQVer_ped.ParamByName('ret_digit').AsString:='        ';
  DModRosa.IBQVer_ped.ParamByName('tot_digit').AsFloat:=0;
  DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit4.text;
  DModRosa.IBQVer_ped.ExecSql;
  DModRosa.IBQVer_ped.Close;
  edit4.Clear;
  maskedit1.Clear;
  Richedit2.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmVoltaret.Restaura;
begin
  IBQAuxret.Close;
  IBQAuxret.SQL.Clear;
  IBQAuxret.SQL.Add('Select * from AUXITENS '+
                    'Where Pedido=:ped_digit '+
                    'Order by Codart');
  IBQAuxret.ParamByName('ped_digit').AsString:=edit4.Text;
  IBQAuxret.OPen;
  IBQAuxret.DisableControls;
  IBQAuxret.First;
  chvtem:='';
  while not IBQAuxret.Eof do
  begin
    wcodart:=IBQAuxret.fieldbyName('Codart').AsString;
    wqtdr:=IBQAuxret.FieldByName('Qtdret').AsFloat;
    chvtem:='';
    //   Restaura Estoque do Artigo ******
    DModRosa.IBQLer_art.Close;
    DModRosa.IBQLer_art.SQL.Clear;
    DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                'Where Codigo=:cod_digit');
    DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=wcodart;
    DModRosa.IBQLer_art.OPen;
    if DModRosa.IBQLer_art.RecordCount>0 then
    begin
      chvtem:='1';
      xestoq:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat;
      xestoq:=xestoq-wqtdr;
    end;
    DModRosa.IBQLer_art.Close;
    if chvtem='1'then
    begin
      //   Restaura Estoque do Artigo ******
      DModRosa.IBQVer_art.Close;
      DModRosa.IBQVer_art.Sql.Clear;
      DModRosa.IBQVer_art.SqL.Add('Update ARTIGO ');
      DModRosa.IBQVer_art.Sql.Add('Set ESTOQ=:ESTOQ '+
                                  'Where CODIGO=:CODIGO');
      DModRosa.IBQVer_art.ParamByName('CODIGO').AsString:=wcodart;
      DModRosa.IBQVer_art.ParamByName('ESTOQ').AsFloat:=xestoq;
      DModRosa.IBQVer_art.ExecSql;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_art.Close;
    end;
    IBQAuxret.Next;
  end;
  IBQAuxret.Close;
end;

procedure TFrmVoltaret.Descarrega_ped;
begin
  IBQPesqret.Close;
  IBQPesqret.SQL.Clear;
  IBQPesqret.SQL.Add('Select * from AUXITENS '+
                         'Order by Codart');
  IBQPesqret.Active:=True;
end;


end.
