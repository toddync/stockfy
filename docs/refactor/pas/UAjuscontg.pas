unit UAjuscontg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask;

type
  TFrmAjuscontg = class(TForm)
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Edit4: TEdit;
    Edit5: TEdit;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit6: TEdit;
    Label9: TLabel;
    Button1: TButton;
    Edit2: TEdit;
    procedure MaskEdit1Exit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Novacontg;
  end;

var
  FrmAjuscontg: TFrmAjuscontg;
  wsenha,chavcontg,witens,wnumero,wcodart,chvtem,chavconta: string;
  wdescri,wcodigo,Opcok: string;
  xitens,x,y: Integer;
  wqtda,xestoq,wpreco,xsacol: Extended;
implementation

{$R *.dfm}

uses UDModRosa, UPare;

procedure TFrmAjuscontg.Button1Click(Sender: TObject);
begin
  if ActiveControl=DBGrid1 then
  exit;
  edit2.Text:='';
  edit4.Text:='';
  edit5.Text:='';
  edit6.Text:='';
  chavcontg:='';
  maskedit1.Text:='  /  /    ';
  DModRosa.IBQPesq_contg.Close;
  Modalresult:=-1;
  exit;
end;

procedure TFrmAjuscontg.Edit4Exit(Sender: TObject);
begin
  if (ActiveControl=DBGrid1) or
     (ActiveControl=Button1) then
     exit;
  wcodigo:=edit4.Text;
  DModRosa.IBQVer_contg.Close;
  DModRosa.IBQVer_contg.SQL.Clear;
  DModRosa.IBQVer_contg.SQL.Add('Select * from CONTAGEM '+
                                'Where Datcont=:dat_digit '+
                                'and Codigo=:cod_digit');
  DModRosa.IBQVer_contg.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.Text);
  DModRosa.IBQVer_contg.ParamByName('cod_digit').Asstring:=wcodigo;
  DModRosa.IBQVer_contg.OPen;
  if DModRosa.IBQVer_contg.RecordCount=0 then
  begin
    DModRosa.IBQVer_contg.Close;
    MessageBeep(64);
    MessageBeep(64);
    MessageBeep(64);
    FrmErro:=TFrmErro.Create(Self);
    FrmErro.Label2.caption:='Artigo nao está na contagem !!!!!';
    FrmErro.Label3.caption:='Separe este artigo !!!!!!!!!!!!!';
    FrmErro.Showmodal;
    FrmErro.Release;
    edit4.Clear;
    edit4.SetFocus;
    exit;
  end;
  edit2.Text:=DModRosa.IBQVer_contg.FieldByName('Codigo' ).AsString + ' - '+
              DModRosa.IBQVer_contg.FieldByName('Descricao').AsString;;
  edit6.text:=FormatFloat('###0.00',DModRosa.IBQVer_contg.fieldByName('Preco').AsFloat);
  edit5.text:=FormatFloat('###0',DModRosa.IBQVer_contg.fieldByName('Inicial').AsFloat);
  DModRosa.IBQVer_contg.Close;
  edit5.SetFocus;
  exit;
end;

procedure TFrmAjuscontg.Edit6Exit(Sender: TObject);
begin
  DModRosa.IBQVer_contg.Sql.Clear;
  DModRosa.IBQVer_contg.SqL.Add('Update CONTAGEM ');
  DModRosa.IBQVer_contg.Sql.Add('Set PRECO=:pre_digit, '+
                                'INICIAL=:inic_digit '+
                                'Where Datcont=:dat_digit '+
                                'and Tipo=:tip_digit '+
                                'and Codigo=:cod_digit');
  DModRosa.IBQVer_contg.ParamByName('dat_digit').AsDate:=StrToDate(maskedit1.Text);
  DModRosa.IBQVer_contg.ParamByName('tip_digit').AsString:='2';
  DModRosa.IBQVer_contg.ParamByName('cod_digit').AsString:=edit4.text;
  DModRosa.IBQVer_contg.ParamByName('pre_digit').AsFloat:=StrToFloat(edit6.text);
  DModRosa.IBQVer_contg.ParamByName('inic_digit').AsFloat:=StrToFloat(edit5.text);
  DModRosa.IBQVer_contg.ExecSql;
  DModRosa.IBQVer_contg.Close;
  // atualiza DBGrid *******************
  DModRosa.IBQPesq_contg.Close;
  DModRosa.IBQPesq_contg.SQL.Clear;
  DModRosa.IBQPesq_contg.SQL.Add('Select * from CONTAGEM '+
                                 'Where Datcont=:dat_digit '+
                                 'Order by Codigo');
  DModRosa.IBQPesq_contg.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.Text);
  DModRosa.IBQPesq_contg.OPen;
  edit5.Clear;
  edit6.Clear;
  edit4.Clear;
  edit4.SetFocus;
  exit;
end;

procedure TFrmAjuscontg.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmAjuscontg.FormShow(Sender: TObject);
begin
  maskedit1.SetFocus;
  exit;
