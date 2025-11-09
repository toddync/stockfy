unit UFluxo_pag;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, frxClass,
  frxDBSet, IBX.IBTable, Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmFluxo_pag = class(TForm)
    GroupBox4: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Button4: TButton;
    Button5: TButton;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    ComboBox1: TComboBox;
    IBQuery1: TIBQuery;
    IBTable1: TIBTable;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFluxo_pag: TFrmFluxo_pag;

implementation

{$R *.dfm}

end.
