unit UPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Data.DB, IBX.IBQuery, IBX.IBCustomDataSet,
  IBX.IBTable;

type
  TFrmPedido = class(TForm)
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Edit1: TEdit;
    Edit6: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    GroupBox2: TGroupBox;
    Label12: TLabel;
    Edit7: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit12: TEdit;
    Edit13: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    Edit9: TEdit;
    Edit8: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit14: TEdit;
    IBTAuxitpedido: TIBTable;
    IBQAuxitpedido: TIBQuery;
    IBQAuxitped: TIBQuery;
    DsAuxitpedido: TDataSource;
    IBTAuxitpedidoPEDIDO: TIBStringField;
    IBTAuxitpedidoCODART: TIBStringField;
    IBTAuxitpedidoDESCRICAO: TIBStringField;
    IBTAuxitpedidoQTDSAI: TIntegerField;
    IBTAuxitpedidoQTDRET: TIntegerField;
    IBTAuxitpedidoPRECUS: TIBBCDField;
    IBTAuxitpedidoPREVEN: TIBBCDField;
    IBTAuxitpedidoQTDANT: TIntegerField;
    IBTAuxitpedidoCUSANT: TIBBCDField;
    IBTAuxitpedidoVENANT: TIBBCDField;
    IBTAuxitpedidoOPER: TIBStringField;
    IBQAuxitpedidoPEDIDO: TIBStringField;
    IBQAuxitpedidoCODART: TIBStringField;
    IBQAuxitpedidoDESCRICAO: TIBStringField;
    IBQAuxitpedidoQTDSAI: TIntegerField;
    IBQAuxitpedidoQTDRET: TIntegerField;
    IBQAuxitpedidoPRECUS: TIBBCDField;
    IBQAuxitpedidoPREVEN: TIBBCDField;
    IBQAuxitpedidoQTDANT: TIntegerField;
    IBQAuxitpedidoCUSANT: TIBBCDField;
    IBQAuxitpedidoVENANT: TIBBCDField;
    IBQAuxitpedidoOPER: TIBStringField;
    IBQAuxitpedPEDIDO: TIBStringField;
    IBQAuxitpedCODART: TIBStringField;
    IBQAuxitpedDESCRICAO: TIBStringField;
    IBQAuxitpedQTDSAI: TIntegerField;
    IBQAuxitpedQTDRET: TIntegerField;
    IBQAuxitpedPRECUS: TIBBCDField;
    IBQAuxitpedPREVEN: TIBBCDField;
    IBQAuxitpedQTDANT: TIntegerField;
    IBQAuxitpedCUSANT: TIBBCDField;
    IBQAuxitpedVENANT: TIBBCDField;
    IBQAuxitpedOPER: TIBStringField;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    Label19: TLabel;
    Edit16: TEdit;
    Edit15: TEdit;
    Label22: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure MaskEdit3Exit(Sender: TObject);
    procedure MaskEdit4Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
  private
    { Private declarations }

   public
    { Public declarations }
    procedure Restaura;
    procedure Atu_item;
    function ExisteForm(pForm: TForm): Boolean;
  end;

var
  FrmPedido: TFrmPedido;
  wopera,wempresa,wendereco,wtelefone,winscricoes,wromaneio,wsitu: string;
  xcodi,chvpv,wcodigo,wdescricao,chvtem,chvachou,chavcab,wnota,wprecv: string;
  wbairro,wcidade,westado,wreferencia,chvff,chvimp,wdatimp,wcodped: string;
  witens: Integer;
  wtotped,wtotqtd,wtotpro,wqtda,wchuta,zqtda: Extended;
  wprecus,wpreven,westoq,xestoq: Extended;
  I,Q,P,V,T,D,G,chvext: String;
  PrntOk,wnumped,woper,wcodart,wvia,wdatando,whorini,whorfin: string;
  Tamanho,Linha,Coluna,wlinhas,xlinhas: Integer;

implementation

{$R *.dfm}

uses UDModRosa, UPrintped, UParada;

