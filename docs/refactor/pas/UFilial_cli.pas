unit UFilial_cli;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBX.IBTable,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls;

type
  TFrmFilial_cli = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    IBDsAPesq_cli: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    AIBQCliente: TIBQuery;
    IBQAPesq_cli: TIBQuery;
    AIBTCliente: TIBTable;
    Label3: TLabel;
    AIBTClienteCODCLI: TIBStringField;
    AIBTClienteNCPF: TIBStringField;
    AIBTClienteNIFP: TIBStringField;
    AIBTClienteBAIR: TIBStringField;
    AIBTClienteCIDA: TIBStringField;
    AIBTClienteESTA: TIBStringField;
    AIBTClienteNCEP: TIBStringField;
    AIBTClienteNTEL: TIBStringField;
    AIBTClienteCONTA: TIBStringField;
    AIBTClienteVEND: TIBStringField;
    AIBTClienteLCRED: TIBBCDField;
    AIBTClienteDATIMP: TIBStringField;
    AIBTClienteNOMMAE: TIBStringField;
    AIBTClienteNOMPAI: TIBStringField;
    AIBTClienteDATNASC: TIBStringField;
    AIBTClienteNATU: TIBStringField;
    AIBTClienteROTA: TIBStringField;
    AIBTClientePRACA: TIBStringField;
    AIBTClienteREFER: TIBStringField;
    AIBTClienteOLDCLI: TIBStringField;
    AIBTClienteSITU: TIBStringField;
    AIBTClienteNOME: TIBStringField;
    AIBTClienteENDE: TIBStringField;
    AIBTClienteHORAIN: TIBStringField;
    AIBTClienteHORAFIN: TIBStringField;
    AIBTClienteVISITA: TIBStringField;
    AIBTClienteATIVO: TIBStringField;
    AIBTClienteESPED: TIBStringField;
    AIBTClienteOBSV: TBlobField;
    AIBQClienteCODCLI: TIBStringField;
    AIBQClienteNCPF: TIBStringField;
    AIBQClienteNIFP: TIBStringField;
    AIBQClienteBAIR: TIBStringField;
    AIBQClienteCIDA: TIBStringField;
    AIBQClienteESTA: TIBStringField;
    AIBQClienteNCEP: TIBStringField;
    AIBQClienteNTEL: TIBStringField;
    AIBQClienteCONTA: TIBStringField;
    AIBQClienteVEND: TIBStringField;
    AIBQClienteLCRED: TIBBCDField;
    AIBQClienteDATIMP: TIBStringField;
    AIBQClienteNOMMAE: TIBStringField;
    AIBQClienteNOMPAI: TIBStringField;
    AIBQClienteDATNASC: TIBStringField;
    AIBQClienteNATU: TIBStringField;
    AIBQClienteROTA: TIBStringField;
    AIBQClientePRACA: TIBStringField;
    AIBQClienteREFER: TIBStringField;
    AIBQClienteOLDCLI: TIBStringField;
    AIBQClienteSITU: TIBStringField;
    AIBQClienteNOME: TIBStringField;
    AIBQClienteENDE: TIBStringField;
    AIBQClienteHORAIN: TIBStringField;
    AIBQClienteHORAFIN: TIBStringField;
    AIBQClienteVISITA: TIBStringField;
    AIBQClienteATIVO: TIBStringField;
    AIBQClienteESPED: TIBStringField;
    AIBQClienteOBSV: TBlobField;
    IBQAPesq_cliCODCLI: TIBStringField;
    IBQAPesq_cliNCPF: TIBStringField;
    IBQAPesq_cliNIFP: TIBStringField;
    IBQAPesq_cliBAIR: TIBStringField;
    IBQAPesq_cliCIDA: TIBStringField;
    IBQAPesq_cliESTA: TIBStringField;
    IBQAPesq_cliNCEP: TIBStringField;
    IBQAPesq_cliNTEL: TIBStringField;
    IBQAPesq_cliCONTA: TIBStringField;
    IBQAPesq_cliVEND: TIBStringField;
    IBQAPesq_cliLCRED: TIBBCDField;
    IBQAPesq_cliDATIMP: TIBStringField;
    IBQAPesq_cliNOMMAE: TIBStringField;
    IBQAPesq_cliNOMPAI: TIBStringField;
    IBQAPesq_cliDATNASC: TIBStringField;
    IBQAPesq_cliNATU: TIBStringField;
    IBQAPesq_cliROTA: TIBStringField;
    IBQAPesq_cliPRACA: TIBStringField;
    IBQAPesq_cliREFER: TIBStringField;
    IBQAPesq_cliOLDCLI: TIBStringField;
    IBQAPesq_cliSITU: TIBStringField;
    IBQAPesq_cliNOME: TIBStringField;
    IBQAPesq_cliENDE: TIBStringField;
    IBQAPesq_cliHORAIN: TIBStringField;
    IBQAPesq_cliHORAFIN: TIBStringField;
    IBQAPesq_cliVISITA: TIBStringField;
    IBQAPesq_cliATIVO: TIBStringField;
    IBQAPesq_cliESPED: TIBStringField;
    IBQAPesq_cliOBSV: TBlobField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Edit1Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFilial_cli: TFrmFilial_cli;
  wmarca,wsigla,wvend,wnomcli: string;
