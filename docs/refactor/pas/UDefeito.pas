unit UDefeito;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ComCtrls,
  IBX.IBQuery, Data.DB, IBX.IBCustomDataSet, IBX.IBTable;

type
  TFrmDefeito = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    Edit4: TEdit;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RichEdit3: TRichEdit;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    Button1: TButton;
    Button2: TButton;
    IBTAuxdef: TIBTable;
    IBQAuxdef: TIBQuery;
    IBTAuxdefPEDIDO: TIBStringField;
    IBTAuxdefCODART: TIBStringField;
    IBTAuxdefDESCRICAO: TIBStringField;
    IBTAuxdefQTDSAI: TIntegerField;
    IBTAuxdefQTDRET: TIntegerField;
    IBTAuxdefPRECUS: TIBBCDField;
    IBTAuxdefPREVEN: TIBBCDField;
    IBTAuxdefQTDANT: TIntegerField;
    IBTAuxdefCUSANT: TIBBCDField;
    IBTAuxdefVENANT: TIBBCDField;
    IBTAuxdefOPER: TIBStringField;
    IBQAuxdefPEDIDO: TIBStringField;
    IBQAuxdefCODART: TIBStringField;
    IBQAuxdefDESCRICAO: TIBStringField;
    IBQAuxdefQTDSAI: TIntegerField;
    IBQAuxdefQTDRET: TIntegerField;
    IBQAuxdefPRECUS: TIBBCDField;
    IBQAuxdefPREVEN: TIBBCDField;
    IBQAuxdefQTDANT: TIntegerField;
    IBQAuxdefCUSANT: TIBBCDField;
    IBQAuxdefVENANT: TIBBCDField;
    IBQAuxdefOPER: TIBStringField;
    Edit7: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit7Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Numernota;
    procedure Restaura;
  end;

var
  FrmDefeito: TFrmDefeito;
  wopera,wempresa,wendereco,wtelefone,winscricoes,wnumnot: string;
  xcodi,chvpv,wcodigo,wdescricao,chvtem,chvachou,woper: string;
  witens,xnumero: Integer;
  wtotnot,wtotqtd,wtotpro,wqtda: Extended;
  xtotpro,xqtda,wpreco,xestoq: Extended;
  I,Q,P,V,T,D,G: String;

implementation

uses UDModRosa;

{$R *.dfm}