end;

procedure TFrmAjuscontg.MaskEdit1Exit(Sender: TObject);
begin
  DModRosa.IBQLer_contg.Close;
  DModRosa.IBQLer_contg.SQL.Clear;
  DModRosa.IBQLer_contg.SQL.Add('Select * from CONTAGEM '+
                                'Where Datcont=:dat_digit '+
                                'Order by Codigo');
  DModRosa.IBQLer_contg.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.Text);
  DModRosa.IBQLer_contg.OPen;
  if DModRosa.IBQLer_contg.RecordCount>0 then
  begin
    DModRosa.IBQLer_contg.Close;
    if MessageDlg('Contagem ja realizada nesta data'+CHR(13)+
                  'Vai excluir ??',
       mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      // Limpa contagem realizada *******
      DModRosa.IBQVer_contg.Active:=False;
      DModRosa.IBQVer_contg.Sql.Clear;
      DModRosa.IBQVer_contg.SqL.Add('Delete from CONTAGEM '+
                                    'Where Datcont=:dat_digit');
      DModRosa.IBQVer_contg.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.Text);
      DModRosa.IBQVer_contg.Active:=True;
      DModRosa.IBQVer_contg.Active:=false;
      DModRosa.IBTransaction1.Commit;
      DModRosa.IBQVer_contg.Close;
      Modalresult:=-1;
      exit;
    end;
    if MessageDlg('Contagem ja realizada nesta data'+CHR(13)+
                  'Vai alterar ??',
       mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      DModRosa.IBQPesq_contg.Close;
      DModRosa.IBQPesq_contg.SQL.Clear;
      DModRosa.IBQPesq_contg.SQL.Add('Select * from CONTAGEM '+
                                     'Where Datcont=:dat_digit '+
                                     'Order by Codigo');
      DModRosa.IBQPesq_contg.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.Text);
      DModRosa.IBQPesq_contg.OPen;
      edit4.Text:='';
      edit4.SetFocus;
      exit;
    end;
    ModalResult:=-1;
    exit;
  end;
  DModRosa.IBQLer_contg.Close;
  if MessageDlg('Contagem não realizada nesta data'+CHR(13)+
                'Vai implantar ??',
     mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    Novacontg;
    DModRosa.IBQLer_contg.Close;
    DModRosa.IBQPesq_contg.Close;
    DModRosa.IBQPesq_contg.SQL.Clear;
    DModRosa.IBQPesq_contg.SQL.Add('Select * from CONTAGEM '+
                                   'Where Datcont=:dat_digit '+
                                   'Order by Codigo');
    DModRosa.IBQPesq_contg.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.Text);
    DModRosa.IBQPesq_contg.OPen;
    edit4.Text:='';
    edit4.SetFocus;
    exit;
  end;
  edit4.Text:=' ';
  Modalresult:=-1;
  exit;
end;