implementation

uses  UCliente, UDModRosa, UImpo_cli;

{$R *.dfm}

procedure TFrmFilial_cli.Button1Click(Sender: TObject);
var
  Registro: String;
  Retorno: TStringList;
  NumeroRegistro: Integer;
begin
  edit2.Color:=clRed;
  NumeroRegistro:=0;
  Retorno:=TstringList.Create;
  Retorno.LoadFromFile('C:\Remessa\Clientes.txt');
  Registro:=Retorno.Strings[NumeroRegistro];
  if Copy(Registro,1,2)<>'00'then
     showmessage('Falta registro Header no arquivo')
  else
  begin
    AIBTCliente.EmptyTable;
    for NumeroRegistro:=1 to (Retorno.Count-1) do
    begin
      Registro:=Retorno.Strings[NumeroRegistro];
      if Copy(Registro,1,2)='01' then
      begin
        if AIBQCliente.Active then
           AIBQCliente.Active:=False;
        AIBQCliente.Sql.Clear;
        AIBQCliente.Sql.Add('Insert Into AUXCLIENTE ');
        AIBQCliente.Sql.Add('(CODCLI,NCPF,NIFP,BAIR,CIDA,ESTA,'+
                            'NCEP,NTEL,CONTA,VEND,LCRED,DATIMP,NOMMAE,'+
                            'NOMPAI,DATNASC,NATU,ROTA,PRACA,REFER,OLDCLI,'+
                            'SITU,NOME,ENDE) '+
                    'Values(:CODCLI,:NCPF,:NIFP,:BAIR,:CIDA,:ESTA,'+
                           ':NCEP,:NTEL,:CONTA,:VEND,:LCRED,:DATIMP,:NOMMAE,'+
                           ':NOMPAI,:DATNASC,:NATU,:ROTA,:PRACA,:REFER,:OLDCLI,'+
                           ':SITU,:NOME,:ENDE)');
        AIBQCliente.ParamByName('CODCLI').AsString:=Copy(Registro,3,4);
        AIBQCliente.ParamByName('NCPF').AsString:=Copy(Registro,7,15);
        AIBQCliente.ParamByName('NIFP').AsString:=Copy(Registro,22,15);
        AIBQCliente.ParamByName('BAIR').AsString:=Copy(Registro,37,20);
        AIBQCliente.ParamByName('CIDA').AsString:=Copy(Registro,57,20);
        AIBQCliente.ParamByName('ESTA').AsString:=Copy(Registro,77,2);
        AIBQCliente.ParamByName('NCEP').AsString:=Copy(Registro,79,9);
        AIBQCliente.ParamByName('NTEL').AsString:=Copy(Registro,88,30);
        AIBQCliente.ParamByName('CONTA').AsString:=Copy(Registro,118,30);
        AIBQCliente.ParamByName('VEND').AsString:=Copy(Registro,148,3);
        AIBQCliente.ParamByName('LCRED').AsFloat:=StrToFloat(Copy(Registro,151,12))/100;
        AIBQCliente.ParamByName('DATIMP').AsString:=Copy(Registro,163,10);
        AIBQCliente.ParamByName('NOMMAE').AsString:=Copy(Registro,173,35);
        AIBQCliente.ParamByName('NOMPAI').AsString:=Copy(Registro,208,35);
        AIBQCliente.ParamByName('DATNASC').AsString:=Copy(Registro,243,10);
        AIBQCliente.ParamByName('NATU').AsString:=Copy(Registro,253,2);
        AIBQCliente.ParamByName('ROTA').AsString:=Copy(Registro,255,3);
        AIBQCliente.ParamByName('PRACA').AsString:=Copy(Registro,258,3);
        AIBQCliente.ParamByName('REFER').AsString:=Copy(Registro,261,40);
        AIBQCliente.ParamByName('OLDCLI').AsString:=Copy(Registro,301,4);
        AIBQCliente.ParamByName('SITU').AsString:='I';
        AIBQCliente.ParamByName('NOME').AsString:=Copy(Registro,306,50);
        AIBQCliente.ParamByName('ENDE').AsString:=Copy(Registro,356,60);
        AIBQCliente.ExecSql;
        AIBQCliente.Close;
      end;
    end;
    showmessage('Arq.Cliente Remessa Importado');
  end;
  IBQAPesq_cli.Close;
  IBQAPesq_cli.SQL.Clear;
  IBQAPesq_cli.SQL.Add('Select * from AUXCLIENTE '+
                               'Order By Codcli');
  IBQAPesq_cli.OPen;
  edit2.Color:=clGreen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  Combobox1.SetFocus;
  exit;
