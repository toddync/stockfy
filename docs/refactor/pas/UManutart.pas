unit UManutart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, IBX.IBTable, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, frxClass,
  frxDBSet;

type
  TFrmManutart = class(TForm)
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
    Button5: TButton;
    Button6: TButton;
    Button9: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    IBQArtMapa: TIBQuery;
    IBQRelcad: TIBQuery;
    IBTArtmapa: TIBTable;
    IBQArtMapaITEM: TIBStringField;
    IBQArtMapaPEDIDO: TIBStringField;
    IBQArtMapaCODIGO: TIBStringField;
    IBQArtMapaBASE: TIBStringField;
    IBQArtMapaQUANT: TIntegerField;
    IBQArtMapaPRECO: TIBBCDField;
    IBTRelcad: TIBTable;
    IBQRelcadCODART: TIBStringField;
    IBQRelcadDESCRICAO: TIBStringField;
    IBQRelcadESTOQ: TIntegerField;
    IBQRelcadCOMPRA: TIntegerField;
    IBQRelcadDEFEITO: TIntegerField;
    IBQRelcadRETDEV: TIntegerField;
    IBQRelcadSAIDA: TIntegerField;
    IBQRelcadQTDFIS: TIntegerField;
    IBQRelcadVALFIS: TIntegerField;
    IBQRelcadQTDSAC: TIntegerField;
    IBQRelcadVALSAC: TIBBCDField;
    IBQRelcadQTDREAL: TIntegerField;
    IBQRelcadVALREAL: TIBBCDField;
    IBQRelcadQTDVEN: TIntegerField;
    IBQRelcadVALVEN: TIBBCDField;
    IBQRelcadCUSTO: TIBBCDField;
    IBQRelcadMEDIA: TIntegerField;
    IBQRelcadAPURADO: TIntegerField;
    IBQRelcadNASACOL: TIntegerField;
    IBTArtmapaITEM: TIBStringField;
    IBTArtmapaPEDIDO: TIBStringField;
    IBTArtmapaCODIGO: TIBStringField;
    IBTArtmapaBASE: TIBStringField;
    IBTArtmapaQUANT: TIntegerField;
    IBTArtmapaPRECO: TIBBCDField;
    IBQuery1: TIBQuery;
    RvCadart: TfrxReport;
    DtsCadart: TfrxDBDataset;
    Button7: TButton;
    Button8: TButton;
    RvRelart: TfrxReport;
    IBTRelcadCODART: TIBStringField;
    IBTRelcadDESCRICAO: TIBStringField;
    IBTRelcadESTOQ: TIntegerField;
    IBTRelcadCOMPRA: TIntegerField;
    IBTRelcadDEFEITO: TIntegerField;
    IBTRelcadRETDEV: TIntegerField;
    IBTRelcadSAIDA: TIntegerField;
    IBTRelcadQTDFIS: TIntegerField;
    IBTRelcadVALFIS: TIntegerField;
    IBTRelcadQTDSAC: TIntegerField;
    IBTRelcadVALSAC: TIBBCDField;
    IBTRelcadQTDREAL: TIntegerField;
    IBTRelcadVALREAL: TIBBCDField;
    IBTRelcadQTDVEN: TIntegerField;
    IBTRelcadVALVEN: TIBBCDField;
    IBTRelcadCUSTO: TIBBCDField;
    IBTRelcadMEDIA: TIntegerField;
    IBTRelcadAPURADO: TIntegerField;
    IBTRelcadNASACOL: TIntegerField;
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure RvCadartGetValue(const VarName: string; var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmManutart: TFrmManutart;
  wmarca,wgrupo,wdatini,wdatfin,wcodart,wdescricao: string;
  wtotcus,wtotven,wcusto,wvenda,westoq,wprevip: Extended;
  ArrArti: array of string;
  ArrQtda: array of real;
  x,y,z: Integer;


implementation

{$R *.dfm}

uses UDModRosa, UArtigo, UContando, UEtiqbar,
     URelArtigos;

procedure TFrmManutart.Button1Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col022').AsString='X' then
  begin
    DModRosa.IBQPesq_art.Close;
    FrmArtigo:=TFrmArtigo.Create(Self);
    FrmArtigo.edit6.Text:='Implantar';
    FrmArtigo.ShowModal;
    FrmArtigo.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutart.Button2Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col023').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_art.fields.fields[0].AsString;
    wgrupo:=DModRosa.IBQPesq_art.fields.fields[1].AsString;
    DModRosa.IBQPesq_art.Close;
    FrmArtigo:=TFrmArtigo.Create(Self);
    FrmArtigo.edit6.Text:='Alterar';
    FrmArtigo.edit1.Text:=wmarca;
    FrmArtigo.edit4.Text:=wgrupo;
    FrmArtigo.ShowModal;
    FrmArtigo.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

Procedure TFrmManutart.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=DBGrid1) or
     (ActiveControl=Button1) then
     exit;
  if edit1.Text='' then
  begin
    showmessage('Informe o elemento de procura');
    ComboBox1.SetFocus;
    exit;
  end;
  // Pesquiza grid *************************
  if DModRosa.IBQPesq_art.Active=True then
     DModRosa.IBQPesq_art.Active:=False;
  DModRosa.IBQPesq_art.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    while Length(edit1.Text)<4 do
        edit1.Text:='0'+edit1.Text;
    DModRosa.IBQPesq_art.Sql.Add('Select * from ARTIGO '+
                                 'Where Codigo=:cod_digit');
    DModRosa.IBQPesq_art.ParamByName('cod_digit').AsString:=edit1.Text;
    DModRosa.IBQPesq_art.Active:=True;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    DModRosa.IBQPesq_art.Sql.Add('Select * from ARTIGO '+
                                 'Where Descricao LIKE '+#39+'%'+edit1.Text+'%'+#39);
    DModRosa.IBQPesq_art.Active:=True;
  end;
end;

procedure TFrmManutart.Button3Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col024').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_art.fields.fields[0].AsString;
    wgrupo:=DModRosa.IBQPesq_art.fields.fields[1].AsString;
    DModRosa.IBQPesq_art.Close;
    FrmArtigo:=TFrmArtigo.Create(Self);
    FrmArtigo.edit6.Text:='Consultar';
    FrmArtigo.edit1.Text:=wmarca;
    FrmArtigo.edit4.Text:=wgrupo;
    FrmArtigo.ShowModal;
    FrmArtigo.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
end;

procedure TFrmManutart.Button4Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col025').AsString='X' then
  begin
    wmarca:=DModRosa.IBQPesq_art.fields.fields[0].AsString;
    wgrupo:=DModRosa.IBQPesq_art.fields.fields[1].AsString;
    DModRosa.IBQPesq_art.Close;
    FrmArtigo:=TFrmArtigo.Create(Self);
    FrmArtigo.edit6.Text:='Excluir';
    FrmArtigo.edit1.Text:=wmarca;
    FrmArtigo.edit4.Text:=wgrupo;
    FrmArtigo.ShowModal;
    FrmArtigo.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutart.Button5Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col026').AsString='X' then
  begin
    DModRosa.IBQPesq_art.Close;
    FrmContando:=TFrmContando.Create(Self);
    FrmContando.ShowModal;
    FrmContando.release;
  end else
      showmessage('Não Autorizado !!!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutart.Button6Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col027').AsString='X' then
  begin
    IBTRelcad.EmptyTable;
    DModRosa.IBQLer_art.Close;
    DModRosa.IBQLer_art.SQL.Clear;
    DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                'Order by Codigo');
    DModRosa.IBQLer_art.OPen;
    DModRosa.IBQLer_art.DisableControls;
    DModRosa.IBQLer_art.First;
    while not DModRosa.IBQLer_art.Eof do
    begin
      wtotcus:=0;
      wtotven:=0;
      wcusto:=DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
      wvenda:=DModRosa.IBQLer_art.fieldbyName('Venda').AsFloat;
      wprevip:=DModRosa.IBQLer_art.fieldbyName('Previp').AsFloat;
      westoq:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat;
      wcodart:=DModRosa.IBQLer_art.fieldbyName('Codigo').AsString;
      wdescricao:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
      if DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat>0 then
      begin
        wtotcus:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat*
                 DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
        wtotven:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat*
                 DModRosa.IBQLer_art.fieldbyName('Venda').AsFloat;
      end;
      if IBQRelcad.Active then
         IBQRelcad.Active:=False;
      IBQRelcad.Sql.Clear;
      IBQRelcad.Sql.Add('Insert Into AUXMAPAO ');
      IBQRelcad.Sql.Add('(CODART,DESCRICAO,ESTOQ,COMPRA,DEFEITO,RETDEV,SAIDA,'+
                        'QTDFIS,VALFIS,QTDSAC,VALSAC,QTDREAL,VALREAL,'+
                        'QTDVEN,VALVEN,CUSTO,MEDIA) '+
                'Values(:CODART,:DESCRICAO,:ESTOQ,:COMPRA,:DEFEITO,:RETDEV,:SAIDA,'+
                        ':QTDFIS,:VALFIS,:QTDSAC,:VALSAC,:QTDREAL,:VALREAL,'+
                       ':QTDVEN,:VALVEN,:CUSTO,:MEDIA)');
      IBQRelcad.ParamByName('CODART').AsString:=wcodart;
      IBQRelcad.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQRelcad.ParamByName('ESTOQ').AsFloat:=0;
      IBQRelcad.ParamByName('COMPRA').AsFloat:=0;
      IBQRelcad.ParamByName('DEFEITO').AsFloat:=0;
      IBQRelcad.ParamByName('RETDEV').AsFloat:=0;
      IBQRelcad.ParamByName('SAIDA').AsFloat:=westoq;
      IBQRelcad.ParamByName('QTDFIS').AsFloat:=0;
      IBQRelcad.ParamByName('VALFIS').AsFloat:=wtotven;
      IBQRelcad.ParamByName('QTDSAC').AsFloat:=0;
      IBQRelcad.ParamByName('VALSAC').AsFloat:=wtotcus;
      IBQRelcad.ParamByName('QTDREAL').AsFloat:=0;
      IBQRelcad.ParamByName('VALREAL').AsFloat:=wprevip;
      IBQRelcad.ParamByName('QTDVEN').AsFloat:=0;
      IBQRelcad.ParamByName('VALVEN').AsFloat:=wvenda;
      IBQRelcad.ParamByName('CUSTO').AsFloat:=wcusto;
      IBQRelcad.ParamByName('MEDIA').AsFloat:=0;
      IBQRelcad.ExecSql;
      IBQRelcad.Close;
      DModRosa.IBQLer_art.Next;
    end;
    DModRosa.IBQLer_art.Close;
    IBQRelcad.Close;
    IBQRelcad.SQL.Clear;
    IBQRelcad.SQL.Add('Select * from AUXMAPA '+
                      'Order By Codart');
    IBQRelcad.OPen;
    IBQRelcad.Close;
    // Emite a relação ******************
    RvCadart.ShowReport;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutart.Button7Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col028').AsString='X' then
  begin
    DModRosa.IBQPesq_art.Close;
    FrmEtiqbar:=TFrmEtiqbar.Create(Self);
    FrmEtiqbar.ShowModal;
    FrmEtiqbar.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutart.Button8Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col029').AsString='X' then
  begin
    IBTRelcad.EmptyTable;
    DModRosa.IBQLer_art.Close;
    DModRosa.IBQLer_art.SQL.Clear;
    DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                'Order by Codigo');
    DModRosa.IBQLer_art.OPen;
    DModRosa.IBQLer_art.DisableControls;
    DModRosa.IBQLer_art.First;
    while not DModRosa.IBQLer_art.Eof do
    begin
      wtotcus:=0;
      wtotven:=0;
      wcusto:=DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
      wvenda:=DModRosa.IBQLer_art.fieldbyName('Venda').AsFloat;
      wprevip:=DModRosa.IBQLer_art.fieldbyName('Previp').AsFloat;
      westoq:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat;
      wcodart:=DModRosa.IBQLer_art.fieldbyName('Codigo').AsString;
      wdescricao:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
      if DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat>0 then
      begin
        wtotcus:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat*
                 DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
        wtotven:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat*
                 DModRosa.IBQLer_art.fieldbyName('Venda').AsFloat;
      end;
      if IBQRelcad.Active then
         IBQRelcad.Active:=False;
      IBQRelcad.Sql.Clear;
      IBQRelcad.Sql.Add('Insert Into AUXMAPAO ');
      IBQRelcad.Sql.Add('(CODART,DESCRICAO,ESTOQ,COMPRA,DEFEITO,RETDEV,SAIDA,'+
                        'QTDFIS,VALFIS,QTDSAC,VALSAC,QTDREAL,VALREAL,'+
                        'QTDVEN,VALVEN,CUSTO,MEDIA) '+
                'Values(:CODART,:DESCRICAO,:ESTOQ,:COMPRA,:DEFEITO,:RETDEV,:SAIDA,'+
                        ':QTDFIS,:VALFIS,:QTDSAC,:VALSAC,:QTDREAL,:VALREAL,'+
                       ':QTDVEN,:VALVEN,:CUSTO,:MEDIA)');
      IBQRelcad.ParamByName('CODART').AsString:=wcodart;
      IBQRelcad.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQRelcad.ParamByName('ESTOQ').AsFloat:=0;
      IBQRelcad.ParamByName('COMPRA').AsFloat:=0;
      IBQRelcad.ParamByName('DEFEITO').AsFloat:=0;
      IBQRelcad.ParamByName('RETDEV').AsFloat:=0;
      IBQRelcad.ParamByName('SAIDA').AsFloat:=westoq;
      IBQRelcad.ParamByName('QTDFIS').AsFloat:=0;
      IBQRelcad.ParamByName('VALFIS').AsFloat:=wtotven;
      IBQRelcad.ParamByName('QTDSAC').AsFloat:=0;
      IBQRelcad.ParamByName('VALSAC').AsFloat:=wtotcus;
      IBQRelcad.ParamByName('QTDREAL').AsFloat:=0;
      IBQRelcad.ParamByName('VALREAL').AsFloat:=wprevip;
      IBQRelcad.ParamByName('QTDVEN').AsFloat:=0;
      IBQRelcad.ParamByName('VALVEN').AsFloat:=wvenda;
      IBQRelcad.ParamByName('CUSTO').AsFloat:=wcusto;
      IBQRelcad.ParamByName('MEDIA').AsFloat:=0;
      IBQRelcad.ExecSql;
      IBQRelcad.Close;
      DModRosa.IBQLer_art.Next;
    end;
    DModRosa.IBQLer_art.Close;
    IBQRelcad.Close;
    IBQRelcad.SQL.Clear;
    IBQRelcad.SQL.Add('Select * from AUXMAPA '+
                      'Order By Codart');
    IBQRelcad.OPen;
    IBQRelcad.Close;
    // Emite a relação ******************
    RvRelart.ShowReport;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutart.Button9Click(Sender: TObject);