procedure TFrmPedido.Button1Click(Sender: TObject);
begin
  witens:=0;
  wtotped:=0;
  IBQAuxitpedido.Close;
  IBQAuxitpedido.SQL.Clear;
  IBQAuxitpedido.SQL.Add('Select * from AUXITENS '+
                         'Order by Codart');
  IBQAuxitpedido.Active:=True;
  IBQAuxitpedido.DisableControls;
  IBQAuxitpedido.First;
  while not IBQAuxitpedido.Eof do
  begin
    witens:=witens+1;
    wnumped:=IBQAuxitpedido.fieldbyName('Pedido').AsString;
    wcodart:=IBQAuxitpedido.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxitpedido.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxitpedido.fieldbyName('Qtdsai').AsFloat;
    zqtda:=IBQAuxitpedido.fieldbyName('Qtdant').AsFloat;
    wprecus:=IBQAuxitpedido.fieldbyName('Precus').AsFloat;
    wpreven:=IBQAuxitpedido.fieldbyName('Preven').AsFloat;
    woper:=IBQAuxitpedido.fieldbyName('Oper').AsString;
    wtotped:=wtotped+(wqtda*wprecus);
    if (woper='E') or (edit6.Text='Excluir') then
    begin
      wqtda:=0;
      witens:=witens-1;
      DModRosa.IBQVer_itped.Active:=False;
      DModRosa.IBQVer_itped.Sql.Clear;
      DModRosa.IBQVer_itped.SqL.Add('Delete from ITEMPEDIDO '+
                                    'Where PEDIDO=:ped_digit '+
                                    'and CODART=:cod_digit');
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumped;
      DModRosa.IBQVer_itped.ParamByName('cod_digit').AsString:=wcodart;
      DModRosa.IBQVer_itped.Active:=True;
      DModRosa.IBQVer_itped.Active:=false;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_itped.Close;
    end;
    if woper='A' then
    begin
      DModRosa.IBQVer_itped.Sql.Clear;
      DModRosa.IBQVer_itped.Sql.Add('Update ITEMPEDIDO ');
      DModRosa.IBQVer_itped.Sql.Add('Set QTDSAI=:qtd_digit '+
                                    'Where Pedido=:ped_digit '+
                                    'and CODART=:cod_digit');
      DModRosa.IBQVer_itped.ParamByName('qtd_digit').AsFloat:=wqtda;
      DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumped;
      DModRosa.IBQVer_itped.ParamByName('cod_digit').AsString:=wcodart;
      DModRosa.IBQVer_itped.ExecSql;
      DModRosa.IBQVer_itped.Close;
    end;
    if woper='I' then
    begin
      if DModRosa.IBQVer_itped.Active then
         DModRosa.IBQVer_itped.Active:=False;
      DModRosa.IBQVer_itped.Sql.Clear;
      DModRosa.IBQVer_itped.Sql.Add('Insert Into ITEMPEDIDO ');
      DModRosa.IBQVer_itped.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,'+
                                     'QTDRET,PRECUS,PREVEN) '+
                             'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,'+
                                    ':QTDRET,:PRECUS,:PREVEN)');
      DModRosa.IBQVer_itped.ParamByName('PEDIDO').AsString:=wnumped;
      DModRosa.IBQVer_itped.ParamByName('CODART').AsString:=wcodart;
      DModRosa.IBQVer_itped.ParamByName('DESCRICAO').AsString:=wdescricao;
      DModRosa.IBQVer_itped.ParamByName('QTDSAI').AsFloat:=wqtda;
      DModRosa.IBQVer_itped.ParamByName('QTDRET').AsFloat:=0;
      DModRosa.IBQVer_itped.ParamByName('PRECUS').AsFloat:=wprecus;
      DModRosa.IBQVer_itped.ParamByName('PREVEN').AsFloat:=wpreven;
      DModRosa.IBQVer_itped.ExecSql;
      DModRosa.IBQVer_itped.Close;
    end;
    Restaura;
    IBQAuxitpedido.Next;
  end;
  IBQAuxitpedido.Close;
  if (witens=0) or (edit6.Text='Excluir') then
  begin
    DModRosa.IBQVer_ped.Active:=False;
    DModRosa.IBQVer_ped.Sql.Clear;
    DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
    DModRosa.IBQVer_ped.Sql.Add('Set SITU=:sit_digit '+
                                'Where PEDIDO=:ped_digit');
    DModRosa.IBQVer_ped.ParamByName('sit_digit').AsString:='X';
    DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
    DModRosa.IBQVer_ped.ExecSql;
    DModRosa.IBQVer_ped.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_ped.Close;
  end;
  if (witens>0) and (edit6.text='Alterar') then
  begin
    DModRosa.IBQVer_ped.Sql.Clear;
    DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
    DModRosa.IBQVer_ped.Sql.Add('Set CODCLI=:cod_digit,'+
                                'NOMCLI=:nom_digit,'+
                                'TOTPED=:tped_digit '+
                                'Where PEDIDO=:ped_digit');
    DModRosa.IBQVer_ped.ParamByName('cod_digit').AsString:=edit4.Text;
    DModRosa.IBQVer_ped.ParamByName('nom_digit').AsString:=edit5.Text;
    DModRosa.IBQVer_ped.ParamByName('tped_digit').AsFloat:=wtotped;
    DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
    DModRosa.IBQVer_ped.ExecSql;
    DModRosa.IBQVer_ped.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_ped.Close;
  end;
  if (witens>0) and (edit6.text='Implantar') then
  begin
    if DModRosa.IBQVer_ped.Active then
       DModRosa.IBQVer_ped.Active:=False;
    DModRosa.IBQVer_ped.Sql.Clear;
    DModRosa.IBQVer_ped.Sql.Add('Insert Into PEDIDO ');
    DModRosa.IBQVer_ped.Sql.Add('(PEDIDO,CODVEN,CODCLI,NOMCLI,BASE,RECOL,'+
                                'COBRAN,TOTPED,SITU,DATPED,SOLICIT,RETORNO,'+
                                'TOTVEN,DATPAG,VALPAG,RESIDUO,COB,LIMITE,VIA,OLDPED) '+
                        'Values(:PEDIDO,:CODVEN,:CODCLI,:NOMCLI,:BASE,:RECOL,'+
                               ':COBRAN,:TOTPED,:SITU,:DATPED,:SOLICIT,:RETORNO,'+
                               ':TOTVEN,:DATPAG,:VALPAG,:RESIDUO,:COB,:LIMITE,:VIA,:OLDPED)');
    DModRosa.IBQVer_ped.ParamByName('PEDIDO').AsString:=edit1.Text;
    DModRosa.IBQVer_ped.ParamByName('CODVEN').AsString:=edit2.text;
    DModRosa.IBQVer_ped.ParamByName('CODCLI').AsString:=edit4.Text;
    DModRosa.IBQVer_ped.ParamByName('NOMCLI').AsString:=edit5.text;
    DModRosa.IBQVer_ped.ParamByName('BASE').AsDate:=StrToDate(maskedit2.Text);
    DModRosa.IBQVer_ped.ParamByName('RECOL').AsDate:=StrToDate(maskedit3.Text);
    DModRosa.IBQVer_ped.ParamByName('COBRAN').AsDate:=StrToDate(maskedit4.Text);
    DModRosa.IBQVer_ped.ParamByName('TOTPED').AsFloat:=wtotped;
    DModRosa.IBQVer_ped.ParamByName('SITU').AsString:='E';
    DModRosa.IBQVer_ped.ParamByName('DATPED').AsString:=DateToStr(Date());
    DModRosa.IBQVer_ped.ParamByName('RETORNO').AsString:='';
    DModRosa.IBQVer_ped.ParamByName('TOTVEN').AsFloat:=0;
    DModRosa.IBQVer_ped.ParamByName('DATPAG').AsString:='';
    DModRosa.IBQVer_ped.ParamByName('SOLICIT').AsString:='';
    DModRosa.IBQVer_ped.ParamByName('VALPAG').AsFloat:=0;
    DModRosa.IBQVer_ped.ParamByName('RESIDUO').AsFloat:=0;
    DModRosa.IBQVer_ped.ParamByName('COB').AsString:='';
    DModRosa.IBQVer_ped.ParamByName('LIMITE').AsString:='';
    DModRosa.IBQVer_ped.ParamByName('VIA').AsString:='0';
    DModRosa.IBQVer_ped.ParamByName('OLDPED').AsString:='';
    DModRosa.IBQVer_ped.ExecSql;
    DModRosa.IBQVer_ped.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_ped.Close;
  end;
  // Emite o pedido Implantado *********************************************
  if (edit6.Text='Alterar') or
     (edit6.Text='Implantar') then
  begin
    FrmPrintped:=TFrmPrintped.Create(Self);
    FrmPrintped.edit1.Text:=edit1.Text;
    FrmPrintped.ShowModal;
  end;
  Button2Click(Sender);
  exit;
