unit UManutsol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable, frxClass,
  frxDBSet;

type
  TFrmManutsol = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Button7: TButton;
    IBQuery1: TIBQuery;
    Button8: TButton;
    IBQTabula: TIBQuery;
    IBTTabula: TIBTable;
    IBTTabulaARTIGO: TIBStringField;
    IBTTabulaDESCRICAO: TIBStringField;
    IBTTabulaPEQUENO: TIBBCDField;
    IBTTabulaMEDIO: TIBBCDField;
    IBTTabulaGRANDE: TIBBCDField;
    IBTTabulaXGRANDE: TIBBCDField;
    IBTTabulaOBSER: TIBStringField;
    IBTTabulaOPER: TIBStringField;
    IBTTabulaTOTAL: TIBBCDField;
    IBQTabulaARTIGO: TIBStringField;
    IBQTabulaDESCRICAO: TIBStringField;
    IBQTabulaPEQUENO: TIBBCDField;
    IBQTabulaMEDIO: TIBBCDField;
    IBQTabulaGRANDE: TIBBCDField;
    IBQTabulaXGRANDE: TIBBCDField;
    IBQTabulaOBSER: TIBStringField;
    IBQTabulaOPER: TIBStringField;
    IBQTabulaTOTAL: TIBBCDField;
    RvTabula: TfrxReport;
    DtsTabula: TfrxDBDataset;
    IBTAuxsolicit: TIBTable;
    IBQuery2: TIBQuery;
    IBQAuxsolicit: TIBQuery;
    IBTAuxsolicitVENDEDOR: TIBStringField;
    IBTAuxsolicitNUMERO: TIBStringField;
    IBTAuxsolicitCLIENTE: TIBStringField;
    IBTAuxsolicitNOMCLI: TIBStringField;
    IBTAuxsolicitDATSOL: TDateField;
    IBTAuxsolicitSITU: TIBStringField;
    IBQAuxsolicitVENDEDOR: TIBStringField;
    IBQAuxsolicitNUMERO: TIBStringField;
    IBQAuxsolicitCLIENTE: TIBStringField;
    IBQAuxsolicitNOMCLI: TIBStringField;
    IBQAuxsolicitDATSOL: TDateField;
    IBQAuxsolicitSITU: TIBStringField;
    IBTAuxitsolicit: TIBTable;
    IBQAuxitsolicit: TIBQuery;
    IBTAuxitsolicitVENDEDOR: TIBStringField;
    IBTAuxitsolicitNUMERO: TIBStringField;
    IBTAuxitsolicitARTIGO: TIBStringField;
    IBTAuxitsolicitDESCRICAO: TIBStringField;
    IBTAuxitsolicitPEQUENO: TIBBCDField;
    IBTAuxitsolicitMEDIO: TIBBCDField;
    IBTAuxitsolicitGRANDE: TIBBCDField;
    IBTAuxitsolicitXGRANDE: TIBBCDField;
    IBTAuxitsolicitOBSER: TIBStringField;
    IBTAuxitsolicitOPER: TIBStringField;
    IBQAuxitsolicitVENDEDOR: TIBStringField;
    IBQAuxitsolicitNUMERO: TIBStringField;
    IBQAuxitsolicitARTIGO: TIBStringField;
    IBQAuxitsolicitDESCRICAO: TIBStringField;
    IBQAuxitsolicitPEQUENO: TIBBCDField;
    IBQAuxitsolicitMEDIO: TIBBCDField;
    IBQAuxitsolicitGRANDE: TIBBCDField;
    IBQAuxitsolicitXGRANDE: TIBBCDField;
    IBQAuxitsolicitOBSER: TIBStringField;
    IBQAuxitsolicitOPER: TIBStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RvTabulaGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
     procedure Tabula;
  public
    { Public declarations }
  end;

var
  FrmManutsol: TFrmManutsol;
  wdatini,wdatfin,wcodart,wdescricao,wclient,wcodven,xtagan,wtagnv: string;
  wqtpeq,wqtmedio,wqtgrande,wqtxgrand,wartigos,wtotal,xqtpeq,xqtmedio: extended;
  xqtgrande,xqtxgrand,xqttotal,wpeqn,wmedi,wgran,wxgran: Extended;
  wsolic,wcodvend,wmarca,wdatnot,wcodcli,xcodven,xcodart,xdescricao: string;
  wnomcli,wsitu: string;
implementation

{$R *.dfm}

uses UDModRosa, USolicitacao, USolimpa;

