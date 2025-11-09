unit UUtilitarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmUtilitarios = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    IBQuery1: TIBQuery;
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUtilitarios: TFrmUtilitarios;
  wnumped,wlimit: string;
implementation

{$R *.dfm}

uses UDModRosa, USenhas;

procedure TFrmUtilitarios.Button1Click(Sender: TObject);
begin
  FrmSenhas:=TFrmSenhas.Create(Self);
  FrmSenhas.ShowModal;
  FrmSenhas.release;
end;

procedure TFrmUtilitarios.Button5Click(Sender: TObject);
begin
  wlimit:='';
  while wlimit='' do
  begin
    wlimit:=InputBox('Informe: data(DD/MM/AAAA) limite !!!!',
                     'Data limite:',' ');
  end;
  if DModRosa.IBQLer_ped.Active then
     DModRosa.IBQLer_ped.Active:=False;
  DModRosa.IBQLer_ped.Sql.Clear;
  DModRosa.IBQLer_ped.Sql.Add('Select * from PEDIDO '+
                              'Where Base<:dat_digit '+
                              'Order by Pedido');
  DModRosa.IBQLer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate(wlimit);
  DModRosa.IBQLer_ped.Active:=True;
  DModRosa.IBQLer_ped.DisableControls;
  DModRosa.IBQLer_ped.First;
  while not DModRosa.IBQLer_ped.Eof do
  begin
    wnumped:=DModRosa.IBQLer_ped.FieldbyName('Pedido').AsString;
    DModRosa.IBQVer_itped.Active:=False;
    DModRosa.IBQVer_itped.Sql.Clear;
    DModRosa.IBQVer_itped.SqL.Add('Delete from ITEMPEDIDO '+
                                  'Where PEDIDO=:ped_digit');
    DModRosa.IBQVer_itped.ParamByName('ped_digit').AsString:=wnumped;
    DModRosa.IBQVer_itped.Active:=True;
    DModRosa.IBQVer_itped.Active:=false;
    DModRosa.IBQVer_itped.Close;
    DModRosa.IBQLer_ped.Next;
  end;
  DModRosa.IBQLer_ped.Close;
  DModRosa.IBQVer_ped.Active:=False;
  DModRosa.IBQVer_ped.Sql.Clear;
  DModRosa.IBQVer_ped.SqL.Add('Delete from PEDIDO '+
                              'Where Base<:dat_digit');
  DModRosa.IBQVer_ped.ParamByName('dat_digit').AsDateTime:=StrToDate(wlimit);
  DModRosa.IBQVer_ped.Active:=True;
  DModRosa.IBQVer_ped.Active:=false;
  showmessage('Tudo ok !!!!!!');
end;

procedure TFrmUtilitarios.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmUtilitarios.FormShow(Sender: TObject);
begin
  if DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=False;
  if DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=False;
  if not DModRosa.IBDatabase1.Connected then
     DModRosa.IBDatabase1.Connected:=True;
  if not DModRosa.IBTransaction1.Active then
     DModRosa.IBTransaction1.Active:=true;
end;

end.
