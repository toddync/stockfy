unit UManutdef;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable;

type
  TFrmManutdef = class(TForm)
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
    Button10: TButton;
    Label3: TLabel;
    Label5: TLabel;
    IBTAuxdef: TIBTable;
    IBTAuxitdef: TIBTable;
    IBQAuxdef: TIBQuery;
    IBQAuxitdef: TIBQuery;
    IBQAuxdefPEDIDO: TIBStringField;
    IBQAuxdefCODVEN: TIBStringField;
    IBQAuxdefCODCLI: TIBStringField;
    IBQAuxdefNOMCLI: TIBStringField;
    IBQAuxdefENDCLI: TIBStringField;
    IBQAuxdefBAICLI: TIBStringField;
    IBQAuxdefCIDCLI: TIBStringField;
    IBQAuxdefESTCLI: TIBStringField;
    IBQAuxdefBASE: TDateField;
    IBQAuxdefRECOL: TDateField;
    IBQAuxdefCOBRAN: TDateField;
    IBQAuxdefTOTPED: TIBBCDField;
    IBQAuxdefSITU: TIBStringField;
    IBQAuxdefDATPED: TIBStringField;
    IBQAuxdefSOLICIT: TIBStringField;
    IBQAuxdefRETORNO: TIBStringField;
    IBQAuxdefTOTVEN: TIBBCDField;
    IBQAuxdefDATPAG: TIBStringField;
    IBQAuxdefVALPAG: TIBBCDField;
    IBQAuxdefRESIDUO: TIBBCDField;
    IBQAuxdefCOB: TIBStringField;
    IBQAuxdefLIMITE: TIBStringField;
    IBQAuxitdefPEDIDO: TIBStringField;
    IBQAuxitdefCODART: TIBStringField;
    IBQAuxitdefDESCRICAO: TIBStringField;
    IBQAuxitdefQTDSAI: TIntegerField;
    IBQAuxitdefQTDRET: TIntegerField;
    IBQAuxitdefPRECUS: TIBBCDField;
    IBQAuxitdefPREVEN: TIBBCDField;
    IBQAuxitdefQTDANT: TIntegerField;
    IBQAuxitdefCUSANT: TIBBCDField;
    IBQAuxitdefVENANT: TIBBCDField;
    IBQAuxitdefOPER: TIBStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutdef: TFrmManutdef;
  wmarca,wgrupo,wdatini,wdatfin,wdatnot,wnumnot,wdescricao,wcodigo: string;
  wtotal,wvalnot,wtotpro,wqtda,wpreco: extended;
implementation

{$R *.dfm}

uses UDModRosa, UDefeito;

