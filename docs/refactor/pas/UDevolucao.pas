unit UDevolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ComCtrls,
  IBX.IBQuery, Data.DB, IBX.IBCustomDataSet, IBX.IBTable;

type
  TFrmDevolucao = class(TForm)
    Edit5: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Edit4: TEdit;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    MaskEdit2: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RichEdit3: TRichEdit;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Button1: TButton;
    Button2: TButton;
    Edit7: TEdit;
    Label8: TLabel;
    IBTAuxdev: TIBTable;
    IBQAuxdev: TIBQuery;
    IBTAuxdevPEDIDO: TIBStringField;
    IBTAuxdevCODART: TIBStringField;
    IBTAuxdevDESCRICAO: TIBStringField;
    IBTAuxdevQTDSAI: TIntegerField;
    IBTAuxdevQTDRET: TIntegerField;
    IBTAuxdevPRECUS: TIBBCDField;
    IBTAuxdevPREVEN: TIBBCDField;
    IBTAuxdevQTDANT: TIntegerField;
    IBTAuxdevCUSANT: TIBBCDField;
    IBTAuxdevVENANT: TIBBCDField;
    IBTAuxdevOPER: TIBStringField;
    IBQAuxdevPEDIDO: TIBStringField;
    IBQAuxdevCODART: TIBStringField;
    IBQAuxdevDESCRICAO: TIBStringField;
    IBQAuxdevQTDSAI: TIntegerField;
    IBQAuxdevQTDRET: TIntegerField;
    IBQAuxdevPRECUS: TIBBCDField;
    IBQAuxdevPREVEN: TIBBCDField;
    IBQAuxdevQTDANT: TIntegerField;
    IBQAuxdevCUSANT: TIBBCDField;
    IBQAuxdevVENANT: TIBBCDField;
    IBQAuxdevOPER: TIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Restaura;
    procedure Geracod;
    procedure Atualiza_venda;
  end;

var
  FrmDevolucao: TFrmDevolucao;
  wopera,wempresa,wendereco,wtelefone,winscricoes: string;
  xcodi,chvpv,wcodigo,wdescricao,chvtem,chvachou,wclien: string;
  witens: Integer;
  wtotnot,wtotqtd,wtotpro,wqtda,wquant,wvalven,wresido: Extended;
  xtotpro,xqtda,wpreco,xestoq: Extended;
  wpedido,wartigo,wvend,wclie,woper,wnumnot: string;
  I,Q,P,V,T,D,G: String;

implementation

uses UDModRosa;

{$R *.dfm}

