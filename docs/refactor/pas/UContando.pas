unit UContando;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet,
  Vcl.Mask;

type
  TFrmContando = class(TForm)
    Button2: TButton;
    DBGrid1: TDBGrid;
    Button3: TButton;
    Label1: TLabel;
    frxRepcontg: TfrxReport;
    frxDtscontg: TfrxDBDataset;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure frxRepcontgGetValue(const VarName: string; var Value: Variant);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmContando: TFrmContando;

implementation

{$R *.dfm}

uses  UDModRosa, UAjuscontg;


procedure TFrmContando.Button2Click(Sender: TObject);
begin
  FrmAjuscontg:=TFrmAjuscontg.Create(Self);
  FrmAjuscontg.MaskEdit1.Text:=Maskedit1.Text;
  FrmAjuscontg.ShowModal;
  FrmAjuscontg.release;
  maskedit1.Text:=DateToStr(Date());
  if DModRosa.IBQLer_contg.Active then
     DModRosa.IBQLer_contg.Active:=False;
  DModRosa.IBQLer_contg.Sql.Clear;
  DModRosa.IBQLer_contg.Sql.Add('Select * from CONTAGEM '+
                                'Where Tipo=:tip_digit '+
                                'Order by Datcont');
  DModRosa.IBQLer_contg.ParamByName('tip_digit').AsString:='1';
  DModRosa.IBQLer_contg.Active:=True;
  maskedit1.SetFocus;
  exit;
end;

procedure TFrmContando.Button3Click(Sender: TObject);
begin
  DModRosa.IBQLer_contg.Close;
  DModRosa.IBQLer_contg.SQL.Clear;
  DModRosa.IBQLer_contg.SQL.Add('Select * from CONTAGEM '+
                                 'Where Datcont=:dat_digit '+
                                 'Order By Codigo');
  DModRosa.IBQLer_contg.ParamByName('dat_digit').AsDateTime:=StrToDate(maskedit1.Text);
  DModRosa.IBQLer_contg.OPen;
  DModRosa.IBQLer_contg.Close;
  // Emite a relação ******************
  frxRepcontg.ShowReport;
end;

procedure TFrmContando.DBGrid1DblClick(Sender: TObject);
begin
  Maskedit1.text:=DateToStr(DModRosa.IBQLer_contg.Fields.Fields[0].AsDateTime);
  DModRosa.IBQPesq_contg.Close;
  Maskedit1.SetFocus;
  exit;
end;

procedure TFrmContando.FormShow(Sender: TObject);
begin
  maskedit1.Text:=DateToStr(Date());
  if DModRosa.IBQLer_contg.Active then
     DModRosa.IBQLer_contg.Active:=False;
  DModRosa.IBQLer_contg.Sql.Clear;
  DModRosa.IBQLer_contg.Sql.Add('Select * from CONTAGEM '+
                                'Where Tipo=:tip_digit '+
                                'Order by Datcont');
  DModRosa.IBQLer_contg.ParamByName('tip_digit').AsString:='1';
  DModRosa.IBQLer_contg.Active:=True;
  maskedit1.SetFocus;
  exit;
end;

procedure TFrmContando.frxRepcontgGetValue(const VarName: string;
  var Value: Variant);
begin
  if Comparetext(Varname,'Datrel')=0 then
     value:=maskedit1.text;
end;

end.