procedure TFrmDefeito.Button1Click(Sender: TObject);
begin
  wtotnot:=0;
  IBQAuxdef.Close;
  IBQAuxdef.SQL.Clear;
  IBQAuxdef.SQL.Add('Select * from AUXITENS '+
                    'Order by Codart');
  IBQAuxdef.Active:=True;
  IBQAuxdef.DisableControls;
  IBQAuxdef.First;
  while not IBQAuxdef.Eof do
  begin
    wnumnot:=IBQAuxdef.fieldbyName('Pedido').AsString;
    wcodigo:=IBQAuxdef.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxdef.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxdef.fieldbyName('Qtdsai').AsFloat;
    xqtda:=IBQAuxdef.fieldbyName('Qtdant').AsFloat;
    wpreco:=IBQAuxdef.fieldbyName('Precus').AsFloat;
    woper:=IBQAuxdef.fieldbyName('Oper').AsString;
    Restaura;
    if (woper='E') and (edit1.Text='Excluir') then
    begin
      DModRosa.IBQVer_itdef.Active:=False;
      DModRosa.IBQVer_itdef.Sql.Clear;
      DModRosa.IBQVer_itdef.SqL.Add('Delete from ITEMDEFEITO '+
                                   'Where NUMNOT=:num_digit '+
                                   'and CODART=:cod_digit');
      DModRosa.IBQVer_itdef.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itdef.ParamByName('cod_digit').AsString:=wcodigo;
      DModRosa.IBQVer_itdef.Active:=True;
      DModRosa.IBQVer_itdef.Active:=false;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_itdef.Close;
    end;
    if (woper='A') and (edit1.text='Alterar') then
    begin
      witens:=witens+1;
      wtotnot:=wtotnot+(wpreco*wqtda);
      DModRosa.IBQVer_itdef.Sql.Clear;
      DModRosa.IBQVer_itdef.Sql.Add('Update ITEMDEFEITO ');
      DModRosa.IBQVer_itdef.Sql.Add('Set QUANT=:qtd_digit,'+
                                    'PRECUS=:pre_digit '+
                                    'Where NUMNOT=:num_digit '+
                                    'and CODART=:cod_digit');
      DModRosa.IBQVer_itdef.ParamByName('qtd_digit').AsFloat:=wqtda;
      DModRosa.IBQVer_itdef.ParamByName('pre_digit').AsFloat:=wpreco;
      DModRosa.IBQVer_itdef.ParamByName('num_digit').AsString:=wnumnot;
      DModRosa.IBQVer_itdef.ParamByName('cod_digit').AsString:=wcodigo;
      DModRosa.IBQVer_itdef.ExecSql;
      DModRosa.IBQVer_itdef.Close;
    end;
    if (woper='I') and (edit1.text='Implantar') then
    begin
      witens:=witens+1;
      wtotnot:=wtotnot+(wpreco*wqtda);
      if DModRosa.IBQVer_itdef.Active then
         DModRosa.IBQVer_itdef.Active:=False;
      DModRosa.IBQVer_itdef.Sql.Clear;
      DModRosa.IBQVer_itdef.Sql.Add('Insert Into ITEMDEFEITO ');
      DModRosa.IBQVer_itdef.Sql.Add('(NUMNOT,CODART,DESCRICAO,QUANT,'+
                                     'PRECUS) '+
                             'Values(:NUMNOT,:CODART,:DESCRICAO,:QUANT,'+
                                    ':PRECUS)');
      DModRosa.IBQVer_itdef.ParamByName('NUMNOT').AsString:=wnumnot;
      DModRosa.IBQVer_itdef.ParamByName('CODART').AsString:=wcodigo;
      DModRosa.IBQVer_itdef.ParamByName('DESCRICAO').AsString:=wdescricao;
      DModRosa.IBQVer_itdef.ParamByName('QUANT').AsFloat:=wqtda;
      DModRosa.IBQVer_itdef.ParamByName('PRECUS').AsFloat:=wpreco;
      DModRosa.IBQVer_itdef.ExecSql;
      DModRosa.IBQVer_itdef.Close;
    end;
    IBQAuxdef.Next;
  end;
  IBQAuxdef.Close;
  if (witens=0) or (edit1.Text='Excluir') then
  begin
    DModRosa.IBQVer_def.Active:=False;
    DModRosa.IBQVer_def.Sql.Clear;
    DModRosa.IBQVer_def.SqL.Add('Delete from DEFEITO '+
                                'Where NUMNOT=:num_digit');
    DModRosa.IBQVer_def.ParamByName('num_digit').AsString:=edit4.text;
    DModRosa.IBQVer_def.Active:=True;
    DModRosa.IBQVer_def.Active:=false;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_def.Close;
  end else
  begin
    if (witens>0) and (edit1.text='Alterar') then
    begin
      DModRosa.IBQVer_def.Sql.Clear;
      DModRosa.IBQVer_def.Sql.Add('Update DEFEITO ');
      DModRosa.IBQVer_def.Sql.Add('Set DATNOT=:dat_digit,'+
                                  'VALNOT=:val_digit '+
                                  'Where NUMNOT=:num_digit');
      DModRosa.IBQVer_def.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.text);
      DModRosa.IBQVer_def.ParamByName('val_digit').AsFloat:=wtotnot;
      DModRosa.IBQVer_def.ParamByName('num_digit').AsString:=edit4.Text;
      DModRosa.IBQVer_def.ExecSql;
      DModRosa.IBQVer_def.Close;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_def.Close;
    end else
    begin
      if (witens>0) and (edit1.text='Implantar') then
      begin
        if DModRosa.IBQVer_def.Active then
           DModRosa.IBQVer_def.Active:=False;
        DModRosa.IBQVer_def.Sql.Clear;
        DModRosa.IBQVer_def.Sql.Add('Insert Into DEFEITO ');
        DModRosa.IBQVer_def.Sql.Add('(NUMNOT,DATNOT,VALNOT) '+
                             'Values(:NUMNOT,:DATNOT,:VALNOT)');
        DModRosa.IBQVer_def.ParamByName('NUMNOT').AsString:=edit4.Text;
        DModRosa.IBQVer_def.ParamByName('DATNOT').AsDateTime:=StrToDate(maskedit1.text);
        DModRosa.IBQVer_def.ParamByName('VALNOT').AsFloat:=wtotnot;
        DModRosa.IBQVer_def.ExecSql;
        DModRosa.IBQVer_def.Close;
        DModRosa.IBTransaction1.Commit;
        DModRosa.IBQVer_def.Close;
      end;
    end;
  end;
  Button2Click(Sender);