procedure TFrmDevolucao.Button1Click(Sender: TObject);
begin
   witens:=0;
  wtotnot:=0;
  IBQAuxdev.Close;
  IBQAuxdev.SQL.Clear;
  IBQAuxdev.SQL.Add('Select * from AUXITENS '+
                      'Order by Codart');
  IBQAuxdev.Active:=True;
  IBQAuxdev.DisableControls;
  IBQAuxdev.First;
  while not IBQAuxdev.Eof do
  begin
    wnumnot:=IBQAuxdev.fieldbyName('Pedido').AsString;
    wcodigo:=IBQAuxdev.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxdev.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxdev.fieldbyName('Qtdsai').AsFloat;
    xqtda:=IBQAuxdev.fieldbyName('Qtdant').AsFloat;
    wpreco:=IBQAuxdev.fieldbyName('Precus').AsFloat;
    woper:=IBQAuxdev.fieldbyName('Oper').AsString;
    Restaura;
    if (woper='E') or (edit5.Text='Excluir') then
    begin
      DModRosa.IBQVer_itdev.Active:=False;
      DModRosa.IBQVer_itdev.Sql.Clear;
      DModRosa.IBQVer_itdev.SqL.Add('Delete from ITEMDEVOLUCAO '+
                                     'Where NUMNOT=:num_digit '+
                                     'and CODART=:cod_digit');
      DModRosa.IBQVer_itdev.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itdev.ParamByName('cod_digit').AsString:=wcodigo;
      DModRosa.IBQVer_itdev.Active:=True;
      DModRosa.IBQVer_itdev.Active:=false;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_itdev.Close;
    end;
    if woper='A' then
    begin
      witens:=witens+1;
      wtotnot:=wtotnot+(wpreco*wqtda);
      DModRosa.IBQVer_itdev.Sql.Clear;
      DModRosa.IBQVer_itdev.Sql.Add('Update ITEMDEVOLUCAO ');
      DModRosa.IBQVer_itdev.Sql.Add('Set QUANT=:qtd_digit,'+
                                     'PRECUS=:pre_digit '+
                                     'Where NUMNOT=:num_digit '+
                                     'and CODART=:cod_digit');
      DModRosa.IBQVer_itdev.ParamByName('qtd_digit').AsFloat:=wqtda;
      DModRosa.IBQVer_itdev.ParamByName('pre_digit').AsFloat:=wpreco;
      DModRosa.IBQVer_itdev.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itdev.ParamByName('cod_digit').AsString:=wcodigo;
      DModRosa.IBQVer_itdev.ExecSql;
      DModRosa.IBQVer_itdev.Close;
    end;
    if woper='I' then
    begin
      witens:=witens+1;
      wtotnot:=wtotnot+(wpreco*wqtda);
      if DModRosa.IBQVer_itdev.Active then
         DModRosa.IBQVer_itdev.Active:=False;
      DModRosa.IBQVer_itdev.Sql.Clear;
      DModRosa.IBQVer_itdev.Sql.Add('Insert Into ITEMDEVOLUCAO ');
      DModRosa.IBQVer_itdev.Sql.Add('(NUMNOT,CODART,DESCRICAO,QUANT,'+
                                     'PRECUS) '+
                             'Values(:NUMNOT,:CODART,:DESCRICAO,:QUANT,'+
                                    ':PRECUS)');
      DModRosa.IBQVer_itdev.ParamByName('NUMNOT').AsString:=wnumnot;
      DModRosa.IBQVer_itdev.ParamByName('CODART').AsString:=wcodigo;
      DModRosa.IBQVer_itdev.ParamByName('DESCRICAO').AsString:=wdescricao;
      DModRosa.IBQVer_itdev.ParamByName('QUANT').AsFloat:=wqtda;
      DModRosa.IBQVer_itdev.ParamByName('PRECUS').AsFloat:=wpreco;
      DModRosa.IBQVer_itdev.ExecSql;
      DModRosa.IBQVer_itdev.Close;
    end;
    IBQAuxdev.Next;
  end;
  IBQAuxdev.Close;
  if edit5.Text='Excluir' then
  begin
    DModRosa.IBQVer_dev.Active:=False;
    DModRosa.IBQVer_dev.Sql.Clear;
    DModRosa.IBQVer_dev.SqL.Add('Delete from DEVOLUCAO '+
                                'Where NUMNOT=:num_digit');
    DModRosa.IBQVer_dev.ParamByName('num_digit').AsString:=edit4.text;
    DModRosa.IBQVer_dev.Active:=True;
    DModRosa.IBQVer_dev.Active:=false;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_dev.Close;
  end else
  begin
    if (witens>0) and (edit5.text='Alterar') then
    begin
      DModRosa.IBQVer_dev.Sql.Clear;
      DModRosa.IBQVer_dev.Sql.Add('Update DEVOLUCAO ');
      DModRosa.IBQVer_dev.Sql.Add('Set DATNOT=:dat_digit,'+
                                   'VALNOT=:val_digit '+
                                   'Where NUMNOT=:num_digit');
      DModRosa.IBQVer_dev.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.text);
      DModRosa.IBQVer_dev.ParamByName('val_digit').AsFloat:=wtotnot;
      DModRosa.IBQVer_dev.ParamByName('num_digit').AsString:=edit4.Text;
      DModRosa.IBQVer_dev.ExecSql;
      DModRosa.IBQVer_dev.Close;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_dev.Close;
    end else
    begin
      if (witens>0) and (edit5.text='Implantar') then
      begin
        if DModRosa.IBQVer_dev.Active then
           DModRosa.IBQVer_dev.Active:=False;
        DModRosa.IBQVer_dev.Sql.Clear;
        DModRosa.IBQVer_dev.Sql.Add('Insert Into DEVOLUCAO ');
        DModRosa.IBQVer_dev.Sql.Add('(NUMNOT,DATNOT,VALNOT,ROMNOT,CODVEN,'+
                                    'DATBAS,CLIENOT) '+
                             'Values(:NUMNOT,:DATNOT,:VALNOT,:ROMNOT,:CODVEN,'+
                                    ':DATBAS,:CLIENOT)');
        DModRosa.IBQVer_dev.ParamByName('NUMNOT').AsString:=edit4.Text;
        DModRosa.IBQVer_dev.ParamByName('DATNOT').AsDateTime:=StrToDate(maskedit1.text);
        DModRosa.IBQVer_dev.ParamByName('VALNOT').AsFloat:=wtotnot;
        DModRosa.IBQVer_dev.ParamByName('ROMNOT').AsString:=edit1.Text;
        DModRosa.IBQVer_dev.ParamByName('CODVEN').AsString:=wvend;
        DModRosa.IBQVer_dev.ParamByName('DATBAS').AsDateTime:=StrToDate(maskedit2.text);
        DModRosa.IBQVer_dev.ParamByName('CLIENOT').AsString:=edit3.text;
        DModRosa.IBQVer_dev.ExecSql;
        DModRosa.IBQVer_dev.Close;
        DModRosa.IBTransaction1.Commit;
        DModRosa.IBQVer_dev.Close;
        Atualiza_venda;
      end;
    end;
  end;
  Button2Click(Sender);