procedure TFrmManutsol.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col039').AsString='X' then
  begin
    DModRosa.IBQPesq_solicit.Close;
    FrmSolicitacao:=TFrmSolicitacao.Create(Self);
    FrmSolicitacao.edit13.Text:='Implantar';
    FrmSolicitacao.ShowModal;
    FrmSolicitacao.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_solicit.Close;
  DModRosa.IBQPesq_solicit.SQL.Clear;
  DModRosa.IBQPesq_solicit.SQL.Add('Select * from SOLICITACAO '+
                                   'Order By Datsol,Vendedor,Numero');
  DModRosa.IBQPesq_Solicit.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutsol.Button2Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col040').AsString='X' then
  begin
    wcodvend:=DModRosa.IBQPesq_solicit.fields.fields[0].AsString;
    wsolic:=DModRosa.IBQPesq_solicit.fields.fields[1].AsString;
    DModRosa.IBQPesq_solicit.Close;
    FrmSolicitacao:=TFrmSolicitacao.Create(Self);
    FrmSolicitacao.edit13.Text:='Alterar';
    FrmSolicitacao.edit6.text:=wcodvend;
    FrmSolicitacao.edit10.Text:=wsolic;
    FrmSolicitacao.ShowModal;
    FrmSolicitacao.release;
  end else
      showmessage('Não Autorizado !!!!');
  DModRosa.IBQPesq_solicit.Close;
  DModRosa.IBQPesq_solicit.SQL.Clear;
  DModRosa.IBQPesq_solicit.SQL.Add('Select * from SOLICITACAO '+
                                   'Order By Datsol,Vendedor,numero');
  DModRosa.IBQPesq_solicit.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutsol.Button3Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col041').AsString='X' then
  begin
    wcodvend:=DModRosa.IBQPesq_solicit.fields.fields[0].AsString;
    wsolic:=DModRosa.IBQPesq_solicit.fields.fields[1].AsString;
    DModRosa.IBQPesq_solicit.Close;
    FrmSolicitacao:=TFrmSolicitacao.Create(Self);
    FrmSolicitacao.edit13.Text:='Consultar';
    FrmSolicitacao.edit6.text:=wcodvend;
    FrmSolicitacao.edit10.Text:=wsolic;
    FrmSolicitacao.ShowModal;
    FrmSolicitacao.release;
  end else
      showmessage('Não Autorizado !!!!');
  DModRosa.IBQPesq_solicit.Close;
  DModRosa.IBQPesq_solicit.SQL.Clear;
  DModRosa.IBQPesq_solicit.SQL.Add('Select * from SOLICITACAO '+
                                   'Order By Datsol,Vendedor,numero');
  DModRosa.IBQPesq_solicit.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutsol.Button4Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col042').AsString='X' then
  begin
    wcodvend:=DModRosa.IBQPesq_solicit.fields.fields[0].AsString;
    wsolic:=DModRosa.IBQPesq_solicit.fields.fields[1].AsString;
    DModRosa.IBQPesq_solicit.Close;
    FrmSolicitacao:=TFrmSolicitacao.Create(Self);
    FrmSolicitacao.edit13.Text:='Excluir';
    FrmSolicitacao.edit6.text:=wcodvend;
    FrmSolicitacao.edit10.Text:=wsolic;
    FrmSolicitacao.ShowModal;
    FrmSolicitacao.release;
  end else
      showmessage('Não Autorizado !!!!');
  DModRosa.IBQPesq_solicit.Close;
  DModRosa.IBQPesq_solicit.SQL.Clear;
  DModRosa.IBQPesq_solicit.SQL.Add('Select * from SOLICITACAO '+
                                   'Order By Datsol,Vendedor,numero');
  DModRosa.IBQPesq_solicit.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutsol.Button7Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col044').AsString='X' then
  begin
    FrmSolimpa:=TFrmSolimpa.Create(Self);
    FrmSolimpa.ShowModal;
    FrmSolimpa.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_solicit.Close;
  DModRosa.IBQPesq_solicit.SQL.Clear;
  DModRosa.IBQPesq_solicit.SQL.Add('Select * from SOLICITACAO '+
                                   'Order By Datsol,Vendedor,Numero');
  DModRosa.IBQPesq_solicit.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;

end;

