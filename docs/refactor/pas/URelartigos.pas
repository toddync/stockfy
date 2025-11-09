unit URelartigos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, frxClass,
  frxDBSet, IBX.IBQuery, IBX.IBCustomDataSet, IBX.IBTable, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask;

type
  TFrmRelartigos = class(TForm)
    DBGrid1: TDBGrid;
    IBTAuxart: TIBTable;
    IBQuery1: TIBQuery;
    DtsMapg: TfrxDBDataset;
    RvMapg: TfrxReport;
    RvMapa: TfrxReport;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    DtsRetor: TfrxDBDataset;
    RvRetor: TfrxReport;
    DtsMapa: TfrxDBDataset;
    IBTAuxret: TIBTable;
    IBQAuxart: TIBQuery;
    IBQAuxret: TIBQuery;
    IBTAuxartCODART: TIBStringField;
    IBTAuxartDESCRICAO: TIBStringField;
    IBTAuxartESTOQ: TIntegerField;
    IBTAuxartCOMPRA: TIntegerField;
    IBTAuxartDEFEITO: TIntegerField;
    IBTAuxartRETDEV: TIntegerField;
    IBTAuxartSAIDA: TIntegerField;
    IBTAuxartQTDFIS: TIntegerField;
    IBTAuxartVALFIS: TIntegerField;
    IBTAuxartQTDSAC: TIntegerField;
    IBTAuxartVALSAC: TIBBCDField;
    IBTAuxartQTDREAL: TIntegerField;
    IBTAuxartVALREAL: TIBBCDField;
    IBTAuxartQTDVEN: TIntegerField;
    IBTAuxartVALVEN: TIBBCDField;
    IBTAuxartCUSTO: TIBBCDField;
    IBTAuxartMEDIA: TIntegerField;
    IBTAuxartAPURADO: TIntegerField;
    IBTAuxartNASACOL: TIntegerField;
    IBQAuxartCODART: TIBStringField;
    IBQAuxartDESCRICAO: TIBStringField;
    IBQAuxartESTOQ: TIntegerField;
    IBQAuxartCOMPRA: TIntegerField;
    IBQAuxartDEFEITO: TIntegerField;
    IBQAuxartRETDEV: TIntegerField;
    IBQAuxartSAIDA: TIntegerField;
    IBQAuxartQTDFIS: TIntegerField;
    IBQAuxartVALFIS: TIntegerField;
    IBQAuxartQTDSAC: TIntegerField;
    IBQAuxartVALSAC: TIBBCDField;
    IBQAuxartQTDREAL: TIntegerField;
    IBQAuxartVALREAL: TIBBCDField;
    IBQAuxartQTDVEN: TIntegerField;
    IBQAuxartVALVEN: TIBBCDField;
    IBQAuxartCUSTO: TIBBCDField;
    IBQAuxartMEDIA: TIntegerField;
    IBQAuxartAPURADO: TIntegerField;
    IBQAuxartNASACOL: TIntegerField;
    IBTAuxretITEM: TIBStringField;
    IBTAuxretPEDIDO: TIBStringField;
    IBTAuxretCODIGO: TIBStringField;
    IBTAuxretBASE: TIBStringField;
    IBTAuxretQUANT: TIntegerField;
    IBTAuxretPRECO: TIBBCDField;
    IBQAuxretITEM: TIBStringField;
    IBQAuxretPEDIDO: TIBStringField;
    IBQAuxretCODIGO: TIBStringField;
    IBQAuxretBASE: TIBStringField;
    IBQAuxretQUANT: TIntegerField;
    IBQAuxretPRECO: TIBBCDField;
    IBTAuxmapa: TIBTable;
    IBQAuxmapa: TIBQuery;
    IBTAuxrelmerc: TIBTable;
    IBQAuxrelmerc: TIBQuery;
    IBTAuxmapaCODART: TIBStringField;
    IBTAuxmapaDESCRICAO: TIBStringField;
    IBTAuxmapaESTOQ: TIntegerField;
    IBTAuxmapaCOMPRA: TIntegerField;
    IBTAuxmapaDEFEITO: TIntegerField;
    IBTAuxmapaRETDEV: TIntegerField;
    IBTAuxmapaSAIDA: TIntegerField;
    IBTAuxmapaQTDFIS: TIntegerField;
    IBTAuxmapaVALFIS: TIntegerField;
    IBTAuxmapaQTDSAC: TIntegerField;
    IBTAuxmapaVALSAC: TIBBCDField;
    IBTAuxmapaQTDREAL: TIntegerField;
    IBTAuxmapaVALREAL: TIBBCDField;
    IBTAuxmapaQTDVEN: TIntegerField;
    IBTAuxmapaVALVEN: TIBBCDField;
    IBTAuxmapaCUSTO: TIBBCDField;
    IBTAuxmapaMEDIA: TIntegerField;
    IBTAuxmapaAPURADO: TIntegerField;
    IBTAuxmapaNASACOL: TIntegerField;
    IBTAuxrelmercITEM: TIBStringField;
    IBTAuxrelmercPEDIDO: TIBStringField;
    IBTAuxrelmercCODIGO: TIBStringField;
    IBTAuxrelmercBASE: TIBStringField;
    IBTAuxrelmercQUANT: TIntegerField;
    IBTAuxrelmercPRECO: TIBBCDField;
    IBQAuxrelmercITEM: TIBStringField;
    IBQAuxrelmercPEDIDO: TIBStringField;
    IBQAuxrelmercCODIGO: TIBStringField;
    IBQAuxrelmercBASE: TIBStringField;
    IBQAuxrelmercQUANT: TIntegerField;
    IBQAuxrelmercPRECO: TIBBCDField;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure RvRetorGetValue(const VarName: string; var Value: Variant);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure RvMapgGetValue(const VarName: string; var Value: Variant);
    procedure RvMapaGetValue(const VarName: string; var Value: Variant);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelartigos: TFrmRelartigos;
  pagina: Integer;
  Linha: Integer;
  Tamanho: Integer;
  Coluna: Integer;
  cont_lin,max_lin,x,y,z,zcodigo,xcodigo: Integer;
  wtipo,wnumero,wnome,wdata,chav,wantes,wcodigo,wunidade,wdescricao,wretorno: string;
  wmarca,xmarca,wpra1,wpra2,wpra3,wpra4,Q,V,xprod,chvest,chvqtd,wdatret,wtelefone: string;
  gtotal,wtotal,wquant,wpreco,ptotal,wprod,wmedia,wvalpag,wvalven,wqtda,wprecus,wresido: Extended;
  wnpra1,wnpra2,wnpra3,wnpra4,wnomvend,wdatpag,wcodven,wopcao,wdescop,wnumnot: string;
  wnumcli,wemissao,wdevoluc,wdatped,wvencmto,wsitu,wnomcli,wbairro,wcodart,chavfaz: string;
  wvend,wdatini,wdatfin,witens,wdatbase,xpraca,wpraca,wnompra,zpraca,wturno: string;
  gdocm,gprod,xitens,wpedidos,wtotsaiu: Integer;
  wtotven,wtotres,wtotpag,wvalped,wvalcomp,wtotcomp,wvalcob,wtotcob,wnotas: Extended;
  chvimp,wdatven,wchapa,wempresa,wtipped,wdatreto,wprimeiro,wultimo: string;
  wvalsai,wvalres,wprazo,wsaldo,wsaldant,Vinicio,Vsacoleira,wqtdreal,wvalreal: Extended;
  wnumpar,wtippag,wnumpag,worigem,wobser,chave: string;
  wendereco,wcidade,westado,wrota,wcontato,wdatimp: string;
  wpedido ,wdretor,wvencto,whoraini,whorafin,wdatcob: string;
  ArrArti: array of string;
  ArrDesc: array of string;
  ArrPrec: array of real;
  ArrEsto: array of real;
  ArrQtsc: array of real;
  ArrComp: array of real;
  ArrDefe: array of real;
  ArrRtdv: array of real;
  ArrSaiu: array of real;
  ArrQtda: array of real;
  ArrQtdf: array of real;
  ArrValf: array of real;
  ArrQtds: array of real;
  ArrVals: array of real;
  ArrQtdr: array of real;
  ArrValr: array of real;
  ArrQtdv: array of real;
  ArrValv: array of real;
  ArrMedi: array of real;
  //Arromaneio: Array[1..8] of String;

implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmRelartigos.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col060').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  x:=0;
  y:=0;
  z:=0;
  chvest:='';
  IBTAuxart.EmptyTable;
  IBTAuxret.EmptyTable;
  // Ajusta tamanhos dos arreys *****************
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Order by Codigo');
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount=0 then
  begin
    DModRosa.IBQLer_art.Close;
    Showmessage('Nao ha Artigos !!');
    maskedit3.SetFocus;
    exit;
  end;
  DModRosa.IBQLer_art.Last;
  x:=DModRosa.IBQLer_art.RecordCount;
  x:=x+1;
  SetLength(ArrArti, x);
  SetLength(ArrDesc, x);
  SetLength(ArrPrec, x);
  SetLength(ArrEsto, x);
  SetLength(ArrComp, x);
  SetLength(ArrDefe, x);
  SetLength(ArrRtdv, x);
  SetLength(ArrSaiu, x);
  SetLength(ArrQtda, x);
  SetLength(ArrQtdf, x);
  SetLength(ArrValf, x);
  SetLength(ArrQtds, x);
  SetLength(ArrVals, x);
  SetLength(ArrQtdr, x);
  SetLength(ArrValr, x);
  SetLength(ArrQtdv, x);
  SetLength(ArrValv, x);
  SetLength(ArrMedi, x);
  // Alimenta os artigos ******************
  DModRosa.IBQLer_art.DisableControls;
  DModRosa.IBQLer_art.First;
  while not DModRosa.IBQLer_art.Eof do
  begin
    ArrArti[y]:=DModRosa.IBQLer_art.fieldbyName('Codigo').AsString;
    ArrDesc[y]:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
    ArrPrec[y]:=DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
    ArrEsto[y]:=0;
    ArrComp[y]:=0;
    ArrDefe[y]:=0;
    ArrRtdv[y]:=0;
    ArrSaiu[y]:=0;
    ArrQtdf[y]:=0;
    Arrqtda[Y]:=0;
    ArrValf[y]:=0;
    ArrQtds[y]:=0;
    ArrVals[y]:=0;
    ArrQtdr[y]:=0;
    ArrValr[y]:=0;
    ArrQtdv[y]:=0;
    Arrvalv[y]:=0;
    ArrMedi[y]:=0;
    y:=y+1;
    DModRosa.IBQLer_art.Next;
  end;
  DModRosa.IBQLer_art.Close;
  ArrArti[x-1]:='9999';
  ArrDesc[x-1]:='******* TOTAIS GERAIS ********';
  ArrEsto[x-1]:=0;
  ArrComp[x-1]:=0;
  ArrDefe[x-1]:=0;
  ArrRtdv[x-1]:=0;
  ArrSaiu[x-1]:=0;
  ArrQtda[x-1]:=0;
  ArrQtdf[x-1]:=0;
  ArrValf[x-1]:=0;
  ArrQtds[x-1]:=0;
  ArrVals[x-1]:=0;
  ArrQtdr[x-1]:=0;
  ArrValr[x-1]:=0;
  ArrQtdv[x-1]:=0;
  ArrValv[x-1]:=0;
  wdatini:=maskedit3.Text;
  wdatfin:=maskedit4.Text;
  xitens:=0;
  witens:='';
  wnotas:=0;
  IBTAuxret.EmptyTable;
  // Monta saida de mercadoria *******************************
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:bas_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:ret_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('bas_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='X';
  DModRosa.IBQLer_ped.ParamByName('ret_digit').AsString:='E';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Retorno').AsDateTime);
    if (StrToDate(wemissao)>=StrToDate(maskedit3.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit4.text)) then
    begin
      wnotas:=wnotas+1;
      // Ler Itens do pedido *********************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                      'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxret.Active then
           IBQAuxret.Active:=False;
        IBQAuxret.Sql.Clear;
        IBQAuxret.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxret.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxret.ParamByName('ITEM').AsString:=witens;
        IBQAuxret.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxret.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxret.ParamByName('BASE').AsString:=wemissao;
        IBQAuxret.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxret.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxret.ExecSql;
        IBQAuxret.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxret.Close;
  IBQAuxret.SQL.Clear;
  IBQAuxret.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxret.OPen;
  IBQAuxret.DisableControls;
  IBQAuxret.First;
  while not IBQAuxret.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxret.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrQtdf[y]:=ArrQtdf[y]+IBQAuxret.fieldbyName('Quant').AsFloat;
        ArrValf[y]:=ArrValf[y]+(IBQAuxret.fieldbyName('Quant').AsFloat*
                                IBQAuxret.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtdf[x-1]:=ArrQtdf[x-1]+IBQAuxret.fieldbyName('Quant').AsFloat;
      ArrValf[x-1]:=ArrValf[x-1]+(IBQAuxret.fieldbyName('Quant').AsFloat*
                                   IBQAuxret.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxret.Next;
  end;
  IBQAuxret.Close;
  // Apura o Retorno *******************************
  xitens:=0;
  witens:='';
  IBTAuxret.EmptyTable;
   if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:bas_digit '+
                              'and Situ=:ret_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('bas_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ret_digit').AsString:='R';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    if (StrToDate(wemissao)>=StrToDate(wdatini)) and
       (StrToDate(wemissao)<=StrToDate(wdatfin)) then
    begin
      // Ler Itens do pedido *************************************************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdret').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxret.Active then
           IBQAuxret.Active:=False;
        IBQAuxret.Sql.Clear;
        IBQAuxret.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxret.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxret.ParamByName('ITEM').AsString:=witens;
        IBQAuxret.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxret.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxret.ParamByName('BASE').AsString:=wemissao;
        IBQAuxret.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxret.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxret.ExecSql;
        IBQAuxret.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxret.Close;
  IBQAuxret.SQL.Clear;
  IBQAuxret.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxret.OPen;
  IBQAuxret.DisableControls;
  IBQAuxret.First;
  while not IBQAuxret.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxret.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxret.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxret.fieldbyName('Quant').AsFloat;
    IBQAuxret.Next;
  end;
  IBQAuxret.Close;
  // Apura Devolucao *******************************
  xitens:=0;
  witens:='';
  IBTAuxret.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:bas_digit '+
                              'and Situ=:ret_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('bas_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ret_digit').AsString:='D';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    if (StrToDate(wemissao)>=StrToDate(wdatini)) and
       (StrToDate(wemissao)<=StrToDate(wdatfin)) then
    begin
      // Ler Itens do pedido *************************************************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdret').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxret.Active then
           IBQAuxret.Active:=False;
        IBQAuxret.Sql.Clear;
        IBQAuxret.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxret.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxret.ParamByName('ITEM').AsString:=witens;
        IBQAuxret.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxret.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxret.ParamByName('BASE').AsString:=wemissao;
        IBQAuxret.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxret.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxret.ExecSql;
        IBQAuxret.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxret.Close;
  IBQAuxret.SQL.Clear;
  IBQAuxret.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,item');
  IBQAuxret.OPen;
  IBQAuxret.DisableControls;
  IBQAuxret.First;
  while not IBQAuxret.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxret.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxret.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxret.fieldbyName('Quant').AsFloat;
    IBQAuxret.Next;
  end;
  IBQAuxret.Close;
  // Apura na sacoleira *******************************
  xitens:=0;
  witens:='';
  IBTAuxret.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base<=:datf_digit '+
                              'and Situ=:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(wdatfin);
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    // Ler Itens do pedido *********************
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_itped.SQL.Clear;
    DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
    DModRosa.IBQVer_itped.OPen;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      xitens:=xitens+1;
      witens:=IntToStr(xitens);
      while Length(witens)<5 do
            witens:='0'+witens;
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
      if IBQAuxret.Active then
         IBQAuxret.Active:=False;
      IBQAuxret.Sql.Clear;
      IBQAuxret.Sql.Add('Insert Into AUXRELMAPA ');
      IBQAuxret.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                    'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
      IBQAuxret.ParamByName('ITEM').AsString:=witens;
      IBQAuxret.ParamByName('PEDIDO').AsString:=wnumero;
      IBQAuxret.ParamByName('CODIGO').AsString:=wcodart;
      IBQAuxret.ParamByName('BASE').AsString:=wemissao;
      IBQAuxret.ParamByName('QUANT').AsFloat:=wqtda;
      IBQAuxret.ParamByName('PRECO').AsFloat:=wprecus;
      IBQAuxret.ExecSql;
      IBQAuxret.Close;
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxret.Close;
  IBQAuxret.SQL.Clear;
  IBQAuxret.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,item');
  IBQAuxret.OPen;
  IBQAuxret.DisableControls;
  IBQAuxret.First;
  while not IBQAuxret.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxret.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrQtds[y]:=ArrQtds[y]+IBQAuxret.fieldbyName('Quant').AsFloat;
        ArrVals[y]:=ArrVals[y]+(IBQAuxret.fieldbyName('Quant').AsFloat*
                                IBQAuxret.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtds[x-1]:=ArrQtds[x-1]+IBQAuxret.fieldbyName('Quant').AsFloat;
      ArrVals[x-1]:=ArrVals[x-1]+(IBQAuxret.fieldbyName('Quant').AsFloat*
                                   IBQAuxret.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxret.Next;
  end;
  IBQAuxret.Close;
  // Apura o Vendido *********************
  xitens:=0;
  witens:='';
  IBTAuxret.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:exc_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('exc_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    if (StrToDate(wemissao)>=StrToDate(wdatini)) and
       (StrToDate(wemissao)<=StrToDate(wdatfin)) then
    begin
      // Ler Itens do pedido *********************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat-
               DModRosa.IBQVer_itped.fieldbyName('Qtdret').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxret.Active then
           IBQAuxret.Active:=False;
        IBQAuxret.Sql.Clear;
        IBQAuxret.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxret.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxret.ParamByName('ITEM').AsString:=witens;
        IBQAuxret.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxret.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxret.ParamByName('BASE').AsString:=wemissao;
        IBQAuxret.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxret.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxret.ExecSql;
        IBQAuxret.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxret.Close;
  IBQAuxret.SQL.Clear;
  IBQAuxret.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,item');
  IBQAuxret.OPen;
  IBQAuxret.DisableControls;
  IBQAuxret.First;
  while not IBQAuxret.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxret.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrQtdv[y]:=ArrQtdv[y]+IBQAuxret.fieldbyName('Quant').AsFloat;
        ArrValv[y]:=ArrValv[y]+(IBQAuxret.fieldbyName('Quant').AsFloat*
                                IBQAuxret.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtdv[x-1]:=ArrQtdv[x-1]+IBQAuxret.fieldbyName('Quant').AsFloat;
      ArrValv[x-1]:=ArrValv[x-1]+(IBQAuxret.fieldbyName('Quant').AsFloat*
                                  IBQAuxret.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxret.Next;
  end;
  IBQAuxret.Close;
  // Apura Media ****************************
  for y:=0 to x-1 do
  begin
    if (ArrQtdv[y]>0) and (ArrRtdv[y]>0) then
       ArrMedi[y]:=(ArrQtdv[y]*100.00)/ArrRtdv[y];
  end;
  if (ArrQtdv[x-1]>0) and (ArrRtdv[x-1]>0) then
      ArrMedi[x-1]:=(ArrQtdv[x-1]*100.00)/ArrRtdv[x-1];
  IBQAuxart.Close;
  // Monta Arquivo do mapa ***************
  for z:=0 to x-1 do
  begin
    if IBQAuxart.Active then
       IBQAuxart.Active:=False;
    IBQAuxart.Sql.Clear;
    IBQAuxart.Sql.Add('Insert Into AUXMAPA ');
    IBQAuxart.Sql.Add('(CODART,DESCRICAO,ESTOQ,COMPRA,DEFEITO,RETDEV,SAIDA,'+
                       'QTDFIS,VALFIS,QTDSAC,VALSAC,QTDREAL,VALREAL,'+
                       'QTDVEN,VALVEN,CUSTO,MEDIA,APURADO) '+
                 'Values(:CODART,:DESCRICAO,:ESTOQ,:COMPRA,:DEFEITO,:RETDEV,:SAIDA,'+
                        ':QTDFIS,:VALFIS,:QTDSAC,:VALSAC,:QTDREAL,:VALREAL,'+
                        ':QTDVEN,:VALVEN,:CUSTO,:MEDIA,:APURADO)');
    IBQAuxart.ParamByName('CODART').AsString:=ArrArti[z];
    IBQAuxart.ParamByName('DESCRICAO').AsString:=ArrDesc[z];
    IBQAuxart.ParamByName('ESTOQ').AsFloat:=ArrEsto[z];
    IBQAuxart.ParamByName('COMPRA').AsFloat:=ArrComp[z];
    IBQAuxart.ParamByName('DEFEITO').AsFloat:=ArrDefe[z];
    IBQAuxart.ParamByName('RETDEV').AsFloat:=ArrRtdv[z];
    IBQAuxart.ParamByName('SAIDA').AsFloat:=ArrSaiu[z];
    IBQAuxart.ParamByName('QTDFIS').AsFloat:=ArrQtdf[z];
    IBQAuxart.ParamByName('VALFIS').AsFloat:=ArrValf[z];
    IBQAuxart.ParamByName('QTDSAC').AsFloat:=ArrQtds[z];
    IBQAuxart.ParamByName('VALSAC').AsFloat:=ArrVals[z];
    IBQAuxart.ParamByName('QTDREAL').AsFloat:=ArrQtdr[z];
    IBQAuxart.ParamByName('VALREAL').AsFloat:=ArrValr[z];
    IBQAuxart.ParamByName('QTDVEN').AsFloat:=ArrQtdv[z];
    IBQAuxart.ParamByName('VALVEN').AsFloat:=ArrValv[z];
    IBQAuxart.ParamByName('CUSTO').AsFloat:=ArrPrec[z];
    IBQAuxart.ParamByName('MEDIA').AsFloat:=ArrMedi[z];
    IBQAuxart.ParamByName('APURADO').AsFloat:=ArrQtda[z];
    IBQAuxart.ExecSql;
    IBQAuxart.Close;
  end;
  IBQAuxart.Close;
  IBQAuxart.SQL.Clear;
  IBQAuxart.SQL.Add('Select * from AUXMAPA '+
                     'Order By Codart');
  IBQAuxart.OPen;
  IBQAuxart.Close;
  // Emite a relação ******************
  RvRetor.showreport;
end;

procedure TFrmRelartigos.Button2Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col060').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  x:=0;
  y:=0;
  z:=0;
  DModRosa.IBQVer_contg.Close;
  DModRosa.IBQVer_contg.SQL.Clear;
  DModRosa.IBQVer_contg.SQL.Add('Select * from CONTAGEM '+
                                'Where Datcont=:dat_cont '+
                                'and Tipo=:tip_cont '+
                                'Order by Tipo,Codigo');
  DModRosa.IBQVer_contg.ParamByName('dat_cont').AsDate:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_contg.ParamByName('tip_cont').AsString:='1';
  DModRosa.IBQVer_contg.OPen;
  if DModRosa.IBQVer_contg.RecordCount=0 then
  begin
    DModRosa.IBQVer_contg.Close;
    showmessage('Não achei a contagem dete periodo !!'+chr(13)+
                'Rebata o periodo !!');
    maskedit3.Clear;
    maskedit4.Clear;
    maskedit3.SetFocus;
    exit;
  end;
  IBTAuxmapa.EmptyTable;
  // Ajusta tamanhos dos arreys *****************
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Order by Codigo');
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount=0 then
  begin
    DModRosa.IBQLer_art.Close;
    Showmessage('Nao ha Artigos !!');
    maskedit3.SetFocus;
    exit;
  end;
  DModRosa.IBQLer_art.Last;
  x:=DModRosa.IBQLer_art.RecordCount;
  x:=x+1;
  SetLength(ArrArti, x);
  SetLength(ArrDesc, x);
  SetLength(ArrPrec, x);
  SetLength(ArrEsto, x);
  SetLength(ArrQtsc, x);
  SetLength(ArrComp, x);
  SetLength(ArrDefe, x);
  SetLength(ArrRtdv, x);
  SetLength(ArrSaiu, x);
  SetLength(ArrQtda, x);
  SetLength(ArrQtdf, x);
  SetLength(ArrValf, x);
  SetLength(ArrQtds, x);
  SetLength(ArrVals, x);
  SetLength(ArrQtdr, x);
  SetLength(ArrValr, x);
  SetLength(ArrQtdv, x);
  SetLength(ArrValv, x);
  SetLength(ArrMedi, x);
  // Alimenta os artigos ******************
  DModRosa.IBQLer_art.DisableControls;
  DModRosa.IBQLer_art.First;
  while not DModRosa.IBQLer_art.Eof do
  begin
    ArrArti[y]:=DModRosa.IBQLer_art.fieldbyName('Codigo').AsString;
    ArrDesc[y]:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
    ArrPrec[y]:=DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
    ArrEsto[y]:=0;
    ArrQtsc[y]:=0;
    ArrComp[y]:=0;
    ArrDefe[y]:=0;
    ArrRtdv[y]:=0;
    ArrSaiu[y]:=0;
    ArrQtda[y]:=0;
    ArrQtdf[y]:=0;
    ArrValf[y]:=0;
    ArrQtds[y]:=0;
    ArrVals[y]:=0;
    ArrQtdr[y]:=0;
    ArrValr[y]:=0;
    ArrQtdv[y]:=0;
    Arrvalv[y]:=0;
    ArrMedi[y]:=0;
    y:=y+1;
    DModRosa.IBQLer_art.Next;
  end;
  DModRosa.IBQLer_art.Close;
  // Inicializa os arreis *********************
  ArrArti[x-1]:='9999';
  ArrDesc[x-1]:='*** TOTAIS GERAIS ***';
  ArrEsto[x-1]:=0;
  ArrQtsc[x-1]:=0;
  ArrComp[x-1]:=0;
  ArrDefe[x-1]:=0;
  ArrRtdv[x-1]:=0;
  ArrSaiu[x-1]:=0;
  ArrQtda[x-1]:=0;
  ArrQtdf[x-1]:=0;
  ArrValf[x-1]:=0;
  ArrQtds[x-1]:=0;
  ArrVals[x-1]:=0;
  ArrQtdr[x-1]:=0;
  ArrValr[x-1]:=0;
  ArrQtdv[x-1]:=0;
  ArrValv[x-1]:=0;
  Vinicio:=0;
  Vsacoleira:=0;
  // Monta estoque inicial da contagem ************************
  DModRosa.IBQVer_contg.Close;
  DModRosa.IBQVer_contg.SQL.Clear;
  DModRosa.IBQVer_contg.SQL.Add('Select * from CONTAGEM '+
                                'Where Datcont=:dat_cont '+
                                'and Tipo=:tip_cont '+
                                'Order by Tipo,Codigo');
  DModRosa.IBQVer_contg.ParamByName('dat_cont').AsDate:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_contg.ParamByName('tip_cont').AsString:='2';
  DModRosa.IBQVer_contg.OPen;
  DModRosa.IBQVer_contg.DisableControls;
  DModRosa.IBQVer_contg.First;
  while not DModRosa.IBQVer_contg.Eof do
  begin
    chvqtd:='';
    wcodigo:=DModRosa.IBQVer_contg.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrEsto[y]:=DModRosa.IBQVer_contg.fieldbyName('Inicial').AsFloat;
        Vinicio:=Vinicio+(DModRosa.IBQVer_contg.fieldbyName('Inicial').AsFloat*
                          DModRosa.IBQVer_contg.fieldbyName('Preco').AsFloat);
        ArrQtsc[y]:=DModRosa.IBQVer_contg.fieldbyName('Sacol').AsFloat;
        Vsacoleira:=Vsacoleira+(DModRosa.IBQVer_contg.fieldbyName('Sacol').AsFloat*
                                DModRosa.IBQVer_contg.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrEsto[x-1]:=ArrEsto[x-1]+DModRosa.IBQVer_contg.fieldbyName('Inicial').AsFloat;
      ArrQtsc[x-1]:=ArrQtsc[x-1]+DModRosa.IBQVer_contg.fieldbyName('Sacol').AsFloat;
    end;
    DModRosa.IBQVer_contg.Next;
  end;
  DModRosa.IBQVer_contg.Close;
  IBTAuxrelmerc.EmptyTable;
  // Monta as compras ******************
  xitens:=0;
  witens:='';
  DModRosa.IBQVer_comp.Close;
  DModRosa.IBQVer_comp.SQL.Clear;
  DModRosa.IBQVer_comp.SQL.Add('Select * from COMPRA '+
                               'Where Datnot>=:ini_digit '+
                               'and Datnot<=:fin_digit '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQVer_comp.ParamByName('ini_digit').AsDateTime:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_comp.ParamByName('fin_digit').AsDateTime:=StrToDate(maskedit4.text);
  DModRosa.IBQVer_comp.OPen;
  if DModRosa.IBQVer_comp.RecordCount>0 then
  begin
    DModRosa.IBQVer_comp.DisableControls;
    DModRosa.IBQVer_comp.First;
    while not DModRosa.IBQVer_comp.Eof do
    begin
      wtipped:=DModRosa.IBQVer_comp.fieldbyName('Tipped').AsString;
      wnumnot:=DModRosa.IBQVer_comp.fieldbyName('Numped').AsString;
      DModRosa.IBQVer_itcomp.Close;
      DModRosa.IBQVer_itcomp.SQL.Clear;
      DModRosa.IBQVer_itcomp.SQL.Add('Select * from ITEMCOMPRA '+
                                     'Where Tipped=:tip_digit '+
                                     'and Numped=:num_digit '+
                                     'Order By Codart');
      DModRosa.IBQVer_itcomp.ParamByName('tip_digit').AsString:=wtipped;
      DModRosa.IBQVer_itcomp.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itcomp.OPen;
      DModRosa.IBQVer_itcomp.DisableControls;
      DModRosa.IBQVer_itcomp.First;
      while not DModRosa.IBQVer_itcomp.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodigo:=DModRosa.IBQVer_itcomp.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itcomp.fieldbyName('Quant').AsFloat;
        if IBQAuxrelmerc.Active then
         IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                     'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumnot;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodigo;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=0;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itcomp.Next;
      end;
      DModRosa.IBQVer_itcomp.Close;
      DModRosa.IBQVer_comp.Next;
    end;
  end;
  DModRosa.IBQVer_comp.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrComp[y]:=ArrComp[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrComp[x-1]:=ArrComp[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Defeitos *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  DModRosa.IBQVer_def.Close;
  DModRosa.IBQVer_def.SQL.Clear;
  DModRosa.IBQVer_def.SQL.Add('Select * from DEFEITO '+
                              'Where Datnot>=:ini_digit '+
                              'and Datnot<=:fin_digit '+
                              'Order By Datnot,Numnot');
  DModRosa.IBQVer_def.ParamByName('ini_digit').AsDateTime:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_def.ParamByName('fin_digit').AsDateTime:=StrToDate(maskedit4.text);
  DModRosa.IBQVer_def.OPen;
  if DModRosa.IBQVer_def.RecordCount>0 then
  begin
    DModRosa.IBQVer_def.DisableControls;
    DModRosa.IBQVer_def.First;
    while not DModRosa.IBQVer_def.Eof do
    begin
      wnumnot:=DModRosa.IBQVer_def.fieldbyName('Numnot').AsString;
      DModRosa.IBQVer_itdef.Close;
      DModRosa.IBQVer_itdef.SQL.Clear;
      DModRosa.IBQVer_itdef.SQL.Add('Select * from ITEMDEFEITO '+
                                    'Where Numnot=:num_digit '+
                                    'Order By Codart');
      DModRosa.IBQVer_itdef.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itdef.OPen;
      DModRosa.IBQVer_itdef.DisableControls;
      DModRosa.IBQVer_itdef.First;
      while not DModRosa.IBQVer_itdef.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodigo:=DModRosa.IBQVer_itdef.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itdef.fieldbyName('Quant').AsFloat;
        wpreco:=DModRosa.IBQVer_itdef.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                     'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumnot;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodigo;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wpreco;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itdef.Next;
      end;
      DModRosa.IBQVer_itdef.Close;
      DModRosa.IBQVer_def.Next;
    end;
  end;
  DModRosa.IBQVer_def.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrDefe[y]:=ArrDefe[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrDefe[x-1]:=ArrDefe[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Devolucoes da Cobrançã *************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  DModRosa.IBQVer_dev.Close;
  DModRosa.IBQVer_dev.SQL.Clear;
  DModRosa.IBQVer_dev.SQL.Add('Select * from DEVOLUCAO '+
                              'Where Datnot>=:ini_digit '+
                              'and Datnot<=:fin_digit '+
                              'Order By Datnot,Numnot');
  DModRosa.IBQVer_dev.ParamByName('ini_digit').AsDateTime:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_dev.ParamByName('fin_digit').AsDateTime:=StrToDate(maskedit4.text);
  DModRosa.IBQVer_dev.OPen;
  if DModRosa.IBQVer_dev.RecordCount>0 then
  begin
    DModRosa.IBQVer_dev.DisableControls;
    DModRosa.IBQVer_dev.First;
    while not DModRosa.IBQVer_dev.Eof do
    begin
      wnumnot:=DModRosa.IBQVer_dev.fieldbyName('Numnot').AsString;
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
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodigo:=DModRosa.IBQVer_itdev.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itdev.fieldbyName('Quant').AsFloat;
        wpreco:=DModRosa.IBQVer_itdev.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumnot;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodigo;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wpreco;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itdev.Next;
      end;
      DModRosa.IBQVer_itdev.Close;
      DModRosa.IBQVer_dev.Next;
    end;
  end;
  DModRosa.IBQVer_dev.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Saidas ***********************************************************************
  {IBTAuxrelmerc.EmptyTable;
  xitens:=0;
  witens:='';
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Retorno>=:dati_digit '+
                              'and Retorno<=:datf_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dati_digit').AsDateTime:=StrToDate(Maskedit3.Text);
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(Maskedit4.Text);
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    // Ler Itens do pedido *********************
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_itped.SQL.Clear;
    DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
    DModRosa.IBQVer_itped.OPen;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      xitens:=xitens+1;
      witens:=IntToStr(xitens);
      while Length(witens)<5 do
            witens:='0'+witens;
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
      if IBQAuxrelmerc.Active then
         IBQAuxrelmerc.Active:=False;
      IBQAuxrelmerc.Sql.Clear;
      IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
      IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                   'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
      IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
      IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
      IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
      IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
      IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
      IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
      IBQAuxrelmerc.ExecSql;
      IBQAuxrelmerc.Close;
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrSaiu[y]:=ArrSaiu[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrSaiu[x-1]:=ArrSaiu[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close; }
  // Monta Sacoleira *******************************
  witens:='';
  xitens:=0;
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base<=:datf_digit '+
                              'and Situ=:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(maskedit4.Text);
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    // Ler Itens do pedido *********************
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_itped.SQL.Clear;
    DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
    DModRosa.IBQVer_itped.OPen;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      xitens:=xitens+1;
      witens:=IntToStr(xitens);
      while Length(witens)<5 do
            witens:='0'+witens;
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
      if IBQAuxrelmerc.Active then
         IBQAuxrelmerc.Active:=False;
      IBQAuxrelmerc.Sql.Clear;
      IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
      IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                   'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
      IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
      IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
      IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
      IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
      IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
      IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
      IBQAuxrelmerc.ExecSql;
      IBQAuxrelmerc.Close;
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrQtds[y]:=ArrQtds[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrVals[y]:=ArrVals[y]+(Arrprec[y]*IBQAuxrelmerc.fieldbyName('Quant').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtds[x-1]:=ArrQtds[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrVals[x-1]:=ArrVals[x-1]+(Arrprec[y]*IBQAuxrelmerc.fieldbyName('Quant').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Vendido *******************************
  IBTAuxrelmerc.EmptyTable;
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:exc_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('exc_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    if (StrToDate(wemissao)>=StrToDate(maskedit3.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit4.text)) then
    begin
      // Ler Itens do pedido *********************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat-
               DModRosa.IBQVer_itped.fieldbyName('Qtdret').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=wemissao;
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrQtdv[y]:=ArrQtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrValv[y]:=ArrValv[y]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtdv[x-1]:=ArrQtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrValv[x-1]:=ArrValv[x-1]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                  IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Deduz devolução da Cobrança ************************
  for y:=0 to x-1 do
  begin
    ArrQtdv[y]:=(ArrQtdv[y]-ArrRtdv[y]);
  end;
  if chvqtd='1' then
  begin
      ArrQtdv[x-1]:=ArrQtdv[x-1]-ArrRtdv[x-1];
  end;
  // Apura saida do vendido +++++++++
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:exc_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('exc_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    if (StrToDate(wemissao)>=StrToDate(maskedit3.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit4.text)) then
    begin
      // Ler Itens do pedido *************************************************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=wemissao;
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrSaiu[y]:=ArrSaiu[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrSaiu[x-1]:=ArrSaiu[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Calcula o  apurado ********************************************************
  for y:=0 to x-2 do
  begin
    ArrQtda[y]:=(ArrEsto[y]+ArrQtsc[y]+ArrComp[y])-
                (Arrdefe[y]+Arrqtds[y]+ArrQtdv[y]);
    ArrValf[y]:=ArrQtda[y]*Arrprec[y];
  end;
  ArrQtda[x-1]:=0;
  ArrValf[x-1]:=0;
  for y:=0 to x-2 do
  begin
    ArrQtda[x-1]:=ArrQtda[x-1]+ArrQtda[y];
    ArrValf[x-1]:=ArrValf[x-1]+ArrValf[y];
  end;
  // Apura Media **************************************************************
  for y:=0 to x-1 do
  begin
    if ArrSaiu[y]>0 then
       ArrMedi[y]:=(ArrQtdv[y]*100)/ArrSaiu[y];
  end;
  if ArrSaiu[x-1]>0 then
     ArrMedi[x-1]:=(ArrQtdv[x-1]*100)/ArrSaiu[x-1];
  // Apura estoque real ****************
  for y:=0 to x-1 do
  begin
    ArrQtdr[y]:=ArrQtdr[y]+(ArrQtda[y]+ArrQtds[y]);
    ArrValr[y]:=ArrValr[y]+(ArrValf[y]+ArrVals[y]);
  end;
  ArrQtdr[x-1]:=ArrQtda[x-1]+ArrQtds[x-1];
  ArrValr[x-1]:=ArrValf[x-1]+ArrVals[x-1];
  // Monta Arquivo do mapa ***************
  for z:=0 to x-1 do
  begin
    if IBQAuxmapa.Active then
       IBQAuxmapa.Active:=False;
    IBQAuxmapa.Sql.Clear;
    IBQAuxmapa.Sql.Add('Insert Into AUXMAPA ');
    IBQAuxmapa.Sql.Add('(CODART,DESCRICAO,ESTOQ,COMPRA,DEFEITO,RETDEV,SAIDA,'+
                       'QTDFIS,VALFIS,QTDSAC,VALSAC,QTDREAL,VALREAL,'+
                       'QTDVEN,VALVEN,CUSTO,MEDIA,APURADO,NASACOL) '+
                 'Values(:CODART,:DESCRICAO,:ESTOQ,:COMPRA,:DEFEITO,:RETDEV,:SAIDA,'+
                        ':QTDFIS,:VALFIS,:QTDSAC,:VALSAC,:QTDREAL,:VALREAL,'+
                        ':QTDVEN,:VALVEN,:CUSTO,:MEDIA,:APURADO,:NASACOL)');
    IBQAuxmapa.ParamByName('CODART').AsString:=ArrArti[z];
    IBQAuxmapa.ParamByName('DESCRICAO').AsString:=ArrDesc[z];
    IBQAuxmapa.ParamByName('ESTOQ').AsFloat:=ArrEsto[z];
    IBQAuxmapa.ParamByName('COMPRA').AsFloat:=ArrComp[z];
    IBQAuxmapa.ParamByName('DEFEITO').AsFloat:=ArrDefe[z];
    IBQAuxmapa.ParamByName('RETDEV').AsFloat:=ArrRtdv[z];
    IBQAuxmapa.ParamByName('SAIDA').AsFloat:=ArrSaiu[z];
    IBQAuxmapa.ParamByName('QTDFIS').AsFloat:=ArrQtdf[z];
    IBQAuxmapa.ParamByName('VALFIS').AsFloat:=ArrValf[z];
    IBQAuxmapa.ParamByName('QTDSAC').AsFloat:=ArrQtds[z];
    IBQAuxmapa.ParamByName('VALSAC').AsFloat:=ArrVals[z];
    IBQAuxmapa.ParamByName('QTDREAL').AsFloat:=ArrQtdr[z];
    IBQAuxmapa.ParamByName('VALREAL').AsFloat:=ArrValr[z];
    IBQAuxmapa.ParamByName('QTDVEN').AsFloat:=ArrQtdv[z];
    IBQAuxmapa.ParamByName('VALVEN').AsFloat:=ArrValv[z];
    IBQAuxmapa.ParamByName('CUSTO').AsFloat:=ArrPrec[z];
    IBQAuxmapa.ParamByName('MEDIA').AsFloat:=ArrMedi[z];
    IBQAuxmapa.ParamByName('APURADO').AsFloat:=ArrQtda[z];
    IBQAuxmapa.ParamByName('NASACOL').AsFloat:=ArrQtsc[z];
    IBQAuxmapa.ExecSql;
    IBQAuxmapa.Close;
  end;
  IBQAuxmapa.Close;
  IBQAuxmapa.SQL.Clear;
  IBQAuxmapa.SQL.Add('Select * from AUXMAPA '+
                     'Order By Codart');
  IBQAuxmapa.OPen;
  IBQAuxmapa.Close;
  // Emite a relação ******************
  RvMapg.showreport;
  // Atualiza estoque ***************************************************
  if MessageDlg('Vai atualizar os estoques ???',
                mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    IBQAuxmapa.Close;
    IBQAuxmapa.SQL.Clear;
    IBQAuxmapa.SQL.Add('Select * from AUXMAPA '+
                       'Order By Codart');
    IBQAuxmapa.OPen;
    IBQAuxmapa.DisableControls;
    IBQAuxmapa.First;
    while not IBQAuxmapa.Eof do
    begin
      wcodigo:=IBQAuxmapa.fieldbyName('Codart').AsString;
      wqtda:=IBQAuxmapa.fieldbyname('Apurado').AsFloat;
      DModRosa.IBQVer_art.Close;
      DModRosa.IBQVer_art.Sql.Clear;
      DModRosa.IBQVer_art.SqL.Add('Update ARTIGO ');
      DModRosa.IBQVer_art.Sql.Add('Set ESTOQ=:ESTOQ,'+
                                  'UDATA=:UDATA '+
                                  'Where CODIGO=:CODIGO');
      DModRosa.IBQVer_art.ParamByName('CODIGO').AsString:=wcodigo;
      DModRosa.IBQVer_art.ParamByName('ESTOQ').AsFloat:=wqtda;
      DModRosa.IBQVer_art.ParamByName('UDATA').AsString:=maskedit4.text;
      DModRosa.IBQVer_art.ExecSql;
      DModRosa.IBQVer_art.Close;
      IBQAuxmapa.Next;
    end;
    IBQAuxmapa.Close;
  end;






end;

procedure TFrmRelartigos.Button3Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col060').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  x:=0;
  y:=0;
  z:=0;
  DModRosa.IBQVer_contg.Close;
  DModRosa.IBQVer_contg.SQL.Clear;
  DModRosa.IBQVer_contg.SQL.Add('Select * from CONTAGEM '+
                                'Where Datcont=:dat_cont '+
                                'and Tipo=:tip_cont '+
                                'Order by Tipo,Codigo');
  DModRosa.IBQVer_contg.ParamByName('dat_cont').AsDate:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_contg.ParamByName('tip_cont').AsString:='1';
  DModRosa.IBQVer_contg.OPen;
  if DModRosa.IBQVer_contg.RecordCount=0 then
  begin
    DModRosa.IBQVer_contg.Close;
    showmessage('Não achei a contagem dete periodo !!'+chr(13)+
                'Rebata o periodo !!');
    maskedit3.Clear;
    maskedit4.Clear;
    maskedit3.SetFocus;
    exit;
  end;
  IBTAuxmapa.EmptyTable;
  // Ajusta tamanhos dos arreys *****************
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Order by Codigo');
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount=0 then
  begin
    DModRosa.IBQLer_art.Close;
    Showmessage('Nao ha Artigos !!');
    maskedit3.SetFocus;
    exit;
  end;
  DModRosa.IBQLer_art.Last;
  x:=DModRosa.IBQLer_art.RecordCount;
  x:=x+1;
  SetLength(ArrArti, x);
  SetLength(ArrDesc, x);
  SetLength(ArrPrec, x);
  SetLength(ArrEsto, x);
  SetLength(ArrQtsc, x);
  SetLength(ArrComp, x);
  SetLength(ArrDefe, x);
  SetLength(ArrRtdv, x);
  SetLength(ArrSaiu, x);
  SetLength(ArrQtda, x);
  SetLength(ArrQtdf, x);
  SetLength(ArrValf, x);
  SetLength(ArrQtds, x);
  SetLength(ArrVals, x);
  SetLength(ArrQtdr, x);
  SetLength(ArrValr, x);
  SetLength(ArrQtdv, x);
  SetLength(ArrValv, x);
  SetLength(ArrMedi, x);
  // Alimenta os artigos ******************
  DModRosa.IBQLer_art.DisableControls;
  DModRosa.IBQLer_art.First;
  while not DModRosa.IBQLer_art.Eof do
  begin
    ArrArti[y]:=DModRosa.IBQLer_art.fieldbyName('Codigo').AsString;
    ArrDesc[y]:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
    ArrPrec[y]:=DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
    ArrEsto[y]:=0;
    ArrQtsc[y]:=0;
    ArrComp[y]:=0;
    ArrDefe[y]:=0;
    ArrRtdv[y]:=0;
    ArrSaiu[y]:=0;
    ArrQtda[y]:=0;
    ArrQtdf[y]:=0;
    ArrValf[y]:=0;
    ArrQtds[y]:=0;
    ArrVals[y]:=0;
    ArrQtdr[y]:=0;
    ArrValr[y]:=0;
    ArrQtdv[y]:=0;
    Arrvalv[y]:=0;
    ArrMedi[y]:=0;
    y:=y+1;
    DModRosa.IBQLer_art.Next;
  end;
  DModRosa.IBQLer_art.Close;
  // Inicializa os arreis *********************
  ArrArti[x-1]:='9999';
  ArrDesc[x-1]:='*** TOTAIS GERAIS ***';
  ArrEsto[x-1]:=0;
  ArrQtsc[x-1]:=0;
  ArrComp[x-1]:=0;
  ArrDefe[x-1]:=0;
  ArrRtdv[x-1]:=0;
  ArrSaiu[x-1]:=0;
  ArrQtda[x-1]:=0;
  ArrQtdf[x-1]:=0;
  ArrValf[x-1]:=0;
  ArrQtds[x-1]:=0;
  ArrVals[x-1]:=0;
  ArrQtdr[x-1]:=0;
  ArrValr[x-1]:=0;
  ArrQtdv[x-1]:=0;
  ArrValv[x-1]:=0;
  Vinicio:=0;
  Vsacoleira:=0;
  // Monta estoque inicial da contagem ************************
  DModRosa.IBQVer_contg.Close;
  DModRosa.IBQVer_contg.SQL.Clear;
  DModRosa.IBQVer_contg.SQL.Add('Select * from CONTAGEM '+
                                'Where Datcont=:dat_cont '+
                                'and Tipo=:tip_cont '+
                                'Order by Tipo,Codigo');
  DModRosa.IBQVer_contg.ParamByName('dat_cont').AsDate:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_contg.ParamByName('tip_cont').AsString:='2';
  DModRosa.IBQVer_contg.OPen;
  DModRosa.IBQVer_contg.DisableControls;
  DModRosa.IBQVer_contg.First;
  while not DModRosa.IBQVer_contg.Eof do
  begin
    chvqtd:='';
    wcodigo:=DModRosa.IBQVer_contg.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrEsto[y]:=DModRosa.IBQVer_contg.fieldbyName('Inicial').AsFloat;
        Vinicio:=Vinicio+(DModRosa.IBQVer_contg.fieldbyName('Inicial').AsFloat*
                          DModRosa.IBQVer_contg.fieldbyName('Preco').AsFloat);
        ArrQtsc[y]:=DModRosa.IBQVer_contg.fieldbyName('Sacol').AsFloat;
        Vsacoleira:=Vsacoleira+(DModRosa.IBQVer_contg.fieldbyName('Sacol').AsFloat*
                                DModRosa.IBQVer_contg.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrEsto[x-1]:=ArrEsto[x-1]+DModRosa.IBQVer_contg.fieldbyName('Inicial').AsFloat;
      ArrQtsc[x-1]:=ArrQtsc[x-1]+DModRosa.IBQVer_contg.fieldbyName('Sacol').AsFloat;
    end;
    DModRosa.IBQVer_contg.Next;
  end;
  DModRosa.IBQVer_contg.Close;
  IBTAuxrelmerc.EmptyTable;
  // Monta as compras ******************
  xitens:=0;
  witens:='';
  DModRosa.IBQVer_comp.Close;
  DModRosa.IBQVer_comp.SQL.Clear;
  DModRosa.IBQVer_comp.SQL.Add('Select * from COMPRA '+
                               'Where Datnot>=:ini_digit '+
                               'and Datnot<=:fin_digit '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQVer_comp.ParamByName('ini_digit').AsDateTime:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_comp.ParamByName('fin_digit').AsDateTime:=StrToDate(maskedit4.text);
  DModRosa.IBQVer_comp.OPen;
  if DModRosa.IBQVer_comp.RecordCount>0 then
  begin
    DModRosa.IBQVer_comp.DisableControls;
    DModRosa.IBQVer_comp.First;
    while not DModRosa.IBQVer_comp.Eof do
    begin
      wtipped:=DModRosa.IBQVer_comp.fieldbyName('Tipped').AsString;
      wnumnot:=DModRosa.IBQVer_comp.fieldbyName('Numped').AsString;
      DModRosa.IBQVer_itcomp.Close;
      DModRosa.IBQVer_itcomp.SQL.Clear;
      DModRosa.IBQVer_itcomp.SQL.Add('Select * from ITEMCOMPRA '+
                                     'Where Tipped=:tip_digit '+
                                     'and Numped=:num_digit '+
                                     'Order By Codart');
      DModRosa.IBQVer_itcomp.ParamByName('tip_digit').AsString:=wtipped;
      DModRosa.IBQVer_itcomp.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itcomp.OPen;
      DModRosa.IBQVer_itcomp.DisableControls;
      DModRosa.IBQVer_itcomp.First;
      while not DModRosa.IBQVer_itcomp.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodigo:=DModRosa.IBQVer_itcomp.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itcomp.fieldbyName('Quant').AsFloat;
        if IBQAuxrelmerc.Active then
         IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                     'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumnot;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodigo;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=0;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itcomp.Next;
      end;
      DModRosa.IBQVer_itcomp.Close;
      DModRosa.IBQVer_comp.Next;
    end;
  end;
  DModRosa.IBQVer_comp.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrComp[y]:=ArrComp[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrComp[x-1]:=ArrComp[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Defeitos *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  DModRosa.IBQVer_def.Close;
  DModRosa.IBQVer_def.SQL.Clear;
  DModRosa.IBQVer_def.SQL.Add('Select * from DEFEITO '+
                              'Where Datnot>=:ini_digit '+
                              'and Datnot<=:fin_digit '+
                              'Order By Datnot,Numnot');
  DModRosa.IBQVer_def.ParamByName('ini_digit').AsDateTime:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_def.ParamByName('fin_digit').AsDateTime:=StrToDate(maskedit4.text);
  DModRosa.IBQVer_def.OPen;
  if DModRosa.IBQVer_def.RecordCount>0 then
  begin
    DModRosa.IBQVer_def.DisableControls;
    DModRosa.IBQVer_def.First;
    while not DModRosa.IBQVer_def.Eof do
    begin
      wnumnot:=DModRosa.IBQVer_def.fieldbyName('Numnot').AsString;
      DModRosa.IBQVer_itdef.Close;
      DModRosa.IBQVer_itdef.SQL.Clear;
      DModRosa.IBQVer_itdef.SQL.Add('Select * from ITEMDEFEITO '+
                                    'Where Numnot=:num_digit '+
                                    'Order By Codart');
      DModRosa.IBQVer_itdef.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itdef.OPen;
      DModRosa.IBQVer_itdef.DisableControls;
      DModRosa.IBQVer_itdef.First;
      while not DModRosa.IBQVer_itdef.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodigo:=DModRosa.IBQVer_itdef.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itdef.fieldbyName('Quant').AsFloat;
        wpreco:=DModRosa.IBQVer_itdef.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                     'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumnot;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodigo;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wpreco;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itdef.Next;
      end;
      DModRosa.IBQVer_itdef.Close;
      DModRosa.IBQVer_def.Next;
    end;
  end;
  DModRosa.IBQVer_def.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrDefe[y]:=ArrDefe[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrDefe[x-1]:=ArrDefe[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Devolucoes da Cobrançã *************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  DModRosa.IBQVer_dev.Close;
  DModRosa.IBQVer_dev.SQL.Clear;
  DModRosa.IBQVer_dev.SQL.Add('Select * from DEVOLUCAO '+
                              'Where Datnot>=:ini_digit '+
                              'and Datnot<=:fin_digit '+
                              'Order By Datnot,Numnot');
  DModRosa.IBQVer_dev.ParamByName('ini_digit').AsDateTime:=StrToDate(maskedit3.text);
  DModRosa.IBQVer_dev.ParamByName('fin_digit').AsDateTime:=StrToDate(maskedit4.text);
  DModRosa.IBQVer_dev.OPen;
  if DModRosa.IBQVer_dev.RecordCount>0 then
  begin
    DModRosa.IBQVer_dev.DisableControls;
    DModRosa.IBQVer_dev.First;
    while not DModRosa.IBQVer_dev.Eof do
    begin
      wnumnot:=DModRosa.IBQVer_dev.fieldbyName('Numnot').AsString;
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
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodigo:=DModRosa.IBQVer_itdev.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itdev.fieldbyName('Quant').AsFloat;
        wpreco:=DModRosa.IBQVer_itdev.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumnot;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodigo;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wpreco;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itdev.Next;
      end;
      DModRosa.IBQVer_itdev.Close;
      DModRosa.IBQVer_dev.Next;
    end;
  end;
  DModRosa.IBQVer_dev.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Saidas ***********************************************************************
  {IBTAuxrelmerc.EmptyTable;
  xitens:=0;
  witens:='';
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Retorno>=:dati_digit '+
                              'and Retorno<=:datf_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dati_digit').AsDateTime:=StrToDate(Maskedit3.Text);
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(Maskedit4.Text);
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    // Ler Itens do pedido *********************
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_itped.SQL.Clear;
    DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
    DModRosa.IBQVer_itped.OPen;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      xitens:=xitens+1;
      witens:=IntToStr(xitens);
      while Length(witens)<5 do
            witens:='0'+witens;
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
      if IBQAuxrelmerc.Active then
         IBQAuxrelmerc.Active:=False;
      IBQAuxrelmerc.Sql.Clear;
      IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
      IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                   'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
      IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
      IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
      IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
      IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
      IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
      IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
      IBQAuxrelmerc.ExecSql;
      IBQAuxrelmerc.Close;
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrSaiu[y]:=ArrSaiu[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrSaiu[x-1]:=ArrSaiu[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close; }
  // Monta Sacoleira *******************************
  witens:='';
  xitens:=0;
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base<=:datf_digit '+
                              'and Situ=:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(maskedit4.Text);
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    // Ler Itens do pedido *********************
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_itped.SQL.Clear;
    DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
    DModRosa.IBQVer_itped.OPen;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      xitens:=xitens+1;
      witens:=IntToStr(xitens);
      while Length(witens)<5 do
            witens:='0'+witens;
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
      if IBQAuxrelmerc.Active then
         IBQAuxrelmerc.Active:=False;
      IBQAuxrelmerc.Sql.Clear;
      IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
      IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                   'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
      IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
      IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
      IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
      IBQAuxrelmerc.ParamByName('BASE').AsString:=DateToStr(Date());
      IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
      IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
      IBQAuxrelmerc.ExecSql;
      IBQAuxrelmerc.Close;
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrQtds[y]:=ArrQtds[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrVals[y]:=ArrVals[y]+(Arrprec[y]*IBQAuxrelmerc.fieldbyName('Quant').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtds[x-1]:=ArrQtds[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrVals[x-1]:=ArrVals[x-1]+(Arrprec[y]*IBQAuxrelmerc.fieldbyName('Quant').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Monta Vendido *******************************
  IBTAuxrelmerc.EmptyTable;
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:exc_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('exc_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    if (StrToDate(wemissao)>=StrToDate(maskedit3.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit4.text)) then
    begin
      // Ler Itens do pedido *********************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat-
               DModRosa.IBQVer_itped.fieldbyName('Qtdret').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=wemissao;
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrQtdv[y]:=ArrQtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrValv[y]:=ArrValv[y]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtdv[x-1]:=ArrQtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrValv[x-1]:=ArrValv[x-1]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                  IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Deduz devolução da Cobrança ************************
  for y:=0 to x-1 do
  begin
    ArrQtdv[y]:=(ArrQtdv[y]-ArrRtdv[y]);
  end;
  if chvqtd='1' then
  begin
      ArrQtdv[x-1]:=ArrQtdv[x-1]-ArrRtdv[x-1];
  end;
  // Apura saida do vendido +++++++++
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:exc_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('exc_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
    if (StrToDate(wemissao)>=StrToDate(maskedit3.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit4.text)) then
    begin
      // Ler Itens do pedido *************************************************
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'Order by Codart');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.OPen;
      DModRosa.IBQVer_itped.DisableControls;
      DModRosa.IBQVer_itped.First;
      while not DModRosa.IBQVer_itped.Eof do
      begin
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
        wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
        if IBQAuxrelmerc.Active then
           IBQAuxrelmerc.Active:=False;
        IBQAuxrelmerc.Sql.Clear;
        IBQAuxrelmerc.Sql.Add('Insert Into AUXRELMAPA ');
        IBQAuxrelmerc.Sql.Add('(ITEM,PEDIDO,CODIGO,BASE,QUANT,PRECO) '+
                      'Values(:ITEM,:PEDIDO,:CODIGO,:BASE,:QUANT,:PRECO)');
        IBQAuxrelmerc.ParamByName('ITEM').AsString:=witens;
        IBQAuxrelmerc.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxrelmerc.ParamByName('CODIGO').AsString:=wcodart;
        IBQAuxrelmerc.ParamByName('BASE').AsString:=wemissao;
        IBQAuxrelmerc.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxrelmerc.ParamByName('PRECO').AsFloat:=wprecus;
        IBQAuxrelmerc.ExecSql;
        IBQAuxrelmerc.Close;
        DModRosa.IBQVer_itped.Next;
      end;
      DModRosa.IBQVer_itped.Close;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler Auxiliar *****************************
  IBQAuxrelmerc.Close;
  IBQAuxrelmerc.SQL.Clear;
  IBQAuxrelmerc.SQL.Add('Select * from AUXRELMAPA '+
                        'Order By Pedido,Codigo,Item');
  IBQAuxrelmerc.OPen;
  IBQAuxrelmerc.DisableControls;
  IBQAuxrelmerc.First;
  while not IBQAuxrelmerc.Eof do
  begin
    chvqtd:='';
    wcodigo:=IBQAuxrelmerc.fieldbyName('Codigo').AsString;
    for y:=0 to x-1 do
    begin
      if wcodigo=ArrArti[y] then
      begin
        ArrSaiu[y]:=ArrSaiu[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrSaiu[x-1]:=ArrSaiu[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Calcula o  apurado ********************************************************
  for y:=0 to x-2 do
  begin
    ArrQtda[y]:=(ArrEsto[y]+ArrQtsc[y]+ArrComp[y])-
                (Arrdefe[y]+Arrqtds[y]+ArrQtdv[y]);
    ArrValf[y]:=ArrQtda[y]*Arrprec[y];
  end;
  ArrQtda[x-1]:=0;
  ArrValf[x-1]:=0;
  for y:=0 to x-2 do
  begin
    ArrQtda[x-1]:=ArrQtda[x-1]+ArrQtda[y];
    ArrValf[x-1]:=ArrValf[x-1]+ArrValf[y];
  end;
  // Apura Media **************************************************************
  for y:=0 to x-1 do
  begin
    if ArrSaiu[y]>0 then
       ArrMedi[y]:=(ArrQtdv[y]*100)/ArrSaiu[y];
  end;
  if ArrSaiu[x-1]>0 then
     ArrMedi[x-1]:=(ArrQtdv[x-1]*100)/ArrSaiu[x-1];
  // Apura estoque real ****************
  for y:=0 to x-1 do
  begin
    ArrQtdr[y]:=ArrQtdr[y]+(ArrQtda[y]+ArrQtds[y]);
    ArrValr[y]:=ArrValr[y]+(ArrValf[y]+ArrVals[y]);
  end;
  ArrQtdr[x-1]:=ArrQtda[x-1]+ArrQtds[x-1];
  ArrValr[x-1]:=ArrValf[x-1]+ArrVals[x-1];
  // Monta Arquivo do mapa ***************
  for z:=0 to x-1 do
  begin
    if IBQAuxmapa.Active then
       IBQAuxmapa.Active:=False;
    IBQAuxmapa.Sql.Clear;
    IBQAuxmapa.Sql.Add('Insert Into AUXMAPA ');
    IBQAuxmapa.Sql.Add('(CODART,DESCRICAO,ESTOQ,COMPRA,DEFEITO,RETDEV,SAIDA,'+
                       'QTDFIS,VALFIS,QTDSAC,VALSAC,QTDREAL,VALREAL,'+
                       'QTDVEN,VALVEN,CUSTO,MEDIA,APURADO,NASACOL) '+
                 'Values(:CODART,:DESCRICAO,:ESTOQ,:COMPRA,:DEFEITO,:RETDEV,:SAIDA,'+
                        ':QTDFIS,:VALFIS,:QTDSAC,:VALSAC,:QTDREAL,:VALREAL,'+
                        ':QTDVEN,:VALVEN,:CUSTO,:MEDIA,:APURADO,:NASACOL)');
    IBQAuxmapa.ParamByName('CODART').AsString:=ArrArti[z];
    IBQAuxmapa.ParamByName('DESCRICAO').AsString:=ArrDesc[z];
    IBQAuxmapa.ParamByName('ESTOQ').AsFloat:=ArrEsto[z];
    IBQAuxmapa.ParamByName('COMPRA').AsFloat:=ArrComp[z];
    IBQAuxmapa.ParamByName('DEFEITO').AsFloat:=ArrDefe[z];
    IBQAuxmapa.ParamByName('RETDEV').AsFloat:=ArrRtdv[z];
    IBQAuxmapa.ParamByName('SAIDA').AsFloat:=ArrSaiu[z];
    IBQAuxmapa.ParamByName('QTDFIS').AsFloat:=ArrQtdf[z];
    IBQAuxmapa.ParamByName('VALFIS').AsFloat:=ArrValf[z];
    IBQAuxmapa.ParamByName('QTDSAC').AsFloat:=ArrQtds[z];
    IBQAuxmapa.ParamByName('VALSAC').AsFloat:=ArrVals[z];
    IBQAuxmapa.ParamByName('QTDREAL').AsFloat:=ArrQtdr[z];
    IBQAuxmapa.ParamByName('VALREAL').AsFloat:=ArrValr[z];
    IBQAuxmapa.ParamByName('QTDVEN').AsFloat:=ArrQtdv[z];
    IBQAuxmapa.ParamByName('VALVEN').AsFloat:=ArrValv[z];
    IBQAuxmapa.ParamByName('CUSTO').AsFloat:=ArrPrec[z];
    IBQAuxmapa.ParamByName('MEDIA').AsFloat:=ArrMedi[z];
    IBQAuxmapa.ParamByName('APURADO').AsFloat:=ArrQtda[z];
    IBQAuxmapa.ParamByName('NASACOL').AsFloat:=ArrQtsc[z];
    IBQAuxmapa.ExecSql;
    IBQAuxmapa.Close;
  end;
  IBQAuxmapa.Close;
  IBQAuxmapa.SQL.Clear;
  IBQAuxmapa.SQL.Add('Select * from AUXMAPA '+
                     'Order By Codart');
  IBQAuxmapa.OPen;
  IBQAuxmapa.Close;
  // Emite a relação ******************
  RvMapa.Showreport;
  if MessageDlg('Vai atualizar os estoques ???',
                mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    IBQAuxmapa.Close;
    IBQAuxmapa.SQL.Clear;
    IBQAuxmapa.SQL.Add('Select * from AUXMAPA '+
                       'Order By Codart');
    IBQAuxmapa.OPen;
    IBQAuxmapa.DisableControls;
    IBQAuxmapa.First;
    while not IBQAuxmapa.Eof do
    begin
      wcodigo:=IBQAuxmapa.fieldbyName('Codart').AsString;
      wqtda:=IBQAuxmapa.fieldbyname('Apurado').AsFloat;
      DModRosa.IBQVer_art.Close;
      DModRosa.IBQVer_art.Sql.Clear;
      DModRosa.IBQVer_art.SqL.Add('Update ARTIGO ');
      DModRosa.IBQVer_art.Sql.Add('Set ESTOQ=:ESTOQ,'+
                                  'UDATA=:UDATA '+
                                  'Where CODIGO=:CODIGO');
      DModRosa.IBQVer_art.ParamByName('CODIGO').AsString:=wcodigo;
      DModRosa.IBQVer_art.ParamByName('ESTOQ').AsFloat:=wqtda;
      DModRosa.IBQVer_art.ParamByName('UDATA').AsString:=maskedit4.text;
      DModRosa.IBQVer_art.ExecSql;
      DModRosa.IBQVer_art.Close;
      IBQAuxmapa.Next;
    end;
    IBQAuxmapa.Close;
  end;
end;

procedure TFrmRelartigos.DBGrid1DblClick(Sender: TObject);
begin
  maskedit3.Text:=DateToStr(DModRosa.IBQPesq_contg.Fields.Fields[0].AsDateTime);
  DModRosa.IBQPesq_contg.Close;
  Maskedit4.SetFocus;
  exit;
end;

procedure TFrmRelartigos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action:=caFree;
end;

procedure TFrmRelartigos.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmRelartigos.FormShow(Sender: TObject);
begin
  if DModRosa.IBQPesq_contg.Active then
     DModRosa.IBQPesq_contg.Active:=False;
  DModRosa.IBQPesq_contg.Sql.Clear;
  DModRosa.IBQPesq_contg.Sql.Add('Select * from CONTAGEM '+
                              'Where Tipo=:tip_digit '+
                              'Order by Datcont');
  DModRosa.IBQPesq_contg.ParamByName('tip_digit').AsString:='1';
  DModRosa.IBQPesq_contg.Active:=True;
  maskedit3.SetFocus;
  exit;
end;

procedure TFrmRelartigos.MaskEdit3Exit(Sender: TObject);
begin
  if ActiveControl=DBGrid1 then
     exit;
end;

procedure TFrmRelartigos.RvMapaGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Datrel')=0 then
     value:=maskedit3.Text+'  A  '+maskedit4.text;
  if Comparetext(Varname,'valini')=0 then
     value:=FormatFloat('##,##0.00',Vinicio);
  if Comparetext(Varname,'valsac')=0 then
     value:=FormatFloat('##,##0.00',Vsacoleira);
  if Comparetext(Varname,'Arvcomp')=0 then
     value:=FormatFloat('##,##0.00',wtotcomp);
  if Comparetext(Varname,'Arrvtdv')=0 then
     value:=FormatFloat('##,##0.00',wtotcob);
  if Comparetext(Varname,'Qtdreal')=0 then
     value:=FormatFloat('##,##0.00',wqtdreal);
  if Comparetext(Varname,'Valreal')=0 then
     value:=FormatFloat('##,##0.00',wvalreal);
end;

procedure TFrmRelartigos.RvMapgGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Datrel')=0 then
     value:=maskedit3.text+'  A  '+maskedit4.text;
end;

procedure TFrmRelartigos.RvRetorGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Datrel')=0 then
     value:=maskedit3.text+'  A  '+maskedit4.text;
  if CompareText(Varname,'Totnot')=0 then
     value:=wnotas;
end;

end.
