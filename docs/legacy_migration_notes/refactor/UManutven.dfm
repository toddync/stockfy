object FrmManutven: TFrmManutven
  Left = 15
  Top = 0
  Caption = 
    '                                                                ' +
    '                                                 MANUTEN'#199#195'O DE V' +
    'ENDEDORES'
  ClientHeight = 612
  ClientWidth = 997
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 176
    Top = 87
    Width = 793
    Height = 517
    DataSource = DModRosa.DsPesq_ven
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '  NOME DO VENDEDOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 262
        Visible = True
      end
      item
        Color = clNavy
        Expanded = False
        FieldName = 'CODVEN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'COD.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 59
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'NTEL1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'TELEF1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 148
        Visible = True
      end
      item
        Color = clBlue
        Expanded = False
        FieldName = 'NTEL2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'TELEF2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'NTEL3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'TELEF3'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 152
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 82
    Width = 146
    Height = 511
    Color = clGray
    Ctl3D = False
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 2
    object Label4: TLabel
      Left = 20
      Top = 297
      Width = 107
      Height = 19
      Caption = 'RELAT'#211'RIOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 23
      Top = 21
      Width = 100
      Height = 19
      Caption = 'OPERA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 16
      Top = 44
      Width = 113
      Height = 41
      Caption = 'IMPLANTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 85
      Width = 113
      Height = 41
      Caption = 'ALTERAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 126
      Width = 113
      Height = 41
      Caption = 'CONSULTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 16
      Top = 168
      Width = 113
      Height = 41
      Caption = 'EXCLUIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button9: TButton
      Left = 16
      Top = 322
      Width = 113
      Height = 41
      Caption = 'MAPAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button9Click
    end
  end
  object Panel1: TPanel
    Left = 24
    Top = 8
    Width = 945
    Height = 73
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 96
      Height = 19
      Caption = 'PESQUIZAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 246
      Top = 27
      Width = 92
      Height = 19
      Caption = 'CONTEUDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 118
      Top = 24
      Width = 122
      Height = 31
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'CODIGO'
        'NOME')
    end
    object Edit1: TEdit
      Left = 344
      Top = 24
      Width = 347
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 697
      Top = 24
      Width = 121
      Height = 31
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object IBQuery1: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *  from CADLOGIN')
    Left = 872
    Top = 34
    object IBQuery1NOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CADLOGIN"."NOME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object IBQuery1SENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"CADLOGIN"."SENHA"'
      Size = 6
    end
    object IBQuery1SENHAS: TIBStringField
      FieldName = 'SENHAS'
      Origin = '"CADLOGIN"."SENHAS"'
      Size = 1
    end
    object IBQuery1COL001: TIBStringField
      FieldName = 'COL001'
      Origin = '"CADLOGIN"."COL001"'
      Size = 1
    end
    object IBQuery1COL002: TIBStringField
      FieldName = 'COL002'
      Origin = '"CADLOGIN"."COL002"'
      Size = 1
    end
    object IBQuery1COL003: TIBStringField
      FieldName = 'COL003'
      Origin = '"CADLOGIN"."COL003"'
      Size = 1
    end
    object IBQuery1COL004: TIBStringField
      FieldName = 'COL004'
      Origin = '"CADLOGIN"."COL004"'
      Size = 1
    end
    object IBQuery1COL005: TIBStringField
      FieldName = 'COL005'
      Origin = '"CADLOGIN"."COL005"'
      Size = 1
    end
    object IBQuery1COL006: TIBStringField
      FieldName = 'COL006'
      Origin = '"CADLOGIN"."COL006"'
      Size = 1
    end
    object IBQuery1COL007: TIBStringField
      FieldName = 'COL007'
      Origin = '"CADLOGIN"."COL007"'
      Size = 1
    end
    object IBQuery1COL008: TIBStringField
      FieldName = 'COL008'
      Origin = '"CADLOGIN"."COL008"'
      Size = 1
    end
    object IBQuery1COL009: TIBStringField
      FieldName = 'COL009'
      Origin = '"CADLOGIN"."COL009"'
      Size = 1
    end
    object IBQuery1COL010: TIBStringField
      FieldName = 'COL010'
      Origin = '"CADLOGIN"."COL010"'
      Size = 1
    end
    object IBQuery1COL011: TIBStringField
      FieldName = 'COL011'
      Origin = '"CADLOGIN"."COL011"'
      Size = 1
    end
    object IBQuery1COL012: TIBStringField
      FieldName = 'COL012'
      Origin = '"CADLOGIN"."COL012"'
      Size = 1
    end
    object IBQuery1COL013: TIBStringField
      FieldName = 'COL013'
      Origin = '"CADLOGIN"."COL013"'
      Size = 1
    end
    object IBQuery1COL014: TIBStringField
      FieldName = 'COL014'
      Origin = '"CADLOGIN"."COL014"'
      Size = 1
    end
    object IBQuery1COL015: TIBStringField
      FieldName = 'COL015'
      Origin = '"CADLOGIN"."COL015"'
      Size = 1
    end
    object IBQuery1COL016: TIBStringField
      FieldName = 'COL016'
      Origin = '"CADLOGIN"."COL016"'
      Size = 1
    end
    object IBQuery1COL017: TIBStringField
      FieldName = 'COL017'
      Origin = '"CADLOGIN"."COL017"'
      Size = 1
    end
    object IBQuery1COL018: TIBStringField
      FieldName = 'COL018'
      Origin = '"CADLOGIN"."COL018"'
      Size = 1
    end
    object IBQuery1COL019: TIBStringField
      FieldName = 'COL019'
      Origin = '"CADLOGIN"."COL019"'
      Size = 1
    end
    object IBQuery1COL020: TIBStringField
      FieldName = 'COL020'
      Origin = '"CADLOGIN"."COL020"'
      Size = 1
    end
    object IBQuery1COL021: TIBStringField
      FieldName = 'COL021'
      Origin = '"CADLOGIN"."COL021"'
      Size = 1
    end
    object IBQuery1COL022: TIBStringField
      FieldName = 'COL022'
      Origin = '"CADLOGIN"."COL022"'
      Size = 1
    end
    object IBQuery1COL023: TIBStringField
      FieldName = 'COL023'
      Origin = '"CADLOGIN"."COL023"'
      Size = 1
    end
    object IBQuery1COL024: TIBStringField
      FieldName = 'COL024'
      Origin = '"CADLOGIN"."COL024"'
      Size = 1
    end
    object IBQuery1COL025: TIBStringField
      FieldName = 'COL025'
      Origin = '"CADLOGIN"."COL025"'
      Size = 1
    end
    object IBQuery1COL026: TIBStringField
      FieldName = 'COL026'
      Origin = '"CADLOGIN"."COL026"'
      Size = 1
    end
    object IBQuery1COL027: TIBStringField
      FieldName = 'COL027'
      Origin = '"CADLOGIN"."COL027"'
      Size = 1
    end
    object IBQuery1COL028: TIBStringField
      FieldName = 'COL028'
      Origin = '"CADLOGIN"."COL028"'
      Size = 1
    end
    object IBQuery1COL029: TIBStringField
      FieldName = 'COL029'
      Origin = '"CADLOGIN"."COL029"'
      Size = 1
    end
    object IBQuery1COL030: TIBStringField
      FieldName = 'COL030'
      Origin = '"CADLOGIN"."COL030"'
      Size = 1
    end
    object IBQuery1COL031: TIBStringField
      FieldName = 'COL031'
      Origin = '"CADLOGIN"."COL031"'
      Size = 1
    end
    object IBQuery1COL032: TIBStringField
      FieldName = 'COL032'
      Origin = '"CADLOGIN"."COL032"'
      Size = 1
    end
    object IBQuery1COL033: TIBStringField
      FieldName = 'COL033'
      Origin = '"CADLOGIN"."COL033"'
      Size = 1
    end
    object IBQuery1COL034: TIBStringField
      FieldName = 'COL034'
      Origin = '"CADLOGIN"."COL034"'
      Size = 1
    end
    object IBQuery1COL035: TIBStringField
      FieldName = 'COL035'
      Origin = '"CADLOGIN"."COL035"'
      Size = 1
    end
    object IBQuery1COL036: TIBStringField
      FieldName = 'COL036'
      Origin = '"CADLOGIN"."COL036"'
      Size = 1
    end
    object IBQuery1COL037: TIBStringField
      FieldName = 'COL037'
      Origin = '"CADLOGIN"."COL037"'
      Size = 1
    end
    object IBQuery1COL038: TIBStringField
      FieldName = 'COL038'
      Origin = '"CADLOGIN"."COL038"'
      Size = 1
    end
    object IBQuery1COL039: TIBStringField
      FieldName = 'COL039'
      Origin = '"CADLOGIN"."COL039"'
      Size = 1
    end
    object IBQuery1COL040: TIBStringField
      FieldName = 'COL040'
      Origin = '"CADLOGIN"."COL040"'
      Size = 1
    end
    object IBQuery1COL041: TIBStringField
      FieldName = 'COL041'
      Origin = '"CADLOGIN"."COL041"'
      Size = 1
    end
    object IBQuery1COL042: TIBStringField
      FieldName = 'COL042'
      Origin = '"CADLOGIN"."COL042"'
      Size = 1
    end
    object IBQuery1COL043: TIBStringField
      FieldName = 'COL043'
      Origin = '"CADLOGIN"."COL043"'
      Size = 1
    end
    object IBQuery1COL044: TIBStringField
      FieldName = 'COL044'
      Origin = '"CADLOGIN"."COL044"'
      Size = 1
    end
    object IBQuery1COL045: TIBStringField
      FieldName = 'COL045'
      Origin = '"CADLOGIN"."COL045"'
      Size = 1
    end
    object IBQuery1COL046: TIBStringField
      FieldName = 'COL046'
      Origin = '"CADLOGIN"."COL046"'
      Size = 1
    end
    object IBQuery1COL047: TIBStringField
      FieldName = 'COL047'
      Origin = '"CADLOGIN"."COL047"'
      Size = 1
    end
    object IBQuery1COL048: TIBStringField
      FieldName = 'COL048'
      Origin = '"CADLOGIN"."COL048"'
      Size = 1
    end
    object IBQuery1COL049: TIBStringField
      FieldName = 'COL049'
      Origin = '"CADLOGIN"."COL049"'
      Size = 1
    end
    object IBQuery1COL050: TIBStringField
      FieldName = 'COL050'
      Origin = '"CADLOGIN"."COL050"'
      Size = 1
    end
    object IBQuery1COL051: TIBStringField
      FieldName = 'COL051'
      Origin = '"CADLOGIN"."COL051"'
      Size = 1
    end
    object IBQuery1COL052: TIBStringField
      FieldName = 'COL052'
      Origin = '"CADLOGIN"."COL052"'
      Size = 1
    end
    object IBQuery1COL053: TIBStringField
      FieldName = 'COL053'
      Origin = '"CADLOGIN"."COL053"'
      Size = 1
    end
    object IBQuery1COL054: TIBStringField
      FieldName = 'COL054'
      Origin = '"CADLOGIN"."COL054"'
      Size = 1
    end
    object IBQuery1COL055: TIBStringField
      FieldName = 'COL055'
      Origin = '"CADLOGIN"."COL055"'
      Size = 1
    end
    object IBQuery1COL056: TIBStringField
      FieldName = 'COL056'
      Origin = '"CADLOGIN"."COL056"'
      Size = 1
    end
    object IBQuery1COL057: TIBStringField
      FieldName = 'COL057'
      Origin = '"CADLOGIN"."COL057"'
      Size = 1
    end
    object IBQuery1COL058: TIBStringField
      FieldName = 'COL058'
      Origin = '"CADLOGIN"."COL058"'
      Size = 1
    end
    object IBQuery1COL059: TIBStringField
      FieldName = 'COL059'
      Origin = '"CADLOGIN"."COL059"'
      Size = 1
    end
    object IBQuery1COL060: TIBStringField
      FieldName = 'COL060'
      Origin = '"CADLOGIN"."COL060"'
      Size = 1
    end
    object IBQuery1COL061: TIBStringField
      FieldName = 'COL061'
      Origin = '"CADLOGIN"."COL061"'
      Size = 1
    end
    object IBQuery1COL062: TIBStringField
      FieldName = 'COL062'
      Origin = '"CADLOGIN"."COL062"'
      Size = 1
    end
    object IBQuery1COL063: TIBStringField
      FieldName = 'COL063'
      Origin = '"CADLOGIN"."COL063"'
      Size = 1
    end
    object IBQuery1COL064: TIBStringField
      FieldName = 'COL064'
      Origin = '"CADLOGIN"."COL064"'
      Size = 1
    end
    object IBQuery1COL065: TIBStringField
      FieldName = 'COL065'
      Origin = '"CADLOGIN"."COL065"'
      Size = 1
    end
    object IBQuery1COL066: TIBStringField
      FieldName = 'COL066'
      Origin = '"CADLOGIN"."COL066"'
      Size = 1
    end
    object IBQuery1COL067: TIBStringField
      FieldName = 'COL067'
      Origin = '"CADLOGIN"."COL067"'
      Size = 1
    end
    object IBQuery1COL068: TIBStringField
      FieldName = 'COL068'
      Origin = '"CADLOGIN"."COL068"'
      Size = 1
    end
    object IBQuery1COL069: TIBStringField
      FieldName = 'COL069'
      Origin = '"CADLOGIN"."COL069"'
      Size = 1
    end
    object IBQuery1COL070: TIBStringField
      FieldName = 'COL070'
      Origin = '"CADLOGIN"."COL070"'
      Size = 1
    end
    object IBQuery1COL071: TIBStringField
      FieldName = 'COL071'
      Origin = '"CADLOGIN"."COL071"'
      Size = 1
    end
    object IBQuery1COL072: TIBStringField
      FieldName = 'COL072'
      Origin = '"CADLOGIN"."COL072"'
      Size = 1
    end
    object IBQuery1COL073: TIBStringField
      FieldName = 'COL073'
      Origin = '"CADLOGIN"."COL073"'
      Size = 1
    end
    object IBQuery1COL074: TIBStringField
      FieldName = 'COL074'
      Origin = '"CADLOGIN"."COL074"'
      Size = 1
    end
    object IBQuery1COL075: TIBStringField
      FieldName = 'COL075'
      Origin = '"CADLOGIN"."COL075"'
      Size = 1
    end
    object IBQuery1COL076: TIBStringField
      FieldName = 'COL076'
      Origin = '"CADLOGIN"."COL076"'
      Size = 1
    end
    object IBQuery1COL077: TIBStringField
      FieldName = 'COL077'
      Origin = '"CADLOGIN"."COL077"'
      Size = 1
    end
    object IBQuery1COL078: TIBStringField
      FieldName = 'COL078'
      Origin = '"CADLOGIN"."COL078"'
      Size = 1
    end
    object IBQuery1COL079: TIBStringField
      FieldName = 'COL079'
      Origin = '"CADLOGIN"."COL079"'
      Size = 1
    end
    object IBQuery1COL080: TIBStringField
      FieldName = 'COL080'
      Origin = '"CADLOGIN"."COL080"'
      Size = 1
    end
    object IBQuery1DATXI: TIBStringField
      FieldName = 'DATXI'
      Origin = '"CADLOGIN"."DATXI"'
      Size = 10
    end
    object IBQuery1DATXL: TIBStringField
      FieldName = 'DATXL'
      Origin = '"CADLOGIN"."DATXL"'
      Size = 10
    end
  end
end
