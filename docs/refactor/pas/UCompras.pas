unit UCompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.StdCtrls, Data.DB, Vcl.ComCtrls, IBX.IBTable, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TFrmCompras = class(TForm)
    Label16: TLabel;
    GroupBox1: TGroupBox;
    RichEdit2: TRichEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    ComboBox1: TComboBox;
    Edit4: TEdit;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit8: TEdit;
    Edit1: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit7: TEdit;
    ComboBox3: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox2: TComboBox;
    Edit3: TEdit;
    Edit9: TEdit;
    ComboBox4: TComboBox;
    Edit17: TEdit;
    Edit6: TEdit;
    Edit10: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    IBQAuxconta: TIBQuery;
    IBQAuxitens: TIBQuery;
    IBQAuxcont: TIBQuery;
    IBTAuxconta: TIBTable;
    IBTAuxitens: TIBTable;
    DtsAuxcont: TDataSource;
    IBTAuxcontaDATEMIS: TDateField;
    IBTAuxcontaTIPDOC: TIBStringField;
    IBTAuxcontaNUMDOC: TIBStringField;
    IBTAuxcontaPARCEL: TIBStringField;
    IBTAuxcontaHISTOR: TIBStringField;
    IBTAuxcontaOBSERV: TIBStringField;
    IBTAuxcontaVALOR: TIBBCDField;
    IBTAuxcontaTIPCOB: TIBStringField;
    IBTAuxcontaNUMCOB: TIBStringField;
    IBTAuxcontaORICOB: TIBStringField;
    IBTAuxcontaDATVENC: TDateField;
    IBTAuxcontaSINAL: TIBStringField;
    IBTAuxcontaSIGLA: TIBStringField;
    IBTAuxcontaSITU: TIBStringField;
    IBTAuxcontaDATPAG: TIBStringField;
    IBTAuxcontaVENDE: TIBStringField;
    IBTAuxcontaACOMIS: TIBBCDField;
    IBTAuxcontaCOMISS: TIBBCDField;
    IBTAuxcontaDATBAX: TIBStringField;
    IBTAuxcontaOPEROU: TIBStringField;
    IBQAuxcontaDATEMIS: TDateField;
    IBQAuxcontaTIPDOC: TIBStringField;
    IBQAuxcontaNUMDOC: TIBStringField;
    IBQAuxcontaPARCEL: TIBStringField;
    IBQAuxcontaHISTOR: TIBStringField;
    IBQAuxcontaOBSERV: TIBStringField;
    IBQAuxcontaVALOR: TIBBCDField;
    IBQAuxcontaTIPCOB: TIBStringField;
    IBQAuxcontaNUMCOB: TIBStringField;
    IBQAuxcontaORICOB: TIBStringField;
    IBQAuxcontaDATVENC: TDateField;
    IBQAuxcontaSINAL: TIBStringField;
    IBQAuxcontaSIGLA: TIBStringField;
    IBQAuxcontaSITU: TIBStringField;
    IBQAuxcontaDATPAG: TIBStringField;
    IBQAuxcontaVENDE: TIBStringField;
    IBQAuxcontaACOMIS: TIBBCDField;
    IBQAuxcontaCOMISS: TIBBCDField;
    IBQAuxcontaDATBAX: TIBStringField;
    IBQAuxcontaOPEROU: TIBStringField;
    IBQAuxcontDATEMIS: TDateField;
    IBQAuxcontTIPDOC: TIBStringField;
    IBQAuxcontNUMDOC: TIBStringField;
    IBQAuxcontPARCEL: TIBStringField;
    IBQAuxcontHISTOR: TIBStringField;
    IBQAuxcontOBSERV: TIBStringField;
    IBQAuxcontVALOR: TIBBCDField;
    IBQAuxcontTIPCOB: TIBStringField;
    IBQAuxcontNUMCOB: TIBStringField;
    IBQAuxcontORICOB: TIBStringField;
    IBQAuxcontDATVENC: TDateField;
    IBQAuxcontSINAL: TIBStringField;
    IBQAuxcontSIGLA: TIBStringField;
    IBQAuxcontSITU: TIBStringField;
    IBQAuxcontDATPAG: TIBStringField;
    IBQAuxcontVENDE: TIBStringField;
    IBQAuxcontACOMIS: TIBBCDField;
    IBQAuxcontCOMISS: TIBBCDField;
    IBQAuxcontDATBAX: TIBStringField;
    IBQAuxcontOPEROU: TIBStringField;
    RichEdit1: TRichEdit;
    RichEdit3: TRichEdit;
    DBGrid1: TDBGrid;
    IBTAuxitensITEM: TIBStringField;
    IBTAuxitensPEDIDO: TIBStringField;
    IBTAuxitensCODART: TIBStringField;
    IBTAuxitensDESCRICAO: TIBStringField;
    IBTAuxitensQUANT: TIntegerField;
    IBTAuxitensCUSTO: TIBBCDField;
    IBTAuxitensQTDANT: TIntegerField;
    IBTAuxitensCUSANT: TIBBCDField;
    IBTAuxitensDESCON: TIBBCDField;
    IBTAuxitensTAMANHO: TIBStringField;
    IBTAuxitensCOR: TIBStringField;
    IBTAuxitensOPER: TIBStringField;
    IBQAuxitensITEM: TIBStringField;
    IBQAuxitensPEDIDO: TIBStringField;
    IBQAuxitensCODART: TIBStringField;
    IBQAuxitensDESCRICAO: TIBStringField;
    IBQAuxitensQUANT: TIntegerField;
    IBQAuxitensCUSTO: TIBBCDField;
    IBQAuxitensQTDANT: TIntegerField;
    IBQAuxitensCUSANT: TIBBCDField;
    IBQAuxitensDESCON: TIBBCDField;
    IBQAuxitensTAMANHO: TIBStringField;
    IBQAuxitensCOR: TIBStringField;
    IBQAuxitensOPER: TIBStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure MaskEdit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure ComboBox2Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure ComboBox4Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit18Exit(Sender: TObject);
    procedure Edit19Exit(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
    procedure Edit16Exit(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Estokar;
    procedure Achar_item;
    procedure Limpando;
    procedure Cob_imp;
    procedure List_cob;
    procedure Fecha_nota;
    procedure Achar_num;
    function ExisteForm(pForm: TForm): Boolean;
  end;

var
  FrmCompras: TFrmCompras;
   wopera,wempresa,wendereco,wtelefone,winscricoes,wnumnot,wcodart: string;
  xcodi,chvpv,wcodigo,wdescricao,chvtem,chvachou,woper,witens,wsitu: string;
  wtotnot,wtotqtd,wtotpro,wqtda: Extended;
  xtotpro,xqtda,wpreco,xestoq,ztotnot: Extended;
  I,Q,P,V,T,D,G,W,wtaman,wcor,zoper,wnumped,chvoper: String;
  xitens,zparcela,xparcela,xnumped: Integer;

implementation

{$R *.dfm}

uses UDModRosa;

function TFrmCompras.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmCompras.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCompras.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmCompras.FormShow(Sender: TObject);
begin
  chvoper:='I';
  edit1.Clear;
  edit3.Clear;
  edit4.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.text:=FormatFloat('#0.0',0);
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit3.Clear;
  maskedit4.Clear;
  maskedit5.Clear;
  edit15.text:=FormatFloat('#0.0',0);
  edit16.text:=FormatFloat('##,##0.00',0);
  edit17.text:=FormatFloat('##,##0.00',0);
  edit18.text:=FormatFloat('##,##0.00',0);
  edit19.text:=FormatFloat('##,##0.00',0);
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit3.Clear;
  Achar_num;
  ComboBox1.ItemIndex:=0;
  Combobox2.itemindex:=-1;
  Combobox3.itemIndex:=-1;
  Combobox4.itemIndex:=-1;
  edit4.SetFocus;
  exit;
end;

procedure TFrmCompras.ComboBox1Exit(Sender: TObject);
begin
  if (ComboBox1.text='PED') or
     (ComboBox1.text='NOT') or
     (ComboBox1.text='FAB') or
     (ComboBox1.text='OUT') then
  begin
    edit4.SetFocus;
    exit;
  end;
  showmessage('Erro no Tipo do documento !!!!');
  ComboBox1.ItemIndex:=-1;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmCompras.ComboBox2Exit(Sender: TObject);
begin
  if ComboBox2.text='FAB' then
  begin
    edit10.SetFocus;
    exit;
  end;
end;

procedure TFrmCompras.ComboBox4Exit(Sender: TObject);
begin
  if ComboBox4.ItemIndex=(-1) then
  begin
    showmessage('Informe o tipo de Cobrança');
    ComboBox4.SetFocus;
    exit;
  end;
  if ComboBox4.ItemIndex=0 then
  begin
    edit9.Text:=edit6.Text;
    maskedit5.text:=maskedit3.text;
    edit17.SetFocus;
    exit;
  end;
  if ComboBox4.ItemIndex=1 then
  begin
    edit9.Text:=edit4.Text;
    maskedit5.Text:=Maskedit1.Text;
    edit17.SetFocus;
    exit;
  end;
  if ComboBox4.ItemIndex=4 then
  begin
    edit9.Text:=edit6.text;
    maskedit5.setFocus;
    exit;
  end;
end;

procedure TFrmCompras.Edit10Exit(Sender: TObject);
begin
  xparcela:=0;
  zparcela:=0;
  if edit10.text<' ' then
  begin
    showmessage('Informe o parcelamento !!!');
    edit10.SetFocus;
    exit;
  end;
  While Length(edit10.text)<2 do
        edit10.text:='0'+edit10.text;
  xparcela:=StrToInt(edit10.Text);
  ztotnot:=wtotnot/xparcela;
  zparcela:=1;
  edit3.Text:=IntToStr(zparcela);
  While Length(edit3.Text)<2 do
      edit3.Text := '0'+ edit3.Text;
  edit17.Text:=FormatFloat('#######0.00',ztotnot);
  DBGrid1.Visible:=True;
  if combobox1.text='FAB' then
  begin
    Combobox4.Text:='OUT';
    edit9.Text:=edit4.Text;
    maskedit5.Text:=maskedit2.Text;
    edit17.SetFocus;
    exit;
  end;
  edit3.SetFocus;
  exit;
end;

procedure TFrmCompras.Edit15Exit(Sender: TObject);
begin
  wqtda:=StrToFloat(edit15.Text);
  if wqtda<1 then
  begin
    showmessage('Quantidade incorreta');
    Limpando;
    exit;
  end;
end;

procedure TFrmCompras.Edit16Exit(Sender: TObject);
begin
  // Atualiza Operacao ***********************
  if chvachou='E' then
  begin
    IBQAuxitens.Sql.Clear;
    IBQAuxitens.Sql.Add('Update AUXITCOM ');
    IBQAuxitens.Sql.Add('Set OPER=:op_digit,'+
                        'QUANT=:qtd_digit,'+
                        'CUSTO=:pre_digit '+
                        'Where ITEM=:ite_digit');
    IBQAuxitens.ParamByName('op_digit').AsString:='E';
    IBQAuxitens.ParamByName('qtd_digit').AsFloat:=0;
    IBQAuxitens.ParamByName('pre_digit').AsFloat:=0;
    IBQAuxitens.ParamByName('ite_digit').AsString:=witens;
    IBQAuxitens.ExecSql;
    IBQAuxitens.Close;
  end;
  if chvachou='A' then
  begin
    IBQAuxitens.Sql.Clear;
    IBQAuxitens.Sql.Add('Update AUXITCOM ');
    IBQAuxitens.Sql.Add('Set QUANT=:qtd_digit,'+
                        'CUSTO=:pre_digit,'+
                        'OPER=:op_digit '+
                        'Where ITEM=:ite_digit');
    IBQAuxitens.ParamByName('qtd_digit').AsFloat:=StrToFloat(edit15.text);
    IBQAuxitens.ParamByName('pre_digit').AsFloat:=StrToFloat(edit16.Text);
    IBQAuxitens.ParamByName('op_digit').AsString:='A';
    IBQAuxitens.ParamByName('ite_digit').AsString:=witens;
    IBQAuxitens.ExecSql;
    IBQAuxitens.Close;
  end;
  if chvachou='I' then
  begin
    if IBQAuxitens.Active then
       IBQAuxitens.Active:=False;
    IBQAuxitens.Sql.Clear;
    IBQAuxitens.Sql.Add('Insert Into AUXITCOM ');
    IBQAuxitens.Sql.Add('(ITEM,PEDIDO,CODART,DESCRICAO,QUANT,CUSTO,'+
                        'QTDANT,CUSANT,DESCON,TAMANHO,COR,OPER) '+
                'Values(:ITEM,:PEDIDO,:CODART,:DESCRICAO,:QUANT,:CUSTO,'+
                       ':QTDANT,:CUSANT,:DESCON,:TAMANHO,:COR,:OPER)');
    IBQAuxitens.ParamByName('ITEM').AsString:=witens;
    IBQAuxitens.ParamByName('PEDIDO').AsString:=edit4.Text;
    IBQAuxitens.ParamByName('CODART').AsString:=edit7.text;
    IBQAuxitens.ParamByName('DESCRICAO').AsString:=edit8.text;
    IBQAuxitens.ParamByName('QUANT').AsFloat:=StrToFloat(edit15.Text);
    IBQAuxitens.ParamByName('CUSTO').AsFloat:=StrToFloat(edit16.Text);
    IBQAuxitens.ParamByName('QTDANT').AsFloat:=0;
    IBQAuxitens.ParamByName('CUSANT').AsFloat:=0;
    IBQAuxitens.ParamByName('DESCON').AsFloat:=0;
    IBQAuxitens.ParamByName('TAMANHO').AsString:=Combobox3.text;
    IBQAuxitens.ParamByName('COR').AsString:=edit1.text;
    IBQAuxitens.ParamByName('OPER').AsString:='I';
    IBQAuxitens.ExecSql;
    IBQAuxitens.Close;
  end;
  // Monta lista de produtos *********************
  chvpv:='';
  wtotpro:=0;
  wtotqtd:=0;
  wtotnot:=0;
  IBQAuxitens.Close;
  IBQAuxitens.SQL.Clear;
  IBQAuxitens.SQL.Add('Select * from AUXITCOM '+
                      'Where OPER<>:op_digit '+
                      'Order by ITEM');
  IBQAuxitens.ParamByName('op_digit').AsString:='E';
  IBQAuxitens.Active:=True;
  IBQAuxitens.DisableControls;
  IBQAuxitens.First;
  while not IBQAuxitens.Eof do
  begin
    witens:=IBQAuxitens.fieldbyName('Item').AsString;
    wcodigo:=IBQAuxitens.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxitens.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxitens.fieldbyName('Quant').AsFloat;
    wpreco:=IBQAuxitens.fieldbyName('Custo').AsFloat;
    wtaman:=IBQAuxitens.fieldbyName('Tamanho').AsString;
    wcor:=IBQAuxitens.fieldbyName('Cor').AsString;
    wtotpro:=wqtda*wpreco;
    wtotqtd:=wtotqtd+wqtda;
    wtotnot:=wtotnot+wtotpro;
    if chvpv='' then
    begin
      chvpv:='1';
      Richedit1.Clear;
      Richedit2.Clear;
      Richedit3.Clear;
      Richedit3.Lines.Add('Item  Prod.                  Descrição / Tamanho e Cor                                    Quant    Custo    Total');
    end;
    Q:=FormatFloat('##0',wqtda);
    P:=FormatFloat('###,##0.00',wpreco);
    V:=FormatFloat('####,###,##0.00',wtotpro);
    W:=StringofChar(#32,40-Length(wdescricao));
    Richedit1.Lines.Add(witens+'  '+wcodigo+'   '+wdescricao+'  /  '+wtaman+' - '+wcor);
    Richedit2.Lines.Add(StringofChar(#32,9-Length(Q))+(Q)+
                        StringofChar(#32,9-Length(P))+(P)+
                        StringofChar(#32,10-Length(V))+(V));
    IBQAuxitens.Next;
  end;
  IBQAuxitens.Close;
  Richedit1.Lines.Add('            ');
  Richedit1.Lines.Add('            ');
  D:=FormatFloat('####0',wtotqtd);
  G:=FormatFloat('#####0.00',wtotnot);
  Richedit2.Lines.Add('            ');
  Richedit2.Lines.Add('          TOTAIS');
  Richedit2.Lines.Add('  QUANTIDADES  '+StringofChar(#32,8-Length(D))+(D));
  Richedit2.Lines.Add('  SUB TOTAL '+StringofChar(#32,12-Length(G))+(G));
  edit7.text:='';
  edit8.Clear;
  edit1.Clear;
  edit15.Text:=Formatfloat('##0.0',0);
  edit16.Text:=FormatFloat('####0.00',0.00);
  Combobox3.ItemIndex:=-1;
  edit7.SetFocus;
  exit;
end;

procedure TFrmCompras.Edit17Exit(Sender: TObject);
begin
  if edit17.text>'0' then
  begin
    Cob_imp;
    List_cob;
    zparcela:=zparcela+1;
    while zparcela<=xparcela do
    begin
      maskedit5.Clear;
      edit3.Text:=IntToStr(zparcela);
      if Length(edit3.Text)<2 then
         edit3.Text:='0'+edit3.Text;
      Combobox4.Setfocus;
      exit;
    end;
    Fecha_nota;
    Limpando;
    exit;
  end else
  begin
    ShowMessage('Bata o valor da parcela');
    edit17.SetFocus;
    exit;
  end;
end;

procedure TFrmCompras.Edit18Exit(Sender: TObject);
begin
  G:=edit18.text;
  Richedit2.Lines.Add('  FRETE           '+StringofChar(#32,15-Length(G))+(G));
end;

procedure TFrmCompras.Edit19Exit(Sender: TObject);
begin
  G:=edit19.text;
  Richedit2.Lines.Add('  DESCONTO  '+StringofChar(#32,15-Length(G))+(G));
  wtotnot:=wtotnot+StrToFloat(edit18.Text);
  wtotnot:=wtotnot-StrToFloat(edit19.Text);
  V:=FormatFloat('#####0.00',wtotnot);
  Richedit2.Lines.Add('  VALOR TOTAL'+StringofChar(#32,15-Length(V))+(V));
end;

procedure TFrmCompras.Edit2Exit(Sender: TObject);
begin
  if edit2.text='' then
  begin
    showmessage('Informe Marca do Fornecedor !!!');
    edit2.SetFocus;
    exit;
  end;
  if ComboBox1.text='FAB' then
  begin
    Combobox2.Text:='FAB';
    edit6.Text:=edit4.Text;
    maskedit3.Text:=maskedit1.Text;
    maskedit4.Text:=maskedit2.Text;
    edit18.Text:=FormatFloat('####0.00',0);
    edit19.Text:=FormatFloat('####0.00',0);
    edit10.Text:='01';
  end;
end;

procedure TFrmCompras.Edit3Exit(Sender: TObject);
begin
  if edit3.Text<>'' then
  begin
    While Length(edit3.text)<2 do
          edit3.text:='0'+edit3.text;
    if IBQAuxconta.Active then
       IBQAuxconta.Active:=False;
    IBQAuxconta.Sql.Clear;
    IBQAuxconta.Sql.Add('Select * from AUXCONTA '+
                       'Where Tipdoc=:tip_digit '+
                       'and Numdoc=:num_digit '+
                       'and Parcel=:parc_digit');
    IBQAuxconta.ParamByName('tip_digit').AsString:=ComboBox4.Text;
    IBQAuxconta.ParamByName('num_digit').AsString:=edit9.Text;
    IBQAuxconta.ParamByName('parc_digit').AsString:=edit3.Text;
    IBQAuxconta.Active:=True;
    if IBQAuxconta.RecordCount>0 then
    begin
      IBQAuxconta.Close;
      showMessage('Parcela em duplicidade. !');
      List_cob;
      edit3.Clear;
      maskedit5.Clear;
      edit17.Clear;
      edit3.SetFocus;
      exit;
    end;
    ComboBox4.SetFocus;
    exit;
  end;
end;

procedure TFrmCompras.Edit4Exit(Sender: TObject);
begin
   if edit4.Text='' then
  begin
    ShowMessage('Numero do documento ????');
    edit4.Clear;
    edit4.SetFocus;
    exit;
  end;
  // Preencher a chave com zeros a esquerda
  While Length(edit4.Text)<8 do
        edit4.Text := '0'+ edit4.Text;
  wtotqtd:=0;
  wtotpro:=0;
  wtotnot:=0;
  IBTAuxitens.EmptyTable;
  IBTAuxconta.EmptyTable;
  DModRosa.IBQLer_comp.Close;
  DModRosa.IBQLer_comp.SQL.Clear;
  DModRosa.IBQLer_comp.SQL.Add('Select * from COMPRA '+
                               'Where Tipped=:tip_digit '+
                               'and Numped=:doc_digit');
  DModRosa.IBQLer_comp.ParamByName('tip_digit').AsString:=ComboBox1.text;
  DModRosa.IBQLer_comp.ParamByName('doc_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_comp.OPen;
  if DModRosa.IBQLer_comp.RecordCount>0 then
  begin
    // Monta Relaçao dos produtos
    edit6.Text:=DModRosa.IBQLer_comp.FieldByName('Numnot').AsString;;
    ComboBox2.Text:=DModRosa.IBQLer_comp.fieldByname('Tipnot').AsString;
    edit18.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_comp.fieldByName('Frete').AsFloat);
    edit19.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_comp.fieldByName('Descon').AsFloat);
    edit10.Text:=DModRosa.IBQLer_comp.FieldByName('Parcel').AsString;
    maskedit1.Text:=DateToStr(DModRosa.IBQLer_comp.fieldbyName('Datped').AsDateTime);
    maskedit2.Text:=DateToStr(DModRosa.IBQLer_comp.fieldbyName('Entreg').AsDateTime);
    maskedit3.Text:=DateToStr(DModRosa.IBQLer_comp.fieldbyName('Datped').AsDateTime);
    maskedit4.Text:=DateToStr(DModRosa.IBQLer_comp.fieldbyName('Entreg').AsDateTime);
    edit2.Text:=DModRosa.IBQLer_comp.fieldbyName('Fornec').AsString;
    wsitu:=DModRosa.IBQLer_comp.fieldbyName('Sitped').AsString;
    Richedit3.Lines.Add('Item  Prod.                  Descrição / Tamanho e Cor                                    Quant    Custo    Total');
    DModRosa.IBQLer_itcomp.Close;
    DModRosa.IBQLer_itcomp.SQL.Clear;
    DModRosa.IBQLer_itcomp.SQL.Add('Select * from ITEMCOMPRA '+
                                   'Where Tipped=:tip_digit '+
                                   'and Numped=:ped_digit '+
                                   'Order by Item');
    DModRosa.IBQLer_itcomp.ParamByName('tip_digit').AsString:=ComboBox1.Text;
    DModRosa.IBQLer_itcomp.ParamByName('ped_digit').AsString:=edit4.Text;
    DModRosa.IBQLer_itcomp.Active:=True;
    DModRosa.IBQLer_itcomp.DisableControls;
    DModRosa.IBQLer_itcomp.First;
    while not DModRosa.IBQLer_itcomp.Eof do
    begin
      witens:=DModRosa.IBQLer_itcomp.fieldbyName('Item').AsString;
      wcodigo:=DModRosa.IBQLer_itcomp.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQLer_itcomp.fieldbyName('Descricao').AsString;
      wqtda:=DModRosa.IBQLer_itcomp.fieldbyName('Quant').AsFloat;
      wpreco:=DModRosa.IBQLer_itcomp.fieldbyName('Precom').AsFloat;
      wtaman:=DModRosa.IBQLer_itcomp.fieldbyName('Tamanho').AsString;
      wcor:=DModRosa.IBQLer_itcomp.fieldbyName('Cor').AsString;
      if IBQAuxitens.Active then
         IBQAuxitens.Active:=False;
      IBQAuxitens.Sql.Clear;
      IBQAuxitens.Sql.Add('Insert Into AUXITCOM ');
      IBQAuxitens.Sql.Add('(ITEM,PEDIDO,CODART,DESCRICAO,QUANT,CUSTO,'+
                          'QTDANT,CUSANT,DESCON,TAMANHO,COR,OPER) '+
                  'Values(:ITEM,:PEDIDO,:CODART,:DESCRICAO,:QUANT,:CUSTO,'+
                         ':QTDANT,:CUSANT,:DESCON,:TAMANHO,:COR,:OPER)');
      IBQAuxitens.ParamByName('ITEM').AsString:=witens;
      IBQAuxitens.ParamByName('PEDIDO').AsString:=edit4.Text;
      IBQAuxitens.ParamByName('CODART').AsString:=wcodigo;
      IBQAuxitens.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQAuxitens.ParamByName('QUANT').AsFloat:=wqtda;
      IBQAuxitens.ParamByName('CUSTO').AsFloat:=wpreco;
      IBQAuxitens.ParamByName('QTDANT').AsFloat:=wqtda;
      IBQAuxitens.ParamByName('CUSANT').AsFloat:=wpreco;
      IBQAuxitens.ParamByName('DESCON').AsFloat:=0;
      IBQAuxitens.ParamByName('TAMANHO').AsString:=wtaman;
      IBQAuxitens.ParamByName('COR').AsString:=wcor;
      IBQAuxitens.ParamByName('OPER').AsString:='';
      IBQAuxitens.ExecSql;
      IBQAuxitens.Close;
      wtotpro:=wqtda*wpreco;
      wtotqtd:=wtotqtd+wqtda;
      wtotnot:=wtotnot+wtotpro;
      Q:=FormatFloat('##0',wqtda);
      P:=FormatFloat('###,##0.00',wpreco);
      V:=FormatFloat('####,##0.00',wtotpro);
      W:=StringofChar(#32,40-Length(wdescricao));
      Richedit1.Lines.Add(witens+'  '+wcodigo+'   '+wdescricao+'  /  '+wtaman+' - '+wcor);
      Richedit2.Lines.Add(StringofChar(#32,9-Length(Q))+(Q)+
                          StringofChar(#32,9-Length(P))+(P)+
                          StringofChar(#32,10-Length(V))+(V));
      DModRosa.IBQLer_itcomp.Next;
    end;
    DModRosa.IBQLer_itcomp.Close;
    D:=FormatFloat('####0',wtotqtd);
    G:=FormatFloat('###0.00',wtotnot);
    Richedit2.Lines.Add('            ');
    Richedit2.Lines.Add('          TOTAIS');
    Richedit2.Lines.Add('  QUANTIDADES  '+StringofChar(#32,8-Length(D))+(D));
    Richedit2.Lines.Add('  SUB TOTAL '+StringofChar(#32,12-Length(G))+(G));
    if wsitu='R' then
    begin
     { if MessageDlg('Pedido ja foi recebido !'+ Chr(13)+
                'Deseja alterar o pedido ??',
                 mtWarning,[mbYes,mbNo],0) = mrYes then
      begin;
        chvoper:='A';
        edit7.SetFocus;
        exit;
      end;}
      showmessage('Pedido ja foi recebido  !!!!');
      Limpando;
      exit;
    end;
    zoper:='R';
    Achar_item;
    DModRosa.IBQLer_comp.Close;
    maskedit1.SetFocus;
    exit;
  end else
  begin
    if MessageDlg('Documento não encontrada deseja implantar ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      zoper:='I';
      Achar_item;
      maskedit1.SetFocus;
      exit;
    end;
  end;
  DModRosa.IBQLer_comp.Close;
  Limpando;
end;

procedure TFrmCompras.Edit6Exit(Sender: TObject);
begin
  While Length(edit6.text)<8 do
        edit6.text:='0'+edit6.text;
end;

procedure TFrmCompras.Edit7Exit(Sender: TObject);
begin
  if edit7.text='' then
  begin
    Combobox2.SetFocus;
    exit;
  end;
  chvachou:='';
  IBQAuxitens.Close;
  IBQAuxitens.SQL.Clear;
  IBQAuxitens.SQL.Add('Select * from AUXITCOM '+
                      'Where Codart=:cod_digit');
  IBQAuxitens.ParamByName('cod_digit').AsString:=edit7.Text;
  IBQAuxitens.Active:=True;
  if IBQAuxitens.RecordCount>0 then
  begin
    witens:=IBQAuxitens.fieldbyName('Item').AsString;
    edit8.Text:=IBQAuxitens.fieldbyName('Descricao').AsString;
    edit15.Text:=FormatFloat('###0',IBQAuxitens.fieldbyName('Quant').AsFloat);
    edit16.Text:=FormatFloat('#,##0.00',IBQAuxitens.fieldbyName('Custo').AsFloat);
    Combobox3.Text:=IBQAuxitens.fieldbyName('Tamanho').AsString;
    edit1.Text:=IBQAuxitens.fieldbyName('Cor').AsString;
    wqtda:=IBQAuxitens.fieldbyName('Quant').AsFloat;
    IBQAuxitens.Close;
    if MessageDlg('Item encontrado. Deseja alterar ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      chvachou:='A';
      ComboBox3.SetFocus;
      exit;
    end;
    if MessageDlg('Item encontrado. Deseja excluir ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      chvachou:='E';
      edit16.SetFocus;
      exit;
    end;
  end else
  begin
    IBQAuxitens.Close;
    DModRosa.IBQLer_art.Close;
    DModRosa.IBQLer_art.SQL.Clear;
    DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                'Where Codigo=:cod_digit');
    DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=edit7.Text;
    DModRosa.IBQLer_art.OPen;
    if DModRosa.IBQLer_art.RecordCount>0 then
    begin
      Achar_item;
      chvachou:='I';
      edit8.Text:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
      edit16.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Precom').AsFloat);
      DModRosa.IBQLer_art.Close;
      Combobox3.SetFocus;
      exit;
    end;
    DModRosa.IBQLer_art.Close;
    showMessage('Artigo não cadastrado');
  end;
  edit7.text:='';
  edit7.SetFocus;
  exit;
end;

procedure TFrmCompras.Edit9Exit(Sender: TObject);
begin
  // Preencher a chave com zeros a esquerda
  While Length(edit9.Text)<8 do
        edit9.Text := '0'+ edit9.Text;
end;

procedure TfrmCompras.Estokar;
begin
  chvtem:='';
  //   Restaura Estoque do Artigo ******
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Where Codigo=:cod_digit');
  DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=wcodigo;
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount>0 then
  begin
    chvtem:='1';
    xestoq:=DModRosa.IBQLer_ART.fieldbyName('Estoq').AsFloat;
    xestoq:=xestoq+wqtda;
  end;
  DModRosa.IBQLer_art.Close;
  if chvtem='1' then
  begin
    DModRosa.IBQVer_art.Close;
    DModRosa.IBQVer_art.Sql.Clear;
    DModRosa.IBQVer_art.SqL.Add('Update ARTIGO ');
    DModRosa.IBQVer_art.Sql.Add('Set ESTOQ=:ESTOQ,'+
                                'PRECOM=:pre_digit '+
                                'Where CODIGO=:CODIGO');
    DModRosa.IBQVer_art.ParamByName('ESTOQ').AsFloat:=xestoq;
    DModRosa.IBQVer_art.ParamByName('pre_digit').AsFloat:=wpreco;
    DModRosa.IBQVer_art.ParamByName('CODIGO').AsString:=wcodigo;
    DModRosa.IBQVer_art.ExecSql;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_art.Close;
  end;
end;

procedure TFrmCompras.Achar_item;
begin
  witens:='';
  xitens:=0;
  if IBQAuxitens.Active then
     IBQAuxitens.Active:=False;
  IBQAuxitens.Sql.Clear;
  IBQAuxitens.Sql.Add('Select * from AUXITCOM '+
                      'Order by Item');
  IBQAuxitens.Active:=True;
  if IBQAuxitens.RecordCount>0 then
  begin
    IBQAuxitens.Last;
    xitens:=StrToInt(IBQAuxitens.fieldbyName('Item').AsString);
  end;
  IBQAuxitens.Close;
  xitens:=xitens+1;
  witens:=IntToStr(xitens);
  While Length(witens)<3 do
        witens:='0'+witens;
end;

procedure TFrmCompras.Limpando;
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit7.text:='';
  edit8.Clear;
  edit9.Clear;
  edit10.Text:=FormatFloat('#0.0',0);
  maskedit1.Clear;
  maskedit2.Clear;
  maskedit3.Clear;
  maskedit4.Clear;
  maskedit5.Clear;
  edit15.text:=FormatFloat('#0.0',0);
  edit16.Text:=FormatFloat('##,##0.00',0);
  edit17.Text:=FormatFloat('####0.00',0);
  edit18.Text:=FormatFloat('####0.00',0);
  edit19.Text:=FormatFloat('####0.00',0);
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit3.Clear;
  IBQAuxcont.Close;
  DBGrid1.Visible:=False;
  ComboBox1.ItemIndex:=-1;
  Combobox2.itemindex:=-1;
  Combobox3.itemIndex:=-1;
  Combobox4.itemIndex:=-1;
  Modalresult:=-1;
  exit;
end;

procedure TFrmCompras.Cob_imp;
begin
  if edit3.text>'0' then
  begin
    if IBQAuxconta.Active then
       IBQAuxconta.Active:=False;
    IBQAuxconta.Sql.Clear;
    IBQAuxconta.Sql.Add('Insert Into AUXCONTA ');
    IBQAuxconta.Sql.Add('(DATEMIS,TIPDOC,NUMDOC,PARCEL,HISTOR,OBSERV,VALOR,'+
                         'TIPCOB,NUMCOB,ORICOB,DATVENC,SINAL,SIGLA,SITU,DATPAG,'+
                         'VENDE,ACOMIS,COMISS,DATBAX,OPEROU) '+
                 'Values(:DATEMIS,:TIPDOC,:NUMDOC,:PARCEL,:HISTOR,:OBSERV,:VALOR,'+
                        ':TIPCOB,:NUMCOB,:ORICOB,:DATVENC,:SINAL,:SIGLA,:SITU,:DATPAG,'+
                        ':VENDE,:ACOMIS,:COMISS,:DATBAX,:OPEROU)');
    IBQAuxconta.ParamByName('DATEMIS').AsDateTime:=StrToDate(maskedit3.Text);
    IBQAuxconta.ParamByName('TIPDOC').AsString:=ComboBox4.Text;
    IBQAuxconta.ParamByName('NUMDOC').AsString:=edit9.Text;
    IBQAuxconta.ParamByName('PARCEL').AsString:=edit3.Text;
    IBQAuxconta.ParamByName('HISTOR').AsString:='Compra de Artigos';
    IBQAuxconta.ParamByName('OBSERV').AsString:=edit2.Text;
    IBQAuxconta.ParamByName('VALOR').AsFloat:=StrToFloat(edit17.Text);
    IBQAuxconta.ParamByName('TIPCOB').AsString:=ComboBox2.Text;
    IBQAuxconta.ParamByName('NUMCOB').AsString:=edit6.Text;
    IBQAuxconta.ParamByName('ORICOB').AsString:='CAIXA';
    IBQAuxconta.ParamByName('DATVENC').AsDateTime:=StrToDate(maskedit5.Text);
    IBQAuxconta.ParamByName('SINAL').AsString:='D';
    IBQAuxconta.ParamByName('SIGLA').AsString:='PAG';
    IBQAuxconta.ParamByName('SITU').AsString:='';
    IBQAuxconta.ParamByName('DATPAG').AsString:='';
    IBQAuxconta.ParamByName('DATBAX').AsString:='';
    if (Combobox4.text='CHE') or
       (Combobox4.text='DIN') or
       (Combobox4.text='CAR') then
    begin
      IBQAuxconta.ParamByName('SITU').AsString:='B';
      IBQAuxconta.ParamByName('DATPAG').AsString:=maskedit5.Text;
      IBQAuxconta.ParamByName('DATBAX').AsString:=DateToStr(Date());
    end;
    IBQAuxconta.ParamByName('VENDE').AsString:='';
    IBQAuxconta.ParamByName('ACOMIS').AsFloat:=0;
    IBQAuxconta.ParamByName('COMISS').AsFloat:=0;
    IBQAuxconta.ParamByName('OPEROU').AsString:='SEARCH';
    IBQAuxconta.ExecSql;
  end;
end;

procedure TFrmCompras.MaskEdit1Exit(Sender: TObject);
begin
   if Combobox1.text='FAB' then
     maskedit2.Text:=maskedit1.Text;
end;

procedure TFrmCompras.List_cob;
begin
  if IBQAuxcont.Active then
     IBQAuxcont.Active:=False;
  IBQAuxcont.Sql.Clear;
  IBQAuxcont.Sql.Add('Select * from AUXCONTA '+
                     'Order by DATVENC,TIPDOC,NUMDOC');
  IBQAuxcont.Active:=True;
end;

procedure TFrmCompras.Fecha_nota;
begin
  wtotnot:=0;
  IBQAuxitens.Close;
  IBQAuxitens.SQL.Clear;
  IBQAuxitens.SQL.Add('Select * from AUXITCOM '+
                      'Order by ITEM');
  IBQAuxitens.Active:=True;
  IBQAuxitens.DisableControls;
  IBQAuxitens.First;
  while not IBQAuxitens.Eof do
  begin
    witens:=IBQAuxitens.fieldbyName('Item').AsString;
    wnumnot:=IBQAuxitens.fieldbyName('Pedido').AsString;
    wcodigo:=IBQAuxitens.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxitens.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxitens.fieldbyName('Quant').AsFloat;
    xqtda:=IBQAuxitens.fieldbyName('Qtdant').AsFloat;
    wpreco:=IBQAuxitens.fieldbyName('Custo').AsFloat;
    wtaman:=IBQAuxitens.fieldbyName('Tamanho').AsString;
    wcor:=IBQAuxitens.fieldbyName('Cor').AsString;
    woper:=IBQAuxitens.fieldbyName('Oper').AsString;
    if woper='E' then
    begin
      DModRosa.IBQVer_itcomp.Active:=False;
      DModRosa.IBQVer_itcomp.Sql.Clear;
      DModRosa.IBQVer_itcomp.SqL.Add('Delete from ITEMCOMPRA '+
                                     'Where TIPPED=:tip_digit '+
                                     'and NUMPED=:num_digit '+
                                     'and ITEM=:ite_digit');
      DModRosa.IBQVer_itcomp.ParamByName('tip_digit').AsString:=ComboBox1.text;
      DModRosa.IBQVer_itcomp.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itcomp.ParamByName('ite_digit').AsString:=witens;
      DModRosa.IBQVer_itcomp.Active:=True;
      DModRosa.IBQVer_itcomp.Active:=false;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_itcomp.Close;
    end else
    begin
      Estokar;
      wtotnot:=wtotnot+(wpreco*wqtda);
      if woper='A' then
      begin
        wtotnot:=wtotnot+(wpreco*wqtda);
        DModRosa.IBQVer_itcomp.Sql.Clear;
        DModRosa.IBQVer_itcomp.Sql.Add('Update ITEMCOMPRA ');
        DModRosa.IBQVer_itcomp.Sql.Add('Set QUANT=:qtd_digit,'+
                                       'PRECOM=:pre_digit,'+
                                       'VALART=:val_digit,'+
                                       'TAMANHO=:tan_digit,'+
                                       'COR=:cor_digit '+
                                       'Where TIPPED=:tip_digit '+
                                       'and NUMPED=:num_digit '+
                                       'and ITEM=:ite_digit');
        DModRosa.IBQVer_itcomp.ParamByName('qtd_digit').AsFloat:=wqtda;
        DModRosa.IBQVer_itcomp.ParamByName('pre_digit').AsFloat:=wpreco;
        DModRosa.IBQVer_itcomp.ParamByName('val_digit').AsFloat:=wpreco*wqtda;
        DModRosa.IBQVer_itcomp.ParamByName('tan_digit').AsString:=wtaman;
        DModRosa.IBQVer_itcomp.ParamByName('cor_digit').AsString:=wcor;
        DModRosa.IBQVer_itcomp.ParamByName('tip_digit').AsString:=ComboBox1.text;
        DModRosa.IBQVer_itcomp.ParamByName('num_digit').AsString:=wnumnot;
        DModRosa.IBQVer_itcomp.ParamByName('ite_digit').AsString:=witens;
        DModRosa.IBQVer_itcomp.ExecSql;
        DModRosa.IBQVer_itcomp.Close;
      end else
      begin
        if woper='I' then
        begin
          if DModRosa.IBQVer_itcomp.Active then
             DModRosa.IBQVer_itcomp.Active:=False;
          DModRosa.IBQVer_itcomp.Sql.Clear;
          DModRosa.IBQVer_itcomp.Sql.Add('Insert Into ITEMCOMPRA ');
          DModRosa.IBQVer_itcomp.Sql.Add('(TIPPED,NUMPED,ITEM,CODART,DESCRICAO,QUANT,'+
                                         'PRECOM,DESCON,VALART,TAMANHO,COR) '+
                                 'Values(:TIPPED,:NUMPED,:ITEM,:CODART,:DESCRICAO,:QUANT,'+
                                        ':PRECOM,:DESCON,:VALART,:TAMANHO,:COR)');
          DModRosa.IBQVer_itcomp.ParamByName('TIPPED').AsString:=ComboBox1.text;
          DModRosa.IBQVer_itcomp.ParamByName('NUMPED').AsString:=wnumnot;
          DModRosa.IBQVer_itcomp.ParamByName('ITEM').AsString:=witens;
          DModRosa.IBQVer_itcomp.ParamByName('CODART').AsString:=wcodigo;
          DModRosa.IBQVer_itcomp.ParamByName('DESCRICAO').AsString:=wdescricao;
          DModRosa.IBQVer_itcomp.ParamByName('QUANT').AsFloat:=wqtda;
          DModRosa.IBQVer_itcomp.ParamByName('PRECOM').AsFloat:=wpreco;
          DModRosa.IBQVer_itcomp.ParamByName('DESCON').AsFloat:=0;
          DModRosa.IBQVer_itcomp.ParamByName('VALART').AsFloat:=wpreco*wqtda;
          DModRosa.IBQVer_itcomp.ParamByName('TAMANHO').AsString:=wtaman;
          DModRosa.IBQVer_itcomp.ParamByName('COR').AsString:=wcor;
          DModRosa.IBQVer_itcomp.ExecSql;
          DModRosa.IBQVer_itcomp.Close;
        end;
      end;
    end;
    IBQAuxitens.Next;
  end;
  IBQAuxitens.Close;
  if wtotnot=0 then
  begin
    DModRosa.IBQVer_comp.Active:=False;
    DModRosa.IBQVer_comp.Sql.Clear;
    DModRosa.IBQVer_comp.SqL.Add('Delete from COMPRA '+
                                 'Where TIPPED=:tip_digit '+
                                 'and NUMPED=:num_digit');
    DModRosa.IBQVer_comp.ParamByName('tip_digit').AsString:=Combobox1.text;
    DModRosa.IBQVer_comp.ParamByName('num_digit').AsString:=edit4.text;
    DModRosa.IBQVer_comp.Active:=True;
    DModRosa.IBQVer_comp.Active:=false;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_comp.Close;
  end else
  begin
    if zoper='R' then
    begin
      DModRosa.IBQVer_comp.Sql.Clear;
      DModRosa.IBQVer_comp.Sql.Add('Update COMPRA ');
      DModRosa.IBQVer_comp.Sql.Add('Set ENTREG=:dat_digit,'+
                                   'FORNEC=:for_digit,'+
                                   'TOTPED=:tot_digit,'+
                                   'DATNOT=:dtn_digit,'+
                                   'TIPNOT=:tip_digit,'+
                                   'NUMNOT=:num_digit,'+
                                   'DESCON=:des_digit,'+
                                   'FRETE=:fre_digit,'+
                                   'VALNOT=:val_digit,'+
                                   'SITPED=:sit_digit,'+
                                   'PARCEL=:par_digit '+
                                   'Where TIPPED=:tped_digit '+
                                   'and NUMPED=:ped_digit');
      DModRosa.IBQVer_comp.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit4.text);
      DModRosa.IBQVer_comp.ParamByName('for_digit').AsString:=edit2.Text;
      DModRosa.IBQVer_comp.ParamByName('tot_digit').AsFloat:=wtotnot;
      DModRosa.IBQVer_comp.ParamByName('dtn_digit').AsDateTime:=StrToDate(maskedit3.text);
      DModRosa.IBQVer_comp.ParamByName('tip_digit').AsString:=combobox2.Text;
      DModRosa.IBQVer_comp.ParamByName('num_digit').AsString:=edit6.Text;
      DModRosa.IBQVer_comp.ParamByName('des_digit').AsFloat:=StrToFloat(edit19.text);
      DModRosa.IBQVer_comp.ParamByName('fre_digit').AsFloat:=StrToFloat(edit18.Text);
      DModRosa.IBQVer_comp.ParamByName('val_digit').AsFloat:=(wtotnot+
                                                              StrToFloat(edit18.Text)-
                                                              StrToFloat(edit19.Text));
      DModRosa.IBQVer_comp.ParamByName('sit_digit').AsString:='R';
      DModRosa.IBQVer_comp.ParamByName('par_digit').AsString:=edit10.text;
      DModRosa.IBQVer_comp.ParamByName('tped_digit').AsString:=ComboBox1.text;
      DModRosa.IBQVer_comp.ParamByName('ped_digit').AsString:=edit4.Text;
      DModRosa.IBQVer_comp.ExecSql;
      DModRosa.IBQVer_comp.Close;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_comp.Close;
    end else
    begin
      if zoper='I' then
      begin
        if DModRosa.IBQVer_comp.Active then
           DModRosa.IBQVer_comp.Active:=False;
        DModRosa.IBQVer_comp.Sql.Clear;
        DModRosa.IBQVer_comp.Sql.Add('Insert Into COMPRA ');
        DModRosa.IBQVer_comp.Sql.Add('(DATPED,TIPPED,NUMPED,FORNEC,ENTREG,TOTPED,DATNOT,'+
                                     'TIPNOT,NUMNOT,DESCON,FRETE,VALNOT,SITPED,PARCEL,OBSERV) '+
                             'Values(:DATPED,:TIPPED,:NUMPED,:FORNEC,:ENTREG,:TOTPED,:DATNOT,'+
                                    ':TIPNOT,:NUMNOT,:DESCON,:FRETE,:VALNOT,:SITPED,:PARCEL,:OBSERV)');
        DModRosa.IBQVer_comp.ParamByName('DATPED').AsDateTime:=StrToDate(maskedit1.text);
        DModRosa.IBQVer_comp.ParamByName('TIPPED').AsString:=ComboBox1.text;
        DModRosa.IBQVer_comp.ParamByName('NUMPED').AsString:=edit4.Text;
        DModRosa.IBQVer_comp.ParamByName('FORNEC').AsString:=edit2.Text;
        DModRosa.IBQVer_comp.ParamByName('ENTREG').AsDateTime:=StrToDate(maskedit2.text);
        DModRosa.IBQVer_comp.ParamByName('TOTPED').AsFloat:=wtotnot;
        DModRosa.IBQVer_comp.ParamByName('DATNOT').AsDateTime:=StrToDate(maskedit3.text);
        DModRosa.IBQVer_comp.ParamByName('TIPNOT').AsString:=Combobox2.text;
        DModRosa.IBQVer_comp.ParamByName('NUMNOT').AsString:=edit6.Text;
        DModRosa.IBQVer_comp.ParamByName('DESCON').AsFloat:=StrToFloat(edit19.Text);
        DModRosa.IBQVer_comp.ParamByName('FRETE').AsFloat:=StrToFloat(edit18.Text);
        DModRosa.IBQVer_comp.ParamByName('VALNOT').AsFloat:=wtotnot+
                                                            StrToFloat(edit18.Text)-
                                                            StrToFloat(edit19.Text);
        DModRosa.IBQVer_comp.ParamByName('SITPED').AsString:='R';
        DModRosa.IBQVer_comp.ParamByName('PARCEL').AsString:=edit10.text;
        DModRosa.IBQVer_comp.ParamByName('OBSERV').AsString:='';
        DModRosa.IBQVer_comp.ExecSql;
        DModRosa.IBQVer_comp.Close;
        DModRosa.IBTransaction1.Commit;
        DModRosa.IBQVer_comp.Close;
      end;
    end;
  end;
  // Cria Contas a pagar *******************
  if IBQAuxcont.Active then
     IBQAuxcont.Active:=False;
  IBQAuxcont.Sql.Clear;
  IBQAuxcont.Sql.Add('Select * from AUXCONTA '+
                     'Order by DATEMIS,TIPDOC,NUMDOC');
  IBQAuxcont.Active:=True;
  IBQAuxcont.DisableControls;
  IBQAuxcont.First;
  while not IBQAuxcont.Eof do
  begin
    if DModRosa.IBQPesq_cont.Active then
       DModRosa.IBQPesq_cont.Active:=False;
    DModRosa.IBQPesq_cont.Sql.Clear;
    DModRosa.IBQPesq_cont.Sql.Add('Insert Into CONTAS ');
    DModRosa.IBQPesq_cont.Sql.Add('(DATEMIS,TIPDOC,NUMDOC,PARCEL,HISTOR,'+
                                  'OBSERV,VALOR,TIPCOB,NUMCOB,ORICOB,DATVENC,'+
                                  'SINAL,SIGLA,SITU,DATPAG,VENDE,ACOMIS,'+
                                  'COMISS,DATBAX,OPEROU,NUMCLI) '+
                          'Values(:DATEMIS,:TIPDOC,:NUMDOC,:PARCEL,:HISTOR,'+
                                 ':OBSERV,:VALOR,:TIPCOB,:NUMCOB,:ORICOB,'+
                                 ':DATVENC,:SINAL,:SIGLA,:SITU,:DATPAG,'+
                                 ':VENDE,:ACOMIS,:COMISS,:DATBAX,:OPEROU,'+
                                 ':NUMCLI)');
    DModRosa.IBQPesq_cont.ParamByName('DATEMIS').AsDate:=
             IBQAuxcont.fieldbyName('DATEMIS').AsDateTime;
    DModRosa.IBQPesq_cont.ParamByName('TIPDOC').AsString:=
             IBQAuxcont.fieldbyName('TIPDOC').AsString;
    DModRosa.IBQPesq_cont.ParamByName('NUMDOC').AsString:=
             IBQAuxcont.fieldbyName('NUMDOC').AsString;
    DModRosa.IBQPesq_cont.ParamByName('PARCEL').AsString:=
             IBQAuxcont.fieldbyName('PARCEL').AsString;
    DModRosa.IBQPesq_cont.ParamByName('HISTOR').AsString:=
             IBQAuxcont.fieldbyName('HISTOR').AsString;
    DModRosa.IBQPesq_cont.ParamByName('OBSERV').AsString:=
             IBQAuxcont.fieldbyName('OBSERV').AsString;
    DModRosa.IBQPesq_cont.ParamByName('VALOR').AsFloat:=
             IBQAuxcont.fieldbyName('VALOR').AsFloat;
    DModRosa.IBQPesq_cont.ParamByName('TIPCOB').AsString:=
             IBQAuxcont.fieldbyName('TIPCOB').AsString;
    DModRosa.IBQPesq_cont.ParamByName('NUMCOB').AsString:=
             IBQAuxcont.fieldbyName('NUMCOB').AsString;
    DModRosa.IBQPesq_cont.ParamByName('ORICOB').AsString:=
             IBQAuxcont.fieldbyName('ORICOB').AsString;
    DModRosa.IBQPesq_cont.ParamByName('DATVENC').AsDateTime:=
             IBQAuxcont.fieldbyName('DATVENC').AsDateTime;
    DModRosa.IBQPesq_cont.ParamByname('SINAL').AsString:=
             IBQAuxcont.fieldbyName('SINAL').AsString;
    DModRosa.IBQPesq_cont.ParamByName('SIGLA').AsString:='PAG';
    DModRosa.IBQPesq_cont.ParamByName('SITU').AsString:=
             IBQAuxcont.fieldbyName('SITU').AsString;
    DModRosa.IBQPesq_cont.ParamByName('DATPAG').AsString:=
             IBQAuxcont.fieldbyName('DATPAG').AsString;
    DModRosa.IBQPesq_cont.ParamByName('VENDE').AsString:='';
    DModRosa.IBQPesq_cont.ParamByName('ACOMIS').AsFloat:=0;
    DModRosa.IBQPesq_cont.ParamByName('COMISS').AsFloat:=0;
    DModRosa.IBQPesq_cont.ParamByname('DATBAX').AsString:=
             IBQAuxcont.fieldbyName('DATBAX').AsString;
    DModRosa.IBQPesq_cont.ParamByName('OPEROU').AsString:='SEARCH';
    DModRosa.IBQPesq_cont.ParamByname('NUMCLI').AsString:='';
    DModRosa.IBQPesq_cont.ExecSql;
    DModRosa.IBQPesq_cont.Close;
    IBQAuxcont.Next;
  end;
  IBQAuxcont.Close;
  Limpando;
  exit;
end;

procedure TFrmCompras.Achar_num;
begin
  wnumped:='';
  xnumped:=0;
  if DModRosa.IBQPesq_comp.Active then
     DModRosa.IBQPesq_comp.Active:=False;
  DModRosa.IBQPesq_comp.Sql.Clear;
  DModRosa.IBQPesq_comp.Sql.Add('Select * from COMPRA '+
                                'Where Tipped=:tip_digit '+
                                'Order by Numped');
  DModRosa.IBQPesq_comp.ParamByName('tip_digit').AsString:='PED';
  DModRosa.IBQPesq_comp.Active:=True;
  if DModRosa.IBQPesq_comp.RecordCount>0 then
  begin
    DModRosa.IBQPesq_comp.Last;
    xnumped:=StrToInt(DModRosa.IBQPesq_comp.fieldbyName('Numped').AsString);
  end;
  DModRosa.IBQPesq_comp.Close;
  xnumped:=xnumped+1;
  wnumped:=IntToStr(xnumped);
  While Length(wnumped)<6 do
        wnumped:='0'+wnumped;
  edit4.Text:=wnumped;
  exit;
end;

end.