procedure TFrmAjuscontg.Novacontg;
begin
  if DModRosa.IBQVer_contg.Active then
     DModRosa.IBQVer_contg.Active:=False;
  DModRosa.IBQVer_contg.Sql.Clear;
  DModRosa.IBQVer_contg.Sql.Add('Insert Into CONTAGEM ');
  DModRosa.IBQVer_contg.Sql.Add('(DATCONT,TIPO,CODIGO,GRUPO,DESCRICAO,INICIAL,SACOL,PRECO) '+
                        'Values(:DATCONT,:TIPO,:CODIGO,:GRUPO,:DESCRICAO,:INICIAL,:SACOL,:PRECO)');
  DModRosa.IBQVer_contg.ParamByName('DATCONT').AsdateTime:=StrToDate(maskedit1.Text);
  DModRosa.IBQVer_contg.ParamByName('TIPO').AsString:='1';
  DModRosa.IBQVer_contg.ParamByName('CODIGO').AsString:='0000';
  DModRosa.IBQVer_contg.ParamByName('GRUPO').AsString:='00';
  DModRosa.IBQVer_contg.ParamByName('DESCRICAO').AsString:='CONTAGEM';
  DModRosa.IBQVer_contg.ParamByNamE('INICIAL').AsFloat:=0;
  DModRosa.IBQVer_contg.ParamByNamE('SACOL').AsFloat:=0;
  DModRosa.IBQVer_contg.ParamByNamE('PRECO').AsFloat:=0;
  DModRosa.IBQVer_contg.ExecSql;
  DModRosa.IBTransaction1.Commit;
  DModRosa.IBQVer_contg.Close;
  // Monta os artigos da nova contagem **************
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Order by Codigo');
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount=0 then
  begin
    DModRosa.IBQLer_art.Close;
    Showmessage('Nao ha Artigos a processar no cadastro!!');
    Modalresult:=-1;
    exit;
  end;
  DModRosa.IBQLer_art.DisableControls;
  DModRosa.IBQLer_art.First;
  while not DModRosa.IBQLer_art.Eof do
  begin
    wcodigo:=DModRosa.IBQLer_art.fieldbyName('Codigo').AsString;
    wdescri:=DModRosa.IBQLer_art.fieldbyName('Descricao').AsString;
    wpreco:=DModRosa.IBQLer_art.fieldbyName('Custo').AsFloat;
    if DModRosa.IBQVer_contg.Active then
       DModRosa.IBQVer_contg.Active:=False;
    DModRosa.IBQVer_contg.Sql.Clear;
    DModRosa.IBQVer_contg.Sql.Add('Insert Into CONTAGEM ');
    DModRosa.IBQVer_contg.Sql.Add('(DATCONT,TIPO,CODIGO,GRUPO,DESCRICAO,INICIAL,SACOL,PRECO) '+
                          'Values(:DATCONT,:TIPO,:CODIGO,:GRUPO,:DESCRICAO,:INICIAL,:SACOL,:PRECO)');
    DModRosa.IBQVer_contg.ParamByName('DATCONT').AsdateTime:=StrToDate(maskedit1.Text);
    DModRosa.IBQVer_contg.ParamByName('TIPO').AsString:='2';
    DModRosa.IBQVer_contg.ParamByName('CODIGO').AsString:=wcodigo;
    DModRosa.IBQVer_contg.ParamByName('GRUPO').AsString:=copy(wcodigo,1,2);
    DModRosa.IBQVer_contg.ParamByName('DESCRICAO').AsString:=wdescri;
    DModRosa.IBQVer_contg.ParamByNamE('INICIAL').AsFloat:=0;
    DModRosa.IBQVer_contg.ParamByNamE('SACOL').AsFloat:=0;
    DModRosa.IBQVer_contg.ParamByNamE('PRECO').AsFloat:=wpreco;
    DModRosa.IBQVer_contg.ExecSql;
    DModRosa.IBQVer_contg.Close;
    DModRosa.IBQLer_art.Next;
  end;
  DModRosa.IBQLer_art.Close;
  // Monta na sacol *******************
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base<=:datf_digit '+
                              'and Situ=:sit_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('datf_digit').AsDateTime:=StrToDate(maskedit1.Text);
  DModRosa.IBQLer_ped.ParamByName('sit_digit').AsString:='E';
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumero:=DModRosa.IBQLer_ped.fieldbyName('Pedido').AsString;
    // Ler Itens do pedido *********************
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQVer_itped.SQL.Clear;
    DModRosa.IBQVer_itped.SQL.Add('Select * from ITEMPEDIDO '+
                                  'Where Pedido=:ped_digit '+
                                  'Order by Codart');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumero;
    DModRosa.IBQVer_itped.OPen;
    DModRosa.IBQVer_itped.DisableControls;
    DModRosa.IBQVer_itped.First;
    while not DModRosa.IBQVer_itped.Eof do
    begin
      chvtem:='';
      wcodart:=DModRosa.IBQVer_itped.fieldbyName('Codart').AsString;
      wqtda:=DModRosa.IBQVer_itped.fieldbyName('Qtdsai').AsFloat;
      xsacol:=0;
      DModRosa.IBQLer_contg.Close;
      DModRosa.IBQLer_contg.SQL.Clear;
      DModRosa.IBQLer_contg.SQL.Add('Select * from CONTAGEM '+
                                    'Where Datcont=:dat_digit '+
                                    'and Tipo=:tip_digit '+
                                    'and Codigo=:cod_digit');
      DModRosa.IBQLer_contg.ParamByName('dat_digit').AsDate:=StrToDate(maskedit1.Text);
      DModRosa.IBQLer_contg.ParamByName('tip_digit').AsString:='2';
      DModRosa.IBQLer_contg.ParamByName('cod_digit').AsString:=wcodart;
      DModRosa.IBQLer_contg.OPen;
      xsacol:=DModRosa.IBQLer_contg.fieldbyName('SACOL').AsFloat;
      DModRosa.IBQLer_contg.Close;
      DModRosa.IBQVer_contg.Sql.Clear;
      DModRosa.IBQVer_contg.SqL.Add('Update CONTAGEM ');
      DModRosa.IBQVer_contg.Sql.Add('Set SACOL=:sac_digit '+
                                    'Where Datcont=:dat_digit '+
                                    'and Tipo=:tip_digit '+
                                        'and Codigo=:cod_digit');
      DModRosa.IBQVer_contg.ParamByName('dat_digit').AsDate:=StrToDate(maskedit1.Text);
      DModRosa.IBQVer_contg.ParamByName('tip_digit').AsString:='2';
      DModRosa.IBQVer_contg.ParamByName('cod_digit').AsString:=wcodart;
      DModRosa.IBQVer_contg.ParamByName('sac_digit').AsFloat:=xsacol+wqtda;
      DModRosa.IBQVer_contg.ExecSql;
      DModRosa.IBQVer_contg.Close;
      DModRosa.IBQVer_itped.Next;
    end;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  // ***********************************
  wcodigo:='';
  wdescri:='';
  wpreco:=0;
 end;


end.