end;

procedure TFrmDefeito.Button2Click(Sender: TObject);
begin
  edit4.Clear;
  edit7.Clear;
  edit8.Clear;
  maskedit1.Text:=DateToStr(Date());
  edit9.Clear;
  edit10.Clear;
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit3.Clear;
  Richedit3.Lines.Add('                         '+wempresa);
  Richedit3.Lines.Add('                '+wendereco);
  Richedit3.Lines.Add('                     '+wtelefone);
  // Richedit3.Lines.Add('              '+winscricoes);
  edit4.SetFocus;
  exit;
end;

procedure TFrmDefeito.Edit10Exit(Sender: TObject);
begin
   if chvachou='S' then
  begin
    if StrToFloat(edit9.text)<1 then
    begin
      // Atualiza Operacao ***********************
      IBQAuxdef.Sql.Clear;
      IBQAuxdef.Sql.Add('Update AUXITENS ');
      IBQAuxdef.Sql.Add('Set OPER=:op_digit '+
                        'Where PEDIDO=:ped_digit '+
                        'and CODART=:cod_digit');
      IBQAuxdef.ParamByName('op_digit').AsString:='E';
      IBQAuxdef.ParamByName('ped_digit').AsString:=edit4.Text;
      IBQAuxdef.ParamByName('cod_digit').AsString:=edit7.Text;
      IBQAuxdef.ExecSql;
      IBQAuxdef.Close;
    end else
    begin
      IBQAuxdef.Sql.Clear;
      IBQAuxdef.Sql.Add('Update AUXITENS ');
      IBQAuxdef.Sql.Add('Set QTDSAI=:qtd_digit,'+
                        'PRECUS=:pre_digit,'+
                        'OPER=:op_digit '+
                        'Where PEDIDO=:ped_digit '+
                        'and CODART=:cod_digit');
      IBQAuxdef.ParamByName('qtd_digit').AsFloat:=StrToFloat(edit9.Text);
      IBQAuxdef.ParamByName('pre_digit').AsFloat:=StrToFloat(edit10.Text);
      IBQAuxdef.ParamByName('op_digit').AsString:='A';
      IBQAuxdef.ParamByName('ped_digit').AsString:=edit4.Text;
      IBQAuxdef.ParamByName('cod_digit').AsString:=edit7.Text;
      IBQAuxdef.ExecSql;
      IBQAuxdef.Close;
    end;
  end else
  begin
    if IBQAuxdef.Active then
       IBQAuxdef.Active:=False;
    IBQAuxdef.Sql.Clear;
    IBQAuxdef.Sql.Add('Insert Into AUXITENS ');
    IBQAuxdef.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                      'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
              'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                     ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
    IBQAuxdef.ParamByName('PEDIDO').AsString:=edit4.Text;
    IBQAuxdef.ParamByName('CODART').AsString:=edit7.Text;
    IBQAuxdef.ParamByName('DESCRICAO').AsString:=edit8.Text;
    IBQAuxdef.ParamByName('QTDSAI').AsFloat:=StrToFloat(edit9.Text);
    IBQAuxdef.ParamByName('QTDRET').AsFloat:=0;
    IBQAuxdef.ParamByName('PRECUS').AsFloat:=StrToFloat(edit10.Text);
    IBQAuxdef.ParamByName('PREVEN').AsFloat:=0;
    IBQAuxdef.ParamByName('QTDANT').AsFloat:=0;
    IBQAuxdef.ParamByName('CUSANT').AsFloat:=0;
    IBQAuxdef.ParamByName('VENANT').AsFloat:=0;
    IBQAuxdef.ParamByName('OPER').AsString:='I';
    IBQAuxdef.ExecSql;
    IBQAuxdef.Close;
  end;
  // Monta Relaçao dos produtos
  chvpv:='';
  witens:=0;
  wtotqtd:=0;
  wtotnot:=0;
  IBQAuxdef.Close;
  IBQAuxdef.SQL.Clear;
  IBQAuxdef.SQL.Add('Select * from AUXITENS '+
                    'Where OPER<>:op_digit '+
                    'Order by CODART');
  IBQAuxdef.ParamByName('op_digit').AsString:='E';
  IBQAuxdef.Active:=True;
  IBQAuxdef.DisableControls;
  IBQAuxdef.First;
  while not IBQAuxdef.Eof do
  begin
    witens:=witens+1;
    wcodigo:=IBQAuxdef.fieldbyName('Codart').AsString;
    wdescricao:=IBQAuxdef.fieldbyName('Descricao').AsString;
    wqtda:=IBQAuxdef.fieldbyName('Qtdsai').AsFloat;
    wpreco:=IBQAuxdef.fieldbyName('Precus').AsFloat;
    wtotpro:=wqtda*wpreco;
    wtotqtd:=wtotqtd+wqtda;
    wtotnot:=wtotnot+wtotpro;
    if chvpv='' then
    begin
      chvpv:='1';
      Richedit1.Clear;
      Richedit2.Clear;
      Richedit3.CLear;
      Richedit3.Lines.Add('                         '+wempresa);
      Richedit3.Lines.Add('                '+wendereco);
      Richedit3.Lines.Add('                     '+wtelefone);
      //Richedit1.Lines.Add('              '+winscricoes);
      Richedit3.Lines.Add('Prod.             Descrição                                                                                           Quant       Custo      Total');
    end;
    I:=FormatFloat('#0',witens);
    Q:=FormatFloat('##0',wqtda);
    P:=FormatFloat('###,##0.00',wpreco);
    V:=FormatFloat('####,###,##0.00',wtotpro);
    Richedit1.Lines.Add(wcodigo+'    '+wdescricao);
    Richedit2.Lines.Add(StringofChar(#32,10-Length(Q))+(Q)+
                        StringofChar(#32,12-Length(P))+(P)+
                        StringofChar(#32,12-Length(V))+(V));
    IBQAuxdef.Next;
  end;
  IBQAuxdef.Close;
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

procedure TFrmDefeito.Edit4Exit(Sender: TObject);
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
  IBTAuxdef.EmptyTable;
  DModRosa.IBQLer_def.Close;
  DModRosa.IBQLer_def.SQL.Clear;
  DModRosa.IBQLer_def.SQL.Add('Select * from DEFEITO '+
                              'Where Numnot=:not_digit');
  DModRosa.IBQLer_def.ParamByName('not_digit').AsString:=edit4.Text;
  DModRosa.IBQLer_def.OPen;
  if DModRosa.IBQLer_def.RecordCount>0 then
  begin
    maskedit1.Text:=DateToStr(DModRosa.IBQLer_def.fieldbyName('Datnot').AsDateTime);
    Richedit3.Lines.Add('Prod.             Descrição                                                                                                Quant       Custo      Total');
    witens:=0;
    wtotqtd:=0;
    wtotpro:=0;
    wtotnot:=0;
    DModRosa.IBQLer_itdef.Close;
    DModRosa.IBQLer_itdef.SQL.Clear;
    DModRosa.IBQLer_itdef.SQL.Add('Select * from ITEMDEFEITO '+
                                  'Where Numnot=:not_digit');
    DModRosa.IBQLer_itdef.ParamByName('not_digit').AsString:=edit4.text;
    DModRosa.IBQLer_itdef.Active:=True;
    DModRosa.IBQLer_itdef.DisableControls;
    DModRosa.IBQLer_itdef.First;
    while not DModRosa.IBQLer_itdef.Eof do
    begin
      witens:=witens+1;
      wcodigo:=DModRosa.IBQLer_itdef.fieldbyName('Codart').AsString;
      wdescricao:=DModRosa.IBQLer_itdef.fieldbyName('Descricao').AsString;
      wqtda:=DModRosa.IBQLer_itdef.fieldbyName('Quant').AsFloat;
      wpreco:=DModRosa.IBQLer_itdef.fieldbyName('Precus').AsFloat;
      wtotqtd:=wtotqtd+wqtda;
      wtotpro:=wqtda*wpreco;
      wtotnot:=wtotnot+wtotpro;
      if IBQAuxdef.Active then
          IBQAuxdef.Active:=False;
      IBQAuxdef.Sql.Clear;
      IBQAuxdef.Sql.Add('Insert Into AUXITENS ');
      IBQAuxdef.Sql.Add('(PEDIDO,CODART,DESCRICAO,QTDSAI,QTDRET,'+
                         'PRECUS,PREVEN,QTDANT,CUSANT,VENANT,OPER) '+
                 'Values(:PEDIDO,:CODART,:DESCRICAO,:QTDSAI,:QTDRET,'+
                        ':PRECUS,:PREVEN,:QTDANT,:CUSANT,:VENANT,:OPER)');
      IBQAuxdef.ParamByName('PEDIDO').AsString:=edit4.Text;
      IBQAuxdef.ParamByName('CODART').AsString:=wcodigo;
      IBQAuxdef.ParamByName('DESCRICAO').AsString:=wdescricao;
      IBQAuxdef.ParamByName('QTDSAI').AsFloat:=wqtda;
      IBQAuxdef.ParamByName('QTDRET').AsFloat:=0;
      IBQAuxdef.ParamByName('PRECUS').AsFloat:=wpreco;
      IBQAuxdef.ParamByName('PREVEN').AsFloat:=0;
      IBQAuxdef.ParamByName('QTDANT').AsFloat:=wqtda;
      IBQAuxdef.ParamByName('CUSANT').AsFloat:=wpreco;
      IBQAuxdef.ParamByName('VENANT').AsFloat:=0;
      IBQAuxdef.ParamByName('OPER').AsString:='';
      IBQAuxdef.ExecSql;
      IBQAuxdef.Close;
      I:=FormatFloat('#0',witens);
      Q:=FormatFloat('##0',wqtda);
      P:=FormatFloat('###,##0.00',wpreco);
      V:=FormatFloat('####,###,##0.00',wtotpro);
      Richedit1.Lines.Add(wcodigo+'    '+wdescricao);
      Richedit2.Lines.Add(StringofChar(#32,10-Length(Q))+(Q)+
                          StringofChar(#32,12-Length(P))+(P)+
                          StringofChar(#32,12-Length(V))+(V));
      DModRosa.IBQLer_itdef.Next;
    end;
    DModRosa.IBQLer_itdef.Close;
    Richedit1.Lines.Add('            ');
    Richedit1.Lines.Add('            ');
    T:=FormatFloat('#0',witens);
    D:=FormatFloat('####0',wtotqtd);
    G:=FormatFloat('###,##0.00',wtotnot);
    Richedit1.Lines.Add('ARTIGOS     '+StringofChar(#32,8-Length(T))+(T));
    Richedit1.Lines.Add('QUANTIDADES '+StringofChar(#32,8-Length(D))+(D));
    Richedit1.Lines.Add('VALOR TOTAL '+StringofChar(#32,15-Length(G))+(G));
  end;
  DModRosa.IBQLer_def.Close;
  if edit1.Text='Alterar' then
  begin
    edit7.SetFocus;
    exit;
  end;
  if edit1.Text='Consultar' then
  begin
    Button2.SetFocus;
    exit;
  end;
  if edit1.Text='Excluir' then
  begin
    Button1.SetFocus;
    exit;
  end;
  if edit1.Text='Implantar' then
  begin
    maskedit1.SetFocus;
    exit;
  end;
  Button2Click(Sender);
end;

procedure TFrmDefeito.Edit7Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) or
     (ActiveControl=Button2) then
  exit;
  chvachou:='';
  xcodi:=edit7.Text;
  wqtda:=0;
  wtotpro:=0;
  if edit7.Text<>'' then
  begin
    IBQAuxdef.Close;
    IBQAuxdef.SQL.Clear;
    IBQAuxdef.SQL.Add('Select * from AUXITENS '+
                      'Where Pedido=:ped_digit '+
                      'and Codart=:art_digit');
    IBQAuxdef.ParamByName('ped_digit').AsString:=edit4.Text;
    IBQAuxdef.ParamByName('art_digit').AsString:=edit7.Text;
    IBQAuxdef.Active:=True;
    if IBQAuxdef.RecordCount>0 then
    begin
      chvachou:='S';
      edit8.Text:=IBQAuxdef.fieldbyName('Descricao').AsString;
      edit9.Text:=FormatFloat('###0',IBQAuxdef.FieldbyName('Qtdsai').AsFloat);
      edit10.Text:=FormatFloat('#,##0.00',IBQAuxdef.FieldbyName('Precus').AsFloat);
      wqtda:=IBQAuxdef.fieldbyName('Qtdsai').AsFloat;
      wtotpro:=StrToFloat(edit9.Text)*StrToFloat(edit10.Text);
      IBQAuxdef.Close;
      edit9.SetFocus;
      exit;
    end;
    IBQAuxdef.Close;
    DModRosa.IBQLer_art.Close;
    DModRosa.IBQLer_art.SQL.Clear;
    DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                'Where Codigo=:cod_digit');
    DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=edit7.Text;
    DModRosa.IBQLer_art.OPen;
    if DModRosa.IBQLer_art.RecordCount>0 then
    begin
      edit8.Text:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
      edit10.Text:=FormatFloat('##,##0.00',DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat);
      DModRosa.IBQLer_art.Close;
      edit9.SetFocus;
      exit;
    end;
    showMessage('Artigo não cadastrado');
    edit7.Clear;
    edit7.SetFocus;
    exit;
  end;
  showmessage('Identifique o artigo !!!');
  edit7.Clear;
  edit7.SetFocus;
  exit;
end;

procedure TFrmDefeito.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TFrmDefeito.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmDefeito.FormShow(Sender: TObject);
begin
  if edit1.text='Implantar' then
     Numernota;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit10.Clear;
  maskedit1.Text:=DateToStr(Date());
  wempresa:='ALGITEX CONFECÇÕES LTDA.';
  wendereco:='Rua Bernardo de Vanconcelos , 12  Realengo -  RJ';
  wtelefone:='Tel:(021) 3381-8581  /  Cep: 21250-270';
  winscricoes:='CNPJ: 04.704.379/0001-71   -   Insc.Est: 77.260.595';
  Richedit1.Clear;
  Richedit2.Clear;
  Richedit3.Clear;
  Richedit3.Lines.Add('                         '+wempresa);
  Richedit3.Lines.Add('                '+wendereco);
  Richedit3.Lines.Add('                     '+wtelefone);
  Richedit3.Lines.Add('Prod.             Descrição                                                                                                Quant       Custo      Total');
  edit4.SetFocus;
  exit;
end;

procedure TFrmDefeito.Restaura;
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
    xestoq:=xestoq+xqtda;
    xestoq:=xestoq-wqtda;
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

procedure TFrmDefeito.Numernota;
begin
  DModRosa.IBQVer_def.Close;
  DModRosa.IBQVer_def.SQL.Clear;
  DModRosa.IBQVer_def.SQL.Add('Select * from DEFEITO '+
                              'Order by Numnot');
  DModRosa.IBQVer_def.OPen;
  DModRosa.IBQVer_def.Last;
  xnumero:=StrToInt(DModRosa.IBQVer_def.fieldByName('Numnot').AsString);
  DModRosa.IBQLer_etic.Close;
  xnumero:=xnumero+1;
  edit4.Text:=IntToStr(xnumero);
  // Preencher a chave com zeros a esquerda
  While Length(edit4.Text)<6 do
        edit4.Text := '0'+ edit4.Text;
end;

end.
