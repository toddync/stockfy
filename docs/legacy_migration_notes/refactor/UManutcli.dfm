object FrmManutcli: TFrmManutcli
  Left = 15
  Top = 15
  Caption = 
    '                                                                ' +
    '                                                 MANUTEN'#199#195'O DE C' +
    'LIENTES'
  ClientHeight = 605
  ClientWidth = 988
  Color = clMaroon
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
    Left = 168
    Top = 79
    Width = 785
    Height = 512
    DataSource = DModRosa.DsPesq_cli
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Color = clYellow
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '        NOME DO CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 305
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'IDCLI'
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
        Width = 60
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'NTEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '      TELEFONE(S)'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 217
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'BAIR'
        Title.Caption = '    PRACA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 178
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 78
    Width = 154
    Height = 516
    Color = clGray
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 29
      Top = 235
      Width = 83
      Height = 19
      Caption = 'EMISS'#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 20
      Top = 16
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
      Left = 20
      Top = 55
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
      Left = 20
      Top = 96
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
      Left = 20
      Top = 137
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
    object Button5: TButton
      Left = 20
      Top = 260
      Width = 113
      Height = 41
      Caption = 'CADASTRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 20
      Top = 176
      Width = 113
      Height = 41
      Caption = 'ATIVAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 20
      Top = 307
      Width = 113
      Height = 41
      Caption = 'CLI / PRA'#199'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button9: TButton
      Left = 20
      Top = 449
      Width = 113
      Height = 41
      Caption = 'MAPAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 20
      Top = 354
      Width = 113
      Height = 41
      Caption = 'PED.PEND.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button10Click
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 937
    Height = 65
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
      Top = 23
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
      Top = 17
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
        'NOME'
        'ROTA')
    end
    object Edit1: TEdit
      Left = 344
      Top = 20
      Width = 305
      Height = 31
      CharCase = ecUpperCase
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
      Left = 655
      Top = 20
      Width = 121
      Height = 31
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object IBTAuxcliente: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXCLIENTE'
    UniDirectional = False
    Left = 200
    Top = 437
    object IBTAuxclienteCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Required = True
      Size = 4
    end
    object IBTAuxclienteNCPF: TIBStringField
      FieldName = 'NCPF'
      Size = 15
    end
    object IBTAuxclienteNIFP: TIBStringField
      FieldName = 'NIFP'
      Size = 15
    end
    object IBTAuxclienteBAIR: TIBStringField
      FieldName = 'BAIR'
    end
    object IBTAuxclienteCIDA: TIBStringField
      FieldName = 'CIDA'
    end
    object IBTAuxclienteESTA: TIBStringField
      FieldName = 'ESTA'
      Size = 2
    end
    object IBTAuxclienteNCEP: TIBStringField
      FieldName = 'NCEP'
      Size = 9
    end
    object IBTAuxclienteNTEL: TIBStringField
      FieldName = 'NTEL'
      Size = 30
    end
    object IBTAuxclienteCONTA: TIBStringField
      FieldName = 'CONTA'
      Size = 30
    end
    object IBTAuxclienteVEND: TIBStringField
      FieldName = 'VEND'
      Size = 3
    end
    object IBTAuxclienteLCRED: TIBBCDField
      FieldName = 'LCRED'
      Precision = 18
      Size = 2
    end
    object IBTAuxclienteDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Size = 10
    end
    object IBTAuxclienteNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Size = 35
    end
    object IBTAuxclienteNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Size = 35
    end
    object IBTAuxclienteDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Size = 10
    end
    object IBTAuxclienteNATU: TIBStringField
      FieldName = 'NATU'
      Size = 2
    end
    object IBTAuxclienteROTA: TIBStringField
      FieldName = 'ROTA'
      Size = 3
    end
    object IBTAuxclientePRACA: TIBStringField
      FieldName = 'PRACA'
      Size = 3
    end
    object IBTAuxclienteREFER: TIBStringField
      FieldName = 'REFER'
      Size = 40
    end
    object IBTAuxclienteOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Size = 4
    end
    object IBTAuxclienteSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTAuxclienteNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object IBTAuxclienteENDE: TIBStringField
      FieldName = 'ENDE'
      Size = 60
    end
    object IBTAuxclienteHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Size = 5
    end
    object IBTAuxclienteHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Size = 5
    end
    object IBTAuxclienteVISITA: TIBStringField
      FieldName = 'VISITA'
      Size = 12
    end
    object IBTAuxclienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBTAuxclienteESPED: TIBStringField
      FieldName = 'ESPED'
      Size = 6
    end
    object IBTAuxclienteOBSV: TBlobField
      FieldName = 'OBSV'
    end
  end
  object IBQAuxcliente: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXCLIENTE')
    Left = 270
    Top = 437
    object IBQAuxclienteCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXCLIENTE"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxclienteNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"AUXCLIENTE"."NCPF"'
      Size = 15
    end
    object IBQAuxclienteNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"AUXCLIENTE"."NIFP"'
      Size = 15
    end
    object IBQAuxclienteBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"AUXCLIENTE"."BAIR"'
    end
    object IBQAuxclienteCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"AUXCLIENTE"."CIDA"'
    end
    object IBQAuxclienteESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"AUXCLIENTE"."ESTA"'
      Size = 2
    end
    object IBQAuxclienteNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"AUXCLIENTE"."NCEP"'
      Size = 9
    end
    object IBQAuxclienteNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"AUXCLIENTE"."NTEL"'
      Size = 30
    end
    object IBQAuxclienteCONTA: TIBStringField
      FieldName = 'CONTA'
      Origin = '"AUXCLIENTE"."CONTA"'
      Size = 30
    end
    object IBQAuxclienteVEND: TIBStringField
      FieldName = 'VEND'
      Origin = '"AUXCLIENTE"."VEND"'
      Size = 3
    end
    object IBQAuxclienteLCRED: TIBBCDField
      FieldName = 'LCRED'
      Origin = '"AUXCLIENTE"."LCRED"'
      Precision = 18
      Size = 2
    end
    object IBQAuxclienteDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Origin = '"AUXCLIENTE"."DATIMP"'
      Size = 10
    end
    object IBQAuxclienteNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Origin = '"AUXCLIENTE"."NOMMAE"'
      Size = 35
    end
    object IBQAuxclienteNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Origin = '"AUXCLIENTE"."NOMPAI"'
      Size = 35
    end
    object IBQAuxclienteDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Origin = '"AUXCLIENTE"."DATNASC"'
      Size = 10
    end
    object IBQAuxclienteNATU: TIBStringField
      FieldName = 'NATU'
      Origin = '"AUXCLIENTE"."NATU"'
      Size = 2
    end
    object IBQAuxclienteROTA: TIBStringField
      FieldName = 'ROTA'
      Origin = '"AUXCLIENTE"."ROTA"'
      Size = 3
    end
    object IBQAuxclientePRACA: TIBStringField
      FieldName = 'PRACA'
      Origin = '"AUXCLIENTE"."PRACA"'
      Size = 3
    end
    object IBQAuxclienteREFER: TIBStringField
      FieldName = 'REFER'
      Origin = '"AUXCLIENTE"."REFER"'
      Size = 40
    end
    object IBQAuxclienteOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Origin = '"AUXCLIENTE"."OLDCLI"'
      Size = 4
    end
    object IBQAuxclienteSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXCLIENTE"."SITU"'
      Size = 1
    end
    object IBQAuxclienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"AUXCLIENTE"."NOME"'
      Size = 50
    end
    object IBQAuxclienteENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"AUXCLIENTE"."ENDE"'
      Size = 60
    end
    object IBQAuxclienteHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Origin = '"AUXCLIENTE"."HORAIN"'
      Size = 5
    end
    object IBQAuxclienteHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Origin = '"AUXCLIENTE"."HORAFIN"'
      Size = 5
    end
    object IBQAuxclienteVISITA: TIBStringField
      FieldName = 'VISITA'
      Origin = '"AUXCLIENTE"."VISITA"'
      Size = 12
    end
    object IBQAuxclienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"AUXCLIENTE"."ATIVO"'
      Size = 1
    end
    object IBQAuxclienteESPED: TIBStringField
      FieldName = 'ESPED'
      Origin = '"AUXCLIENTE"."ESPED"'
      Size = 6
    end
    object IBQAuxclienteOBSV: TBlobField
      FieldName = 'OBSV'
      Origin = '"AUXCLIENTE"."OBSV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBQuery1: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CADLOGIN')
    Left = 791
    Top = 454
  end
  object DtsCadcli: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODCLI=CODCLI'
      'NCPF=NCPF'
      'NIFP=NIFP'
      'BAIR=BAIR'
      'CIDA=CIDA'
      'ESTA=ESTA'
      'NCEP=NCEP'
      'NTEL=NTEL'
      'CONTA=CONTA'
      'VEND=VEND'
      'LCRED=LCRED'
      'DATIMP=DATIMP'
      'NOMMAE=NOMMAE'
      'NOMPAI=NOMPAI'
      'DATNASC=DATNASC'
      'NATU=NATU'
      'ROTA=ROTA'
      'PRACA=PRACA'
      'REFER=REFER'
      'OLDCLI=OLDCLI'
      'SITU=SITU'
      'NOME=NOME'
      'ENDE=ENDE'
      'HORAIN=HORAIN'
      'HORAFIN=HORAFIN'
      'VISITA=VISITA'
      'ATIVO=ATIVO'
      'ESPED=ESPED'
      'OBSV=OBSV')
    DataSet = IBQAuxcliente
    BCDToCurrency = False
    Left = 496
    Top = 440
  end
  object RvCadClie: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42647.436003645830000000
    ReportOptions.LastChange = 42647.518099675920000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvCadClieGetValue
    Left = 408
    Top = 440
    Datasets = <
      item
        DataSet = DtsCadcli
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 53.402841580000000000
          Top = 8.951518420000000000
          Width = 248.653289470000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CADASTRO DE CLIENTES   ---')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 309.393940000000000000
          Top = 9.150441050000000000
          Width = 303.158090530000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Opcao]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -0.220470000000000000
          Top = 40.015770000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 658.681705260000000000
          Top = 9.929971050000000000
          Width = 45.553282630000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[page#]')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 617.681705260000000000
          Top = 9.929971050000000000
          Width = 35.806073680000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG:')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 105.826840000000000000
        ParentFont = False
        Top = 124.724490000000000000
        Width = 718.110700000000000000
        DataSet = DtsCadcli
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 4.978452630000000000
          Top = 5.542899470000000000
          Width = 61.666015790000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 3.978452630000000000
          Top = 29.435162630000000000
          Width = 83.945350530000000000
          Height = 24.069638420000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.978452630000000000
          Top = 56.262783680000000000
          Width = 65.843391050000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 2.978452630000000000
          Top = 80.111952110000000000
          Width = 68.031540000000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Refere:')
          ParentFont = False
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -1.220470000000000000
          Top = 104.165430000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object frxDBDataset1CODCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 97.370130000000000000
          Top = 5.779530000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataField = 'CODCLI'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODCLI"]')
          ParentFont = False
        end
        object frxDBDataset1NOME: TfrxMemoView
          AllowVectorExport = True
          Left = 154.905690000000000000
          Top = 6.338590000000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 429.909905260000000000
          Top = 7.521352110000000000
          Width = 48.934967370000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Telef:')
          ParentFont = False
        end
        object frxDBDataset1NTEL: TfrxMemoView
          AllowVectorExport = True
          Left = 485.393940000000000000
          Top = 8.354360000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          DataField = 'NTEL'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NTEL"]')
          ParentFont = False
        end
        object frxDBDataset1ENDE: TfrxMemoView
          AllowVectorExport = True
          Left = 96.401670000000000000
          Top = 29.692950000000000000
          Width = 351.496290000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ENDE"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 451.694431580000000000
          Top = 31.392067890000000000
          Width = 59.875712110000000000
          Height = 19.295495260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Compl:')
          ParentFont = False
        end
        object frxDBDataset1CONTA: TfrxMemoView
          AllowVectorExport = True
          Left = 516.055350000000000000
          Top = 32.472480000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'CONTA'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CONTA"]')
          ParentFont = False
        end
        object frxDBDataset1BAIR: TfrxMemoView
          AllowVectorExport = True
          Left = 98.315090000000000000
          Top = 52.472480000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DataField = 'BAIR'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."BAIR"]')
          ParentFont = False
        end
        object frxDBDataset1CIDA: TfrxMemoView
          AllowVectorExport = True
          Left = 384.464750000000000000
          Top = 52.913420000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          DataField = 'CIDA'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CIDA"]')
          ParentFont = False
        end
        object frxDBDataset1ESTA: TfrxMemoView
          AllowVectorExport = True
          Left = 616.693260000000000000
          Top = 53.252010000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'ESTA'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ESTA"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 321.491684210000000000
          Top = 54.284331050000000000
          Width = 55.101568950000000000
          Height = 15.913810530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade:')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 568.918726320000000000
          Top = 53.284331050000000000
          Width = 39.386681050000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Est:')
          ParentFont = False
        end
        object frxDBDataset1REFER: TfrxMemoView
          AllowVectorExport = True
          Left = 97.929190000000000000
          Top = 76.149660000000000000
          Width = 461.102660000000000000
          Height = 22.677180000000000000
          DataField = 'REFER'
          DataSet = DtsCadcli
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."REFER"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 162.396673680000000000
          Top = 2.370911050000000000
          Width = 64.649855259999990000
          Height = 15.913810530000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 94.612147370000000000
          Top = 1.349363680000000000
          Width = 63.655242110000000000
          Height = 19.295495260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CLientes ---->')
          ParentFont = False
        end
      end
    end
  end
end
