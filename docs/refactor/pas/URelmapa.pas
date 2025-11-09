unit URelmapa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Data.DB,
  Vcl.Grids, Vcl.DBGrids, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable,
  frxClass, frxDBSet;

type
  TFrmRelmapa = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit6: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit7: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit5: TEdit;
    IBTExtracli: TIBTable;
    IBQExtcli: TIBQuery;
    IBTExtracliCODCLI: TIBStringField;
    IBTExtracliITEM: TIBStringField;
    IBTExtracliPEDIDO: TIBStringField;
    IBTExtracliEMISSAO: TIBStringField;
    IBTExtracliDESCRICAO: TIBStringField;
    IBTExtracliVALSAIDA: TIBBCDField;
    IBTExtracliRETORNO: TIBStringField;
    IBTExtracliVALVEND: TIBBCDField;
    IBTExtracliVALRESI: TIBBCDField;
    IBTExtracliDATPAG: TIBStringField;
    IBTExtracliSITU: TIBStringField;
    IBTExtracliVENCTO: TIBStringField;
    IBTAuxRelmerc: TIBTable;
    IBQAuxRelmerc: TIBQuery;
    IBTAuxRelmercITEM: TIBStringField;
    IBTAuxRelmercPEDIDO: TIBStringField;
    IBTAuxRelmercCODIGO: TIBStringField;
    IBTAuxRelmercBASE: TIBStringField;
    IBTAuxRelmercQUANT: TIntegerField;
    IBTAuxRelmercPRECO: TIBBCDField;
    IBQAuxRelmercITEM: TIBStringField;
    IBQAuxRelmercPEDIDO: TIBStringField;
    IBQAuxRelmercCODIGO: TIBStringField;
    IBQAuxRelmercBASE: TIBStringField;
    IBQAuxRelmercQUANT: TIntegerField;
    IBQAuxRelmercPRECO: TIBBCDField;
    IBTAuxmapa: TIBTable;
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
    IBQAuxmapag: TIBQuery;
    IBQAuxmapagITEM: TIBStringField;
    IBQAuxmapagPEDIDO: TIBStringField;
    IBQAuxmapagCODVEN: TIBStringField;
    IBQAuxmapagCODCLI: TIBStringField;
    IBQAuxmapagNOMCLI: TIBStringField;
    IBQAuxmapagENDCLI: TIBStringField;
    IBQAuxmapagBAICLI: TIBStringField;
    IBQAuxmapagCIDCLI: TIBStringField;
    IBQAuxmapagESTCLI: TIBStringField;
    IBQAuxmapagBASE: TIBStringField;
    IBQAuxmapagRECOL: TIBStringField;
    IBQAuxmapagCOBRAN: TIBStringField;
    IBQAuxmapagTOTPED: TIBStringField;
    IBQAuxmapagSITU: TIBStringField;
    IBQAuxmapagDATPED: TIBStringField;
    IBQAuxmapagSOLICIT: TIBStringField;
    IBQAuxmapagRETORNO: TIBStringField;
    IBQAuxmapagTOTVEN: TIBStringField;
    IBQAuxmapagDATPAG: TIBStringField;
    IBQAuxmapagVALPAG: TIBStringField;
    IBQAuxmapagRESIDUO: TIBStringField;
    IBQAuxmaped: TIBQuery;
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
    IBTAuxmaped: TIBTable;
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
    IBTAuxmapag: TIBTable;
    IBTAuxmapagITEM: TIBStringField;
    IBTAuxmapagPEDIDO: TIBStringField;
    IBTAuxmapagCODVEN: TIBStringField;
    IBTAuxmapagCODCLI: TIBStringField;
    IBTAuxmapagNOMCLI: TIBStringField;
    IBTAuxmapagENDCLI: TIBStringField;
    IBTAuxmapagBAICLI: TIBStringField;
    IBTAuxmapagCIDCLI: TIBStringField;
    IBTAuxmapagESTCLI: TIBStringField;
    IBTAuxmapagBASE: TIBStringField;
    IBTAuxmapagRECOL: TIBStringField;
    IBTAuxmapagCOBRAN: TIBStringField;
    IBTAuxmapagTOTPED: TIBStringField;
    IBTAuxmapagSITU: TIBStringField;
    IBTAuxmapagDATPED: TIBStringField;
    IBTAuxmapagSOLICIT: TIBStringField;
    IBTAuxmapagRETORNO: TIBStringField;
    IBTAuxmapagTOTVEN: TIBStringField;
    IBTAuxmapagDATPAG: TIBStringField;
    IBTAuxmapagVALPAG: TIBStringField;
    IBTAuxmapagRESIDUO: TIBStringField;
    IBQAuxmapa: TIBQuery;
    RvVendas: TfrxReport;
    RvMapag: TfrxReport;
    RvVendsac: TfrxReport;
    RvMerc: TfrxReport;
    RvExtracli: TfrxReport;
    DsVendas: TfrxDBDataset;
    DsMapag: TfrxDBDataset;
    DsMerc: TfrxDBDataset;
    DsExtracli: TfrxDBDataset;
    DSVendsac: TfrxDBDataset;
    IBQuery1: TIBQuery;
    IBQAuxmapaCODART: TIBStringField;
    IBQAuxmapaDESCRICAO: TIBStringField;
    IBQAuxmapaESTOQ: TIntegerField;
    IBQAuxmapaCOMPRA: TIntegerField;
    IBQAuxmapaDEFEITO: TIntegerField;
    IBQAuxmapaRETDEV: TIntegerField;
    IBQAuxmapaSAIDA: TIntegerField;
    IBQAuxmapaQTDFIS: TIntegerField;
    IBQAuxmapaVALFIS: TIntegerField;
    IBQAuxmapaQTDSAC: TIntegerField;
    IBQAuxmapaVALSAC: TIBBCDField;
    IBQAuxmapaQTDREAL: TIntegerField;
    IBQAuxmapaVALREAL: TIBBCDField;
    IBQAuxmapaQTDVEN: TIntegerField;
    IBQAuxmapaVALVEN: TIBBCDField;
    IBQAuxmapaCUSTO: TIBBCDField;
    IBQAuxmapaMEDIA: TIntegerField;
    IBQAuxmapaAPURADO: TIntegerField;
    IBQAuxmapaNASACOL: TIntegerField;
    Button8: TButton;
    RvProdut: TfrxReport;
    IBQAuxprod: TIBQuery;
    IBTAuxprod: TIBTable;
    IBTAuxprodPEDIDO: TIBStringField;
    IBTAuxprodCODVEN: TIBStringField;
    IBTAuxprodCODCLI: TIBStringField;
    IBTAuxprodNOMCLI: TIBStringField;
    IBTAuxprodENDCLI: TIBStringField;
    IBTAuxprodBAICLI: TIBStringField;
    IBTAuxprodCIDCLI: TIBStringField;
    IBTAuxprodESTCLI: TIBStringField;
    IBTAuxprodBASE: TDateField;
    IBTAuxprodRECOL: TDateField;
    IBTAuxprodCOBRAN: TDateField;
    IBTAuxprodTOTPED: TIBBCDField;
    IBTAuxprodSITU: TIBStringField;
    IBTAuxprodDATPED: TIBStringField;
    IBTAuxprodSOLICIT: TIBStringField;
    IBTAuxprodRETORNO: TIBStringField;
    IBTAuxprodTOTVEN: TIBBCDField;
    IBTAuxprodDATPAG: TIBStringField;
    IBTAuxprodVALPAG: TIBBCDField;
    IBTAuxprodRESIDUO: TIBBCDField;
    IBTAuxprodCOB: TIBStringField;
    IBTAuxprodLIMITE: TIBStringField;
    IBQAuxprodPEDIDO: TIBStringField;
    IBQAuxprodCODVEN: TIBStringField;
    IBQAuxprodCODCLI: TIBStringField;
    IBQAuxprodNOMCLI: TIBStringField;
    IBQAuxprodENDCLI: TIBStringField;
    IBQAuxprodBAICLI: TIBStringField;
    IBQAuxprodCIDCLI: TIBStringField;
    IBQAuxprodESTCLI: TIBStringField;
    IBQAuxprodBASE: TDateField;
    IBQAuxprodRECOL: TDateField;
    IBQAuxprodCOBRAN: TDateField;
    IBQAuxprodTOTPED: TIBBCDField;
    IBQAuxprodSITU: TIBStringField;
    IBQAuxprodDATPED: TIBStringField;
    IBQAuxprodSOLICIT: TIBStringField;
    IBQAuxprodRETORNO: TIBStringField;
    IBQAuxprodTOTVEN: TIBBCDField;
    IBQAuxprodDATPAG: TIBStringField;
    IBQAuxprodVALPAG: TIBBCDField;
    IBQAuxprodRESIDUO: TIBBCDField;
    IBQAuxprodCOB: TIBStringField;
    IBQAuxprodLIMITE: TIBStringField;
    IBTAuxprodQUANT: TIntegerField;
    IBQAuxprodQUANT: TIntegerField;
    frxDBDataset1: TfrxDBDataset;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure RvMercGetValue(const VarName: string; var Value: Variant);
    procedure Button2Click(Sender: TObject);
    procedure RvMapagGetValue(const VarName: string; var Value: Variant);
    procedure Button3Click(Sender: TObject);
    procedure RvMapaGetValue(const VarName: string; var Value: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RvVendasGetValue(const VarName: string; var Value: Variant);
    procedure RvVendsacGetValue(const VarName: string; var Value: Variant);
    procedure RvExtracliGetValue(const VarName: string; var Value: Variant);
    procedure Edit4Exit(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RvProdutGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure Grav_saldant;
     function ExisteForm(pForm: TForm): Boolean;
  end;

var
  FrmRelmapa: TFrmRelmapa;
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
  gdocm,gprod,xitens,wpedidos,wtotsaiu,wtnot: Integer;
  wtotven,wtotres,wtotpag,wvalped,wvalcomp,wtotcomp,wvalcob,wtotcob,wnotas: Extended;
  chvimp,wdatven,wchapa,wempresa,wtipped,wdatreto,wprimeiro,wultimo: string;
  wvalsai,wvalres,wprazo,wsaldo,wsaldant,Vinicio,Vsacoleira,wqtdreal,wvalreal: Extended;
  wnumpar,wtippag,wnumpag,worigem,wobser,chave,wprodut: string;
  wendereco,wcidade,westado,wrota,wcontato,wdatimp,wlimite: string;
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

procedure TFrmRelmapa.Button4Click(Sender: TObject);
begin
  wopcao:='1';
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col064').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  x:=0;
  y:=0;
  z:=0;
  chvest:='';
  IBTAuxmapa.EmptyTable;
  IBTAuxRelmerc.EmptyTable;
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
    maskedit1.SetFocus;
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
  xitens:=0;
  witens:='';
  wtotsaiu:=0;
  wprimeiro:='';
  wultimo:='';
  wvalcomp:=0;
  wvalcob:=0;
  wtotcomp:=0;
  wtotcob:=0;
  wqtdreal:=0;
  wvalreal:=0;
  IBTAuxrelmerc.EmptyTable;
  // Monta saida de mercadoria *******************************
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>=:dati_digit '+
                              'and Base<=:datf_digit '+
                              'and Codven=:ven_digit '+
                              'and Situ<>:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dati_digit').AsDateTime:=StrToDate(maskedit1.text);
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(maskedit2.text);
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wtotsaiu:=wtotsaiu+1;
    if wprimeiro='' then
       wprimeiro:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wultimo:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
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
        ArrQtdf[y]:=ArrQtdf[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrValf[y]:=ArrValf[y]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtdf[x-1]:=ArrQtdf[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrValf[x-1]:=ArrValf[x-1]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                   IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura o Retorno *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Codven=:ven_digit '+
                              'and Situ=:ret_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
  DModRosa.IBQLer_ped.ParamByName('ret_digit').AsString:='R';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    if (StrToDate(wemissao)>=StrToDate(maskedit1.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit2.text)) then
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
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura Devolucao *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Codven=:ven_digit '+
                              'and Situ=:ret_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
  DModRosa.IBQLer_ped.ParamByName('ret_digit').AsString:='D';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    if (StrToDate(wemissao)>=StrToDate(maskedit1.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit2.text)) then
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
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura na sacoleira *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:datl_digit '+
                              'and Codven=:ven_digit '+
                              'and Situ=:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('datl_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    if (StrToDate(wemissao)>=StrToDate(maskedit1.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit2.text)) then
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
        ArrQtds[y]:=ArrQtds[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrVals[y]:=ArrVals[y]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtds[x-1]:=ArrQtds[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrVals[x-1]:=ArrVals[x-1]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                   IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura o Vendido *********************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Codven=:ven_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:exc_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('exc_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateTostr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    if (StrToDate(wemissao)>=StrToDate(maskedit1.text)) and
       (StrToDate(wemissao)<=StrToDate(maskedit2.text)) then
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
  // Apura Media ****************************
  for y:=0 to x-1 do
  begin
    if ArrQtdv[y]>0 then
       ArrMedi[y]:=(ArrQtdv[y]*100)/ArrQtdf[y];
  end;
  if ArrQtdv[x-1]>0 then
     ArrMedi[x-1]:=(ArrQtdv[x-1]*100)/ArrQtdf[x-1];
  // Monta Arquivo do mapa ***************
  IBQAuxmapa.Close;
  // Monta Arquivo do mapa ***************
  for z:=0 to x-1 do
  begin
    if ArrQtdf[z]>0 then
    begin
      if IBQAuxmapa.Active then
         IBQAuxmapa.Active:=False;
      IBQAuxmapa.Sql.Clear;
      IBQAuxmapa.Sql.Add('Insert Into AUXMAPA ');
      IBQAuxmapa.Sql.Add('(CODART,DESCRICAO,ESTOQ,COMPRA,DEFEITO,RETDEV,SAIDA,'+
                         'QTDFIS,VALFIS,QTDSAC,VALSAC,QTDREAL,VALREAL,'+
                         'QTDVEN,VALVEN,CUSTO,MEDIA,APURADO) '+
                   'Values(:CODART,:DESCRICAO,:ESTOQ,:COMPRA,:DEFEITO,:RETDEV,:SAIDA,'+
                          ':QTDFIS,:VALFIS,:QTDSAC,:VALSAC,:QTDREAL,:VALREAL,'+
                          ':QTDVEN,:VALVEN,:CUSTO,:MEDIA,:APURADO)');
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
      IBQAuxmapa.ExecSql;
      IBQAuxmapa.Close;
    end;
  end;
  IBQAuxmapa.Close;
  IBQAuxmapa.SQL.Clear;
  IBQAuxmapa.SQL.Add('Select * from AUXMAPA '+
                     'Order By Codart');
  IBQAuxmapa.OPen;
  IBQAuxmapa.Close;
  // Emite a relação ******************
  RvMerc.Showreport;
end;

procedure TFrmRelmapa.Button5Click(Sender: TObject);
begin
  wopcao:='3';
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col063').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  IBTAuxmapag.EmptyTable;
  wvend:=edit3.text;
  wpedidos:=0;
  wtotven:=0;
  wtotres:=0;
  wtotpag:=0;
  DModRosa.IBQLer_ven.Close;
  DModRosa.IBQLer_ven.SQL.Clear;
  DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Where Codven=:ven_digit');
  DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQLer_ven.OPen;
  if DModRosa.IBQLer_ven.RecordCount>0 then
  begin
    wnomvend:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
    wpra1:=DModRosa.IBQLer_ven.fieldbyName('Praca1').AsString;
    wpra2:=DModRosa.IBQLer_ven.fieldbyName('Praca2').AsString;
    wpra3:=DModRosa.IBQLer_ven.fieldbyName('Praca3').AsString;
    wpra4:=DModRosa.IBQLer_ven.fieldbyName('Praca4').AsString;
    while Length(wpra1)<3 do
          wpra1:='0'+wpra1;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra1;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra1:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra2)<3 do
          wpra2:='0'+wpra2;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra2;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra2:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra3)<3 do
          wpra3:='0'+wpra3;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra3;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra3:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra4)<3 do
          wpra4:='0'+wpra4;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra4;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra4:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
  xitens:=0;
  DModRosa.IBQLer_ven.Close;
  wdatini:=Maskedit1.text;
  wdatfin:=Maskedit2.text;
  if DModRosa.IBQLer_per.Active then
     DModRosa.IBQLer_per.Active:=False;
  DModRosa.IBQLer_per.Sql.Clear;
  DModRosa.IBQLer_per.Sql.Add('Select * from PEDIDO '+
                              'Where Codven=:ven_digit '+
                              'and Cob=:cob_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_per.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQLer_per.ParamByName('cob_digit').AsString:='P';
  DModRosa.IBQLer_per.Active:=True;
  DModRosa.IBQLer_per.DisableControls;
  DModRosa.IBQLer_per.First;
  while not DModRosa.IBQLer_per.Eof do
  begin
    wdatbase:=DateToStr(DModRosa.IBQLer_per.fieldbyName('Base').AsdateTime);
    if wdatbase>'  /  /    ' then
    begin
      if (StrToDate(wdatbase)>=StrToDate(wdatini)) and
         (StrToDate(wdatbase)<=StrToDate(wdatfin)) then
      begin
        wpedidos:=wpedidos+1;
        wnumero:=DModRosa.IBQLer_per.fieldbyName('Pedido').AsString;
        wnumcli:=DModRosa.IBQLer_per.fieldbyName('Codcli').AsString;
        wnomcli:=DModRosa.IBQLer_per.fieldbyName('Nomcli').AsString ;
        wemissao:=DateToStr(DModRosa.IBQLer_per.fieldbyName('Base').AsDateTime);
        wdevoluc:=DateToStr(DModRosa.IBQLer_per.fieldbyName('Recol').AsDateTime);
        wdatpag:=DModRosa.IBQLer_per.fieldbyName('Datpag').AsString;
        wvencmto:=DateToStr(DModRosa.IBQLer_per.fieldbyName('Cobran').AsDateTime);
        wvalpag:=DModRosa.IBQLer_per.fieldbyName('Valpag').AsFloat;
        wvalven:=DModRosa.IBQLer_per.fieldbyName('Totven').AsFloat;
        wresido:=DModRosa.IBQLer_per.fieldbyName('Residuo').AsFloat;
        wsitu:=DModRosa.IBQLer_per.fieldbyName('Situ').AsString;
        wantes:=DModRosa.IBQLer_per.fieldbyName('Oldped').AsString;
        wdatpag:=DModRosa.IBQLer_per.fieldbyName('Datpag').AsString;
        // Ler Cliente *************************
        DModRosa.IBQVer_cli.Close;
        DModRosa.IBQVer_cli.SQL.Clear;
        DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                    'Where Idcli=:cli_digit');
        DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
        DModRosa.IBQVer_cli.OPen;
        if DModRosa.IBQVer_cli.RecordCount>0 then
        begin
          wtelefone:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString ;
          wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString ;
          wpraca:=DModRosa.IBQVer_cli.fieldbyName('Praca').AsString ;
        end;
        DModRosa.IBQVer_cli.Close;
        if (wpraca>=xpraca) and (wpraca<=zpraca) then
        begin
          wtotven:=wtotven+wvalven;
          wtotres:=wtotres+wresido;
          wtotpag:=wtotpag+wvalpag;
          // Grava Pedido ***********************************
          xitens:=xitens+1;
          witens:=IntToStr(xitens);
          while Length(witens)<6 do
                witens:='0'+witens;
          if IBQAuxmapag.Active then
             IBQAuxmapag.Active:=False;
          IBQAuxmapag.Sql.Clear;
          IBQAuxmapag.Sql.Add('Insert Into RELPEDIDO ');
          IBQAuxmapag.Sql.Add('(ITEM,PEDIDO,CODVEN,CODCLI,NOMCLI,ENDCLI,BAICLI,CIDCLI,ESTCLI,'+
                              'BASE,RECOL,COBRAN,TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                              'VALPAG,RESIDUO) '+
                      'Values(:ITEM,:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:ENDCLI,:BAICLI,:CIDCLI,'+
                             ':ESTCLI,:BASE,:RECOL,:COBRAN,:TOTPED,:SITU,:DATPED,:RETORNO,'+
                             ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO)');
          IBQAuxmapag.ParamByName('ITEM').AsString:=witens;
          IBQAuxmapag.ParamByName('PEDIDO').AsString:=wnumero;
          IBQAuxmapag.ParamByName('CODVEN').AsString:=wvend;
          IBQAuxmapag.ParamByName('CODCLI').AsString:=wnumcli;
          IBQAuxmapag.ParamByName('NOMCLI').AsString:=wnomcli;
          IBQAuxmapag.ParamByName('ENDCLI').AsString:=wbairro;
          IBQAuxmapag.ParamByName('BAICLI').AsString:=copy(wtelefone,1,20);
          IBQAuxmapag.ParamByName('CIDCLI').AsString:='';
          IBQAuxmapag.ParamByName('ESTCLI').AsString:='';
          IBQAuxmapag.ParamByName('BASE').AsString:=wemissao;
          IBQAuxmapag.ParamByName('RECOL').AsString:=wdevoluc;
          IBQAuxmapag.ParamByName('COBRAN').AsString:=wvencmto;
          IBQAuxmapag.ParamByName('TOTPED').AsString:=' ';
          IBQAuxmapag.ParamByName('SITU').AsString:=wsitu;
          IBQAuxmapag.ParamByName('DATPED').AsString:=wantes;
          IBQAuxmapag.ParamByName('RETORNO').AsString:='';
          IBQAuxmapag.ParamByName('TOTVEN').AsString:=FormatFloat('##,##0.00',wvalven);
          IBQAuxmapag.ParamByName('DATPAG').AsString:=wdatpag;
          IBQAuxmapag.ParamByName('VALPAG').AsString:=FormatFloat('##,##0.00',wvalpag);
          IBQAuxmapag.ParamByName('RESIDUO').AsString:=FormatFloat('##,##0.00',wresido);
          IBQAuxmapag.ExecSql;
          IBQAuxmapag.Close;
        end;
      end;
    end;
    DModRosa.IBQLer_per.Next;
  end;
  DModRosa.IBQLer_per.Close;
  IBQAuxmapag.Close;
  IBQAuxmapag.SQL.Clear;
  IBQAuxmapag.SQL.Add('Select * from RELPEDIDO '+
                      'Order By Item,Pedido');
  IBQAuxmapag.OPen;
  IBQAuxmapag.Close;
  // Emite a relação ******************
  RvMapag.Showreport;
end;

procedure TFrmRelmapa.Button6Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col065').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  xitens:=0;
  witens:='';
  wsaldo:=0;
  wsaldant:=0;
  wdatini:='';
  while wdatini='' do
  begin
    wdatini:=InputBox('Informe a data inicial da apuração !!!!',
                      'Data DD/MM/AAA:',' ');
  end;
  IBTExtracli.EmptyTable;
  if DModRosa.IBQVer_ped.Active then
     DModRosa.IBQVer_ped.Active:=False;
  DModRosa.IBQVer_ped.Sql.Clear;
  DModRosa.IBQVer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Codcli=:marc_digit '+
                              'and Situ<>:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQVer_ped.ParamByName('marc_digit').AsString:=edit4.Text;
  DModRosa.IBQVer_ped.ParamByName('sit_digit').AsString:='X';
  DModRosa.IBQVer_ped.Active:=True;
  DModRosa.IBQVer_ped.DisableControls;
  DModRosa.IBQVer_ped.First;
  while not DModRosa.IBQVer_ped.Eof do
  begin
    wemissao:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Base').AsDateTime);
    wdatcob:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Cobran').AsDateTime);
    wpedido:=DModRosa.IBQVer_ped.fieldbyName('Pedido').AsString;
    wvalsai:=DModRosa.IBQVer_ped.fieldbyName('Totped').AsFloat;
    wvalven:=DModRosa.IBQVer_ped.fieldbyName('Totven').AsFloat;
    wvalres:=DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat;
    wdretor:=DModRosa.IBQVer_ped.fieldbyName('Retorno').AsString;
    wdatpag:=DModRosa.IBQVer_ped.fieldbyName('Datpag').AsString;
    wdatcob:=DModRosa.IBQVer_ped.fieldbyName('Cobran').AsString;
    wsitu:=DModRosa.IBQVer_ped.fieldByName('Situ').AsString;
    wpreco:=0;
    if DModRosa.IBQVer_ped.fieldByName('Situ').AsString='E' then
       wpreco:=DModRosa.IBQVer_ped.fieldbyName('Totped').AsFloat
    else
       wpreco:=DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat;
    if StrToDate(wdatcob)<StrTodate(wdatini) then
       wsaldant:=wsaldant+wpreco
    else
    begin
      if wsaldant>0 then
         Grav_saldant;
      wsaldo:=wsaldo+wpreco;
      wempresa:='VENDA A CLIENTE';
      xitens:=xitens+1;
      witens:=IntToStr(xitens);
      while Length(witens)<5 do
            witens:='0'+witens;
      if IBQExtcli.Active  then
         IBQExtcli.Active:=False;
      IBQExtcli.Sql.Clear;
      IBQExtcli.Sql.Add('Insert Into EXTRATO ');
      IBQExtcli.Sql.Add('(CODCLI,ITEM,PEDIDO,EMISSAO,DESCRICAO,VALSAIDA,RETORNO,'+
                        'VALVEND,VALRESI,DATPAG,SITU,VENCTO) '+
                'Values(:CODCLI,:ITEM,:PEDIDO,:EMISSAO,:DESCRICAO,:VALSAIDA,:RETORNO,'+
                       ':VALVEND,:VALRESI,:DATPAG,:SITU,:VENCTO)');
      IBQExtcli.ParamByName('CODCLI').AsString:=edit4.text;
      IBQExtcli.ParamByName('ITEM').AsString:=witens;
      IBQExtcli.ParamByName('PEDIDO').AsString:=wpedido;
      IBQExtcli.ParamByName('EMISSAO').AsString:=wemissao;
      IBQExtcli.ParamByName('DESCRICAO').AsString:=wempresa;
      IBQExtcli.ParamByName('VALSAIDA').AsFloat:=wvalsai;
      IBQExtcli.ParamByName('RETORNO').AsString:=wdretor;
      IBQExtcli.ParamByName('VALVEND').AsFloat:=wvalven;
      IBQExtcli.ParamByName('VALRESI').AsFloat:=wvalres;
      IBQExtcli.ParamByName('DATPAG').AsString:='';
      IBQExtcli.ParamByName('SITU').AsString:=wsitu;
      IBQExtcli.ParamByName('VENCTO').AsString:=wdatcob;
      IBQExtcli.ExecSql;
      IBQExtcli.Close;
      // Monta residos pagos **********************************************
      if DModRosa.IBQVer_resi.Active then
         DModRosa.IBQVer_resi.Active:=False;
      DModRosa.IBQVer_resi.Sql.Clear;
      DModRosa.IBQVer_resi.Sql.Add('Select * from RESIDOS '+
                                   'Where Numdoc=:num_digit '+
                                   'Order by Datmov,Item');
      DModRosa.IBQVer_resi.ParamByName('num_digit').AsString:=wpedido;
      DModRosa.IBQVer_resi.Active:=True;
      DModRosa.IBQVer_resi.DisableControls;
      DModRosa.IBQVer_resi.First;
      while not DModRosa.IBQVer_resi.Eof do
      begin
        wdatpag:=DateToStr(DModRosa.IBQVer_resi.fieldbyName('Datmov').AsDateTime);
        wvalpag:=DModRosa.IBQVer_resi.fieldbyName('Valpag').AsFloat;
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
              witens:='0'+witens;
        if IBQExtcli.Active  then
           IBQExtcli.Active:=False;
        IBQExtcli.Sql.Clear;
        IBQExtcli.Sql.Add('Insert Into EXTRATO ');
        IBQExtcli.Sql.Add('(CODCLI,ITEM,PEDIDO,EMISSAO,DESCRICAO,VALSAIDA,RETORNO,'+
                          'VALVEND,VALRESI,DATPAG,SITU,VENCTO) '+
                  'Values(:CODCLI,:ITEM,:PEDIDO,:EMISSAO,:DESCRICAO,:VALSAIDA,:RETORNO,'+
                         ':VALVEND,:VALRESI,:DATPAG,:SITU,:VENCTO)');
        IBQExtcli.ParamByName('CODCLI').AsString:=edit4.text;
        IBQExtcli.ParamByName('ITEM').AsString:=witens;
        IBQExtcli.ParamByName('PEDIDO').AsString:='';
        IBQExtcli.ParamByName('EMISSAO').AsString:='';
        IBQExtcli.ParamByName('DESCRICAO').AsString:='PAGAMENTO';
        IBQExtcli.ParamByName('VALSAIDA').AsFloat:=0;
        IBQExtcli.ParamByName('RETORNO').AsString:='';
        IBQExtcli.ParamByName('VALVEND').AsFloat:=0;
        IBQExtcli.ParamByName('VALRESI').AsFloat:=wvalpag;
        IBQExtcli.ParamByName('DATPAG').AsString:=wdatpag;
        IBQExtcli.ParamByName('SITU').AsString:='';
        IBQExtcli.ParamByName('VENCTO').AsString:='';
        IBQExtcli.ExecSql;
        IBQExtcli.Close;
        DModRosa.IBQVer_resi.Next;
      end;
      DModRosa.IBQVer_resi.Close;
    end;
    DModRosa.IBQVer_ped.Next;
  end;
  DModRosa.IBQVer_ped.Close;
  if wsaldant>0 then
     Grav_saldant;
  // Imprime Extrato  **********************************
  if IBQExtcli.Active then
     IBQExtcli.Active:=False;
  IBQExtcli.Sql.Clear;
  IBQExtcli.Sql.Add('Select * from EXTRATO '+
                     'Order by Pedido');
  IBQExtCli.Active:=True;
  IBQExtcli.Active:=False;
  RvExtracli.showreport;
end;

procedure TFrmRelmapa.Button7Click(Sender: TObject);
begin
  wopcao:='2';
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col066').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  x:=0;
  y:=0;
  z:=0;
  chvest:='';
  wdatini:='';
  while wdatini='' do
  begin
    wdatini:=InputBox('Informe a data inicial da apuração !!!!',
                      'Data DD/MM/AAA:',' ');
  end;
  wdatfin:='';
  while wdatfin='' do
  begin
    wdatfin:=InputBox('Informe a data final da apuração !!!!',
                      'Data DD/MM/AAA:',' ');
  end;
  wlimite:='';
  while wlimite='' do
  begin
    wlimite:=InputBox('Informe o percentual limite !!!!',
                      '% Limite (XX,00):',' ');
  end;
  IBTAuxmapa.EmptyTable;
  IBTAuxRelmerc.EmptyTable;
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
    edit4.SetFocus;
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
  xitens:=0;
  witens:='';
  wtotsaiu:=0;
  wprimeiro:='';
  wultimo:='';
  IBTAuxrelmerc.EmptyTable;
  // Monta saida de mercadoria *******************************
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>=:dati_digit '+
                              'and Base<=:datf_digit '+
                              'and Codcli=:ven_digit '+
                              'and Situ<>:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dati_digit').AsDateTime:=StrToDate(wdatini);
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(wdatfin);
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wtotsaiu:=wtotsaiu+1;
    if wprimeiro='' then
       wprimeiro:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wultimo:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
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
        ArrQtdf[y]:=ArrQtdf[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrValf[y]:=ArrValf[y]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtdf[x-1]:=ArrQtdf[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrValf[x-1]:=ArrValf[x-1]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                   IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura o Retorno *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Codcli=:ven_digit '+
                              'and Situ=:ret_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_ped.ParamByName('ret_digit').AsString:='R';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Retorno').AsDateTime);
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
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura Devolucao *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Codcli=:ven_digit '+
                              'and Situ=:ret_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_ped.ParamByName('ret_digit').AsString:='D';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Retorno').AsDateTime);
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
        ArrRtdv[y]:=ArrRtdv[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
       ArrRtdv[x-1]:=ArrRtdv[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura na sacoleira *******************************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:datl_digit '+
                              'and Codcli=:ven_digit '+
                              'and Situ=:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('datl_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
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
        ArrQtds[y]:=ArrQtds[y]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
        ArrVals[y]:=ArrVals[y]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
        chvqtd:='1';
        Break;
      end;
    end;
    if chvqtd='1' then
    begin
      ArrQtds[x-1]:=ArrQtds[x-1]+IBQAuxrelmerc.fieldbyName('Quant').AsFloat;
      ArrVals[x-1]:=ArrVals[x-1]+(IBQAuxrelmerc.fieldbyName('Quant').AsFloat*
                                   IBQAuxrelmerc.fieldbyName('Preco').AsFloat);
    end;
    IBQAuxrelmerc.Next;
  end;
  IBQAuxrelmerc.Close;
  // Apura o Vendido *********************
  xitens:=0;
  witens:='';
  IBTAuxrelmerc.EmptyTable;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base>:dat_digit '+
                              'and Codcli=:ven_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:exc_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate('31/12/2011');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('exc_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wemissao:=DateTostr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
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
  // Apura Media ****************************
  for y:=0 to x-1 do
  begin
    if ArrQtdv[y]>0 then
       ArrMedi[y]:=(ArrQtdv[y]*100)/ArrQtdf[y];
  end;
  if ArrQtdv[x-1]>0 then
      ArrMedi[x-1]:=(ArrQtdv[x-1]*100)/ArrQtdf[x-1];
  IBQAuxmapa.Close;
  // Monta Arquivo do mapa ***************
  for z:=0 to x-1 do
  begin
    if (ArrQtdf[z]>0) and
       (ArrMedi[z]>StrToFloat(wlimite)) then
    begin
      if IBQAuxmapa.Active then
         IBQAuxmapa.Active:=False;
      IBQAuxmapa.Sql.Clear;
      IBQAuxmapa.Sql.Add('Insert Into AUXMAPA ');
      IBQAuxmapa.Sql.Add('(CODART,DESCRICAO,ESTOQ,COMPRA,DEFEITO,RETDEV,SAIDA,'+
                         'QTDFIS,VALFIS,QTDSAC,VALSAC,QTDREAL,VALREAL,'+
                         'QTDVEN,VALVEN,CUSTO,MEDIA,APURADO) '+
                   'Values(:CODART,:DESCRICAO,:ESTOQ,:COMPRA,:DEFEITO,:RETDEV,:SAIDA,'+
                          ':QTDFIS,:VALFIS,:QTDSAC,:VALSAC,:QTDREAL,:VALREAL,'+
                          ':QTDVEN,:VALVEN,:CUSTO,:MEDIA,:APURADO)');
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
      IBQAuxmapa.ExecSql;
      IBQAuxmapa.Close;
    end;
  end;
  IBQAuxmapa.Close;
  IBQAuxmapa.SQL.Clear;
  IBQAuxmapa.SQL.Add('Select * from AUXMAPA '+
                     'Order By Codart');
  IBQAuxmapa.OPen;
  IBQAuxmapa.Close;
  // Emite a relação ******************
  RvMerc.showreport;

end;

procedure TFrmRelmapa.Button8Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col060').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  IBTAuxprod.EmptyTable;
  wopcao:='';
  wprodut:='';
  wtnot:=0;
  while wopcao='' do
  begin
    wopcao:=InputBox('Informe: E,X ou R !!!!',
                     'Opção do relatorio:',' ');
    wopcao:=UPPERCASE(wopcao);
  end;
  if wopcao='R' then
  begin
    wdescop:='COM RETORNO';
    if DModRosa.IBQLer_ped.Active then
       DModRosa.IBQLer_ped.Active:=False;
    DModRosa.IBQLer_ped.Sql.Clear;
    DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                                'Where Codven=:ven_digit '+
                                'and Situ<>:sit_digit '+
                                'and Situ<>:ext_digit '+
                                'Order by Pedido');
    DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
    DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
    DModRosa.IBQLer_ped.ParamByName('ext_digit').AsString:='X';
    DModRosa.IBQLer_ped.Active:=True;
  end;
  if wopcao='X' then
  begin
    wdescop:='CANCELADO';
    if DModRosa.IBQLer_ped.Active then
       DModRosa.IBQLer_ped.Active:=False;
    DModRosa.IBQLer_ped.Sql.Clear;
    DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                                'Where Codven=:ven_digit '+
                                'and Situ=:sit_digit '+
                                'Order by Pedido');
    DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
    DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='X';
    DModRosa.IBQLer_ped.Active:=True;
  end;
  if wopcao='E' then
  begin
    wdescop:='NA SACOLEIRA';
    if DModRosa.IBQLer_ped.Active then
       DModRosa.IBQLer_ped.Active:=False;
    DModRosa.IBQLer_ped.Sql.Clear;
    DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                                'Where Base>=:dati_digit '+
                                'and Base<=:datf_digit '+
                                'and Codven=:ven_digit '+
                                'and Situ=:sit_digit '+
                                'Order by Pedido');
    DModRosa.IBQLer_ped.ParamByName('dati_digit').AsDateTime:=StrToDate(Maskedit1.Text);
    DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(Maskedit2.Text);
    DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
    DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
    DModRosa.IBQLer_ped.Active:=True;
  end;
  if DModRosa.IBQLer_ped.RecordCount=0 then
  begin
    DModRosa.IBQLer_ped.Close;
    showmessage('Não achei pedido na movimentação');
    edit3.Clear;
    edit3.SetFocus;
    exit;
  end;
  while wprodut='' do
  begin
    wprodut:=InputBox('Informe: cod. do produto !!!!',
                     'Opção do relatorio:',' ');
  end;
  // Apanha o pedido*************************************
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    chavfaz:='';
    if (wopcao='E') or (wopcao='X') then
       chavfaz:='1'
    else
    begin
      wdatret:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
      if (StrToDate(wdatret)>=StrToDate(maskedit1.text)) and
         (StrToDate(wdatret)<=StrToDate(Maskedit2.Text)) then
         chavfaz:='1';
    end;
    if chavfaz='1' then
    begin
      wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
      wnumcli:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
      wnomcli:=DModRosa.IBQLer_ped.fieldbyName('Nomcli').AsString ;
      wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
      wdevoluc:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Recol').AsDateTime);
      wdatreto:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
      wvencmto:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Cobran').AsDateTime);
      wvalpag:=DModRosa.IBQLer_ped.fieldbyName('Valpag').AsFloat;
      wvalven:=DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
      wvalped:=DModRosa.IBQLer_ped.fieldbyName('Totped').AsFloat;
      wresido:=DModRosa.IBQLer_ped.fieldbyName('Residuo').AsFloat;
      wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
      wantes:=DModRosa.IBQLer_ped.fieldbyName('Oldped').AsString;
      // Apanha a quantidade de artigo *********************************
      wqtda:=0;
      DModRosa.IBQVer_itped.Close;
      DModRosa.IBQVer_itped.SQL.Clear;
      DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                    'Where Pedido=:ped_digit '+
                                    'and Codart=:art_digit');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
      DModRosa.IBQVer_itped.ParamByName('art_digit').AsString:=wprodut;
      DModRosa.IBQVer_itped.OPen;
      if DModRosa.IBQVer_itped.RecordCount>0 then
      begin
        wtnot:=wtnot+1;
        wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      end;
      DModRosa.IBQVer_itped.Close;
      // Ler Cliente *************************
      DModRosa.IBQVer_cli.Close;
      DModRosa.IBQVer_cli.SQL.Clear;
      DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                  'Where Idcli=:cli_digit');
      DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
      DModRosa.IBQVer_cli.OPen;
      if DModRosa.IBQVer_cli.RecordCount>0 then
      begin
        wtelefone:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString ;
        wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString ;
        wpraca:=DModRosa.IBQVer_cli.fieldbyName('Praca').AsString ;
      end;
      DModRosa.IBQVer_cli.Close;
      if (wpraca>=xpraca) and (wpraca<=zpraca) then
      begin
        if IBQAuxprod.Active then
           IBQAuxprod.Active:=False;
        IBQAuxprod.Sql.Clear;
        IBQAuxprod.Sql.Add('Insert Into AUXPEDIDO ');
        IBQAuxprod.Sql.Add('(PEDIDO,CODVEN,CODCLI,NOMCLI,ENDCLI,BAICLI,CIDCLI,ESTCLI,'+
                            'BASE,RECOL,COBRAN,TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                            'VALPAG,RESIDUO,COB,LIMITE,QUANT) '+
                    'Values(:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:ENDCLI,:BAICLI,:CIDCLI,'+
                            ':ESTCLI,:BASE,:RECOL,:COBRAN,:TOTPED,:SITU,:DATPED,:RETORNO,'+
                            ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO,:COB,:LIMITE,:QUANT)');
        IBQAuxprod.ParamByName('PEDIDO').AsString:=wnumero;
        IBQAuxprod.ParamByName('CODVEN').AsString:=edit3.text;
        IBQAuxprod.ParamByName('CODCLI').AsString:=wnumcli;
        IBQAuxprod.ParamByName('NOMCLI').AsString:=Copy(wnomcli,1,25);
        IBQAuxprod.ParamByName('ENDCLI').AsString:='';
        IBQAuxprod.ParamByName('BAICLI').AsString:=wbairro;
        IBQAuxprod.ParamByName('CIDCLI').AsString:=copy(wtelefone,1,20);
        IBQAuxprod.ParamByName('ESTCLI').AsString:='';
        IBQAuxprod.ParamByName('BASE').AsDateTime:=StrToDate(wemissao);
        IBQAuxprod.ParamByName('RECOL').AsDateTime:=StrToDate(wdevoluc);
        IBQAuxprod.ParamByName('COBRAN').AsDateTime:=StrToDate(wvencmto);
        IBQAuxprod.ParamByName('TOTPED').AsFloat:=wvalped;
        IBQAuxprod.ParamByName('SITU').AsString:=wsitu;
        IBQAuxprod.ParamByName('DATPED').AsString:=wantes;
        IBQAuxprod.ParamByName('RETORNO').AsString:=wdatreto;
        IBQAuxprod.ParamByName('TOTVEN').AsFloat:=wvalven;
        IBQAuxprod.ParamByName('DATPAG').AsString:='';
        IBQAuxprod.ParamByName('VALPAG').AsFloat:=wvalpag;
        IBQAuxprod.ParamByName('RESIDUO').AsFloat:=wresido;
        IBQAuxprod.ParamByName('COB').AsString:='';
        IBQAuxprod.ParamByName('LIMITE').Asstring:=' ';
        IBQAuxprod.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxprod.ExecSql;
        IBQAuxprod.Close;
      end;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  IBQAuxprod.Close;
  IBQAuxprod.SQL.Clear;
  IBQAuxprod.SQL.Add('Select * from AUXPEDIDO '+
                    'Order By Pedido');
  IBQAuxprod.OPen;
  IBQAuxprod.Close;
  // Emite a relação ******************
  RvProdut.showreport;
