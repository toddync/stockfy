unit URetorno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBQuery,
  IBX.IBCustomDataSet, IBX.IBTable, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TFrmRetorno = class(TForm)
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
    Edit8: TEdit;
    Button1: TButton;
    Edit1: TEdit;
    Edit4: TEdit;
    Edit7: TEdit;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    RichEdit1: TRichEdit;
    DTSAuxret: TDataSource;
    Edit3: TEdit;
    Edit5: TEdit;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Edit2: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit11: TEdit;
    Label12: TLabel;
    Button2: TButton;
    Label11: TLabel;
    Button3: TButton;
    Button4: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Restaura;
    procedure Descarrega_ped;
    procedure Atu_item;
    function strZero(const strValor: string;const intComprimento: integer): string;
  end;

var
  FrmRetorno: TFrmRetorno;
  wnomc,wclie,wbase,wreco,wcobr,wpedi,wsitu,wcodart,wdescricao,wvend: string;
  chvtem,I,S,R,V,P,X,Y,Z,W,chvff,PrntOk,chavfr,wopcao,xsitu,wconfirme: string;
  wqtds,wqtdr,wqtdv,wpreco,wqtda,xestoq,zqtda,xqtda,wvalor,xtotret: Extended;
  wtotqts,wtotqtr,wtotqtv,wtotped,wtotret,wtotven,wtotind,wqtdev,wqtvend: Extended;
  witens: Integer;
  wendereco,wempresa,wtelefone,winscricoes,wretor,chvtrava,chvrest: String;
implementation

{$R *.dfm}

uses UDModRosa, UPare;

function TFrmRetorno.strZero(const strValor: string;const intComprimento: integer): string;
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

procedure TFrmRetorno.BitBtn3Click(Sender: TObject);
begin
  chvff:='';
  chavfr:='1';
  edit4.Clear;
  edit7.Clear;
  edit8.Clear;
  edit5.Clear;
  edit3.Clear;
  maskedit1.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmRetorno.Button1Click(Sender: TObject);
begin
  xsitu:=' ';
  chvff:='';
  chavfr:='1';
  chvrest:='1';
  edit1.Clear;
  edit4.Clear;
  edit7.Clear;
  edit8.Clear;
  edit5.Clear;
  edit3.Clear;
  maskedit1.Clear;
  Richedit1.Clear;
  MessageBeep(64);
  MessageBeep(64);
  MessageBeep(64);
  FrmErro:=TFrmErro.Create(Self);
  FrmErro.Label2.caption:='Pedido de restauração ';
  FrmErro.Label3.Caption:=' Operações desfeitas';
  FrmErro.Showmodal;
  FrmErro.Release;
  Modalresult:=-1;
  exit;
end;

procedure TFrmRetorno.Button2Click(Sender: TObject);
begin
  showmessage('Connfirme !!!!!');
  if wtotped>0 then
  begin
    DModRosa.IBQVer_ped.Sql.Clear;
    DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
    DModRosa.IBQVer_ped.Sql.Add('Set RETORNO=:ret_digit,'+
                                'TOTVEN=:tven_digit,'+
                                'RESIDUO=:resi_digit,'+
                                'SITU=:sit_digit '+
                                'Where PEDIDO=:ped_digit');
    DModRosa.IBQVer_ped.ParamByName('ret_digit').AsString:=maskedit1.text;
    DModRosa.IBQVer_ped.ParamByName('tven_digit').AsFloat:=wtotven;
    DModRosa.IBQVer_ped.ParamByName('resi_digit').AsFloat:=wtotven;
    DModRosa.IBQVer_ped.ParamByName('sit_digit').AsString:=xsitu;
    DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit4.Text;
    DModRosa.IBQVer_ped.ExecSql;
    DModRosa.IBQVer_ped.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_ped.Close;
    // Ler Itens do pedido *********************
    IBQAuxret.Close;
    IBQAuxret.SQL.Clear;
    IBQAuxret.SQL.Add('Select * from AUXITENS '+
                      'Where Pedido=:ped_digit '+
                      'and Oper=:ope_digit '+
                      'Order by Codart');
    IBQAuxret.ParamByName('ped_digit').AsString:=edit4.Text;
    IBQAuxret.ParamByName('ope_digit').AsString:='A';
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
      DModRosa.IBQVer_itped.ParamByName('qtd_digit').AsFloat:=wqtdr;
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=edit4.text;
      DModRosa.IBQVer_itped.ParamByName('cod_digit').AsString:=wcodart;
      DModRosa.IBQVer_itped.ExecSql;
      DModRosa.IBQVer_itped.Close;
      Restaura;
        IBQAuxret.Next;
     end;
     IBQAuxret.Close;
    end;
  chvff:='';
  chavfr:='1';
  edit4.Clear;
  edit7.Clear;
  edit8.Clear;
  edit5.Clear;
  edit3.Clear;
  chvrest:='1';
  maskedit1.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmRetorno.Button3Click(Sender: TObject);