procedure TFrmManutdef.Button10Click(Sender: TObject);
begin
  wdatini:='';
  wdatfin:='';
  wtotal:=0;
  While wdatini='' do
  begin
    wdatini:=InputBox('Informe Inicio do periodo',
                         'data(DD/MM/AAAA):',' ');
  end;
  While wdatfin='' do
  begin
    wdatfin:=InputBox('Informe Final do periodo',
                        'data(DD/MM/AAAA):',' ');
  end;
  DModRosa.IBQPesq_def.Close;
  DModRosa.IBQVer_def.Close;
  DModRosa.IBQVer_def.SQL.Clear;
  DModRosa.IBQVer_def.SQL.Add('Select * from DEFEITO '+
                             'Where Datnot>=:ini_digit '+
                             'and Datnot<=:fin_digit '+
                             'Order By Datnot,Numnot');
  DModRosa.IBQVer_def.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
  DModRosa.IBQVer_def.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
  DModRosa.IBQVer_def.Open;
  DModRosa.IBQVer_def.DisableControls;
  DModRosa.IBQVer_def.First;
  IBTAuxdef.EmptyTable;
  IBTAuxitdef.EmptyTable;
  while not DModRosa.IBQVer_def.Eof do
  begin
    wnumnot:=DModRosa.IBQVer_def.fieldbyName('Numnot').AsString;
    wdatnot:=DateToStr(DModRosa.IBQVer_def.fieldbyName('Datnot').AsDateTime);
    wvalnot:=DModRosa.IBQVer_def.fieldbyName('Valnot').AsFloat;
    DModRosa.IBQPesq_itdef.Close;
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
      wcodigo:=DModRosa.IBQVer_itdef.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQVer_itdef.fieldbyName('Descricao').AsString;
      wqtda:=DModRosa.IBQVer_itdef.fieldbyName('Quant').AsFloat;
      wpreco:=DModRosa.IBQVer_itdef.fieldbyName('Precus').AsFloat;
      wtotal:=wtotal+(wqtda*wpreco);
      wtotpro:=wqtda*wpreco;
      if IBQAuxitdef.Active then
         IBQAuxitdef.Active:=False;
      IBQAuxitdef.Sql.Clear;
      IBQAuxitdef.Sql.Add('Insert Into AUXITENS ');
      IBQAuxitdef.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                          'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                   'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                          ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
      IBQAuxitdef.ParamByName('PEDIDO').AsString:=wnumnot;
      IBQAuxitdef.ParamByName('CODART').AsString:=wcodigo;
      IBQAuxitdef.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQAuxitdef.ParamByName('QTDSAI').AsFloat:=wqtda;
      IBQAuxitdef.ParamByName('QTDRET').AsFloat:=0;
      IBQAuxitdef.ParamByName('PRECUS').AsFloat:=wpreco;
      IBQAuxitdef.ParamByName('PREVEN').AsFloat:=wtotpro;
      IBQAuxitdef.ParamByName('QTDANT').AsFloat:=wqtda;
      IBQAuxitdef.ParamByName('CUSANT').AsFloat:=wpreco;
      IBQAuxitdef.ParamByName('VENANT').AsFloat:=0;
      IBQAuxitdef.ParamByName('OPER').AsString:='';
      IBQAuxitdef.ExecSql;
      IBQAuxitdef.Close;
      DModRosa.IBQVer_itdef.Next;
    end;
    DModRosa.IBQVer_itdef.Close;
    if IBQAuxdef.Active then
       IBQAuxdef.Active:=False;
    IBQAuxdef.Sql.Clear;
    IBQAuxdef.Sql.Add('Insert Into AUXPEDIDO ');
    IBQAuxdef.Sql.Add('(PEDIDO,CODVEN,CODCLI,NOMCLI,BASE,RECOL,COBRAN,'+
                      'TOTPED,SITU,NOTA,DATNOT,RETORNO,TOTVEN,DATPAG,'+
                      'VALPAG,RESIDUO,COB,LIMITE) '+
               'Values(:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:BASE,:RECOL,:COBRAN,'+
                      ':TOTPED,:SITU,:NOTA,:DATNOT,:RETORNO,:TOTVEN,:DATPAG,'+
                      ':VALPAG,:RESIDUO,:COB,:LIMITE)');
    IBQAuxdef.ParamByName('PEDIDO').AsString:=wnumnot;
    IBQAuxdef.ParamByName('CODVEN').AsString:='';
    IBQAuxdef.ParamByName('CODCLI').AsString:='';
    IBQAuxdef.ParamByName('NOMCLI').AsString:='';
    IBQAuxdef.ParamByName('BASE').AsDateTime:=StrToDate(wdatnot);
    IBQAuxdef.ParamByName('RECOL').AsDateTime:=StrToDate(wdatnot);
    IBQAuxdef.ParamByName('COBRAN').AsDateTime:=StrToDate(wdatnot);
    IBQAuxdef.ParamByName('TOTPED').AsFloat:=wvalnot;
    IBQAuxdef.ParamByName('SITU').AsString:='';
    IBQAuxdef.ParamByName('NOTA').AsString:=wnumnot;
    IBQAuxdef.ParamByName('DATNOT').AsString:=wdatnot;
    IBQAuxdef.ParamByName('RETORNO').AsString:=wdatnot;
    IBQAuxdef.ParamByName('TOTVEN').AsFloat:=0;
    IBQAuxdef.ParamByName('DATPAG').AsString:='';
    IBQAuxdef.ParamByName('VALPAG').AsFloat:=wvalnot;
    IBQAuxdef.ParamByName('RESIDUO').AsFloat:=0;
    IBQAuxdef.ParamByName('COB').AsString:='';
    IBQAuxdef.ParamByName('LIMITE').AsFloat:=0;
    IBQAuxdef.ExecSql;
    IBQAuxdef.Close;
    DModRosa.IBQVer_def.Next;
  end;
  DModRosa.IBQVer_def.Close;
  IBQAuxdef.Close;
  IBQAuxdef.SQL.Clear;
  IBQAuxdef.SQL.Add('Select * from AUXPEDIDO '+
                    'Order By Pedido');
  IBQAuxdef.OPen;
  IBQAuxdef.Close;
  IBQAuxitdef.Close;
  IBQAuxitdef.SQL.Clear;
  IBQAuxitdef.SQL.Add('Select * from AUXITENS '+
                      'Order By Pedido,Codart');
  IBQAuxitdef.OPen;
  IBQAuxitdef.Close;
  // Emite a relação ******************
 // RvCaddef.Setparam('Periodo',wdatini+' A '+wdatfin);
 // RvCaddef.SetParam('Total',FormatFloat('##,##0.00',wtotal));
 // RvCaddef.SelectReport('Reldef.rav',True);
 // RvCaddef.Execute;
  DModRosa.IBQPesq_def.Close;
  DModRosa.IBQPesq_def.SQL.Clear;
  DModRosa.IBQPesq_def.SQL.Add('Select * from DEFEITO '+
                               'Order By datnot,Numnot');
  DModRosa.IBQPesq_def.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