end;

procedure TFrmDevolucao.Button2Click(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit7.Clear;
  edit8.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  edit9.Clear;
  edit10.Clear;
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit3.Clear;
  Richedit3.Lines.Add(' ');
  Richedit3.Lines.Add('                         '+wempresa);
  Richedit3.Lines.Add('                '+wendereco);
  Richedit3.Lines.Add('                     '+wtelefone);
  //Richedit3.Lines.Add('              '+winscricoes);
  Modalresult:=-1;
  exit;
end;

procedure TFrmDevolucao.Edit7Exit(Sender: TObject);
begin
   if (ActiveControl=Button1) or (ActiveControl=Button2) then
     exit;
  chvachou:='';
  xcodi:=edit7.Text;
  wqtda:=0;
  wquant:=0;
  wtotpro:=0;
  if edit7.Text<>'' then
  begin
    IBQAuxdev.Close;
    IBQAuxdev.SQL.Clear;
    IBQAuxdev.SQL.Add('Select * from AUXITENS '+
                      'Where Codart=:art_digit');
    IBQAuxdev.ParamByName('art_digit').AsString:=edit7.Text;
    IBQAuxdev.Active:=True;
    if IBQAuxdev.RecordCount>0 then
    begin
      chvachou:='S';
      edit8.Text:=IBQAuxdev.fieldbyName('Descricao').AsString;
      edit9.Text:=FormatFloat('###0',IBQAuxdev.fieldbyName('Qtdsai').AsFloat);
      edit10.Text:=FormatFloat('#,##0.00',IBQAuxdev.fieldbyName('Precus').AsFloat);
      wqtda:=IBQAuxdev.fieldbyName('Qtdant').AsFloat;
      wtotpro:=StrToFloat(edit9.text)*StrToFloat(edit10.text);
      IBQAuxdev.Close;
      edit9.SetFocus;
      exit;
    end;
    IBQAuxdev.Close;
    DModRosa.IBQLer_itped.Close;
    DModRosa.IBQLer_itped.SQL.Clear;
    DModRosa.IBQLer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'and Codart=:cod_digit');
    DModRosa.IBQLer_itped.ParamByName('ped_digit').AsString:=edit1.Text;
    DModRosa.IBQLer_itped.ParamByName('cod_digit').AsString:=edit7.Text;
    DModRosa.IBQLer_itped.OPen;
    if DModRosa.IBQLer_itped.RecordCount>0 then
    begin
      edit8.Text:=DModRosa.IBQLer_itped.fieldbyName('Descricao').AsString;
      edit10.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_itped.fieldbyName('Precus').AsFloat);
      DModRosa.IBQLer_itped.Close;
      edit9.SetFocus;
      exit;
    end;
    showMessage('Artigo não consta no pedido');
    edit7.Clear;
    edit7.SetFocus;
    exit;
  end;
  showMessage('Identifique o artigo');
  edit7.SetFocus;