begin
  chvff:='1';
  edit7.SetFocus;
  exit;
end;

procedure TFrmRetorno.Button4Click(Sender: TObject);
begin
  if GroupBox1.Visible=False then
     GroupBox1.visible:=True
  else
     GroupBox1.Visible:=False;
  edit7.SetFocus;
  exit;
end;

procedure TFrmRetorno.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) then
      exit;
  chvtrava:='';
  if edit1.text='' then
  begin
    PrntOk:='';
    while PrntOk<>'S' do
    begin
      MessageBeep(64);
      PrntOk:=InputBox('Idfentifique a operação !!',
                       'Para sair confirme( S ):',' ');
      PrntOk:=UPPERCASE(PrntOk);
    end;
    edit1.SetFocus;
    exit;
  end;
  wsitu:=Copy(UPPERCASE(edit1.text),1,1);
  Groupbox1.visible:=false;
  if wsitu='V' then
  begin
    edit1.Text:='VENDA';
    wopcao:='';
    while wopcao='' do
    begin
      wopcao:=InputBox('Informe senha autorizada !!!!',
                       'Senha: ',' ');
      wopcao:=UPPERCASE(wopcao);
    end;
    if wopcao<>'LULA' then
    begin
      showmessage('Senha não autorizada !!!!');
      Button1Click(Sender);
      Exit;
    end;
    wconfirme:='';
    While wconfirme='' do
    begin
      wconfirme:=InputBox('Confirme a venda <S>  !!!',
                          'Venda: ',' ');
      wconfirme:=UPPERCASE(wconfirme);
    end;
    if wconfirme='S' then
    begin
      xsitu:=wsitu;
      edit7.Text:='9999';
      edit7.SetFocus;
      exit;
    end;
    Button1Click(Sender);
    exit;
  end;
  if wsitu='D' then
  begin
    edit1.Text:='DEVOL';
    edit7.SetFocus;
    exit;
  end;
  if wsitu='R' then
  begin
    edit1.Text:='RETOR';
    edit7.SetFocus;
    exit;
  end;
  PrntOk:='';
  while PrntOk<>'S' do
  begin
    MessageBeep(64);
    PrntOk:=InputBox('Operacão invalida !!',
                     'Para sair confirme( S ):',' ');
    PrntOk:=UPPERCASE(PrntOk);
  end;
  edit1.SetFocus;
  exit;
end;

procedure TFrmRetorno.Edit4Exit(Sender: TObject);
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
  xtotret:=0;
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
  xtotret:=0;
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
  edit2.text:=FormatFloat('#0',witens);
  edit6.text:=FormatFloat('####0',wtotqts);
  edit10.Text:=FormatFloat('####0',wtotqtr);
  edit9.text:=FormatFloat('##,##0.00',wtotped);
  //edit11.text:=FormatFloat('##,##0.00',wtotret);
  edit13.Text:=FormatFloat('####0',wtotqtv);
  edit12.text:=FormatFloat('##,##0.00',wtotven);
  W:=FormatFloat('##,##0.00',wtotind);
  if wsitu='X' then
  begin
    maskedit1.Text:=wretor;
    ShowMessage('Este Pedido foi excluido');
    chvff:='';
    chavfr:='1';
    chvrest:='1';
    edit4.Clear;
    edit7.Clear;
    edit8.Clear;
    edit5.Clear;
    edit3.Clear;
    maskedit1.Clear;
    Modalresult:=-1;
    exit;
  end;
  if wsitu='V' then
  begin
    maskedit1.Text:=wretor;
    Richedit1.Visible:=False;
    ShowMessage('Este Pedido foi vendido');
    chvff:='';
    chavfr:='1';
    chvrest:='1';
    edit4.Clear;
    edit7.Clear;
    edit8.Clear;
    edit5.Clear;
    edit3.Clear;
    maskedit1.Clear;
    Modalresult:=-1;
    exit;
  end;
  if wsitu='D' then
  begin
    maskedit1.Text:=wretor;
    Richedit1.Visible:=False;
    ShowMessage('Este Pedido foi devolvido');
    chvff:='';
    chavfr:='1';
    chvrest:='1';
    edit4.Clear;
    edit7.Clear;
    edit8.Clear;
    edit5.Clear;
    edit3.Clear;
    maskedit1.Clear;
    Modalresult:=-1;
    exit;
  end;
  if wsitu='R' then
  begin
    maskedit1.Text:=wretor;
    Richedit1.Visible:=False;
    ShowMessage('Este Pedido foi retornado');
    chvff:='';
    chavfr:='1';
    chvrest:='1';
    edit4.Clear;
    edit7.Clear;
    edit8.Clear;
    edit5.Clear;
    edit3.Clear;
    maskedit1.Clear;
    Modalresult:=-1;
    exit;
  end;
  Showmessage('ATENÇÃO ...CONFIRME O CLIENTE E BATA AOPERAÇÃO !!!!');
  Richedit1.Visible:=False;
  edit1.SetFocus;
  exit;
