unit UPendencias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ComCtrls,
  frxClass, frxDBSet, IBX.IBQuery, Data.DB, IBX.IBCustomDataSet, IBX.IBTable;

type
  TFrmPendencias = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    MaskEdit1: TMaskEdit;
    ProgressBar1: TProgressBar;
    Label6: TLabel;
    RVPendpraca: TfrxReport;
    DtsArqpag: TfrxDBDataset;
    IBTarqpag: TIBTable;
    IBQarqpag: TIBQuery;
    IBTPend: TIBTable;
    IBQPend: TIBQuery;
    IBQarqpagCODCLI: TIBStringField;
    IBQarqpagNCPF: TIBStringField;
    IBQarqpagNIFP: TIBStringField;
    IBQarqpagBAIR: TIBStringField;
    IBQarqpagCIDA: TIBStringField;
    IBQarqpagESTA: TIBStringField;
    IBQarqpagNCEP: TIBStringField;
    IBQarqpagNTEL: TIBStringField;
    IBQarqpagCONTA: TIBStringField;
    IBQarqpagVEND: TIBStringField;
    IBQarqpagLCRED: TIBBCDField;
    IBQarqpagDATIMP: TIBStringField;
    IBQarqpagNOMMAE: TIBStringField;
    IBQarqpagNOMPAI: TIBStringField;
    IBQarqpagDATNASC: TIBStringField;
    IBQarqpagNATU: TIBStringField;
    IBQarqpagROTA: TIBStringField;
    IBQarqpagPRACA: TIBStringField;
    IBQarqpagREFER: TIBStringField;
    IBQarqpagOLDCLI: TIBStringField;
    IBQarqpagSITU: TIBStringField;
    IBQarqpagNOME: TIBStringField;
    IBQarqpagENDE: TIBStringField;
    IBQarqpagHORAIN: TIBStringField;
    IBQarqpagHORAFIN: TIBStringField;
    IBQarqpagVISITA: TIBStringField;
    IBQarqpagATIVO: TIBStringField;
    IBQarqpagESPED: TIBStringField;
    IBQarqpagOBSV: TBlobField;
    IBTarqpagCODCLI: TIBStringField;
    IBTarqpagNCPF: TIBStringField;
    IBTarqpagNIFP: TIBStringField;
    IBTarqpagBAIR: TIBStringField;
    IBTarqpagCIDA: TIBStringField;
    IBTarqpagESTA: TIBStringField;
    IBTarqpagNCEP: TIBStringField;
    IBTarqpagNTEL: TIBStringField;
    IBTarqpagCONTA: TIBStringField;
    IBTarqpagVEND: TIBStringField;
    IBTarqpagLCRED: TIBBCDField;
    IBTarqpagDATIMP: TIBStringField;
    IBTarqpagNOMMAE: TIBStringField;
    IBTarqpagNOMPAI: TIBStringField;
    IBTarqpagDATNASC: TIBStringField;
    IBTarqpagNATU: TIBStringField;
    IBTarqpagROTA: TIBStringField;
    IBTarqpagPRACA: TIBStringField;
    IBTarqpagREFER: TIBStringField;
    IBTarqpagOLDCLI: TIBStringField;
    IBTarqpagSITU: TIBStringField;
    IBTarqpagNOME: TIBStringField;
    IBTarqpagENDE: TIBStringField;
    IBTarqpagHORAIN: TIBStringField;
    IBTarqpagHORAFIN: TIBStringField;
    IBTarqpagVISITA: TIBStringField;
    IBTarqpagATIVO: TIBStringField;
    IBTarqpagESPED: TIBStringField;
    IBTarqpagOBSV: TBlobField;
    IBTPendCODCLI: TIBStringField;
    IBTPendITEM: TIBStringField;
    IBTPendPEDIDO: TIBStringField;
    IBTPendEMISSAO: TIBStringField;
    IBTPendDESCRICAO: TIBStringField;
    IBTPendVALSAIDA: TIBBCDField;
    IBTPendRETORNO: TIBStringField;
    IBTPendVALVEND: TIBBCDField;
    IBTPendVALRESI: TIBBCDField;
    IBTPendDATPAG: TIBStringField;
    IBTPendSITU: TIBStringField;
    IBTPendVENCTO: TIBStringField;
    IBQPendCODCLI: TIBStringField;
    IBQPendITEM: TIBStringField;
    IBQPendPEDIDO: TIBStringField;
    IBQPendEMISSAO: TIBStringField;
    IBQPendDESCRICAO: TIBStringField;
    IBQPendVALSAIDA: TIBBCDField;
    IBQPendRETORNO: TIBStringField;
    IBQPendVALVEND: TIBBCDField;
    IBQPendVALRESI: TIBBCDField;
    IBQPendDATPAG: TIBStringField;
    IBQPendSITU: TIBStringField;
    IBQPendVENCTO: TIBStringField;
    DtsArqpend: TfrxDBDataset;
    DtsPag: TDataSource;
    DtsPend: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RVPendpracaGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
     function ExisteForm(pForm: TForm): Boolean;
     function Repetir(N:Integer; Caractere: Char): string;
     function strZero(const strValor: string;const intComprimento: integer): string;
     procedure Progresso(PB: TProgressBar);
     procedure Andando(PB: TProgressBar);
  end;