end;

procedure TFrmDevolucao.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) or (ActiveControl=Button2) then
     exit;
  with edit1 do
  if Text='' then
  begin
    ShowMessage('Numero do Pedido ????');
    edit1.Clear;
    edit1.SetFocus;
    exit;
  end;
   // Preencher a chave com zeros a esquerda
  While Length(edit1.Text)<edit1.MaxLength do
        edit1.Text := '0'+ edit1.Text;
  DModRosa.IBQLer_ped.Close;
  DModRosa.IBQLer_ped.SQL.Clear;
  DModRosa.IBQLer_ped.SQL.Add('Select * from PEDIDO '+
                              'Where Pedido=:ped_digit');
  DModRosa.IBQLer_ped.ParamByName('ped_digit').AsString:=edit1.Text;
  DModRosa.IBQLer_ped.OPen;
  if DModRosa.IBQLer_ped.RecordCount>0 then
  begin
    maskedit2.Text:=DateToStr(DModRosa.IBQLer_ped.fieldbyName('Base').AsDateTime);
    wvend:=DModRosa.IBQLer_ped.fieldbyName('Codven').AsString;
    wclie:=DModRosa.IBQLer_ped.fieldbyName('Codcli').AsString;
    wpedido:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    wvalven:=DModRosa.IBQLer_ped.fieldbyName('Totven').AsFloat;
    wresido:=DModRosa.IBQLer_ped.fieldbyName('Residuo').AsFloat;
  end else
  begin
    DModRosa.IBQLer_ped.Close;
    showMessage('Pedido nao encontrado');
    edit1.Clear;
    edit1.SetFocus;
    exit;
  end;
  DModRosa.IBQLer_ped.Close;
  // Ler vendedor *********************
  DModRosa.IBQPesq_ven.Close;
  DModRosa.IBQPesq_ven.SQL.Clear;
  DModRosa.IBQPesq_ven.SQL.Add('Select * from VENDEDOR '+
                               'Where Codven=:ven_digit');
  DModRosa.IBQPesq_ven.ParamByName('ven_digit').AsString:=wvend;
  DModRosa.IBQPesq_ven.OPen;
  if DModRosa.IBQPesq_ven.RecordCount>0 then
     edit2.Text:=DModRosa.IBQPesq_ven.fieldbyName('Nome').AsString;
  DModRosa.IBQPesq_ven.Close;
  // Ler cliente *****************
  DModRosa.IBQPesq_cli.Close;
  DModRosa.IBQPesq_cli.SQL.Clear;
  DModRosa.IBQPesq_cli.SQL.Add('Select * from CLIENTE '+
                               'Where IdCli=:cli_digit');
  DModRosa.IBQPesq_cli.ParamByName('cli_digit').AsInteger:=StrToInt(wclie);
  DModRosa.IBQPesq_cli.OPen;
  if DModRosa.IBQPesq_cli.RecordCount>0 then
     edit3.Text:=DModRosa.IBQPesq_cli.fieldbyName('Nome').AsString;
  DModRosa.IBQPesq_cli.Close;
  edit7.SetFocus;
end;