end;

procedure TFrmFilial_cli.Button2Click(Sender: TObject);
begin
  edit2.Color:=clRed;
  wnomcli:=IBQAPesq_cli.fields.fields[1].AsString;
  wvend:=IBQAPesq_cli.fields.fields[11].AsString;
  IBQAPesq_cli.Close;
  FrmImpo_cli:=TFrmImpo_cli.Create(Self);
  FrmImpo_cli.edit11.Text:='Importar';
  FrmImpo_cli.edit2.Text:=wnomcli;
  FrmImpo_cli.edit8.Text:=wvend;
  FrmImpo_cli.ShowModal;
  FrmImpo_cli.release;
  IBQAPesq_cli.Close;
  IBQAPesq_cli.SQL.Clear;
  IBQAPesq_cli.SQL.Add('Select * from AUXCLIENTE '+
                       'Order By Codcli');
  IBQAPesq_cli.OPen;
  edit2.Color:=clGreen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmFilial_cli.Button3Click(Sender: TObject);
begin
  if MessageDlg('Limpa Clientes das Filiais ?????',
          mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    AIBTCliente.EmptyTable;
  end;
  IBQAPesq_cli.Close;
  IBQAPesq_cli.SQL.Clear;
  IBQAPesq_cli.SQL.Add('Select * from AUXCLIENTE '+
                       'Order By Codcli');
  IBQAPesq_cli.OPen;
  edit2.Color:=clGreen;
  edit1.Clear;
  Combobox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

procedure TFrmFilial_cli.Edit1Exit(Sender: TObject);
begin
  if (ActiveControl=DBGrid1) or
     (ACtiveControl=Button1) or (Activecontrol=DBGrid1) then
     exit;
  if edit1.Text='' then
  begin
    showmessage('Informe o elemento de procura');
    ComboBox1.SetFocus;
    exit;
  end;
  edit2.Color:=clRed;
  if IBQAPesq_cli.Active=True then
     IBQAPesq_cli.Active:=False;
  IBQAPesq_cli.Sql.Clear;
  if ComboBox1.ItemIndex=0 then
  begin
    IBQAPesq_cli.Sql.Add('Select * from AUXCLIENTE '+
                         'Where Codcli=:cod_digit');
    IBQAPesq_cli.ParamByName('cod_digit').AsString:=edit1.Text;
  end;
  if ComboBox1.ItemIndex=1 then
  begin
    IBQAPesq_cli.Sql.Add('Select * from AUXCLIENTE '+
                               'Where Nome LIKE '+#39+'%'+edit1.Text+'%'+#39);
  end;
  if ComboBox1.ItemIndex=2 then
  begin
    IBQAPesq_cli.Sql.Add('Select * from AUXCLIENTE '+
                         'Where Ncpf=:cpf_digit');
    IBQAPesq_cli.ParamByName('cpf_digit').AsString:=edit1.Text;
  end;
  if ComboBox1.ItemIndex=3 then
  begin
    IBQAPesq_cli.Sql.Add('Select * from AUXCLIENTE '+
                         'Where Nifp=:nifp_digit');
    IBQAPesq_cli.ParamByName('nifp_digit').AsString:=edit1.Text;
  end;
  IBQAPesq_cli.Active:=True;
end;

procedure TFrmFilial_cli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Modalresult:=-1;
end;

procedure TFrmFilial_cli.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmFilial_cli.FormShow(Sender: TObject);
begin
  if not DModRosa.IBDataBase1.Connected then
     DModRosa.IBDataBase1.Connected:=True;
  if not DModRosa.IBDataBase2.Connected then
     DModRosa.IBDataBase2.Connected:=True;
  ComboBox1.ItemIndex:=0;
  ComboBox1.SetFocus;
  exit;
end;

end.