end;

function TFrmRelMapa.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmRelmapa.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col060').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  IBTAuxmaped.EmptyTable;
  wopcao:='';
  while wopcao='' do
  begin
    wopcao:=InputBox('Informe: E,X ou R !!!!',
                     'Opção do relatorio:',' ');
    wopcao:=UPPERCASE(wopcao);
  end;
  if wopcao='R' then
  begin
    wdescop:='COM RETORNO';
    if DModRosa.IBQLer_ped.Active then
       DModRosa.IBQLer_ped.Active:=False;
    DModRosa.IBQLer_ped.Sql.Clear;
    DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                                'Where Codven=:ven_digit '+
                                'and Situ<>:sit_digit '+
                                'and Situ<>:ext_digit '+
                                'Order by Pedido');
    DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
    DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
    DModRosa.IBQLer_ped.ParamByName('ext_digit').AsString:='X';
    DModRosa.IBQLer_ped.Active:=True;
  end;
  if wopcao='X' then
  begin
    wdescop:='CANCELADO';
    if DModRosa.IBQLer_ped.Active then
       DModRosa.IBQLer_ped.Active:=False;
    DModRosa.IBQLer_ped.Sql.Clear;
    DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                                'Where Codven=:ven_digit '+
                                'and Situ=:sit_digit '+
                                'Order by Pedido');
    DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
    DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='X';
    DModRosa.IBQLer_ped.Active:=True;
  end;
  if wopcao='E' then
  begin
    wdescop:='NA SACOLEIRA';
    if DModRosa.IBQLer_ped.Active then
       DModRosa.IBQLer_ped.Active:=False;
    DModRosa.IBQLer_ped.Sql.Clear;
    DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                                'Where Base>=:dati_digit '+
                                'and Base<=:datf_digit '+
                                'and Codven=:ven_digit '+
                                'and Situ=:sit_digit '+
                                'Order by Pedido');
    DModRosa.IBQLer_ped.ParamByName('dati_digit').AsDateTime:=StrToDate(Maskedit1.Text);
    DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(Maskedit2.Text);
    DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=edit3.Text;
    DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
    DModRosa.IBQLer_ped.Active:=True;
  end;
  if DModRosa.IBQLer_ped.RecordCount=0 then
  begin
    DModRosa.IBQLer_ped.Close;
    showmessage('Não achei pedido na movimentação');
    edit3.Clear;
    edit3.SetFocus;
    exit;
  end;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    chavfaz:='';
    if (wopcao='E') or (wopcao='X') then
       chavfaz:='1'
    else
    begin
      wdatret:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
      if (StrToDate(wdatret)>=StrToDate(maskedit1.text)) and
         (StrToDate(wdatret)<=StrToDate(Maskedit2.Text)) then
         chavfaz:='1';
    end;
    if chavfaz='1' then
    begin
      wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
      wnumcli:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
      wnomcli:=DModRosa.IBQLer_ped.fieldbyName('Nomcli').AsString ;
      wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
      wdevoluc:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Recol').AsDateTime);
      wdatreto:=DModRosa.IBQLer_ped.fieldbyName('Retorno').AsString;
      wvencmto:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Cobran').AsDateTime);
      wvalpag:=DModRosa.IBQLer_ped.fieldbyName('Valpag').AsFloat;
      wvalven:=DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
      wvalped:=DModRosa.IBQLer_ped.fieldbyName('Totped').AsFloat;
      wresido:=DModRosa.IBQLer_ped.fieldbyName('Residuo').AsFloat;
      wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
      wantes:=DModRosa.IBQLer_ped.fieldbyName('Oldped').AsString;
      // Ler Cliente *************************
      DModRosa.IBQVer_cli.Close;
      DModRosa.IBQVer_cli.SQL.Clear;
      DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                  'Where Idcli=:cli_digit');
      DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
      DModRosa.IBQVer_cli.OPen;
      if DModRosa.IBQVer_cli.RecordCount>0 then
      begin
        wtelefone:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString ;
        wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString ;
        wpraca:=DModRosa.IBQVer_cli.fieldbyName('Praca').AsString ;
      end;
      DModRosa.IBQVer_cli.Close;
      if (wpraca>=xpraca) and (wpraca<=zpraca) then
      begin
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
        IBQAuxmaped.ParamByName('CODVEN').AsString:=edit3.text;
        IBQAuxmaped.ParamByName('CODCLI').AsString:=wnumcli;
        IBQAuxmaped.ParamByName('NOMCLI').AsString:=Copy(wnomcli,1,25);
        IBQAuxmaped.ParamByName('ENDCLI').AsString:='';
        IBQAuxmaped.ParamByName('BAICLI').AsString:=wbairro;
        IBQAuxmaped.ParamByName('CIDCLI').AsString:=copy(wtelefone,1,20);
        IBQAuxmaped.ParamByName('ESTCLI').AsString:='';
        IBQAuxmaped.ParamByName('BASE').AsDateTime:=StrToDate(wemissao);
        IBQAuxmaped.ParamByName('RECOL').AsDateTime:=StrToDate(wdevoluc);
        IBQAuxmaped.ParamByName('COBRAN').AsDateTime:=StrToDate(wvencmto);
        IBQAuxmaped.ParamByName('TOTPED').AsFloat:=wvalped;
        IBQAuxmaped.ParamByName('SITU').AsString:=wsitu;
        IBQAuxmaped.ParamByName('DATPED').AsString:=wantes;
        IBQAuxmaped.ParamByName('RETORNO').AsString:=wdatreto;
        IBQAuxmaped.ParamByName('TOTVEN').AsFloat:=wvalven;
        IBQAuxmaped.ParamByName('DATPAG').AsString:='';
        IBQAuxmaped.ParamByName('VALPAG').AsFloat:=wvalpag;
        IBQAuxmaped.ParamByName('RESIDUO').AsFloat:=wresido;
        IBQAuxmaped.ParamByName('COB').AsString:='';
        IBQAuxmaped.ParamByName('LIMITE').AsFloat:=0;
        IBQAuxmaped.ExecSql;
        IBQAuxmaped.Close;
      end;
    end;
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
  if wopcao='E' then
     RvVendsac.Showreport
  else
     RvVendas.showreport;
