unit UManutfor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable, frxClass,
  frxDBSet;

type
  TFrmManutfor = class(TForm)
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
    Button6: TButton;
    Button7: TButton;
    Button9: TButton;
    Label4: TLabel;
    IBTAuxfornecedor: TIBTable;
    IBTAuxcomp: TIBTable;
    IBQAuxfornecedor: TIBQuery;
    IBQAuxcomp: TIBQuery;
    IBQuery1: TIBQuery;
    IBQAuxfornecedorMARCA: TIBStringField;
    IBQAuxfornecedorRAZAO: TIBStringField;
    IBQAuxfornecedorPESSO: TIBStringField;
    IBQAuxfornecedorNCPF: TIBStringField;
    IBQAuxfornecedorCNPJ: TIBStringField;
    IBQAuxfornecedorINSC: TIBStringField;
    IBQAuxfornecedorENDE: TIBStringField;
    IBQAuxfornecedorBAIR: TIBStringField;
    IBQAuxfornecedorCIDA: TIBStringField;
    IBQAuxfornecedorESTA: TIBStringField;
    IBQAuxfornecedorNCEP: TIBStringField;
    IBQAuxfornecedorNTEL: TIBStringField;
    IBQAuxfornecedorRESP: TIBStringField;
    IBQAuxfornecedorRTEL: TIBStringField;
    IBQAuxfornecedorSITU: TIBStringField;
    IBTAuxfornecedorMARCA: TIBStringField;
    IBTAuxfornecedorRAZAO: TIBStringField;
    IBTAuxfornecedorPESSO: TIBStringField;
    IBTAuxfornecedorNCPF: TIBStringField;
    IBTAuxfornecedorCNPJ: TIBStringField;
    IBTAuxfornecedorINSC: TIBStringField;
    IBTAuxfornecedorENDE: TIBStringField;
    IBTAuxfornecedorBAIR: TIBStringField;
    IBTAuxfornecedorCIDA: TIBStringField;
    IBTAuxfornecedorESTA: TIBStringField;
    IBTAuxfornecedorNCEP: TIBStringField;
    IBTAuxfornecedorNTEL: TIBStringField;
    IBTAuxfornecedorRESP: TIBStringField;
    IBTAuxfornecedorRTEL: TIBStringField;
    IBTAuxfornecedorSITU: TIBStringField;
    IBTAuxcompDATPED: TDateField;
    IBTAuxcompTIPPED: TIBStringField;
    IBTAuxcompNUMPED: TIBStringField;
    IBTAuxcompFORNEC: TIBStringField;
    IBTAuxcompENTREG: TDateField;
    IBTAuxcompTOTPED: TIBBCDField;
    IBTAuxcompDATNOT: TDateField;
    IBTAuxcompTIPNOT: TIBStringField;
    IBTAuxcompNUMNOT: TIBStringField;
    IBTAuxcompDESCON: TIBBCDField;
    IBTAuxcompFRETE: TIBBCDField;
    IBTAuxcompVALNOT: TIBBCDField;
    IBTAuxcompSITPED: TIBStringField;
    IBTAuxcompPARCEL: TIBStringField;
    IBTAuxcompOBSERV: TBlobField;
    IBQAuxcompDATPED: TDateField;
    IBQAuxcompTIPPED: TIBStringField;
    IBQAuxcompNUMPED: TIBStringField;
    IBQAuxcompFORNEC: TIBStringField;
    IBQAuxcompENTREG: TDateField;
    IBQAuxcompTOTPED: TIBBCDField;
    IBQAuxcompDATNOT: TDateField;
    IBQAuxcompTIPNOT: TIBStringField;
    IBQAuxcompNUMNOT: TIBStringField;
    IBQAuxcompDESCON: TIBBCDField;
    IBQAuxcompFRETE: TIBBCDField;
    IBQAuxcompVALNOT: TIBBCDField;
    IBQAuxcompSITPED: TIBStringField;
    IBQAuxcompPARCEL: TIBStringField;
    IBQAuxcompOBSERV: TBlobField;
    IBTAuxitcomp: TIBTable;
    IBQAuxitcomp: TIBQuery;
    IBTAuxitcompDATPED: TDateField;
    IBTAuxitcompNUMPED: TIBStringField;
    IBTAuxitcompITEM: TIBStringField;
    IBTAuxitcompCODART: TIBStringField;
    IBTAuxitcompDESCRICAO: TIBStringField;
    IBTAuxitcompQUANT: TIntegerField;
    IBTAuxitcompCUSTO: TIBBCDField;
    IBTAuxitcompQTDANT: TIntegerField;
    IBTAuxitcompCUSANT: TIBBCDField;
    IBTAuxitcompDESCON: TIBBCDField;
    IBTAuxitcompTAMANHO: TIBStringField;
    IBTAuxitcompCOR: TIBStringField;
    IBTAuxitcompOPER: TIBStringField;
    IBQAuxitcompDATPED: TDateField;
    IBQAuxitcompNUMPED: TIBStringField;
    IBQAuxitcompITEM: TIBStringField;
    IBQAuxitcompCODART: TIBStringField;
    IBQAuxitcompDESCRICAO: TIBStringField;
    IBQAuxitcompQUANT: TIntegerField;
    IBQAuxitcompCUSTO: TIBBCDField;
    IBQAuxitcompQTDANT: TIntegerField;
    IBQAuxitcompCUSANT: TIBBCDField;
    IBQAuxitcompDESCON: TIBBCDField;
    IBQAuxitcompTAMANHO: TIBStringField;
    IBQAuxitcompCOR: TIBStringField;
    IBQAuxitcompOPER: TIBStringField;
    DBGrid1: TDBGrid;
    Label3: TLabel;
    frxPedlimpo: TfrxReport;
    frxPedCompra: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    DtsAuxcomp: TDataSource;
    DtsAuxitcomp: TDataSource;
    Button5: TButton;
    frxRelcompra: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    Button8: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure frxPedlimpoGetValue(const VarName: string; var Value: Variant);
    procedure frxPedCompraGetValue(const VarName: string; var Value: Variant);
    procedure Button5Click(Sender: TObject);
    procedure frxRelcompraGetValue(const VarName: string; var Value: Variant);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutfor: TFrmManutfor;
  wmarca,xrota,wcodcli,wcida,wvend,wnommae,wnompai,wdatnas,wpraca,wobsv,wdatini: string;
  wdatfin,wrota,wnatu,wnompraca,wdatnot,wfornec,witem,wtamanho,wsitu,wobserv,wnumnot,wnumped: string;
  wlcre,wvalnot,wtotpro,wtotal,wtotped,wdesco,wqtda,wpreco,wfrete,wdescon: Extended;
  wtipped,wdatped,wtipnot,wparcel,wentreg,wcodigo,wdescricao,wcor: string;