begin
  IBQuery1.Open;
  if IBQuery1.FieldByName('Col030').AsString='X' then
  begin
    FrmRelartigos:=TFrmRelArtigos.Create(Self);
    FrmRelArtigos.ShowModal;
    FrmRelArtigos.release;
  end else
      showmessage('Não Autorizado !!!');
  DModRosa.IBQPesq_art.Close;
  DModRosa.IBQPesq_art.SQL.Clear;
  DModRosa.IBQPesq_art.SQL.Add('Select * from ARTIGO '+
                               'Order By Codigo');
  DModRosa.IBQPesq_art.OPen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmManutart.FormKeyDown(Sender: TObject; var Key: Word;
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


procedure TFrmManutart.FormShow(Sender: TObject);
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
  if DModRosa.IBQPesq_art.Active then
     DModRosa.IBQPesq_art.Active:=False;
  DModRosa.IBQPesq_art.Sql.Clear;
  DModRosa.IBQPesq_art.Sql.Add('Select * from ARTIGO '+
                               'Order by Codigo');
  DModRosa.IBQPesq_art.Active:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmManutart.RvCadartGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(varname,'Dat01')=0 then
     value:=DateToStr(Date());
  if Comparetext(varname,'Temp01')=0 then
     Value:=TimeToStr(Time());
end;

end.