var
  FrmPendencias: TFrmPendencias;
  wsitu,chvimp,wemissao,wdatven,wtipo,wnumero,wmarca,wchapa,wempresa,whoraini,whorafin: string;
  wpreco,wvalsai,wvalven,wvalres,wprazo,wsaldo: Extended;
  wnumpar,wdescricao,wtippag,wnumpag,wdata,worigem,wobser,wantes,chave: string;
  wnome,wendereco,wbairro,wcidade,westado,wtelefone,wrota,wcontato,witens: string;
  wpedido ,wdretor,wdatpag,wnomrota,wpraca,wcodcli,wchvtev,wopcao,wvencmt: string;
  xitens: Integer;
implementation

{$R *.dfm}

uses UDModRosa;

function TFrmPendencias.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmPendencias.FormClose(Sender: TObject;
          var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFrmPendencias.strZero(const strValor: string;const intComprimento: integer): string;
var
  strZeros,strRetorno: string;
  intTamanho,intContador: Integer;
begin
  intTamanho:=length(Trim(strValor));
  strZeros:='';
  for intContador:=1 to intComprimento do
      strZeros:=strZeros+'0';
  strRetorno:=copy(Trim(strzeros)+Trim(strValor),intTamanho+1,intComprimento);
  result:=strRetorno;
end;

procedure TFrmPendencias.Progresso(PB: TProgressBar);
begin
  While(PB.Position<PB.max) do
        PB.Position := PB.Position + 1;
end;
procedure TFrmPendencias.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Se foi Pressionada o Enter ou seta para Baixo
  // Muda o foco para o proximo Componete
  if (Key = VK_RETURN) or (Key = VK_DOWN) then
  begin
    Perform(WM_NEXTDLGCTL,0,0);
    Key := 0;
 end else
    // Se foi presionado seta para cima
    // Muda foco para componente anterior
    if Key = VK_UP then
    begin
      Perform(WM_NEXTDLGCTL,0,1);
      Key := 0;
    end;
end;

function TFrmPendencias.Repetir(N: Integer; Caractere: Char): string;
var
  I: Integer;
begin
  Result := '';
  for I:= 1 to N do
      Result := Result + Caractere;
end;

procedure TFrmPendencias.RVPendpracaGetValue(const VarName: string;
var Value: Variant);
begin
  if CompareText(VarName, 'Praca') = 0 then
     Value :=edit2.Text;
  if CompareText(VarName, 'Limite') = 0 then
     Value :=maskedit1.Text;
end;

procedure TFrmPendencias.Andando(PB: TProgressBar);
var
  wanda,xanda: Integer;
begin
  wanda:=5;
  xanda:=0;
  For xanda:=1 to wanda  do
  begin
    PB.Position := PB.Position + 1;
  end;
end;

procedure TFrmPendencias.Button1Click(Sender: TObject);
begin
  // Ajusta arquivo auxiliar de Clientes **********
  IBQArqpag.Close;
  IBQArqpag.SQL.Clear;
  IBQArqpag.SQL.Add('Select * from AUXCLIENTE');
  IBQArqpag.OPen;
  IBQArqpag.Close;
  // Ajusta arquivo auxiliar de pedidos **********
  IBQPend.Close;
  IBQPend.SQL.Clear;
  IBQPend.SQL.Add('Select * from EXTRATO');
  IBQPend.OPen;
  IBQPend.Close;
   // Emite o relatorio *******************
  RvPendpraca.ShowReport;
  edit1.Clear;
  edit2.Clear;
  maskedit1.Clear;
  maskedit1.SetFocus;
  exit;
end;

procedure TFrmPendencias.Edit1Exit(Sender: TObject);
begin
  if ActiveControl=Button2 then
     exit;

  Andando(ProgressBar1);

  wsaldo:=0;
  wsitu:='';
  wpreco:=0;
  wchapa:='';
  IBTArqpag.EmptyTable;
  IBTPend.EmptyTable;
  // Lendo a Rota ******************************
  while Length(edit1.Text)<3 do
        edit1.text:='0'+edit1.text;
  if DModRosa.IBQLer_rot.Active then
     DModRosa.IBQLer_rot.Active:=False;
  DModRosa.IBQLer_rot.Sql.Clear;
  DModRosa.IBQLer_rot.Sql.Add('Select * from ROTA '+
                              'Where Rota=:rot_digit '+
                              'and Bair=:bai_digit');
  DModRosa.IBQLer_rot.ParamByName('rot_digit').AsString:=edit1.Text;
  DModRosa.IBQLer_rot.ParamByName('bai_digit').AsString:='000';
  DModRosa.IBQLer_rot.Active:=True;
  if DModRosa.IBQLer_rot.RecordCount=0 then
  begin
    showmessage('Praça não cadastrada !!');
    DModRosa.IBQLer_rot.Active:=False;
    edit1.Clear;
    edit1.setFocus;
    exit;
  end;
  edit2.text:=DModRosa.IBQLer_rot.fieldbyName('Nome').AsString;
  DModRosa.IBQLer_rot.Close;
  // Lendo Cliente ******************************
  if DModRosa.IBQVer_cli.Active then
     DModRosa.IBQVer_cli.Active:=False;
  DModRosa.IBQVer_cli.Sql.Clear;
  DModRosa.IBQVer_cli.Sql.Add('Select * from CLIENTE '+
                              'Where Praca=:pra_digit '+
                              'Order by Rota,Idcli');
  DModRosa.IBQVer_cli.ParamByName('pra_digit').AsString:=edit1.Text;
  DModRosa.IBQVer_cli.Active:=True;
  if DModRosa.IBQVer_cli.RecordCount=0 then
  begin
    showmessage('Praça sem Cliente !!');
    DModRosa.IBQVer_cli.Close;
    edit1.setFocus;
    exit;
  end;
  DModRosa.IBQVer_cli.DisableControls;
  DModRosa.IBQVer_cli.First;
  while not DModRosa.IBQVer_cli.Eof do
  begin
    wchvtev:='';
    xitens:=0;
    witens:='';
    wnome:=DModRosa.IBQVer_cli.fieldbyName('Nome').AsString;
    wrota:=DModRosa.IBQVer_cli.fieldbyName('Rota').AsString;
    wendereco:=DModRosa.IBQVer_cli.fieldbyName('Ende').AsString;
    wcidade:=DModRosa.IBQVer_cli.fieldbyName('Cida').AsString;
    wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString;
    westado:=DModRosa.IBQVer_cli.fieldbyName('Esta').AsString;
    wtelefone:=DModRosa.IBQVer_cli.fieldbyName('Ntel').AsString;
    wcontato:=DModRosa.IBQVer_cli.fieldbyName('Refer').AsString;
    whoraini:=DModRosa.IBQVer_cli.fieldbyName('Horain').AsString;
    whorafin:=DModRosa.IBQVer_cli.fieldbyName('Horafin').AsString;
    wcodcli:=IntToStr(DModRosa.IBQVer_cli.fieldbyName('Idcli').AsInteger);
    while Length(wcodcli)<4 do
          wcodcli:='0'+wcodcli;
    if DModRosa.IBQVer_ped.Active then
       DModRosa.IBQVer_ped.Active:=False;
    DModRosa.IBQVer_ped.Sql.Clear;
    DModRosa.IBQVer_ped.Sql.Add('Select * from PEDIDO '+
                                 'Where Codcli=:marc_digit '+
                                 'and Cobran<:limt_digit '+
                                 'and Situ<>:sit_digit '+
                                'Order by Pedido');
    DModRosa.IBQVer_ped.ParamByName('marc_digit').AsString:=wcodcli;
    DModrosa.IBQVer_ped.ParamByName('limt_digit').AsDateTime:=StrToDate(maskedit1.Text);
    DModRosa.IBQVer_ped.ParamByName('sit_digit').AsString:='X';
    DModRosa.IBQVer_ped.Active:=True;
    DModRosa.IBQVer_ped.DisableControls;
    DModRosa.IBQVer_ped.First;
    while not DModRosa.IBQVer_ped.Eof do
    begin
      wemissao:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Base').AsDateTime);
      wpedido:=DModRosa.IBQVer_ped.fieldbyName('Pedido').AsString;
      wvalsai:=DModRosa.IBQVer_ped.fieldbyName('Totped').AsFloat;
      wvalven:=DModRosa.IBQVer_ped.fieldbyName('Totven').AsFloat;
      wvalres:=DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat;
      wdretor:=DModRosa.IBQVer_ped.fieldbyName('Retorno').AsString;
      wvencmt:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Cobran').AsDateTime);
      wsitu:=DModRosa.IBQVer_ped.fieldByName('Situ').AsString;
      wpreco:=0;
      if DModRosa.IBQVer_ped.fieldByName('Situ').AsString='E' then
         wpreco:=DModRosa.IBQVer_ped.fieldbyName('Totped').AsFloat
      else
         wpreco:=DModRosa.IBQVer_ped.fieldbyName('Residuo').AsFloat;
      if wpreco>0 then
      begin
        wchvtev:='1';
        xitens:=xitens+1;
        witens:=IntToStr(xitens);
        while Length(witens)<5 do
             witens:='0'+witens;
        if IBQPend.Active  then
           IBQPend.Active:=False;
        IBQPend.Sql.Clear;
        IBQPend.Sql.Add('Insert Into EXTRATO ');
        IBQPend.Sql.Add('(CODCLI,ITEM,PEDIDO,EMISSAO,DESCRICAO,VALSAIDA,RETORNO,'+
                        'VALVEND,VALRESI,DATPAG,SITU) '+
                'Values(:CODCLI,:ITEM,:PEDIDO,:EMISSAO,:DESCRICAO,:VALSAIDA,:RETORNO,'+
                       ':VALVEND,:VALRESI,:DATPAG,:SITU)');
        IBQPend.ParamByName('CODCLI').AsString:=wcodcli;
        IBQPend.ParamByName('ITEM').AsString:=witens;
        IBQPend.ParamByName('PEDIDO').AsString:=wpedido;
        IBQPend.ParamByName('EMISSAO').AsString:=wemissao;
        IBQPend.ParamByName('DESCRICAO').AsString:='Venda a Cliente';
        IBQPend.ParamByName('VALSAIDA').AsFloat:=wvalsai;
        IBQPend.ParamByName('RETORNO').AsString:=wdretor;
        IBQPend.ParamByName('VALVEND').AsFloat:=wvalven;
        IBQPend.ParamByName('VALRESI').AsFloat:=wpreco;
        IBQPend.ParamByName('DATPAG').AsString:=wvencmt;
        IBQPend.ParamByName('SITU').AsString:=wsitu;
        IBQPend.ExecSql;
        IBQPend.Close;
      end;
      DModRosa.IBQVer_ped.Next;
    end;
    DModRosa.IBQVer_ped.Close;
    if wchvtev='1' then
    begin
      if IBQArqpag.Active  then
         IBQArqpag.Active:=False;
      IBQArqpag.Sql.Clear;
      IBQArqpag.Sql.Add('Insert Into AUXCLIENTE ');
      IBQArqpag.Sql.Add('(CODCLI,BAIR,CIDA,ESTA,'+
                        'NTEL,ROTA,PRACA,REFER,NOME,ENDE,'+
                        'HORAIN,HORAFIN) '+
                'Values(:CODCLI,:BAIR,:CIDA,:ESTA,'+
                       ':NTEL,:ROTA,:PRACA,:REFER,:NOME,:ENDE,'+
                       ':HORAIN,:HORAFIN)');
      IBQArqpag.ParamByName('CODCLI').AsString:=wcodcli;
      IBQArqpag.ParamByName('BAIR').AsString:=wbairro;
      IBQArqpag.ParamByName('CIDA').AsString:=wcidade;
      IBQArqpag.ParamByName('ESTA').AsString:=westado;
      IBQArqpag.ParamByName('NTEL').AsString:=wtelefone;
      IBQArqpag.ParamByName('ROTA').AsString:=wrota;
      IBQArqpag.ParamByName('PRACA').AsString:=edit1.text;
      IBQArqpag.ParamByName('REFER').AsString:=wcontato;
      IBQArqpag.ParamByName('NOME').AsString:=wnome;
      IBQArqpag.ParamByName('ENDE').AsString:=wendereco;
      IBQArqpag.ParamByName('HORAIN').AsString:=whoraini;
      IBQArqpag.ParamByName('HORAFIN').AsString:=whorafin;
      IBQArqpag.ExecSql;
      IBQArqpag.Close;
    end;
    DModRosa.IBQVer_cli.Next;
  end;
  DModRosa.IBQVer_cli.Close;

  Progresso(ProgressBar1);
end;

end.