procedure TFrmDevolucao.Edit4Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) or (ActiveControl=Button2) then
     exit;
  with edit4 do
  if Text='' then
  begin
    ShowMessage('Numero da nota ????');
    edit4.Clear;
    edit4.SetFocus;
    exit;
  end;
   // Preencher a chave com zeros a esquerda
  While Length(edit4.Text)<edit4.MaxLength do
        edit4.Text := '0'+ edit4.Text;
  witens:=0;
  wtotqtd:=0;
  wtotpro:=0;
  wtotnot:=0;
  IBTAuxdev.EmptyTable;
  DModRosa.IBQLer_dev.Close;
  DModRosa.IBQLer_dev.SQL.Clear;
  DModRosa.IBQLer_dev.SQL.Add('Select * from DEVOLUCAO '+
                              'Where Numnot=:not_digit');
  DModRosa.IBQLer_dev.ParamByName('not_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_dev.OPen;
  if DModRosa.IBQLer_dev.RecordCount>0 then
  begin
    // Monta Relaçao dos produtos
    maskedit1.Text:=DateToStr(DModRosa.IBQLer_dev.fieldbyName('Datnot').AsDateTime);
    maskedit2.Text:=DateToStr(DModRosa.IBQLer_dev.fieldbyName('Datbas').AsDateTime);
    edit3.Text:=DModRosa.IBQLer_dev.fieldbyName('Clienot').AsString;
    edit1.Text:=DModRosa.IBQLer_dev.fieldbyName('Romnot').AsString;
    wvend:=DModRosa.IBQLer_dev.fieldbyName('Codven').AsString;
    edit3.text:=DModRosa.IBQLer_dev.fieldbyName('Clienot').AsString;
    DModRosa.IBQLer_ven.Close;
    DModRosa.IBQLer_ven.SQL.Clear;
    DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                                'Where Codven=:ven_digit');
    DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=wvend;
    DModRosa.IBQLer_ven.OPen;
    if DModRosa.IBQLer_ven.RecordCount>0 then
       edit2.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString;
    DModRosa.IBQLer_ven.Close;
    Richedit3.Lines.Add('Prod.         Descrição                                                         Quant   Custo    Total');
    DModRosa.IBQLer_itdev.Close;
    DModRosa.IBQLer_itdev.SQL.Clear;
    DModRosa.IBQLer_itdev.SQL.Add('Select * from ITEMDEVOLUCAO '+
                                  'Where Numnot=:not_digit');
    DModRosa.IBQLer_itdev.ParamByName('not_digit').AsString:=edit4.text;
    DModRosa.IBQLer_itdev.Active:=True;
    DModRosa.IBQLer_itdev.DisableControls;
    DModRosa.IBQLer_itdev.First;
    while not DModRosa.IBQLer_itdev.Eof do
    begin
      witens:=witens+1;
      wcodigo:=DModRosa.IBQLer_itdev.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQLer_itdev.fieldbyName('Descricao').AsString;
      wqtda:=DModRosa.IBQLer_itdev.fieldbyName('Quant').AsFloat;
      wpreco:=DModRosa.IBQLer_itdev.fieldbyName('Precus').AsFloat;
      wtotqtd:=wtotqtd+wqtda;
      wtotpro:=wqtda*wpreco;
      wtotnot:=wtotnot+wtotpro;
      if IBQAuxdev.Active then
         IBQAuxdev.Active:=False;
      IBQAuxdev.Sql.Clear;
      IBQAuxdev.Sql.Add('Insert Into AUXITENS ');
      IBQAuxdev.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                         'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                 'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                        ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
      IBQAuxdev.ParamByName('PEDIDO').AsString:=edit4.Text;
      IBQAuxdev.ParamByName('CODART').AsString:=wcodigo;
      IBQAuxdev.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQAuxdev.ParamByName('QTDSAI').AsFloat:=wqtda;
      IBQAuxdev.ParamByName('QTDRET').AsFloat:=0;
      IBQAuxdev.ParamByName('PRECUS').AsFloat:=wpreco;
      IBQAuxdev.ParamByName('PREVEN').AsFloat:=0;
      IBQAuxdev.ParamByName('QTDANT').AsFloat:=wqtda;
      IBQAuxdev.ParamByName('CUSANT').AsFloat:=wpreco;
      IBQAuxdev.ParamByName('VENANT').AsFloat:=0;
      IBQAuxdev.ParamByName('OPER').AsString:='';
      IBQAuxdev.ExecSql;
      IBQAuxdev.Close;
      I:=FormatFloat('#0',witens);
      Q:=FormatFloat('##0',wqtda);
      P:=FormatFloat('###,##0.00',wpreco);
      V:=FormatFloat('####,###,##0.00',wtotpro);
      Richedit1.Lines.Add(wcodigo+'    '+wdescricao);
      Richedit2.Lines.Add(StringofChar(#32,10-Length(Q))+(Q)+
                          StringofChar(#32,12-Length(P))+(P)+
                          StringofChar(#32,12-Length(V))+(V));
      DModRosa.IBQLer_itdev.Next;
    end;
    Richedit1.Lines.Add('            ');
    Richedit1.Lines.Add('            ');
    T:=FormatFloat('#0',witens);
    D:=FormatFloat('####0',wtotqtd);
    G:=FormatFloat('###,##0.00',wtotnot);
    Richedit1.Lines.Add('ARTIGOS     '+StringofChar(#32,8-Length(T))+(T));
    Richedit1.Lines.Add('QUANTIDADES '+StringofChar(#32,8-Length(D))+(D));
    Richedit1.Lines.Add('VALOR TOTAL '+StringofChar(#32,15-Length(G))+(G));
  end;
  DModRosa.IBQLer_dev.Close;
  if edit5.Text='Alterar' then
  begin
    edit7.SetFocus;
    exit;
  end;
  if edit5.Text='Consultar' then
  begin
    Button2.SetFocus;
    exit;
  end;
  if edit5.Text='Excluir' then
  begin
    Button1.SetFocus;
    exit;
  end;
  if edit5.Text='Implantar' then
  begin
    maskedit1.SetFocus;
    exit;
  end;
  Button1Click(Sender);
end;

procedure TFrmDevolucao.Edit9Exit(Sender: TObject);
begin
  if chvachou='S' then
  begin
    if StrToFloat(edit9.text)<1 then
    begin
      // Atualiza Operacao ***********************
      IBQAuxdev.Sql.Clear;
      IBQAuxdev.Sql.Add('Update AUXITENS ');
      IBQAuxdev.Sql.Add('Set OPER=:op_digit '+
                          'Where CODART=:cod_digit');
      IBQAuxdev.ParamByName('op_digit').AsString:='E';
      IBQAuxdev.ParamByName('cod_digit').AsString:=edit7.Text;
      IBQAuxdev.ExecSql;
      IBQAuxdev.Close;
    end else
    begin
      IBQAuxdev.Sql.Clear;
      IBQAuxdev.Sql.Add('Update AUXITENS ');
      IBQAuxdev.Sql.Add('Set QTDSAI=:qtd_digit,'+
                          'PRECUS=:pre_digit,'+
                          'OPER=:op_digit '+
                          'Where CODART=:cod_digit');
      IBQAuxdev.ParamByName('qtd_digit').AsFloat:=StrToFloat(edit9.Text);
      IBQAuxdev.ParamByName('pre_digit').AsFloat:=StrToFloat(edit10.Text);
      IBQAuxdev.ParamByName('op_digit').AsString:='A';
      IBQAuxdev.ParamByName('cod_digit').AsString:=edit7.Text;
      IBQAuxdev.ExecSql;
      IBQAuxdev.Close;
    end;
  end else
  begin
    if IBQAuxdev.Active then
       IBQAuxdev.Active:=False;
    IBQAuxdev.Sql.Clear;
    IBQAuxdev.Sql.Add('Insert Into AUXITENS ');
    IBQAuxdev.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                        'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                       ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
    IBQAuxdev.ParamByName('PEDIDO').AsString:=edit4.Text;
    IBQAuxdev.ParamByName('CODART').AsString:=edit7.Text;
    IBQAuxdev.ParamByName('DESCRICAO').AsString:=edit8.Text;
    IBQAuxdev.ParamByName('QTDSAI').AsFloat:=StrToFloat(edit9.Text);
    IBQAuxdev.ParamByName('QTDRET').AsFloat:=0;
    IBQAuxdev.ParamByName('PRECUS').AsFloat:=StrToFloat(edit10.Text);
    IBQAuxdev.ParamByName('PREVEN').AsFloat:=0;
    IBQAuxdev.ParamByName('QTDANT').AsFloat:=0;
    IBQAuxdev.ParamByName('CUSANT').AsFloat:=0;
    IBQAuxdev.ParamByName('VENANT').AsFloat:=0;
    IBQAuxdev.ParamByName('OPER').AsString:='I';
    IBQAuxdev.ExecSql;
    IBQAuxdev.Close;
  end;
  // Monta lista de produtos *********************
  chvpv:='';
  witens:=0;
  wtotpro:=0;
  wtotqtd:=0;
  wtotnot:=0;
  IBQAuxdev.Close;
  IBQAuxdev.SQL.Clear;
  IBQAuxdev.SQL.Add('Select * from AUXITENS '+
                      'Where OPER<>:op_digit '+
                      'Order by CODART');
  IBQAuxdev.ParamByName('op_digit').AsString:='E';
  IBQAuxdev.Active:=True;
  IBQAuxdev.DisableControls;
  IBQAuxdev.First;
  while not IBQAuxdev.Eof do
  begin
    witens:=witens+1;
    wcodigo:=IBQAuxdev.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxdev.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxdev.fieldbyName('Qtdsai').AsFloat;
    wpreco:=IBQAuxdev.fieldbyName('Precus').AsFloat;
    wtotpro:=wqtda*wpreco;
    wtotqtd:=wtotqtd+wqtda;
    wtotnot:=wtotnot+wtotpro;
    if chvpv='' then
    begin
      chvpv:='1';
      Richedit1.Clear;
      Richedit2.Clear;
      Richedit3.Clear;
      Richedit3.Lines.Add('                         '+wempresa);
      Richedit3.Lines.Add('                '+wendereco);
      Richedit3.Lines.Add('                     '+wtelefone);
      //Richedit3.Lines.Add('              '+winscricoes);
      Richedit3.Lines.Add('Prod.         Descrição                                                         Quant   Custo    Total');
    end;
    I:=FormatFloat('#0',witens);
    Q:=FormatFloat('##0',wqtda);
    P:=FormatFloat('###,##0.00',wpreco);
    V:=FormatFloat('####,###,##0.00',wtotpro);
    Richedit1.Lines.Add(wcodigo+'    '+wdescricao);
    Richedit2.Lines.Add(StringofChar(#32,10-Length(Q))+(Q)+
                        StringofChar(#32,12-Length(P))+(P)+
                        StringofChar(#32,12-Length(V))+(V));
    IBQAuxdev.Next;
  end;
  IBQAuxdev.Close;
  Richedit1.Lines.Add('            ');
  Richedit1.Lines.Add('            ');
  T:=FormatFloat('#0',witens);
  D:=FormatFloat('####0',wtotqtd);
  G:=FormatFloat('###,##0.00',wtotnot);
  Richedit1.Lines.Add('ARTIGOS     '+StringofChar(#32,8-Length(T))+(T));
  Richedit1.Lines.Add('QUANTIDADES '+StringofChar(#32,8-Length(D))+(D));
  Richedit1.Lines.Add('VALOR TOTAL '+StringofChar(#32,15-Length(G))+(G));
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.Clear;
  edit7.SetFocus;
  exit;
end;

procedure TFrmDevolucao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmDevolucao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmDevolucao.FormShow(Sender: TObject);
begin
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.Clear;
  maskedit1.Text:=dateToStr(date());
  maskedit2.Clear;
  wempresa:='SINTEX CONFECÇÕES LTDA.';
  wendereco:='Rua Bernardo de Vanconcelos , 12  Realengo -  RJ';
  wtelefone:='Tel:(021) 3381-8581  /  Cep: 21250-270';
  winscricoes:='CNPJ: 04.704.379/0001-71   -   Insc.Est: 77.260.595';
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit3.Clear;
  Richedit3.Lines.Add('                         '+wempresa);
  Richedit3.Lines.Add('                '+wendereco);
  Richedit3.Lines.Add('                     '+wtelefone);
  IBTAuxdev.EmptyTable;
  //Richedit1.Lines.Add('              '+winscricoes);
  if edit5.Text='Implantar'then
  begin
    Geracod;
    edit1.SetFocus;
    exit;
  end;
  edit4.SetFocus;
  exit;
end;

procedure TFrmDevolucao.Restaura;
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
    xestoq:=xestoq-xqtda;
    xestoq:=xestoq+wqtda;
  end;
  DModRosa.IBQLer_art.Close;
  if chvtem='1' then
  begin
    DModRosa.IBQVer_art.Close;
    DModRosa.IBQVer_art.Sql.Clear;
    DModRosa.IBQVer_art.SqL.Add('Update ARTIGO ');
    DModRosa.IBQVer_art.Sql.Add('Set ESTOQ=:ESTOQ '+
                                'Where CODIGO=:CODIGO');
    DModRosa.IBQVer_art.ParamByName('ESTOQ').AsFloat:=xestoq;
    DModRosa.IBQVer_art.ParamByName('CODIGO').AsString:=wcodigo;
    DModRosa.IBQVer_art.ExecSql;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_art.Close;
  end;
end;

procedure TfrmDevolucao.Geracod;
var
  Codigo: Integer;
begin
  DModRosa.IBQLer_dev.Close;
  DModRosa.IBQLer_dev.SQL.Clear;
  DModRosa.IBQLer_dev.SQL.Add('Select * from DEVOLUCAO '+
                              'Order By Numnot');
  DModRosa.IBQLer_dev.OPen;
  if DModRosa.IBQLer_dev.RecordCount=0 then
     Codigo:=0
  else
  begin
    DModRosa.IBQLer_dev.Last;
    Codigo:=StrToInt(DModRosa.IBQLer_dev.fieldbyName('Numnot').AsString);
  end;
  DModRosa.IBQLer_dev.Close;
  Codigo:=Codigo+1;
  edit4.Text:=IntToStr(Codigo);
  // Preencher a chave com zeros a esquerda
  While Length(edit4.Text)<edit4.MaxLength do
        edit4.Text := '0'+ edit4.Text;
end;

procedure TFrmDevolucao.Atualiza_venda;
begin
  wvalven:=wvalven-wtotnot;
  wresido:=wresido-wtotnot;
  DModRosa.IBQVer_ped.Sql.Clear;
  DModRosa.IBQVer_ped.Sql.Add('Update PEDIDO ');
  DModRosa.IBQVer_ped.Sql.Add('Set TOTVEN=:tot_digit,'+
                              'RESIDUO=:res_digit '+
                              'Where PEDIDO=:num_digit');
  DModRosa.IBQVer_ped.ParamByName('tot_digit').AsFloat:=wvalven;
  DModRosa.IBQVer_ped.ParamByName('res_digit').AsFloat:=wresido;
  DModRosa.IBQVer_ped.ParamByName('num_digit').AsString:=edit1.Text;
  DModRosa.IBQVer_ped.ExecSql;
  DModRosa.IBQVer_ped.Close;
  DModRosa.IBTransaction1.Commit;
  DModRosa.IBQVer_ped.Close;
end;

end.
