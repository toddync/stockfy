unit UPrintped;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IBX.IBTable, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, frxClass, frxDBSet;

type
  TFrmPrintped = class(TForm)
    GroupBox1: TGroupBox;
    Button1: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Label5: TLabel;
    RvPedidovenda: TfrxReport;
    DtsPedvenda: TfrxDBDataset;
    IBQAuxrecibo: TIBQuery;
    IBTAuxrecibo: TIBTable;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RvPedidovendaGetValue(const VarName: string; var Value: Variant);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrintped: TFrmPrintped;
  wsitu,wemissao,wvencimto,wdevoluc,wnumcli,wnomcli,wvend,wvia,wcontato,wturno: string;
  index_lin,cont_pag,xvia,wtotart: Integer;
  wqtda,wtotqtd,wqtart,wprecxg,wqtdr,wvendido,wtotvendido: Extended;
  wprecus,wpreven,wtotpro,wtotped,wtotqtda,wtotven: extended;
  wendereco,wbairro,wcidade,westado,wreferencia,wcep,wnumped,wnumero,wcodven: string;
  wretorno,wcodart,wvencmto,wdescricao,wsoli,wnomvend,wpraca,wrota,wdatped,wreferencias: string;
  wnompraca,wnomrota,wobser,wncpf,wnifp,wtelcli,wnomven,wtelven,whorini,whorfin: string;
  wtotpedid,wtotvenda,wtotretor: extended;

implementation

uses UDModRosa;

{$R *.dfm}

procedure TFrmPrintped.Button1Click(Sender: TObject);
begin
  edit1.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmPrintped.Button3Click(Sender: TObject);
begin
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
  end;  }
  IBQAuxrecibo.Close;
  IBQAuxrecibo.SQL.Clear;
  IBQAuxrecibo.SQL.Add('Select * from AUXRECIBO '+
                       'Order by Item');
  IBQAuxrecibo.OPen;
  IBQAuxrecibo.Close;
  RvPedidovenda.showreport;
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

procedure TFrmPrintped.Edit1Exit(Sender: TObject);
begin
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
  wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
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

procedure TFrmPrintped.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmPrintped.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmPrintped.FormShow(Sender: TObject);
begin
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
     edit1.SetFocus;
  exit;
end;

procedure TFrmPrintped.RvPedidovendaGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(varname,'Dat01')=0 then
     value:=DateToStr(Date());
  if Comparetext(varname,'Temp01')=0 then
     Value:=TimeToStr(Time());
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
end;

end.