procedure TFrmManutdef.Button1Click(Sender: TObject);
begin
  DModRosa.IBQPesq_def.Close;
  FrmDefeito:=TFrmDefeito.Create(Self);
  FrmDefeito.edit1.Text:='Implantar';
  FrmDefeito.ShowModal;
  FrmDefeito.release;
  DModRosa.IBQPesq_def.Close;
  DModRosa.IBQPesq_def.SQL.Clear;
  DModRosa.IBQPesq_def.SQL.Add('Select * from DEFEITO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_def.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutdef.Button2Click(Sender: TObject);
begin
  wmarca:=DModRosa.IBQPesq_def.fields.fields[0].AsString;
  DModRosa.IBQPesq_def.Close;
  FrmDefeito:=TFrmDefeito.Create(Self);
  FrmDefeito.edit1.Text:='Alterar';
  FrmDefeito.edit4.Text:=wmarca;
  FrmDefeito.ShowModal;
  FrmDefeito.release;
  DModRosa.IBQPesq_def.Close;
  DModRosa.IBQPesq_def.SQL.Clear;
  DModRosa.IBQPesq_def.SQL.Add('Select * from DEFEITO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_def.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutdef.Button3Click(Sender: TObject);
begin
  wmarca:=DModRosa.IBQPesq_def.fields.fields[0].AsString;
  DModRosa.IBQPesq_def.Close;
  FrmDefeito:=TFrmDefeito.Create(Self);
  FrmDefeito.edit1.Text:='Consultar';
  FrmDefeito.edit4.Text:=wmarca;
  FrmDefeito.ShowModal;
  FrmDefeito.release;
  DModRosa.IBQPesq_def.Close;
  DModRosa.IBQPesq_def.SQL.Clear;
  DModRosa.IBQPesq_def.SQL.Add('Select * from DEFEITO '+
                               'Order By Datnot,Numnot');
  DModRosa.IBQPesq_def.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutdef.Button4Click(Sender: TObject);
begin
  wmarca:=DModRosa.IBQPesq_def.fields.fields[0].AsString;
  DModRosa.IBQPesq_def.Close;
  FrmDefeito:=TFrmDefeito.Create(Self);
  FrmDefeito.edit1.Text:='Excluir';
  FrmDefeito.edit4.Text:=wmarca;
  FrmDefeito.ShowModal;
  FrmDefeito.release;
  DModRosa.IBQPesq_def.Close;
  DModRosa.IBQPesq_def.SQL.Clear;
  DModRosa.IBQPesq_def.SQL.Add('Select * from DEFEITO '+
                               'Order By datnot,Numnot');
  DModRosa.IBQPesq_def.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutdef.Edit1Exit(Sender: TObject);
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
  if DModRosa.IBQPesq_def.Active=True then
     DModRosa.IBQPesq_def.Active:=False;
  DModRosa.IBQPesq_def.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    while Length(edit1.Text)<6 do
        edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_def.Sql.Add('Select * from DEFEITO '+
                                 'Where NumNot=:num_digit');
    DModRosa.IBQPesq_def.ParamByName('num_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_def.Active:=True;
  end;
end;

procedure TFrmManutdef.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmManutdef.FormShow(Sender: TObject);
begin
  if DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=False;
  if DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=False;
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
  if not DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=true;
  // Monta Primeiro Grid ********************
  if DModRosa.IBQPesq_def.Active then
     DModRosa.IBQPesq_def.Active:=False;
  DModRosa.IBQPesq_def.Sql.Clear;
  DModRosa.IBQPesq_def.Sql.Add('Select * from DEFEITO '+
                               'Order by Datnot,Numnot');
  DModRosa.IBQPesq_def.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

end.