implementation

{$R *.dfm}

uses UDModRosa, UFornec, UCompras, UAjustcomp;
     // UCompra, UOrdem_fornec;

procedure TFrmManutfor.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col031').AsString='X' then
  begin
    DModRosa.IBQPesq_for.Close;
    FrmFornec:=TFrmFornec.Create(Self);
    FrmFornec.edit11.Text:='Implantar';
    FrmFornec.ShowModal;
    FrmFornec.release;
  end else
      showmessage('Não Autorizado !!');
  DModRosa.IBQPesq_for.Close;
  DModRosa.IBQPesq_for.SQL.Clear;
  DModRosa.IBQPesq_for.SQL.Add('Select * from FORNECEDOR '+
                               'Order By Marca,Razao');
  DModRosa.IBQPesq_for.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutfor.Button2Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col032').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_for.fields.fields[0].AsString;
    DModRosa.IBQPesq_for.Close;
    FrmFornec:=TFrmFornec.Create(Self);
    FrmFornec.edit11.Text:='Alterar';
    FrmFornec.edit1.Text:=wmarca;
    FrmFornec.ShowModal;
    FrmFornec.release;
  end else
      showmessage('Não Autorizado !!!!');
  DModRosa.IBQPesq_for.Close;
  DModRosa.IBQPesq_for.SQL.Clear;
  DModRosa.IBQPesq_for.SQL.Add('Select * from FORNECEDOR '+
                               'Order By Marca,Razao');
  DModRosa.IBQPesq_for.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutfor.Button3Click(Sender: TObject);