end;

procedure TFrmRelMapa.Grav_saldant;
begin
  //  **************************Grava saldo anterior *************************
  xitens:=xitens+1;
  witens:=IntToStr(xitens);
  while Length(witens)<5 do
        witens:='0'+witens;
  if IBQExtcli.Active  then
     IBQExtcli.Active:=False;
  IBQExtcli.Sql.Clear;
  IBQExtcli.Sql.Add('Insert Into EXTRATO ');
  IBQExtcli.Sql.Add('(CODCLI,ITEM,PEDIDO,EMISSAO,DESCRICAO,VALSAIDA,RETORNO,'+
                    'VALVEND,VALRESI,DATPAG,SITU) '+
            'Values(:CODCLI,:ITEM,:PEDIDO,:EMISSAO,:DESCRICAO,:VALSAIDA,:RETORNO,'+
                   ':VALVEND,:VALRESI,:DATPAG,:SITU)');
  IBQExtcli.ParamByName('CODCLI').AsString:=edit4.text;
  IBQExtcli.ParamByName('ITEM').AsString:=witens;
  IBQExtcli.ParamByName('PEDIDO').AsString:='';
  IBQExtcli.ParamByName('EMISSAO').AsString:='';
  IBQExtcli.ParamByName('DESCRICAO').AsString:='PENDENCIA ANTERIOR';
  IBQExtcli.ParamByName('VALSAIDA').AsFloat:=0;
  IBQExtcli.ParamByName('RETORNO').AsString:='';
  IBQExtcli.ParamByName('VALVEND').AsFloat:=0;
  IBQExtcli.ParamByName('VALRESI').AsFloat:=wsaldant;
  IBQExtcli.ParamByName('DATPAG').AsString:='';
  IBQExtcli.ParamByName('SITU').AsString:='';
  IBQExtcli.ExecSql;
  IBQExtcli.Close;
  wsaldo:=wsaldant;
  wsaldant:=0;