end;

procedure TFrmPedido.Button2Click(Sender: TObject);
begin
  chavcab:='';
  chvff:='';
  whorini:='';
  whorfin:='';
  woper:='';
  wprecv:='';
  wqtda:=0;
  zqtda:=0;
  witens:=0;
  wtotqtd:=0;
  wtotped:=0;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit6.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.Clear;
  edit11.Clear;
  edit13.Clear;
  maskedit1.Clear;
  maskedit2.Text:=DateToStr(Date());
  maskedit3.Clear;
  maskedit4.Clear;
  Modalresult:=-1;
  exit;
end;

procedure TFrmPedido.DBGrid2DblClick(Sender: TObject);
begin
  edit4.Text:=IntToStr(DModRosa.IBQPesq_cli.fields.fields[0].AsInteger);
  While Length(edit4.Text)<edit4.MaxLength do
        edit4.Text := '0'+ edit4.Text;
  DBGrid1.Visible:=false;
  edit4.SetFocus;
  exit;
end;

procedure TFrmPedido.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button2) or (ActiveControl=Button2) then
      exit;
  if edit1.Text='' then
  begin
    ShowMessage('Numero do pedido ????');
    Button2Click(Sender);
    exit;
  end;
  wvia:='';
  IBTAuxitpedido.EmptyTable;
  // Preencher a chave com zeros a esquerda
  While Length(edit1.Text)<edit1.MaxLength do
        edit1.Text := '0'+ edit1.Text;
  // Ler Solicitação ***************
  DModRosa.IBQVer_ped.Close;
  DModRosa.IBQVer_ped.SQL.Clear;
  DModRosa.IBQVer_ped.SQL.Add('Select * from PEDIDO '+
                              'Where Pedido=:ped_digit');
  DModRosa.IBQVer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
  DModRosa.IBQVer_ped.OPen;
  if DModRosa.IBQVer_ped.RecordCount>0 then
  begin
    chavcab:='1';
    edit2.Text:=DModRosa.IBQVer_ped.fieldbyName('Codven').AsString;
    edit4.Text:=DModRosa.IBQVer_ped.fieldbyName('Codcli').AsString;
    maskedit2.Text:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Base').AsDateTime);
    maskedit3.Text:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Recol').AsDateTime);
    maskedit4.Text:=DateToStr(DModRosa.IBQVer_ped.fieldbyName('Cobran').AsDateTime);
    maskedit1.Text:=DModRosa.IBQVer_ped.fieldbyName('Retorno').AsString;
    wsitu:=DModRosa.IBQVer_ped.fieldbyName('Situ').AsString;
    wvia:=DModRosa.IBQVer_ped.fieldbyName('Via').AsString;
    // Ler Cliente *************************
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQVer_cli.SQL.Clear;
    DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Idcli=:cli_digit');
    DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(edit4.Text);
    DModRosa.IBQVer_cli.OPen;
    if DModRosa.IBQVer_cli.RecordCount>0 then
    begin
      edit14.Text:=DModRosa.IBQVer_cli.fieldByName('Situ').AsString;
      edit5.Text:=DModRosa.IBQVer_cli.fieldbyName('Nome').AsString ;
      wdatimp:=DModRosa.IBQVer_cli.fieldbyName('Datimp').AsString;
    end;
    // Ler Vendedor *******************************
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQLer_ven.Close;
    DModRosa.IBQLer_ven.SQL.Clear;
    DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                                 'Where Codven=:ven_digit');
    DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit2.Text;
    DModRosa.IBQLer_ven.OPen;
    if DModRosa.IBQLer_ven.RecordCount>0 then
       edit3.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
     DModRosa.IBQLer_ven.Close;
    // Ler Itens do pedido *********************
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_itped.SQL.Clear;
    DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=edit1.Text;
    DModRosa.IBQVer_itped.OPen;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      witens:=witens+1;
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQVer_itped.fieldbyName('Descricao').AsString;
      wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      wprecus:=DModRosa.IBQVer_itped.fieldbyName('Precus').AsFloat;
      wpreven:=DModRosa.IBQVer_itped.fieldbyName('Preven').AsFloat;
      wtotqtd:=wtotqtd+wqtda;
      wtotpro:=wqtda*wprecus;
      wtotped:=wtotped+wtotpro;
      if IBQAuxitpedido.Active then
         IBQAuxitpedido.Active:=False;
      IBQAuxitpedido.Sql.Clear;
      IBQAuxitpedido.Sql.Add('Insert Into AUXITENS ');
      IBQAuxitpedido.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                          'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                   'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                          ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
      IBQAuxitpedido.ParamByName('PEDIDO').AsString:=edit1.text;
      IBQAuxitpedido.ParamByName('CODART').AsString:=wcodart;
      IBQAuxitpedido.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQAuxitpedido.ParamByName('QTDSAI').AsFloat:=wqtda;
      IBQAuxitpedido.ParamByName('QTDRET').AsFloat:=0;
      IBQAuxitpedido.ParamByName('PRECUS').AsFloat:=wprecus;
      IBQAuxitpedido.ParamByName('PREVEN').AsFloat:=wpreven;
      IBQAuxitpedido.ParamByName('QTDANT').AsFloat:=wqtda;
      IBQAuxitpedido.ParamByName('CUSANT').AsFloat:=0;
      IBQAuxitpedido.ParamByName('VENANT').AsFloat:=0;
      IBQAuxitpedido.ParamByName('OPER').AsString:='';
      IBQAuxitpedido.ExecSql;
      IBQAuxitpedido.Close;
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    IBQAuxitped.Close;
    IBQAuxitped.SQL.Clear;
    IBQAuxitped.SQL.Add('Select * from  AUXITENS '+
                           'Order by Codart');
    IBQAuxitped.OPen;
    G:=FormatFloat('###,##0.00',wtotped);
    edit15.Text:=FormatFloat('#0',witens);;
    edit16.Text:=FormatFloat('####0',wtotqtd);;
    // Richedit1.Lines.Add('   VALOR TOTAL');
    // Richedit1.Lines.Add('     '+StringofChar(#32,12-Length(G))+(G));
    DModRosa.IBQVer_ped.Close;
    // Pesquisa operaçao ***************
    if wsitu<>'E' then
    begin
      showmessage('Este pedido ja retornou !!!!!');
      Button2Click(Sender);
    end;
    if edit6.text='Excluir' then
    begin
      Button1.SetFocus;
      exit;
    end;
    if edit6.text='Consultar' then
    begin
      Button1.SetFocus;
      exit;
    end;
    if edit6.text='Alterar' then
    begin
      edit2.SetFocus;
      exit;
    end;
  end else
  begin
    if edit6.text='Implantar' then
    begin
      // Ler etiqueta *************************
      DModRosa.IBQLer_etic.Close;
      DModRosa.IBQLer_etic.SQL.Clear;
      DModRosa.IBQLer_etic.SQL.Add('Select * from ETIQUETA '+
                                    'Where Idetiq=:ped_digit');
      DModRosa.IBQLer_etic.ParamByName('ped_digit').AsInteger:=StrToInt(edit1.Text);
      DModRosa.IBQLer_etic.OPen;
      if DModRosa.IBQLer_etic.RecordCount>0 then
      begin
        edit2.Text:=DModRosa.IBQLer_etic.fieldbyName('Codven').AsString;
        edit4.Text:=DModRosa.IBQLer_etic.fieldbyName('Codcli').AsString;
        DModRosa.IBQLer_etic.Close;
        edit2.SetFocus;
        exit;
      end else
      begin
        DModRosa.IBQLer_etic.Close;
        showmessage('Não foi gerada a etiqueta '+chr(13)+
                    'para este pedido !!!!!');
      end;
    end;
  end;
  Button2Click(Sender);
  exit;