procedure TFrmManutsol.Button8Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col043').AsString='X' then
  begin
    wtotal:=0;
    xqttotal:=0;
    xtagan:='';
    wtagnv:='';
    wcodven:='';
    wdatini:='';
    wdatfin:='';
    While wcodven='' do
     begin
      wcodven:=InputBox('Informe o vendedor ou 999 ',
                         'codigo:',' ');
    end;
    // Preencher a chave com zeros a esquerda
    While Length(wcodven)<3 do
          wcodven:= '0'+ wcodven;
    if wcodven='999' then
      wclient:=' GERAL '
    else
    begin
      DModRosa.IBQLer_ven.Close;
      DModRosa.IBQLer_ven.SQL.Clear;
      DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                                  'Where Codven=:ven_digit');
      DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=wcodven;
      DModRosa.IBQLer_ven.OPen;
      if DModRosa.IBQLer_ven.RecordCount>0 then
         wclient:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
      DModRosa.IBQLer_ven.Close;
    end;
    While wdatini='' do
    begin
      wdatini:=InputBox('Informe inicio do periodo',
                        'data(DD/MM/AAAA):',' ');
    end;
    While wdatfin='' do
    begin
      wdatfin:=InputBox('Informe Final de emissão',
                        'data(DD/MM/AAAA):',' ');
    end;
    if wcodven='999' then
    begin
      DModRosa.IBQPesq_solicit.Close;
      DModRosa.IBQVer_solicit.Close;
      DModRosa.IBQVer_solicit.SQL.Clear;
      DModRosa.IBQVer_solicit.SQL.Add('Select * from SOLICITACAO '+
                                      'Where Datsol>=:ini_digit '+
                                      'and Datsol<=:fin_digit '+
                                      'and Situ<>:sit_digit '+
                                      'Order By Datsol,Numero');
      DModRosa.IBQVer_solicit.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
      DModRosa.IBQVer_solicit.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
      DModRosa.IBQVer_solicit.ParamByName('sit_digit').AsString:='X';
    end else
    begin
      DModRosa.IBQPesq_solicit.Close;
      DModRosa.IBQVer_solicit.Close;
      DModRosa.IBQVer_solicit.SQL.Clear;
      DModRosa.IBQVer_solicit.SQL.Add('Select * from SOLICITACAO '+
                                      'Where Vendedor=:vend_digit '+
                                      'and Datsol>=:ini_digit '+
                                      'and Datsol<=:fin_digit '+
                                      'and Situ<>:sit_digit '+
                                      'Order By Datsol,Numero');
      DModRosa.IBQVer_solicit.ParamByName('vend_digit').AsString:=wcodven;
      DModRosa.IBQVer_solicit.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
      DModRosa.IBQVer_solicit.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
      DModRosa.IBQVer_solicit.ParamByName('sit_digit').AsString:='X';
    end;
    DModRosa.IBQVer_solicit.OPen;
    DModRosa.IBQVer_solicit.DisableControls;
    DModRosa.IBQVer_solicit.First;
    IBTAuxitsolicit.EmptyTable;
    while not DModRosa.IBQVer_solicit.Eof do
    begin
      wtotal:=wtotal+1;
      wcodvend:=DModRosa.IBQVer_solicit.fieldbyName('Vendedor').AsString;
      wsolic:=DModRosa.IBQVer_solicit.fieldbyName('Numero').AsString;
      DModRosa.IBQPesq_itsolicit.Close;
      DModRosa.IBQVer_itsolicit.Close;
      DModRosa.IBQVer_itsolicit.SQL.Clear;
      DModRosa.IBQVer_itsolicit.SQL.Add('Select * from ITSOLICIT '+
                                        'Where Vendedor=:vend_digit '+
                                        'and Numero=:num_digit '+
                                        'Order By Artigo');
      DModRosa.IBQVer_itsolicit.ParamByName('vend_digit').AsString:=wcodvend;
      DModRosa.IBQVer_itsolicit.ParamByName('num_digit').AsString:=wsolic;
      DModRosa.IBQVer_itsolicit.OPen;
      DModRosa.IBQVer_itsolicit.DisableControls;
      DModRosa.IBQVer_itsolicit.First;
      while not DModRosa.IBQVer_itsolicit.Eof do
      begin
        wcodart:=DModRosa.IBQVer_itsolicit.fieldbyName('Artigo').AsString;
        wdescricao:=DModRosa.IBQVer_itsolicit.fieldbyName('Descricao').AsString;
        wpeqn:=DModRosa.IBQVer_itsolicit.fieldbyName('Pequeno').AsFloat;
        wmedi:=DModRosa.IBQVer_itsolicit.fieldbyName('Medio').AsFloat;
        wgran:=DModRosa.IBQVer_itsolicit.fieldbyName('Grande').AsFloat;
        wxgran:=DModRosa.IBQVer_itsolicit.fieldbyNamE('Xgrande').AsFloat;
        if IBQAuxitsolicit.Active then
           IBQAuxitsolicit.Active:=False;
        IBQAuxitsolicit.Sql.Clear;
        IBQAuxitsolicit.Sql.Add('Insert Into AUXITSOLICIT ');
        IBQAuxitsolicit.Sql.Add('(VENDEDOR,NUMERO,ARTIGO,DESCRICAO,'+
                                'PEQUENO,MEDIO,GRANDE,XGRANDE,OPER) '+
                        'Values(:VENDEDOR,:NUMERO,:ARTIGO,:DESCRICAO,'+
                                ':PEQUENO,:MEDIO,:GRANDE,:XGRANDE,:OPER)');
        IBQAuxitsolicit.ParamByName('VENDEDOR').AsString:=wcodvend;
        IBQAuxitsolicit.ParamByName('NUMERO').AsString:=wsolic;
        IBQAuxitsolicit.ParamByName('ARTIGO').AsString:=wcodart;
        IBQAuxitsolicit.ParamByName('DESCRICAO').AsString:=wdescricao;
        IBQAuxitsolicit.ParamByName('PEQUENO').AsFloat:=wpeqn;
        IBQAuxitsolicit.ParamByName('MEDIO').AsFloat:=wmedi;
        IBQAuxitsolicit.ParamByName('GRANDE').AsFloat:=wgran;
        IBQAuxitsolicit.ParamByName('XGRANDE').AsFloat:=wxgran;
        IBQAuxitsolicit.ParamByName('OPER').Asstring:='';
        IBQAuxitsolicit.ExecSql;
        IBQAuxitsolicit.Close;
        DModRosa.IBQVer_itsolicit.Next;
      end;
      DModRosa.IBQVer_itsolicit.Close;
      DModRosa.IBQVer_solicit.Next;
    end;
    DModRosa.IBQVer_solicit.Close;
    // Monta tabulação dos Artigos **************************
    IBTTabula.EmptyTable;
    IBQAuxitsolicit.Close;
    IBQAuxitsolicit.SQL.Clear;
    IBQAuxitsolicit.SQL.Add('Select * from AUXITSOLICIT '+
                            'Order By Artigo');
    IBQAuxitsolicit.OPen;
    IBQAuxitsolicit.DisableControls;
    IBQAuxitsolicit.First;
    IBTTabula.EmptyTable;
    while not IBQAuxitsolicit.Eof do
    begin
      wcodart:=IBQauxitsolicit.fieldByName('Artigo').asstring;
      wdescricao:=IBQAuxitsolicit.fieldbyName('Descricao').AsString;
      wqtpeq:=IBQAuxitsolicit.fieldbyName('Pequeno').AsFloat;
      wqtmedio:=IBQAuxitsolicit.fieldbyName('Medio').AsFloat;
      wqtgrande:=IBQAuxitsolicit.fieldbyName('Grande').AsFloat;
      wqtxgrand:=IBQAuxitsolicit.fieldbyName('Xgrande').AsFloat;
      wtagnv:=wcodart;
      if xtagan<>wtagnv then
         Tabula;
      xqtpeq:=xqtpeq+wqtpeq;
      xqtmedio:=xqtmedio+wqtmedio;
      xqtgrande:=xqtgrande+wqtgrande;
      xqtxgrand:=xqtxgrand+wqtxgrand;
      xqttotal:=xqttotal+(wqtpeq+wqtmedio+wqtgrande+wqtxgrand);
      IBQAuxitsolicit.Next;
    end;
    Tabula;
    IBQAuxitsolicit.Close;
    IBQTabula.Close;
    IBQTabula.SQL.Clear;
    IBQTabula.SQL.Add('Select * from AUXTABULA '+
                      'Order By Artigo');
    IBQTabula.OPen;
    IBQTabula.Close;
    // Emite a relação ******************
    RvTabula.showreport;
    DModRosa.IBQPesq_solicit.Close;
    DModRosa.IBQPesq_solicit.SQL.Clear;
    DModRosa.IBQPesq_solicit.SQL.Add('Select * from SOLICITACAO '+
                                     'Order By Datsol,Vendedor,Numero');
    DModRosa.IBQPesq_solicit.OPen;
  end else
      showmessage('Não Autorizado !!!');
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutsol.Edit1Exit(Sender: TObject);
begin
   if (ActiveControl=DBGrid1) or
     (ActiveControl=Button2) then
     exit;
  if edit1.Text='' then
  begin
    showmessage('Informe o elemento de procura');
    ComboBox1.SetFocus;
    exit;
  end;
  // Pesquiza grid *************************
  if DModRosa.IBQPesq_solicit.Active=True then
     DModRosa.IBQPesq_solicit.Active:=False;
  DModRosa.IBQPesq_solicit.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    while Length(edit1.Text)<3 do
          edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_solicit.Sql.Add('Select * from SOLICITACAO '+
                                     'Where VENDEDOR=:vend_digit');
    DModRosa.IBQPesq_solicit.ParamByName('vend_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_solicit.Active:=True;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    while Length(edit1.Text)<4 do
          edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_solicit.Sql.Add('Select * from SOLICITACAO '+
                                     'Where CLIENTE=:cli_digit');
    DModRosa.IBQPesq_solicit.ParamByName('cli_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_solicit.Active:=True;
  end;
  if ComboBox1.ItemIndex=2 then
  begin
    DModRosa.IBQPesq_solicit.Sql.Add('Select * from SOLICITACAO '+
                                     'Where Nomcli LIKE '+#39+'%'+edit1.Text+'%'+#39);
    DModRosa.IBQPesq_solicit.Active:=True;
  end;
  if ComboBox1.ItemIndex=3 then
  begin
    DModRosa.IBQPesq_solicit.Sql.Add('Select * from SOLICITACAO '+
                                     'Where DATSOL=:dat_digit');
    DModRosa.IBQPesq_solicit.ParamByName('dat_digit').AsDateTime:=StrToDate(edit1.Text);
    DModRosa.IBQPesq_solicit.Active:=True;
  end;
end;

procedure TFrmManutsol.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmManutsol.FormShow(Sender: TObject);
begin
  if DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=False;
  if DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=False;
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
  if not DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=true;
  // Monta DBGRID *********************
  if DModRosa.IBQPesq_solicit.Active then
     DModRosa.IBQPesq_solicit.Active:=False;
  DModRosa.IBQPesq_solicit.Sql.Clear;
  DModRosa.IBQPesq_solicit.Sql.Add('Select * from SOLICITACAO '+
                                   'Order By Datsol,Vendedor,Numero');
  DModRosa.IBQPesq_solicit.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutsol.RvTabulaGetValue(const VarName: string;
  var Value: Variant);
begin
  if comparetext(varname,'Periodo')=0 THEN
     value:='Periodo '+wdatini+' A '+wdatfin;
  if comparetext(Varname,'Vendedor')=0 then
     value:='Vend: '+wclient;
  if Comparetext(Varname,'Totsol')=0 then
     value:=FormatFloat('###0',wtotal);
end;

procedure TFrmManutsol.Tabula;
begin
  if xtagan>'       ' then
  begin
    IBQTabula.Sql.Clear;
    IBQTabula.Sql.Add('Insert Into AUXTABULA ');
    IBQTabula.Sql.Add('(ARTIGO,DESCRICAO,'+
                      'PEQUENO,MEDIO,GRANDE,XGRANDE,TOTAL) '+
              'Values(:ARTIGO,:DESCRICAO,'+
                     ':PEQUENO,:MEDIO,:GRANDE,:XGRANDE,:TOTAL)');
    IBQTabula.ParamByName('ARTIGO').AsString:=xcodart;
    IBQTabula.ParamByName('DESCRICAO').AsString:=xdescricao;
    IBQTabula.ParamByName('PEQUENO').AsFloat:=xqtpeq;
    IBQTabula.ParamByName('MEDIO').AsFloat:=xqtmedio;
    IBQTabula.ParamByName('GRANDE').AsFloat:=xqtgrande;
    IBQTabula.ParamByName('XGRANDE').AsFloat:=xqtxgrand;
    IBQTabula.ParamByName('TOTAL').AsFloat:=xqttotal;
    IBQTabula.ExecSql;
  end;
  xqtpeq:=0;
  xqttotal:=0;
  xqtmedio:=0;
  xqtgrande:=0;
  xqtxgrand:=0;
  xcodven:=wcodven;
  xcodart:=wcodart;
  xdescricao:=wdescricao;
  xtagan:=wtagnv;
end;

end.