end;

procedure TFrmRetorno.Edit5Exit(Sender: TObject);
begin
  zqtda:=StrToFloat(edit5.Text);
  if StrToFloat(edit5.Text)>StrToFloat(edit3.text) then
  begin
    MessageBeep(64);
    MessageBeep(64);
    MessageBeep(64);
    FrmErro:=TFrmErro.Create(Self);
    FrmErro.Label2.caption:='Devolucao maior que a saida  !!!!!';
    FrmErro.Showmodal;
    FrmErro.Release;
    zqtda:=0;
    edit5.Clear;
    edit5.SetFocus;
    exit;
  end;
  xtotret:=xtotret+zqtda;
  edit11.Text:=FormatFloat('###0',xtotret);
  Atu_item;
  chvff:='';
  edit7.Clear;
  //edit8.Clear;
  edit3.Clear;
  edit5.Clear;
  edit7.SetFocus;
  exit;
end;

procedure TFrmRetorno.Edit7Exit(Sender: TObject);
begin
  if (ActiveControl=DBGrid1) or
     (ActiveControl=Button1) or
     (ActiveControl=Button3) or
     (ActiveControl=Button4)then
  exit;
  if edit7.Text='9999' then
  begin
    GroupBox1.visible:=True;
    if MessageDlg('Retorno encerrado !'+ Chr(13)+
                  'Vai verificar retorno ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin;
      GroupBox1.visible:=False;
      DBGrid1.SetFocus;
      exit
    end else
    begin
      Button2.SetFocus;
      exit;
    end;
  end;
  if edit7.Text<>'' then
  begin
    wqtda:=0;
     // Ler Itens do pedido *********************
    IBQAuxret.Close;
    IBQAuxret.SQL.Clear;
    IBQAuxret.SQL.Add('Select * from AUXITENS '+
                      'Where Pedido=:ped_digit '+
                      'and Codart=:cod_digit');
    IBQAuxret.ParamByName('ped_digit').AsString:=edit4.Text;
    IBQAuxret.ParamByName('cod_digit').AsString:=edit7.Text;
    IBQAuxret.OPen;
    if IBQAuxret.RecordCount>0 then
    begin
      edit8.Text:=edit7.Text+' - '+IBQAuxret.fieldbyName('Descricao').AsString;
      edit3.Text:=FormatFloat('###0',IBQAuxret.fieldbyName('Qtdsai').AsFloat);
      wqtda:=IBQAuxret.fieldbyName('Qtdret').AsFloat;
      zqtda:=IBQAuxret.fieldbyName('Qtdret').AsFloat;
      wpreco:=IBQAuxret.fieldbyName('Precus').AsFloat;
      IBQAuxret.Close;
      if chvff='1' then
      begin
        Showmessage('Digite a quantidade'+chr(13)+
                    'devolvida');
        edit5.SetFocus;
        exit;
      end else
      begin
        zqtda:=zqtda+1;
        edit5.Text:=FormatFloat('###0',zqtda);
        if StrToFloat(edit5.Text)> StrToFloat(edit3.Text) then
        begin
          MessageBeep(64);
          MessageBeep(64);
          MessageBeep(64);
          FrmErro:=TFrmErro.Create(Self);
          FrmErro.Label2.caption:='Devolucao maior que a saida  !!!!!';
          FrmErro.Showmodal;
          FrmErro.Release;
          edit5.Clear;
          edit3.Clear;
          edit7.Clear;
          edit7.setFocus;
          exit;
        end;
        xtotret:=xtotret+1;
        edit11.Text:=FormatFloat('###0',xtotret);
        Atu_item;
        chvff:='';
        edit7.Clear;
        //edit8.Clear;
        edit3.Clear;
        //edit5.Clear;
        edit7.SetFocus;
        exit;
      end;
    end else
    begin
      IBQAuxret.Close;
      MessageBeep(64);
      MessageBeep(64);
      MessageBeep(64);
      FrmErro:=TFrmErro.Create(Self);
      FrmErro.Label2.caption:='Produto não consta no Pedido   !!!!!';
      FrmErro.Label3.Caption:=' ';
      FrmErro.Showmodal;
      FrmErro.Release;
      edit7.Clear;
      edit7.SetFocus;
      exit;
    end;
  end;
  ShowMessage('Identificar o artigo'+Char(#13)+
              'ou Restaure');
  edit7.SetFocus;
  exit;
end;

procedure TFrmRetorno.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if chvrest='' then
  begin
    MessageBeep(64);
    MessageBeep(64);
    MessageBeep(64);
    FrmErro:=TFrmErro.Create(Self);
    FrmErro.Label2.caption:='  Saida incorreta do programa  ';
    FrmErro.Label3.Caption:='Repetir o retorno deste pedido';
    FrmErro.Showmodal;
    FrmErro.Release;
    edit7.Clear;
    edit7.SetFocus;
    exit;
  end;
  Action := caFree;
end;

procedure TFrmRetorno.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmRetorno.FormShow(Sender: TObject);
begin
  xsitu:=' ';
  chvff:='';
  chavfr:='1';
  chvrest:='';
  edit1.Clear;
  edit7.Clear;
  edit8.Clear;
  edit5.Clear;
  edit3.Clear;
  maskedit1.Text:=DateToStr(Date());
  wempresa:='SIDTEX CONFECÇÕES LTDA.';
  wendereco:='Rua Bernardo de Vanconcelos , 12  Realengo -  RJ';
  wtelefone:='Tel:(021) 3381-8581  /  Cep: 21250-270';
  winscricoes:='CNPJ: 04.704.379/0001-71   -   Insc.Est: 77.260.595';
  Richedit1.Clear;
  edit4.SetFocus;
  exit;
end;

procedure TFrmRetorno.Atu_item;
begin
  if wqtdev>wqtvend then
  begin
    MessageBeep(64);
    MessageBeep(64);
    MessageBeep(64);
    FrmErro:=TFrmErro.Create(Self);
    FrmErro.Label2.caption:='Devolucao maior que a saida  !!!!!';
    FrmErro.Showmodal;
    FrmErro.Release;
    edit5.Clear;
    edit5.SetFocus;
    exit;
  end else
  begin
    xsitu:='D';
    IBQAuxret.Sql.Clear;
    IBQAuxret.Sql.Add('Update AUXITENS ');
    IBQAuxret.Sql.Add('Set QTDRET=:qtd_digit,'+
                      'QTDANT=:qta_digit,'+
                      'VENANT=:ven_digit,'+
                      'OPER=:ope_digit '+
                      'Where PEDIDO=:ped_digit '+
                      'and CODART=:cod_digit');
    IBQAuxret.ParamByName('qtd_digit').AsFloat:=StrToFloat(edit5.text);
    IBQAuxret.ParamByName('qta_digit').AsFloat:=(StrToFloat(edit3.Text)-StrToFloat(edit5.Text));
    IBQAuxret.ParamByName('ven_digit').AsFloat:=(StrToFloat(edit3.Text)-StrToFloat(edit5.Text))*wpreco;
    IBQAuxret.ParamByName('ope_digit').AsString:='A';
    IBQAuxret.ParamByName('ped_digit').AsString:=edit4.text;
    IBQAuxret.ParamByName('cod_digit').AsString:=edit7.text;
    IBQAuxret.ExecSql;
    IBQAuxret.Close;
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
    witens:=0;
    wtotqts:=0;
    wtotqtr:=0;
    wtotqtv:=0;
    wtotped:=0;
    wtotret:=0;
    wtotven:=0;
    wtotind:=0;
    //xtotret:=0;
    chvtem:='';
    while not IBQAuxret.Eof do
    begin
      witens:=witens+1;
      wcodart:=IBQAuxret.fieldbyName('Codart').AsString;
      wdescricao:=IBQAuxret.fieldbyName('Descricao').AsString;
      wqtds:=IBQAuxret.fieldbyName('Qtdsai').AsFloat;
      wqtdr:=IBQAuxret.fieldbyName('Qtdret').AsFloat;
      wpreco:=IBQAuxret.fieldbyName('Precus').AsFloat;
      wqtdv:=wqtds-wqtdr;
      wtotqts:=wtotqts+wqtds;
      wtotqtr:=wtotqtr+wqtdr;
      wtotqtv:=wtotqtv+wqtdv;
      wtotped:=wtotped+(wqtds*wpreco);
      wtotret:=wtotret+(wqtdr*wpreco);
      wtotven:=wtotven+(wqtdv*wpreco);
      IBQAuxret.Next;
    end;
    IBQAuxret.Close;
    Descarrega_ped;
    if wtotven>0 then
       wtotind:=(wtotven*100)/wtotped;
    edit2.text:=FormatFloat('#0',witens);
    edit6.text:=FormatFloat('####0',wtotqts);
    edit10.Text:=FormatFloat('####0',wtotqtr);
    edit9.text:=FormatFloat('##,##0.00',wtotped);
   // edit11.text:=FormatFloat('##,##0.00',wtotret);
    edit12.text:=FormatFloat('##,##0.00',wtotven);
    edit13.Text:=FormatFloat('####0',wtotqtv);
    W:=FormatFloat('##,##0.00',wtotind);
  end;
end;

procedure TFrmRetorno.DBGrid1CellClick(Column: TColumn);
begin
  Button2.SetFocus;
  exit;
end;

procedure TFrmRetorno.DBGrid1DblClick(Sender: TObject);
begin
  edit7.SetFocus;
  exit;
end;

procedure TFrmRetorno.DBGrid1Exit(Sender: TObject);
begin
   edit7.SetFocus;
  exit;
end;

procedure TFrmRetorno.Descarrega_ped;
begin
  {Richedit1.Clear;
  Richedit3.Clear;
  Richedit4.Clear;
  Richedit5.Clear;
  Richedit1.Lines.Add('PROD QTDS            DESCRIÇÃO                                 DEV    VEND    VALOR'); }
  IBQPesqret.Close;
  IBQPesqret.SQL.Clear;
  IBQPesqret.SQL.Add('Select * from AUXITENS '+
                         'Order by Codart');
  IBQPesqret.Active:=True;
  {IBQPesqret.DisableControls;
  IBQPesqret.First;
  while not IBQPesqret.Eof do
  begin
    wcodart:=IBQPesqret.fieldbyName('Codart').AsString;
    wdescricao:=copy(IBQPesqret.fieldbyName('Descricao').AsString,1,30);
    wqtds:=IBQPesqret.fieldbyName('Qtdsai').AsFloat;
    wqtdr:=IBQPesqret.fieldbyName('Qtdret').AsFloat;
    wpreco:=IBQPesqret.fieldbyName('Qtdant').AsFloat;
    wvalor:=IBQPesqret.fieldbyName('Venant').AsFloat;
    S:=FormatFloat('####0',wqtds);
    V:=FormatFloat('####0',wqtdr);
    y:=FormatFloat('####0',wpreco);
    Z:=FormatFloat('##,##0.00',wvalor);
    Richedit3.Lines.Add(wcodart+' '+StringofChar(#32,8-Length(S))+(S));
    Richedit4.Lines.Add(wdescricao);
    Richedit5.Lines.Add(StringofChar(#32,8-Length(V))+(V)+' '+
                        StringofChar(#32,12-Length(Y))+(Y)+' '+
                        StringofChar(#32,12-Length(Z))+(Z));
    IBQPesqret.Next;
  end;
  IBQPesqret.Close; }
end;

procedure TFrmRetorno.Restaura;
begin
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
    xestoq:=xestoq+wqtdr;
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
end;

end.