end;

procedure TFrmPedido.Edit2Exit(Sender: TObject);
begin
  if (ActiveControl=Button2) or (ActiveControl=Button2) then
      exit;
  if edit2.Text<>'' then
  begin
    // Preencher a chave com zeros a esquerda
    While Length(edit2.Text)<edit2.MaxLength do
          edit2.Text := '0'+ edit2.Text;
    DModRosa.IBQLer_ven.Close;
    DModRosa.IBQLer_ven.SQL.Clear;
    DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                                 'Where Codven=:ven_digit');
    DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit2.Text;
    DModRosa.IBQLer_ven.OPen;
    if DModRosa.IBQLer_ven.RecordCount>0 then
    begin
      edit3.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
      DModRosa.IBQLer_ven.Close;
      maskedit3.SetFocus;
      exit;
    end else
    begin
      ShowMessage('Vendedor nao cadastrado');
      edit2.Clear;
      edit2.SetFocus;
      exit;
    end;
  end else
  begin
    ShowMessage('Identifique o vendedor');
    edit2.SetFocus;
    exit;
  end;
end;

procedure TFrmPedido.Edit4Exit(Sender: TObject);
begin
  if (ActiveControl=Button2) or (ActiveControl=Button2) or
     (ActiveControl=DBGrid1) then
      exit;
  if edit4.Text<>'' then
  begin
    // Preencher a chave com zeros a esquerda
    While Length(edit4.Text)<edit4.MaxLength do
          edit4.Text := '0'+ edit4.Text;
    // Ler Cliente *************************
    DModRosa.IBQVer_cli.Close;
    DModRosa.IBQVer_cli.SQL.Clear;
    DModRosa.IBQVer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Idcli=:cli_digit');
    DModRosa.IBQVer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(edit4.Text);
    DModRosa.IBQVer_cli.OPen;
    if DModRosa.IBQVer_cli.RecordCount>0 then
    begin
      edit5.Text:=DModRosa.IBQVer_cli.fieldbyName('Nome').AsString ;
      wdatimp:=DModRosa.IBQVer_cli.fieldbyName('Datimp').AsString;
      wendereco:=DModRosa.IBQVer_cli.fieldbyName('Ende').AsString;
      wbairro:=DModRosa.IBQVer_cli.fieldbyName('Bair').AsString;
      wcidade:=DModRosa.IBQVer_cli.fieldbyName('Cida').AsString;
      westado:=DModRosa.IBQVer_cli.fieldbyName('Esta').AsString;
      wprecv:=DModRosa.IBQVer_cli.fieldByName('Situ').asString;
      wreferencia:=DModRosa.IBQVer_cli.fieldbyName('Refer').AsString;
      edit14.Text:=wprecv;
      DModRosa.IBQVer_cli.Close;
      if wvia>'0' then
         Button1.SetFocus
      else
         edit7.SetFocus;
    end else
    begin
      DModRosa.IBQVer_cli.Close;
      ShowMessage('Cliente nao cadastrado');
      edit4.Clear;
      edit4.SetFocus;
      exit;
    end;
  end else
  begin
    ShowMessage ('Identifique o Cliente');
    edit4.SetFocus;
  end;
