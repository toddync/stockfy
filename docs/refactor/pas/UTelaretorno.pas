unit UTelaretorno;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  IBX.IBQuery, IBX.IBCustomDataSet, IBX.IBTable, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFrmTelaretorno = class(TForm)
    IBTAuxretorno: TIBTable;
    IBQPesqret: TIBQuery;
    DBGrid1: TDBGrid;
    RichEdit1: TRichEdit;
    DtsAuxret: TDataSource;
    IBTAuxretornoPEDIDO: TIBStringField;
    IBTAuxretornoCODART: TIBStringField;
    IBTAuxretornoDESCRICAO: TIBStringField;
    IBTAuxretornoQTDSAI: TIntegerField;
    IBTAuxretornoQTDRET: TIntegerField;
    IBTAuxretornoPRECUS: TIBBCDField;
    IBTAuxretornoPREVEN: TIBBCDField;
    IBTAuxretornoQTDANT: TIntegerField;
    IBTAuxretornoCUSANT: TIBBCDField;
    IBTAuxretornoVENANT: TIBBCDField;
    IBTAuxretornoOPER: TIBStringField;
    IBQPesqretPEDIDO: TIBStringField;
    IBQPesqretCODART: TIBStringField;
    IBQPesqretDESCRICAO: TIBStringField;
    IBQPesqretQTDSAI: TIntegerField;
    IBQPesqretQTDRET: TIntegerField;
    IBQPesqretPRECUS: TIBBCDField;
    IBQPesqretPREVEN: TIBBCDField;
    IBQPesqretQTDANT: TIntegerField;
    IBQPesqretCUSANT: TIBBCDField;
    IBQPesqretVENANT: TIBBCDField;
    IBQPesqretOPER: TIBStringField;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTelaretorno: TFrmTelaretorno;

implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmTelaretorno.FormShow(Sender: TObject);
begin
  IBQPesqret.Close;
  IBQPesqret.SQL.Clear;
  IBQPesqret.SQL.Add('Select * from AUXITENS '+
                         'Order by Codart');
  IBQPesqret.Active:=True;
end;

end.