begin
   IBQuery1.Open;
  if IBQuery1.FieldByName('Col033').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_for.fields.fields[0].AsString;
    DModRosa.IBQPesq_for.Close;
    FrmFornec:=TFrmFornec.Create(Self);
    FrmFornec.edit11.Text:='Consultar';
    FrmFornec.edit1.Text:=wmarca;
    FrmFornec.ShowModal;
    FrmFornec.release;
  end else
      showmessage('Não Autorizado !!');
  DModRosa.IBQPesq_for.Close;
  DModRosa.IBQPesq_for.SQL.Clear;
  DModRosa.IBQPesq_for.SQL.Add('Select * from FORNECEDOR '+
                               'Order By Marca,Razao');
  DModRosa.IBQPesq_for.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutfor.Button4Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col034').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_for.fields.fields[0].AsString;
    DModRosa.IBQPesq_for.Close;
    FrmFornec:=TFrmFornec.Create(Self);
    FrmFornec.edit11.Text:='Excluir';
    FrmFornec.edit1.Text:=wmarca;
    FrmFornec.ShowModal;
    FrmFornec.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_for.Close;
  DModRosa.IBQPesq_for.SQL.Clear;
  DModRosa.IBQPesq_for.SQL.Add('Select * from FORNECEDOR '+
                               'Order By Marca,Razao');
  DModRosa.IBQPesq_for.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutfor.Button5Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col038').AsString='X' then
  begin
    wdatini:='';
    wdatfin:='';
    wtotal:=0;
    IBTAuxcomp.EmptyTable;
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
    DModRosa.IBQPesq_comp.Close;
    DModRosa.IBQVer_comp.Close;
    DModRosa.IBQVer_comp.SQL.Clear;
    DModRosa.IBQVer_comp.SQL.Add('Select * from COMPRA '+
                                 'Where Datnot>=:ini_digit '+
                                 'and Datnot<=:fin_digit '+
                                 'Order By Datnot,Numnot');
    DModRosa.IBQVer_comp.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
    DModRosa.IBQVer_comp.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
    DModRosa.IBQVer_comp.OPen;
    DModRosa.IBQVer_comp.DisableControls;
    DModRosa.IBQVer_comp.First;
    while not DModRosa.IBQVer_comp.Eof do
    begin
      wdatped:=DateToStr(DModRosa.IBQVer_comp.fieldbyName('Datped').AsDateTime);
      wtipped:=DModRosa.IBQVer_comp.fieldbyName('Tipped').AsString;
      wnumped:=DModRosa.IBQVer_comp.fieldbyName('Numped').AsString;
      wfornec:=DModRosa.IBQVer_comp.fieldbyName('Fornec').AsString;
      wentreg:=DateToStr(DModRosa.IBQVer_comp.fieldbyName('Entreg').AsDateTime);
      wtotped:=DModRosa.IBQVer_comp.fieldbyName('Totped').AsFloat;
      wdatnot:=DateToStr(DModRosa.IBQVer_comp.fieldbyName('Datnot').AsDateTime);
      wtipnot:=DModRosa.IBQVer_comp.fieldbyName('Tipnot').AsString;
      wnumnot:=DModRosa.IBQVer_comp.fieldbyName('Numnot').AsString;
      wvalnot:=DModRosa.IBQVer_comp.fieldbyName('Valnot').AsFloat;
      if IBQAuxcomp.Active then
         IBQAuxcomp.Active:=False;
      IBQAuxcomp.Sql.Clear;
      IBQAuxcomp.Sql.Add('Insert Into AUXCOMPRA ');
      IBQAuxcomp.Sql.Add('(DATPED,TIPPED,NUMPED,FORNEC,ENTREG,TOTPED,DATNOT,'+
                        'TIPNOT,NUMNOT,DESCON,FRETE,VALNOT,SITPED,'+
                        'PARCEL,OBSERV) '+
                 'Values(:DATPED,:TIPPED,:NUMPED,:FORNEC,:ENTREG,:TOTPED,:DATNOT,'+
                        ':TIPNOT,:NUMNOT,:DESCON,:FRETE,:VALNOT,:SITPED,'+
                        ':PARCEL,:OBSERV)');
      IBQAuxcomp.ParamByName('DATPED').AsDateTime:=StrTodate(wdatped);
      IBQAuxcomp.ParamByName('TIPPED').AsString:=wtipped;
      IBQAuxcomp.ParamByName('NUMPED').AsString:=wnumped;
      IBQAuxcomp.ParamByName('FORNEC').AsString:=wfornec;
      IBQAuxcomp.ParamByName('ENTREG').AsDateTime:=StrToDate(wdatnot);
      IBQAuxcomp.ParamByName('TOTPED').AsFloat:=wtotped;
      IBQAuxcomp.ParamByName('DATNOT').AsDateTime:=StrToDate(wdatnot);
      IBQAuxcomp.ParamByName('TIPNOT').AsString:=wtipnot;
      IBQAuxcomp.ParamByName('NUMNOT').AsString:=wnumnot;
      IBQAuxcomp.ParamByName('DESCON').AsFloat:=wdescon;
      IBQAuxcomp.ParamByName('FRETE').AsFloat:=wfrete;
      IBQAuxcomp.ParamByName('VALNOT').AsFloat:=wvalnot;
      IBQAuxcomp.ParamByName('SITPED').AsString:=wsitu;
      IBQAuxcomp.ParamByName('PARCEL').Asstring:=wparcel;
      IBQAuxcomp.ParamByName('OBSERV').Asstring:=wobserv;
      IBQAuxcomp.ExecSql;
      IBQAuxcomp.Close;
      DModRosa.IBQVer_comp.Next;
    end;
    DModRosa.IBQVer_comp.Close;
    IBQAuxcomp.Close;
    IBQAuxcomp.SQL.Clear;
    IBQAuxcomp.SQL.Add('Select * from AUXCOMPRA '+
                       'Order By Datped,Tipped,Numped');
    IBQAuxcomp.OPen;
    IBQAuxcomp.Close;
    // Emite a relação ******************
    frxRelcompra.ShowReport;
  end else
      showmessage('Não Autorizado !!');
  DModRosa.IBQPesq_comp.Close;
  DModRosa.IBQPesq_comp.SQL.Clear;
  DModRosa.IBQPesq_comp.SQL.Add('Select * from COMPRA '+
                                'Order By Datnot,Numnot');
  DModRosa.IBQPesq_comp.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutfor.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=DBGrid1) or
     (ActiveControl=Button9) or
     (ActiveControl=Button6) then
     exit;
  if edit1.Text='' then
  begin
    showmessage('Informe o elemento de procura');
    ComboBox1.SetFocus;
    exit;
  end;
  // Pesquiza grid *************************
  if DModRosa.IBQPesq_for.Active=True then
     DModRosa.IBQPesq_for.Active:=False;
  DModRosa.IBQPesq_for.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    DModRosa.IBQPesq_for.Sql.Add('Select * from FORNECEDOR '+
                                 'Where Marca=:marc_digit');
    DModRosa.IBQPesq_for.ParamByName('marc_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_for.Active:=True;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    DModRosa.IBQPesq_for.Sql.Add('Select * from FORNECEDOR '+
                                 'Where RAZAO LIKE '+#39+'%'+edit1.Text+'%'+#39);
    DModRosa.IBQPesq_for.Active:=True;
  end;
end;

procedure TFrmManutfor.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmManutfor.FormShow(Sender: TObject);
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
  if DModRosa.IBQPesq_for.Active then
     DModRosa.IBQPesq_for.Active:=False;
  DModRosa.IBQPesq_for.Sql.Clear;
  DModRosa.IBQPesq_for.Sql.Add('Select * from FORNECEDOR '+
                               'Order by Marca,Razao');
  DModRosa.IBQPesq_for.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutfor.frxPedCompraGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Datrel')=0 then
     value:=wdatini+'  A  '+wdatfin;
end;

procedure TFrmManutfor.frxPedlimpoGetValue(const VarName: string;
  var Value: Variant);
begin
  if CompareText(VarName, 'Periodo') = 0 then
     Value :=wdatini+' A '+wdatfin;
  if CompareText(VarName, 'Total') = 0 then
     Value :=FormatFloat('##,##0.00',wtotal);
end;

procedure TFrmManutfor.frxRelcompraGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Datrel')=0 then
     value:=wdatini+'  A  '+wdatfin;
end;

procedure TFrmManutfor.Button6Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col035').AsString='X' then
  begin
    frxPedlimpo.ShowReport;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_for.Close;
  DModRosa.IBQPesq_for.SQL.Clear;
  DModRosa.IBQPesq_for.SQL.Add('Select * from FORNECEDOR '+
                               'Order By Marca,Razao');
  DModRosa.IBQPesq_for.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutfor.Button7Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col036').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_for.fields.fields[0].AsString;
    DModRosa.IBQPesq_for.Close;
    FrmCompras:=TFrmCompras.Create(Self);
    FrmCompras.edit2.Text:=wmarca;
    FrmCompras.ShowModal;
    FrmCompras.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_for.Close;
  DModRosa.IBQPesq_for.SQL.Clear;
  DModRosa.IBQPesq_for.SQL.Add('Select * from FORNECEDOR '+
                               'Order By Marca,Razao');
  DModRosa.IBQPesq_for.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

procedure TFrmManutfor.Button8Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col036').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_for.fields.fields[0].AsString;
    DModRosa.IBQPesq_for.Close;
    FrmAjustcomp:=TFrmAjustcomp.Create(Self);
    FrmAjustcomp.edit2.Text:=wmarca;
    FrmAjustcomp.ShowModal;
    FrmAjustcomp.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_for.Close;
  DModRosa.IBQPesq_for.SQL.Clear;
  DModRosa.IBQPesq_for.SQL.Add('Select * from FORNECEDOR '+
                               'Order By Marca,Razao');
  DModRosa.IBQPesq_for.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
end;

procedure TFrmManutfor.Button9Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col037').AsString='X' then
  begin
    wdatini:='';
    wdatfin:='';
    wtotal:=0;
    IBTAuxcomp.EmptyTable;
    IBTAuxitcomp.EmptyTable;
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
    DModRosa.IBQPesq_comp.Close;
    DModRosa.IBQVer_comp.Close;
    DModRosa.IBQVer_comp.SQL.Clear;
    DModRosa.IBQVer_comp.SQL.Add('Select * from COMPRA '+
                                 'Where Datnot>=:ini_digit '+
                                 'and Datnot<=:fin_digit '+
                                 'Order By Datnot,Numnot');
    DModRosa.IBQVer_comp.ParamByName('ini_digit').AsDateTime:=StrToDate(wdatini);
    DModRosa.IBQVer_comp.ParamByName('fin_digit').AsDateTime:=StrToDate(wdatfin);
    DModRosa.IBQVer_comp.OPen;
    DModRosa.IBQVer_comp.DisableControls;
    DModRosa.IBQVer_comp.First;
    while not DModRosa.IBQVer_comp.Eof do
    begin
      wdatped:=DateToStr(DModRosa.IBQVer_comp.fieldbyName('Datped').AsDateTime);
      wtipped:=DModRosa.IBQVer_comp.fieldbyName('Tipped').AsString;
      wnumped:=DModRosa.IBQVer_comp.fieldbyName('Numped').AsString;
      wfornec:=DModRosa.IBQVer_comp.fieldbyName('Fornec').AsString;
      wentreg:=DateToStr(DModRosa.IBQVer_comp.fieldbyName('Entreg').AsDateTime);
      wtotped:=DModRosa.IBQVer_comp.fieldbyName('Totped').AsFloat;
      wdatnot:=DateToStr(DModRosa.IBQVer_comp.fieldbyName('Datnot').AsDateTime);
      wtipnot:=DModRosa.IBQVer_comp.fieldbyName('Tipnot').AsString;
      wnumnot:=DModRosa.IBQVer_comp.fieldbyName('Numnot').AsString;
      wvalnot:=DModRosa.IBQVer_comp.fieldbyName('Valnot').AsFloat;
      DModRosa.IBQPesq_itcomp.Close;
      DModRosa.IBQVer_itcomp.Close;
      DModRosa.IBQVer_itcomp.SQL.Clear;
      DModRosa.IBQVer_itcomp.SQL.Add('Select * from ITEMCOMPRA '+
                                     'Where Numped=:num_digit '+
                                     'Order By Item,Codart');
      DModRosa.IBQVer_itcomp.ParamByName('num_digit').AsString:=wnumped;
      DModRosa.IBQVer_itcomp.OPen;
      DModRosa.IBQVer_itcomp.DisableControls;
      DModRosa.IBQVer_itcomp.First;
      while not DModRosa.IBQVer_itcomp.Eof do
      begin
        witem:=DModRosa.IBQVer_itcomp.fieldbyName('Item').AsString;
        wcodigo:=DModRosa.IBQVer_itcomp.fieldbyName('Codart').AsString;
        wdescricao:=DModRosa.IBQVer_itcomp.fieldbyName('Descricao').AsString;
        wqtda:=DModRosa.IBQVer_itcomp.fieldbyName('Quant').AsFloat;
        wpreco:=DModRosa.IBQVer_itcomp.fieldbyName('Precom').AsFloat;
        wdesco:=DModRosa.IBQVer_itcomp.fieldbyName('Descon').AsFloat;
        wtamanho:=DModRosa.IBQVer_itcomp.fieldbyName('Tamanho').AsString;
        wcor:=DModRosa.IBQVer_itcomp.fieldbyName('Cor').AsString;
        wtotal:=wtotal+(wqtda*wpreco);
        wtotpro:=wqtda*wpreco;
        if IBQAuxitcomp.Active then
           IBQAuxitcomp.Active:=False;
        IBQAuxitcomp.Sql.Clear;
        IBQAuxitcomp.Sql.Add('Insert Into AUXLISTCOM ');
        IBQAuxitcomp.Sql.Add('(DATPED,NUMPED,ITEM,CODART,DESCRICAO,QUANT,CUSTO,'+
                             'QTDANT,CUSANT,DESCON,TAMANHO,COR,OPER) '+
                     'Values(:DATPED,:NUMPED,:ITEM,:CODART,:DESCRICAO,:QUANT,:CUSTO,'+
                            ':QTDANT,:CUSANT,:DESCON,:TAMANHO,:COR,:OPER)');
        IBQAuxitcomp.ParamByName('DATPED').AsDateTime:=StrToDate(wdatped);
        IBQAuxitcomp.ParamByName('NUMPED').AsString:=wnumped;
        IBQAuxitcomp.ParamByName('ITEM').AsString:=witem;
        IBQAuxitcomp.ParamByName('CODART').AsString:=wcodigo;
        IBQAuxitcomp.ParamByName('DESCRICAO').AsString:=wdescricao;
        IBQAuxitcomp.ParamByName('QUANT').AsFloat:=wqtda;
        IBQAuxitcomp.ParamByName('CUSTO').AsFloat:=wpreco;
        IBQAuxitcomp.ParamByName('QTDANT').AsFloat:=wqtda;
        IBQAuxitcomp.ParamByName('CUSANT').AsFloat:=wpreco*wqtda;
        IBQAuxitcomp.ParamByName('DESCON').AsFloat:=wdesco;
        IBQAuxitcomp.ParamByName('TAMANHO').AsString:=wtamanho;
        IBQAuxitcomp.ParamByName('COR').AsString:=wcor;
        IBQAuxitcomp.ParamByName('OPER').AsString:='';
        IBQAuxitcomp.ExecSql;
        IBQAuxitcomp.Close;
        DModRosa.IBQVer_itcomp.Next;
      end;
      DModRosa.IBQVer_itcomp.Close;
      if IBQAuxcomp.Active then
         IBQAuxcomp.Active:=False;
      IBQAuxcomp.Sql.Clear;
      IBQAuxcomp.Sql.Add('Insert Into AUXCOMPRA ');
      IBQAuxcomp.Sql.Add('(DATPED,TIPPED,NUMPED,FORNEC,ENTREG,TOTPED,DATNOT,'+
                         'TIPNOT,NUMNOT,DESCON,FRETE,VALNOT,SITPED,'+
                         'PARCEL,OBSERV) '+
                  'Values(:DATPED,:TIPPED,:NUMPED,:FORNEC,:ENTREG,:TOTPED,:DATNOT,'+
                         ':TIPNOT,:NUMNOT,:DESCON,:FRETE,:VALNOT,:SITPED,'+
                         ':PARCEL,:OBSERV)');
      IBQAuxcomp.ParamByName('DATPED').AsDateTime:=StrTodate(wdatped);
      IBQAuxcomp.ParamByName('TIPPED').AsString:=wtipped;
      IBQAuxcomp.ParamByName('NUMPED').AsString:=wnumped;
      IBQAuxcomp.ParamByName('FORNEC').AsString:=wfornec;
      IBQAuxcomp.ParamByName('ENTREG').AsDateTime:=StrToDate(wdatnot);
      IBQAuxcomp.ParamByName('TOTPED').AsFloat:=wtotped;
      IBQAuxcomp.ParamByName('DATNOT').AsDateTime:=StrToDate(wdatnot);
      IBQAuxcomp.ParamByName('TIPNOT').AsString:=wtipnot;
      IBQAuxcomp.ParamByName('NUMNOT').AsString:=wnumnot;
      IBQAuxcomp.ParamByName('DESCON').AsFloat:=wdescon;
      IBQAuxcomp.ParamByName('FRETE').AsFloat:=wfrete;
      IBQAuxcomp.ParamByName('VALNOT').AsFloat:=wvalnot;
      IBQAuxcomp.ParamByName('SITPED').AsString:=wsitu;
      IBQAuxcomp.ParamByName('PARCEL').Asstring:=wparcel;
      IBQAuxcomp.ParamByName('OBSERV').Asstring:=wobserv;
      IBQAuxcomp.ExecSql;
      IBQAuxcomp.Close;
      DModRosa.IBQVer_comp.Next;
    end;
    DModRosa.IBQVer_comp.Close;
    IBQAuxcomp.Close;
    IBQAuxcomp.SQL.Clear;
    IBQAuxcomp.SQL.Add('Select * from AUXCOMPRA '+
                       'Order By Datped,Tipped,Numped');
    IBQAuxcomp.OPen;
    IBQAuxcomp.Close;
    IBQAuxitcomp.Close;
    IBQAuxitcomp.SQL.Clear;
    IBQAuxitcomp.SQL.Add('Select * from AUXLISTCOM '+
                         'Order By Datped,Numped,Item');
    IBQAuxitcomp.OPen;
    IBQAuxitcomp.Close;
     // Emite a relação ******************
    frxPedcompra.ShowReport;
  end else
      showmessage('Não Autorizado !!');
  DModRosa.IBQPesq_comp.Close;
  DModRosa.IBQPesq_comp.SQL.Clear;
  DModRosa.IBQPesq_comp.SQL.Add('Select * from COMPRA '+
                                'Order By Datnot,Numnot');
  DModRosa.IBQPesq_comp.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

end.