end;

procedure TFrmPedido.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F2 then
  begin
    DBGrid2.Visible:=true;
    DModRosa.IBQPesq_cli.Close;
    DModRosa.IBQPesq_cli.SQL.Clear;
    DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                                 'ORDER BY Nome');
    DModRosa.IBQPesq_cli.OPen;
    DBGrid2.SetFocus;
  end;
end;

procedure TFrmPedido.Edit7Exit(Sender: TObject);
begin
  chvachou:='';
  wqtda:=0;
  if (ActiveControl=Button1) or
     (ActiveControl=Button2) or
     (ActiveControl=DBGrid1) then
      exit;
  if edit7.text='' then
  begin
    edit7.SetFocus;
    exit;
  end else
  begin
    if wvia>'0' then
    begin
      showmessage('Os artigos não podem ser alterados !!!');
      Button2.SetFocus;
      exit;
    end;
    // Ler Itens do auxpedido *********************
    IBQAuxitpedido.Close;
    IBQAuxitpedido.SQL.Clear;
    IBQAuxitpedido.SQL.Add('Select * from  AUXITENS '+
                           'Where Codart=:cod_digit');
    IBQAuxitpedido.ParamByName('cod_digit').AsString:=edit7.Text;
    IBQAuxitpedido.OPen;
    if IBQAuxitpedido.RecordCount>0 then
    begin
      chvachou:='S';
      wchuta:=IBQAuxitpedido.fieldbyName('Qtdsai').AsFloat;
    end;
    if chvachou='S' then
    begin
      if chvext='1' then
      begin
        chvext:=' ';
        IBQAuxitpedido.Active:=False;
        IBQAuxitpedido.SQL.Clear;
        IBQAuxitpedido.SqL.Add('Delete from AUXITENS '+
                               'Where CODART=:cod_digit');
        IBQAuxitpedido.ParamByName('cod_digit').AsString:=edit7.text;
        IBQAuxitpedido.Active:=True;
        wtotqtd:=wtotqtd-wchuta;
        witens:=witens-1;
        edit15.Text:=FormatFloat('#0',witens);;
        edit16.Text:=FormatFloat('####0',wtotqtd);;
        IBQAuxitpedido.Close;
        IBQAuxitped.Close;
        IBQAuxitped.SQL.Clear;
        IBQAuxitped.SQL.Add('Select * from AUXITENS '+
                            'Order by Codart');
        IBQAuxitped.OPen;
        edit7.Clear;
        edit7.SetFocus;
        exit;
      end;
      woper:='A';
      edit8.Text:=IBQAuxitpedido.fieldbyName('Descricao').AsString;
      edit10.Text:=FormatFloat('#,##0.00',IBQAuxitpedido.fieldbyName('Precus').AsFloat);
      edit11.Text:=FormatFloat('#,##0.00',IBQAuxitpedido.fieldbyName('Preven').AsFloat);
      edit12.Text:=IBQAuxitpedido.fieldbyName('Codart').AsString;
      edit13.Text:=FormatFloat('#,##0.00',IBQAuxitpedido.fieldbyName('Qtdsai').AsFloat);
      wqtda:=IBQAuxitpedido.fieldbyName('Qtdsai').AsFloat;
      woper:=IBQAuxitpedido.fieldbyName('Oper').AsString;
      IBQAuxitpedido.Close;
      if chvff='1' then
      begin
        Showmessage('Digite a quantidade');
        edit9.SetFocus;
        exit;
      end else
      begin
        edit9.Text:=FormatFloat('###0',1);
        wqtda:=wqtda+1;
        Atu_item;
      end;
    end else
    begin
      witens:=witens+1;
      if witens>24 then
      begin
        MessageBeep(64);
        MessageBeep(64);
        MessageBeep(64);
        MessageBeep(64);
        FrmParada:=TFrmParada.Create(Self);
        FrmParada.Label2.caption:='Capacidade estourada !!!!!';
        FrmParada.Showmodal;
        FrmParada.Release;
        showmessage('Limite de 24 artigos no pedido  !!'+char(13)+
                    'Feche o pedido !!!');
        witens:=witens-1;
        edit7.Clear;
        edit7.SetFocus;
        exit;
      end else
      begin
        DModRosa.IBQLer_art.Close;
        DModRosa.IBQLer_art.SQL.Clear;
        DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                    'Where Codigo=:cod_digit');
        DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=edit7.Text;
        DModRosa.IBQLer_art.OPen;
        if DModRosa.IBQLer_art.RecordCount>0 then
        begin
          edit7.text:=DModRosa.IBQLer_art.fieldbyName('Codigo').AsString;
          edit8.Text:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
          edit10.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat);
          if edit14.text='A' then
          begin
            edit11.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Venda').AsFloat);
          end else
          begin
            edit11.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Previp').AsFloat);
          end;
          DModRosa.IBQLer_art.Close;
          if chvff='1' then
          begin
            Showmessage('Digite a quantidade');
            edit9.SetFocus;
            exit;
          end;
          edit9.Text:=FormatFloat('###0',1);
          wqtda:=StrToFloat(edit9.text);
          Atu_item;
        end else
        begin
          MessageBeep(64);
          MessageBeep(64);
          MessageBeep(64);
          MessageBeep(64);
          FrmParada:=TFrmParada.Create(Self);
          FrmParada.Label2.caption:='Produto não cadastrado  !!!!!';
          FrmParada.Showmodal;
          FrmParada.Release;
          witens:=witens-1;
          edit7.Clear;
          edit7.SetFocus;
          exit;
        end;
        DModRosa.IBQLer_art.Close;
      end;
    end;
  end;
