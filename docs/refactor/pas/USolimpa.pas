unit USolimpa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, frxClass, frxDBSet, IBX.IBTable, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmSolimpa = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    IBQSolista: TIBQuery;
    IBQSolist: TIBQuery;
    IBTSolist: TIBTable;
    DtsSolist: TDataSource;
    RvSolimpa: TfrxReport;
    Dtsolimpa: TfrxDBDataset;
    IBTSolistCODART: TIBStringField;
    IBTSolistDESCRICAO: TIBStringField;
    IBQSolistaCODART: TIBStringField;
    IBQSolistaDESCRICAO: TIBStringField;
    IBQSolistCODART: TIBStringField;
    IBQSolistDESCRICAO: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Listel;
    function ExisteForm(pForm: TForm): Boolean;

  end;

var
  Frmsolimpa: TFrmsolimpa;
  wudata,wopcao: String;
  Cont_lin,Max_lin,Pagina,Coluna,Tamanho,Linha,witens: Integer;
  wtotal: Extended;
implementation

uses UDModRosa;

{$R *.dfm}

procedure TFrmSolimpa.Button1Click(Sender: TObject);
begin
  IBQsolist.Close;
  IBTsolist.EmptyTable;
  edit1.SetFocus;
  exit;
end;

procedure TFrmSolimpa.Button2Click(Sender: TObject);
begin
  RvSolimpa.Showreport;
  IBQsolist.Close;
  Modalresult:=-1;
  exit;
end;

procedure TFrmSolimpa.Button3Click(Sender: TObject);
begin
  Modalresult:=-1;
  exit;
end;

procedure TFrmSolimpa.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=Button1) or
     (ActiveControl=Button2) or
     (ActiveControl=Button3) or
     (ActiveControl=DBGrid1) then
     exit;
  DModRosa.IBQLer_art.Close;
  DModRosa.IBQLer_art.SQL.Clear;
  DModRosa.IBQLer_art.SQL.Add('Select * from ARTIGO '+
                              'Where Codigo=:cod_digit');
  DModRosa.IBQLer_art.ParamByName('cod_digit').AsString:=Edit1.Text;
  DModRosa.IBQLer_art.OPen;
  if DModRosa.IBQLer_art.RecordCount=0 then
  begin
    DModRosa.IBQLer_art.Close;
    Showmessage('Artigo não cadastrado !!');
    edit1.Clear;
    edit1.SetFocus;
    exit;
  end;
  edit2.Text:=DModRosa.IBQLer_art.fieldByName('Descricao').AsString;
  DModRosa.IBQLer_art.Close;
  IBQsolista.Close;
  IBQsolista.SQL.Clear;
  IBQsolista.SQL.Add('Select * from AUXSOL '+
                    'Where Codart=:cod_digit');
  IBQSolista.ParamByName('cod_digit').AsString:=edit1.Text;
  IBQsolista.Active:=True;
  if IBQsolista.RecordCount>0 then
  begin
    if MessageDlg('Artigo encontrado. Deseja excluir ???',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      IBQsolista.Active:=False;
      IBQsolista.Sql.Clear;
      IBQsolista.SqL.Add('Delete from AUXSOL '+
                         'Where Codart=:art_digit');
      IBQsolista.ParamByName('art_digit').AsString:=edit1.text;
      IBQsolista.Active:=True;
      witens:=witens-1;
      Listel;
    end;
    IBQsolista.Close;
    edit1.Clear;
    edit2.Clear;
    edit1.SetFocus;
    exit;
  end;
  IBQsolista.Close;
  edit2.SetFocus;
  exit;
end;

procedure TFrmSolimpa.Edit2Exit(Sender: TObject);
begin
  witens:=witens+1;
  if witens>24 then
  begin
    Showmessage('Capacidade estorada !!!!!');
    RvSolimpa.Showreport;
    IBQsolist.Close;
    Modalresult:=-1;
    exit;
  end;
  if IBQsolista.Active then
     IBQsolista.Active:=False;
  IBQsolista.Sql.Clear;
  IBQsolista.Sql.Add('Insert Into AUXSOL ');
  IBQsolista.Sql.Add('(CODART,DESCRICAO) '+
            'Values(:CODART,:DESCRICAO)');
 IBQsolista.ParamByName('CODART').AsString:=edit1.text;
 IBQsolista.ParamByName('DESCRICAO').AsString:=edit2.text;
 IBQsolista.ExecSql;
 IBQsolista.Close;
 Listel;
 edit1.Clear;
 edit2.Clear;
 edit1.SetFocus;
 exit;
end;

function TFrmsolimpa.ExisteForm(pForm: Tform): Boolean;
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

procedure TFrmSolimpa.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmSolimpa.FormShow(Sender: TObject);
begin
  witens:=0;
  edit1.Clear;
  edit2.Clear;;
  Listel;
  edit1.SetFocus;
  exit;
end;

procedure TFrmSolimpa.Listel;
begin
  IBQsolist.Close;
  IBQsolist.SQL.Clear;
  IBQsolist.SQL.Add('Select * from AUXSOL '+
                    'Order by Codart');
  IBQSolist.Active:=True;
  IBQSolist.Last;
  witens:=IBQSolist.RecordCount;
end;

end.
