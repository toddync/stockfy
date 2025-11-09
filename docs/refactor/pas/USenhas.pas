unit USenhas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.CheckLst,
  Data.DB, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TFrmSenhas = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    CBxUtil: TCheckListBox;
    CbxProd1: TCheckListBox;
    CbxTab1: TCheckListBox;
    CbxFor1: TCheckListBox;
    CbxCli1: TCheckListBox;
    CbxSol1: TCheckListBox;
    CbxVend1: TCheckListBox;
    CbxPed1: TCheckListBox;
    CbxMov1: TCheckListBox;
    CbxPag1: TCheckListBox;
    CbxGer1: TCheckListBox;
    Button1: TButton;
    Button2: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    Label13: TLabel;
    IBQuery1: TIBQuery;
    IBQuery2: TIBQuery;
    IBQuery1NOME: TIBStringField;
    IBQuery1SENHA: TIBStringField;
    IBQuery1SENHAS: TIBStringField;
    IBQuery1COL001: TIBStringField;
    IBQuery1COL002: TIBStringField;
    IBQuery1COL003: TIBStringField;
    IBQuery1COL004: TIBStringField;
    IBQuery1COL005: TIBStringField;
    IBQuery1COL006: TIBStringField;
    IBQuery1COL007: TIBStringField;
    IBQuery1COL008: TIBStringField;
    IBQuery1COL009: TIBStringField;
    IBQuery1COL010: TIBStringField;
    IBQuery1COL011: TIBStringField;
    IBQuery1COL012: TIBStringField;
    IBQuery1COL013: TIBStringField;
    IBQuery1COL014: TIBStringField;
    IBQuery1COL015: TIBStringField;
    IBQuery1COL016: TIBStringField;
    IBQuery1COL017: TIBStringField;
    IBQuery1COL018: TIBStringField;
    IBQuery1COL019: TIBStringField;
    IBQuery1COL020: TIBStringField;
    IBQuery1COL021: TIBStringField;
    IBQuery1COL022: TIBStringField;
    IBQuery1COL023: TIBStringField;
    IBQuery1COL024: TIBStringField;
    IBQuery1COL025: TIBStringField;
    IBQuery1COL026: TIBStringField;
    IBQuery1COL027: TIBStringField;
    IBQuery1COL028: TIBStringField;
    IBQuery1COL029: TIBStringField;
    IBQuery1COL030: TIBStringField;
    IBQuery1COL031: TIBStringField;
    IBQuery1COL032: TIBStringField;
    IBQuery1COL033: TIBStringField;
    IBQuery1COL034: TIBStringField;
    IBQuery1COL035: TIBStringField;
    IBQuery1COL036: TIBStringField;
    IBQuery1COL037: TIBStringField;
    IBQuery1COL038: TIBStringField;
    IBQuery1COL039: TIBStringField;
    IBQuery1COL040: TIBStringField;
    IBQuery1COL041: TIBStringField;
    IBQuery1COL042: TIBStringField;
    IBQuery1COL043: TIBStringField;
    IBQuery1COL044: TIBStringField;
    IBQuery1COL045: TIBStringField;
    IBQuery1COL046: TIBStringField;
    IBQuery1COL047: TIBStringField;
    IBQuery1COL048: TIBStringField;
    IBQuery1COL049: TIBStringField;
    IBQuery1COL050: TIBStringField;
    IBQuery1COL051: TIBStringField;
    IBQuery1COL052: TIBStringField;
    IBQuery1COL053: TIBStringField;
    IBQuery1COL054: TIBStringField;
    IBQuery1COL055: TIBStringField;
    IBQuery1COL056: TIBStringField;
    IBQuery1COL057: TIBStringField;
    IBQuery1COL058: TIBStringField;
    IBQuery1COL059: TIBStringField;
    IBQuery1COL060: TIBStringField;
    IBQuery1COL061: TIBStringField;
    IBQuery1COL062: TIBStringField;
    IBQuery1COL063: TIBStringField;
    IBQuery1COL064: TIBStringField;
    IBQuery1COL065: TIBStringField;
    IBQuery1COL066: TIBStringField;
    IBQuery1COL067: TIBStringField;
    IBQuery1COL068: TIBStringField;
    IBQuery1COL069: TIBStringField;
    IBQuery1COL070: TIBStringField;
    IBQuery1COL071: TIBStringField;
    IBQuery1COL072: TIBStringField;
    IBQuery1COL073: TIBStringField;
    IBQuery1COL074: TIBStringField;
    IBQuery1COL075: TIBStringField;
    IBQuery1COL076: TIBStringField;
    IBQuery1COL077: TIBStringField;
    IBQuery1COL078: TIBStringField;
    IBQuery1COL079: TIBStringField;
    IBQuery1COL080: TIBStringField;
    IBQuery1DATXI: TIBStringField;
    IBQuery1DATXL: TIBStringField;
    IBQuery2NOME: TIBStringField;
    IBQuery2SENHA: TIBStringField;
    IBQuery2SENHAS: TIBStringField;
    IBQuery2COL001: TIBStringField;
    IBQuery2COL002: TIBStringField;
    IBQuery2COL003: TIBStringField;
    IBQuery2COL004: TIBStringField;
    IBQuery2COL005: TIBStringField;
    IBQuery2COL006: TIBStringField;
    IBQuery2COL007: TIBStringField;
    IBQuery2COL008: TIBStringField;
    IBQuery2COL009: TIBStringField;
    IBQuery2COL010: TIBStringField;
    IBQuery2COL011: TIBStringField;
    IBQuery2COL012: TIBStringField;
    IBQuery2COL013: TIBStringField;
    IBQuery2COL014: TIBStringField;
    IBQuery2COL015: TIBStringField;
    IBQuery2COL016: TIBStringField;
    IBQuery2COL017: TIBStringField;
    IBQuery2COL018: TIBStringField;
    IBQuery2COL019: TIBStringField;
    IBQuery2COL020: TIBStringField;
    IBQuery2COL021: TIBStringField;
    IBQuery2COL022: TIBStringField;
    IBQuery2COL023: TIBStringField;
    IBQuery2COL024: TIBStringField;
    IBQuery2COL025: TIBStringField;
    IBQuery2COL026: TIBStringField;
    IBQuery2COL027: TIBStringField;
    IBQuery2COL028: TIBStringField;
    IBQuery2COL029: TIBStringField;
    IBQuery2COL030: TIBStringField;
    IBQuery2COL031: TIBStringField;
    IBQuery2COL032: TIBStringField;
    IBQuery2COL033: TIBStringField;
    IBQuery2COL034: TIBStringField;
    IBQuery2COL035: TIBStringField;
    IBQuery2COL036: TIBStringField;
    IBQuery2COL037: TIBStringField;
    IBQuery2COL038: TIBStringField;
    IBQuery2COL039: TIBStringField;
    IBQuery2COL040: TIBStringField;
    IBQuery2COL041: TIBStringField;
    IBQuery2COL042: TIBStringField;
    IBQuery2COL043: TIBStringField;
    IBQuery2COL044: TIBStringField;
    IBQuery2COL045: TIBStringField;
    IBQuery2COL046: TIBStringField;
    IBQuery2COL047: TIBStringField;
    IBQuery2COL048: TIBStringField;
    IBQuery2COL049: TIBStringField;
    IBQuery2COL050: TIBStringField;
    IBQuery2COL051: TIBStringField;
    IBQuery2COL052: TIBStringField;
    IBQuery2COL053: TIBStringField;
    IBQuery2COL054: TIBStringField;
    IBQuery2COL055: TIBStringField;
    IBQuery2COL056: TIBStringField;
    IBQuery2COL057: TIBStringField;
    IBQuery2COL058: TIBStringField;
    IBQuery2COL059: TIBStringField;
    IBQuery2COL060: TIBStringField;
    IBQuery2COL061: TIBStringField;
    IBQuery2COL062: TIBStringField;
    IBQuery2COL063: TIBStringField;
    IBQuery2COL064: TIBStringField;
    IBQuery2COL065: TIBStringField;
    IBQuery2COL066: TIBStringField;
    IBQuery2COL067: TIBStringField;
    IBQuery2COL068: TIBStringField;
    IBQuery2COL069: TIBStringField;
    IBQuery2COL070: TIBStringField;
    IBQuery2COL071: TIBStringField;
    IBQuery2COL072: TIBStringField;
    IBQuery2COL073: TIBStringField;
    IBQuery2COL074: TIBStringField;
    IBQuery2COL075: TIBStringField;
    IBQuery2COL076: TIBStringField;
    IBQuery2COL077: TIBStringField;
    IBQuery2COL078: TIBStringField;
    IBQuery2COL079: TIBStringField;
    IBQuery2COL080: TIBStringField;
    IBQuery2DATXI: TIBStringField;
    IBQuery2DATXL: TIBStringField;
    procedure FormShow(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CBxUtilExit(Sender: TObject);
    procedure CbxTab1Click(Sender: TObject);
    procedure CbxCli1Exit(Sender: TObject);
    procedure CbxVend1Click(Sender: TObject);
    procedure CbxProd1Exit(Sender: TObject);
    procedure CbxFor1Exit(Sender: TObject);
    procedure CbxSol1Exit(Sender: TObject);
    procedure CbxPed1Exit(Sender: TObject);
    procedure CbxMov1Exit(Sender: TObject);
    procedure CbxPag1Exit(Sender: TObject);
    procedure CbxGer1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Limpa;
  end;

var
  FrmSenhas: TFrmSenhas;
  wnome,wsenha,wsenhas: string;
  wcol001,wcol002,wcol003,wcol004,wcol005,wcol006,wcol007,wcol008,wcol009: string;
  wcol010,wcol011,wcol012,wcol013,wcol014,wcol015,wcol016,wcol017,wcol018: string;
  wcol019,wcol020,wcol021,wcol022,wcol023,wcol024,wcol025,wcol026,wcol027: string;
  wcol028,wcol029,wcol030,wcol031,wcol032,wcol033,wcol034,wcol035,wcol036: string;
  wcol037,wcol038,wcol039,wcol040,wcol041,wcol042,wcol043,wcol044,wcol045: string;
  wcol046,wcol047,wcol048,wcol049,wcol050,wcol051,wcol052,wcol053,wcol054: string;
  wcol055,wcol056,wcol057,wcol058,wcol059,wcol060,wcol061,wcol062,wcol063: string;
  wcol064,wcol065,wcol066,wcol067,wcol068,wcol069,wcol070,wcol071,wcol072: string;
  wcol073,wcol074,wcol075,wcol076,wcol077,wcol078,wcol079,wcol080: string;
implementation

{$R *.dfm}

uses UDModRosa;

procedure TFrmSenhas.Button1Click(Sender: TObject);
begin
  if edit1.Text<>'' then
  begin
    if Button1.Caption='IMPLANTAR' then
    begin
      IBQuery2.Close;
      IBQuery2.Sql.Clear;
      IBQuery2.Sql.Add('Insert Into ARQLOGIN ');
      IBQuery2.Sql.Add('(NOME,SENHA,SENHAS,Col001,Col002,Col003,Col004,Col005,'+
                       'Col006,Col007,Col008,Col009,Col010,Col011,Col012,Col013,'+
                       'Col014,Col015,Col016,Col017,Col018,Col019,Col020,Col021,'+
                       'Col022,Col023,Col024,Col025,Col026,Col027,Col028,Col029,'+
                       'Col030,Col031,Col032,Col033,Col034,Col035,Col036,Col037,'+
                       'Col038,Col039,Col040,Col041,Col042,Col043,Col044,Col045,'+
                       'Col046,Col047,Col048,Col049,Col050,Col051,Col052,Col053,'+
                       'Col054,Col055,Col056,Col057,Col058,Col059,Col060,Col061,'+
                       'Col062,Col063,Col064,Col065,Col066,Col067,Col068,Col069,'+
                       'Col070,Col071,Col072,Col073,Col074,Col075,Col076,Col077,'+
                       'Col078,Col079,Col080,DATXI,DATXL) '+
                'Values(:NOME,:SENHA,:SENHAS,:Col001,:Col002,:Col003,:Col004,:Col005,'+
                       ':Col006,:Col007,:Col008,:Col009,:Col010,:Col011,:Col012,:Col013,'+
                       ':Col014,:Col015,:Col016,:Col017,:Col018,:Col019,:Col020,:Col021,'+
                       ':Col022,:Col023,:Col024,:Col025,:Col026,:Col027,:Col028,:Col029,'+
                       ':Col030,:Col031,:Col032,:Col033,:Col034,:Col035,:Col036,:Col037,'+
                       ':Col038,:Col039,:Col040,:Col041,:Col042,:Col043,:Col044,:Col045,'+
                       ':Col046,:Col047,:Col048,:Col049,:Col050,:Col051,:Col052,:Col053,'+
                       ':Col054,:Col055,:Col056,:Col057,:Col058,:Col059,:Col060,:Col061,'+
                       ':Col062,:Col063,:Col064,:Col065,:Col066,:Col067,:Col068,:Col069,'+
                       ':Col070,:Col071,:Col072,:Col073,:Col074,:Col075,:Col076,:Col077,'+
                       ':Col078,:Col079,:Col080,:DATXI,:DATXL)');
      IBQuery2.ParamByName('NOME').AsString:=edit1.Text;
      IBQuery2.ParamByName('SENHA').AsString:=edit2.Text;
      IBQuery2.ParamByName('SENHAS').AsString:=wsenhas;
      IBQuery2.ParamByName('Col001').AsString:=wcol001;
      IBQuery2.ParamByName('Col002').AsString:=wcol002;
      IBQuery2.ParamByName('Col003').AsString:=wcol003;
      IBQuery2.ParamByName('Col004').AsString:=wcol004;
      IBQuery2.ParamByName('Col005').AsString:=wcol005;
      IBQuery2.ParamByName('Col006').AsString:=wcol006;
      IBQuery2.ParamByName('Col007').AsString:=wcol007;
      IBQuery2.ParamByName('Col008').AsString:=wcol008;
      IBQuery2.ParamByName('Col009').AsString:=wcol009;
      IBQuery2.ParamByName('Col010').AsString:=wcol010;
      IBQuery2.ParamByName('Col011').AsString:=wcol011;
      IBQuery2.ParamByName('Col012').AsString:=wcol012;
      IBQuery2.ParamByName('Col013').AsString:=wcol013;
      IBQuery2.ParamByName('Col014').AsString:=wcol014;
      IBQuery2.ParamByName('Col015').AsString:=wcol015;
      IBQuery2.ParamByName('Col016').AsString:=wcol016;
      IBQuery2.ParamByName('Col017').AsString:=wcol017;
      IBQuery2.ParamByName('Col018').AsString:=wcol018;
      IBQuery2.ParamByName('Col019').AsString:=wcol019;
      IBQuery2.ParamByName('Col020').AsString:=wcol020;
      IBQuery2.ParamByName('Col021').AsString:=wcol021;
      IBQuery2.ParamByName('Col022').AsString:=wcol022;
      IBQuery2.ParamByName('Col023').AsString:=wcol023;
      IBQuery2.ParamByName('Col024').AsString:=wcol024;
      IBQuery2.ParamByName('Col025').AsString:=wcol025;
      IBQuery2.ParamByName('Col026').AsString:=wcol026;
      IBQuery2.ParamByName('Col027').AsString:=wcol027;
      IBQuery2.ParamByName('Col028').AsString:=wcol028;
      IBQuery2.ParamByName('Col029').AsString:=wcol029;
      IBQuery2.ParamByName('Col030').AsString:=wcol030;
      IBQuery2.ParamByName('Col031').AsString:=wcol031;
      IBQuery2.ParamByName('Col032').AsString:=wcol032;
      IBQuery2.ParamByName('Col033').AsString:=wcol033;
      IBQuery2.ParamByName('Col034').AsString:=wcol034;
      IBQuery2.ParamByName('Col035').AsString:=wcol035;
      IBQuery2.ParamByName('Col036').AsString:=wcol036;
      IBQuery2.ParamByName('Col037').AsString:=wcol037;
      IBQuery2.ParamByName('Col038').AsString:=wcol038;
      IBQuery2.ParamByName('Col039').AsString:=wcol039;
      IBQuery2.ParamByName('Col040').AsString:=wcol040;
      IBQuery2.ParamByName('Col041').AsString:=wcol041;
      IBQuery2.ParamByName('Col042').AsString:=wcol042;
      IBQuery2.ParamByName('Col043').AsString:=wcol043;
      IBQuery2.ParamByName('Col044').AsString:=wcol044;
      IBQuery2.ParamByName('Col045').AsString:=wcol045;
      IBQuery2.ParamByName('Col046').AsString:=wcol046;
      IBQuery2.ParamByName('Col047').AsString:=wcol047;
      IBQuery2.ParamByName('Col048').AsString:=wcol048;
      IBQuery2.ParamByName('Col049').AsString:=wcol049;
      IBQuery2.ParamByName('Col050').AsString:=wcol050;
      IBQuery2.ParamByName('Col051').AsString:=wcol051;
      IBQuery2.ParamByName('Col052').AsString:=wcol052;
      IBQuery2.ParamByName('Col053').AsString:=wcol053;
      IBQuery2.ParamByName('Col054').AsString:=wcol054;
      IBQuery2.ParamByName('Col055').AsString:=wcol055;
      IBQuery2.ParamByName('Col056').AsString:=wcol056;
      IBQuery2.ParamByName('Col057').AsString:=wcol057;
      IBQuery2.ParamByName('Col058').AsString:=wcol058;
      IBQuery2.ParamByName('Col059').AsString:=wcol059;
      IBQuery2.ParamByName('Col060').AsString:=wcol060;
      IBQuery2.ParamByName('Col061').AsString:=wcol061;
      IBQuery2.ParamByName('Col062').AsString:=wcol062;
      IBQuery2.ParamByName('Col063').AsString:=wcol063;
      IBQuery2.ParamByName('Col064').AsString:=wcol064;
      IBQuery2.ParamByName('Col065').AsString:=wcol065;
      IBQuery2.ParamByName('Col066').AsString:=wcol066;
      IBQuery2.ParamByName('Col067').AsString:=wcol067;
      IBQuery2.ParamByName('Col068').AsString:=wcol068;
      IBQuery2.ParamByName('Col069').AsString:=wcol069;
      IBQuery2.ParamByName('Col070').AsString:=wcol070;
      IBQuery2.ParamByName('Col071').AsString:=wcol071;
      IBQuery2.ParamByName('Col072').AsString:=wcol072;
      IBQuery2.ParamByName('Col073').AsString:=wcol073;
      IBQuery2.ParamByName('Col074').AsString:=wcol074;
      IBQuery2.ParamByName('Col075').AsString:=wcol075;
      IBQuery2.ParamByName('Col076').AsString:=wcol076;
      IBQuery2.ParamByName('Col077').AsString:=wcol077;
      IBQuery2.ParamByName('Col078').AsString:=wcol078;
      IBQuery2.ParamByName('Col079').AsString:=wcol079;
      IBQuery2.ParamByName('Col080').AsString:=wcol080;
      IBQuery2.ParamByName('DATXI').AsString:=' ';
      IBQuery2.ParamByName('DATXL').AsString:=' ';
      IBQuery2.ExecSql;
      IBQuery2.Close;
    end;
    if Button1.Caption='ALTERAR' then
    begin
      IBQuery2.Close;
      IBQuery2.Sql.Clear;
      IBQuery2.SqL.Add('Update ARQLOGIN ');
      IBQuery2.Sql.Add('Set SENHA=:sen_digit,'+
                       'SENHAS=:senh_digit,'+
                       'Col001=:col001,'+
                       'Col002=:col002,'+
                       'Col003=:col003,'+
                       'Col004=:col004,'+
                       'Col005=:col005,'+
                       'Col006=:col006,'+
                       'Col007=:col007,'+
                       'Col008=:col008,'+
                       'Col009=:col009,'+
                       'Col010=:col010,'+
                       'Col011=:col011,'+
                       'Col012=:col012,'+
                       'Col013=:col013,'+
                       'Col014=:col014,'+
                       'Col015=:col015,'+
                       'Col016=:col016,'+
                       'Col017=:col017,'+
                       'Col018=:col018,'+
                       'Col019=:col019,'+
                       'Col020=:col020,'+
                       'Col021=:col021,'+
                       'Col022=:col022,'+
                       'Col023=:col023,'+
                       'Col024=:col024,'+
                       'Col025=:col025,'+
                       'Col026=:col026,'+
                       'Col027=:col027,'+
                       'Col028=:col028,'+
                       'Col029=:col029,'+
                       'Col030=:col030,'+
                       'Col031=:col031,'+
                       'Col032=:col032,'+
                       'Col033=:col033,'+
                       'Col034=:col034,'+
                       'Col035=:col035,'+
                       'Col036=:col036,'+
                       'Col037=:col037,'+
                       'Col038=:col038,'+
                       'Col039=:col039,'+
                       'Col040=:col040,'+
                       'Col041=:col041,'+
                       'Col042=:col042,'+
                       'Col043=:col043,'+
                       'Col044=:col044,'+
                       'Col045=:col045,'+
                       'Col046=:col046,'+
                       'Col047=:col047,'+
                       'Col048=:col048,'+
                       'Col049=:col049,'+
                       'Col050=:col050,'+
                       'Col051=:col051,'+
                       'Col052=:col052,'+
                       'Col053=:col053,'+
                       'Col054=:col054,'+
                       'Col055=:col055,'+
                       'Col056=:col056,'+
                       'Col057=:col057,'+
                       'Col058=:col058,'+
                       'Col059=:col059,'+
                       'Col060=:col060,'+
                       'Col061=:col061,'+
                       'Col062=:col062,'+
                       'Col063=:col063,'+
                       'Col064=:col064,'+
                       'Col065=:col065,'+
                       'Col066=:col066,'+
                       'Col067=:col067,'+
                       'Col068=:col068,'+
                       'Col069=:col069,'+
                       'Col070=:col070,'+
                       'Col071=:col071,'+
                       'Col072=:col072,'+
                       'Col073=:col073,'+
                       'Col074=:col074,'+
                       'Col075=:col075,'+
                       'Col076=:col076,'+
                       'Col077=:col077,'+
                       'Col078=:col078,'+
                       'Col079=:col079,'+
                       'Col080=:col080 '+
                       'Where NOME=:nom_digit');
      IBQuery2.ParamByName('nom_digit').AsString:=edit1.Text;
      IBQuery2.ParamByName('sen_digit').AsString:=edit2.Text;
      IBQuery2.ParamByName('senh_digit').AsString:=wsenhas;
      IBQuery2.ParamByName('col001').AsString:=wcol001;
      IBQuery2.ParamByName('col002').AsString:=wcol002;
      IBQuery2.ParamByName('col003').AsString:=wcol003;
      IBQuery2.ParamByName('col004').AsString:=wcol004;
      IBQuery2.ParamByName('col005').AsString:=wcol005;
      IBQuery2.ParamByName('Col006').AsString:=wcol006;
      IBQuery2.ParamByName('col007').AsString:=wcol007;
      IBQuery2.ParamByName('col008').AsString:=wcol008;
      IBQuery2.ParamByName('col009').AsString:=wcol009;
      IBQuery2.ParamByName('col010').AsString:=wcol010;
      IBQuery2.ParamByName('col011').AsString:=wcol011;
      IBQuery2.ParamByName('Col012').AsString:=wcol012;
      IBQuery2.ParamByName('col013').AsString:=wcol013;
      IBQuery2.ParamByName('col014').AsString:=wcol014;
      IBQuery2.ParamByName('col015').AsString:=wcol015;
      IBQuery2.ParamByName('col016').AsString:=wcol016;
      IBQuery2.ParamByName('col017').AsString:=wcol017;
      IBQuery2.ParamByName('Col018').AsString:=wcol018;
      IBQuery2.ParamByName('col019').AsString:=wcol019;
      IBQuery2.ParamByName('col020').AsString:=wcol020;
      IBQuery2.ParamByName('col021').AsString:=wcol021;
      IBQuery2.ParamByName('col022').AsString:=wcol022;
      IBQuery2.ParamByName('col023').AsString:=wcol023;
      IBQuery2.ParamByName('col024').AsString:=wcol024;
      IBQuery2.ParamByName('col025').AsString:=wcol025;
      IBQuery2.ParamByName('col026').AsString:=wcol026;
      IBQuery2.ParamByName('col027').AsString:=wcol027;
      IBQuery2.ParamByName('col028').AsString:=wcol028;
      IBQuery2.ParamByName('col029').AsString:=wcol029;
      IBQuery2.ParamByName('col030').AsString:=wcol030;
      IBQuery2.ParamByName('col031').AsString:=wcol031;
      IBQuery2.ParamByName('col032').AsString:=wcol032;
      IBQuery2.ParamByName('col033').AsString:=wcol033;
      IBQuery2.ParamByName('col034').AsString:=wcol034;
      IBQuery2.ParamByName('col035').AsString:=wcol035;
      IBQuery2.ParamByName('col036').AsString:=wcol036;
      IBQuery2.ParamByName('col037').AsString:=wcol037;
      IBQuery2.ParamByName('col038').AsString:=wcol038;
      IBQuery2.ParamByName('col039').AsString:=wcol039;
      IBQuery2.ParamByName('col040').AsString:=wcol040;
      IBQuery2.ParamByName('col041').AsString:=wcol041;
      IBQuery2.ParamByName('col042').AsString:=wcol042;
      IBQuery2.ParamByName('col043').AsString:=wcol043;
      IBQuery2.ParamByName('col044').AsString:=wcol044;
      IBQuery2.ParamByName('col045').AsString:=wcol045;
      IBQuery2.ParamByName('col046').AsString:=wcol046;
      IBQuery2.ParamByName('col047').AsString:=wcol047;
      IBQuery2.ParamByName('col048').AsString:=wcol048;
      IBQuery2.ParamByName('col049').AsString:=wcol049;
      IBQuery2.ParamByName('col050').AsString:=wcol050;
      IBQuery2.ParamByName('col051').AsString:=wcol051;
      IBQuery2.ParamByName('col052').AsString:=wcol052;
      IBQuery2.ParamByName('col053').AsString:=wcol053;
      IBQuery2.ParamByName('col054').AsString:=wcol054;
      IBQuery2.ParamByName('col055').AsString:=wcol055;
      IBQuery2.ParamByName('col056').AsString:=wcol056;
      IBQuery2.ParamByName('col057').AsString:=wcol057;
      IBQuery2.ParamByName('col058').AsString:=wcol058;
      IBQuery2.ParamByName('col059').AsString:=wcol059;
      IBQuery2.ParamByName('Col060').AsString:=wcol060;
      IBQuery2.ParamByName('col061').AsString:=wcol061;
      IBQuery2.ParamByName('col062').AsString:=wcol062;
      IBQuery2.ParamByName('col063').AsString:=wcol063;
      IBQuery2.ParamByName('col064').AsString:=wcol064;
      IBQuery2.ParamByName('col065').AsString:=wcol065;
      IBQuery2.ParamByName('col066').AsString:=wcol066;
      IBQuery2.ParamByName('col067').AsString:=wcol067;
      IBQuery2.ParamByName('col068').AsString:=wcol068;
      IBQuery2.ParamByName('col069').AsString:=wcol069;
      IBQuery2.ParamByName('col070').AsString:=wcol070;
      IBQuery2.ParamByName('col071').AsString:=wcol071;
      IBQuery2.ParamByName('col072').AsString:=wcol072;
      IBQuery2.ParamByName('col073').AsString:=wcol073;
      IBQuery2.ParamByName('col074').AsString:=wcol074;
      IBQuery2.ParamByName('col075').AsString:=wcol075;
      IBQuery2.ParamByName('col076').AsString:=wcol076;
      IBQuery2.ParamByName('col077').AsString:=wcol077;
      IBQuery2.ParamByName('col078').AsString:=wcol078;
      IBQuery2.ParamByName('col079').AsString:=wcol079;
      IBQuery2.ParamByName('col080').AsString:=wcol080;
      IBQuery2.ExecSql;
      IBQuery2.Close;
    end;
  end;
  Button2Click(Sender);
end;

procedure TFrmSenhas.Button2Click(Sender: TObject);
begin
  Limpa;
  Modalresult:=-1;
  exit;
end;

procedure TFrmSenhas.CbxCli1Exit(Sender: TObject);
begin
  with CBxCli1 do
  begin
    if Checked[0] then
       wcol009:='X'
    else
       wcol009:='';
    if Checked[1] then
       wcol010:='X'
    else
       wcol010:='';
    if Checked[2] then
       wcol011:='X'
    else
       wcol011:='';
    if Checked[3] then
       wcol012:='X'
    else
       wcol012:='';
    if Checked[4] then
       wcol013:='X'
    else
       wcol013:='';
    if Checked[5] then
       wcol014:='X'
    else
       wcol014:='';
    if Checked[6] then
       wcol015:='X'
    else
       wcol015:='';
    if Checked[7] then
       wcol016:='X'
    else
       wcol016:='';
    if Checked[8] then
       wcol017:='X'
    else
       wcol017:='';
  end;
end;

procedure TFrmSenhas.CbxFor1Exit(Sender: TObject);
begin
  with CBxFor1 do
  begin
    if Checked[0] then
       wcol031:='X'
    else
       wcol031:='';
    if Checked[1] then
       wcol032:='X'
    else
       wcol032:='';
    if Checked[2] then
       wcol033:='X'
    else
       wcol033:='';
    if Checked[3] then
       wcol034:='X'
    else
       wcol034:='';
    if Checked[4] then
       wcol035:='X'
    else
       wcol035:='';
    if Checked[5] then
       wcol036:='X'
    else
       wcol036:='';
    if Checked[6] then
       wcol037:='X'
    else
       wcol037:='';
    if Checked[7] then
       wcol038:='X'
    else
       wcol038:='';
  end;
end;

procedure TFrmSenhas.CbxGer1Exit(Sender: TObject);
begin
  with CBxGer1 do
  begin
    if Checked[0] then
       wcol060:='X'
    else
       wcol060:='';
    if Checked[1] then
       wcol061:='X'
    else
       wcol061:='';
    if Checked[2] then
       wcol062:='X'
    else
       wcol062:='';
    if Checked[3] then
       wcol063:='X'
    else
       wcol063:='';
    if Checked[4] then
       wcol064:='X'
    else
       wcol064:='';
    if Checked[5] then
       wcol065:='X'
    else
       wcol065:='';
    if Checked[6] then
       wcol066:='X'
    else
       wcol066:='';
  end;
end;

procedure TFrmSenhas.CbxMov1Exit(Sender: TObject);
begin
  with CBxMov1 do
  begin
    if Checked[0] then
       wcol055:='X'
    else
       wcol055:='';
    if Checked[1] then
       wcol056:='X'
    else
       wcol056:='';
  end;
end;

procedure TFrmSenhas.CbxPag1Exit(Sender: TObject);
begin
  with CBxPag1 do
  begin
    if Checked[0] then
       wcol057:='X'
    else
       wcol057:='';
    if Checked[1] then
       wcol058:='X'
    else
       wcol058:='';
    if Checked[2] then
       wcol059:='X'
    else
       wcol059:='';
  end;
end;

procedure TFrmSenhas.CbxPed1Exit(Sender: TObject);
begin
  with CBxPed1 do
  begin
    if Checked[0] then
       wcol045:='X'
    else
       wcol045:='';
    if Checked[1] then
       wcol046:='X'
    else
       wcol046:='';
    if Checked[2] then
       wcol047:='X'
    else
       wcol047:='';
    if Checked[3] then
       wcol048:='X'
    else
       wcol048:='';
    if Checked[4] then
       wcol049:='X'
    else
       wcol049:='';
    if Checked[5] then
       wcol050:='X'
    else
       wcol050:='';
    if Checked[6] then
       wcol051:='X'
    else
       wcol051:='';
    if Checked[7] then
       wcol052:='X'
    else
       wcol052:='';
    if Checked[8] then
       wcol053:='X'
    else
       wcol053:='';
    if Checked[9] then
       wcol054:='X'
    else
       wcol054:='';
  end;
end;

procedure TFrmSenhas.CbxProd1Exit(Sender: TObject);
begin
  with CBxProd1 do
  begin
    if Checked[0] then
       wcol022:='X'
    else
       wcol022:='';
    if Checked[1] then
       wcol023:='X'
    else
       wcol023:='';
    if Checked[2] then
       wcol024:='X'
    else
       wcol024:='';
    if Checked[3] then
       wcol025:='X'
    else
       wcol025:='';
    if Checked[4] then
       wcol026:='X'
    else
       wcol026:='';
    if Checked[5] then
       wcol027:='X'
    else
       wcol027:='';
    if Checked[6] then
       wcol028:='X'
    else
       wcol028:='';
    if Checked[7] then
       wcol029:='X'
    else
       wcol029:='';
    if Checked[8] then
       wcol030:='X'
    else
       wcol030:='';
  end;
end;

procedure TFrmSenhas.CbxSol1Exit(Sender: TObject);
begin
  with CBxSol1 do
  begin
    if Checked[0] then
       wcol039:='X'
    else
       wcol039:='';
    if Checked[1] then
       wcol040:='X'
    else
       wcol040:='';
    if Checked[2] then
       wcol041:='X'
    else
       wcol041:='';
    if Checked[3] then
       wcol042:='X'
    else
       wcol042:='';
    if Checked[4] then
       wcol043:='X'
    else
       wcol043:='';
    if Checked[5] then
       wcol044:='X'
    else
       wcol044:='';
  end;
end;

procedure TFrmSenhas.CbxTab1Click(Sender: TObject);
begin
  with Cbxtab1 do
  begin
    if Checked[0] then
       wcol006:='X'
    else
       wcol006:='';
    if Checked[1] then
       wcol007:='X'
    else
       wcol007:='';
    if Checked[2] then
       wcol008:='X'
    else
       wcol008:='';
  end;
end;

procedure TFrmSenhas.CBxUtilExit(Sender: TObject);
begin
  with CBxUtil do
  begin
    if Checked[0] then
       wsenhas:='X'
    else
       wsenhas:='';
    if Checked[1] then
       wcol001:='X'
    else
       wcol001:='';
    if Checked[2] then
       wcol002:='X'
    else
       wcol002:='';
    if Checked[3] then
       wcol003:='X'
    else
       wcol003:='';
    if Checked[4] then
       wcol004:='X'
    else
       wcol004:='';
    if Checked[5] then
       wcol005:='X'
    else
       wcol005:='';
  end;
end;

procedure TFrmSenhas.CbxVend1Click(Sender: TObject);
begin
  with CBxVend1 do
  begin
    if Checked[0] then
       wcol018:='X'
    else
       wcol018:='';
    if Checked[1] then
       wcol019:='X'
    else
       wcol019:='';
    if Checked[2] then
       wcol020:='X'
    else
       wcol020:='';
    if Checked[3] then
       wcol021:='X'
    else
       wcol021:='';
  end;
end;

procedure TFrmSenhas.Edit1Exit(Sender: TObject);
begin
  if(ActiveControl=Button2) then
    exit;
 if IBQuery1.Active then
    IBQuery1.Active:=False;
 IBQuery1.Sql.Clear;
 IBQuery1.Sql.Add('Select* from ARQLOGIN '+
                  'Where Nome=:nom_digit');
 IBQuery1.ParamByName('nom_digit').AsString:=edit1.Text;
 IBQuery1.Active:=True;
 if IBQuery1.RecordCount>0 then
 begin
   edit2.Text:=IBQuery1.fieldbyName('Senha').AsString;
   wsenhas:=IBQuery1.fieldbyName('Senhas').AsString;
   wcol001:=IBQuery1.fieldbyName('Col001').AsString;
   wcol002:=IBQuery1.fieldbyName('Col002').AsString;
   wcol003:=IBQuery1.fieldbyName('Col003').AsString;
   wcol004:=IBQuery1.fieldbyName('Col004').AsString;
   wcol005:=IBQuery1.fieldbyName('Col005').AsString;
   wcol006:=IBQuery1.fieldbyName('Col006').AsString;
   wcol007:=IBQuery1.fieldbyName('Col007').AsString;
   wcol008:=IBQuery1.fieldbyName('Col008').AsString;
   wcol009:=IBQuery1.fieldbyName('Col009').AsString;
   wcol010:=IBQuery1.fieldbyName('Col010').AsString;
   wcol011:=IBQuery1.fieldbyName('Col011').AsString;
   wcol012:=IBQuery1.fieldbyName('Col012').AsString;
   wcol013:=IBQuery1.fieldbyName('Col013').AsString;
   wcol014:=IBQuery1.fieldbyName('Col014').AsString;
   wcol015:=IBQuery1.fieldbyName('Col015').AsString;
   wcol016:=IBQuery1.fieldbyName('Col016').AsString;
   wcol017:=IBQuery1.fieldbyName('Col017').AsString;
   wcol018:=IBQuery1.fieldbyName('Col018').AsString;
   wcol019:=IBQuery1.fieldbyName('Col019').AsString;
   wcol020:=IBQuery1.fieldbyName('Col020').AsString;
   wcol021:=IBQuery1.fieldbyName('Col021').AsString;
   wcol022:=IBQuery1.fieldbyName('Col022').AsString;
   wcol023:=IBQuery1.fieldbyName('Col023').AsString;
   wcol024:=IBQuery1.fieldbyName('Col024').AsString;
   wcol025:=IBQuery1.fieldbyName('Col025').AsString;
   wcol026:=IBQuery1.fieldbyName('Col026').AsString;
   wcol027:=IBQuery1.fieldbyName('Col027').AsString;
   wcol028:=IBQuery1.fieldbyName('Col028').AsString;
   wcol029:=IBQuery1.fieldbyName('Col029').AsString;
   wcol030:=IBQuery1.fieldbyName('Col030').AsString;
   wcol031:=IBQuery1.fieldbyName('Col031').AsString;
   wcol032:=IBQuery1.fieldbyName('Col032').AsString;
   wcol033:=IBQuery1.fieldbyName('Col033').AsString;
   wcol034:=IBQuery1.fieldbyName('Col034').AsString;
   wcol035:=IBQuery1.fieldbyName('Col035').AsString;
   wcol036:=IBQuery1.fieldbyName('Col036').AsString;
   wcol037:=IBQuery1.fieldbyName('Col037').AsString;
   wcol038:=IBQuery1.fieldbyName('Col038').AsString;
   wcol039:=IBQuery1.fieldbyName('Col039').AsString;
   wcol040:=IBQuery1.fieldbyName('Col040').AsString;
   wcol041:=IBQuery1.fieldbyName('Col041').AsString;
   wcol042:=IBQuery1.fieldbyName('Col042').AsString;
   wcol043:=IBQuery1.fieldbyName('Col043').AsString;
   wcol044:=IBQuery1.fieldbyName('Col044').AsString;
   wcol045:=IBQuery1.fieldbyName('Col045').AsString;
   wcol046:=IBQuery1.fieldbyName('Col046').AsString;
   wcol047:=IBQuery1.fieldbyName('Col047').AsString;
   wcol048:=IBQuery1.fieldbyName('Col048').AsString;
   wcol049:=IBQuery1.fieldbyName('Col049').AsString;
   wcol050:=IBQuery1.fieldbyName('Col050').AsString;
   wcol051:=IBQuery1.fieldbyName('Col051').AsString;
   wcol052:=IBQuery1.fieldbyName('Col052').AsString;
   wcol053:=IBQuery1.fieldbyName('Col053').AsString;
   wcol054:=IBQuery1.fieldbyName('Col054').AsString;
   wcol055:=IBQuery1.fieldbyName('Col055').AsString;
   wcol056:=IBQuery1.fieldbyName('Col056').AsString;
   wcol057:=IBQuery1.fieldbyName('Col057').AsString;
   wcol058:=IBQuery1.fieldbyName('Col058').AsString;
   wcol059:=IBQuery1.fieldbyName('Col059').AsString;
   wcol060:=IBQuery1.fieldbyName('Col060').AsString;
   wcol061:=IBQuery1.fieldbyName('Col061').AsString;
   wcol062:=IBQuery1.fieldbyName('Col062').AsString;
   wcol063:=IBQuery1.fieldbyName('Col063').AsString;
   wcol064:=IBQuery1.fieldbyName('Col064').AsString;
   wcol065:=IBQuery1.fieldbyName('Col065').AsString;
   wcol066:=IBQuery1.fieldbyName('Col066').AsString;
   wcol067:=IBQuery1.fieldbyName('Col067').AsString;
   wcol068:=IBQuery1.fieldbyName('Col068').AsString;
   wcol069:=IBQuery1.fieldbyName('Col069').AsString;
   wcol070:=IBQuery1.fieldbyName('Col070').AsString;
   wcol071:=IBQuery1.fieldbyName('Col071').AsString;
   wcol072:=IBQuery1.fieldbyName('Col072').AsString;
   wcol073:=IBQuery1.fieldbyName('Col073').AsString;
   wcol074:=IBQuery1.fieldbyName('Col074').AsString;
   wcol075:=IBQuery1.fieldbyName('Col075').AsString;
   wcol076:=IBQuery1.fieldbyName('Col076').AsString;
   wcol077:=IBQuery1.fieldbyName('Col077').AsString;
   wcol078:=IBQuery1.fieldbyName('Col078').AsString;
   wcol079:=IBQuery1.fieldbyName('Col079').AsString;
   wcol080:=IBQuery1.fieldbyName('Col080').AsString;
   // fUNÇÕES *****************************
   if wsenhas='X' then
      CBxUtil.Checked[0]:=True;
   if wcol001='X' then
      CBxUtil.Checked[1]:=True;
   if wcol002='X' then
      CBxUtil.Checked[2]:=True;
   if wcol003='X' then
      CBxUtil.Checked[3]:=True;
   if wcol004='X' then
      CBxUtil.Checked[4]:=True;
   if wcol005='X' then
      CBxUtil.Checked[5]:=True;
    // Tabelas ********************************
    if wcol006='X' then
       CBxTab1.Checked[0]:=True;
    if wcol007='X' then
       CBxTab1.Checked[1]:=True;
    if wcol008='X' then
       CBxTab1.Checked[2]:=True;
    // Clientes ********************************
    if wcol009='X' then
       CBxTab1.Checked[0]:=True;
    if wcol010='X' then
       CBxTab1.Checked[1]:=True;
    if wcol011='X' then
       CBxTab1.Checked[2]:=True;
    if wcol012='X' then
       CBxCli1.Checked[3]:=True;
    if wcol013='X' then
       CBxCli1.Checked[4]:=True;
    if wcol014='X' then
       CBxCli1.Checked[5]:=True;
    if wcol015='X' then
       CBxCli1.Checked[6]:=True;
    if wcol016='X' then
       CBxCli1.Checked[7]:=True;
    if wcol017='X' then
       CBxCli1.Checked[8]:=True;
     // Vendedores ********************************
    if wcol018='X' then
       CBxVend1.Checked[0]:=True;
    if wcol019='X' then
       CBxVend1.Checked[1]:=True;
    if wcol020='X' then
       CBxVend1.Checked[2]:=True;
    if wcol021='X' then
       CBxVend1.Checked[3]:=True;
    // Produtos *******************************************
    if wcol022='X' then
       CBxProd1.Checked[0]:=True;
    if wcol023='X' then
       CBxProd1.Checked[1]:=True;
    if wcol024='X' then
       CBxProd1.Checked[2]:=True;
    if wcol025='X' then
       CBxProd1.Checked[3]:=True;
    if wcol026='X' then
       CBxProd1.Checked[4]:=True;
    if wcol027='X' then
       CBxProd1.Checked[5]:=True;
    if wcol028='X' then
       CBxProd1.Checked[6]:=True;
    if wcol029='X' then
       CBxProd1.Checked[7]:=True;
    if wcol030='X' then
       CBxProd1.Checked[8]:=True;
    // Fornecedor ********************************
    if wcol031='X' then
       CBxFor1.Checked[0]:=True;
    if wcol032='X' then
       CBxFor1.Checked[1]:=True;
    if wcol033='X' then
       CBxFor1.Checked[2]:=True;
    if wcol034='X' then
       CBxFor1.Checked[3]:=True;
    if wcol035='X' then
       CBxFor1.Checked[4]:=True;
    if wcol036='X' then
       CBxFor1.Checked[5]:=True;
    if wcol037='X' then
       CBxFor1.Checked[6]:=True;
    if wcol038='X' then
       CBxFor1.Checked[7]:=True;
    // Solicitação ********************
    if wcol039='X' then
       CBxSol1.Checked[0]:=True;
    if wcol040='X' then
       CBxSol1.Checked[1]:=True;
    if wcol041='X' then
       CBxSol1.Checked[2]:=True;
    if wcol042='X' then
       CBxSol1.Checked[3]:=True;
    if wcol043='X' then
       CBxSol1.Checked[4]:=True;
    if wcol044='X' then
       CBxSol1.Checked[5]:=True;
    // Pedido **********************************************
    if wcol045='X' then
       CBxPed1.Checked[0]:=True;
    if wcol046='X' then
       CBxPed1.Checked[1]:=True;
    if wcol047='X' then
       CBxPed1.Checked[2]:=True;
    if wcol048='X' then
       CBxPed1.Checked[3]:=True;
    if wcol049='X' then
       CBxPed1.Checked[4]:=True;
    if wcol050='X' then
       CBxPed1.Checked[5]:=True;
    if wcol051='X' then
       CBxPed1.Checked[6]:=True;
    if wcol052='X' then
       CBxPed1.Checked[7]:=True;
    if wcol053='X' then
       CBxPed1.Checked[8]:=True;
    if wcol054='X' then
       CBxPed1.Checked[9]:=True;
    // Notas ********************************************
     if wcol055='X' then
       CBxMov1.Checked[0]:=True;
    if wcol056='X' then
       CBxMov1.Checked[1]:=True;
    // Despesas *******************************************
    if wcol057='X' then
       CBxPag1.Checked[0]:=True;
    if wcol058='X' then
       CBxPag1.Checked[1]:=True;
    if wcol059='X' then
       CBxPag1.Checked[2]:=True;
    // Mapas *****************************************************
     if wcol060='X' then
       CBxGer1.Checked[0]:=True;
    if wcol061='X' then
       CBxGer1.Checked[1]:=True;
    if wcol062='X' then
       CBxGer1.Checked[2]:=True;
    if wcol063='X' then
       CBxGer1.Checked[3]:=True;
    if wcol064='X' then
       CBxGer1.Checked[4]:=True;
    if wcol065='X' then
       CBxGer1.Checked[5]:=True;
    if wcol066='X' then
       CBxGer1.Checked[6]:=True;
    // Confirma  Login Existente   *****************************
    if MessageDlg('Login Cadastrado !'+ Chr(13)+
                  'Deseja alterar ??',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      Button1.Caption := 'ALTERAR';
      edit2.SetFocus;
      exit;
    end;
    if MessageDlg('Login Cadastrado !'+ Chr(13)+
                  'Deseja excluir ??',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
    begin
      IBQuery2.Active:=False;
      IBQuery2.Sql.Clear;
      IBQuery2.Sql.Add('Delete from ARQLOGIN '+
                       'Where Nome=:nom_digit');
      IBQuery2.ParamByName('nom_digit').AsString:=edit1.Text;
      IBQuery2.Active:=True;
      IBQuery2.Close;
    end;
    Button2Click(Sender);
    exit;
  end;
  if MessageDlg('Login nao Cadastrado !'+ Chr(13)+
                'Deseja implantar ??',
                  mtWarning,[mbYes,mbNo],0) = mrYes then
  begin
    Button1.Caption:='IMPLANTAR';
    edit2.SetFocus;
    exit;
  end;
  Button2click(Sender);
end;

procedure TFrmSenhas.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFrmSenhas.FormShow(Sender: TObject);
begin
  Limpa;
  edit1.SetFocus;
  exit;
end;

procedure TFrmSenhas.Limpa;
begin
    edit1.Clear;
  edit2.Clear;
  wsenhas:='';
  wcol001:='';
  wcol002:='';
  wcol003:='';
  wcol004:='';
  wcol005:='';
  wcol006:='';
  wcol007:='';
  wcol008:='';
  wcol009:='';
  wcol010:='';
  wcol011:='';
  wcol012:='';
  wcol013:='';
  wcol014:='';
  wcol015:='';
  wcol016:='';
  wcol017:='';
  wcol018:='';
  wcol019:='';
  wcol020:='';
  wcol021:='';
  wcol022:='';
  wcol023:='';
  wcol024:='';
  wcol025:='';
  wcol026:='';
  wcol027:='';
  wcol028:='';
  wcol029:='';
  wcol030:='';
  wcol031:='';
  wcol032:='';
  wcol033:='';
  wcol034:='';
  wcol035:='';
  wcol036:='';
  wcol037:='';
  wcol038:='';
  wcol039:='';
  wcol040:='';
  wcol041:='';
  wcol042:='';
  wcol043:='';
  wcol044:='';
  wcol045:='';
  wcol046:='';
  wcol047:='';
  wcol048:='';
  wcol049:='';
  wcol050:='';
  wcol051:='';
  wcol052:='';
  wcol053:='';
  wcol054:='';
  wcol055:='';
  wcol056:='';
  wcol057:='';
  wcol058:='';
  wcol059:='';
  wcol060:='';
  wcol061:='';
  wcol062:='';
  wcol063:='';
  wcol064:='';
  wcol065:='';
  wcol066:='';
  wcol067:='';
  wcol068:='';
  wcol069:='';
  wcol070:='';
  wcol071:='';
  wcol072:='';
  wcol073:='';
  wcol074:='';
  wcol075:='';
  wcol076:='';
  wcol077:='';
  wcol078:='';
  wcol079:='';
  wcol080:='';
  with CBxUtil do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
    Checked[4]:=False;
    Checked[5]:=False;
  end;
  with CBxTab1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
  end;
  with CBxCli1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
    Checked[4]:=False;
    Checked[5]:=False;
    Checked[6]:=False;
    Checked[7]:=False;
    Checked[8]:=False;
  end;
  with CBxVend1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
  end;
  with CBxProd1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
    Checked[4]:=False;
    Checked[5]:=False;
    Checked[6]:=False;
    Checked[7]:=False;
    Checked[8]:=False;
  end;
  with CBxFor1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
    Checked[4]:=False;
    Checked[5]:=False;
    Checked[6]:=False;
    Checked[7]:=False;
  end;
  with CBxSol1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
    Checked[4]:=False;
    Checked[5]:=False;
  end;
  with CBxPed1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
    Checked[4]:=False;
    Checked[5]:=False;
    Checked[6]:=False;
    Checked[7]:=False;
    Checked[8]:=False;
    Checked[9]:=False;
  end;
  with CBxMov1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
  end;
  with CBxPag1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
  end;
  with CBxGer1 do
  begin
    Checked[0]:=False;
    Checked[1]:=False;
    Checked[2]:=False;
    Checked[3]:=False;
    Checked[4]:=False;
    Checked[5]:=False;
    Checked[6]:=False;
  end;
  if IBQuery1.Active then
     IBQuery1.Active:=False;
  edit1.Clear;
  edit2.Clear;
end;

end.