end;

procedure TFrmRelmapa.Edit3Exit(Sender: TObject);
begin
  while Length(edit3.Text)<edit3.MaxLength do
        edit3.Text := '0' + edit3.Text;
  DModRosa.IBQLer_ven.Close;
  DModRosa.IBQLer_ven.SQL.Clear;
  DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Where Codven=:ven_digit');
  DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit3.Text;
  DModRosa.IBQLer_ven.OPen;
  if DModRosa.IBQLer_ven.RecordCount>0 then
  begin
    wnomvend:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
    wpra1:=DModRosa.IBQLer_ven.fieldbyName('Praca1').AsString;
    wpra2:=DModRosa.IBQLer_ven.fieldbyName('Praca2').AsString;
    wpra3:=DModRosa.IBQLer_ven.fieldbyName('Praca3').AsString;
    wpra4:=DModRosa.IBQLer_ven.fieldbyName('Praca4').AsString;
    while Length(wpra1)<3 do
          wpra1:='0'+wpra1;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra1;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra1:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra2)<3 do
          wpra2:='0'+wpra2;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra2;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra2:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra3)<3 do
          wpra3:='0'+wpra3;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra3;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra3:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra4)<3 do
          wpra4:='0'+wpra4;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra4;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra4:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end else
  begin
    DModRosa.IBQLer_ven.Close;
    showmessage('Vendedor não encontrado !!!!');
    edit3.Clear;
    edit3.SetFocus;
  end;
  DModRosa.IBQLer_ven.Close;
