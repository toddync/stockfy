unit USolicitacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable;

type
  TFrmSolicitacao = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Edit13: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit10: TEdit;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Edit9: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    Label13: TLabel;
    MaskEdit1: TMaskEdit;
    Edit8: TEdit;
    Edit12: TEdit;
    Label14: TLabel;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Edit17: TEdit;
    RichEdit1: TRichEdit;
    Button1: TButton;
    Button2: TButton;
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
    RichEdit2: TRichEdit;
    Label19: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit6Exit(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure MaskEdit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit17Exit(Sender: TObject);
    procedure Edit8Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Gerarcodigo;
  end;

var
  FrmSolicitacao: TFrmSolicitacao;
   wsolicit,wdescricao,wcodart,chvprima,wsitu,chvachou,wvend,woper,wobser: string;
  wpeqn,wmedi,wgran,wxgran,wtotpeq,wtotmed,wtotgran,wtotxgran,wtotart: Extended;
  I,Q,P,V,T,D,G,X,E,PrntOK: String;
  Codigo: Integer;
implementation

uses UDModRosa; //URelSaida;

{$R *.dfm}

procedure TFrmSolicitacao.Button1Click(Sender: TObject);
begin
   IBQAuxitsolicit.Close;
  IBQAuxitsolicit.SQL.Clear;
  IBQAuxitsolicit.SQL.Add('Select * from AUXITSOLICIT '+
                          'Order by Artigo');
  IBQAuxitsolicit.Active:=True;
  IBQAuxitsolicit.DisableControls;
  IBQAuxitsolicit.First;
  while not IBQAuxitsolicit.Eof do
  begin
    wtotart:=wtotart+1;
    wvend:=IBQAuxitsolicit.fieldbyName('Vendedor').AsString;
    wsolicit:=IBQAuxitsolicit.fieldbyName('Numero').AsString;
    wcodart:=IBQAuxitsolicit.fieldbyName('Artigo').AsString;
    wdescricao:=IBQAuxitsolicit.fieldbyName('Descricao').AsString;
    wpeqn:=IBQAuxitsolicit.fieldbyName('Pequeno').AsFloat;
    wmedi:=IBQAuxitsolicit.fieldbyName('Medio').AsFloat;
    wgran:=IBQAuxitsolicit.fieldbyName('Grande').AsFloat;
    wxgran:=IBQAuxitsolicit.fieldbyName('Xgrande').AsFloat;
    wobser:=IBQAuxitsolicit.fieldbyName('Obser').AsString;
    woper:=IBQAuxitsolicit.fieldbyName('Oper').AsString;
    if (woper='E') or (edit13.Text='Excluir') then
    begin
      wtotart:=wtotart-1;
      DModRosa.IBQVer_itsolicit.Active:=False;
      DModRosa.IBQVer_itsolicit.Sql.Clear;
      DModRosa.IBQVer_itsolicit.SqL.Add('Delete from ITSOLICIT '+
                                        'Where VENDEDOR=:ven_digit '+
                                        'and NUMERO=:num_digit '+
                                        'and ARTIGO=:art_digit');
      DModRosa.IBQVer_itsolicit.ParamByName('ven_digit').AsString:=wvend;
      DModRosa.IBQVer_itsolicit.ParamByName('num_digit').AsString:=wsolicit;
      DModRosa.IBQVer_itsolicit.ParamByName('art_digit').AsString:=wcodart;
      DModRosa.IBQVer_itsolicit.Active:=True;
      DModRosa.IBQVer_itsolicit.Active:=false;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_itsolicit.Close;
    end;
    if woper='A' then
    begin
      DModRosa.IBQVer_itsolicit.Sql.Clear;
      DModRosa.IBQVer_itsolicit.Sql.Add('Update ITSOLICIT ');
      DModRosa.IBQVer_itsolicit.Sql.Add('Set PEQUENO=:peq_digit,'+
                                        'MEDIO=:med_digit,'+
                                        'GRANDE=:gran_digit,'+
                                        'XGRANDE=:xgran_digit,'+
                                        'OBSER=:obs_digit '+
                                        'Where VENDEDOR=:ven_digit '+
                                        'and NUMERO=:num_digit '+
                                        'and ARTIGO=:art_digit');
      DModRosa.IBQVer_itsolicit.ParamByName('peq_digit').AsFloat:=wpeqn;
      DModRosa.IBQVer_itsolicit.ParamByName('med_digit').AsFloat:=wmedi;
      DModRosa.IBQVer_itsolicit.ParamByName('gran_digit').AsFloat:=wgran;
      DModRosa.IBQVer_itsolicit.ParamByName('xgran_digit').AsFloat:=wxgran;
      DModRosa.IBQVer_itsolicit.ParamByName('obs_digit').AsString:=wobser;
      DModRosa.IBQVer_itsolicit.ParamByName('ven_digit').AsString:=wvend;
      DModRosa.IBQVer_itsolicit.ParamByName('num_digit').AsString:=wsolicit;
      DModRosa.IBQVer_itsolicit.ParamByName('art_digit').AsString:=wcodart;
      DModRosa.IBQVer_itsolicit.ExecSql;
      DModRosa.IBQVer_itsolicit.Close;
    end;
    if woper='I' then
    begin
      if DModRosa.IBQVer_itsolicit.Active then
         DModRosa.IBQVer_itsolicit.Active:=False;
      DModRosa.IBQVer_itsolicit.Sql.Clear;
      DModRosa.IBQVer_itsolicit.Sql.Add('Insert Into ITSOLICIT ');
      DModRosa.IBQVer_itsolicit.Sql.Add('(VENDEDOR,NUMERO,ARTIGO,DESCRICAO,'+
                                        'PEQUENO,MEDIO,GRANDE,XGRANDE,OBSER) '+
                                'Values(:VENDEDOR,:NUMERO,:ARTIGO,:DESCRICAO,'+
                                       ':PEQUENO,:MEDIO,:GRANDE,:XGRANDE,:OBSER)');
      DModRosa.IBQVer_itsolicit.ParamByName('VENDEDOR').AsString:=wvend;
      DModRosa.IBQVer_itsolicit.ParamByName('NUMERO').AsString:=wsolicit;
      DModRosa.IBQVer_itsolicit.ParamByName('ARTIGO').AsString:=wcodart;
      DModRosa.IBQVer_itsolicit.ParamByName('DESCRICAO').AsString:=wdescricao;
      DModRosa.IBQVer_itsolicit.ParamByName('PEQUENO').AsFloat:=wpeqn;
      DModRosa.IBQVer_itsolicit.ParamByName('MEDIO').AsFloat:=wmedi;
      DModRosa.IBQVer_itsolicit.ParamByName('GRANDE').AsFloat:=wgran;
      DModRosa.IBQVer_itsolicit.ParamByName('XGRANDE').AsFloat:=wxgran;
      DModRosa.IBQVer_itsolicit.ParamByName('OBSER').AsString:=wobser;
      DModRosa.IBQVer_itsolicit.ExecSql;
      DModRosa.IBQVer_itsolicit.Close;
    end;
    IBQAuxitsolicit.Next;
  end;
  IBQAuxitsolicit.Close;
  if (wtotart=0) or (edit13.Text='Excluir') then
  begin
    DModRosa.IBQVer_solicit.Active:=False;
    DModRosa.IBQVer_solicit.Sql.Clear;
    DModRosa.IBQVer_solicit.Sql.Add('Update SOLICITACAO ');
    DModRosa.IBQVer_solicit.Sql.Add('Set SITU=:sit_digit '+
                                    'Where VENDEDOR=:vend_digit '+
                                    'and NUMERO=:num_digit');
    DModRosa.IBQVer_solicit.ParamByName('sit_digit').AsString:='X';
    DModRosa.IBQVer_solicit.ParamByName('vend_digit').AsString:=edit6.Text;
    DModRosa.IBQVer_solicit.ParamByName('num_digit').AsString:=edit10.Text;
    DModRosa.IBQVer_solicit.ExecSql;
    DModRosa.IBQVer_solicit.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_solicit.Close;
  end;
  if (wtotart>0) and (edit13.text='Alterar') then
  begin
    DModRosa.IBQVer_solicit.Active:=False;
    DModRosa.IBQVer_solicit.Sql.Clear;
    DModRosa.IBQVer_solicit.Sql.Add('Update SOLICITACAO ');
    DModRosa.IBQVer_solicit.Sql.Add('Set CLIENTE=:cli_digit,'+
                                    'NOMCLI=:nom_digit,'+
                                    'DATSOL=:dat_digit '+
                                    'Where VENDEDOR=:vend_digit '+
                                    'and NUMERO=:num_digit');
    DModRosa.IBQVer_solicit.ParamByName('cli_digit').AsString:=edit1.text;
    DModRosa.IBQVer_solicit.ParamByName('nom_digit').AsString:=edit2.text;
    DModRosa.IBQVer_solicit.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit2.Text);
    DModRosa.IBQVer_solicit.ParamByName('vend_digit').AsString:=edit6.Text;
    DModRosa.IBQVer_solicit.ParamByName('num_digit').AsString:=edit10.Text;
    DModRosa.IBQVer_solicit.ExecSql;
    DModRosa.IBQVer_solicit.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_solicit.Close;
  end;
  if (wtotart>0) and (edit13.text='Implantar') then
  begin
    if DModRosa.IBQVer_solicit.Active then
       DModRosa.IBQVer_solicit.Active:=False;
    DModRosa.IBQVer_solicit.Sql.Clear;
    DModRosa.IBQVer_solicit.Sql.Add('Insert Into SOLICITACAO ');
    DModRosa.IBQVer_solicit.Sql.Add('(VENDEDOR,NUMERO,CLIENTE,NOMCLI,DATSOL,SITU) '+
                            'Values(:VENDEDOR,:NUMERO,:CLIENTE,:NOMCLI,:DATSOL,:SITU)');
    DModRosa.IBQVer_solicit.ParamByName('VENDEDOR').AsString:=edit6.Text;
    DModRosa.IBQVer_solicit.ParamByName('NUMERO').AsString:=edit10.text;
    DModRosa.IBQVer_solicit.ParamByName('CLIENTE').AsString:=edit1.Text;
    DModRosa.IBQVer_solicit.ParamByName('NOMCLI').AsString:=edit2.Text;
    DModRosa.IBQVer_solicit.ParamByName('DATSOL').AsDateTime:=StrToDate(maskedit2.Text);
    DModRosa.IBQVer_solicit.ParamByName('SITU').AsString:='';
    DModRosa.IBQVer_solicit.ExecSql;
    DModRosa.IBQVer_solicit.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_solicit.Close;
    if MessageDlg('Deseja imprimir a solicitação ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
     { FrmRelsaida:=TFrmRelSaida.Create(Self);
      FrmRelSaida.edit6.Text:=edit6.Text;
      FrmRelSaida.edit5.Text:=edit10.Text;
      FrmRelsaida.edit8.text:='X';
      FrmRelSaida.ShowModal;  }
    end;
    // Atualiza vendedor  ****************
    DModRosa.IBQVer_ven.Active:=False;
    DModRosa.IBQVer_ven.Sql.Clear;
    DModRosa.IBQVer_ven.Sql.Add('Update VENDEDOR ');
    DModRosa.IBQVer_ven.Sql.Add('Set DATSOL=:dat_digit,'+
                                'NUMSOL=:num_digit '+
                                'Where CODVEN=:vend_digit');
    DModRosa.IBQVer_ven.ParamByName('dat_digit').AsString:=maskedit2.Text;
    DModRosa.IBQVer_ven.ParamByName('num_digit').AsString:=edit10.text;
    DModRosa.IBQVer_ven.ParamByName('vend_digit').AsString:=edit6.Text;
    DModRosa.IBQVer_ven.ExecSql;
    DModRosa.IBQVer_ven.Close;
    DModRosa.IBTransaction1.Commit;
    DModRosa.IBQVer_ven.Close;
  end;
  Button2Click(Sender);
end;

procedure TFrmSolicitacao.Button2Click(Sender: TObject);
begin
  edit1.Clear;
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
  maskedit1.Clear;
  maskedit2.Clear;
  edit14.Clear;
  edit15.Clear;
  edit16.Clear;
  edit17.Clear;
  Richedit1.Clear;
  Richedit2.Clear;
  Groupbox3.visible:=False;
  Modalresult:=-1;
end;

procedure TFrmSolicitacao.Edit10Exit(Sender: TObject);
begin
  wtotart:=0;
  wtotpeq:=0;
  wtotmed:=0;
  wtotgran:=0;
  wtotxgran:=0;
  if edit10.text<>'' then
  begin
    DModRosa.IBQLer_solicit.Close;
    DModRosa.IBQLer_solicit.Close;
    DModRosa.IBQLer_solicit.SQL.Clear;
    DModRosa.IBQLer_solicit.SQL.Add('Select * from SOLICITACAO '+
                                    'Where Vendedor=:ven_digit '+
                                    'and Numero=:num_digit');
    DModRosa.IBQLer_solicit.ParamByName('ven_digit').AsString:=edit6.Text;
    DModRosa.IBQLer_solicit.ParamByName('num_digit').AsString:=edit10.Text;
    DModRosa.IBQLer_solicit.OPen;
    if DModRosa.IBQLer_solicit.RecordCount>0 then
    begin
      maskedit2.text:=DateToStr(DModRosa.IBQLer_solicit.fieldbyName('Datsol').AsDateTime);
      edit1.text:=DModRosa.IBQLer_solicit.fieldbyName('Cliente').AsString;
      edit2.text:=DModRosa.IBQLer_solicit.fieldbyName('Nomcli').AsString;
      wsitu:=DModRosa.IBQLer_solicit.fieldbyName('Situ').AsString;
      Richedit1.Clear;
      // Ler Itens do pedido *********************
      DModRosa.IBQVer_itsolicit.Close;
      DModRosa.IBQVer_itsolicit.SQL.Clear;
      DModRosa.IBQVer_itsolicit.SQL.Add('Select * from ITSOLICIT '+
                                        'Where Vendedor=:ven_digit '+
                                        'and Numero=:num_digit');
      DModRosa.IBQVer_itsolicit.ParamByName('ven_digit').AsString:=edit6.Text;
      DModRosa.IBQVer_itsolicit.ParamByName('num_digit').AsString:=edit10.Text;
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
        wxgran:=DModRosa.IBQVer_itsolicit.fieldbyName('Xgrande').AsFloat;
        wobser:=DModRosa.IBQVer_itsolicit.fieldbyName('Obser').AsString;
        wtotart:=wtotart+1;
        wtotpeq:=wtotpeq+wpeqn;
        wtotmed:=wtotmed+wmedi;
        wtotgran:=wtotgran+wgran;
        wtotxgran:=wtotxgran+wxgran;
        if IBQAuxitsolicit.Active then
           IBQAuxitsolicit.Active:=False;
        IBQAuxitsolicit.Sql.Clear;
        IBQAuxitsolicit.Sql.Add('Insert Into AUXITSOLICIT ');
        IBQAuxitsolicit.Sql.Add('(VENDEDOR,NUMERO,ARTIGO,DESCRICAO,'+
                                'PEQUENO,MEDIO,GRANDE,XGRANDE,OBSER,OPER) '+
                       'Values(:VENDEDOR,:NUMERO,:ARTIGO,:DESCRICAO,'+
                                ':PEQUENO,:MEDIO,:GRANDE,:XGRANDE,:OBSER,:OPER)');
        IBQAuxitsolicit.ParamByName('VENDEDOR').AsString:=edit6.text;
        IBQAuxitsolicit.ParamByName('NUMERO').AsString:=edit10.text;
        IBQAuxitsolicit.ParamByName('ARTIGO').AsString:=wcodart;
        IBQAuxitsolicit.ParamByName('DESCRICAO').AsString:=wdescricao;
        IBQAuxitsolicit.ParamByName('PEQUENO').AsFloat:=wpeqn;
        IBQAuxitsolicit.ParamByName('MEDIO').AsFloat:=wmedi;
        IBQAuxitsolicit.ParamByName('GRANDE').AsFloat:=wgran;
        IBQAuxitsolicit.ParamByName('XGRANDE').AsFloat:=wxgran;
        IBQAuxitsolicit.ParamByName('OBSER').AsString:=wobser;
        IBQAuxitsolicit.ParamByName('OPER').AsString:='';
        IBQAuxitsolicit.ExecSql;
        IBQAuxitsolicit.Close;
        I:=FormatFloat('#00',wpeqn);
        Q:=FormatFloat('#00',wmedi);
        P:=FormatFloat('#00',wgran);
        V:=FormatFloat('#00',wxgran);
        Richedit1.Lines.Add(wcodart+'   '+Copy(wdescricao,1,25));
        Richedit2.Lines.Add(StringofChar(#32,7-length(I))+(I)+
                               StringofChar(#32,8-length(Q))+(Q)+
                               StringofChar(#32,8-length(P))+(P)+
                               StringofChar(#32,8-length(V))+(V));
        DModRosa.IBQVer_itsolicit.Next;
      end;
      DModRosa.IBQVer_itsolicit.Close;
      T:=FormatFloat('#00',wtotart);
      D:=FormatFloat('#00',wtotpeq);
      G:=FormatFloat('#00',wtotmed);
      E:=FormatFloat('#00',wtotgran);
      X:=FormatFloat('#00',wtotxgran);
      Richedit2.Lines.Add('  ');
      Richedit2.Lines.Add(StringofChar(#32,7-length(D))+(D)+
                          StringofChar(#32,8-length(G))+(G)+
                          StringofChar(#32,8-length(E))+(E)+
                          StringofChar(#32,8-length(X))+(X));
      Richedit1.Lines.Add('  ');
      Richedit1.Lines.Add(' ARTIGOS '+
                          StringofChar(#32,8-Length(T))+(T));
      DModRosa.IBQLer_Solicit.Close;
      // Pesquisa operaçao ***************
      if wsitu='X' then
      begin
        showmessage('Solicitação esta cancelada !!!!!');
        Button2Click(Sender);
      end;
      if wsitu='A' then
      begin
        showmessage('Solicitação ja foi atendida !!!!!');
        Button2Click(Sender);
      end;
      if edit13.Text='Alterar' then
      begin
        maskedit2.SetFocus;
        exit;
      end;
      if edit13.Text='Consultar' then
      begin
        edit1.SetFocus;
        exit;
      end;
      if edit13.Text='Excluir' then
      begin
        Button1.SetFocus;
        exit;
      end;
    end else
    begin
      if edit13.Text='Implantar' then
      begin
        maskedit2.SetFocus;
        exit;
      end;
    end;
  end else
      showmessage('Informe numero da solicitação !!!!');
  Button2Click(sender);
end;

procedure TFrmSolicitacao.Edit17Exit(Sender: TObject);
begin
    if chvachou='S' then
  begin
    if (edit14.Text<'1') and
       (edit15.Text<'1') and
       (edit16.Text<'1') and
       (edit17.Text<'1') then
    begin
      // Atualiza Operacao ***********************
      IBQAuxitsolicit.Sql.Clear;
      IBQAuxitsolicit.Sql.Add('Update AUXITSOLICIT ');
      IBQAuxitsolicit.Sql.Add('Set OPER=:op_digit '+
                              'Where Vendedor=:ven_digit '+
                              'and Numero=:num_digit '+
                              'and Artigo=:art_digit');
      IBQAuxitsolicit.ParamByName('op_digit').AsString:='E';
      IBQAuxitsolicit.ParamByName('ven_digit').AsString:=edit6.Text;
      IBQAuxitsolicit.ParamByName('num_digit').AsString:=edit10.Text;
      IBQAuxitsolicit.ParamByName('art_digit').AsString:=edit8.Text;
      IBQAuxitsolicit.ExecSql;
      IBQAuxitsolicit.Close;
    end;
    if woper='A' then
    begin
      IBQAuxitsolicit.Sql.Clear;
      IBQAuxitsolicit.Sql.Add('Update AUXITSOLICIT ');
      IBQAuxitsolicit.Sql.Add('Set PEQUENO=:peq_digit,'+
                              'MEDIO=:med_digit,'+
                              'GRANDE=:gran_digit,'+
                              'XGRANDE=:xgran_digit,'+
                              'OBSER=:obs_digit,'+
                              'OPER=:op_digit '+
                              'Where Vendedor=:ven_digit '+
                              'and Numero=:num_digit '+
                              'and Artigo=:art_digit');
      IBQAuxitsolicit.ParamByName('peq_digit').AsFloat:=StrToFloat(edit14.text);
      IBQAuxitsolicit.ParamByName('med_digit').AsFloat:=StrToFloat(edit15.Text);
      IBQAuxitsolicit.ParamByName('gran_digit').AsFloat:=StrToFloat(edit16.Text);
      IBQAuxitsolicit.ParamByName('xgran_digit').AsFloat:=StrToFloat(edit17.text);
      IBQAuxitsolicit.ParamByName('obs_digit').AsString:=' ';
      IBQAuxitsolicit.ParamByName('op_digit').AsString:='A';
      IBQAuxitsolicit.ParamByName('ven_digit').AsString:=edit6.Text;
      IBQAuxitsolicit.ParamByName('num_digit').AsString:=edit10.Text;
      IBQAuxitsolicit.ParamByName('art_digit').AsString:=edit8.Text;
      IBQAuxitsolicit.ExecSql;
      IBQAuxitsolicit.Close;
    end;
  end else
  begin
    if IBQAuxitsolicit.Active then
       IBQAuxitsolicit.Active:=False;
    IBQAuxitsolicit.Sql.Clear;
    IBQAuxitsolicit.Sql.Add('Insert Into AUXITSOLICIT ');
    IBQAuxitsolicit.Sql.Add('(VENDEDOR,NUMERO,ARTIGO,DESCRICAO,PEQUENO,'+
                            'MEDIO,GRANDE,XGRANDE,OBSER,OPER) '+
                    'Values(:VENDEDOR,:NUMERO,:ARTIGO,:DESCRICAO,:PEQUENO,'+
                            ':MEDIO,:GRANDE,:XGRANDE,:OBSER,:OPER)');
    IBQAuxitsolicit.ParamByName('VENDEDOR').AsString:=edit6.Text;
    IBQAuxitsolicit.ParamByName('NUMERO').AsString:=edit10.Text;
    IBQAuxitsolicit.ParamByName('ARTIGO').AsString:=edit8.Text;
    IBQAuxitsolicit.ParamByName('DESCRICAO').AsString:=edit12.Text;
    IBQAuxitsolicit.ParamByName('PEQUENO').AsFloat:=StrToFloat(edit14.Text);
    IBQAuxitsolicit.ParamByName('MEDIO').AsFloat:=StrToFloat(edit15.Text);
    IBQAuxitsolicit.ParamByName('GRANDE').AsFloat:=StrToFloat(edit16.Text);
    IBQAuxitsolicit.ParamByName('XGRANDE').AsFloat:=StrToFloat(edit17.Text);
    IBQAuxitsolicit.ParamByName('OBSER').AsString:=' ';
    IBQAuxitsolicit.ParamByName('OPER').AsString:='I';
    IBQAuxitsolicit.ExecSql;
    IBQAuxitsolicit.Close;
  end;
  // Monta lista de artigos *********************
  wtotart:=0;
  wtotpeq:=0;
  wtotmed:=0;
  wtotgran:=0;
  wtotxgran:=0;
  Richedit1.Clear;
  Richedit2.Clear;
  // Ler Itens do pedido *********************
  IBQAuxitsolicit.Close;
  IBQAuxitsolicit.SQL.Clear;
  IBQAuxitsolicit.SQL.Add('Select * from AUXITSOLICIT '+
                          'Order by Artigo');
  IBQAuxitsolicit.OPen;
  IBQAuxitsolicit.DisableControls;
  IBQAuxitsolicit.First;
  while not IBQAuxitsolicit.Eof do
  begin
    wcodart:=IBQAuxitsolicit.fieldbyName('Artigo').AsString;
    wdescricao:=IBQAuxitsolicit.fieldbyName('Descricao').AsString;
    wpeqn:=IBQAuxitsolicit.fieldbyName('Pequeno').AsFloat;
    wmedi:=IBQAuxitsolicit.fieldbyName('Medio').AsFloat;
    wgran:=IBQAuxitsolicit.fieldbyName('Grande').AsFloat;
    wxgran:=IBQAuxitsolicit.fieldbyName('Xgrande').AsFloat;
    wtotart:=wtotart+1;
    wtotpeq:=wtotpeq+wpeqn;
    wtotmed:=wtotmed+wmedi;
    wtotgran:=wtotgran+wgran;
    wtotxgran:=wtotxgran+wxgran;
    I:=FormatFloat('#00',wpeqn);
    Q:=FormatFloat('#00',wmedi);
    P:=FormatFloat('#00',wgran);
    V:=FormatFloat('#00',wxgran);
    Richedit1.Lines.Add(wcodart+' '+Copy(wdescricao,1,25));
    Richedit2.Lines.Add(StringofChar(#32,7-length(I))+(I)+
                        StringofChar(#32,8-length(Q))+(Q)+
                        StringofChar(#32,8-length(P))+(P)+
                        StringofChar(#32,8-length(V))+(V));
    IBQAuxitsolicit.Next;
  end;
  IBQAuxitsolicit.Close;
  T:=FormatFloat('#00',wtotart);
  D:=FormatFloat('#00',wtotpeq);
  G:=FormatFloat('#00',wtotmed);
  E:=FormatFloat('#00',wtotgran);
  X:=FormatFloat('#00',wtotxgran);
  Richedit2.Lines.Add('  ');
  Richedit2.Lines.Add(StringofChar(#32,7-length(D))+(D)+
                      StringofChar(#32,8-length(G))+(G)+
                      StringofChar(#32,8-length(E))+(E)+
                      StringofChar(#32,8-length(X))+(X));
  Richedit1.Lines.Add('  ');
  Richedit1.Lines.Add(' ARTIGOS '+
                      StringofChar(#32,8-Length(T))+(T));
  edit8.Clear;
  edit14.Clear;
  edit15.Clear;
  edit16.Clear;
  edit17.Clear;
  edit12.Clear;
  edit8.Setfocus;
  exit;
end;

procedure TFrmSolicitacao.Edit1Exit(Sender: TObject);
begin
  if ActiveControl=Button2 then
     exit;
  if edit1.Text<>' ' then
  begin
    // Preencher a chave com zeros a esquerda
     While Length(edit1.Text)<edit1.MaxLength do
        edit1.Text := '0'+ edit1.Text;
    DModRosa.IBQLer_cli.Close;
    DModRosa.IBQLer_cli.SQL.Clear;
    DModRosa.IBQLer_cli.SQL.Add('Select * from CLIENTE '+
                                'Where Idcli=:cli_digit');
    DModRosa.IBQLer_cli.ParamByName('cli_digit').AsInteger:=StrToInt(edit1.Text);
    DModRosa.IBQLer_cli.OPen;
    if DModRosa.IBQLer_cli.RecordCount>0 then
    begin
      edit2.Text:=DModRosa.IBQLer_cli.fieldbyName('Nome').AsString;
      edit3.Text:=DModRosa.IBQLer_cli.fieldbyName('Ende').AsString;
      edit4.Text:=DModRosa.IBQLer_cli.fieldbyName('Bair').AsString;
      edit5.Text:=DModRosa.IBQLer_cli.fieldbyName('Cida').AsString;
      maskedit1.Text:=DModRosa.IBQLer_cli.fieldbyName('Ncep').AsString;
      edit9.text:=DModRosa.IBQLer_cli.fieldbyName('Esta').ASString;
      edit11.Text:=DModRosa.IBQLer_cli.fieldbyName('Refer').AsString;
      DModRosa.IBQLer_cli.Close;
      if edit13.text='Consultar' then
      begin
        Button2.SetFocus;
        exit;
      end;
      Groupbox3.visible:=True;
      edit8.SetFocus;
      exit;
    end else
    begin
      DModRosa.IBQLer_cli.Close;
      showmessage('Cliente não cadastrado');
      Button2Click(Sender);
    end;
  end else
      showmessage('Identifique o Cliente !!!!');
  Button2Click(Sender);
end;

procedure TFrmSolicitacao.Edit6Exit(Sender: TObject);
begin
  if edit6.text='' then
  begin
    showmessage('Informe vendedor !!!!');
    Button2Click(sender);
    exit;
  end;
  // Preencher a chave com zeros a esquerda
  While Length(edit6.Text)<edit6.MaxLength do
        edit6.Text := '0'+ edit6.Text;
  IBTAuxitsolicit.EmptyTable;
  DModRosa.IBQLer_ven.Close;
  DModRosa.IBQLer_ven.SQL.Clear;
  DModRosa.IBQLer_ven.SQL.Add('Select * from VENDEDOR '+
                              'Where Codven=:ven_digit');
  DModRosa.IBQLer_ven.ParamByName('ven_digit').AsString:=edit6.Text;
  DModRosa.IBQLer_ven.OPen;
  if DModRosa.IBQLer_ven.RecordCount>0 then
     edit7.Text:=DModRosa.IBQLer_ven.fieldbyName('Nome').AsString
  else
  begin
    DModRosa.IBQLer_ven.Close;
    showmessage('Vendedor não cadastrado !!!');
    Button2Click(sender);
    exit;
  end;
  DModRosa.IBQLer_ven.Close;
  if edit13.text='Implantar' then
  begin
    wtotart:=0;
    Gerarcodigo;
    maskedit2.SetFocus;
    exit;
  end;
end;

procedure TFrmSolicitacao.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmSolicitacao.FormShow(Sender: TObject);
begin
  wtotart:=0;
  Codigo:=0;
  woper:='';
  edit2.Clear;
  edit3.Clear;
  edit4.Clear;
  edit5.Clear;
  edit7.Clear;
  edit8.Clear;
  edit9.Clear;
  edit11.Clear;
  maskedit1.Clear;
  maskedit2.Clear;
  edit14.Clear;
  edit15.Clear;
  edit16.Clear;
  edit17.Clear;
  if edit13.text='Implantar' then
  begin;
    edit6.Clear;
    edit10.Clear;
  end;
  edit6.SetFocus;
  exit;
end;

procedure TFrmSolicitacao.Gerarcodigo;
begin
  // Ler Solicitação ***************
  DModRosa.IBQVer_solicit.Close;
  DModRosa.IBQVer_solicit.SQL.Clear;
  DModRosa.IBQVer_Solicit.SQL.Add('Select * from SOLICITACAO '+
                                  'Where Vendedor=:ven_digit '+
                                  'Order by Numero');
  DModRosa.IBQVer_solicit.ParamByName('ven_digit').AsString:=edit6.Text;
  DModRosa.IBQVer_solicit.OPen;
  if DModRosa.IBQVer_solicit.RecordCount=0 then
     Codigo:=1
  else
  begin
    DModRosa.IBQVer_solicit.Last;
    Codigo:=StrToInt(DModRosa.IBQVer_solicit.fieldbyName('Numero').AsString);
    Codigo:=Codigo+1;
  end;
  DModRosa.IBQVer_solicit.Close;
  wsolicit:=IntToStr(Codigo);
  // Preencher a chave com zeros a esquerda
  While Length(wsolicit)<6 do
        wsolicit:= '0'+ wsolicit;
  edit10.text:=wsolicit;
end;


procedure TFrmSolicitacao.MaskEdit2Exit(Sender: TObject);
begin
  if strTodate(maskedit2.Text)<StrToDate('01/01/2012') then
  begin
    showmessage('Erro na data da dolicitação !!!');
    Button2Click(sender);
  end;
  edit1.setFocus;
  exit;
end;

procedure TFrmSolicitacao.Edit8Exit(Sender: TObject);
begin
  chvachou:='';
  woper:='';
  wpeqn:=0;
  wmedi:=0;
  wgran:=0;
  wxgran:=0;
  if (ActiveControl=Button1) or (ActiveControl=Button2) then
     exit;
  if edit8.text<>'' then
  begin
    // Ler Itens do auxpedido *********************
    IBQAuxitsolicit.Close;
    IBQAuxitsolicit.SQL.Clear;
    IBQAuxitsolicit.SQL.Add('Select * from  AUXITSOLICIT '+
                            'Where Artigo=:art_digit');
    IBQAuxitsolicit.ParamByName('art_digit').AsString:=edit8.Text;
    IBQAuxitsolicit.OPen;
    if IBQAuxitsolicit.RecordCount>0 then
    begin
      chvachou:='S';
      edit12.Text:=IBQAuxitsolicit.fieldbyName('Descricao').AsString;
      edit14.Text:=FormatFloat('##0.0',IBQAuxitsolicit.fieldbyName('Pequeno').AsFloat);
      edit15.Text:=FormatFloat('##0.0',IBQAuxitsolicit.fieldbyName('Medio').AsFloat);
      edit16.Text:=FormatFloat('##0.0',IBQAuxitsolicit.fieldbyName('Grande').AsFloat);
      edit17.Text:=FormatFloat('##0.0',IBQAuxitsolicit.fieldbyName('Xgrande').AsFloat);
      woper:='A';
      IBQAuxitsolicit.Close;
      edit14.SetFocus;
      exit;
    end else
    begin
      IBQAuxitsolicit.Close;
      wtotart:=wtotart+1;
      if wtotart>24 then
      begin
        showMessage('Capacidade ultrapassada, encerre'+Char(#13)+
                    'a solicitação prossiga em outra');
        edit8.Clear;
        edit8.SetFocus;
        exit;
      end;
      DModRosa.IBQLer_art.Close;
      DModRosa.IBQLer_art.SQL.Clear;
      DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                                  'Where Codigo=:cod_digit');
      DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=edit8.Text;
      DModRosa.IBQLer_art.OPen;
      if DModRosa.IBQLer_art.RecordCount>0 then
      begin
        edit12.Text:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
        DModRosa.IBQLer_art.Close;
        woper:='I';
        edit14.SetFocus;
        exit;
      end else
      begin
        DModRosa.IBQLer_art.Close;
        PrntOk:='';
        while PrntOk<>'S' do
        begin
          MessageBeep(64);
          PrntOk:=InputBox('Artigo nao cadastrado ??',
                          'Para sair confirme( S ):',' ');
          PrntOk:=UPPERCASE(PrntOk);
        end;
        edit8.SetFocus;
        exit;
      end;
    end;
  end else
      showmessage('Identifique o artigo !!!!');
  edit8.SetFocus;
  exit;
end;

end.
