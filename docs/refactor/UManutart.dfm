object FrmManutart: TFrmManutart
  Left = 15
  Top = 0
  Caption = 
    '                                                                ' +
    '                                                 MANUTEN'#199#195'O DE A' +
    'RTIGOS'
  ClientHeight = 620
  ClientWidth = 989
  Color = clGreen
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
    Top = 86
    Width = 805
    Height = 508
    DataSource = DModRosa.DsPesq_art
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clYellow
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 84
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 425
        Visible = True
      end
      item
        Color = clRed
        Expanded = False
        FieldName = 'CUSTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 96
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'VENDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 86
        Visible = True
      end
      item
        Color = clRed
        Expanded = False
        FieldName = 'ESTOQ'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 71
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 87
    Width = 162
    Height = 507
    Color = clGray
    Ctl3D = False
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 2
    object Label3: TLabel
      Left = 33
      Top = 260
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
    object Label4: TLabel
      Left = 37
      Top = 193
      Width = 77
      Height = 19
      Caption = 'ESTOQUE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 13
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
    object Label6: TLabel
      Left = 53
      Top = 408
      Width = 59
      Height = 19
      Caption = 'MAPAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 11
      Top = 33
      Width = 136
      Height = 40
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
      Left = 11
      Top = 71
      Width = 136
      Height = 40
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
      Left = 11
      Top = 110
      Width = 136
      Height = 40
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
      Left = 11
      Top = 150
      Width = 136
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
      Left = 11
      Top = 215
      Width = 136
      Height = 39
      Caption = 'CONTAGEM'
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
      Left = 11
      Top = 285
      Width = 136
      Height = 40
      Caption = 'CAD.ALFA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button9: TButton
      Left = 11
      Top = 433
      Width = 136
      Height = 42
      Caption = 'MOVIMENTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button9Click
    end
    object Button7: TButton
      Left = 11
      Top = 321
      Width = 136
      Height = 40
      Caption = 'ETIQ.COD.BAR.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 11
      Top = 361
      Width = 136
      Height = 41
      Caption = 'CADASTRAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button8Click
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 7
    Width = 973
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
      Left = 272
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
      Left = 128
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
        'DESCRICAO')
    end
    object Edit1: TEdit
      Left = 370
      Top = 24
      Width = 337
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
      Left = 728
      Top = 24
      Width = 97
      Height = 27
      Color = clGreen
      TabOrder = 2
    end
  end
  object IBQArtMapa: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXRELMAPA')
    Left = 344
    Top = 518
    object IBQArtMapaITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXRELMAPA"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object IBQArtMapaPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXRELMAPA"."PEDIDO"'
      Size = 8
    end
    object IBQArtMapaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"AUXRELMAPA"."CODIGO"'
      Size = 4
    end
    object IBQArtMapaBASE: TIBStringField
      FieldName = 'BASE'
      Origin = '"AUXRELMAPA"."BASE"'
      Size = 10
    end
    object IBQArtMapaQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"AUXRELMAPA"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBQArtMapaPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"AUXRELMAPA"."PRECO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQRelcad: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXMAPAO')
    Left = 464
    Top = 517
    object IBQRelcadCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXMAPA"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQRelcadDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXMAPA"."DESCRICAO"'
      Size = 40
    end
    object IBQRelcadESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      Origin = '"AUXMAPA"."ESTOQ"'
      DisplayFormat = '###0'
    end
    object IBQRelcadCOMPRA: TIntegerField
      FieldName = 'COMPRA'
      Origin = '"AUXMAPA"."COMPRA"'
      DisplayFormat = '###0'
    end
    object IBQRelcadDEFEITO: TIntegerField
      FieldName = 'DEFEITO'
      Origin = '"AUXMAPA"."DEFEITO"'
      DisplayFormat = '###0'
    end
    object IBQRelcadRETDEV: TIntegerField
      FieldName = 'RETDEV'
      Origin = '"AUXMAPA"."RETDEV"'
      DisplayFormat = '###0'
    end
    object IBQRelcadSAIDA: TIntegerField
      FieldName = 'SAIDA'
      Origin = '"AUXMAPA"."SAIDA"'
      DisplayFormat = '###0'
    end
    object IBQRelcadQTDFIS: TIntegerField
      FieldName = 'QTDFIS'
      Origin = '"AUXMAPA"."QTDFIS"'
      DisplayFormat = '###0'
    end
    object IBQRelcadVALFIS: TIntegerField
      FieldName = 'VALFIS'
      Origin = '"AUXMAPA"."VALFIS"'
      DisplayFormat = '##,##0.00'
    end
    object IBQRelcadQTDSAC: TIntegerField
      FieldName = 'QTDSAC'
      Origin = '"AUXMAPA"."QTDSAC"'
      DisplayFormat = '###0'
    end
    object IBQRelcadVALSAC: TIBBCDField
      FieldName = 'VALSAC'
      Origin = '"AUXMAPA"."VALSAC"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQRelcadQTDREAL: TIntegerField
      FieldName = 'QTDREAL'
      Origin = '"AUXMAPA"."QTDREAL"'
      DisplayFormat = '###0'
    end
    object IBQRelcadVALREAL: TIBBCDField
      FieldName = 'VALREAL'
      Origin = '"AUXMAPA"."VALREAL"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQRelcadQTDVEN: TIntegerField
      FieldName = 'QTDVEN'
      Origin = '"AUXMAPA"."QTDVEN"'
      DisplayFormat = '###0'
    end
    object IBQRelcadVALVEN: TIBBCDField
      FieldName = 'VALVEN'
      Origin = '"AUXMAPA"."VALVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQRelcadCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"AUXMAPA"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQRelcadMEDIA: TIntegerField
      FieldName = 'MEDIA'
      Origin = '"AUXMAPA"."MEDIA"'
      DisplayFormat = '##0.0'
    end
    object IBQRelcadAPURADO: TIntegerField
      FieldName = 'APURADO'
      Origin = '"AUXMAPA"."APURADO"'
      DisplayFormat = '###0'
    end
    object IBQRelcadNASACOL: TIntegerField
      FieldName = 'NASACOL'
      Origin = '"AUXMAPA"."NASACOL"'
      DisplayFormat = '###0'
    end
  end
  object IBTArtmapa: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXRELMAPA'
    UniDirectional = False
    Left = 280
    Top = 518
    object IBTArtmapaITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 5
    end
    object IBTArtmapaPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Size = 8
    end
    object IBTArtmapaCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object IBTArtmapaBASE: TIBStringField
      FieldName = 'BASE'
      Size = 10
    end
    object IBTArtmapaQUANT: TIntegerField
      FieldName = 'QUANT'
      DisplayFormat = '###0'
    end
    object IBTArtmapaPRECO: TIBBCDField
      FieldName = 'PRECO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBTRelcad: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODART'
        Attributes = [faRequired]
        DataType = ftString
        Size = 4
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'ESTOQ'
        DataType = ftInteger
      end
      item
        Name = 'COMPRA'
        DataType = ftInteger
      end
      item
        Name = 'DEFEITO'
        DataType = ftInteger
      end
      item
        Name = 'RETDEV'
        DataType = ftInteger
      end
      item
        Name = 'SAIDA'
        DataType = ftInteger
      end
      item
        Name = 'QTDFIS'
        DataType = ftInteger
      end
      item
        Name = 'VALFIS'
        DataType = ftInteger
      end
      item
        Name = 'QTDSAC'
        DataType = ftInteger
      end
      item
        Name = 'VALSAC'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'QTDREAL'
        DataType = ftInteger
      end
      item
        Name = 'VALREAL'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'QTDVEN'
        DataType = ftInteger
      end
      item
        Name = 'VALVEN'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'CUSTO'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end
      item
        Name = 'MEDIA'
        DataType = ftInteger
      end
      item
        Name = 'APURADO'
        DataType = ftInteger
      end
      item
        Name = 'NASACOL'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY4'
        Fields = 'CODART'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'AUXMAPAO'
    UniDirectional = False
    Left = 408
    Top = 518
    object IBTRelcadCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTRelcadDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTRelcadESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      DisplayFormat = '####0'
    end
    object IBTRelcadCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object IBTRelcadDEFEITO: TIntegerField
      FieldName = 'DEFEITO'
    end
    object IBTRelcadRETDEV: TIntegerField
      FieldName = 'RETDEV'
    end
    object IBTRelcadSAIDA: TIntegerField
      FieldName = 'SAIDA'
    end
    object IBTRelcadQTDFIS: TIntegerField
      FieldName = 'QTDFIS'
    end
    object IBTRelcadVALFIS: TIntegerField
      FieldName = 'VALFIS'
    end
    object IBTRelcadQTDSAC: TIntegerField
      FieldName = 'QTDSAC'
    end
    object IBTRelcadVALSAC: TIBBCDField
      FieldName = 'VALSAC'
      Precision = 18
      Size = 2
    end
    object IBTRelcadQTDREAL: TIntegerField
      FieldName = 'QTDREAL'
    end
    object IBTRelcadVALREAL: TIBBCDField
      FieldName = 'VALREAL'
      Precision = 18
      Size = 2
    end
    object IBTRelcadQTDVEN: TIntegerField
      FieldName = 'QTDVEN'
    end
    object IBTRelcadVALVEN: TIBBCDField
      FieldName = 'VALVEN'
      Precision = 18
      Size = 2
    end
    object IBTRelcadCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object IBTRelcadMEDIA: TIntegerField
      FieldName = 'MEDIA'
    end
    object IBTRelcadAPURADO: TIntegerField
      FieldName = 'APURADO'
    end
    object IBTRelcadNASACOL: TIntegerField
      FieldName = 'NASACOL'
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
    Left = 224
    Top = 518
  end
  object RvCadart: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42645.734010497700000000
    ReportOptions.LastChange = 43693.697477152770000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvCadartGetValue
    Left = 520
    Top = 517
    Datasets = <
      item
        DataSet = DtsCadart
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
        Height = 68.031540000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = -0.220470000000000000
          Top = 38.559060000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 66.118120000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 185.498242630000000000
          Top = 8.752595790000000000
          Width = 394.662501050000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX CONFEC'#199#213'ES - CADASTRO DE ARTIGOS')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 276.976500000000000000
          Top = 40.574830000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 336.205010000000000000
          Top = 39.354360000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 473.842920000000000000
          Top = 38.574830000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.827621050000000000
          Top = 44.757592110000000000
          Width = 41.972675260000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COD')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 110.612147370000000000
          Top = 43.714497370000000000
          Width = 108.611756840000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 641.048010530000000000
          Top = 4.973065790000000000
          Width = 55.101568950000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 592.069557890000000000
          Top = 4.951518420000000000
          Width = 43.961901580000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 279.060736840000000000
          Top = 42.757592110000000000
          Width = 52.117729470000000000
          Height = 19.295495260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ESTQ')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 338.608242110000000000
          Top = 42.736044740000000000
          Width = 66.838004210000000000
          Height = 19.295495260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 409.220389470000000000
          Top = 43.714497370000000000
          Width = 60.074634740000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 477.617063160000000000
          Top = 42.736044740000000000
          Width = 132.869934740000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PRE'#199'OS VENDA')
          ParentFont = False
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 618.000000000000000000
          Top = 40.102350000000000000
          Height = 22.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 10.118120000000000000
          Top = 7.118120000000000000
          Width = 94.488250000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Dat01]')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 109.606370000000000000
          Top = 5.118120000000000000
          Width = 64.252010000000000000
          Height = 26.456710000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Temp01]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = DtsCadart
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODART: TfrxMemoView
          AllowVectorExport = True
          Left = -9.440940000000000000
          Top = 1.000000000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CODART"]')
          ParentFont = False
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 45.826840000000000000
          Top = 0.661410000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 474.945270000000000000
          Top = 1.000000000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1ESTOQ: TfrxMemoView
          AllowVectorExport = True
          Left = 263.834880000000000000
          Top = 0.779530000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
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
            '[frxDBDataset1."SAIDA"]')
          ParentFont = False
        end
        object frxDBDataset1VALVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 463.504330000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."VALVEN"]')
          ParentFont = False
        end
        object frxDBDataset1CUSTO: TfrxMemoView
          AllowVectorExport = True
          Left = 330.205010000000000000
          Top = 1.000000000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CUSTO"]')
          ParentFont = False
        end
        object frxDBDataset1VALSAC: TfrxMemoView
          AllowVectorExport = True
          Left = 399.795610000000000000
          Top = 1.000000000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."VALSAC"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 276.937230000000000000
          Top = 0.440940000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 336.102660000000000000
          Top = 1.779530000000000000
          Height = 18.897650000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 618.000000000000000000
          Top = 1.598330000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1VALREAL: TfrxMemoView
          AllowVectorExport = True
          Left = 538.000000000000000000
          Top = 0.598330000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."VALREAL"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = -0.220470000000000000
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 12.956905260000000000
          Top = 6.101959470000000000
          Width = 66.440158950000000000
          Height = 19.295495260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Artigos-->')
          ParentFont = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 336.205010000000000000
          Top = 4.779530000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 277.496290000000000000
          Top = 6.779530000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 475.283860000000000000
          Top = 7.000000000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 390.543600000000000000
          Top = 8.101959470000000000
          Width = 80.165820530000000000
          Height = 19.494417890000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."VALSAC">,MasterData1)]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 269.060736840000000000
          Top = 10.145054210000000000
          Width = 59.875712110000000000
          Height = 15.913810530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."SAIDA">,MasterData1)]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 91.525957890000000000
          Top = 7.101959470000000000
          Width = 45.752205260000000000
          Height = 19.494417890000000000
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
      end
    end
  end
  object DtsCadart: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODART=CODART'
      'DESCRICAO=DESCRICAO'
      'ESTOQ=ESTOQ'
      'COMPRA=COMPRA'
      'DEFEITO=DEFEITO'
      'RETDEV=RETDEV'
      'SAIDA=SAIDA'
      'QTDFIS=QTDFIS'
      'VALFIS=VALFIS'
      'QTDSAC=QTDSAC'
      'VALSAC=VALSAC'
      'QTDREAL=QTDREAL'
      'VALREAL=VALREAL'
      'QTDVEN=QTDVEN'
      'VALVEN=VALVEN'
      'CUSTO=CUSTO'
      'MEDIA=MEDIA'
      'APURADO=APURADO'
      'NASACOL=NASACOL')
    DataSet = IBTRelcad
    BCDToCurrency = False
    Left = 577
    Top = 518
  end
  object RvRelart: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42645.734010497700000000
    ReportOptions.LastChange = 43638.831725000000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 631
    Top = 518
    Datasets = <
      item
        DataSet = DtsCadart
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
        Height = 83.149660000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = -0.220470000000000000
          Top = 38.559060000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 79.118120000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 53.112342630000000000
          Top = 4.973065790000000000
          Width = 466.473571050000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX CONFEC'#199#213'ES - RELA'#199#195'O DOS ARTIGOS')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 23.827621050000000000
          Top = 51.757592110000000000
          Width = 57.090795260000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'COD')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 137.525567370000000000
          Top = 46.934967370000000000
          Width = 127.509406840000000000
          Height = 23.472870530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 641.048010530000000000
          Top = 4.973065790000000000
          Width = 55.101568950000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Page#]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 592.069557890000000000
          Top = 4.951518420000000000
          Width = 43.961901580000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 49.133890000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        DataSet = DtsCadart
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 9.456710000000000000
          Top = 11.338590000000000000
          Width = 71.811070000000000000
          Height = 26.456710000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CODART"]')
          ParentFont = False
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 94.960730000000000000
          Top = 11.000000000000000000
          Width = 302.362400000000000000
          Height = 26.456710000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 91.740260000000000000
          Top = 0.440940000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1CUSTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 401.968770000000000000
          Top = 12.338590000000000000
          Width = 124.724490000000000000
          Height = 26.456710000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CUSTO"]')
          ParentFont = False
        end
        object frxDBDataset1VALVEN: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 534.472790000000000000
          Top = 13.118120000000000000
          Width = 139.842610000000000000
          Height = 26.456710000000000000
          DataSet = DtsCadart
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."VALVEN"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 41.574830000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = -0.220470000000000000
          Top = 3.779530000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 149.019985260000000000
          Top = 9.881489470000000000
          Width = 66.440158950000000000
          Height = 26.854555260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Artigos-->')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 265.384337890000000000
          Top = 10.881489470000000000
          Width = 79.767975260000000000
          Height = 27.053477890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
end