end;

procedure TFrmRelmapa.Edit4Exit(Sender: TObject);
begin
  while Length(edit4.Text)<edit4.MaxLength do
        edit4.Text := '0' + edit4.Text;
  DModRosa.IBQLer_cli.Close;
  DModRosa.IBQLer_cli.SQL.Clear;
  DModRosa.IBQLer_cli.SQL.Add('Select * from CLIENTE '+
                              'Where Idcli=:cli_digit');
  DModRosa.IBQLer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(edit4.Text);
  DModRosa.IBQLer_cli.OPen;
  if DModRosa.IBQLer_cli.RecordCount=0 then
  begin
    DModRosa.IBQLer_cli.Close;
    showmessage('Cliente não encontrado !!!!');
    edit4.Clear;
    edit4.SetFocus;
  end;
  edit5.text:=DModRosa.IBQLer_cli.fieldbyName('Nome').AsString;
  wnomcli:=DModRosa.IBQLer_cli.fieldbyName('Nome').AsString;
  wendereco:=DModRosa.IBQLer_cli.fieldbyName('Ende').AsString;
  wbairro:=DModRosa.IBQLer_cli.fieldbyName('Bair').AsString;
  wcidade:=DModRosa.IBQLer_cli.fieldbyName('Cida').AsString;
  westado:=DModRosa.IBQLer_cli.fieldbyName('Esta').AsString;
  wrota:=DModRosa.IBQLer_cli.fieldbyName('Praca').AsString;
  wtelefone:=DModRosa.IBQLer_cli.fieldbyName('Ntel').AsString;
  wcontato:=DModRosa.IBQLer_cli.fieldbyName('Conta').AsString;
  whoraini:=DModRosa.IBQLer_cli.fieldbyName('Horain').AsString;
  whorafin:=DModRosa.IBQLer_cli.fieldbyName('Horafin').AsString;
  wdatimp:=DModRosa.IBQLer_cli.fieldbyName('Datimp').AsString;
  wturno:=DModRosa.IBQLer_cli.fieldbyName('Esped').AsString;
  DModRosa.IBQLer_cli.Close;
