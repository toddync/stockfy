unit UParada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmParada = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    Button1: TButton;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParada: TFrmParada;

implementation

{$R *.dfm}

procedure TFrmParada.Button1Click(Sender: TObject);
begin
  Modalresult:=-1;
  exit;
end;

procedure TFrmParada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Modalresult:=-1;
  exit;
end;

end.