end;

procedure TFrmPedido.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=VK_F3 then
  begin
    chvff:='1';
  end;
  if Key=VK_F5 then
  begin
    chvext:='1';
  end;
end;

procedure TFrmPedido.Edit9Exit(Sender: TObject);
begin
  wqtda:=StrToFloat(edit9.Text);
  Atu_item;
end;

function TFrmPedido.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmPedido.Restaura;   // ******************************
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
    xestoq:=DModRosa.IBQLer_art.fieldbyName('Estoq').AsFloat;
    xestoq:=(xestoq+zqtda)-wqtda;
    chvtem:='1';
  end;
  DModRosa.IBQVer_art.Close;
  if chvtem='1'then
  begin
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

procedure TFrmPedido.Atu_item;
begin
  if chvachou='S' then
  begin
    if StrToFloat(edit9.Text)<1 then
    begin
      // Atualiza Operacao ***********************
      IBQAuxitpedido.Sql.Clear;
      IBQAuxitpedido.Sql.Add('Update AUXITENS ');
      IBQAuxitpedido.Sql.Add('Set QTDSAI=:qtd_digit,'+
                             'OPER=:op_digit '+
                             'Where PEDIDO=:ped_digit '+
                             'and CODART=:cod_digit');
      IBQAuxitpedido.ParamByName('qtd_digit').AsFloat:=wqtda;
      IBQAuxitpedido.ParamByName('op_digit').AsString:='E';
      IBQAuxitpedido.ParamByName('ped_digit').AsString:=edit1.Text;
      IBQAuxitpedido.ParamByName('cod_digit').AsString:=edit7.Text;
      IBQAuxitpedido.ExecSql;
      IBQAuxitpedido.Close;
    end else
    begin
      if woper='A' then
      begin
        IBQAuxitpedido.Sql.Clear;
        IBQAuxitpedido.Sql.Add('Update AUXITENS ');
        IBQAuxitpedido.Sql.Add('Set QTDSAI=:qtd_digit,'+
                               'OPER=:op_digit '+
                               'Where PEDIDO=:ped_digit '+
                               'and CODART=:cod_digit');
        IBQAuxitpedido.ParamByName('qtd_digit').AsFloat:=wqtda;
        IBQAuxitpedido.ParamByName('op_digit').AsString:='A';
        IBQAuxitpedido.ParamByName('ped_digit').AsString:=edit1.Text;
        IBQAuxitpedido.ParamByName('cod_digit').AsString:=edit7.Text;
        IBQAuxitpedido.ExecSql;
        IBQAuxitpedido.Close;
      end else
      begin
        IBQAuxitpedido.Sql.Clear;
        IBQAuxitpedido.Sql.Add('Update AUXITENS ');
        IBQAuxitpedido.Sql.Add('Set QTDSAI=:qtd_digit '+
                               'Where PEDIDO=:ped_digit '+
                               'and CODART=:cod_digit');
        IBQAuxitpedido.ParamByName('qtd_digit').AsFloat:=wqtda;
        IBQAuxitpedido.ParamByName('ped_digit').AsString:=edit1.Text;
        IBQAuxitpedido.ParamByName('cod_digit').AsString:=edit7.Text;
        IBQAuxitpedido.ExecSql;
        IBQAuxitpedido.Close;
      end;
    end;
  end else
  begin
    if IBQAuxitpedido.Active then
       IBQAuxitpedido.Active:=False;
    IBQAuxitpedido.Sql.Clear;
    IBQAuxitpedido.Sql.Add('Insert Into AUXITENS ');
    IBQAuxitpedido.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                           'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                   'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                          ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
    IBQAuxitpedido.ParamByName('PEDIDO').AsString:=edit1.Text;
    IBQAuxitpedido.ParamByName('CODART').AsString:=edit7.Text;
    IBQAuxitpedido.ParamByName('DESCRICAO').AsString:=edit8.Text;
    IBQAuxitpedido.ParamByName('QTDSAI').AsFloat:=wqtda;
    IBQAuxitpedido.ParamByName('QTDRET').AsFloat:=0;
    IBQAuxitpedido.ParamByName('PRECUS').AsFloat:=StrToFloat(edit10.text);
    IBQAuxitpedido.ParamByName('PREVEN').AsFloat:=StrToFloat(edit11.text);
    IBQAuxitpedido.ParamByName('QTDANT').AsFloat:=0;
    IBQAuxitpedido.ParamByName('CUSANT').AsFloat:=0;
    IBQAuxitpedido.ParamByName('VENANT').AsFloat:=0;
    IBQAuxitpedido.ParamByName('OPER').AsString:='I';
    IBQAuxitpedido.ExecSql;
    IBQAuxitpedido.Close;
  end;
  edit12.Text:=edit7.Text;
  edit13.Text:=FormatFloat('###0',wqtda);
  // Monta lista de produtos *********************
  IBQAuxitpedido.Close;
  IBQAuxitpedido.SQL.Clear;
  IBQAuxitpedido.SQL.Add('Select * from AUXITENS '+
                         'Order by Codart');
  IBQAuxitpedido.OPen;
  IBQAuxitpedido.DisableControls;
  IBQAuxitpedido.First;
  witens:=0;
  wtotqtd:=0;
  wtotped:=0;
  while not IBQAuxitpedido.Eof do
  begin
    witens:=witens+1;
    wcodigo:=IBQAuxitpedido.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxitpedido.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxitpedido.fieldbyName('Qtdsai').AsFloat;
    wprecus:=IBQAuxitpedido.fieldbyName('Precus').AsFloat;
    wtotqtd:=wtotqtd+wqtda;
    wtotpro:=wqtda*wprecus;
    wtotped:=wtotped+wtotpro;
    IBQAuxitpedido.Next;
  end;
  IBQAuxitpedido.Close;
  IBQAuxitped.Close;
  IBQAuxitped.SQL.Clear;
  IBQAuxitped.SQL.Add('Select * from AUXITENS '+
                         'Order by Codart');
  IBQAuxitped.OPen;
  G:=FormatFloat('###,##0.00',wtotped);
  edit15.Text:=FormatFloat('#0',witens);;
  edit16.Text:=FormatFloat('####0',wtotqtd);;
  chvff:='';
  edit7.Clear;
  edit8.Clear;
  edit9.text:=FormatFloat('###0',0);
  edit10.text:=FormatFloat('##0.00',0);
  edit11.text:=FormatFloat('##0.00',0);
  edit7.SetFocus;
  exit;