end;

procedure TFrmRelmapa.Edit6Exit(Sender: TObject);
begin
  if edit6.text<'001' then
  begin;
    xpraca:='001';
    zpraca:='999';
    edit7.Text:='GERAL';
  end else
  begin
    xpraca:=edit6.text;
    zpraca:=edit6.text;
    DModRosa.IBQVer_rot.Close;
    DModRosa.IBQVer_rot.SQL.Clear;
    DModRosa.IBQVer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQVer_rot.ParamByName('rot_digit').AsString:=edit6.text;
    DModRosa.IBQVer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQVer_rot.OPen;
    if DModRosa.IBQVer_rot.RecordCount=0 then
    begin
      xpraca:='';
      zpraca:='';
      showmessage('Praça não cadastrada !!');
      DModRosa.IBQVer_rot.close;
      edit6.SetFocus;
      exit;
    end;
    edit7.text:=DModRosa.IBQVer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQVer_rot.close;
  end;
end;

procedure TFrmRelmapa.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmRelmapa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFrmRelmapa.FormShow(Sender: TObject);
begin
  if edit2.text='X' then
  begin
    edit4.SetFocus;
    exit;
  end;
  if edit1.text='X' then
  begin
    edit3.SetFocus;
    exit;
  end;
  showmessage('Informe a opcao do mapa !!!!');
  Modalresult:=-1;
  exit;
end;

procedure TFrmRelmapa.RvExtracliGetValue(const VarName: string;
  var Value: Variant);
begin
   if Comparetext(Varname,'Afericao')=0 then
     value:=wdatini;
  if Comparetext(Varname,'cliente')=0 then
     value:='Cliente: '+wnomcli+'   -   '+edit4.Text;
  if Comparetext(Varname,'Endereco')=0 then
     value:='Endereco: '+wendereco;
  if Comparetext(Varname,'Bairro')=0 then
     value:='Bairro: '+wbairro+'- Cid:'+wcidade;
  if Comparetext(Varname,'Estado')=0 then
     value:='Estado: '+westado;
  if Comparetext(Varname,'Rota')=0 then
     value:='Praca: '+wrota+' Tel: '+wtelefone;
  if Comparetext(Varname,'Saldo')=0 then
     value:=FormatFloat('##,##0.00',wsaldo+wsaldant);
  if Comparetext(Varname,'Atendimento')=0 then
     value:='Atendimento: '+wturno+' / '+whoraini+' A '+whorafin;
end;

procedure TFrmRelmapa.RvMapaGetValue(const VarName: string; var Value: Variant);
begin
  {if Comparetext(Varname,'Datrel')=0 then
     value:=maskedit3.Text+'  A  '+maskedit4.text;
  if Comparetext(Varname,'vinicio')=0 then
     value:=FormatFloat('##,##0.00',Vinicio);
  if Comparetext(Varname,'vsacoleira')=0 then
     value:=FormatFloat('##,##0.00',Vsacoleira);
  if Comparetext(Varname,'Arvcomp')=0 then
     value:=FormatFloat('##,##0.00',wtotcomp);
  if Comparetext(Varname,'Arrvtdv')=0 then
     value:=FormatFloat('##,##0.00',wtotcob);
  if Comparetext(Varname,'Qtdreal')=0 then
     value:=FormatFloat('##,##0.00',wqtdreal);
  if Comparetext(Varname,'Valreal')=0 then
     value:=FormatFloat('##,##0.00',wvalreal); }
end;

procedure TFrmRelmapa.RvMapagGetValue(const VarName: string;
  var Value: Variant);
begin
  if wopcao='1' then
  begin
    if CompareText(Varname,'Titulo')=0 then
       value:='Perdidos com residos para Cobrança';
  end;
  if wopcao='2' then
  begin
    if CompareText(Varname,'Titulo')=0 then
       value:='Cobranças efetuadas no período';
  end;
  if wopcao='3' then
  begin
    if CompareText(Varname,'Titulo')=0 then
       value:='Residuos perdidos no periodo ';
  end;
  if CompareText(Varname,'Vendedor')=0 then
     value:=wnomvend;
  if Comparetext(Varname,'Pracas')=0 then
     value:=edit7.text;
  if Comparetext(Varname,'Datrel')=0 then
     value:='Periodo aferido(Data Base): '+wdatini+'  A  '+wdatfin;
  if Comparetext(Varname,'Vendido')=0 then
     value:=FormatFloat('##,##0.00',wtotven);
  if Comparetext(Varname,'Valpag')=0 then
     value:=FormatFloat('##,##0.00',wtotpag);
  if Comparetext(Varname,'Resido')=0 then
     value:=FormatFloat('##,##0.00',wtotres);
  if Comparetext(Varname,'Pedido')=0 then
     value:=FormatFloat('#,##0',wpedidos);
end;


procedure TFrmRelmapa.RvMercGetValue(const VarName: string; var Value: Variant);
begin
  if wopcao='1' then
  begin
    if CompareText(Varname,'Modalidade')=0 then
                value:='Por Vendedor ';
    if CompareText(Varname,'Opcao')=0 then
       value:=wnomvend;
    if Comparetext(Varname,'Datrel')=0 then
       value:=maskedit1.text+'  A  '+maskedit2.text+'    Faixa: '+wprimeiro+' A '+wultimo;
    if CompareText(Varname,'Totnot')=0 then
       value:=wnotas;
  end;
  if wopcao='2' then
  begin
    if CompareText(Varname,'Modalidade')=0 then
                value:='Por Cliente ';
    if CompareText(Varname,'Opcao')=0 then
       value:=wnomcli;
    if Comparetext(Varname,'Datrel')=0 then
       value:=wdatini+'  A  '+wdatfin;
    if CompareText(Varname,'Totnot')=0 then
       value:=wnotas;
  end;
  
end;

procedure TFrmRelmapa.RvProdutGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(Varname,'Vendedor')=0 then
              value:=wnomvend;
  if CompareText(Varname,'Opcao')=0 then
              value:=wdescop+' '+'Prod: '+wprodut;
  if CompareText(Varname,'Pracas')=0 then
              value:=edit7.text;
  if Comparetext(Varname,'Datrel')=0 then
              value:=maskedit1.text+'  A  '+maskedit2.text;
  if Comparetext(Varname,'Notas')=0 then
              value:=wtnot;
end;

procedure TFrmRelmapa.RvVendasGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(Varname,'Vendedor')=0 then
              value:=wnomvend;
  if CompareText(Varname,'Opcao')=0 then
              value:=wdescop;
  if CompareText(Varname,'Pracas')=0 then
              value:=edit7.text;
  if Comparetext(Varname,'Datrel')=0 then
              value:=maskedit1.text+'  A  '+maskedit2.text;
end;

procedure TFrmRelmapa.RvVendsacGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(Varname,'Vendedor')=0 then
              value:=wnomvend;
  if CompareText(Varname,'Opcao')=0 then
              value:=wdescop;
  if CompareText(Varname,'Pracas')=0 then
              value:=edit7.text;
  if Comparetext(Varname,'Datrel')=0 then
              value:=maskedit1.text+'  A  '+maskedit2.text;
end;

procedure TFrmRelmapa.Button2Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col061').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  wopcao:='1';
  IBTAuxmapag.EmptyTable;
  wvend:=edit3.text;
  wpedidos:=0;
  wtotven:=0;
  wtotres:=0;
  wtotpag:=0;
  DModRosa.IBQLer_ven.Close;
  DModRosa.IBQLer_ven.SQL.Clear;
  DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Where Codven=:ven_digit');
  DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQLer_ven.OPen;
  if DModRosa.IBQLer_ven.RecordCount>0 then
  begin
    wnomvend:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
    wpra1:=DModRosa.IBQLer_ven.fieldbyName('Praca1').AsString;
    wpra2:=DModRosa.IBQLer_ven.fieldbyName('Praca2').AsString;
    wpra3:=DModRosa.IBQLer_ven.fieldbyName('Praca3').AsString;
    wpra4:=DModRosa.IBQLer_ven.fieldbyName('Praca4').AsString;
    while Length(wpra1)<3 do
          wpra1:='0'+wpra1;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra1;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra1:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra2)<3 do
          wpra2:='0'+wpra2;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra2;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra2:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra3)<3 do
          wpra3:='0'+wpra3;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra3;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra3:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra4)<3 do
          wpra4:='0'+wpra4;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra4;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra4:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
  xitens:=0;
  DModRosa.IBQLer_ven.Close;
  wdatini:=Maskedit1.text;
  wdatfin:=Maskedit2.text;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Codven=:ven_digit '+
                              'and Residuo>:res_digit '+
                              'and Cob=:cob_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:ext_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQLer_ped.ParamByName('res_digit').AsFloat:=0;
  DModRosa.IBQLer_ped.ParamByName('cob_digit').AsString:=' ';
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('ext_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wdatbase:=dateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsdateTime);
    if wdatbase>'  /  /    ' then
    begin
      if (StrToDate(wdatbase)>=StrToDate(wdatini)) and
         (StrToDate(wdatbase)<=StrToDate(wdatfin)) then
      begin
        wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
        wnumcli:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
        wnomcli:=DModRosa.IBQLer_ped.fieldbyName('Nomcli').AsString ;
        wemissao:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
        wdevoluc:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Recol').AsDateTime);
        wdatpag:=DModRosa.IBQLer_ped.fieldbyName('Datpag').AsString;
        wvencmto:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Cobran').AsDateTime);
        wvalpag:=DModRosa.IBQLer_ped.fieldbyName('Valpag').AsFloat;
        wvalven:=DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
        wresido:=DModRosa.IBQLer_ped.fieldbyName('Residuo').AsFloat;
        wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
        wantes:=DModRosa.IBQLer_ped.fieldbyName('Oldped').AsString;
        wdatpag:=DModRosa.IBQLer_ped.fieldbyName('Datpag').AsString;
        // Ler Cliente *************************
        DModRosa.IBQVer_cli.Close;
        DModRosa.IBQVer_cli.SQL.Clear;
        DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                    'Where Idcli=:cli_digit');
        DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
        DModRosa.IBQVer_cli.OPen;
        if DModRosa.IBQVer_cli.RecordCount>0 then
        begin
          wtelefone:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString ;
          wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString ;
          wpraca:=DModRosa.IBQVer_cli.fieldbyName('Praca').AsString ;
        end;
        DModRosa.IBQVer_cli.Close;
        if (wpraca>=xpraca) and (wpraca<=zpraca) then
        begin
          wtotven:=wtotven+wvalven;
          wtotres:=wtotres+wresido;
          wtotpag:=wtotpag+wvalpag;
          // Grava Pedido ***********************************
          xitens:=xitens+1;
          witens:=IntToStr(xitens);
          while Length(witens)<6 do
                witens:='0'+witens;
          if IBQAuxmapag.Active then
             IBQAuxmapag.Active:=False;
          IBQAuxmapag.Sql.Clear;
          IBQAuxmapag.Sql.Add('Insert Into RELPEDIDO ');
          IBQAuxmapag.Sql.Add('(ITEM,PEDIDO,CODVEN,CODCLI,NOMCLI,ENDCLI,BAICLI,CIDCLI,ESTCLI,'+
                              'BASE,RECOL,COBRAN,TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                              'VALPAG,RESIDUO) '+
                      'Values(:ITEM,:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:ENDCLI,:BAICLI,:CIDCLI,'+
                             ':ESTCLI,:BASE,:RECOL,:COBRAN,:TOTPED,:SITU,:DATPED,:RETORNO,'+
                             ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO)');
          IBQAuxmapag.ParamByName('ITEM').AsString:=witens;
          IBQAuxmapag.ParamByName('PEDIDO').AsString:=wnumero;
          IBQAuxmapag.ParamByName('CODVEN').AsString:=wvend;
          IBQAuxmapag.ParamByName('CODCLI').AsString:=wnumcli;
          IBQAuxmapag.ParamByName('NOMCLI').AsString:=wnomcli;
          IBQAuxmapag.ParamByName('ENDCLI').AsString:=wbairro;
          IBQAuxmapag.ParamByName('BAICLI').AsString:=copy(wtelefone,1,20);
          IBQAuxmapag.ParamByName('CIDCLI').AsString:='';
          IBQAuxmapag.ParamByName('ESTCLI').AsString:='';
          IBQAuxmapag.ParamByName('BASE').AsString:=wemissao;
          IBQAuxmapag.ParamByName('RECOL').AsString:=wdevoluc;
          IBQAuxmapag.ParamByName('COBRAN').AsString:=wvencmto;
          IBQAuxmapag.ParamByName('TOTPED').AsString:=' ';
          IBQAuxmapag.ParamByName('SITU').AsString:=wsitu;
          IBQAuxmapag.ParamByName('DATPED').AsString:=wantes;
          IBQAuxmapag.ParamByName('RETORNO').AsString:='';
          IBQAuxmapag.ParamByName('TOTVEN').AsString:=FormatFloat('##,##0.00',wvalven);
          IBQAuxmapag.ParamByName('DATPAG').AsString:=wdatpag;
          IBQAuxmapag.ParamByName('VALPAG').AsString:=FormatFloat('##,##0.00',wvalpag);
          IBQAuxmapag.ParamByName('RESIDUO').AsString:=FormatFloat('##,##0.00',wresido);
          IBQAuxmapag.ExecSql;
          IBQAuxmapag.Close;
          wpedidos:=wpedidos+1;
        end;
      end;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  IBQAuxmapag.Close;
  IBQAuxmapag.SQL.Clear;
  IBQAuxmapag.SQL.Add('Select * from RELPEDIDO '+
                      'Order By Item,Pedido');
  IBQAuxmapag.OPen;
  IBQAuxmapag.Close;
  // Emite a relação ******************
  RvMapag.Showreport;
end;