end;

procedure TFrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPedido.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  chavcab:='';
  chvff:='';
  whorini:='';
  whorfin:='';
  witens:=0;
  wtotpro:=0;
  wtotqtd:=0;
  wtotped:=0;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit7.Clear;
  edit8.Clear;
  edit13.Clear;
  edit9.text:=FormatFloat('###0',0);
  edit10.text:=FormatFloat('##0.00',0);
  edit11.text:=FormatFloat('##0.00',0);
  maskedit1.Clear;
  maskedit2.Text:=DateToStr(Date());
  maskedit3.Text:=DateToStr((StrToDate(maskedit2.Text)+19));
  maskedit4.Clear;
  wempresa:='SIDTEX CONFECÇÕES LTDA.';
  wendereco:='Rua Bernardo de Vanconcelos , 12  Realengo -  RJ';
  wtelefone:='Tel:(021) 3381-8581  /  Cep: 21250-270';
  winscricoes:='CNPJ: 04.704.379/0001-71   -   Insc.Est: 77.260.595';
  if edit9.text='Implantar' then
     edit1.Clear;
  edit1.SetFocus;
  exit;
end;

procedure TFrmPedido.MaskEdit2Exit(Sender: TObject);
begin
  maskedit3.Text:=DateToStr((StrToDate(maskedit2.Text)+19));
end;

procedure TFrmPedido.MaskEdit3Exit(Sender: TObject);
begin
  try
    if StrTodate(maskedit3.Text)<StrToDate('01/12/2011') then
    begin
      showmessage('Erro de data !!!');
      maskedit3.Clear;
      maskedit3.SetFocus;
    end;
  Except
  On Exception do
     begin
      Showmessage('Data Invalida !!!');
      maskedit3.SetFocus;
    end;
  end;
end;

procedure TFrmPedido.MaskEdit4Exit(Sender: TObject);
begin
  try
    if StrTodate(maskedit4.Text)<StrToDate('01/12/2011') then
    begin
      showmessage('Erro de data !!!');
      maskedit4.Clear;
      maskedit4.SetFocus;
    end;
  Except
  On Exception do
     begin
      Showmessage('Data Invalida !!!');
      maskedit4.SetFocus;
    end;
  end;
end;

end.