procedure TFrmRelmapa.Button3Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col062').AsString<>'X' then
  begin
    showmessage('Não Autorizado !!!');
    ModalResult:=-1;
    exit;
  end;
  wopcao:='2';
  IBTAuxmapag.EmptyTable;
  wvend:=edit3.text;
  wpedidos:=0;
  wtotven:=0;
  wtotres:=0;
  wtotpag:=0;
  DModRosa.IBQLer_ven.Close;
  DModRosa.IBQLer_ven.SQL.Clear;
  DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Where Codven=:ven_digit');
  DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQLer_ven.OPen;
  if DModRosa.IBQLer_ven.RecordCount>0 then
  begin
    wnomvend:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
    wpra1:=DModRosa.IBQLer_ven.fieldbyName('Praca1').AsString;
    wpra2:=DModRosa.IBQLer_ven.fieldbyName('Praca2').AsString;
    wpra3:=DModRosa.IBQLer_ven.fieldbyName('Praca3').AsString;
    wpra4:=DModRosa.IBQLer_ven.fieldbyName('Praca4').AsString;
    while Length(wpra1)<3 do
          wpra1:='0'+wpra1;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra1;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra1:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra2)<3 do
          wpra2:='0'+wpra2;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra2;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra2:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra3)<3 do
          wpra3:='0'+wpra3;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra3;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra3:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
    while Length(wpra4)<3 do
          wpra4:='0'+wpra4;
    DModRosa.IBQLer_rot.Close;
    DModRosa.IBQLer_rot.SQL.Clear;
    DModRosa.IBQLer_rot.SQL.Add('Select * from ROTA '+
                                'Where Rota=:rot_digit '+
                                'and Bair=:bai_digit');
    DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=wpra4;
    DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
    DModRosa.IBQLer_rot.OPen;
    if DModRosa.IBQLer_rot.RecordCount>0 then
       wnpra4:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_rot.Close;
  end;
  xitens:=0;
  DModRosa.IBQLer_ven.Close;
  wdatini:=Maskedit1.text;
  wdatfin:=Maskedit2.text;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Codven=:ven_digit '+
                              'and Situ<>:sit_digit '+
                              'and Situ<>:ext_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.ParamByName('ext_digit').AsString:='X';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wdatbase:=DModRosa.IBQLer_ped.fieldbyName('Datpag').AsString;
    if wdatbase>'  /  /    ' then
    begin
      if (StrToDate(wdatbase)>=StrToDate(wdatini)) and
         (StrToDate(wdatbase)<=StrToDate(wdatfin)) then
      begin
        wpedidos:=wpedidos+1;
        wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
        wnumcli:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
        wnomcli:=DModRosa.IBQLer_ped.fieldbyName('Nomcli').AsString ;
        wvencmto:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Cobran').AsDateTime);
        wvalven:=DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
        wresido:=DModRosa.IBQLer_ped.fieldbyName('Residuo').AsFloat;
        wsitu:=DModRosa.IBQLer_ped.fieldbyName('Situ').AsString;
        // Ler Cliente *************************
        DModRosa.IBQVer_cli.Close;
        DModRosa.IBQVer_cli.SQL.Clear;
        DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                    'Where Idcli=:cli_digit');
        DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wnumcli);
        DModRosa.IBQVer_cli.OPen;
        if DModRosa.IBQVer_cli.RecordCount>0 then
        begin
          wtelefone:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString ;
          wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString ;
          wpraca:=DModRosa.IBQVer_cli.fieldbyName('Praca').AsString ;
        end;
        DModRosa.IBQVer_cli.Close;
        if (wpraca>=xpraca) and (wpraca<=zpraca) then
        begin
          wtotven:=wtotven+wvalven;
          wtotres:=wtotres+wresido;
          // Grava Pedido ***********************************
          xitens:=xitens+1;
          witens:=IntToStr(xitens);
          while Length(witens)<6 do
                witens:='0'+witens;
          if IBQAuxmapag.Active then
             IBQAuxmapag.Active:=False;
          IBQAuxmapag.Sql.Clear;
          IBQAuxmapag.Sql.Add('Insert Into RELPEDIDO ');
          IBQAuxmapag.Sql.Add('(ITEM,PEDIDO,CODVEN,CODCLI,NOMCLI,ENDCLI,BAICLI,CIDCLI,ESTCLI,'+
                              'BASE,RECOL,COBRAN,TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                              'VALPAG,RESIDUO) '+
                      'Values(:ITEM,:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:ENDCLI,:BAICLI,:CIDCLI,'+
                             ':ESTCLI,:BASE,:RECOL,:COBRAN,:TOTPED,:SITU,:DATPED,:RETORNO,'+
                             ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO)');
          IBQAuxmapag.ParamByName('ITEM').AsString:=witens;
          IBQAuxmapag.ParamByName('PEDIDO').AsString:=wnumero;
          IBQAuxmapag.ParamByName('CODVEN').AsString:=wvend;
          IBQAuxmapag.ParamByName('CODCLI').AsString:=wnumcli;
          IBQAuxmapag.ParamByName('NOMCLI').AsString:=wnomcli;
          IBQAuxmapag.ParamByName('ENDCLI').AsString:=wbairro;
          IBQAuxmapag.ParamByName('BAICLI').AsString:=copy(wtelefone,1,20);
          IBQAuxmapag.ParamByName('CIDCLI').AsString:='';
          IBQAuxmapag.ParamByName('ESTCLI').AsString:='';
          IBQAuxmapag.ParamByName('BASE').AsString:=' ';
          IBQAuxmapag.ParamByName('RECOL').AsString:=' ';
          IBQAuxmapag.ParamByName('COBRAN').AsString:=wvencmto;
          IBQAuxmapag.ParamByName('TOTPED').AsString:=' ';
          IBQAuxmapag.ParamByName('SITU').AsString:=wsitu;
          IBQAuxmapag.ParamByName('DATPED').AsString:=' ';
          IBQAuxmapag.ParamByName('RETORNO').AsString:='';
          IBQAuxmapag.ParamByName('TOTVEN').AsString:=FormatFloat('##,##0.00',wvalven);
          IBQAuxmapag.ParamByName('DATPAG').AsString:=' ';
          IBQAuxmapag.ParamByName('VALPAG').AsString:=' ';
          IBQAuxmapag.ParamByName('RESIDUO').AsString:=FormatFloat('##,##0.00',wresido);
          IBQAuxmapag.ExecSql;
          IBQAuxmapag.Close;
          // Monta residos pagos **********************************************
          if DModRosa.IBQVer_resi.Active then
             DModRosa.IBQVer_resi.Active:=False;
          DModRosa.IBQVer_resi.Sql.Clear;
          DModRosa.IBQVer_resi.Sql.Add('Select * from RESIDOS '+
                                       'Where Datmov>=:ini_digit '+
                                       'and Datmov<=:fin_digit '+
                                       'and Numdoc=:num_digit '+
                                       'Order by Datmov,Item');
          DModRosa.IBQVer_resi.ParamByName('ini_digit').AsDate:=StrTodate(Maskedit1.Text);
          DModRosa.IBQVer_resi.ParamByName('fin_digit').AsDate:=StrTodate(Maskedit2.Text);
          DModRosa.IBQVer_resi.ParamByName('num_digit').AsString:=wnumero;
          DModRosa.IBQVer_resi.Active:=True;
          DModRosa.IBQVer_resi.DisableControls;
          DModRosa.IBQVer_resi.First;
          while not DModRosa.IBQVer_resi.Eof do
          begin
            wdatpag:=DateToStr(DModRosa.IBQVer_resi.fieldbyName('Datmov').AsDateTime);
            wvalpag:=DModRosa.IBQVer_resi.fieldbyName('Valpag').AsFloat;
            wtotpag:=wtotpag+wvalpag;
            xitens:=xitens+1;
            witens:=IntToStr(xitens);
            while Length(witens)<6 do
                  witens:='0'+witens;
            if IBQAuxmapag.Active then
              IBQAuxmapag.Active:=False;
            IBQAuxmapag.Sql.Clear;
            IBQAuxmapag.Sql.Add('Insert Into RELPEDIDO ');
            IBQAuxmapag.Sql.Add('(ITEM,PEDIDO,CODVEN,CODCLI,NOMCLI,ENDCLI,BAICLI,CIDCLI,ESTCLI,'+
                                'BASE,RECOL,COBRAN,TOTPED,SITU,DATPED,RETORNO,TOTVEN,DATPAG,'+
                                'VALPAG,RESIDUO) '+
                        'Values(:ITEM,:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:ENDCLI,:BAICLI,:CIDCLI,'+
                               ':ESTCLI,:BASE,:RECOL,:COBRAN,:TOTPED,:SITU,:DATPED,:RETORNO,'+
                               ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO)');
            IBQAuxmapag.ParamByName('ITEM').AsString:=witens;
            IBQAuxmapag.ParamByName('PEDIDO').AsString:=' ';
            IBQAuxmapag.ParamByName('CODVEN').AsString:=' ';
            IBQAuxmapag.ParamByName('CODCLI').AsString:=' ';
            IBQAuxmapag.ParamByName('NOMCLI').AsString:=' ';
            IBQAuxmapag.ParamByName('ENDCLI').AsString:=' ';
            IBQAuxmapag.ParamByName('BAICLI').AsString:=' ';
            IBQAuxmapag.ParamByName('CIDCLI').AsString:='';
            IBQAuxmapag.ParamByName('ESTCLI').AsString:='';
            IBQAuxmapag.ParamByName('BASE').AsString:=' ';
            IBQAuxmapag.ParamByName('RECOL').AsString:=' ';
            IBQAuxmapag.ParamByName('COBRAN').AsString:=' ';
            IBQAuxmapag.ParamByName('TOTPED').AsString:=' ';
            IBQAuxmapag.ParamByName('SITU').AsString:=' ';
            IBQAuxmapag.ParamByName('DATPED').AsString:=' ';
            IBQAuxmapag.ParamByName('RETORNO').AsString:='';
            IBQAuxmapag.ParamByName('TOTVEN').AsString:=' ';
            IBQAuxmapag.ParamByName('DATPAG').AsString:=wdatpag;
            IBQAuxmapag.ParamByName('VALPAG').AsString:=FormatFloat('##,##0.00',wvalpag);
            IBQAuxmapag.ParamByName('RESIDUO').AsString:=' ';
            IBQAuxmapag.ExecSql;
            IBQAuxmapag.Close;
            DModRosa.IBQVer_resi.Next;
          end;
          DModRosa.IBQVer_resi.Close;
        end;
      end;
    end;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  IBQAuxmapag.Close;
  IBQAuxmapag.SQL.Clear;
  IBQAuxmapag.SQL.Add('Select * from RELPEDIDO '+
                      'Order By Item,Pedido');
  IBQAuxmapag.OPen;
  IBQAuxmapag.Close;
  // Emite a relação ******************
  RvMapag.Showreport;;

end;

end.
